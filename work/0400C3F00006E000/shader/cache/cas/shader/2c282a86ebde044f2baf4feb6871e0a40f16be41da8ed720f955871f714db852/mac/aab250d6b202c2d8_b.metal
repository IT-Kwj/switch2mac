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
    bool _1185 = false;
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
    int _201 = _145 + 12;
    uint _203 = uint(int(uint(_201) >> uint(2)));
    float _205 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_203)]);
    float _207 = 0.0;
    float _209 = 0.0;
    float _211 = 0.0;
    if (_165)
    {
        float _213 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _215 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _217 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _207 = _213;
        _209 = _215;
        _211 = _217;
    }
    float _219 = _207;
    float _221 = _209;
    float _223 = _211;
    float _225 = 0.0;
    float _227 = 0.0;
    float _229 = 0.0;
    float _231 = 0.0;
    if (_165)
    {
        float _233 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _235 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _237 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        float _239 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[39]);
        _225 = _233;
        _227 = _235;
        _229 = _237;
        _231 = _239;
    }
    float _241 = _225;
    float _243 = _227;
    float _245 = _229;
    float _247 = _231;
    float _249 = 0.0;
    float _251 = 0.0;
    float _253 = 0.0;
    if (_165)
    {
        float _255 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _257 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _259 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _249 = _255;
        _251 = _257;
        _253 = _259;
    }
    float _261 = _249;
    float _263 = _251;
    float _265 = _253;
    uint _267 = uint(int(uint(_167) >> uint(2)));
    float _269 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_267)]);
    uint _271 = uint(int(uint(_167) >> uint(2)));
    float _273 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_271)]);
    float _275 = _221;
    float _277 = 0.0;
    float _279 = 0.0;
    float _281 = 0.0;
    float _283 = 0.0;
    float _285 = _247;
    float _287 = _205;
    float _289 = _243;
    float _291 = _241;
    float _293 = _245;
    float _295 = _221;
    float _297 = _219;
    float _299 = _223;
    float _301 = _263;
    float _303 = _261;
    float _305 = _265;
    float _307 = _171;
    float _309 = _177;
    float _311 = _183;
    float _313 = _183;
    int _315 = as_type<int>(_187);
    int _317 = as_type<int>(_193);
    int _319 = as_type<int>(_199);
    int _321 = as_type<int>(_187);
    int _323 = as_type<int>(_193);
    int _325 = as_type<int>(_199);
    int _327 = as_type<int>(_187);
    int _329 = as_type<int>(_193);
    int _331 = as_type<int>(_199);
    if (!_165)
    {
        int _333 = _145 + 4;
        uint _335 = uint(int(uint(_145) >> uint(2)));
        float _337 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_335)]);
        int _339 = _145 + 8;
        uint _341 = uint(int(uint(_145) >> uint(2)));
        float _343 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_341)]);
        uint _345 = uint(int(uint(_333) >> uint(2)));
        float _347 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_345)]);
        uint _349 = uint(int(uint(_339) >> uint(2)));
        float _351 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_349)]);
        uint _353 = uint(int(uint(_333) >> uint(2)));
        float _355 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_353)]);
        uint _357 = uint(int(uint(_145) >> uint(2)));
        float _359 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_357)]);
        uint _361 = uint(int(uint(_339) >> uint(2)));
        float _363 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_361)]);
        uint _365 = uint(int(uint(_333) >> uint(2)));
        float _367 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_365)]);
        uint _369 = uint(int(uint(_339) >> uint(2)));
        float _371 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_369)]);
        float _373 = _337 * _337;
        float _375 = fma(_343, _343, _373);
        float _377 = _347 * _347;
        float _379 = _351 * _351;
        float _381 = fma(_355, _355, _377);
        float _383 = fma(_359, _359, _375);
        float _385 = fma(_363, _363, _379);
        float _387 = sqrt(_383);
        float _389 = fma(_367, _367, _381);
        float _391 = fma(_371, _371, _385);
        float _393 = sqrt(_389);
        float _395 = sqrt(_391);
        bool _397 = _387 > 0.0;
        bool _399 = _393 > 0.0;
        bool _401 = _395 > 0.0;
        float _403 = 0.0;
        float _405 = _395;
        float _407 = _337;
        float _409 = _387;
        float _411 = _381;
        float _413 = _393;
        float _415 = _347;
        float _417 = _383;
        float _419 = _359;
        _277 = _389;
        _283 = _391;
        _285 = _367;
        _287 = _351;
        if (_397)
        {
            float _421 = rsqrt(_383);
            _403 = _421;
        }
        float _423 = _403;
        float _425 = _385;
        if (_399)
        {
            float _427 = rsqrt(_389);
            _425 = _427;
        }
        float _429 = _425;
        float _431 = 0.0;
        if (_401)
        {
            float _433 = rsqrt(_391);
            _431 = _433;
        }
        float _435 = _431;
        if (!_397)
        {
            _405 = 0.0;
        }
        float _437 = _405;
        float _439 = _437;
        _279 = _423;
        if (_397)
        {
            float _441 = _337 * _423;
            _439 = _441;
        }
        float _443 = _439;
        _291 = _443;
        if (!_397)
        {
            _407 = 0.0;
        }
        float _445 = _407;
        float _447 = _445;
        if (_397)
        {
            float _449 = _359 * _423;
            _447 = _449;
        }
        float _451 = _447;
        _303 = _451;
        if (!_399)
        {
            _409 = 0.0;
        }
        float _453 = _409;
        float _455 = _453;
        if (!_397)
        {
            _411 = 0.0;
        }
        float _457 = _411;
        float _459 = _457;
        _281 = _429;
        if (_399)
        {
            float _461 = _347 * _429;
            _455 = _461;
        }
        float _463 = _455;
        _289 = _463;
        if (!_399)
        {
            _275 = 0.0;
        }
        float _465 = _275;
        float _467 = _465;
        if (_397)
        {
            float _469 = _343 * _423;
            _459 = _469;
        }
        float _471 = _459;
        _297 = _471;
        if (!_399)
        {
            _413 = 0.0;
        }
        float _473 = _413;
        float _475 = _473;
        if (_399)
        {
            float _477 = _355 * _429;
            _467 = _477;
        }
        float _479 = _467;
        _295 = _479;
        if (!_401)
        {
            _415 = 0.0;
        }
        float _481 = _415;
        float _483 = _481;
        if (_399)
        {
            float _485 = _367 * _429;
            _475 = _485;
        }
        float _487 = _475;
        _301 = _487;
        if (!_401)
        {
            _417 = 0.0;
        }
        float _489 = _417;
        float _491 = _489;
        if (_401)
        {
            float _493 = _351 * _435;
            _483 = _493;
        }
        float _495 = _483;
        _293 = _495;
        if (!_401)
        {
            _419 = 0.0;
        }
        float _497 = _419;
        _305 = _497;
        if (_401)
        {
            float _499 = _363 * _435;
            _491 = _499;
        }
        float _501 = _491;
        _299 = _501;
        if (_401)
        {
            float _503 = _371 * _435;
            _305 = _503;
        }
    }
    float _505 = _277;
    float _507 = _279;
    float _509 = _281;
    float _511 = _283;
    float _513 = _285;
    float _515 = _287;
    float _517 = _289;
    float _519 = _291;
    float _521 = _293;
    float _523 = _295;
    float _525 = _297;
    float _527 = _299;
    float _529 = _301;
    float _531 = _303;
    float _533 = _305;
    float _535 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _537 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[52]);
    int _539 = as_type<int>(_143) & 1024;
    bool _541 = _539 != 0;
    float _543 = 0.0;
    float _545 = 0.0;
    float _547 = 0.0;
    float _549 = 0.0;
    float _551 = _515;
    if (_165)
    {
        float _553 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _555 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _557 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _559 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _543 = _553;
        _545 = _555;
        _547 = _557;
        _549 = _559;
    }
    float _561 = _543;
    float _563 = _545;
    float _565 = _547;
    float _567 = _549;
    float _569 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    int _571 = as_type<int>(_143) & 2048;
    bool _573 = _571 != 0;
    float _575 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _577 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _579 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _581 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _583 = 0.0;
    float _585 = 0.0;
    float _587 = 0.0;
    if (_541)
    {
        uint _589 = uint(int(uint(_145) >> uint(2)));
        float _591 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_589)]);
        int _593 = _145 + 4;
        uint _595 = uint(int(uint(_593) >> uint(2)));
        float _597 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_595)]);
        int _599 = _145 + 8;
        uint _601 = uint(int(uint(_599) >> uint(2)));
        float _603 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_601)]);
        _583 = _591;
        _585 = _597;
        _587 = _603;
    }
    float _605 = _583;
    float _607 = _585;
    float _609 = _587;
    float _611 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _613 = _505;
    float _615 = _507;
    float _617 = _509;
    float _619 = _511;
    if (_573)
    {
        uint _621 = uint(int(uint(_145) >> uint(2)));
        float _623 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_621)]);
        int _625 = _145 + 4;
        uint _627 = uint(int(uint(_625) >> uint(2)));
        float _629 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_627)]);
        int _631 = _145 + 8;
        uint _633 = uint(int(uint(_631) >> uint(2)));
        float _635 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_633)]);
        int _637 = _145 + 12;
        uint _639 = uint(int(uint(_637) >> uint(2)));
        float _641 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_639)]);
        _613 = _623;
        _615 = _629;
        _617 = _635;
        _619 = _641;
    }
    float _643 = _613;
    float _645 = _615;
    float _647 = _617;
    float _649 = _619;
    float _651 = 0.0;
    if (_541)
    {
        float _653 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _651 = _653;
    }
    float _655 = _651;
    float _657 = trunc(_537);
    int _659 = int(_657);
    bool _661 = _659 != 0;
    float _663 = _513;
    if (!_661)
    {
        float _665 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[55]);
        _663 = _665;
    }
    float _667 = _663;
    float _669 = _269 * _535;
    bool _671 = _659 != 1;
    float _673 = fma(_177, _669, _155);
    float _675 = 0.0;
    float _677 = _605;
    float _679 = _609;
    float _681 = _647;
    float _683 = _581;
    if (!_671)
    {
        float _685 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[55]);
        _675 = _685;
    }
    float _687 = _675;
    float _689 = fma(_171, _669, _149);
    float _691 = 0.0;
    float _693 = _561;
    float _695 = _565;
    float _697 = _689;
    if (_165)
    {
        float _699 = _673 * _563;
        _691 = _699;
    }
    float _701 = _691;
    float _703 = abs(_569);
    float _705 = log2(_703);
    float _707 = fma(_183, _669, _161);
    float _709 = _707;
    if (_165)
    {
        float _711 = fma(_689, _561, _701);
        _693 = _711;
    }
    float _713 = _693;
    bool _715 = _673 < _667;
    bool _717 = !_661;
    bool _719 = _715 && _717;
    float _721 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _723 = 0.0;
    float _725 = _713;
    if (_719)
    {
        float _727 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[53]);
        _723 = _727;
    }
    float _729 = _723;
    if (!_719)
    {
        _551 = _673;
    }
    float _731 = _551;
    float _733 = 0.0;
    if (_719)
    {
        float _735 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[54]);
        _733 = _735;
    }
    float _737 = _733;
    float _739 = _731;
    if (_719)
    {
        float _741 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[55]);
        _739 = _741;
    }
    float _743 = _739;
    if (_165)
    {
        float _745 = fma(_707, _565, _713);
        _725 = _745;
    }
    float _747 = _725;
    if (_541)
    {
        float _749 = _673 * _607;
        _695 = _749;
    }
    float _751 = _695;
    if (_541)
    {
        float _753 = fma(_689, _605, _751);
        _677 = _753;
    }
    float _755 = _677;
    float _757 = _535 * _705;
    float _759 = _577 * _611;
    float _761 = _755;
    if (_541)
    {
        float _763 = fma(_707, _609, _755);
        _761 = _763;
    }
    float _765 = _761;
    if (_573)
    {
        float _767 = _673 * _645;
        _679 = _767;
    }
    float _769 = _679;
    float _771 = _575 * _611;
    float _773 = exp2(_757);
    float _775 = _769;
    if (_573)
    {
        float _777 = fma(_689, _643, _769);
        _775 = _777;
    }
    float _779 = _775;
    float _781 = _759 * _517;
    float _783 = _759 * _519;
    float _785 = _759 * _521;
    float _787 = _579 * _611;
    float _789 = fma(_771, _523, _781);
    if (_573)
    {
        float _791 = fma(_707, _647, _779);
        _681 = _791;
    }
    float _793 = _681;
    if (!_165)
    {
        _683 = 0.0;
    }
    float _795 = _683;
    float _797 = _795;
    if (_165)
    {
        float _799 = _567 + _747;
        _797 = _799;
    }
    float _801 = _797;
    float _803 = fma(_771, _525, _783);
    float _805 = fma(_771, _527, _785);
    float _807 = _801;
    if (_541)
    {
        float _809 = _655 + _765;
        _807 = _809;
    }
    float _811 = _807;
    float _813 = fma(_787, _529, _789);
    float _815 = _811;
    if (_573)
    {
        float _817 = _649 + _793;
        _815 = _817;
    }
    float _819 = _815;
    float _821 = fma(_787, _531, _803);
    float _823 = fma(_787, _533, _805);
    float _825 = _535 * _813;
    bool _827 = _819 < _687;
    bool _829 = !_671;
    bool _831 = _827 && _829;
    float _833 = _535 * _821;
    float _835 = _535 * _823;
    float _837 = fma(_177, _773, _825);
    float _839 = fma(_171, _773, _833);
    float _841 = fma(_183, _773, _835);
    float _843 = _835;
    float _845 = _839;
    float _847 = _841;
    float _849 = _773;
    float _851 = _837;
    float _853 = _837;
    if (!_719)
    {
        _843 = _837;
    }
    float _855 = _843;
    uint _857 = uint(int(uint(_167) >> uint(2)));
    float _859 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_857)]);
    float _861 = _855;
    if (_719)
    {
        float _863 = _837 * _729;
        _307 = _863;
    }
    float _865 = _307;
    float _867 = _865;
    if (_719)
    {
        float _869 = _839 * _737;
        _845 = _869;
    }
    float _871 = _845;
    if (_719)
    {
        float _873 = _841 * _737;
        _847 = _873;
    }
    float _875 = _847;
    if (_719)
    {
        float _877 = -_865;
        float _879 = fma(_877, _737, -0.0);
        _861 = _879;
    }
    float _881 = _861;
    if (!_831)
    {
        _849 = _871;
    }
    float _883 = _849;
    float _885 = _883;
    if (!_831)
    {
        _309 = _881;
    }
    float _887 = _309;
    float _889 = _887;
    if (!_831)
    {
        _867 = _875;
    }
    float _891 = _867;
    bool _893 = !_831;
    float _895 = _891;
    float _897 = _743;
    float _899 = _891;
    if (!_893)
    {
        float _901 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[55]);
        float _903 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[53]);
        float _905 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[54]);
        if (!_165)
        {
            _851 = _519;
        }
        float _907 = _851;
        float _909 = _907;
        if (!_165)
        {
            _311 = _517;
        }
        float _911 = _311;
        float _913 = _911;
        if (!_165)
        {
            _895 = _521;
        }
        float _915 = _895;
        bool _917 = !_165;
        float _919 = _915;
        if (!_917)
        {
            float _921 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _923 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _925 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _927 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _929 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _931 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _933 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _935 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _937 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _939 = _927 * _925;
            float _941 = _929 * _925;
            float _943 = -_939;
            float _945 = fma(_931, _921, _943);
            float _947 = -_941;
            float _949 = fma(_931, _923, _947);
            float _951 = _927 * _923;
            float _953 = _937 * _927;
            float _955 = _935 * _945;
            float _957 = -_951;
            float _959 = fma(_929, _921, _957);
            float _961 = -_953;
            float _963 = fma(_933, _931, _961);
            float _965 = -_955;
            float _967 = fma(_933, _949, _965);
            float _969 = _935 * _931;
            float _971 = fma(_937, _959, _967);
            float _973 = _933 * _929;
            float _975 = -_969;
            float _977 = fma(_937, _929, _975);
            float _979 = 1.0 / _971;
            float _981 = -_973;
            float _983 = fma(_935, _927, _981);
            float _985 = _977 * _979;
            float _987 = _963 * _979;
            float _989 = _983 * _979;
            _913 = _987;
            _909 = _985;
            _919 = _989;
        }
        float _991 = _913;
        float _993 = _909;
        float _995 = _919;
        float _997 = _991 * _991;
        float _999 = _903 + 1.0;
        float _1001 = fma(_993, _993, _997);
        float _1003 = fma(_995, _995, _1001);
        float _1005 = rsqrt(_1003);
        float _1007 = _1005 * _991;
        float _1009 = _1005 * _993;
        float _1011 = _1005 * _995;
        float _1013 = _1007 * _881;
        float _1015 = fma(_1009, _871, _1013);
        float _1017 = fma(_1011, _875, _1015);
        float _1019 = -_819;
        float _1021 = _1019 + _901;
        float _1023 = _1017 * _999;
        float _1025 = fma(_1021, _995, _707);
        float _1027 = fma(_1021, _993, _689);
        float _1029 = fma(_1021, _991, _743);
        float _1031 = -_1009;
        float _1033 = fma(_1031, _1023, _871);
        float _1035 = -_1007;
        float _1037 = fma(_1035, _1023, _881);
        float _1039 = -_1011;
        float _1041 = fma(_1039, _1023, _875);
        float _1043 = _1033 * _905;
        float _1045 = _1037 * _905;
        float _1047 = _1041 * _905;
        _313 = _991;
        _853 = _993;
        _697 = _1027;
        _897 = _1029;
        _709 = _1025;
        _885 = _1043;
        _889 = _1045;
        _899 = _1047;
    }
    float _1049 = _313;
    float _1051 = _853;
    float _1053 = _697;
    float _1055 = _897;
    float _1057 = _709;
    float _1059 = _885;
    float _1061 = _889;
    float _1063 = _899;
    bool _1065 = _659 != 2;
    bool _1067 = _659 != 3;
    float _1069 = _1049;
    if (!_1065)
    {
        float _1071 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[55]);
        _1069 = _1071;
    }
    float _1073 = _1069;
    float _1075 = _1051;
    if (!_1067)
    {
        float _1077 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[55]);
        _1075 = _1077;
    }
    float _1079 = _1075;
    int _1081 = _145 + 4;
    int _1083 = _145 + 8;
    float _1085 = -_149;
    float _1087 = _1085 + _1053;
    float _1089 = -_155;
    float _1091 = _1089 + _1055;
    bool _1093 = _1055 < _1073;
    bool _1095 = !_1065;
    bool _1097 = _1093 && _1095;
    bool _1099 = _819 < _1079;
    bool _1101 = !_1067;
    bool _1103 = _1099 && _1101;
    bool _1105 = !_1103;
    bool _1107 = _1105 && _1097;
    bool _1109 = !_1097;
    bool _1111 = _1103 && _1109;
    bool _1113 = _1107 || _1111;
    bool _1115 = _1103 && _1097;
    bool _1117 = _1113 || _1115;
    bool _1119 = !_1117;
    int _1121 = _1119 ? as_type<int>(_859) : 0;
    float _1123 = -_161;
    float _1125 = _1123 + _1057;
    uint _1127 = uint(int(uint(_167) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1127)] = uint(_1121);
    uint _1129 = uint(int(uint(_145) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1129)] = as_type<uint>(_1053);
    uint _1131 = uint(int(uint(_1081) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1131)] = as_type<uint>(_1055);
    uint _1133 = uint(int(uint(_1083) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1133)] = as_type<uint>(_1057);
    uint _1135 = uint(int(uint(_145) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1135)] = as_type<uint>(_1059);
    uint _1137 = uint(int(uint(_1081) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1137)] = as_type<uint>(_1061);
    uint _1139 = uint(int(uint(_1083) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1139)] = as_type<uint>(_1063);
    uint _1141 = uint(int(uint(_145) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1141)] = as_type<uint>(_1087);
    uint _1143 = uint(int(uint(_1081) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1143)] = as_type<uint>(_1091);
    uint _1145 = uint(int(uint(_1083) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1145)] = as_type<uint>(_1125);
    float _1147 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1149 = _1091 * _1091;
    float _1151 = _1061 * _1061;
    float _1153 = fma(_1087, _1087, _1149);
    float _1155 = fma(_1059, _1059, _1151);
    float _1157 = fma(_1125, _1125, _1153);
    float _1159 = fma(_1063, _1063, _1155);
    float _1161 = sqrt(_1157);
    float _1163 = sqrt(_1159);
    bool _1165 = _1161 >= 9.9999999747524270787835121154785e-07;
    bool _1167 = isnan(_1161);
    bool _1169 = _1165 || _1167;
    bool _1171 = isnan(9.9999999747524270787835121154785e-07);
    bool _1173 = _1169 || _1171;
    if (!_1173)
    {
        bool _1175 = _721 != _273;
        bool _1177 = isnan(_721);
        bool _1179 = _1175 || _1177;
        bool _1181 = isnan(_273);
        bool _1183 = _1179 || _1181;
        _1185 = _1183;
        if (!_1185)
        {
            float _1187 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _1189 = _1187 > 0.0;
            bool _1191 = !_1189;
            if (!_1191)
            {
                float _1193 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _1195 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _1197 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _1199 = _1195 * _517;
                float _1201 = _1195 * _519;
                float _1203 = _1195 * _521;
                float _1205 = fma(_1193, _523, _1199);
                float _1207 = fma(_1193, _525, _1201);
                float _1209 = fma(_1193, _527, _1203);
                float _1211 = fma(_1197, _529, _1205);
                float _1213 = fma(_1197, _531, _1207);
                float _1215 = fma(_1197, _533, _1209);
                float _1217 = _1211 * _1211;
                float _1219 = fma(_1213, _1213, _1217);
                float _1221 = fma(_1215, _1215, _1219);
                float _1223 = rsqrt(_1221);
                float _1225 = _1223 * 9.9999999747524270787835121154785e-07;
                float _1227 = _1213 * _1225;
                float _1229 = _1211 * _1225;
                float _1231 = _1215 * _1225;
                _327 = as_type<int>(_1227);
                _329 = as_type<int>(_1229);
                _331 = as_type<int>(_1231);
                _1185 = true;
            }
            else
            {
                bool _1233 = _1163 >= 9.9999999747524270787835121154785e-07;
                bool _1235 = isnan(_1163);
                bool _1237 = _1233 || _1235;
                bool _1239 = isnan(9.9999999747524270787835121154785e-07);
                bool _1241 = _1237 || _1239;
                if (!_1241)
                {
                    float _1243 = _1055 * _1055;
                    float _1245 = fma(_1053, _1053, _1243);
                    float _1247 = fma(_1057, _1057, _1245);
                    float _1249 = sqrt(_1247);
                    bool _1251 = _1249 >= 9.9999999747524270787835121154785e-07;
                    bool _1253 = isnan(_1249);
                    bool _1255 = _1251 || _1253;
                    bool _1257 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1259 = _1255 || _1257;
                    float _1261 = _1249;
                    if (_1259)
                    {
                        float _1263 = rsqrt(_1247);
                        _1261 = _1263;
                    }
                    float _1265 = _1261;
                    if (!_1259)
                    {
                        _315 = 0;
                    }
                    int _1267 = _315;
                    int _1269 = _1267;
                    if (!_1259)
                    {
                        _317 = 897988541;
                    }
                    int _1271 = _317;
                    int _1273 = _1271;
                    if (!_1259)
                    {
                        _319 = 0;
                    }
                    int _1275 = _319;
                    float _1277 = _1265;
                    int _1279 = _1275;
                    if (_1259)
                    {
                        float _1281 = _1265 * 9.9999999747524270787835121154785e-07;
                        _1277 = _1281;
                    }
                    float _1283 = _1277;
                    if (_1259)
                    {
                        float _1285 = _1053 * _1283;
                        _1269 = as_type<int>(_1285);
                    }
                    int _1287 = _1269;
                    _327 = _1287;
                    if (_1259)
                    {
                        float _1289 = _1055 * _1283;
                        _1273 = as_type<int>(_1289);
                    }
                    int _1291 = _1273;
                    _329 = _1291;
                    if (_1259)
                    {
                        float _1293 = _1057 * _1283;
                        _1279 = as_type<int>(_1293);
                    }
                    int _1295 = _1279;
                    _331 = _1295;
                    _1185 = true;
                }
                else
                {
                    float _1297 = rsqrt(_1159);
                    float _1299 = _1297 * 9.9999999747524270787835121154785e-07;
                    float _1301 = _1059 * _1299;
                    float _1303 = _1061 * _1299;
                    float _1305 = _1063 * _1299;
                    _327 = as_type<int>(_1301);
                    _329 = as_type<int>(_1303);
                    _331 = as_type<int>(_1305);
                    _1185 = true;
                }
            }
        }
    }
    else
    {
        float _1307 = _1163 * _1147;
        bool _1309 = _1307 >= 0.001000000047497451305389404296875;
        bool _1311 = isnan(_1307);
        bool _1313 = _1309 || _1311;
        bool _1315 = isnan(0.001000000047497451305389404296875);
        bool _1317 = _1313 || _1315;
        bool _1319 = _1307 > 0.0;
        bool _1321 = !_1317;
        bool _1323 = _1319 && _1321;
        bool _1325 = _1161 < 0.001000000047497451305389404296875;
        bool _1327 = _1325 && _1323;
        if (!_1327)
        {
            _321 = as_type<int>(_1087);
        }
        int _1329 = _321;
        int _1331 = _1329;
        if (_1327)
        {
            float _1333 = _1147 * _1059;
            _1331 = as_type<int>(_1333);
        }
        int _1335 = _1331;
        _327 = _1335;
        if (!_1327)
        {
            _323 = as_type<int>(_1091);
        }
        int _1337 = _323;
        int _1339 = _1337;
        if (_1327)
        {
            float _1341 = _1147 * _1061;
            _1339 = as_type<int>(_1341);
        }
        int _1343 = _1339;
        _329 = _1343;
        if (!_1327)
        {
            _325 = as_type<int>(_1125);
        }
        int _1345 = _325;
        _331 = _1345;
        if (_1327)
        {
            float _1347 = _1147 * _1063;
            _331 = as_type<int>(_1347);
        }
    }
    _1185 = false;
    int _1349 = _327;
    int _1351 = _329;
    int _1353 = _331;
    uint _1355 = uint(int(uint(_145) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1355)] = uint(_1349);
    uint _1357 = uint(int(uint(_1081) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1357)] = uint(_1351);
    uint _1359 = uint(int(uint(_1083) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1359)] = uint(_1353);
}

