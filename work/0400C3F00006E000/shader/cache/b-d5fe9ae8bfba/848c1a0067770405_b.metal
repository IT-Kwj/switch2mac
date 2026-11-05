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
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    constant _16* fp_c13 [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    texture2d<float> fp_t_tcb_10 [[id(10)]];
    sampler fp_t_tcb_10Smplr [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    sampler fp_t_tcb_10Smplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_62 [[color(0)]];
};

struct main0_in
{
    float4 m_47 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_72 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_55 [[user(locn5)]];
    float4 m_64 [[user(locn6)]];
    float4 m_57 [[user(locn7)]];
    float4 m_45 [[user(locn8)]];
    float4 m_43 [[user(locn9), flat]];
    float4 m_68 [[user(locn10), flat]];
    float4 m_53 [[user(locn11)]];
    float4 m_51 [[user(locn12)]];
    float4 m_70 [[user(locn13)]];
    float4 m_66 [[user(locn14), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _79 = gl_FragCoord.w;
    float _81 = in.m_41.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_41.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = 1.0 / _79;
    float _95 = _93 * _85;
    float _97 = _93 * _91;
    float2 _728 = float2(_95, _97);
    float2 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_728, float2(0.0), isnan(_728))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_728, float2(0.0), isnan(_728))).xy;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = in.m_43.x;
    float _109 = in.m_45.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_45.y;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = _107 * (*spvDescriptorSet0.fp_c9)._m0[191].z;
    float _123 = _93 * _113;
    float _125 = _93 * _119;
    float _127 = fma(_103, _121, _123);
    float _129 = fma(_105, _121, _125);
    float2 _781 = float2(_127, _129);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_781, float2(0.0), isnan(_781))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_781, float2(0.0), isnan(_781))).x;
    float _133 = in.m_47.w;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_49.w;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_51.x;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = _93 * _137;
    float _153 = _93 * _143;
    float _155 = _93 * _149;
    float _157 = in.m_45.z;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = -_151;
    float _165 = _163 + _131;
    float _167 = _153 * _165;
    float _169 = 0.0 + _167;
    float _171 = precise::clamp(_169, 0.0, 1.0);
    float _173 = _171 * _155;
    bool _177 = _173 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _179 = isnan(_173);
    bool _181 = _177 || _179;
    bool _183 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _185 = _181 || _183;
    if (!_185)
    {
        discard_fragment();
    }
    float _187 = _93 * _161;
    float _189 = in.m_53.x;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_45.w;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_53.y;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = fma(_103, _121, _187);
    float _209 = in.m_53.w;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = _93 * _193;
    float _217 = _93 * _199;
    float _219 = _93 * _205;
    float _221 = fma(_105, _121, _217);
    float _223 = _93 * _213;
    float2 _912 = float2(_207, _221);
    float2 _225 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_912, float2(0.0), isnan(_912))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_912, float2(0.0), isnan(_912))).xy;
    float _227 = _225.x;
    float _229 = _225.y;
    float _231 = 1.0 / _223;
    float _233 = _215 * _231;
    float _235 = _219 * _231;
    float2 _932 = float2(_233, _235);
    float _237 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_932, float2(0.0), isnan(_932))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_932, float2(0.0), isnan(_932))).x;
    float _239 = in.m_55.y;
    float _241 = gl_FragCoord.w;
    float _243 = _239 * _241;
    float _245 = in.m_55.x;
    float _247 = gl_FragCoord.w;
    float _249 = _245 * _247;
    float _251 = in.m_55.z;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = in.m_57.y;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = in.m_57.x;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = in.m_59.y;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = in.m_59.x;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = in.m_57.z;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = in.m_59.z;
    float _289 = gl_FragCoord.w;
    float _291 = _287 * _289;
    float _293 = _93 * _243;
    float _295 = _93 * _249;
    float _297 = _93 * _255;
    float _299 = _293 * _293;
    float _301 = _93 * _279;
    float _303 = _93 * _285;
    float _305 = fma(_295, _295, _299);
    float _307 = _93 * _261;
    float _309 = _93 * _291;
    float _311 = fma(_297, _297, _305);
    float _313 = _93 * _267;
    float _315 = _307 * _307;
    float _317 = _93 * _273;
    float _319 = rsqrt(_311);
    float _321 = fma(_313, _313, _315);
    float _323 = _317 * _317;
    float _325 = fma(_303, _303, _321);
    float _327 = fma(_301, _301, _323);
    float _329 = fma(_309, _309, _327);
    float _331 = rsqrt(_325);
    float _333 = _293 * _319;
    float _335 = _295 * _319;
    float _337 = _297 * _319;
    float _339 = rsqrt(_329);
    float _341 = _333 * _333;
    float _343 = fma(_335, _335, _341);
    float _345 = fma(_337, _337, _343);
    float _347 = rsqrt(_345);
    float _349 = _309 * _339;
    float _351 = _229 * _229;
    float _353 = _229 * _339;
    float _355 = _227 * _331;
    float _357 = _229 * _349;
    float _359 = fma(_227, _227, _351);
    float _361 = precise::clamp(_359, 0.0, 1.0);
    float _363 = _317 * _353;
    float _365 = _301 * _353;
    float _367 = fma(_303, _355, _357);
    float _369 = -_361;
    float _371 = _369 + 1.0;
    float _373 = fma(_307, _355, _363);
    float _375 = fma(_313, _355, _365);
    float _377 = in.m_47.x;
    float _379 = gl_FragCoord.w;
    float _381 = _377 * _379;
    float _383 = sqrt(_371);
    float _385 = in.m_49.y;
    float _387 = gl_FragCoord.w;
    float _389 = _385 * _387;
    float _391 = in.m_49.z;
    float _393 = gl_FragCoord.w;
    float _395 = _391 * _393;
    float _397 = _347 * _383;
    float _399 = fma(_333, _397, _373);
    float _401 = fma(_335, _397, _375);
    float _403 = fma(_337, _397, _367);
    float _405 = in.m_47.z;
    float _407 = gl_FragCoord.w;
    float _409 = _405 * _407;
    float _411 = _399 * _399;
    float _413 = in.m_47.y;
    float _415 = gl_FragCoord.w;
    float _417 = _413 * _415;
    float _419 = in.m_49.x;
    float _421 = gl_FragCoord.w;
    float _423 = _419 * _421;
    float _425 = fma(_401, _401, _411);
    float _427 = fma(_403, _403, _425);
    float _429 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _431 = (*spvDescriptorSet0.fp_c9)._m0[191].y + _429;
    float _433 = _93 * _395;
    float _435 = rsqrt(_427);
    float _437 = 1.0 / _431;
    float _439 = _399 * _435;
    float _441 = _403 * _435;
    float _443 = _93 * _381;
    float _445 = _93 * _389;
    float _447 = _439 * (-0.816474258899688720703125);
    float _449 = _93 * _423;
    float _451 = -_447;
    float _453 = fma(_441, 0.577381789684295654296875, _451);
    float _455 = -_443;
    float _457 = _455 + _449;
    float _459 = fma(_453, 0.5, 0.5);
    float _461 = precise::clamp(_459, 0.0, 1.0);
    float _463 = _461 * _461;
    float _465 = precise::max(_463, (*spvDescriptorSet0.fp_c9)._m0[191].x);
    float _467 = precise::min(_465, (*spvDescriptorSet0.fp_c9)._m0[191].y);
    float _469 = _93 * _417;
    float _471 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _473 = _467 + _471;
    float _475 = _93 * _409;
    float _477 = -_469;
    float _479 = _477 + _445;
    float _481 = _473 * _437;
    float _483 = -_475;
    float _485 = _483 + _433;
    float _487 = fma(_481, _457, _443);
    float _489 = fma(_481, _479, _469);
    float _491 = fma(_481, _485, _475);
    float _493 = 0.5;
    if (!_185)
    {
        out.m_62.x = _487;
        out.m_62.y = _489;
        out.m_62.z = _491;
        out.m_62.w = _167;
        return out;
    }
    float _495 = in.m_64.y;
    float _497 = gl_FragCoord.w;
    float _499 = _495 * _497;
    float _501 = in.m_64.x;
    float _503 = gl_FragCoord.w;
    float _505 = _501 * _503;
    float _507 = in.m_66.y;
    float _509 = in.m_66.x;
    float _511 = in.m_64.z;
    float _513 = gl_FragCoord.w;
    float _515 = _511 * _513;
    float _517 = in.m_53.z;
    float _519 = gl_FragCoord.w;
    float _521 = _517 * _519;
    float _523 = in.m_66.z;
    float _525 = in.m_68.x;
    bool _527 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _529 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _531 = fma(_237, (*spvDescriptorSet0.fp_c8)._m0[30].w, _529);
    float _533 = 1.0 / _531;
    float _535 = _93 * _499;
    float _537 = _93 * _505;
    float _539 = -_507;
    float _541 = _535 + _539;
    float _543 = -_509;
    float _545 = _537 + _543;
    float _547 = _93 * _515;
    float _549 = _93 * _521;
    float _551 = _541 * _541;
    float _553 = _525 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _555 = -_523;
    float _557 = _547 + _555;
    float _559 = _549 * _231;
    float _561 = fma(_545, _545, _551);
    float _563 = in.m_70.w;
    float _565 = gl_FragCoord.w;
    float _567 = _563 * _565;
    float _569 = in.m_72.w;
    float _571 = gl_FragCoord.w;
    float _573 = _569 * _571;
    float _575 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _577 = fma(_559, (*spvDescriptorSet0.fp_c8)._m0[30].w, _575);
    float _579 = fma(_557, _557, _561);
    float _581 = in.m_70.z;
    float _583 = gl_FragCoord.w;
    float _585 = _581 * _583;
    float _587 = 1.0 / _577;
    float _589 = -_579;
    float _591 = fma(_553, _553, _589);
    float _593 = _489 * 0.715200006961822509765625;
    float _595 = precise::max(0.0, _591);
    float _597 = fma(_487, 0.2125999927520751953125, _593);
    float _599 = in.m_70.y;
    float _601 = gl_FragCoord.w;
    float _603 = _599 * _601;
    float _605 = fma(_491, 0.072200000286102294921875, _597);
    float _607 = sqrt(_595);
    float _609 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _611 = _587 * _609;
    float _613 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _615 = -_611;
    float _617 = fma(_533, _613, _615);
    float _619 = 1.0 / _605;
    float _621 = _611;
    if (_527)
    {
        float _623 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _625 = _611 + _623;
        _621 = _625;
    }
    float _627 = _621;
    if (_527)
    {
        float _629 = _627 * 8.0;
        float _631 = precise::clamp(_629, 0.0, 1.0);
        _493 = _631;
    }
    float _633 = _493;
    float _635 = _93 * _573;
    float _637 = _607 + _617;
    float _639 = in.m_70.x;
    float _641 = gl_FragCoord.w;
    float _643 = _639 * _641;
    float _645 = -_635;
    float _647 = _637 + _645;
    float _649 = _647 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _651 = _649 * (-1.44269502162933349609375);
    float _653 = _619 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _655 = precise::clamp(_653, 0.0, 1.0);
    float _657 = fma(_655, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _659 = exp2(_651);
    float _661 = _93 * _567;
    float _663 = _657 * _661;
    float _665 = _93 * _643;
    float _667 = -_659;
    float _669 = _667 + 1.0;
    float _671 = precise::clamp(_669, 0.0, 1.0);
    float _673 = fma(_487, _663, _665);
    float _675 = _173 * _671;
    float _677 = precise::clamp(_675, 0.0, 1.0);
    float _679 = _93 * _603;
    float _681 = _93 * _585;
    float _683 = _677;
    if (_527)
    {
        float _685 = _677 * _633;
        _683 = _685;
    }
    float _687 = _683;
    float _689 = fma(_489, _663, _679);
    float _691 = fma(_491, _663, _681);
    float _693 = 0.0 + _687;
    float _695 = precise::clamp(_693, 0.0, 1.0);
    out.m_62.x = _673;
    out.m_62.y = _689;
    out.m_62.z = _691;
    out.m_62.w = _695;
    return out;
}

