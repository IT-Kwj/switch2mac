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
    bool _1507 = false;
    bool _933 = false;
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
    int _157 = _149 + 12;
    float _159 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
    uint _161 = uint(int(uint(_149) >> uint(2)));
    float _163 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_161)]);
    int _165 = _149 + 4;
    uint _167 = uint(int(uint(_165) >> uint(2)));
    float _169 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_167)]);
    int _171 = _149 + 8;
    uint _173 = uint(int(uint(_171) >> uint(2)));
    float _175 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_173)]);
    uint _177 = uint(int(uint(_157) >> uint(2)));
    float _179 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_177)]);
    float _181 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    float _183 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    bool _185 = _145 > 0.0;
    uint _187 = uint(int(uint(_157) >> uint(2)));
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
    float _233 = 0.0;
    if (_185)
    {
        float _235 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[52]);
        _233 = _235;
    }
    float _237 = _233;
    float _239 = _143 * _209;
    float _241 = exp2(_239);
    float _243 = _151 * _159;
    float _245 = _153 * _159;
    float _247 = _155 * _159;
    float _249 = _143 * _243;
    float _251 = _143 * _245;
    float _253 = _143 * _247;
    float _255 = _179 * _143;
    int _257 = as_type<int>(_181) & 512;
    bool _259 = _257 != 0;
    float _261 = fma(_163, _241, _249);
    float _263 = fma(_169, _241, _251);
    float _265 = fma(_175, _241, _253);
    bool _267 = _237 == 0.0;
    bool _269 = _237 == 0.0;
    bool _271 = _269 && _185;
    float _273 = fma(_175, _255, _205);
    float _275 = fma(_163, _255, _193);
    float _277 = fma(_169, _255, _199);
    float _279 = _175;
    float _281 = _163;
    float _283 = _169;
    if (_271)
    {
        _279 = 0.0;
    }
    float _285 = _279;
    float _287 = _285;
    if (_271)
    {
        _281 = 0.0;
        _283 = 0.0;
    }
    float _289 = _281;
    float _291 = _283;
    bool _293 = _185 && _267;
    float _295 = _231;
    float _297 = _291;
    float _299 = _289;
    int _301 = as_type<int>(_213);
    int _303 = as_type<int>(_219);
    int _305 = as_type<int>(_225);
    int _307 = as_type<int>(_213);
    int _309 = as_type<int>(_219);
    int _311 = as_type<int>(_225);
    int _313 = as_type<int>(_213);
    int _315 = as_type<int>(_219);
    int _317 = as_type<int>(_225);
    if (!_293)
    {
        float _319 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[44]);
        bool _321 = _237 > 0.0;
        bool _323 = _321 && _185;
        float _325 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[40]);
        float _327 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[41]);
        float _329 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[42]);
        float _331 = trunc(_319);
        int _333 = int(_331);
        bool _335 = _333 > 0;
        float _337 = _329;
        float _339 = _325;
        float _341 = _327;
        if (!_335)
        {
            _295 = 0.0;
        }
        float _343 = _295;
        float _345 = 0.0;
        float _347 = _343;
        float _349 = _343;
        if (!_335)
        {
            _345 = 0.0;
        }
        float _351 = _345;
        float _353 = 0.0;
        float _355 = _351;
        float _357 = _351;
        if (!_335)
        {
            _353 = 0.0;
        }
        float _359 = _353;
        bool _361 = !_335;
        float _363 = _359;
        float _365 = _359;
        if (!_361)
        {
            int _367 = as_type<int>(_181) & 2048;
            bool _369 = _367 != 0;
            if (!_369)
            {
                _347 = 0.0;
            }
            float _371 = _347;
            _349 = _371;
            if (!_369)
            {
                _355 = 0.0;
            }
            float _373 = _355;
            _357 = _373;
            if (!_369)
            {
                _363 = 0.0;
            }
            float _375 = _363;
            bool _377 = !_369;
            _365 = _375;
            if (!_377)
            {
                float _379 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                uint _381 = uint(int(uint(_149) >> uint(2)));
                float _383 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_381)]);
                int _385 = _149 + 4;
                uint _387 = uint(int(uint(_385) >> uint(2)));
                float _389 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_387)]);
                int _391 = _149 + 8;
                uint _393 = uint(int(uint(_391) >> uint(2)));
                float _395 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_393)]);
                int _397 = _149 + 12;
                uint _399 = uint(int(uint(_397) >> uint(2)));
                float _401 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_399)]);
                uint _403 = uint(int(uint(_149) >> uint(2)));
                float _405 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_403)]);
                int _407 = _149 + 4;
                uint _409 = uint(int(uint(_407) >> uint(2)));
                float _411 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_409)]);
                int _413 = _149 + 8;
                uint _415 = uint(int(uint(_413) >> uint(2)));
                float _417 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_415)]);
                int _419 = _149 + 12;
                uint _421 = uint(int(uint(_419) >> uint(2)));
                float _423 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_421)]);
                uint _425 = uint(int(uint(_149) >> uint(2)));
                float _427 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_425)]);
                int _429 = _149 + 4;
                uint _431 = uint(int(uint(_429) >> uint(2)));
                float _433 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_431)]);
                int _435 = _149 + 8;
                uint _437 = uint(int(uint(_435) >> uint(2)));
                float _439 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_437)]);
                int _441 = _149 + 12;
                uint _443 = uint(int(uint(_441) >> uint(2)));
                float _445 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_443)]);
                float _447 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                float _449 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _451 = _395 * _405;
                float _453 = _395 * _411;
                float _455 = -_451;
                float _457 = fma(_383, _417, _455);
                float _459 = _401 * _417;
                float _461 = _401 * _411;
                float _463 = _401 * _405;
                float _465 = _389 * _405;
                float _467 = -_453;
                float _469 = fma(_389, _417, _467);
                float _471 = _433 * _457;
                float _473 = -_465;
                float _475 = fma(_383, _411, _473);
                float _477 = -_471;
                float _479 = fma(_427, _469, _477);
                float _481 = fma(_439, _475, _479);
                float _483 = _433 * _417;
                float _485 = 1.0 / _481;
                float _487 = -_461;
                float _489 = fma(_389, _423, _487);
                float _491 = -_463;
                float _493 = fma(_383, _423, _491);
                float _495 = -_483;
                float _497 = fma(_439, _411, _495);
                float _499 = _427 * _411;
                float _501 = _439 * _389;
                float _503 = -_459;
                float _505 = fma(_395, _423, _503);
                float _507 = _439 * _405;
                float _509 = _427 * _395;
                float _511 = _439 * _493;
                float _513 = -_501;
                float _515 = fma(_433, _395, _513);
                float _517 = _433 * _383;
                float _519 = _433 * _493;
                float _521 = -_383;
                float _523 = fma(_521, _417, _451);
                float _525 = -_507;
                float _527 = fma(_427, _417, _525);
                float _529 = -_509;
                float _531 = fma(_439, _383, _529);
                float _533 = -_511;
                float _535 = fma(_427, _505, _533);
                float _537 = -_499;
                float _539 = fma(_433, _405, _537);
                float _541 = -_517;
                float _543 = fma(_427, _389, _541);
                float _545 = -_519;
                float _547 = fma(_427, _489, _545);
                float _549 = _527 * _485;
                float _551 = _439 * _489;
                float _553 = fma(_445, _457, _535);
                float _555 = _497 * _485;
                float _557 = _539 * _485;
                float _559 = _523 * _485;
                float _561 = _379 * _549;
                float _563 = -_551;
                float _565 = fma(_433, _505, _563);
                float _567 = _447 * _485;
                float _569 = _379 * _555;
                float _571 = _379 * _557;
                float _573 = fma(_447, _559, _561);
                float _575 = fma(_445, _469, _565);
                float _577 = _531 * _485;
                float _579 = fma(_469, _567, _569);
                float _581 = fma(_475, _567, _571);
                float _583 = _515 * _485;
                float _585 = _543 * _485;
                float _587 = fma(_449, _577, _573);
                float _589 = fma(_445, _475, _547);
                float _591 = fma(_449, _583, _579);
                float _593 = fma(_449, _585, _581);
                float _595 = fma(_553, _485, _587);
                float _597 = -_575;
                float _599 = fma(_597, _485, _591);
                float _601 = -_589;
                float _603 = fma(_601, _485, _593);
                _365 = _603;
                _349 = _599;
                _357 = _595;
            }
        }
        float _605 = _365;
        float _607 = _349;
        float _609 = _357;
        bool _611 = !_323;
        if (!_611)
        {
            float _613 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[48]);
            float _615 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[49]);
            float _617 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[50]);
            bool _619 = !_259;
            _337 = _617;
            _339 = _613;
            _341 = _615;
            if (!_619)
            {
                float _621 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
                float _623 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
                float _625 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
                float _627 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _629 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
                float _631 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
                float _633 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
                float _635 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                float _637 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[28]);
                float _639 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[29]);
                float _641 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[30]);
                float _643 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[31]);
                float _645 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
                float _647 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
                float _649 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
                float _651 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                float _653 = _635 * _623;
                float _655 = _635 * _625;
                float _657 = _635 * _621;
                float _659 = _627 * _639;
                float _661 = -_653;
                float _663 = fma(_631, _627, _661);
                float _665 = _627 * _641;
                float _667 = _627 * _637;
                float _669 = _635 * _641;
                float _671 = _635 * _639;
                float _673 = _635 * _637;
                float _675 = -_659;
                float _677 = fma(_623, _643, _675);
                float _679 = -_655;
                float _681 = fma(_633, _627, _679);
                float _683 = -_657;
                float _685 = fma(_629, _627, _683);
                float _687 = _625 * _639;
                float _689 = _625 * _637;
                float _691 = _633 * _639;
                float _693 = _633 * _637;
                float _695 = -_665;
                float _697 = fma(_625, _643, _695);
                float _699 = -_667;
                float _701 = fma(_621, _643, _699);
                float _703 = -_669;
                float _705 = fma(_633, _643, _703);
                float _707 = -_671;
                float _709 = fma(_631, _643, _707);
                float _711 = -_673;
                float _713 = fma(_629, _643, _711);
                float _715 = _623 * _637;
                float _717 = -_687;
                float _719 = fma(_623, _641, _717);
                float _721 = -_689;
                float _723 = fma(_621, _641, _721);
                float _725 = -_691;
                float _727 = fma(_631, _641, _725);
                float _729 = -_693;
                float _731 = fma(_629, _641, _729);
                float _733 = _633 * _623;
                float _735 = _633 * _621;
                float _737 = -_715;
                float _739 = fma(_621, _639, _737);
                float _741 = _631 * _621;
                float _743 = -_733;
                float _745 = fma(_631, _625, _743);
                float _747 = -_735;
                float _749 = fma(_629, _625, _747);
                float _751 = _633 * _701;
                float _753 = -_741;
                float _755 = fma(_629, _623, _753);
                float _757 = _633 * _677;
                float _759 = -_751;
                float _761 = fma(_629, _697, _759);
                float _763 = _631 * _637;
                float _765 = _631 * _701;
                float _767 = -_757;
                float _769 = fma(_631, _697, _767);
                float _771 = fma(_635, _723, _761);
                float _773 = -_763;
                float _775 = fma(_629, _639, _773);
                float _777 = _631 * _723;
                float _779 = -_765;
                float _781 = fma(_629, _677, _779);
                float _783 = fma(_635, _719, _769);
                float _785 = _647 * _771;
                float _787 = -_777;
                float _789 = fma(_629, _719, _787);
                float _791 = _649 * _677;
                float _793 = fma(_635, _739, _781);
                float _795 = -_785;
                float _797 = fma(_645, _783, _795);
                float _799 = fma(_633, _739, _789);
                float _801 = -_791;
                float _803 = fma(_647, _697, _801);
                float _805 = fma(_649, _793, _797);
                float _807 = -_651;
                float _809 = fma(_807, _799, _805);
                float _811 = _649 * _701;
                float _813 = 1.0 / _809;
                float _815 = -_811;
                float _817 = fma(_645, _697, _815);
                float _819 = _647 * _701;
                float _821 = _649 * _713;
                float _823 = _649 * _663;
                float _825 = -_819;
                float _827 = fma(_645, _677, _825);
                float _829 = -_821;
                float _831 = fma(_645, _705, _829);
                float _833 = _649 * _685;
                float _835 = _649 * _709;
                float _837 = fma(_651, _719, _803);
                float _839 = _647 * _713;
                float _841 = -_823;
                float _843 = fma(_647, _681, _841);
                float _845 = fma(_651, _739, _827);
                float _847 = _647 * _685;
                float _849 = -_833;
                float _851 = fma(_645, _681, _849);
                float _853 = fma(_651, _723, _817);
                float _855 = _771 * _813;
                float _857 = -_835;
                float _859 = fma(_647, _705, _857);
                float _861 = _837 * _813;
                float _863 = -_839;
                float _865 = fma(_645, _709, _863);
                float _867 = _845 * _813;
                float _869 = -_847;
                float _871 = fma(_645, _663, _869);
                float _873 = _853 * _813;
                float _875 = _613 * _855;
                float _877 = fma(_651, _727, _859);
                float _879 = _783 * _813;
                float _881 = _615 * _861;
                float _883 = fma(_651, _731, _831);
                float _885 = fma(_651, _775, _865);
                float _887 = _793 * _813;
                float _889 = _615 * _867;
                float _891 = -_875;
                float _893 = fma(_615, _873, _891);
                float _895 = -_881;
                float _897 = fma(_613, _879, _895);
                float _899 = _877 * _813;
                float _901 = -_889;
                float _903 = fma(_613, _887, _901);
                float _905 = _883 * _813;
                float _907 = _885 * _813;
                float _909 = fma(_651, _745, _843);
                float _911 = fma(_617, _899, _897);
                float _913 = fma(_651, _749, _851);
                float _915 = fma(_651, _755, _871);
                float _917 = -_905;
                float _919 = fma(_617, _917, _893);
                float _921 = fma(_617, _907, _903);
                float _923 = -_909;
                float _925 = fma(_923, _813, _911);
                float _927 = fma(_913, _813, _919);
                float _929 = -_915;
                float _931 = fma(_929, _813, _921);
                _337 = _931;
                _339 = _925;
                _341 = _927;
                _933 = true;
            }
            else
            {
                int _935 = as_type<int>(_181) & 1024;
                bool _937 = _935 != 0;
                bool _939 = !_937;
                if (!_939)
                {
                    float _941 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                    uint _943 = uint(int(uint(_149) >> uint(2)));
                    float _945 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_943)]);
                    int _947 = _149 + 4;
                    uint _949 = uint(int(uint(_947) >> uint(2)));
                    float _951 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_949)]);
                    int _953 = _149 + 8;
                    uint _955 = uint(int(uint(_953) >> uint(2)));
                    float _957 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_955)]);
                    uint _959 = uint(int(uint(_149) >> uint(2)));
                    float _961 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_959)]);
                    int _963 = _149 + 4;
                    uint _965 = uint(int(uint(_963) >> uint(2)));
                    float _967 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_965)]);
                    int _969 = _149 + 8;
                    uint _971 = uint(int(uint(_969) >> uint(2)));
                    float _973 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_971)]);
                    uint _975 = uint(int(uint(_149) >> uint(2)));
                    float _977 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_975)]);
                    int _979 = _149 + 4;
                    uint _981 = uint(int(uint(_979) >> uint(2)));
                    float _983 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_981)]);
                    int _985 = _149 + 8;
                    uint _987 = uint(int(uint(_985) >> uint(2)));
                    float _989 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_987)]);
                    float _991 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                    float _993 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                    float _995 = _957 * _961;
                    float _997 = _957 * _967;
                    float _999 = -_995;
                    float _1001 = fma(_945, _973, _999);
                    float _1003 = _951 * _961;
                    float _1005 = -_997;
                    float _1007 = fma(_951, _973, _1005);
                    float _1009 = _983 * _1001;
                    float _1011 = -_1003;
                    float _1013 = fma(_945, _967, _1011);
                    float _1015 = -_1009;
                    float _1017 = fma(_977, _1007, _1015);
                    float _1019 = _941 * _973;
                    float _1021 = _941 * _967;
                    float _1023 = _941 * _961;
                    float _1025 = fma(_989, _1013, _1017);
                    float _1027 = 1.0 / _1025;
                    float _1029 = _989 * _961;
                    float _1031 = _983 * _973;
                    float _1033 = -_1021;
                    float _1035 = fma(_991, _951, _1033);
                    float _1037 = -_945;
                    float _1039 = fma(_1037, _973, _995);
                    float _1041 = _977 * _967;
                    float _1043 = -_1019;
                    float _1045 = fma(_991, _957, _1043);
                    float _1047 = -_1023;
                    float _1049 = fma(_991, _945, _1047);
                    float _1051 = _977 * _957;
                    float _1053 = -_1029;
                    float _1055 = fma(_977, _973, _1053);
                    float _1057 = -_1031;
                    float _1059 = fma(_989, _967, _1057);
                    float _1061 = _983 * _945;
                    float _1063 = -_1041;
                    float _1065 = fma(_983, _961, _1063);
                    float _1067 = -_1051;
                    float _1069 = fma(_989, _945, _1067);
                    float _1071 = _989 * _951;
                    float _1073 = _989 * _1035;
                    float _1075 = _1059 * _1027;
                    float _1077 = _1055 * _1027;
                    float _1079 = -_1061;
                    float _1081 = fma(_977, _951, _1079);
                    float _1083 = _1065 * _1027;
                    float _1085 = _989 * _1049;
                    float _1087 = -_1071;
                    float _1089 = fma(_983, _957, _1087);
                    float _1091 = _983 * _1049;
                    float _1093 = -_1073;
                    float _1095 = fma(_983, _1045, _1093);
                    float _1097 = _1075 * _615;
                    float _1099 = _1077 * _615;
                    float _1101 = _1083 * _615;
                    float _1103 = _1039 * _1027;
                    float _1105 = _1007 * _1027;
                    float _1107 = _1013 * _1027;
                    float _1109 = -_1085;
                    float _1111 = fma(_977, _1045, _1109);
                    float _1113 = fma(_1103, _613, _1099);
                    float _1115 = fma(_613, _1105, _1097);
                    float _1117 = fma(_613, _1107, _1101);
                    float _1119 = _1069 * _1027;
                    float _1121 = _1089 * _1027;
                    float _1123 = _1081 * _1027;
                    float _1125 = -_1091;
                    float _1127 = fma(_977, _1035, _1125);
                    float _1129 = fma(_1119, _617, _1113);
                    float _1131 = fma(_1121, _617, _1115);
                    float _1133 = fma(_993, _1001, _1111);
                    float _1135 = fma(_1123, _617, _1117);
                    float _1137 = fma(_993, _1007, _1095);
                    float _1139 = fma(_993, _1013, _1127);
                    float _1141 = fma(_1133, _1027, _1129);
                    float _1143 = -_1137;
                    float _1145 = fma(_1143, _1027, _1131);
                    float _1147 = -_1139;
                    float _1149 = fma(_1147, _1027, _1135);
                    _337 = _1149;
                    _339 = _1145;
                    _341 = _1141;
                    _933 = true;
                }
                else
                {
                    int _1151 = as_type<int>(_181) & 2048;
                    bool _1153 = _1151 != 0;
                    bool _1155 = !_1153;
                    if (!_1155)
                    {
                        uint _1157 = uint(int(uint(_149) >> uint(2)));
                        float _1159 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1157)]);
                        int _1161 = _149 + 4;
                        uint _1163 = uint(int(uint(_1161) >> uint(2)));
                        float _1165 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1163)]);
                        int _1167 = _149 + 8;
                        uint _1169 = uint(int(uint(_1167) >> uint(2)));
                        float _1171 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1169)]);
                        int _1173 = _149 + 12;
                        uint _1175 = uint(int(uint(_1173) >> uint(2)));
                        float _1177 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1175)]);
                        uint _1179 = uint(int(uint(_149) >> uint(2)));
                        float _1181 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1179)]);
                        int _1183 = _149 + 4;
                        uint _1185 = uint(int(uint(_1183) >> uint(2)));
                        float _1187 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1185)]);
                        int _1189 = _149 + 8;
                        uint _1191 = uint(int(uint(_1189) >> uint(2)));
                        float _1193 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1191)]);
                        int _1195 = _149 + 12;
                        uint _1197 = uint(int(uint(_1195) >> uint(2)));
                        float _1199 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1197)]);
                        uint _1201 = uint(int(uint(_149) >> uint(2)));
                        float _1203 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1201)]);
                        int _1205 = _149 + 4;
                        uint _1207 = uint(int(uint(_1205) >> uint(2)));
                        float _1209 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1207)]);
                        int _1211 = _149 + 8;
                        uint _1213 = uint(int(uint(_1211) >> uint(2)));
                        float _1215 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1213)]);
                        int _1217 = _149 + 12;
                        uint _1219 = uint(int(uint(_1217) >> uint(2)));
                        float _1221 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1219)]);
                        float _1223 = _1171 * _1181;
                        float _1225 = _1171 * _1187;
                        float _1227 = _1165 * _1181;
                        float _1229 = _1177 * _1193;
                        float _1231 = -_1223;
                        float _1233 = fma(_1159, _1193, _1231);
                        float _1235 = -_1225;
                        float _1237 = fma(_1165, _1193, _1235);
                        float _1239 = -_1227;
                        float _1241 = fma(_1159, _1187, _1239);
                        float _1243 = _1209 * _1193;
                        float _1245 = _1209 * _1233;
                        float _1247 = _1177 * _1187;
                        float _1249 = _1177 * _1181;
                        float _1251 = -_1243;
                        float _1253 = fma(_1215, _1187, _1251);
                        float _1255 = -_1245;
                        float _1257 = fma(_1203, _1237, _1255);
                        float _1259 = _1203 * _1187;
                        float _1261 = _1215 * _1181;
                        float _1263 = -_1229;
                        float _1265 = fma(_1171, _1199, _1263);
                        float _1267 = fma(_1215, _1241, _1257);
                        float _1269 = -_1247;
                        float _1271 = fma(_1165, _1199, _1269);
                        float _1273 = -_1249;
                        float _1275 = fma(_1159, _1199, _1273);
                        float _1277 = _1203 * _1171;
                        float _1279 = -_1159;
                        float _1281 = fma(_1279, _1193, _1223);
                        float _1283 = -_1261;
                        float _1285 = fma(_1203, _1193, _1283);
                        float _1287 = 1.0 / _1267;
                        float _1289 = -_1259;
                        float _1291 = fma(_1209, _1181, _1289);
                        float _1293 = -_1277;
                        float _1295 = fma(_1215, _1159, _1293);
                        float _1297 = _1209 * _1159;
                        float _1299 = _1215 * _1165;
                        float _1301 = _1215 * _1271;
                        float _1303 = _1215 * _1275;
                        float _1305 = -_1297;
                        float _1307 = fma(_1203, _1165, _1305);
                        float _1309 = -_1299;
                        float _1311 = fma(_1209, _1171, _1309);
                        float _1313 = _1209 * _1275;
                        float _1315 = -_1301;
                        float _1317 = fma(_1209, _1265, _1315);
                        float _1319 = -_1303;
                        float _1321 = fma(_1203, _1265, _1319);
                        float _1323 = -_1313;
                        float _1325 = fma(_1203, _1271, _1323);
                        float _1327 = fma(_1221, _1237, _1317);
                        float _1329 = fma(_1221, _1233, _1321);
                        float _1331 = _1253 * _1287;
                        float _1333 = _1285 * _1287;
                        float _1335 = _1291 * _1287;
                        float _1337 = _1281 * _1287;
                        float _1339 = _1331 * _615;
                        float _1341 = _1333 * _615;
                        float _1343 = _1335 * _615;
                        float _1345 = _1237 * _1287;
                        float _1347 = _1241 * _1287;
                        float _1349 = fma(_1337, _613, _1341);
                        float _1351 = _1295 * _1287;
                        float _1353 = fma(_613, _1345, _1339);
                        float _1355 = fma(_613, _1347, _1343);
                        float _1357 = _1311 * _1287;
                        float _1359 = _1307 * _1287;
                        float _1361 = fma(_1221, _1241, _1325);
                        float _1363 = fma(_1351, _617, _1349);
                        float _1365 = fma(_1357, _617, _1353);
                        float _1367 = fma(_1359, _617, _1355);
                        float _1369 = fma(_1329, _1287, _1363);
                        float _1371 = -_1327;
                        float _1373 = fma(_1371, _1287, _1365);
                        float _1375 = -_1361;
                        float _1377 = fma(_1375, _1287, _1367);
                        _337 = _1377;
                        _339 = _1373;
                        _341 = _1369;
                    }
                }
            }
        }
        _933 = false;
        float _1379 = _337;
        float _1381 = _339;
        float _1383 = _341;
        float _1385 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[43]);
        float _1387 = _605 + _1379;
        float _1389 = _607 + _1381;
        float _1391 = _609 + _1383;
        float _1393 = -_273;
        float _1395 = _1387 + _1393;
        float _1397 = -_275;
        float _1399 = _1389 + _1397;
        float _1401 = -_277;
        float _1403 = _1391 + _1401;
        float _1405 = _179 * _1385;
        float _1407 = _143 * _1405;
        float _1409 = _1395 * _1405;
        float _1411 = _1399 * _1407;
        float _1413 = _1403 * _1407;
        float _1415 = _143 * _1409;
        _287 = _1411;
        _297 = _1413;
        _299 = _1415;
    }
    float _1417 = _287;
    float _1419 = _297;
    float _1421 = _299;
    uint _1423 = uint(int(uint(_157) >> uint(2)));
    float _1425 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1423)]);
    float _1427 = _1417 + _275;
    float _1429 = _1419 + _277;
    float _1431 = _1421 + _273;
    float _1433 = -_193;
    float _1435 = _1433 + _1427;
    float _1437 = -_199;
    float _1439 = _1437 + _1429;
    int _1441 = _149 + 4;
    float _1443 = -_205;
    float _1445 = _1443 + _1431;
    int _1447 = _149 + 8;
    float _1449 = _1439 * _1439;
    float _1451 = fma(_1435, _1435, _1449);
    float _1453 = fma(_1445, _1445, _1451);
    float _1455 = sqrt(_1453);
    uint _1457 = uint(int(uint(_157) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1457)] = as_type<uint>(_1425);
    uint _1459 = uint(int(uint(_149) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1459)] = as_type<uint>(_1427);
    uint _1461 = uint(int(uint(_1441) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1461)] = as_type<uint>(_1429);
    uint _1463 = uint(int(uint(_1447) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1463)] = as_type<uint>(_1431);
    uint _1465 = uint(int(uint(_149) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1465)] = as_type<uint>(_261);
    uint _1467 = uint(int(uint(_1441) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1467)] = as_type<uint>(_263);
    uint _1469 = uint(int(uint(_1447) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1469)] = as_type<uint>(_265);
    uint _1471 = uint(int(uint(_149) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1471)] = as_type<uint>(_1435);
    uint _1473 = uint(int(uint(_1441) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1473)] = as_type<uint>(_1439);
    uint _1475 = uint(int(uint(_1447) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1475)] = as_type<uint>(_1445);
    float _1477 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1479 = _263 * _263;
    bool _1481 = _1455 >= 9.9999999747524270787835121154785e-07;
    bool _1483 = isnan(_1455);
    bool _1485 = _1481 || _1483;
    bool _1487 = isnan(9.9999999747524270787835121154785e-07);
    bool _1489 = _1485 || _1487;
    float _1491 = fma(_261, _261, _1479);
    float _1493 = fma(_265, _265, _1491);
    float _1495 = sqrt(_1493);
    if (!_1489)
    {
        bool _1497 = _183 != _189;
        bool _1499 = isnan(_183);
        bool _1501 = _1497 || _1499;
        bool _1503 = isnan(_189);
        bool _1505 = _1501 || _1503;
        _1507 = _1505;
        if (!_1507)
        {
            float _1509 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
            bool _1511 = _1509 > 0.0;
            bool _1513 = !_1511;
            if (!_1513)
            {
                float _1515 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
                float _1517 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
                float _1519 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
                float _1521 = _1517 * _1517;
                float _1523 = fma(_1515, _1515, _1521);
                float _1525 = fma(_1519, _1519, _1523);
                float _1527 = rsqrt(_1525);
                float _1529 = _1527 * 9.9999999747524270787835121154785e-07;
                float _1531 = _1515 * _1529;
                float _1533 = _1517 * _1529;
                float _1535 = _1519 * _1529;
                _313 = as_type<int>(_1531);
                _315 = as_type<int>(_1533);
                _317 = as_type<int>(_1535);
                _1507 = true;
            }
            else
            {
                bool _1537 = _1495 >= 9.9999999747524270787835121154785e-07;
                bool _1539 = isnan(_1495);
                bool _1541 = _1537 || _1539;
                bool _1543 = isnan(9.9999999747524270787835121154785e-07);
                bool _1545 = _1541 || _1543;
                if (!_1545)
                {
                    float _1547 = _1429 * _1429;
                    float _1549 = fma(_1427, _1427, _1547);
                    float _1551 = fma(_1431, _1431, _1549);
                    float _1553 = sqrt(_1551);
                    bool _1555 = _1553 >= 9.9999999747524270787835121154785e-07;
                    bool _1557 = isnan(_1553);
                    bool _1559 = _1555 || _1557;
                    bool _1561 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1563 = _1559 || _1561;
                    float _1565 = _1553;
                    if (_1563)
                    {
                        float _1567 = rsqrt(_1551);
                        _1565 = _1567;
                    }
                    float _1569 = _1565;
                    if (!_1563)
                    {
                        _301 = 0;
                    }
                    int _1571 = _301;
                    int _1573 = _1571;
                    if (!_1563)
                    {
                        _303 = 897988541;
                    }
                    int _1575 = _303;
                    int _1577 = _1575;
                    if (!_1563)
                    {
                        _305 = 0;
                    }
                    int _1579 = _305;
                    float _1581 = _1569;
                    int _1583 = _1579;
                    if (_1563)
                    {
                        float _1585 = _1569 * 9.9999999747524270787835121154785e-07;
                        _1581 = _1585;
                    }
                    float _1587 = _1581;
                    if (_1563)
                    {
                        float _1589 = _1427 * _1587;
                        _1573 = as_type<int>(_1589);
                    }
                    int _1591 = _1573;
                    _313 = _1591;
                    if (_1563)
                    {
                        float _1593 = _1429 * _1587;
                        _1577 = as_type<int>(_1593);
                    }
                    int _1595 = _1577;
                    _315 = _1595;
                    if (_1563)
                    {
                        float _1597 = _1431 * _1587;
                        _1583 = as_type<int>(_1597);
                    }
                    int _1599 = _1583;
                    _317 = _1599;
                    _1507 = true;
                }
                else
                {
                    float _1601 = rsqrt(_1493);
                    float _1603 = _1601 * 9.9999999747524270787835121154785e-07;
                    float _1605 = _261 * _1603;
                    float _1607 = _263 * _1603;
                    float _1609 = _265 * _1603;
                    _313 = as_type<int>(_1605);
                    _315 = as_type<int>(_1607);
                    _317 = as_type<int>(_1609);
                    _1507 = true;
                }
            }
        }
    }
    else
    {
        float _1611 = _1495 * _1477;
        bool _1613 = _1611 >= 0.001000000047497451305389404296875;
        bool _1615 = isnan(_1611);
        bool _1617 = _1613 || _1615;
        bool _1619 = isnan(0.001000000047497451305389404296875);
        bool _1621 = _1617 || _1619;
        bool _1623 = _1611 > 0.0;
        bool _1625 = !_1621;
        bool _1627 = _1623 && _1625;
        bool _1629 = _1455 < 0.001000000047497451305389404296875;
        bool _1631 = _1629 && _1627;
        if (!_1631)
        {
            _307 = as_type<int>(_1435);
        }
        int _1633 = _307;
        int _1635 = _1633;
        if (_1631)
        {
            float _1637 = _261 * _1477;
            _1635 = as_type<int>(_1637);
        }
        int _1639 = _1635;
        _313 = _1639;
        if (!_1631)
        {
            _309 = as_type<int>(_1439);
        }
        int _1641 = _309;
        int _1643 = _1641;
        if (_1631)
        {
            float _1645 = _263 * _1477;
            _1643 = as_type<int>(_1645);
        }
        int _1647 = _1643;
        _315 = _1647;
        if (!_1631)
        {
            _311 = as_type<int>(_1445);
        }
        int _1649 = _311;
        _317 = _1649;
        if (_1631)
        {
            float _1651 = _265 * _1477;
            _317 = as_type<int>(_1651);
        }
    }
    _1507 = false;
    int _1653 = _313;
    int _1655 = _315;
    int _1657 = _317;
    uint _1659 = uint(int(uint(_149) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1659)] = uint(_1653);
    uint _1661 = uint(int(uint(_1441) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1661)] = uint(_1655);
    uint _1663 = uint(int(uint(_1447) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1663)] = uint(_1657);
}

