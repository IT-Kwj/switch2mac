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
    constant _16* vp_c7 [[id(0)]];
    constant _16* vp_c4 [[id(1)]];
};

struct main0_out
{
    float4 m_27 [[user(locn6)]];
    float4 m_29 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_24 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _43 = in.m_24.x;
    float _45 = in.m_24.y;
    float _47 = in.m_24.z;
    float _49 = _45 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _51 = _45 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _53 = _45 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _55 = fma(_43, (*spvDescriptorSet0.vp_c7)._m0[1].x, _49);
    float _57 = fma(_43, (*spvDescriptorSet0.vp_c7)._m0[0].x, _51);
    float _59 = fma(_43, (*spvDescriptorSet0.vp_c7)._m0[2].x, _53);
    float _61 = fma(_47, (*spvDescriptorSet0.vp_c7)._m0[1].z, _55);
    float _63 = fma(_47, (*spvDescriptorSet0.vp_c7)._m0[0].z, _57);
    float _65 = fma(_47, (*spvDescriptorSet0.vp_c7)._m0[2].z, _59);
    float _67 = _61 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _69 = _63 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _71 = _65 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _73 = _67 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _75 = _67 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _77 = _67 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    out.m_27.x = _69;
    out.m_27.y = _67;
    out.m_27.z = _71;
    float _79 = fma(_69, (*spvDescriptorSet0.vp_c4)._m0[1].x, _73);
    float _81 = fma(_69, (*spvDescriptorSet0.vp_c4)._m0[0].x, _75);
    float _83 = fma(_69, (*spvDescriptorSet0.vp_c4)._m0[2].x, _77);
    float _85 = fma(_71, (*spvDescriptorSet0.vp_c4)._m0[1].z, _79);
    float _87 = fma(_71, (*spvDescriptorSet0.vp_c4)._m0[0].z, _81);
    float _89 = fma(_71, (*spvDescriptorSet0.vp_c4)._m0[2].z, _83);
    float _91 = _85 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _93 = _87 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _95 = _89 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _97 = _91 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _99 = _91 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _101 = _91 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _103 = _91 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _105 = fma(_93, (*spvDescriptorSet0.vp_c4)._m0[7].x, _97);
    float _107 = fma(_93, (*spvDescriptorSet0.vp_c4)._m0[8].x, _99);
    float _109 = fma(_93, (*spvDescriptorSet0.vp_c4)._m0[9].x, _101);
    float _111 = fma(_93, (*spvDescriptorSet0.vp_c4)._m0[10].x, _103);
    float _113 = fma(_95, (*spvDescriptorSet0.vp_c4)._m0[7].z, _105);
    float _115 = fma(_95, (*spvDescriptorSet0.vp_c4)._m0[8].z, _107);
    float _117 = fma(_95, (*spvDescriptorSet0.vp_c4)._m0[9].z, _109);
    float _119 = fma(_95, (*spvDescriptorSet0.vp_c4)._m0[10].z, _111);
    float _121 = _113 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _123 = _115 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _125 = _117 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _127 = _119 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_29.w = _95;
    out.gl_Position.x = _121;
    out.gl_Position.y = _123;
    out.gl_Position.z = _125;
    out.gl_Position.w = _127;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _43 = in.m_24.x;
    float _45 = in.m_24.y;
    float _47 = in.m_24.z;
    float _49 = _45 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _51 = _45 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _53 = _45 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _55 = fma(_43, (*spvDescriptorSet0.vp_c7)._m0[1].x, _49);
    float _57 = fma(_43, (*spvDescriptorSet0.vp_c7)._m0[0].x, _51);
    float _59 = fma(_43, (*spvDescriptorSet0.vp_c7)._m0[2].x, _53);
    float _61 = fma(_47, (*spvDescriptorSet0.vp_c7)._m0[1].z, _55);
    float _63 = fma(_47, (*spvDescriptorSet0.vp_c7)._m0[0].z, _57);
    float _65 = fma(_47, (*spvDescriptorSet0.vp_c7)._m0[2].z, _59);
    float _67 = _61 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _69 = _63 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _71 = _65 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _73 = _67 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _75 = _67 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _77 = _67 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    out.m_27.x = _69;
    out.m_27.y = _67;
    out.m_27.z = _71;
    float _79 = fma(_69, (*spvDescriptorSet0.vp_c4)._m0[1].x, _73);
    float _81 = fma(_69, (*spvDescriptorSet0.vp_c4)._m0[0].x, _75);
    float _83 = fma(_69, (*spvDescriptorSet0.vp_c4)._m0[2].x, _77);
    float _85 = fma(_71, (*spvDescriptorSet0.vp_c4)._m0[1].z, _79);
    float _87 = fma(_71, (*spvDescriptorSet0.vp_c4)._m0[0].z, _81);
    float _89 = fma(_71, (*spvDescriptorSet0.vp_c4)._m0[2].z, _83);
    float _91 = _85 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _93 = _87 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _95 = _89 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _97 = _91 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _99 = _91 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _101 = _91 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _103 = _91 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _105 = fma(_93, (*spvDescriptorSet0.vp_c4)._m0[7].x, _97);
    float _107 = fma(_93, (*spvDescriptorSet0.vp_c4)._m0[8].x, _99);
    float _109 = fma(_93, (*spvDescriptorSet0.vp_c4)._m0[9].x, _101);
    float _111 = fma(_93, (*spvDescriptorSet0.vp_c4)._m0[10].x, _103);
    float _113 = fma(_95, (*spvDescriptorSet0.vp_c4)._m0[7].z, _105);
    float _115 = fma(_95, (*spvDescriptorSet0.vp_c4)._m0[8].z, _107);
    float _117 = fma(_95, (*spvDescriptorSet0.vp_c4)._m0[9].z, _109);
    float _119 = fma(_95, (*spvDescriptorSet0.vp_c4)._m0[10].z, _111);
    float _121 = _113 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _123 = _115 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _125 = _117 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _127 = _119 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_29.w = _95;
    out.gl_Position.x = _121;
    out.gl_Position.y = _123;
    out.gl_Position.z = _125;
    out.gl_Position.w = _127;
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
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _43 = in.m_24.x;
    float _45 = in.m_24.y;
    float _47 = in.m_24.z;
    float _49 = _45 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _51 = _45 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _53 = _45 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _55 = fma(_43, (*spvDescriptorSet0.vp_c7)._m0[1].x, _49);
    float _57 = fma(_43, (*spvDescriptorSet0.vp_c7)._m0[0].x, _51);
    float _59 = fma(_43, (*spvDescriptorSet0.vp_c7)._m0[2].x, _53);
    float _61 = fma(_47, (*spvDescriptorSet0.vp_c7)._m0[1].z, _55);
    float _63 = fma(_47, (*spvDescriptorSet0.vp_c7)._m0[0].z, _57);
    float _65 = fma(_47, (*spvDescriptorSet0.vp_c7)._m0[2].z, _59);
    float _67 = _61 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _69 = _63 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _71 = _65 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _73 = _67 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _75 = _67 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _77 = _67 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    out.m_27.x = _69;
    out.m_27.y = _67;
    out.m_27.z = _71;
    float _79 = fma(_69, (*spvDescriptorSet0.vp_c4)._m0[1].x, _73);
    float _81 = fma(_69, (*spvDescriptorSet0.vp_c4)._m0[0].x, _75);
    float _83 = fma(_69, (*spvDescriptorSet0.vp_c4)._m0[2].x, _77);
    float _85 = fma(_71, (*spvDescriptorSet0.vp_c4)._m0[1].z, _79);
    float _87 = fma(_71, (*spvDescriptorSet0.vp_c4)._m0[0].z, _81);
    float _89 = fma(_71, (*spvDescriptorSet0.vp_c4)._m0[2].z, _83);
    float _91 = _85 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _93 = _87 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _95 = _89 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _97 = _91 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _99 = _91 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _101 = _91 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _103 = _91 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _105 = fma(_93, (*spvDescriptorSet0.vp_c4)._m0[7].x, _97);
    float _107 = fma(_93, (*spvDescriptorSet0.vp_c4)._m0[8].x, _99);
    float _109 = fma(_93, (*spvDescriptorSet0.vp_c4)._m0[9].x, _101);
    float _111 = fma(_93, (*spvDescriptorSet0.vp_c4)._m0[10].x, _103);
    float _113 = fma(_95, (*spvDescriptorSet0.vp_c4)._m0[7].z, _105);
    float _115 = fma(_95, (*spvDescriptorSet0.vp_c4)._m0[8].z, _107);
    float _117 = fma(_95, (*spvDescriptorSet0.vp_c4)._m0[9].z, _109);
    float _119 = fma(_95, (*spvDescriptorSet0.vp_c4)._m0[10].z, _111);
    float _121 = _113 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _123 = _115 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _125 = _117 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _127 = _119 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_29.w = _95;
    out.gl_Position.x = _121;
    out.gl_Position.y = _123;
    out.gl_Position.z = _125;
    out.gl_Position.w = _127;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

