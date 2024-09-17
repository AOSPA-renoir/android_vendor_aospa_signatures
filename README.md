# vendor_aospa_signatures

```bash
cd build/soong
git fetch https://gerrit.aospa.co/AOSPA/android_build_soong refs/changes/57/40257/1 && git cherry-pick FETCH_HEAD
```

```bash
croot && git clone https://github.com/AOSPA-renoir/android_vendor_aospa_signatures.git vendor/aospa/signatures
```

```bash
cd vendor/aospa/signatures
```

```bash
./generate.sh
```

* Keys will be generated under `../../private-signatures`
* To signing builds, in your device tree's `device.mk`

```makefile
TARGET_BUILD_FULLY_SIGN := true
```

* To signing avb, in your device tree's `BoardConfig.mk`

```makefile
TARGET_BUILD_FULLY_SIGN := true
include vendor/aospa/signatures/BoardConfigSign.mk

TARGET_AVB_KEY_PATH := $(AOSPA_AVB_KEY_PATH)
# Differs what bit (e.g. 2048) you selected for key generation
TARGET_AVB_ALGORITHM := SHA256_RSA2048

BOARD_AVB_KEY_PATH := $(TARGET_AVB_KEY_PATH)
BOARD_AVB_ALGORITHM :=  $(TARGET_AVB_ALGORITHM)

(...)

BOARD_AVB_VENDOR_BOOT_KEY_PATH := $(TARGET_AVB_KEY_PATH)
BOARD_AVB_VENDOR_BOOT_ALGORITHM := $(TARGET_AVB_ALGORITHM)
```

## References

* [Sign builds for release](https://source.android.com/docs/core/ota/sign_builds) - from source.android.com
* [Generating Keys](https://github.com/chenxiaolong/avbroot?tab=readme-ov-file#generating-keys) - from avbroot readme
* make_key script is taken from development/tools/make_key and modified

## Credits

* [android_vendor_lineage-priv_keys](https://github.com/ItsVixano/android_vendor_lineage-priv_keys) - by [ItsVixano](https://github.com/ItsVixano)
* [vendor_evolution-priv_keys-template](https://github.com/Evolution-XYZ/vendor_evolution-priv_keys-template) - by [Evolution-XYZ](https://github.com/Evolution-XYZ)
