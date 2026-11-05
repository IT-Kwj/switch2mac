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
    texture2d<float> fp_t_tcb_C [[id(1)]];
    sampler fp_t_tcb_CSmplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_CSmplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _237 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_237, float2(0.0), isnan(_237))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_237, float2(0.0), isnan(_237))).x;
    float _65 = in.m_33.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_33.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = _57 * _69;
    float _85 = _57 * _75;
    float _87 = _57 * _81;
    float _89 = precise::max(_63, _83);
    bool _93 = _89 != 0.0;
    bool _95 = isnan(_89);
    bool _97 = _93 || _95;
    bool _99 = isnan(0.0);
    bool _101 = _97 || _99;
    bool _103 = !_101;
    if (!_103)
    {
        float _105 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _107 = fma(_89, _105, 1.0);
        float _109 = log2(_107);
        float _111 = _109 + (-1.0);
        float _113 = exp2(_111);
        float _115 = _113 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _117 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _119 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _121 = -_115;
        float _123 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _125 = -_115;
        float _127 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _129 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float _131 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float _133 = -_115;
        float _135 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float2 _359 = float2(_117, _119);
        float3 _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_359, float2(0.0), isnan(_359)), level(_111)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_359, float2(0.0), isnan(_359)), level(_111)).xyz;
        float _141 = _139.x;
        float _143 = _139.y;
        float _145 = _139.z;
        float _147 = -_115;
        float _149 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float2 _381 = float2(_123, _127);
        float3 _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_381, float2(0.0), isnan(_381)), level(_111)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_381, float2(0.0), isnan(_381)), level(_111)).xyz;
        float _153 = _151.x;
        float _155 = _151.y;
        float _157 = _151.z;
        float2 _396 = float2(_129, _131);
        float3 _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_396, float2(0.0), isnan(_396)), level(_111)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_396, float2(0.0), isnan(_396)), level(_111)).xyz;
        float _161 = _159.x;
        float _163 = _159.y;
        float _165 = _159.z;
        float2 _411 = float2(_135, _149);
        float3 _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_411, float2(0.0), isnan(_411)), level(_111)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_411, float2(0.0), isnan(_411)), level(_111)).xyz;
        float _169 = _167.x;
        float _171 = _167.y;
        float _173 = _167.z;
        float _175 = 0.0 + _109;
        float _177 = precise::clamp(_175, 0.0, 1.0);
        float _179 = fma(_87, _177, _85);
        float _181 = _141 + _153;
        float _183 = _143 + _155;
        float _185 = _145 + _157;
        float _187 = _181 + _161;
        float _189 = _183 + _163;
        float _191 = _185 + _165;
        float _193 = _187 + _169;
        float _195 = _189 + _171;
        float _197 = _191 + _173;
        float _199 = _193 * 0.25;
        float _201 = _195 * 0.25;
        float _203 = _197 * 0.25;
        out.m_36.x = _199;
        out.m_36.y = _201;
        out.m_36.z = _203;
        out.m_36.w = _179;
        return out;
    }
    discard_fragment();
    return out;
}

