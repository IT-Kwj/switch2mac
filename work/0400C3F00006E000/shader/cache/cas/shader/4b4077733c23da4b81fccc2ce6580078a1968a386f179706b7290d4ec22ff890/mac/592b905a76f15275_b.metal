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
    float2 _225 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_225, float2(0.0), isnan(_225))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_225, float2(0.0), isnan(_225))).x;
    float _65 = in.m_33.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_33.z;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = _57 * _69;
    float _85 = _57 * _75;
    float _87 = _57 * _81;
    float _89 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _91 = precise::clamp(_89, 0.0, 1.0);
    float _93 = precise::max(_91, _87);
    bool _97 = _93 != 0.0;
    bool _99 = isnan(_93);
    bool _101 = _97 || _99;
    bool _103 = isnan(0.0);
    bool _105 = _101 || _103;
    float _107 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _109 = precise::clamp(_107, 0.0, 1.0);
    float _111 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _113 = precise::clamp(_111, 0.0, 1.0);
    float _115 = precise::min(_109, _113);
    bool _117 = !_105;
    if (!_117)
    {
        float _119 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _121 = fma(_93, _119, 1.0);
        float _123 = log2(_121);
        float _125 = _123 + (-1.0);
        float2 _328 = float2(_59, _61);
        float3 _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_328, float2(0.0), isnan(_328)), level(_125)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_328, float2(0.0), isnan(_328)), level(_125)).xyz;
        float _131 = _129.x;
        float _133 = _129.y;
        float _135 = _129.z;
        float _137 = 0.0 + _123;
        float _139 = precise::clamp(_137, 0.0, 1.0);
        float _141 = fma(_85, _139, _83);
        float _143 = 1.0 / _141;
        float _145 = -_131;
        float _147 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[13].x, _145);
        float _149 = -_133;
        float _151 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[13].y, _149);
        float _153 = -_135;
        float _155 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[13].z, _153);
        float _157 = fma(_115, _147, _131);
        float _159 = fma(_115, _151, _133);
        float _161 = fma(_115, _155, _135);
        float _163 = _139 * _157;
        float _165 = _139 * _159;
        float _167 = _139 * _161;
        float _169 = -_163;
        float _171 = _169 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _173 = -_165;
        float _175 = _173 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _177 = -_167;
        float _179 = _177 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _181 = fma(_83, _171, _163);
        float _183 = fma(_83, _175, _165);
        float _185 = fma(_83, _179, _167);
        float _187 = _181 * _143;
        float _189 = _183 * _143;
        float _191 = _185 * _143;
        out.m_36.x = _187;
        out.m_36.y = _189;
        out.m_36.z = _191;
        out.m_36.w = _141;
        return out;
    }
    out.m_36.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_36.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_36.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_36.w = _83;
    return out;
}

