rm -rf .repo/local_manifests/
rm -rf device/xiaomi vendor/xiaomi kernel/xiaomi hardware/xiaomi packages/resources/devicesettings


# Blaze repo
repo init --depth=1 -u https://github.com/ProjectBlaze/manifest -b 14-QPR2

# repo sync
/opt/crave/resync.sh

#clone trees
git clone https://github.com/Sanjivns/device_xiaomi_alioth.git device/xiaomi/alioth ;
git clone https://github.com/Sanjivns/device_xiaomi_sm8250-common.git device/xiaomi/sm8250-common ;
git clone https://github.com/PocoF3Releases/vendor_xiaomi_alioth.git vendor/xiaomi/alioth ;
git clone https://github.com/PocoF3Releases/vendor_xiaomi_sm8250-common.git vendor/xiaomi/sm8250-common ;
git clone https://github.com/PocoF3Releases/kernel_xiaomi_sm8250.git kernel/xiaomi/sm8250 ;
git clone https://github.com/Evolution-X/hardware_xiaomi.git hardware/xiaomi ;
git clone https://github.com/Sanjivns/packages_resources_devicesettings.git packages/resources/devicesettings

# Set up build environment
export BUILD_USERNAME=Sanji
export BUILD_HOSTNAME=crave

. b*/e*
# Build the ROM
lunch blaze_alioth-eng && make installclean && mka bacon
