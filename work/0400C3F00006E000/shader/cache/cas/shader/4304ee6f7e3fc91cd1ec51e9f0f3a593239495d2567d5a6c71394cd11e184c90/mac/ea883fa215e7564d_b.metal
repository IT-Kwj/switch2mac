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
    constant _16* fp_c10 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_54 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_39 [[user(locn3), flat]];
    float4 m_43 [[user(locn4), flat]];
    float4 m_41 [[user(locn5), flat]];
    float4 m_37 [[user(locn7)]];
    float4 m_52 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_37.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.z;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_39.x;
    float _83 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _85 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _83);
    float _87 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _85);
    float _89 = _87 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _91 = 1.0 / _61;
    float _93 = _91 * _67;
    float _95 = _91 * _73;
    float _97 = _91 * _79;
    float _99 = _93 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _101 = fma(_95, (*spvDescriptorSet0.fp_c8)._m0[2].x, _99);
    float _103 = fma(_97, (*spvDescriptorSet0.fp_c8)._m0[2].z, _101);
    float _105 = _103 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _107 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _109 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _111 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _107);
    float _113 = 1.0 / _105;
    float _115 = _93 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _117 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _109);
    float _119 = _93 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _121 = in.m_41.x;
    float _123 = fma(_95, (*spvDescriptorSet0.fp_c8)._m0[0].x, _115);
    float _125 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _117);
    float _127 = fma(_95, (*spvDescriptorSet0.fp_c8)._m0[1].x, _119);
    float _129 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _111);
    float _131 = fma(_97, (*spvDescriptorSet0.fp_c8)._m0[0].z, _123);
    float _133 = _125 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _135 = fma(_97, (*spvDescriptorSet0.fp_c8)._m0[1].z, _127);
    float _137 = _129 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _139 = in.m_39.y;
    float _141 = _131 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _143 = _135 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _145 = _133 * _113;
    float _147 = -_137;
    float _149 = fma(_143, _145, _147);
    float _151 = -_89;
    float _153 = fma(_141, _145, _151);
    float _155 = _149 * _149;
    float _157 = fma(_153, _153, _155);
    float _159 = sqrt(_157);
    float _161 = -_121;
    float _163 = _161 + 1.0;
    float _165 = _163 * _163;
    float _167 = fma(_165, 0.300000011920928955078125, _81);
    float _169 = fma(_165, 0.300000011920928955078125, _139);
    float _171 = _167 * 0.4000000059604644775390625;
    float _173 = _169 * (-0.0500000007450580596923828125);
    float _175 = _159 * (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _177 = fma(_175, 0.0500000007450580596923828125, _171);
    float _179 = fma(_175, 0.02999999932944774627685546875, _173);
    float2 _825 = float2(0.0, _177);
    float _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_825, float2(0.0), isnan(_825))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_825, float2(0.0), isnan(_825))).w;
    float2 _834 = float2(0.0, _179);
    float _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_834, float2(0.0), isnan(_834))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_834, float2(0.0), isnan(_834))).w;
    float _185 = in.m_43.x;
    float _187 = in.m_45.w;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = in.m_47.x;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = 1.0 / _185;
    float _201 = _91 * _191;
    float _203 = -_201;
    float _205 = _203 + 1.0;
    float _207 = _91 * _197;
    float _209 = _159 * _199;
    float _211 = _149 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _213 = _153 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _215 = _211 * 0.707106769084930419921875;
    float _217 = -_215;
    float _219 = fma(_213, 0.707106769084930419921875, _217);
    float _221 = fma(_213, 0.707106769084930419921875, _215);
    float _223 = _181 + _183;
    float _225 = _223 * 0.5;
    bool _229 = _225 >= _205;
    bool _231 = isnan(_225);
    bool _233 = _229 || _231;
    bool _235 = isnan(_205);
    bool _237 = _233 || _235;
    bool _239 = _209 < 0.949999988079071044921875;
    bool _241 = _239 && _237;
    float _243 = float(_241);
    float _245 = 0.0 + _243;
    float _247 = precise::clamp(_245, 0.0, 1.0);
    float _249 = _247 * _207;
    bool _251 = _249 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _253 = isnan(_249);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _259 = _255 || _257;
    if (!_259)
    {
        discard_fragment();
    }
    float2 _946 = float2(_219, _221);
    float _261 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_946, float2(0.0), isnan(_946))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_946, float2(0.0), isnan(_946))).w;
    float _263 = _225 * _201;
    float _265 = _223 * 0.3499999940395355224609375;
    float _267 = _263 * 5.0;
    float _269 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _271 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _269;
    float _273 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _275 = _273 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _277 = floor(_267);
    float _279 = 1.0 / _271;
    float _281 = 1.0 / _275;
    float _283 = -_261;
    float _285 = _283 + 1.0;
    bool _287 = _265 >= _285;
    bool _289 = isnan(_265);
    bool _291 = _287 || _289;
    bool _293 = isnan(_285);
    bool _295 = _291 || _293;
    float _297 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _299 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _297;
    bool _301 = !_295;
    float _303 = _301 ? 0.0 : 0.25;
    float _305 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _307 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _305;
    float _309 = fma(_277, 0.20000000298023223876953125, _303);
    float _311 = precise::clamp(_309, 0.0, 1.0);
    float _313 = 1.0 / _307;
    float _315 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _317 = _311 + _315;
    bool _319 = _311 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _321 = isnan(_311);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = _317 * _279;
    float _333 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _335 = _311 + _333;
    float _337 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _339 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _337;
    float _341 = fma(_299, _331, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _343 = _335 * _281;
    float _345 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _347 = _311 + _345;
    float _349 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _351 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _349;
    bool _353 = _311 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _355 = isnan(_311);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = fma(_339, _331, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _367 = _347 * _313;
    float _369 = fma(_351, _331, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    bool _371 = _311 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _373 = isnan(_311);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _385 = _383 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _387 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _389 = _387 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _391 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _393 = _391 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    bool _395 = _311 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _397 = isnan(_311);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = -_381;
    float _409 = _407 + 1.0;
    float _411 = -_329;
    float _413 = _411 + 1.0;
    float _415 = fma(_385, _343, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _417 = -_363;
    float _419 = _417 + 1.0;
    float _421 = fma(_389, _343, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _423 = _405 * _409;
    float _425 = _381 * _413;
    float _427 = _329 * _419;
    float _429 = fma(_393, _343, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _431 = _341 * _423;
    float _433 = _369 * _423;
    float _435 = -_405;
    float _437 = _435 + 1.0;
    float _439 = _365 * _423;
    float _441 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _443 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _441;
    float _445 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _447 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _445;
    float _449 = fma(_437, (*spvDescriptorSet0.fp_c9)._m0[107].x, _431);
    float _451 = fma(_437, (*spvDescriptorSet0.fp_c9)._m0[107].y, _433);
    float _453 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _455 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _453;
    float _457 = fma(_437, (*spvDescriptorSet0.fp_c9)._m0[107].z, _439);
    float _459 = fma(_443, _367, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _461 = fma(_447, _367, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _463 = fma(_415, _425, _449);
    float _465 = fma(_421, _425, _451);
    float _467 = fma(_455, _367, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    float _469 = fma(_429, _425, _457);
    float _471 = fma(_459, _427, _463);
    float _473 = fma(_461, _427, _465);
    float _475 = fma(_467, _427, _469);
    float _477 = fma(_363, (*spvDescriptorSet0.fp_c9)._m0[110].x, _471);
    float _479 = fma(_363, (*spvDescriptorSet0.fp_c9)._m0[110].y, _473);
    float _481 = fma(_363, (*spvDescriptorSet0.fp_c9)._m0[110].z, _475);
    if (!_259)
    {
        out.m_50.x = _477;
        out.m_50.y = _479;
        out.m_50.z = _481;
        out.m_50.w = _243;
        return out;
    }
    float _483 = _479 * 0.715200006961822509765625;
    float _485 = in.m_52.w;
    float _487 = gl_FragCoord.w;
    float _489 = _485 * _487;
    float _491 = in.m_52.z;
    float _493 = gl_FragCoord.w;
    float _495 = _491 * _493;
    float _497 = in.m_52.x;
    float _499 = gl_FragCoord.w;
    float _501 = _497 * _499;
    float _503 = fma(_477, 0.2125999927520751953125, _483);
    float _505 = in.m_52.y;
    float _507 = gl_FragCoord.w;
    float _509 = _505 * _507;
    float _511 = fma(_481, 0.072200000286102294921875, _503);
    bool _513 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _515 = 1.0 / _511;
    float _517 = _515 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _519 = precise::clamp(_517, 0.0, 1.0);
    float _521 = _91 * _489;
    float _523 = fma(_519, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _525 = _91 * _495;
    float _527 = _523 * _521;
    float _529 = 0.0 + _249;
    float _531 = precise::clamp(_529, 0.0, 1.0);
    float _533 = _91 * _501;
    float _535 = _91 * _509;
    float _537 = fma(_481, _527, _525);
    float _539 = fma(_477, _527, _533);
    float _541 = fma(_479, _527, _535);
    float _543 = _525;
    if (!_513)
    {
        _543 = _531;
    }
    float _545 = _543;
    bool _547 = !_513;
    float _549 = _545;
    if (!_547)
    {
        float _551 = in.m_54.w;
        float _553 = gl_FragCoord.w;
        float _555 = _551 * _553;
        float _557 = in.m_54.z;
        float _559 = gl_FragCoord.w;
        float _561 = _557 * _559;
        float _563 = _91 * _555;
        float _565 = _91 * _561;
        float _567 = 1.0 / _563;
        float _569 = _565 * _567;
        float _571 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _573 = fma(_569, (*spvDescriptorSet0.fp_c8)._m0[30].w, _571);
        float _575 = 1.0 / _573;
        float _577 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _579 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _581 = fma(_575, _577, _579);
        float _583 = _581 * 8.0;
        float _585 = precise::clamp(_583, 0.0, 1.0);
        float _587 = _531 * _585;
        _549 = _587;
    }
    float _589 = _549;
    float _591 = 0.0 + _589;
    float _593 = precise::clamp(_591, 0.0, 1.0);
    out.m_50.x = _539;
    out.m_50.y = _541;
    out.m_50.z = _537;
    out.m_50.w = _593;
    return out;
}

