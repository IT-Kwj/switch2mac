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
    bool _1739 = false;
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
    int _147 = _68 << 4;
    float _149 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _151 = _147 + 12;
    uint _153 = uint(int(uint(_147) >> uint(2)));
    float _155 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_153)]);
    int _157 = _147 + 4;
    uint _159 = uint(int(uint(_157) >> uint(2)));
    float _161 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_159)]);
    int _163 = _147 + 8;
    uint _165 = uint(int(uint(_163) >> uint(2)));
    float _167 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_165)]);
    float _169 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    uint _171 = uint(int(uint(_147) >> uint(2)));
    float _173 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_171)]);
    int _175 = _147 + 4;
    uint _177 = uint(int(uint(_175) >> uint(2)));
    float _179 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_177)]);
    int _181 = _147 + 8;
    uint _183 = uint(int(uint(_181) >> uint(2)));
    float _185 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_183)]);
    uint _187 = uint(int(uint(_151) >> uint(2)));
    float _189 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_187)]);
    float _191 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[50]);
    uint _193 = uint(int(uint(_151) >> uint(2)));
    float _195 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_193)]);
    float _197 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _199 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _201 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _203 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _205 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[16]);
    float _207 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[17]);
    float _209 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[18]);
    float _211 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _213 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _215 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _217 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[13]);
    int _219 = as_type<int>(_149) & 512;
    bool _221 = _219 != 0;
    float _223 = _161 * _169;
    float _225 = _167 * _169;
    float _227 = 0.0;
    float _229 = 0.0;
    float _231 = 0.0;
    float _233 = 0.0;
    if (_221)
    {
        float _235 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _237 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _239 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _241 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _227 = _235;
        _229 = _237;
        _231 = _239;
        _233 = _241;
    }
    float _243 = _227;
    float _245 = _229;
    float _247 = _231;
    float _249 = _233;
    float _251 = fma(_189, _223, _179);
    float _253 = fma(_189, _225, _185);
    float _255 = 0.0;
    float _257 = 0.0;
    float _259 = 0.0;
    float _261 = 0.0;
    float _263 = _251;
    float _265 = _253;
    float _267 = _189;
    if (_221)
    {
        float _269 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _271 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _273 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _275 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _255 = _269;
        _257 = _271;
        _259 = _273;
        _261 = _275;
    }
    float _277 = _255;
    float _279 = _257;
    float _281 = _259;
    float _283 = _261;
    uint _285 = uint(int(uint(_147) >> uint(2)));
    float _287 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_285)]);
    int _289 = _147 + 4;
    uint _291 = uint(int(uint(_289) >> uint(2)));
    float _293 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_291)]);
    int _295 = _147 + 8;
    uint _297 = uint(int(uint(_295) >> uint(2)));
    float _299 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_297)]);
    int _301 = _147 + 12;
    uint _303 = uint(int(uint(_301) >> uint(2)));
    float _305 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_303)]);
    float _307 = 0.0;
    float _309 = 0.0;
    float _311 = 0.0;
    float _313 = 0.0;
    if (_221)
    {
        float _315 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _317 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _319 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _321 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _307 = _315;
        _309 = _317;
        _311 = _319;
        _313 = _321;
    }
    float _323 = _307;
    float _325 = _309;
    float _327 = _311;
    float _329 = _313;
    float _331 = trunc(_191);
    int _333 = int(_331);
    float _335 = _155 * _169;
    bool _337 = _333 != 0;
    float _339 = fma(_189, _335, _173);
    bool _341 = _333 != 1;
    bool _343 = _333 != 2;
    float _345 = _305;
    float _347 = _335;
    float _349 = as_type<float>(_333);
    int _351 = as_type<int>(_293);
    int _353 = as_type<int>(_287);
    int _355 = as_type<int>(_293);
    int _357 = as_type<int>(_299);
    int _359 = as_type<int>(_287);
    int _361 = as_type<int>(_293);
    int _363 = as_type<int>(_299);
    if (_337)
    {
        _345 = _253;
    }
    float _365 = _345;
    float _367 = _203;
    float _369 = _365;
    float _371 = _245;
    float _373 = _279;
    float _375 = _325;
    float _377 = _247;
    float _379 = _281;
    float _381 = _327;
    float _383 = _277;
    if (!_337)
    {
        float _385 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[48]);
        float _387 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[49]);
        float _389 = _189 * _385;
        float _391 = _169 * _389;
        bool _393 = _387 != 0.0;
        bool _395 = isnan(_387);
        bool _397 = _393 || _395;
        bool _399 = isnan(0.0);
        bool _401 = _397 || _399;
        float _403 = _391 * 0.15915493667125701904296875;
        float _405 = _403 * 6.283185482025146484375;
        float _407 = sin(_405);
        float _409 = _403 * 6.283185482025146484375;
        float _411 = cos(_409);
        float _413 = _253 * _407;
        float _415 = _251 * _407;
        float _417 = fma(_251, _411, _413);
        float _419 = -_415;
        float _421 = fma(_253, _411, _419);
        bool _423 = !_401;
        float _425 = _387;
        float _427 = _417;
        _367 = _411;
        _369 = _421;
        _263 = _417;
        _347 = _413;
        _349 = _415;
        if (!_423)
        {
            float _429 = _421 * _421;
            float _431 = fma(_417, _417, _429);
            bool _433 = _431 > 0.0;
            float _435 = _415;
            _367 = _431;
            if (_433)
            {
                float _437 = rsqrt(_431);
                _435 = _437;
            }
            float _439 = _435;
            float _441 = _439;
            if (_433)
            {
                float _443 = _387 * _439;
                _425 = _443;
            }
            float _445 = _425;
            if (_433)
            {
                float _447 = _189 * _445;
                _441 = _447;
            }
            float _449 = _441;
            float _451 = _449;
            if (_433)
            {
                float _453 = _169 * _449;
                _451 = _453;
            }
            float _455 = _451;
            _349 = _455;
            if (_433)
            {
                float _457 = fma(_417, _455, _417);
                _427 = _457;
            }
            float _459 = _427;
            _263 = _459;
            if (_433)
            {
                float _461 = fma(_421, _455, _421);
                _369 = _461;
            }
        }
    }
    float _463 = _367;
    float _465 = _369;
    float _467 = _263;
    float _469 = _347;
    float _471 = _349;
    float _473 = _463;
    float _475 = _465;
    float _477 = _465;
    float _479 = _471;
    float _481 = _467;
    float _483 = _469;
    if (_341)
    {
        _473 = _339;
    }
    float _485 = _473;
    float _487 = _485;
    if (!_341)
    {
        float _489 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[48]);
        float _491 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[49]);
        float _493 = _189 * _489;
        float _495 = _169 * _493;
        bool _497 = _491 != 0.0;
        bool _499 = isnan(_491);
        bool _501 = _497 || _499;
        bool _503 = isnan(0.0);
        bool _505 = _501 || _503;
        float _507 = _495 * 0.15915493667125701904296875;
        float _509 = _507 * 6.283185482025146484375;
        float _511 = sin(_509);
        float _513 = _507 * 6.283185482025146484375;
        float _515 = cos(_513);
        float _517 = _511 * _465;
        float _519 = _511 * _339;
        float _521 = -_517;
        float _523 = fma(_515, _339, _521);
        float _525 = fma(_515, _465, _519);
        float _527 = _519;
        _265 = _507;
        _487 = _523;
        _479 = _519;
        if (!_505)
        {
            _475 = _525;
        }
        float _529 = _475;
        bool _531 = !_505;
        _477 = _529;
        if (!_531)
        {
            float _533 = _523 * _523;
            float _535 = fma(_525, _525, _533);
            bool _537 = _535 > 0.0;
            float _539 = _533;
            _265 = _535;
            if (_537)
            {
                float _541 = rsqrt(_535);
                _539 = _541;
            }
            float _543 = _539;
            float _545 = _543;
            if (_537)
            {
                float _547 = _491 * _543;
                _545 = _547;
            }
            float _549 = _545;
            float _551 = _549;
            if (_537)
            {
                float _553 = _189 * _549;
                _527 = _553;
            }
            float _555 = _527;
            float _557 = _555;
            if (!_537)
            {
                _551 = _525;
            }
            float _559 = _551;
            float _561 = _559;
            if (_537)
            {
                float _563 = _169 * _555;
                _557 = _563;
            }
            float _565 = _557;
            _479 = _565;
            if (_537)
            {
                float _567 = fma(_525, _565, _525);
                _561 = _567;
            }
            float _569 = _561;
            _477 = _569;
            if (_537)
            {
                float _571 = fma(_523, _565, _523);
                _487 = _571;
            }
        }
    }
    float _573 = _265;
    float _575 = _487;
    float _577 = _477;
    float _579 = _479;
    float _581 = _575;
    float _583 = _575;
    float _585 = _573;
    float _587 = _579;
    if (!_343)
    {
        float _589 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[48]);
        float _591 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[49]);
        float _593 = _189 * _589;
        float _595 = _169 * _593;
        bool _597 = _591 != 0.0;
        bool _599 = isnan(_591);
        bool _601 = _597 || _599;
        bool _603 = isnan(0.0);
        bool _605 = _601 || _603;
        float _607 = _595 * 0.15915493667125701904296875;
        float _609 = _607 * 6.283185482025146484375;
        float _611 = sin(_609);
        float _613 = _607 * 6.283185482025146484375;
        float _615 = cos(_613);
        float _617 = _611 * _467;
        float _619 = _611 * _575;
        float _621 = fma(_615, _575, _617);
        float _623 = -_619;
        float _625 = fma(_615, _467, _623);
        _481 = _625;
        _585 = _619;
        _483 = _607;
        _587 = _621;
        if (!_605)
        {
            _581 = _621;
        }
        float _627 = _581;
        bool _629 = !_605;
        _583 = _627;
        if (!_629)
        {
            float _631 = _625 * _625;
            float _633 = fma(_621, _621, _631);
            bool _635 = _633 > 0.0;
            float _637 = _631;
            _585 = _633;
            if (_635)
            {
                float _639 = rsqrt(_633);
                _637 = _639;
            }
            float _641 = _637;
            float _643 = _641;
            if (_635)
            {
                float _645 = _591 * _641;
                _643 = _645;
            }
            float _647 = _643;
            float _649 = _647;
            if (_635)
            {
                float _651 = _189 * _647;
                _267 = _651;
            }
            float _653 = _267;
            float _655 = _653;
            if (!_635)
            {
                _649 = _621;
            }
            float _657 = _649;
            float _659 = _657;
            if (_635)
            {
                float _661 = _169 * _653;
                _655 = _661;
            }
            float _663 = _655;
            if (_635)
            {
                float _665 = fma(_621, _663, _621);
                _659 = _665;
            }
            float _667 = _659;
            _583 = _667;
            if (_635)
            {
                float _669 = fma(_625, _663, _625);
                _481 = _669;
            }
        }
    }
    float _671 = _481;
    float _673 = _583;
    float _675 = _585;
    float _677 = _483;
    float _679 = _587;
    int _681 = as_type<int>(_149) & 1024;
    bool _683 = _681 != 0;
    float _685 = _677;
    float _687 = _675;
    if (_221)
    {
        float _689 = _245 * _671;
        _371 = _689;
    }
    float _691 = _371;
    float _693 = _691;
    if (_221)
    {
        float _695 = _279 * _671;
        _373 = _695;
    }
    float _697 = _373;
    float _699 = _697;
    if (_221)
    {
        float _701 = _325 * _671;
        _375 = _701;
    }
    float _703 = _375;
    float _705 = _703;
    if (_221)
    {
        float _707 = fma(_243, _673, _691);
        _693 = _707;
    }
    float _709 = _693;
    if (_221)
    {
        float _711 = fma(_277, _673, _697);
        _699 = _711;
    }
    float _713 = _699;
    if (_221)
    {
        float _715 = fma(_323, _673, _703);
        _705 = _715;
    }
    float _717 = _705;
    uint _719 = uint(int(uint(_151) >> uint(2)));
    float _721 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_719)]);
    if (_221)
    {
        float _723 = fma(_247, _577, _709);
        _377 = _723;
    }
    float _725 = _377;
    if (_221)
    {
        float _727 = fma(_281, _577, _713);
        _379 = _727;
    }
    float _729 = _379;
    if (_221)
    {
        float _731 = fma(_327, _577, _717);
        _381 = _731;
    }
    float _733 = _381;
    if (!_221)
    {
        _685 = 0.0;
    }
    float _735 = _685;
    float _737 = _735;
    if (_221)
    {
        float _739 = _249 + _725;
        _737 = _739;
    }
    float _741 = _737;
    float _743 = _741;
    if (!_221)
    {
        _383 = 0.0;
    }
    float _745 = _383;
    float _747 = _745;
    if (_221)
    {
        float _749 = _283 + _729;
        _747 = _749;
    }
    float _751 = _747;
    float _753 = _751;
    if (!_221)
    {
        _687 = 0.0;
    }
    float _755 = _687;
    float _757 = _755;
    if (_221)
    {
        float _759 = _329 + _733;
        _757 = _759;
    }
    float _761 = _757;
    int _763 = as_type<int>(_149) & 2048;
    bool _765 = _763 != 0;
    bool _767 = !_683;
    float _769 = _761;
    bool _771 = _765;
    if (!_767)
    {
        float _773 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        uint _775 = uint(int(uint(_147) >> uint(2)));
        float _777 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_775)]);
        int _779 = _147 + 4;
        uint _781 = uint(int(uint(_779) >> uint(2)));
        float _783 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_781)]);
        int _785 = _147 + 8;
        uint _787 = uint(int(uint(_785) >> uint(2)));
        float _789 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_787)]);
        uint _791 = uint(int(uint(_147) >> uint(2)));
        float _793 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_791)]);
        int _795 = _147 + 4;
        uint _797 = uint(int(uint(_795) >> uint(2)));
        float _799 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_797)]);
        int _801 = _147 + 8;
        uint _803 = uint(int(uint(_801) >> uint(2)));
        float _805 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_803)]);
        uint _807 = uint(int(uint(_147) >> uint(2)));
        float _809 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_807)]);
        int _811 = _147 + 4;
        uint _813 = uint(int(uint(_811) >> uint(2)));
        float _815 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_813)]);
        int _817 = _147 + 8;
        uint _819 = uint(int(uint(_817) >> uint(2)));
        float _821 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_819)]);
        float _823 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        float _825 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _827 = _783 * _671;
        float _829 = _799 * _671;
        float _831 = fma(_777, _673, _827);
        float _833 = _815 * _671;
        float _835 = fma(_793, _673, _829);
        float _837 = fma(_809, _673, _833);
        float _839 = fma(_789, _577, _831);
        float _841 = fma(_805, _577, _835);
        float _843 = fma(_821, _577, _837);
        float _845 = _773 + _839;
        float _847 = _823 + _841;
        float _849 = _825 + _843;
        _753 = _845;
        _743 = _847;
        _769 = _849;
    }
    float _851 = _753;
    float _853 = _743;
    float _855 = _769;
    bool _857 = !_765;
    float _859 = _851;
    float _861 = _853;
    float _863 = _855;
    if (!_857)
    {
        uint _865 = uint(int(uint(_147) >> uint(2)));
        float _867 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_865)]);
        int _869 = _147 + 4;
        uint _871 = uint(int(uint(_869) >> uint(2)));
        float _873 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_871)]);
        int _875 = _147 + 8;
        uint _877 = uint(int(uint(_875) >> uint(2)));
        float _879 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_877)]);
        int _881 = _147 + 12;
        uint _883 = uint(int(uint(_881) >> uint(2)));
        float _885 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_883)]);
        uint _887 = uint(int(uint(_147) >> uint(2)));
        float _889 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_887)]);
        int _891 = _147 + 4;
        uint _893 = uint(int(uint(_891) >> uint(2)));
        float _895 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_893)]);
        int _897 = _147 + 8;
        uint _899 = uint(int(uint(_897) >> uint(2)));
        float _901 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_899)]);
        int _903 = _147 + 12;
        uint _905 = uint(int(uint(_903) >> uint(2)));
        float _907 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_905)]);
        uint _909 = uint(int(uint(_147) >> uint(2)));
        float _911 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_909)]);
        int _913 = _147 + 4;
        uint _915 = uint(int(uint(_913) >> uint(2)));
        float _917 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_915)]);
        int _919 = _147 + 8;
        uint _921 = uint(int(uint(_919) >> uint(2)));
        float _923 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_921)]);
        int _925 = _147 + 12;
        uint _927 = uint(int(uint(_925) >> uint(2)));
        float _929 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_927)]);
        float _931 = _873 * _671;
        float _933 = _895 * _671;
        float _935 = _917 * _671;
        float _937 = fma(_867, _673, _931);
        float _939 = fma(_889, _673, _933);
        float _941 = fma(_911, _673, _935);
        float _943 = fma(_879, _577, _937);
        float _945 = fma(_901, _577, _939);
        float _947 = fma(_923, _577, _941);
        float _949 = _943 + _885;
        float _951 = _945 + _907;
        float _953 = _947 + _929;
        _859 = _951;
        _861 = _949;
        _863 = _953;
    }
    float _955 = _859;
    float _957 = _861;
    float _959 = _863;
    float _961 = -_955;
    float _963 = _207 + _961;
    float _965 = -_957;
    float _967 = _205 + _965;
    float _969 = -_959;
    float _971 = _209 + _969;
    float _973 = abs(_215);
    float _975 = log2(_973);
    float _977 = _963 * _963;
    float _979 = fma(_967, _967, _977);
    float _981 = -_195;
    float _983 = _211 + _981;
    float _985 = fma(_971, _971, _979);
    bool _987 = _983 > 0.001000000047497451305389404296875;
    bool _989 = isnan(_983);
    bool _991 = _987 || _989;
    bool _993 = isnan(0.001000000047497451305389404296875);
    bool _995 = _991 || _993;
    float _997 = sqrt(_985);
    float _999 = _971;
    float _1001 = 0.0;
    float _1003 = 0.0;
    float _1005 = 0.0;
    if (!_995)
    {
        bool _1007 = _997 > _217;
        float _1009 = float(_1007);
        _999 = _1009;
    }
    float _1011 = _999;
    bool _1013 = !_995;
    float _1015 = _1011;
    if (!_1013)
    {
        float _1017 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[20]);
        float _1019 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[21]);
        float _1021 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[22]);
        float _1023 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[24]);
        float _1025 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[25]);
        float _1027 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[26]);
        float _1029 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[27]);
        float _1031 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[28]);
        float _1033 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[29]);
        float _1035 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[30]);
        uint _1037 = uint(int(uint(_151) >> uint(2)));
        float _1039 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1037)]);
        bool _1041 = _997 > _217;
        float _1043 = -_955;
        float _1045 = _1019 + _1043;
        float _1047 = -_957;
        float _1049 = _1017 + _1047;
        float _1051 = -_959;
        float _1053 = _1021 + _1051;
        float _1055 = -_955;
        float _1057 = _1025 + _1055;
        float _1059 = _1045 * _1045;
        float _1061 = -_957;
        float _1063 = _1023 + _1061;
        float _1065 = -_959;
        float _1067 = _1027 + _1065;
        float _1069 = -_955;
        float _1071 = _1033 + _1069;
        float _1073 = _1057 * _1057;
        float _1075 = -_957;
        float _1077 = _1031 + _1075;
        float _1079 = fma(_1049, _1049, _1059);
        float _1081 = _1071 * _1071;
        float _1083 = fma(_1063, _1063, _1073);
        float _1085 = -_959;
        float _1087 = _1035 + _1085;
        float _1089 = fma(_1053, _1053, _1079);
        float _1091 = fma(_1077, _1077, _1081);
        float _1093 = fma(_1067, _1067, _1083);
        float _1095 = _957;
        int _1097 = as_type<int>(_1063);
        int _1099 = as_type<int>(_1067);
        int _1101 = as_type<int>(_1029);
        if (!_1041)
        {
            float _1103 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[12]);
            _1095 = _1103;
        }
        float _1105 = _1095;
        float _1107 = fma(_1087, _1087, _1091);
        float _1109 = sqrt(_1089);
        float _1111 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[14]);
        float _1113 = sqrt(_1093);
        float _1115 = sqrt(_1107);
        bool _1117 = _1109 > _217;
        bool _1119 = _1113 > _217;
        float _1121 = _1053;
        if (!_1117)
        {
            float _1123 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[12]);
            _1121 = _1123;
        }
        float _1125 = _1121;
        bool _1127 = _1115 > _217;
        float _1129 = _217;
        if (!_1119)
        {
            float _1131 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[12]);
            _1129 = _1131;
        }
        float _1133 = _1129;
        float _1135 = _679;
        if (!_1127)
        {
            float _1137 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[12]);
            _1135 = _1137;
        }
        float _1139 = _1135;
        int _1141 = as_type<int>(_1039) << 24;
        int _1143 = _1141 >> 24;
        float _1145 = float(_1143);
        float _1147 = _1145 * 0.0078740157186985015869140625;
        float _1149 = precise::min(_1147, 1.0);
        float _1151 = precise::max(_1149, -1.0);
        int _1153 = as_type<int>(_1039) << 16;
        int _1155 = as_type<int>(_1039) << 8;
        bool _1157 = _1151 > 0.0;
        bool _1159 = _1157 || _1041;
        int _1161 = _1153 >> 24;
        int _1163 = _1155 >> 24;
        int _1165 = _1161;
        if (!_1041)
        {
            bool _1167 = _1151 >= 0.0;
            bool _1169 = isnan(_1151);
            bool _1171 = _1167 || _1169;
            bool _1173 = isnan(0.0);
            bool _1175 = _1171 || _1173;
            _771 = _1175;
        }
        bool _1177 = _771;
        float _1179 = float(_1161);
        int _1181 = as_type<int>(_1039) >> 24;
        bool _1183 = _1177;
        if (!_1041)
        {
            int _1185 = _1177 ? 0 : 1;
            _1097 = _1185;
        }
        int _1187 = _1097;
        float _1189 = _1179 * 0.0078740157186985015869140625;
        float _1191 = float(_1163);
        float _1193 = float(_1181);
        float _1195 = _1191;
        if (!_1041)
        {
            int _1197 = ~_1187;
            int _1199 = _1197 + 1;
            int _1201 = _1199 + 1;
            _1165 = _1201;
        }
        int _1203 = _1165;
        int _1205 = _1203;
        if (!_1159)
        {
            int _1207 = ~_1187;
            int _1209 = _1207 + 1;
            _1205 = _1209;
        }
        int _1211 = _1205;
        float _1213 = _1193 * 0.0078740157186985015869140625;
        float _1215 = precise::min(_1189, 1.0);
        int _1217 = _1211;
        int _1219 = as_type<int>(_1215);
        if (!_1041)
        {
            float _1221 = float(_1211);
            _1217 = as_type<int>(_1221);
        }
        int _1223 = _1217;
        float _1225 = precise::max(_1215, -1.0);
        float _1227 = precise::min(_1213, 1.0);
        float _1229 = precise::max(_1227, -1.0);
        bool _1231 = _1225 > 0.0;
        bool _1233 = _1231 || _1117;
        int _1235 = as_type<int>(_1227);
        int _1237 = _1223;
        bool _1239 = _1233;
        if (!_1041)
        {
            bool _1241 = _997 >= _1105;
            bool _1243 = isnan(_997);
            bool _1245 = _1241 || _1243;
            bool _1247 = isnan(_1105);
            bool _1249 = _1245 || _1247;
            _1183 = _1249;
        }
        bool _1251 = _1183;
        float _1253 = _1191 * 0.0078740157186985015869140625;
        bool _1255 = _1251;
        if (_1041)
        {
            _1195 = 1.0;
        }
        float _1257 = _1195;
        float _1259 = precise::min(_1253, 1.0);
        float _1261 = _1257;
        int _1263 = as_type<int>(_1259);
        if (!_1041)
        {
            float _1265 = _1251 ? as_type<float>(_1223) : (-1.0);
            _1261 = _1265;
        }
        float _1267 = _1261;
        float _1269 = precise::max(_1259, -1.0);
        if (!_1117)
        {
            bool _1271 = _1225 >= 0.0;
            bool _1273 = isnan(_1225);
            bool _1275 = _1271 || _1273;
            bool _1277 = isnan(0.0);
            bool _1279 = _1275 || _1277;
            _1255 = _1279;
        }
        bool _1281 = _1255;
        bool _1283 = false;
        if (!_1119)
        {
            bool _1285 = _1269 >= 0.0;
            bool _1287 = isnan(_1269);
            bool _1289 = _1285 || _1287;
            bool _1291 = isnan(0.0);
            bool _1293 = _1289 || _1291;
            _1283 = _1293;
        }
        bool _1295 = _1283;
        bool _1297 = _1295;
        if (!_1117)
        {
            int _1299 = _1281 ? 0 : 1;
            _1263 = _1299;
        }
        int _1301 = _1263;
        bool _1303 = _1269 > 0.0;
        bool _1305 = _1303 || _1119;
        bool _1307 = _1229 > 0.0;
        bool _1309 = _1307 || _1127;
        bool _1311 = _1305;
        bool _1313 = _1309;
        float _1315 = as_type<float>(_1301);
        if (!_1119)
        {
            int _1317 = _1295 ? 0 : 1;
            _1219 = _1317;
        }
        int _1319 = _1219;
        float _1321 = as_type<float>(_1319);
        if (!_1127)
        {
            bool _1323 = _1229 >= 0.0;
            bool _1325 = isnan(_1229);
            bool _1327 = _1323 || _1325;
            bool _1329 = isnan(0.0);
            bool _1331 = _1327 || _1329;
            _1297 = _1331;
        }
        bool _1333 = _1297;
        float _1335 = 1.0 / _1111;
        int _1337 = as_type<int>(_1111);
        if (!_1127)
        {
            int _1339 = _1333 ? 0 : 1;
            _1235 = _1339;
        }
        int _1341 = _1235;
        if (!_1117)
        {
            int _1343 = ~_1301;
            int _1345 = _1343 + 1;
            int _1347 = _1345 + 1;
            _1237 = _1347;
        }
        int _1349 = _1237;
        int _1351 = _1349;
        if (!_1119)
        {
            int _1353 = ~_1319;
            int _1355 = _1353 + 1;
            int _1357 = _1355 + 1;
            _1099 = _1357;
        }
        int _1359 = _1099;
        int _1361 = _1359;
        if (!_1127)
        {
            int _1363 = ~_1341;
            int _1365 = _1363 + 1;
            int _1367 = _1365 + 1;
            _1101 = _1367;
        }
        int _1369 = _1101;
        int _1371 = _1369;
        if (!_1233)
        {
            int _1373 = ~_1301;
            int _1375 = _1373 + 1;
            _1351 = _1375;
        }
        int _1377 = _1351;
        float _1379 = as_type<float>(_1377);
        if (!_1305)
        {
            int _1381 = ~_1319;
            int _1383 = _1381 + 1;
            _1361 = _1383;
        }
        int _1385 = _1361;
        int _1387 = _1385;
        if (!_1309)
        {
            int _1389 = ~_1341;
            int _1391 = _1389 + 1;
            _1371 = _1391;
        }
        int _1393 = _1371;
        int _1395 = _1393;
        if (!_1117)
        {
            bool _1397 = _1109 >= _1125;
            bool _1399 = isnan(_1109);
            bool _1401 = _1397 || _1399;
            bool _1403 = isnan(_1125);
            bool _1405 = _1401 || _1403;
            _1239 = _1405;
        }
        bool _1407 = _1239;
        if (!_1119)
        {
            bool _1409 = _1113 >= _1133;
            bool _1411 = isnan(_1113);
            bool _1413 = _1409 || _1411;
            bool _1415 = isnan(_1133);
            bool _1417 = _1413 || _1415;
            _1311 = _1417;
        }
        bool _1419 = _1311;
        if (!_1117)
        {
            float _1421 = float(_1377);
            _1337 = as_type<int>(_1421);
        }
        int _1423 = _1337;
        if (!_1127)
        {
            bool _1425 = _1115 >= _1139;
            bool _1427 = isnan(_1115);
            bool _1429 = _1425 || _1427;
            bool _1431 = isnan(_1139);
            bool _1433 = _1429 || _1431;
            _1313 = _1433;
        }
        bool _1435 = _1313;
        if (!_1119)
        {
            float _1437 = float(_1385);
            _1387 = as_type<int>(_1437);
        }
        int _1439 = _1387;
        if (!_1127)
        {
            float _1441 = float(_1393);
            _1395 = as_type<int>(_1441);
        }
        int _1443 = _1395;
        if (_1117)
        {
            _1321 = 1.0;
        }
        float _1445 = _1321;
        float _1447 = _1445;
        if (_1119)
        {
            _1315 = 1.0;
        }
        float _1449 = _1315;
        float _1451 = _1449;
        if (_1127)
        {
            _1379 = 1.0;
        }
        float _1453 = _1379;
        float _1455 = _1453;
        if (!_1117)
        {
            float _1457 = _1407 ? as_type<float>(_1423) : (-1.0);
            _1447 = _1457;
        }
        float _1459 = _1447;
        float _1461 = _169 * _1335;
        if (!_1119)
        {
            float _1463 = _1419 ? as_type<float>(_1439) : (-1.0);
            _1451 = _1463;
        }
        float _1465 = _1451;
        if (!_1127)
        {
            float _1467 = _1435 ? as_type<float>(_1443) : (-1.0);
            _1455 = _1467;
        }
        float _1469 = _1455;
        float _1471 = abs(_1151);
        float _1473 = fma(_1461, _1267, _1471);
        float _1475 = precise::clamp(_1473, 0.0, 1.0);
        float _1477 = abs(_1225);
        float _1479 = fma(_1461, _1459, _1477);
        float _1481 = precise::clamp(_1479, 0.0, 1.0);
        float _1483 = abs(_1269);
        float _1485 = fma(_1461, _1465, _1483);
        float _1487 = precise::clamp(_1485, 0.0, 1.0);
        float _1489 = abs(_1229);
        float _1491 = fma(_1461, _1469, _1489);
        float _1493 = precise::clamp(_1491, 0.0, 1.0);
        float _1495 = _1475 * _1267;
        float _1497 = _1481 * _1459;
        float _1499 = _1487 * _1465;
        float _1501 = _1493 * _1469;
        _1015 = _1495;
        _1001 = _1497;
        _1003 = _1499;
        _1005 = _1501;
    }
    float _1503 = _1015;
    float _1505 = _1001;
    float _1507 = _1003;
    float _1509 = _1005;
    float _1511 = precise::min(_1503, 1.0);
    float _1513 = _169 * _975;
    float _1515 = precise::min(_1505, 1.0);
    float _1517 = _197 * _213;
    float _1519 = precise::max(_1511, -1.0);
    float _1521 = _201 * _213;
    float _1523 = precise::max(_1515, -1.0);
    float _1525 = exp2(_1513);
    float _1527 = precise::min(_1507, 1.0);
    float _1529 = _1519 * 127.0;
    float _1531 = precise::min(_1509, 1.0);
    float _1533 = _1523 * 127.0;
    float _1535 = precise::max(_1527, -1.0);
    float _1537 = precise::max(_1531, -1.0);
    float _1539 = rint(_1529);
    int _1541 = int(_1539);
    float _1543 = _1535 * 127.0;
    float _1545 = _1537 * 127.0;
    float _1547 = _199 * _213;
    float _1549 = _169 * _1517;
    int _1551 = _147 + 8;
    float _1553 = rint(_1533);
    int _1555 = int(_1553);
    float _1557 = _169 * _1547;
    float _1559 = fma(_155, _1525, _1549);
    float _1561 = -_179;
    float _1563 = _1561 + _671;
    float _1565 = _169 * _1521;
    int _1567 = _147 + 4;
    float _1569 = fma(_161, _1525, _1557);
    float _1571 = -_173;
    float _1573 = _1571 + _673;
    float _1575 = rint(_1543);
    int _1577 = int(_1575);
    uint _1579 = extract_bits(uint(_1541), 0u, 8u);
    int _1581 = int(_1579) & 255;
    float _1583 = fma(_167, _1525, _1565);
    float _1585 = rint(_1545);
    int _1587 = int(_1585);
    uint _1589 = extract_bits(uint(_1581), 0u, 8u);
    int _1591 = int(_1589) & 255;
    uint _1593 = extract_bits(uint(_1555), 0u, 8u);
    int _1595 = int(_1593) & 255;
    int _1597 = _1595 << 8;
    int _1599 = _1591 | _1597;
    uint _1601 = extract_bits(uint(_1581), 16u, 8u);
    int _1603 = int(_1601) & 255;
    int _1605 = _1603 << 16;
    int _1607 = _1599 | _1605;
    uint _1609 = extract_bits(uint(_1581), 24u, 8u);
    int _1611 = int(_1609) & 255;
    int _1613 = _1611 << 24;
    int _1615 = _1607 | _1613;
    uint _1617 = extract_bits(uint(_1615), 0u, 8u);
    int _1619 = int(_1617) & 255;
    uint _1621 = extract_bits(uint(_1615), 8u, 8u);
    int _1623 = int(_1621) & 255;
    int _1625 = _1623 << 8;
    int _1627 = _1619 | _1625;
    uint _1629 = extract_bits(uint(_1577), 0u, 8u);
    int _1631 = int(_1629) & 255;
    int _1633 = _1631 << 16;
    int _1635 = _1627 | _1633;
    uint _1637 = extract_bits(uint(_1615), 24u, 8u);
    int _1639 = int(_1637) & 255;
    int _1641 = _1639 << 24;
    int _1643 = _1635 | _1641;
    float _1645 = -_185;
    float _1647 = _1645 + _577;
    uint _1649 = extract_bits(uint(_1643), 0u, 8u);
    int _1651 = int(_1649) & 255;
    uint _1653 = extract_bits(uint(_1643), 8u, 8u);
    int _1655 = int(_1653) & 255;
    int _1657 = _1655 << 8;
    int _1659 = _1651 | _1657;
    uint _1661 = extract_bits(uint(_1643), 16u, 8u);
    int _1663 = int(_1661) & 255;
    int _1665 = _1663 << 16;
    int _1667 = _1659 | _1665;
    uint _1669 = extract_bits(uint(_1587), 0u, 8u);
    int _1671 = int(_1669) & 255;
    int _1673 = _1671 << 24;
    int _1675 = _1667 | _1673;
    uint _1677 = uint(int(uint(_151) >> uint(2)));
    (*spvDescriptorSet0.cp_s11)._m0[int(_1677)] = uint(_1675);
    uint _1679 = uint(int(uint(_151) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1679)] = as_type<uint>(_721);
    uint _1681 = uint(int(uint(_147) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1681)] = as_type<uint>(_673);
    uint _1683 = uint(int(uint(_1567) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1683)] = as_type<uint>(_671);
    uint _1685 = uint(int(uint(_1551) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1685)] = as_type<uint>(_577);
    uint _1687 = uint(int(uint(_147) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1687)] = as_type<uint>(_1559);
    uint _1689 = uint(int(uint(_1567) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1689)] = as_type<uint>(_1569);
    uint _1691 = uint(int(uint(_1551) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1691)] = as_type<uint>(_1583);
    uint _1693 = uint(int(uint(_147) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_1693)] = as_type<uint>(_1573);
    uint _1695 = uint(int(uint(_1567) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_1695)] = as_type<uint>(_1563);
    uint _1697 = uint(int(uint(_1551) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_1697)] = as_type<uint>(_1647);
    float _1699 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1701 = _1563 * _1563;
    float _1703 = _1569 * _1569;
    float _1705 = fma(_1573, _1573, _1701);
    float _1707 = fma(_1559, _1559, _1703);
    float _1709 = fma(_1647, _1647, _1705);
    float _1711 = fma(_1583, _1583, _1707);
    float _1713 = sqrt(_1711);
    float _1715 = sqrt(_1709);
    bool _1717 = _1715 >= 9.9999999747524270787835121154785e-07;
    bool _1719 = isnan(_1715);
    bool _1721 = _1717 || _1719;
    bool _1723 = isnan(9.9999999747524270787835121154785e-07);
    bool _1725 = _1721 || _1723;
    float _1727 = _1715;
    if (!_1725)
    {
        bool _1729 = _211 != _195;
        bool _1731 = isnan(_211);
        bool _1733 = _1729 || _1731;
        bool _1735 = isnan(_195);
        bool _1737 = _1733 || _1735;
        _1739 = _1737;
        if (!_1739)
        {
            float _1741 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _1743 = _1741 > 0.0;
            bool _1745 = !_1743;
            if (!_1745)
            {
                float _1747 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _1749 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _1751 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _1753 = _1749 * _1749;
                float _1755 = fma(_1747, _1747, _1753);
                float _1757 = fma(_1751, _1751, _1755);
                float _1759 = rsqrt(_1757);
                float _1761 = _1759 * 9.9999999747524270787835121154785e-07;
                float _1763 = _1747 * _1761;
                float _1765 = _1749 * _1761;
                float _1767 = _1751 * _1761;
                _359 = as_type<int>(_1763);
                _361 = as_type<int>(_1765);
                _363 = as_type<int>(_1767);
                _1739 = true;
            }
            else
            {
                bool _1769 = _1713 >= 9.9999999747524270787835121154785e-07;
                bool _1771 = isnan(_1713);
                bool _1773 = _1769 || _1771;
                bool _1775 = isnan(9.9999999747524270787835121154785e-07);
                bool _1777 = _1773 || _1775;
                if (!_1777)
                {
                    float _1779 = _671 * _671;
                    float _1781 = fma(_673, _673, _1779);
                    float _1783 = fma(_577, _577, _1781);
                    float _1785 = sqrt(_1783);
                    bool _1787 = _1785 >= 9.9999999747524270787835121154785e-07;
                    bool _1789 = isnan(_1785);
                    bool _1791 = _1787 || _1789;
                    bool _1793 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1795 = _1791 || _1793;
                    int _1797 = as_type<int>(_299);
                    int _1799 = as_type<int>(_1785);
                    if (_1795)
                    {
                        float _1801 = rsqrt(_1783);
                        _1797 = as_type<int>(_1801);
                    }
                    int _1803 = _1797;
                    if (!_1795)
                    {
                        _1799 = 0;
                    }
                    int _1805 = _1799;
                    int _1807 = _1805;
                    if (!_1795)
                    {
                        _351 = 897988541;
                    }
                    int _1809 = _351;
                    int _1811 = _1803;
                    int _1813 = _1809;
                    if (_1795)
                    {
                        float _1815 = as_type<float>(_1803) * 9.9999999747524270787835121154785e-07;
                        _1727 = _1815;
                    }
                    float _1817 = _1727;
                    if (!_1795)
                    {
                        _1811 = 0;
                    }
                    int _1819 = _1811;
                    int _1821 = _1819;
                    if (_1795)
                    {
                        float _1823 = _673 * _1817;
                        _1807 = as_type<int>(_1823);
                    }
                    int _1825 = _1807;
                    _359 = _1825;
                    if (_1795)
                    {
                        float _1827 = _671 * _1817;
                        _1813 = as_type<int>(_1827);
                    }
                    int _1829 = _1813;
                    _361 = _1829;
                    if (_1795)
                    {
                        float _1831 = _577 * _1817;
                        _1821 = as_type<int>(_1831);
                    }
                    int _1833 = _1821;
                    _363 = _1833;
                    _1739 = true;
                }
                else
                {
                    float _1835 = rsqrt(_1711);
                    float _1837 = _1835 * 9.9999999747524270787835121154785e-07;
                    float _1839 = _1559 * _1837;
                    float _1841 = _1569 * _1837;
                    float _1843 = _1583 * _1837;
                    _359 = as_type<int>(_1839);
                    _361 = as_type<int>(_1841);
                    _363 = as_type<int>(_1843);
                    _1739 = true;
                }
            }
        }
    }
    else
    {
        float _1845 = _1713 * _1699;
        bool _1847 = _1845 >= 0.001000000047497451305389404296875;
        bool _1849 = isnan(_1845);
        bool _1851 = _1847 || _1849;
        bool _1853 = isnan(0.001000000047497451305389404296875);
        bool _1855 = _1851 || _1853;
        bool _1857 = _1845 > 0.0;
        bool _1859 = !_1855;
        bool _1861 = _1857 && _1859;
        bool _1863 = _1715 < 0.001000000047497451305389404296875;
        bool _1865 = _1863 && _1861;
        if (!_1865)
        {
            _353 = as_type<int>(_1573);
        }
        int _1867 = _353;
        int _1869 = _1867;
        if (_1865)
        {
            float _1871 = _1559 * _1699;
            _1869 = as_type<int>(_1871);
        }
        int _1873 = _1869;
        _359 = _1873;
        if (!_1865)
        {
            _355 = as_type<int>(_1563);
        }
        int _1875 = _355;
        int _1877 = _1875;
        if (_1865)
        {
            float _1879 = _1569 * _1699;
            _1877 = as_type<int>(_1879);
        }
        int _1881 = _1877;
        _361 = _1881;
        if (!_1865)
        {
            _357 = as_type<int>(_1647);
        }
        int _1883 = _357;
        _363 = _1883;
        if (_1865)
        {
            float _1885 = _1583 * _1699;
            _363 = as_type<int>(_1885);
        }
    }
    _1739 = false;
    int _1887 = _359;
    int _1889 = _361;
    int _1891 = _363;
    uint _1893 = uint(int(uint(_147) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_1893)] = uint(_1887);
    uint _1895 = uint(int(uint(_1567) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_1895)] = uint(_1889);
    uint _1897 = uint(int(uint(_1551) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_1897)] = uint(_1891);
}

