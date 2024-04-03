# Baseten gpu-operator fork
This fork is for a temporary workaround of a race-condition that is causing crashes (fatal error: concurrent map read and map write).

## Custom build image
Use the Dockerfile in the root directory. We used the official compatible version base image (e.g. nvcr.io/nvidia/gpu-operator:v23.9.1) and then override the gpu-operator binary. By doing this we remove the need to do all the dependency packaging that is requried to build a working image (see /docker folder for their docker file).

Modify the Dockerfile with the make target depending on whether you want the normal binary or the binary with race detector.


## Compile binary with golang race detector
Use the `gpu-operator-race` target.

Race detector requires CGO. To get around the glibc dynamic linking issues (image needs compatiable lib installed) we use static linking which forces the binary to include the dependencies.
