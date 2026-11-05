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
    constant _16* fp_c5 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c3 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
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
    float2 _265 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_265, float2(0.0), isnan(_265))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_265, float2(0.0), isnan(_265))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = (*spvDescriptorSet0.fp_c5)._m0[0].x * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _75 = _73 + (-0.99989998340606689453125);
    float _77 = _69 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _79 = _69 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _81 = (*spvDescriptorSet0.fp_c5)._m0[1].x * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _83 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[1].x, _77);
    float _85 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[2].x, _79);
    float _87 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[1].z, _83);
    float _89 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[2].z, _85);
    float _91 = _81 + (-0.99989998340606689453125);
    float _93 = abs(_71);
    float _95 = -_93;
    float _97 = _95 + 1.0;
    float _99 = fma(_87, -0.5, 0.5);
    float _101 = fma(_89, -0.5, 0.5);
    float _103 = _99 * _99;
    float _105 = fma(_103, _75, 1.0);
    float _107 = _101 * _101;
    float _109 = _105 * _105;
    float _111 = fma(_107, _91, 1.0);
    float _113 = _97 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _115 = precise::clamp(_113, 0.0, 1.0);
    float _117 = _73 + 9.9999997473787516355514526367188e-05;
    float _119 = fma(_81, 0.75, 7.4999996286351233720779418945312e-05);
    float _121 = _111 * _111;
    float _123 = 1.0 / _109;
    float _125 = fma(_73, 0.75, 7.4999996286351233720779418945312e-05);
    float _127 = _81 + 9.9999997473787516355514526367188e-05;
    float _129 = -_119;
    float _131 = _129 + 1.0;
    float _133 = -_125;
    float _135 = _133 + 1.0;
    float _137 = 1.0 / _121;
    float _139 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _141 = _139 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _143 = abs(_115);
    float _145 = log2(_143);
    float _147 = _117 * _123;
    float _149 = _147 * _135;
    float _151 = _127 * _137;
    float _153 = fma(_149, _141, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _155 = precise::clamp(_153, 0.0, 1.0);
    float _157 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _159 = _157 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _161 = _151 * _131;
    float _163 = fma(_149, _159, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _165 = precise::clamp(_163, 0.0, 1.0);
    float _167 = _145 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _169 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _171 = _169 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _173 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _175 = _173 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _177 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _179 = _177 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _181 = exp2(_167);
    float _183 = fma(_149, _171, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _185 = precise::clamp(_183, 0.0, 1.0);
    float _187 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _189 = _187 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _191 = 0.0 + _99;
    float _193 = precise::clamp(_191, 0.0, 1.0);
    float _195 = fma(_161, _175, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _197 = fma(_161, _179, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _199 = fma(_161, _189, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _201 = _101 + _193;
    float _203 = precise::clamp(_201, 0.0, 1.0);
    float _205 = _195 + _185;
    float _207 = precise::clamp(_205, 0.0, 1.0);
    float _209 = _197 + _155;
    float _211 = precise::clamp(_209, 0.0, 1.0);
    float _213 = _199 + _165;
    float _215 = precise::clamp(_213, 0.0, 1.0);
    float _217 = fma(_181, (*spvDescriptorSet0.fp_c4)._m0[0].w, _203);
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = fma(_181, (*spvDescriptorSet0.fp_c4)._m0[0].x, _207);
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = fma(_181, (*spvDescriptorSet0.fp_c4)._m0[0].y, _215);
    float _227 = precise::clamp(_225, 0.0, 1.0);
    float _229 = fma(_181, (*spvDescriptorSet0.fp_c4)._m0[0].z, _211);
    float _231 = precise::clamp(_229, 0.0, 1.0);
    out.m_36.x = _223;
    out.m_36.y = _227;
    out.m_36.z = _231;
    out.m_36.w = _219;
    return out;
}

