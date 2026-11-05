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
    float2 _355 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_355, float2(0.0), isnan(_355))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_355, float2(0.0), isnan(_355))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = (*spvDescriptorSet0.fp_c5)._m0[1].x * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _75 = (*spvDescriptorSet0.fp_c5)._m0[0].x * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _77 = _73 + (-0.99989998340606689453125);
    float _79 = _75 + (-0.99989998340606689453125);
    float _81 = _69 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _83 = _69 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _85 = _69 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _87 = _69 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _89 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[1].x, _81);
    float _91 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[2].x, _83);
    float _93 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[3].x, _85);
    float _95 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[4].x, _87);
    float _97 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[1].z, _89);
    float _99 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[2].z, _91);
    float _101 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[3].z, _93);
    float _103 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[4].z, _95);
    float _105 = fma(_97, -0.5, 0.5);
    float _107 = fma(_99, -0.5, 0.5);
    float _109 = fma(_101, -0.5, 0.5);
    float _111 = fma(_103, -0.5, 0.5);
    float _113 = _105 * _105;
    float _115 = _107 * _107;
    float _117 = _109 * _109;
    float _119 = fma(_113, _79, 1.0);
    float _121 = fma(_115, _77, 1.0);
    float _123 = (*spvDescriptorSet0.fp_c5)._m0[2].x * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _125 = _119 * _119;
    float _127 = _123 + (-0.99989998340606689453125);
    float _129 = _121 * _121;
    float _131 = 1.0 / _125;
    float _133 = (*spvDescriptorSet0.fp_c5)._m0[3].x * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _135 = fma(_117, _127, 1.0);
    float _137 = _111 * _111;
    float _139 = _133 + (-0.99989998340606689453125);
    float _141 = _135 * _135;
    float _143 = 1.0 / _129;
    float _145 = _123 + 9.9999997473787516355514526367188e-05;
    float _147 = fma(_137, _139, 1.0);
    float _149 = _147 * _147;
    float _151 = _105 + _107;
    float _153 = _75 + 9.9999997473787516355514526367188e-05;
    float _155 = _73 + 9.9999997473787516355514526367188e-05;
    float _157 = fma(_75, 0.75, 7.4999996286351233720779418945312e-05);
    float _159 = _151 + _109;
    float _161 = 1.0 / _149;
    float _163 = fma(_123, 0.75, 7.4999996286351233720779418945312e-05);
    float _165 = fma(_73, 0.75, 7.4999996286351233720779418945312e-05);
    float _167 = fma(_133, 0.75, 7.4999996286351233720779418945312e-05);
    float _169 = _155 * _143;
    float _171 = _153 * _131;
    float _173 = _133 + 9.9999997473787516355514526367188e-05;
    float _175 = -_157;
    float _177 = _175 + 1.0;
    float _179 = 1.0 / _141;
    float _181 = -_165;
    float _183 = _181 + 1.0;
    float _185 = -_163;
    float _187 = _185 + 1.0;
    float _189 = _171 * _177;
    float _191 = -_167;
    float _193 = _191 + 1.0;
    float _195 = _169 * _183;
    float _197 = _173 * _161;
    float _199 = _111 + _159;
    float _201 = _197 * _193;
    float _203 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _205 = _203 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _207 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _209 = _207 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _211 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _213 = _211 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _215 = abs(_71);
    float _217 = -_215;
    float _219 = _217 + 1.0;
    float _221 = _145 * _179;
    float _223 = fma(_189, _209, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _225 = fma(_189, _213, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _227 = _219 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = _221 * _187;
    float _233 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _235 = _233 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _237 = fma(_195, _205, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _239 = abs(_229);
    float _241 = log2(_239);
    float _243 = fma(_189, _235, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _245 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _247 = _245 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _249 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _251 = _249 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _253 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _255 = _253 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _257 = fma(_195, _247, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _259 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _261 = _259 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _263 = fma(_231, _251, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _265 = fma(_195, _255, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _267 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _269 = _267 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _271 = fma(_231, _261, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _273 = _223 + _265;
    float _275 = _241 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _277 = _225 + _257;
    float _279 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _281 = _279 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _283 = fma(_231, _269, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _285 = exp2(_275);
    float _287 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _289 = _287 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _291 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _293 = _291 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _295 = _243 + _237;
    float _297 = fma(_201, _281, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _299 = fma(_201, _289, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _301 = fma(_201, _293, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _303 = _273 + _271;
    float _305 = _277 + _263;
    float _307 = _295 + _283;
    float _309 = _299 + _303;
    float _311 = _301 + _305;
    float _313 = _297 + _307;
    float _315 = fma(_285, (*spvDescriptorSet0.fp_c4)._m0[0].w, _199);
    float _317 = fma(_285, (*spvDescriptorSet0.fp_c4)._m0[0].x, _309);
    float _319 = fma(_285, (*spvDescriptorSet0.fp_c4)._m0[0].y, _311);
    float _321 = fma(_285, (*spvDescriptorSet0.fp_c4)._m0[0].z, _313);
    out.m_36.x = _317;
    out.m_36.y = _319;
    out.m_36.z = _321;
    out.m_36.w = _315;
    return out;
}

