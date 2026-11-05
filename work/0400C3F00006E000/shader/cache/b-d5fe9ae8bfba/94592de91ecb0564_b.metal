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
    float4 m_35 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
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
    float2 _200 = float2(_63, _65);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_200, float2(0.0), isnan(_200))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_200, float2(0.0), isnan(_200))).x;
    float _69 = in.m_35.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_33.z;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_33.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = _61 * _73;
    float _89 = -_67;
    float _91 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _93 = 1.0 / _91;
    float _95 = in.m_37.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    bool _103 = _93 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_103)
    {
        discard_fragment();
    }
    float _105 = _61 * _99;
    float _107 = fma(_105, _93, _87);
    float _109 = precise::clamp(_107, 0.0, 1.0);
    if (_103)
    {
        out.m_40.x = 0.0;
        out.m_40.y = 0.0;
        out.m_40.z = 0.0;
        out.m_40.w = 0.0;
        return out;
    }
    bool _111 = _109 != 0.0;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan(0.0);
    bool _119 = _115 || _117;
    float _121 = _61 * _79;
    float _123 = _61 * _85;
    bool _125 = !_119;
    if (!_125)
    {
        float2 _302 = float2(_121, _123);
        float2 _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_302, float2(0.0), isnan(_302))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_302, float2(0.0), isnan(_302))).xy;
        float _131 = _129.x;
        float _133 = _129.y;
        float _135 = (*spvDescriptorSet0.fp_c3)._m0[0].y + (-1.0);
        float _137 = (*spvDescriptorSet0.fp_c3)._m0[1].w * (*spvDescriptorSet0.fp_c3)._m0[1].z;
        float _139 = fma(_109, _135, 1.0);
        float _141 = log2(_139);
        float _143 = _131 + (-0.5);
        float _145 = _133 + (-0.5);
        float _147 = _143 * _137;
        float _149 = _145 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
        float _151 = fma(_109, _147, _63);
        float _153 = precise::clamp(_151, 0.0, 1.0);
        float _155 = fma(_109, _149, _65);
        float _157 = precise::clamp(_155, 0.0, 1.0);
        float2 _352 = float2(_153, _157);
        float3 _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_352, float2(0.0), isnan(_352)), bias(_141)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_352, float2(0.0), isnan(_352)), bias(_141)).xyz;
        float _163 = _161.x;
        float _165 = _161.y;
        float _167 = _161.z;
        out.m_40.x = _163;
        out.m_40.y = _165;
        out.m_40.z = _167;
        out.m_40.w = 1.0;
        return out;
    }
    discard_fragment();
    return out;
}

