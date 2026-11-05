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
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
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
    float2 _182 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_182, float2(0.0), isnan(_182))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_182, float2(0.0), isnan(_182))).x;
    float2 _193 = float2(_57, _59);
    float4 _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_193, float2(0.0), isnan(_193))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_193, float2(0.0), isnan(_193))).xyzw;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = _64.z;
    float _72 = _64.w;
    bool _76 = _61 >= 1.0;
    bool _78 = isnan(_61);
    bool _80 = _76 || _78;
    bool _82 = isnan(1.0);
    bool _84 = _80 || _82;
    float _86 = _66;
    float _88 = _68;
    float _90 = _70;
    if (!_84)
    {
        float _92 = _68 * 0.715200006961822509765625;
        float _94 = fma(_66, 0.2125999927520751953125, _92);
        float _96 = fma(_70, 0.072200000286102294921875, _94);
        float _98 = 1.0 / _96;
        float _100 = _98 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _102 = precise::clamp(_100, 0.0, 1.0);
        float _104 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
        float _106 = _68 * _104;
        float _108 = _66 * _104;
        float _110 = _70 * _104;
        float _112 = _106 * 0.715200006961822509765625;
        float _114 = fma(_108, 0.2125999927520751953125, _112);
        float _116 = fma(_110, 0.072200000286102294921875, _114);
        float _118 = 1.0 / _116;
        float _120 = _118 * (*spvDescriptorSet0.fp_c3)._m0[1].z;
        float _122 = precise::clamp(_120, 0.0, 1.0);
        float _124 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].x);
        float _126 = _108 * _124;
        float _128 = _106 * _124;
        float _130 = _110 * _124;
        _86 = _126;
        _88 = _128;
        _90 = _130;
    }
    float _132 = _86;
    float _134 = _88;
    float _136 = _90;
    float _138 = 0.0 + _132;
    float _140 = precise::clamp(_138, 0.0, 1.0);
    float _142 = 0.0 + _134;
    float _144 = precise::clamp(_142, 0.0, 1.0);
    float _146 = 0.0 + _136;
    float _148 = precise::clamp(_146, 0.0, 1.0);
    out.m_34.x = _140;
    out.m_34.y = _144;
    out.m_34.z = _148;
    out.m_34.w = _72;
    return out;
}

