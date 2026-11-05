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
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c7 [[id(3)]];
    constant _16* fp_c15 [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_36 [[id(9)]];
    sampler fp_t_tcb_36Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_34 [[id(11)]];
    sampler fp_t_tcb_34Smplr [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_36Smplr_w [[id(15)]];
    sampler fp_t_tcb_34Smplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_68 [[color(0)]];
};

struct main0_in
{
    float4 m_61 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
    float4 m_45 [[user(locn4), flat]];
    float4 m_51 [[user(locn5), flat]];
    float4 m_72 [[user(locn6)]];
    float4 m_53 [[user(locn7), flat]];
    float4 m_47 [[user(locn8), flat]];
    float4 m_55 [[user(locn9)]];
    float4 m_43 [[user(locn10)]];
    float4 m_70 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _79 = gl_FragCoord.w;
    float _81 = in.m_43.z;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = (*spvDescriptorSet0.fp_c8)._m0[28].z * (*spvDescriptorSet0.fp_c8)._m0[1].x;
    float _89 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _91 = (*spvDescriptorSet0.fp_c8)._m0[29].y + _89;
    float _93 = (*spvDescriptorSet0.fp_c8)._m0[1].z * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _95 = -_87;
    float _97 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[28].x, _95);
    float _99 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _101 = (*spvDescriptorSet0.fp_c8)._m0[29].x + _99;
    float _103 = _91 * _91;
    float _105 = -_93;
    float _107 = fma((*spvDescriptorSet0.fp_c8)._m0[1].y, (*spvDescriptorSet0.fp_c8)._m0[28].z, _105);
    float _109 = _97 * _97;
    float _111 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _113 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _115 = (*spvDescriptorSet0.fp_c8)._m0[29].z + _113;
    float _117 = fma(_101, _101, _103);
    float _119 = fma(_107, _107, _109);
    float _121 = -_111;
    float _123 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[28].y, _121);
    float _125 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _127 = fma(_115, _115, _117);
    float _129 = in.m_43.y;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = fma(_123, _123, _119);
    float _137 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[1].x, _125);
    float _139 = in.m_43.x;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = rsqrt(_127);
    float _147 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[1].z, _137);
    float _149 = rsqrt(_135);
    float _151 = rsqrt(_147);
    float _153 = _115 * _145;
    float _155 = _101 * _145;
    float _157 = _91 * _145;
    float _159 = 1.0 / _79;
    float _161 = _107 * _149;
    float _163 = _97 * _149;
    float _165 = _123 * _149;
    float _167 = _153 * _161;
    float _169 = _155 * _163;
    float _171 = _157 * _165;
    float _173 = _151 * (*spvDescriptorSet0.fp_c8)._m0[1].x;
    float _175 = -_167;
    float _177 = fma(_155, _165, _175);
    float _179 = -_169;
    float _181 = fma(_157, _161, _179);
    float _183 = -_171;
    float _185 = fma(_153, _163, _183);
    float _187 = _173 * _153;
    float _189 = _151 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _191 = _159 * _85;
    float _193 = _159 * _133;
    float _195 = _151 * (*spvDescriptorSet0.fp_c8)._m0[1].z;
    float _197 = _159 * _143;
    float _199 = _189 * _155;
    float _201 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _203 = _193 + _201;
    float _205 = _195 * _157;
    float _207 = -_187;
    float _209 = fma(_195, _155, _207);
    float _211 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _213 = _197 + _211;
    float _215 = _203 * _177;
    float _217 = -_205;
    float _219 = fma(_189, _153, _217);
    float _221 = _209 * _203;
    float _223 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _225 = _191 + _223;
    float _227 = -_199;
    float _229 = fma(_173, _157, _227);
    float _231 = fma(_213, _185, _215);
    float _233 = fma(_219, _213, _221);
    float _235 = fma(_225, _181, _231);
    float _237 = fma(_229, _225, _233);
    float _239 = in.m_45.y;
    float _241 = _235 * _235;
    float _243 = abs(_237);
    float _245 = abs(_235);
    float _247 = precise::max(_243, _245);
    float _249 = fma(_237, _237, _241);
    bool _252 = _247 >= 16.0;
    float _254 = fma(_237, 0.20000000298023223876953125, 0.100000001490116119384765625);
    float _256 = sqrt(_249);
    float _258 = _235;
    float _260 = _237;
    int _263 = as_type<int>(_181);
    float _265 = 0.20000000298023223876953125;
    if (_252)
    {
        float _267 = _235 * 0.0625;
        _258 = _267;
    }
    float _269 = _258;
    if (_252)
    {
        float _271 = _237 * 0.0625;
        _260 = _271;
    }
    float _273 = _260;
    float _275 = abs(_269);
    bool _277 = _275 != 0.0;
    bool _279 = isnan(_275);
    bool _281 = _277 || _279;
    bool _283 = isnan(0.0);
    bool _285 = _281 || _283;
    float _287 = abs(_273);
    bool _289 = _287 == 0.0;
    float _291 = abs(_273);
    bool _293 = _291 == 0.0;
    bool _295 = !_285;
    bool _297 = _293 && _295;
    float _299 = _239 * (-0.0199999995529651641845703125);
    float _301 = fma(_256, 0.25, _299);
    bool _303 = false;
    if (_297)
    {
        bool _305 = as_type<int>(_273) >= 0;
        _303 = _305;
    }
    bool _307 = _303;
    int _309 = _307 ? (-1) : 0;
    if (_297)
    {
        int _311 = _307 ? 0 : 1078530011;
        _263 = _311;
    }
    int _313 = _263;
    int _315 = _313;
    if (_297)
    {
        int _317 = int(0x80000000) & as_type<int>(_269);
        int _319 = _313 | _317;
        _265 = as_type<float>(_319);
    }
    float _321 = _265;
    bool _323 = !_285;
    bool _325 = _323 && _289;
    float _327 = _321;
    float _329 = _321;
    if (!_325)
    {
        float _331 = abs(_269);
        bool _333 = _331 != as_type<float>(0x7f800000u /* inf */);
        bool _335 = isnan(_331);
        bool _337 = _333 || _335;
        bool _339 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _341 = _337 || _339;
        float _343 = abs(_273);
        bool _345 = _343 == as_type<float>(0x7f800000u /* inf */);
        float _347 = abs(_273);
        bool _349 = _347 == as_type<float>(0x7f800000u /* inf */);
        bool _351 = !_341;
        bool _353 = _349 && _351;
        if (_353)
        {
            bool _355 = as_type<int>(_273) >= 0;
            _309 = _355 ? (-1) : 0;
        }
        int _357 = _309;
        if (_353)
        {
            _315 = 1075235812;
        }
        int _359 = _315;
        int _361 = _359;
        if (_353)
        {
            int _363 = ~_357;
            int _365 = (_363 != 0) ? _359 : 1061752795;
            _361 = _365;
        }
        int _367 = _361;
        if (_353)
        {
            int _369 = int(0x80000000) & as_type<int>(_269);
            int _371 = _367 | _369;
            _327 = as_type<float>(_371);
        }
        float _373 = _327;
        bool _375 = !_341;
        bool _377 = _375 && _345;
        _329 = _373;
        if (!_377)
        {
            float _379 = abs(_269);
            float _381 = abs(_273);
            float _383 = precise::max(_379, _381);
            float _385 = abs(_269);
            float _387 = abs(_273);
            float _389 = precise::min(_385, _387);
            float _391 = 1.0 / _383;
            float _393 = abs(_269);
            float _395 = abs(_273);
            bool _397 = _393 > _395;
            bool _399 = as_type<int>(_273) >= 0;
            float _401 = _389 * _391;
            float _403 = abs(_269);
            float _405 = abs(_273);
            float _407 = _403 + _405;
            int _409 = as_type<int>(_269) & int(0x80000000);
            float _411 = _401 * _401;
            bool _413 = _407 > as_type<float>(0x7f800000u /* inf */);
            bool _415 = isnan(_407);
            bool _417 = _413 || _415;
            bool _419 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _421 = _417 || _419;
            float _423 = _411 + 11.33538818359375;
            float _425 = fma(_411, _423, 28.84246826171875);
            float _427 = fma(_411, _425, 19.6966705322265625);
            float _429 = fma(_411, -0.82336294651031494140625, -5.674867153167724609375);
            float _431 = fma(_411, _429, -6.565555095672607421875);
            float _433 = 1.0 / _427;
            float _435 = _411 * _431;
            float _437 = _401 * _435;
            float _439 = fma(_437, _433, _401);
            float _441 = _439;
            _329 = _407;
            if (_397)
            {
                float _443 = -_439;
                float _445 = _443 + 1.57079637050628662109375;
                _441 = _445;
            }
            float _447 = _441;
            int _449 = as_type<int>(_447);
            if (!_399)
            {
                float _451 = -_447;
                float _453 = _451 + 3.1415927410125732421875;
                _449 = as_type<int>(_453);
            }
            int _455 = _449;
            if (!_421)
            {
                int _457 = _409 | _455;
                _329 = as_type<float>(_457);
            }
        }
    }
    float _459 = _329;
    float _461 = _459 * 4.7746486663818359375;
    float2 _1588 = float2(_301, _461);
    float _463 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1588, float2(0.0), isnan(_1588))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1588, float2(0.0), isnan(_1588))).w;
    float _465 = in.m_47.x;
    float _467 = in.m_49.x;
    float _469 = gl_FragCoord.w;
    float _471 = _467 * _469;
    float _473 = in.m_49.y;
    float _475 = gl_FragCoord.w;
    float _477 = _473 * _475;
    float _479 = _256 * _463;
    float _481 = _479 * 0.5;
    float _483 = _465 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _485 = _159 * _471;
    float _487 = _481 * _483;
    float _489 = _159 * _477;
    float _491 = fma(_301, _487, _485);
    float _493 = fma(_461, _487, _489);
    float2 _1643;
    _1643.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_491, _493));
    _1643.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_491, _493));
    float _495 = _1643.x;
    float _497 = _495 * 256.0;
    int _499 = int(_497);
    float _501 = in.m_51.y;
    float _503 = in.m_51.x;
    float _505 = in.m_51.z;
    float _507 = -_501;
    float _509 = _507 + (*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _511 = -_503;
    float _513 = _511 + (*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _515 = -_505;
    float _517 = _515 + (*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _519 = -_501;
    float _521 = _193 + _519;
    float _523 = _509 * _509;
    float _525 = -_503;
    float _527 = _197 + _525;
    float _529 = -_505;
    float _531 = _191 + _529;
    float _533 = fma(_513, _513, _523);
    float _535 = fma(_517, _517, _533);
    float _537 = rsqrt(_535);
    float _539 = _509 * _537;
    float _541 = _517 * _537;
    float _543 = _513 * _537;
    float _545 = _157 * _219;
    float _547 = _195 * _539;
    float _549 = _173 * _541;
    float _551 = _189 * _543;
    float _553 = -_547;
    float _555 = fma(_189, _541, _553);
    float _557 = _153 * _209;
    float _559 = _155 * _229;
    float _561 = -_551;
    float _563 = fma(_173, _539, _561);
    float _565 = -_549;
    float _567 = fma(_195, _543, _565);
    float _569 = -_557;
    float _571 = fma(_157, _229, _569);
    float _573 = -_559;
    float _575 = fma(_153, _219, _573);
    float _577 = in.m_53.y;
    float _579 = _543 * _563;
    float _581 = _541 * _567;
    float _583 = -_545;
    float _585 = fma(_155, _209, _583);
    float _587 = _539 * _555;
    float _589 = -_579;
    float _591 = fma(_541, _555, _589);
    float _593 = -_581;
    float _595 = fma(_539, _563, _593);
    float _597 = _567 * _521;
    float _599 = _203 * _575;
    float _601 = _521 * _591;
    float _603 = -_587;
    float _605 = fma(_543, _567, _603);
    float _607 = fma(_555, _527, _597);
    float _609 = fma(_213, _571, _599);
    float _611 = fma(_527, _595, _601);
    float _613 = fma(_563, _531, _607);
    float _615 = fma(_225, _585, _609);
    float _617 = fma(_531, _605, _611);
    float _619 = -_615;
    float _621 = _619 + 0.5;
    float _623 = fma((*spvDescriptorSet0.fp_c10)._m0[2].x, 0.00999999977648258209228515625, (*spvDescriptorSet0.fp_c7)._m0[0].x);
    float _625 = _623 + _254;
    float _627 = fma(_613, _577, 0.5);
    float _629 = -_617;
    float _631 = fma(_629, _577, 0.5);
    float2 _1851 = float2(_627, _631);
    float _633 = dm_bs(spvDescriptorSet0.fp_t_tcb_36.sample(spvDescriptorSet0.fp_t_tcb_36Smplr, select(_1851, float2(0.0), isnan(_1851))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_36, spvDescriptorSet0.fp_t_tcb_36Smplr_w, select(_1851, float2(0.0), isnan(_1851))).w;
    float _635 = float(uint(_499));
    float _637 = _635 * 0.00390625;
    float _639 = precise::min(_637, 2.0);
    float2 _1868 = float2(_491, _493);
    float _641 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1868, float2(0.0), isnan(_1868)), level(_639)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1868, float2(0.0), isnan(_1868)), level(_639)).w;
    float2 _1877 = float2(_625, _621);
    float3 _645 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_1877, float2(0.0), isnan(_1877))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_1877, float2(0.0), isnan(_1877))).xyz;
    float _647 = _645.x;
    float _649 = _645.y;
    float _651 = _645.z;
    float _653 = in.m_55.y;
    float _655 = gl_FragCoord.w;
    float _657 = _653 * _655;
    float _659 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _661 = in.m_55.x;
    float _663 = gl_FragCoord.w;
    float _665 = _661 * _663;
    float _667 = in.m_55.z;
    float _669 = gl_FragCoord.w;
    float _671 = _667 * _669;
    float _673 = -_193;
    float _675 = _673 + (*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _677 = -_197;
    float _679 = _677 + (*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _681 = -_191;
    float _683 = _681 + (*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _685 = _159 * _657;
    bool _687 = as_type<int>(_659) != 0;
    float _689 = _159 * _665;
    bool _691 = !_687;
    float _693 = -_685;
    float _695 = _691 ? _693 : _685;
    float _697 = _159 * _671;
    bool _699 = !_687;
    float _701 = -_689;
    float _703 = _699 ? _701 : _689;
    float _705 = _695 * _695;
    bool _707 = !_687;
    float _709 = -_697;
    float _711 = _707 ? _709 : _697;
    float _713 = fma(_703, _703, _705);
    float _715 = fma(_711, _711, _713);
    float _717 = _675 * _675;
    float _719 = fma(_679, _679, _717);
    float _721 = rsqrt(_715);
    float _723 = fma(_683, _683, _719);
    float _725 = rsqrt(_723);
    float _727 = _695 * _721;
    float _729 = _703 * _721;
    float _731 = _711 * _721;
    float _733 = _727 * _727;
    float _735 = fma(_729, _729, _733);
    float _737 = _675 * _725;
    float _739 = in.m_61.w;
    float _741 = gl_FragCoord.w;
    float _743 = _739 * _741;
    float _745 = _679 * _725;
    float _747 = fma(_731, _731, _735);
    float _749 = _683 * _725;
    float _751 = rsqrt(_747);
    float _753 = _727 * _751;
    float _755 = _729 * _751;
    float _757 = in.m_63.x;
    float _759 = gl_FragCoord.w;
    float _761 = _757 * _759;
    float _763 = _731 * _751;
    float _765 = _737 * _753;
    float _767 = fma(_745, _755, _765);
    float _769 = _159 * _743;
    float _771 = fma(_749, _763, _767);
    float _773 = fma(_771, 0.5, 0.5);
    float _775 = in.m_61.z;
    float _777 = gl_FragCoord.w;
    float _779 = _775 * _777;
    float _781 = in.m_65.y;
    float _783 = gl_FragCoord.w;
    float _785 = _781 * _783;
    float _787 = in.m_65.z;
    float _789 = gl_FragCoord.w;
    float _791 = _787 * _789;
    float _793 = -_633;
    float _795 = _641 + _793;
    float _797 = _769 + 0.300000011920928955078125;
    float _799 = precise::max(_769, _795);
    float _801 = precise::min(_797, _799);
    float _803 = -_769;
    float _805 = _803 + _801;
    float _807 = _159 * _761;
    float _809 = _805 * 5.0;
    float _811 = 0.0 + _809;
    float _813 = precise::clamp(_811, 0.0, 1.0);
    float _815 = _813 * _807;
    bool _817 = _815 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _819 = isnan(_815);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _825 = _821 || _823;
    float _827 = in.m_61.x;
    float _829 = gl_FragCoord.w;
    float _831 = _827 * _829;
    float _833 = in.m_61.y;
    float _835 = gl_FragCoord.w;
    float _837 = _833 * _835;
    float _839 = in.m_65.x;
    float _841 = gl_FragCoord.w;
    float _843 = _839 * _841;
    if (!_825)
    {
        discard_fragment();
    }
    float _845 = _647 * _647;
    float _847 = _649 * _649;
    float _849 = _651 * _651;
    float _851 = _159 * _831;
    float _853 = _159 * _837;
    float _855 = _159 * _779;
    float _857 = fma(_845, (*spvDescriptorSet0.fp_c9)._m0[106].x, _851);
    float _859 = fma(_847, (*spvDescriptorSet0.fp_c9)._m0[106].x, _853);
    float _861 = _159 * _843;
    float _863 = fma(_849, (*spvDescriptorSet0.fp_c9)._m0[106].x, _855);
    float _865 = _159 * _785;
    float _867 = _159 * _791;
    float _869 = fma(_773, _861, _857);
    float _871 = fma(_773, _865, _859);
    float _873 = fma(_773, _867, _863);
    if (!_825)
    {
        out.m_68.x = _869;
        out.m_68.y = _871;
        out.m_68.z = _873;
        out.m_68.w = _809;
        return out;
    }
    float _875 = _871 * 0.715200006961822509765625;
    float _877 = in.m_70.w;
    float _879 = gl_FragCoord.w;
    float _881 = _877 * _879;
    float _883 = in.m_70.z;
    float _885 = gl_FragCoord.w;
    float _887 = _883 * _885;
    float _889 = in.m_70.x;
    float _891 = gl_FragCoord.w;
    float _893 = _889 * _891;
    float _895 = fma(_869, 0.2125999927520751953125, _875);
    float _897 = in.m_70.y;
    float _899 = gl_FragCoord.w;
    float _901 = _897 * _899;
    float _903 = fma(_873, 0.072200000286102294921875, _895);
    bool _905 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _907 = 0.0 + _815;
    float _909 = precise::clamp(_907, 0.0, 1.0);
    float _911 = 1.0 / _903;
    float _913 = _911 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _915 = precise::clamp(_913, 0.0, 1.0);
    float _917 = _159 * _881;
    float _919 = fma(_915, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _921 = _159 * _887;
    float _923 = _159 * _893;
    float _925 = _919 * _917;
    float _927 = _159 * _901;
    float _929 = fma(_873, _925, _921);
    float _931 = fma(_869, _925, _923);
    float _933 = fma(_871, _925, _927);
    float _935 = _921;
    if (!_905)
    {
        _935 = _909;
    }
    float _937 = _935;
    bool _939 = !_905;
    float _941 = _937;
    if (!_939)
    {
        float _943 = in.m_72.w;
        float _945 = gl_FragCoord.w;
        float _947 = _943 * _945;
        float _949 = in.m_72.z;
        float _951 = gl_FragCoord.w;
        float _953 = _949 * _951;
        float _955 = _159 * _947;
        float _957 = _159 * _953;
        float _959 = 1.0 / _955;
        float _961 = _957 * _959;
        float _963 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _965 = fma(_961, (*spvDescriptorSet0.fp_c8)._m0[30].w, _963);
        float _967 = 1.0 / _965;
        float _969 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _971 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _973 = fma(_967, _969, _971);
        float _975 = _973 * 8.0;
        float _977 = precise::clamp(_975, 0.0, 1.0);
        float _979 = _909 * _977;
        _941 = _979;
    }
    float _981 = _941;
    float _983 = 0.0 + _981;
    float _985 = precise::clamp(_983, 0.0, 1.0);
    out.m_68.x = _931;
    out.m_68.y = _933;
    out.m_68.z = _929;
    out.m_68.w = _985;
    return out;
}

