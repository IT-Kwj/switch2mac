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
    float4 m_31 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_28 [[attribute(0)]];
    float4 m_26 [[attribute(1)]];
    uint4 m_23 [[attribute(3)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = as_type<float>(in.m_23.x);
    float _47 = in.m_26.x;
    float _49 = in.m_26.y;
    float _51 = in.m_26.z;
    int _54 = ~as_type<int>(_45);
    int _56 = _54 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    bool _60 = _56 != 0;
    float _62 = in.m_28.x;
    float _64 = in.m_28.y;
    float _66 = in.m_28.z;
    float _68 = _49 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _70 = _49 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _72 = _49 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _74 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[7].x, _68);
    float _76 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[6].x, _70);
    float _78 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[8].x, _72);
    float _80 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].z, _74);
    int _82 = 0;
    if (!_60)
    {
        float _84 = as_type<float>(in.m_23.y);
        _82 = as_type<int>(_84);
    }
    int _86 = _82;
    float _88 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].z, _76);
    float _90 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[8].z, _78);
    float _92 = _80 * _80;
    bool _94 = false;
    if (_60)
    {
        _94 = false;
    }
    bool _96 = _94;
    float _98 = fma(_88, _88, _92);
    float _100 = fma(_90, _90, _98);
    float _102 = _64 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _104 = _64 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _106 = rsqrt(_100);
    float _108 = _64 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _110 = _64 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _112 = fma(_62, (*spvDescriptorSet0.vp_c3)._m0[2].x, _102);
    float _114 = fma(_62, (*spvDescriptorSet0.vp_c3)._m0[3].x, _104);
    float _116 = fma(_62, (*spvDescriptorSet0.vp_c3)._m0[4].x, _108);
    float _118 = fma(_62, (*spvDescriptorSet0.vp_c3)._m0[5].x, _110);
    float _120 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[2].z, _112);
    float _122 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[3].z, _114);
    int _124 = 0;
    bool _126 = _96;
    if (!_60)
    {
        int _128 = ~_86;
        int _130 = _128 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _132 = _130 != 0;
        _124 = _132 ? (-1) : 0;
    }
    int _134 = _124;
    float _136 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[4].z, _116);
    float _138 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[5].z, _118);
    float _140 = _120 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    if (!_60)
    {
        int _142 = ~_134;
        _126 = _142 != 0;
    }
    bool _144 = _126;
    float _146 = _122 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _148 = _136 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _150 = _80 * _106;
    float _152 = _138 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _154 = _88 * _106;
    float _156 = _90 * _106;
    out.gl_Position.x = _140;
    out.gl_Position.y = _146;
    out.gl_Position.z = _148;
    out.gl_Position.w = _152;
    out.m_31.x = _154;
    out.m_31.y = _150;
    out.m_31.z = _156;
    if (!_144)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.gl_Position.w = -1.0;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = as_type<float>(in.m_23.x);
    float _47 = in.m_26.x;
    float _49 = in.m_26.y;
    float _51 = in.m_26.z;
    int _54 = ~as_type<int>(_45);
    int _56 = _54 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    bool _60 = _56 != 0;
    float _62 = in.m_28.x;
    float _64 = in.m_28.y;
    float _66 = in.m_28.z;
    float _68 = _49 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _70 = _49 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _72 = _49 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _74 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[7].x, _68);
    float _76 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[6].x, _70);
    float _78 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[8].x, _72);
    float _80 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].z, _74);
    int _82 = 0;
    if (!_60)
    {
        float _84 = as_type<float>(in.m_23.y);
        _82 = as_type<int>(_84);
    }
    int _86 = _82;
    float _88 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].z, _76);
    float _90 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[8].z, _78);
    float _92 = _80 * _80;
    bool _94 = false;
    if (_60)
    {
        _94 = false;
    }
    bool _96 = _94;
    float _98 = fma(_88, _88, _92);
    float _100 = fma(_90, _90, _98);
    float _102 = _64 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _104 = _64 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _106 = rsqrt(_100);
    float _108 = _64 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _110 = _64 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _112 = fma(_62, (*spvDescriptorSet0.vp_c3)._m0[2].x, _102);
    float _114 = fma(_62, (*spvDescriptorSet0.vp_c3)._m0[3].x, _104);
    float _116 = fma(_62, (*spvDescriptorSet0.vp_c3)._m0[4].x, _108);
    float _118 = fma(_62, (*spvDescriptorSet0.vp_c3)._m0[5].x, _110);
    float _120 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[2].z, _112);
    float _122 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[3].z, _114);
    int _124 = 0;
    bool _126 = _96;
    if (!_60)
    {
        int _128 = ~_86;
        int _130 = _128 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _132 = _130 != 0;
        _124 = _132 ? (-1) : 0;
    }
    int _134 = _124;
    float _136 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[4].z, _116);
    float _138 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[5].z, _118);
    float _140 = _120 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    if (!_60)
    {
        int _142 = ~_134;
        _126 = _142 != 0;
    }
    bool _144 = _126;
    float _146 = _122 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _148 = _136 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _150 = _80 * _106;
    float _152 = _138 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _154 = _88 * _106;
    float _156 = _90 * _106;
    out.gl_Position.x = _140;
    out.gl_Position.y = _146;
    out.gl_Position.z = _148;
    out.gl_Position.w = _152;
    out.m_31.x = _154;
    out.m_31.y = _150;
    out.m_31.z = _156;
    if (!_144)
    {
        return out;
    }
    out.gl_Position.w = -1.0;
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
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = as_type<float>(in.m_23.x);
    float _47 = in.m_26.x;
    float _49 = in.m_26.y;
    float _51 = in.m_26.z;
    int _54 = ~as_type<int>(_45);
    int _56 = _54 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    bool _60 = _56 != 0;
    float _62 = in.m_28.x;
    float _64 = in.m_28.y;
    float _66 = in.m_28.z;
    float _68 = _49 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _70 = _49 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _72 = _49 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _74 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[7].x, _68);
    float _76 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[6].x, _70);
    float _78 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[8].x, _72);
    float _80 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].z, _74);
    int _82 = 0;
    if (!_60)
    {
        float _84 = as_type<float>(in.m_23.y);
        _82 = as_type<int>(_84);
    }
    int _86 = _82;
    float _88 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].z, _76);
    float _90 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[8].z, _78);
    float _92 = _80 * _80;
    bool _94 = false;
    if (_60)
    {
        _94 = false;
    }
    bool _96 = _94;
    float _98 = fma(_88, _88, _92);
    float _100 = fma(_90, _90, _98);
    float _102 = _64 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _104 = _64 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _106 = rsqrt(_100);
    float _108 = _64 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _110 = _64 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _112 = fma(_62, (*spvDescriptorSet0.vp_c3)._m0[2].x, _102);
    float _114 = fma(_62, (*spvDescriptorSet0.vp_c3)._m0[3].x, _104);
    float _116 = fma(_62, (*spvDescriptorSet0.vp_c3)._m0[4].x, _108);
    float _118 = fma(_62, (*spvDescriptorSet0.vp_c3)._m0[5].x, _110);
    float _120 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[2].z, _112);
    float _122 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[3].z, _114);
    int _124 = 0;
    bool _126 = _96;
    if (!_60)
    {
        int _128 = ~_86;
        int _130 = _128 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _132 = _130 != 0;
        _124 = _132 ? (-1) : 0;
    }
    int _134 = _124;
    float _136 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[4].z, _116);
    float _138 = fma(_66, (*spvDescriptorSet0.vp_c3)._m0[5].z, _118);
    float _140 = _120 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    if (!_60)
    {
        int _142 = ~_134;
        _126 = _142 != 0;
    }
    bool _144 = _126;
    float _146 = _122 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _148 = _136 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _150 = _80 * _106;
    float _152 = _138 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _154 = _88 * _106;
    float _156 = _90 * _106;
    out.gl_Position.x = _140;
    out.gl_Position.y = _146;
    out.gl_Position.z = _148;
    out.gl_Position.w = _152;
    out.m_31.x = _154;
    out.m_31.y = _150;
    out.m_31.z = _156;
    if (!_144)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

