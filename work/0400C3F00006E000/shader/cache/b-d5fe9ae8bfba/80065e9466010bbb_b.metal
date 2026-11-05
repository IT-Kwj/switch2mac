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
    float2 _195 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_195, float2(0.0), isnan(_195))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_195, float2(0.0), isnan(_195))).x;
    float2 _206 = float2(_59, _61);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_206, float2(0.0), isnan(_206))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_206, float2(0.0), isnan(_206))).x;
    float _67 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _69 = precise::clamp(_67, 0.0, 1.0);
    float _71 = precise::max(_65, _69);
    bool _75 = _71 != 0.0;
    bool _77 = isnan(_71);
    bool _79 = _75 || _77;
    bool _81 = isnan(0.0);
    bool _83 = _79 || _81;
    float _85 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _87 = precise::clamp(_85, 0.0, 1.0);
    float _89 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _91 = precise::clamp(_89, 0.0, 1.0);
    float _93 = precise::min(_87, _91);
    bool _95 = !_83;
    if (!_95)
    {
        float _97 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _99 = fma(_71, _97, 1.0);
        float _101 = log2(_99);
        float _103 = _101 + (-1.0);
        float2 _276 = float2(_59, _61);
        float3 _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_276, float2(0.0), isnan(_276)), level(_103)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_276, float2(0.0), isnan(_276)), level(_103)).xyz;
        float _109 = _107.x;
        float _111 = _107.y;
        float _113 = _107.z;
        float _115 = _93 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _117 = 0.0 + _101;
        float _119 = precise::clamp(_117, 0.0, 1.0);
        float _121 = _111 * 0.586600005626678466796875;
        float _123 = fma(_109, 0.29890000820159912109375, _121);
        float _125 = fma(_113, 0.1143999993801116943359375, _123);
        float _127 = -_109;
        float _129 = _127 + _125;
        float _131 = -_111;
        float _133 = _131 + _125;
        float _135 = -_113;
        float _137 = _135 + _125;
        float _139 = fma(_115, _129, _109);
        float _141 = fma(_115, _133, _111);
        float _143 = fma(_115, _137, _113);
        float _145 = -_139;
        float _147 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[13].x, _145);
        float _149 = -_141;
        float _151 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[13].y, _149);
        float _153 = -_143;
        float _155 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[13].z, _153);
        float _157 = fma(_93, _147, _139);
        float _159 = fma(_93, _151, _141);
        float _161 = fma(_93, _155, _143);
        out.m_36.x = _157;
        out.m_36.y = _159;
        out.m_36.z = _161;
        out.m_36.w = _119;
        return out;
    }
    discard_fragment();
    return out;
}

