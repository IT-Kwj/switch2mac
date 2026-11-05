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
    float2 _207 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_207, float2(0.0), isnan(_207))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_207, float2(0.0), isnan(_207))).x;
    float _63 = -_61;
    float _65 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _67 = 1.0 / _65;
    float _69 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _71 = precise::clamp(_69, 0.0, 1.0);
    bool _75 = _67 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _77 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _79 = precise::clamp(_77, 0.0, 1.0);
    bool _81 = !_75;
    float _83 = _81 ? _71 : 0.0;
    float _85 = precise::max(_83, _79);
    bool _87 = _85 != 0.0;
    bool _89 = isnan(_85);
    bool _91 = _87 || _89;
    bool _93 = isnan(0.0);
    bool _95 = _91 || _93;
    float _97 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _99 = precise::clamp(_97, 0.0, 1.0);
    float _101 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _103 = precise::clamp(_101, 0.0, 1.0);
    float _105 = precise::min(_99, _103);
    bool _107 = !_95;
    if (!_107)
    {
        float _109 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _111 = fma(_85, _109, 1.0);
        float _113 = log2(_111);
        float _115 = _113 + (-1.0);
        float2 _308 = float2(_57, _59);
        float3 _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_308, float2(0.0), isnan(_308)), level(_115)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_308, float2(0.0), isnan(_308)), level(_115)).xyz;
        float _121 = _119.x;
        float _123 = _119.y;
        float _125 = _119.z;
        float _127 = _105 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _129 = 0.0 + _113;
        float _131 = precise::clamp(_129, 0.0, 1.0);
        float _133 = _123 * 0.586600005626678466796875;
        float _135 = fma(_121, 0.29890000820159912109375, _133);
        float _137 = fma(_125, 0.1143999993801116943359375, _135);
        float _139 = -_121;
        float _141 = _139 + _137;
        float _143 = -_123;
        float _145 = _143 + _137;
        float _147 = -_125;
        float _149 = _147 + _137;
        float _151 = fma(_127, _141, _121);
        float _153 = fma(_127, _145, _123);
        float _155 = fma(_127, _149, _125);
        float _157 = -_151;
        float _159 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[13].x, _157);
        float _161 = -_153;
        float _163 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[13].y, _161);
        float _165 = -_155;
        float _167 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[13].z, _165);
        float _169 = fma(_105, _159, _151);
        float _171 = fma(_105, _163, _153);
        float _173 = fma(_105, _167, _155);
        out.m_34.x = _169;
        out.m_34.y = _171;
        out.m_34.z = _173;
        out.m_34.w = _131;
        return out;
    }
    discard_fragment();
    return out;
}

