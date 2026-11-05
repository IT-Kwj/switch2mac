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
    float _143 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _145 = _64 << 4;
    uint _147 = uint(int(uint(_145) >> uint(2)));
    float _149 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_147)]);
    int _151 = _145 + 4;
    uint _153 = uint(int(uint(_151) >> uint(2)));
    float _155 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_153)]);
    int _157 = _145 + 8;
    uint _159 = uint(int(uint(_157) >> uint(2)));
    float _161 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_159)]);
    int _163 = as_type<int>(_143) & 512;
    bool _165 = _163 != 0;
    int _167 = _145 + 12;
    uint _169 = uint(int(uint(_145) >> uint(2)));
    float _171 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_169)]);
    int _173 = _145 + 4;
    uint _175 = uint(int(uint(_173) >> uint(2)));
    float _177 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_175)]);
    int _179 = _145 + 8;
    uint _181 = uint(int(uint(_179) >> uint(2)));
    float _183 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_181)]);
    uint _185 = uint(int(uint(_145) >> uint(2)));
    float _187 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_185)]);
    int _189 = _145 + 4;
    uint _191 = uint(int(uint(_189) >> uint(2)));
    float _193 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_191)]);
    int _195 = _145 + 8;
    uint _197 = uint(int(uint(_195) >> uint(2)));
    float _199 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_197)]);
    float _201 = 0.0;
    float _203 = 0.0;
    float _205 = 0.0;
    if (_165)
    {
        float _207 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _209 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _211 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _201 = _207;
        _203 = _209;
        _205 = _211;
    }
    float _213 = _201;
    float _215 = _203;
    float _217 = _205;
    float _219 = 0.0;
    float _221 = 0.0;
    float _223 = 0.0;
    if (_165)
    {
        float _225 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _227 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _229 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _219 = _225;
        _221 = _227;
        _223 = _229;
    }
    float _231 = _219;
    float _233 = _221;
    float _235 = _223;
    float _237 = 0.0;
    float _239 = 0.0;
    float _241 = 0.0;
    if (_165)
    {
        float _243 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _245 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _247 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _237 = _243;
        _239 = _245;
        _241 = _247;
    }
    float _249 = _237;
    float _251 = _239;
    float _253 = _241;
    uint _255 = uint(int(uint(_167) >> uint(2)));
    float _257 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_255)]);
    uint _259 = uint(int(uint(_167) >> uint(2)));
    float _261 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_259)]);
    float _263 = 0.0;
    float _265 = _231;
    float _267 = _233;
    float _269 = _235;
    float _271 = _213;
    float _273 = _215;
    float _275 = _217;
    float _277 = _249;
    float _279 = _251;
    float _281 = _253;
    float _283 = _261;
    int _285 = as_type<int>(_193);
    int _287 = as_type<int>(_193);
    int _289 = as_type<int>(_199);
    int _291 = as_type<int>(_187);
    int _293 = as_type<int>(_193);
    int _295 = as_type<int>(_199);
    if (!_165)
    {
        int _297 = _145 + 4;
        int _299 = _145 + 8;
        uint _301 = uint(int(uint(_145) >> uint(2)));
        float _303 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_301)]);
        uint _305 = uint(int(uint(_297) >> uint(2)));
        float _307 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_305)]);
        uint _309 = uint(int(uint(_297) >> uint(2)));
        float _311 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_309)]);
        uint _313 = uint(int(uint(_299) >> uint(2)));
        float _315 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_313)]);
        uint _317 = uint(int(uint(_297) >> uint(2)));
        float _319 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_317)]);
        uint _321 = uint(int(uint(_145) >> uint(2)));
        float _323 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_321)]);
        uint _325 = uint(int(uint(_299) >> uint(2)));
        float _327 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_325)]);
        uint _329 = uint(int(uint(_145) >> uint(2)));
        float _331 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_329)]);
        uint _333 = uint(int(uint(_299) >> uint(2)));
        float _335 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_333)]);
        float _337 = _307 * _307;
        float _339 = _303 * _303;
        float _341 = fma(_311, _311, _337);
        float _343 = _315 * _315;
        float _345 = fma(_319, _319, _341);
        float _347 = fma(_323, _323, _339);
        float _349 = fma(_327, _327, _343);
        float _351 = sqrt(_345);
        float _353 = fma(_331, _331, _347);
        float _355 = fma(_335, _335, _349);
        float _357 = sqrt(_353);
        float _359 = sqrt(_355);
        bool _361 = _351 > 0.0;
        bool _363 = _357 > 0.0;
        bool _365 = _359 > 0.0;
        float _367 = 0.0;
        float _369 = _359;
        float _371 = _353;
        float _373 = _351;
        float _375 = _357;
        float _377 = _343;
        float _379 = _349;
        float _381 = _307;
        float _383 = _319;
        float _385 = _345;
        if (_361)
        {
            float _387 = rsqrt(_345);
            _367 = _387;
        }
        float _389 = _367;
        float _391 = 0.0;
        if (_363)
        {
            float _393 = rsqrt(_353);
            _391 = _393;
        }
        float _395 = _391;
        float _397 = 0.0;
        if (_365)
        {
            float _399 = rsqrt(_355);
            _397 = _399;
        }
        float _401 = _397;
        if (!_361)
        {
            _369 = 0.0;
        }
        float _403 = _369;
        float _405 = _403;
        if (_361)
        {
            float _407 = _307 * _389;
            _405 = _407;
        }
        float _409 = _405;
        _267 = _409;
        if (!_361)
        {
            _371 = 0.0;
        }
        float _411 = _371;
        float _413 = _411;
        if (_361)
        {
            float _415 = _319 * _389;
            _413 = _415;
        }
        float _417 = _413;
        _279 = _417;
        if (!_363)
        {
            _373 = 0.0;
        }
        float _419 = _373;
        float _421 = _419;
        if (!_363)
        {
            _375 = 0.0;
        }
        float _423 = _375;
        float _425 = _423;
        if (_363)
        {
            float _427 = _303 * _395;
            _421 = _427;
        }
        float _429 = _421;
        _265 = _429;
        if (!_363)
        {
            _377 = 0.0;
        }
        float _431 = _377;
        float _433 = _431;
        if (_363)
        {
            float _435 = _323 * _395;
            _425 = _435;
        }
        float _437 = _425;
        _271 = _437;
        if (!_361)
        {
            _379 = 0.0;
        }
        float _439 = _379;
        float _441 = _439;
        if (_363)
        {
            float _443 = _331 * _395;
            _433 = _443;
        }
        float _445 = _433;
        _277 = _445;
        if (!_365)
        {
            _381 = 0.0;
        }
        float _447 = _381;
        float _449 = _447;
        if (_361)
        {
            float _451 = _311 * _389;
            _441 = _451;
        }
        float _453 = _441;
        _273 = _453;
        if (!_365)
        {
            _383 = 0.0;
        }
        float _455 = _383;
        float _457 = _455;
        _263 = _401;
        if (_365)
        {
            float _459 = _315 * _401;
            _449 = _459;
        }
        float _461 = _449;
        _269 = _461;
        if (!_365)
        {
            _385 = 0.0;
        }
        float _463 = _385;
        _281 = _463;
        if (_365)
        {
            float _465 = _327 * _401;
            _457 = _465;
        }
        float _467 = _457;
        _275 = _467;
        if (_365)
        {
            float _469 = _335 * _401;
            _281 = _469;
        }
    }
    float _471 = _263;
    float _473 = _265;
    float _475 = _267;
    float _477 = _269;
    float _479 = _271;
    float _481 = _273;
    float _483 = _275;
    float _485 = _277;
    float _487 = _279;
    float _489 = _281;
    float _491 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _493 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[50]);
    float _495 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _497 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _499 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _501 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _503 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _505 = trunc(_493);
    int _507 = int(_505);
    float _509 = _177 * _491;
    float _511 = _183 * _491;
    float _513 = _171 * _491;
    float _515 = fma(_261, _509, _155);
    float _517 = fma(_261, _511, _161);
    bool _519 = _507 != 0;
    float _521 = fma(_261, _513, _149);
    bool _523 = _507 != 1;
    bool _525 = _507 != 2;
    float _527 = _471;
    float _529 = _511;
    float _531 = as_type<float>(_507);
    if (_519)
    {
        _527 = _515;
    }
    float _533 = _527;
    float _535 = _533;
    if (_519)
    {
        _529 = _517;
    }
    float _537 = _529;
    float _539 = _537;
    if (!_519)
    {
        float _541 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[48]);
        float _543 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[49]);
        float _545 = _261 * _541;
        float _547 = _491 * _545;
        bool _549 = _543 != 0.0;
        bool _551 = isnan(_543);
        bool _553 = _549 || _551;
        bool _555 = isnan(0.0);
        bool _557 = _553 || _555;
        float _559 = _547 * 0.15915493667125701904296875;
        float _561 = _559 * 6.283185482025146484375;
        float _563 = sin(_561);
        float _565 = _559 * 6.283185482025146484375;
        float _567 = cos(_565);
        float _569 = _563 * _517;
        float _571 = _563 * _515;
        float _573 = fma(_567, _515, _569);
        float _575 = -_571;
        float _577 = fma(_567, _517, _575);
        bool _579 = !_557;
        float _581 = _543;
        float _583 = _573;
        _531 = _563;
        _539 = _577;
        _535 = _573;
        if (!_579)
        {
            float _585 = _577 * _577;
            float _587 = fma(_573, _573, _585);
            bool _589 = _587 > 0.0;
            float _591 = _571;
            _531 = _587;
            if (_589)
            {
                float _593 = rsqrt(_587);
                _591 = _593;
            }
            float _595 = _591;
            float _597 = _595;
            if (_589)
            {
                float _599 = _543 * _595;
                _581 = _599;
            }
            float _601 = _581;
            if (_589)
            {
                float _603 = _261 * _601;
                _597 = _603;
            }
            float _605 = _597;
            float _607 = _605;
            if (_589)
            {
                float _609 = _491 * _605;
                _607 = _609;
            }
            float _611 = _607;
            if (_589)
            {
                float _613 = fma(_573, _611, _573);
                _583 = _613;
            }
            float _615 = _583;
            _535 = _615;
            if (_589)
            {
                float _617 = fma(_577, _611, _577);
                _539 = _617;
            }
        }
    }
    float _619 = _531;
    float _621 = _539;
    float _623 = _535;
    float _625 = _619;
    float _627 = _621;
    float _629 = _623;
    if (_523)
    {
        _625 = _521;
    }
    float _631 = _625;
    float _633 = _631;
    if (!_523)
    {
        float _635 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[48]);
        float _637 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[49]);
        float _639 = _261 * _635;
        float _641 = _491 * _639;
        bool _643 = _637 != 0.0;
        bool _645 = isnan(_637);
        bool _647 = _643 || _645;
        bool _649 = isnan(0.0);
        bool _651 = _647 || _649;
        float _653 = _641 * 0.15915493667125701904296875;
        float _655 = _653 * 6.283185482025146484375;
        float _657 = sin(_655);
        float _659 = _653 * 6.283185482025146484375;
        float _661 = cos(_659);
        float _663 = _657 * _621;
        float _665 = _657 * _521;
        float _667 = -_663;
        float _669 = fma(_661, _521, _667);
        float _671 = fma(_661, _621, _665);
        float _673 = _663;
        float _675 = _665;
        float _677 = _671;
        _627 = _671;
        if (!_651)
        {
            _673 = _669;
        }
        float _679 = _673;
        bool _681 = !_651;
        _633 = _679;
        if (!_681)
        {
            float _683 = _669 * _669;
            float _685 = fma(_671, _671, _683);
            bool _687 = _685 > 0.0;
            float _689 = _683;
            if (_687)
            {
                float _691 = rsqrt(_685);
                _689 = _691;
            }
            float _693 = _689;
            float _695 = _693;
            if (_687)
            {
                float _697 = _637 * _693;
                _695 = _697;
            }
            float _699 = _695;
            float _701 = _699;
            if (_687)
            {
                float _703 = _261 * _699;
                _675 = _703;
            }
            float _705 = _675;
            float _707 = _705;
            if (!_687)
            {
                _701 = _669;
            }
            float _709 = _701;
            _633 = _709;
            if (_687)
            {
                float _711 = _491 * _705;
                _707 = _711;
            }
            float _713 = _707;
            if (_687)
            {
                float _715 = fma(_671, _713, _671);
                _677 = _715;
            }
            float _717 = _677;
            _627 = _717;
            if (_687)
            {
                float _719 = fma(_669, _713, _669);
                _633 = _719;
            }
        }
    }
    float _721 = _633;
    float _723 = _627;
    float _725 = _721;
    float _727 = _721;
    if (!_525)
    {
        float _729 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[48]);
        float _731 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[49]);
        float _733 = _261 * _729;
        float _735 = _491 * _733;
        bool _737 = _731 != 0.0;
        bool _739 = isnan(_731);
        bool _741 = _737 || _739;
        bool _743 = isnan(0.0);
        bool _745 = _741 || _743;
        float _747 = _735 * 0.15915493667125701904296875;
        float _749 = _747 * 6.283185482025146484375;
        float _751 = sin(_749);
        float _753 = _747 * 6.283185482025146484375;
        float _755 = cos(_753);
        float _757 = _751 * _623;
        float _759 = _751 * _721;
        float _761 = fma(_755, _721, _757);
        float _763 = -_759;
        float _765 = fma(_755, _623, _763);
        _629 = _765;
        if (!_745)
        {
            _725 = _761;
        }
        float _767 = _725;
        bool _769 = !_745;
        _727 = _767;
        if (!_769)
        {
            float _771 = _765 * _765;
            float _773 = fma(_761, _761, _771);
            bool _775 = _773 > 0.0;
            float _777 = _771;
            if (_775)
            {
                float _779 = rsqrt(_773);
                _777 = _779;
            }
            float _781 = _777;
            float _783 = _781;
            if (_775)
            {
                float _785 = _731 * _781;
                _783 = _785;
            }
            float _787 = _783;
            float _789 = _787;
            if (_775)
            {
                float _791 = _261 * _787;
                _283 = _791;
            }
            float _793 = _283;
            float _795 = _793;
            if (!_775)
            {
                _789 = _761;
            }
            float _797 = _789;
            float _799 = _797;
            if (_775)
            {
                float _801 = _491 * _793;
                _795 = _801;
            }
            float _803 = _795;
            if (_775)
            {
                float _805 = fma(_761, _803, _761);
                _799 = _805;
            }
            float _807 = _799;
            _727 = _807;
            if (_775)
            {
                float _809 = fma(_765, _803, _765);
                _629 = _809;
            }
        }
    }
    float _811 = _727;
    float _813 = _629;
    uint _815 = uint(int(uint(_167) >> uint(2)));
    float _817 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_815)]);
    float _819 = abs(_503);
    float _821 = log2(_819);
    float _823 = _497 * _501;
    float _825 = _495 * _501;
    float _827 = _499 * _501;
    float _829 = _823 * _473;
    float _831 = _823 * _475;
    float _833 = _823 * _477;
    float _835 = fma(_825, _479, _829);
    float _837 = fma(_825, _481, _831);
    float _839 = fma(_825, _483, _833);
    float _841 = fma(_827, _485, _835);
    float _843 = fma(_827, _487, _837);
    float _845 = fma(_827, _489, _839);
    float _847 = _491 * _821;
    float _849 = _491 * _841;
    float _851 = _491 * _843;
    float _853 = _491 * _845;
    float _855 = exp2(_847);
    int _857 = _145 + 4;
    float _859 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    int _861 = _145 + 8;
    float _863 = fma(_171, _855, _849);
    float _865 = fma(_177, _855, _851);
    float _867 = fma(_183, _855, _853);
    float _869 = -_149;
    float _871 = _869 + _811;
    float _873 = -_155;
    float _875 = _873 + _813;
    float _877 = -_161;
    float _879 = _877 + _723;
    uint _881 = uint(int(uint(_167) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_881)] = as_type<uint>(_817);
    uint _883 = uint(int(uint(_145) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_883)] = as_type<uint>(_811);
    uint _885 = uint(int(uint(_857) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_885)] = as_type<uint>(_813);
    uint _887 = uint(int(uint(_861) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_887)] = as_type<uint>(_723);
    uint _889 = uint(int(uint(_145) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_889)] = as_type<uint>(_863);
    uint _891 = uint(int(uint(_857) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_891)] = as_type<uint>(_865);
    uint _893 = uint(int(uint(_861) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_893)] = as_type<uint>(_867);
    uint _895 = uint(int(uint(_145) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_895)] = as_type<uint>(_871);
    uint _897 = uint(int(uint(_857) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_897)] = as_type<uint>(_875);
    uint _899 = uint(int(uint(_861) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_899)] = as_type<uint>(_879);
    float _901 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _903 = _875 * _875;
    float _905 = fma(_871, _871, _903);
    float _907 = fma(_879, _879, _905);
    float _909 = sqrt(_907);
    float _911 = _865 * _865;
    float _913 = fma(_863, _863, _911);
    float _915 = fma(_867, _867, _913);
    float _917 = sqrt(_915);
    bool _919 = _909 >= 9.9999999747524270787835121154785e-07;
    bool _921 = isnan(_909);
    bool _923 = _919 || _921;
    bool _925 = isnan(9.9999999747524270787835121154785e-07);
    bool _927 = _923 || _925;
    float _929 = _901;
    if (!_927)
    {
        bool _931 = _859 != _257;
        bool _933 = isnan(_859);
        bool _935 = _931 || _933;
        bool _937 = isnan(_257);
        bool _939 = _935 || _937;
        _941 = _939;
        if (!_941)
        {
            float _943 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _945 = _943 > 0.0;
            bool _947 = !_945;
            if (!_947)
            {
                float _949 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _951 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _953 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _955 = _951 * _475;
                float _957 = _951 * _473;
                float _959 = _951 * _477;
                float _961 = fma(_949, _481, _955);
                float _963 = fma(_949, _479, _957);
                float _965 = fma(_949, _483, _959);
                float _967 = fma(_953, _487, _961);
                float _969 = fma(_953, _485, _963);
                float _971 = fma(_953, _489, _965);
                float _973 = _967 * _967;
                float _975 = fma(_969, _969, _973);
                float _977 = fma(_971, _971, _975);
                float _979 = rsqrt(_977);
                float _981 = _979 * 9.9999999747524270787835121154785e-07;
                float _983 = _969 * _981;
                float _985 = _967 * _981;
                float _987 = _971 * _981;
                _291 = as_type<int>(_983);
                _293 = as_type<int>(_985);
                _295 = as_type<int>(_987);
                _941 = true;
            }
            else
            {
                bool _989 = _917 >= 9.9999999747524270787835121154785e-07;
                bool _991 = isnan(_917);
                bool _993 = _989 || _991;
                bool _995 = isnan(9.9999999747524270787835121154785e-07);
                bool _997 = _993 || _995;
                if (!_997)
                {
                    float _999 = _813 * _813;
                    float _1001 = fma(_811, _811, _999);
                    float _1003 = fma(_723, _723, _1001);
                    float _1005 = sqrt(_1003);
                    bool _1007 = _1005 >= 9.9999999747524270787835121154785e-07;
                    bool _1009 = isnan(_1005);
                    bool _1011 = _1007 || _1009;
                    bool _1013 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1015 = _1011 || _1013;
                    int _1017 = as_type<int>(_199);
                    int _1019 = as_type<int>(_1005);
                    if (_1015)
                    {
                        float _1021 = rsqrt(_1003);
                        _1017 = as_type<int>(_1021);
                    }
                    int _1023 = _1017;
                    if (!_1015)
                    {
                        _1019 = 0;
                    }
                    int _1025 = _1019;
                    int _1027 = _1025;
                    if (!_1015)
                    {
                        _285 = 897988541;
                    }
                    int _1029 = _285;
                    int _1031 = _1023;
                    int _1033 = _1029;
                    if (_1015)
                    {
                        float _1035 = as_type<float>(_1023) * 9.9999999747524270787835121154785e-07;
                        _929 = _1035;
                    }
                    float _1037 = _929;
                    if (!_1015)
                    {
                        _1031 = 0;
                    }
                    int _1039 = _1031;
                    int _1041 = _1039;
                    if (_1015)
                    {
                        float _1043 = _811 * _1037;
                        _1027 = as_type<int>(_1043);
                    }
                    int _1045 = _1027;
                    _291 = _1045;
                    if (_1015)
                    {
                        float _1047 = _813 * _1037;
                        _1033 = as_type<int>(_1047);
                    }
                    int _1049 = _1033;
                    _293 = _1049;
                    if (_1015)
                    {
                        float _1051 = _723 * _1037;
                        _1041 = as_type<int>(_1051);
                    }
                    int _1053 = _1041;
                    _295 = _1053;
                    _941 = true;
                }
                else
                {
                    float _1055 = rsqrt(_915);
                    float _1057 = _1055 * 9.9999999747524270787835121154785e-07;
                    float _1059 = _863 * _1057;
                    float _1061 = _865 * _1057;
                    float _1063 = _867 * _1057;
                    _291 = as_type<int>(_1059);
                    _293 = as_type<int>(_1061);
                    _295 = as_type<int>(_1063);
                    _941 = true;
                }
            }
        }
    }
    else
    {
        float _1065 = _917 * _901;
        bool _1067 = _1065 >= 0.001000000047497451305389404296875;
        bool _1069 = isnan(_1065);
        bool _1071 = _1067 || _1069;
        bool _1073 = isnan(0.001000000047497451305389404296875);
        bool _1075 = _1071 || _1073;
        bool _1077 = _1065 > 0.0;
        bool _1079 = !_1075;
        bool _1081 = _1077 && _1079;
        bool _1083 = _909 < 0.001000000047497451305389404296875;
        bool _1085 = _1083 && _1081;
        int _1087 = as_type<int>(_1065);
        if (!_1085)
        {
            _1087 = as_type<int>(_871);
        }
        int _1089 = _1087;
        int _1091 = _1089;
        if (_1085)
        {
            float _1093 = _863 * _901;
            _1091 = as_type<int>(_1093);
        }
        int _1095 = _1091;
        _291 = _1095;
        if (!_1085)
        {
            _287 = as_type<int>(_875);
        }
        int _1097 = _287;
        int _1099 = _1097;
        if (_1085)
        {
            float _1101 = _865 * _901;
            _1099 = as_type<int>(_1101);
        }
        int _1103 = _1099;
        _293 = _1103;
        if (!_1085)
        {
            _289 = as_type<int>(_879);
        }
        int _1105 = _289;
        _295 = _1105;
        if (_1085)
        {
            float _1107 = _867 * _901;
            _295 = as_type<int>(_1107);
        }
    }
    _941 = false;
    int _1109 = _291;
    int _1111 = _293;
    int _1113 = _295;
    uint _1115 = uint(int(uint(_145) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1115)] = uint(_1109);
    uint _1117 = uint(int(uint(_857) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1117)] = uint(_1111);
    uint _1119 = uint(int(uint(_861) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1119)] = uint(_1113);
}

