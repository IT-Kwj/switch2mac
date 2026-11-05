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
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_39 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_33 [[user(locn5)]];
    float4 m_37 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_31.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_33.w;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_31.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_33.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _77 = 1.0 / _49;
    float _79 = _77 * _55;
    float _81 = _77 * _61;
    float _83 = _77 * _67;
    float _85 = _77 * _73;
    float _87 = -_81;
    float _89 = _79 + _87;
    float _91 = in.m_33.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = -_85;
    float _99 = _83 + _97;
    float _101 = _89 * _75;
    float _103 = _99 * _75;
    float _105 = _101 * _101;
    float _107 = in.m_33.x;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = fma(_103, _103, _105);
    float _115 = abs(_113);
    float _117 = log2(_115);
    float _119 = _117 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _121 = _77 * _95;
    float _123 = exp2(_119);
    float _125 = _77 * _111;
    float _127 = -_125;
    float _129 = _83 + _127;
    float _131 = _123 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _133 = fma(_101, _131, _79);
    float _135 = fma(_103, _131, _83);
    float _137 = -_121;
    float _139 = _79 + _137;
    float _141 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _143 = -(*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _145 = fma(_129, _143, _135);
    float _147 = -(*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _149 = fma(_139, _147, _133);
    float _151 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _153 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[1].w, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _155 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _157 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _159 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[1].w, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _161 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[1].w, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _163 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[1].w, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float2 _573 = float2(_141, _151);
    float2 _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_573, float2(0.0), isnan(_573))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_573, float2(0.0), isnan(_573))).xw;
    float _169 = _167.x;
    float _171 = _167.y;
    float2 _589 = float2(_157, _155);
    float2 _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_589, float2(0.0), isnan(_589))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_589, float2(0.0), isnan(_589))).xw;
    float _175 = _173.x;
    float _177 = _173.y;
    float2 _601 = float2(_153, _159);
    float2 _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_601, float2(0.0), isnan(_601))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_601, float2(0.0), isnan(_601))).xw;
    float _181 = _179.x;
    float _183 = _179.y;
    float2 _613 = float2(_161, _163);
    float2 _185 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_613, float2(0.0), isnan(_613))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_613, float2(0.0), isnan(_613))).xw;
    float _187 = _185.x;
    float _189 = _185.y;
    float _191 = sqrt(_113);
    float _193 = (*spvDescriptorSet0.fp_c3)._m0[2].y + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _195 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[26].w;
    float _197 = -(*spvDescriptorSet0.fp_c3)._m0[26].z;
    float _199 = _191 + _197;
    float _201 = 1.0 / _193;
    float _203 = _199 * _195;
    float _205 = precise::clamp(_203, 0.0, 1.0);
    float _207 = fma(_205, (*spvDescriptorSet0.fp_c3)._m0[27].x, 1.0);
    float _209 = _207 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _211 = _169 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _213 = _175 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _215 = _177 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _217 = _171 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _219 = fma(_187, (*spvDescriptorSet0.fp_c3)._m0[2].y, _213);
    float _221 = fma(_189, (*spvDescriptorSet0.fp_c3)._m0[2].y, _215);
    float _223 = fma(_181, (*spvDescriptorSet0.fp_c3)._m0[2].y, _211);
    float _225 = fma(_183, (*spvDescriptorSet0.fp_c3)._m0[2].y, _217);
    float _227 = fma(_219, _201, -0.5);
    float _229 = fma(_221, _201, -0.5);
    float _231 = fma(_223, _201, -0.5);
    float _233 = fma(_225, _201, -0.5);
    float _235 = fma(_227, _209, _145);
    float _237 = fma(_229, _209, _149);
    float _239 = fma(_231, _209, _135);
    float _241 = fma(_233, _209, _133);
    float2 _723 = float2(_235, _237);
    float _243 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_723, float2(0.0), isnan(_723))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_723, float2(0.0), isnan(_723))).x;
    float2 _731 = float2(_239, _241);
    float _245 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_731, float2(0.0), isnan(_731))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_731, float2(0.0), isnan(_731))).x;
    float _247 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _249 = in.m_35.x;
    float _251 = gl_FragCoord.w;
    float _253 = _249 * _251;
    float _255 = -(*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _257 = _191 + _255;
    float _259 = _139 * _139;
    float _261 = in.m_37.x;
    float _263 = gl_FragCoord.w;
    float _265 = _261 * _263;
    float _267 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _269 = _191 + _267;
    float _271 = fma(_129, _129, _259);
    float _273 = (*spvDescriptorSet0.fp_c3)._m0[44].w + (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _275 = sqrt(_271);
    float _277 = _257 * _247;
    float _279 = precise::clamp(_277, 0.0, 1.0);
    float _281 = _279 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _283 = 1.0 / _273;
    float _285 = fma((*spvDescriptorSet0.fp_c3)._m0[3].x, -4.0, _281);
    float _287 = _281 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _289 = _285 + (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _291 = -_275;
    float _293 = _291 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _295 = in.m_39.x;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = precise::max(0.0, _293);
    float _303 = _77 * _265;
    float _305 = precise::min(_301, 0.5);
    float _307 = -(*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _309 = _303 + _307;
    float _311 = _305 * _305;
    float _313 = _309 * _283;
    float _315 = precise::clamp(_313, 0.0, 1.0);
    float _317 = _243 + _289;
    float _319 = _77 * _253;
    float _321 = _245 + _287;
    float _323 = _77 * _299;
    float _325 = _319 * _317;
    float _327 = precise::clamp(_325, 0.0, 1.0);
    float _329 = _321 * _319;
    float _331 = precise::clamp(_329, 0.0, 1.0);
    float _333 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _335 = -(*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _337 = _327 + _335;
    float _339 = -(*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _341 = _331 + _339;
    float _343 = precise::max(0.0, _337);
    float _345 = _341 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _347 = precise::clamp(_345, 0.0, 1.0);
    float _349 = precise::min(_343, 0.949999988079071044921875);
    float _351 = _349 * 0.20000000298023223876953125;
    float _353 = _269 * _333;
    float _355 = precise::clamp(_353, 0.0, 1.0);
    float _357 = fma(_351, (*spvDescriptorSet0.fp_c3)._m0[4].y, _347);
    float _359 = _311 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _361 = _357 * _359;
    float _363 = fma(_361, 6.0, _357);
    float _365 = -_315;
    float _367 = _365 + 1.0;
    float _369 = fma(_355, (*spvDescriptorSet0.fp_c3)._m0[8].w, _363);
    float _371 = fma(_367, (*spvDescriptorSet0.fp_c3)._m0[45].x, _369);
    float _373 = _371 + _323;
    float _375 = precise::clamp(_373, 0.0, 1.0);
    out.m_42.x = (*spvDescriptorSet0.fp_c3)._m0[25].y;
    out.m_42.y = (*spvDescriptorSet0.fp_c3)._m0[25].y;
    out.m_42.z = (*spvDescriptorSet0.fp_c3)._m0[25].y;
    out.m_42.w = _375;
    return out;
}

