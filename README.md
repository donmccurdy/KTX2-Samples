# KTX2 Samples

Collection of KTX2 sample textures, for testing and debugging.

## Preview

### 2D

**Uncompressed**

| img | vkFormat | colorspaces |
|-----|----------|------------|
| ![rgb8](source/rgb8.png) | `R8G8B8_SRGB` | `"srgb", "display-p3"`  |
| ![rgb8](source/rgb8.png) | `R8G8B8_UNORM` | `"srgb-linear"` |
| ![rgba8](source/rgba8.png) | `R8G8B8A8_SRGB` | `"srgb", "display-p3"`  |
| ![rgba8](source/rgba8.png) | `R8G8B8A8_UNORM` | `"srgb-linear"` |
| ![rgba16](source/rgba16.png) | `R16G16B16A16_SFLOAT` | `"srgb-linear"` |
| ![rgba32](source/rgba32.png) | `R32G32B32A32_SFLOAT` | `"srgb-linear"` |
| ![rgb9e5](source/rgb9e5.png) | `E5B9G9R9_UFLOAT_PACK32` | `"srgb-linear"` |
| ![r11g11b10](source/r11g11b10.png) | `B10G11R11_UFLOAT_PACK32` | `"srgb-linear"` |

**Compressed**

| img | vkFormat | colorspaces |
|-----|----------|------------|
| ![astc4x4](source/astc4x4.png) | `ASTC_4x4_SRGB_BLOCK` | `"srgb"`  |
| ![etc1](source/etc1.png) | `ETC2_R8G8B8_SRGB_BLOCK` | `"srgb"`  |
| ![etc2](source/etc2.png) | `ETC2_R8G8B8A8_SRGB_BLOCK` | `"srgb"`  |
| ![bc1](source/bc1.png) | `BC1_RGB_SRGB_BLOCK` | `"srgb"`  |
| ![bc3](source/bc3.png) | `BC3_SRGB_BLOCK` | `"srgb"`  |
| ![bc5](source/bc5.png) | `BC5_UNORM_BLOCK` | `"srgb"`  |
| ![bc7](source/bc7.png) | `BC7_SRGB_BLOCK` | `"srgb"`  |

**Universal**

| img | vkFormat | model | supercompression | colorspaces |
|-----|----------|-------|------------------|-------------|
| ![basis_etc1s](source/basis_etc1s.png) | – | `KHR_DF_MODEL_ETC1S` | `KTX_SS_BASIS_LZ` | `"srgb"`  |
| ![basis_uastc](source/basis_uastc.png) | – | `KHR_DF_MODEL_UASTC` | – | `"srgb"` |

### 3D

![slice01](source/slice01.png) ![slice02](source/slice02.png) ![slice03](source/slice03.png) ![slice04](source/slice04.png) ![slice05](source/slice05.png) ![slice06](source/slice06.png) ![slice07](source/slice07.png) ![slice08](source/slice08.png)

Formats:

- `R8G8B8A8_SRGB`
- `R8G8B8A8_UNORM`
- `R16G16B16A16_SFLOAT`
- `R32G32B32A32_SFLOAT`
- BasisLZ / ETC1S
- Basis UASTC

### Array

![slice01](source/slice01.png) ![slice02](source/slice02.png) ![slice03](source/slice03.png) ![slice04](source/slice04.png) ![slice05](source/slice05.png) ![slice06](source/slice06.png) ![slice07](source/slice07.png) ![slice08](source/slice08.png)

Formats:

- `R8G8B8A8_SRGB`
- `R8G8B8A8_UNORM`
- `R16G16B16A16_SFLOAT`
- `R32G32B32A32_SFLOAT`
- BasisLZ / ETC1S
- Basis UASTC

### Cubemap

![slice01](source/slice01.png) ![slice02](source/slice02.png) ![slice03](source/slice03.png) ![slice04](source/slice04.png) ![slice05](source/slice05.png) ![slice06](source/slice06.png)

Formats:

- `R8G8B8A8_SRGB`
- `R8G8B8A8_UNORM`
- `R16G16B16A16_SFLOAT`
- `R32G32B32A32_SFLOAT`
- BasisLZ / ETC1S
- Basis UASTC

## License

Published under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/) license.
