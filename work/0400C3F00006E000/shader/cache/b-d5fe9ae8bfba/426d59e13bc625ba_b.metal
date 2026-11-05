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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
int _40(thread const int& _5035, thread const int& _5036, constant _10& support_buffer)
{
    int _5039 = 1 + _5036;
    float _5041 = support_buffer._m5[_5039].x;
    float _5043 = abs(_5041);
    bool _5045 = _5043 == 1.0;
    if (_5045)
    {
        return _5035;
    }
    float _5047 = float(_5035);
    float _5049 = _5047 / _5043;
    int _5051 = int(_5049);
    return _5051;
}

static inline __attribute__((always_inline))
int _42(thread const int& _5073, thread const int& _5074, thread const int& _5075, constant _10& support_buffer, thread float4& gl_FragCoord)
{
    int _5078 = 1 + _5074;
    float _5080 = support_buffer._m5[_5078].x;
    bool _5082 = _5080 == 1.0;
    if (_5082)
    {
        return _5073;
    }
    bool _5084 = _5080 < 0.0;
    if (_5084)
    {
        float _5086 = -_5080;
        float _5088 = float(_5073);
        float _5090 = _5088 * _5086;
        float _5092 = gl_FragCoord.x;
        float _5094 = gl_FragCoord.y;
        float _5096 = (_5075 != 0) ? _5094 : _5092;
        float _5098 = mod(_5096, _5086);
        float _5100 = _5090 + _5098;
        int _5102 = int(_5100);
        return _5102;
    }
    float _5104 = float(_5073);
    float _5106 = _5104 * _5080;
    int _5108 = int(_5106);
    return _5108;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _2181 = false;
    bool _839 = false;
    bool _1737 = false;
    bool _1627 = false;
    bool _1509 = false;
    int _45 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height()).x;
    int _47 = _45;
    int _49 = 0;
    int _51 = _40(_47, _49, (*spvDescriptorSet0.support_buffer));
    int _53 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height()).y;
    int _55 = _53;
    int _57 = 0;
    int _59 = _40(_55, _57, (*spvDescriptorSet0.support_buffer));
    float _62 = gl_FragCoord.w;
    float _64 = in.m_31.x;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = in.m_31.y;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = 1.0 / _62;
    float _78 = _76 * _68;
    float _80 = _76 * _74;
    float _82 = float(_59);
    float _84 = float(_51);
    float _86 = fma(_80, _82, -0.4999000132083892822265625);
    float _88 = fma(_78, _84, -0.4999000132083892822265625);
    float _90 = floor(_86);
    int _92 = int(_90);
    float _94 = floor(_88);
    int _96 = int(_94);
    int _98 = _92 + 1;
    int _100 = _96 + 1;
    int _102 = _96;
    int _104 = 1;
    int _106 = 0;
    int _108 = _42(_102, _104, _106, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _110 = _92;
    int _112 = 1;
    int _114 = 1;
    int _116 = _42(_110, _112, _114, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _118 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_108, _116)), 0).x;
    int _120 = _96;
    int _122 = 1;
    int _124 = 0;
    int _126 = _42(_120, _122, _124, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _128 = _98;
    int _130 = 1;
    int _132 = 1;
    int _134 = _42(_128, _130, _132, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _136 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_126, _134)), 0).x;
    int _138 = _100;
    int _140 = 1;
    int _142 = 0;
    int _144 = _42(_138, _140, _142, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _146 = _98;
    int _148 = 1;
    int _150 = 1;
    int _152 = _42(_146, _148, _150, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _154 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_144, _152)), 0).x;
    int _156 = _100;
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
    int _227 = _100;
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
    int _253 = _100;
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
    float _291 = -_285;
    float _293 = _291 + 1.0;
    float _295 = -_289;
    float _297 = _295 + 1.0;
    float _299 = _285 * _289;
    float _301 = _289 * _293;
    float _303 = _293 * _297;
    float _305 = _285 * _297;
    int _307 = 0;
    float _309 = 0.0;
    float _311 = _297;
    float _313 = 0.0;
    float _315 = 0.0;
    float _317 = 0.0;
    float _319 = 0.0;
    float _321 = 0.0;
    float _323 = 0.0;
    int _325 = 0;
    float _327 = 0.0;
    int _329 = 0;
    float _331 = 0.0;
    float _333 = 0.0;
    float _335 = 0.0;
    float _337 = 0.0;
    float _339 = 0.0;
    float _341 = 0.0;
    float _829;
    float _831;
    float _833;
    float _835;
    float _837;
    float _1505;
    float _1507;
    float _1623;
    float _1625;
    float _1733;
    float _1735;
    float _2161;
    float _2167;
    float _2177;
    float _2179;
    do
    {
        int _343 = _307;
        float _345 = _309;
        float _347 = _311;
        float _349 = _313;
        float _351 = _315;
        float _353 = _317;
        float _355 = _319;
        float _357 = _321;
        float _359 = _323;
        int _361 = _325;
        float _363 = _327;
        int _365 = _329;
        float _367 = _331;
        float _369 = _333;
        float _371 = _335;
        float _373 = _337;
        float _375 = _339;
        float _377 = _341;
        int _379 = _343 << 4;
        int _381 = _343 << 2;
        bool _385 = _379 == 0;
        bool _387 = _379 == 16;
        bool _389 = _381 == 0;
        bool _391 = _381 == 4;
        int _393 = _389 ? 8 : 0;
        bool _395 = _381 == 12;
        bool _397 = _381 == 8;
        bool _399 = _379 == 32;
        bool _401 = _379 == 48;
        float _403 = _347;
        float _405 = _349;
        float _407 = _345;
        float _409 = _351;
        float _411 = _353;
        float _413 = _355;
        int _415 = _365;
        int _417 = _361;
        float _419 = _369;
        float _421 = _357;
        float _423 = _363;
        float _425 = _363;
        float _427 = _367;
        float _429 = _357;
        float _431 = _357;
        float _433 = _359;
        float _435 = _363;
        float _437 = _367;
        if (_385)
        {
            _403 = _193;
        }
        float _439 = _403;
        float _441 = _439;
        if (_387)
        {
            _441 = _219;
        }
        float _443 = _441;
        float _445 = _443;
        if (_385)
        {
            _405 = _195;
        }
        float _447 = _405;
        float _449 = _447;
        if (_389)
        {
            _407 = _118;
        }
        float _451 = _407;
        float _453 = _451;
        if (_391)
        {
            _453 = _136;
        }
        float _455 = _453;
        float _457 = _455;
        if (_397)
        {
            _457 = _154;
        }
        float _459 = _457;
        float _461 = _459;
        if (_385)
        {
            _409 = _197;
        }
        float _463 = _409;
        float _465 = _463;
        if (_387)
        {
            _449 = _221;
        }
        float _467 = _449;
        float _469 = _467;
        if (_395)
        {
            _461 = _172;
        }
        float _471 = _461;
        float _473 = _471;
        if (_387)
        {
            _465 = _223;
        }
        float _475 = _465;
        bool _477 = _471 >= 1.0;
        bool _479 = isnan(_471);
        bool _481 = _477 || _479;
        bool _483 = isnan(1.0);
        bool _485 = _481 || _483;
        float _487 = _475;
        if (_399)
        {
            _445 = _245;
        }
        float _489 = _445;
        float _491 = _489;
        if (_399)
        {
            _469 = _247;
        }
        float _493 = _469;
        float _495 = _493;
        if (_399)
        {
            _487 = _249;
        }
        float _497 = _487;
        float _499 = _497;
        if (_401)
        {
            _491 = _271;
        }
        float _501 = _491;
        float _503 = _501;
        if (_401)
        {
            _495 = _273;
        }
        float _505 = _495;
        float _507 = _505;
        if (_401)
        {
            _499 = _275;
        }
        float _509 = _499;
        float _511 = _509;
        if (_485)
        {
            _411 = _501;
        }
        float _513 = _411;
        float _515 = _513;
        float _517 = _513;
        if (_485)
        {
            _413 = _505;
        }
        float _519 = _413;
        float _521 = _519;
        float _523 = _519;
        if (_485)
        {
            _473 = _509;
        }
        float _525 = _473;
        float _527 = _525;
        float _529 = _525;
        if (!_485)
        {
            bool _531 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
            bool _533 = isnan(0.0);
            bool _535 = _531 || _533;
            bool _537 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
            bool _539 = _535 || _537;
            if (!_539)
            {
                float _541 = _501 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
                _515 = _541;
            }
            float _543 = _515;
            _517 = _543;
            if (!_539)
            {
                float _545 = _505 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
                _521 = _545;
            }
            float _547 = _521;
            _523 = _547;
            if (!_539)
            {
                float _549 = _509 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
                _527 = _549;
            }
            float _551 = _527;
            bool _553 = !_539;
            _529 = _551;
            if (!_553)
            {
                float _555 = _505 * 0.715200006961822509765625;
                float _557 = fma(_501, 0.2125999927520751953125, _555);
                float _559 = fma(_509, 0.072200000286102294921875, _557);
                float _561 = 1.0 / _559;
                float _563 = _561 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
                float _565 = precise::clamp(_563, 0.0, 1.0);
                float _567 = fma(_565, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
                float _569 = _501 * _567;
                float _571 = _505 * _567;
                float _573 = _509 * _567;
                _529 = _573;
                _517 = _569;
                _523 = _571;
                _415 = as_type<int>(_559);
            }
        }
        float _575 = _529;
        float _577 = _517;
        float _579 = _523;
        int _581 = _415;
        int _583 = _581;
        float _585 = _575;
        float _587 = _577;
        float _589 = _579;
        float _591 = _575;
        float _593 = _577;
        float _595 = _579;
        float _597 = _577;
        float _599 = _575;
        float _601 = _577;
        float _603 = _575;
        float _605 = _575;
        float _607 = _577;
        float _609 = _579;
        float _611 = _575;
        float _613 = _577;
        float _615 = _579;
        if (_485)
        {
            _511 = _577;
        }
        float _617 = _511;
        float _619 = _617;
        if (_485)
        {
            _503 = _579;
        }
        float _621 = _503;
        float _623 = _621;
        if (_485)
        {
            _507 = _575;
        }
        float _625 = _507;
        float _627 = _625;
        if (!_485)
        {
            bool _629 = _577 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
            bool _631 = isnan(_577);
            bool _633 = _629 || _631;
            bool _635 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
            bool _637 = _633 || _635;
            bool _639 = _579 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
            bool _641 = isnan(_579);
            bool _643 = _639 || _641;
            bool _645 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
            bool _647 = _643 || _645;
            float _649 = fma(_577, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
            float _651 = fma(_579, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
            float _653 = fma(_575, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
            bool _655 = _575 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
            bool _657 = isnan(_575);
            bool _659 = _655 || _657;
            bool _661 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
            bool _663 = _659 || _661;
            float _665 = exp2(_649);
            float _667 = exp2(_651);
            float _669 = exp2(_653);
            float _671 = -_665;
            float _673 = _671 + 1.0;
            bool _675 = !_637;
            float _677 = _675 ? _577 : _673;
            float _679 = -_667;
            float _681 = _679 + 1.0;
            bool _683 = !_647;
            float _685 = _683 ? _579 : _681;
            float _687 = -_669;
            float _689 = _687 + 1.0;
            bool _691 = !_663;
            float _693 = _691 ? _575 : _689;
            _623 = _685;
            _627 = _693;
            _619 = _677;
            _417 = as_type<int>(_689);
            _583 = as_type<int>(_667);
            _419 = _669;
        }
        float _695 = _623;
        float _697 = _627;
        float _699 = _619;
        int _701 = _417;
        int _703 = _583;
        float _705 = _419;
        int _707 = _701;
        float _709 = _705;
        float _711 = as_type<float>(_701);
        int _713 = _703;
        float _715 = _705;
        float _717 = _699;
        float _719 = _695;
        float _721 = _697;
        float _723 = _695;
        float _725 = _697;
        float _727 = _699;
        int _729 = _701;
        int _731 = _703;
        float _733 = _705;
        if (!_485)
        {
            bool _735 = (*spvDescriptorSet0.fp_c3)._m0[7].x != 6.0;
            bool _737 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
            bool _739 = _735 || _737;
            bool _741 = isnan(6.0);
            bool _743 = _739 || _741;
            if (!_743)
            {
                float _745 = -_699;
                float _747 = _745 + 1.0;
                float _749 = -_695;
                float _751 = _749 + 1.0;
                float _753 = -_697;
                float _755 = _753 + 1.0;
                float _757 = abs(_747);
                float _759 = log2(_757);
                float _761 = abs(_751);
                float _763 = log2(_761);
                float _765 = abs(_755);
                float _767 = log2(_765);
                float _769 = _759 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                float _771 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                float _773 = _763 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                float _775 = exp2(_769);
                float _777 = _767 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                float _779 = exp2(_773);
                float _781 = exp2(_777);
                float _783 = fma(_771, _775, 1.0);
                float _785 = fma(_771, _779, 1.0);
                float _787 = 1.0 / _783;
                float _789 = fma(_771, _781, 1.0);
                float _791 = 1.0 / _785;
                float _793 = 1.0 / _789;
                float _795 = _787 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                float _797 = _791 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                float _799 = precise::max(_795, _797);
                float _801 = _793 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                float _803 = precise::max(_801, _799);
                float _805 = -_795;
                float _807 = _805 + _803;
                float _809 = -_797;
                float _811 = _809 + _803;
                float _813 = -_801;
                float _815 = _813 + _803;
                float _817 = fma(_807, (*spvDescriptorSet0.fp_c3)._m0[6].w, _795);
                float _819 = fma(_811, (*spvDescriptorSet0.fp_c3)._m0[6].w, _797);
                float _821 = fma(_815, (*spvDescriptorSet0.fp_c3)._m0[6].w, _801);
                float _823 = _817 * _699;
                float _825 = _819 * _695;
                float _827 = _821 * _697;
                _605 = _821;
                _607 = _793;
                _609 = _791;
                _829 = _823;
                _831 = _827;
                _833 = _823;
                _835 = _825;
                _837 = _827;
                _839 = true;
            }
            else
            {
                bool _841 = (*spvDescriptorSet0.fp_c3)._m0[7].x >= 1000.0;
                if (!_841)
                {
                    _421 = (*spvDescriptorSet0.fp_c3)._m0[7].x;
                }
                float _843 = _421;
                bool _845 = !_841;
                float _847 = _843;
                _429 = _843;
                if (!_845)
                {
                    float _849 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
                    float _851 = _78 + _849;
                    float _853 = abs(_851);
                    float _855 = _853 * 2560.0;
                    bool _857 = _855 >= 2.0;
                    bool _859 = isnan(_855);
                    bool _861 = _857 || _859;
                    bool _863 = isnan(2.0);
                    bool _865 = _861 || _863;
                    int _867 = as_type<int>(_855);
                    if (!_865)
                    {
                        _707 = 0;
                    }
                    int _869 = _707;
                    float _871 = as_type<float>(_869);
                    _829 = as_type<float>(_869);
                    _833 = as_type<float>(_869);
                    if (!_865)
                    {
                        _867 = 0;
                        _709 = 0.0;
                    }
                    int _873 = _867;
                    float _875 = _709;
                    bool _877 = !_865;
                    float _879 = _875;
                    int _881 = _873;
                    _831 = as_type<float>(_873);
                    _835 = _875;
                    _837 = as_type<float>(_873);
                    _839 = _877;
                    if (!_839)
                    {
                        bool _883 = _78 > (*spvDescriptorSet0.fp_c3)._m0[7].y;
                        if (_883)
                        {
                            _871 = _699;
                        }
                        int _885 = as_type<int>(_871);
                        _711 = as_type<float>(_885);
                        _829 = as_type<float>(_885);
                        _833 = as_type<float>(_885);
                        if (_883)
                        {
                            _879 = _695;
                        }
                        float _887 = _879;
                        _715 = _887;
                        _835 = _887;
                        if (_883)
                        {
                            _881 = as_type<int>(_697);
                        }
                        int _889 = _881;
                        _713 = _889;
                        _831 = as_type<float>(_889);
                        _837 = as_type<float>(_889);
                        _839 = _883;
                        if (!_839)
                        {
                            float _891 = (*spvDescriptorSet0.fp_c3)._m0[7].x + (-1000.0);
                            _847 = _891;
                        }
                    }
                }
                if (!_839)
                {
                    float _893 = _847;
                    int _895 = as_type<int>(_711);
                    int _897 = _713;
                    float _899 = _715;
                    bool _901 = _893 != 0.0;
                    bool _903 = isnan(_893);
                    bool _905 = _901 || _903;
                    bool _907 = isnan(0.0);
                    bool _909 = _905 || _907;
                    float _911 = _893;
                    float _913 = _893;
                    int _915 = _895;
                    float _917 = _899;
                    int _919 = _897;
                    _429 = _893;
                    if (!_909)
                    {
                        float _921 = _579 * 0.586600005626678466796875;
                        float _923 = fma(_577, 0.29890000820159912109375, _921);
                        float _925 = fma(_575, 0.1143999993801116943359375, _923);
                        float _927 = _925 * (-1.44269502162933349609375);
                        float _929 = exp2(_927);
                        float _931 = -_929;
                        float _933 = _931 + 1.0;
                        bool _935 = _933 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                        bool _937 = isnan(_933);
                        bool _939 = _935 || _937;
                        bool _941 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                        bool _943 = _939 || _941;
                        float _945 = _925;
                        if (!_943)
                        {
                            _945 = _933;
                        }
                        float _947 = _945;
                        bool _949 = !_943;
                        float _951 = _947;
                        if (!_949)
                        {
                            float _953 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _955 = _933 + _953;
                            float _957 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _959 = spvFAdd(_957, 1.00000095367431640625);
                            float _961 = 1.0 / _959;
                            float _963 = _955 * _961;
                            float _965 = -_963;
                            float _967 = _965 + 1.0;
                            float _969 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _971 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _969;
                            float _973 = abs(_967);
                            float _975 = log2(_973);
                            float _977 = _971 * _961;
                            float _979 = _977 + (-1.0);
                            float _981 = _977 * _963;
                            float _983 = _975 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _985 = exp2(_983);
                            float _987 = fma(_979, _985, 1.0);
                            float _989 = 1.0 / _987;
                            float _991 = _981 * _989;
                            float _993 = fma(_959, _991, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                            _951 = _993;
                        }
                        float _995 = _951;
                        float _997 = -_933;
                        float _999 = _997 + _995;
                        float _1001 = _695 * 0.586600005626678466796875;
                        float _1003 = _999 + 1.0;
                        float _1005 = fma(_699, 0.29890000820159912109375, _1001);
                        float _1007 = fma(_697, 0.1143999993801116943359375, _1005);
                        float _1009 = abs(_1003);
                        float _1011 = log2(_1009);
                        float _1013 = spvFAdd(_1007, 9.9999999747524270787835121154785e-07);
                        float _1015 = 1.0 / _1013;
                        float _1017 = _1011 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
                        float _1019 = exp2(_1017);
                        float _1021 = fma(_1015, _699, -1.0);
                        float _1023 = fma(_1015, _695, -1.0);
                        float _1025 = fma(_1015, _697, -1.0);
                        float _1027 = fma(_1019, _1021, 1.0);
                        float _1029 = fma(_1019, _1023, 1.0);
                        float _1031 = fma(_1019, _1025, 1.0);
                        float _1033 = _1027 * _995;
                        float _1035 = _1029 * _995;
                        float _1037 = _1031 * _995;
                        float _1039 = precise::max(0.0, _1033);
                        float _1041 = precise::max(0.0, _1035);
                        float _1043 = precise::max(0.0, _1037);
                        float _1045 = precise::min(_1039, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _1047 = precise::min(_1041, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _1049 = precise::min(_1043, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        _605 = _1015;
                        _607 = _1043;
                        _609 = _1023;
                        _829 = _1045;
                        _831 = _1049;
                        _833 = _1045;
                        _835 = _1047;
                        _837 = _1049;
                        _839 = true;
                    }
                    else
                    {
                        bool _1051 = _893 != 1.0;
                        bool _1053 = isnan(_893);
                        bool _1055 = _1051 || _1053;
                        bool _1057 = isnan(1.0);
                        bool _1059 = _1055 || _1057;
                        if (!_1059)
                        {
                            bool _1061 = _699 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                            bool _1063 = isnan(_699);
                            bool _1065 = _1061 || _1063;
                            bool _1067 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                            bool _1069 = _1065 || _1067;
                            float _1071 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1073 = spvFAdd(_1071, 1.00000095367431640625);
                            bool _1075 = _695 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                            bool _1077 = isnan(_695);
                            bool _1079 = _1075 || _1077;
                            bool _1081 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                            bool _1083 = _1079 || _1081;
                            bool _1085 = _697 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                            bool _1087 = isnan(_697);
                            bool _1089 = _1085 || _1087;
                            bool _1091 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                            bool _1093 = _1089 || _1091;
                            float _1095 = 1.0 / _1073;
                            float _1097 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _1099 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1097;
                            float _1101 = _1099 * _1095;
                            bool _1103 = !_1069;
                            if (!_1103)
                            {
                                float _1105 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                float _1107 = _699 + _1105;
                                float _1109 = _1101 + (-1.0);
                                float _1111 = _1107 * _1095;
                                float _1113 = -_1111;
                                float _1115 = _1113 + 1.0;
                                float _1117 = _1101 * _1111;
                                float _1119 = abs(_1115);
                                float _1121 = log2(_1119);
                                float _1123 = _1121 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                float _1125 = exp2(_1123);
                                float _1127 = fma(_1109, _1125, 1.0);
                                float _1129 = 1.0 / _1127;
                                float _1131 = _1117 * _1129;
                                float _1133 = fma(_1073, _1131, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                _585 = _1121;
                                _587 = _1129;
                                _589 = _1125;
                                _717 = _1133;
                            }
                            float _1135 = _585;
                            float _1137 = _587;
                            float _1139 = _589;
                            float _1141 = _717;
                            bool _1143 = !_1083;
                            float _1145 = _1135;
                            float _1147 = _1137;
                            float _1149 = _1139;
                            if (!_1143)
                            {
                                float _1151 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                float _1153 = _695 + _1151;
                                float _1155 = _1101 + (-1.0);
                                float _1157 = _1153 * _1095;
                                float _1159 = -_1157;
                                float _1161 = _1159 + 1.0;
                                float _1163 = _1101 * _1157;
                                float _1165 = abs(_1161);
                                float _1167 = log2(_1165);
                                float _1169 = _1167 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                float _1171 = exp2(_1169);
                                float _1173 = fma(_1155, _1171, 1.0);
                                float _1175 = 1.0 / _1173;
                                float _1177 = _1163 * _1175;
                                float _1179 = fma(_1073, _1177, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                _1145 = _1167;
                                _1147 = _1171;
                                _1149 = _1177;
                                _719 = _1179;
                            }
                            float _1181 = _1145;
                            float _1183 = _1147;
                            float _1185 = _1149;
                            float _1187 = _719;
                            bool _1189 = !_1093;
                            float _1191 = _1181;
                            float _1193 = _1183;
                            float _1195 = _1185;
                            if (!_1189)
                            {
                                float _1197 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                float _1199 = _697 + _1197;
                                float _1201 = _1101 + (-1.0);
                                float _1203 = _1199 * _1095;
                                float _1205 = -_1203;
                                float _1207 = _1205 + 1.0;
                                float _1209 = _1101 * _1203;
                                float _1211 = abs(_1207);
                                float _1213 = log2(_1211);
                                float _1215 = _1213 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                float _1217 = exp2(_1215);
                                float _1219 = fma(_1201, _1217, 1.0);
                                float _1221 = 1.0 / _1219;
                                float _1223 = _1209 * _1221;
                                float _1225 = fma(_1073, _1223, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                _1191 = _1213;
                                _1193 = _1221;
                                _1195 = _1217;
                                _721 = _1225;
                            }
                            float _1227 = _1191;
                            float _1229 = _1193;
                            float _1231 = _1195;
                            float _1233 = _721;
                            float _1235 = precise::max(0.0, _1233);
                            float _1237 = precise::max(0.0, _1141);
                            float _1239 = precise::max(0.0, _1187);
                            float _1241 = precise::min(_1235, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                            float _1243 = precise::min(_1237, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                            float _1245 = precise::min(_1239, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                            _605 = _1227;
                            _607 = _1229;
                            _609 = _1231;
                            _829 = _1243;
                            _831 = _1241;
                            _833 = _1243;
                            _835 = _1245;
                            _837 = _1241;
                            _839 = true;
                        }
                        else
                        {
                            bool _1247 = _893 != 2.0;
                            bool _1249 = isnan(_893);
                            bool _1251 = _1247 || _1249;
                            bool _1253 = isnan(2.0);
                            bool _1255 = _1251 || _1253;
                            if (!_1255)
                            {
                                float _1257 = _695 * 0.715200006961822509765625;
                                float _1259 = fma(_699, 0.2125999927520751953125, _1257);
                                float _1261 = fma(_697, 0.072200000286102294921875, _1259);
                                float _1263 = spvFAdd(_1261, 9.9999999747524270787835121154785e-07);
                                bool _1265 = _1261 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                bool _1267 = isnan(_1261);
                                bool _1269 = _1265 || _1267;
                                bool _1271 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                bool _1273 = _1269 || _1271;
                                float _1275 = 1.0 / _1263;
                                if (!_1273)
                                {
                                    _423 = _1261;
                                }
                                float _1277 = _423;
                                bool _1279 = !_1273;
                                float _1281 = _1277;
                                if (!_1279)
                                {
                                    float _1283 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    float _1285 = _1261 + _1283;
                                    float _1287 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    float _1289 = spvFAdd(_1287, 1.00000095367431640625);
                                    float _1291 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    float _1293 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1291;
                                    float _1295 = 1.0 / _1289;
                                    float _1297 = _1285 * _1295;
                                    float _1299 = _1293 * _1295;
                                    float _1301 = -_1297;
                                    float _1303 = _1301 + 1.0;
                                    float _1305 = _1299 + (-1.0);
                                    float _1307 = _1299 * _1297;
                                    float _1309 = abs(_1303);
                                    float _1311 = log2(_1309);
                                    float _1313 = _1311 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1315 = exp2(_1313);
                                    float _1317 = fma(_1305, _1315, 1.0);
                                    float _1319 = 1.0 / _1317;
                                    float _1321 = _1307 * _1319;
                                    float _1323 = fma(_1289, _1321, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    _591 = _1311;
                                    _593 = _1317;
                                    _595 = _1315;
                                    _1281 = _1323;
                                }
                                float _1325 = _591;
                                float _1327 = _593;
                                float _1329 = _595;
                                float _1331 = _1281;
                                float _1333 = precise::max(0.0, _1331);
                                float _1335 = precise::min(_1333, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                float _1337 = _1275 * _1335;
                                float _1339 = _699 * _1337;
                                float _1341 = _695 * _1337;
                                float _1343 = _697 * _1337;
                                float _1345 = precise::max(0.0, _1339);
                                float _1347 = precise::max(0.0, _1341);
                                float _1349 = precise::max(0.0, _1343);
                                float _1351 = precise::min(_1345, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                float _1353 = precise::min(_1347, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                float _1355 = precise::min(_1349, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                _605 = _1325;
                                _607 = _1327;
                                _609 = _1329;
                                _829 = _1351;
                                _831 = _1355;
                                _833 = _1351;
                                _835 = _1353;
                                _837 = _1355;
                                _839 = true;
                            }
                            else
                            {
                                bool _1357 = _893 != 3.0;
                                bool _1359 = isnan(_893);
                                bool _1361 = _1357 || _1359;
                                bool _1363 = isnan(3.0);
                                bool _1365 = _1361 || _1363;
                                if (!_1365)
                                {
                                    float _1367 = -_699;
                                    float _1369 = _1367 + 1.0;
                                    float _1371 = -_695;
                                    float _1373 = _1371 + 1.0;
                                    float _1375 = -_697;
                                    float _1377 = _1375 + 1.0;
                                    float _1379 = abs(_1369);
                                    float _1381 = log2(_1379);
                                    float _1383 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1385 = abs(_1373);
                                    float _1387 = log2(_1385);
                                    float _1389 = abs(_1377);
                                    float _1391 = log2(_1389);
                                    float _1393 = _1381 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1395 = _1387 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1397 = exp2(_1393);
                                    float _1399 = _1391 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1401 = exp2(_1395);
                                    float _1403 = exp2(_1399);
                                    float _1405 = fma(_1383, _1397, 1.0);
                                    float _1407 = fma(_1383, _1401, 1.0);
                                    float _1409 = 1.0 / _1405;
                                    float _1411 = fma(_1383, _1403, 1.0);
                                    float _1413 = 1.0 / _1407;
                                    float _1415 = 1.0 / _1411;
                                    float _1417 = _1409 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    float _1419 = _1409 + _1413;
                                    float _1421 = _1413 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    float _1423 = precise::max(_1417, _1421);
                                    float _1425 = _1415 + _1419;
                                    float _1427 = _1415 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    float _1429 = _1425 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    float _1431 = precise::max(_1427, _1423);
                                    float _1433 = _1429 * 0.3333333432674407958984375;
                                    float _1435 = -_1433;
                                    float _1437 = _1431 + _1435;
                                    float _1439 = fma(_1437, (*spvDescriptorSet0.fp_c3)._m0[7].z, _1433);
                                    float _1441 = -_1417;
                                    float _1443 = _1441 + _1439;
                                    float _1445 = -_1421;
                                    float _1447 = _1445 + _1439;
                                    float _1449 = -_1427;
                                    float _1451 = _1449 + _1439;
                                    float _1453 = fma(_1443, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1417);
                                    float _1455 = fma(_1447, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1421);
                                    float _1457 = fma(_1451, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1427);
                                    float _1459 = _1453 * _699;
                                    float _1461 = _1455 * _695;
                                    float _1463 = _1457 * _697;
                                    _605 = _1453;
                                    _607 = _1395;
                                    _609 = _1451;
                                    _829 = _1459;
                                    _831 = _1463;
                                    _833 = _1459;
                                    _835 = _1461;
                                    _837 = _1463;
                                    _839 = true;
                                }
                                else
                                {
                                    bool _1465 = _893 != 4.0;
                                    bool _1467 = isnan(_893);
                                    bool _1469 = _1465 || _1467;
                                    bool _1471 = isnan(4.0);
                                    bool _1473 = _1469 || _1471;
                                    if (!_1473)
                                    {
                                        bool _1475 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        bool _1477 = isnan(0.0);
                                        bool _1479 = _1475 || _1477;
                                        bool _1481 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        bool _1483 = _1479 || _1481;
                                        if (!_1483)
                                        {
                                            float _1485 = -_699;
                                            float _1487 = _1485 + 1.0;
                                            float _1489 = abs(_1487);
                                            float _1491 = log2(_1489);
                                            float _1493 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1495 = _1491 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1497 = exp2(_1495);
                                            float _1499 = fma(_1493, _1497, 1.0);
                                            float _1501 = 1.0 / _1499;
                                            float _1503 = _1501 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            _1505 = _1495;
                                            _1507 = _1503;
                                            _1509 = true;
                                        }
                                        else
                                        {
                                            float _1511 = spvFAdd(_699, 9.9999999747524270787835121154785e-07);
                                            bool _1513 = _699 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                            bool _1515 = isnan(_699);
                                            bool _1517 = _1513 || _1515;
                                            bool _1519 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                            bool _1521 = _1517 || _1519;
                                            float _1523 = 1.0 / _1511;
                                            if (!_1521)
                                            {
                                                _425 = _699;
                                            }
                                            float _1525 = _425;
                                            bool _1527 = !_1521;
                                            float _1529 = _1525;
                                            if (!_1527)
                                            {
                                                float _1531 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1533 = _699 + _1531;
                                                float _1535 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1537 = spvFAdd(_1535, 1.00000095367431640625);
                                                float _1539 = 1.0 / _1537;
                                                float _1541 = _1533 * _1539;
                                                float _1543 = -_1541;
                                                float _1545 = _1543 + 1.0;
                                                float _1547 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1549 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1547;
                                                float _1551 = abs(_1545);
                                                float _1553 = log2(_1551);
                                                float _1555 = _1549 * _1539;
                                                float _1557 = _1555 + (-1.0);
                                                float _1559 = _1555 * _1541;
                                                float _1561 = _1553 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _1563 = exp2(_1561);
                                                float _1565 = fma(_1557, _1563, 1.0);
                                                float _1567 = 1.0 / _1565;
                                                float _1569 = _1559 * _1567;
                                                float _1571 = fma(_1537, _1569, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                                _597 = _1553;
                                                _1529 = _1571;
                                                _427 = _1569;
                                                _599 = _1565;
                                            }
                                            float _1573 = _597;
                                            float _1575 = _1529;
                                            float _1577 = _427;
                                            float _1579 = _599;
                                            float _1581 = precise::max(0.0, _1575);
                                            float _1583 = precise::min(_1581, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                            float _1585 = _1583 * _1523;
                                            _601 = _1573;
                                            _1505 = _1577;
                                            _603 = _1579;
                                            _1507 = _1585;
                                        }
                                        _1509 = false;
                                        float _1587 = _601;
                                        float _1589 = _1505;
                                        float _1591 = _603;
                                        float _1593 = _1507;
                                        float _1595 = _1589;
                                        float _1597 = _1587;
                                        float _1599 = _1591;
                                        float _1601 = _1587;
                                        if (!_1483)
                                        {
                                            float _1603 = -_695;
                                            float _1605 = _1603 + 1.0;
                                            float _1607 = abs(_1605);
                                            float _1609 = log2(_1607);
                                            float _1611 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1613 = _1609 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1615 = exp2(_1613);
                                            float _1617 = fma(_1611, _1615, 1.0);
                                            float _1619 = 1.0 / _1617;
                                            float _1621 = _1619 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            _1623 = _1615;
                                            _1625 = _1621;
                                            _1627 = true;
                                        }
                                        else
                                        {
                                            float _1629 = spvFAdd(_695, 9.9999999747524270787835121154785e-07);
                                            bool _1631 = _695 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                            bool _1633 = isnan(_695);
                                            bool _1635 = _1631 || _1633;
                                            bool _1637 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                            bool _1639 = _1635 || _1637;
                                            float _1641 = 1.0 / _1629;
                                            if (!_1639)
                                            {
                                                _1595 = _695;
                                            }
                                            float _1643 = _1595;
                                            bool _1645 = !_1639;
                                            float _1647 = _1643;
                                            if (!_1645)
                                            {
                                                float _1649 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1651 = _695 + _1649;
                                                float _1653 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1655 = spvFAdd(_1653, 1.00000095367431640625);
                                                float _1657 = 1.0 / _1655;
                                                float _1659 = _1651 * _1657;
                                                float _1661 = -_1659;
                                                float _1663 = _1661 + 1.0;
                                                float _1665 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1667 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1665;
                                                float _1669 = abs(_1663);
                                                float _1671 = log2(_1669);
                                                float _1673 = _1667 * _1657;
                                                float _1675 = _1673 + (-1.0);
                                                float _1677 = _1673 * _1659;
                                                float _1679 = _1671 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _1681 = exp2(_1679);
                                                float _1683 = fma(_1675, _1681, 1.0);
                                                float _1685 = 1.0 / _1683;
                                                float _1687 = _1677 * _1685;
                                                float _1689 = fma(_1655, _1687, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                                _1597 = _1683;
                                                _1647 = _1689;
                                                _1599 = _1677;
                                            }
                                            float _1691 = _1597;
                                            float _1693 = _1647;
                                            float _1695 = _1599;
                                            float _1697 = precise::max(0.0, _1693);
                                            float _1699 = precise::min(_1697, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                            float _1701 = _1699 * _1641;
                                            _1601 = _1691;
                                            _1623 = _1695;
                                            _1625 = _1701;
                                        }
                                        _1627 = false;
                                        float _1703 = _1601;
                                        float _1705 = _1623;
                                        float _1707 = _1625;
                                        float _1709 = _1705;
                                        float _1711 = _1703;
                                        if (!_1483)
                                        {
                                            float _1713 = -_697;
                                            float _1715 = _1713 + 1.0;
                                            float _1717 = abs(_1715);
                                            float _1719 = log2(_1717);
                                            float _1721 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1723 = _1719 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1725 = exp2(_1723);
                                            float _1727 = fma(_1721, _1725, 1.0);
                                            float _1729 = 1.0 / _1727;
                                            float _1731 = _1729 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            _1733 = _1729;
                                            _1735 = _1731;
                                            _1737 = true;
                                        }
                                        else
                                        {
                                            float _1739 = spvFAdd(_697, 9.9999999747524270787835121154785e-07);
                                            bool _1741 = _697 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                            bool _1743 = isnan(_697);
                                            bool _1745 = _1741 || _1743;
                                            bool _1747 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                            bool _1749 = _1745 || _1747;
                                            float _1751 = 1.0 / _1739;
                                            if (!_1749)
                                            {
                                                _1709 = _697;
                                            }
                                            float _1753 = _1709;
                                            bool _1755 = !_1749;
                                            float _1757 = _1753;
                                            if (!_1755)
                                            {
                                                float _1759 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1761 = _697 + _1759;
                                                float _1763 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1765 = spvFAdd(_1763, 1.00000095367431640625);
                                                float _1767 = 1.0 / _1765;
                                                float _1769 = _1761 * _1767;
                                                float _1771 = -_1769;
                                                float _1773 = _1771 + 1.0;
                                                float _1775 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                                float _1777 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1775;
                                                float _1779 = abs(_1773);
                                                float _1781 = log2(_1779);
                                                float _1783 = _1777 * _1767;
                                                float _1785 = _1783 + (-1.0);
                                                float _1787 = _1783 * _1769;
                                                float _1789 = _1781 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _1791 = exp2(_1789);
                                                float _1793 = fma(_1785, _1791, 1.0);
                                                float _1795 = 1.0 / _1793;
                                                float _1797 = _1787 * _1795;
                                                float _1799 = fma(_1765, _1797, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                                _1711 = _1783;
                                                _911 = _1795;
                                                _1757 = _1799;
                                            }
                                            float _1801 = _1711;
                                            float _1803 = _911;
                                            float _1805 = _1757;
                                            float _1807 = precise::max(0.0, _1805);
                                            float _1809 = precise::min(_1807, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                            float _1811 = _1809 * _1751;
                                            _1733 = _1801;
                                            _913 = _1803;
                                            _1735 = _1811;
                                        }
                                        _1737 = false;
                                        float _1813 = _1733;
                                        float _1815 = _913;
                                        float _1817 = _1735;
                                        float _1819 = precise::max(_1593, _1707);
                                        float _1821 = precise::max(_1819, _1817);
                                        float _1823 = -_1593;
                                        float _1825 = _1821 + _1823;
                                        float _1827 = -_1707;
                                        float _1829 = _1821 + _1827;
                                        float _1831 = -_1817;
                                        float _1833 = _1821 + _1831;
                                        float _1835 = fma(_1825, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1593);
                                        float _1837 = fma(_1829, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1707);
                                        float _1839 = fma(_1833, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1817);
                                        float _1841 = _1835 * _699;
                                        float _1843 = _1837 * _695;
                                        float _1845 = _1839 * _697;
                                        _605 = _1829;
                                        _607 = _1813;
                                        _609 = _1833;
                                        _429 = _1815;
                                        _829 = _1841;
                                        _831 = _1845;
                                        _833 = _1841;
                                        _835 = _1843;
                                        _837 = _1845;
                                        _839 = true;
                                    }
                                    else
                                    {
                                        bool _1847 = _893 != 5.0;
                                        bool _1849 = isnan(_893);
                                        bool _1851 = _1847 || _1849;
                                        bool _1853 = isnan(5.0);
                                        bool _1855 = _1851 || _1853;
                                        if (!_1855)
                                        {
                                            _915 = as_type<int>(_577);
                                        }
                                        int _1857 = _915;
                                        float _1859 = as_type<float>(_1857);
                                        _829 = as_type<float>(_1857);
                                        _833 = as_type<float>(_1857);
                                        if (!_1855)
                                        {
                                            _917 = _579;
                                        }
                                        float _1861 = _917;
                                        float _1863 = _1861;
                                        _835 = _1861;
                                        if (!_1855)
                                        {
                                            _919 = as_type<int>(_575);
                                        }
                                        int _1865 = _919;
                                        bool _1867 = !_1855;
                                        float _1869 = as_type<float>(_1865);
                                        _831 = as_type<float>(_1865);
                                        _837 = as_type<float>(_1865);
                                        if (!_1867)
                                        {
                                            bool _1871 = _893 != 6.0;
                                            bool _1873 = isnan(_893);
                                            bool _1875 = _1871 || _1873;
                                            bool _1877 = isnan(6.0);
                                            bool _1879 = _1875 || _1877;
                                            if (!_1879)
                                            {
                                                float _1881 = -_699;
                                                float _1883 = _1881 + 1.0;
                                                float _1885 = -_695;
                                                float _1887 = _1885 + 1.0;
                                                float _1889 = -_697;
                                                float _1891 = _1889 + 1.0;
                                                float _1893 = abs(_1883);
                                                float _1895 = log2(_1893);
                                                float _1897 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                                float _1899 = abs(_1887);
                                                float _1901 = log2(_1899);
                                                float _1903 = abs(_1891);
                                                float _1905 = log2(_1903);
                                                float _1907 = _1895 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _1909 = _1901 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _1911 = exp2(_1907);
                                                float _1913 = _1905 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                float _1915 = exp2(_1909);
                                                float _1917 = exp2(_1913);
                                                float _1919 = fma(_1897, _1911, 1.0);
                                                float _1921 = fma(_1897, _1915, 1.0);
                                                float _1923 = 1.0 / _1919;
                                                float _1925 = fma(_1897, _1917, 1.0);
                                                float _1927 = 1.0 / _1921;
                                                float _1929 = 1.0 / _1925;
                                                float _1931 = _1923 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                float _1933 = _1927 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                float _1935 = precise::max(_1931, _1933);
                                                float _1937 = _1929 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                float _1939 = precise::max(_1937, _1935);
                                                float _1941 = -_1931;
                                                float _1943 = _1941 + _1939;
                                                float _1945 = -_1933;
                                                float _1947 = _1945 + _1939;
                                                float _1949 = -_1937;
                                                float _1951 = _1949 + _1939;
                                                float _1953 = fma(_1943, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1931);
                                                float _1955 = fma(_1947, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1933);
                                                float _1957 = fma(_1951, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1937);
                                                float _1959 = _1953 * _699;
                                                float _1961 = _1955 * _695;
                                                float _1963 = _1957 * _697;
                                                _605 = _1957;
                                                _607 = _1947;
                                                _609 = _1923;
                                                _829 = _1959;
                                                _831 = _1963;
                                                _833 = _1959;
                                                _835 = _1961;
                                                _837 = _1963;
                                                _839 = true;
                                            }
                                            else
                                            {
                                                bool _1965 = _893 != 7.0;
                                                bool _1967 = isnan(_893);
                                                bool _1969 = _1965 || _1967;
                                                bool _1971 = isnan(7.0);
                                                bool _1973 = _1969 || _1971;
                                                if (_1973)
                                                {
                                                    _1859 = _367;
                                                }
                                                int _1975 = as_type<int>(_1859);
                                                _829 = as_type<float>(_1975);
                                                _833 = as_type<float>(_1975);
                                                if (_1973)
                                                {
                                                    _1863 = _363;
                                                }
                                                float _1977 = _1863;
                                                _835 = _1977;
                                                if (_1973)
                                                {
                                                    _1869 = _359;
                                                }
                                                int _1979 = as_type<int>(_1869);
                                                _831 = as_type<float>(_1979);
                                                _837 = as_type<float>(_1979);
                                                if (!_1973)
                                                {
                                                    float _1981 = -_699;
                                                    float _1983 = _1981 + 1.0;
                                                    float _1985 = -_695;
                                                    float _1987 = _1985 + 1.0;
                                                    float _1989 = -_697;
                                                    float _1991 = _1989 + 1.0;
                                                    float _1993 = abs(_1983);
                                                    float _1995 = log2(_1993);
                                                    float _1997 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                                    float _1999 = abs(_1987);
                                                    float _2001 = log2(_1999);
                                                    float _2003 = abs(_1991);
                                                    float _2005 = log2(_2003);
                                                    float _2007 = _1995 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                    float _2009 = _2001 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                    float _2011 = exp2(_2007);
                                                    float _2013 = _2005 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                                    float _2015 = exp2(_2009);
                                                    float _2017 = exp2(_2013);
                                                    float _2019 = fma(_1997, _2011, 1.0);
                                                    float _2021 = fma(_1997, _2015, 1.0);
                                                    float _2023 = 1.0 / _2019;
                                                    float _2025 = fma(_1997, _2017, 1.0);
                                                    float _2027 = 1.0 / _2021;
                                                    float _2029 = 1.0 / _2025;
                                                    float _2031 = _2023 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                    float _2033 = -_699;
                                                    float _2035 = fma(_2031, _699, _2033);
                                                    float _2037 = _2027 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                    float _2039 = -_695;
                                                    float _2041 = fma(_2037, _695, _2039);
                                                    float _2043 = _2029 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                                    float _2045 = _2035 + _2041;
                                                    float _2047 = -_697;
                                                    float _2049 = fma(_2043, _697, _2047);
                                                    float _2051 = _2049 + _2045;
                                                    float _2053 = -_2035;
                                                    float _2055 = fma(_2051, 0.3333333432674407958984375, _2053);
                                                    float _2057 = -_2041;
                                                    float _2059 = fma(_2051, 0.3333333432674407958984375, _2057);
                                                    float _2061 = -_2049;
                                                    float _2063 = fma(_2051, 0.3333333432674407958984375, _2061);
                                                    float _2065 = fma(_2055, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2035);
                                                    float _2067 = fma(_2059, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2041);
                                                    float _2069 = fma(_2063, (*spvDescriptorSet0.fp_c3)._m0[6].w, _2049);
                                                    float _2071 = _2065 + _699;
                                                    float _2073 = _2067 + _695;
                                                    float _2075 = _2069 + _697;
                                                    _605 = _2059;
                                                    _607 = _2009;
                                                    _609 = _2063;
                                                    _829 = _2071;
                                                    _831 = _2075;
                                                    _833 = _2071;
                                                    _835 = _2073;
                                                    _837 = _2075;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            _839 = false;
            float _2077 = _605;
            float _2079 = _607;
            float _2081 = _609;
            float _2083 = _429;
            int _2085 = as_type<int>(_829);
            int _2087 = as_type<int>(_831);
            float _2089 = _833;
            float _2091 = _835;
            float _2093 = _837;
            float _2095 = _2089 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _2097 = _2091 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _2099 = _2093 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
            _611 = _2077;
            _723 = _2097;
            _725 = _2099;
            _727 = _2095;
            _613 = _2079;
            _615 = _2081;
            _431 = _2083;
            _433 = _2093;
            _729 = _2085;
            _435 = _2091;
            _731 = _2087;
            _437 = _2089;
            _733 = _2091;
        }
        float _2101 = _611;
        float _2103 = _723;
        float _2105 = _725;
        float _2107 = _727;
        float _2109 = _613;
        float _2111 = _615;
        float _2113 = _431;
        float _2115 = _433;
        int _2117 = _729;
        float _2119 = _435;
        int _2121 = _731;
        float _2123 = _437;
        float _2125 = _733;
        int _2127 = _401 ? 64 : 0;
        bool _2129 = _393 != 0;
        int _2131 = _343 + 1;
        bool _2133 = _2131 >= 4;
        bool _2135 = _2127 != 0;
        _307 = _2131;
        _311 = _2103;
        _313 = _2105;
        _315 = _2107;
        _317 = _2109;
        _321 = _2113;
        _323 = _2115;
        _325 = _2117;
        _327 = _2119;
        _329 = _2121;
        _331 = _2123;
        _333 = _2125;
        float _2137 = _2101;
        float _2139 = _2111;
        if (_385)
        {
            _2137 = _199;
        }
        float _2141 = _2137;
        float _2143 = _2141;
        if (_2129)
        {
            _2139 = _303;
        }
        float _2145 = _2139;
        float _2147 = _2145;
        if (_391)
        {
            _2147 = _301;
        }
        float _2149 = _2147;
        float _2151 = _2149;
        if (_397)
        {
            _2151 = _299;
        }
        float _2153 = _2151;
        float _2155 = _2153;
        if (_395)
        {
            _2155 = _305;
        }
        float _2157 = _2155;
        _319 = _2157;
        if (_387)
        {
            _2143 = _225;
        }
        float _2159 = _2143;
        _2161 = fma(_2107, _2157, _371);
        _335 = _2161;
        float _2163 = _2159;
        if (_399)
        {
            _2163 = _251;
        }
        float _2165 = _2163;
        _2167 = fma(_2103, _2157, _373);
        _337 = _2167;
        float _2169 = _2165;
        float _2171 = _2165;
        if (_2135)
        {
            _2169 = _277;
            _2171 = _277;
        }
        float _2173 = _2169;
        float _2175 = _2171;
        _2177 = fma(_2105, _2157, _375);
        _2179 = fma(_2157, _2175, _377);
        _309 = _2173;
        _339 = _2177;
        _341 = _2179;
        if (_2133)
        {
            _2181 = true;
            if (_2181)
            {
                break;
            }
        }
    } while (true);
    _2181 = false;
    out.m_34.x = _2161;
    out.m_34.y = _2167;
    out.m_34.z = _2177;
    out.m_34.w = _2179;
    return out;
}

