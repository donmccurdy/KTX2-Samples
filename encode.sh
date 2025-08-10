#!/bin/bash

RESET='\033[0m'
GREEN='\033[0;32m'

rm ktx2/*.ktx2

# EXR sources
echo -e "${GREEN}Creating EXR sources…${RESET}"
oiiotool source/rgba16.png --iscolorspace srgb --tocolorspace lin_rec709_srgb -d half -o source/rgba16.exr
oiiotool source/rgba32.png --iscolorspace srgb --tocolorspace lin_rec709_srgb -d float -o source/rgba32.exr
oiiotool source/r11g11b10.png --iscolorspace srgb --tocolorspace lin_rec709_srgb -d half -o source/r11g11b10.exr
oiiotool source/rgb9e5.png --iscolorspace srgb --tocolorspace lin_rec709_srgb -d half -o source/rgb9e5.exr
oiiotool source/slice@@.png --iscolorspace srgb --tocolorspace lin_rec709_srgb -d half -o source/slice@@_f16.exr
oiiotool source/slice@@.png --iscolorspace srgb --tocolorspace lin_rec709_srgb -d float -o source/slice@@_f32.exr

# Utilities
echo -e "${GREEN}Creating utility textures…${RESET}"
ktx create --format R8G8B8A8_SRGB --assign-oetf srgb --assign-primaries bt709 --generate-mipmap source/fail_load.png ktx2/fail_load.ktx2
ktx create --format R8G8B8A8_SRGB --assign-oetf srgb --assign-primaries bt709 --generate-mipmap source/fail_gpu.png ktx2/fail_gpu.ktx2

# GPU formats
echo -e "${GREEN}Creating GPU format textures…${RESET}"
ktx create --encode uastc --format R8G8B8A8_SRGB --assign-oetf srgb --assign-primaries bt709 --generate-mipmap source/astc4x4.png - | ktx transcode --target astc - ./ktx2/2d_astc4x4.ktx2
ktx create --encode uastc --format R8G8B8_SRGB --assign-oetf srgb --assign-primaries bt709 --generate-mipmap source/etc1.png - | ktx transcode --target etc-rgb - ./ktx2/2d_etc1.ktx2
ktx create --encode uastc --format R8G8B8A8_SRGB --assign-oetf srgb --assign-primaries bt709 --generate-mipmap source/etc2.png - | ktx transcode --target etc-rgba - ./ktx2/2d_etc2.ktx2
ktx create --encode uastc --format R8G8B8_SRGB --assign-oetf srgb --assign-primaries bt709 --generate-mipmap source/bc1.png - | ktx transcode --target bc1 - ./ktx2/2d_bc1.ktx2
ktx create --encode uastc --format R8G8B8A8_SRGB --assign-oetf srgb --assign-primaries bt709 --generate-mipmap source/bc3.png - | ktx transcode --target bc3 - ./ktx2/2d_bc3.ktx2
ktx create --encode uastc --format R8G8B8_SRGB --assign-oetf srgb --assign-primaries bt709 --generate-mipmap source/bc5.png - | ktx transcode --target bc5 - ./ktx2/2d_bc5.ktx2
ktx create --encode uastc --format R8G8B8_SRGB --assign-oetf srgb --assign-primaries bt709 --generate-mipmap source/bc7.png - | ktx transcode --target bc7 - ./ktx2/2d_bc7.ktx2

# 2D
echo -e "${GREEN}Creating 2D textures…${RESET}"
ktx create --encode uastc --format R8G8B8_SRGB --assign-oetf srgb --assign-primaries bt709 --generate-mipmap source/basis_uastc.png ktx2/2d_uastc.ktx2
ktx create --encode basis-lz --format R8G8B8_SRGB --assign-oetf srgb --assign-primaries bt709 --generate-mipmap source/basis_etc1s.png ktx2/2d_etc1s.ktx2
ktx create --format R8G8B8_SRGB --assign-oetf srgb --assign-primaries bt709 --generate-mipmap source/rgb8.png ktx2/2d_rgb8.ktx2
ktx create --format R8G8B8_UNORM --assign-oetf srgb --assign-primaries bt709 --convert-oetf linear --generate-mipmap source/rgb8.png ktx2/2d_rgb8_linear.ktx2
ktx create --format R8G8B8_SRGB --assign-oetf srgb --assign-primaries bt709 --convert-primaries displayp3 --generate-mipmap source/rgb8.png ktx2/2d_rgb8_displayp3.ktx2
ktx create --format R8G8B8A8_SRGB --assign-oetf srgb --assign-primaries bt709 --generate-mipmap source/rgba8.png ktx2/2d_rgba8.ktx2
ktx create --format R8G8B8A8_UNORM --assign-oetf srgb --assign-primaries bt709 --convert-oetf linear --generate-mipmap source/rgba8.png ktx2/2d_rgba8_linear.ktx2
ktx create --format R8G8B8A8_SRGB --assign-oetf srgb --assign-primaries bt709 --convert-primaries displayp3 --generate-mipmap source/rgba8.png ktx2/2d_rgba8_displayp3.ktx2
ktx create --format R16G16B16A16_SFLOAT --assign-oetf linear --assign-primaries bt709 --generate-mipmap source/rgba16.exr ktx2/2d_rgba16_linear.ktx2
ktx create --format R32G32B32A32_SFLOAT --assign-oetf linear --assign-primaries bt709 --generate-mipmap source/rgba32.exr ktx2/2d_rgba32_linear.ktx2
ktx create --format B10G11R11_UFLOAT_PACK32 --assign-oetf linear --assign-primaries bt709 --generate-mipmap source/r11g11b10.exr ktx2/2d_r11g11b10_linear.ktx2
ktx create --format E5B9G9R9_UFLOAT_PACK32 --assign-oetf linear --assign-primaries bt709 --generate-mipmap source/rgb9e5.exr ktx2/2d_rgb9e5_linear.ktx2

# 3D
echo -e "${GREEN}Creating 3D textures…${RESET}"
ktx create --depth 8 --encode uastc --format R8G8B8_SRGB --assign-oetf srgb --assign-primaries bt709 source/slice*.png ktx2/3d_uastc.ktx2
ktx create --depth 8 --encode basis-lz --format R8G8B8_SRGB --assign-oetf srgb --assign-primaries bt709 source/slice*.png ktx2/3d_etc1s.ktx2
ktx create --depth 8 --format R8G8B8A8_SRGB --assign-oetf srgb --assign-primaries bt709 source/slice*.png ktx2/3d_rgba8.ktx2
ktx create --depth 8 --format R8G8B8A8_UNORM --assign-oetf srgb --assign-primaries bt709 --convert-oetf linear source/slice*.png ktx2/3d_rgba8_linear.ktx2
ktx create --depth 8 --format R16G16B16A16_SFLOAT --assign-primaries bt709 --convert-oetf linear source/slice*_f16.exr ktx2/3d_rgba16_linear.ktx2
ktx create --depth 8 --format R32G32B32A32_SFLOAT --assign-primaries bt709 --convert-oetf linear source/slice*_f32.exr ktx2/3d_rgba32_linear.ktx2

# # Cubemap
echo -e "${GREEN}Creating cubemaps…${RESET}"
ktx create --cubemap --encode uastc --format R8G8B8_SRGB --assign-oetf srgb --assign-primaries bt709 --generate-mipmap source/slice0{1,2,3,4,5,6}.png ktx2/cubemap_uastc.ktx2
ktx create --cubemap --encode basis-lz --cubemap --format R8G8B8_SRGB --assign-oetf srgb --assign-primaries bt709 --generate-mipmap source/slice0{1,2,3,4,5,6}.png ktx2/cubemap_etc1s.ktx2
ktx create --cubemap --format R8G8B8A8_SRGB --assign-oetf srgb --assign-primaries bt709 --generate-mipmap source/slice0{1,2,3,4,5,6}.png ktx2/cubemap_rgba8.ktx2
ktx create --cubemap --format R8G8B8A8_UNORM --assign-oetf srgb --assign-primaries bt709 --convert-oetf linear --generate-mipmap source/slice0{1,2,3,4,5,6}.png ktx2/cubemap_rgba8_linear.ktx2
ktx create --cubemap --format R16G16B16A16_SFLOAT --assign-oetf srgb --assign-primaries bt709 --convert-oetf linear --generate-mipmap source/slice0{1,2,3,4,5,6}_f16.exr ktx2/cubemap_rgba16_linear.ktx2
ktx create --cubemap --format R32G32B32A32_SFLOAT --assign-oetf srgb --assign-primaries bt709 --convert-oetf linear --generate-mipmap source/slice0{1,2,3,4,5,6}_f32.exr ktx2/cubemap_rgba32_linear.ktx2

# # Array
echo -e "${GREEN}Creating array textures…${RESET}"
ktx create --layers 8 --encode uastc --format R8G8B8_SRGB --assign-oetf srgb --assign-primaries bt709 --generate-mipmap source/slice*.png ktx2/array_uastc.ktx2
ktx create --layers 8 --encode basis-lz --format R8G8B8_SRGB --assign-oetf srgb --assign-primaries bt709 --generate-mipmap source/slice*.png ktx2/array_etc1s.ktx2
ktx create --layers 8 --format R8G8B8A8_SRGB --assign-oetf srgb --assign-primaries bt709 --generate-mipmap source/slice*.png ktx2/array_rgba8.ktx2
ktx create --layers 8 --format R8G8B8A8_UNORM --assign-oetf srgb --assign-primaries bt709 --convert-oetf linear --generate-mipmap source/slice*.png ktx2/array_rgba8_linear.ktx2
ktx create --layers 8 --format R16G16B16A16_SFLOAT --assign-primaries bt709 --convert-oetf linear --generate-mipmap source/slice*_f16.exr ktx2/array_rgba16_linear.ktx2
ktx create --layers 8 --format R32G32B32A32_SFLOAT --assign-primaries bt709 --convert-oetf linear --generate-mipmap source/slice*_f32.exr ktx2/array_rgba32_linear.ktx2

echo -e "${GREEN}… done! 🍻${RESET}"
