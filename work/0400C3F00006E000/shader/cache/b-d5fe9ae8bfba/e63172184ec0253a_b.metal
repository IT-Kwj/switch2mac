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
    float2 _297 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_297, float2(0.0), isnan(_297))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_297, float2(0.0), isnan(_297))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = (*spvDescriptorSet0.fp_c5)._m0[0].x * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _75 = (*spvDescriptorSet0.fp_c5)._m0[1].x * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _77 = _75 + 9.9999997473787516355514526367188e-05;
    float _79 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _81 = _79 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _83 = _69 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _85 = _69 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _87 = _69 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _89 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[1].x, _83);
    float _91 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[2].x, _85);
    float _93 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[3].x, _87);
    float _95 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[1].z, _89);
    float _97 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[2].z, _91);
    float _99 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[3].z, _93);
    float _101 = abs(_71);
    float _103 = -_101;
    float _105 = _103 + 1.0;
    float _107 = fma(_95, -0.5, 0.5);
    float _109 = _73 + (-0.99989998340606689453125);
    float _111 = fma(_97, -0.5, 0.5);
    float _113 = _107 * _107;
    float _115 = fma(_99, -0.5, 0.5);
    float _117 = _111 * _111;
    float _119 = _105 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _121 = precise::clamp(_119, 0.0, 1.0);
    float _123 = fma(_113, _109, 1.0);
    float _125 = _75 + (-0.99989998340606689453125);
    float _127 = fma(_75, 0.75, 7.4999996286351233720779418945312e-05);
    float _129 = _123 * _123;
    float _131 = (*spvDescriptorSet0.fp_c5)._m0[2].x * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _133 = fma(_117, _125, 1.0);
    float _135 = _115 * _115;
    float _137 = abs(_121);
    float _139 = log2(_137);
    float _141 = _131 + (-0.99989998340606689453125);
    float _143 = _133 * _133;
    float _145 = _73 + 9.9999997473787516355514526367188e-05;
    float _147 = -_127;
    float _149 = _147 + 1.0;
    float _151 = fma(_135, _141, 1.0);
    float _153 = 1.0 / _129;
    float _155 = _151 * _151;
    float _157 = _107 + _111;
    float _159 = fma(_73, 0.75, 7.4999996286351233720779418945312e-05);
    float _161 = fma(_131, 0.75, 7.4999996286351233720779418945312e-05);
    float _163 = _131 + 9.9999997473787516355514526367188e-05;
    float _165 = -_159;
    float _167 = _165 + 1.0;
    float _169 = 1.0 / _155;
    float _171 = -_161;
    float _173 = _171 + 1.0;
    float _175 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _177 = _175 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _179 = _115 + _157;
    float _181 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _183 = _181 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _185 = 1.0 / _143;
    float _187 = _145 * _153;
    float _189 = _187 * _167;
    float _191 = _163 * _169;
    float _193 = fma(_189, _177, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _195 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _197 = _195 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _199 = _191 * _173;
    float _201 = _139 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _203 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _205 = _203 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _207 = fma(_189, _197, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _209 = _77 * _185;
    float _211 = fma(_189, _205, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _213 = _209 * _149;
    float _215 = exp2(_201);
    float _217 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _219 = _217 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _221 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _223 = _221 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _225 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _227 = _225 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _229 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _231 = _229 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _233 = fma(_213, _183, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _235 = fma(_199, _219, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _237 = fma(_213, _227, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _239 = fma(_213, _81, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _241 = fma(_199, _223, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _243 = fma(_199, _231, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _245 = _211 + _237;
    float _247 = _207 + _233;
    float _249 = _193 + _239;
    float _251 = _235 + _245;
    float _253 = _241 + _247;
    float _255 = _243 + _249;
    float _257 = fma(_215, (*spvDescriptorSet0.fp_c4)._m0[0].w, _179);
    float _259 = fma(_215, (*spvDescriptorSet0.fp_c4)._m0[0].x, _251);
    float _261 = fma(_215, (*spvDescriptorSet0.fp_c4)._m0[0].y, _253);
    float _263 = fma(_215, (*spvDescriptorSet0.fp_c4)._m0[0].z, _255);
    out.m_36.x = _259;
    out.m_36.y = _261;
    out.m_36.z = _263;
    out.m_36.w = _257;
    return out;
}

