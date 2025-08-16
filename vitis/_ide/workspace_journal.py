# 2025-08-15T23:15:50.873852100
import vitis

client = vitis.create_client()
client.set_workspace(path="vitis")

platform = client.create_platform_component(name = "Secure_Platform",hw_design = "$COMPONENT_LOCATION/../../topSECURITY.xsa",os = "standalone",cpu = "microblaze_0",domain_name = "standalone_microblaze_0")

comp = client.create_app_component(name="Secure_App",platform = "$COMPONENT_LOCATION/../Secure_Platform/export/Secure_Platform/Secure_Platform.xpfm",domain = "standalone_microblaze_0",template = "hello_world")

platform = client.get_component(name="Secure_Platform")
status = platform.build()

comp = client.get_component(name="Secure_App")
comp.build()

status = platform.build()

comp.build()

