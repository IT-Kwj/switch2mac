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
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_33.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_33.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float2 _167 = float2(_63, _65);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_167, float2(0.0), isnan(_167))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_167, float2(0.0), isnan(_167))).x;
    float2 _178 = float2(_63, _65);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_178, float2(0.0), isnan(_178))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_178, float2(0.0), isnan(_178))).x;
    float _71 = in.m_35.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_37.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = _61 * _75;
    float _85 = _61 * _81;
    float _87 = fma(_67, _83, _85);
    float _89 = precise::clamp(_87, 0.0, 1.0);
    bool _93 = _67 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _95 = !_93;
    float _97 = _95 ? _89 : 0.0;
    float _99 = precise::max(_69, _97);
    bool _101 = _99 != 0.0;
    bool _103 = isnan(_99);
    bool _105 = _101 || _103;
    bool _107 = isnan(0.0);
    bool _109 = _105 || _107;
    bool _111 = !_109;
    if (!_111)
    {
        float _113 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _115 = fma(_99, _113, 1.0);
        float _117 = log2(_115);
        float _119 = _117 + (-1.0);
        float2 _254 = float2(_63, _65);
        float3 _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_254, float2(0.0), isnan(_254)), level(_119)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_254, float2(0.0), isnan(_254)), level(_119)).xyz;
        float _125 = _123.x;
        float _127 = _123.y;
        float _129 = _123.z;
        float _131 = 0.0 + _117;
        float _133 = precise::clamp(_131, 0.0, 1.0);
        out.m_40.x = _125;
        out.m_40.y = _127;
        out.m_40.z = _129;
        out.m_40.w = _133;
        return out;
    }
    discard_fragment();
    return out;
}

