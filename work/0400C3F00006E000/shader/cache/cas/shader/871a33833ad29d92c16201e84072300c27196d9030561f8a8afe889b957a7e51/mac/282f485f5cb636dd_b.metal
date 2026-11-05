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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_1ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_53 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_42 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_50 [[user(locn5)]];
    float4 m_55 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_57 [[user(locn9)]];
    float4 m_63 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _70 = gl_FragCoord.w;
    float _72 = in.m_42.w;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_42.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_42.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_44.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_44.y;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_44.z;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_44.w;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = 1.0 / _70;
    float _116 = _114 * _76;
    float _118 = _114 * _82;
    float _120 = _114 * _88;
    float _122 = _114 * _94;
    float _124 = _114 * _100;
    float _126 = _114 * _106;
    float _128 = 1.0 / _116;
    float _130 = _114 * _112;
    float _132 = _120 * _128;
    float _134 = _118 * _128;
    float2 _672 = float2(_134, _132);
    float _136 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_672, float2(0.0), isnan(_672))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_672, float2(0.0), isnan(_672))).x;
    float2 _683 = float2(_122, _124);
    float4 _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_683, float2(0.0), isnan(_683))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_683, float2(0.0), isnan(_683))).xyzw;
    float _141 = _139.x;
    float _143 = _139.y;
    float _145 = _139.z;
    float _147 = _139.w;
    float2 _699 = float2(_126, _130);
    float4 _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_699, float2(0.0), isnan(_699))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_699, float2(0.0), isnan(_699))).xyzw;
    float _151 = _149.x;
    float _153 = _149.y;
    float _155 = _149.z;
    float _157 = _149.w;
    float _159 = in.m_42.z;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = in.m_46.w;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = in.m_48.w;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = _114 * _163;
    float _179 = in.m_50.x;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = _177 * _128;
    float _187 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _189 = fma(_185, (*spvDescriptorSet0.fp_c8)._m0[30].w, _187);
    float _191 = _114 * _169;
    float _193 = 1.0 / _189;
    float _195 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _197 = _193 * _195;
    float _199 = in.m_48.y;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = in.m_48.z;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = in.m_46.z;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _219 = fma(_136, (*spvDescriptorSet0.fp_c8)._m0[30].w, _217);
    float _221 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _223 = _147 + _157;
    float _225 = _223 + (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _227 = precise::clamp(_225, 0.0, 1.0);
    float _229 = 1.0 / _219;
    float _231 = -_191;
    float _233 = _231 + _227;
    float _235 = _114 * _175;
    float _237 = _235 * _233;
    float _239 = precise::clamp(_237, 0.0, 1.0);
    float _241 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _243 = -_197;
    float _245 = fma(_229, _241, _243);
    float _247 = _245 * _221;
    float _249 = precise::clamp(_247, 0.0, 1.0);
    float _251 = _114 * _183;
    float _253 = _239 * _249;
    float _255 = _253 * _251;
    bool _259 = _255 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _261 = isnan(_255);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _267 = _263 || _265;
    float _269 = in.m_48.x;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = in.m_46.x;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = in.m_46.y;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = _197;
    if (!_267)
    {
        discard_fragment();
    }
    float _289 = _151 * _151;
    float _291 = _153 * _153;
    float _293 = _155 * _155;
    float _295 = fma(_141, _141, _289);
    float _297 = precise::clamp(_295, 0.0, 1.0);
    float _299 = fma(_143, _143, _291);
    float _301 = precise::clamp(_299, 0.0, 1.0);
    float _303 = fma(_145, _145, _293);
    float _305 = precise::clamp(_303, 0.0, 1.0);
    float _307 = _114 * _203;
    float _309 = _114 * _209;
    float _311 = -_297;
    float _313 = _311 + 1.0;
    float _315 = -_301;
    float _317 = _315 + 1.0;
    float _319 = -_305;
    float _321 = _319 + 1.0;
    float _323 = _307 * _317;
    float _325 = _114 * _273;
    float _327 = _309 * _321;
    float _329 = _114 * _285;
    float _331 = _114 * _215;
    float _333 = _325 * _313;
    float _335 = _114 * _279;
    float _337 = fma(_301, _329, _323);
    float _339 = fma(_305, _331, _327);
    float _341 = fma(_297, _335, _333);
    if (!_267)
    {
        out.m_53.x = _341;
        out.m_53.y = _337;
        out.m_53.z = _339;
        out.m_53.w = _239;
        return out;
    }
    float _343 = in.m_55.y;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = in.m_55.x;
    float _351 = gl_FragCoord.w;
    float _353 = _349 * _351;
    float _355 = in.m_55.z;
    float _357 = gl_FragCoord.w;
    float _359 = _355 * _357;
    float _361 = _114 * _347;
    float _363 = _114 * _353;
    float _365 = _114 * _359;
    float _367 = _361 * _361;
    float _369 = in.m_57.x;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = fma(_363, _363, _367);
    float _377 = fma(_365, _365, _375);
    float _379 = rsqrt(_377);
    float _381 = _363 * _379;
    float _383 = _361 * _379;
    float _385 = _365 * _379;
    float _387 = _114 * _373;
    float _389 = abs(_381);
    float _391 = abs(_383);
    float _393 = precise::max(_389, _391);
    float _395 = abs(_385);
    float _397 = precise::max(_395, _393);
    float _399 = 1.0 / _397;
    float _401 = _383 * _399;
    float _403 = -_399;
    float _405 = _385 * _403;
    float _407 = precise::min(_387, 1.0);
    float _409 = _381 * _399;
    float3 _1075 = float3(_409, _401, _405);
    float3 _413 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1075, float3(0.0), isnan(_1075)), level(_407)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1075, float3(0.0), isnan(_1075)), level(_407)).xyz;
    float _415 = _413.x;
    float _417 = _413.y;
    float _419 = _413.z;
    float _421 = _329 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _423 = in.m_59.x;
    float _425 = gl_FragCoord.w;
    float _427 = _423 * _425;
    float _429 = _335 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _431 = in.m_59.z;
    float _433 = gl_FragCoord.w;
    float _435 = _431 * _433;
    float _437 = _421 * 0.715200006961822509765625;
    float _439 = _331 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _441 = in.m_59.y;
    float _443 = gl_FragCoord.w;
    float _445 = _441 * _443;
    float _447 = in.m_61.z;
    float _449 = gl_FragCoord.w;
    float _451 = _447 * _449;
    float _453 = fma(_429, 0.2125999927520751953125, _437);
    float _455 = in.m_61.x;
    float _457 = gl_FragCoord.w;
    float _459 = _455 * _457;
    float _461 = in.m_61.y;
    float _463 = gl_FragCoord.w;
    float _465 = _461 * _463;
    float _467 = in.m_63.x;
    float _469 = gl_FragCoord.w;
    float _471 = _467 * _469;
    float _473 = fma(_439, 0.072200000286102294921875, _453);
    float _475 = in.m_63.y;
    float _477 = gl_FragCoord.w;
    float _479 = _475 * _477;
    float _481 = in.m_63.z;
    float _483 = gl_FragCoord.w;
    float _485 = _481 * _483;
    float _487 = in.m_63.w;
    float _489 = gl_FragCoord.w;
    float _491 = _487 * _489;
    float _493 = 1.0 / _473;
    bool _495 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _497 = _114 * _427;
    float _499 = _493 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _501 = precise::clamp(_499, 0.0, 1.0);
    if (_495)
    {
        float _503 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _505 = _197 + _503;
        _287 = _505;
    }
    float _507 = _287;
    float _509 = fma(_501, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _511 = _114 * _435;
    float _513 = _114 * _451;
    float _515 = _114 * _459;
    float _517 = _429 * _509;
    float _519 = _421 * _509;
    float _521 = _439 * _509;
    float _523 = _507;
    if (_495)
    {
        float _525 = _507 * 8.0;
        float _527 = precise::clamp(_525, 0.0, 1.0);
        _523 = _527;
    }
    float _529 = _523;
    float _531 = _114 * _471;
    float _533 = _114 * _479;
    float _535 = _114 * _485;
    float _537 = fma(_415, 0.20999999344348907470703125, _497);
    float _539 = _114 * _445;
    float _541 = fma(_419, 0.20999999344348907470703125, _511);
    float _543 = _114 * _465;
    float _545 = _537 + _515;
    float _547 = fma(_417, 0.20999999344348907470703125, _539);
    float _549 = _541 + _513;
    float _551 = 0.0 + _255;
    float _553 = precise::clamp(_551, 0.0, 1.0);
    float _555 = _114 * _491;
    float _557 = _547 + _543;
    float _559 = fma(_341, _545, _517);
    float _561 = fma(_339, _549, _521);
    float _563 = _553;
    if (_495)
    {
        float _565 = _553 * _529;
        _563 = _565;
    }
    float _567 = _563;
    float _569 = fma(_337, _557, _519);
    float _571 = fma(_559, _555, _531);
    float _573 = fma(_561, _555, _535);
    float _575 = 0.0 + _567;
    float _577 = precise::clamp(_575, 0.0, 1.0);
    float _579 = fma(_569, _555, _533);
    out.m_53.x = _571;
    out.m_53.y = _579;
    out.m_53.z = _573;
    out.m_53.w = _577;
    return out;
}

