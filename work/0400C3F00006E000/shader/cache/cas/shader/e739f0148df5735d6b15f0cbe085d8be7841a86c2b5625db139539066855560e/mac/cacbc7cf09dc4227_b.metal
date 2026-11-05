#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float2 _234 = float2(_55, _57);
    float4 _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_234, float2(0.0), isnan(_234))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_234, float2(0.0), isnan(_234))).xyzw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float _68 = _60.w;
    bool _72 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
    bool _74 = isnan(0.0);
    bool _76 = _72 || _74;
    bool _78 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
    bool _80 = _76 || _78;
    float _82 = 0.0;
    if (_80)
    {
        float _84 = _64 * 0.715200006961822509765625;
        _82 = _84;
    }
    float _86 = _82;
    float _88 = _86;
    if (_80)
    {
        float _90 = fma(_62, 0.2125999927520751953125, _86);
        _88 = _90;
    }
    float _92 = _88;
    float _94 = 0.0;
    float _96 = _92;
    if (_80)
    {
        float _98 = fma(_66, 0.072200000286102294921875, _92);
        _94 = _98;
    }
    float _100 = _94;
    if (!_80)
    {
        _96 = (*spvDescriptorSet0.fp_c3)._m0[0].x;
    }
    float _102 = _96;
    float _104 = 0.0;
    float _106 = _102;
    if (_80)
    {
        float _108 = 1.0 / _100;
        _104 = _108;
    }
    float _110 = _104;
    float _112 = _110;
    if (_80)
    {
        float _114 = _110 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _116 = precise::clamp(_114, 0.0, 1.0);
        _112 = _116;
    }
    float _118 = _112;
    if (_80)
    {
        float _120 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
        _106 = _120;
    }
    float _122 = _106;
    float _124 = _62 * _122;
    float _126 = _64 * _122;
    float _128 = _66 * _122;
    float _130 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _124, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _132 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _126, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _134 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _128, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    bool _136 = _124 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _138 = isnan(_124);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _144 = _140 || _142;
    bool _146 = _126 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _148 = isnan(_126);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _154 = _150 || _152;
    float _156 = exp2(_130);
    bool _158 = _128 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _160 = isnan(_128);
    bool _162 = _158 || _160;
    bool _164 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _166 = _162 || _164;
    float _168 = exp2(_132);
    float _170 = exp2(_134);
    float _172 = _124;
    float _174 = _126;
    float _176 = _128;
    if (_144)
    {
        float _178 = -_156;
        float _180 = _178 + 1.0;
        _172 = _180;
    }
    float _182 = _172;
    float _184 = _182 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    if (_154)
    {
        float _186 = -_168;
        float _188 = _186 + 1.0;
        _174 = _188;
    }
    float _190 = _174;
    float _192 = _190 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    if (_166)
    {
        float _194 = -_170;
        float _196 = _194 + 1.0;
        _176 = _196;
    }
    float _198 = _176;
    float _200 = _198 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    out.m_32.x = _184;
    out.m_32.y = _192;
    out.m_32.z = _200;
    out.m_32.w = _68;
    return out;
}

