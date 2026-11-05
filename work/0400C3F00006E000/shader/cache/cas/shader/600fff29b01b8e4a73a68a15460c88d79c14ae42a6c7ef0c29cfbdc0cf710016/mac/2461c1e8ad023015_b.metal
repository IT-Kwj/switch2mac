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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_CSmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float _61 = _57 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _63 = _59 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float2 _194 = float2(_57, _59);
    float4 _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_194, float2(0.0), isnan(_194))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_194, float2(0.0), isnan(_194))).xyzw;
    float _68 = _66.x;
    float _70 = _66.y;
    float _72 = _66.z;
    float _74 = _66.w;
    float2 _213 = float2(_61, _63);
    float3 _78 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_213, float2(0.0), isnan(_213))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_213, float2(0.0), isnan(_213))).xyz;
    float _80 = _78.x;
    float _82 = _78.y;
    float _84 = _78.z;
    bool _88 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
    bool _90 = isnan(0.0);
    bool _92 = _88 || _90;
    bool _94 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
    bool _96 = _92 || _94;
    float _98 = _55;
    float _100 = _53;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.fp_c3)._m0[0].x;
    }
    float _102 = _98;
    float _104 = 0.0;
    float _106 = _102;
    if (_96)
    {
        float _108 = _70 * 0.715200006961822509765625;
        _104 = _108;
    }
    float _110 = _104;
    float _112 = _110;
    if (_96)
    {
        float _114 = fma(_68, 0.2125999927520751953125, _110);
        _112 = _114;
    }
    float _116 = _112;
    float _118 = _116;
    if (_96)
    {
        float _120 = fma(_72, 0.072200000286102294921875, _116);
        _100 = _120;
    }
    float _122 = _100;
    float _124 = _122;
    if (_96)
    {
        float _126 = 1.0 / _122;
        _124 = _126;
    }
    float _128 = _124;
    if (_96)
    {
        float _130 = _128 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _132 = precise::clamp(_130, 0.0, 1.0);
        _118 = _132;
    }
    float _134 = _118;
    if (_96)
    {
        float _136 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
        _106 = _136;
    }
    float _138 = _106;
    float _140 = fma(_68, _138, _80);
    float _142 = fma(_70, _138, _82);
    float _144 = fma(_72, _138, _84);
    float _146 = _140 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _148 = _142 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _150 = _144 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    out.m_34.x = _146;
    out.m_34.y = _148;
    out.m_34.z = _150;
    out.m_34.w = _74;
    return out;
}

