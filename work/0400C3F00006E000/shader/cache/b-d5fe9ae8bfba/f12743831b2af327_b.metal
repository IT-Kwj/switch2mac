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
    float2 _195 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_195, float2(0.0), isnan(_195))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_195, float2(0.0), isnan(_195))).x;
    float _63 = -_61;
    float _65 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _67 = 1.0 / _65;
    float _69 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _71 = precise::clamp(_69, 0.0, 1.0);
    float _73 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _75 = precise::clamp(_73, 0.0, 1.0);
    float _77 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _79 = precise::clamp(_77, 0.0, 1.0);
    bool _83 = _71 != 0.0;
    bool _85 = isnan(_71);
    bool _87 = _83 || _85;
    bool _89 = isnan(0.0);
    bool _91 = _87 || _89;
    bool _93 = !_91;
    if (!_93)
    {
        float _95 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _97 = fma(_71, _95, 1.0);
        float _99 = log2(_97);
        float _101 = _99 + (-1.0);
        float2 _273 = float2(_57, _59);
        float3 _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_273, float2(0.0), isnan(_273)), level(_101)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_273, float2(0.0), isnan(_273)), level(_101)).xyz;
        float _107 = _105.x;
        float _109 = _105.y;
        float _111 = _105.z;
        float _113 = precise::min(_75, _79);
        float _115 = 0.0 + _99;
        float _117 = precise::clamp(_115, 0.0, 1.0);
        float _119 = _113 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _121 = _109 * 0.586600005626678466796875;
        float _123 = fma(_107, 0.29890000820159912109375, _121);
        float _125 = fma(_111, 0.1143999993801116943359375, _123);
        float _127 = -_107;
        float _129 = _127 + _125;
        float _131 = -_109;
        float _133 = _131 + _125;
        float _135 = -_111;
        float _137 = _135 + _125;
        float _139 = fma(_119, _129, _107);
        float _141 = fma(_119, _133, _109);
        float _143 = fma(_119, _137, _111);
        float _145 = -_139;
        float _147 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[13].x, _145);
        float _149 = -_141;
        float _151 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[13].y, _149);
        float _153 = -_143;
        float _155 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[13].z, _153);
        float _157 = fma(_113, _147, _139);
        float _159 = fma(_113, _151, _141);
        float _161 = fma(_113, _155, _143);
        out.m_34.x = _157;
        out.m_34.y = _159;
        out.m_34.z = _161;
        out.m_34.w = _117;
        return out;
    }
    discard_fragment();
    return out;
}

