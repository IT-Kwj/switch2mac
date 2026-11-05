#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c3 [[id(0)]];
};

struct main0_out
{
    float4 m_29 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_26 [[attribute(0)]];
    uint4 m_23 [[attribute(2)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _43 = as_type<float>(in.m_23.x);
    int _46 = as_type<int>(_43) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    int _48 = _46 << 4;
    int _50 = _48 + 144;
    float _52 = in.m_26.x;
    float _54 = in.m_26.y;
    float _56 = in.m_26.z;
    uint _59 = uint(int(uint(_50) >> uint(2)));
    uint _61 = uint(int(uint(int(_59)) >> uint(2)));
    int _63 = int(_59) & 3;
    float _65 = (*spvDescriptorSet0.vp_c3)._m0[int(_61)][_63];
    uint _67 = uint(int(uint(_50) >> uint(2)));
    uint _69 = uint(int(uint(int(_67)) >> uint(2)));
    int _71 = int(_67) & 3;
    float _73 = (*spvDescriptorSet0.vp_c3)._m0[int(_69)][_71];
    int _75 = _50 & 3;
    int _77 = _75 << 3;
    uint _79 = uint(int(uint(as_type<int>(_73)) >> uint(_77)));
    int _81 = int(_79) & 255;
    float _83 = _54 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _85 = _54 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _87 = _54 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _89 = _54 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _91 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[1].x, _83);
    float _93 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[2].x, _85);
    float _95 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[3].x, _87);
    float _97 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[4].x, _89);
    float _99 = fma(_56, (*spvDescriptorSet0.vp_c3)._m0[1].z, _91);
    float _101 = fma(_56, (*spvDescriptorSet0.vp_c3)._m0[2].z, _93);
    float _103 = fma(_56, (*spvDescriptorSet0.vp_c3)._m0[3].z, _95);
    float _105 = fma(_56, (*spvDescriptorSet0.vp_c3)._m0[4].z, _97);
    float _107 = _99 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _109 = _101 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _111 = _103 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _113 = _105 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    out.gl_Position.x = _107;
    out.gl_Position.y = _109;
    out.gl_Position.z = _111;
    out.gl_Position.w = _113;
    uint _115 = extract_bits(as_type<uint>(_65), 24u, 8u);
    float _117 = float(_115);
    uint _119 = extract_bits(uint(_81), 0u, 8u);
    float _121 = float(_119);
    uint _123 = extract_bits(as_type<uint>(_65), 16u, 8u);
    float _125 = float(_123);
    float _127 = _117 * 0.0039215688593685626983642578125;
    uint _129 = extract_bits(as_type<uint>(_65), 8u, 8u);
    float _131 = float(_129);
    float _133 = _121 * 0.0039215688593685626983642578125;
    float _135 = _125 * 0.0039215688593685626983642578125;
    float _137 = _131 * 0.0039215688593685626983642578125;
    out.m_29.x = _127;
    out.m_29.y = _135;
    out.m_29.z = _137;
    out.m_29.w = _133;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _43 = as_type<float>(in.m_23.x);
    int _46 = as_type<int>(_43) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    int _48 = _46 << 4;
    int _50 = _48 + 144;
    float _52 = in.m_26.x;
    float _54 = in.m_26.y;
    float _56 = in.m_26.z;
    uint _59 = uint(int(uint(_50) >> uint(2)));
    uint _61 = uint(int(uint(int(_59)) >> uint(2)));
    int _63 = int(_59) & 3;
    float _65 = (*spvDescriptorSet0.vp_c3)._m0[int(_61)][_63];
    uint _67 = uint(int(uint(_50) >> uint(2)));
    uint _69 = uint(int(uint(int(_67)) >> uint(2)));
    int _71 = int(_67) & 3;
    float _73 = (*spvDescriptorSet0.vp_c3)._m0[int(_69)][_71];
    int _75 = _50 & 3;
    int _77 = _75 << 3;
    uint _79 = uint(int(uint(as_type<int>(_73)) >> uint(_77)));
    int _81 = int(_79) & 255;
    float _83 = _54 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _85 = _54 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _87 = _54 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _89 = _54 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _91 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[1].x, _83);
    float _93 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[2].x, _85);
    float _95 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[3].x, _87);
    float _97 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[4].x, _89);
    float _99 = fma(_56, (*spvDescriptorSet0.vp_c3)._m0[1].z, _91);
    float _101 = fma(_56, (*spvDescriptorSet0.vp_c3)._m0[2].z, _93);
    float _103 = fma(_56, (*spvDescriptorSet0.vp_c3)._m0[3].z, _95);
    float _105 = fma(_56, (*spvDescriptorSet0.vp_c3)._m0[4].z, _97);
    float _107 = _99 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _109 = _101 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _111 = _103 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _113 = _105 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    out.gl_Position.x = _107;
    out.gl_Position.y = _109;
    out.gl_Position.z = _111;
    out.gl_Position.w = _113;
    uint _115 = extract_bits(as_type<uint>(_65), 24u, 8u);
    float _117 = float(_115);
    uint _119 = extract_bits(uint(_81), 0u, 8u);
    float _121 = float(_119);
    uint _123 = extract_bits(as_type<uint>(_65), 16u, 8u);
    float _125 = float(_123);
    float _127 = _117 * 0.0039215688593685626983642578125;
    uint _129 = extract_bits(as_type<uint>(_65), 8u, 8u);
    float _131 = float(_129);
    float _133 = _121 * 0.0039215688593685626983642578125;
    float _135 = _125 * 0.0039215688593685626983642578125;
    float _137 = _131 * 0.0039215688593685626983642578125;
    out.m_29.x = _127;
    out.m_29.y = _135;
    out.m_29.z = _137;
    out.m_29.w = _133;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _43 = as_type<float>(in.m_23.x);
    int _46 = as_type<int>(_43) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    int _48 = _46 << 4;
    int _50 = _48 + 144;
    float _52 = in.m_26.x;
    float _54 = in.m_26.y;
    float _56 = in.m_26.z;
    uint _59 = uint(int(uint(_50) >> uint(2)));
    uint _61 = uint(int(uint(int(_59)) >> uint(2)));
    int _63 = int(_59) & 3;
    float _65 = (*spvDescriptorSet0.vp_c3)._m0[int(_61)][_63];
    uint _67 = uint(int(uint(_50) >> uint(2)));
    uint _69 = uint(int(uint(int(_67)) >> uint(2)));
    int _71 = int(_67) & 3;
    float _73 = (*spvDescriptorSet0.vp_c3)._m0[int(_69)][_71];
    int _75 = _50 & 3;
    int _77 = _75 << 3;
    uint _79 = uint(int(uint(as_type<int>(_73)) >> uint(_77)));
    int _81 = int(_79) & 255;
    float _83 = _54 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _85 = _54 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _87 = _54 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _89 = _54 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _91 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[1].x, _83);
    float _93 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[2].x, _85);
    float _95 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[3].x, _87);
    float _97 = fma(_52, (*spvDescriptorSet0.vp_c3)._m0[4].x, _89);
    float _99 = fma(_56, (*spvDescriptorSet0.vp_c3)._m0[1].z, _91);
    float _101 = fma(_56, (*spvDescriptorSet0.vp_c3)._m0[2].z, _93);
    float _103 = fma(_56, (*spvDescriptorSet0.vp_c3)._m0[3].z, _95);
    float _105 = fma(_56, (*spvDescriptorSet0.vp_c3)._m0[4].z, _97);
    float _107 = _99 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _109 = _101 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _111 = _103 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _113 = _105 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    out.gl_Position.x = _107;
    out.gl_Position.y = _109;
    out.gl_Position.z = _111;
    out.gl_Position.w = _113;
    uint _115 = extract_bits(as_type<uint>(_65), 24u, 8u);
    float _117 = float(_115);
    uint _119 = extract_bits(uint(_81), 0u, 8u);
    float _121 = float(_119);
    uint _123 = extract_bits(as_type<uint>(_65), 16u, 8u);
    float _125 = float(_123);
    float _127 = _117 * 0.0039215688593685626983642578125;
    uint _129 = extract_bits(as_type<uint>(_65), 8u, 8u);
    float _131 = float(_129);
    float _133 = _121 * 0.0039215688593685626983642578125;
    float _135 = _125 * 0.0039215688593685626983642578125;
    float _137 = _131 * 0.0039215688593685626983642578125;
    out.m_29.x = _127;
    out.m_29.y = _135;
    out.m_29.z = _137;
    out.m_29.w = _133;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

