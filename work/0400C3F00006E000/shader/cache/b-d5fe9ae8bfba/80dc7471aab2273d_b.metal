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
    float4 m_27 [[user(locn0)]];
    float4 m_29 [[user(locn1)]];
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
    bool _51 = _43 > 0.0;
    bool _53 = _47 > 0.0;
    bool _55 = _43 >= 0.0;
    bool _57 = isnan(_43);
    bool _59 = _55 || _57;
    bool _61 = isnan(0.0);
    bool _63 = _59 || _61;
    bool _65 = _47 >= 0.0;
    bool _67 = isnan(_47);
    bool _69 = _65 || _67;
    bool _71 = isnan(0.0);
    bool _73 = _69 || _71;
    int _76 = _63 ? 0 : 1;
    int _78 = _73 ? 0 : 1;
    int _80 = ~_76;
    int _82 = _80 + 1;
    int _84 = _82 + 1;
    int _86 = ~_78;
    int _88 = _86 + 1;
    int _90 = _88 + 1;
    int _92 = _84;
    int _94 = _90;
    if (!_51)
    {
        int _96 = ~_76;
        int _98 = _96 + 1;
        _92 = _98;
    }
    int _100 = _92;
    float _102 = _45 + (-0.5);
    if (!_53)
    {
        int _104 = ~_78;
        int _106 = _104 + 1;
        _94 = _106;
    }
    int _108 = _94;
    float _110 = float(_100);
    float _112 = float(_108);
    float _114 = abs(_110);
    float _116 = -_114;
    float _118 = _116 + 1.0;
    float _120 = _102 * (*spvDescriptorSet0.vp_c4)._m0[13].x;
    float _122 = abs(_112);
    float _124 = -_122;
    float _126 = _124 + 1.0;
    float _128 = _118 * _126;
    float _130 = fma(_120, _128, _45);
    float _132 = _130 * (*spvDescriptorSet0.vp_c4)._m0[3].y;
    float _134 = _130 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _136 = _130 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _138 = fma(_43, (*spvDescriptorSet0.vp_c4)._m0[3].x, _132);
    float _140 = fma(_43, (*spvDescriptorSet0.vp_c4)._m0[1].x, _134);
    float _142 = fma(_43, (*spvDescriptorSet0.vp_c4)._m0[2].x, _136);
    float _144 = fma(_47, (*spvDescriptorSet0.vp_c4)._m0[3].z, _138);
    float _146 = _144 + (*spvDescriptorSet0.vp_c4)._m0[3].w;
    float _148 = _130 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _150 = abs(_146);
    bool _152 = _150 >= 0.001000000047497451305389404296875;
    bool _154 = isnan(_150);
    bool _156 = _152 || _154;
    bool _158 = isnan(0.001000000047497451305389404296875);
    bool _160 = _156 || _158;
    float _162 = fma(_43, (*spvDescriptorSet0.vp_c4)._m0[0].x, _148);
    float _164 = _160 ? _146 : 0.001000000047497451305389404296875;
    float _166 = fma(_47, (*spvDescriptorSet0.vp_c4)._m0[0].z, _162);
    float _168 = fma(_47, (*spvDescriptorSet0.vp_c4)._m0[1].z, _140);
    float _170 = fma(_47, (*spvDescriptorSet0.vp_c4)._m0[2].z, _142);
    float _172 = _166 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _174 = 1.0 / _164;
    float _176 = _168 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _178 = _170 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    out.gl_Position.x = _172;
    out.gl_Position.y = _176;
    out.gl_Position.z = _178;
    out.gl_Position.w = _146;
    float _180 = _172 * _174;
    float _182 = _176 * _174;
    float _184 = -_180;
    float _186 = -(*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _188 = fma(_184, (*spvDescriptorSet0.vp_c3)._m0[11].x, _186);
    float _190 = -(*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _192 = fma(_182, (*spvDescriptorSet0.vp_c3)._m0[11].y, _190);
    float _194 = fma(_180, 0.5, 0.5);
    float _196 = fma(_182, -0.5, 0.5);
    out.m_27.x = _188;
    out.m_27.y = _192;
    out.m_27.z = 1.0;
    out.m_29.x = _194;
    out.m_29.y = _196;
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
    bool _51 = _43 > 0.0;
    bool _53 = _47 > 0.0;
    bool _55 = _43 >= 0.0;
    bool _57 = isnan(_43);
    bool _59 = _55 || _57;
    bool _61 = isnan(0.0);
    bool _63 = _59 || _61;
    bool _65 = _47 >= 0.0;
    bool _67 = isnan(_47);
    bool _69 = _65 || _67;
    bool _71 = isnan(0.0);
    bool _73 = _69 || _71;
    int _76 = _63 ? 0 : 1;
    int _78 = _73 ? 0 : 1;
    int _80 = ~_76;
    int _82 = _80 + 1;
    int _84 = _82 + 1;
    int _86 = ~_78;
    int _88 = _86 + 1;
    int _90 = _88 + 1;
    int _92 = _84;
    int _94 = _90;
    if (!_51)
    {
        int _96 = ~_76;
        int _98 = _96 + 1;
        _92 = _98;
    }
    int _100 = _92;
    float _102 = _45 + (-0.5);
    if (!_53)
    {
        int _104 = ~_78;
        int _106 = _104 + 1;
        _94 = _106;
    }
    int _108 = _94;
    float _110 = float(_100);
    float _112 = float(_108);
    float _114 = abs(_110);
    float _116 = -_114;
    float _118 = _116 + 1.0;
    float _120 = _102 * (*spvDescriptorSet0.vp_c4)._m0[13].x;
    float _122 = abs(_112);
    float _124 = -_122;
    float _126 = _124 + 1.0;
    float _128 = _118 * _126;
    float _130 = fma(_120, _128, _45);
    float _132 = _130 * (*spvDescriptorSet0.vp_c4)._m0[3].y;
    float _134 = _130 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _136 = _130 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _138 = fma(_43, (*spvDescriptorSet0.vp_c4)._m0[3].x, _132);
    float _140 = fma(_43, (*spvDescriptorSet0.vp_c4)._m0[1].x, _134);
    float _142 = fma(_43, (*spvDescriptorSet0.vp_c4)._m0[2].x, _136);
    float _144 = fma(_47, (*spvDescriptorSet0.vp_c4)._m0[3].z, _138);
    float _146 = _144 + (*spvDescriptorSet0.vp_c4)._m0[3].w;
    float _148 = _130 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _150 = abs(_146);
    bool _152 = _150 >= 0.001000000047497451305389404296875;
    bool _154 = isnan(_150);
    bool _156 = _152 || _154;
    bool _158 = isnan(0.001000000047497451305389404296875);
    bool _160 = _156 || _158;
    float _162 = fma(_43, (*spvDescriptorSet0.vp_c4)._m0[0].x, _148);
    float _164 = _160 ? _146 : 0.001000000047497451305389404296875;
    float _166 = fma(_47, (*spvDescriptorSet0.vp_c4)._m0[0].z, _162);
    float _168 = fma(_47, (*spvDescriptorSet0.vp_c4)._m0[1].z, _140);
    float _170 = fma(_47, (*spvDescriptorSet0.vp_c4)._m0[2].z, _142);
    float _172 = _166 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _174 = 1.0 / _164;
    float _176 = _168 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _178 = _170 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    out.gl_Position.x = _172;
    out.gl_Position.y = _176;
    out.gl_Position.z = _178;
    out.gl_Position.w = _146;
    float _180 = _172 * _174;
    float _182 = _176 * _174;
    float _184 = -_180;
    float _186 = -(*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _188 = fma(_184, (*spvDescriptorSet0.vp_c3)._m0[11].x, _186);
    float _190 = -(*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _192 = fma(_182, (*spvDescriptorSet0.vp_c3)._m0[11].y, _190);
    float _194 = fma(_180, 0.5, 0.5);
    float _196 = fma(_182, -0.5, 0.5);
    out.m_27.x = _188;
    out.m_27.y = _192;
    out.m_27.z = 1.0;
    out.m_29.x = _194;
    out.m_29.y = _196;
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
    bool _51 = _43 > 0.0;
    bool _53 = _47 > 0.0;
    bool _55 = _43 >= 0.0;
    bool _57 = isnan(_43);
    bool _59 = _55 || _57;
    bool _61 = isnan(0.0);
    bool _63 = _59 || _61;
    bool _65 = _47 >= 0.0;
    bool _67 = isnan(_47);
    bool _69 = _65 || _67;
    bool _71 = isnan(0.0);
    bool _73 = _69 || _71;
    int _76 = _63 ? 0 : 1;
    int _78 = _73 ? 0 : 1;
    int _80 = ~_76;
    int _82 = _80 + 1;
    int _84 = _82 + 1;
    int _86 = ~_78;
    int _88 = _86 + 1;
    int _90 = _88 + 1;
    int _92 = _84;
    int _94 = _90;
    if (!_51)
    {
        int _96 = ~_76;
        int _98 = _96 + 1;
        _92 = _98;
    }
    int _100 = _92;
    float _102 = _45 + (-0.5);
    if (!_53)
    {
        int _104 = ~_78;
        int _106 = _104 + 1;
        _94 = _106;
    }
    int _108 = _94;
    float _110 = float(_100);
    float _112 = float(_108);
    float _114 = abs(_110);
    float _116 = -_114;
    float _118 = _116 + 1.0;
    float _120 = _102 * (*spvDescriptorSet0.vp_c4)._m0[13].x;
    float _122 = abs(_112);
    float _124 = -_122;
    float _126 = _124 + 1.0;
    float _128 = _118 * _126;
    float _130 = fma(_120, _128, _45);
    float _132 = _130 * (*spvDescriptorSet0.vp_c4)._m0[3].y;
    float _134 = _130 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _136 = _130 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _138 = fma(_43, (*spvDescriptorSet0.vp_c4)._m0[3].x, _132);
    float _140 = fma(_43, (*spvDescriptorSet0.vp_c4)._m0[1].x, _134);
    float _142 = fma(_43, (*spvDescriptorSet0.vp_c4)._m0[2].x, _136);
    float _144 = fma(_47, (*spvDescriptorSet0.vp_c4)._m0[3].z, _138);
    float _146 = _144 + (*spvDescriptorSet0.vp_c4)._m0[3].w;
    float _148 = _130 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _150 = abs(_146);
    bool _152 = _150 >= 0.001000000047497451305389404296875;
    bool _154 = isnan(_150);
    bool _156 = _152 || _154;
    bool _158 = isnan(0.001000000047497451305389404296875);
    bool _160 = _156 || _158;
    float _162 = fma(_43, (*spvDescriptorSet0.vp_c4)._m0[0].x, _148);
    float _164 = _160 ? _146 : 0.001000000047497451305389404296875;
    float _166 = fma(_47, (*spvDescriptorSet0.vp_c4)._m0[0].z, _162);
    float _168 = fma(_47, (*spvDescriptorSet0.vp_c4)._m0[1].z, _140);
    float _170 = fma(_47, (*spvDescriptorSet0.vp_c4)._m0[2].z, _142);
    float _172 = _166 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _174 = 1.0 / _164;
    float _176 = _168 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _178 = _170 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    out.gl_Position.x = _172;
    out.gl_Position.y = _176;
    out.gl_Position.z = _178;
    out.gl_Position.w = _146;
    float _180 = _172 * _174;
    float _182 = _176 * _174;
    float _184 = -_180;
    float _186 = -(*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _188 = fma(_184, (*spvDescriptorSet0.vp_c3)._m0[11].x, _186);
    float _190 = -(*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _192 = fma(_182, (*spvDescriptorSet0.vp_c3)._m0[11].y, _190);
    float _194 = fma(_180, 0.5, 0.5);
    float _196 = fma(_182, -0.5, 0.5);
    out.m_27.x = _188;
    out.m_27.y = _192;
    out.m_27.z = 1.0;
    out.m_29.x = _194;
    out.m_29.y = _196;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

