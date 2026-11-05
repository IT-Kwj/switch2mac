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
    float4 m_33 [[user(locn0)]];
    float4 m_27 [[user(locn1)]];
    float4 m_31 [[user(locn2)]];
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
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _55 = -_53;
    float _57 = fma(_55, (*spvDescriptorSet0.vp_c4)._m0[16].y, _51);
    float _59 = -_57;
    float _61 = _59 + 0.5;
    float _63 = _61 * _49;
    float _65 = _61 * _47;
    float _67 = _63 * (*spvDescriptorSet0.vp_c4)._m0[3].y;
    float _69 = _63 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _71 = _63 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _73 = _63 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _75 = fma(_65, (*spvDescriptorSet0.vp_c4)._m0[3].x, _67);
    float _77 = fma(_65, (*spvDescriptorSet0.vp_c4)._m0[1].x, _69);
    float _79 = fma(_65, (*spvDescriptorSet0.vp_c4)._m0[0].x, _71);
    float _81 = fma(_65, (*spvDescriptorSet0.vp_c4)._m0[2].x, _73);
    float _83 = fma(_57, (*spvDescriptorSet0.vp_c4)._m0[3].z, _75);
    float _85 = fma(_57, (*spvDescriptorSet0.vp_c4)._m0[1].z, _77);
    float _87 = fma(_57, (*spvDescriptorSet0.vp_c4)._m0[0].z, _79);
    float _89 = _83 + (*spvDescriptorSet0.vp_c4)._m0[3].w;
    float _91 = _85 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _93 = _87 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _95 = fma(_57, (*spvDescriptorSet0.vp_c4)._m0[2].z, _81);
    float _97 = abs(_89);
    bool _101 = _97 >= 0.001000000047497451305389404296875;
    bool _103 = isnan(_97);
    bool _105 = _101 || _103;
    bool _107 = isnan(0.001000000047497451305389404296875);
    bool _109 = _105 || _107;
    float _111 = _95 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _113 = _109 ? _89 : 0.001000000047497451305389404296875;
    out.gl_Position.x = _93;
    out.gl_Position.y = _91;
    out.gl_Position.z = _111;
    out.gl_Position.w = _89;
    float _115 = 1.0 / _113;
    float _117 = _91 * _115;
    float _119 = _93 * _115;
    float _121 = -(*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _123 = fma(_117, (*spvDescriptorSet0.vp_c3)._m0[11].y, _121);
    float _125 = fma(_119, 0.5, 0.5);
    float _127 = fma(_117, -0.5, 0.5);
    float _129 = -_119;
    float _131 = -(*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _133 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[11].x, _131);
    float _135 = _123 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _137 = _123 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _139 = _123 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _141 = _123 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _143 = _123 * (*spvDescriptorSet0.vp_c4)._m0[11].y;
    float _145 = fma(_133, (*spvDescriptorSet0.vp_c4)._m0[10].x, _135);
    float _147 = fma(_133, (*spvDescriptorSet0.vp_c4)._m0[7].x, _137);
    float _149 = fma(_133, (*spvDescriptorSet0.vp_c4)._m0[8].x, _139);
    float _151 = fma(_133, (*spvDescriptorSet0.vp_c4)._m0[9].x, _141);
    float _153 = fma(_133, (*spvDescriptorSet0.vp_c4)._m0[11].x, _143);
    float _155 = _149 + (*spvDescriptorSet0.vp_c4)._m0[8].z;
    float _157 = _151 + (*spvDescriptorSet0.vp_c4)._m0[9].z;
    float _159 = _145 + (*spvDescriptorSet0.vp_c4)._m0[10].z;
    float _161 = _153 + (*spvDescriptorSet0.vp_c4)._m0[11].z;
    float _163 = _147 + (*spvDescriptorSet0.vp_c4)._m0[7].z;
    out.m_27.x = _133;
    out.m_27.y = _123;
    out.m_27.z = 1.0;
    out.m_29.x = _125;
    out.m_29.y = _127;
    out.m_31.x = _155;
    out.m_31.y = _157;
    out.m_31.z = _159;
    out.m_31.w = _161;
    out.m_33.w = _163;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _55 = -_53;
    float _57 = fma(_55, (*spvDescriptorSet0.vp_c4)._m0[16].y, _51);
    float _59 = -_57;
    float _61 = _59 + 0.5;
    float _63 = _61 * _49;
    float _65 = _61 * _47;
    float _67 = _63 * (*spvDescriptorSet0.vp_c4)._m0[3].y;
    float _69 = _63 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _71 = _63 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _73 = _63 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _75 = fma(_65, (*spvDescriptorSet0.vp_c4)._m0[3].x, _67);
    float _77 = fma(_65, (*spvDescriptorSet0.vp_c4)._m0[1].x, _69);
    float _79 = fma(_65, (*spvDescriptorSet0.vp_c4)._m0[0].x, _71);
    float _81 = fma(_65, (*spvDescriptorSet0.vp_c4)._m0[2].x, _73);
    float _83 = fma(_57, (*spvDescriptorSet0.vp_c4)._m0[3].z, _75);
    float _85 = fma(_57, (*spvDescriptorSet0.vp_c4)._m0[1].z, _77);
    float _87 = fma(_57, (*spvDescriptorSet0.vp_c4)._m0[0].z, _79);
    float _89 = _83 + (*spvDescriptorSet0.vp_c4)._m0[3].w;
    float _91 = _85 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _93 = _87 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _95 = fma(_57, (*spvDescriptorSet0.vp_c4)._m0[2].z, _81);
    float _97 = abs(_89);
    bool _101 = _97 >= 0.001000000047497451305389404296875;
    bool _103 = isnan(_97);
    bool _105 = _101 || _103;
    bool _107 = isnan(0.001000000047497451305389404296875);
    bool _109 = _105 || _107;
    float _111 = _95 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _113 = _109 ? _89 : 0.001000000047497451305389404296875;
    out.gl_Position.x = _93;
    out.gl_Position.y = _91;
    out.gl_Position.z = _111;
    out.gl_Position.w = _89;
    float _115 = 1.0 / _113;
    float _117 = _91 * _115;
    float _119 = _93 * _115;
    float _121 = -(*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _123 = fma(_117, (*spvDescriptorSet0.vp_c3)._m0[11].y, _121);
    float _125 = fma(_119, 0.5, 0.5);
    float _127 = fma(_117, -0.5, 0.5);
    float _129 = -_119;
    float _131 = -(*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _133 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[11].x, _131);
    float _135 = _123 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _137 = _123 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _139 = _123 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _141 = _123 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _143 = _123 * (*spvDescriptorSet0.vp_c4)._m0[11].y;
    float _145 = fma(_133, (*spvDescriptorSet0.vp_c4)._m0[10].x, _135);
    float _147 = fma(_133, (*spvDescriptorSet0.vp_c4)._m0[7].x, _137);
    float _149 = fma(_133, (*spvDescriptorSet0.vp_c4)._m0[8].x, _139);
    float _151 = fma(_133, (*spvDescriptorSet0.vp_c4)._m0[9].x, _141);
    float _153 = fma(_133, (*spvDescriptorSet0.vp_c4)._m0[11].x, _143);
    float _155 = _149 + (*spvDescriptorSet0.vp_c4)._m0[8].z;
    float _157 = _151 + (*spvDescriptorSet0.vp_c4)._m0[9].z;
    float _159 = _145 + (*spvDescriptorSet0.vp_c4)._m0[10].z;
    float _161 = _153 + (*spvDescriptorSet0.vp_c4)._m0[11].z;
    float _163 = _147 + (*spvDescriptorSet0.vp_c4)._m0[7].z;
    out.m_27.x = _133;
    out.m_27.y = _123;
    out.m_27.z = 1.0;
    out.m_29.x = _125;
    out.m_29.y = _127;
    out.m_31.x = _155;
    out.m_31.y = _157;
    out.m_31.z = _159;
    out.m_31.w = _161;
    out.m_33.w = _163;
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
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _55 = -_53;
    float _57 = fma(_55, (*spvDescriptorSet0.vp_c4)._m0[16].y, _51);
    float _59 = -_57;
    float _61 = _59 + 0.5;
    float _63 = _61 * _49;
    float _65 = _61 * _47;
    float _67 = _63 * (*spvDescriptorSet0.vp_c4)._m0[3].y;
    float _69 = _63 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _71 = _63 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _73 = _63 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _75 = fma(_65, (*spvDescriptorSet0.vp_c4)._m0[3].x, _67);
    float _77 = fma(_65, (*spvDescriptorSet0.vp_c4)._m0[1].x, _69);
    float _79 = fma(_65, (*spvDescriptorSet0.vp_c4)._m0[0].x, _71);
    float _81 = fma(_65, (*spvDescriptorSet0.vp_c4)._m0[2].x, _73);
    float _83 = fma(_57, (*spvDescriptorSet0.vp_c4)._m0[3].z, _75);
    float _85 = fma(_57, (*spvDescriptorSet0.vp_c4)._m0[1].z, _77);
    float _87 = fma(_57, (*spvDescriptorSet0.vp_c4)._m0[0].z, _79);
    float _89 = _83 + (*spvDescriptorSet0.vp_c4)._m0[3].w;
    float _91 = _85 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _93 = _87 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _95 = fma(_57, (*spvDescriptorSet0.vp_c4)._m0[2].z, _81);
    float _97 = abs(_89);
    bool _101 = _97 >= 0.001000000047497451305389404296875;
    bool _103 = isnan(_97);
    bool _105 = _101 || _103;
    bool _107 = isnan(0.001000000047497451305389404296875);
    bool _109 = _105 || _107;
    float _111 = _95 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _113 = _109 ? _89 : 0.001000000047497451305389404296875;
    out.gl_Position.x = _93;
    out.gl_Position.y = _91;
    out.gl_Position.z = _111;
    out.gl_Position.w = _89;
    float _115 = 1.0 / _113;
    float _117 = _91 * _115;
    float _119 = _93 * _115;
    float _121 = -(*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _123 = fma(_117, (*spvDescriptorSet0.vp_c3)._m0[11].y, _121);
    float _125 = fma(_119, 0.5, 0.5);
    float _127 = fma(_117, -0.5, 0.5);
    float _129 = -_119;
    float _131 = -(*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _133 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[11].x, _131);
    float _135 = _123 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _137 = _123 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _139 = _123 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _141 = _123 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _143 = _123 * (*spvDescriptorSet0.vp_c4)._m0[11].y;
    float _145 = fma(_133, (*spvDescriptorSet0.vp_c4)._m0[10].x, _135);
    float _147 = fma(_133, (*spvDescriptorSet0.vp_c4)._m0[7].x, _137);
    float _149 = fma(_133, (*spvDescriptorSet0.vp_c4)._m0[8].x, _139);
    float _151 = fma(_133, (*spvDescriptorSet0.vp_c4)._m0[9].x, _141);
    float _153 = fma(_133, (*spvDescriptorSet0.vp_c4)._m0[11].x, _143);
    float _155 = _149 + (*spvDescriptorSet0.vp_c4)._m0[8].z;
    float _157 = _151 + (*spvDescriptorSet0.vp_c4)._m0[9].z;
    float _159 = _145 + (*spvDescriptorSet0.vp_c4)._m0[10].z;
    float _161 = _153 + (*spvDescriptorSet0.vp_c4)._m0[11].z;
    float _163 = _147 + (*spvDescriptorSet0.vp_c4)._m0[7].z;
    out.m_27.x = _133;
    out.m_27.y = _123;
    out.m_27.z = 1.0;
    out.m_29.x = _125;
    out.m_29.y = _127;
    out.m_31.x = _155;
    out.m_31.y = _157;
    out.m_31.z = _159;
    out.m_31.w = _161;
    out.m_33.w = _163;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

