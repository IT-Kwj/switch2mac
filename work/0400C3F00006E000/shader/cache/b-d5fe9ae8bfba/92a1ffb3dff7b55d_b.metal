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
    device _21* cp_s10 [[id(10)]];
    device _21* cp_s11 [[id(11)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _1449 = false;
    bool _671 = false;
    float _59 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _61 = as_type<float>(gl_LocalInvocationID.x);
    float _63 = as_type<float>(gl_WorkGroupID.x);
    int _66 = as_type<int>(_63) << 5;
    int _68 = _66 + as_type<int>(_61);
    float _70 = trunc(_59);
    int _72 = int(_70);
    bool _76 = _68 >= _72;
    int _78 = 0;
    if (_76)
    {
        _78 = 0;
    }
    int _80 = _78;
    int _82 = _80;
    int _84 = _80;
    if (!_76)
    {
        int _86 = _68 << 4;
        int _88 = _86 + 12;
        uint _91 = uint(int(uint(_88) >> uint(2)));
        float _93 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_91)]);
        float _95 = trunc(_93);
        int _97 = int(_95);
        bool _99 = _97 >= 1;
        int _101 = _99 ? (-1) : 0;
        if (!_99)
        {
            _82 = 0;
        }
        int _103 = _82;
        bool _105 = !_99;
        _84 = _103;
        if (!_105)
        {
            float _107 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _109 = uint(int(uint(_88) >> uint(2)));
            float _111 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_109)]);
            float _113 = float(_97);
            float _115 = -_111;
            float _117 = _107 + _115;
            bool _119 = _117 > _113;
            int _121 = as_type<int>(_107);
            if (!_119)
            {
                bool _123 = _107 >= _111;
                bool _125 = isnan(_107);
                bool _127 = _123 || _125;
                bool _129 = isnan(_111);
                bool _131 = _127 || _129;
                _101 = _131 ? (-1) : 0;
            }
            int _133 = _101;
            if (_119)
            {
                _121 = 0;
            }
            int _135 = _121;
            _84 = _135;
            if (!_119)
            {
                int _137 = ~_133;
                int _139 = (_137 != 0) ? 0 : 1;
                _84 = _139;
            }
        }
    }
    int _141 = _84;
    int _143 = _141 & 1;
    bool _145 = _143 != 0;
    if (!_145)
    {
        return;
    }
    float _147 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _149 = _68 << 4;
    uint _151 = uint(int(uint(_149) >> uint(2)));
    float _153 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_151)]);
    int _155 = _149 + 4;
    uint _157 = uint(int(uint(_155) >> uint(2)));
    float _159 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_157)]);
    int _161 = _149 + 8;
    uint _163 = uint(int(uint(_161) >> uint(2)));
    float _165 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_163)]);
    int _167 = as_type<int>(_147) & 512;
    bool _169 = _167 != 0;
    int _171 = _149 + 12;
    uint _173 = uint(int(uint(_149) >> uint(2)));
    float _175 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_173)]);
    int _177 = _149 + 4;
    uint _179 = uint(int(uint(_177) >> uint(2)));
    float _181 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_179)]);
    int _183 = _149 + 8;
    uint _185 = uint(int(uint(_183) >> uint(2)));
    float _187 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_185)]);
    uint _189 = uint(int(uint(_149) >> uint(2)));
    float _191 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_189)]);
    int _193 = _149 + 4;
    uint _195 = uint(int(uint(_193) >> uint(2)));
    float _197 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_195)]);
    int _199 = _149 + 8;
    uint _201 = uint(int(uint(_199) >> uint(2)));
    float _203 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_201)]);
    float _205 = 0.0;
    float _207 = 0.0;
    float _209 = 0.0;
    bool _211 = _169;
    if (_169)
    {
        float _213 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _215 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _217 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _205 = _213;
        _207 = _215;
        _209 = _217;
    }
    float _219 = _205;
    float _221 = _207;
    float _223 = _209;
    uint _225 = uint(int(uint(_149) >> uint(2)));
    float _227 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_225)]);
    uint _229 = uint(int(uint(_171) >> uint(2)));
    float _231 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_229)]);
    uint _233 = uint(int(uint(_171) >> uint(2)));
    float _235 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_233)]);
    float _237 = _219;
    float _239 = _221;
    float _241 = _223;
    int _243 = as_type<int>(_191);
    int _245 = as_type<int>(_197);
    int _247 = as_type<int>(_203);
    int _249 = as_type<int>(_191);
    int _251 = as_type<int>(_197);
    int _253 = as_type<int>(_203);
    int _255 = as_type<int>(_191);
    int _257 = as_type<int>(_197);
    int _259 = as_type<int>(_203);
    if (!_169)
    {
        int _261 = _149 + 4;
        int _263 = _149 + 8;
        uint _265 = uint(int(uint(_149) >> uint(2)));
        float _267 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_265)]);
        uint _269 = uint(int(uint(_261) >> uint(2)));
        float _271 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_269)]);
        uint _273 = uint(int(uint(_263) >> uint(2)));
        float _275 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_273)]);
        uint _277 = uint(int(uint(_261) >> uint(2)));
        float _279 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_277)]);
        uint _281 = uint(int(uint(_149) >> uint(2)));
        float _283 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_281)]);
        uint _285 = uint(int(uint(_263) >> uint(2)));
        float _287 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_285)]);
        uint _289 = uint(int(uint(_261) >> uint(2)));
        float _291 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_289)]);
        uint _293 = uint(int(uint(_149) >> uint(2)));
        float _295 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_293)]);
        uint _297 = uint(int(uint(_263) >> uint(2)));
        float _299 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_297)]);
        float _301 = _267 * _267;
        float _303 = _271 * _271;
        float _305 = _275 * _275;
        float _307 = fma(_279, _279, _303);
        float _309 = fma(_283, _283, _301);
        float _311 = fma(_287, _287, _305);
        float _313 = fma(_291, _291, _307);
        float _315 = fma(_295, _295, _309);
        float _317 = sqrt(_313);
        float _319 = fma(_299, _299, _311);
        float _321 = sqrt(_315);
        float _323 = sqrt(_319);
        bool _325 = _317 > 0.0;
        bool _327 = _321 > 0.0;
        bool _329 = _323 > 0.0;
        float _331 = _321;
        float _333 = _279;
        float _335 = _323;
        float _337 = _271;
        if (_325)
        {
            float _339 = rsqrt(_313);
            _331 = _339;
        }
        float _341 = _331;
        float _343 = as_type<float>(_263);
        if (_327)
        {
            float _345 = rsqrt(_315);
            _343 = _345;
        }
        float _347 = _343;
        float _349 = _317;
        if (_329)
        {
            float _351 = rsqrt(_319);
            _349 = _351;
        }
        float _353 = _349;
        if (!_325)
        {
            _333 = 0.0;
        }
        float _355 = _333;
        float _357 = _355;
        if (_325)
        {
            float _359 = _271 * _341;
            _357 = _359;
        }
        float _361 = _357;
        _239 = _361;
        if (!_327)
        {
            _335 = 0.0;
        }
        float _363 = _335;
        float _365 = _363;
        if (!_329)
        {
            _337 = 0.0;
        }
        float _367 = _337;
        _241 = _367;
        if (_327)
        {
            float _369 = _267 * _347;
            _365 = _369;
        }
        float _371 = _365;
        _237 = _371;
        if (_329)
        {
            float _373 = _275 * _353;
            _241 = _373;
        }
    }
    float _375 = _237;
    float _377 = _239;
    float _379 = _241;
    float _381 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _383 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _385 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _387 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _389 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _391 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _393 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _395 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _397 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _399 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _401 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _403 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _405 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _407 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    float _409 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[131]);
    uint _411 = uint(int(uint(_171) >> uint(2)));
    float _413 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_411)]);
    bool _415 = _383 > 0.0;
    float _417 = abs(_381);
    float _419 = log2(_417);
    bool _421 = _385 > 0.0;
    float _423 = 0.0;
    float _425 = _391;
    float _427 = _395;
    float _429 = _397;
    float _431 = _401;
    float _433 = _387;
    float _435 = _383;
    float _437 = _403;
    float _439 = _405;
    float _441 = _407;
    float _443 = _409;
    float _445 = _377;
    float _447 = _375;
    float _449 = _379;
    float _451 = _377;
    float _453 = _375;
    if (_415)
    {
        float _455 = 1.0 / _383;
        _423 = _455;
    }
    float _457 = _423;
    float _459 = -_235;
    float _461 = _389 + _459;
    float _463 = _387 * _419;
    float _465 = _391 * _385;
    float _467 = exp2(_463);
    float _469 = _461;
    float _471 = _457;
    float _473 = _465;
    if (_415)
    {
        float _475 = _461 * _457;
        _469 = _475;
    }
    float _477 = _469;
    if (_421)
    {
        float _479 = -_465;
        float _481 = fma(_227, _479, _391);
        _425 = _481;
    }
    float _483 = _425;
    float _485 = _387 * _393;
    float _487 = _483;
    if (_415)
    {
        float _489 = precise::min(_477, 1.0);
        _471 = _489;
    }
    float _491 = _471;
    float _493 = _395 * _485;
    float _495 = _231 * _387;
    float _497 = _491;
    if (_415)
    {
        float _499 = _491 * _483;
        _487 = _499;
    }
    float _501 = _487;
    float _503 = _397 * _485;
    float _505 = _399 * _485;
    float _507 = _387 * _501;
    float _509 = fma(_175, _467, _493);
    float _511 = fma(_175, _495, _153);
    float _513 = fma(_181, _467, _503);
    float _515 = fma(_181, _495, _159);
    float _517 = fma(_187, _495, _165);
    float _519 = fma(_187, _467, _505);
    float _521 = _403 * _507;
    float _523 = _405 * _507;
    float _525 = _407 * _507;
    bool _527 = !_169;
    float _529 = _503;
    float _531 = _505;
    float _533 = _517;
    float _535 = _511;
    float _537 = _513;
    float _539 = _509;
    float _541 = _519;
    float _663;
    float _665;
    float _667;
    float _669;
    if (!_527)
    {
        float _543 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _545 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _547 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _549 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _551 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _553 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _555 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _557 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _559 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _561 = _547 * _549;
        float _563 = _547 * _551;
        float _565 = _545 * _549;
        float _567 = -_561;
        float _569 = fma(_543, _553, _567);
        float _571 = -_563;
        float _573 = fma(_545, _553, _571);
        float _575 = -_565;
        float _577 = fma(_543, _551, _575);
        float _579 = _557 * _543;
        float _581 = _557 * _569;
        float _583 = _559 * _545;
        float _585 = _555 * _551;
        float _587 = -_579;
        float _589 = fma(_555, _545, _587);
        float _591 = -_581;
        float _593 = fma(_555, _573, _591);
        float _595 = _557 * _553;
        float _597 = _559 * _549;
        float _599 = _555 * _547;
        float _601 = fma(_559, _577, _593);
        float _603 = -_595;
        float _605 = fma(_559, _551, _603);
        float _607 = -_597;
        float _609 = fma(_555, _553, _607);
        float _611 = -_585;
        float _613 = fma(_557, _549, _611);
        float _615 = 1.0 / _601;
        float _617 = -_599;
        float _619 = fma(_559, _543, _617);
        float _621 = -_543;
        float _623 = fma(_621, _553, _561);
        float _625 = -_583;
        float _627 = fma(_557, _547, _625);
        float _629 = _605 * _615;
        float _631 = _609 * _615;
        float _633 = _613 * _615;
        float _635 = _623 * _615;
        float _637 = _523 * _629;
        float _639 = _521 * _615;
        float _641 = _523 * _631;
        float _643 = _523 * _633;
        float _645 = _627 * _615;
        float _647 = fma(_573, _639, _637);
        float _649 = _619 * _615;
        float _651 = _589 * _615;
        float _653 = fma(_521, _635, _641);
        float _655 = fma(_577, _639, _643);
        float _657 = fma(_525, _645, _647);
        float _659 = fma(_525, _649, _653);
        float _661 = fma(_525, _651, _655);
        _663 = _651;
        _427 = _555;
        _429 = _557;
        _531 = _559;
        _431 = _649;
        _433 = _549;
        _435 = _551;
        _473 = _553;
        _437 = _653;
        _439 = _639;
        _441 = _637;
        _443 = _561;
        _665 = _659;
        _667 = _657;
        _669 = _661;
        _671 = true;
    }
    else
    {
        int _673 = as_type<int>(_147) & 1024;
        bool _675 = _673 != 0;
        if (_675)
        {
            _211 = true;
        }
        bool _677 = _211;
        bool _679 = _677;
        if (!_675)
        {
            int _681 = as_type<int>(_147) & 2048;
            bool _683 = _681 != 0;
            _679 = _683;
        }
        bool _685 = _679;
        float _687 = 0.0;
        if (!_685)
        {
            _687 = _521;
        }
        float _689 = _687;
        _667 = _689;
        if (!_685)
        {
            _529 = _523;
        }
        float _691 = _529;
        _665 = _691;
        if (!_685)
        {
            _497 = _525;
        }
        float _693 = _497;
        bool _695 = !_685;
        _663 = 0.0;
        _669 = _693;
        if (!_695)
        {
            uint _697 = uint(int(uint(_149) >> uint(2)));
            float _699 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_697)]);
            int _701 = _149 + 4;
            uint _703 = uint(int(uint(_701) >> uint(2)));
            float _705 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_703)]);
            int _707 = _149 + 8;
            uint _709 = uint(int(uint(_707) >> uint(2)));
            float _711 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_709)]);
            uint _713 = uint(int(uint(_149) >> uint(2)));
            float _715 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_713)]);
            int _717 = _149 + 4;
            uint _719 = uint(int(uint(_717) >> uint(2)));
            float _721 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_719)]);
            int _723 = _149 + 8;
            uint _725 = uint(int(uint(_723) >> uint(2)));
            float _727 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_725)]);
            uint _729 = uint(int(uint(_149) >> uint(2)));
            float _731 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_729)]);
            int _733 = _149 + 4;
            uint _735 = uint(int(uint(_733) >> uint(2)));
            float _737 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_735)]);
            int _739 = _149 + 8;
            uint _741 = uint(int(uint(_739) >> uint(2)));
            float _743 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_741)]);
            float _745 = _711 * _715;
            float _747 = _711 * _721;
            float _749 = _705 * _715;
            float _751 = -_745;
            float _753 = fma(_699, _727, _751);
            float _755 = -_747;
            float _757 = fma(_705, _727, _755);
            float _759 = -_749;
            float _761 = fma(_699, _721, _759);
            float _763 = _737 * _699;
            float _765 = _737 * _753;
            float _767 = _743 * _705;
            float _769 = _731 * _721;
            float _771 = -_763;
            float _773 = fma(_731, _705, _771);
            float _775 = -_765;
            float _777 = fma(_731, _757, _775);
            float _779 = _737 * _727;
            float _781 = _743 * _715;
            float _783 = _731 * _711;
            float _785 = fma(_743, _761, _777);
            float _787 = -_779;
            float _789 = fma(_743, _721, _787);
            float _791 = -_781;
            float _793 = fma(_731, _727, _791);
            float _795 = -_769;
            float _797 = fma(_737, _715, _795);
            float _799 = 1.0 / _785;
            float _801 = -_783;
            float _803 = fma(_743, _699, _801);
            float _805 = -_699;
            float _807 = fma(_805, _727, _745);
            float _809 = -_767;
            float _811 = fma(_737, _711, _809);
            float _813 = _789 * _799;
            float _815 = _793 * _799;
            float _817 = _797 * _799;
            float _819 = _807 * _799;
            float _821 = _523 * _813;
            float _823 = _521 * _799;
            float _825 = _523 * _815;
            float _827 = _523 * _817;
            float _829 = _811 * _799;
            float _831 = fma(_757, _823, _821);
            float _833 = _803 * _799;
            float _835 = _773 * _799;
            float _837 = fma(_521, _819, _825);
            float _839 = fma(_761, _823, _827);
            float _841 = fma(_525, _829, _831);
            float _843 = fma(_525, _833, _837);
            float _845 = fma(_525, _835, _839);
            _663 = _835;
            _427 = _731;
            _429 = _737;
            _531 = _743;
            _431 = _833;
            _433 = _715;
            _435 = _721;
            _473 = _727;
            _437 = _837;
            _439 = _823;
            _441 = _821;
            _443 = _745;
            _665 = _843;
            _667 = _841;
            _669 = _845;
        }
    }
    _671 = false;
    float _847 = _663;
    float _849 = _427;
    float _851 = _429;
    float _853 = _531;
    float _855 = _431;
    float _857 = _433;
    float _859 = _435;
    float _861 = _473;
    float _863 = _437;
    float _865 = _439;
    float _867 = _441;
    float _869 = _443;
    float _871 = _665;
    float _873 = _667;
    float _875 = _669;
    uint _877 = uint(int(uint(_171) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_877)] = as_type<uint>(_413);
    float _879 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[52]);
    float _881 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    float _883 = trunc(_879);
    int _885 = int(_883);
    bool _887 = _885 != 0;
    float _889 = _847;
    float _891 = _871;
    float _893 = _879;
    if (!_887)
    {
        float _895 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[55]);
        _889 = _895;
    }
    float _897 = _889;
    int _899 = as_type<int>(_881) & 512;
    bool _901 = _899 != 0;
    int _903 = as_type<int>(_881) & 1024;
    bool _905 = _903 != 0;
    int _907 = as_type<int>(_881) & 2048;
    bool _909 = _907 != 0;
    bool _911 = _885 != 1;
    float _913 = _849;
    float _915 = _851;
    float _917 = _853;
    float _919 = _855;
    if (_901)
    {
        float _921 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _923 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _925 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _927 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _913 = _921;
        _915 = _923;
        _917 = _925;
        _919 = _927;
    }
    float _929 = _913;
    float _931 = _915;
    float _933 = _917;
    float _935 = _919;
    float _937 = _857;
    float _939 = _859;
    float _941 = _861;
    if (_905)
    {
        uint _943 = uint(int(uint(_149) >> uint(2)));
        float _945 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_943)]);
        int _947 = _149 + 4;
        uint _949 = uint(int(uint(_947) >> uint(2)));
        float _951 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_949)]);
        int _953 = _149 + 8;
        uint _955 = uint(int(uint(_953) >> uint(2)));
        float _957 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_955)]);
        _937 = _945;
        _939 = _951;
        _941 = _957;
    }
    float _959 = _937;
    float _961 = _939;
    float _963 = _941;
    float _965 = _863;
    float _967 = _865;
    float _969 = _867;
    float _971 = _869;
    if (_909)
    {
        uint _973 = uint(int(uint(_149) >> uint(2)));
        float _975 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_973)]);
        int _977 = _149 + 4;
        uint _979 = uint(int(uint(_977) >> uint(2)));
        float _981 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_979)]);
        int _983 = _149 + 8;
        uint _985 = uint(int(uint(_983) >> uint(2)));
        float _987 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_985)]);
        int _989 = _149 + 12;
        uint _991 = uint(int(uint(_989) >> uint(2)));
        float _993 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_991)]);
        _965 = _975;
        _967 = _981;
        _969 = _987;
        _971 = _993;
    }
    float _995 = _965;
    float _997 = _967;
    float _999 = _969;
    float _1001 = _971;
    float _1003 = _515 + _871;
    float _1005 = _881;
    if (_905)
    {
        float _1007 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1005 = _1007;
    }
    float _1009 = _1005;
    float _1011 = _525;
    if (!_911)
    {
        float _1013 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[55]);
        _1011 = _1013;
    }
    float _1015 = _1011;
    bool _1017 = _1003 < _897;
    bool _1019 = !_887;
    bool _1021 = _1017 && _1019;
    if (!_1021)
    {
        _891 = _1003;
    }
    float _1023 = _891;
    float _1025 = _515;
    if (_1021)
    {
        float _1027 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[53]);
        _1025 = _1027;
    }
    float _1029 = _1025;
    float _1031 = _521;
    if (_1021)
    {
        float _1033 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[54]);
        _1031 = _1033;
    }
    float _1035 = _1031;
    float _1037 = _1023;
    if (_1021)
    {
        float _1039 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[55]);
        _1037 = _1039;
    }
    float _1041 = _1037;
    float _1043 = _511 + _873;
    float _1045 = _931;
    float _1047 = _997;
    float _1049 = _933;
    float _1051 = _999;
    if (_901)
    {
        float _1053 = _1003 * _931;
        _1045 = _1053;
    }
    float _1055 = _1045;
    float _1057 = _961;
    float _1059 = _1055;
    float _1061 = _963;
    if (_905)
    {
        float _1063 = _1003 * _961;
        _1057 = _1063;
    }
    float _1065 = _1057;
    float _1067 = _1065;
    if (_909)
    {
        float _1069 = _1003 * _997;
        _1047 = _1069;
    }
    float _1071 = _1047;
    float _1073 = _517 + _875;
    float _1075 = _1071;
    if (_901)
    {
        float _1077 = fma(_1043, _929, _1055);
        _1059 = _1077;
    }
    float _1079 = _1059;
    if (_905)
    {
        float _1081 = fma(_1043, _959, _1065);
        _1067 = _1081;
    }
    float _1083 = _1067;
    if (_909)
    {
        float _1085 = fma(_1043, _995, _1071);
        _1075 = _1085;
    }
    float _1087 = _1075;
    if (_901)
    {
        float _1089 = fma(_1073, _933, _1079);
        _1049 = _1089;
    }
    float _1091 = _1049;
    if (_905)
    {
        float _1093 = fma(_1073, _963, _1083);
        _1061 = _1093;
    }
    float _1095 = _1061;
    if (_909)
    {
        float _1097 = fma(_1073, _999, _1087);
        _1051 = _1097;
    }
    float _1099 = _1051;
    if (!_901)
    {
        _893 = 0.0;
    }
    float _1101 = _893;
    float _1103 = _1101;
    if (_901)
    {
        float _1105 = _935 + _1091;
        _1103 = _1105;
    }
    float _1107 = _1103;
    float _1109 = _1107;
    if (_905)
    {
        float _1111 = _1009 + _1095;
        _1109 = _1111;
    }
    float _1113 = _1109;
    float _1115 = _1113;
    if (_909)
    {
        float _1117 = _1001 + _1099;
        _1115 = _1117;
    }
    float _1119 = _1115;
    bool _1121 = _1119 < _1015;
    bool _1123 = !_911;
    bool _1125 = _1121 && _1123;
    float _1127 = _519;
    if (!_1021)
    {
        _533 = _513;
    }
    float _1129 = _533;
    float _1131 = _1129;
    if (!_1125)
    {
        _535 = _1073;
    }
    float _1133 = _535;
    float _1135 = _1029;
    float _1137 = _1133;
    if (_1021)
    {
        float _1139 = _513 * _1029;
        _537 = _1139;
    }
    float _1141 = _537;
    float _1143 = _1141;
    if (_1021)
    {
        float _1145 = _519 * _1035;
        _1127 = _1145;
    }
    float _1147 = _1127;
    if (_1021)
    {
        float _1149 = -_1141;
        float _1151 = fma(_1149, _1035, -0.0);
        _1131 = _1151;
    }
    float _1153 = _1131;
    float _1155 = _1153;
    if (_1021)
    {
        float _1157 = _509 * _1035;
        _539 = _1157;
    }
    float _1159 = _539;
    float _1161 = _1159;
    if (!_1125)
    {
        _1135 = _1043;
    }
    float _1163 = _1135;
    float _1165 = _1163;
    if (!_1125)
    {
        _541 = _1041;
    }
    float _1167 = _541;
    float _1169 = _1167;
    if (!_1125)
    {
        _1143 = _1147;
    }
    float _1171 = _1143;
    bool _1173 = !_1125;
    float _1175 = _1171;
    if (!_1173)
    {
        float _1177 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[55]);
        float _1179 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[53]);
        float _1181 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[54]);
        bool _1183 = !_901;
        if (!_1183)
        {
            float _1185 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _1187 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _1189 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _1191 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _1193 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _1195 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _1197 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _1199 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _1201 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _1203 = _1191 * _1189;
            float _1205 = _1193 * _1189;
            float _1207 = -_1203;
            float _1209 = fma(_1195, _1185, _1207);
            float _1211 = -_1205;
            float _1213 = fma(_1195, _1187, _1211);
            float _1215 = _1191 * _1187;
            float _1217 = _1199 * _1209;
            float _1219 = _1197 * _1193;
            float _1221 = -_1215;
            float _1223 = fma(_1193, _1185, _1221);
            float _1225 = -_1217;
            float _1227 = fma(_1197, _1213, _1225);
            float _1229 = _1201 * _1191;
            float _1231 = -_1219;
            float _1233 = fma(_1199, _1191, _1231);
            float _1235 = fma(_1201, _1223, _1227);
            float _1237 = _1199 * _1195;
            float _1239 = -_1229;
            float _1241 = fma(_1197, _1195, _1239);
            float _1243 = -_1237;
            float _1245 = fma(_1201, _1193, _1243);
            float _1247 = 1.0 / _1235;
            float _1249 = _1245 * _1247;
            float _1251 = _1241 * _1247;
            float _1253 = _1233 * _1247;
            _445 = _1251;
            _447 = _1249;
            _449 = _1253;
        }
        float _1255 = _445;
        float _1257 = _447;
        float _1259 = _449;
        float _1261 = _1255 * _1255;
        float _1263 = _1179 + 1.0;
        float _1265 = -_1119;
        float _1267 = _1265 + _1177;
        float _1269 = fma(_1257, _1257, _1261);
        float _1271 = fma(_1259, _1259, _1269);
        float _1273 = rsqrt(_1271);
        float _1275 = _1273 * _1255;
        float _1277 = _1273 * _1257;
        float _1279 = _1273 * _1259;
        float _1281 = fma(_1267, _1259, _1073);
        float _1283 = _1275 * _1153;
        float _1285 = fma(_1277, _1159, _1283);
        float _1287 = fma(_1279, _1147, _1285);
        float _1289 = _1287 * _1263;
        float _1291 = fma(_1267, _1257, _1043);
        float _1293 = fma(_1267, _1255, _1041);
        float _1295 = -_1277;
        float _1297 = fma(_1295, _1289, _1159);
        float _1299 = -_1275;
        float _1301 = fma(_1299, _1289, _1153);
        float _1303 = -_1279;
        float _1305 = fma(_1303, _1289, _1147);
        float _1307 = _1297 * _1181;
        float _1309 = _1301 * _1181;
        float _1311 = _1305 * _1181;
        _451 = _1255;
        _453 = _1257;
        _1169 = _1293;
        _1137 = _1281;
        _1165 = _1291;
        _1161 = _1307;
        _1155 = _1309;
        _1175 = _1311;
    }
    float _1313 = _451;
    float _1315 = _453;
    float _1317 = _1169;
    float _1319 = _1137;
    float _1321 = _1165;
    float _1323 = _1161;
    float _1325 = _1155;
    float _1327 = _1175;
    bool _1329 = _885 != 2;
    bool _1331 = _885 != 3;
    float _1333 = _1313;
    if (!_1329)
    {
        float _1335 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[55]);
        _1333 = _1335;
    }
    float _1337 = _1333;
    float _1339 = _1315;
    if (!_1331)
    {
        float _1341 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[55]);
        _1339 = _1341;
    }
    float _1343 = _1339;
    int _1345 = _149 + 4;
    int _1347 = _149 + 8;
    float _1349 = -_159;
    float _1351 = _1349 + _1317;
    float _1353 = -_165;
    float _1355 = _1353 + _1319;
    bool _1357 = _1317 < _1337;
    bool _1359 = !_1329;
    bool _1361 = _1357 && _1359;
    float _1363 = -_153;
    float _1365 = _1363 + _1321;
    bool _1367 = _1119 < _1343;
    bool _1369 = !_1331;
    bool _1371 = _1367 && _1369;
    bool _1373 = !_1371;
    bool _1375 = _1373 && _1361;
    bool _1377 = !_1361;
    bool _1379 = _1371 && _1377;
    bool _1381 = _1375 || _1379;
    bool _1383 = _1371 && _1361;
    bool _1385 = _1381 || _1383;
    bool _1387 = !_1385;
    int _1389 = _1387 ? as_type<int>(_413) : 0;
    uint _1391 = uint(int(uint(_171) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1391)] = uint(_1389);
    uint _1393 = uint(int(uint(_149) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1393)] = as_type<uint>(_1321);
    uint _1395 = uint(int(uint(_1345) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1395)] = as_type<uint>(_1317);
    uint _1397 = uint(int(uint(_1347) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1397)] = as_type<uint>(_1319);
    uint _1399 = uint(int(uint(_149) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1399)] = as_type<uint>(_1323);
    uint _1401 = uint(int(uint(_1345) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1401)] = as_type<uint>(_1325);
    uint _1403 = uint(int(uint(_1347) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1403)] = as_type<uint>(_1327);
    uint _1405 = uint(int(uint(_149) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1405)] = as_type<uint>(_1365);
    uint _1407 = uint(int(uint(_1345) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1407)] = as_type<uint>(_1351);
    uint _1409 = uint(int(uint(_1347) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1409)] = as_type<uint>(_1355);
    float _1411 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1413 = _1351 * _1351;
    float _1415 = _1325 * _1325;
    float _1417 = fma(_1365, _1365, _1413);
    float _1419 = fma(_1323, _1323, _1415);
    float _1421 = fma(_1355, _1355, _1417);
    float _1423 = fma(_1327, _1327, _1419);
    float _1425 = sqrt(_1423);
    float _1427 = sqrt(_1421);
    bool _1429 = _1427 >= 9.9999999747524270787835121154785e-07;
    bool _1431 = isnan(_1427);
    bool _1433 = _1429 || _1431;
    bool _1435 = isnan(9.9999999747524270787835121154785e-07);
    bool _1437 = _1433 || _1435;
    if (!_1437)
    {
        bool _1439 = _389 != _235;
        bool _1441 = isnan(_389);
        bool _1443 = _1439 || _1441;
        bool _1445 = isnan(_235);
        bool _1447 = _1443 || _1445;
        _1449 = _1447;
        if (!_1449)
        {
            float _1451 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _1453 = _1451 > 0.0;
            bool _1455 = !_1453;
            if (!_1455)
            {
                float _1457 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _1459 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _1461 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _1463 = _1459 * _1459;
                float _1465 = fma(_1457, _1457, _1463);
                float _1467 = fma(_1461, _1461, _1465);
                float _1469 = rsqrt(_1467);
                float _1471 = _1469 * 9.9999999747524270787835121154785e-07;
                float _1473 = _1457 * _1471;
                float _1475 = _1459 * _1471;
                float _1477 = _1461 * _1471;
                _255 = as_type<int>(_1473);
                _257 = as_type<int>(_1475);
                _259 = as_type<int>(_1477);
                _1449 = true;
            }
            else
            {
                bool _1479 = _1425 >= 9.9999999747524270787835121154785e-07;
                bool _1481 = isnan(_1425);
                bool _1483 = _1479 || _1481;
                bool _1485 = isnan(9.9999999747524270787835121154785e-07);
                bool _1487 = _1483 || _1485;
                if (!_1487)
                {
                    float _1489 = _1317 * _1317;
                    float _1491 = fma(_1321, _1321, _1489);
                    float _1493 = fma(_1319, _1319, _1491);
                    float _1495 = sqrt(_1493);
                    bool _1497 = _1495 >= 9.9999999747524270787835121154785e-07;
                    bool _1499 = isnan(_1495);
                    bool _1501 = _1497 || _1499;
                    bool _1503 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1505 = _1501 || _1503;
                    float _1507 = _1495;
                    if (_1505)
                    {
                        float _1509 = rsqrt(_1493);
                        _1507 = _1509;
                    }
                    float _1511 = _1507;
                    if (!_1505)
                    {
                        _243 = 0;
                    }
                    int _1513 = _243;
                    int _1515 = _1513;
                    if (!_1505)
                    {
                        _245 = 897988541;
                    }
                    int _1517 = _245;
                    int _1519 = _1517;
                    if (!_1505)
                    {
                        _247 = 0;
                    }
                    int _1521 = _247;
                    float _1523 = _1511;
                    int _1525 = _1521;
                    if (_1505)
                    {
                        float _1527 = _1511 * 9.9999999747524270787835121154785e-07;
                        _1523 = _1527;
                    }
                    float _1529 = _1523;
                    if (_1505)
                    {
                        float _1531 = _1321 * _1529;
                        _1515 = as_type<int>(_1531);
                    }
                    int _1533 = _1515;
                    _255 = _1533;
                    if (_1505)
                    {
                        float _1535 = _1317 * _1529;
                        _1519 = as_type<int>(_1535);
                    }
                    int _1537 = _1519;
                    _257 = _1537;
                    if (_1505)
                    {
                        float _1539 = _1319 * _1529;
                        _1525 = as_type<int>(_1539);
                    }
                    int _1541 = _1525;
                    _259 = _1541;
                    _1449 = true;
                }
                else
                {
                    float _1543 = rsqrt(_1423);
                    float _1545 = _1543 * 9.9999999747524270787835121154785e-07;
                    float _1547 = _1323 * _1545;
                    float _1549 = _1325 * _1545;
                    float _1551 = _1327 * _1545;
                    _255 = as_type<int>(_1547);
                    _257 = as_type<int>(_1549);
                    _259 = as_type<int>(_1551);
                    _1449 = true;
                }
            }
        }
    }
    else
    {
        float _1553 = _1425 * _1411;
        bool _1555 = _1553 >= 0.001000000047497451305389404296875;
        bool _1557 = isnan(_1553);
        bool _1559 = _1555 || _1557;
        bool _1561 = isnan(0.001000000047497451305389404296875);
        bool _1563 = _1559 || _1561;
        bool _1565 = _1553 > 0.0;
        bool _1567 = !_1563;
        bool _1569 = _1565 && _1567;
        bool _1571 = _1427 < 0.001000000047497451305389404296875;
        bool _1573 = _1571 && _1569;
        if (!_1573)
        {
            _249 = as_type<int>(_1365);
        }
        int _1575 = _249;
        int _1577 = _1575;
        if (_1573)
        {
            float _1579 = _1411 * _1323;
            _1577 = as_type<int>(_1579);
        }
        int _1581 = _1577;
        _255 = _1581;
        if (!_1573)
        {
            _251 = as_type<int>(_1351);
        }
        int _1583 = _251;
        int _1585 = _1583;
        if (_1573)
        {
            float _1587 = _1411 * _1325;
            _1585 = as_type<int>(_1587);
        }
        int _1589 = _1585;
        _257 = _1589;
        if (!_1573)
        {
            _253 = as_type<int>(_1355);
        }
        int _1591 = _253;
        _259 = _1591;
        if (_1573)
        {
            float _1593 = _1411 * _1327;
            _259 = as_type<int>(_1593);
        }
    }
    _1449 = false;
    int _1595 = _255;
    int _1597 = _257;
    int _1599 = _259;
    uint _1601 = uint(int(uint(_149) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1601)] = uint(_1595);
    uint _1603 = uint(int(uint(_1345) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1603)] = uint(_1597);
    uint _1605 = uint(int(uint(_1347) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1605)] = uint(_1599);
}

