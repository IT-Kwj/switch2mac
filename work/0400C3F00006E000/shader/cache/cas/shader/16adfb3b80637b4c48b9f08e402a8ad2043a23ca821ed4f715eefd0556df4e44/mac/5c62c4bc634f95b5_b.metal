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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_56 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_47 [[user(locn7)]];
    float4 m_49 [[user(locn8)]];
    float4 m_51 [[user(locn9)]];
    float4 m_58 [[user(locn10)]];
    float4 m_60 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _69 = gl_FragCoord.w;
    float _71 = in.m_37.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_39.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_37.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_39.y;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = 1.0 / _69;
    float _97 = _95 * _75;
    float _99 = _95 * _81;
    float _101 = _95 * _87;
    float _103 = _95 * _93;
    float2 _776 = float2(_99, _103);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_776, float2(0.0), isnan(_776))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_776, float2(0.0), isnan(_776))).w;
    float2 _787 = float2(_97, _101);
    float2 _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_787, float2(0.0), isnan(_787))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_787, float2(0.0), isnan(_787))).xw;
    float _111 = _109.x;
    float _113 = _109.y;
    float _115 = in.m_41.w;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_43.w;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_45.x;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = _95 * _119;
    float _135 = _95 * _125;
    float _137 = _95 * _131;
    float _139 = _113 * _105;
    float _141 = -_139;
    float _143 = _113 + _141;
    float _145 = fma(_133, _143, _139);
    bool _149 = _145 >= _135;
    bool _151 = isnan(_145);
    bool _153 = _149 || _151;
    bool _155 = isnan(_135);
    bool _157 = _153 || _155;
    float _159 = float(_157);
    float _161 = 0.0 + _159;
    float _163 = precise::clamp(_161, 0.0, 1.0);
    float _165 = _163 * _137;
    bool _167 = _165 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _169 = isnan(_165);
    bool _171 = _167 || _169;
    bool _173 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _175 = _171 || _173;
    float _177 = in.m_37.z;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = in.m_37.w;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    if (!_175)
    {
        discard_fragment();
    }
    float _189 = _95 * _181;
    float _191 = _95 * _187;
    float2 _906 = float2(_189, _191);
    float2 _193 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_906, float2(0.0), isnan(_906))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_906, float2(0.0), isnan(_906))).xy;
    float _195 = _193.x;
    float _197 = _193.y;
    float _199 = in.m_47.y;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = in.m_47.x;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = in.m_49.y;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = in.m_47.z;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    float _223 = in.m_49.x;
    float _225 = gl_FragCoord.w;
    float _227 = _223 * _225;
    float _229 = in.m_49.z;
    float _231 = gl_FragCoord.w;
    float _233 = _229 * _231;
    float _235 = in.m_51.y;
    float _237 = gl_FragCoord.w;
    float _239 = _235 * _237;
    float _241 = in.m_51.x;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = in.m_53.y;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = in.m_51.z;
    float _255 = gl_FragCoord.w;
    float _257 = _253 * _255;
    float _259 = in.m_53.x;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = in.m_53.z;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = _95 * _203;
    float _273 = _95 * _209;
    float _275 = _95 * _215;
    float _277 = _95 * _221;
    float _279 = _271 * _271;
    float _281 = _95 * _227;
    float _283 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _285 = _275 + _283;
    float _287 = fma(_273, _273, _279);
    float _289 = _95 * _233;
    float _291 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _293 = _281 + _291;
    float _295 = _285 * _285;
    float _297 = fma(_277, _277, _287);
    float _299 = _95 * _239;
    float _301 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _303 = _289 + _301;
    float _305 = fma(_293, _293, _295);
    float _307 = rsqrt(_297);
    float _309 = _95 * _245;
    float _311 = _299 * _299;
    float _313 = fma(_303, _303, _305);
    float _315 = _95 * _251;
    float _317 = _95 * _257;
    float _319 = fma(_309, _309, _311);
    float _321 = _95 * _263;
    float _323 = rsqrt(_313);
    float _325 = _315 * _315;
    float _327 = fma(_317, _317, _319);
    float _329 = _95 * _269;
    float _331 = fma(_321, _321, _325);
    float _333 = _271 * _307;
    float _335 = fma(_329, _329, _331);
    float _337 = _273 * _307;
    float _339 = _277 * _307;
    float _341 = _333 * _333;
    float _343 = rsqrt(_327);
    float _345 = in.m_41.z;
    float _347 = gl_FragCoord.w;
    float _349 = _345 * _347;
    float _351 = fma(_337, _337, _341);
    float _353 = _285 * _323;
    float _355 = _293 * _323;
    float _357 = _303 * _323;
    float _359 = fma(_339, _339, _351);
    float _361 = rsqrt(_335);
    float _363 = _353 * _353;
    float _365 = fma(_355, _355, _363);
    float _367 = rsqrt(_359);
    float _369 = fma(_357, _357, _365);
    float _371 = rsqrt(_369);
    float _373 = _329 * _361;
    float _375 = _357 * _371;
    float _377 = _197 * _197;
    float _379 = _361 * _197;
    float _381 = _343 * _195;
    float _383 = _197 * _373;
    float _385 = fma(_195, _195, _377);
    float _387 = precise::clamp(_385, 0.0, 1.0);
    float _389 = _315 * _379;
    float _391 = _321 * _379;
    float _393 = fma(_317, _381, _383);
    float _395 = -_387;
    float _397 = _395 + 1.0;
    float _399 = fma(_299, _381, _389);
    float _401 = fma(_309, _381, _391);
    float _403 = _353 * _371;
    float _405 = _355 * _371;
    float _407 = in.m_41.x;
    float _409 = gl_FragCoord.w;
    float _411 = _407 * _409;
    float _413 = sqrt(_397);
    float _415 = in.m_43.y;
    float _417 = gl_FragCoord.w;
    float _419 = _415 * _417;
    float _421 = _413 * _367;
    float _423 = in.m_41.y;
    float _425 = gl_FragCoord.w;
    float _427 = _423 * _425;
    float _429 = fma(_333, _421, _399);
    float _431 = fma(_337, _421, _401);
    float _433 = fma(_339, _421, _393);
    float _435 = _429 * _429;
    float _437 = fma(_431, _431, _435);
    float _439 = _429 * _403;
    float _441 = fma(_433, _433, _437);
    float _443 = fma(_431, _405, _439);
    float _445 = in.m_43.x;
    float _447 = gl_FragCoord.w;
    float _449 = _445 * _447;
    float _451 = _95 * _411;
    float _453 = fma(_433, _375, _443);
    float _455 = rsqrt(_441);
    float _457 = abs(_453);
    float _459 = _457 + (-1.0);
    float _461 = -_459;
    float _463 = 0.0 + _461;
    float _465 = precise::clamp(_463, 0.0, 1.0);
    float _467 = _95 * _427;
    float _469 = _429 * _455;
    float _471 = _433 * _455;
    float _473 = _95 * _349;
    float _475 = _469 * (-0.816474258899688720703125);
    float _477 = in.m_43.z;
    float _479 = gl_FragCoord.w;
    float _481 = _477 * _479;
    float _483 = -_475;
    float _485 = fma(_471, 0.577381789684295654296875, _483);
    float _487 = fma(_485, 0.5, 0.5);
    float _489 = precise::clamp(_487, 0.0, 1.0);
    float _491 = fma(_111, (*spvDescriptorSet0.fp_c9)._m0[191].x, _489);
    float _493 = precise::clamp(_491, 0.0, 1.0);
    float _495 = _493 * _493;
    float _497 = _495 * 0.699999988079071044921875;
    float _499 = fma(_465, -2.0, 3.0);
    float _501 = _465 * _465;
    float _503 = _451 * _497;
    float _505 = _467 * _497;
    float _507 = _473 * _497;
    float _509 = _499 * _501;
    float _511 = fma(_451, 0.300000011920928955078125, _503);
    float _513 = _95 * _449;
    float _515 = fma(_467, 0.300000011920928955078125, _505);
    float _517 = fma(_473, 0.300000011920928955078125, _507);
    float _519 = _509 * (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _521 = _95 * _419;
    float _523 = _95 * _481;
    float _525 = fma(_513, _519, _511);
    float _527 = fma(_521, _519, _515);
    float _529 = fma(_523, _519, _517);
    if (!_175)
    {
        out.m_56.x = _525;
        out.m_56.y = _527;
        out.m_56.z = _529;
        out.m_56.w = _159;
        return out;
    }
    float _531 = in.m_58.w;
    float _533 = gl_FragCoord.w;
    float _535 = _531 * _533;
    float _537 = _95 * _535;
    bool _539 = _537 != 1.0;
    bool _541 = isnan(_537);
    bool _543 = _539 || _541;
    bool _545 = isnan(1.0);
    bool _547 = _543 || _545;
    bool _549 = !_547;
    if (!_549)
    {
        float _551 = gl_FragCoord.x;
        float _553 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _555 = _551 / _553;
        float _557 = gl_FragCoord.y;
        float _559 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _561 = _557 / _559;
        float _563 = _537 * 256.0;
        float _565 = trunc(_563);
        int _568 = int(_565);
        uint _571 = uint(int(uint(_568) >> uint(7)));
        int _573 = int(_571) + _568;
        float _575 = trunc(_555);
        int _577 = int(_575);
        float _579 = trunc(_561);
        int _581 = int(_579);
        int _583 = _577 + 2;
        int _585 = _583 >> 1;
        uint _587 = uint(int(uint(_581) >> uint(1)));
        int _589 = _585 ^ int(_587);
        int _591 = _589 << 16;
        int _593 = _591 ^ _585;
        int _595 = 983055 & _593;
        int _597 = _595 << 6;
        int _599 = _597 + _595;
        int _601 = _599 & 13369548;
        uint _603 = uint(int(uint(_601) >> uint(3)));
        int _605 = _601 | int(_603);
        int _607 = _605 & 5570560;
        int _609 = _605 & 85;
        uint _611 = uint(int(uint(_607) >> uint(15)));
        int _613 = int(_611) + _609;
        bool _615 = uint(_573) > uint(_613);
        if (!_615)
        {
            discard_fragment();
        }
        if (!_615)
        {
            out.m_56.x = _525;
            out.m_56.y = _527;
            out.m_56.z = _529;
            out.m_56.w = _165;
            return out;
        }
    }
    float _617 = _527 * 0.715200006961822509765625;
    float _619 = in.m_60.w;
    float _621 = gl_FragCoord.w;
    float _623 = _619 * _621;
    float _625 = in.m_60.x;
    float _627 = gl_FragCoord.w;
    float _629 = _625 * _627;
    float _631 = in.m_60.y;
    float _633 = gl_FragCoord.w;
    float _635 = _631 * _633;
    float _637 = fma(_525, 0.2125999927520751953125, _617);
    float _639 = in.m_60.z;
    float _641 = gl_FragCoord.w;
    float _643 = _639 * _641;
    float _645 = fma(_529, 0.072200000286102294921875, _637);
    bool _647 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _649 = 1.0 / _645;
    float _651 = _649 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _653 = precise::clamp(_651, 0.0, 1.0);
    float _655 = 0.0 + _165;
    float _657 = precise::clamp(_655, 0.0, 1.0);
    float _659 = _95 * _623;
    float _661 = fma(_653, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _663 = _95 * _635;
    float _665 = _661 * _659;
    float _667 = _95 * _629;
    float _669 = _95 * _643;
    float _671 = fma(_527, _665, _663);
    float _673 = fma(_525, _665, _667);
    float _675 = fma(_529, _665, _669);
    bool _677 = !_647;
    float _679 = _657;
    if (!_677)
    {
        float _681 = in.m_62.w;
        float _683 = gl_FragCoord.w;
        float _685 = _681 * _683;
        float _687 = in.m_62.z;
        float _689 = gl_FragCoord.w;
        float _691 = _687 * _689;
        float _693 = _95 * _685;
        float _695 = _95 * _691;
        float _697 = 1.0 / _693;
        float _699 = _695 * _697;
        float _701 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _703 = fma(_699, (*spvDescriptorSet0.fp_c8)._m0[30].w, _701);
        float _705 = 1.0 / _703;
        float _707 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _709 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _711 = fma(_705, _707, _709);
        float _713 = _711 * 8.0;
        float _715 = precise::clamp(_713, 0.0, 1.0);
        float _717 = _657 * _715;
        _679 = _717;
    }
    float _719 = _679;
    float _721 = 0.0 + _719;
    float _723 = precise::clamp(_721, 0.0, 1.0);
    out.m_56.x = _673;
    out.m_56.y = _671;
    out.m_56.z = _675;
    out.m_56.w = _723;
    return out;
}

