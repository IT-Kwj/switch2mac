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
    float4 m_25 [[user(locn0)]];
    float4 m_27 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_31 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_22 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = in.m_22.x;
    float _47 = in.m_22.y;
    float _49 = fma(0.5, (*spvDescriptorSet0.vp_c3)._m0[0].x, 0.5);
    float _51 = fma(0.5, (*spvDescriptorSet0.vp_c3)._m0[0].y, 0.5);
    float _53 = fma((*spvDescriptorSet0.vp_c3)._m0[0].w, -0.14285714924335479736328125, 1.0);
    float _55 = fma((*spvDescriptorSet0.vp_c3)._m0[0].w, -0.2857142984867095947265625, 1.0);
    float _57 = fma((*spvDescriptorSet0.vp_c3)._m0[0].w, -0.4285714626312255859375, 1.0);
    float _59 = fma((*spvDescriptorSet0.vp_c3)._m0[0].w, -0.571428596973419189453125, 1.0);
    float _61 = _45 * (*spvDescriptorSet0.vp_c3)._m0[1].x;
    float _63 = _47 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _65 = fma(_61, _53, _49);
    float _67 = fma(_63, _53, _51);
    float _69 = _61 + _49;
    float _71 = _63 + _51;
    float _73 = fma(_61, _55, _49);
    float _75 = fma(_61, _57, _49);
    float _77 = fma(_63, _55, _51);
    float _79 = fma(_63, _57, _51);
    float _81 = fma(_63, _59, _51);
    float _83 = fma(_61, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
    float _85 = fma(_61, _59, _49);
    out.m_25.x = _69;
    out.m_25.y = _71;
    out.m_25.z = _65;
    out.m_25.w = _67;
    float _87 = -_67;
    float _89 = _87 + 1.0;
    float _91 = fma(_63, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
    out.m_25.w = _89;
    out.m_27.x = _65;
    out.m_27.y = _67;
    out.m_27.z = _73;
    out.m_27.w = _77;
    float _93 = -_71;
    float _95 = _93 + 1.0;
    float _97 = -_77;
    float _99 = _97 + 1.0;
    float _101 = -_79;
    float _103 = _101 + 1.0;
    float _105 = -_81;
    float _107 = _105 + 1.0;
    out.m_29.x = _73;
    out.m_29.y = _77;
    out.m_29.z = _75;
    out.m_29.w = _79;
    out.m_31.x = _75;
    out.m_31.y = _79;
    out.m_31.z = _85;
    out.m_31.w = _81;
    out.gl_Position.x = _83;
    out.gl_Position.y = _91;
    out.gl_Position.z = (*spvDescriptorSet0.vp_c3)._m0[0].z;
    out.m_25.y = _95;
    out.m_27.y = _89;
    out.m_27.w = _99;
    out.m_29.y = _99;
    out.m_29.w = _103;
    out.m_31.y = _103;
    out.m_31.w = _107;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = in.m_22.x;
    float _47 = in.m_22.y;
    float _49 = fma(0.5, (*spvDescriptorSet0.vp_c3)._m0[0].x, 0.5);
    float _51 = fma(0.5, (*spvDescriptorSet0.vp_c3)._m0[0].y, 0.5);
    float _53 = fma((*spvDescriptorSet0.vp_c3)._m0[0].w, -0.14285714924335479736328125, 1.0);
    float _55 = fma((*spvDescriptorSet0.vp_c3)._m0[0].w, -0.2857142984867095947265625, 1.0);
    float _57 = fma((*spvDescriptorSet0.vp_c3)._m0[0].w, -0.4285714626312255859375, 1.0);
    float _59 = fma((*spvDescriptorSet0.vp_c3)._m0[0].w, -0.571428596973419189453125, 1.0);
    float _61 = _45 * (*spvDescriptorSet0.vp_c3)._m0[1].x;
    float _63 = _47 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _65 = fma(_61, _53, _49);
    float _67 = fma(_63, _53, _51);
    float _69 = _61 + _49;
    float _71 = _63 + _51;
    float _73 = fma(_61, _55, _49);
    float _75 = fma(_61, _57, _49);
    float _77 = fma(_63, _55, _51);
    float _79 = fma(_63, _57, _51);
    float _81 = fma(_63, _59, _51);
    float _83 = fma(_61, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
    float _85 = fma(_61, _59, _49);
    out.m_25.x = _69;
    out.m_25.y = _71;
    out.m_25.z = _65;
    out.m_25.w = _67;
    float _87 = -_67;
    float _89 = _87 + 1.0;
    float _91 = fma(_63, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
    out.m_25.w = _89;
    out.m_27.x = _65;
    out.m_27.y = _67;
    out.m_27.z = _73;
    out.m_27.w = _77;
    float _93 = -_71;
    float _95 = _93 + 1.0;
    float _97 = -_77;
    float _99 = _97 + 1.0;
    float _101 = -_79;
    float _103 = _101 + 1.0;
    float _105 = -_81;
    float _107 = _105 + 1.0;
    out.m_29.x = _73;
    out.m_29.y = _77;
    out.m_29.z = _75;
    out.m_29.w = _79;
    out.m_31.x = _75;
    out.m_31.y = _79;
    out.m_31.z = _85;
    out.m_31.w = _81;
    out.gl_Position.x = _83;
    out.gl_Position.y = _91;
    out.gl_Position.z = (*spvDescriptorSet0.vp_c3)._m0[0].z;
    out.m_25.y = _95;
    out.m_27.y = _89;
    out.m_27.w = _99;
    out.m_29.y = _99;
    out.m_29.w = _103;
    out.m_31.y = _103;
    out.m_31.w = _107;
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
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = in.m_22.x;
    float _47 = in.m_22.y;
    float _49 = fma(0.5, (*spvDescriptorSet0.vp_c3)._m0[0].x, 0.5);
    float _51 = fma(0.5, (*spvDescriptorSet0.vp_c3)._m0[0].y, 0.5);
    float _53 = fma((*spvDescriptorSet0.vp_c3)._m0[0].w, -0.14285714924335479736328125, 1.0);
    float _55 = fma((*spvDescriptorSet0.vp_c3)._m0[0].w, -0.2857142984867095947265625, 1.0);
    float _57 = fma((*spvDescriptorSet0.vp_c3)._m0[0].w, -0.4285714626312255859375, 1.0);
    float _59 = fma((*spvDescriptorSet0.vp_c3)._m0[0].w, -0.571428596973419189453125, 1.0);
    float _61 = _45 * (*spvDescriptorSet0.vp_c3)._m0[1].x;
    float _63 = _47 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _65 = fma(_61, _53, _49);
    float _67 = fma(_63, _53, _51);
    float _69 = _61 + _49;
    float _71 = _63 + _51;
    float _73 = fma(_61, _55, _49);
    float _75 = fma(_61, _57, _49);
    float _77 = fma(_63, _55, _51);
    float _79 = fma(_63, _57, _51);
    float _81 = fma(_63, _59, _51);
    float _83 = fma(_61, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].x);
    float _85 = fma(_61, _59, _49);
    out.m_25.x = _69;
    out.m_25.y = _71;
    out.m_25.z = _65;
    out.m_25.w = _67;
    float _87 = -_67;
    float _89 = _87 + 1.0;
    float _91 = fma(_63, 2.0, (*spvDescriptorSet0.vp_c3)._m0[0].y);
    out.m_25.w = _89;
    out.m_27.x = _65;
    out.m_27.y = _67;
    out.m_27.z = _73;
    out.m_27.w = _77;
    float _93 = -_71;
    float _95 = _93 + 1.0;
    float _97 = -_77;
    float _99 = _97 + 1.0;
    float _101 = -_79;
    float _103 = _101 + 1.0;
    float _105 = -_81;
    float _107 = _105 + 1.0;
    out.m_29.x = _73;
    out.m_29.y = _77;
    out.m_29.z = _75;
    out.m_29.w = _79;
    out.m_31.x = _75;
    out.m_31.y = _79;
    out.m_31.z = _85;
    out.m_31.w = _81;
    out.gl_Position.x = _83;
    out.gl_Position.y = _91;
    out.gl_Position.z = (*spvDescriptorSet0.vp_c3)._m0[0].z;
    out.m_25.y = _95;
    out.m_27.y = _89;
    out.m_27.w = _99;
    out.m_29.y = _99;
    out.m_29.w = _103;
    out.m_31.y = _103;
    out.m_31.w = _107;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_25.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_25.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_25.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_25.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

