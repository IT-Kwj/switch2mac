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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_10 [[id(9)]];
    sampler fp_t_tcb_10Smplr [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_47 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 m_39 [[user(locn6)]];
    float4 m_56 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_39.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_41.w;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_39.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_41.z;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = 1.0 / _63;
    float _91 = _89 * _69;
    float _93 = _89 * _75;
    float _95 = _89 * _81;
    float _97 = _89 * _87;
    float2 _498 = float2(_91, _95);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_498, float2(0.0), isnan(_498))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_498, float2(0.0), isnan(_498))).w;
    float2 _509 = float2(_97, _93);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_509, float2(0.0), isnan(_509))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_509, float2(0.0), isnan(_509))).x;
    float _103 = in.m_43.w;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_41.y;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_41.x;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_43.x;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_43.y;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = _89 * _107;
    float _135 = 1.0 / _133;
    float _137 = _89 * _113;
    float _139 = _89 * _119;
    float _141 = _89 * _131;
    float _143 = -_99;
    float _145 = _143 + _101;
    float _147 = _89 * _125;
    float _149 = fma(_145, 0.699999988079071044921875, _99);
    float _151 = _147 * _135;
    float _153 = fma(_149, 2.0, -1.0);
    float _155 = fma(_153, (*spvDescriptorSet0.fp_c9)._m0[191].y, _137);
    float _157 = fma(_153, (*spvDescriptorSet0.fp_c9)._m0[191].y, _139);
    float _159 = _141 * _135;
    float2 _601 = float2(_157, _155);
    float _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_601, float2(0.0), isnan(_601))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_601, float2(0.0), isnan(_601))).w;
    float2 _609 = float2(_151, _159);
    float _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_609, float2(0.0), isnan(_609))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_609, float2(0.0), isnan(_609))).x;
    float _165 = in.m_45.z;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = in.m_43.z;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = in.m_47.w;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = in.m_45.w;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = in.m_49.w;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = _89 * _169;
    float _197 = _89 * _175;
    float _199 = _195 * 1.66666662693023681640625;
    float _201 = precise::clamp(_199, 0.0, 1.0);
    float _203 = _197 * _135;
    float _205 = fma(_201, -2.0, 3.0);
    float _207 = _201 * _201;
    float _209 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _211 = fma(_203, (*spvDescriptorSet0.fp_c8)._m0[30].w, _209);
    float _213 = _89 * _181;
    float _215 = _89 * _187;
    float _217 = _205 * _207;
    float _219 = in.m_51.x;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = _213 + (-1.0);
    float _227 = 1.0 / _211;
    float _229 = in.m_47.z;
    float _231 = gl_FragCoord.w;
    float _233 = _229 * _231;
    float _235 = _161 * _215;
    float _237 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _239 = fma(_163, (*spvDescriptorSet0.fp_c8)._m0[30].w, _237);
    float _241 = fma(_235, _217, _225);
    float _243 = 1.0 / _239;
    float _245 = _241 * 2.0;
    float _247 = precise::clamp(_245, 0.0, 1.0);
    float _249 = fma(_247, -2.0, 3.0);
    float _251 = _247 * _247;
    float _253 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _255 = _249 * _251;
    float _257 = _215 * _255;
    float _259 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _261 = _227 * _259;
    float _263 = _89 * _193;
    float _265 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _267 = -_261;
    float _269 = fma(_243, _265, _267);
    float _271 = _263 * _257;
    float _273 = _89 * _223;
    float _275 = _269 * _253;
    float _277 = precise::clamp(_275, 0.0, 1.0);
    float _279 = 0.0 + _271;
    float _281 = precise::clamp(_279, 0.0, 1.0);
    float _283 = _281 * _277;
    float _285 = _283 * _273;
    bool _289 = _285 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _291 = isnan(_285);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _297 = _293 || _295;
    float _299 = in.m_49.x;
    float _301 = gl_FragCoord.w;
    float _303 = _299 * _301;
    float _305 = in.m_47.x;
    float _307 = gl_FragCoord.w;
    float _309 = _305 * _307;
    float _311 = in.m_49.y;
    float _313 = gl_FragCoord.w;
    float _315 = _311 * _313;
    float _317 = in.m_47.y;
    float _319 = gl_FragCoord.w;
    float _321 = _317 * _319;
    float _323 = in.m_49.z;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = _261;
    if (!_297)
    {
        discard_fragment();
    }
    float _331 = _89 * _303;
    float _333 = _89 * _309;
    float _335 = _89 * _315;
    float _337 = _89 * _321;
    float _339 = _89 * _327;
    float _341 = _89 * _233;
    float _343 = -_331;
    float _345 = _343 + _333;
    float _347 = -_335;
    float _349 = _347 + _337;
    float _351 = -_339;
    float _353 = _351 + _341;
    float _355 = fma(_99, _345, _331);
    float _357 = fma(_99, _349, _335);
    float _359 = fma(_99, _353, _339);
    if (!_297)
    {
        out.m_54.x = _355;
        out.m_54.y = _357;
        out.m_54.z = _359;
        out.m_54.w = _271;
        return out;
    }
    float _361 = _357 * 0.715200006961822509765625;
    float _363 = in.m_56.w;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = in.m_56.x;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = in.m_56.y;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = fma(_355, 0.2125999927520751953125, _361);
    float _383 = in.m_56.z;
    float _385 = gl_FragCoord.w;
    float _387 = _383 * _385;
    float _389 = fma(_359, 0.072200000286102294921875, _381);
    bool _391 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _393 = 1.0 / _389;
    float _395 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_391)
    {
        float _397 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _399 = _261 + _397;
        _329 = _399;
    }
    float _401 = _329;
    float _403 = _393 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _405 = precise::clamp(_403, 0.0, 1.0);
    float _407 = fma(_405, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _409 = _89 * _367;
    if (_391)
    {
        float _411 = _401 * 8.0;
        float _413 = precise::clamp(_411, 0.0, 1.0);
        _395 = _413;
    }
    float _415 = _395;
    float _417 = _89 * _379;
    float _419 = _407 * _409;
    float _421 = 0.0 + _285;
    float _423 = precise::clamp(_421, 0.0, 1.0);
    float _425 = _89 * _373;
    float _427 = _89 * _387;
    float _429 = fma(_357, _419, _417);
    float _431 = _423;
    if (_391)
    {
        float _433 = _423 * _415;
        _431 = _433;
    }
    float _435 = _431;
    float _437 = fma(_355, _419, _425);
    float _439 = fma(_359, _419, _427);
    float _441 = 0.0 + _435;
    float _443 = precise::clamp(_441, 0.0, 1.0);
    out.m_54.x = _437;
    out.m_54.y = _429;
    out.m_54.z = _439;
    out.m_54.w = _443;
    return out;
}

