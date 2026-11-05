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
    constant _16* vp_c4 [[id(0)]];
    constant _16* vp_c3 [[id(1)]];
};

struct main0_out
{
    float4 m_31 [[user(locn0)]];
    float4 m_27 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_29 [[user(locn3)]];
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
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = in.m_24.x;
    float _49 = in.m_24.y;
    float _51 = in.m_24.z;
    float _53 = _51 + 0.5;
    float _55 = _49 * (*spvDescriptorSet0.vp_c4)._m0[3].y;
    float _57 = _49 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _59 = _49 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _61 = -_53;
    float _63 = fma(_61, (*spvDescriptorSet0.vp_c4)._m0[16].y, _51);
    float _65 = fma(_47, (*spvDescriptorSet0.vp_c4)._m0[3].x, _55);
    float _67 = _49 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _69 = fma(_47, (*spvDescriptorSet0.vp_c4)._m0[1].x, _57);
    float _71 = fma(_47, (*spvDescriptorSet0.vp_c4)._m0[2].x, _59);
    float _73 = fma(_63, (*spvDescriptorSet0.vp_c4)._m0[3].z, _65);
    float _75 = fma(_47, (*spvDescriptorSet0.vp_c4)._m0[0].x, _67);
    float _77 = fma(_63, (*spvDescriptorSet0.vp_c4)._m0[1].z, _69);
    float _79 = _73 + (*spvDescriptorSet0.vp_c4)._m0[3].w;
    float _81 = fma(_63, (*spvDescriptorSet0.vp_c4)._m0[0].z, _75);
    float _83 = _77 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _85 = fma(_63, (*spvDescriptorSet0.vp_c4)._m0[2].z, _71);
    float _87 = abs(_79);
    bool _91 = _87 >= 0.001000000047497451305389404296875;
    bool _93 = isnan(_87);
    bool _95 = _91 || _93;
    bool _97 = isnan(0.001000000047497451305389404296875);
    bool _99 = _95 || _97;
    float _101 = _81 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _103 = _85 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _105 = _99 ? _79 : 0.001000000047497451305389404296875;
    out.gl_Position.x = _101;
    out.gl_Position.y = _83;
    out.gl_Position.z = _103;
    out.gl_Position.w = _79;
    float _107 = 1.0 / _105;
    float _109 = _83 * _107;
    float _111 = _101 * _107;
    float _113 = -(*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _115 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[11].y, _113);
    float _117 = fma(_111, 0.5, 0.5);
    float _119 = -_111;
    float _121 = -(*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _123 = fma(_119, (*spvDescriptorSet0.vp_c3)._m0[11].x, _121);
    float _125 = fma(_109, -0.5, 0.5);
    float _127 = _115 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _129 = _115 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _131 = _115 * (*spvDescriptorSet0.vp_c4)._m0[4].y;
    float _133 = _115 * (*spvDescriptorSet0.vp_c4)._m0[5].y;
    float _135 = _115 * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _137 = _115 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _139 = _115 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _141 = _115 * (*spvDescriptorSet0.vp_c4)._m0[11].y;
    float _143 = fma(_123, (*spvDescriptorSet0.vp_c4)._m0[8].x, _127);
    float _145 = fma(_123, (*spvDescriptorSet0.vp_c4)._m0[9].x, _129);
    float _147 = fma(_123, (*spvDescriptorSet0.vp_c4)._m0[4].x, _131);
    float _149 = fma(_123, (*spvDescriptorSet0.vp_c4)._m0[5].x, _133);
    float _151 = fma(_123, (*spvDescriptorSet0.vp_c4)._m0[6].x, _135);
    float _153 = fma(_123, (*spvDescriptorSet0.vp_c4)._m0[7].x, _137);
    float _155 = fma(_123, (*spvDescriptorSet0.vp_c4)._m0[10].x, _139);
    float _157 = fma(_123, (*spvDescriptorSet0.vp_c4)._m0[11].x, _141);
    float _159 = _143 + (*spvDescriptorSet0.vp_c4)._m0[8].z;
    float _161 = _145 + (*spvDescriptorSet0.vp_c4)._m0[9].z;
    float _163 = _147 + (*spvDescriptorSet0.vp_c4)._m0[4].z;
    float _165 = _149 + (*spvDescriptorSet0.vp_c4)._m0[5].z;
    float _167 = _151 + (*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _169 = _153 + (*spvDescriptorSet0.vp_c4)._m0[7].z;
    float _171 = _155 + (*spvDescriptorSet0.vp_c4)._m0[10].z;
    float _173 = _157 + (*spvDescriptorSet0.vp_c4)._m0[11].z;
    out.m_27.x = _123;
    out.m_27.y = _115;
    out.m_27.z = 1.0;
    out.m_29.x = _117;
    out.m_29.y = _125;
    out.m_31.x = _163;
    out.m_31.y = _165;
    out.m_31.z = _167;
    out.m_31.w = _169;
    out.m_33.x = _159;
    out.m_33.y = _161;
    out.m_33.z = _171;
    out.m_33.w = _173;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = in.m_24.x;
    float _49 = in.m_24.y;
    float _51 = in.m_24.z;
    float _53 = _51 + 0.5;
    float _55 = _49 * (*spvDescriptorSet0.vp_c4)._m0[3].y;
    float _57 = _49 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _59 = _49 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _61 = -_53;
    float _63 = fma(_61, (*spvDescriptorSet0.vp_c4)._m0[16].y, _51);
    float _65 = fma(_47, (*spvDescriptorSet0.vp_c4)._m0[3].x, _55);
    float _67 = _49 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _69 = fma(_47, (*spvDescriptorSet0.vp_c4)._m0[1].x, _57);
    float _71 = fma(_47, (*spvDescriptorSet0.vp_c4)._m0[2].x, _59);
    float _73 = fma(_63, (*spvDescriptorSet0.vp_c4)._m0[3].z, _65);
    float _75 = fma(_47, (*spvDescriptorSet0.vp_c4)._m0[0].x, _67);
    float _77 = fma(_63, (*spvDescriptorSet0.vp_c4)._m0[1].z, _69);
    float _79 = _73 + (*spvDescriptorSet0.vp_c4)._m0[3].w;
    float _81 = fma(_63, (*spvDescriptorSet0.vp_c4)._m0[0].z, _75);
    float _83 = _77 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _85 = fma(_63, (*spvDescriptorSet0.vp_c4)._m0[2].z, _71);
    float _87 = abs(_79);
    bool _91 = _87 >= 0.001000000047497451305389404296875;
    bool _93 = isnan(_87);
    bool _95 = _91 || _93;
    bool _97 = isnan(0.001000000047497451305389404296875);
    bool _99 = _95 || _97;
    float _101 = _81 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _103 = _85 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _105 = _99 ? _79 : 0.001000000047497451305389404296875;
    out.gl_Position.x = _101;
    out.gl_Position.y = _83;
    out.gl_Position.z = _103;
    out.gl_Position.w = _79;
    float _107 = 1.0 / _105;
    float _109 = _83 * _107;
    float _111 = _101 * _107;
    float _113 = -(*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _115 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[11].y, _113);
    float _117 = fma(_111, 0.5, 0.5);
    float _119 = -_111;
    float _121 = -(*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _123 = fma(_119, (*spvDescriptorSet0.vp_c3)._m0[11].x, _121);
    float _125 = fma(_109, -0.5, 0.5);
    float _127 = _115 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _129 = _115 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _131 = _115 * (*spvDescriptorSet0.vp_c4)._m0[4].y;
    float _133 = _115 * (*spvDescriptorSet0.vp_c4)._m0[5].y;
    float _135 = _115 * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _137 = _115 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _139 = _115 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _141 = _115 * (*spvDescriptorSet0.vp_c4)._m0[11].y;
    float _143 = fma(_123, (*spvDescriptorSet0.vp_c4)._m0[8].x, _127);
    float _145 = fma(_123, (*spvDescriptorSet0.vp_c4)._m0[9].x, _129);
    float _147 = fma(_123, (*spvDescriptorSet0.vp_c4)._m0[4].x, _131);
    float _149 = fma(_123, (*spvDescriptorSet0.vp_c4)._m0[5].x, _133);
    float _151 = fma(_123, (*spvDescriptorSet0.vp_c4)._m0[6].x, _135);
    float _153 = fma(_123, (*spvDescriptorSet0.vp_c4)._m0[7].x, _137);
    float _155 = fma(_123, (*spvDescriptorSet0.vp_c4)._m0[10].x, _139);
    float _157 = fma(_123, (*spvDescriptorSet0.vp_c4)._m0[11].x, _141);
    float _159 = _143 + (*spvDescriptorSet0.vp_c4)._m0[8].z;
    float _161 = _145 + (*spvDescriptorSet0.vp_c4)._m0[9].z;
    float _163 = _147 + (*spvDescriptorSet0.vp_c4)._m0[4].z;
    float _165 = _149 + (*spvDescriptorSet0.vp_c4)._m0[5].z;
    float _167 = _151 + (*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _169 = _153 + (*spvDescriptorSet0.vp_c4)._m0[7].z;
    float _171 = _155 + (*spvDescriptorSet0.vp_c4)._m0[10].z;
    float _173 = _157 + (*spvDescriptorSet0.vp_c4)._m0[11].z;
    out.m_27.x = _123;
    out.m_27.y = _115;
    out.m_27.z = 1.0;
    out.m_29.x = _117;
    out.m_29.y = _125;
    out.m_31.x = _163;
    out.m_31.y = _165;
    out.m_31.z = _167;
    out.m_31.w = _169;
    out.m_33.x = _159;
    out.m_33.y = _161;
    out.m_33.z = _171;
    out.m_33.w = _173;
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
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = in.m_24.x;
    float _49 = in.m_24.y;
    float _51 = in.m_24.z;
    float _53 = _51 + 0.5;
    float _55 = _49 * (*spvDescriptorSet0.vp_c4)._m0[3].y;
    float _57 = _49 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _59 = _49 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _61 = -_53;
    float _63 = fma(_61, (*spvDescriptorSet0.vp_c4)._m0[16].y, _51);
    float _65 = fma(_47, (*spvDescriptorSet0.vp_c4)._m0[3].x, _55);
    float _67 = _49 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _69 = fma(_47, (*spvDescriptorSet0.vp_c4)._m0[1].x, _57);
    float _71 = fma(_47, (*spvDescriptorSet0.vp_c4)._m0[2].x, _59);
    float _73 = fma(_63, (*spvDescriptorSet0.vp_c4)._m0[3].z, _65);
    float _75 = fma(_47, (*spvDescriptorSet0.vp_c4)._m0[0].x, _67);
    float _77 = fma(_63, (*spvDescriptorSet0.vp_c4)._m0[1].z, _69);
    float _79 = _73 + (*spvDescriptorSet0.vp_c4)._m0[3].w;
    float _81 = fma(_63, (*spvDescriptorSet0.vp_c4)._m0[0].z, _75);
    float _83 = _77 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _85 = fma(_63, (*spvDescriptorSet0.vp_c4)._m0[2].z, _71);
    float _87 = abs(_79);
    bool _91 = _87 >= 0.001000000047497451305389404296875;
    bool _93 = isnan(_87);
    bool _95 = _91 || _93;
    bool _97 = isnan(0.001000000047497451305389404296875);
    bool _99 = _95 || _97;
    float _101 = _81 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _103 = _85 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _105 = _99 ? _79 : 0.001000000047497451305389404296875;
    out.gl_Position.x = _101;
    out.gl_Position.y = _83;
    out.gl_Position.z = _103;
    out.gl_Position.w = _79;
    float _107 = 1.0 / _105;
    float _109 = _83 * _107;
    float _111 = _101 * _107;
    float _113 = -(*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _115 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[11].y, _113);
    float _117 = fma(_111, 0.5, 0.5);
    float _119 = -_111;
    float _121 = -(*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _123 = fma(_119, (*spvDescriptorSet0.vp_c3)._m0[11].x, _121);
    float _125 = fma(_109, -0.5, 0.5);
    float _127 = _115 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _129 = _115 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _131 = _115 * (*spvDescriptorSet0.vp_c4)._m0[4].y;
    float _133 = _115 * (*spvDescriptorSet0.vp_c4)._m0[5].y;
    float _135 = _115 * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _137 = _115 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _139 = _115 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _141 = _115 * (*spvDescriptorSet0.vp_c4)._m0[11].y;
    float _143 = fma(_123, (*spvDescriptorSet0.vp_c4)._m0[8].x, _127);
    float _145 = fma(_123, (*spvDescriptorSet0.vp_c4)._m0[9].x, _129);
    float _147 = fma(_123, (*spvDescriptorSet0.vp_c4)._m0[4].x, _131);
    float _149 = fma(_123, (*spvDescriptorSet0.vp_c4)._m0[5].x, _133);
    float _151 = fma(_123, (*spvDescriptorSet0.vp_c4)._m0[6].x, _135);
    float _153 = fma(_123, (*spvDescriptorSet0.vp_c4)._m0[7].x, _137);
    float _155 = fma(_123, (*spvDescriptorSet0.vp_c4)._m0[10].x, _139);
    float _157 = fma(_123, (*spvDescriptorSet0.vp_c4)._m0[11].x, _141);
    float _159 = _143 + (*spvDescriptorSet0.vp_c4)._m0[8].z;
    float _161 = _145 + (*spvDescriptorSet0.vp_c4)._m0[9].z;
    float _163 = _147 + (*spvDescriptorSet0.vp_c4)._m0[4].z;
    float _165 = _149 + (*spvDescriptorSet0.vp_c4)._m0[5].z;
    float _167 = _151 + (*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _169 = _153 + (*spvDescriptorSet0.vp_c4)._m0[7].z;
    float _171 = _155 + (*spvDescriptorSet0.vp_c4)._m0[10].z;
    float _173 = _157 + (*spvDescriptorSet0.vp_c4)._m0[11].z;
    out.m_27.x = _123;
    out.m_27.y = _115;
    out.m_27.z = 1.0;
    out.m_29.x = _117;
    out.m_29.y = _125;
    out.m_31.x = _163;
    out.m_31.y = _165;
    out.m_31.z = _167;
    out.m_31.w = _169;
    out.m_33.x = _159;
    out.m_33.y = _161;
    out.m_33.z = _171;
    out.m_33.w = _173;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

