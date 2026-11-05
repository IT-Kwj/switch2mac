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
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_33.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_33.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _174 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_174, float2(0.0), isnan(_174))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_174, float2(0.0), isnan(_174))).x;
    float2 _185 = float2(_59, _61);
    float4 _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_185, float2(0.0), isnan(_185))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_185, float2(0.0), isnan(_185))).xyzw;
    float _68 = _66.x;
    float _70 = _66.y;
    float _72 = _66.z;
    float _74 = _66.w;
    bool _78 = _63 >= 1.0;
    bool _80 = isnan(_63);
    bool _82 = _78 || _80;
    bool _84 = isnan(1.0);
    bool _86 = _82 || _84;
    if (_86)
    {
        out.m_36.x = _68;
        out.m_36.y = _70;
        out.m_36.z = _72;
        out.m_36.w = _74;
        return out;
    }
    float _88 = _61 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _90 = _59 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float2 _234 = float2(_90, _88);
    float3 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_234, float2(0.0), isnan(_234))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_234, float2(0.0), isnan(_234))).xyz;
    float _96 = _94.x;
    float _98 = _94.y;
    float _100 = _94.z;
    float _102 = _70 * 0.715200006961822509765625;
    float _104 = fma(_68, 0.2125999927520751953125, _102);
    float _106 = fma(_72, 0.072200000286102294921875, _104);
    float _108 = 1.0 / _106;
    float _110 = _108 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _112 = precise::clamp(_110, 0.0, 1.0);
    float _114 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _116 = fma(_70, _114, _98);
    float _118 = fma(_68, _114, _96);
    float _120 = fma(_72, _114, _100);
    float _122 = _116 * 0.715200006961822509765625;
    float _124 = fma(_118, 0.2125999927520751953125, _122);
    float _126 = fma(_120, 0.072200000286102294921875, _124);
    float _128 = 1.0 / _126;
    float _130 = _128 * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _132 = precise::clamp(_130, 0.0, 1.0);
    float _134 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _136 = _118 * _134;
    float _138 = _116 * _134;
    float _140 = _120 * _134;
    out.m_36.x = _136;
    out.m_36.y = _138;
    out.m_36.z = _140;
    out.m_36.w = _74;
    return out;
}

