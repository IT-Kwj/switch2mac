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
    float2 _211 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_211, float2(0.0), isnan(_211))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_211, float2(0.0), isnan(_211))).x;
    float _63 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _65 = precise::clamp(_63, 0.0, 1.0);
    bool _69 = _65 != 0.0;
    bool _71 = isnan(_65);
    bool _73 = _69 || _71;
    bool _75 = isnan(0.0);
    bool _77 = _73 || _75;
    bool _79 = !_77;
    if (!_79)
    {
        float _81 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _83 = fma(_65, _81, 1.0);
        float _85 = log2(_83);
        float _87 = _85 + (-1.0);
        float _89 = exp2(_87);
        float _91 = _89 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _93 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[8].x, _57);
        float _95 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[8].y, _59);
        float _97 = -_91;
        float _99 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[8].x, _57);
        float _101 = -_91;
        float _103 = fma(_101, (*spvDescriptorSet0.fp_c3)._m0[8].y, _59);
        float _105 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[8].z, _57);
        float _107 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[8].w, _59);
        float _109 = -_91;
        float _111 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[8].z, _57);
        float2 _310 = float2(_93, _95);
        float3 _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_310, float2(0.0), isnan(_310)), level(_87)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_310, float2(0.0), isnan(_310)), level(_87)).xyz;
        float _117 = _115.x;
        float _119 = _115.y;
        float _121 = _115.z;
        float _123 = -_91;
        float _125 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[8].w, _59);
        float2 _332 = float2(_99, _103);
        float3 _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_332, float2(0.0), isnan(_332)), level(_87)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_332, float2(0.0), isnan(_332)), level(_87)).xyz;
        float _129 = _127.x;
        float _131 = _127.y;
        float _133 = _127.z;
        float2 _347 = float2(_105, _107);
        float3 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_347, float2(0.0), isnan(_347)), level(_87)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_347, float2(0.0), isnan(_347)), level(_87)).xyz;
        float _137 = _135.x;
        float _139 = _135.y;
        float _141 = _135.z;
        float2 _362 = float2(_111, _125);
        float3 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_362, float2(0.0), isnan(_362)), level(_87)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_362, float2(0.0), isnan(_362)), level(_87)).xyz;
        float _145 = _143.x;
        float _147 = _143.y;
        float _149 = _143.z;
        float _151 = 0.0 + _85;
        float _153 = precise::clamp(_151, 0.0, 1.0);
        float _155 = _117 + _129;
        float _157 = _119 + _131;
        float _159 = _121 + _133;
        float _161 = _155 + _137;
        float _163 = _157 + _139;
        float _165 = _159 + _141;
        float _167 = _161 + _145;
        float _169 = _163 + _147;
        float _171 = _165 + _149;
        float _173 = _167 * 0.25;
        float _175 = _169 * 0.25;
        float _177 = _171 * 0.25;
        out.m_34.x = _173;
        out.m_34.y = _175;
        out.m_34.z = _177;
        out.m_34.w = _153;
        return out;
    }
    discard_fragment();
    return out;
}

