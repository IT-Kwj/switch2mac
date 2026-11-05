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
    constant _16* fp_c4 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0), center_no_perspective]];
    float4 m_37 [[user(locn1), center_no_perspective]];
    float4 m_33 [[user(locn2), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _47 = in.m_33.x;
    float _49 = in.m_33.y;
    float2 _237 = float2(_47, _49);
    float _51 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_237, float2(0.0), isnan(_237))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_237, float2(0.0), isnan(_237))).x;
    float _53 = in.m_35.w;
    float _55 = in.m_35.x;
    float _57 = in.m_35.y;
    float _59 = fma(_51, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _61 = -_59;
    float _63 = fma(_61, _53, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _65 = -_59;
    float _67 = fma(_65, _55, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _69 = -_59;
    float _71 = fma(_69, _57, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _73 = 1.0 / _63;
    float _75 = fma(_67, _73, (*spvDescriptorSet0.fp_c4)._m0[18].x);
    float _77 = fma(_71, _73, (*spvDescriptorSet0.fp_c4)._m0[18].y);
    float _79 = _75 * (*spvDescriptorSet0.fp_c4)._m0[18].z;
    float _81 = _77 * (*spvDescriptorSet0.fp_c4)._m0[18].w;
    float2 _311 = float2(_47, _49);
    float3 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_311, float2(0.0), isnan(_311))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_311, float2(0.0), isnan(_311))).xyz;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float2 _325 = float2(_79, _81);
    float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_325, float2(0.0), isnan(_325))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_325, float2(0.0), isnan(_325))).xyz;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    float _101 = in.m_37.y;
    float _103 = in.m_37.x;
    float _105 = in.m_37.z;
    float _107 = -_63;
    float _109 = fma(_107, (*spvDescriptorSet0.fp_c4)._m0[16].z, (*spvDescriptorSet0.fp_c4)._m0[16].x);
    bool _113 = _109 <= 1.0;
    bool _115 = isnan(_109);
    bool _117 = _113 || _115;
    bool _119 = isnan(1.0);
    bool _121 = _117 || _119;
    float _123 = float(_121);
    float _125 = _109 * _123;
    float _127 = precise::clamp(_125, 0.0, 1.0);
    float _129 = abs(_127);
    float _131 = log2(_129);
    float _133 = -_59;
    float _135 = -(*spvDescriptorSet0.fp_c4)._m0[14].y;
    float _137 = fma(_133, _101, _135);
    float _139 = -_59;
    float _141 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _143 = fma(_139, _103, _141);
    float _145 = -_59;
    float _147 = -(*spvDescriptorSet0.fp_c4)._m0[14].z;
    float _149 = fma(_145, _105, _147);
    float _151 = _137 * _137;
    float _153 = precise::min(_67, _71);
    float _155 = _131 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _157 = precise::max(_67, _71);
    float _159 = fma(_143, _143, _151);
    bool _161 = _153 >= 0.0;
    bool _163 = isnan(_153);
    bool _165 = _161 || _163;
    bool _167 = isnan(0.0);
    bool _169 = _165 || _167;
    float _171 = exp2(_155);
    float _173 = fma(_149, _149, _159);
    bool _175 = _63 >= _157;
    bool _177 = isnan(_63);
    bool _179 = _175 || _177;
    bool _181 = isnan(_157);
    bool _183 = _179 || _181;
    bool _185 = _183 && _169;
    float _187 = float(_185);
    float _189 = rsqrt(_173);
    float _191 = _187 * _171;
    float _193 = fma(_89, 2.0, -1.0);
    float _195 = fma(_87, 2.0, -1.0);
    float _197 = fma(_91, 2.0, -1.0);
    float _199 = _193 * _137;
    float _201 = fma(_195, _143, _199);
    float _203 = _191 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _205 = fma(_197, _149, _201);
    float _207 = -_189;
    float _209 = fma(_207, _205, 0.0);
    float _211 = precise::clamp(_209, 0.0, 1.0);
    float _213 = _95 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _215 = _97 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _217 = _203 * _211;
    float _219 = _99 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _221 = _213 * _217;
    float _223 = _215 * _217;
    float _225 = _219 * _217;
    out.m_40.x = _221;
    out.m_40.y = _223;
    out.m_40.z = _225;
    out.m_40.w = 0.0;
    return out;
}

