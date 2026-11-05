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
    bool _1101 = false;
    bool _839 = false;
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
        float _213 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _215 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _217 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _205 = _213;
        _207 = _215;
        _209 = _217;
    }
    float _219 = _205;
    float _221 = _207;
    float _223 = _209;
    float _225 = 0.0;
    float _227 = 0.0;
    float _229 = 0.0;
    if (_169)
    {
        float _231 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _233 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _235 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _225 = _231;
        _227 = _233;
        _229 = _235;
    }
    float _237 = _225;
    float _239 = _227;
    float _241 = _229;
    float _243 = 0.0;
    float _245 = 0.0;
    float _247 = 0.0;
    if (_169)
    {
        float _249 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _251 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _253 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _243 = _249;
        _245 = _251;
        _247 = _253;
    }
    float _255 = _243;
    float _257 = _245;
    float _259 = _247;
    uint _261 = uint(int(uint(_149) >> uint(2)));
    float _263 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_261)]);
    uint _265 = uint(int(uint(_171) >> uint(2)));
    float _267 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_265)]);
    uint _269 = uint(int(uint(_171) >> uint(2)));
    float _271 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_269)]);
    float _273 = _239;
    float _275 = _237;
    float _277 = _239;
    float _279 = _241;
    float _281 = _219;
    float _283 = _221;
    float _285 = _223;
    float _287 = _257;
    float _289 = _255;
    float _291 = _259;
    float _293 = _187;
    int _295 = as_type<int>(_197);
    int _297 = as_type<int>(_191);
    int _299 = as_type<int>(_197);
    int _301 = as_type<int>(_203);
    int _303 = as_type<int>(_191);
    int _305 = as_type<int>(_197);
    int _307 = as_type<int>(_203);
    if (!_169)
    {
        int _309 = _149 + 4;
        int _311 = _149 + 8;
        uint _313 = uint(int(uint(_149) >> uint(2)));
        float _315 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_313)]);
        uint _317 = uint(int(uint(_309) >> uint(2)));
        float _319 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_317)]);
        uint _321 = uint(int(uint(_309) >> uint(2)));
        float _323 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_321)]);
        uint _325 = uint(int(uint(_311) >> uint(2)));
        float _327 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_325)]);
        uint _329 = uint(int(uint(_309) >> uint(2)));
        float _331 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_329)]);
        uint _333 = uint(int(uint(_149) >> uint(2)));
        float _335 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_333)]);
        uint _337 = uint(int(uint(_311) >> uint(2)));
        float _339 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_337)]);
        uint _341 = uint(int(uint(_149) >> uint(2)));
        float _343 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_341)]);
        uint _345 = uint(int(uint(_311) >> uint(2)));
        float _347 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_345)]);
        float _349 = _319 * _319;
        float _351 = _315 * _315;
        float _353 = fma(_323, _323, _349);
        float _355 = _327 * _327;
        float _357 = fma(_331, _331, _353);
        float _359 = fma(_335, _335, _351);
        float _361 = fma(_339, _339, _355);
        float _363 = sqrt(_357);
        float _365 = fma(_343, _343, _359);
        float _367 = fma(_347, _347, _361);
        float _369 = sqrt(_365);
        float _371 = sqrt(_367);
        bool _373 = _363 > 0.0;
        bool _375 = _369 > 0.0;
        bool _377 = _371 > 0.0;
        float _379 = 0.0;
        float _381 = _361;
        float _383 = _371;
        float _385 = _355;
        float _387 = _369;
        float _389 = _363;
        float _391 = _365;
        float _393 = _331;
        float _395 = _323;
        if (_373)
        {
            float _397 = rsqrt(_357);
            _379 = _397;
        }
        float _399 = _379;
        float _401 = 0.0;
        if (_375)
        {
            float _403 = rsqrt(_365);
            _401 = _403;
        }
        float _405 = _401;
        float _407 = 0.0;
        if (_377)
        {
            float _409 = rsqrt(_367);
            _407 = _409;
        }
        float _411 = _407;
        if (!_373)
        {
            _381 = 0.0;
        }
        float _413 = _381;
        float _415 = _413;
        if (_373)
        {
            float _417 = _323 * _399;
            _415 = _417;
        }
        float _419 = _415;
        _283 = _419;
        if (!_373)
        {
            _383 = 0.0;
        }
        float _421 = _383;
        float _423 = _421;
        if (_373)
        {
            float _425 = _331 * _399;
            _423 = _425;
        }
        float _427 = _423;
        _287 = _427;
        if (!_375)
        {
            _385 = 0.0;
        }
        float _429 = _385;
        float _431 = _429;
        if (!_375)
        {
            _387 = 0.0;
        }
        float _433 = _387;
        float _435 = _433;
        if (_375)
        {
            float _437 = _315 * _405;
            _431 = _437;
        }
        float _439 = _431;
        _275 = _439;
        if (!_375)
        {
            _389 = 0.0;
        }
        float _441 = _389;
        float _443 = _441;
        if (_375)
        {
            float _445 = _335 * _405;
            _435 = _445;
        }
        float _447 = _435;
        _281 = _447;
        if (!_373)
        {
            _273 = 0.0;
        }
        float _449 = _273;
        float _451 = _449;
        if (_375)
        {
            float _453 = _343 * _405;
            _443 = _453;
        }
        float _455 = _443;
        _289 = _455;
        if (!_377)
        {
            _391 = 0.0;
        }
        float _457 = _391;
        float _459 = _457;
        if (_373)
        {
            float _461 = _319 * _399;
            _451 = _461;
        }
        float _463 = _451;
        _277 = _463;
        if (!_377)
        {
            _393 = 0.0;
        }
        float _465 = _393;
        float _467 = _465;
        if (_377)
        {
            float _469 = _327 * _411;
            _459 = _469;
        }
        float _471 = _459;
        _279 = _471;
        if (!_377)
        {
            _395 = 0.0;
        }
        float _473 = _395;
        _291 = _473;
        if (_377)
        {
            float _475 = _339 * _411;
            _467 = _475;
        }
        float _477 = _467;
        _285 = _477;
        if (_377)
        {
            float _479 = _347 * _411;
            _291 = _479;
        }
    }
    float _481 = _275;
    float _483 = _277;
    float _485 = _279;
    float _487 = _281;
    float _489 = _283;
    float _491 = _285;
    float _493 = _287;
    float _495 = _289;
    float _497 = _291;
    float _499 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _501 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[27]);
    float _503 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[24]);
    float _505 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[25]);
    float _507 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[26]);
    float _509 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _511 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _513 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _515 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _517 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _519 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _521 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _523 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _525 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _527 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _529 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _531 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    uint _533 = uint(int(uint(_171) >> uint(2)));
    float _535 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_533)]);
    float _537 = trunc(_501);
    int _539 = int(_537);
    float _541 = _271 * _503;
    float _543 = _271 * _505;
    float _545 = abs(_499);
    float _547 = log2(_545);
    bool _549 = _539 != 1;
    bool _551 = _513 > 0.0;
    float _553 = _509 * _543;
    float _555 = _509 * _541;
    float _557 = _271 * _507;
    float _559 = _481;
    float _561 = _541;
    float _563 = _485;
    float _565 = _489;
    float _567 = _555;
    float _569 = _525;
    if (!_549)
    {
        float _571 = _553 * _481;
        _559 = _571;
    }
    float _573 = _559;
    float _575 = _573;
    if (!_549)
    {
        float _577 = _553 * _483;
        _561 = _577;
    }
    float _579 = _561;
    float _581 = _579;
    if (!_549)
    {
        float _583 = _553 * _485;
        _563 = _583;
    }
    float _585 = _563;
    float _587 = _513;
    if (_551)
    {
        float _589 = 1.0 / _513;
        _587 = _589;
    }
    float _591 = _587;
    float _593 = 0.0;
    if (!_549)
    {
        float _595 = fma(_555, _487, _573);
        _593 = _595;
    }
    float _597 = _593;
    if (!_549)
    {
        float _599 = fma(_555, _489, _579);
        _581 = _599;
    }
    float _601 = _581;
    float _603 = _509 * _557;
    float _605 = _603;
    if (!_549)
    {
        float _607 = fma(_555, _491, _585);
        _565 = _607;
    }
    float _609 = _565;
    float _611 = _509 * _547;
    if (_549)
    {
        _575 = _553;
    }
    float _613 = _575;
    float _615 = _613;
    if (!_549)
    {
        float _617 = fma(_603, _493, _601);
        _615 = _617;
    }
    float _619 = _615;
    float _621 = _271 * _509;
    if (!_549)
    {
        float _623 = fma(_603, _495, _597);
        _567 = _623;
    }
    float _625 = _567;
    if (!_549)
    {
        float _627 = fma(_603, _497, _609);
        _605 = _627;
    }
    float _629 = _605;
    float _631 = exp2(_611);
    bool _633 = _515 > 0.0;
    float _635 = fma(_175, _621, _153);
    float _637 = -_267;
    float _639 = _511 + _637;
    float _641 = fma(_181, _621, _159);
    float _643 = _625 + _635;
    float _645 = _635;
    if (_551)
    {
        float _647 = _639 * _591;
        _645 = _647;
    }
    float _649 = _645;
    float _651 = _517 * _523;
    float _653 = _519 * _523;
    float _655 = _525 * _515;
    float _657 = _619 + _641;
    float _659 = _509 * _651;
    float _661 = _509 * _653;
    float _663 = _649;
    if (_551)
    {
        float _665 = precise::min(_649, 1.0);
        _663 = _665;
    }
    float _667 = _663;
    if (_633)
    {
        float _669 = -_655;
        float _671 = fma(_263, _669, _525);
        _569 = _671;
    }
    float _673 = _569;
    float _675 = _521 * _523;
    float _677 = fma(_175, _631, _659);
    float _679 = fma(_181, _631, _661);
    float _681 = fma(_187, _621, _165);
    float _683 = _673;
    if (_551)
    {
        float _685 = _667 * _673;
        _683 = _685;
    }
    float _687 = _683;
    float _689 = _509 * _675;
    float _691 = _509 * _527;
    float _693 = _509 * _529;
    float _695 = _509 * _531;
    float _697 = _629 + _681;
    float _699 = fma(_187, _631, _689);
    float _701 = _691 * _687;
    float _703 = _693 * _687;
    float _705 = _695 * _687;
    bool _707 = !_169;
    float _709 = _689;
    float _711 = _691;
    float _833;
    float _835;
    float _837;
    if (!_707)
    {
        float _713 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _715 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _717 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _719 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _721 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _723 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _725 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _727 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _729 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _731 = _717 * _719;
        float _733 = _717 * _721;
        float _735 = _715 * _719;
        float _737 = -_731;
        float _739 = fma(_713, _723, _737);
        float _741 = -_733;
        float _743 = fma(_715, _723, _741);
        float _745 = -_735;
        float _747 = fma(_713, _721, _745);
        float _749 = _727 * _713;
        float _751 = _727 * _739;
        float _753 = _729 * _715;
        float _755 = _725 * _721;
        float _757 = -_749;
        float _759 = fma(_725, _715, _757);
        float _761 = -_751;
        float _763 = fma(_725, _743, _761);
        float _765 = _727 * _723;
        float _767 = _729 * _719;
        float _769 = _725 * _717;
        float _771 = fma(_729, _747, _763);
        float _773 = -_765;
        float _775 = fma(_729, _721, _773);
        float _777 = -_767;
        float _779 = fma(_725, _723, _777);
        float _781 = -_755;
        float _783 = fma(_727, _719, _781);
        float _785 = -_769;
        float _787 = fma(_729, _713, _785);
        float _789 = -_713;
        float _791 = fma(_789, _723, _731);
        float _793 = 1.0 / _771;
        float _795 = -_753;
        float _797 = fma(_727, _717, _795);
        float _799 = _775 * _793;
        float _801 = _779 * _793;
        float _803 = _783 * _793;
        float _805 = _791 * _793;
        float _807 = _703 * _799;
        float _809 = _703 * _801;
        float _811 = _703 * _803;
        float _813 = _701 * _793;
        float _815 = _787 * _793;
        float _817 = fma(_701, _805, _809);
        float _819 = _797 * _793;
        float _821 = _759 * _793;
        float _823 = fma(_743, _813, _807);
        float _825 = fma(_747, _813, _811);
        float _827 = fma(_705, _815, _817);
        float _829 = fma(_705, _819, _823);
        float _831 = fma(_705, _821, _825);
        _833 = _829;
        _835 = _827;
        _837 = _831;
        _839 = true;
    }
    else
    {
        int _841 = as_type<int>(_147) & 1024;
        bool _843 = _841 != 0;
        if (_843)
        {
            _211 = true;
        }
        bool _845 = _211;
        bool _847 = _845;
        if (!_843)
        {
            int _849 = as_type<int>(_147) & 2048;
            bool _851 = _849 != 0;
            _847 = _851;
        }
        bool _853 = _847;
        if (!_853)
        {
            _293 = _701;
        }
        float _855 = _293;
        _833 = _855;
        if (!_853)
        {
            _709 = _703;
        }
        float _857 = _709;
        _835 = _857;
        if (!_853)
        {
            _711 = _705;
        }
        float _859 = _711;
        bool _861 = !_853;
        _837 = _859;
        if (!_861)
        {
            uint _863 = uint(int(uint(_149) >> uint(2)));
            float _865 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_863)]);
            int _867 = _149 + 4;
            uint _869 = uint(int(uint(_867) >> uint(2)));
            float _871 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_869)]);
            int _873 = _149 + 8;
            uint _875 = uint(int(uint(_873) >> uint(2)));
            float _877 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_875)]);
            uint _879 = uint(int(uint(_149) >> uint(2)));
            float _881 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_879)]);
            int _883 = _149 + 4;
            uint _885 = uint(int(uint(_883) >> uint(2)));
            float _887 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_885)]);
            int _889 = _149 + 8;
            uint _891 = uint(int(uint(_889) >> uint(2)));
            float _893 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_891)]);
            uint _895 = uint(int(uint(_149) >> uint(2)));
            float _897 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_895)]);
            int _899 = _149 + 4;
            uint _901 = uint(int(uint(_899) >> uint(2)));
            float _903 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_901)]);
            int _905 = _149 + 8;
            uint _907 = uint(int(uint(_905) >> uint(2)));
            float _909 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_907)]);
            float _911 = _877 * _881;
            float _913 = _877 * _887;
            float _915 = _871 * _881;
            float _917 = -_911;
            float _919 = fma(_865, _893, _917);
            float _921 = -_913;
            float _923 = fma(_871, _893, _921);
            float _925 = -_915;
            float _927 = fma(_865, _887, _925);
            float _929 = _903 * _865;
            float _931 = _903 * _919;
            float _933 = _909 * _871;
            float _935 = _897 * _887;
            float _937 = -_929;
            float _939 = fma(_897, _871, _937);
            float _941 = -_931;
            float _943 = fma(_897, _923, _941);
            float _945 = _903 * _893;
            float _947 = _909 * _881;
            float _949 = _897 * _877;
            float _951 = fma(_909, _927, _943);
            float _953 = -_945;
            float _955 = fma(_909, _887, _953);
            float _957 = -_947;
            float _959 = fma(_897, _893, _957);
            float _961 = -_935;
            float _963 = fma(_903, _881, _961);
            float _965 = -_949;
            float _967 = fma(_909, _865, _965);
            float _969 = -_865;
            float _971 = fma(_969, _893, _911);
            float _973 = 1.0 / _951;
            float _975 = -_933;
            float _977 = fma(_903, _877, _975);
            float _979 = _955 * _973;
            float _981 = _959 * _973;
            float _983 = _963 * _973;
            float _985 = _971 * _973;
            float _987 = _703 * _979;
            float _989 = _703 * _981;
            float _991 = _703 * _983;
            float _993 = _701 * _973;
            float _995 = _967 * _973;
            float _997 = fma(_701, _985, _989);
            float _999 = _977 * _973;
            float _1001 = _939 * _973;
            float _1003 = fma(_923, _993, _987);
            float _1005 = fma(_927, _993, _991);
            float _1007 = fma(_705, _995, _997);
            float _1009 = fma(_705, _999, _1003);
            float _1011 = fma(_705, _1001, _1005);
            _833 = _1009;
            _835 = _1007;
            _837 = _1011;
        }
    }
    _839 = false;
    float _1013 = _833;
    float _1015 = _835;
    float _1017 = _837;
    float _1019 = _643 + _1013;
    float _1021 = _657 + _1015;
    int _1023 = _149 + 4;
    float _1025 = _697 + _1017;
    int _1027 = _149 + 8;
    uint _1029 = uint(int(uint(_171) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1029)] = as_type<uint>(_535);
    float _1031 = -_153;
    float _1033 = _1031 + _1019;
    float _1035 = -_159;
    float _1037 = _1035 + _1021;
    uint _1039 = uint(int(uint(_149) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1039)] = as_type<uint>(_1019);
    float _1041 = -_165;
    float _1043 = _1041 + _1025;
    uint _1045 = uint(int(uint(_1023) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1045)] = as_type<uint>(_1021);
    uint _1047 = uint(int(uint(_1027) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1047)] = as_type<uint>(_1025);
    uint _1049 = uint(int(uint(_149) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1049)] = as_type<uint>(_677);
    uint _1051 = uint(int(uint(_1023) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1051)] = as_type<uint>(_679);
    uint _1053 = uint(int(uint(_1027) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1053)] = as_type<uint>(_699);
    uint _1055 = uint(int(uint(_149) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1055)] = as_type<uint>(_1033);
    uint _1057 = uint(int(uint(_1023) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1057)] = as_type<uint>(_1037);
    uint _1059 = uint(int(uint(_1027) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1059)] = as_type<uint>(_1043);
    float _1061 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1063 = _1037 * _1037;
    float _1065 = _679 * _679;
    float _1067 = fma(_1033, _1033, _1063);
    float _1069 = fma(_677, _677, _1065);
    float _1071 = fma(_1043, _1043, _1067);
    float _1073 = fma(_699, _699, _1069);
    float _1075 = sqrt(_1073);
    float _1077 = sqrt(_1071);
    bool _1079 = _1077 >= 9.9999999747524270787835121154785e-07;
    bool _1081 = isnan(_1077);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan(9.9999999747524270787835121154785e-07);
    bool _1087 = _1083 || _1085;
    float _1089 = _1077;
    if (!_1087)
    {
        bool _1091 = _511 != _267;
        bool _1093 = isnan(_511);
        bool _1095 = _1091 || _1093;
        bool _1097 = isnan(_267);
        bool _1099 = _1095 || _1097;
        _1101 = _1099;
        if (!_1101)
        {
            float _1103 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _1105 = _1103 > 0.0;
            bool _1107 = !_1105;
            if (!_1107)
            {
                float _1109 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _1111 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _1113 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _1115 = _1111 * _1111;
                float _1117 = fma(_1109, _1109, _1115);
                float _1119 = fma(_1113, _1113, _1117);
                float _1121 = rsqrt(_1119);
                float _1123 = _1121 * 9.9999999747524270787835121154785e-07;
                float _1125 = _1109 * _1123;
                float _1127 = _1111 * _1123;
                float _1129 = _1113 * _1123;
                _303 = as_type<int>(_1125);
                _305 = as_type<int>(_1127);
                _307 = as_type<int>(_1129);
                _1101 = true;
            }
            else
            {
                bool _1131 = _1075 >= 9.9999999747524270787835121154785e-07;
                bool _1133 = isnan(_1075);
                bool _1135 = _1131 || _1133;
                bool _1137 = isnan(9.9999999747524270787835121154785e-07);
                bool _1139 = _1135 || _1137;
                if (!_1139)
                {
                    float _1141 = _1021 * _1021;
                    float _1143 = fma(_1019, _1019, _1141);
                    float _1145 = fma(_1025, _1025, _1143);
                    float _1147 = sqrt(_1145);
                    bool _1149 = _1147 >= 9.9999999747524270787835121154785e-07;
                    bool _1151 = isnan(_1147);
                    bool _1153 = _1149 || _1151;
                    bool _1155 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1157 = _1153 || _1155;
                    int _1159 = as_type<int>(_203);
                    int _1161 = as_type<int>(_1147);
                    if (_1157)
                    {
                        float _1163 = rsqrt(_1145);
                        _1159 = as_type<int>(_1163);
                    }
                    int _1165 = _1159;
                    if (!_1157)
                    {
                        _1161 = 0;
                    }
                    int _1167 = _1161;
                    int _1169 = _1167;
                    if (!_1157)
                    {
                        _295 = 897988541;
                    }
                    int _1171 = _295;
                    int _1173 = _1165;
                    int _1175 = _1171;
                    if (_1157)
                    {
                        float _1177 = as_type<float>(_1165) * 9.9999999747524270787835121154785e-07;
                        _1089 = _1177;
                    }
                    float _1179 = _1089;
                    if (!_1157)
                    {
                        _1173 = 0;
                    }
                    int _1181 = _1173;
                    int _1183 = _1181;
                    if (_1157)
                    {
                        float _1185 = _1019 * _1179;
                        _1169 = as_type<int>(_1185);
                    }
                    int _1187 = _1169;
                    _303 = _1187;
                    if (_1157)
                    {
                        float _1189 = _1021 * _1179;
                        _1175 = as_type<int>(_1189);
                    }
                    int _1191 = _1175;
                    _305 = _1191;
                    if (_1157)
                    {
                        float _1193 = _1025 * _1179;
                        _1183 = as_type<int>(_1193);
                    }
                    int _1195 = _1183;
                    _307 = _1195;
                    _1101 = true;
                }
                else
                {
                    float _1197 = rsqrt(_1073);
                    float _1199 = _1197 * 9.9999999747524270787835121154785e-07;
                    float _1201 = _677 * _1199;
                    float _1203 = _679 * _1199;
                    float _1205 = _699 * _1199;
                    _303 = as_type<int>(_1201);
                    _305 = as_type<int>(_1203);
                    _307 = as_type<int>(_1205);
                    _1101 = true;
                }
            }
        }
    }
    else
    {
        float _1207 = _1075 * _1061;
        bool _1209 = _1207 >= 0.001000000047497451305389404296875;
        bool _1211 = isnan(_1207);
        bool _1213 = _1209 || _1211;
        bool _1215 = isnan(0.001000000047497451305389404296875);
        bool _1217 = _1213 || _1215;
        bool _1219 = _1207 > 0.0;
        bool _1221 = !_1217;
        bool _1223 = _1219 && _1221;
        bool _1225 = _1077 < 0.001000000047497451305389404296875;
        bool _1227 = _1225 && _1223;
        if (!_1227)
        {
            _297 = as_type<int>(_1033);
        }
        int _1229 = _297;
        int _1231 = _1229;
        if (_1227)
        {
            float _1233 = _677 * _1061;
            _1231 = as_type<int>(_1233);
        }
        int _1235 = _1231;
        _303 = _1235;
        if (!_1227)
        {
            _299 = as_type<int>(_1037);
        }
        int _1237 = _299;
        int _1239 = _1237;
        if (_1227)
        {
            float _1241 = _679 * _1061;
            _1239 = as_type<int>(_1241);
        }
        int _1243 = _1239;
        _305 = _1243;
        if (!_1227)
        {
            _301 = as_type<int>(_1043);
        }
        int _1245 = _301;
        _307 = _1245;
        if (_1227)
        {
            float _1247 = _699 * _1061;
            _307 = as_type<int>(_1247);
        }
    }
    _1101 = false;
    int _1249 = _303;
    int _1251 = _305;
    int _1253 = _307;
    uint _1255 = uint(int(uint(_149) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1255)] = uint(_1249);
    uint _1257 = uint(int(uint(_1023) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1257)] = uint(_1251);
    uint _1259 = uint(int(uint(_1027) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1259)] = uint(_1253);
}

