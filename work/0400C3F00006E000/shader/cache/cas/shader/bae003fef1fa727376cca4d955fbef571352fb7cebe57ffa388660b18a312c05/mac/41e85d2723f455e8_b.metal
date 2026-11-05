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
    bool _1839 = false;
    bool _941 = false;
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
    float _145 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[45]);
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
    float _177 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    uint _179 = uint(int(uint(_159) >> uint(2)));
    float _181 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_179)]);
    float _183 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    bool _185 = _145 > 0.0;
    uint _187 = uint(int(uint(_159) >> uint(2)));
    float _189 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_187)]);
    uint _191 = uint(int(uint(_149) >> uint(2)));
    float _193 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_191)]);
    int _195 = _149 + 4;
    uint _197 = uint(int(uint(_195) >> uint(2)));
    float _199 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_197)]);
    int _201 = _149 + 8;
    uint _203 = uint(int(uint(_201) >> uint(2)));
    float _205 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_203)]);
    float _207 = abs(_147);
    float _209 = log2(_207);
    uint _211 = uint(int(uint(_149) >> uint(2)));
    float _213 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_211)]);
    int _215 = _149 + 4;
    uint _217 = uint(int(uint(_215) >> uint(2)));
    float _219 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_217)]);
    int _221 = _149 + 8;
    uint _223 = uint(int(uint(_221) >> uint(2)));
    float _225 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_223)]);
    int _227 = _149 + 12;
    uint _229 = uint(int(uint(_227) >> uint(2)));
    float _231 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_229)]);
    float _233 = _155 * _157;
    float _235 = 0.0;
    float _237 = _163;
    float _239 = _169;
    if (_185)
    {
        float _241 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[52]);
        _235 = _241;
    }
    float _243 = _235;
    float _245 = _151 * _157;
    float _247 = _153 * _157;
    float _249 = _143 * _209;
    float _251 = exp2(_249);
    float _253 = _143 * _233;
    float _255 = _143 * _245;
    float _257 = _143 * _247;
    float _259 = _163 * _143;
    float _261 = _169 * _143;
    float _263 = fma(_175, _251, _253);
    float _265 = _175 * _143;
    float _267 = fma(_163, _251, _255);
    float _269 = fma(_169, _251, _257);
    int _271 = as_type<int>(_177) & 512;
    bool _273 = _271 != 0;
    bool _275 = _243 == 0.0;
    bool _277 = _243 == 0.0;
    bool _279 = _277 && _185;
    float _281 = fma(_181, _265, _205);
    float _283 = fma(_181, _259, _193);
    float _285 = fma(_181, _261, _199);
    float _287 = _265;
    float _289 = _281;
    if (_279)
    {
        _287 = 0.0;
    }
    float _291 = _287;
    float _293 = _291;
    if (_279)
    {
        _237 = 0.0;
        _239 = 0.0;
    }
    float _295 = _237;
    float _297 = _239;
    bool _299 = _185 && _275;
    float _301 = _231;
    float _303 = _297;
    float _305 = _295;
    float _307 = _231;
    int _309 = as_type<int>(_213);
    int _311 = as_type<int>(_219);
    int _313 = as_type<int>(_225);
    int _315 = as_type<int>(_213);
    int _317 = as_type<int>(_219);
    int _319 = as_type<int>(_225);
    int _321 = as_type<int>(_213);
    int _323 = as_type<int>(_219);
    int _325 = as_type<int>(_225);
    if (!_299)
    {
        float _327 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[44]);
        bool _329 = _243 > 0.0;
        bool _331 = _329 && _185;
        float _333 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[40]);
        float _335 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[41]);
        float _337 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[42]);
        float _339 = trunc(_327);
        int _341 = int(_339);
        bool _343 = _341 > 0;
        float _345 = _333;
        float _347 = _335;
        float _349 = _337;
        if (!_343)
        {
            _301 = 0.0;
        }
        float _351 = _301;
        float _353 = 0.0;
        float _355 = _351;
        float _357 = _351;
        if (!_343)
        {
            _353 = 0.0;
        }
        float _359 = _353;
        float _361 = 0.0;
        float _363 = _359;
        float _365 = _359;
        if (!_343)
        {
            _361 = 0.0;
        }
        float _367 = _361;
        bool _369 = !_343;
        float _371 = _367;
        float _373 = _367;
        if (!_369)
        {
            int _375 = as_type<int>(_177) & 2048;
            bool _377 = _375 != 0;
            if (!_377)
            {
                _355 = 0.0;
            }
            float _379 = _355;
            _357 = _379;
            if (!_377)
            {
                _363 = 0.0;
            }
            float _381 = _363;
            _365 = _381;
            if (!_377)
            {
                _371 = 0.0;
            }
            float _383 = _371;
            bool _385 = !_377;
            _373 = _383;
            if (!_385)
            {
                float _387 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                uint _389 = uint(int(uint(_149) >> uint(2)));
                float _391 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_389)]);
                int _393 = _149 + 4;
                uint _395 = uint(int(uint(_393) >> uint(2)));
                float _397 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_395)]);
                int _399 = _149 + 8;
                uint _401 = uint(int(uint(_399) >> uint(2)));
                float _403 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_401)]);
                int _405 = _149 + 12;
                uint _407 = uint(int(uint(_405) >> uint(2)));
                float _409 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_407)]);
                uint _411 = uint(int(uint(_149) >> uint(2)));
                float _413 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_411)]);
                int _415 = _149 + 4;
                uint _417 = uint(int(uint(_415) >> uint(2)));
                float _419 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_417)]);
                int _421 = _149 + 8;
                uint _423 = uint(int(uint(_421) >> uint(2)));
                float _425 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_423)]);
                int _427 = _149 + 12;
                uint _429 = uint(int(uint(_427) >> uint(2)));
                float _431 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_429)]);
                uint _433 = uint(int(uint(_149) >> uint(2)));
                float _435 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_433)]);
                int _437 = _149 + 4;
                uint _439 = uint(int(uint(_437) >> uint(2)));
                float _441 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_439)]);
                int _443 = _149 + 8;
                uint _445 = uint(int(uint(_443) >> uint(2)));
                float _447 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_445)]);
                int _449 = _149 + 12;
                uint _451 = uint(int(uint(_449) >> uint(2)));
                float _453 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_451)]);
                float _455 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                float _457 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _459 = _403 * _413;
                float _461 = _403 * _419;
                float _463 = -_459;
                float _465 = fma(_391, _425, _463);
                float _467 = _409 * _425;
                float _469 = _409 * _419;
                float _471 = _409 * _413;
                float _473 = _397 * _413;
                float _475 = -_461;
                float _477 = fma(_397, _425, _475);
                float _479 = _441 * _465;
                float _481 = -_473;
                float _483 = fma(_391, _419, _481);
                float _485 = -_479;
                float _487 = fma(_435, _477, _485);
                float _489 = fma(_447, _483, _487);
                float _491 = _441 * _425;
                float _493 = 1.0 / _489;
                float _495 = -_469;
                float _497 = fma(_397, _431, _495);
                float _499 = -_471;
                float _501 = fma(_391, _431, _499);
                float _503 = -_491;
                float _505 = fma(_447, _419, _503);
                float _507 = _435 * _419;
                float _509 = _447 * _397;
                float _511 = -_467;
                float _513 = fma(_403, _431, _511);
                float _515 = _447 * _413;
                float _517 = _435 * _403;
                float _519 = _447 * _501;
                float _521 = -_509;
                float _523 = fma(_441, _403, _521);
                float _525 = _441 * _391;
                float _527 = _441 * _501;
                float _529 = -_391;
                float _531 = fma(_529, _425, _459);
                float _533 = -_515;
                float _535 = fma(_435, _425, _533);
                float _537 = -_517;
                float _539 = fma(_447, _391, _537);
                float _541 = -_519;
                float _543 = fma(_435, _513, _541);
                float _545 = -_507;
                float _547 = fma(_441, _413, _545);
                float _549 = -_525;
                float _551 = fma(_435, _397, _549);
                float _553 = -_527;
                float _555 = fma(_435, _497, _553);
                float _557 = _535 * _493;
                float _559 = _447 * _497;
                float _561 = fma(_453, _465, _543);
                float _563 = _505 * _493;
                float _565 = _547 * _493;
                float _567 = _531 * _493;
                float _569 = _387 * _557;
                float _571 = -_559;
                float _573 = fma(_441, _513, _571);
                float _575 = _455 * _493;
                float _577 = _387 * _563;
                float _579 = _387 * _565;
                float _581 = fma(_455, _567, _569);
                float _583 = fma(_453, _477, _573);
                float _585 = _539 * _493;
                float _587 = fma(_477, _575, _577);
                float _589 = fma(_483, _575, _579);
                float _591 = _523 * _493;
                float _593 = _551 * _493;
                float _595 = fma(_457, _585, _581);
                float _597 = fma(_453, _483, _555);
                float _599 = fma(_457, _591, _587);
                float _601 = fma(_457, _593, _589);
                float _603 = fma(_561, _493, _595);
                float _605 = -_583;
                float _607 = fma(_605, _493, _599);
                float _609 = -_597;
                float _611 = fma(_609, _493, _601);
                _357 = _607;
                _365 = _603;
                _373 = _611;
            }
        }
        float _613 = _357;
        float _615 = _365;
        float _617 = _373;
        bool _619 = !_331;
        _307 = _613;
        if (!_619)
        {
            float _621 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[48]);
            float _623 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[49]);
            float _625 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[50]);
            bool _627 = !_273;
            _345 = _621;
            _347 = _623;
            _349 = _625;
            if (!_627)
            {
                float _629 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
                float _631 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
                float _633 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
                float _635 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _637 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
                float _639 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
                float _641 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
                float _643 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                float _645 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[28]);
                float _647 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[29]);
                float _649 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[30]);
                float _651 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[31]);
                float _653 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
                float _655 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
                float _657 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
                float _659 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                float _661 = _643 * _631;
                float _663 = _643 * _633;
                float _665 = _643 * _629;
                float _667 = _635 * _647;
                float _669 = -_661;
                float _671 = fma(_639, _635, _669);
                float _673 = _635 * _649;
                float _675 = _635 * _645;
                float _677 = _643 * _649;
                float _679 = _643 * _647;
                float _681 = _643 * _645;
                float _683 = -_667;
                float _685 = fma(_631, _651, _683);
                float _687 = -_663;
                float _689 = fma(_641, _635, _687);
                float _691 = -_665;
                float _693 = fma(_637, _635, _691);
                float _695 = _633 * _647;
                float _697 = _633 * _645;
                float _699 = _641 * _647;
                float _701 = _641 * _645;
                float _703 = -_673;
                float _705 = fma(_633, _651, _703);
                float _707 = -_675;
                float _709 = fma(_629, _651, _707);
                float _711 = -_677;
                float _713 = fma(_641, _651, _711);
                float _715 = -_679;
                float _717 = fma(_639, _651, _715);
                float _719 = -_681;
                float _721 = fma(_637, _651, _719);
                float _723 = _631 * _645;
                float _725 = -_695;
                float _727 = fma(_631, _649, _725);
                float _729 = -_697;
                float _731 = fma(_629, _649, _729);
                float _733 = -_699;
                float _735 = fma(_639, _649, _733);
                float _737 = -_701;
                float _739 = fma(_637, _649, _737);
                float _741 = _641 * _631;
                float _743 = _641 * _629;
                float _745 = -_723;
                float _747 = fma(_629, _647, _745);
                float _749 = _639 * _629;
                float _751 = -_741;
                float _753 = fma(_639, _633, _751);
                float _755 = -_743;
                float _757 = fma(_637, _633, _755);
                float _759 = _641 * _709;
                float _761 = -_749;
                float _763 = fma(_637, _631, _761);
                float _765 = _641 * _685;
                float _767 = -_759;
                float _769 = fma(_637, _705, _767);
                float _771 = _639 * _645;
                float _773 = _639 * _709;
                float _775 = -_765;
                float _777 = fma(_639, _705, _775);
                float _779 = fma(_643, _731, _769);
                float _781 = -_771;
                float _783 = fma(_637, _647, _781);
                float _785 = _639 * _731;
                float _787 = -_773;
                float _789 = fma(_637, _685, _787);
                float _791 = fma(_643, _727, _777);
                float _793 = _655 * _779;
                float _795 = -_785;
                float _797 = fma(_637, _727, _795);
                float _799 = _657 * _685;
                float _801 = fma(_643, _747, _789);
                float _803 = -_793;
                float _805 = fma(_653, _791, _803);
                float _807 = fma(_641, _747, _797);
                float _809 = -_799;
                float _811 = fma(_655, _705, _809);
                float _813 = fma(_657, _801, _805);
                float _815 = -_659;
                float _817 = fma(_815, _807, _813);
                float _819 = _657 * _709;
                float _821 = 1.0 / _817;
                float _823 = -_819;
                float _825 = fma(_653, _705, _823);
                float _827 = _655 * _709;
                float _829 = _657 * _721;
                float _831 = _657 * _671;
                float _833 = -_827;
                float _835 = fma(_653, _685, _833);
                float _837 = -_829;
                float _839 = fma(_653, _713, _837);
                float _841 = _657 * _693;
                float _843 = _657 * _717;
                float _845 = fma(_659, _727, _811);
                float _847 = _655 * _721;
                float _849 = -_831;
                float _851 = fma(_655, _689, _849);
                float _853 = fma(_659, _747, _835);
                float _855 = _655 * _693;
                float _857 = -_841;
                float _859 = fma(_653, _689, _857);
                float _861 = fma(_659, _731, _825);
                float _863 = _779 * _821;
                float _865 = -_843;
                float _867 = fma(_655, _713, _865);
                float _869 = _845 * _821;
                float _871 = -_847;
                float _873 = fma(_653, _717, _871);
                float _875 = _853 * _821;
                float _877 = -_855;
                float _879 = fma(_653, _671, _877);
                float _881 = _861 * _821;
                float _883 = _621 * _863;
                float _885 = fma(_659, _735, _867);
                float _887 = _791 * _821;
                float _889 = _623 * _869;
                float _891 = fma(_659, _739, _839);
                float _893 = fma(_659, _783, _873);
                float _895 = _801 * _821;
                float _897 = _623 * _875;
                float _899 = -_883;
                float _901 = fma(_623, _881, _899);
                float _903 = -_889;
                float _905 = fma(_621, _887, _903);
                float _907 = _885 * _821;
                float _909 = -_897;
                float _911 = fma(_621, _895, _909);
                float _913 = _891 * _821;
                float _915 = _893 * _821;
                float _917 = fma(_659, _753, _851);
                float _919 = fma(_625, _907, _905);
                float _921 = fma(_659, _757, _859);
                float _923 = fma(_659, _763, _879);
                float _925 = -_913;
                float _927 = fma(_625, _925, _901);
                float _929 = fma(_625, _915, _911);
                float _931 = -_917;
                float _933 = fma(_931, _821, _919);
                float _935 = fma(_921, _821, _927);
                float _937 = -_923;
                float _939 = fma(_937, _821, _929);
                _345 = _933;
                _347 = _935;
                _349 = _939;
                _941 = true;
            }
            else
            {
                int _943 = as_type<int>(_177) & 1024;
                bool _945 = _943 != 0;
                bool _947 = !_945;
                if (!_947)
                {
                    float _949 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                    uint _951 = uint(int(uint(_149) >> uint(2)));
                    float _953 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_951)]);
                    int _955 = _149 + 4;
                    uint _957 = uint(int(uint(_955) >> uint(2)));
                    float _959 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_957)]);
                    int _961 = _149 + 8;
                    uint _963 = uint(int(uint(_961) >> uint(2)));
                    float _965 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_963)]);
                    uint _967 = uint(int(uint(_149) >> uint(2)));
                    float _969 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_967)]);
                    int _971 = _149 + 4;
                    uint _973 = uint(int(uint(_971) >> uint(2)));
                    float _975 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_973)]);
                    int _977 = _149 + 8;
                    uint _979 = uint(int(uint(_977) >> uint(2)));
                    float _981 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_979)]);
                    uint _983 = uint(int(uint(_149) >> uint(2)));
                    float _985 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_983)]);
                    int _987 = _149 + 4;
                    uint _989 = uint(int(uint(_987) >> uint(2)));
                    float _991 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_989)]);
                    int _993 = _149 + 8;
                    uint _995 = uint(int(uint(_993) >> uint(2)));
                    float _997 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_995)]);
                    float _999 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                    float _1001 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                    float _1003 = _965 * _969;
                    float _1005 = _965 * _975;
                    float _1007 = -_1003;
                    float _1009 = fma(_953, _981, _1007);
                    float _1011 = _959 * _969;
                    float _1013 = -_1005;
                    float _1015 = fma(_959, _981, _1013);
                    float _1017 = _991 * _1009;
                    float _1019 = -_1011;
                    float _1021 = fma(_953, _975, _1019);
                    float _1023 = -_1017;
                    float _1025 = fma(_985, _1015, _1023);
                    float _1027 = _949 * _981;
                    float _1029 = _949 * _975;
                    float _1031 = _949 * _969;
                    float _1033 = fma(_997, _1021, _1025);
                    float _1035 = 1.0 / _1033;
                    float _1037 = _997 * _969;
                    float _1039 = _991 * _981;
                    float _1041 = -_1029;
                    float _1043 = fma(_999, _959, _1041);
                    float _1045 = -_953;
                    float _1047 = fma(_1045, _981, _1003);
                    float _1049 = _985 * _975;
                    float _1051 = -_1027;
                    float _1053 = fma(_999, _965, _1051);
                    float _1055 = -_1031;
                    float _1057 = fma(_999, _953, _1055);
                    float _1059 = _985 * _965;
                    float _1061 = -_1037;
                    float _1063 = fma(_985, _981, _1061);
                    float _1065 = -_1039;
                    float _1067 = fma(_997, _975, _1065);
                    float _1069 = _991 * _953;
                    float _1071 = -_1049;
                    float _1073 = fma(_991, _969, _1071);
                    float _1075 = -_1059;
                    float _1077 = fma(_997, _953, _1075);
                    float _1079 = _997 * _959;
                    float _1081 = _997 * _1043;
                    float _1083 = _1067 * _1035;
                    float _1085 = _1063 * _1035;
                    float _1087 = -_1069;
                    float _1089 = fma(_985, _959, _1087);
                    float _1091 = _1073 * _1035;
                    float _1093 = _997 * _1057;
                    float _1095 = -_1079;
                    float _1097 = fma(_991, _965, _1095);
                    float _1099 = _991 * _1057;
                    float _1101 = -_1081;
                    float _1103 = fma(_991, _1053, _1101);
                    float _1105 = _1083 * _623;
                    float _1107 = _1085 * _623;
                    float _1109 = _1091 * _623;
                    float _1111 = _1047 * _1035;
                    float _1113 = _1015 * _1035;
                    float _1115 = _1021 * _1035;
                    float _1117 = -_1093;
                    float _1119 = fma(_985, _1053, _1117);
                    float _1121 = fma(_1111, _621, _1107);
                    float _1123 = fma(_621, _1113, _1105);
                    float _1125 = fma(_621, _1115, _1109);
                    float _1127 = _1077 * _1035;
                    float _1129 = _1097 * _1035;
                    float _1131 = _1089 * _1035;
                    float _1133 = -_1099;
                    float _1135 = fma(_985, _1043, _1133);
                    float _1137 = fma(_1127, _625, _1121);
                    float _1139 = fma(_1129, _625, _1123);
                    float _1141 = fma(_1001, _1009, _1119);
                    float _1143 = fma(_1131, _625, _1125);
                    float _1145 = fma(_1001, _1015, _1103);
                    float _1147 = fma(_1001, _1021, _1135);
                    float _1149 = fma(_1141, _1035, _1137);
                    float _1151 = -_1145;
                    float _1153 = fma(_1151, _1035, _1139);
                    float _1155 = -_1147;
                    float _1157 = fma(_1155, _1035, _1143);
                    _345 = _1153;
                    _347 = _1149;
                    _349 = _1157;
                    _941 = true;
                }
                else
                {
                    int _1159 = as_type<int>(_177) & 2048;
                    bool _1161 = _1159 != 0;
                    bool _1163 = !_1161;
                    if (!_1163)
                    {
                        uint _1165 = uint(int(uint(_149) >> uint(2)));
                        float _1167 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1165)]);
                        int _1169 = _149 + 4;
                        uint _1171 = uint(int(uint(_1169) >> uint(2)));
                        float _1173 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1171)]);
                        int _1175 = _149 + 8;
                        uint _1177 = uint(int(uint(_1175) >> uint(2)));
                        float _1179 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1177)]);
                        int _1181 = _149 + 12;
                        uint _1183 = uint(int(uint(_1181) >> uint(2)));
                        float _1185 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1183)]);
                        uint _1187 = uint(int(uint(_149) >> uint(2)));
                        float _1189 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1187)]);
                        int _1191 = _149 + 4;
                        uint _1193 = uint(int(uint(_1191) >> uint(2)));
                        float _1195 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1193)]);
                        int _1197 = _149 + 8;
                        uint _1199 = uint(int(uint(_1197) >> uint(2)));
                        float _1201 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1199)]);
                        int _1203 = _149 + 12;
                        uint _1205 = uint(int(uint(_1203) >> uint(2)));
                        float _1207 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1205)]);
                        uint _1209 = uint(int(uint(_149) >> uint(2)));
                        float _1211 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1209)]);
                        int _1213 = _149 + 4;
                        uint _1215 = uint(int(uint(_1213) >> uint(2)));
                        float _1217 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1215)]);
                        int _1219 = _149 + 8;
                        uint _1221 = uint(int(uint(_1219) >> uint(2)));
                        float _1223 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1221)]);
                        int _1225 = _149 + 12;
                        uint _1227 = uint(int(uint(_1225) >> uint(2)));
                        float _1229 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1227)]);
                        float _1231 = _1179 * _1189;
                        float _1233 = _1179 * _1195;
                        float _1235 = _1173 * _1189;
                        float _1237 = _1185 * _1201;
                        float _1239 = -_1231;
                        float _1241 = fma(_1167, _1201, _1239);
                        float _1243 = -_1233;
                        float _1245 = fma(_1173, _1201, _1243);
                        float _1247 = -_1235;
                        float _1249 = fma(_1167, _1195, _1247);
                        float _1251 = _1217 * _1201;
                        float _1253 = _1217 * _1241;
                        float _1255 = _1185 * _1195;
                        float _1257 = _1185 * _1189;
                        float _1259 = -_1251;
                        float _1261 = fma(_1223, _1195, _1259);
                        float _1263 = -_1253;
                        float _1265 = fma(_1211, _1245, _1263);
                        float _1267 = _1211 * _1195;
                        float _1269 = _1223 * _1189;
                        float _1271 = -_1237;
                        float _1273 = fma(_1179, _1207, _1271);
                        float _1275 = fma(_1223, _1249, _1265);
                        float _1277 = -_1255;
                        float _1279 = fma(_1173, _1207, _1277);
                        float _1281 = -_1257;
                        float _1283 = fma(_1167, _1207, _1281);
                        float _1285 = _1211 * _1179;
                        float _1287 = -_1167;
                        float _1289 = fma(_1287, _1201, _1231);
                        float _1291 = -_1269;
                        float _1293 = fma(_1211, _1201, _1291);
                        float _1295 = 1.0 / _1275;
                        float _1297 = -_1267;
                        float _1299 = fma(_1217, _1189, _1297);
                        float _1301 = -_1285;
                        float _1303 = fma(_1223, _1167, _1301);
                        float _1305 = _1217 * _1167;
                        float _1307 = _1223 * _1173;
                        float _1309 = _1223 * _1279;
                        float _1311 = _1223 * _1283;
                        float _1313 = -_1305;
                        float _1315 = fma(_1211, _1173, _1313);
                        float _1317 = -_1307;
                        float _1319 = fma(_1217, _1179, _1317);
                        float _1321 = _1217 * _1283;
                        float _1323 = -_1309;
                        float _1325 = fma(_1217, _1273, _1323);
                        float _1327 = -_1311;
                        float _1329 = fma(_1211, _1273, _1327);
                        float _1331 = -_1321;
                        float _1333 = fma(_1211, _1279, _1331);
                        float _1335 = fma(_1229, _1245, _1325);
                        float _1337 = fma(_1229, _1241, _1329);
                        float _1339 = _1261 * _1295;
                        float _1341 = _1293 * _1295;
                        float _1343 = _1299 * _1295;
                        float _1345 = _1289 * _1295;
                        float _1347 = _1339 * _623;
                        float _1349 = _1341 * _623;
                        float _1351 = _1343 * _623;
                        float _1353 = _1245 * _1295;
                        float _1355 = _1249 * _1295;
                        float _1357 = fma(_1345, _621, _1349);
                        float _1359 = _1303 * _1295;
                        float _1361 = fma(_621, _1353, _1347);
                        float _1363 = fma(_621, _1355, _1351);
                        float _1365 = _1319 * _1295;
                        float _1367 = _1315 * _1295;
                        float _1369 = fma(_1229, _1249, _1333);
                        float _1371 = fma(_1359, _625, _1357);
                        float _1373 = fma(_1365, _625, _1361);
                        float _1375 = fma(_1367, _625, _1363);
                        float _1377 = fma(_1337, _1295, _1371);
                        float _1379 = -_1335;
                        float _1381 = fma(_1379, _1295, _1373);
                        float _1383 = -_1369;
                        float _1385 = fma(_1383, _1295, _1375);
                        _345 = _1381;
                        _347 = _1377;
                        _349 = _1385;
                    }
                }
            }
        }
        _941 = false;
        float _1387 = _345;
        float _1389 = _347;
        float _1391 = _349;
        float _1393 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[43]);
        float _1395 = _613 + _1387;
        float _1397 = _615 + _1389;
        float _1399 = _617 + _1391;
        float _1401 = -_283;
        float _1403 = _1395 + _1401;
        float _1405 = -_285;
        float _1407 = _1397 + _1405;
        float _1409 = -_281;
        float _1411 = _1399 + _1409;
        float _1413 = _1403 * _1393;
        float _1415 = _1407 * _1393;
        float _1417 = _1411 * _1393;
        float _1419 = _181 * _1413;
        float _1421 = _181 * _1415;
        float _1423 = _181 * _1417;
        float _1425 = _143 * _1419;
        float _1427 = _143 * _1421;
        float _1429 = _143 * _1423;
        _303 = _1427;
        _305 = _1429;
        _293 = _1425;
    }
    float _1431 = _303;
    float _1433 = _305;
    float _1435 = _293;
    float _1437 = _307;
    float _1439 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[50]);
    float _1441 = _1431 + _285;
    float _1443 = _1433 + _281;
    uint _1445 = uint(int(uint(_159) >> uint(2)));
    float _1447 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1445)]);
    float _1449 = _1435 + _283;
    float _1451 = trunc(_1439);
    int _1453 = int(_1451);
    bool _1455 = _1453 != 0;
    bool _1457 = _1453 != 1;
    bool _1459 = _1453 != 2;
    float _1461 = _1433;
    float _1463 = _1437;
    if (_1455)
    {
        _1461 = _1441;
    }
    float _1465 = _1461;
    float _1467 = _1465;
    if (_1455)
    {
        _1463 = _1443;
    }
    float _1469 = _1463;
    float _1471 = _1469;
    if (!_1455)
    {
        float _1473 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[48]);
        float _1475 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[49]);
        float _1477 = _181 * _1473;
        float _1479 = _143 * _1477;
        bool _1481 = _1475 != 0.0;
        bool _1483 = isnan(_1475);
        bool _1485 = _1481 || _1483;
        bool _1487 = isnan(0.0);
        bool _1489 = _1485 || _1487;
        float _1491 = _1479 * 0.15915493667125701904296875;
        float _1493 = _1491 * 6.283185482025146484375;
        float _1495 = sin(_1493);
        float _1497 = _1491 * 6.283185482025146484375;
        float _1499 = cos(_1497);
        float _1501 = _1443 * _1495;
        float _1503 = _1441 * _1495;
        float _1505 = fma(_1441, _1499, _1501);
        float _1507 = -_1503;
        float _1509 = fma(_1443, _1499, _1507);
        float _1511 = _1501;
        float _1513 = _1503;
        _1471 = _1509;
        _289 = _1495;
        if (!_1489)
        {
            _1511 = _1505;
        }
        float _1515 = _1511;
        bool _1517 = !_1489;
        _1467 = _1515;
        if (!_1517)
        {
            float _1519 = _1509 * _1509;
            float _1521 = fma(_1505, _1505, _1519);
            bool _1523 = _1521 > 0.0;
            float _1525 = _1515;
            _289 = _1521;
            if (_1523)
            {
                float _1527 = rsqrt(_1521);
                _1525 = _1527;
            }
            float _1529 = _1525;
            float _1531 = _1529;
            if (_1523)
            {
                float _1533 = _1475 * _1529;
                _1531 = _1533;
            }
            float _1535 = _1531;
            float _1537 = _1535;
            if (_1523)
            {
                float _1539 = _181 * _1535;
                _1513 = _1539;
            }
            float _1541 = _1513;
            float _1543 = _1541;
            if (!_1523)
            {
                _1537 = _1505;
            }
            float _1545 = _1537;
            float _1547 = _1545;
            if (_1523)
            {
                float _1549 = _143 * _1541;
                _1543 = _1549;
            }
            float _1551 = _1543;
            if (_1523)
            {
                float _1553 = fma(_1505, _1551, _1505);
                _1547 = _1553;
            }
            float _1555 = _1547;
            _1467 = _1555;
            if (_1523)
            {
                float _1557 = fma(_1509, _1551, _1509);
                _1471 = _1557;
            }
        }
    }
    float _1559 = _1471;
    float _1561 = _1467;
    float _1563 = _289;
    float _1565 = _1563;
    float _1567 = _1559;
    float _1569 = _1561;
    float _1571 = _1561;
    if (_1457)
    {
        _1565 = _1449;
    }
    float _1573 = _1565;
    float _1575 = _1573;
    if (!_1457)
    {
        float _1577 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[48]);
        float _1579 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[49]);
        float _1581 = _181 * _1577;
        float _1583 = _143 * _1581;
        bool _1585 = _1579 != 0.0;
        bool _1587 = isnan(_1579);
        bool _1589 = _1585 || _1587;
        bool _1591 = isnan(0.0);
        bool _1593 = _1589 || _1591;
        float _1595 = _1583 * 0.15915493667125701904296875;
        float _1597 = _1595 * 6.283185482025146484375;
        float _1599 = sin(_1597);
        float _1601 = _1595 * 6.283185482025146484375;
        float _1603 = cos(_1601);
        float _1605 = _1599 * _1559;
        float _1607 = _1449 * _1599;
        float _1609 = -_1605;
        float _1611 = fma(_1449, _1603, _1609);
        float _1613 = fma(_1603, _1559, _1607);
        float _1615 = _1605;
        float _1617 = _1613;
        _1567 = _1613;
        if (!_1593)
        {
            _1615 = _1611;
        }
        float _1619 = _1615;
        bool _1621 = !_1593;
        _1575 = _1619;
        if (!_1621)
        {
            float _1623 = _1611 * _1611;
            float _1625 = fma(_1613, _1613, _1623);
            bool _1627 = _1625 > 0.0;
            float _1629 = _1607;
            float _1631 = _1623;
            if (_1627)
            {
                float _1633 = rsqrt(_1625);
                _1629 = _1633;
            }
            float _1635 = _1629;
            if (!_1627)
            {
                _1631 = _1611;
            }
            float _1637 = _1631;
            float _1639 = _1635;
            _1575 = _1637;
            if (_1627)
            {
                float _1641 = _1579 * _1635;
                _1639 = _1641;
            }
            float _1643 = _1639;
            float _1645 = _1643;
            if (_1627)
            {
                float _1647 = _181 * _1643;
                _1645 = _1647;
            }
            float _1649 = _1645;
            float _1651 = _1649;
            if (_1627)
            {
                float _1653 = _143 * _1649;
                _1651 = _1653;
            }
            float _1655 = _1651;
            if (_1627)
            {
                float _1657 = fma(_1613, _1655, _1613);
                _1617 = _1657;
            }
            float _1659 = _1617;
            _1567 = _1659;
            if (_1627)
            {
                float _1661 = fma(_1611, _1655, _1611);
                _1575 = _1661;
            }
        }
    }
    float _1663 = _1575;
    float _1665 = _1567;
    float _1667 = _1663;
    float _1669 = _1663;
    if (!_1459)
    {
        float _1671 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[48]);
        float _1673 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[49]);
        float _1675 = _181 * _1671;
        float _1677 = _143 * _1675;
        bool _1679 = _1673 != 0.0;
        bool _1681 = isnan(_1673);
        bool _1683 = _1679 || _1681;
        bool _1685 = isnan(0.0);
        bool _1687 = _1683 || _1685;
        float _1689 = _1677 * 0.15915493667125701904296875;
        float _1691 = _1689 * 6.283185482025146484375;
        float _1693 = sin(_1691);
        float _1695 = _1689 * 6.283185482025146484375;
        float _1697 = cos(_1695);
        float _1699 = _1693 * _1561;
        float _1701 = _1693 * _1663;
        float _1703 = fma(_1697, _1663, _1699);
        float _1705 = -_1701;
        float _1707 = fma(_1697, _1561, _1705);
        float _1709 = _1699;
        if (!_1687)
        {
            _1667 = _1703;
        }
        float _1711 = _1667;
        _1669 = _1711;
        if (!_1687)
        {
            _1569 = _1707;
        }
        float _1713 = _1569;
        bool _1715 = !_1687;
        _1571 = _1713;
        if (!_1715)
        {
            float _1717 = _1707 * _1707;
            float _1719 = fma(_1703, _1703, _1717);
            bool _1721 = _1719 > 0.0;
            float _1723 = _1713;
            float _1725 = _1717;
            if (_1721)
            {
                float _1727 = rsqrt(_1719);
                _1723 = _1727;
            }
            float _1729 = _1723;
            if (!_1721)
            {
                _1725 = _1703;
            }
            float _1731 = _1725;
            float _1733 = _1729;
            float _1735 = _1731;
            if (_1721)
            {
                float _1737 = _1673 * _1729;
                _1733 = _1737;
            }
            float _1739 = _1733;
            float _1741 = _1739;
            if (_1721)
            {
                float _1743 = _181 * _1739;
                _1709 = _1743;
            }
            float _1745 = _1709;
            float _1747 = _1745;
            if (!_1721)
            {
                _1741 = _1707;
            }
            float _1749 = _1741;
            _1571 = _1749;
            if (_1721)
            {
                float _1751 = _143 * _1745;
                _1747 = _1751;
            }
            float _1753 = _1747;
            if (_1721)
            {
                float _1755 = fma(_1703, _1753, _1703);
                _1735 = _1755;
            }
            float _1757 = _1735;
            _1669 = _1757;
            if (_1721)
            {
                float _1759 = fma(_1707, _1753, _1707);
                _1571 = _1759;
            }
        }
    }
    float _1761 = _1571;
    float _1763 = _1669;
    float _1765 = -_199;
    float _1767 = _1765 + _1761;
    int _1769 = _149 + 4;
    uint _1771 = uint(int(uint(_159) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1771)] = as_type<uint>(_1447);
    int _1773 = _149 + 8;
    float _1775 = -_193;
    float _1777 = _1775 + _1763;
    uint _1779 = uint(int(uint(_149) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1779)] = as_type<uint>(_1763);
    float _1781 = -_205;
    float _1783 = _1781 + _1665;
    uint _1785 = uint(int(uint(_1769) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1785)] = as_type<uint>(_1761);
    uint _1787 = uint(int(uint(_1773) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1787)] = as_type<uint>(_1665);
    uint _1789 = uint(int(uint(_149) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1789)] = as_type<uint>(_267);
    uint _1791 = uint(int(uint(_1769) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1791)] = as_type<uint>(_269);
    uint _1793 = uint(int(uint(_1773) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1793)] = as_type<uint>(_263);
    uint _1795 = uint(int(uint(_149) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1795)] = as_type<uint>(_1777);
    uint _1797 = uint(int(uint(_1769) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1797)] = as_type<uint>(_1767);
    uint _1799 = uint(int(uint(_1773) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1799)] = as_type<uint>(_1783);
    float _1801 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1803 = _1767 * _1767;
    float _1805 = _269 * _269;
    float _1807 = fma(_1777, _1777, _1803);
    float _1809 = fma(_267, _267, _1805);
    float _1811 = fma(_1783, _1783, _1807);
    float _1813 = fma(_263, _263, _1809);
    float _1815 = sqrt(_1813);
    float _1817 = sqrt(_1811);
    bool _1819 = _1817 >= 9.9999999747524270787835121154785e-07;
    bool _1821 = isnan(_1817);
    bool _1823 = _1819 || _1821;
    bool _1825 = isnan(9.9999999747524270787835121154785e-07);
    bool _1827 = _1823 || _1825;
    if (!_1827)
    {
        bool _1829 = _183 != _189;
        bool _1831 = isnan(_183);
        bool _1833 = _1829 || _1831;
        bool _1835 = isnan(_189);
        bool _1837 = _1833 || _1835;
        _1839 = _1837;
        if (!_1839)
        {
            float _1841 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
            bool _1843 = _1841 > 0.0;
            bool _1845 = !_1843;
            if (!_1845)
            {
                float _1847 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
                float _1849 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
                float _1851 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
                float _1853 = _1849 * _1849;
                float _1855 = fma(_1847, _1847, _1853);
                float _1857 = fma(_1851, _1851, _1855);
                float _1859 = rsqrt(_1857);
                float _1861 = _1859 * 9.9999999747524270787835121154785e-07;
                float _1863 = _1847 * _1861;
                float _1865 = _1849 * _1861;
                float _1867 = _1851 * _1861;
                _321 = as_type<int>(_1863);
                _323 = as_type<int>(_1865);
                _325 = as_type<int>(_1867);
                _1839 = true;
            }
            else
            {
                bool _1869 = _1815 >= 9.9999999747524270787835121154785e-07;
                bool _1871 = isnan(_1815);
                bool _1873 = _1869 || _1871;
                bool _1875 = isnan(9.9999999747524270787835121154785e-07);
                bool _1877 = _1873 || _1875;
                if (!_1877)
                {
                    float _1879 = _1761 * _1761;
                    float _1881 = fma(_1763, _1763, _1879);
                    float _1883 = fma(_1665, _1665, _1881);
                    float _1885 = sqrt(_1883);
                    bool _1887 = _1885 >= 9.9999999747524270787835121154785e-07;
                    bool _1889 = isnan(_1885);
                    bool _1891 = _1887 || _1889;
                    bool _1893 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1895 = _1891 || _1893;
                    float _1897 = _1885;
                    if (_1895)
                    {
                        float _1899 = rsqrt(_1883);
                        _1897 = _1899;
                    }
                    float _1901 = _1897;
                    if (!_1895)
                    {
                        _309 = 0;
                    }
                    int _1903 = _309;
                    int _1905 = _1903;
                    if (!_1895)
                    {
                        _311 = 897988541;
                    }
                    int _1907 = _311;
                    int _1909 = _1907;
                    if (!_1895)
                    {
                        _313 = 0;
                    }
                    int _1911 = _313;
                    float _1913 = _1901;
                    int _1915 = _1911;
                    if (_1895)
                    {
                        float _1917 = _1901 * 9.9999999747524270787835121154785e-07;
                        _1913 = _1917;
                    }
                    float _1919 = _1913;
                    if (_1895)
                    {
                        float _1921 = _1763 * _1919;
                        _1905 = as_type<int>(_1921);
                    }
                    int _1923 = _1905;
                    _321 = _1923;
                    if (_1895)
                    {
                        float _1925 = _1761 * _1919;
                        _1909 = as_type<int>(_1925);
                    }
                    int _1927 = _1909;
                    _323 = _1927;
                    if (_1895)
                    {
                        float _1929 = _1665 * _1919;
                        _1915 = as_type<int>(_1929);
                    }
                    int _1931 = _1915;
                    _325 = _1931;
                    _1839 = true;
                }
                else
                {
                    float _1933 = rsqrt(_1813);
                    float _1935 = _1933 * 9.9999999747524270787835121154785e-07;
                    float _1937 = _267 * _1935;
                    float _1939 = _269 * _1935;
                    float _1941 = _263 * _1935;
                    _321 = as_type<int>(_1937);
                    _323 = as_type<int>(_1939);
                    _325 = as_type<int>(_1941);
                    _1839 = true;
                }
            }
        }
    }
    else
    {
        float _1943 = _1815 * _1801;
        bool _1945 = _1943 >= 0.001000000047497451305389404296875;
        bool _1947 = isnan(_1943);
        bool _1949 = _1945 || _1947;
        bool _1951 = isnan(0.001000000047497451305389404296875);
        bool _1953 = _1949 || _1951;
        bool _1955 = _1943 > 0.0;
        bool _1957 = !_1953;
        bool _1959 = _1955 && _1957;
        bool _1961 = _1817 < 0.001000000047497451305389404296875;
        bool _1963 = _1961 && _1959;
        if (!_1963)
        {
            _315 = as_type<int>(_1777);
        }
        int _1965 = _315;
        int _1967 = _1965;
        if (_1963)
        {
            float _1969 = _267 * _1801;
            _1967 = as_type<int>(_1969);
        }
        int _1971 = _1967;
        _321 = _1971;
        if (!_1963)
        {
            _317 = as_type<int>(_1767);
        }
        int _1973 = _317;
        int _1975 = _1973;
        if (_1963)
        {
            float _1977 = _269 * _1801;
            _1975 = as_type<int>(_1977);
        }
        int _1979 = _1975;
        _323 = _1979;
        if (!_1963)
        {
            _319 = as_type<int>(_1783);
        }
        int _1981 = _319;
        _325 = _1981;
        if (_1963)
        {
            float _1983 = _263 * _1801;
            _325 = as_type<int>(_1983);
        }
    }
    _1839 = false;
    int _1985 = _321;
    int _1987 = _323;
    int _1989 = _325;
    uint _1991 = uint(int(uint(_149) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1991)] = uint(_1985);
    uint _1993 = uint(int(uint(_1769) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1993)] = uint(_1987);
    uint _1995 = uint(int(uint(_1773) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1995)] = uint(_1989);
}

