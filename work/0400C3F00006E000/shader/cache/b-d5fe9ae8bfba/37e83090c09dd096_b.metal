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
    bool _3835 = false;
    bool _3575 = false;
    bool _2823 = false;
    bool _2073 = false;
    bool _1167 = false;
    float _59 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _61 = as_type<float>(gl_LocalInvocationID.x);
    float _63 = as_type<float>(gl_WorkGroupID.x);
    int _66 = as_type<int>(_63) << 5;
    int _68 = _66 + as_type<int>(_61);
    float _70 = trunc(_59);
    int _72 = int(_70);
    bool _76 = _68 >= _72;
    int _78 = 0;
    float _80 = as_type<float>(_72);
    if (_76)
    {
        _78 = 0;
    }
    int _82 = _78;
    int _84 = _82;
    int _86 = _82;
    float _88 = 0.0;
    if (!_76)
    {
        int _90 = _68 << 4;
        int _92 = _90 + 12;
        uint _95 = uint(int(uint(_92) >> uint(2)));
        float _97 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_95)]);
        float _99 = trunc(_97);
        int _101 = int(_99);
        bool _103 = _101 >= 1;
        int _105 = _103 ? (-1) : 0;
        _80 = as_type<float>(_92);
        _88 = as_type<float>(_101);
        if (!_103)
        {
            _84 = 0;
        }
        int _107 = _84;
        bool _109 = !_103;
        _86 = _107;
        if (!_109)
        {
            float _111 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _113 = uint(int(uint(_92) >> uint(2)));
            float _115 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_113)]);
            float _117 = float(_101);
            float _119 = -_115;
            float _121 = _111 + _119;
            bool _123 = _121 > _117;
            int _125 = as_type<int>(_111);
            _80 = _115;
            _88 = _117;
            if (!_123)
            {
                bool _127 = _111 >= _115;
                bool _129 = isnan(_111);
                bool _131 = _127 || _129;
                bool _133 = isnan(_115);
                bool _135 = _131 || _133;
                _105 = _135 ? (-1) : 0;
            }
            int _137 = _105;
            if (_123)
            {
                _125 = 0;
            }
            int _139 = _125;
            _86 = _139;
            if (!_123)
            {
                int _141 = ~_137;
                int _143 = (_141 != 0) ? 0 : 1;
                _86 = _143;
            }
        }
    }
    int _145 = _86;
    float _147 = _80;
    float _149 = _88;
    int _151 = _145 & 1;
    bool _153 = _151 != 0;
    if (!_153)
    {
        return;
    }
    float _155 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _157 = _68 << 4;
    uint _159 = uint(int(uint(_157) >> uint(2)));
    float _161 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_159)]);
    int _163 = _157 + 4;
    uint _165 = uint(int(uint(_163) >> uint(2)));
    float _167 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_165)]);
    int _169 = _157 + 8;
    uint _171 = uint(int(uint(_169) >> uint(2)));
    float _173 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_171)]);
    int _175 = as_type<int>(_155) & 512;
    bool _177 = _175 != 0;
    int _179 = _157 + 12;
    uint _181 = uint(int(uint(_157) >> uint(2)));
    float _183 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_181)]);
    int _185 = _157 + 4;
    uint _187 = uint(int(uint(_185) >> uint(2)));
    float _189 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_187)]);
    int _191 = _157 + 8;
    uint _193 = uint(int(uint(_191) >> uint(2)));
    float _195 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_193)]);
    uint _197 = uint(int(uint(_157) >> uint(2)));
    float _199 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_197)]);
    int _201 = _157 + 4;
    uint _203 = uint(int(uint(_201) >> uint(2)));
    float _205 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_203)]);
    int _207 = _157 + 8;
    uint _209 = uint(int(uint(_207) >> uint(2)));
    float _211 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_209)]);
    float _213 = 0.0;
    float _215 = 0.0;
    float _217 = 0.0;
    if (_177)
    {
        float _219 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _221 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _223 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _213 = _219;
        _215 = _221;
        _217 = _223;
    }
    float _225 = _213;
    float _227 = _215;
    float _229 = _217;
    float _231 = 0.0;
    float _233 = 0.0;
    float _235 = 0.0;
    if (_177)
    {
        float _237 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _239 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _241 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _231 = _237;
        _233 = _239;
        _235 = _241;
    }
    float _243 = _231;
    float _245 = _233;
    float _247 = _235;
    float _249 = as_type<float>(_145);
    float _251 = _147;
    float _253 = _149;
    if (_177)
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
    uint _267 = uint(int(uint(_157) >> uint(2)));
    float _269 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_267)]);
    int _271 = _157 + 4;
    uint _273 = uint(int(uint(_271) >> uint(2)));
    float _275 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_273)]);
    int _277 = _157 + 8;
    uint _279 = uint(int(uint(_277) >> uint(2)));
    float _281 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_279)]);
    uint _283 = uint(int(uint(_179) >> uint(2)));
    float _285 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_283)]);
    uint _287 = uint(int(uint(_179) >> uint(2)));
    float _289 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_287)]);
    float _291 = _243;
    float _293 = _245;
    float _295 = _247;
    float _297 = _225;
    float _299 = _227;
    float _301 = _229;
    float _303 = _261;
    float _305 = _263;
    float _307 = _265;
    float _309 = _183;
    float _311 = _195;
    float _313 = _183;
    float _315 = _195;
    int _317 = as_type<int>(_199);
    int _319 = as_type<int>(_205);
    int _321 = as_type<int>(_211);
    int _323 = as_type<int>(_199);
    int _325 = as_type<int>(_205);
    int _327 = as_type<int>(_211);
    int _329 = as_type<int>(_199);
    int _331 = as_type<int>(_205);
    int _333 = as_type<int>(_211);
    if (!_177)
    {
        int _335 = _157 + 4;
        uint _337 = uint(int(uint(_157) >> uint(2)));
        float _339 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_337)]);
        int _341 = _157 + 8;
        uint _343 = uint(int(uint(_157) >> uint(2)));
        float _345 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_343)]);
        uint _347 = uint(int(uint(_335) >> uint(2)));
        float _349 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_347)]);
        uint _351 = uint(int(uint(_335) >> uint(2)));
        float _353 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_351)]);
        uint _355 = uint(int(uint(_341) >> uint(2)));
        float _357 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_355)]);
        uint _359 = uint(int(uint(_157) >> uint(2)));
        float _361 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_359)]);
        uint _363 = uint(int(uint(_341) >> uint(2)));
        float _365 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_363)]);
        uint _367 = uint(int(uint(_335) >> uint(2)));
        float _369 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_367)]);
        uint _371 = uint(int(uint(_341) >> uint(2)));
        float _373 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_371)]);
        float _375 = _339 * _339;
        float _377 = fma(_345, _345, _375);
        float _379 = _349 * _349;
        float _381 = fma(_353, _353, _379);
        float _383 = _357 * _357;
        float _385 = fma(_361, _361, _377);
        float _387 = fma(_365, _365, _383);
        float _389 = sqrt(_385);
        float _391 = fma(_369, _369, _381);
        float _393 = fma(_373, _373, _387);
        float _395 = sqrt(_391);
        float _397 = sqrt(_393);
        bool _399 = _389 > 0.0;
        bool _401 = _395 > 0.0;
        bool _403 = _397 > 0.0;
        float _405 = _395;
        float _407 = _397;
        float _409 = _387;
        float _411 = _339;
        float _413 = _389;
        float _415 = _345;
        float _417 = _381;
        float _419 = _349;
        float _421 = _369;
        float _423 = _361;
        if (_399)
        {
            float _425 = rsqrt(_385);
            _405 = _425;
        }
        float _427 = _405;
        float _429 = 0.0;
        if (_401)
        {
            float _431 = rsqrt(_391);
            _429 = _431;
        }
        float _433 = _429;
        float _435 = 0.0;
        if (_403)
        {
            float _437 = rsqrt(_393);
            _435 = _437;
        }
        float _439 = _435;
        if (!_399)
        {
            _407 = 0.0;
        }
        float _441 = _407;
        float _443 = _441;
        if (_399)
        {
            float _445 = _339 * _427;
            _443 = _445;
        }
        float _447 = _443;
        _291 = _447;
        if (!_399)
        {
            _409 = 0.0;
        }
        float _449 = _409;
        float _451 = _449;
        if (_399)
        {
            float _453 = _345 * _427;
            _451 = _453;
        }
        float _455 = _451;
        _297 = _455;
        if (!_399)
        {
            _411 = 0.0;
        }
        float _457 = _411;
        float _459 = _457;
        if (_399)
        {
            float _461 = _361 * _427;
            _459 = _461;
        }
        float _463 = _459;
        _303 = _463;
        if (!_401)
        {
            _413 = 0.0;
        }
        float _465 = _413;
        float _467 = _465;
        if (_401)
        {
            float _469 = _349 * _433;
            _467 = _469;
        }
        float _471 = _467;
        _293 = _471;
        if (!_401)
        {
            _415 = 0.0;
        }
        float _473 = _415;
        float _475 = _473;
        if (_401)
        {
            float _477 = _369 * _433;
            _475 = _477;
        }
        float _479 = _475;
        _305 = _479;
        if (!_401)
        {
            _417 = 0.0;
        }
        float _481 = _417;
        float _483 = _481;
        if (_401)
        {
            float _485 = _353 * _433;
            _483 = _485;
        }
        float _487 = _483;
        _299 = _487;
        if (!_403)
        {
            _419 = 0.0;
        }
        float _489 = _419;
        float _491 = _489;
        if (!_403)
        {
            _421 = 0.0;
        }
        float _493 = _421;
        float _495 = _493;
        if (_403)
        {
            float _497 = _357 * _439;
            _491 = _497;
        }
        float _499 = _491;
        _295 = _499;
        if (!_403)
        {
            _423 = 0.0;
        }
        float _501 = _423;
        _307 = _501;
        if (_403)
        {
            float _503 = _365 * _439;
            _495 = _503;
        }
        float _505 = _495;
        _301 = _505;
        if (_403)
        {
            float _507 = _373 * _439;
            _307 = _507;
        }
    }
    float _509 = _291;
    float _511 = _293;
    float _513 = _295;
    float _515 = _297;
    float _517 = _299;
    float _519 = _301;
    float _521 = _303;
    float _523 = _305;
    float _525 = _307;
    float _527 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _529 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _531 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _533 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[12]);
    float _535 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[16]);
    float _537 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[17]);
    float _539 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[3]);
    float _541 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _543 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _545 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _547 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _549 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[15]);
    float _551 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[0]);
    float _553 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[1]);
    float _555 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[2]);
    float _557 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[3]);
    bool _559 = _533 != 1.0;
    bool _561 = isnan(_533);
    bool _563 = _559 || _561;
    bool _565 = isnan(1.0);
    bool _567 = _563 || _565;
    float _569 = _567 ? _269 : 0.0;
    float _571 = _567 ? _275 : 0.3141500055789947509765625;
    float _573 = _535 * 0.00999999977648258209228515625;
    float _575 = _567 ? _281 : 0.92653000354766845703125;
    float _577 = _539 * _569;
    float _579 = _539 * _571;
    float _581 = _539 * _573;
    float _583 = _539 * _575;
    float _585 = _571;
    float _587 = _575;
    float _589 = _573;
    float _591 = _583;
    float _593 = _537;
    float _595 = _581;
    float _597 = _581;
    float _599 = _509;
    float _601 = _511;
    float _603 = _513;
    float _605 = _517;
    if (_567)
    {
        _585 = _577;
    }
    float _607 = _585;
    float _609 = _607;
    if (_567)
    {
        _587 = _579;
    }
    float _611 = _587;
    float _613 = 0.0;
    float _615 = _557;
    float _617 = _611;
    float _619 = _549;
    if (!_567)
    {
        float _621 = _537 * 0.00999999977648258209228515625;
        float _623 = _547 * _581;
        float _625 = fma(_275, 2.0, -1.0);
        float _627 = _539 * _621;
        float _629 = fma(_269, 2.0, -1.0);
        float _631 = fma(_281, 2.0, -1.0);
        float _633 = fma(_627, _625, _623);
        float _635 = fma(_627, _629, _623);
        float _637 = fma(_627, _631, _623);
        float _639 = _579 + _633;
        float _641 = _577 + _635;
        float _643 = _583 + _637;
        _613 = 2.0;
        _615 = _637;
        _589 = _631;
        _609 = _641;
        _617 = _639;
        _591 = _643;
    }
    float _645 = _613;
    float _647 = _615;
    float _649 = _589;
    float _651 = _609;
    float _653 = _617;
    float _655 = _591;
    float _657 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[13]);
    float _659 = -_541;
    float _661 = _659 + 1.0;
    float _663 = -_543;
    float _665 = _663 + 1.0;
    float _667 = abs(_543);
    float _669 = log2(_667);
    float _671 = _645;
    float _673 = _649;
    float _675 = _647;
    float _677 = _651;
    float _679 = _653;
    float _681 = _655;
    if (_567)
    {
        _671 = 0.0;
    }
    float _683 = _671;
    float _685 = _683;
    if (!_567)
    {
        float _687 = _541 * _581;
        _685 = _687;
    }
    float _689 = _685;
    float _691 = fma(_661, _665, _543);
    float _693 = -_285;
    float _695 = _547 + _693;
    float _697 = _527 * _545;
    float _699 = _531 * _545;
    bool _701 = _689 != 0.0;
    bool _703 = isnan(_689);
    bool _705 = _701 || _703;
    bool _707 = isnan(0.0);
    bool _709 = _705 || _707;
    bool _711 = _691 != 1.0;
    bool _713 = isnan(_691);
    bool _715 = _711 || _713;
    bool _717 = isnan(1.0);
    bool _719 = _715 || _717;
    float _721 = _541 * _697;
    bool _723 = _549 != 1.0;
    bool _725 = isnan(_549);
    bool _727 = _723 || _725;
    bool _729 = isnan(1.0);
    bool _731 = _727 || _729;
    bool _733 = !_719;
    bool _735 = _731 || _733;
    float _737 = _541 * _669;
    float _739 = _665;
    float _741 = _699;
    float _743 = _699;
    float _745 = _695;
    if (!_735)
    {
        float _747 = abs(_691);
        float _749 = log2(_747);
        _739 = _749;
    }
    float _751 = _739;
    if (!_735)
    {
        float _753 = -_691;
        float _755 = _753 + 1.0;
        _593 = _755;
    }
    float _757 = _593;
    float _759 = 0.0;
    if (_735)
    {
        _759 = _695;
    }
    float _761 = _759;
    float _763 = _761;
    if (!_735)
    {
        float _765 = 1.0 / _757;
        _673 = _765;
    }
    float _767 = _673;
    if (!_735)
    {
        float _769 = _695 * _751;
        _619 = _769;
    }
    float _771 = _619;
    float _773 = exp2(_737);
    float _775 = _771;
    if (!_735)
    {
        float _777 = exp2(_771);
        _775 = _777;
    }
    float _779 = _775;
    float _781 = fma(_183, _773, _721);
    if (!_735)
    {
        float _783 = -_779;
        float _785 = _783 + 1.0;
        _675 = _785;
    }
    float _787 = _675;
    float _789 = _541 * _699;
    if (!_735)
    {
        float _791 = _787 * _767;
        _763 = _791;
    }
    float _793 = _763;
    float _795 = _529 * _545;
    float _797 = _793 + _651;
    float _799 = _541 * _795;
    float _801 = _541 + _797;
    float _803 = fma(_189, _773, _799);
    float _805 = fma(_195, _773, _789);
    float _807 = _801 + _689;
    bool _809 = _657 != 1.0;
    bool _811 = isnan(_657);
    bool _813 = _809 || _811;
    bool _815 = isnan(1.0);
    bool _817 = _813 || _815;
    float _819 = _801;
    float _821 = _799;
    float _823 = _799;
    float _825 = _801;
    float _827 = _797;
    float _919;
    float _921;
    float _923;
    float _925;
    float _1059;
    float _1115;
    float _1129;
    float _1137;
    float _1139;
    float _1143;
    float _1147;
    float _1151;
    float _1155;
    float _1159;
    float _1161;
    float _1163;
    float _1165;
    if (!_709)
    {
        if (_817)
        {
            _819 = 0.60000002384185791015625;
        }
        float _829 = _819;
        float _831 = 0.0;
        if (!_817)
        {
            float _833 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[9]);
            _831 = _833;
        }
        float _835 = _831;
        if (_817)
        {
            _741 = 0.4199999868869781494140625;
        }
        float _837 = _741;
        if (_817)
        {
            _821 = 0.23000000417232513427734375;
        }
        float _839 = _821;
        float _841 = 0.0;
        if (!_817)
        {
            float _843 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[8]);
            _841 = _843;
        }
        float _845 = _841;
        float _847 = _829;
        if (!_817)
        {
            float _849 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _847 = _849;
        }
        float _851 = _847;
        float _853 = _837;
        if (!_817)
        {
            float _855 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _853 = _855;
        }
        float _857 = _853;
        if (_817)
        {
            _595 = 0.1500000059604644775390625;
        }
        float _859 = _595;
        float _861 = _839;
        if (!_817)
        {
            float _863 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _861 = _863;
        }
        float _865 = _861;
        float _867 = _859;
        if (!_817)
        {
            float _869 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _867 = _869;
        }
        float _871 = _867;
        float _873 = 0.0;
        if (!_817)
        {
            float _875 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[10]);
            _873 = _875;
        }
        float _877 = _873;
        float _879 = 0.0;
        if (!_817)
        {
            float _881 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[11]);
            _879 = _881;
        }
        float _883 = _879;
        if (_817)
        {
            _677 = 0.60000002384185791015625;
        }
        float _885 = _677;
        float _887 = _807 * 6.283184051513671875;
        float _889 = _539 * _851;
        float _891 = _885;
        float _893 = _851;
        if (!_817)
        {
            _891 = _851;
        }
        float _895 = _891;
        float _897 = _895;
        if (_817)
        {
            _893 = 0.4199999868869781494140625;
        }
        float _899 = _893;
        float _901 = _539 * _857;
        float _903 = 1.0 / _889;
        float _905 = _899;
        if (!_817)
        {
            _905 = _857;
        }
        float _907 = _905;
        float _909 = _539 * _865;
        float _911 = 1.0 / _901;
        float _913 = _539 * _871;
        float _915 = _539 * _895;
        float _917 = _907;
        _919 = _835;
        _921 = _845;
        _923 = _877;
        _925 = _883;
        if (_817)
        {
            _897 = 0.23000000417232513427734375;
        }
        float _927 = _897;
        float _929 = _539 * _907;
        float _931 = 1.0 / _909;
        float _933 = _927;
        if (!_817)
        {
            _933 = _865;
        }
        float _935 = _933;
        float _937 = _903 * _887;
        if (_817)
        {
            _917 = 0.1500000059604644775390625;
        }
        float _939 = _917;
        float _941 = 1.0 / _929;
        float _943 = _939;
        if (!_817)
        {
            _943 = _871;
        }
        float _945 = _943;
        float _947 = _539 * _935;
        float _949 = _937 * 0.15915493667125701904296875;
        float _951 = 1.0 / _913;
        float _953 = _911 * _887;
        float _955 = 1.0 / _915;
        float _957 = _539 * _945;
        float _959 = _953 * 0.15915493667125701904296875;
        float _961 = _931 * _887;
        float _963 = 1.0 / _947;
        float _965 = _961 * 0.15915493667125701904296875;
        float _967 = _797 * _941;
        float _969 = _951 * _887;
        float _971 = 1.0 / _957;
        float _973 = _967 * 6.283184051513671875;
        float _975 = _969 * 0.15915493667125701904296875;
        float _977 = _797 * _955;
        float _979 = _973 * 0.15915493667125701904296875;
        float _981 = _959 * 6.283185482025146484375;
        float _983 = sin(_981);
        float _985 = _977 * 6.283184051513671875;
        float _987 = _797 * _963;
        float _989 = _963;
        float _991 = _987;
        if (_817)
        {
            _989 = 3.0;
        }
        float _993 = _989;
        float _995 = _985 * 0.15915493667125701904296875;
        float _997 = _987 * 6.283184051513671875;
        float _999 = _979 * 6.283185482025146484375;
        float _1001 = sin(_999);
        float _1003 = _797 * _971;
        float _1005 = _993;
        float _1007 = _997;
        float _1009 = _971;
        if (!_817)
        {
            _1005 = _835;
        }
        float _1011 = _1005;
        float _1013 = _997 * 0.15915493667125701904296875;
        float _1015 = _1003 * 6.283184051513671875;
        float _1017 = _949 * 6.283185482025146484375;
        float _1019 = sin(_1017);
        float _1021 = _983 * _1011;
        float _1023 = _1015 * 0.15915493667125701904296875;
        float _1025 = _1015;
        float _1027 = _1021;
        if (_817)
        {
            _991 = 3.0;
        }
        float _1029 = _991;
        float _1031 = _995 * 6.283185482025146484375;
        float _1033 = sin(_1031);
        float _1035 = _1029;
        if (!_817)
        {
            _1035 = _835;
        }
        float _1037 = _1035;
        float _1039 = _1037;
        if (_817)
        {
            _1007 = 4.0;
        }
        float _1041 = _1007;
        float _1043 = _965 * 6.283185482025146484375;
        float _1045 = sin(_1043);
        float _1047 = _1041;
        if (!_817)
        {
            _1047 = _845;
        }
        float _1049 = _1047;
        float _1051 = _1001 * _1037;
        float _1053 = _1013 * 6.283185482025146484375;
        float _1055 = sin(_1053);
        float _1057 = _1049;
        _1059 = _1001;
        if (_817)
        {
            _1039 = 4.0;
        }
        float _1061 = _1039;
        float _1063 = _1061;
        if (!_817)
        {
            _1063 = _845;
        }
        float _1065 = _1063;
        float _1067 = _975 * 6.283185482025146484375;
        float _1069 = sin(_1067);
        float _1071 = fma(_1019, _1049, _1021);
        float _1073 = _1071;
        if (_817)
        {
            _1025 = 2.0;
        }
        float _1075 = _1025;
        float _1077 = _1023 * 6.283185482025146484375;
        float _1079 = sin(_1077);
        float _1081 = _1075;
        if (_817)
        {
            _1057 = 2.0;
        }
        float _1083 = _1057;
        float _1085 = fma(_1033, _1065, _1051);
        float _1087 = _1083;
        if (!_817)
        {
            _1081 = _877;
        }
        float _1089 = _1081;
        float _1091 = _1089;
        if (!_817)
        {
            _1087 = _877;
        }
        float _1093 = _1087;
        float _1095 = _1093;
        if (_817)
        {
            _1009 = 1.5;
        }
        float _1097 = _1009;
        float _1099 = _1097;
        if (_817)
        {
            _1027 = 1.5;
        }
        float _1101 = _1027;
        float _1103 = fma(_1045, _1089, _1071);
        float _1105 = _1101;
        float _1107 = _1103;
        if (!_817)
        {
            _1099 = _883;
        }
        float _1109 = _1099;
        float _1111 = fma(_1055, _1093, _1085);
        float _1113 = _1109;
        _1115 = _1055;
        if (!_817)
        {
            _1105 = _883;
        }
        float _1117 = _1105;
        float _1119 = fma(_1069, _1109, _1103);
        float _1121 = fma(_1079, _1117, _1111);
        float _1123 = _1117;
        float _1125 = _1079;
        if (_817)
        {
            _1091 = 1.5;
        }
        float _1127 = _1091;
        _1129 = _1127;
        if (_817)
        {
            _1113 = 2.0;
        }
        float _1131 = _1113;
        float _1133 = -_1121;
        float _1135 = _1119 + _1133;
        _1137 = _1131;
        _1139 = _1135;
        if (_817)
        {
            _1123 = 3.0;
        }
        float _1141 = _1123;
        _1143 = _1141;
        if (_817)
        {
            _1095 = 4.0;
        }
        float _1145 = _1095;
        _1147 = _1145;
        if (_817)
        {
            _1073 = 0.1500000059604644775390625;
        }
        float _1149 = _1073;
        _1151 = _1149;
        if (_817)
        {
            _1107 = 0.23000000417232513427734375;
        }
        float _1153 = _1107;
        _1155 = _1153;
        if (_817)
        {
            _1125 = 0.4199999868869781494140625;
        }
        float _1157 = _1125;
        _1159 = _1157;
        _1161 = 0.0;
        _1163 = 0.0;
        _1165 = 0.0;
        _1167 = true;
    }
    else
    {
        if (_817)
        {
            _823 = 0.4199999868869781494140625;
        }
        float _1169 = _823;
        float _1171 = 0.0;
        if (!_817)
        {
            float _1173 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[9]);
            _1171 = _1173;
        }
        float _1175 = _1171;
        if (_817)
        {
            _597 = 0.60000002384185791015625;
        }
        float _1177 = _597;
        float _1179 = 0.0;
        if (_817)
        {
            _1179 = 0.23000000417232513427734375;
        }
        float _1181 = _1179;
        float _1183 = 0.0;
        if (!_817)
        {
            float _1185 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[8]);
            _1183 = _1185;
        }
        float _1187 = _1183;
        float _1189 = _1169;
        if (!_817)
        {
            float _1191 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _1189 = _1191;
        }
        float _1193 = _1189;
        float _1195 = 0.0;
        if (_817)
        {
            _1195 = 0.1500000059604644775390625;
        }
        float _1197 = _1195;
        float _1199 = _1177;
        if (!_817)
        {
            float _1201 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _1199 = _1201;
        }
        float _1203 = _1199;
        float _1205 = _1181;
        if (!_817)
        {
            float _1207 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _1205 = _1207;
        }
        float _1209 = _1205;
        float _1211 = _1197;
        if (!_817)
        {
            float _1213 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _1211 = _1213;
        }
        float _1215 = _1211;
        float _1217 = 0.0;
        if (!_817)
        {
            float _1219 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[10]);
            _1217 = _1219;
        }
        float _1221 = _1217;
        float _1223 = 0.0;
        if (!_817)
        {
            float _1225 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[11]);
            _1223 = _1225;
        }
        float _1227 = _1223;
        if (_817)
        {
            _825 = 0.4199999868869781494140625;
        }
        float _1229 = _825;
        float _1231 = _1229;
        if (_817)
        {
            _743 = 0.4199999868869781494140625;
        }
        float _1233 = _743;
        float _1235 = _1233;
        float _1237 = _1193;
        if (!_817)
        {
            _1231 = _1193;
        }
        float _1239 = _1231;
        float _1241 = _539 * _1193;
        float _1243 = _1239;
        if (!_817)
        {
            _1235 = _1193;
        }
        float _1245 = _1235;
        float _1247 = _539 * _1239;
        float _1249 = _1245;
        if (_817)
        {
            _1243 = 0.4199999868869781494140625;
        }
        float _1251 = _1243;
        float _1253 = _1251;
        if (!_817)
        {
            _1253 = _1193;
        }
        float _1255 = _1253;
        float _1257 = 1.0 / _1241;
        float _1259 = _1255;
        if (_817)
        {
            _1237 = 0.60000002384185791015625;
        }
        float _1261 = _1237;
        float _1263 = _539 * _1203;
        float _1265 = _539 * _1255;
        float _1267 = _1261;
        if (_817)
        {
            _1259 = 0.60000002384185791015625;
        }
        float _1269 = _1259;
        float _1271 = _539 * _1209;
        float _1273 = _1269;
        _919 = _1175;
        if (!_817)
        {
            _1267 = _1203;
        }
        float _1275 = _1267;
        float _1277 = _539 * _1245;
        float _1279 = _1275;
        if (_817)
        {
            _1249 = 0.60000002384185791015625;
        }
        float _1281 = _1249;
        float _1283 = _1281;
        if (!_817)
        {
            _1283 = _1203;
        }
        float _1285 = _1283;
        float _1287 = _1285;
        if (!_817)
        {
            _1273 = _1203;
        }
        float _1289 = _1273;
        float _1291 = 1.0 / _1263;
        float _1293 = _539 * _1215;
        float _1295 = 1.0 / _1271;
        float _1297 = _539 * _1275;
        float _1299 = _1289;
        if (_817)
        {
            _1279 = 0.23000000417232513427734375;
        }
        float _1301 = _1279;
        float _1303 = _1301;
        if (!_817)
        {
            _1303 = _1209;
        }
        float _1305 = _1303;
        float _1307 = 1.0 / _1247;
        float _1309 = _539 * _1285;
        float _1311 = _1305;
        if (_817)
        {
            _1287 = 0.23000000417232513427734375;
        }
        float _1313 = _1287;
        float _1315 = _1313;
        if (!_817)
        {
            _1315 = _1209;
        }
        float _1317 = _1315;
        float _1319 = _539 * _1289;
        float _1321 = _1317;
        if (_817)
        {
            _1299 = 0.23000000417232513427734375;
        }
        float _1323 = _1299;
        float _1325 = _1323;
        if (!_817)
        {
            _1325 = _1209;
        }
        float _1327 = _1325;
        float _1329 = 1.0 / _1293;
        float _1331 = 1.0 / _1277;
        float _1333 = _539 * _1317;
        float _1335 = _1327;
        if (_817)
        {
            _1321 = 0.1500000059604644775390625;
        }
        float _1337 = _1321;
        float _1339 = _1337;
        if (!_817)
        {
            _1339 = _1215;
        }
        float _1341 = _1339;
        float _1343 = 1.0 / _1265;
        float _1345 = _539 * _1305;
        if (_817)
        {
            _1311 = 0.1500000059604644775390625;
        }
        float _1347 = _1311;
        float _1349 = _1347;
        if (!_817)
        {
            _1349 = _1215;
        }
        float _1351 = _1349;
        float _1353 = _539 * _1327;
        if (_817)
        {
            _1335 = 0.1500000059604644775390625;
        }
        float _1355 = _1335;
        float _1357 = _1355;
        if (!_817)
        {
            _1357 = _1215;
        }
        float _1359 = _1357;
        float _1361 = _807 * 6.283184051513671875;
        float _1363 = 1.0 / _1297;
        float _1365 = 1.0 / _1345;
        float _1367 = _539 * _1359;
        float _1369 = _1257 * _1361;
        float _1371 = 1.0 / _1319;
        float _1373 = _539 * _1341;
        float _1375 = _1369 * 0.15915493667125701904296875;
        float _1377 = _1291 * _1361;
        float _1379 = 1.0 / _1333;
        float _1381 = _1377 * 0.15915493667125701904296875;
        float _1383 = _1295 * _1361;
        float _1385 = _651 + _689;
        float _1387 = 1.0 / _1309;
        float _1389 = _1385 * 6.283184051513671875;
        float _1391 = _1331 * _1389;
        float _1393 = _539 * _1351;
        float _1395 = _1383 * 0.15915493667125701904296875;
        float _1397 = _1329 * _1361;
        float _1399 = _651 * 6.283184051513671875;
        float _1401 = 1.0 / _1367;
        float _1403 = _797 * _1307;
        float _1405 = _1391 * 0.15915493667125701904296875;
        float _1407 = _1343 * _1399;
        float _1409 = _1375 * 6.283185482025146484375;
        float _1411 = sin(_1409);
        float _1413 = _1407 * 0.15915493667125701904296875;
        float _1415 = _1387 * _1389;
        float _1417 = 1.0 / _1353;
        float _1419 = _1415 * 0.15915493667125701904296875;
        float _1421 = _1371 * _1399;
        float _1423 = _1403 * 6.283184051513671875;
        float _1425 = 1.0 / _1373;
        float _1427 = _1421 * 0.15915493667125701904296875;
        float _1429 = _1423 * 0.15915493667125701904296875;
        float _1431 = _1421;
        float _1433 = _1373;
        if (_817)
        {
            _1431 = 3.0;
        }
        float _1435 = _1431;
        float _1437 = _1413 * 6.283185482025146484375;
        float _1439 = sin(_1437);
        float _1441 = _1435;
        if (!_817)
        {
            _1441 = _1175;
        }
        float _1443 = _1441;
        float _1445 = _1379 * _1389;
        float _1447 = _1405 * 6.283185482025146484375;
        float _1449 = sin(_1447);
        float _1451 = _1411 * _1443;
        float _1453 = _1417 * _1399;
        float _1455 = _1443;
        float _1457 = _1445;
        if (_817)
        {
            _1455 = 3.0;
        }
        float _1459 = _1455;
        float _1461 = _1459;
        if (!_817)
        {
            _1461 = _1175;
        }
        float _1463 = _1461;
        float _1465 = _1429 * 6.283185482025146484375;
        float _1467 = sin(_1465);
        float _1469 = _1445 * 0.15915493667125701904296875;
        if (_817)
        {
            _1457 = 3.0;
        }
        float _1471 = _1457;
        float _1473 = _1453 * 0.15915493667125701904296875;
        float _1475 = _1471;
        if (!_817)
        {
            _1475 = _1175;
        }
        float _1477 = _1475;
        float _1479 = _1419 * 6.283185482025146484375;
        float _1481 = sin(_1479);
        float _1483 = _1425 * _1389;
        float _1485 = _1439 * _1463;
        float _1487 = _797 * _1363;
        float _1489 = 1.0 / _1393;
        float _1491 = _1477;
        float _1493 = _1487;
        if (_817)
        {
            _1433 = 3.0;
        }
        float _1495 = _1433;
        float _1497 = _1449 * _1477;
        float _1499 = _1495;
        _1115 = _1497;
        if (!_817)
        {
            _1499 = _1175;
        }
        float _1501 = _1499;
        float _1503 = _1381 * 6.283185482025146484375;
        float _1505 = sin(_1503);
        float _1507 = _1483 * 0.15915493667125701904296875;
        float _1509 = _1487 * 6.283184051513671875;
        float _1511 = _1501;
        if (_817)
        {
            _1491 = 4.0;
        }
        float _1513 = _1491;
        float _1515 = _1513;
        _921 = _1187;
        _923 = _1221;
        _925 = _1227;
        if (!_817)
        {
            _1515 = _1187;
        }
        float _1517 = _1515;
        float _1519 = _1467 * _1501;
        float _1521 = _797 * _1365;
        if (_817)
        {
            _1511 = 4.0;
        }
        float _1523 = _1511;
        float _1525 = _1509 * 0.15915493667125701904296875;
        float _1527 = _1523;
        if (!_817)
        {
            _1527 = _1187;
        }
        float _1529 = _1527;
        float _1531 = fma(_1481, _1517, _1497);
        float _1533 = _1427 * 6.283185482025146484375;
        float _1535 = sin(_1533);
        float _1537 = _797 * _1489;
        float _1539 = _1521 * 6.283184051513671875;
        float _1541 = _1401 * _1399;
        float _1543 = fma(_1505, _1529, _1451);
        float _1545 = _1537 * 6.283184051513671875;
        float _1547 = _1539 * 0.15915493667125701904296875;
        float _1549 = _1525 * 6.283185482025146484375;
        float _1551 = sin(_1549);
        float _1553 = _1397 * 0.15915493667125701904296875;
        float _1555 = _1541 * 0.15915493667125701904296875;
        float _1557 = _1545 * 0.15915493667125701904296875;
        float _1559 = _1489;
        float _1561 = _1539;
        float _1563 = _1545;
        float _1565 = _1543;
        if (_817)
        {
            _1493 = 4.0;
        }
        float _1567 = _1493;
        float _1569 = _1395 * 6.283185482025146484375;
        float _1571 = sin(_1569);
        float _1573 = _1567;
        if (!_817)
        {
            _1573 = _1187;
        }
        float _1575 = _1573;
        float _1577 = _1469 * 6.283185482025146484375;
        float _1579 = sin(_1577);
        float _1581 = _1575;
        if (_817)
        {
            _827 = 4.0;
        }
        float _1583 = _827;
        float _1585 = _1473 * 6.283185482025146484375;
        float _1587 = sin(_1585);
        float _1589 = _1583;
        if (!_817)
        {
            _1589 = _1187;
        }
        float _1591 = _1589;
        float _1593 = fma(_1535, _1575, _1485);
        float _1595 = _1547 * 6.283185482025146484375;
        float _1597 = sin(_1595);
        float _1599 = _1591;
        _1165 = _1535;
        if (_817)
        {
            _1581 = 2.0;
        }
        float _1601 = _1581;
        float _1603 = _1601;
        if (_817)
        {
            _1559 = 2.0;
        }
        float _1605 = _1559;
        float _1607 = _1605;
        if (_817)
        {
            _1561 = 2.0;
        }
        float _1609 = _1561;
        float _1611 = _1553 * 6.283185482025146484375;
        float _1613 = sin(_1611);
        float _1615 = _1609;
        if (!_817)
        {
            _1603 = _1221;
        }
        float _1617 = _1603;
        float _1619 = fma(_1551, _1591, _1519);
        float _1621 = _1617;
        _1059 = _1619;
        if (!_817)
        {
            _1607 = _1221;
        }
        float _1623 = _1607;
        float _1625 = _1507 * 6.283185482025146484375;
        float _1627 = sin(_1625);
        float _1629 = _1623;
        if (!_817)
        {
            _1615 = _1221;
        }
        float _1631 = _1615;
        float _1633 = _1555 * 6.283185482025146484375;
        float _1635 = sin(_1633);
        float _1637 = _1631;
        if (_817)
        {
            _1599 = 2.0;
        }
        float _1639 = _1599;
        float _1641 = _1557 * 6.283185482025146484375;
        float _1643 = sin(_1641);
        float _1645 = _1639;
        if (!_817)
        {
            _1645 = _1221;
        }
        float _1647 = _1645;
        float _1649 = fma(_1571, _1617, _1543);
        float _1651 = fma(_1579, _1623, _1531);
        float _1653 = fma(_1587, _1631, _1593);
        float _1655 = _1647;
        _1161 = _1579;
        if (_817)
        {
            _1563 = 1.5;
        }
        float _1657 = _1563;
        float _1659 = _1657;
        if (_817)
        {
            _1621 = 1.5;
        }
        float _1661 = _1621;
        float _1663 = _1661;
        if (_817)
        {
            _1629 = 1.5;
        }
        float _1665 = _1629;
        float _1667 = _1665;
        if (_817)
        {
            _1637 = 1.5;
        }
        float _1669 = _1637;
        float _1671 = fma(_1597, _1647, _1619);
        float _1673 = _1669;
        if (!_817)
        {
            _1659 = _1227;
        }
        float _1675 = _1659;
        if (!_817)
        {
            _1667 = _1227;
        }
        float _1677 = _1667;
        float _1679 = _1677;
        if (!_817)
        {
            _1673 = _1227;
        }
        float _1681 = _1673;
        if (!_817)
        {
            _1663 = _1227;
        }
        float _1683 = _1663;
        float _1685 = fma(_1613, _1675, _1649);
        float _1687 = fma(_1627, _1677, _1651);
        float _1689 = fma(_1635, _1681, _1653);
        float _1691 = fma(_1643, _1683, _1671);
        float _1693 = -_1687;
        float _1695 = _1693 + _1689;
        float _1697 = -_1691;
        float _1699 = _1685 + _1697;
        float _1701 = _1691;
        float _1703 = _1613;
        float _1705 = _1699;
        _1159 = _1643;
        _1163 = _1687;
        if (_817)
        {
            _1655 = 1.5;
        }
        float _1707 = _1655;
        _1129 = _1707;
        if (_817)
        {
            _1701 = 2.0;
        }
        float _1709 = _1701;
        float _1711 = _1699 + _1695;
        _1137 = _1709;
        _1139 = _1711;
        if (_817)
        {
            _1679 = 3.0;
        }
        float _1713 = _1679;
        _1143 = _1713;
        if (_817)
        {
            _1703 = 4.0;
        }
        float _1715 = _1703;
        _1147 = _1715;
        if (_817)
        {
            _1705 = 0.1500000059604644775390625;
        }
        float _1717 = _1705;
        _1151 = _1717;
        if (_817)
        {
            _1565 = 0.23000000417232513427734375;
        }
        float _1719 = _1565;
        _1155 = _1719;
        if (_817)
        {
            _1159 = 0.4199999868869781494140625;
        }
    }
    _1167 = false;
    float _1721 = _1159;
    float _1723 = _1155;
    float _1725 = _1059;
    float _1727 = _1151;
    float _1729 = _1115;
    float _1731 = _1161;
    float _1733 = _1163;
    float _1735 = _1165;
    float _1737 = _1143;
    float _1739 = _919;
    float _1741 = _1147;
    float _1743 = _921;
    float _1745 = _1137;
    float _1747 = _923;
    float _1749 = _1129;
    float _1751 = _925;
    float _1753 = _1139;
    float _1755 = _793 + _653;
    float _1757 = _541 + _1755;
    float _1759 = _1757 + _689;
    float _1761 = _1725;
    float _1763 = _1729;
    float _1765 = _1731;
    float _1767 = _1757;
    float _1769 = _1729;
    float _1771 = _1731;
    float _1773 = _1733;
    float _1775 = _1735;
    float _1777 = _1757;
    float _1779 = _1725;
    float _1781 = _1755;
    float _1783 = _1721;
    float _1785 = _1723;
    float _1787 = _1727;
    float _1789 = _1745;
    float _1791 = _1737;
    float _1793 = _1741;
    float _1795 = _1749;
    float _1797 = _1721;
    float _1799 = _1723;
    float _1801 = _1727;
    float _1803 = _1749;
    float _1805 = _1751;
    float _1807 = _1737;
    float _1809 = _1741;
    float _1811 = _1745;
    float _1987;
    float _2067;
    float _2069;
    float _2071;
    if (!_709)
    {
        if (_817)
        {
            _679 = _1721;
        }
        float _1813 = _679;
        if (_817)
        {
            _1761 = 0.60000002384185791015625;
        }
        float _1815 = _1761;
        float _1817 = _1813;
        if (!_817)
        {
            float _1819 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _1817 = _1819;
        }
        float _1821 = _1817;
        if (_817)
        {
            _1763 = _1723;
        }
        float _1823 = _1763;
        float _1825 = _1815;
        if (!_817)
        {
            float _1827 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _1825 = _1827;
        }
        float _1829 = _1825;
        if (_817)
        {
            _1765 = _1727;
        }
        float _1831 = _1765;
        float _1833 = _1823;
        if (!_817)
        {
            float _1835 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _1833 = _1835;
        }
        float _1837 = _1833;
        float _1839 = _1831;
        if (!_817)
        {
            float _1841 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _1839 = _1841;
        }
        float _1843 = _1839;
        if (_817)
        {
            _1767 = _1721;
        }
        float _1845 = _1767;
        float _1847 = _1759 * 6.283184051513671875;
        float _1849 = _539 * _1821;
        float _1851 = _1845;
        float _1853 = _1821;
        if (!_817)
        {
            _1851 = _1821;
        }
        float _1855 = _1851;
        float _1857 = _1855;
        if (_817)
        {
            _1853 = 0.60000002384185791015625;
        }
        float _1859 = _1853;
        float _1861 = 1.0 / _1849;
        float _1863 = _539 * _1829;
        float _1865 = _1859;
        if (!_817)
        {
            _1865 = _1829;
        }
        float _1867 = _1865;
        float _1869 = _539 * _1855;
        float _1871 = _539 * _1837;
        float _1873 = _1867;
        if (_817)
        {
            _1857 = _1723;
        }
        float _1875 = _1857;
        float _1877 = _1875;
        if (!_817)
        {
            _1877 = _1837;
        }
        float _1879 = _1877;
        float _1881 = 1.0 / _1863;
        float _1883 = _539 * _1843;
        float _1885 = _539 * _1879;
        float _1887 = 1.0 / _1871;
        float _1889 = _539 * _1867;
        if (_817)
        {
            _1873 = _1727;
        }
        float _1891 = _1873;
        float _1893 = _1891;
        if (!_817)
        {
            _1893 = _1843;
        }
        float _1895 = _1893;
        float _1897 = 1.0 / _1869;
        float _1899 = _539 * _1895;
        float _1901 = _1861 * _1847;
        float _1903 = _1901 * 0.15915493667125701904296875;
        float _1905 = _1881 * _1847;
        float _1907 = 1.0 / _1883;
        float _1909 = _1905 * 0.15915493667125701904296875;
        float _1911 = _1887 * _1847;
        float _1913 = 1.0 / _1889;
        float _1915 = _1911 * 0.15915493667125701904296875;
        float _1917 = 1.0 / _1885;
        float _1919 = _1755 * _1897;
        float _1921 = _1907 * _1847;
        float _1923 = _1919 * 6.283184051513671875;
        float _1925 = _1921 * 0.15915493667125701904296875;
        float _1927 = 1.0 / _1899;
        float _1929 = _1755 * _1913;
        float _1931 = _1923 * 0.15915493667125701904296875;
        float _1933 = _1929 * 6.283184051513671875;
        float _1935 = _1903 * 6.283185482025146484375;
        float _1937 = sin(_1935);
        float _1939 = _1755 * _1917;
        float _1941 = _1933 * 0.15915493667125701904296875;
        float _1943 = _1917;
        float _1945 = _1939;
        if (_817)
        {
            _1943 = _1737;
        }
        float _1947 = _1943;
        float _1949 = _1939 * 6.283184051513671875;
        float _1951 = _1947;
        float _1953 = _1949;
        if (_817)
        {
            _1945 = _1737;
        }
        float _1955 = _1945;
        float _1957 = _1931 * 6.283185482025146484375;
        float _1959 = sin(_1957);
        float _1961 = _1755 * _1927;
        float _1963 = _1949 * 0.15915493667125701904296875;
        float _1965 = _1955;
        if (!_817)
        {
            _1951 = _1739;
        }
        float _1967 = _1951;
        float _1969 = _1961 * 6.283184051513671875;
        float _1971 = _1967;
        float _1973 = _1969;
        if (!_817)
        {
            _1965 = _1739;
        }
        float _1975 = _1965;
        float _1977 = _1909 * 6.283185482025146484375;
        float _1979 = sin(_1977);
        float _1981 = _1969 * 0.15915493667125701904296875;
        float _1983 = _1937 * _1967;
        float _1985 = _1975;
        _1987 = _1981;
        if (_817)
        {
            _1953 = _1741;
        }
        float _1989 = _1953;
        float _1991 = _1989;
        if (!_817)
        {
            _1991 = _1743;
        }
        float _1993 = _1991;
        float _1995 = _1993;
        if (_817)
        {
            _1971 = _1745;
        }
        float _1997 = _1971;
        float _1999 = _1941 * 6.283185482025146484375;
        float _2001 = sin(_1999);
        float _2003 = _1959 * _1975;
        float _2005 = _1997;
        if (_817)
        {
            _1985 = _1741;
        }
        float _2007 = _1985;
        float _2009 = _2007;
        if (!_817)
        {
            _2009 = _1743;
        }
        float _2011 = _2009;
        if (!_817)
        {
            _2005 = _1747;
        }
        float _2013 = _2005;
        float _2015 = _1915 * 6.283185482025146484375;
        float _2017 = sin(_2015);
        float _2019 = fma(_1979, _1993, _1983);
        float _2021 = _1979;
        if (_817)
        {
            _1995 = _1745;
        }
        float _2023 = _1995;
        float _2025 = _2023;
        if (!_817)
        {
            _2025 = _1747;
        }
        float _2027 = _2025;
        if (_817)
        {
            _2021 = _1749;
        }
        float _2029 = _2021;
        float _2031 = _1963 * 6.283185482025146484375;
        float _2033 = sin(_2031);
        float _2035 = fma(_2001, _2011, _2003);
        float _2037 = _2029;
        if (_817)
        {
            _1973 = _1749;
        }
        float _2039 = _1973;
        float _2041 = _2039;
        if (!_817)
        {
            _2037 = _1751;
        }
        float _2043 = _2037;
        if (!_817)
        {
            _2041 = _1751;
        }
        float _2045 = _2041;
        float _2047 = _1925 * 6.283185482025146484375;
        float _2049 = sin(_2047);
        float _2051 = fma(_2017, _2013, _2019);
        float _2053 = _1981 * 6.283185482025146484375;
        float _2055 = sin(_2053);
        float _2057 = fma(_2033, _2027, _2035);
        float _2059 = fma(_2049, _2043, _2051);
        float _2061 = fma(_2055, _2045, _2057);
        float _2063 = -_2061;
        float _2065 = _2059 + _2063;
        _2067 = _2051;
        _2069 = _2061;
        _2071 = _2065;
        _2073 = true;
    }
    else
    {
        if (_817)
        {
            _1769 = _1721;
        }
        float _2075 = _1769;
        if (_817)
        {
            _1771 = 0.60000002384185791015625;
        }
        float _2077 = _1771;
        float _2079 = _2075;
        if (!_817)
        {
            float _2081 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _2079 = _2081;
        }
        float _2083 = _2079;
        if (_817)
        {
            _1773 = _1723;
        }
        float _2085 = _1773;
        float _2087 = _2077;
        if (!_817)
        {
            float _2089 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _2087 = _2089;
        }
        float _2091 = _2087;
        if (_817)
        {
            _1775 = _1727;
        }
        float _2093 = _1775;
        float _2095 = _2085;
        if (!_817)
        {
            float _2097 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _2095 = _2097;
        }
        float _2099 = _2095;
        float _2101 = _2093;
        if (!_817)
        {
            float _2103 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _2101 = _2103;
        }
        float _2105 = _2101;
        if (_817)
        {
            _1777 = _1721;
        }
        float _2107 = _1777;
        float _2109 = _1759 * 6.283184051513671875;
        float _2111 = _2107;
        if (_817)
        {
            _1779 = _1721;
        }
        float _2113 = _1779;
        float _2115 = _653 * 6.283184051513671875;
        float _2117 = _2113;
        float _2119 = _2083;
        if (!_817)
        {
            _2111 = _2083;
        }
        float _2121 = _2111;
        float _2123 = _539 * _2083;
        float _2125 = _2121;
        if (!_817)
        {
            _2117 = _2083;
        }
        float _2127 = _2117;
        float _2129 = _539 * _2091;
        float _2131 = _539 * _2121;
        float _2133 = _2127;
        if (_817)
        {
            _2125 = _1721;
        }
        float _2135 = _2125;
        float _2137 = 1.0 / _2123;
        float _2139 = _2135;
        if (!_817)
        {
            _2139 = _2083;
        }
        float _2141 = _2139;
        float _2143 = _539 * _2099;
        float _2145 = _2141;
        if (_817)
        {
            _2119 = 0.60000002384185791015625;
        }
        float _2147 = _2119;
        float _2149 = _539 * _2105;
        float _2151 = _539 * _2141;
        float _2153 = _2147;
        if (_817)
        {
            _2145 = 0.60000002384185791015625;
        }
        float _2155 = _2145;
        float _2157 = 1.0 / _2129;
        float _2159 = _2155;
        if (!_817)
        {
            _2159 = _2091;
        }
        float _2161 = _2159;
        float _2163 = _2161;
        if (!_817)
        {
            _2153 = _2091;
        }
        float _2165 = _2153;
        float _2167 = 1.0 / _2143;
        float _2169 = _539 * _2127;
        float _2171 = _2165;
        if (_817)
        {
            _2133 = 0.60000002384185791015625;
        }
        float _2173 = _2133;
        float _2175 = _2173;
        if (!_817)
        {
            _2175 = _2091;
        }
        float _2177 = _2175;
        float _2179 = 1.0 / _2149;
        float _2181 = _539 * _2161;
        float _2183 = _2177;
        if (_817)
        {
            _2163 = _1723;
        }
        float _2185 = _2163;
        float _2187 = _539 * _2177;
        float _2189 = _2185;
        if (!_817)
        {
            _2189 = _2099;
        }
        float _2191 = _2189;
        float _2193 = _2191;
        if (_817)
        {
            _2183 = _1723;
        }
        float _2195 = _2183;
        float _2197 = 1.0 / _2187;
        float _2199 = _2195;
        if (!_817)
        {
            _2199 = _2099;
        }
        float _2201 = _2199;
        float _2203 = _539 * _2165;
        float _2205 = _2201;
        if (_817)
        {
            _2171 = _1723;
        }
        float _2207 = _2171;
        float _2209 = _2207;
        if (!_817)
        {
            _2209 = _2099;
        }
        float _2211 = _2209;
        float _2213 = 1.0 / _2131;
        float _2215 = _539 * _2191;
        float _2217 = _2211;
        if (_817)
        {
            _2193 = _1727;
        }
        float _2219 = _2193;
        float _2221 = _2219;
        if (!_817)
        {
            _2221 = _2105;
        }
        float _2223 = _2221;
        float _2225 = 1.0 / _2215;
        float _2227 = _539 * _2201;
        if (_817)
        {
            _2205 = _1727;
        }
        float _2229 = _2205;
        float _2231 = _2229;
        if (!_817)
        {
            _2231 = _2105;
        }
        float _2233 = _2231;
        float _2235 = 1.0 / _2151;
        float _2237 = _2137 * _2109;
        float _2239 = _539 * _2233;
        float _2241 = 1.0 / _2227;
        float _2243 = _2225 * _2115;
        float _2245 = 1.0 / _2169;
        float _2247 = _2237 * 0.15915493667125701904296875;
        float _2249 = _2157 * _2109;
        float _2251 = _2249 * 0.15915493667125701904296875;
        float _2253 = _2167 * _2109;
        float _2255 = 1.0 / _2181;
        float _2257 = _539 * _2211;
        if (_817)
        {
            _2217 = _1727;
        }
        float _2259 = _2217;
        float _2261 = _2259;
        if (!_817)
        {
            _2261 = _2105;
        }
        float _2263 = _2261;
        float _2265 = 1.0 / _2239;
        float _2267 = _539 * _2263;
        float _2269 = _539 * _2223;
        float _2271 = _2253 * 0.15915493667125701904296875;
        float _2273 = _2179 * _2109;
        float _2275 = _2247 * 6.283185482025146484375;
        float _2277 = sin(_2275);
        float _2279 = _653 + _689;
        float _2281 = _2235 * _2115;
        float _2283 = _2243 * 0.15915493667125701904296875;
        float _2285 = _2273 * 0.15915493667125701904296875;
        float _2287 = _2279 * 6.283184051513671875;
        float _2289 = 1.0 / _2203;
        float _2291 = _2245 * _2287;
        float _2293 = _2281 * 0.15915493667125701904296875;
        float _2295 = _2197 * _2287;
        float _2297 = _2265 * _2287;
        float _2299 = _2291 * 0.15915493667125701904296875;
        float _2301 = _1755 * _2213;
        float _2303 = _2295 * 0.15915493667125701904296875;
        float _2305 = _2255 * _2115;
        float _2307 = _2293 * 6.283185482025146484375;
        float _2309 = sin(_2307);
        float _2311 = _2301 * 6.283184051513671875;
        float _2313 = _2305 * 0.15915493667125701904296875;
        float _2315 = _2305;
        float _2317 = _2289;
        float _2319 = _2269;
        if (_817)
        {
            _2315 = _1737;
        }
        float _2321 = _2315;
        float _2323 = _2311 * 0.15915493667125701904296875;
        float _2325 = _2241 * _2287;
        float _2327 = _2321;
        float _2329 = _2325;
        if (!_817)
        {
            _2327 = _1739;
        }
        float _2331 = _2327;
        float _2333 = _2299 * 6.283185482025146484375;
        float _2335 = sin(_2333);
        float _2337 = _2325 * 0.15915493667125701904296875;
        float _2339 = _2331;
        if (_817)
        {
            _2329 = _1737;
        }
        float _2341 = _2329;
        float _2343 = _2277 * _2331;
        float _2345 = _2341;
        if (_817)
        {
            _2339 = _1737;
        }
        float _2347 = _2339;
        float _2349 = _2347;
        if (!_817)
        {
            _2349 = _1739;
        }
        float _2351 = _2349;
        float _2353 = _2323 * 6.283185482025146484375;
        float _2355 = sin(_2353);
        if (!_817)
        {
            _2345 = _1739;
        }
        float _2357 = _2345;
        float _2359 = _2309 * _2351;
        float _2361 = _1755 * _2289;
        float _2363 = _2357;
        float _2365 = _2361;
        if (_817)
        {
            _2317 = _1741;
        }
        float _2367 = _2317;
        float _2369 = 1.0 / _2257;
        float _2371 = _2297 * 0.15915493667125701904296875;
        float _2373 = _2335 * _2357;
        float _2375 = _2367;
        if (_817)
        {
            _2363 = _1741;
        }
        float _2377 = _2363;
        float _2379 = _2377;
        if (!_817)
        {
            _2379 = _1743;
        }
        float _2381 = _2379;
        if (!_817)
        {
            _2375 = _1743;
        }
        float _2383 = _2375;
        float _2385 = _2313 * 6.283185482025146484375;
        float _2387 = sin(_2385);
        float _2389 = 1.0 / _2269;
        float _2391 = _1755 * _2369;
        float _2393 = _2303 * 6.283185482025146484375;
        float _2395 = sin(_2393);
        float _2397 = _2391;
        if (_817)
        {
            _2319 = _1737;
        }
        float _2399 = _2319;
        float _2401 = _2399;
        if (!_817)
        {
            _2401 = _1739;
        }
        float _2403 = _2401;
        float _2405 = 1.0 / _2267;
        float _2407 = _2355 * _2403;
        float _2409 = _2361 * 6.283184051513671875;
        if (_817)
        {
            _2365 = _1741;
        }
        float _2411 = _2365;
        float _2413 = _2411;
        if (!_817)
        {
            _2413 = _1743;
        }
        float _2415 = _2413;
        float _2417 = _2409 * 0.15915493667125701904296875;
        float _2419 = _2389 * _2115;
        float _2421 = _2251 * 6.283185482025146484375;
        float _2423 = sin(_2421);
        float _2425 = fma(_2395, _2381, _2373);
        float _2427 = fma(_2387, _2415, _2359);
        float _2429 = _2391 * 6.283184051513671875;
        float _2431 = _2419 * 0.15915493667125701904296875;
        float _2433 = _2429;
        if (_817)
        {
            _2397 = _1745;
        }
        float _2435 = _2397;
        float _2437 = _2435;
        if (!_817)
        {
            _2437 = _1747;
        }
        float _2439 = _2437;
        float _2441 = _2271 * 6.283185482025146484375;
        float _2443 = sin(_2441);
        float _2445 = _1755 * _2405;
        float _2447 = _2405;
        float _2449 = _2439;
        float _2451 = _2443;
        if (_817)
        {
            _2447 = _1745;
        }
        float _2453 = _2447;
        float _2455 = _2453;
        if (!_817)
        {
            _2455 = _1747;
        }
        float _2457 = _2455;
        float _2459 = _2445 * 6.283184051513671875;
        float _2461 = _2459;
        if (_817)
        {
            _1781 = _1741;
        }
        float _2463 = _1781;
        float _2465 = _2417 * 6.283185482025146484375;
        float _2467 = sin(_2465);
        float _2469 = fma(_2423, _2383, _2343);
        float _2471 = _2429 * 0.15915493667125701904296875;
        float _2473 = _2459 * 0.15915493667125701904296875;
        float _2475 = _2463;
        _2069 = _2473;
        if (!_817)
        {
            _2475 = _1743;
        }
        float _2477 = _2475;
        float _2479 = _2477;
        if (_817)
        {
            _2433 = _1745;
        }
        float _2481 = _2433;
        float _2483 = _2337 * 6.283185482025146484375;
        float _2485 = sin(_2483);
        float _2487 = _2481;
        if (!_817)
        {
            _2487 = _1747;
        }
        float _2489 = _2487;
        float _2491 = _2489;
        if (_817)
        {
            _2461 = _1749;
        }
        float _2493 = _2461;
        float _2495 = _2493;
        if (!_817)
        {
            _2495 = _1751;
        }
        float _2497 = _2495;
        float _2499 = _2283 * 6.283185482025146484375;
        float _2501 = sin(_2499);
        float _2503 = fma(_2467, _2477, _2407);
        if (_817)
        {
            _2479 = _1745;
        }
        float _2505 = _2479;
        float _2507 = _2505;
        if (!_817)
        {
            _2507 = _1747;
        }
        float _2509 = _2507;
        float _2511 = _2471 * 6.283185482025146484375;
        float _2513 = sin(_2511);
        float _2515 = fma(_2485, _2439, _2425);
        if (_817)
        {
            _2449 = _1749;
        }
        float _2517 = _2449;
        float _2519 = _2517;
        if (!_817)
        {
            _2519 = _1751;
        }
        float _2521 = _2519;
        float _2523 = _2431 * 6.283185482025146484375;
        float _2525 = sin(_2523);
        float _2527 = fma(_2501, _2489, _2427);
        if (_817)
        {
            _2491 = _1749;
        }
        float _2529 = _2491;
        float _2531 = _2529;
        if (!_817)
        {
            _2531 = _1751;
        }
        float _2533 = _2531;
        float _2535 = _2285 * 6.283185482025146484375;
        float _2537 = sin(_2535);
        float _2539 = fma(_2443, _2457, _2469);
        if (_817)
        {
            _2451 = _1749;
        }
        float _2541 = _2451;
        float _2543 = fma(_2513, _2509, _2503);
        float _2545 = _2541;
        _1987 = _2543;
        if (!_817)
        {
            _2545 = _1751;
        }
        float _2547 = _2545;
        float _2549 = _2371 * 6.283185482025146484375;
        float _2551 = sin(_2549);
        float _2553 = fma(_2525, _2533, _2527);
        float _2555 = _2473 * 6.283185482025146484375;
        float _2557 = sin(_2555);
        float _2559 = fma(_2537, _2497, _2539);
        float _2561 = fma(_2551, _2521, _2515);
        float _2563 = -_2561;
        float _2565 = _2563 + _2553;
        float _2567 = fma(_2557, _2547, _2543);
        float _2569 = -_2567;
        float _2571 = _2559 + _2569;
        float _2573 = _2571 + _2565;
        _2067 = _2571;
        _2071 = _2573;
    }
    _2073 = false;
    float _2575 = _2067;
    float _2577 = _2069;
    float _2579 = _1987;
    float _2581 = _2071;
    float _2583 = _793 + _655;
    float _2585 = _289 * _541;
    float _2587 = _541 + _2583;
    float _2589 = fma(_189, _2585, _167);
    float _2591 = fma(_195, _2585, _173);
    float _2593 = fma(_183, _2585, _161);
    float _2595 = _2587 + _689;
    float _2597 = _2587;
    float _2599 = _2575;
    float _2601 = _2587;
    float _2603 = _2577;
    float _2605 = _2579;
    float _2607 = _2583;
    float _2821;
    if (!_709)
    {
        if (_817)
        {
            _309 = _1721;
        }
        float _2609 = _309;
        if (_817)
        {
            _311 = 0.60000002384185791015625;
        }
        float _2611 = _311;
        float _2613 = _2609;
        if (!_817)
        {
            float _2615 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _2613 = _2615;
        }
        float _2617 = _2613;
        if (_817)
        {
            _681 = _1723;
        }
        float _2619 = _681;
        float _2621 = _2611;
        if (!_817)
        {
            float _2623 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _2621 = _2623;
        }
        float _2625 = _2621;
        if (_817)
        {
            _2597 = _1727;
        }
        float _2627 = _2597;
        float _2629 = _2619;
        if (!_817)
        {
            float _2631 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _2629 = _2631;
        }
        float _2633 = _2629;
        float _2635 = _2627;
        if (!_817)
        {
            float _2637 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _2635 = _2637;
        }
        float _2639 = _2635;
        float _2641 = _2595 * 6.283184051513671875;
        float _2643 = _539 * _2617;
        float _2645 = _2617;
        if (!_817)
        {
            _1783 = _2617;
        }
        float _2647 = _1783;
        if (_817)
        {
            _2645 = 0.60000002384185791015625;
        }
        float _2649 = _2645;
        float _2651 = _539 * _2625;
        float _2653 = _2649;
        float _2655 = _2625;
        if (!_817)
        {
            _2653 = _2625;
        }
        float _2657 = _2653;
        float _2659 = 1.0 / _2643;
        float _2661 = _539 * _2647;
        float _2663 = _539 * _2633;
        if (!_817)
        {
            _1785 = _2633;
        }
        float _2665 = _1785;
        if (_817)
        {
            _2655 = _1745;
        }
        float _2667 = _2655;
        float _2669 = _539 * _2639;
        float _2671 = _2667;
        if (!_817)
        {
            _1787 = _2639;
        }
        float _2673 = _1787;
        float _2675 = 1.0 / _2651;
        float _2677 = _539 * _2665;
        if (!_817)
        {
            _2671 = _1747;
        }
        float _2679 = _2671;
        float _2681 = _539 * _2673;
        if (!_817)
        {
            _1789 = _1747;
        }
        float _2683 = _1789;
        float _2685 = 1.0 / _2663;
        float _2687 = _539 * _2657;
        float _2689 = _2659 * _2641;
        float _2691 = _2689 * 0.15915493667125701904296875;
        float _2693 = 1.0 / _2669;
        float _2695 = _2675 * _2641;
        float _2697 = _2695 * 0.15915493667125701904296875;
        float _2699 = 1.0 / _2661;
        float _2701 = _2685 * _2641;
        float _2703 = _2701 * 0.15915493667125701904296875;
        float _2705 = 1.0 / _2687;
        float _2707 = _2693 * _2641;
        float _2709 = 1.0 / _2677;
        float _2711 = _2583 * _2699;
        float _2713 = _2711 * 6.283184051513671875;
        float _2715 = 1.0 / _2681;
        float _2717 = _2713 * 0.15915493667125701904296875;
        float _2719 = _2691 * 6.283185482025146484375;
        float _2721 = sin(_2719);
        float _2723 = _2707 * 0.15915493667125701904296875;
        float _2725 = _2583 * _2705;
        float _2727 = _2725 * 6.283184051513671875;
        float _2729 = _2583 * _2709;
        float _2731 = _2583 * _2715;
        float _2733 = _2717 * 6.283185482025146484375;
        float _2735 = sin(_2733);
        float _2737 = _2727 * 0.15915493667125701904296875;
        float _2739 = _2729 * 6.283184051513671875;
        float _2741 = _2731 * 6.283184051513671875;
        float _2743 = _2727;
        float _2745 = _2739;
        if (_817)
        {
            _2743 = _1737;
        }
        float _2747 = _2743;
        float _2749 = _2739 * 0.15915493667125701904296875;
        float _2751 = _2741 * 0.15915493667125701904296875;
        float _2753 = _2697 * 6.283185482025146484375;
        float _2755 = sin(_2753);
        float _2757 = _2747;
        if (!_817)
        {
            _2757 = _1739;
        }
        float _2759 = _2757;
        if (!_817)
        {
            _1791 = _1739;
        }
        float _2761 = _1791;
        float _2763 = _2761;
        if (_817)
        {
            _2745 = _1741;
        }
        float _2765 = _2745;
        float _2767 = _2721 * _2759;
        float _2769 = _2765;
        if (!_817)
        {
            _2769 = _1743;
        }
        float _2771 = _2769;
        float _2773 = _2737 * 6.283185482025146484375;
        float _2775 = sin(_2773);
        if (!_817)
        {
            _1793 = _1743;
        }
        float _2777 = _1793;
        float _2779 = _2735 * _2761;
        if (_817)
        {
            _2763 = _1749;
        }
        float _2781 = _2763;
        float _2783 = _2781;
        if (!_817)
        {
            _2783 = _1751;
        }
        float _2785 = _2783;
        if (!_817)
        {
            _1795 = _1751;
        }
        float _2787 = _1795;
        float _2789 = _2703 * 6.283185482025146484375;
        float _2791 = sin(_2789);
        float _2793 = fma(_2755, _2771, _2767);
        float _2795 = _2749 * 6.283185482025146484375;
        float _2797 = sin(_2795);
        float _2799 = fma(_2775, _2777, _2779);
        float _2801 = _2723 * 6.283185482025146484375;
        float _2803 = sin(_2801);
        float _2805 = fma(_2791, _2679, _2793);
        float _2807 = _2751 * 6.283185482025146484375;
        float _2809 = sin(_2807);
        float _2811 = fma(_2797, _2683, _2799);
        float _2813 = fma(_2803, _2785, _2805);
        float _2815 = fma(_2809, _2787, _2811);
        float _2817 = -_2815;
        float _2819 = _2813 + _2817;
        _2821 = _2819;
        _2823 = true;
    }
    else
    {
        if (_817)
        {
            _2599 = _1721;
        }
        float _2825 = _2599;
        if (_817)
        {
            _2601 = 0.60000002384185791015625;
        }
        float _2827 = _2601;
        if (_817)
        {
            _2603 = _1723;
        }
        float _2829 = _2603;
        float _2831 = _2825;
        if (!_817)
        {
            float _2833 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _2831 = _2833;
        }
        float _2835 = _2831;
        float _2837 = _2827;
        if (!_817)
        {
            float _2839 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _2837 = _2839;
        }
        float _2841 = _2837;
        if (_817)
        {
            _2605 = _1727;
        }
        float _2843 = _2605;
        float _2845 = _2829;
        if (!_817)
        {
            float _2847 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _2845 = _2847;
        }
        float _2849 = _2845;
        float _2851 = _2843;
        if (!_817)
        {
            float _2853 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _2851 = _2853;
        }
        float _2855 = _2851;
        if (_817)
        {
            _313 = _1721;
        }
        float _2857 = _313;
        float _2859 = _2595 * 6.283184051513671875;
        float _2861 = _2857;
        if (_817)
        {
            _315 = _1721;
        }
        float _2863 = _315;
        float _2865 = _655 * 6.283184051513671875;
        float _2867 = _655 + _689;
        float _2869 = _2863;
        if (!_817)
        {
            _2861 = _2835;
        }
        float _2871 = _2861;
        float _2873 = _539 * _2835;
        float _2875 = _2871;
        if (!_817)
        {
            _2869 = _2835;
        }
        float _2877 = _2869;
        float _2879 = _539 * _2841;
        float _2881 = _2877;
        if (!_817)
        {
            _1797 = _2835;
        }
        float _2883 = _1797;
        float _2885 = 1.0 / _2873;
        float _2887 = _539 * _2877;
        float _2889 = _539 * _2849;
        if (_817)
        {
            _2881 = 0.60000002384185791015625;
        }
        float _2891 = _2881;
        float _2893 = _539 * _2883;
        float _2895 = _2891;
        if (!_817)
        {
            _2895 = _2841;
        }
        float _2897 = _2895;
        float _2899 = _539 * _2855;
        float _2901 = 1.0 / _2879;
        float _2903 = _539 * _2897;
        float _2905 = _2897;
        float _2907 = _2901;
        if (_817)
        {
            _2905 = _1723;
        }
        float _2909 = _2905;
        float _2911 = _2909;
        if (!_817)
        {
            _2911 = _2849;
        }
        float _2913 = _2911;
        float _2915 = 1.0 / _2889;
        float _2917 = _539 * _2871;
        float _2919 = _2913;
        if (_817)
        {
            _2875 = 0.60000002384185791015625;
        }
        float _2921 = _2875;
        float _2923 = _2921;
        if (!_817)
        {
            _2923 = _2841;
        }
        float _2925 = _2923;
        float _2927 = 1.0 / _2899;
        float _2929 = _539 * _2925;
        float _2931 = _2925;
        if (_817)
        {
            _2931 = 0.60000002384185791015625;
        }
        float _2933 = _2931;
        float _2935 = _2933;
        if (!_817)
        {
            _2935 = _2841;
        }
        float _2937 = _2935;
        float _2939 = 1.0 / _2917;
        float _2941 = _539 * _2937;
        float _2943 = _2937;
        if (_817)
        {
            _2943 = _1723;
        }
        float _2945 = _2943;
        float _2947 = _2945;
        if (!_817)
        {
            _2947 = _2849;
        }
        float _2949 = _2947;
        float _2951 = _2949;
        if (!_817)
        {
            _1799 = _2849;
        }
        float _2953 = _1799;
        float _2955 = _2867 * 6.283184051513671875;
        float _2957 = 1.0 / _2887;
        float _2959 = _539 * _2913;
        float _2961 = _539 * _2949;
        if (_817)
        {
            _2919 = _1727;
        }
        float _2963 = _2919;
        float _2965 = _2963;
        if (!_817)
        {
            _2965 = _2855;
        }
        float _2967 = _2965;
        if (_817)
        {
            _2951 = _1727;
        }
        float _2969 = _2951;
        float _2971 = 1.0 / _2893;
        float _2973 = _2969;
        if (!_817)
        {
            _2973 = _2855;
        }
        float _2975 = _2973;
        float _2977 = _2939 * _2955;
        if (!_817)
        {
            _1801 = _2855;
        }
        float _2979 = _1801;
        float _2981 = _2977 * 0.15915493667125701904296875;
        float _2983 = 1.0 / _2903;
        float _2985 = _2583 * _2957;
        float _2987 = 1.0 / _2961;
        float _2989 = _539 * _2953;
        float _2991 = _539 * _2967;
        float _2993 = _539 * _2975;
        float _2995 = _2885 * _2859;
        float _2997 = _2971 * _2865;
        float _2999 = 1.0 / _2941;
        float _3001 = _539 * _2979;
        float _3003 = _2995 * 0.15915493667125701904296875;
        float _3005 = _2901 * _2859;
        if (_817)
        {
            _2907 = _1749;
        }
        float _3007 = _2907;
        float _3009 = _3007;
        if (!_817)
        {
            _3009 = _1751;
        }
        float _3011 = _3009;
        float _3013 = _3005 * 0.15915493667125701904296875;
        float _3015 = _2915 * _2859;
        float _3017 = 1.0 / _2993;
        float _3019 = 1.0 / _3001;
        float _3021 = _3015 * 0.15915493667125701904296875;
        float _3023 = _2927 * _2859;
        float _3025 = _2997 * 0.15915493667125701904296875;
        float _3027 = _2983 * _2955;
        float _3029 = _2983;
        if (_817)
        {
            _3029 = _1745;
        }
        float _3031 = _3029;
        float _3033 = _3023 * 0.15915493667125701904296875;
        float _3035 = _3031;
        if (!_817)
        {
            _3035 = _1747;
        }
        float _3037 = _3035;
        float _3039 = _3027 * 0.15915493667125701904296875;
        float _3041 = _2999 * _2865;
        float _3043 = 1.0 / _2929;
        float _3045 = _3041 * 0.15915493667125701904296875;
        float _3047 = _2987 * _2955;
        float _3049 = _3047 * 0.15915493667125701904296875;
        float _3051 = 1.0 / _2959;
        float _3053 = _3017 * _2955;
        float _3055 = _3017;
        if (_817)
        {
            _3055 = _1749;
        }
        float _3057 = _3055;
        float _3059 = _3057;
        if (!_817)
        {
            _3059 = _1751;
        }
        float _3061 = _3059;
        float _3063 = _3053 * 0.15915493667125701904296875;
        float _3065 = _3019 * _2865;
        float _3067 = _3019;
        if (_817)
        {
            _3067 = _1745;
        }
        float _3069 = _3067;
        float _3071 = 1.0 / _2989;
        float _3073 = _3069;
        float _3075 = _3071;
        if (!_817)
        {
            _3073 = _1747;
        }
        float _3077 = _3073;
        float _3079 = _3065 * 0.15915493667125701904296875;
        float _3081 = _2985 * 6.283184051513671875;
        float _3083 = _2583 * _3043;
        float _3085 = _3043;
        float _3087 = _3081;
        if (_817)
        {
            _3085 = _1737;
        }
        float _3089 = _3085;
        float _3091 = _3081 * 0.15915493667125701904296875;
        float _3093 = 1.0 / _2991;
        float _3095 = _3083 * 6.283184051513671875;
        float _3097 = _2583 * _3051;
        float _3099 = _3089;
        if (_817)
        {
            _3087 = _1737;
        }
        float _3101 = _3087;
        float _3103 = _3095 * 0.15915493667125701904296875;
        float _3105 = _3097 * 6.283184051513671875;
        float _3107 = _3101;
        if (!_817)
        {
            _3099 = _1739;
        }
        float _3109 = _3099;
        float _3111 = _2981 * 6.283185482025146484375;
        float _3113 = sin(_3111);
        if (!_817)
        {
            _3107 = _1739;
        }
        float _3115 = _3107;
        float _3117 = _3105 * 0.15915493667125701904296875;
        float _3119 = _2583 * _3093;
        float _3121 = _3071 * _2865;
        float _3123 = _3003 * 6.283185482025146484375;
        float _3125 = sin(_3123);
        float _3127 = _3093;
        float _3129 = _3119;
        float _3131 = _3121;
        if (_817)
        {
            _3075 = _1749;
        }
        float _3133 = _3075;
        float _3135 = _3119 * 6.283184051513671875;
        float _3137 = _3121 * 0.15915493667125701904296875;
        float _3139 = _3133;
        if (!_817)
        {
            _3139 = _1751;
        }
        float _3141 = _3139;
        float _3143 = _3135 * 0.15915493667125701904296875;
        if (!_817)
        {
            _1803 = _1751;
        }
        float _3145 = _1803;
        float _3147 = _3025 * 6.283185482025146484375;
        float _3149 = sin(_3147);
        if (_817)
        {
            _1805 = _1737;
        }
        float _3151 = _1805;
        float _3153 = _3113 * _3115;
        float _3155 = _3151;
        if (!_817)
        {
            _3155 = _1739;
        }
        float _3157 = _3155;
        if (!_817)
        {
            _1807 = _1739;
        }
        float _3159 = _1807;
        if (_817)
        {
            _2607 = _1741;
        }
        float _3161 = _2607;
        float _3163 = _3091 * 6.283185482025146484375;
        float _3165 = sin(_3163);
        float _3167 = _3161;
        if (_817)
        {
            _3127 = _1741;
        }
        float _3169 = _3127;
        float _3171 = _3125 * _3157;
        float _3173 = _3169;
        if (_817)
        {
            _3129 = _1741;
        }
        float _3175 = _3129;
        float _3177 = _3175;
        if (!_817)
        {
            _3167 = _1743;
        }
        float _3179 = _3167;
        if (!_817)
        {
            _3173 = _1743;
        }
        float _3181 = _3173;
        float _3183 = _3013 * 6.283185482025146484375;
        float _3185 = sin(_3183);
        if (!_817)
        {
            _3177 = _1743;
        }
        float _3187 = _3177;
        float _3189 = _3149 * _3159;
        if (!_817)
        {
            _1809 = _1743;
        }
        float _3191 = _1809;
        if (_817)
        {
            _3131 = _1745;
        }
        float _3193 = _3131;
        float _3195 = _3193;
        if (!_817)
        {
            _3195 = _1747;
        }
        float _3197 = _3195;
        float _3199 = _3039 * 6.283185482025146484375;
        float _3201 = sin(_3199);
        float _3203 = _3165 * _3109;
        if (!_817)
        {
            _1811 = _1747;
        }
        float _3205 = _1811;
        float _3207 = _3045 * 6.283185482025146484375;
        float _3209 = sin(_3207);
        float _3211 = fma(_3185, _3179, _3171);
        float _3213 = _3103 * 6.283185482025146484375;
        float _3215 = sin(_3213);
        float _3217 = fma(_3201, _3187, _3153);
        float _3219 = _3021 * 6.283185482025146484375;
        float _3221 = sin(_3219);
        float _3223 = fma(_3209, _3191, _3189);
        float _3225 = _3049 * 6.283185482025146484375;
        float _3227 = sin(_3225);
        float _3229 = fma(_3215, _3181, _3203);
        float _3231 = _3137 * 6.283185482025146484375;
        float _3233 = sin(_3231);
        float _3235 = fma(_3221, _3037, _3211);
        float _3237 = _3117 * 6.283185482025146484375;
        float _3239 = sin(_3237);
        float _3241 = fma(_3227, _3197, _3217);
        float _3243 = _3033 * 6.283185482025146484375;
        float _3245 = sin(_3243);
        float _3247 = fma(_3233, _3205, _3223);
        float _3249 = _3063 * 6.283185482025146484375;
        float _3251 = sin(_3249);
        float _3253 = fma(_3239, _3077, _3229);
        float _3255 = _3079 * 6.283185482025146484375;
        float _3257 = sin(_3255);
        float _3259 = fma(_3245, _3011, _3235);
        float _3261 = _3143 * 6.283185482025146484375;
        float _3263 = sin(_3261);
        float _3265 = fma(_3251, _3141, _3241);
        float _3267 = fma(_3257, _3145, _3247);
        float _3269 = -_3265;
        float _3271 = _3269 + _3267;
        float _3273 = fma(_3263, _3061, _3253);
        float _3275 = -_3273;
        float _3277 = _3259 + _3275;
        float _3279 = _3277 + _3271;
        _2821 = _3279;
    }
    _2823 = false;
    float _3281 = _2821;
    float _3283 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[27]);
    float _3285 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _3287 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[24]);
    float _3289 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[25]);
    float _3291 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[26]);
    float _3293 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _3295 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _3297 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _3299 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _3301 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    float _3303 = fma(_551, _1753, _2593);
    float _3305 = fma(_553, _2581, _2589);
    float _3307 = fma(_555, _3281, _2591);
    uint _3309 = uint(int(uint(_179) >> uint(2)));
    float _3311 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_3309)]);
    float _3313 = trunc(_3283);
    int _3315 = int(_3313);
    bool _3317 = _3285 > 0.0;
    float _3319 = _289 * _3289;
    float _3321 = _289 * _3287;
    float _3323 = _289 * _3291;
    float _3325 = _541 * _3319;
    bool _3327 = _3293 > 0.0;
    float _3329 = _541 * _3321;
    bool _3331 = _3315 != 1;
    float _3333 = _3285;
    float _3335 = _3295;
    float _3337 = _3319;
    float _3339 = _3281;
    bool _3341 = _3327;
    if (_3317)
    {
        float _3343 = 1.0 / _3285;
        _3333 = _3343;
    }
    float _3345 = _3333;
    float _3347 = _3295 * _3293;
    float _3349 = _541 * _3297;
    float _3351 = _541 * _3301;
    if (_3327)
    {
        float _3353 = -_3347;
        float _3355 = fma(_269, _3353, _3295);
        _3335 = _3355;
    }
    float _3357 = _3335;
    float _3359 = _3357;
    if (!_3331)
    {
        float _3361 = _3325 * _509;
        _599 = _3361;
    }
    float _3363 = _599;
    if (!_3331)
    {
        float _3365 = _3325 * _511;
        _3337 = _3365;
    }
    float _3367 = _3337;
    float _3369 = _3367;
    if (!_3331)
    {
        float _3371 = _3325 * _513;
        _601 = _3371;
    }
    float _3373 = _601;
    float _3375 = _3373;
    if (_3331)
    {
        _603 = _3329;
    }
    float _3377 = _603;
    float _3379 = _3377;
    if (!_3331)
    {
        float _3381 = fma(_3329, _515, _3363);
        _3339 = _3381;
    }
    float _3383 = _3339;
    if (_3317)
    {
        float _3385 = _695 * _3345;
        _745 = _3385;
    }
    float _3387 = _745;
    float _3389 = _541 * _3323;
    float _3391 = _3387;
    float _3393 = _3389;
    if (!_3331)
    {
        float _3395 = fma(_3329, _517, _3367);
        _3369 = _3395;
    }
    float _3397 = _3369;
    if (!_3331)
    {
        float _3399 = fma(_3329, _519, _3373);
        _605 = _3399;
    }
    float _3401 = _605;
    float _3403 = _3401;
    if (_3331)
    {
        _3375 = _3325;
    }
    float _3405 = _3375;
    float _3407 = _3405;
    if (!_3331)
    {
        float _3409 = fma(_3389, _521, _3383);
        _3379 = _3409;
    }
    float _3411 = _3379;
    if (_3317)
    {
        float _3413 = precise::min(_3387, 1.0);
        _3391 = _3413;
    }
    float _3415 = _3391;
    if (!_3331)
    {
        float _3417 = fma(_3389, _523, _3397);
        _3407 = _3417;
    }
    float _3419 = _3407;
    float _3421 = _3419;
    if (!_3331)
    {
        float _3423 = fma(_3389, _525, _3401);
        _3393 = _3423;
    }
    float _3425 = _3393;
    float _3427 = _3303 + _3411;
    float _3429 = _541 * _3299;
    float _3431 = _3425;
    if (_3317)
    {
        float _3433 = _3415 * _3357;
        _3359 = _3433;
    }
    float _3435 = _3359;
    float _3437 = _3305 + _3419;
    float _3439 = _3307 + _3425;
    float _3441 = _3349 * _3435;
    float _3443 = _3429 * _3435;
    float _3445 = _3351 * _3435;
    bool _3447 = !_177;
    float _3569;
    float _3571;
    float _3573;
    if (!_3447)
    {
        float _3449 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _3451 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _3453 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _3455 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _3457 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _3459 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _3461 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _3463 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _3465 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _3467 = _3453 * _3455;
        float _3469 = _3453 * _3457;
        float _3471 = _3451 * _3455;
        float _3473 = -_3467;
        float _3475 = fma(_3449, _3459, _3473);
        float _3477 = -_3469;
        float _3479 = fma(_3451, _3459, _3477);
        float _3481 = -_3471;
        float _3483 = fma(_3449, _3457, _3481);
        float _3485 = _3463 * _3449;
        float _3487 = _3463 * _3475;
        float _3489 = _3465 * _3451;
        float _3491 = _3461 * _3457;
        float _3493 = -_3485;
        float _3495 = fma(_3461, _3451, _3493);
        float _3497 = -_3487;
        float _3499 = fma(_3461, _3479, _3497);
        float _3501 = _3463 * _3459;
        float _3503 = _3465 * _3455;
        float _3505 = -_3491;
        float _3507 = fma(_3463, _3455, _3505);
        float _3509 = fma(_3465, _3483, _3499);
        float _3511 = -_3501;
        float _3513 = fma(_3465, _3457, _3511);
        float _3515 = -_3503;
        float _3517 = fma(_3461, _3459, _3515);
        float _3519 = _3461 * _3453;
        float _3521 = 1.0 / _3509;
        float _3523 = -_3449;
        float _3525 = fma(_3523, _3459, _3467);
        float _3527 = -_3489;
        float _3529 = fma(_3463, _3453, _3527);
        float _3531 = -_3519;
        float _3533 = fma(_3465, _3449, _3531);
        float _3535 = _3513 * _3521;
        float _3537 = _3517 * _3521;
        float _3539 = _3507 * _3521;
        float _3541 = _3441 * _3521;
        float _3543 = _3443 * _3535;
        float _3545 = _3443 * _3537;
        float _3547 = _3443 * _3539;
        float _3549 = _3525 * _3521;
        float _3551 = _3529 * _3521;
        float _3553 = fma(_3479, _3541, _3543);
        float _3555 = _3533 * _3521;
        float _3557 = _3495 * _3521;
        float _3559 = fma(_3441, _3549, _3545);
        float _3561 = fma(_3483, _3541, _3547);
        float _3563 = fma(_3445, _3551, _3553);
        float _3565 = fma(_3445, _3555, _3559);
        float _3567 = fma(_3445, _3557, _3561);
        _3569 = _3563;
        _3571 = _3565;
        _3573 = _3567;
        _3575 = true;
    }
    else
    {
        int _3577 = as_type<int>(_155) & 1024;
        bool _3579 = _3577 != 0;
        if (_3579)
        {
            _3341 = true;
        }
        bool _3581 = _3341;
        bool _3583 = _3581;
        if (!_3579)
        {
            int _3585 = as_type<int>(_155) & 2048;
            bool _3587 = _3585 != 0;
            _3583 = _3587;
        }
        bool _3589 = _3583;
        if (!_3589)
        {
            _3403 = _3441;
        }
        float _3591 = _3403;
        _3569 = _3591;
        if (!_3589)
        {
            _3431 = _3443;
        }
        float _3593 = _3431;
        _3571 = _3593;
        if (!_3589)
        {
            _3421 = _3445;
        }
        float _3595 = _3421;
        bool _3597 = !_3589;
        _3573 = _3595;
        if (!_3597)
        {
            uint _3599 = uint(int(uint(_157) >> uint(2)));
            float _3601 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3599)]);
            int _3603 = _157 + 4;
            uint _3605 = uint(int(uint(_3603) >> uint(2)));
            float _3607 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3605)]);
            int _3609 = _157 + 8;
            uint _3611 = uint(int(uint(_3609) >> uint(2)));
            float _3613 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3611)]);
            uint _3615 = uint(int(uint(_157) >> uint(2)));
            float _3617 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3615)]);
            int _3619 = _157 + 4;
            uint _3621 = uint(int(uint(_3619) >> uint(2)));
            float _3623 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3621)]);
            int _3625 = _157 + 8;
            uint _3627 = uint(int(uint(_3625) >> uint(2)));
            float _3629 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3627)]);
            uint _3631 = uint(int(uint(_157) >> uint(2)));
            float _3633 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3631)]);
            int _3635 = _157 + 4;
            uint _3637 = uint(int(uint(_3635) >> uint(2)));
            float _3639 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3637)]);
            int _3641 = _157 + 8;
            uint _3643 = uint(int(uint(_3641) >> uint(2)));
            float _3645 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3643)]);
            float _3647 = _3613 * _3617;
            float _3649 = _3613 * _3623;
            float _3651 = _3607 * _3617;
            float _3653 = -_3647;
            float _3655 = fma(_3601, _3629, _3653);
            float _3657 = -_3649;
            float _3659 = fma(_3607, _3629, _3657);
            float _3661 = -_3651;
            float _3663 = fma(_3601, _3623, _3661);
            float _3665 = _3639 * _3601;
            float _3667 = _3639 * _3655;
            float _3669 = _3645 * _3607;
            float _3671 = _3633 * _3623;
            float _3673 = -_3665;
            float _3675 = fma(_3633, _3607, _3673);
            float _3677 = -_3667;
            float _3679 = fma(_3633, _3659, _3677);
            float _3681 = _3639 * _3629;
            float _3683 = _3645 * _3617;
            float _3685 = -_3671;
            float _3687 = fma(_3639, _3617, _3685);
            float _3689 = fma(_3645, _3663, _3679);
            float _3691 = -_3681;
            float _3693 = fma(_3645, _3623, _3691);
            float _3695 = -_3683;
            float _3697 = fma(_3633, _3629, _3695);
            float _3699 = _3633 * _3613;
            float _3701 = 1.0 / _3689;
            float _3703 = -_3601;
            float _3705 = fma(_3703, _3629, _3647);
            float _3707 = -_3669;
            float _3709 = fma(_3639, _3613, _3707);
            float _3711 = -_3699;
            float _3713 = fma(_3645, _3601, _3711);
            float _3715 = _3693 * _3701;
            float _3717 = _3697 * _3701;
            float _3719 = _3687 * _3701;
            float _3721 = _3441 * _3701;
            float _3723 = _3443 * _3715;
            float _3725 = _3443 * _3717;
            float _3727 = _3443 * _3719;
            float _3729 = _3705 * _3701;
            float _3731 = _3709 * _3701;
            float _3733 = fma(_3659, _3721, _3723);
            float _3735 = _3713 * _3701;
            float _3737 = _3675 * _3701;
            float _3739 = fma(_3441, _3729, _3725);
            float _3741 = fma(_3663, _3721, _3727);
            float _3743 = fma(_3445, _3731, _3733);
            float _3745 = fma(_3445, _3735, _3739);
            float _3747 = fma(_3445, _3737, _3741);
            _3569 = _3743;
            _3571 = _3745;
            _3573 = _3747;
        }
    }
    _3575 = false;
    float _3749 = _3569;
    float _3751 = _3571;
    float _3753 = _3573;
    float _3755 = _3427 + _3749;
    float _3757 = _3437 + _3751;
    int _3759 = _157 + 4;
    float _3761 = _3439 + _3753;
    int _3763 = _157 + 8;
    uint _3765 = uint(int(uint(_179) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3765)] = as_type<uint>(_3311);
    float _3767 = -_161;
    float _3769 = _3767 + _3755;
    float _3771 = -_167;
    float _3773 = _3771 + _3757;
    uint _3775 = uint(int(uint(_157) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3775)] = as_type<uint>(_3755);
    float _3777 = -_173;
    float _3779 = _3777 + _3761;
    uint _3781 = uint(int(uint(_3759) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3781)] = as_type<uint>(_3757);
    uint _3783 = uint(int(uint(_3763) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3783)] = as_type<uint>(_3761);
    uint _3785 = uint(int(uint(_157) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3785)] = as_type<uint>(_781);
    uint _3787 = uint(int(uint(_3759) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3787)] = as_type<uint>(_803);
    uint _3789 = uint(int(uint(_3763) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3789)] = as_type<uint>(_805);
    uint _3791 = uint(int(uint(_157) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3791)] = as_type<uint>(_3769);
    uint _3793 = uint(int(uint(_3759) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3793)] = as_type<uint>(_3773);
    uint _3795 = uint(int(uint(_3763) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3795)] = as_type<uint>(_3779);
    float _3797 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _3799 = _3773 * _3773;
    float _3801 = _803 * _803;
    float _3803 = fma(_3769, _3769, _3799);
    float _3805 = fma(_781, _781, _3801);
    float _3807 = fma(_3779, _3779, _3803);
    float _3809 = fma(_805, _805, _3805);
    float _3811 = sqrt(_3809);
    float _3813 = sqrt(_3807);
    bool _3815 = _3813 >= 9.9999999747524270787835121154785e-07;
    bool _3817 = isnan(_3813);
    bool _3819 = _3815 || _3817;
    bool _3821 = isnan(9.9999999747524270787835121154785e-07);
    bool _3823 = _3819 || _3821;
    if (!_3823)
    {
        bool _3825 = _547 != _285;
        bool _3827 = isnan(_547);
        bool _3829 = _3825 || _3827;
        bool _3831 = isnan(_285);
        bool _3833 = _3829 || _3831;
        _3835 = _3833;
        if (!_3835)
        {
            float _3837 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _3839 = _3837 > 0.0;
            bool _3841 = !_3839;
            if (!_3841)
            {
                float _3843 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _3845 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _3847 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _3849 = _3845 * _3845;
                float _3851 = fma(_3843, _3843, _3849);
                float _3853 = fma(_3847, _3847, _3851);
                float _3855 = rsqrt(_3853);
                float _3857 = _3855 * 9.9999999747524270787835121154785e-07;
                float _3859 = _3843 * _3857;
                float _3861 = _3845 * _3857;
                float _3863 = _3847 * _3857;
                _329 = as_type<int>(_3859);
                _331 = as_type<int>(_3861);
                _333 = as_type<int>(_3863);
                _3835 = true;
            }
            else
            {
                bool _3865 = _3811 >= 9.9999999747524270787835121154785e-07;
                bool _3867 = isnan(_3811);
                bool _3869 = _3865 || _3867;
                bool _3871 = isnan(9.9999999747524270787835121154785e-07);
                bool _3873 = _3869 || _3871;
                if (!_3873)
                {
                    float _3875 = _3757 * _3757;
                    float _3877 = fma(_3755, _3755, _3875);
                    float _3879 = fma(_3761, _3761, _3877);
                    float _3881 = sqrt(_3879);
                    bool _3883 = _3881 >= 9.9999999747524270787835121154785e-07;
                    bool _3885 = isnan(_3881);
                    bool _3887 = _3883 || _3885;
                    bool _3889 = isnan(9.9999999747524270787835121154785e-07);
                    bool _3891 = _3887 || _3889;
                    float _3893 = _3881;
                    if (_3891)
                    {
                        float _3895 = rsqrt(_3879);
                        _3893 = _3895;
                    }
                    float _3897 = _3893;
                    if (!_3891)
                    {
                        _317 = 0;
                    }
                    int _3899 = _317;
                    int _3901 = _3899;
                    if (!_3891)
                    {
                        _319 = 897988541;
                    }
                    int _3903 = _319;
                    int _3905 = _3903;
                    if (!_3891)
                    {
                        _321 = 0;
                    }
                    int _3907 = _321;
                    float _3909 = _3897;
                    int _3911 = _3907;
                    if (_3891)
                    {
                        float _3913 = _3897 * 9.9999999747524270787835121154785e-07;
                        _3909 = _3913;
                    }
                    float _3915 = _3909;
                    if (_3891)
                    {
                        float _3917 = _3755 * _3915;
                        _3901 = as_type<int>(_3917);
                    }
                    int _3919 = _3901;
                    _329 = _3919;
                    if (_3891)
                    {
                        float _3921 = _3757 * _3915;
                        _3905 = as_type<int>(_3921);
                    }
                    int _3923 = _3905;
                    _331 = _3923;
                    if (_3891)
                    {
                        float _3925 = _3761 * _3915;
                        _3911 = as_type<int>(_3925);
                    }
                    int _3927 = _3911;
                    _333 = _3927;
                    _3835 = true;
                }
                else
                {
                    float _3929 = rsqrt(_3809);
                    float _3931 = _3929 * 9.9999999747524270787835121154785e-07;
                    float _3933 = _781 * _3931;
                    float _3935 = _803 * _3931;
                    float _3937 = _805 * _3931;
                    _329 = as_type<int>(_3933);
                    _331 = as_type<int>(_3935);
                    _333 = as_type<int>(_3937);
                    _3835 = true;
                }
            }
        }
    }
    else
    {
        float _3939 = _3811 * _3797;
        bool _3941 = _3939 >= 0.001000000047497451305389404296875;
        bool _3943 = isnan(_3939);
        bool _3945 = _3941 || _3943;
        bool _3947 = isnan(0.001000000047497451305389404296875);
        bool _3949 = _3945 || _3947;
        bool _3951 = _3939 > 0.0;
        bool _3953 = !_3949;
        bool _3955 = _3951 && _3953;
        bool _3957 = _3813 < 0.001000000047497451305389404296875;
        bool _3959 = _3957 && _3955;
        if (!_3959)
        {
            _323 = as_type<int>(_3769);
        }
        int _3961 = _323;
        int _3963 = _3961;
        if (_3959)
        {
            float _3965 = _781 * _3797;
            _3963 = as_type<int>(_3965);
        }
        int _3967 = _3963;
        _329 = _3967;
        if (!_3959)
        {
            _325 = as_type<int>(_3773);
        }
        int _3969 = _325;
        int _3971 = _3969;
        if (_3959)
        {
            float _3973 = _803 * _3797;
            _3971 = as_type<int>(_3973);
        }
        int _3975 = _3971;
        _331 = _3975;
        if (!_3959)
        {
            _327 = as_type<int>(_3779);
        }
        int _3977 = _327;
        _333 = _3977;
        if (_3959)
        {
            float _3979 = _805 * _3797;
            _333 = as_type<int>(_3979);
        }
    }
    _3835 = false;
    int _3981 = _329;
    int _3983 = _331;
    int _3985 = _333;
    uint _3987 = uint(int(uint(_157) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3987)] = uint(_3981);
    uint _3989 = uint(int(uint(_3759) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3989)] = uint(_3983);
    uint _3991 = uint(int(uint(_3763) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3991)] = uint(_3985);
}

