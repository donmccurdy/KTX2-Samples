#!/bin/bash

RESET='\033[0m'
GREEN='\033[0;32m'

# 2D
echo -e "${GREEN}Creating 2D textures…${RESET}"
ktx create --encode uastc --zstd 18 --format R8G8B8_SRGB --assign-oetf srgb --assign-primaries bt709 --generate-mipmap source/png/2d_uastc.png ktx2/2d_uastc.ktx2
ktx create --encode basis-lz --format R8G8B8_SRGB --assign-oetf srgb --assign-primaries bt709 --generate-mipmap source/png/2d_etc1s.png ktx2/2d_etc1s.ktx2
ktx create --format R8G8B8_SRGB --zstd 18 --assign-oetf srgb --assign-primaries bt709 --generate-mipmap source/png/2d_rgb8.png ktx2/2d_rgb8.ktx2
ktx create --format R8G8B8_UNORM --zstd 18 --assign-oetf srgb --assign-primaries bt709 --convert-oetf linear --generate-mipmap source/png/2d_rgb8.png ktx2/2d_rgb8_linear.ktx2
ktx create --format R16G16B16_SFLOAT --zstd 18 --assign-oetf linear --generate-mipmap source/exr/2d_f16.exr ktx2/2d_rgb16_linear.ktx2
ktx create --format R32G32B32_SFLOAT --zstd 18 --assign-oetf linear --generate-mipmap source/exr/2d_f32.exr ktx2/2d_rgb32_linear.ktx2
toktx --encode astc --zcmp 18 --assign_oetf srgb --genmipmap ktx2/2d_astc_6x6.ktx2 source/png/2d_astc_6x6.png

# 3D
echo -e "${GREEN}Creating 3D textures…${RESET}"
ktx create --layers 8 --encode uastc --zstd 18 --format R8G8B8_SRGB --assign-oetf srgb --assign-primaries bt709 --generate-mipmap source/png/slice_*.png ktx2/3d_uastc.ktx2
ktx create --layers 8 --encode basis-lz --format R8G8B8_SRGB --assign-oetf srgb --assign-primaries bt709 --generate-mipmap source/png/slice_*.png ktx2/3d_etc1s.ktx2
ktx create --layers 8 --format R8G8B8_SRGB --zstd 18 --assign-oetf srgb --assign-primaries bt709 --generate-mipmap source/png/slice_*.png ktx2/3d_rgb8.ktx2
ktx create --layers 8 --format R8G8B8_UNORM --zstd 18 --assign-oetf srgb --assign-primaries bt709 --convert-oetf linear --generate-mipmap source/png/slice_*.png ktx2/3d_rgb8_linear.ktx2
ktx create --layers 8 --format R16G16B16_SFLOAT --zstd 18 --assign-oetf srgb --assign-primaries bt709 --convert-oetf linear --generate-mipmap source/exr/slice_*_f16.exr ktx2/3d_rgb16_linear.ktx2
ktx create --layers 8 --format R32G32B32_SFLOAT --zstd 18 --assign-oetf srgb --assign-primaries bt709 --convert-oetf linear --generate-mipmap source/exr/slice_*_f32.exr ktx2/3d_rgb32_linear.ktx2

# Cubemap
echo -e "${GREEN}Creating cubemaps…${RESET}"
ktx create --cubemap --encode uastc --zstd 18 --format R8G8B8_SRGB --assign-oetf srgb --assign-primaries bt709 --generate-mipmap source/png/slice_0{1,2,3,4,5,6}.png ktx2/cubemap_uastc.ktx2
ktx create --cubemap --encode basis-lz --cubemap --format R8G8B8_SRGB --assign-oetf srgb --assign-primaries bt709 --generate-mipmap source/png/slice_0{1,2,3,4,5,6}.png ktx2/cubemap_etc1s.ktx2
ktx create --cubemap --format R8G8B8_SRGB --zstd 18 --assign-oetf srgb --assign-primaries bt709 --generate-mipmap source/png/slice_0{1,2,3,4,5,6}.png ktx2/cubemap_rgb8.ktx2
ktx create --cubemap --format R8G8B8_UNORM --zstd 18 --assign-oetf srgb --assign-primaries bt709 --convert-oetf linear --generate-mipmap source/png/slice_0{1,2,3,4,5,6}.png ktx2/cubemap_rgb8_linear.ktx2
ktx create --cubemap --format R16G16B16_SFLOAT --zstd 18 --assign-oetf srgb --assign-primaries bt709 --convert-oetf linear --generate-mipmap source/exr/slice_0{1,2,3,4,5,6}_f16.exr ktx2/cubemap_rgb16_linear.ktx2
ktx create --cubemap --format R32G32B32_SFLOAT --zstd 18 --assign-oetf srgb --assign-primaries bt709 --convert-oetf linear --generate-mipmap source/exr/slice_0{1,2,3,4,5,6}_f32.exr ktx2/cubemap_rgb32_linear.ktx2

# Array
echo -e "${GREEN}Creating array textures…${RESET}"
ktx create --layers 8 --encode uastc --zstd 18 --format R8G8B8_SRGB --assign-oetf srgb --assign-primaries bt709 --generate-mipmap source/png/slice_*.png ktx2/array_uastc.ktx2
ktx create --layers 8 --encode basis-lz --format R8G8B8_SRGB --assign-oetf srgb --assign-primaries bt709 --generate-mipmap source/png/slice_*.png ktx2/array_etc1s.ktx2
ktx create --layers 8 --format R8G8B8_SRGB --zstd 18 --assign-oetf srgb --assign-primaries bt709 --generate-mipmap source/png/slice_*.png ktx2/array_rgb8.ktx2
ktx create --layers 8 --format R8G8B8_UNORM --zstd 18 --assign-oetf srgb --assign-primaries bt709 --convert-oetf linear --generate-mipmap source/png/slice_*.png ktx2/array_rgb8_linear.ktx2
ktx create --layers 8 --format R16G16B16_SFLOAT --zstd 18 --convert-oetf linear --generate-mipmap source/exr/slice_*_f16.exr ktx2/array_rgb16.ktx2
ktx create --layers 8 --format R32G32B32_SFLOAT --zstd 18 --convert-oetf linear --generate-mipmap source/exr/slice_*_f32.exr ktx2/array_rgb32.ktx2

echo -e "${GREEN}… done! 🍻${RESET}"
