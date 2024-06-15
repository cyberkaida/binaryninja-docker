# 🥷🐋 BinaryNinja Docker

This is a docker file for running BinaryNinja. To run a headless BinaryNinja you will need
at least the commercial version.

# Building

> *NOTE*: This will include your license file in the container! If you are deploying to Kubernetes, please use a secret instead!
> Also, do NOT publish this container to a public place, this will violate your license.

```
cp ~/Downloads/binaryninja_commercial_linux.zip .
docker build -t binaryninja --build-arg BINJA_ZIP_NAME=binaryninja_commercial_linux.zip --build-arg BN_LICENSE=$(cat ~/.binaryninja/license.dat) .
```

# Usage

The container will drop into a python shell, the BinaryNinja API will be available.
If you have a commercial license, with the license file installed you can run headless.

If you don't have a license, only basic functions will work.

```sh
~ % docker run --rm -t -i binaryninja
Python 3.12.4 (main, Jun 13 2024, 05:25:54) [GCC 12.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import binaryninja
>>> binaryninja.core_version_info()
CoreVersionInfo(major=4, minor=0, build=5336, channel='Stable')
>>>
```
