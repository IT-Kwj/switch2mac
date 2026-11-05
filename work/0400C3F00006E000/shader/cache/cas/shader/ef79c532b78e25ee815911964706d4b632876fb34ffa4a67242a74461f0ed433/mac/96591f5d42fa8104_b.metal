#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>
#include <metal_atomic>

using namespace metal;

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

struct _27
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c3 [[id(0)]];
    constant _16* cp_c4 [[id(1)]];
    constant _16* cp_c5 [[id(2)]];
    device _27* cp_s0 [[id(3)]];
};

static inline __attribute__((always_inline))
void _42(thread const int& _2449, thread const int& _2450, device _27& cp_s0)
{
    uint _2453 = uint(int(uint(_2449) >> uint(2)));
    int _2455 = _2449 & 3;
    int _2457 = _2455 << 3;
    bool _2459;
    do
    {
        float _2461 = as_type<float>(cp_s0._m0[int(_2453)]);
        int _2463 = int(insert_bits(as_type<uint>(_2461), uint(_2450), uint(_2457), 16u));
        uint _2493 = as_type<uint>(_2461);
        uint _2498;
        do
        {
            _2498 = _2493;
        } while (!atomic_compare_exchange_weak_explicit((device atomic_uint*)&cp_s0._m0[int(_2453)], &_2498, uint(_2463), memory_order_relaxed, memory_order_relaxed) && _2498 == _2493);
        uint _2465 = _2498;
        _2459 = int(_2465) != as_type<int>(_2461);
    } while (_2459);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _999 = false;
    bool _363 = false;
    float _46 = as_type<float>(gl_LocalInvocationID.x);
    float _48 = 1.0 / (*spvDescriptorSet0.cp_c5)._m0[1].z;
    float _50 = as_type<float>(gl_WorkGroupID.x);
    float _52 = as_type<float>(gl_WorkGroupID.y);
    float _54 = abs((*spvDescriptorSet0.cp_c5)._m0[1].z);
    float _56 = log2(_54);
    float _58 = (*spvDescriptorSet0.cp_c5)._m0[3].z * (*spvDescriptorSet0.cp_c5)._m0[3].y;
    float _60 = float(as_type<uint>(_46));
    float _62 = _56 * _48;
    int _64 = as_type<int>(_46) + 1;
    float _66 = _60 * _62;
    float _68 = float(uint(_64));
    float _70 = float(as_type<uint>(_50));
    int _72 = as_type<int>(_46) * as_type<int>((*spvDescriptorSet0.cp_c5)._m0[0].y);
    int _74 = _72 + as_type<int>(_52);
    float _76 = _68 * _62;
    float _78 = exp2(_66);
    float _80 = -(*spvDescriptorSet0.cp_c5)._m0[1].x;
    float _82 = fma(0.5, _80, _70);
    float _84 = float(as_type<uint>(_52));
    bool _88 = _82 > 0.0;
    float _90 = -(*spvDescriptorSet0.cp_c5)._m0[1].y;
    float _92 = fma(0.5, _90, _84);
    float _94 = exp2(_76);
    bool _96 = _82 > (-1.0);
    float _98 = -_92;
    float _100 = _98 + (-1.0);
    float _102 = -_92;
    bool _104 = _102 > 1.0;
    bool _106 = _92 >= 0.0;
    bool _108 = isnan(_92);
    bool _110 = _106 || _108;
    bool _112 = isnan(0.0);
    bool _114 = _110 || _112;
    float _116 = _78 + (-1.0);
    float _118 = -_58;
    float _120 = -(*spvDescriptorSet0.cp_c5)._m0[3].x;
    float _122 = fma(_116, _118, _120);
    float _124 = _94 + (-1.0);
    float _126 = _122 * (*spvDescriptorSet0.cp_c5)._m0[0].w;
    float _128 = -(*spvDescriptorSet0.cp_c5)._m0[4].x;
    float _130 = _122 * _128;
    float _132 = _122 * (*spvDescriptorSet0.cp_c5)._m0[2].w;
    float _134 = -_58;
    float _136 = -(*spvDescriptorSet0.cp_c5)._m0[3].x;
    float _138 = fma(_124, _134, _136);
    float _140 = _82 + 1.0;
    float _142 = -_126;
    float _144 = fma(_82, _142, _130);
    float _146 = -(*spvDescriptorSet0.cp_c5)._m0[4].y;
    float _148 = _122 * _146;
    float _150 = _138 * (*spvDescriptorSet0.cp_c5)._m0[0].w;
    float _152 = -(*spvDescriptorSet0.cp_c5)._m0[4].x;
    float _154 = _138 * _152;
    float _156 = _138 * (*spvDescriptorSet0.cp_c5)._m0[2].w;
    float _158 = -(*spvDescriptorSet0.cp_c5)._m0[4].y;
    float _160 = _138 * _158;
    float _162 = -_132;
    float _164 = fma(_100, _162, _148);
    float _166 = _144;
    float _168 = _164;
    if (!_88)
    {
        float _170 = -_150;
        float _172 = fma(_82, _170, _154);
        _166 = _172;
    }
    float _174 = _166;
    bool _176 = 0 != as_type<int>((*spvDescriptorSet0.cp_c5)._m0[2].y);
    float _178 = -_150;
    float _180 = fma(_140, _178, _154);
    float _182 = fma(_92, _156, _160);
    float _184 = _180;
    float _186 = _182;
    if (!_104)
    {
        float _188 = -_156;
        float _190 = fma(_100, _188, _160);
        _168 = _190;
    }
    float _192 = _168;
    if (!_96)
    {
        float _194 = -_126;
        float _196 = fma(_140, _194, _130);
        _184 = _196;
    }
    float _198 = _184;
    if (_114)
    {
        float _200 = fma(_92, _132, _148);
        _186 = _200;
    }
    float _202 = _186;
    int _204 = _74 * as_type<int>((*spvDescriptorSet0.cp_c5)._m0[0].x);
    int _206 = _204 + as_type<int>(_50);
    float _208 = -_138;
    float _210 = _122 + _208;
    float _212 = _174 + _198;
    float _214 = _192 + _202;
    float _216 = -_174;
    float _218 = _216 + _198;
    float _220 = -_192;
    float _222 = _220 + _202;
    bool _224 = !_176;
    uint _361;
    if (!_224)
    {
        float _226 = _122 + _138;
        int _228 = 0;
        uint _231 = 0u;
        bool _233;
        do
        {
            int _235 = _228;
            uint _237 = _231;
            int _239 = _235 << 5;
            uint _241 = uint(int(uint(_239) >> uint(2)));
            uint _243 = uint(int(uint(int(_241)) >> uint(2)));
            int _245 = int(_241) & 3;
            float _247 = (*spvDescriptorSet0.cp_c3)._m0[int(_243)][_245];
            int _249 = int(_241) + 1;
            uint _251 = uint(int(uint(_249) >> uint(2)));
            int _253 = _249 & 3;
            float _255 = (*spvDescriptorSet0.cp_c3)._m0[int(_251)][_253];
            int _257 = _239 + 8;
            uint _259 = uint(int(uint(_257) >> uint(2)));
            uint _261 = uint(int(uint(int(_259)) >> uint(2)));
            int _263 = int(_259) & 3;
            float _265 = (*spvDescriptorSet0.cp_c3)._m0[int(_261)][_263];
            int _267 = int(_259) + 1;
            uint _269 = uint(int(uint(_267) >> uint(2)));
            int _271 = _267 & 3;
            float _273 = (*spvDescriptorSet0.cp_c3)._m0[int(_269)][_271];
            float _275 = -_255;
            float _277 = fma(_214, 0.5, _275);
            float _279 = -_247;
            float _281 = fma(_212, 0.5, _279);
            float _283 = abs(_277);
            float _285 = fma(_222, -0.5, _283);
            float _287 = abs(_281);
            float _289 = fma(_218, -0.5, _287);
            float _291 = -_265;
            float _293 = fma(_226, 0.5, _291);
            float _295 = precise::max(0.0, _285);
            float _297 = precise::max(0.0, _289);
            float _299 = abs(_293);
            float _301 = fma(_210, -0.5, _299);
            float _303 = _295 * _295;
            float _305 = precise::max(0.0, _301);
            float _307 = fma(_297, _297, _303);
            float _309 = _273 * _273;
            float _311 = fma(_305, _305, _307);
            bool _313 = _311 > _309;
            bool _315 = isnan(_311);
            bool _317 = _313 || _315;
            bool _319 = isnan(_309);
            bool _321 = _317 || _319;
            int _323 = as_type<int>(_309);
            int _325 = _239;
            uint _327 = _237;
            if (!_321)
            {
                bool _329 = _237 >= 32u;
                if (!_329)
                {
                    int _331 = _206 * 68;
                    int _333 = _331 + int(_237);
                    _323 = _333;
                }
                int _335 = _323;
                int _337 = _335;
                if (!_329)
                {
                    int _339 = _235 & 65535;
                    _325 = _339;
                }
                int _341 = _325;
                int _343 = int(_237) + 1;
                _327 = uint(_343);
                if (!_329)
                {
                    int _345 = _335 << 1;
                    int _347 = _345 + 8;
                    _337 = _347;
                }
                int _349 = _337;
                if (!_329)
                {
                    int _351 = _349;
                    int _353 = _341;
                    _42(_351, _353, (*spvDescriptorSet0.cp_s0));
                }
            }
            uint _355 = _327;
            int _357 = _235 + 1;
            bool _359 = uint(_357) >= as_type<uint>((*spvDescriptorSet0.cp_c5)._m0[2].y);
            _233 = !_359;
            _228 = _357;
            _231 = _355;
            _361 = _355;
        } while (_233);
        _363 = true;
    }
    else
    {
        _361 = 0u;
    }
    _363 = false;
    uint _365 = _361;
    bool _367 = 0 != as_type<int>((*spvDescriptorSet0.cp_c5)._m0[2].z);
    int _369 = _206 * 136;
    uint _371 = min(_365, 32u);
    uint _373 = uint(int(uint(_369) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_373)] = _371;
    bool _375 = !_367;
    int _377 = _367 ? (-1) : 0;
    uint _997;
    if (!_375)
    {
        float _379 = -_198;
        float _381 = _174 + _379;
        float _383 = -_202;
        float _385 = _192 + _383;
        float _387 = -_122;
        float _389 = _387 + _138;
        int _391 = 0;
        float _393 = 0.0;
        uint _395 = 0u;
        bool _397;
        uint _991;
        do
        {
            int _399 = _391;
            int _401 = as_type<int>(_393);
            int _403 = _377;
            uint _405 = _395;
            int _407 = _399 * 96;
            int _409 = _407 + 16;
            uint _411 = uint(int(uint(_409) >> uint(2)));
            uint _413 = uint(int(uint(int(_411)) >> uint(2)));
            int _415 = int(_411) & 3;
            float _417 = (*spvDescriptorSet0.cp_c4)._m0[int(_413)][_415];
            int _419 = int(_411) + 1;
            uint _421 = uint(int(uint(_419) >> uint(2)));
            int _423 = _419 & 3;
            float _425 = (*spvDescriptorSet0.cp_c4)._m0[int(_421)][_423];
            uint _427 = uint(int(uint(_407) >> uint(2)));
            uint _429 = uint(int(uint(int(_427)) >> uint(2)));
            int _431 = int(_427) & 3;
            float _433 = (*spvDescriptorSet0.cp_c4)._m0[int(_429)][_431];
            int _435 = int(_427) + 1;
            uint _437 = uint(int(uint(_435) >> uint(2)));
            int _439 = _435 & 3;
            float _441 = (*spvDescriptorSet0.cp_c4)._m0[int(_437)][_439];
            int _443 = _407 + 24;
            uint _445 = uint(int(uint(_443) >> uint(2)));
            uint _447 = uint(int(uint(int(_445)) >> uint(2)));
            int _449 = int(_445) & 3;
            float _451 = (*spvDescriptorSet0.cp_c4)._m0[int(_447)][_449];
            int _453 = _407 + 8;
            uint _455 = uint(int(uint(_453) >> uint(2)));
            uint _457 = uint(int(uint(int(_455)) >> uint(2)));
            int _459 = int(_455) & 3;
            float _461 = (*spvDescriptorSet0.cp_c4)._m0[int(_457)][_459];
            bool _463 = _425 >= 0.0;
            bool _465 = isnan(_425);
            bool _467 = _463 || _465;
            bool _469 = isnan(0.0);
            bool _471 = _467 || _469;
            float _473 = float(_471);
            bool _475 = _417 >= 0.0;
            bool _477 = isnan(_417);
            bool _479 = _475 || _477;
            bool _481 = isnan(0.0);
            bool _483 = _479 || _481;
            float _485 = float(_483);
            float _487 = -_441;
            float _489 = _192 + _487;
            float _491 = -_433;
            float _493 = _174 + _491;
            float _495 = fma(_222, _473, _489);
            float _497 = fma(_218, _485, _493);
            bool _499 = _451 >= 0.0;
            bool _501 = isnan(_451);
            bool _503 = _499 || _501;
            bool _505 = isnan(0.0);
            bool _507 = _503 || _505;
            float _509 = float(_507);
            float _511 = _495 * _425;
            float _513 = fma(_497, _417, _511);
            float _515 = -_461;
            float _517 = _138 + _515;
            float _519 = fma(_210, _509, _517);
            float _521 = fma(_519, _451, _513);
            float _523 = -_441;
            float _525 = _202 + _523;
            bool _527 = _521 >= 0.0;
            float _529 = -_433;
            float _531 = _198 + _529;
            float _533 = fma(_473, _385, _525);
            float _535 = fma(_485, _381, _531);
            float _537 = -_461;
            float _539 = _122 + _537;
            float _541 = fma(_509, _389, _539);
            int _543 = _401;
            float _545 = _525;
            int _547 = _403;
            int _549 = as_type<int>(_541);
            uint _551 = _405;
            if (_527)
            {
                int _553 = _407 + 12;
                uint _555 = uint(int(uint(_553) >> uint(2)));
                uint _557 = uint(int(uint(int(_555)) >> uint(2)));
                int _559 = int(_555) & 3;
                float _561 = (*spvDescriptorSet0.cp_c4)._m0[int(_557)][_559];
                _543 = as_type<int>(_561);
            }
            int _563 = _543;
            if (_527)
            {
                float _565 = _535 * _417;
                _545 = _565;
            }
            float _567 = _545;
            float _569 = _567;
            if (_527)
            {
                float _571 = -_533;
                float _573 = -_567;
                float _575 = fma(_571, _425, _573);
                _569 = _575;
            }
            float _577 = _569;
            float _579 = _577;
            if (_527)
            {
                float _581 = -_541;
                float _583 = fma(_581, _451, _577);
                _579 = _583;
            }
            float _585 = _579;
            float _587 = -as_type<float>(_563);
            bool _589 = _585 >= _587;
            bool _591 = _589 && _527;
            _393 = as_type<float>(_563);
            int _593 = as_type<int>(_585);
            if (!_591)
            {
                _547 = 0;
            }
            int _595 = _547;
            bool _597 = !_591;
            int _599 = _595;
            if (!_597)
            {
                int _601 = _407 + 32;
                uint _603 = uint(int(uint(_601) >> uint(2)));
                uint _605 = uint(int(uint(int(_603)) >> uint(2)));
                int _607 = int(_603) & 3;
                float _609 = (*spvDescriptorSet0.cp_c4)._m0[int(_605)][_607];
                int _611 = int(_603) + 1;
                uint _613 = uint(int(uint(_611) >> uint(2)));
                int _615 = _611 & 3;
                float _617 = (*spvDescriptorSet0.cp_c4)._m0[int(_613)][_615];
                int _619 = _407 + 40;
                uint _621 = uint(int(uint(_619) >> uint(2)));
                uint _623 = uint(int(uint(int(_621)) >> uint(2)));
                int _625 = int(_621) & 3;
                float _627 = (*spvDescriptorSet0.cp_c4)._m0[int(_623)][_625];
                int _629 = _407 + 48;
                uint _631 = uint(int(uint(_629) >> uint(2)));
                uint _633 = uint(int(uint(int(_631)) >> uint(2)));
                int _635 = int(_631) & 3;
                float _637 = (*spvDescriptorSet0.cp_c4)._m0[int(_633)][_635];
                int _639 = int(_631) + 1;
                uint _641 = uint(int(uint(_639) >> uint(2)));
                int _643 = _639 & 3;
                float _645 = (*spvDescriptorSet0.cp_c4)._m0[int(_641)][_643];
                bool _647 = _617 >= 0.0;
                bool _649 = isnan(_617);
                bool _651 = _647 || _649;
                bool _653 = isnan(0.0);
                bool _655 = _651 || _653;
                float _657 = float(_655);
                int _659 = _407 + 64;
                uint _661 = uint(int(uint(_659) >> uint(2)));
                uint _663 = uint(int(uint(int(_661)) >> uint(2)));
                int _665 = int(_661) & 3;
                float _667 = (*spvDescriptorSet0.cp_c4)._m0[int(_663)][_665];
                int _669 = int(_661) + 1;
                uint _671 = uint(int(uint(_669) >> uint(2)));
                int _673 = _669 & 3;
                float _675 = (*spvDescriptorSet0.cp_c4)._m0[int(_671)][_673];
                bool _677 = _609 >= 0.0;
                bool _679 = isnan(_609);
                bool _681 = _677 || _679;
                bool _683 = isnan(0.0);
                bool _685 = _681 || _683;
                float _687 = float(_685);
                float _689 = fma(_222, _657, _489);
                float _691 = fma(_218, _687, _493);
                bool _693 = _627 >= 0.0;
                bool _695 = isnan(_627);
                bool _697 = _693 || _695;
                bool _699 = isnan(0.0);
                bool _701 = _697 || _699;
                float _703 = float(_701);
                float _705 = _689 * _617;
                float _707 = fma(_691, _609, _705);
                float _709 = fma(_210, _703, _517);
                int _711 = _407 + 56;
                uint _713 = uint(int(uint(_711) >> uint(2)));
                uint _715 = uint(int(uint(int(_713)) >> uint(2)));
                int _717 = int(_713) & 3;
                float _719 = (*spvDescriptorSet0.cp_c4)._m0[int(_715)][_717];
                float _721 = fma(_709, _627, _707);
                bool _723 = _645 >= 0.0;
                bool _725 = isnan(_645);
                bool _727 = _723 || _725;
                bool _729 = isnan(0.0);
                bool _731 = _727 || _729;
                float _733 = float(_731);
                bool _735 = _721 >= 0.0;
                float _737 = fma(_222, _733, _489);
                bool _739 = _637 >= 0.0;
                bool _741 = isnan(_637);
                bool _743 = _739 || _741;
                bool _745 = isnan(0.0);
                bool _747 = _743 || _745;
                float _749 = float(_747);
                float _751 = _691;
                float _753 = _617;
                if (_735)
                {
                    float _755 = _737 * _645;
                    _751 = _755;
                }
                float _757 = _751;
                float _759 = fma(_218, _749, _493);
                bool _761 = _719 >= 0.0;
                bool _763 = isnan(_719);
                bool _765 = _761 || _763;
                bool _767 = isnan(0.0);
                bool _769 = _765 || _767;
                float _771 = float(_769);
                float _773 = _757;
                if (_735)
                {
                    float _775 = fma(_759, _637, _757);
                    _773 = _775;
                }
                float _777 = _773;
                int _779 = _407 + 72;
                uint _781 = uint(int(uint(_779) >> uint(2)));
                uint _783 = uint(int(uint(int(_781)) >> uint(2)));
                int _785 = int(_781) & 3;
                float _787 = (*spvDescriptorSet0.cp_c4)._m0[int(_783)][_785];
                float _789 = fma(_210, _771, _517);
                bool _791 = _675 >= 0.0;
                bool _793 = isnan(_675);
                bool _795 = _791 || _793;
                bool _797 = isnan(0.0);
                bool _799 = _795 || _797;
                float _801 = float(_799);
                float _803 = _777;
                if (_735)
                {
                    float _805 = fma(_789, _719, _777);
                    _803 = _805;
                }
                float _807 = _803;
                float _809 = fma(_222, _801, _489);
                int _811 = _407 + 80;
                uint _813 = uint(int(uint(_811) >> uint(2)));
                uint _815 = uint(int(uint(int(_813)) >> uint(2)));
                int _817 = int(_813) & 3;
                float _819 = (*spvDescriptorSet0.cp_c4)._m0[int(_815)][_817];
                int _821 = int(_813) + 1;
                uint _823 = uint(int(uint(_821) >> uint(2)));
                int _825 = _821 & 3;
                float _827 = (*spvDescriptorSet0.cp_c4)._m0[int(_823)][_825];
                bool _829 = _667 >= 0.0;
                bool _831 = isnan(_667);
                bool _833 = _829 || _831;
                bool _835 = isnan(0.0);
                bool _837 = _833 || _835;
                float _839 = float(_837);
                bool _841 = _807 >= 0.0;
                bool _843 = _841 && _735;
                float _845 = fma(_218, _839, _493);
                if (_843)
                {
                    float _847 = _809 * _675;
                    _753 = _847;
                }
                float _849 = _753;
                bool _851 = _787 >= 0.0;
                bool _853 = isnan(_787);
                bool _855 = _851 || _853;
                bool _857 = isnan(0.0);
                bool _859 = _855 || _857;
                float _861 = float(_859);
                int _863 = _407 + 88;
                uint _865 = uint(int(uint(_863) >> uint(2)));
                uint _867 = uint(int(uint(int(_865)) >> uint(2)));
                int _869 = int(_865) & 3;
                float _871 = (*spvDescriptorSet0.cp_c4)._m0[int(_867)][_869];
                float _873 = _849;
                if (_843)
                {
                    float _875 = fma(_845, _667, _849);
                    _873 = _875;
                }
                float _877 = _873;
                float _879 = fma(_210, _861, _517);
                bool _881 = _819 >= 0.0;
                bool _883 = isnan(_819);
                bool _885 = _881 || _883;
                bool _887 = isnan(0.0);
                bool _889 = _885 || _887;
                float _891 = float(_889);
                float _893 = _877;
                float _895 = _891;
                if (_843)
                {
                    float _897 = fma(_879, _787, _877);
                    _893 = _897;
                }
                float _899 = _893;
                bool _901 = _827 >= 0.0;
                bool _903 = isnan(_827);
                bool _905 = _901 || _903;
                bool _907 = isnan(0.0);
                bool _909 = _905 || _907;
                float _911 = float(_909);
                float _913 = fma(_218, _891, _493);
                bool _915 = _899 >= 0.0;
                bool _917 = _915 && _843;
                float _919 = fma(_222, _911, _489);
                bool _921 = _871 >= 0.0;
                bool _923 = isnan(_871);
                bool _925 = _921 || _923;
                bool _927 = isnan(0.0);
                bool _929 = _925 || _927;
                float _931 = float(_929);
                if (_917)
                {
                    float _933 = _919 * _827;
                    _895 = _933;
                }
                float _935 = _895;
                float _937 = fma(_210, _931, _517);
                float _939 = _935;
                _593 = as_type<int>(_937);
                if (_917)
                {
                    float _941 = fma(_913, _819, _935);
                    _939 = _941;
                }
                float _943 = _939;
                float _945 = _943;
                if (_917)
                {
                    float _947 = fma(_937, _871, _943);
                    _945 = _947;
                }
                float _949 = _945;
                bool _951 = _949 >= 0.0;
                bool _953 = _951 && _917;
                _599 = _953 ? (-1) : 0;
                _549 = as_type<int>(_949);
            }
            int _955 = _599;
            int _957 = _593;
            int _959 = _549;
            int _961 = ~_955;
            int _963 = _957;
            int _965 = _959;
            if (!(_961 != 0))
            {
                bool _967 = _405 >= 32u;
                if (!_967)
                {
                    int _969 = int(_405) << 1;
                    int _971 = _969 + _369;
                    _963 = _971;
                }
                int _973 = _963;
                int _975 = _973;
                if (!_967)
                {
                    int _977 = _399 & 65535;
                    _965 = _977;
                }
                int _979 = _965;
                if (!_967)
                {
                    int _981 = _973 + 72;
                    _975 = _981;
                }
                int _983 = _975;
                int _985 = int(_405) + 1;
                _551 = uint(_985);
                if (!_967)
                {
                    int _987 = _983;
                    int _989 = _979;
                    _42(_987, _989, (*spvDescriptorSet0.cp_s0));
                }
            }
            _991 = _551;
            int _993 = _399 + 1;
            bool _995 = uint(_993) >= as_type<uint>((*spvDescriptorSet0.cp_c5)._m0[2].z);
            _397 = !_995;
            _391 = _993;
            _377 = _995 ? (-1) : 0;
            _395 = _991;
        } while (_397);
        _997 = _991;
        _999 = true;
    }
    else
    {
        _997 = 0u;
    }
    _999 = false;
    uint _1001 = _997;
    uint _1003 = min(_1001, 32u);
    int _1005 = _369 + 4;
    uint _1007 = uint(int(uint(_1005) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1007)] = _1003;
}

