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
    int _54 = ~as_type<int>(_45);
    int _56 = _54 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    bool _60 = _56 != 0;
    float _62 = _49 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _64 = _49 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _66 = _49 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _68 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[7].x, _62);
    float _70 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[6].x, _64);
    float _72 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[8].x, _66);
    float _74 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].z, _68);
    int _76 = as_type<int>(_45);
    bool _78 = _60;
    if (!_60)
    {
        float _80 = as_type<float>(in.m_23.y);
        _76 = as_type<int>(_80);
    }
    int _82 = _76;
    bool _84 = false;
    if (_60)
    {
        _84 = false;
    }
    bool _86 = _84;
    float _88 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].z, _70);
    float _90 = _74 * _74;
    float _92 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[8].z, _72);
    float _94 = fma(_88, _88, _90);
    float _96 = fma(_92, _92, _94);
    float _98 = rsqrt(_96);
    int _100 = 0;
    bool _102 = _86;
    if (!_60)
    {
        int _104 = ~_82;
        int _106 = _104 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _108 = _106 != 0;
        _100 = _108 ? (-1) : 0;
    }
    int _110 = _100;
    int _112 = _110;
    if (!_60)
    {
        int _114 = ~_110;
        _102 = _114 != 0;
    }
    bool _116 = _102;
    float _118 = _88 * _98;
    int _120 = _82;
    int _122 = _116 ? (-1) : 0;
    if (_116)
    {
        float _124 = as_type<float>(in.m_23.z);
        _120 = as_type<int>(_124);
    }
    int _126 = _120;
    if (!_116)
    {
        _78 = false;
    }
    bool _128 = _78;
    bool _130 = _128;
    if (_116)
    {
        int _132 = ~_126;
        int _134 = _132 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _136 = _134 != 0;
        _112 = _136 ? (-1) : 0;
    }
    int _138 = _112;
    float _140 = in.m_28.x;
    float _142 = in.m_28.y;
    float _144 = in.m_28.z;
    bool _146 = _138 != 0;
    if (_116)
    {
        int _148 = ~_138;
        _130 = _148 != 0;
    }
    bool _150 = _130;
    int _152 = 0;
    if (_150)
    {
        float _154 = as_type<float>(in.m_23.w);
        _152 = as_type<int>(_154);
    }
    int _156 = _152;
    if (!_150)
    {
        _146 = false;
    }
    bool _158 = _146;
    float _160 = _142 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _162 = _142 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _164 = _142 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _166 = _142 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _168 = fma(_140, (*spvDescriptorSet0.vp_c3)._m0[2].x, _160);
    float _170 = fma(_140, (*spvDescriptorSet0.vp_c3)._m0[3].x, _162);
    float _172 = fma(_140, (*spvDescriptorSet0.vp_c3)._m0[4].x, _164);
    float _174 = fma(_140, (*spvDescriptorSet0.vp_c3)._m0[5].x, _166);
    float _176 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[2].z, _168);
    float _178 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[3].z, _170);
    float _180 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[4].z, _172);
    float _182 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[5].z, _174);
    float _184 = _176 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _186 = _74 * _98;
    float _188 = _178 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    bool _190 = _158;
    if (_150)
    {
        int _192 = ~_156;
        int _194 = _192 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
        bool _196 = _194 != 0;
        _122 = _196 ? (-1) : 0;
    }
    int _198 = _122;
    float _200 = _180 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _202 = _182 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _204 = _92 * _98;
    if (_150)
    {
        int _206 = ~_198;
        _190 = _206 != 0;
    }
    bool _208 = _190;
    out.gl_Position.x = _184;
    out.gl_Position.y = _188;
    out.gl_Position.z = _200;
    out.gl_Position.w = _202;
    out.m_31.x = _118;
    out.m_31.y = _186;
    out.m_31.z = _204;
    if (!_208)
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
    float _62 = _49 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _64 = _49 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _66 = _49 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _68 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[7].x, _62);
    float _70 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[6].x, _64);
    float _72 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[8].x, _66);
    float _74 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].z, _68);
    int _76 = as_type<int>(_45);
    bool _78 = _60;
    if (!_60)
    {
        float _80 = as_type<float>(in.m_23.y);
        _76 = as_type<int>(_80);
    }
    int _82 = _76;
    bool _84 = false;
    if (_60)
    {
        _84 = false;
    }
    bool _86 = _84;
    float _88 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].z, _70);
    float _90 = _74 * _74;
    float _92 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[8].z, _72);
    float _94 = fma(_88, _88, _90);
    float _96 = fma(_92, _92, _94);
    float _98 = rsqrt(_96);
    int _100 = 0;
    bool _102 = _86;
    if (!_60)
    {
        int _104 = ~_82;
        int _106 = _104 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _108 = _106 != 0;
        _100 = _108 ? (-1) : 0;
    }
    int _110 = _100;
    int _112 = _110;
    if (!_60)
    {
        int _114 = ~_110;
        _102 = _114 != 0;
    }
    bool _116 = _102;
    float _118 = _88 * _98;
    int _120 = _82;
    int _122 = _116 ? (-1) : 0;
    if (_116)
    {
        float _124 = as_type<float>(in.m_23.z);
        _120 = as_type<int>(_124);
    }
    int _126 = _120;
    if (!_116)
    {
        _78 = false;
    }
    bool _128 = _78;
    bool _130 = _128;
    if (_116)
    {
        int _132 = ~_126;
        int _134 = _132 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _136 = _134 != 0;
        _112 = _136 ? (-1) : 0;
    }
    int _138 = _112;
    float _140 = in.m_28.x;
    float _142 = in.m_28.y;
    float _144 = in.m_28.z;
    bool _146 = _138 != 0;
    if (_116)
    {
        int _148 = ~_138;
        _130 = _148 != 0;
    }
    bool _150 = _130;
    int _152 = 0;
    if (_150)
    {
        float _154 = as_type<float>(in.m_23.w);
        _152 = as_type<int>(_154);
    }
    int _156 = _152;
    if (!_150)
    {
        _146 = false;
    }
    bool _158 = _146;
    float _160 = _142 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _162 = _142 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _164 = _142 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _166 = _142 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _168 = fma(_140, (*spvDescriptorSet0.vp_c3)._m0[2].x, _160);
    float _170 = fma(_140, (*spvDescriptorSet0.vp_c3)._m0[3].x, _162);
    float _172 = fma(_140, (*spvDescriptorSet0.vp_c3)._m0[4].x, _164);
    float _174 = fma(_140, (*spvDescriptorSet0.vp_c3)._m0[5].x, _166);
    float _176 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[2].z, _168);
    float _178 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[3].z, _170);
    float _180 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[4].z, _172);
    float _182 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[5].z, _174);
    float _184 = _176 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _186 = _74 * _98;
    float _188 = _178 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    bool _190 = _158;
    if (_150)
    {
        int _192 = ~_156;
        int _194 = _192 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
        bool _196 = _194 != 0;
        _122 = _196 ? (-1) : 0;
    }
    int _198 = _122;
    float _200 = _180 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _202 = _182 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _204 = _92 * _98;
    if (_150)
    {
        int _206 = ~_198;
        _190 = _206 != 0;
    }
    bool _208 = _190;
    out.gl_Position.x = _184;
    out.gl_Position.y = _188;
    out.gl_Position.z = _200;
    out.gl_Position.w = _202;
    out.m_31.x = _118;
    out.m_31.y = _186;
    out.m_31.z = _204;
    if (!_208)
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
    float _62 = _49 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _64 = _49 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _66 = _49 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _68 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[7].x, _62);
    float _70 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[6].x, _64);
    float _72 = fma(_47, (*spvDescriptorSet0.vp_c3)._m0[8].x, _66);
    float _74 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].z, _68);
    int _76 = as_type<int>(_45);
    bool _78 = _60;
    if (!_60)
    {
        float _80 = as_type<float>(in.m_23.y);
        _76 = as_type<int>(_80);
    }
    int _82 = _76;
    bool _84 = false;
    if (_60)
    {
        _84 = false;
    }
    bool _86 = _84;
    float _88 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].z, _70);
    float _90 = _74 * _74;
    float _92 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[8].z, _72);
    float _94 = fma(_88, _88, _90);
    float _96 = fma(_92, _92, _94);
    float _98 = rsqrt(_96);
    int _100 = 0;
    bool _102 = _86;
    if (!_60)
    {
        int _104 = ~_82;
        int _106 = _104 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _108 = _106 != 0;
        _100 = _108 ? (-1) : 0;
    }
    int _110 = _100;
    int _112 = _110;
    if (!_60)
    {
        int _114 = ~_110;
        _102 = _114 != 0;
    }
    bool _116 = _102;
    float _118 = _88 * _98;
    int _120 = _82;
    int _122 = _116 ? (-1) : 0;
    if (_116)
    {
        float _124 = as_type<float>(in.m_23.z);
        _120 = as_type<int>(_124);
    }
    int _126 = _120;
    if (!_116)
    {
        _78 = false;
    }
    bool _128 = _78;
    bool _130 = _128;
    if (_116)
    {
        int _132 = ~_126;
        int _134 = _132 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[11].x);
        bool _136 = _134 != 0;
        _112 = _136 ? (-1) : 0;
    }
    int _138 = _112;
    float _140 = in.m_28.x;
    float _142 = in.m_28.y;
    float _144 = in.m_28.z;
    bool _146 = _138 != 0;
    if (_116)
    {
        int _148 = ~_138;
        _130 = _148 != 0;
    }
    bool _150 = _130;
    int _152 = 0;
    if (_150)
    {
        float _154 = as_type<float>(in.m_23.w);
        _152 = as_type<int>(_154);
    }
    int _156 = _152;
    if (!_150)
    {
        _146 = false;
    }
    bool _158 = _146;
    float _160 = _142 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _162 = _142 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _164 = _142 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _166 = _142 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _168 = fma(_140, (*spvDescriptorSet0.vp_c3)._m0[2].x, _160);
    float _170 = fma(_140, (*spvDescriptorSet0.vp_c3)._m0[3].x, _162);
    float _172 = fma(_140, (*spvDescriptorSet0.vp_c3)._m0[4].x, _164);
    float _174 = fma(_140, (*spvDescriptorSet0.vp_c3)._m0[5].x, _166);
    float _176 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[2].z, _168);
    float _178 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[3].z, _170);
    float _180 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[4].z, _172);
    float _182 = fma(_144, (*spvDescriptorSet0.vp_c3)._m0[5].z, _174);
    float _184 = _176 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _186 = _74 * _98;
    float _188 = _178 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    bool _190 = _158;
    if (_150)
    {
        int _192 = ~_156;
        int _194 = _192 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[12].x);
        bool _196 = _194 != 0;
        _122 = _196 ? (-1) : 0;
    }
    int _198 = _122;
    float _200 = _180 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _202 = _182 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _204 = _92 * _98;
    if (_150)
    {
        int _206 = ~_198;
        _190 = _206 != 0;
    }
    bool _208 = _190;
    out.gl_Position.x = _184;
    out.gl_Position.y = _188;
    out.gl_Position.z = _200;
    out.gl_Position.w = _202;
    out.m_31.x = _118;
    out.m_31.y = _186;
    out.m_31.z = _204;
    if (!_208)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

