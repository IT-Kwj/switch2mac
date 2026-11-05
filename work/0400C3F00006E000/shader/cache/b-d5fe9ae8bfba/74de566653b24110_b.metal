#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

// Implementation of the GLSL mod() function, which is slightly different than Metal fmod()
template<typename Tx, typename Ty>
inline Tx mod(Tx x, Ty y)
{
    return x - y * floor(x / y);
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
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _40(thread const int& _2540, thread const int& _2541, constant _10& support_buffer)
{
    int _2544 = 1 + _2541;
    float _2546 = support_buffer._m5[_2544].x;
    float _2548 = abs(_2546);
    bool _2550 = _2548 == 1.0;
    if (_2550)
    {
        return _2540;
    }
    float _2552 = float(_2540);
    float _2554 = _2552 / _2548;
    int _2556 = int(_2554);
    return _2556;
}

static inline __attribute__((always_inline))
int _42(thread const int& _2578, thread const int& _2579, thread const int& _2580, constant _10& support_buffer, thread float4& gl_FragCoord)
{
    int _2583 = 1 + _2579;
    float _2585 = support_buffer._m5[_2583].x;
    bool _2587 = _2585 == 1.0;
    if (_2587)
    {
        return _2578;
    }
    bool _2589 = _2585 < 0.0;
    if (_2589)
    {
        float _2591 = -_2585;
        float _2593 = float(_2578);
        float _2595 = _2593 * _2591;
        float _2597 = gl_FragCoord.x;
        float _2599 = gl_FragCoord.y;
        float _2601 = (_2580 != 0) ? _2599 : _2597;
        float _2603 = mod(_2601, _2591);
        float _2605 = _2595 + _2603;
        int _2607 = int(_2605);
        return _2607;
    }
    float _2609 = float(_2578);
    float _2611 = _2609 * _2585;
    int _2613 = int(_2611);
    return _2613;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    int _45 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height()).x;
    int _47 = _45;
    int _49 = 0;
    int _51 = _40(_47, _49, (*spvDescriptorSet0.support_buffer));
    int _53 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height()).y;
    int _55 = _53;
    int _57 = 0;
    int _59 = _40(_55, _57, (*spvDescriptorSet0.support_buffer));
    float _62 = gl_FragCoord.w;
    float _64 = in.m_31.y;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = in.m_31.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = 1.0 / _62;
    float _78 = _76 * _68;
    float _80 = _76 * _74;
    float _82 = float(_59);
    float _84 = float(_51);
    float _86 = fma(_78, _82, -0.4999000132083892822265625);
    float _88 = fma(_80, _84, -0.4999000132083892822265625);
    float _90 = floor(_86);
    int _92 = int(_90);
    float _94 = floor(_88);
    int _96 = int(_94);
    int _98 = _92 + 1;
    int _100 = _96;
    int _102 = 1;
    int _104 = 0;
    int _106 = _42(_100, _102, _104, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _108 = _92;
    int _110 = 1;
    int _112 = 1;
    int _114 = _42(_108, _110, _112, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _116 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_106, _114)), 0).x;
    int _118 = _96;
    int _120 = 1;
    int _122 = 0;
    int _124 = _42(_118, _120, _122, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _126 = _98;
    int _128 = 1;
    int _130 = 1;
    int _132 = _42(_126, _128, _130, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _134 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_124, _132)), 0).x;
    int _136 = _96 + 1;
    int _138 = _136;
    int _140 = 1;
    int _142 = 0;
    int _144 = _42(_138, _140, _142, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _146 = _98;
    int _148 = 1;
    int _150 = 1;
    int _152 = _42(_146, _148, _150, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _154 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_144, _152)), 0).x;
    int _156 = _136;
    int _158 = 1;
    int _160 = 0;
    int _162 = _42(_156, _158, _160, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _164 = _92;
    int _166 = 1;
    int _168 = 1;
    int _170 = _42(_164, _166, _168, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _172 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_162, _170)), 0).x;
    int _174 = _96;
    int _176 = 0;
    int _178 = 0;
    int _180 = _42(_174, _176, _178, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _182 = _92;
    int _184 = 0;
    int _186 = 1;
    int _188 = _42(_182, _184, _186, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float4 _191 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_180, _188)), 0).xyzw;
    float _193 = _191.x;
    float _195 = _191.y;
    float _197 = _191.z;
    float _199 = _191.w;
    int _201 = _96;
    int _203 = 0;
    int _205 = 0;
    int _207 = _42(_201, _203, _205, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _209 = _98;
    int _211 = 0;
    int _213 = 1;
    int _215 = _42(_209, _211, _213, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float4 _217 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_207, _215)), 0).xyzw;
    float _219 = _217.x;
    float _221 = _217.y;
    float _223 = _217.z;
    float _225 = _217.w;
    int _227 = _136;
    int _229 = 0;
    int _231 = 0;
    int _233 = _42(_227, _229, _231, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _235 = _98;
    int _237 = 0;
    int _239 = 1;
    int _241 = _42(_235, _237, _239, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float4 _243 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_233, _241)), 0).xyzw;
    float _245 = _243.x;
    float _247 = _243.y;
    float _249 = _243.z;
    float _251 = _243.w;
    int _253 = _136;
    int _255 = 0;
    int _257 = 0;
    int _259 = _42(_253, _255, _257, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _261 = _92;
    int _263 = 0;
    int _265 = 1;
    int _267 = _42(_261, _263, _265, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float4 _269 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_259, _267)), 0).xyzw;
    float _271 = _269.x;
    float _273 = _269.y;
    float _275 = _269.z;
    float _277 = _269.w;
    float _279 = floor(_88);
    float _281 = floor(_86);
    float _283 = -_279;
    float _285 = _88 + _283;
    float _287 = -_281;
    float _289 = _86 + _287;
    float _291 = -_289;
    float _293 = _291 + 1.0;
    float _295 = _285 * _289;
    bool _299 = _116 >= 1.0;
    bool _301 = isnan(_116);
    bool _303 = _299 || _301;
    bool _305 = isnan(1.0);
    bool _307 = _303 || _305;
    float _309 = -_285;
    float _311 = _309 + 1.0;
    float _313 = _285 * _293;
    bool _315 = _134 >= 1.0;
    bool _317 = isnan(_134);
    bool _319 = _315 || _317;
    bool _321 = isnan(1.0);
    bool _323 = _319 || _321;
    float _325 = _289 * _311;
    float _327 = _311 * _293;
    bool _329 = _154 >= 1.0;
    bool _331 = isnan(_154);
    bool _333 = _329 || _331;
    bool _335 = isnan(1.0);
    bool _337 = _333 || _335;
    bool _339 = _172 >= 1.0;
    bool _341 = isnan(_172);
    bool _343 = _339 || _341;
    bool _345 = isnan(1.0);
    bool _347 = _343 || _345;
    float _349 = as_type<float>(_92);
    float _351 = _86;
    float _353 = _88;
    float _355 = _195;
    float _357 = _193;
    float _359 = _219;
    float _361 = _327;
    float _363 = _249;
    float _365 = _245;
    float _367 = _225;
    float _369 = _271;
    float _371 = _273;
    if (_307)
    {
        _349 = _193;
    }
    float _373 = _349;
    float _375 = _373;
    float _377 = _373;
    if (_307)
    {
        _351 = _195;
    }
    float _379 = _351;
    float _381 = _379;
    float _383 = _379;
    if (_307)
    {
        _353 = _197;
    }
    float _385 = _353;
    float _387 = _385;
    float _389 = _385;
    if (!_307)
    {
        bool _391 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
        bool _393 = isnan(0.0);
        bool _395 = _391 || _393;
        bool _397 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
        bool _399 = _395 || _397;
        if (!_399)
        {
            float _401 = _193 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _375 = _401;
        }
        float _403 = _375;
        _377 = _403;
        if (!_399)
        {
            float _405 = _195 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _381 = _405;
        }
        float _407 = _381;
        _383 = _407;
        if (!_399)
        {
            float _409 = _197 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _387 = _409;
        }
        float _411 = _387;
        bool _413 = !_399;
        _389 = _411;
        if (!_413)
        {
            float _415 = _195 * 0.715200006961822509765625;
            float _417 = fma(_193, 0.2125999927520751953125, _415);
            float _419 = fma(_197, 0.072200000286102294921875, _417);
            float _421 = 1.0 / _419;
            float _423 = _421 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _425 = precise::clamp(_423, 0.0, 1.0);
            float _427 = fma(_425, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
            float _429 = _193 * _427;
            float _431 = _195 * _427;
            float _433 = _197 * _427;
            _377 = _429;
            _389 = _433;
            _383 = _431;
        }
    }
    float _435 = _377;
    float _437 = _389;
    float _439 = _383;
    float _441 = _437;
    float _443 = _435;
    float _445 = _435;
    float _447 = _439;
    float _449 = _437;
    if (!_307)
    {
        bool _451 = _437 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _453 = isnan(_437);
        bool _455 = _451 || _453;
        bool _457 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _459 = _455 || _457;
        bool _461 = _435 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _463 = isnan(_435);
        bool _465 = _461 || _463;
        bool _467 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _469 = _465 || _467;
        float _471 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _437, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _473 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _435, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _475 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _439, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        bool _477 = _439 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _479 = isnan(_439);
        bool _481 = _477 || _479;
        bool _483 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _485 = _481 || _483;
        float _487 = exp2(_471);
        float _489 = exp2(_473);
        float _491 = exp2(_475);
        _355 = _487;
        if (_459)
        {
            float _493 = -_487;
            float _495 = _493 + 1.0;
            _441 = _495;
        }
        float _497 = _441;
        if (_469)
        {
            float _499 = -_489;
            float _501 = _499 + 1.0;
            _443 = _501;
        }
        float _503 = _443;
        _445 = _503;
        _449 = _497;
        _357 = _491;
        if (_485)
        {
            float _505 = -_491;
            float _507 = _505 + 1.0;
            _447 = _507;
        }
    }
    float _509 = _445;
    float _511 = _449;
    float _513 = _447;
    float _515 = _355;
    float _517 = _357;
    float _519 = _517;
    float _521 = _515;
    float _523 = _509;
    float _525 = _509;
    if (_323)
    {
        _519 = _219;
    }
    float _527 = _519;
    float _529 = _527;
    float _531 = _527;
    if (_323)
    {
        _521 = _221;
    }
    float _533 = _521;
    float _535 = _533;
    float _537 = _533;
    float _539 = _513;
    float _541 = _511;
    if (_323)
    {
        _523 = _223;
    }
    float _543 = _523;
    float _545 = _543;
    float _547 = _543;
    if (!_323)
    {
        bool _549 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
        bool _551 = isnan(0.0);
        bool _553 = _549 || _551;
        bool _555 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
        bool _557 = _553 || _555;
        if (!_557)
        {
            float _559 = _219 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _529 = _559;
        }
        float _561 = _529;
        _531 = _561;
        if (!_557)
        {
            float _563 = _221 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _535 = _563;
        }
        float _565 = _535;
        _537 = _565;
        if (!_557)
        {
            float _567 = _223 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _545 = _567;
        }
        float _569 = _545;
        bool _571 = !_557;
        _547 = _569;
        if (!_571)
        {
            float _573 = _221 * 0.715200006961822509765625;
            float _575 = fma(_219, 0.2125999927520751953125, _573);
            float _577 = fma(_223, 0.072200000286102294921875, _575);
            float _579 = 1.0 / _577;
            float _581 = _579 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _583 = precise::clamp(_581, 0.0, 1.0);
            float _585 = fma(_583, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
            float _587 = _219 * _585;
            float _589 = _221 * _585;
            float _591 = _223 * _585;
            _537 = _589;
            _547 = _591;
            _531 = _587;
        }
    }
    float _593 = _537;
    float _595 = _547;
    float _597 = _531;
    float _599 = _595;
    float _601 = _597;
    if (!_307)
    {
        float _603 = _513 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _539 = _603;
    }
    float _605 = _539;
    if (!_307)
    {
        float _607 = _509 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _525 = _607;
    }
    float _609 = _525;
    if (!_307)
    {
        float _611 = _511 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _541 = _611;
    }
    float _613 = _541;
    float _615 = _327 * _605;
    float _617 = _327 * _609;
    float _619 = _199 * _327;
    float _621 = _327 * _613;
    float _623 = _597;
    float _625 = _593;
    float _627 = _595;
    float _629 = _595;
    float _631 = _597;
    float _633 = _619;
    if (_323)
    {
        _599 = _593;
    }
    float _635 = _599;
    float _637 = _635;
    if (_323)
    {
        _359 = _595;
    }
    float _639 = _359;
    float _641 = _639;
    if (!_323)
    {
        bool _643 = _593 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _645 = isnan(_593);
        bool _647 = _643 || _645;
        bool _649 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _651 = _647 || _649;
        bool _653 = _595 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _655 = isnan(_595);
        bool _657 = _653 || _655;
        bool _659 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _661 = _657 || _659;
        float _663 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _597, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _665 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _593, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _667 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _595, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        bool _669 = _597 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _671 = isnan(_597);
        bool _673 = _669 || _671;
        bool _675 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _677 = _673 || _675;
        float _679 = exp2(_663);
        float _681 = exp2(_665);
        float _683 = exp2(_667);
        if (_677)
        {
            float _685 = -_679;
            float _687 = _685 + 1.0;
            _623 = _687;
        }
        float _689 = _623;
        _631 = _689;
        if (_651)
        {
            float _691 = -_681;
            float _693 = _691 + 1.0;
            _625 = _693;
        }
        float _695 = _625;
        _601 = _683;
        _637 = _695;
        if (_661)
        {
            float _697 = -_683;
            float _699 = _697 + 1.0;
            _627 = _699;
        }
        float _701 = _627;
        _629 = _701;
        _641 = _701;
    }
    float _703 = _601;
    float _705 = _629;
    float _707 = _631;
    float _709 = _641;
    float _711 = _637;
    float _713 = _703;
    float _715 = _705;
    float _717 = _707;
    float _719 = _709;
    float _721 = _711;
    if (_337)
    {
        _713 = _245;
    }
    float _723 = _713;
    float _725 = _723;
    float _727 = _723;
    if (_337)
    {
        _361 = _247;
    }
    float _729 = _361;
    float _731 = _729;
    float _733 = _729;
    if (_337)
    {
        _715 = _249;
    }
    float _735 = _715;
    float _737 = _735;
    float _739 = _735;
    if (!_337)
    {
        bool _741 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
        bool _743 = isnan(0.0);
        bool _745 = _741 || _743;
        bool _747 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
        bool _749 = _745 || _747;
        if (!_749)
        {
            float _751 = _245 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _725 = _751;
        }
        float _753 = _725;
        _727 = _753;
        if (!_749)
        {
            float _755 = _247 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _731 = _755;
        }
        float _757 = _731;
        _733 = _757;
        if (!_749)
        {
            float _759 = _249 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _737 = _759;
        }
        float _761 = _737;
        bool _763 = !_749;
        _739 = _761;
        if (!_763)
        {
            float _765 = _247 * 0.715200006961822509765625;
            float _767 = fma(_245, 0.2125999927520751953125, _765);
            float _769 = fma(_249, 0.072200000286102294921875, _767);
            float _771 = 1.0 / _769;
            float _773 = _771 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _775 = precise::clamp(_773, 0.0, 1.0);
            float _777 = fma(_775, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
            float _779 = _245 * _777;
            float _781 = _247 * _777;
            float _783 = _249 * _777;
            _733 = _781;
            _727 = _779;
            _739 = _783;
        }
    }
    float _785 = _733;
    float _787 = _727;
    float _789 = _739;
    float _791 = _787;
    float _793 = _789;
    float _795 = _785;
    float _797 = _785;
    if (_337)
    {
        _363 = _787;
    }
    float _799 = _363;
    float _801 = _799;
    if (_337)
    {
        _365 = _789;
    }
    float _803 = _365;
    float _805 = _803;
    if (!_337)
    {
        bool _807 = _787 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _809 = isnan(_787);
        bool _811 = _807 || _809;
        bool _813 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _815 = _811 || _813;
        bool _817 = _789 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _819 = isnan(_789);
        bool _821 = _817 || _819;
        bool _823 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _825 = _821 || _823;
        float _827 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _787, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _829 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _789, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _831 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _785, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        bool _833 = _785 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _835 = isnan(_785);
        bool _837 = _833 || _835;
        bool _839 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _841 = _837 || _839;
        float _843 = exp2(_827);
        float _845 = exp2(_829);
        float _847 = exp2(_831);
        if (_815)
        {
            float _849 = -_843;
            float _851 = _849 + 1.0;
            _791 = _851;
        }
        float _853 = _791;
        _801 = _853;
        if (_825)
        {
            float _855 = -_845;
            float _857 = _855 + 1.0;
            _793 = _857;
        }
        float _859 = _793;
        if (_841)
        {
            float _861 = -_847;
            float _863 = _861 + 1.0;
            _795 = _863;
        }
        float _865 = _795;
        _797 = _865;
        _805 = _859;
    }
    float _867 = _801;
    float _869 = _797;
    float _871 = _805;
    float _873 = _867;
    float _875 = _869;
    float _877 = _871;
    if (!_323)
    {
        float _879 = _707 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _717 = _879;
    }
    float _881 = _717;
    float _883 = fma(_225, _325, _619);
    if (!_323)
    {
        float _885 = _709 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _719 = _885;
    }
    float _887 = _719;
    float _889 = _887;
    if (!_323)
    {
        float _891 = _711 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _721 = _891;
    }
    float _893 = _721;
    float _895 = fma(_325, _881, _617);
    if (!_337)
    {
        float _897 = _867 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _873 = _897;
    }
    float _899 = _873;
    float _901 = fma(_325, _887, _621);
    float _903 = fma(_251, _295, _883);
    float _905 = fma(_325, _893, _615);
    float _907 = fma(_295, _899, _895);
    if (_347)
    {
        _633 = _271;
    }
    float _909 = _633;
    float _911 = _909;
    float _913 = _909;
    if (_347)
    {
        _889 = _273;
    }
    float _915 = _889;
    float _917 = _915;
    float _919 = _915;
    if (_347)
    {
        _367 = _275;
    }
    float _921 = _367;
    float _923 = _921;
    float _925 = _921;
    if (!_347)
    {
        bool _927 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
        bool _929 = isnan(0.0);
        bool _931 = _927 || _929;
        bool _933 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
        bool _935 = _931 || _933;
        if (!_935)
        {
            float _937 = _271 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _911 = _937;
        }
        float _939 = _911;
        _913 = _939;
        if (!_935)
        {
            float _941 = _273 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _917 = _941;
        }
        float _943 = _917;
        _919 = _943;
        if (!_935)
        {
            float _945 = _275 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _923 = _945;
        }
        float _947 = _923;
        bool _949 = !_935;
        _925 = _947;
        if (!_949)
        {
            float _951 = _273 * 0.715200006961822509765625;
            float _953 = fma(_271, 0.2125999927520751953125, _951);
            float _955 = fma(_275, 0.072200000286102294921875, _953);
            float _957 = 1.0 / _955;
            float _959 = _957 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _961 = precise::clamp(_959, 0.0, 1.0);
            float _963 = fma(_961, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
            float _965 = _271 * _963;
            float _967 = _273 * _963;
            float _969 = _275 * _963;
            _913 = _965;
            _925 = _969;
            _919 = _967;
        }
    }
    float _971 = _913;
    float _973 = _925;
    float _975 = _919;
    float _977 = _973;
    float _979 = _971;
    float _981 = _975;
    float _983 = _973;
    if (_347)
    {
        _369 = _971;
    }
    float _985 = _369;
    float _987 = _985;
    if (_347)
    {
        _977 = _975;
    }
    float _989 = _977;
    float _991 = _989;
    if (_347)
    {
        _371 = _973;
    }
    float _993 = _371;
    float _995 = _993;
    if (!_347)
    {
        bool _997 = _971 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _999 = isnan(_971);
        bool _1001 = _997 || _999;
        bool _1003 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1005 = _1001 || _1003;
        bool _1007 = _975 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1009 = isnan(_975);
        bool _1011 = _1007 || _1009;
        bool _1013 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1015 = _1011 || _1013;
        float _1017 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _971, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1019 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _975, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1021 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _973, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        bool _1023 = _973 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1025 = isnan(_973);
        bool _1027 = _1023 || _1025;
        bool _1029 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1031 = _1027 || _1029;
        float _1033 = exp2(_1017);
        float _1035 = exp2(_1019);
        float _1037 = exp2(_1021);
        if (_1005)
        {
            float _1039 = -_1033;
            float _1041 = _1039 + 1.0;
            _979 = _1041;
        }
        float _1043 = _979;
        if (_1015)
        {
            float _1045 = -_1035;
            float _1047 = _1045 + 1.0;
            _981 = _1047;
        }
        float _1049 = _981;
        _987 = _1043;
        _991 = _1049;
        if (_1031)
        {
            float _1051 = -_1037;
            float _1053 = _1051 + 1.0;
            _983 = _1053;
        }
        float _1055 = _983;
        _995 = _1055;
    }
    float _1057 = _987;
    float _1059 = _991;
    float _1061 = _995;
    float _1063 = _1057;
    float _1065 = _1059;
    float _1067 = _1061;
    if (!_337)
    {
        float _1069 = _869 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _875 = _1069;
    }
    float _1071 = _875;
    if (!_337)
    {
        float _1073 = _871 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _877 = _1073;
    }
    float _1075 = _877;
    if (!_347)
    {
        float _1077 = _1057 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1063 = _1077;
    }
    float _1079 = _1063;
    if (!_347)
    {
        float _1081 = _1059 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1065 = _1081;
    }
    float _1083 = _1065;
    float _1085 = fma(_295, _1071, _905);
    float _1087 = fma(_295, _1075, _901);
    if (!_347)
    {
        float _1089 = _1061 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1067 = _1089;
    }
    float _1091 = _1067;
    float _1093 = fma(_277, _313, _903);
    float _1095 = fma(_313, _1079, _907);
    float _1097 = fma(_313, _1083, _1085);
    float _1099 = fma(_313, _1091, _1087);
    out.m_34.x = _1095;
    out.m_34.y = _1097;
    out.m_34.z = _1099;
    out.m_34.w = _1093;
    return out;
}

