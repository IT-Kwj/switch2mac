#include <metal_stdlib>
#include <simd/simd.h>

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

struct _21
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    device _21* cp_s0 [[id(0)]];
    device _21* cp_s1 [[id(1)]];
    device _21* cp_s2 [[id(2)]];
    device _21* cp_s3 [[id(3)]];
    device _21* cp_s4 [[id(4)]];
    device _21* cp_s5 [[id(5)]];
    device _21* cp_s6 [[id(6)]];
    device _21* cp_s7 [[id(7)]];
    device _21* cp_s8 [[id(8)]];
    device _21* cp_s9 [[id(9)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _1679 = false;
    bool _957 = false;
    float _55 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _57 = as_type<float>(gl_LocalInvocationID.x);
    float _59 = as_type<float>(gl_WorkGroupID.x);
    int _62 = as_type<int>(_59) << 5;
    int _64 = _62 + as_type<int>(_57);
    float _66 = trunc(_55);
    int _68 = int(_66);
    bool _72 = _64 >= _68;
    int _74 = 0;
    if (_72)
    {
        _74 = 0;
    }
    int _76 = _74;
    int _78 = _76;
    int _80 = _76;
    if (!_72)
    {
        int _82 = _64 << 4;
        int _84 = _82 + 12;
        uint _87 = uint(int(uint(_84) >> uint(2)));
        float _89 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_87)]);
        float _91 = trunc(_89);
        int _93 = int(_91);
        bool _95 = _93 >= 1;
        int _97 = _95 ? (-1) : 0;
        if (!_95)
        {
            _78 = 0;
        }
        int _99 = _78;
        bool _101 = !_95;
        _80 = _99;
        if (!_101)
        {
            float _103 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _105 = uint(int(uint(_84) >> uint(2)));
            float _107 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_105)]);
            float _109 = float(_93);
            float _111 = -_107;
            float _113 = _103 + _111;
            bool _115 = _113 > _109;
            int _117 = as_type<int>(_103);
            if (!_115)
            {
                bool _119 = _103 >= _107;
                bool _121 = isnan(_103);
                bool _123 = _119 || _121;
                bool _125 = isnan(_107);
                bool _127 = _123 || _125;
                _97 = _127 ? (-1) : 0;
            }
            int _129 = _97;
            if (_115)
            {
                _117 = 0;
            }
            int _131 = _117;
            _80 = _131;
            if (!_115)
            {
                int _133 = ~_129;
                int _135 = (_133 != 0) ? 0 : 1;
                _80 = _135;
            }
        }
    }
    int _137 = _80;
    int _139 = _137 & 1;
    bool _141 = _139 != 0;
    if (!_141)
    {
        return;
    }
    float _143 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _145 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[36]);
    float _147 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[68]);
    int _149 = _64 << 4;
    float _151 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
    float _153 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
    float _155 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
    float _157 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
    int _159 = _149 + 12;
    uint _161 = uint(int(uint(_149) >> uint(2)));
    float _163 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_161)]);
    int _165 = _149 + 4;
    uint _167 = uint(int(uint(_165) >> uint(2)));
    float _169 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_167)]);
    int _171 = _149 + 8;
    uint _173 = uint(int(uint(_171) >> uint(2)));
    float _175 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_173)]);
    uint _177 = uint(int(uint(_149) >> uint(2)));
    float _179 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_177)]);
    int _181 = _149 + 4;
    uint _183 = uint(int(uint(_181) >> uint(2)));
    float _185 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_183)]);
    int _187 = _149 + 8;
    uint _189 = uint(int(uint(_187) >> uint(2)));
    float _191 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_189)]);
    int _193 = _149 + 12;
    uint _195 = uint(int(uint(_193) >> uint(2)));
    float _197 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_195)]);
    uint _199 = uint(int(uint(_159) >> uint(2)));
    float _201 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_199)]);
    float _203 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    float _205 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    bool _207 = _145 > 0.0;
    uint _209 = uint(int(uint(_159) >> uint(2)));
    float _211 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_209)]);
    float _213 = 0.0;
    if (_207)
    {
        float _215 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[52]);
        _213 = _215;
    }
    float _217 = _213;
    float _219 = abs(_147);
    float _221 = log2(_219);
    float _223 = _151 * _157;
    uint _225 = uint(int(uint(_149) >> uint(2)));
    float _227 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_225)]);
    int _229 = _149 + 4;
    uint _231 = uint(int(uint(_229) >> uint(2)));
    float _233 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_231)]);
    int _235 = _149 + 8;
    uint _237 = uint(int(uint(_235) >> uint(2)));
    float _239 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_237)]);
    int _241 = _149 + 12;
    uint _243 = uint(int(uint(_241) >> uint(2)));
    float _245 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_243)]);
    float _247 = _143 * _221;
    float _249 = exp2(_247);
    float _251 = _153 * _157;
    float _253 = _155 * _157;
    float _255 = _143 * _223;
    float _257 = _143 * _251;
    float _259 = _169 * _143;
    float _261 = _143 * _253;
    float _263 = fma(_163, _249, _255);
    float _265 = fma(_169, _249, _257);
    float _267 = _163 * _143;
    float _269 = _175 * _143;
    float _271 = fma(_201, _259, _185);
    float _273 = fma(_175, _249, _261);
    float _275 = fma(_201, _267, _179);
    float _277 = fma(_201, _269, _191);
    int _279 = as_type<int>(_203) & 512;
    bool _281 = _279 != 0;
    float _283 = _201 * _267;
    float _285 = _201 * _259;
    float _287 = _201 * _269;
    bool _289 = _217 == 0.0;
    bool _291 = _217 == 0.0;
    bool _293 = _291 && _207;
    float _295 = _197;
    float _297 = _179;
    float _299 = _185;
    float _301 = _175;
    float _303 = _221;
    int _305 = as_type<int>(_283);
    int _307 = as_type<int>(_283);
    if (_293)
    {
        _295 = 0.0;
    }
    float _309 = _295;
    float _311 = _309;
    if (_293)
    {
        _297 = 0.0;
        _299 = 0.0;
    }
    float _313 = _297;
    float _315 = _299;
    bool _317 = _207 && _289;
    float _319 = _245;
    float _321 = _315;
    float _323 = _313;
    int _325 = as_type<int>(_233);
    int _327 = as_type<int>(_239);
    int _329 = as_type<int>(_233);
    int _331 = as_type<int>(_239);
    if (!_317)
    {
        float _333 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[32]);
        bool _335 = _217 > 0.0;
        bool _337 = _335 && _207;
        float _339 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[28]);
        float _341 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[29]);
        float _343 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
        float _345 = trunc(_333);
        int _347 = int(_345);
        bool _349 = _347 != 0;
        float _351 = _339;
        float _353 = _341;
        float _355 = _343;
        if (!_349)
        {
            _319 = 0.0;
        }
        float _357 = _319;
        float _359 = 0.0;
        float _361 = 0.0;
        float _363 = _357;
        float _365 = _357;
        if (!_349)
        {
            _359 = 0.0;
            _361 = 0.0;
        }
        float _367 = _359;
        float _369 = _361;
        bool _371 = !_349;
        float _373 = _367;
        float _375 = _369;
        float _377 = _367;
        float _379 = _369;
        if (!_371)
        {
            int _381 = as_type<int>(_203) & 2048;
            bool _383 = _381 != 0;
            if (!_383)
            {
                _363 = 0.0;
            }
            float _385 = _363;
            _365 = _385;
            if (!_383)
            {
                _373 = 0.0;
                _375 = 0.0;
            }
            float _387 = _373;
            float _389 = _375;
            bool _391 = !_383;
            _377 = _387;
            _379 = _389;
            if (!_391)
            {
                float _393 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                uint _395 = uint(int(uint(_149) >> uint(2)));
                float _397 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_395)]);
                int _399 = _149 + 4;
                uint _401 = uint(int(uint(_399) >> uint(2)));
                float _403 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_401)]);
                int _405 = _149 + 8;
                uint _407 = uint(int(uint(_405) >> uint(2)));
                float _409 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_407)]);
                int _411 = _149 + 12;
                uint _413 = uint(int(uint(_411) >> uint(2)));
                float _415 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_413)]);
                uint _417 = uint(int(uint(_149) >> uint(2)));
                float _419 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_417)]);
                int _421 = _149 + 4;
                uint _423 = uint(int(uint(_421) >> uint(2)));
                float _425 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_423)]);
                int _427 = _149 + 8;
                uint _429 = uint(int(uint(_427) >> uint(2)));
                float _431 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_429)]);
                int _433 = _149 + 12;
                uint _435 = uint(int(uint(_433) >> uint(2)));
                float _437 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_435)]);
                uint _439 = uint(int(uint(_149) >> uint(2)));
                float _441 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_439)]);
                int _443 = _149 + 4;
                uint _445 = uint(int(uint(_443) >> uint(2)));
                float _447 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_445)]);
                int _449 = _149 + 8;
                uint _451 = uint(int(uint(_449) >> uint(2)));
                float _453 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_451)]);
                int _455 = _149 + 12;
                uint _457 = uint(int(uint(_455) >> uint(2)));
                float _459 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_457)]);
                float _461 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                float _463 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _465 = _409 * _419;
                float _467 = _409 * _425;
                float _469 = -_465;
                float _471 = fma(_397, _431, _469);
                float _473 = _415 * _431;
                float _475 = _415 * _425;
                float _477 = _415 * _419;
                float _479 = _403 * _419;
                float _481 = -_467;
                float _483 = fma(_403, _431, _481);
                float _485 = _447 * _471;
                float _487 = -_479;
                float _489 = fma(_397, _425, _487);
                float _491 = -_485;
                float _493 = fma(_441, _483, _491);
                float _495 = fma(_453, _489, _493);
                float _497 = _447 * _431;
                float _499 = -_475;
                float _501 = fma(_403, _437, _499);
                float _503 = 1.0 / _495;
                float _505 = -_477;
                float _507 = fma(_397, _437, _505);
                float _509 = -_497;
                float _511 = fma(_453, _425, _509);
                float _513 = _441 * _425;
                float _515 = _453 * _403;
                float _517 = _441 * _409;
                float _519 = -_473;
                float _521 = fma(_409, _437, _519);
                float _523 = _453 * _507;
                float _525 = _453 * _419;
                float _527 = -_515;
                float _529 = fma(_447, _409, _527);
                float _531 = -_397;
                float _533 = fma(_531, _431, _465);
                float _535 = -_517;
                float _537 = fma(_453, _397, _535);
                float _539 = _447 * _397;
                float _541 = -_523;
                float _543 = fma(_441, _521, _541);
                float _545 = -_525;
                float _547 = fma(_441, _431, _545);
                float _549 = -_513;
                float _551 = fma(_447, _419, _549);
                float _553 = fma(_459, _471, _543);
                float _555 = _547 * _503;
                float _557 = _511 * _503;
                float _559 = _551 * _503;
                float _561 = -_539;
                float _563 = fma(_441, _403, _561);
                float _565 = _393 * _555;
                float _567 = _393 * _557;
                float _569 = _453 * _501;
                float _571 = _447 * _507;
                float _573 = _533 * _503;
                float _575 = _461 * _503;
                float _577 = _393 * _559;
                float _579 = -_569;
                float _581 = fma(_447, _521, _579);
                float _583 = -_571;
                float _585 = fma(_441, _501, _583);
                float _587 = fma(_461, _573, _565);
                float _589 = fma(_483, _575, _567);
                float _591 = fma(_489, _575, _577);
                float _593 = _529 * _503;
                float _595 = _537 * _503;
                float _597 = _563 * _503;
                float _599 = fma(_459, _483, _581);
                float _601 = fma(_459, _489, _585);
                float _603 = fma(_463, _593, _589);
                float _605 = fma(_463, _595, _587);
                float _607 = fma(_463, _597, _591);
                float _609 = -_599;
                float _611 = fma(_609, _503, _603);
                float _613 = fma(_553, _503, _605);
                float _615 = -_601;
                float _617 = fma(_615, _503, _607);
                _301 = _587;
                _303 = _565;
                _365 = _611;
                _377 = _613;
                _379 = _617;
            }
        }
        float _619 = _301;
        float _621 = _303;
        float _623 = _365;
        float _625 = _377;
        float _627 = _379;
        bool _629 = !_337;
        float _631 = _621;
        float _633 = _619;
        float _635 = _623;
        if (!_629)
        {
            float _637 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[48]);
            float _639 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[49]);
            float _641 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[50]);
            bool _643 = !_281;
            _351 = _637;
            _353 = _639;
            _355 = _641;
            if (!_643)
            {
                float _645 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
                float _647 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
                float _649 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
                float _651 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _653 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
                float _655 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
                float _657 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
                float _659 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                float _661 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[28]);
                float _663 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[29]);
                float _665 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[30]);
                float _667 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[31]);
                float _669 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
                float _671 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
                float _673 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
                float _675 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                float _677 = _659 * _647;
                float _679 = _659 * _649;
                float _681 = _659 * _645;
                float _683 = _651 * _663;
                float _685 = -_677;
                float _687 = fma(_655, _651, _685);
                float _689 = _651 * _665;
                float _691 = _651 * _661;
                float _693 = _659 * _665;
                float _695 = _659 * _663;
                float _697 = _659 * _661;
                float _699 = -_683;
                float _701 = fma(_647, _667, _699);
                float _703 = -_679;
                float _705 = fma(_657, _651, _703);
                float _707 = -_681;
                float _709 = fma(_653, _651, _707);
                float _711 = _649 * _663;
                float _713 = _649 * _661;
                float _715 = _657 * _663;
                float _717 = _657 * _661;
                float _719 = -_689;
                float _721 = fma(_649, _667, _719);
                float _723 = -_691;
                float _725 = fma(_645, _667, _723);
                float _727 = -_693;
                float _729 = fma(_657, _667, _727);
                float _731 = -_695;
                float _733 = fma(_655, _667, _731);
                float _735 = -_697;
                float _737 = fma(_653, _667, _735);
                float _739 = _647 * _661;
                float _741 = -_711;
                float _743 = fma(_647, _665, _741);
                float _745 = -_713;
                float _747 = fma(_645, _665, _745);
                float _749 = -_715;
                float _751 = fma(_655, _665, _749);
                float _753 = -_717;
                float _755 = fma(_653, _665, _753);
                float _757 = _657 * _647;
                float _759 = _657 * _645;
                float _761 = -_739;
                float _763 = fma(_645, _663, _761);
                float _765 = _655 * _645;
                float _767 = -_757;
                float _769 = fma(_655, _649, _767);
                float _771 = -_759;
                float _773 = fma(_653, _649, _771);
                float _775 = _657 * _725;
                float _777 = -_765;
                float _779 = fma(_653, _647, _777);
                float _781 = _657 * _701;
                float _783 = -_775;
                float _785 = fma(_653, _721, _783);
                float _787 = _655 * _661;
                float _789 = _655 * _725;
                float _791 = -_781;
                float _793 = fma(_655, _721, _791);
                float _795 = fma(_659, _747, _785);
                float _797 = -_787;
                float _799 = fma(_653, _663, _797);
                float _801 = _655 * _747;
                float _803 = -_789;
                float _805 = fma(_653, _701, _803);
                float _807 = fma(_659, _743, _793);
                float _809 = _671 * _795;
                float _811 = -_801;
                float _813 = fma(_653, _743, _811);
                float _815 = _673 * _701;
                float _817 = fma(_659, _763, _805);
                float _819 = -_809;
                float _821 = fma(_669, _807, _819);
                float _823 = fma(_657, _763, _813);
                float _825 = -_815;
                float _827 = fma(_671, _721, _825);
                float _829 = fma(_673, _817, _821);
                float _831 = -_675;
                float _833 = fma(_831, _823, _829);
                float _835 = _673 * _725;
                float _837 = 1.0 / _833;
                float _839 = -_835;
                float _841 = fma(_669, _721, _839);
                float _843 = _671 * _725;
                float _845 = _673 * _737;
                float _847 = _673 * _687;
                float _849 = -_843;
                float _851 = fma(_669, _701, _849);
                float _853 = -_845;
                float _855 = fma(_669, _729, _853);
                float _857 = _673 * _709;
                float _859 = _673 * _733;
                float _861 = fma(_675, _743, _827);
                float _863 = _671 * _737;
                float _865 = -_847;
                float _867 = fma(_671, _705, _865);
                float _869 = fma(_675, _763, _851);
                float _871 = _671 * _709;
                float _873 = -_857;
                float _875 = fma(_669, _705, _873);
                float _877 = fma(_675, _747, _841);
                float _879 = _795 * _837;
                float _881 = -_859;
                float _883 = fma(_671, _729, _881);
                float _885 = _861 * _837;
                float _887 = -_863;
                float _889 = fma(_669, _733, _887);
                float _891 = _869 * _837;
                float _893 = -_871;
                float _895 = fma(_669, _687, _893);
                float _897 = _877 * _837;
                float _899 = _637 * _879;
                float _901 = fma(_675, _751, _883);
                float _903 = _807 * _837;
                float _905 = _639 * _885;
                float _907 = fma(_675, _755, _855);
                float _909 = fma(_675, _799, _889);
                float _911 = _817 * _837;
                float _913 = _639 * _891;
                float _915 = -_899;
                float _917 = fma(_639, _897, _915);
                float _919 = -_905;
                float _921 = fma(_637, _903, _919);
                float _923 = _901 * _837;
                float _925 = -_913;
                float _927 = fma(_637, _911, _925);
                float _929 = _907 * _837;
                float _931 = _909 * _837;
                float _933 = fma(_675, _769, _867);
                float _935 = fma(_641, _923, _921);
                float _937 = fma(_675, _773, _875);
                float _939 = fma(_675, _779, _895);
                float _941 = -_929;
                float _943 = fma(_641, _941, _917);
                float _945 = fma(_641, _931, _927);
                float _947 = -_933;
                float _949 = fma(_947, _837, _935);
                float _951 = fma(_937, _837, _943);
                float _953 = -_939;
                float _955 = fma(_953, _837, _945);
                _631 = _899;
                _351 = _949;
                _353 = _951;
                _355 = _955;
                _633 = _885;
                _957 = true;
            }
            else
            {
                int _959 = as_type<int>(_203) & 1024;
                bool _961 = _959 != 0;
                bool _963 = !_961;
                if (!_963)
                {
                    float _965 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                    uint _967 = uint(int(uint(_149) >> uint(2)));
                    float _969 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_967)]);
                    int _971 = _149 + 4;
                    uint _973 = uint(int(uint(_971) >> uint(2)));
                    float _975 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_973)]);
                    int _977 = _149 + 8;
                    uint _979 = uint(int(uint(_977) >> uint(2)));
                    float _981 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_979)]);
                    uint _983 = uint(int(uint(_149) >> uint(2)));
                    float _985 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_983)]);
                    int _987 = _149 + 4;
                    uint _989 = uint(int(uint(_987) >> uint(2)));
                    float _991 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_989)]);
                    int _993 = _149 + 8;
                    uint _995 = uint(int(uint(_993) >> uint(2)));
                    float _997 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_995)]);
                    uint _999 = uint(int(uint(_149) >> uint(2)));
                    float _1001 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_999)]);
                    int _1003 = _149 + 4;
                    uint _1005 = uint(int(uint(_1003) >> uint(2)));
                    float _1007 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1005)]);
                    int _1009 = _149 + 8;
                    uint _1011 = uint(int(uint(_1009) >> uint(2)));
                    float _1013 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1011)]);
                    float _1015 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                    float _1017 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                    float _1019 = _981 * _985;
                    float _1021 = _981 * _991;
                    float _1023 = -_1019;
                    float _1025 = fma(_969, _997, _1023);
                    float _1027 = _975 * _985;
                    float _1029 = -_1021;
                    float _1031 = fma(_975, _997, _1029);
                    float _1033 = _1007 * _1025;
                    float _1035 = -_1027;
                    float _1037 = fma(_969, _991, _1035);
                    float _1039 = -_1033;
                    float _1041 = fma(_1001, _1031, _1039);
                    float _1043 = _965 * _997;
                    float _1045 = _965 * _991;
                    float _1047 = _965 * _985;
                    float _1049 = fma(_1013, _1037, _1041);
                    float _1051 = 1.0 / _1049;
                    float _1053 = _1013 * _985;
                    float _1055 = _1007 * _997;
                    float _1057 = -_1045;
                    float _1059 = fma(_1015, _975, _1057);
                    float _1061 = -_969;
                    float _1063 = fma(_1061, _997, _1019);
                    float _1065 = _1001 * _991;
                    float _1067 = -_1043;
                    float _1069 = fma(_1015, _981, _1067);
                    float _1071 = -_1047;
                    float _1073 = fma(_1015, _969, _1071);
                    float _1075 = _1001 * _981;
                    float _1077 = -_1053;
                    float _1079 = fma(_1001, _997, _1077);
                    float _1081 = -_1055;
                    float _1083 = fma(_1013, _991, _1081);
                    float _1085 = _1007 * _969;
                    float _1087 = -_1065;
                    float _1089 = fma(_1007, _985, _1087);
                    float _1091 = -_1075;
                    float _1093 = fma(_1013, _969, _1091);
                    float _1095 = _1013 * _975;
                    float _1097 = _1013 * _1059;
                    float _1099 = _1083 * _1051;
                    float _1101 = _1079 * _1051;
                    float _1103 = -_1085;
                    float _1105 = fma(_1001, _975, _1103);
                    float _1107 = _1089 * _1051;
                    float _1109 = _1013 * _1073;
                    float _1111 = -_1095;
                    float _1113 = fma(_1007, _981, _1111);
                    float _1115 = _1007 * _1073;
                    float _1117 = -_1097;
                    float _1119 = fma(_1007, _1069, _1117);
                    float _1121 = _1099 * _639;
                    float _1123 = _1101 * _639;
                    float _1125 = _1107 * _639;
                    float _1127 = _1063 * _1051;
                    float _1129 = _1031 * _1051;
                    float _1131 = _1037 * _1051;
                    float _1133 = -_1109;
                    float _1135 = fma(_1001, _1069, _1133);
                    float _1137 = fma(_1127, _637, _1123);
                    float _1139 = fma(_637, _1129, _1121);
                    float _1141 = fma(_637, _1131, _1125);
                    float _1143 = _1093 * _1051;
                    float _1145 = _1113 * _1051;
                    float _1147 = _1105 * _1051;
                    float _1149 = -_1115;
                    float _1151 = fma(_1001, _1059, _1149);
                    float _1153 = fma(_1143, _641, _1137);
                    float _1155 = fma(_1145, _641, _1139);
                    float _1157 = fma(_1017, _1025, _1135);
                    float _1159 = fma(_1147, _641, _1141);
                    float _1161 = fma(_1017, _1031, _1119);
                    float _1163 = fma(_1017, _1037, _1151);
                    float _1165 = fma(_1157, _1051, _1153);
                    float _1167 = -_1161;
                    float _1169 = fma(_1167, _1051, _1155);
                    float _1171 = -_1163;
                    float _1173 = fma(_1171, _1051, _1159);
                    _631 = _1161;
                    _351 = _1169;
                    _353 = _1165;
                    _355 = _1173;
                    _633 = _1129;
                    _957 = true;
                }
                else
                {
                    int _1175 = as_type<int>(_203) & 2048;
                    bool _1177 = _1175 != 0;
                    bool _1179 = !_1177;
                    if (!_1179)
                    {
                        uint _1181 = uint(int(uint(_149) >> uint(2)));
                        float _1183 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1181)]);
                        int _1185 = _149 + 4;
                        uint _1187 = uint(int(uint(_1185) >> uint(2)));
                        float _1189 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1187)]);
                        int _1191 = _149 + 8;
                        uint _1193 = uint(int(uint(_1191) >> uint(2)));
                        float _1195 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1193)]);
                        int _1197 = _149 + 12;
                        uint _1199 = uint(int(uint(_1197) >> uint(2)));
                        float _1201 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1199)]);
                        uint _1203 = uint(int(uint(_149) >> uint(2)));
                        float _1205 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1203)]);
                        int _1207 = _149 + 4;
                        uint _1209 = uint(int(uint(_1207) >> uint(2)));
                        float _1211 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1209)]);
                        int _1213 = _149 + 8;
                        uint _1215 = uint(int(uint(_1213) >> uint(2)));
                        float _1217 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1215)]);
                        int _1219 = _149 + 12;
                        uint _1221 = uint(int(uint(_1219) >> uint(2)));
                        float _1223 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1221)]);
                        uint _1225 = uint(int(uint(_149) >> uint(2)));
                        float _1227 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1225)]);
                        int _1229 = _149 + 4;
                        uint _1231 = uint(int(uint(_1229) >> uint(2)));
                        float _1233 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1231)]);
                        int _1235 = _149 + 8;
                        uint _1237 = uint(int(uint(_1235) >> uint(2)));
                        float _1239 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1237)]);
                        int _1241 = _149 + 12;
                        uint _1243 = uint(int(uint(_1241) >> uint(2)));
                        float _1245 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1243)]);
                        float _1247 = _1195 * _1205;
                        float _1249 = _1195 * _1211;
                        float _1251 = _1189 * _1205;
                        float _1253 = _1201 * _1217;
                        float _1255 = -_1247;
                        float _1257 = fma(_1183, _1217, _1255);
                        float _1259 = -_1249;
                        float _1261 = fma(_1189, _1217, _1259);
                        float _1263 = -_1251;
                        float _1265 = fma(_1183, _1211, _1263);
                        float _1267 = _1201 * _1211;
                        float _1269 = _1233 * _1257;
                        float _1271 = _1201 * _1205;
                        float _1273 = -_1253;
                        float _1275 = fma(_1195, _1223, _1273);
                        float _1277 = -_1267;
                        float _1279 = fma(_1189, _1223, _1277);
                        float _1281 = -_1269;
                        float _1283 = fma(_1227, _1261, _1281);
                        float _1285 = -_1271;
                        float _1287 = fma(_1183, _1223, _1285);
                        float _1289 = _1233 * _1217;
                        float _1291 = _1227 * _1211;
                        float _1293 = fma(_1239, _1265, _1283);
                        float _1295 = _1239 * _1205;
                        float _1297 = -_1183;
                        float _1299 = fma(_1297, _1217, _1247);
                        float _1301 = -_1289;
                        float _1303 = fma(_1239, _1211, _1301);
                        float _1305 = -_1291;
                        float _1307 = fma(_1233, _1205, _1305);
                        float _1309 = -_1295;
                        float _1311 = fma(_1227, _1217, _1309);
                        float _1313 = 1.0 / _1293;
                        float _1315 = _1227 * _1195;
                        float _1317 = _1233 * _1183;
                        float _1319 = _1239 * _1189;
                        float _1321 = _1239 * _1279;
                        float _1323 = -_1315;
                        float _1325 = fma(_1239, _1183, _1323);
                        float _1327 = _1239 * _1287;
                        float _1329 = _1233 * _1287;
                        float _1331 = -_1317;
                        float _1333 = fma(_1227, _1189, _1331);
                        float _1335 = -_1319;
                        float _1337 = fma(_1233, _1195, _1335);
                        float _1339 = -_1327;
                        float _1341 = fma(_1227, _1275, _1339);
                        float _1343 = -_1329;
                        float _1345 = fma(_1227, _1279, _1343);
                        float _1347 = -_1321;
                        float _1349 = fma(_1233, _1275, _1347);
                        float _1351 = fma(_1245, _1257, _1341);
                        float _1353 = fma(_1245, _1265, _1345);
                        float _1355 = _1303 * _1313;
                        float _1357 = _1311 * _1313;
                        float _1359 = _1307 * _1313;
                        float _1361 = _1299 * _1313;
                        float _1363 = _1355 * _639;
                        float _1365 = _1357 * _639;
                        float _1367 = _1359 * _639;
                        float _1369 = _1261 * _1313;
                        float _1371 = _1265 * _1313;
                        float _1373 = fma(_1361, _637, _1365);
                        float _1375 = _1325 * _1313;
                        float _1377 = fma(_637, _1369, _1363);
                        float _1379 = fma(_637, _1371, _1367);
                        float _1381 = _1337 * _1313;
                        float _1383 = _1333 * _1313;
                        float _1385 = fma(_1375, _641, _1373);
                        float _1387 = fma(_1245, _1261, _1349);
                        float _1389 = fma(_1381, _641, _1377);
                        float _1391 = fma(_1383, _641, _1379);
                        float _1393 = fma(_1351, _1313, _1385);
                        float _1395 = -_1387;
                        float _1397 = fma(_1395, _1313, _1389);
                        float _1399 = -_1353;
                        float _1401 = fma(_1399, _1313, _1391);
                        _631 = _1333;
                        _351 = _1397;
                        _353 = _1393;
                        _355 = _1401;
                        _633 = _1377;
                    }
                }
            }
        }
        _957 = false;
        float _1403 = _631;
        float _1405 = _351;
        float _1407 = _353;
        float _1409 = _355;
        float _1411 = _633;
        float _1413 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[33]);
        float _1415 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[34]);
        float _1417 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[35]);
        bool _1419 = _1413 != 0.0;
        bool _1421 = isnan(_1413);
        bool _1423 = _1419 || _1421;
        bool _1425 = isnan(0.0);
        bool _1427 = _1423 || _1425;
        bool _1429 = _1415 != 0.0;
        bool _1431 = isnan(_1415);
        bool _1433 = _1429 || _1431;
        bool _1435 = isnan(0.0);
        bool _1437 = _1433 || _1435;
        bool _1439 = _1417 != 0.0;
        bool _1441 = isnan(_1417);
        bool _1443 = _1439 || _1441;
        bool _1445 = isnan(0.0);
        bool _1447 = _1443 || _1445;
        float _1449 = _1415;
        float _1451 = _1405;
        float _1453 = _1407;
        float _1455 = _1411;
        float _1457 = _1409;
        if (_1427)
        {
            float _1459 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[31]);
            _1449 = _1459;
        }
        float _1461 = _1449;
        float _1463 = _1413;
        if (_1437)
        {
            float _1465 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[31]);
            _1463 = _1465;
        }
        float _1467 = _1463;
        float _1469 = _1403;
        if (_1447)
        {
            float _1471 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[31]);
            _1469 = _1471;
        }
        float _1473 = _1469;
        if (_1427)
        {
            float _1475 = _623 + _1405;
            _1451 = _1475;
        }
        float _1477 = _1451;
        float _1479 = _1477;
        if (_1437)
        {
            float _1481 = _625 + _1407;
            _1453 = _1481;
        }
        float _1483 = _1453;
        float _1485 = _1483;
        if (_1447)
        {
            float _1487 = _627 + _1409;
            _1455 = _1487;
        }
        float _1489 = _1455;
        if (_1427)
        {
            float _1491 = -_275;
            float _1493 = _1477 + _1491;
            _635 = _1493;
        }
        float _1495 = _635;
        float _1497 = _1495;
        if (_1437)
        {
            float _1499 = -_271;
            float _1501 = _1483 + _1499;
            _1479 = _1501;
        }
        float _1503 = _1479;
        float _1505 = _1503;
        if (!_1447)
        {
            _1485 = 0.0;
        }
        float _1507 = _1485;
        _321 = _1507;
        if (_1427)
        {
            float _1509 = -_263;
            float _1511 = _1509 + _1495;
            _1497 = _1511;
        }
        float _1513 = _1497;
        float _1515 = _1513;
        if (_1437)
        {
            float _1517 = -_265;
            float _1519 = _1517 + _1503;
            _1505 = _1519;
        }
        float _1521 = _1505;
        float _1523 = _1461;
        float _1525 = _1521;
        if (_1427)
        {
            float _1527 = _1513 * _1461;
            _1523 = _1527;
        }
        float _1529 = _1523;
        float _1531 = _1529;
        if (_1447)
        {
            float _1533 = -_277;
            float _1535 = _1489 + _1533;
            _1515 = _1535;
        }
        float _1537 = _1515;
        float _1539 = _1537;
        if (_1427)
        {
            float _1541 = _201 * _1529;
            _1531 = _1541;
        }
        float _1543 = _1531;
        float _1545 = _1543;
        if (_1447)
        {
            float _1547 = -_273;
            float _1549 = _1547 + _1537;
            _1539 = _1549;
        }
        float _1551 = _1539;
        float _1553 = _1467;
        if (_1437)
        {
            float _1555 = _1521 * _1467;
            _1457 = _1555;
        }
        float _1557 = _1457;
        float _1559 = _1557;
        if (!_1427)
        {
            _1553 = 0.0;
        }
        float _1561 = _1553;
        float _1563 = _1561;
        if (_1427)
        {
            float _1565 = _143 * _1543;
            _1563 = _1565;
        }
        float _1567 = _1563;
        _311 = _1567;
        if (_1447)
        {
            float _1569 = _1551 * _1473;
            _1545 = _1569;
        }
        float _1571 = _1545;
        float _1573 = _1571;
        if (_1437)
        {
            float _1575 = _201 * _1557;
            _1559 = _1575;
        }
        float _1577 = _1559;
        if (!_1437)
        {
            _1525 = 0.0;
        }
        float _1579 = _1525;
        float _1581 = _1579;
        if (_1447)
        {
            float _1583 = _201 * _1571;
            _1573 = _1583;
        }
        float _1585 = _1573;
        if (_1437)
        {
            float _1587 = _143 * _1577;
            _1581 = _1587;
        }
        float _1589 = _1581;
        _323 = _1589;
        if (_1447)
        {
            float _1591 = _143 * _1585;
            _321 = _1591;
        }
    }
    float _1593 = _321;
    float _1595 = _311;
    float _1597 = _323;
    uint _1599 = uint(int(uint(_159) >> uint(2)));
    float _1601 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1599)]);
    float _1603 = _273 + _1593;
    float _1605 = _263 + _1595;
    int _1607 = _149 + 4;
    float _1609 = _265 + _1597;
    int _1611 = _149 + 8;
    float _1613 = _285 * _285;
    uint _1615 = uint(int(uint(_159) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1615)] = as_type<uint>(_1601);
    uint _1617 = uint(int(uint(_149) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1617)] = as_type<uint>(_275);
    uint _1619 = uint(int(uint(_1607) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1619)] = as_type<uint>(_271);
    uint _1621 = uint(int(uint(_1611) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1621)] = as_type<uint>(_277);
    uint _1623 = uint(int(uint(_149) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1623)] = as_type<uint>(_1605);
    uint _1625 = uint(int(uint(_1607) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1625)] = as_type<uint>(_1609);
    uint _1627 = uint(int(uint(_1611) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1627)] = as_type<uint>(_1603);
    uint _1629 = uint(int(uint(_149) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1629)] = as_type<uint>(_283);
    uint _1631 = uint(int(uint(_1607) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1631)] = as_type<uint>(_285);
    uint _1633 = uint(int(uint(_1611) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1633)] = as_type<uint>(_287);
    float _1635 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1637 = fma(_283, _283, _1613);
    float _1639 = _1609 * _1609;
    float _1641 = fma(_287, _287, _1637);
    float _1643 = fma(_1605, _1605, _1639);
    float _1645 = fma(_1603, _1603, _1643);
    float _1647 = sqrt(_1641);
    float _1649 = sqrt(_1645);
    bool _1651 = _1647 >= 9.9999999747524270787835121154785e-07;
    bool _1653 = isnan(_1647);
    bool _1655 = _1651 || _1653;
    bool _1657 = isnan(9.9999999747524270787835121154785e-07);
    bool _1659 = _1655 || _1657;
    float _1661 = _1645;
    int _1677;
    if (!_1659)
    {
        bool _1663 = _205 != _211;
        bool _1665 = isnan(_205);
        bool _1667 = _1663 || _1665;
        bool _1669 = isnan(_211);
        bool _1671 = _1667 || _1669;
        if (_1671)
        {
            _305 = as_type<int>(_227);
        }
        int _1673 = _305;
        int _1675 = _1673;
        _1677 = _1673;
        _1679 = _1671;
        if (!_1679)
        {
            float _1681 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
            bool _1683 = _1681 > 0.0;
            bool _1685 = !_1683;
            if (!_1685)
            {
                float _1687 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
                float _1689 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
                float _1691 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
                float _1693 = _1689 * _1689;
                float _1695 = fma(_1687, _1687, _1693);
                float _1697 = fma(_1691, _1691, _1695);
                float _1699 = rsqrt(_1697);
                float _1701 = _1699 * 9.9999999747524270787835121154785e-07;
                float _1703 = _1687 * _1701;
                float _1705 = _1689 * _1701;
                float _1707 = _1691 * _1701;
                _1677 = as_type<int>(_1703);
                _329 = as_type<int>(_1705);
                _331 = as_type<int>(_1707);
                _1679 = true;
            }
            else
            {
                bool _1709 = _1649 >= 9.9999999747524270787835121154785e-07;
                bool _1711 = isnan(_1649);
                bool _1713 = _1709 || _1711;
                bool _1715 = isnan(9.9999999747524270787835121154785e-07);
                bool _1717 = _1713 || _1715;
                if (!_1717)
                {
                    float _1719 = _271 * _271;
                    float _1721 = fma(_275, _275, _1719);
                    float _1723 = fma(_277, _277, _1721);
                    float _1725 = sqrt(_1723);
                    bool _1727 = _1725 >= 9.9999999747524270787835121154785e-07;
                    bool _1729 = isnan(_1725);
                    bool _1731 = _1727 || _1729;
                    bool _1733 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1735 = _1731 || _1733;
                    int _1737 = as_type<int>(_239);
                    int _1739 = as_type<int>(_1725);
                    if (_1735)
                    {
                        float _1741 = rsqrt(_1723);
                        _1737 = as_type<int>(_1741);
                    }
                    int _1743 = _1737;
                    if (!_1735)
                    {
                        _1675 = 0;
                    }
                    int _1745 = _1675;
                    int _1747 = _1745;
                    if (!_1735)
                    {
                        _1739 = 897988541;
                    }
                    int _1749 = _1739;
                    int _1751 = _1743;
                    int _1753 = _1749;
                    if (_1735)
                    {
                        float _1755 = as_type<float>(_1743) * 9.9999999747524270787835121154785e-07;
                        _1661 = _1755;
                    }
                    float _1757 = _1661;
                    if (!_1735)
                    {
                        _1751 = 0;
                    }
                    int _1759 = _1751;
                    int _1761 = _1759;
                    if (_1735)
                    {
                        float _1763 = _275 * _1757;
                        _1747 = as_type<int>(_1763);
                    }
                    int _1765 = _1747;
                    _1677 = _1765;
                    if (_1735)
                    {
                        float _1767 = _271 * _1757;
                        _1753 = as_type<int>(_1767);
                    }
                    int _1769 = _1753;
                    _329 = _1769;
                    if (_1735)
                    {
                        float _1771 = _277 * _1757;
                        _1761 = as_type<int>(_1771);
                    }
                    int _1773 = _1761;
                    _331 = _1773;
                    _1679 = true;
                }
                else
                {
                    float _1775 = rsqrt(_1645);
                    float _1777 = _1775 * 9.9999999747524270787835121154785e-07;
                    float _1779 = _1605 * _1777;
                    float _1781 = _1609 * _1777;
                    float _1783 = _1603 * _1777;
                    _1677 = as_type<int>(_1779);
                    _329 = as_type<int>(_1781);
                    _331 = as_type<int>(_1783);
                    _1679 = true;
                }
            }
        }
    }
    else
    {
        float _1785 = _1649 * _1635;
        bool _1787 = _1785 >= 0.001000000047497451305389404296875;
        bool _1789 = isnan(_1785);
        bool _1791 = _1787 || _1789;
        bool _1793 = isnan(0.001000000047497451305389404296875);
        bool _1795 = _1791 || _1793;
        bool _1797 = _1785 > 0.0;
        bool _1799 = !_1795;
        bool _1801 = _1797 && _1799;
        bool _1803 = _1647 < 0.001000000047497451305389404296875;
        bool _1805 = _1803 && _1801;
        if (!_1805)
        {
            _325 = as_type<int>(_285);
        }
        int _1807 = _325;
        int _1809 = _1807;
        if (_1805)
        {
            float _1811 = _1605 * _1635;
            _307 = as_type<int>(_1811);
        }
        int _1813 = _307;
        _1677 = _1813;
        if (!_1805)
        {
            _327 = as_type<int>(_287);
        }
        int _1815 = _327;
        _331 = _1815;
        if (_1805)
        {
            float _1817 = _1609 * _1635;
            _1809 = as_type<int>(_1817);
        }
        int _1819 = _1809;
        _329 = _1819;
        if (_1805)
        {
            float _1821 = _1603 * _1635;
            _331 = as_type<int>(_1821);
        }
    }
    _1679 = false;
    int _1823 = _1677;
    int _1825 = _329;
    int _1827 = _331;
    uint _1829 = uint(int(uint(_149) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1829)] = uint(_1823);
    uint _1831 = uint(int(uint(_1607) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1831)] = uint(_1825);
    uint _1833 = uint(int(uint(_1611) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1833)] = uint(_1827);
}

