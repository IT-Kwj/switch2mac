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
    uint4 m_23 [[attribute(4)]];
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
    int _54 = as_type<int>(_45) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    bool _58 = _54 != 0;
    float _60 = _49 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _62 = _49 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _64 = _49 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _66 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[7].x, _60);
    float _68 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[6].x, _62);
    float _70 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[8].x, _64);
    float _72 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].z, _66);
    int _74 = as_type<int>(_45);
    bool _76 = _58;
    if (!_58)
    {
        float _78 = as_type<float>(in.m_23.y);
        _74 = as_type<int>(_78);
    }
    int _80 = _74;
    bool _82 = false;
    if (_58)
    {
        _82 = false;
    }
    bool _84 = _82;
    float _86 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].z, _68);
    float _88 = _72 * _72;
    float _90 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[8].z, _70);
    float _92 = fma(_86, _86, _88);
    float _94 = fma(_90, _90, _92);
    float _96 = rsqrt(_94);
    int _98 = 0;
    bool _100 = _84;
    if (!_58)
    {
        int _102 = _80 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _104 = _102 != 0;
        _98 = _104 ? (-1) : 0;
    }
    int _106 = _98;
    int _108 = _106;
    if (!_58)
    {
        int _110 = ~_106;
        _100 = _110 != 0;
    }
    bool _112 = _100;
    float _114 = _86 * _96;
    int _116 = _80;
    int _118 = _112 ? (-1) : 0;
    if (_112)
    {
        float _120 = as_type<float>(in.m_23.z);
        _116 = as_type<int>(_120);
    }
    int _122 = _116;
    if (!_112)
    {
        _76 = false;
    }
    bool _124 = _76;
    bool _126 = _124;
    if (_112)
    {
        int _128 = _122 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _130 = _128 != 0;
        _108 = _130 ? (-1) : 0;
    }
    int _132 = _108;
    float _134 = in.m_28.x;
    float _136 = in.m_28.y;
    float _138 = in.m_28.z;
    bool _140 = _132 != 0;
    if (_112)
    {
        int _142 = ~_132;
        _126 = _142 != 0;
    }
    bool _144 = _126;
    int _146 = 0;
    if (_144)
    {
        float _148 = as_type<float>(in.m_23.w);
        _146 = as_type<int>(_148);
    }
    int _150 = _146;
    if (!_144)
    {
        _140 = false;
    }
    bool _152 = _140;
    float _154 = _136 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _156 = _136 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _158 = _136 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _160 = _136 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _162 = fma(_134, (*spvDescriptorSet0.vp_c3)._m0[2].x, _154);
    float _164 = fma(_134, (*spvDescriptorSet0.vp_c3)._m0[3].x, _156);
    float _166 = fma(_134, (*spvDescriptorSet0.vp_c3)._m0[4].x, _158);
    float _168 = fma(_134, (*spvDescriptorSet0.vp_c3)._m0[5].x, _160);
    float _170 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[2].z, _162);
    float _172 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[3].z, _164);
    float _174 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[4].z, _166);
    float _176 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[5].z, _168);
    float _178 = _170 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _180 = _72 * _96;
    float _182 = _172 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    bool _184 = _152;
    if (_144)
    {
        int _186 = _150 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
        bool _188 = _186 != 0;
        _118 = _188 ? (-1) : 0;
    }
    int _190 = _118;
    float _192 = _174 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _194 = _176 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _196 = _90 * _96;
    if (_144)
    {
        int _198 = ~_190;
        _184 = _198 != 0;
    }
    bool _200 = _184;
    out.gl_Position.x = _178;
    out.gl_Position.y = _182;
    out.gl_Position.z = _192;
    out.gl_Position.w = _194;
    out.m_31.x = _114;
    out.m_31.y = _180;
    out.m_31.z = _196;
    if (!_200)
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
    int _54 = as_type<int>(_45) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    bool _58 = _54 != 0;
    float _60 = _49 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _62 = _49 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _64 = _49 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _66 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[7].x, _60);
    float _68 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[6].x, _62);
    float _70 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[8].x, _64);
    float _72 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].z, _66);
    int _74 = as_type<int>(_45);
    bool _76 = _58;
    if (!_58)
    {
        float _78 = as_type<float>(in.m_23.y);
        _74 = as_type<int>(_78);
    }
    int _80 = _74;
    bool _82 = false;
    if (_58)
    {
        _82 = false;
    }
    bool _84 = _82;
    float _86 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].z, _68);
    float _88 = _72 * _72;
    float _90 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[8].z, _70);
    float _92 = fma(_86, _86, _88);
    float _94 = fma(_90, _90, _92);
    float _96 = rsqrt(_94);
    int _98 = 0;
    bool _100 = _84;
    if (!_58)
    {
        int _102 = _80 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _104 = _102 != 0;
        _98 = _104 ? (-1) : 0;
    }
    int _106 = _98;
    int _108 = _106;
    if (!_58)
    {
        int _110 = ~_106;
        _100 = _110 != 0;
    }
    bool _112 = _100;
    float _114 = _86 * _96;
    int _116 = _80;
    int _118 = _112 ? (-1) : 0;
    if (_112)
    {
        float _120 = as_type<float>(in.m_23.z);
        _116 = as_type<int>(_120);
    }
    int _122 = _116;
    if (!_112)
    {
        _76 = false;
    }
    bool _124 = _76;
    bool _126 = _124;
    if (_112)
    {
        int _128 = _122 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _130 = _128 != 0;
        _108 = _130 ? (-1) : 0;
    }
    int _132 = _108;
    float _134 = in.m_28.x;
    float _136 = in.m_28.y;
    float _138 = in.m_28.z;
    bool _140 = _132 != 0;
    if (_112)
    {
        int _142 = ~_132;
        _126 = _142 != 0;
    }
    bool _144 = _126;
    int _146 = 0;
    if (_144)
    {
        float _148 = as_type<float>(in.m_23.w);
        _146 = as_type<int>(_148);
    }
    int _150 = _146;
    if (!_144)
    {
        _140 = false;
    }
    bool _152 = _140;
    float _154 = _136 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _156 = _136 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _158 = _136 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _160 = _136 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _162 = fma(_134, (*spvDescriptorSet0.vp_c3)._m0[2].x, _154);
    float _164 = fma(_134, (*spvDescriptorSet0.vp_c3)._m0[3].x, _156);
    float _166 = fma(_134, (*spvDescriptorSet0.vp_c3)._m0[4].x, _158);
    float _168 = fma(_134, (*spvDescriptorSet0.vp_c3)._m0[5].x, _160);
    float _170 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[2].z, _162);
    float _172 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[3].z, _164);
    float _174 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[4].z, _166);
    float _176 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[5].z, _168);
    float _178 = _170 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _180 = _72 * _96;
    float _182 = _172 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    bool _184 = _152;
    if (_144)
    {
        int _186 = _150 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
        bool _188 = _186 != 0;
        _118 = _188 ? (-1) : 0;
    }
    int _190 = _118;
    float _192 = _174 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _194 = _176 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _196 = _90 * _96;
    if (_144)
    {
        int _198 = ~_190;
        _184 = _198 != 0;
    }
    bool _200 = _184;
    out.gl_Position.x = _178;
    out.gl_Position.y = _182;
    out.gl_Position.z = _192;
    out.gl_Position.w = _194;
    out.m_31.x = _114;
    out.m_31.y = _180;
    out.m_31.z = _196;
    if (!_200)
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
    int _54 = as_type<int>(_45) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    bool _58 = _54 != 0;
    float _60 = _49 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _62 = _49 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _64 = _49 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _66 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[7].x, _60);
    float _68 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[6].x, _62);
    float _70 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[8].x, _64);
    float _72 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].z, _66);
    int _74 = as_type<int>(_45);
    bool _76 = _58;
    if (!_58)
    {
        float _78 = as_type<float>(in.m_23.y);
        _74 = as_type<int>(_78);
    }
    int _80 = _74;
    bool _82 = false;
    if (_58)
    {
        _82 = false;
    }
    bool _84 = _82;
    float _86 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].z, _68);
    float _88 = _72 * _72;
    float _90 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[8].z, _70);
    float _92 = fma(_86, _86, _88);
    float _94 = fma(_90, _90, _92);
    float _96 = rsqrt(_94);
    int _98 = 0;
    bool _100 = _84;
    if (!_58)
    {
        int _102 = _80 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _104 = _102 != 0;
        _98 = _104 ? (-1) : 0;
    }
    int _106 = _98;
    int _108 = _106;
    if (!_58)
    {
        int _110 = ~_106;
        _100 = _110 != 0;
    }
    bool _112 = _100;
    float _114 = _86 * _96;
    int _116 = _80;
    int _118 = _112 ? (-1) : 0;
    if (_112)
    {
        float _120 = as_type<float>(in.m_23.z);
        _116 = as_type<int>(_120);
    }
    int _122 = _116;
    if (!_112)
    {
        _76 = false;
    }
    bool _124 = _76;
    bool _126 = _124;
    if (_112)
    {
        int _128 = _122 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _130 = _128 != 0;
        _108 = _130 ? (-1) : 0;
    }
    int _132 = _108;
    float _134 = in.m_28.x;
    float _136 = in.m_28.y;
    float _138 = in.m_28.z;
    bool _140 = _132 != 0;
    if (_112)
    {
        int _142 = ~_132;
        _126 = _142 != 0;
    }
    bool _144 = _126;
    int _146 = 0;
    if (_144)
    {
        float _148 = as_type<float>(in.m_23.w);
        _146 = as_type<int>(_148);
    }
    int _150 = _146;
    if (!_144)
    {
        _140 = false;
    }
    bool _152 = _140;
    float _154 = _136 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _156 = _136 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _158 = _136 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _160 = _136 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _162 = fma(_134, (*spvDescriptorSet0.vp_c3)._m0[2].x, _154);
    float _164 = fma(_134, (*spvDescriptorSet0.vp_c3)._m0[3].x, _156);
    float _166 = fma(_134, (*spvDescriptorSet0.vp_c3)._m0[4].x, _158);
    float _168 = fma(_134, (*spvDescriptorSet0.vp_c3)._m0[5].x, _160);
    float _170 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[2].z, _162);
    float _172 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[3].z, _164);
    float _174 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[4].z, _166);
    float _176 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[5].z, _168);
    float _178 = _170 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _180 = _72 * _96;
    float _182 = _172 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    bool _184 = _152;
    if (_144)
    {
        int _186 = _150 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
        bool _188 = _186 != 0;
        _118 = _188 ? (-1) : 0;
    }
    int _190 = _118;
    float _192 = _174 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _194 = _176 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _196 = _90 * _96;
    if (_144)
    {
        int _198 = ~_190;
        _184 = _198 != 0;
    }
    bool _200 = _184;
    out.gl_Position.x = _178;
    out.gl_Position.y = _182;
    out.gl_Position.z = _192;
    out.gl_Position.w = _194;
    out.m_31.x = _114;
    out.m_31.y = _180;
    out.m_31.z = _196;
    if (!_200)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

