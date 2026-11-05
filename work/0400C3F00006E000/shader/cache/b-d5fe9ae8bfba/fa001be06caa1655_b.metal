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
    constant _16* fp_c13 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    texture2d<float> fp_t_tcb_10 [[id(10)]];
    sampler fp_t_tcb_10Smplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    sampler fp_t_tcb_10Smplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_60 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_43 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_62 [[user(locn5)]];
    float4 m_55 [[user(locn6)]];
    float4 m_41 [[user(locn8)]];
    float4 m_68 [[user(locn9)]];
    float4 m_66 [[user(locn10), flat]];
    float4 m_51 [[user(locn11)]];
    float4 m_49 [[user(locn12)]];
    float4 m_70 [[user(locn13)]];
    float4 m_64 [[user(locn14), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _77 = gl_FragCoord.w;
    float _79 = in.m_41.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_41.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_43.x;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_43.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = 1.0 / _77;
    float _105 = _103 * _83;
    float _107 = _103 * _89;
    float _109 = _103 * _95;
    float _111 = _103 * _101;
    float2 _748 = float2(_105, _107);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_748, float2(0.0), isnan(_748))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_748, float2(0.0), isnan(_748))).w;
    float2 _759 = float2(_109, _111);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_759, float2(0.0), isnan(_759))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_759, float2(0.0), isnan(_759))).w;
    float _117 = in.m_45.w;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_47.w;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_49.x;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = _103 * _121;
    float _137 = _103 * _127;
    float _139 = in.m_41.w;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = _103 * _143;
    float _147 = in.m_51.w;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = -_135;
    float _155 = fma(_113, _115, _153);
    float _157 = _155 * _137;
    float _159 = _103 * _133;
    float _161 = 0.0 + _157;
    float _163 = precise::clamp(_161, 0.0, 1.0);
    float _165 = _163 * _159;
    bool _169 = _165 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _171 = isnan(_165);
    bool _173 = _169 || _171;
    bool _175 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _177 = _173 || _175;
    float _179 = in.m_41.z;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    if (!_177)
    {
        discard_fragment();
    }
    float _185 = in.m_51.x;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = in.m_51.y;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = _103 * _151;
    float _199 = 1.0 / _197;
    float _201 = _103 * _183;
    float2 _882 = float2(_201, _145);
    float2 _205 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_882, float2(0.0), isnan(_882))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_882, float2(0.0), isnan(_882))).xy;
    float _207 = _205.x;
    float _209 = _205.y;
    float _211 = _103 * _189;
    float _213 = _103 * _195;
    float _215 = _211 * _199;
    float _217 = _213 * _199;
    float2 _906 = float2(_215, _217);
    float _219 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_906, float2(0.0), isnan(_906))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_906, float2(0.0), isnan(_906))).x;
    float _221 = in.m_53.y;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = in.m_53.x;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = in.m_53.z;
    float _235 = gl_FragCoord.w;
    float _237 = _233 * _235;
    float _239 = in.m_45.x;
    float _241 = gl_FragCoord.w;
    float _243 = _239 * _241;
    float _245 = in.m_47.x;
    float _247 = gl_FragCoord.w;
    float _249 = _245 * _247;
    float _251 = in.m_55.y;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = in.m_55.z;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = in.m_55.x;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = in.m_57.y;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = in.m_57.z;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = in.m_47.y;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = in.m_57.x;
    float _289 = gl_FragCoord.w;
    float _291 = _287 * _289;
    float _293 = in.m_45.y;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = _103 * _225;
    float _301 = _103 * _231;
    float _303 = _103 * _237;
    float _305 = _299 * _299;
    float _307 = in.m_45.z;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = _103 * _267;
    float _315 = fma(_301, _301, _305);
    float _317 = _103 * _243;
    float _319 = _103 * _249;
    float _321 = _103 * _255;
    float _323 = fma(_303, _303, _315);
    float _325 = _103 * _273;
    float _327 = in.m_47.z;
    float _329 = gl_FragCoord.w;
    float _331 = _327 * _329;
    float _333 = -_319;
    float _335 = _317 + _333;
    float _337 = _103 * _279;
    float _339 = _103 * _285;
    float _341 = rsqrt(_323);
    float _343 = fma(_115, _335, _319);
    float _345 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _347 = (*spvDescriptorSet0.fp_c9)._m0[191].y + _345;
    float _349 = _103 * _261;
    float _351 = _321 * _321;
    float _353 = _103 * _291;
    float _355 = _325 * _325;
    float _357 = _103 * _297;
    float _359 = fma(_313, _313, _351);
    float _361 = 1.0 / _347;
    float _363 = fma(_353, _353, _355);
    float _365 = -_339;
    float _367 = _357 + _365;
    float _369 = fma(_349, _349, _359);
    float _371 = fma(_337, _337, _363);
    float _373 = _299 * _341;
    float _375 = rsqrt(_369);
    float _377 = _301 * _341;
    float _379 = _103 * _311;
    float _381 = _303 * _341;
    float _383 = -_115;
    float _385 = _383 + 1.0;
    float _387 = _373 * _373;
    float _389 = rsqrt(_371);
    float _391 = precise::max(_385, (*spvDescriptorSet0.fp_c9)._m0[191].x);
    float _393 = fma(_377, _377, _387);
    float _395 = _103 * _331;
    float _397 = precise::min(_391, (*spvDescriptorSet0.fp_c9)._m0[191].y);
    float _399 = fma(_381, _381, _393);
    float _401 = -_395;
    float _403 = _379 + _401;
    float _405 = fma(_115, _367, _339);
    float _407 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _409 = _397 + _407;
    float _411 = fma(_115, _403, _395);
    float _413 = rsqrt(_399);
    float _415 = _409 * _361;
    float _417 = _337 * _389;
    float _419 = _209 * _209;
    float _421 = _207 * _375;
    float _423 = _209 * _389;
    float _425 = fma(_207, _207, _419);
    float _427 = precise::clamp(_425, 0.0, 1.0);
    float _429 = -_427;
    float _431 = _429 + 1.0;
    float _433 = sqrt(_431);
    if (!_177)
    {
        out.m_60.x = 0.0;
        out.m_60.y = 0.0;
        out.m_60.z = 0.0;
        out.m_60.w = _157;
        return out;
    }
    float _435 = in.m_62.y;
    float _437 = gl_FragCoord.w;
    float _439 = _435 * _437;
    float _441 = _325 * _423;
    float _443 = in.m_62.x;
    float _445 = gl_FragCoord.w;
    float _447 = _443 * _445;
    float _449 = in.m_64.y;
    float _451 = _353 * _423;
    float _453 = fma(_321, _421, _441);
    float _455 = _413 * _433;
    float _457 = in.m_62.z;
    float _459 = gl_FragCoord.w;
    float _461 = _457 * _459;
    float _463 = in.m_64.x;
    float _465 = _209 * _417;
    float _467 = in.m_64.z;
    float _469 = in.m_51.z;
    float _471 = gl_FragCoord.w;
    float _473 = _469 * _471;
    float _475 = fma(_313, _421, _451);
    float _477 = fma(_373, _455, _453);
    float _479 = fma(_349, _421, _465);
    float _481 = in.m_66.x;
    float _483 = fma(_377, _455, _475);
    float _485 = _477 * _477;
    float _487 = fma(_381, _455, _479);
    float _489 = fma(_483, _483, _485);
    float _491 = in.m_68.y;
    float _493 = gl_FragCoord.w;
    float _495 = _491 * _493;
    float _497 = fma(_487, _487, _489);
    float _499 = rsqrt(_497);
    float _501 = _103 * _439;
    float _503 = _103 * _447;
    float _505 = -_449;
    float _507 = _501 + _505;
    float _509 = _103 * _461;
    float _511 = -_463;
    float _513 = _503 + _511;
    float _515 = _507 * _507;
    float _517 = _103 * _473;
    float _519 = -_467;
    float _521 = _509 + _519;
    float _523 = fma(_513, _513, _515);
    float _525 = _517 * _199;
    float _527 = _481 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _529 = in.m_70.w;
    float _531 = gl_FragCoord.w;
    float _533 = _529 * _531;
    float _535 = fma(_521, _521, _523);
    float _537 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _539 = fma(_525, (*spvDescriptorSet0.fp_c8)._m0[30].w, _537);
    float _541 = _477 * _499;
    float _543 = _487 * _499;
    float _545 = -_535;
    float _547 = fma(_527, _527, _545);
    float _549 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _551 = fma(_219, (*spvDescriptorSet0.fp_c8)._m0[30].w, _549);
    float _553 = _541 * (-0.816474258899688720703125);
    float _555 = 1.0 / _539;
    float _557 = in.m_68.w;
    float _559 = gl_FragCoord.w;
    float _561 = _557 * _559;
    float _563 = precise::max(0.0, _547);
    float _565 = -_553;
    float _567 = fma(_543, 0.577381789684295654296875, _565);
    float _569 = -(*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _571 = _569 + (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _573 = in.m_68.z;
    float _575 = gl_FragCoord.w;
    float _577 = _573 * _575;
    bool _579 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _581 = 1.0 / _551;
    float _583 = fma(_567, 0.5, 0.5);
    float _585 = precise::clamp(_583, 0.0, 1.0);
    float _587 = _585 * _585;
    float _589 = sqrt(_563);
    float _591 = fma(_587, _571, (*spvDescriptorSet0.fp_c9)._m0[194].z);
    float _593 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _595 = _555 * _593;
    float _597 = _415 * _591;
    float _599 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _601 = -_595;
    float _603 = fma(_581, _599, _601);
    float _605 = _405 * _597;
    float _607 = _103 * _533;
    float _609 = _343 * _597;
    float _611 = _411 * _597;
    float _613 = _605 * 0.715200006961822509765625;
    float _615 = in.m_68.x;
    float _617 = gl_FragCoord.w;
    float _619 = _615 * _617;
    float _621 = _595;
    if (_579)
    {
        float _623 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _625 = _595 + _623;
        _621 = _625;
    }
    float _627 = _621;
    float _629 = _589 + _603;
    float _631 = fma(_609, 0.2125999927520751953125, _613);
    float _633 = _627;
    if (_579)
    {
        float _635 = _627 * 8.0;
        float _637 = precise::clamp(_635, 0.0, 1.0);
        _633 = _637;
    }
    float _639 = _633;
    float _641 = -_607;
    float _643 = _629 + _641;
    float _645 = fma(_611, 0.072200000286102294921875, _631);
    float _647 = _103 * _561;
    float _649 = _643 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _651 = 1.0 / _645;
    float _653 = _649 * (-1.44269502162933349609375);
    float _655 = exp2(_653);
    float _657 = _651 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _659 = precise::clamp(_657, 0.0, 1.0);
    float _661 = _103 * _619;
    float _663 = fma(_659, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _665 = -_655;
    float _667 = _665 + 1.0;
    float _669 = precise::clamp(_667, 0.0, 1.0);
    float _671 = _663 * _647;
    float _673 = _103 * _495;
    float _675 = _103 * _577;
    float _677 = _165 * _669;
    float _679 = precise::clamp(_677, 0.0, 1.0);
    float _681 = fma(_609, _671, _661);
    float _683 = fma(_605, _671, _673);
    float _685 = fma(_611, _671, _675);
    float _687 = _679;
    if (_579)
    {
        float _689 = _679 * _639;
        _687 = _689;
    }
    float _691 = _687;
    float _693 = 0.0 + _691;
    float _695 = precise::clamp(_693, 0.0, 1.0);
    out.m_60.x = _681;
    out.m_60.y = _683;
    out.m_60.z = _685;
    out.m_60.w = _695;
    return out;
}

