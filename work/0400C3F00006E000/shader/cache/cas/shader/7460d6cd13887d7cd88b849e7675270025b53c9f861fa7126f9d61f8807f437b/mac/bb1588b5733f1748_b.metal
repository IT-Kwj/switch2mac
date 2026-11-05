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
    bool _745 = false;
    bool _483 = false;
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
    float _147 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[86]);
    float _149 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[68]);
    int _151 = _68 << 4;
    float _153 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[85]);
    int _155 = _151 + 12;
    float _157 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _159 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    uint _161 = uint(int(uint(_155) >> uint(2)));
    float _163 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_161)]);
    float _165 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[84]);
    uint _167 = uint(int(uint(_151) >> uint(2)));
    float _169 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_167)]);
    float _171 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    float _173 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
    float _175 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
    float _177 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
    float _179 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
    uint _181 = uint(int(uint(_155) >> uint(2)));
    float _183 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_181)]);
    uint _185 = uint(int(uint(_151) >> uint(2)));
    float _187 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_185)]);
    int _189 = _151 + 4;
    uint _191 = uint(int(uint(_189) >> uint(2)));
    float _193 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_191)]);
    int _195 = _151 + 8;
    uint _197 = uint(int(uint(_195) >> uint(2)));
    float _199 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_197)]);
    uint _201 = uint(int(uint(_151) >> uint(2)));
    float _203 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_201)]);
    int _205 = _151 + 4;
    uint _207 = uint(int(uint(_205) >> uint(2)));
    float _209 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_207)]);
    int _211 = _151 + 8;
    uint _213 = uint(int(uint(_211) >> uint(2)));
    float _215 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_213)]);
    float _217 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[128]);
    float _219 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[129]);
    float _221 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[130]);
    uint _223 = uint(int(uint(_151) >> uint(2)));
    float _225 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_223)]);
    int _227 = _151 + 4;
    uint _229 = uint(int(uint(_227) >> uint(2)));
    float _231 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_229)]);
    int _233 = _151 + 8;
    uint _235 = uint(int(uint(_233) >> uint(2)));
    float _237 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_235)]);
    int _239 = _151 + 12;
    uint _241 = uint(int(uint(_239) >> uint(2)));
    float _243 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_241)]);
    uint _245 = uint(int(uint(_155) >> uint(2)));
    float _247 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_245)]);
    bool _249 = _147 > 0.0;
    float _251 = abs(_149);
    float _253 = log2(_251);
    bool _255 = _153 > 0.0;
    float _257 = 0.0;
    float _259 = _165;
    float _261 = _221;
    float _263 = _217;
    if (_249)
    {
        float _265 = 1.0 / _147;
        _257 = _265;
    }
    float _267 = _257;
    float _269 = _157 * _253;
    float _271 = -_163;
    float _273 = _159 + _271;
    float _275 = _165 * _153;
    float _277 = exp2(_269);
    float _279 = _273;
    if (_249)
    {
        float _281 = _273 * _267;
        _279 = _281;
    }
    float _283 = _279;
    float _285 = _283;
    if (_255)
    {
        float _287 = -_275;
        float _289 = fma(_169, _287, _165);
        _259 = _289;
    }
    float _291 = _259;
    int _293 = as_type<int>(_171) & 512;
    bool _295 = _293 != 0;
    float _297 = _291;
    bool _299 = _295;
    if (_249)
    {
        float _301 = precise::min(_283, 1.0);
        _285 = _301;
    }
    float _303 = _285;
    float _305 = _157 * _173;
    if (_249)
    {
        float _307 = _303 * _291;
        _297 = _307;
    }
    float _309 = _297;
    float _311 = _175 * _305;
    float _313 = _177 * _305;
    float _315 = _179 * _305;
    float _317 = _157 * _309;
    float _319 = _183 * _157;
    float _321 = fma(_187, _277, _311);
    float _323 = fma(_193, _277, _313);
    float _325 = fma(_199, _277, _315);
    float _327 = fma(_187, _319, _203);
    float _329 = fma(_193, _319, _209);
    float _331 = fma(_199, _319, _215);
    float _333 = _217 * _317;
    float _335 = _219 * _317;
    float _337 = _221 * _317;
    bool _339 = !_295;
    float _341 = _243;
    int _343 = as_type<int>(_231);
    int _345 = as_type<int>(_225);
    int _347 = as_type<int>(_231);
    int _349 = as_type<int>(_237);
    int _351 = as_type<int>(_225);
    int _353 = as_type<int>(_231);
    int _355 = as_type<int>(_237);
    float _477;
    float _479;
    float _481;
    if (!_339)
    {
        float _357 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _359 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _361 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _363 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _365 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _367 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _369 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _371 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _373 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _375 = _361 * _363;
        float _377 = _361 * _365;
        float _379 = _359 * _363;
        float _381 = -_375;
        float _383 = fma(_357, _367, _381);
        float _385 = -_377;
        float _387 = fma(_359, _367, _385);
        float _389 = -_379;
        float _391 = fma(_357, _365, _389);
        float _393 = _371 * _357;
        float _395 = _371 * _383;
        float _397 = _373 * _359;
        float _399 = _369 * _365;
        float _401 = -_393;
        float _403 = fma(_369, _359, _401);
        float _405 = -_395;
        float _407 = fma(_369, _387, _405);
        float _409 = _371 * _367;
        float _411 = _373 * _363;
        float _413 = _369 * _361;
        float _415 = fma(_373, _391, _407);
        float _417 = -_409;
        float _419 = fma(_373, _365, _417);
        float _421 = -_411;
        float _423 = fma(_369, _367, _421);
        float _425 = -_399;
        float _427 = fma(_371, _363, _425);
        float _429 = -_413;
        float _431 = fma(_373, _357, _429);
        float _433 = -_357;
        float _435 = fma(_433, _367, _375);
        float _437 = 1.0 / _415;
        float _439 = -_397;
        float _441 = fma(_371, _361, _439);
        float _443 = _419 * _437;
        float _445 = _423 * _437;
        float _447 = _427 * _437;
        float _449 = _435 * _437;
        float _451 = _335 * _443;
        float _453 = _335 * _445;
        float _455 = _335 * _447;
        float _457 = _333 * _437;
        float _459 = _431 * _437;
        float _461 = fma(_333, _449, _453);
        float _463 = _441 * _437;
        float _465 = _403 * _437;
        float _467 = fma(_387, _457, _451);
        float _469 = fma(_391, _457, _455);
        float _471 = fma(_337, _459, _461);
        float _473 = fma(_337, _463, _467);
        float _475 = fma(_337, _465, _469);
        _477 = _473;
        _479 = _471;
        _481 = _475;
        _483 = true;
    }
    else
    {
        int _485 = as_type<int>(_171) & 1024;
        bool _487 = _485 != 0;
        if (_487)
        {
            _299 = true;
        }
        bool _489 = _299;
        bool _491 = _489;
        if (!_487)
        {
            int _493 = as_type<int>(_171) & 2048;
            bool _495 = _493 != 0;
            _491 = _495;
        }
        bool _497 = _491;
        if (!_497)
        {
            _341 = _333;
        }
        float _499 = _341;
        _477 = _499;
        if (!_497)
        {
            _261 = _335;
        }
        float _501 = _261;
        _479 = _501;
        if (!_497)
        {
            _263 = _337;
        }
        float _503 = _263;
        bool _505 = !_497;
        _481 = _503;
        if (!_505)
        {
            uint _507 = uint(int(uint(_151) >> uint(2)));
            float _509 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_507)]);
            int _511 = _151 + 4;
            uint _513 = uint(int(uint(_511) >> uint(2)));
            float _515 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_513)]);
            int _517 = _151 + 8;
            uint _519 = uint(int(uint(_517) >> uint(2)));
            float _521 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_519)]);
            uint _523 = uint(int(uint(_151) >> uint(2)));
            float _525 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_523)]);
            int _527 = _151 + 4;
            uint _529 = uint(int(uint(_527) >> uint(2)));
            float _531 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_529)]);
            int _533 = _151 + 8;
            uint _535 = uint(int(uint(_533) >> uint(2)));
            float _537 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_535)]);
            uint _539 = uint(int(uint(_151) >> uint(2)));
            float _541 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_539)]);
            int _543 = _151 + 4;
            uint _545 = uint(int(uint(_543) >> uint(2)));
            float _547 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_545)]);
            int _549 = _151 + 8;
            uint _551 = uint(int(uint(_549) >> uint(2)));
            float _553 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_551)]);
            float _555 = _521 * _525;
            float _557 = _521 * _531;
            float _559 = _515 * _525;
            float _561 = -_555;
            float _563 = fma(_509, _537, _561);
            float _565 = -_557;
            float _567 = fma(_515, _537, _565);
            float _569 = -_559;
            float _571 = fma(_509, _531, _569);
            float _573 = _547 * _509;
            float _575 = _547 * _563;
            float _577 = _553 * _515;
            float _579 = _541 * _531;
            float _581 = -_573;
            float _583 = fma(_541, _515, _581);
            float _585 = -_575;
            float _587 = fma(_541, _567, _585);
            float _589 = _547 * _537;
            float _591 = _553 * _525;
            float _593 = _541 * _521;
            float _595 = fma(_553, _571, _587);
            float _597 = -_589;
            float _599 = fma(_553, _531, _597);
            float _601 = -_591;
            float _603 = fma(_541, _537, _601);
            float _605 = -_579;
            float _607 = fma(_547, _525, _605);
            float _609 = -_593;
            float _611 = fma(_553, _509, _609);
            float _613 = -_509;
            float _615 = fma(_613, _537, _555);
            float _617 = 1.0 / _595;
            float _619 = -_577;
            float _621 = fma(_547, _521, _619);
            float _623 = _599 * _617;
            float _625 = _603 * _617;
            float _627 = _607 * _617;
            float _629 = _615 * _617;
            float _631 = _335 * _623;
            float _633 = _335 * _625;
            float _635 = _335 * _627;
            float _637 = _333 * _617;
            float _639 = _611 * _617;
            float _641 = fma(_333, _629, _633);
            float _643 = _621 * _617;
            float _645 = _583 * _617;
            float _647 = fma(_567, _637, _631);
            float _649 = fma(_571, _637, _635);
            float _651 = fma(_337, _639, _641);
            float _653 = fma(_337, _643, _647);
            float _655 = fma(_337, _645, _649);
            _477 = _653;
            _479 = _651;
            _481 = _655;
        }
    }
    _483 = false;
    float _657 = _477;
    float _659 = _479;
    float _661 = _481;
    float _663 = _327 + _657;
    float _665 = _329 + _659;
    int _667 = _151 + 4;
    float _669 = _331 + _661;
    int _671 = _151 + 8;
    uint _673 = uint(int(uint(_155) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_673)] = as_type<uint>(_247);
    float _675 = -_203;
    float _677 = _675 + _663;
    float _679 = -_209;
    float _681 = _679 + _665;
    uint _683 = uint(int(uint(_151) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_683)] = as_type<uint>(_663);
    float _685 = -_215;
    float _687 = _685 + _669;
    uint _689 = uint(int(uint(_667) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_689)] = as_type<uint>(_665);
    uint _691 = uint(int(uint(_671) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_691)] = as_type<uint>(_669);
    uint _693 = uint(int(uint(_151) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_693)] = as_type<uint>(_321);
    uint _695 = uint(int(uint(_667) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_695)] = as_type<uint>(_323);
    uint _697 = uint(int(uint(_671) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_697)] = as_type<uint>(_325);
    uint _699 = uint(int(uint(_151) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_699)] = as_type<uint>(_677);
    uint _701 = uint(int(uint(_667) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_701)] = as_type<uint>(_681);
    uint _703 = uint(int(uint(_671) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_703)] = as_type<uint>(_687);
    float _705 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _707 = _681 * _681;
    float _709 = _323 * _323;
    float _711 = fma(_677, _677, _707);
    float _713 = fma(_321, _321, _709);
    float _715 = fma(_687, _687, _711);
    float _717 = fma(_325, _325, _713);
    float _719 = sqrt(_717);
    float _721 = sqrt(_715);
    bool _723 = _721 >= 9.9999999747524270787835121154785e-07;
    bool _725 = isnan(_721);
    bool _727 = _723 || _725;
    bool _729 = isnan(9.9999999747524270787835121154785e-07);
    bool _731 = _727 || _729;
    float _733 = _717;
    if (!_731)
    {
        bool _735 = _159 != _163;
        bool _737 = isnan(_159);
        bool _739 = _735 || _737;
        bool _741 = isnan(_163);
        bool _743 = _739 || _741;
        _745 = _743;
        if (!_745)
        {
            float _747 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
            bool _749 = _747 > 0.0;
            bool _751 = !_749;
            if (!_751)
            {
                float _753 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
                float _755 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
                float _757 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
                float _759 = _755 * _755;
                float _761 = fma(_753, _753, _759);
                float _763 = fma(_757, _757, _761);
                float _765 = rsqrt(_763);
                float _767 = _765 * 9.9999999747524270787835121154785e-07;
                float _769 = _753 * _767;
                float _771 = _755 * _767;
                float _773 = _757 * _767;
                _351 = as_type<int>(_769);
                _353 = as_type<int>(_771);
                _355 = as_type<int>(_773);
                _745 = true;
            }
            else
            {
                bool _775 = _719 >= 9.9999999747524270787835121154785e-07;
                bool _777 = isnan(_719);
                bool _779 = _775 || _777;
                bool _781 = isnan(9.9999999747524270787835121154785e-07);
                bool _783 = _779 || _781;
                if (!_783)
                {
                    float _785 = _665 * _665;
                    float _787 = fma(_663, _663, _785);
                    float _789 = fma(_669, _669, _787);
                    float _791 = sqrt(_789);
                    bool _793 = _791 >= 9.9999999747524270787835121154785e-07;
                    bool _795 = isnan(_791);
                    bool _797 = _793 || _795;
                    bool _799 = isnan(9.9999999747524270787835121154785e-07);
                    bool _801 = _797 || _799;
                    int _803 = as_type<int>(_237);
                    int _805 = as_type<int>(_791);
                    if (_801)
                    {
                        float _807 = rsqrt(_789);
                        _803 = as_type<int>(_807);
                    }
                    int _809 = _803;
                    if (!_801)
                    {
                        _805 = 0;
                    }
                    int _811 = _805;
                    int _813 = _811;
                    if (!_801)
                    {
                        _343 = 897988541;
                    }
                    int _815 = _343;
                    int _817 = _809;
                    int _819 = _815;
                    if (_801)
                    {
                        float _821 = as_type<float>(_809) * 9.9999999747524270787835121154785e-07;
                        _733 = _821;
                    }
                    float _823 = _733;
                    if (!_801)
                    {
                        _817 = 0;
                    }
                    int _825 = _817;
                    int _827 = _825;
                    if (_801)
                    {
                        float _829 = _663 * _823;
                        _813 = as_type<int>(_829);
                    }
                    int _831 = _813;
                    _351 = _831;
                    if (_801)
                    {
                        float _833 = _665 * _823;
                        _819 = as_type<int>(_833);
                    }
                    int _835 = _819;
                    _353 = _835;
                    if (_801)
                    {
                        float _837 = _669 * _823;
                        _827 = as_type<int>(_837);
                    }
                    int _839 = _827;
                    _355 = _839;
                    _745 = true;
                }
                else
                {
                    float _841 = rsqrt(_717);
                    float _843 = _841 * 9.9999999747524270787835121154785e-07;
                    float _845 = _321 * _843;
                    float _847 = _323 * _843;
                    float _849 = _325 * _843;
                    _351 = as_type<int>(_845);
                    _353 = as_type<int>(_847);
                    _355 = as_type<int>(_849);
                    _745 = true;
                }
            }
        }
    }
    else
    {
        float _851 = _719 * _705;
        bool _853 = _851 >= 0.001000000047497451305389404296875;
        bool _855 = isnan(_851);
        bool _857 = _853 || _855;
        bool _859 = isnan(0.001000000047497451305389404296875);
        bool _861 = _857 || _859;
        bool _863 = _851 > 0.0;
        bool _865 = !_861;
        bool _867 = _863 && _865;
        bool _869 = _721 < 0.001000000047497451305389404296875;
        bool _871 = _869 && _867;
        if (!_871)
        {
            _345 = as_type<int>(_677);
        }
        int _873 = _345;
        int _875 = _873;
        if (_871)
        {
            float _877 = _321 * _705;
            _875 = as_type<int>(_877);
        }
        int _879 = _875;
        _351 = _879;
        if (!_871)
        {
            _347 = as_type<int>(_681);
        }
        int _881 = _347;
        int _883 = _881;
        if (_871)
        {
            float _885 = _323 * _705;
            _883 = as_type<int>(_885);
        }
        int _887 = _883;
        _353 = _887;
        if (!_871)
        {
            _349 = as_type<int>(_687);
        }
        int _889 = _349;
        _355 = _889;
        if (_871)
        {
            float _891 = _325 * _705;
            _355 = as_type<int>(_891);
        }
    }
    _745 = false;
    int _893 = _351;
    int _895 = _353;
    int _897 = _355;
    uint _899 = uint(int(uint(_151) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_899)] = uint(_893);
    uint _901 = uint(int(uint(_667) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_901)] = uint(_895);
    uint _903 = uint(int(uint(_671) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_903)] = uint(_897);
}

