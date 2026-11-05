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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_31 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_31.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_31.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _163 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_163, float2(0.0), isnan(_163))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_163, float2(0.0), isnan(_163))).x;
    float _67 = in.m_33.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = -_65;
    float _75 = fma(_73, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _77 = 1.0 / _75;
    float _79 = in.m_35.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    bool _87 = _77 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_87)
    {
        discard_fragment();
    }
    float _89 = _59 * _83;
    float _91 = _59 * _71;
    float _93 = fma(_89, _77, _91);
    float _95 = precise::clamp(_93, 0.0, 1.0);
    if (_87)
    {
        out.m_38.x = 0.0;
        out.m_38.y = 0.0;
        out.m_38.z = 0.0;
        out.m_38.w = 0.0;
        return out;
    }
    bool _97 = _95 != 0.0;
    bool _99 = isnan(_95);
    bool _101 = _97 || _99;
    bool _103 = isnan(0.0);
    bool _105 = _101 || _103;
    bool _107 = !_105;
    if (!_107)
    {
        float _109 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _111 = fma(_95, _109, 1.0);
        float _113 = log2(_111);
        float _115 = _113 + (-1.0);
        float2 _256 = float2(_61, _63);
        float3 _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_256, float2(0.0), isnan(_256)), level(_115)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_256, float2(0.0), isnan(_256)), level(_115)).xyz;
        float _121 = _119.x;
        float _123 = _119.y;
        float _125 = _119.z;
        float _127 = 0.0 + _113;
        float _129 = precise::clamp(_127, 0.0, 1.0);
        out.m_38.x = _121;
        out.m_38.y = _123;
        out.m_38.z = _125;
        out.m_38.w = _129;
        return out;
    }
    discard_fragment();
    return out;
}

