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
    float4 m_29 [[user(locn1)]];
    float4 m_33 [[user(locn3)]];
    float4 m_31 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_24 [[attribute(0)]];
    float4 m_26 [[attribute(1)]];
    float4 m_22 [[attribute(2)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = in.m_22.x;
    float _49 = in.m_22.y;
    float _51 = in.m_22.z;
    float _53 = in.m_22.w;
    float _55 = in.m_24.w;
    float _57 = in.m_26.x;
    float _59 = in.m_26.y;
    float _61 = in.m_26.z;
    bool _65 = _47 > 2.0;
    float _67 = _49 * _49;
    bool _69 = _51 > 2.0;
    float _71 = _65 ? (-1.0) : 1.0;
    float _73 = _69 ? (-1.0) : 1.0;
    float _75 = _47;
    float _77 = _51;
    if (_65)
    {
        float _79 = _47 + (-10.0);
        _75 = _79;
    }
    float _81 = _75;
    if (_69)
    {
        float _83 = _51 + (-10.0);
        _77 = _83;
    }
    float _85 = _77;
    float _87 = fma(_81, _81, _67);
    float _89 = _53 * _53;
    float _91 = fma(_85, _85, _89);
    float _93 = sqrt(_87);
    float _95 = in.m_24.x;
    float _97 = in.m_24.y;
    float _99 = in.m_24.z;
    out.m_29.x = _55;
    float _101 = sqrt(_91);
    out.m_31.x = _57;
    out.m_31.y = _59;
    float _103 = -_93;
    float _105 = _103 + 1.0;
    out.m_31.z = _61;
    float _107 = _71 * _105;
    float _109 = -_101;
    float _111 = _109 + 1.0;
    float _113 = _97 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _115 = _97 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _117 = _97 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _119 = _73 * _111;
    float _121 = _97 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _123 = _53 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _125 = fma(_95, (*spvDescriptorSet0.vp_c3)._m0[10].x, _113);
    float _127 = _81 * _119;
    float _129 = fma(_95, (*spvDescriptorSet0.vp_c3)._m0[11].x, _115);
    float _131 = fma(_95, (*spvDescriptorSet0.vp_c3)._m0[12].x, _117);
    float _133 = fma(_95, (*spvDescriptorSet0.vp_c3)._m0[13].x, _121);
    float _135 = _107 * _53;
    float _137 = -_127;
    float _139 = fma(_107, _85, _137);
    float _141 = fma(_85, (*spvDescriptorSet0.vp_c3)._m0[15].x, _123);
    float _143 = _85 * _49;
    float _145 = -_135;
    float _147 = fma(_119, _49, _145);
    float _149 = _139 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _151 = fma(_99, (*spvDescriptorSet0.vp_c3)._m0[10].z, _125);
    float _153 = fma(_99, (*spvDescriptorSet0.vp_c3)._m0[11].z, _129);
    float _155 = fma(_99, (*spvDescriptorSet0.vp_c3)._m0[12].z, _131);
    float _157 = fma(_99, (*spvDescriptorSet0.vp_c3)._m0[13].z, _133);
    float _159 = -_143;
    float _161 = fma(_81, _53, _159);
    float _163 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[15].x, _149);
    float _165 = _151 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _167 = _153 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _169 = _155 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _171 = _157 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _173 = fma(_119, (*spvDescriptorSet0.vp_c3)._m0[15].z, _141);
    float _175 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[15].z, _163);
    out.gl_Position.x = _165;
    out.gl_Position.y = _167;
    out.gl_Position.z = _169;
    out.gl_Position.w = _171;
    out.m_33.z = _173;
    out.m_33.x = _175;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = in.m_22.x;
    float _49 = in.m_22.y;
    float _51 = in.m_22.z;
    float _53 = in.m_22.w;
    float _55 = in.m_24.w;
    float _57 = in.m_26.x;
    float _59 = in.m_26.y;
    float _61 = in.m_26.z;
    bool _65 = _47 > 2.0;
    float _67 = _49 * _49;
    bool _69 = _51 > 2.0;
    float _71 = _65 ? (-1.0) : 1.0;
    float _73 = _69 ? (-1.0) : 1.0;
    float _75 = _47;
    float _77 = _51;
    if (_65)
    {
        float _79 = _47 + (-10.0);
        _75 = _79;
    }
    float _81 = _75;
    if (_69)
    {
        float _83 = _51 + (-10.0);
        _77 = _83;
    }
    float _85 = _77;
    float _87 = fma(_81, _81, _67);
    float _89 = _53 * _53;
    float _91 = fma(_85, _85, _89);
    float _93 = sqrt(_87);
    float _95 = in.m_24.x;
    float _97 = in.m_24.y;
    float _99 = in.m_24.z;
    out.m_29.x = _55;
    float _101 = sqrt(_91);
    out.m_31.x = _57;
    out.m_31.y = _59;
    float _103 = -_93;
    float _105 = _103 + 1.0;
    out.m_31.z = _61;
    float _107 = _71 * _105;
    float _109 = -_101;
    float _111 = _109 + 1.0;
    float _113 = _97 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _115 = _97 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _117 = _97 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _119 = _73 * _111;
    float _121 = _97 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _123 = _53 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _125 = fma(_95, (*spvDescriptorSet0.vp_c3)._m0[10].x, _113);
    float _127 = _81 * _119;
    float _129 = fma(_95, (*spvDescriptorSet0.vp_c3)._m0[11].x, _115);
    float _131 = fma(_95, (*spvDescriptorSet0.vp_c3)._m0[12].x, _117);
    float _133 = fma(_95, (*spvDescriptorSet0.vp_c3)._m0[13].x, _121);
    float _135 = _107 * _53;
    float _137 = -_127;
    float _139 = fma(_107, _85, _137);
    float _141 = fma(_85, (*spvDescriptorSet0.vp_c3)._m0[15].x, _123);
    float _143 = _85 * _49;
    float _145 = -_135;
    float _147 = fma(_119, _49, _145);
    float _149 = _139 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _151 = fma(_99, (*spvDescriptorSet0.vp_c3)._m0[10].z, _125);
    float _153 = fma(_99, (*spvDescriptorSet0.vp_c3)._m0[11].z, _129);
    float _155 = fma(_99, (*spvDescriptorSet0.vp_c3)._m0[12].z, _131);
    float _157 = fma(_99, (*spvDescriptorSet0.vp_c3)._m0[13].z, _133);
    float _159 = -_143;
    float _161 = fma(_81, _53, _159);
    float _163 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[15].x, _149);
    float _165 = _151 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _167 = _153 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _169 = _155 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _171 = _157 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _173 = fma(_119, (*spvDescriptorSet0.vp_c3)._m0[15].z, _141);
    float _175 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[15].z, _163);
    out.gl_Position.x = _165;
    out.gl_Position.y = _167;
    out.gl_Position.z = _169;
    out.gl_Position.w = _171;
    out.m_33.z = _173;
    out.m_33.x = _175;
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
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = in.m_22.x;
    float _49 = in.m_22.y;
    float _51 = in.m_22.z;
    float _53 = in.m_22.w;
    float _55 = in.m_24.w;
    float _57 = in.m_26.x;
    float _59 = in.m_26.y;
    float _61 = in.m_26.z;
    bool _65 = _47 > 2.0;
    float _67 = _49 * _49;
    bool _69 = _51 > 2.0;
    float _71 = _65 ? (-1.0) : 1.0;
    float _73 = _69 ? (-1.0) : 1.0;
    float _75 = _47;
    float _77 = _51;
    if (_65)
    {
        float _79 = _47 + (-10.0);
        _75 = _79;
    }
    float _81 = _75;
    if (_69)
    {
        float _83 = _51 + (-10.0);
        _77 = _83;
    }
    float _85 = _77;
    float _87 = fma(_81, _81, _67);
    float _89 = _53 * _53;
    float _91 = fma(_85, _85, _89);
    float _93 = sqrt(_87);
    float _95 = in.m_24.x;
    float _97 = in.m_24.y;
    float _99 = in.m_24.z;
    out.m_29.x = _55;
    float _101 = sqrt(_91);
    out.m_31.x = _57;
    out.m_31.y = _59;
    float _103 = -_93;
    float _105 = _103 + 1.0;
    out.m_31.z = _61;
    float _107 = _71 * _105;
    float _109 = -_101;
    float _111 = _109 + 1.0;
    float _113 = _97 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _115 = _97 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _117 = _97 * (*spvDescriptorSet0.vp_c3)._m0[12].y;
    float _119 = _73 * _111;
    float _121 = _97 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _123 = _53 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _125 = fma(_95, (*spvDescriptorSet0.vp_c3)._m0[10].x, _113);
    float _127 = _81 * _119;
    float _129 = fma(_95, (*spvDescriptorSet0.vp_c3)._m0[11].x, _115);
    float _131 = fma(_95, (*spvDescriptorSet0.vp_c3)._m0[12].x, _117);
    float _133 = fma(_95, (*spvDescriptorSet0.vp_c3)._m0[13].x, _121);
    float _135 = _107 * _53;
    float _137 = -_127;
    float _139 = fma(_107, _85, _137);
    float _141 = fma(_85, (*spvDescriptorSet0.vp_c3)._m0[15].x, _123);
    float _143 = _85 * _49;
    float _145 = -_135;
    float _147 = fma(_119, _49, _145);
    float _149 = _139 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _151 = fma(_99, (*spvDescriptorSet0.vp_c3)._m0[10].z, _125);
    float _153 = fma(_99, (*spvDescriptorSet0.vp_c3)._m0[11].z, _129);
    float _155 = fma(_99, (*spvDescriptorSet0.vp_c3)._m0[12].z, _131);
    float _157 = fma(_99, (*spvDescriptorSet0.vp_c3)._m0[13].z, _133);
    float _159 = -_143;
    float _161 = fma(_81, _53, _159);
    float _163 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[15].x, _149);
    float _165 = _151 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _167 = _153 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _169 = _155 + (*spvDescriptorSet0.vp_c3)._m0[12].w;
    float _171 = _157 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _173 = fma(_119, (*spvDescriptorSet0.vp_c3)._m0[15].z, _141);
    float _175 = fma(_161, (*spvDescriptorSet0.vp_c3)._m0[15].z, _163);
    out.gl_Position.x = _165;
    out.gl_Position.y = _167;
    out.gl_Position.z = _169;
    out.gl_Position.w = _171;
    out.m_33.z = _173;
    out.m_33.x = _175;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

