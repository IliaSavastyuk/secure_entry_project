#define __MICROBLAZE__
#include "xgpio.h"
#include "xparameters.h"
#include "xil_printf.h"
#include "sleep.h"

// We have only one GPIO instance. We'll init via LookupConfig + CfgInitialize.
// (No need for XPAR_*_DEVICE_ID macros.)

int main() {
    XGpio gpio;
    XGpio_Config *cfg;
    u32 prev = 0, cur;
    int last_secs = -1;

    // Lookup the first (and only) GPIO config; index 0 is fine with one instance
    cfg = XGpio_LookupConfig(0);
    if (cfg == NULL) {
        xil_printf("GPIO LookupConfig failed\r\n");
        return XST_FAILURE;
    }
    if (XGpio_CfgInitialize(&gpio, cfg, cfg->BaseAddress) != XST_SUCCESS) {
        xil_printf("GPIO CfgInitialize failed\r\n");
        return XST_FAILURE;
    }

    // Channel 1 = inputs (our 12-bit status bus)
    XGpio_SetDataDirection(&gpio, 1, 0xFFFFFFFF);

    xil_printf("BOOT\r\n");

    while (1) {
        cur = XGpio_DiscreteRead(&gpio, 1);

        int ready  = (cur >> 0) & 1;
        int grant  = (cur >> 1) & 1;
        int fail   = (cur >> 2) & 1;
        int locked = (cur >> 3) & 1;
        int secs   = (cur >> 4) & 0xFF;

        if ( ready && !(prev & (1<<0)) ) xil_printf("R");
        if ( grant && !(prev & (1<<1)) ) xil_printf("G");
        if (  fail && !(prev & (1<<2)) ) xil_printf("F");
        if ( locked && !(prev & (1<<3)) ) xil_printf("L");

        if (locked && secs != last_secs) { xil_printf("T%c", (char)secs); last_secs = secs; }
        if (!locked) last_secs = -1;

        prev = cur;
        usleep(50 * 1000);
    }
}
