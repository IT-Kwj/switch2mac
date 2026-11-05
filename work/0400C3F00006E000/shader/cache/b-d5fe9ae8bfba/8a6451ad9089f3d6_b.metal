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
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _3363 = false;
    bool _2817 = false;
    bool _2073 = false;
    bool _1165 = false;
    float _57 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _59 = as_type<float>(gl_LocalInvocationID.x);
    float _61 = as_type<float>(gl_WorkGroupID.x);
    int _64 = as_type<int>(_61) << 5;
    int _66 = _64 + as_type<int>(_59);
    float _68 = trunc(_57);
    int _70 = int(_68);
    bool _74 = _66 >= _70;
    int _76 = 0;
    if (_74)
    {
        _76 = 0;
    }
    int _78 = _76;
    int _80 = _78;
    int _82 = _78;
    if (!_74)
    {
        int _84 = _66 << 4;
        int _86 = _84 + 12;
        uint _89 = uint(int(uint(_86) >> uint(2)));
        float _91 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_89)]);
        float _93 = trunc(_91);
        int _95 = int(_93);
        bool _97 = _95 >= 1;
        int _99 = _97 ? (-1) : 0;
        if (!_97)
        {
            _80 = 0;
        }
        int _101 = _80;
        bool _103 = !_97;
        _82 = _101;
        if (!_103)
        {
            float _105 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _107 = uint(int(uint(_86) >> uint(2)));
            float _109 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_107)]);
            float _111 = float(_95);
            float _113 = -_109;
            float _115 = _105 + _113;
            bool _117 = _115 > _111;
            int _119 = as_type<int>(_105);
            if (!_117)
            {
                bool _121 = _105 >= _109;
                bool _123 = isnan(_105);
                bool _125 = _121 || _123;
                bool _127 = isnan(_109);
                bool _129 = _125 || _127;
                _99 = _129 ? (-1) : 0;
            }
            int _131 = _99;
            if (_117)
            {
                _119 = 0;
            }
            int _133 = _119;
            _82 = _133;
            if (!_117)
            {
                int _135 = ~_131;
                int _137 = (_135 != 0) ? 0 : 1;
                _82 = _137;
            }
        }
    }
    int _139 = _82;
    int _141 = _139 & 1;
    bool _143 = _141 != 0;
    if (!_143)
    {
        return;
    }
    float _145 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _147 = _66 << 4;
    uint _149 = uint(int(uint(_147) >> uint(2)));
    float _151 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_149)]);
    int _153 = _147 + 4;
    uint _155 = uint(int(uint(_153) >> uint(2)));
    float _157 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_155)]);
    int _159 = _147 + 8;
    uint _161 = uint(int(uint(_159) >> uint(2)));
    float _163 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_161)]);
    int _165 = as_type<int>(_145) & 512;
    bool _167 = _165 != 0;
    int _169 = _147 + 12;
    uint _171 = uint(int(uint(_147) >> uint(2)));
    float _173 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_171)]);
    int _175 = _147 + 4;
    uint _177 = uint(int(uint(_175) >> uint(2)));
    float _179 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_177)]);
    int _181 = _147 + 8;
    uint _183 = uint(int(uint(_181) >> uint(2)));
    float _185 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_183)]);
    int _187 = _147 + 12;
    uint _189 = uint(int(uint(_187) >> uint(2)));
    float _191 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_189)]);
    uint _193 = uint(int(uint(_147) >> uint(2)));
    float _195 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_193)]);
    int _197 = _147 + 4;
    uint _199 = uint(int(uint(_197) >> uint(2)));
    float _201 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_199)]);
    int _203 = _147 + 8;
    uint _205 = uint(int(uint(_203) >> uint(2)));
    float _207 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_205)]);
    float _209 = 0.0;
    float _211 = 0.0;
    float _213 = 0.0;
    if (_167)
    {
        float _215 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _217 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _219 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _209 = _215;
        _211 = _217;
        _213 = _219;
    }
    float _221 = _209;
    float _223 = _211;
    float _225 = _213;
    float _227 = 0.0;
    float _229 = 0.0;
    float _231 = 0.0;
    if (_167)
    {
        float _233 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _235 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _237 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _227 = _233;
        _229 = _235;
        _231 = _237;
    }
    float _239 = _227;
    float _241 = _229;
    float _243 = _231;
    float _245 = 0.0;
    float _247 = 0.0;
    float _249 = 0.0;
    if (_167)
    {
        float _251 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _253 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _255 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _245 = _251;
        _247 = _253;
        _249 = _255;
    }
    float _257 = _245;
    float _259 = _247;
    float _261 = _249;
    uint _263 = uint(int(uint(_147) >> uint(2)));
    float _265 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_263)]);
    int _267 = _147 + 4;
    uint _269 = uint(int(uint(_267) >> uint(2)));
    float _271 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_269)]);
    int _273 = _147 + 8;
    uint _275 = uint(int(uint(_273) >> uint(2)));
    float _277 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_275)]);
    uint _279 = uint(int(uint(_169) >> uint(2)));
    float _281 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_279)]);
    uint _283 = uint(int(uint(_169) >> uint(2)));
    float _285 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_283)]);
    float _287 = _223;
    float _289 = _241;
    float _291 = _223;
    float _293 = _259;
    float _295 = _239;
    float _297 = _243;
    float _299 = _221;
    float _301 = _225;
    float _303 = _257;
    float _305 = _261;
    float _307 = _265;
    float _309 = _179;
    float _311 = _179;
    float _313 = _191;
    int _315 = as_type<int>(_195);
    int _317 = as_type<int>(_201);
    int _319 = as_type<int>(_207);
    int _321 = as_type<int>(_195);
    int _323 = as_type<int>(_201);
    int _325 = as_type<int>(_207);
    int _327 = as_type<int>(_195);
    int _329 = as_type<int>(_201);
    int _331 = as_type<int>(_207);
    if (!_167)
    {
        int _333 = _147 + 4;
        int _335 = _147 + 8;
        uint _337 = uint(int(uint(_147) >> uint(2)));
        float _339 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_337)]);
        uint _341 = uint(int(uint(_333) >> uint(2)));
        float _343 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_341)]);
        uint _345 = uint(int(uint(_335) >> uint(2)));
        float _347 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_345)]);
        uint _349 = uint(int(uint(_333) >> uint(2)));
        float _351 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_349)]);
        uint _353 = uint(int(uint(_147) >> uint(2)));
        float _355 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_353)]);
        uint _357 = uint(int(uint(_335) >> uint(2)));
        float _359 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_357)]);
        uint _361 = uint(int(uint(_333) >> uint(2)));
        float _363 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_361)]);
        uint _365 = uint(int(uint(_147) >> uint(2)));
        float _367 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_365)]);
        uint _369 = uint(int(uint(_335) >> uint(2)));
        float _371 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_369)]);
        float _373 = _339 * _339;
        float _375 = _343 * _343;
        float _377 = _347 * _347;
        float _379 = fma(_351, _351, _375);
        float _381 = fma(_355, _355, _373);
        float _383 = fma(_359, _359, _377);
        float _385 = fma(_363, _363, _379);
        float _387 = fma(_367, _367, _381);
        float _389 = sqrt(_385);
        float _391 = fma(_371, _371, _383);
        float _393 = sqrt(_387);
        float _395 = sqrt(_391);
        bool _397 = _389 > 0.0;
        bool _399 = _393 > 0.0;
        bool _401 = _395 > 0.0;
        float _403 = _225;
        float _405 = _375;
        float _407 = _387;
        float _409 = _393;
        float _411 = _383;
        float _413 = _395;
        float _415 = _385;
        float _417 = _351;
        if (_397)
        {
            float _419 = rsqrt(_385);
            _403 = _419;
        }
        float _421 = _403;
        float _423 = _389;
        if (_399)
        {
            float _425 = rsqrt(_387);
            _423 = _425;
        }
        float _427 = _423;
        float _429 = 0.0;
        if (_401)
        {
            float _431 = rsqrt(_391);
            _429 = _431;
        }
        float _433 = _429;
        if (!_397)
        {
            _405 = 0.0;
        }
        float _435 = _405;
        float _437 = _435;
        float _439 = _421;
        if (_397)
        {
            float _441 = _343 * _421;
            _437 = _441;
        }
        float _443 = _437;
        _289 = _443;
        if (!_397)
        {
            _287 = 0.0;
        }
        float _445 = _287;
        float _447 = _445;
        if (_397)
        {
            float _449 = _351 * _421;
            _447 = _449;
        }
        float _451 = _447;
        _291 = _451;
        if (!_397)
        {
            _407 = 0.0;
        }
        float _453 = _407;
        float _455 = _453;
        if (_397)
        {
            float _457 = _363 * _421;
            _455 = _457;
        }
        float _459 = _455;
        _293 = _459;
        if (!_399)
        {
            _409 = 0.0;
        }
        float _461 = _409;
        float _463 = _461;
        if (_399)
        {
            float _465 = _339 * _427;
            _463 = _465;
        }
        float _467 = _463;
        _295 = _467;
        if (!_399)
        {
            _411 = 0.0;
        }
        float _469 = _411;
        float _471 = _469;
        if (_399)
        {
            float _473 = _355 * _427;
            _471 = _473;
        }
        float _475 = _471;
        _299 = _475;
        if (!_399)
        {
            _413 = 0.0;
        }
        float _477 = _413;
        float _479 = _477;
        if (_399)
        {
            float _481 = _367 * _427;
            _479 = _481;
        }
        float _483 = _479;
        _303 = _483;
        if (!_401)
        {
            _415 = 0.0;
        }
        float _485 = _415;
        float _487 = _485;
        if (!_401)
        {
            _439 = 0.0;
        }
        float _489 = _439;
        float _491 = _489;
        if (_401)
        {
            float _493 = _347 * _433;
            _487 = _493;
        }
        float _495 = _487;
        _297 = _495;
        if (!_401)
        {
            _417 = 0.0;
        }
        float _497 = _417;
        _305 = _497;
        if (_401)
        {
            float _499 = _359 * _433;
            _491 = _499;
        }
        float _501 = _491;
        _301 = _501;
        if (_401)
        {
            float _503 = _371 * _433;
            _305 = _503;
        }
    }
    float _505 = _289;
    float _507 = _291;
    float _509 = _293;
    float _511 = _295;
    float _513 = _297;
    float _515 = _299;
    float _517 = _301;
    float _519 = _303;
    float _521 = _305;
    float _523 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _525 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _527 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _529 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _531 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[12]);
    float _533 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[16]);
    float _535 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[17]);
    float _537 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[3]);
    float _539 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _541 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _543 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _545 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _547 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[15]);
    bool _549 = _531 != 1.0;
    bool _551 = isnan(_531);
    bool _553 = _549 || _551;
    bool _555 = isnan(1.0);
    bool _557 = _553 || _555;
    float _559 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[0]);
    float _561 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[1]);
    float _563 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[2]);
    float _565 = _557 ? _265 : 0.0;
    float _567 = _533 * 0.00999999977648258209228515625;
    float _569 = _557 ? _271 : 0.3141500055789947509765625;
    float _571 = _557 ? _277 : 0.92653000354766845703125;
    float _573 = _537 * _565;
    float _575 = _537 * _567;
    float _577 = _537 * _569;
    float _579 = _537 * _571;
    float _581 = _573;
    float _583 = _535;
    float _585 = _577;
    float _587 = _579;
    float _589 = _571;
    float _591 = _569;
    float _593 = _529;
    float _595 = _539;
    float _597 = _539;
    if (!_557)
    {
        float _599 = _535 * 0.00999999977648258209228515625;
        float _601 = _545 * _575;
        float _603 = fma(_265, 2.0, -1.0);
        float _605 = fma(_271, 2.0, -1.0);
        float _607 = _537 * _599;
        float _609 = fma(_277, 2.0, -1.0);
        float _611 = fma(_607, _603, _601);
        float _613 = fma(_607, _605, _601);
        float _615 = fma(_607, _609, _601);
        float _617 = _573 + _611;
        float _619 = _577 + _613;
        float _621 = _579 + _615;
        _307 = _603;
        _581 = _617;
        _583 = _607;
        _585 = _619;
        _587 = _621;
    }
    float _623 = _307;
    float _625 = _581;
    float _627 = _583;
    float _629 = _585;
    float _631 = _587;
    float _633 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[13]);
    float _635 = -_539;
    float _637 = _635 + 1.0;
    float _639 = -_543;
    float _641 = _639 + 1.0;
    float _643 = -_285;
    float _645 = _545 + _643;
    float _647 = _525 * _541;
    float _649 = 0.0;
    float _651 = _645;
    float _653 = _627;
    float _655 = _627;
    if (_557)
    {
        _649 = 0.0;
    }
    float _657 = _649;
    float _659 = fma(_637, _641, _543);
    float _661 = _523 * _541;
    float _663 = abs(_543);
    float _665 = log2(_663);
    float _667 = _657;
    if (!_557)
    {
        float _669 = _539 * _575;
        _667 = _669;
    }
    float _671 = _667;
    float _673 = _647 * _505;
    bool _675 = _659 != 1.0;
    bool _677 = isnan(_659);
    bool _679 = _675 || _677;
    bool _681 = isnan(1.0);
    bool _683 = _679 || _681;
    bool _685 = _671 != 0.0;
    bool _687 = isnan(_671);
    bool _689 = _685 || _687;
    bool _691 = isnan(0.0);
    bool _693 = _689 || _691;
    float _695 = fma(_661, _507, _673);
    bool _697 = _547 != 1.0;
    bool _699 = isnan(_547);
    bool _701 = _697 || _699;
    bool _703 = isnan(1.0);
    bool _705 = _701 || _703;
    bool _707 = !_683;
    bool _709 = _705 || _707;
    float _711 = _527 * _541;
    float _713 = fma(_711, _509, _695);
    float _715 = _539 * _665;
    float _717 = _539 * _713;
    float _719 = exp2(_715);
    float _721 = _671;
    if (!_709)
    {
        float _723 = -_659;
        float _725 = _723 + 1.0;
        _589 = _725;
    }
    float _727 = _589;
    float _729 = _623;
    float _731 = _727;
    float _733 = _727;
    if (!_709)
    {
        float _735 = abs(_659);
        float _737 = log2(_735);
        _729 = _737;
    }
    float _739 = _729;
    float _741 = 0.0;
    if (!_709)
    {
        float _743 = 1.0 / _727;
        _741 = _743;
    }
    float _745 = _741;
    float _747 = _281 * _539;
    float _749 = fma(_179, _719, _717);
    float _751 = fma(_179, _747, _157);
    if (!_709)
    {
        float _753 = _645 * _739;
        _591 = _753;
    }
    float _755 = _591;
    float _757 = _647 * _511;
    float _759 = _647 * _513;
    float _761 = fma(_661, _515, _757);
    float _763 = _755;
    if (!_709)
    {
        float _765 = exp2(_755);
        _763 = _765;
    }
    float _767 = _763;
    float _769 = fma(_661, _517, _759);
    float _771 = fma(_711, _519, _761);
    float _773 = fma(_711, _521, _769);
    float _775 = fma(_173, _747, _151);
    float _777 = _539 * _771;
    float _779 = fma(_185, _747, _163);
    float _781 = _539 * _773;
    float _783 = fma(_173, _719, _777);
    float _785 = fma(_185, _719, _781);
    float _787 = _767;
    float _789 = _769;
    if (!_709)
    {
        float _791 = -_767;
        float _793 = _791 + 1.0;
        _787 = _793;
    }
    float _795 = _787;
    float _797 = _795;
    float _799 = _795;
    if (!_709)
    {
        float _801 = _795 * _745;
        _651 = _801;
    }
    float _803 = _651;
    float _805 = _803 + _625;
    float _807 = _539 + _805;
    float _809 = _807 + _671;
    bool _811 = _633 != 1.0;
    bool _813 = isnan(_633);
    bool _815 = _811 || _813;
    bool _817 = isnan(1.0);
    bool _819 = _815 || _817;
    float _821 = _633;
    float _823 = _633;
    float _825 = _803;
    float _827 = _803;
    float _907;
    float _921;
    float _923;
    float _925;
    float _1011;
    float _1061;
    float _1077;
    float _1131;
    float _1139;
    float _1141;
    float _1145;
    float _1149;
    float _1153;
    float _1157;
    float _1161;
    float _1163;
    if (!_693)
    {
        if (_819)
        {
            _731 = 0.60000002384185791015625;
        }
        float _829 = _731;
        float _831 = _575;
        if (!_819)
        {
            float _833 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[9]);
            _831 = _833;
        }
        float _835 = _831;
        if (_819)
        {
            _821 = 0.4199999868869781494140625;
        }
        float _837 = _821;
        if (_819)
        {
            _653 = 0.23000000417232513427734375;
        }
        float _839 = _653;
        float _841 = _527;
        if (!_819)
        {
            float _843 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[8]);
            _841 = _843;
        }
        float _845 = _841;
        float _847 = _829;
        if (!_819)
        {
            float _849 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _847 = _849;
        }
        float _851 = _847;
        float _853 = _837;
        if (!_819)
        {
            float _855 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _853 = _855;
        }
        float _857 = _853;
        if (_819)
        {
            _309 = 0.1500000059604644775390625;
        }
        float _859 = _309;
        float _861 = _839;
        if (!_819)
        {
            float _863 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _861 = _863;
        }
        float _865 = _861;
        float _867 = _859;
        if (!_819)
        {
            float _869 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _867 = _869;
        }
        float _871 = _867;
        float _873 = _745;
        if (!_819)
        {
            float _875 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[10]);
            _873 = _875;
        }
        float _877 = _873;
        float _879 = _781;
        if (!_819)
        {
            float _881 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[11]);
            _879 = _881;
        }
        float _883 = _879;
        if (_819)
        {
            _797 = 0.60000002384185791015625;
        }
        float _885 = _797;
        float _887 = _537 * _851;
        float _889 = _885;
        float _891 = _851;
        if (!_819)
        {
            _889 = _851;
        }
        float _893 = _889;
        float _895 = _537 * _857;
        float _897 = 1.0 / _887;
        float _899 = _893;
        if (_819)
        {
            _891 = 0.4199999868869781494140625;
        }
        float _901 = _891;
        float _903 = _537 * _865;
        float _905 = _901;
        _907 = _835;
        if (!_819)
        {
            _905 = _857;
        }
        float _909 = _905;
        float _911 = _537 * _893;
        float _913 = 1.0 / _895;
        float _915 = _537 * _909;
        float _917 = _537 * _871;
        float _919 = _909;
        _921 = _845;
        _923 = _877;
        _925 = _883;
        if (_819)
        {
            _899 = 0.23000000417232513427734375;
        }
        float _927 = _899;
        float _929 = _927;
        if (!_819)
        {
            _929 = _865;
        }
        float _931 = _929;
        if (_819)
        {
            _919 = 0.1500000059604644775390625;
        }
        float _933 = _919;
        float _935 = 1.0 / _903;
        float _937 = _933;
        if (!_819)
        {
            _937 = _871;
        }
        float _939 = _937;
        float _941 = _809 * 6.283184051513671875;
        float _943 = _537 * _931;
        float _945 = _897 * _941;
        float _947 = 1.0 / _915;
        float _949 = _945 * 0.15915493667125701904296875;
        float _951 = 1.0 / _917;
        float _953 = _913 * _941;
        float _955 = _537 * _939;
        float _957 = 1.0 / _911;
        float _959 = _953 * 0.15915493667125701904296875;
        float _961 = _935 * _941;
        float _963 = _805 * _947;
        float _965 = 1.0 / _943;
        float _967 = _961 * 0.15915493667125701904296875;
        float _969 = _951 * _941;
        float _971 = _963 * 6.283184051513671875;
        float _973 = 1.0 / _955;
        float _975 = _969 * 0.15915493667125701904296875;
        float _977 = _805 * _957;
        float _979 = _971 * 0.15915493667125701904296875;
        float _981 = _959 * 6.283185482025146484375;
        float _983 = sin(_981);
        float _985 = _977 * 6.283184051513671875;
        float _987 = _805 * _965;
        float _989 = _971;
        float _991 = _987;
        float _993 = _965;
        if (_819)
        {
            _989 = 3.0;
        }
        float _995 = _989;
        float _997 = _985 * 0.15915493667125701904296875;
        float _999 = _987 * 6.283184051513671875;
        float _1001 = _979 * 6.283185482025146484375;
        float _1003 = sin(_1001);
        float _1005 = _805 * _973;
        float _1007 = _995;
        float _1009 = _999;
        _1011 = _973;
        if (!_819)
        {
            _1007 = _835;
        }
        float _1013 = _1007;
        float _1015 = _999 * 0.15915493667125701904296875;
        float _1017 = _1005 * 6.283184051513671875;
        float _1019 = _949 * 6.283185482025146484375;
        float _1021 = sin(_1019);
        float _1023 = _983 * _1013;
        float _1025 = _1017 * 0.15915493667125701904296875;
        float _1027 = _1017;
        float _1029 = _1023;
        if (_819)
        {
            _991 = 3.0;
        }
        float _1031 = _991;
        float _1033 = _997 * 6.283185482025146484375;
        float _1035 = sin(_1033);
        float _1037 = _1031;
        if (!_819)
        {
            _1037 = _835;
        }
        float _1039 = _1037;
        float _1041 = _1039;
        if (_819)
        {
            _1009 = 4.0;
        }
        float _1043 = _1009;
        float _1045 = _967 * 6.283185482025146484375;
        float _1047 = sin(_1045);
        float _1049 = _1043;
        if (!_819)
        {
            _1049 = _845;
        }
        float _1051 = _1049;
        float _1053 = _1003 * _1039;
        float _1055 = _1015 * 6.283185482025146484375;
        float _1057 = sin(_1055);
        float _1059 = _1051;
        _1061 = _1053;
        if (_819)
        {
            _1041 = 4.0;
        }
        float _1063 = _1041;
        float _1065 = _1063;
        if (!_819)
        {
            _1065 = _845;
        }
        float _1067 = _1065;
        float _1069 = _975 * 6.283185482025146484375;
        float _1071 = sin(_1069);
        float _1073 = fma(_1021, _1051, _1023);
        float _1075 = _1021;
        _1077 = _1073;
        if (_819)
        {
            _993 = 2.0;
        }
        float _1079 = _993;
        float _1081 = _1025 * 6.283185482025146484375;
        float _1083 = sin(_1081);
        float _1085 = _1079;
        if (_819)
        {
            _1059 = 2.0;
        }
        float _1087 = _1059;
        float _1089 = fma(_1035, _1067, _1053);
        float _1091 = _1087;
        if (!_819)
        {
            _1085 = _877;
        }
        float _1093 = _1085;
        float _1095 = _1093;
        if (!_819)
        {
            _1091 = _877;
        }
        float _1097 = _1091;
        float _1099 = _1097;
        if (_819)
        {
            _1027 = 1.5;
        }
        float _1101 = _1027;
        float _1103 = _1101;
        if (_819)
        {
            _1029 = 1.5;
        }
        float _1105 = _1029;
        float _1107 = fma(_1047, _1093, _1073);
        float _1109 = _1105;
        if (!_819)
        {
            _1103 = _883;
        }
        float _1111 = _1103;
        float _1113 = fma(_1057, _1097, _1089);
        if (!_819)
        {
            _1109 = _883;
        }
        float _1115 = _1109;
        float _1117 = fma(_1071, _1111, _1107);
        float _1119 = fma(_1083, _1115, _1113);
        float _1121 = _1117;
        float _1123 = _1115;
        float _1125 = _1083;
        float _1127 = _1071;
        if (_819)
        {
            _1099 = 1.5;
        }
        float _1129 = _1099;
        _1131 = _1129;
        if (_819)
        {
            _1095 = 2.0;
        }
        float _1133 = _1095;
        float _1135 = -_1119;
        float _1137 = _1117 + _1135;
        _1139 = _1133;
        _1141 = _1137;
        if (_819)
        {
            _1121 = 3.0;
        }
        float _1143 = _1121;
        _1145 = _1143;
        if (_819)
        {
            _1123 = 4.0;
        }
        float _1147 = _1123;
        _1149 = _1147;
        if (_819)
        {
            _1075 = 0.1500000059604644775390625;
        }
        float _1151 = _1075;
        _1153 = _1151;
        if (_819)
        {
            _1125 = 0.23000000417232513427734375;
        }
        float _1155 = _1125;
        _1157 = _1155;
        if (_819)
        {
            _1127 = 0.4199999868869781494140625;
        }
        float _1159 = _1127;
        _1161 = _1159;
        _1163 = 0.0;
        _1165 = true;
    }
    else
    {
        if (_819)
        {
            _823 = 0.4199999868869781494140625;
        }
        float _1167 = _823;
        float _1169 = _575;
        if (!_819)
        {
            float _1171 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[9]);
            _1169 = _1171;
        }
        float _1173 = _1169;
        if (_819)
        {
            _655 = 0.60000002384185791015625;
        }
        float _1175 = _655;
        if (_819)
        {
            _311 = 0.23000000417232513427734375;
        }
        float _1177 = _311;
        float _1179 = _527;
        if (!_819)
        {
            float _1181 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[8]);
            _1179 = _1181;
        }
        float _1183 = _1179;
        float _1185 = _1167;
        if (!_819)
        {
            float _1187 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _1185 = _1187;
        }
        float _1189 = _1185;
        float _1191 = _1175;
        if (!_819)
        {
            float _1193 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _1191 = _1193;
        }
        float _1195 = _1191;
        float _1197 = _1177;
        if (!_819)
        {
            float _1199 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _1197 = _1199;
        }
        float _1201 = _1197;
        if (_819)
        {
            _313 = 0.1500000059604644775390625;
        }
        float _1203 = _313;
        float _1205 = _745;
        if (!_819)
        {
            float _1207 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[10]);
            _1205 = _1207;
        }
        float _1209 = _1205;
        float _1211 = _1203;
        if (!_819)
        {
            float _1213 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _1211 = _1213;
        }
        float _1215 = _1211;
        float _1217 = _781;
        if (!_819)
        {
            float _1219 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[11]);
            _1217 = _1219;
        }
        float _1221 = _1217;
        if (_819)
        {
            _799 = 0.4199999868869781494140625;
        }
        float _1223 = _799;
        float _1225 = _1223;
        if (_819)
        {
            _733 = 0.4199999868869781494140625;
        }
        float _1227 = _733;
        float _1229 = _809 * 6.283184051513671875;
        float _1231 = _625 * 6.283184051513671875;
        float _1233 = _1227;
        float _1235 = _1189;
        if (!_819)
        {
            _1225 = _1189;
        }
        float _1237 = _1225;
        float _1239 = _1237;
        if (!_819)
        {
            _1233 = _1189;
        }
        float _1241 = _1233;
        float _1243 = _537 * _1237;
        float _1245 = _1241;
        if (_819)
        {
            _1239 = 0.4199999868869781494140625;
        }
        float _1247 = _1239;
        float _1249 = _537 * _1241;
        float _1251 = _1247;
        if (!_819)
        {
            _1251 = _1189;
        }
        float _1253 = _1251;
        float _1255 = _537 * _1189;
        float _1257 = _1253;
        if (_819)
        {
            _1245 = 0.60000002384185791015625;
        }
        float _1259 = _1245;
        float _1261 = _1259;
        float _1263 = _1195;
        if (!_819)
        {
            _1261 = _1195;
        }
        float _1265 = _1261;
        float _1267 = 1.0 / _1255;
        float _1269 = _537 * _1253;
        float _1271 = _1265;
        if (_819)
        {
            _1257 = 0.60000002384185791015625;
        }
        float _1273 = _1257;
        float _1275 = _537 * _1201;
        float _1277 = _1273;
        _907 = _1173;
        _923 = _1209;
        if (!_819)
        {
            _1277 = _1195;
        }
        float _1279 = _1277;
        float _1281 = _537 * _1265;
        if (_819)
        {
            _1271 = 0.23000000417232513427734375;
        }
        float _1283 = _1271;
        float _1285 = _1283;
        if (!_819)
        {
            _1285 = _1201;
        }
        float _1287 = _1285;
        float _1289 = 1.0 / _1275;
        float _1291 = _1287;
        if (_819)
        {
            _1235 = 0.60000002384185791015625;
        }
        float _1293 = _1235;
        float _1295 = _537 * _1195;
        float _1297 = _1293;
        if (!_819)
        {
            _1297 = _1195;
        }
        float _1299 = _1297;
        float _1301 = _537 * _1279;
        float _1303 = _537 * _1287;
        float _1305 = _1299;
        if (_819)
        {
            _1291 = 0.23000000417232513427734375;
        }
        float _1307 = _1291;
        float _1309 = 1.0 / _1295;
        float _1311 = _1307;
        if (!_819)
        {
            _1311 = _1201;
        }
        float _1313 = _1311;
        float _1315 = _537 * _1215;
        float _1317 = _537 * _1299;
        float _1319 = _1313;
        if (_819)
        {
            _1305 = 0.23000000417232513427734375;
        }
        float _1321 = _1305;
        float _1323 = _1321;
        if (!_819)
        {
            _1323 = _1201;
        }
        float _1325 = _1323;
        float _1327 = _537 * _1313;
        float _1329 = _1325;
        if (_819)
        {
            _1319 = 0.1500000059604644775390625;
        }
        float _1331 = _1319;
        float _1333 = 1.0 / _1317;
        float _1335 = _1331;
        if (!_819)
        {
            _1335 = _1215;
        }
        float _1337 = _1335;
        if (_819)
        {
            _1263 = 0.1500000059604644775390625;
        }
        float _1339 = _1263;
        float _1341 = _1339;
        if (!_819)
        {
            _1341 = _1215;
        }
        float _1343 = _1341;
        float _1345 = _537 * _1325;
        if (_819)
        {
            _1329 = 0.1500000059604644775390625;
        }
        float _1347 = _1329;
        float _1349 = 1.0 / _1315;
        float _1351 = _1347;
        if (!_819)
        {
            _1351 = _1215;
        }
        float _1353 = _1351;
        float _1355 = _537 * _1337;
        float _1357 = _1267 * _1229;
        float _1359 = 1.0 / _1243;
        float _1361 = _537 * _1353;
        float _1363 = 1.0 / _1281;
        float _1365 = 1.0 / _1249;
        float _1367 = _1357 * 0.15915493667125701904296875;
        float _1369 = _1309 * _1229;
        float _1371 = 1.0 / _1269;
        float _1373 = 1.0 / _1345;
        float _1375 = _1369 * 0.15915493667125701904296875;
        float _1377 = _1289 * _1229;
        float _1379 = 1.0 / _1361;
        float _1381 = _537 * _1343;
        float _1383 = 1.0 / _1301;
        float _1385 = _625 + _671;
        float _1387 = _1385 * 6.283184051513671875;
        float _1389 = _1377 * 0.15915493667125701904296875;
        float _1391 = _1349 * _1229;
        float _1393 = 1.0 / _1355;
        float _1395 = _805 * _1359;
        float _1397 = _1391 * 0.15915493667125701904296875;
        float _1399 = _1365 * _1387;
        float _1401 = 1.0 / _1381;
        float _1403 = _1395 * 6.283184051513671875;
        float _1405 = _1399 * 0.15915493667125701904296875;
        float _1407 = _1371 * _1231;
        float _1409 = _1367 * 6.283185482025146484375;
        float _1411 = sin(_1409);
        float _1413 = _1407 * 0.15915493667125701904296875;
        float _1415 = _1363 * _1387;
        float _1417 = 1.0 / _1327;
        float _1419 = _1415 * 0.15915493667125701904296875;
        float _1421 = _1383 * _1231;
        float _1423 = _1403 * 0.15915493667125701904296875;
        float _1425 = _1421 * 0.15915493667125701904296875;
        float _1427 = _1413 * 6.283185482025146484375;
        float _1429 = sin(_1427);
        float _1431 = _1421;
        float _1433 = _1405;
        _1163 = _1393;
        if (_819)
        {
            _1431 = 3.0;
        }
        float _1435 = _1431;
        float _1437 = _1435;
        if (!_819)
        {
            _1437 = _1173;
        }
        float _1439 = _1437;
        float _1441 = _1405 * 6.283185482025146484375;
        float _1443 = sin(_1441);
        float _1445 = _1373 * _1387;
        float _1447 = _1411 * _1439;
        float _1449 = _1423 * 6.283185482025146484375;
        float _1451 = sin(_1449);
        float _1453 = _1417 * _1231;
        float _1455 = _1439;
        float _1457 = _1445;
        if (_819)
        {
            _1455 = 3.0;
        }
        float _1459 = _1455;
        float _1461 = _1445 * 0.15915493667125701904296875;
        float _1463 = _1459;
        if (!_819)
        {
            _1463 = _1173;
        }
        float _1465 = _1463;
        if (_819)
        {
            _1457 = 3.0;
        }
        float _1467 = _1457;
        float _1469 = _1453 * 0.15915493667125701904296875;
        float _1471 = _1467;
        if (!_819)
        {
            _1471 = _1173;
        }
        float _1473 = _1471;
        float _1475 = 1.0 / _1303;
        float _1477 = _1473;
        if (_819)
        {
            _1433 = 3.0;
        }
        float _1479 = _1433;
        float _1481 = _1379 * _1387;
        float _1483 = _1479;
        if (!_819)
        {
            _1483 = _1173;
        }
        float _1485 = _1483;
        float _1487 = _1429 * _1465;
        float _1489 = _805 * _1333;
        float _1491 = _1443 * _1473;
        float _1493 = _1481 * 0.15915493667125701904296875;
        float _1495 = _1451 * _1485;
        float _1497 = _1375 * 6.283185482025146484375;
        float _1499 = sin(_1497);
        float _1501 = _1489 * 6.283184051513671875;
        float _1503 = _1501 * 0.15915493667125701904296875;
        float _1505 = _1419 * 6.283185482025146484375;
        float _1507 = sin(_1505);
        float _1509 = _805 * _1475;
        float _1511 = _1485;
        float _1513 = _1489;
        if (_819)
        {
            _1511 = 4.0;
        }
        float _1515 = _1511;
        float _1517 = _1515;
        _921 = _1183;
        _925 = _1221;
        if (!_819)
        {
            _1517 = _1183;
        }
        float _1519 = _1517;
        float _1521 = _1509 * 6.283184051513671875;
        float _1523 = _1503 * 6.283185482025146484375;
        float _1525 = sin(_1523);
        float _1527 = _1519;
        float _1529 = _1521;
        if (_819)
        {
            _1477 = 4.0;
        }
        float _1531 = _1477;
        float _1533 = _805 * _1401;
        float _1535 = _1531;
        if (!_819)
        {
            _1535 = _1183;
        }
        float _1537 = _1535;
        float _1539 = fma(_1499, _1519, _1447);
        float _1541 = _1425 * 6.283185482025146484375;
        float _1543 = sin(_1541);
        float _1545 = _1521 * 0.15915493667125701904296875;
        float _1547 = fma(_1507, _1537, _1491);
        float _1549 = _1533 * 6.283184051513671875;
        float _1551 = _1537;
        float _1553 = _1549;
        _1161 = _1539;
        if (_819)
        {
            _1551 = 4.0;
        }
        float _1555 = _1551;
        float _1557 = _1461 * 6.283185482025146484375;
        float _1559 = sin(_1557);
        float _1561 = _1555;
        if (!_819)
        {
            _1561 = _1183;
        }
        float _1563 = _1561;
        float _1565 = _1563;
        if (_819)
        {
            _1513 = 4.0;
        }
        float _1567 = _1513;
        float _1569 = _1393 * _1231;
        float _1571 = _1389 * 6.283185482025146484375;
        float _1573 = sin(_1571);
        float _1575 = _1569 * 0.15915493667125701904296875;
        float _1577 = _1549 * 0.15915493667125701904296875;
        float _1579 = _1469 * 6.283185482025146484375;
        float _1581 = sin(_1579);
        float _1583 = _1567;
        _593 = _1577;
        if (!_819)
        {
            _1583 = _1183;
        }
        float _1585 = _1583;
        float _1587 = fma(_1525, _1563, _1495);
        float _1589 = _1545 * 6.283185482025146484375;
        float _1591 = sin(_1589);
        float _1593 = fma(_1543, _1585, _1487);
        float _1595 = _1585;
        _1061 = _1587;
        if (_819)
        {
            _1527 = 2.0;
        }
        float _1597 = _1527;
        float _1599 = _1597;
        if (_819)
        {
            _1595 = 2.0;
        }
        float _1601 = _1595;
        float _1603 = _1397 * 6.283185482025146484375;
        float _1605 = sin(_1603);
        float _1607 = _1601;
        if (_819)
        {
            _1529 = 2.0;
        }
        float _1609 = _1529;
        float _1611 = _1609;
        if (!_819)
        {
            _1599 = _1209;
        }
        float _1613 = _1599;
        float _1615 = _1493 * 6.283185482025146484375;
        float _1617 = sin(_1615);
        float _1619 = _1613;
        if (!_819)
        {
            _1607 = _1209;
        }
        float _1621 = _1607;
        float _1623 = _1621;
        if (!_819)
        {
            _1611 = _1209;
        }
        float _1625 = _1611;
        float _1627 = _1575 * 6.283185482025146484375;
        float _1629 = sin(_1627);
        float _1631 = _1625;
        if (_819)
        {
            _1565 = 2.0;
        }
        float _1633 = _1565;
        float _1635 = _1577 * 6.283185482025146484375;
        float _1637 = sin(_1635);
        float _1639 = _1633;
        if (!_819)
        {
            _1639 = _1209;
        }
        float _1641 = _1639;
        float _1643 = fma(_1573, _1613, _1539);
        float _1645 = fma(_1559, _1621, _1547);
        float _1647 = fma(_1581, _1625, _1593);
        _1011 = _1645;
        _789 = _1647;
        if (_819)
        {
            _1553 = 1.5;
        }
        float _1649 = _1553;
        float _1651 = _1649;
        if (_819)
        {
            _1619 = 1.5;
        }
        float _1653 = _1619;
        float _1655 = _1653;
        if (_819)
        {
            _1623 = 1.5;
        }
        float _1657 = _1623;
        float _1659 = _1657;
        if (_819)
        {
            _1631 = 1.5;
        }
        float _1661 = _1631;
        float _1663 = fma(_1591, _1641, _1587);
        float _1665 = _1661;
        float _1667 = _1591;
        if (!_819)
        {
            _1651 = _1221;
        }
        float _1669 = _1651;
        if (!_819)
        {
            _1659 = _1221;
        }
        float _1671 = _1659;
        float _1673 = _1671;
        if (!_819)
        {
            _1665 = _1221;
        }
        float _1675 = _1665;
        if (!_819)
        {
            _1655 = _1221;
        }
        float _1677 = _1655;
        float _1679 = fma(_1605, _1669, _1643);
        float _1681 = fma(_1617, _1671, _1645);
        float _1683 = fma(_1629, _1675, _1647);
        float _1685 = fma(_1637, _1677, _1663);
        float _1687 = -_1681;
        float _1689 = _1687 + _1683;
        float _1691 = -_1685;
        float _1693 = _1679 + _1691;
        float _1695 = _1677;
        float _1697 = _1693;
        float _1699 = _1685;
        float _1701 = _1637;
        _1077 = _1605;
        if (_819)
        {
            _1673 = 1.5;
        }
        float _1703 = _1673;
        _1131 = _1703;
        if (_819)
        {
            _1695 = 2.0;
        }
        float _1705 = _1695;
        float _1707 = _1693 + _1689;
        _1139 = _1705;
        _1141 = _1707;
        if (_819)
        {
            _1697 = 3.0;
        }
        float _1709 = _1697;
        _1145 = _1709;
        if (_819)
        {
            _1699 = 4.0;
        }
        float _1711 = _1699;
        _1149 = _1711;
        if (_819)
        {
            _1701 = 0.1500000059604644775390625;
        }
        float _1713 = _1701;
        _1153 = _1713;
        if (_819)
        {
            _1667 = 0.23000000417232513427734375;
        }
        float _1715 = _1667;
        _1157 = _1715;
        if (_819)
        {
            _1161 = 0.4199999868869781494140625;
        }
    }
    _1165 = false;
    float _1717 = _1161;
    float _1719 = _1077;
    float _1721 = _1157;
    float _1723 = _1011;
    float _1725 = _1153;
    float _1727 = _789;
    float _1729 = _593;
    float _1731 = _1061;
    float _1733 = _1145;
    float _1735 = _907;
    float _1737 = _1149;
    float _1739 = _921;
    float _1741 = _1139;
    float _1743 = _923;
    float _1745 = _1131;
    float _1747 = _925;
    float _1749 = _1163;
    float _1751 = _1141;
    float _1753 = _803 + _629;
    float _1755 = _539 + _1753;
    float _1757 = _1755 + _671;
    float _1759 = _1719;
    float _1761 = _1723;
    float _1763 = _1727;
    float _1765 = _1729;
    float _1767 = _1731;
    float _1769 = _1753;
    float _1771 = _1723;
    float _1773 = _1727;
    float _1775 = _1729;
    float _1777 = _1749;
    float _1779 = _1719;
    float _1781 = _1731;
    float _1783 = _1753;
    float _1785 = _1717;
    float _1787 = _1721;
    float _1789 = _1725;
    float _1791 = _1733;
    float _1793 = _1737;
    float _1795 = _1741;
    float _1797 = _1745;
    float _1799 = _1717;
    float _1801 = _1721;
    float _1803 = _1725;
    float _1805 = _1741;
    float _1807 = _1737;
    float _1809 = _1733;
    float _1811 = _1745;
    float _2039;
    float _2043;
    float _2067;
    float _2069;
    float _2071;
    if (!_693)
    {
        if (_819)
        {
            _1759 = _1717;
        }
        float _1813 = _1759;
        if (_819)
        {
            _1761 = 0.60000002384185791015625;
        }
        float _1815 = _1761;
        float _1817 = _1813;
        if (!_819)
        {
            float _1819 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _1817 = _1819;
        }
        float _1821 = _1817;
        if (_819)
        {
            _1763 = _1721;
        }
        float _1823 = _1763;
        float _1825 = _1815;
        if (!_819)
        {
            float _1827 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _1825 = _1827;
        }
        float _1829 = _1825;
        if (_819)
        {
            _1765 = _1725;
        }
        float _1831 = _1765;
        float _1833 = _1823;
        if (!_819)
        {
            float _1835 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _1833 = _1835;
        }
        float _1837 = _1833;
        float _1839 = _1831;
        if (!_819)
        {
            float _1841 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _1839 = _1841;
        }
        float _1843 = _1839;
        if (_819)
        {
            _1767 = _1717;
        }
        float _1845 = _1767;
        float _1847 = _1757 * 6.283184051513671875;
        float _1849 = _537 * _1821;
        float _1851 = _1845;
        float _1853 = _1821;
        if (!_819)
        {
            _1851 = _1821;
        }
        float _1855 = _1851;
        float _1857 = _1855;
        if (_819)
        {
            _1853 = 0.60000002384185791015625;
        }
        float _1859 = _1853;
        float _1861 = 1.0 / _1849;
        float _1863 = _537 * _1829;
        float _1865 = _537 * _1855;
        float _1867 = _1859;
        if (!_819)
        {
            _1867 = _1829;
        }
        float _1869 = _1867;
        float _1871 = _537 * _1837;
        float _1873 = _1869;
        if (_819)
        {
            _1857 = _1721;
        }
        float _1875 = _1857;
        float _1877 = _1875;
        if (!_819)
        {
            _1877 = _1837;
        }
        float _1879 = _1877;
        float _1881 = 1.0 / _1863;
        float _1883 = _537 * _1843;
        float _1885 = _537 * _1869;
        if (_819)
        {
            _1873 = _1725;
        }
        float _1887 = _1873;
        float _1889 = _1887;
        if (!_819)
        {
            _1889 = _1843;
        }
        float _1891 = _1889;
        float _1893 = 1.0 / _1871;
        float _1895 = _1861 * _1847;
        float _1897 = _537 * _1891;
        float _1899 = _1895 * 0.15915493667125701904296875;
        float _1901 = 1.0 / _1865;
        float _1903 = _537 * _1879;
        float _1905 = _1881 * _1847;
        float _1907 = _1905 * 0.15915493667125701904296875;
        float _1909 = 1.0 / _1883;
        float _1911 = _1893 * _1847;
        float _1913 = _1911 * 0.15915493667125701904296875;
        float _1915 = 1.0 / _1885;
        float _1917 = 1.0 / _1903;
        float _1919 = _1909 * _1847;
        float _1921 = _1919 * 0.15915493667125701904296875;
        float _1923 = 1.0 / _1897;
        float _1925 = _1753 * _1901;
        float _1927 = _1753 * _1915;
        float _1929 = _1925 * 6.283184051513671875;
        float _1931 = _1899 * 6.283185482025146484375;
        float _1933 = sin(_1931);
        float _1935 = _1927 * 6.283184051513671875;
        float _1937 = _1753 * _1917;
        float _1939 = _1935 * 0.15915493667125701904296875;
        float _1941 = _1937 * 6.283184051513671875;
        float _1943 = _1935;
        float _1945 = _1937;
        if (_819)
        {
            _1943 = _1733;
        }
        float _1947 = _1943;
        float _1949 = _1907 * 6.283185482025146484375;
        float _1951 = sin(_1949);
        float _1953 = _1929 * 0.15915493667125701904296875;
        float _1955 = _1753 * _1923;
        float _1957 = _1941 * 0.15915493667125701904296875;
        float _1959 = _1947;
        if (_819)
        {
            _1945 = _1733;
        }
        float _1961 = _1945;
        float _1963 = _1955 * 6.283184051513671875;
        float _1965 = _1961;
        if (!_819)
        {
            _1959 = _1735;
        }
        float _1967 = _1959;
        float _1969 = _1953 * 6.283185482025146484375;
        float _1971 = sin(_1969);
        float _1973 = _1967;
        if (!_819)
        {
            _1965 = _1735;
        }
        float _1975 = _1965;
        float _1977 = _1963 * 0.15915493667125701904296875;
        float _1979 = _1975;
        if (_819)
        {
            _1769 = _1737;
        }
        float _1981 = _1769;
        float _1983 = _1933 * _1967;
        float _1985 = _1981;
        float _1987 = _1933;
        if (!_819)
        {
            _1985 = _1739;
        }
        float _1989 = _1985;
        float _1991 = _1989;
        if (_819)
        {
            _1987 = _1741;
        }
        float _1993 = _1987;
        float _1995 = _1939 * 6.283185482025146484375;
        float _1997 = sin(_1995);
        float _1999 = _1993;
        if (!_819)
        {
            _1999 = _1743;
        }
        float _2001 = _1999;
        float _2003 = fma(_1951, _1989, _1983);
        float _2005 = _1951;
        if (_819)
        {
            _1991 = _1741;
        }
        float _2007 = _1991;
        float _2009 = _2007;
        if (!_819)
        {
            _2009 = _1743;
        }
        float _2011 = _2009;
        if (_819)
        {
            _2005 = _1745;
        }
        float _2013 = _2005;
        float _2015 = _1913 * 6.283185482025146484375;
        float _2017 = sin(_2015);
        float _2019 = _1971 * _1975;
        float _2021 = _2013;
        if (_819)
        {
            _1979 = _1737;
        }
        float _2023 = _1979;
        float _2025 = _2023;
        if (!_819)
        {
            _2025 = _1739;
        }
        float _2027 = _2025;
        if (_819)
        {
            _1973 = _1745;
        }
        float _2029 = _1973;
        float _2031 = _1957 * 6.283185482025146484375;
        float _2033 = sin(_2031);
        float _2035 = fma(_1997, _2027, _2019);
        float _2037 = _2029;
        _2039 = _1997;
        if (!_819)
        {
            _2021 = _1747;
        }
        float _2041 = _2021;
        _2043 = _2041;
        if (!_819)
        {
            _2037 = _1747;
        }
        float _2045 = _2037;
        float _2047 = _1921 * 6.283185482025146484375;
        float _2049 = sin(_2047);
        float _2051 = fma(_2017, _2001, _2003);
        float _2053 = _1977 * 6.283185482025146484375;
        float _2055 = sin(_2053);
        float _2057 = fma(_2033, _2011, _2035);
        float _2059 = fma(_2049, _2041, _2051);
        float _2061 = fma(_2055, _2045, _2057);
        float _2063 = -_2061;
        float _2065 = _2059 + _2063;
        _2067 = _2045;
        _2069 = _2051;
        _2071 = _2065;
        _2073 = true;
    }
    else
    {
        if (_819)
        {
            _1771 = _1717;
        }
        float _2075 = _1771;
        if (_819)
        {
            _1773 = 0.60000002384185791015625;
        }
        float _2077 = _1773;
        float _2079 = _2075;
        if (!_819)
        {
            float _2081 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _2079 = _2081;
        }
        float _2083 = _2079;
        if (_819)
        {
            _1775 = _1721;
        }
        float _2085 = _1775;
        float _2087 = _2077;
        if (!_819)
        {
            float _2089 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _2087 = _2089;
        }
        float _2091 = _2087;
        if (_819)
        {
            _1777 = _1725;
        }
        float _2093 = _1777;
        float _2095 = _2085;
        if (!_819)
        {
            float _2097 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _2095 = _2097;
        }
        float _2099 = _2095;
        float _2101 = _2093;
        if (!_819)
        {
            float _2103 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _2101 = _2103;
        }
        float _2105 = _2101;
        if (_819)
        {
            _1779 = _1717;
        }
        float _2107 = _1779;
        float _2109 = _1757 * 6.283184051513671875;
        float _2111 = _2107;
        if (_819)
        {
            _1781 = _1717;
        }
        float _2113 = _1781;
        float _2115 = _2113;
        float _2117 = _2083;
        if (!_819)
        {
            _2111 = _2083;
        }
        float _2119 = _2111;
        float _2121 = _537 * _2083;
        float _2123 = _2119;
        if (!_819)
        {
            _2115 = _2083;
        }
        float _2125 = _2115;
        float _2127 = _537 * _2091;
        float _2129 = 1.0 / _2121;
        float _2131 = _537 * _2119;
        float _2133 = _2125;
        float _2135 = _2091;
        if (_819)
        {
            _2123 = _1717;
        }
        float _2137 = _2123;
        float _2139 = _537 * _2099;
        float _2141 = _2137;
        float _2143 = _2099;
        if (!_819)
        {
            _2141 = _2083;
        }
        float _2145 = _2141;
        float _2147 = _2145;
        if (_819)
        {
            _2117 = 0.60000002384185791015625;
        }
        float _2149 = _2117;
        float _2151 = _537 * _2105;
        float _2153 = 1.0 / _2127;
        float _2155 = _537 * _2125;
        float _2157 = _2149;
        if (_819)
        {
            _2133 = 0.60000002384185791015625;
        }
        float _2159 = _2133;
        float _2161 = _537 * _2145;
        float _2163 = _2159;
        if (!_819)
        {
            _2163 = _2091;
        }
        float _2165 = _2163;
        float _2167 = _2165;
        if (_819)
        {
            _2147 = 0.60000002384185791015625;
        }
        float _2169 = _2147;
        float _2171 = _2169;
        if (!_819)
        {
            _2157 = _2091;
        }
        float _2173 = _2157;
        float _2175 = _537 * _2165;
        if (!_819)
        {
            _2171 = _2091;
        }
        float _2177 = _2171;
        float _2179 = 1.0 / _2139;
        if (_819)
        {
            _2167 = _1721;
        }
        float _2181 = _2167;
        float _2183 = _537 * _2173;
        float _2185 = _2181;
        if (!_819)
        {
            _2185 = _2099;
        }
        float _2187 = _2185;
        float _2189 = _2187;
        if (_819)
        {
            _2135 = _1721;
        }
        float _2191 = _2135;
        float _2193 = _2191;
        if (!_819)
        {
            _2193 = _2099;
        }
        float _2195 = _2193;
        float _2197 = 1.0 / _2155;
        float _2199 = _537 * _2177;
        float _2201 = _537 * _2187;
        float _2203 = _2195;
        if (_819)
        {
            _2189 = _1721;
        }
        float _2205 = _2189;
        float _2207 = _2205;
        if (!_819)
        {
            _2207 = _2099;
        }
        float _2209 = _2207;
        if (_819)
        {
            _2143 = _1725;
        }
        float _2211 = _2143;
        float _2213 = 1.0 / _2175;
        float _2215 = _537 * _2195;
        float _2217 = _2211;
        if (_819)
        {
            _2203 = _1725;
        }
        float _2219 = _2203;
        float _2221 = _2219;
        if (!_819)
        {
            _2221 = _2105;
        }
        float _2223 = _2221;
        float _2225 = _2223;
        if (!_819)
        {
            _2217 = _2105;
        }
        float _2227 = _2217;
        float _2229 = 1.0 / _2151;
        float _2231 = _537 * _2209;
        float _2233 = _537 * _2223;
        if (_819)
        {
            _2225 = _1725;
        }
        float _2235 = _2225;
        float _2237 = _537 * _2227;
        float _2239 = _2235;
        if (!_819)
        {
            _2239 = _2105;
        }
        float _2241 = _2239;
        float _2243 = 1.0 / _2231;
        float _2245 = _537 * _2241;
        float _2247 = 1.0 / _2161;
        float _2249 = _2129 * _2109;
        float _2251 = _2249 * 0.15915493667125701904296875;
        float _2253 = _2153 * _2109;
        float _2255 = 1.0 / _2131;
        float _2257 = _2253 * 0.15915493667125701904296875;
        float _2259 = _2179 * _2109;
        float _2261 = _2259 * 0.15915493667125701904296875;
        float _2263 = 1.0 / _2215;
        float _2265 = _2229 * _2109;
        float _2267 = _629 * 6.283184051513671875;
        float _2269 = _2265 * 0.15915493667125701904296875;
        float _2271 = 1.0 / _2199;
        float _2273 = _629 + _671;
        float _2275 = _2247 * _2267;
        float _2277 = _2273 * 6.283184051513671875;
        float _2279 = _2275 * 0.15915493667125701904296875;
        float _2281 = 1.0 / _2245;
        float _2283 = _2197 * _2277;
        float _2285 = _2213 * _2277;
        float _2287 = _2251 * 6.283185482025146484375;
        float _2289 = sin(_2287);
        float _2291 = _2283 * 0.15915493667125701904296875;
        float _2293 = _1753 * _2255;
        float _2295 = _2293 * 6.283184051513671875;
        float _2297 = 1.0 / _2237;
        float _2299 = _2295 * 0.15915493667125701904296875;
        float _2301 = _2263 * _2277;
        float _2303 = _2301 * 0.15915493667125701904296875;
        float _2305 = _2279 * 6.283185482025146484375;
        float _2307 = sin(_2305);
        float _2309 = _2285 * 0.15915493667125701904296875;
        float _2311 = _2271 * _2267;
        float _2313 = _2301;
        float _2315 = _2311;
        float _2317 = _2289;
        if (_819)
        {
            _2313 = _1733;
        }
        float _2319 = _2313;
        float _2321 = _2319;
        if (!_819)
        {
            _2321 = _1735;
        }
        float _2323 = _2321;
        float _2325 = _2311 * 0.15915493667125701904296875;
        float _2327 = _2323;
        if (_819)
        {
            _2315 = _1733;
        }
        float _2329 = _2315;
        float _2331 = 1.0 / _2183;
        float _2333 = _2329;
        float _2335 = _2331;
        if (!_819)
        {
            _2333 = _1735;
        }
        float _2337 = _2333;
        float _2339 = _2243 * _2267;
        float _2341 = _2339 * 0.15915493667125701904296875;
        float _2343 = _2297 * _2277;
        float _2345 = _2291 * 6.283185482025146484375;
        float _2347 = sin(_2345);
        float _2349 = _2343 * 0.15915493667125701904296875;
        float _2351 = _2299 * 6.283185482025146484375;
        float _2353 = sin(_2351);
        float _2355 = _2309 * 6.283185482025146484375;
        float _2357 = sin(_2355);
        float _2359 = _2347 * _2323;
        float _2361 = _2337;
        if (_819)
        {
            _2327 = _1737;
        }
        float _2363 = _2327;
        float _2365 = _2363;
        if (!_819)
        {
            _2365 = _1739;
        }
        float _2367 = _2365;
        float _2369 = 1.0 / _2201;
        float _2371 = _2289 * _2337;
        if (_819)
        {
            _2361 = _1733;
        }
        float _2373 = _2361;
        float _2375 = _2373;
        if (!_819)
        {
            _2375 = _1735;
        }
        float _2377 = _2375;
        if (_819)
        {
            _2317 = _1733;
        }
        float _2379 = _2317;
        float _2381 = 1.0 / _2233;
        float _2383 = _2379;
        if (!_819)
        {
            _2383 = _1735;
        }
        float _2385 = _2383;
        float _2387 = _2307 * _2377;
        float _2389 = _1753 * _2331;
        float _2391 = _2389;
        if (_819)
        {
            _2335 = _1737;
        }
        float _2393 = _2335;
        float _2395 = fma(_2357, _2367, _2359);
        float _2397 = _2353 * _2385;
        float _2399 = _2389 * 6.283184051513671875;
        float _2401 = _2325 * 6.283185482025146484375;
        float _2403 = sin(_2401);
        float _2405 = _2393;
        if (_819)
        {
            _2391 = _1737;
        }
        float _2407 = _2391;
        float _2409 = _1753 * _2369;
        float _2411 = _2407;
        float _2413 = _2409;
        if (!_819)
        {
            _2411 = _1739;
        }
        float _2415 = _2411;
        float _2417 = _2399 * 0.15915493667125701904296875;
        if (!_819)
        {
            _2405 = _1739;
        }
        float _2419 = _2405;
        float _2421 = _2281 * _2267;
        float _2423 = _2257 * 6.283185482025146484375;
        float _2425 = sin(_2423);
        float _2427 = _1753 * _2381;
        float _2429 = _2421 * 0.15915493667125701904296875;
        float _2431 = _2381;
        if (_819)
        {
            _2431 = _1741;
        }
        float _2433 = _2431;
        float _2435 = _2433;
        if (_819)
        {
            _1783 = _1741;
        }
        float _2437 = _1783;
        float _2439 = _2437;
        if (!_819)
        {
            _2435 = _1743;
        }
        float _2441 = _2435;
        float _2443 = fma(_2403, _2415, _2387);
        float _2445 = _2409 * 6.283184051513671875;
        float _2447 = _2417 * 6.283185482025146484375;
        float _2449 = sin(_2447);
        float _2451 = _2445;
        float _2453 = _2441;
        if (_819)
        {
            _2413 = _1737;
        }
        float _2455 = _2413;
        float _2457 = _2445 * 0.15915493667125701904296875;
        float _2459 = _2455;
        if (!_819)
        {
            _2459 = _1739;
        }
        float _2461 = _2459;
        float _2463 = fma(_2425, _2419, _2371);
        float _2465 = _2427 * 6.283184051513671875;
        float _2467 = _2261 * 6.283185482025146484375;
        float _2469 = sin(_2467);
        float _2471 = _2461;
        float _2473 = _2465;
        if (_819)
        {
            _2451 = _1741;
        }
        float _2475 = _2451;
        float _2477 = _2465 * 0.15915493667125701904296875;
        float _2479 = _2475;
        if (!_819)
        {
            _2439 = _1743;
        }
        float _2481 = _2439;
        float _2483 = _2481;
        if (!_819)
        {
            _2479 = _1743;
        }
        float _2485 = _2479;
        float _2487 = _2303 * 6.283185482025146484375;
        float _2489 = sin(_2487);
        float _2491 = fma(_2449, _2461, _2397);
        float _2493 = _2485;
        if (_819)
        {
            _2471 = _1741;
        }
        float _2495 = _2471;
        float _2497 = _2495;
        if (!_819)
        {
            _2497 = _1743;
        }
        float _2499 = _2497;
        _2067 = _2499;
        if (_819)
        {
            _2473 = _1745;
        }
        float _2501 = _2473;
        float _2503 = _2341 * 6.283185482025146484375;
        float _2505 = sin(_2503);
        float _2507 = fma(_2469, _2441, _2463);
        float _2509 = _2501;
        if (_819)
        {
            _2453 = _1745;
        }
        float _2511 = _2453;
        float _2513 = _2511;
        if (!_819)
        {
            _2509 = _1747;
        }
        float _2515 = _2509;
        _2069 = _2515;
        if (!_819)
        {
            _2513 = _1747;
        }
        float _2517 = _2513;
        float _2519 = _2457 * 6.283185482025146484375;
        float _2521 = sin(_2519);
        float _2523 = fma(_2489, _2481, _2395);
        _2043 = _2517;
        if (_819)
        {
            _2483 = _1745;
        }
        float _2525 = _2483;
        float _2527 = _2525;
        if (!_819)
        {
            _2527 = _1747;
        }
        float _2529 = _2527;
        float _2531 = _2269 * 6.283185482025146484375;
        float _2533 = sin(_2531);
        float _2535 = fma(_2505, _2485, _2443);
        if (_819)
        {
            _2493 = _1745;
        }
        float _2537 = _2493;
        float _2539 = _2537;
        if (!_819)
        {
            _2539 = _1747;
        }
        float _2541 = _2539;
        float _2543 = _2349 * 6.283185482025146484375;
        float _2545 = sin(_2543);
        float _2547 = fma(_2521, _2499, _2491);
        float _2549 = _2429 * 6.283185482025146484375;
        float _2551 = sin(_2549);
        float _2553 = fma(_2533, _2515, _2507);
        float _2555 = _2477 * 6.283185482025146484375;
        float _2557 = sin(_2555);
        float _2559 = fma(_2545, _2529, _2523);
        float _2561 = fma(_2551, _2541, _2535);
        float _2563 = -_2559;
        float _2565 = _2563 + _2561;
        float _2567 = fma(_2557, _2517, _2547);
        float _2569 = -_2567;
        float _2571 = _2553 + _2569;
        float _2573 = _2571 + _2565;
        _2039 = _2565;
        _2071 = _2573;
    }
    _2073 = false;
    float _2575 = _2067;
    float _2577 = _2069;
    float _2579 = _2039;
    float _2581 = _2043;
    float _2583 = _2071;
    float _2585 = _803 + _631;
    float _2587 = _539 + _2585;
    float _2589 = _2587 + _671;
    float _2591 = _2575;
    float _2593 = _2575;
    float _2595 = _2581;
    float _2597 = _2577;
    float _2599 = _2579;
    float _2601 = _2585;
    float _2815;
    if (!_693)
    {
        if (_819)
        {
            _721 = _1717;
        }
        float _2603 = _721;
        if (_819)
        {
            _595 = 0.60000002384185791015625;
        }
        float _2605 = _595;
        float _2607 = _2603;
        if (!_819)
        {
            float _2609 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _2607 = _2609;
        }
        float _2611 = _2607;
        if (_819)
        {
            _825 = _1721;
        }
        float _2613 = _825;
        float _2615 = _2605;
        if (!_819)
        {
            float _2617 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _2615 = _2617;
        }
        float _2619 = _2615;
        if (_819)
        {
            _2591 = _1725;
        }
        float _2621 = _2591;
        float _2623 = _2613;
        if (!_819)
        {
            float _2625 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _2623 = _2625;
        }
        float _2627 = _2623;
        float _2629 = _2621;
        if (!_819)
        {
            float _2631 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _2629 = _2631;
        }
        float _2633 = _2629;
        float _2635 = _537 * _2611;
        float _2637 = _2611;
        if (!_819)
        {
            _1785 = _2611;
        }
        float _2639 = _1785;
        if (_819)
        {
            _2637 = 0.60000002384185791015625;
        }
        float _2641 = _2637;
        float _2643 = _537 * _2619;
        float _2645 = _2641;
        if (!_819)
        {
            _2645 = _2619;
        }
        float _2647 = _2645;
        float _2649 = 1.0 / _2635;
        float _2651 = _537 * _2639;
        float _2653 = _537 * _2627;
        if (!_819)
        {
            _1787 = _2627;
        }
        float _2655 = _1787;
        float _2657 = _537 * _2647;
        float _2659 = _537 * _2633;
        if (!_819)
        {
            _1789 = _2633;
        }
        float _2661 = _1789;
        float _2663 = 1.0 / _2643;
        float _2665 = _2589 * 6.283184051513671875;
        float _2667 = _537 * _2655;
        float _2669 = _537 * _2661;
        float _2671 = 1.0 / _2653;
        float _2673 = _2649 * _2665;
        float _2675 = _2673 * 0.15915493667125701904296875;
        float _2677 = 1.0 / _2659;
        float _2679 = _2663 * _2665;
        float _2681 = _2679 * 0.15915493667125701904296875;
        float _2683 = 1.0 / _2651;
        float _2685 = _2671 * _2665;
        float _2687 = 1.0 / _2657;
        float _2689 = 1.0 / _2667;
        float _2691 = _2585 * _2683;
        float _2693 = _2691 * 6.283184051513671875;
        float _2695 = 1.0 / _2669;
        float _2697 = _2685 * 0.15915493667125701904296875;
        float _2699 = _2677 * _2665;
        float _2701 = _2693 * 0.15915493667125701904296875;
        float _2703 = _2699 * 0.15915493667125701904296875;
        float _2705 = _2585 * _2687;
        float _2707 = _2675 * 6.283185482025146484375;
        float _2709 = sin(_2707);
        float _2711 = _2687;
        if (_819)
        {
            _2711 = _1741;
        }
        float _2713 = _2711;
        float _2715 = _2705 * 6.283184051513671875;
        float _2717 = _2585 * _2689;
        float _2719 = _2713;
        float _2721 = _2715;
        if (!_819)
        {
            _2719 = _1743;
        }
        float _2723 = _2719;
        float _2725 = _2715 * 0.15915493667125701904296875;
        float _2727 = _2585 * _2695;
        float _2729 = _2701 * 6.283185482025146484375;
        float _2731 = sin(_2729);
        float _2733 = _2717 * 6.283184051513671875;
        float _2735 = _2733;
        if (_819)
        {
            _2721 = _1733;
        }
        float _2737 = _2721;
        float _2739 = _2727 * 6.283184051513671875;
        float _2741 = _2737;
        if (!_819)
        {
            _2741 = _1735;
        }
        float _2743 = _2741;
        float _2745 = _2733 * 0.15915493667125701904296875;
        float _2747 = _2743;
        if (!_819)
        {
            _1791 = _1735;
        }
        float _2749 = _1791;
        float _2751 = _2739 * 0.15915493667125701904296875;
        float _2753 = _2681 * 6.283185482025146484375;
        float _2755 = sin(_2753);
        if (_819)
        {
            _2735 = _1737;
        }
        float _2757 = _2735;
        float _2759 = _2709 * _2743;
        float _2761 = _2757;
        if (!_819)
        {
            _2761 = _1739;
        }
        float _2763 = _2761;
        if (!_819)
        {
            _1793 = _1739;
        }
        float _2765 = _1793;
        if (!_819)
        {
            _1795 = _1743;
        }
        float _2767 = _1795;
        float _2769 = _2725 * 6.283185482025146484375;
        float _2771 = sin(_2769);
        float _2773 = _2731 * _2749;
        if (_819)
        {
            _2747 = _1745;
        }
        float _2775 = _2747;
        float _2777 = _2775;
        if (!_819)
        {
            _2777 = _1747;
        }
        float _2779 = _2777;
        if (!_819)
        {
            _1797 = _1747;
        }
        float _2781 = _1797;
        float _2783 = _2697 * 6.283185482025146484375;
        float _2785 = sin(_2783);
        float _2787 = fma(_2755, _2763, _2759);
        float _2789 = _2745 * 6.283185482025146484375;
        float _2791 = sin(_2789);
        float _2793 = fma(_2771, _2765, _2773);
        float _2795 = _2703 * 6.283185482025146484375;
        float _2797 = sin(_2795);
        float _2799 = fma(_2785, _2723, _2787);
        float _2801 = _2751 * 6.283185482025146484375;
        float _2803 = sin(_2801);
        float _2805 = fma(_2791, _2767, _2793);
        float _2807 = fma(_2797, _2779, _2799);
        float _2809 = fma(_2803, _2781, _2805);
        float _2811 = -_2809;
        float _2813 = _2807 + _2811;
        _2815 = _2813;
        _2817 = true;
    }
    else
    {
        if (_819)
        {
            _2593 = _1717;
        }
        float _2819 = _2593;
        if (_819)
        {
            _2595 = 0.60000002384185791015625;
        }
        float _2821 = _2595;
        float _2823 = _2819;
        if (!_819)
        {
            float _2825 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _2823 = _2825;
        }
        float _2827 = _2823;
        if (_819)
        {
            _2597 = _1721;
        }
        float _2829 = _2597;
        float _2831 = _2821;
        if (!_819)
        {
            float _2833 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _2831 = _2833;
        }
        float _2835 = _2831;
        if (_819)
        {
            _2599 = _1725;
        }
        float _2837 = _2599;
        float _2839 = _2829;
        if (!_819)
        {
            float _2841 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _2839 = _2841;
        }
        float _2843 = _2839;
        float _2845 = _2837;
        if (!_819)
        {
            float _2847 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _2845 = _2847;
        }
        float _2849 = _2845;
        if (_819)
        {
            _827 = _1717;
        }
        float _2851 = _827;
        float _2853 = _2589 * 6.283184051513671875;
        float _2855 = _2851;
        if (_819)
        {
            _597 = _1717;
        }
        float _2857 = _597;
        float _2859 = _631 + _671;
        float _2861 = _631 * 6.283184051513671875;
        float _2863 = _2859 * 6.283184051513671875;
        float _2865 = _537 * _2827;
        float _2867 = _2857;
        float _2869 = _2827;
        float _2871 = _2863;
        if (!_819)
        {
            _2855 = _2827;
        }
        float _2873 = _2855;
        float _2875 = _2873;
        if (!_819)
        {
            _1799 = _2827;
        }
        float _2877 = _1799;
        float _2879 = 1.0 / _2865;
        if (!_819)
        {
            _2867 = _2827;
        }
        float _2881 = _2867;
        float _2883 = _537 * _2835;
        float _2885 = _2835;
        if (_819)
        {
            _2869 = 0.60000002384185791015625;
        }
        float _2887 = _2869;
        float _2889 = _537 * _2877;
        float _2891 = _2887;
        if (!_819)
        {
            _2891 = _2835;
        }
        float _2893 = _2891;
        float _2895 = _537 * _2843;
        float _2897 = _537 * _2881;
        float _2899 = 1.0 / _2883;
        float _2901 = _537 * _2873;
        float _2903 = _2893;
        if (_819)
        {
            _2875 = 0.60000002384185791015625;
        }
        float _2905 = _2875;
        float _2907 = _537 * _2849;
        float _2909 = _2905;
        if (!_819)
        {
            _2909 = _2835;
        }
        float _2911 = _2909;
        float _2913 = 1.0 / _2895;
        float _2915 = _537 * _2911;
        float _2917 = _2911;
        if (_819)
        {
            _2917 = 0.60000002384185791015625;
        }
        float _2919 = _2917;
        float _2921 = _537 * _2893;
        float _2923 = _2919;
        if (!_819)
        {
            _2923 = _2835;
        }
        float _2925 = _2923;
        if (_819)
        {
            _2885 = _1721;
        }
        float _2927 = _2885;
        float _2929 = _2927;
        if (_819)
        {
            _2903 = _1721;
        }
        float _2931 = _2903;
        float _2933 = 1.0 / _2901;
        float _2935 = _2931;
        if (!_819)
        {
            _2929 = _2843;
        }
        float _2937 = _2929;
        float _2939 = _537 * _2925;
        float _2941 = _2937;
        if (!_819)
        {
            _2935 = _2843;
        }
        float _2943 = _2935;
        float _2945 = _2943;
        if (!_819)
        {
            _1801 = _2843;
        }
        float _2947 = _1801;
        float _2949 = _537 * _2937;
        if (_819)
        {
            _2941 = _1725;
        }
        float _2951 = _2941;
        float _2953 = 1.0 / _2907;
        float _2955 = _537 * _2943;
        float _2957 = _2951;
        if (_819)
        {
            _2945 = _1725;
        }
        float _2959 = _2945;
        float _2961 = _537 * _2947;
        float _2963 = _2959;
        if (!_819)
        {
            _2963 = _2849;
        }
        float _2965 = _2963;
        if (!_819)
        {
            _2957 = _2849;
        }
        float _2967 = _2957;
        if (!_819)
        {
            _1803 = _2849;
        }
        float _2969 = _1803;
        float _2971 = _537 * _2965;
        float _2973 = 1.0 / _2889;
        float _2975 = _537 * _2967;
        float _2977 = _537 * _2969;
        float _2979 = _2879 * _2853;
        float _2981 = _2979 * 0.15915493667125701904296875;
        float _2983 = _2899 * _2853;
        float _2985 = 1.0 / _2921;
        float _2987 = _2983 * 0.15915493667125701904296875;
        float _2989 = _2913 * _2853;
        float _2991 = _2989 * 0.15915493667125701904296875;
        float _2993 = _2953 * _2853;
        float _2995 = 1.0 / _2939;
        float _2997 = _2993 * 0.15915493667125701904296875;
        float _2999 = _2933 * _2863;
        float _3001 = 1.0 / _2955;
        float _3003 = _2999 * 0.15915493667125701904296875;
        float _3005 = _2973 * _2861;
        float _3007 = _3005 * 0.15915493667125701904296875;
        float _3009 = _2985 * _2863;
        float _3011 = 1.0 / _2975;
        float _3013 = _2985;
        if (_819)
        {
            _3013 = _1741;
        }
        float _3015 = _3013;
        float _3017 = _3009 * 0.15915493667125701904296875;
        float _3019 = _2995 * _2861;
        float _3021 = _3015;
        if (!_819)
        {
            _3021 = _1743;
        }
        float _3023 = _3021;
        float _3025 = 1.0 / _2977;
        float _3027 = _3019 * 0.15915493667125701904296875;
        float _3029 = _3001 * _2863;
        float _3031 = _3001;
        if (_819)
        {
            _3031 = _1741;
        }
        float _3033 = _3031;
        float _3035 = _3033;
        if (!_819)
        {
            _3035 = _1743;
        }
        float _3037 = _3035;
        float _3039 = _3029 * 0.15915493667125701904296875;
        float _3041 = 1.0 / _2897;
        float _3043 = _3011 * _2863;
        float _3045 = _3011;
        if (_819)
        {
            _2871 = _1741;
        }
        float _3047 = _2871;
        float _3049 = _3047;
        if (!_819)
        {
            _3049 = _1743;
        }
        float _3051 = _3049;
        float _3053 = _3043 * 0.15915493667125701904296875;
        if (!_819)
        {
            _1805 = _1743;
        }
        float _3055 = _1805;
        float _3057 = 1.0 / _2915;
        float _3059 = _3025 * _2861;
        if (_819)
        {
            _3045 = _1733;
        }
        float _3061 = _3045;
        float _3063 = _3061;
        if (!_819)
        {
            _3063 = _1735;
        }
        float _3065 = _3063;
        float _3067 = _3059 * 0.15915493667125701904296875;
        float _3069 = 1.0 / _2961;
        float _3071 = _2585 * _3041;
        float _3073 = _3071 * 6.283184051513671875;
        float _3075 = 1.0 / _2949;
        float _3077 = _2585 * _3057;
        float _3079 = _3073 * 0.15915493667125701904296875;
        float _3081 = _3057;
        float _3083 = _3073;
        float _3085 = _3077;
        float _3087 = _3069;
        if (_819)
        {
            _3081 = _1737;
        }
        float _3089 = _3081;
        float _3091 = _3077 * 6.283184051513671875;
        float _3093 = _3089;
        float _3095 = _3091;
        if (_819)
        {
            _3083 = _1737;
        }
        float _3097 = _3083;
        float _3099 = 1.0 / _2971;
        float _3101 = _3097;
        if (_819)
        {
            _3085 = _1737;
        }
        float _3103 = _3085;
        float _3105 = _3103;
        if (!_819)
        {
            _3093 = _1739;
        }
        float _3107 = _3093;
        if (!_819)
        {
            _3101 = _1739;
        }
        float _3109 = _3101;
        if (!_819)
        {
            _3105 = _1739;
        }
        float _3111 = _3105;
        float _3113 = _3003 * 6.283185482025146484375;
        float _3115 = sin(_3113);
        float _3117 = _2585 * _3075;
        if (!_819)
        {
            _1807 = _1739;
        }
        float _3119 = _1807;
        float _3121 = _3117 * 6.283184051513671875;
        float _3123 = _2981 * 6.283185482025146484375;
        float _3125 = sin(_3123);
        float _3127 = _3069 * _2861;
        float _3129 = _3127;
        float _3131 = _3121;
        if (_819)
        {
            _3087 = _1733;
        }
        float _3133 = _3087;
        float _3135 = _2585 * _3099;
        float _3137 = _3133;
        if (!_819)
        {
            _3137 = _1735;
        }
        float _3139 = _3137;
        float _3141 = _3127 * 0.15915493667125701904296875;
        if (_819)
        {
            _3129 = _1733;
        }
        float _3143 = _3129;
        float _3145 = _3121 * 0.15915493667125701904296875;
        float _3147 = _3143;
        if (!_819)
        {
            _3147 = _1735;
        }
        float _3149 = _3147;
        float _3151 = _3007 * 6.283185482025146484375;
        float _3153 = sin(_3151);
        if (!_819)
        {
            _1809 = _1735;
        }
        float _3155 = _1809;
        float _3157 = _3091 * 0.15915493667125701904296875;
        float _3159 = _3135 * 6.283184051513671875;
        if (_819)
        {
            _2601 = _1745;
        }
        float _3161 = _2601;
        float _3163 = _3115 * _3149;
        float _3165 = _3161;
        if (_819)
        {
            _3131 = _1745;
        }
        float _3167 = _3131;
        float _3169 = _3159 * 0.15915493667125701904296875;
        float _3171 = _3079 * 6.283185482025146484375;
        float _3173 = sin(_3171);
        float _3175 = _3167;
        if (_819)
        {
            _3095 = _1745;
        }
        float _3177 = _3095;
        float _3179 = _3125 * _3065;
        float _3181 = _3177;
        if (!_819)
        {
            _3165 = _1747;
        }
        float _3183 = _3165;
        if (!_819)
        {
            _3175 = _1747;
        }
        float _3185 = _3175;
        if (!_819)
        {
            _3181 = _1747;
        }
        float _3187 = _3181;
        float _3189 = _2987 * 6.283185482025146484375;
        float _3191 = sin(_3189);
        if (!_819)
        {
            _1811 = _1747;
        }
        float _3193 = _1811;
        float _3195 = _3153 * _3155;
        float _3197 = _3017 * 6.283185482025146484375;
        float _3199 = sin(_3197);
        float _3201 = _3173 * _3139;
        float _3203 = _3027 * 6.283185482025146484375;
        float _3205 = sin(_3203);
        float _3207 = fma(_3191, _3107, _3179);
        float _3209 = _3157 * 6.283185482025146484375;
        float _3211 = sin(_3209);
        float _3213 = fma(_3199, _3111, _3163);
        float _3215 = _2991 * 6.283185482025146484375;
        float _3217 = sin(_3215);
        float _3219 = fma(_3205, _3119, _3195);
        float _3221 = _3039 * 6.283185482025146484375;
        float _3223 = sin(_3221);
        float _3225 = fma(_3211, _3109, _3201);
        float _3227 = _3141 * 6.283185482025146484375;
        float _3229 = sin(_3227);
        float _3231 = fma(_3217, _3037, _3207);
        float _3233 = _3145 * 6.283185482025146484375;
        float _3235 = sin(_3233);
        float _3237 = fma(_3223, _3051, _3213);
        float _3239 = _2997 * 6.283185482025146484375;
        float _3241 = sin(_3239);
        float _3243 = fma(_3229, _3055, _3219);
        float _3245 = _3053 * 6.283185482025146484375;
        float _3247 = sin(_3245);
        float _3249 = fma(_3235, _3023, _3225);
        float _3251 = _3067 * 6.283185482025146484375;
        float _3253 = sin(_3251);
        float _3255 = fma(_3241, _3183, _3231);
        float _3257 = _3169 * 6.283185482025146484375;
        float _3259 = sin(_3257);
        float _3261 = fma(_3247, _3187, _3237);
        float _3263 = fma(_3253, _3193, _3243);
        float _3265 = -_3261;
        float _3267 = _3265 + _3263;
        float _3269 = fma(_3259, _3185, _3249);
        float _3271 = -_3269;
        float _3273 = _3255 + _3271;
        float _3275 = _3273 + _3267;
        _2815 = _3275;
    }
    _2817 = false;
    float _3277 = _2815;
    uint _3279 = uint(int(uint(_169) >> uint(2)));
    float _3281 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_3279)]);
    float _3283 = fma(_559, _1751, _775);
    float _3285 = fma(_561, _2583, _751);
    int _3287 = _147 + 4;
    float _3289 = fma(_563, _3277, _779);
    int _3291 = _147 + 8;
    float _3293 = -_151;
    float _3295 = _3293 + _3283;
    float _3297 = -_157;
    float _3299 = _3297 + _3285;
    float _3301 = -_163;
    float _3303 = _3301 + _3289;
    float _3305 = _3299 * _3299;
    float _3307 = fma(_3295, _3295, _3305);
    float _3309 = fma(_3303, _3303, _3307);
    float _3311 = sqrt(_3309);
    uint _3313 = uint(int(uint(_169) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3313)] = as_type<uint>(_3281);
    uint _3315 = uint(int(uint(_147) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3315)] = as_type<uint>(_3283);
    uint _3317 = uint(int(uint(_3287) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3317)] = as_type<uint>(_3285);
    uint _3319 = uint(int(uint(_3291) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3319)] = as_type<uint>(_3289);
    uint _3321 = uint(int(uint(_147) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3321)] = as_type<uint>(_783);
    uint _3323 = uint(int(uint(_3287) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3323)] = as_type<uint>(_749);
    uint _3325 = uint(int(uint(_3291) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3325)] = as_type<uint>(_785);
    uint _3327 = uint(int(uint(_147) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3327)] = as_type<uint>(_3295);
    uint _3329 = uint(int(uint(_3287) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3329)] = as_type<uint>(_3299);
    uint _3331 = uint(int(uint(_3291) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3331)] = as_type<uint>(_3303);
    float _3333 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _3335 = _749 * _749;
    bool _3337 = _3311 >= 9.9999999747524270787835121154785e-07;
    bool _3339 = isnan(_3311);
    bool _3341 = _3337 || _3339;
    bool _3343 = isnan(9.9999999747524270787835121154785e-07);
    bool _3345 = _3341 || _3343;
    float _3347 = fma(_783, _783, _3335);
    float _3349 = fma(_785, _785, _3347);
    float _3351 = sqrt(_3349);
    if (!_3345)
    {
        bool _3353 = _545 != _285;
        bool _3355 = isnan(_545);
        bool _3357 = _3353 || _3355;
        bool _3359 = isnan(_285);
        bool _3361 = _3357 || _3359;
        _3363 = _3361;
        if (!_3363)
        {
            float _3365 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _3367 = _3365 > 0.0;
            bool _3369 = !_3367;
            if (!_3369)
            {
                float _3371 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _3373 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _3375 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _3377 = _3373 * _505;
                float _3379 = _3373 * _511;
                float _3381 = _3373 * _513;
                float _3383 = fma(_3371, _507, _3377);
                float _3385 = fma(_3371, _515, _3379);
                float _3387 = fma(_3371, _517, _3381);
                float _3389 = fma(_3375, _509, _3383);
                float _3391 = fma(_3375, _519, _3385);
                float _3393 = fma(_3375, _521, _3387);
                float _3395 = _3389 * _3389;
                float _3397 = fma(_3391, _3391, _3395);
                float _3399 = fma(_3393, _3393, _3397);
                float _3401 = rsqrt(_3399);
                float _3403 = _3401 * 9.9999999747524270787835121154785e-07;
                float _3405 = _3391 * _3403;
                float _3407 = _3389 * _3403;
                float _3409 = _3393 * _3403;
                _327 = as_type<int>(_3405);
                _329 = as_type<int>(_3407);
                _331 = as_type<int>(_3409);
                _3363 = true;
            }
            else
            {
                bool _3411 = _3351 >= 9.9999999747524270787835121154785e-07;
                bool _3413 = isnan(_3351);
                bool _3415 = _3411 || _3413;
                bool _3417 = isnan(9.9999999747524270787835121154785e-07);
                bool _3419 = _3415 || _3417;
                if (!_3419)
                {
                    float _3421 = _3285 * _3285;
                    float _3423 = fma(_3283, _3283, _3421);
                    float _3425 = fma(_3289, _3289, _3423);
                    float _3427 = sqrt(_3425);
                    bool _3429 = _3427 >= 9.9999999747524270787835121154785e-07;
                    bool _3431 = isnan(_3427);
                    bool _3433 = _3429 || _3431;
                    bool _3435 = isnan(9.9999999747524270787835121154785e-07);
                    bool _3437 = _3433 || _3435;
                    float _3439 = _3427;
                    if (_3437)
                    {
                        float _3441 = rsqrt(_3425);
                        _3439 = _3441;
                    }
                    float _3443 = _3439;
                    if (!_3437)
                    {
                        _315 = 0;
                    }
                    int _3445 = _315;
                    int _3447 = _3445;
                    if (!_3437)
                    {
                        _317 = 897988541;
                    }
                    int _3449 = _317;
                    int _3451 = _3449;
                    if (!_3437)
                    {
                        _319 = 0;
                    }
                    int _3453 = _319;
                    float _3455 = _3443;
                    int _3457 = _3453;
                    if (_3437)
                    {
                        float _3459 = _3443 * 9.9999999747524270787835121154785e-07;
                        _3455 = _3459;
                    }
                    float _3461 = _3455;
                    if (_3437)
                    {
                        float _3463 = _3283 * _3461;
                        _3447 = as_type<int>(_3463);
                    }
                    int _3465 = _3447;
                    _327 = _3465;
                    if (_3437)
                    {
                        float _3467 = _3285 * _3461;
                        _3451 = as_type<int>(_3467);
                    }
                    int _3469 = _3451;
                    _329 = _3469;
                    if (_3437)
                    {
                        float _3471 = _3289 * _3461;
                        _3457 = as_type<int>(_3471);
                    }
                    int _3473 = _3457;
                    _331 = _3473;
                    _3363 = true;
                }
                else
                {
                    float _3475 = rsqrt(_3349);
                    float _3477 = _3475 * 9.9999999747524270787835121154785e-07;
                    float _3479 = _783 * _3477;
                    float _3481 = _749 * _3477;
                    float _3483 = _785 * _3477;
                    _327 = as_type<int>(_3479);
                    _329 = as_type<int>(_3481);
                    _331 = as_type<int>(_3483);
                    _3363 = true;
                }
            }
        }
    }
    else
    {
        float _3485 = _3351 * _3333;
        bool _3487 = _3485 >= 0.001000000047497451305389404296875;
        bool _3489 = isnan(_3485);
        bool _3491 = _3487 || _3489;
        bool _3493 = isnan(0.001000000047497451305389404296875);
        bool _3495 = _3491 || _3493;
        bool _3497 = _3485 > 0.0;
        bool _3499 = !_3495;
        bool _3501 = _3497 && _3499;
        bool _3503 = _3311 < 0.001000000047497451305389404296875;
        bool _3505 = _3503 && _3501;
        if (!_3505)
        {
            _321 = as_type<int>(_3295);
        }
        int _3507 = _321;
        int _3509 = _3507;
        if (_3505)
        {
            float _3511 = _783 * _3333;
            _3509 = as_type<int>(_3511);
        }
        int _3513 = _3509;
        _327 = _3513;
        if (!_3505)
        {
            _323 = as_type<int>(_3299);
        }
        int _3515 = _323;
        int _3517 = _3515;
        if (_3505)
        {
            float _3519 = _749 * _3333;
            _3517 = as_type<int>(_3519);
        }
        int _3521 = _3517;
        _329 = _3521;
        if (!_3505)
        {
            _325 = as_type<int>(_3303);
        }
        int _3523 = _325;
        _331 = _3523;
        if (_3505)
        {
            float _3525 = _785 * _3333;
            _331 = as_type<int>(_3525);
        }
    }
    _3363 = false;
    int _3527 = _327;
    int _3529 = _329;
    int _3531 = _331;
    uint _3533 = uint(int(uint(_147) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3533)] = uint(_3527);
    uint _3535 = uint(int(uint(_3287) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3535)] = uint(_3529);
    uint _3537 = uint(int(uint(_3291) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3537)] = uint(_3531);
}

