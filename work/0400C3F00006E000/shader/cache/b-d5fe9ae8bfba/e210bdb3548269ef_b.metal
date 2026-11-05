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
    bool _1955 = false;
    bool _1239 = false;
    float _55 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _57 = as_type<float>(gl_LocalInvocationID.x);
    float _59 = as_type<float>(gl_WorkGroupID.x);
    int _62 = as_type<int>(_59) << 5;
    int _64 = _62 + as_type<int>(_57);
    float _66 = trunc(_55);
    int _68 = int(_66);
    bool _72 = _64 >= _68;
    int _74 = 0;
    float _76 = as_type<float>(_68);
    if (_72)
    {
        _74 = 0;
    }
    int _78 = _74;
    int _80 = _78;
    int _82 = _78;
    float _84 = 0.0;
    if (!_72)
    {
        int _86 = _64 << 4;
        int _88 = _86 + 12;
        uint _91 = uint(int(uint(_88) >> uint(2)));
        float _93 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_91)]);
        float _95 = trunc(_93);
        int _97 = int(_95);
        bool _99 = _97 >= 1;
        int _101 = _99 ? (-1) : 0;
        _76 = as_type<float>(_88);
        _84 = as_type<float>(_97);
        if (!_99)
        {
            _80 = 0;
        }
        int _103 = _80;
        bool _105 = !_99;
        _82 = _103;
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
            _76 = _111;
            _84 = _113;
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
            _82 = _135;
            if (!_119)
            {
                int _137 = ~_133;
                int _139 = (_137 != 0) ? 0 : 1;
                _82 = _139;
            }
        }
    }
    int _141 = _82;
    float _143 = _76;
    float _145 = _84;
    int _147 = _141 & 1;
    bool _149 = _147 != 0;
    if (!_149)
    {
        return;
    }
    float _151 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _153 = _64 << 4;
    uint _155 = uint(int(uint(_153) >> uint(2)));
    float _157 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_155)]);
    int _159 = _153 + 4;
    uint _161 = uint(int(uint(_159) >> uint(2)));
    float _163 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_161)]);
    int _165 = _153 + 8;
    uint _167 = uint(int(uint(_165) >> uint(2)));
    float _169 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_167)]);
    int _171 = as_type<int>(_151) & 512;
    bool _173 = _171 != 0;
    int _175 = _153 + 12;
    uint _177 = uint(int(uint(_153) >> uint(2)));
    float _179 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_177)]);
    int _181 = _153 + 4;
    uint _183 = uint(int(uint(_181) >> uint(2)));
    float _185 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_183)]);
    int _187 = _153 + 8;
    uint _189 = uint(int(uint(_187) >> uint(2)));
    float _191 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_189)]);
    uint _193 = uint(int(uint(_153) >> uint(2)));
    float _195 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_193)]);
    int _197 = _153 + 4;
    uint _199 = uint(int(uint(_197) >> uint(2)));
    float _201 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_199)]);
    int _203 = _153 + 8;
    uint _205 = uint(int(uint(_203) >> uint(2)));
    float _207 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_205)]);
    float _209 = 0.0;
    float _211 = 0.0;
    float _213 = 0.0;
    if (_173)
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
    if (_173)
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
    float _245 = as_type<float>(_141);
    float _247 = _143;
    float _249 = _145;
    if (_173)
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
    uint _263 = uint(int(uint(_175) >> uint(2)));
    float _265 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_263)]);
    uint _267 = uint(int(uint(_175) >> uint(2)));
    float _269 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_267)]);
    float _271 = 0.0;
    float _273 = _239;
    float _275 = _241;
    float _277 = _243;
    float _279 = _221;
    float _281 = _223;
    float _283 = _225;
    float _285 = _257;
    float _287 = _259;
    float _289 = _261;
    float _291 = _191;
    float _293 = _179;
    float _295 = _185;
    int _297 = as_type<int>(_201);
    int _299 = as_type<int>(_207);
    int _301 = as_type<int>(_201);
    int _303 = as_type<int>(_207);
    int _305 = as_type<int>(_201);
    int _307 = as_type<int>(_207);
    if (!_173)
    {
        int _309 = _153 + 4;
        uint _311 = uint(int(uint(_153) >> uint(2)));
        float _313 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_311)]);
        int _315 = _153 + 8;
        uint _317 = uint(int(uint(_153) >> uint(2)));
        float _319 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_317)]);
        uint _321 = uint(int(uint(_309) >> uint(2)));
        float _323 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_321)]);
        uint _325 = uint(int(uint(_309) >> uint(2)));
        float _327 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_325)]);
        uint _329 = uint(int(uint(_315) >> uint(2)));
        float _331 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_329)]);
        uint _333 = uint(int(uint(_153) >> uint(2)));
        float _335 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_333)]);
        uint _337 = uint(int(uint(_315) >> uint(2)));
        float _339 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_337)]);
        uint _341 = uint(int(uint(_309) >> uint(2)));
        float _343 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_341)]);
        uint _345 = uint(int(uint(_315) >> uint(2)));
        float _347 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_345)]);
        float _349 = _313 * _313;
        float _351 = fma(_319, _319, _349);
        float _353 = _323 * _323;
        float _355 = fma(_327, _327, _353);
        float _357 = _331 * _331;
        float _359 = fma(_335, _335, _351);
        float _361 = fma(_339, _339, _357);
        float _363 = sqrt(_359);
        float _365 = fma(_343, _343, _355);
        float _367 = fma(_347, _347, _361);
        float _369 = sqrt(_365);
        float _371 = sqrt(_367);
        bool _373 = _363 > 0.0;
        bool _375 = _369 > 0.0;
        bool _377 = _371 > 0.0;
        float _379 = _369;
        float _381 = _371;
        float _383 = _361;
        float _385 = _313;
        float _387 = _363;
        float _389 = _319;
        float _391 = _355;
        float _393 = _323;
        float _395 = _343;
        float _397 = _335;
        _271 = _367;
        if (_373)
        {
            float _399 = rsqrt(_359);
            _379 = _399;
        }
        float _401 = _379;
        float _403 = 0.0;
        if (_375)
        {
            float _405 = rsqrt(_365);
            _403 = _405;
        }
        float _407 = _403;
        float _409 = 0.0;
        if (_377)
        {
            float _411 = rsqrt(_367);
            _409 = _411;
        }
        float _413 = _409;
        if (!_373)
        {
            _381 = 0.0;
        }
        float _415 = _381;
        float _417 = _415;
        if (_373)
        {
            float _419 = _313 * _401;
            _417 = _419;
        }
        float _421 = _417;
        _273 = _421;
        if (!_373)
        {
            _383 = 0.0;
        }
        float _423 = _383;
        float _425 = _423;
        if (_373)
        {
            float _427 = _319 * _401;
            _425 = _427;
        }
        float _429 = _425;
        _279 = _429;
        if (!_373)
        {
            _385 = 0.0;
        }
        float _431 = _385;
        float _433 = _431;
        if (_373)
        {
            float _435 = _335 * _401;
            _433 = _435;
        }
        float _437 = _433;
        _285 = _437;
        if (!_375)
        {
            _387 = 0.0;
        }
        float _439 = _387;
        float _441 = _439;
        if (_375)
        {
            float _443 = _323 * _407;
            _441 = _443;
        }
        float _445 = _441;
        _275 = _445;
        if (!_375)
        {
            _389 = 0.0;
        }
        float _447 = _389;
        float _449 = _447;
        if (_375)
        {
            float _451 = _343 * _407;
            _449 = _451;
        }
        float _453 = _449;
        _287 = _453;
        if (!_375)
        {
            _391 = 0.0;
        }
        float _455 = _391;
        float _457 = _455;
        if (_375)
        {
            float _459 = _327 * _407;
            _457 = _459;
        }
        float _461 = _457;
        _281 = _461;
        if (!_377)
        {
            _393 = 0.0;
        }
        float _463 = _393;
        float _465 = _463;
        if (!_377)
        {
            _395 = 0.0;
        }
        float _467 = _395;
        float _469 = _467;
        if (_377)
        {
            float _471 = _331 * _413;
            _465 = _471;
        }
        float _473 = _465;
        _277 = _473;
        if (!_377)
        {
            _397 = 0.0;
        }
        float _475 = _397;
        _289 = _475;
        if (_377)
        {
            float _477 = _339 * _413;
            _469 = _477;
        }
        float _479 = _469;
        _283 = _479;
        if (_377)
        {
            float _481 = _347 * _413;
            _289 = _481;
        }
    }
    float _483 = _271;
    float _485 = _273;
    float _487 = _275;
    float _489 = _277;
    float _491 = _279;
    float _493 = _281;
    float _495 = _283;
    float _497 = _285;
    float _499 = _287;
    float _501 = _289;
    float _503 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _505 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[36]);
    float _507 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _509 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _511 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _513 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _515 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    bool _517 = _505 > 0.0;
    float _519 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _521 = _483;
    if (_517)
    {
        float _523 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[52]);
        _521 = _523;
    }
    float _525 = _521;
    float _527 = abs(_503);
    float _529 = log2(_527);
    float _531 = _509 * _513;
    float _533 = _507 * _513;
    float _535 = _511 * _513;
    float _537 = _531 * _485;
    float _539 = _531 * _487;
    float _541 = _531 * _489;
    float _543 = _179 * _515;
    float _545 = _515 * _529;
    float _547 = exp2(_545);
    float _549 = fma(_533, _491, _537);
    float _551 = fma(_533, _493, _539);
    float _553 = fma(_533, _495, _541);
    float _555 = fma(_269, _543, _157);
    float _557 = fma(_535, _497, _549);
    float _559 = fma(_535, _499, _551);
    float _561 = fma(_535, _501, _553);
    float _563 = _515 * _557;
    float _565 = _515 * _559;
    float _567 = _185 * _515;
    float _569 = _515 * _561;
    float _571 = _191 * _515;
    float _573 = fma(_269, _567, _163);
    float _575 = fma(_179, _547, _563);
    float _577 = fma(_185, _547, _565);
    float _579 = fma(_191, _547, _569);
    float _581 = fma(_269, _571, _169);
    float _583 = _269 * _543;
    float _585 = _269 * _567;
    float _587 = _269 * _571;
    bool _589 = _525 == 0.0;
    bool _591 = _525 == 0.0;
    bool _593 = _591 && _517;
    float _595 = _545;
    int _597 = as_type<int>(_583);
    int _599 = as_type<int>(_583);
    if (_593)
    {
        _291 = 0.0;
    }
    float _601 = _291;
    float _603 = _601;
    if (_593)
    {
        _293 = 0.0;
        _295 = 0.0;
    }
    float _605 = _293;
    float _607 = _295;
    bool _609 = _517 && _589;
    float _611 = _607;
    float _613 = _605;
    if (!_609)
    {
        float _615 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[32]);
        bool _617 = _525 > 0.0;
        bool _619 = _617 && _517;
        float _621 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[28]);
        float _623 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[29]);
        float _625 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[30]);
        float _627 = trunc(_615);
        int _629 = int(_627);
        bool _631 = _629 != 0;
        float _633 = 0.0;
        if (!_631)
        {
            _633 = 0.0;
        }
        float _635 = _633;
        float _637 = 0.0;
        float _639 = 0.0;
        float _641 = _635;
        float _643 = _635;
        if (!_631)
        {
            _637 = 0.0;
            _639 = 0.0;
        }
        float _645 = _637;
        float _647 = _639;
        bool _649 = !_631;
        float _651 = _645;
        float _653 = _647;
        float _655 = _645;
        float _657 = _647;
        float _659 = _621;
        float _661 = _623;
        float _663 = _625;
        if (!_649)
        {
            int _665 = as_type<int>(_151) & 2048;
            bool _667 = _665 != 0;
            if (!_667)
            {
                _641 = 0.0;
            }
            float _669 = _641;
            _643 = _669;
            if (!_667)
            {
                _651 = 0.0;
                _653 = 0.0;
            }
            float _671 = _651;
            float _673 = _653;
            bool _675 = !_667;
            _655 = _671;
            _657 = _673;
            if (!_675)
            {
                float _677 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                uint _679 = uint(int(uint(_153) >> uint(2)));
                float _681 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_679)]);
                int _683 = _153 + 4;
                uint _685 = uint(int(uint(_683) >> uint(2)));
                float _687 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_685)]);
                int _689 = _153 + 8;
                uint _691 = uint(int(uint(_689) >> uint(2)));
                float _693 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_691)]);
                int _695 = _153 + 12;
                uint _697 = uint(int(uint(_695) >> uint(2)));
                float _699 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_697)]);
                uint _701 = uint(int(uint(_153) >> uint(2)));
                float _703 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_701)]);
                int _705 = _153 + 4;
                uint _707 = uint(int(uint(_705) >> uint(2)));
                float _709 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_707)]);
                int _711 = _153 + 8;
                uint _713 = uint(int(uint(_711) >> uint(2)));
                float _715 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_713)]);
                int _717 = _153 + 12;
                uint _719 = uint(int(uint(_717) >> uint(2)));
                float _721 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_719)]);
                uint _723 = uint(int(uint(_153) >> uint(2)));
                float _725 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_723)]);
                int _727 = _153 + 4;
                uint _729 = uint(int(uint(_727) >> uint(2)));
                float _731 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_729)]);
                int _733 = _153 + 8;
                uint _735 = uint(int(uint(_733) >> uint(2)));
                float _737 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_735)]);
                int _739 = _153 + 12;
                uint _741 = uint(int(uint(_739) >> uint(2)));
                float _743 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_741)]);
                float _745 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                float _747 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _749 = _693 * _703;
                float _751 = _693 * _709;
                float _753 = -_749;
                float _755 = fma(_681, _715, _753);
                float _757 = _699 * _715;
                float _759 = _699 * _709;
                float _761 = _699 * _703;
                float _763 = _687 * _703;
                float _765 = -_751;
                float _767 = fma(_687, _715, _765);
                float _769 = _731 * _755;
                float _771 = -_763;
                float _773 = fma(_681, _709, _771);
                float _775 = -_769;
                float _777 = fma(_725, _767, _775);
                float _779 = fma(_737, _773, _777);
                float _781 = -_761;
                float _783 = fma(_681, _721, _781);
                float _785 = 1.0 / _779;
                float _787 = -_759;
                float _789 = fma(_687, _721, _787);
                float _791 = _725 * _709;
                float _793 = _725 * _693;
                float _795 = -_757;
                float _797 = fma(_693, _721, _795);
                float _799 = _737 * _783;
                float _801 = _731 * _715;
                float _803 = _737 * _703;
                float _805 = -_681;
                float _807 = fma(_805, _715, _749);
                float _809 = -_791;
                float _811 = fma(_731, _703, _809);
                float _813 = -_793;
                float _815 = fma(_737, _681, _813);
                float _817 = _731 * _681;
                float _819 = _731 * _783;
                float _821 = -_799;
                float _823 = fma(_725, _797, _821);
                float _825 = -_801;
                float _827 = fma(_737, _709, _825);
                float _829 = -_803;
                float _831 = fma(_725, _715, _829);
                float _833 = _737 * _687;
                float _835 = _737 * _789;
                float _837 = -_817;
                float _839 = fma(_725, _687, _837);
                float _841 = -_819;
                float _843 = fma(_725, _789, _841);
                float _845 = fma(_743, _755, _823);
                float _847 = _831 * _785;
                float _849 = _827 * _785;
                float _851 = _811 * _785;
                float _853 = -_833;
                float _855 = fma(_731, _693, _853);
                float _857 = -_835;
                float _859 = fma(_731, _797, _857);
                float _861 = _807 * _785;
                float _863 = _677 * _847;
                float _865 = _745 * _785;
                float _867 = _677 * _849;
                float _869 = _677 * _851;
                float _871 = fma(_743, _767, _859);
                float _873 = fma(_745, _861, _863);
                float _875 = fma(_767, _865, _867);
                float _877 = fma(_773, _865, _869);
                float _879 = _855 * _785;
                float _881 = _815 * _785;
                float _883 = _839 * _785;
                float _885 = fma(_743, _773, _843);
                float _887 = fma(_747, _879, _875);
                float _889 = fma(_747, _881, _873);
                float _891 = fma(_747, _883, _877);
                float _893 = -_871;
                float _895 = fma(_893, _785, _887);
                float _897 = fma(_845, _785, _889);
                float _899 = -_885;
                float _901 = fma(_899, _785, _891);
                _595 = _881;
                _643 = _895;
                _655 = _897;
                _657 = _901;
            }
        }
        float _903 = _595;
        float _905 = _643;
        float _907 = _655;
        float _909 = _657;
        bool _911 = !_619;
        float _913 = _903;
        float _915 = _907;
        float _917 = _909;
        if (!_911)
        {
            float _919 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[48]);
            float _921 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[49]);
            float _923 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[50]);
            bool _925 = !_173;
            _659 = _919;
            _661 = _921;
            _663 = _923;
            if (!_925)
            {
                float _927 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
                float _929 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
                float _931 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
                float _933 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _935 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[28]);
                float _937 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[29]);
                float _939 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[30]);
                float _941 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[31]);
                float _943 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
                float _945 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
                float _947 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
                float _949 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                float _951 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
                float _953 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
                float _955 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
                float _957 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                float _959 = _933 * _937;
                float _961 = _933 * _939;
                float _963 = _933 * _935;
                float _965 = _949 * _931;
                float _967 = _949 * _929;
                float _969 = _949 * _927;
                float _971 = _949 * _939;
                float _973 = _949 * _937;
                float _975 = _949 * _935;
                float _977 = -_959;
                float _979 = fma(_929, _941, _977);
                float _981 = -_965;
                float _983 = fma(_947, _933, _981);
                float _985 = -_967;
                float _987 = fma(_945, _933, _985);
                float _989 = -_969;
                float _991 = fma(_943, _933, _989);
                float _993 = _931 * _937;
                float _995 = _931 * _935;
                float _997 = _947 * _937;
                float _999 = _947 * _935;
                float _1001 = -_961;
                float _1003 = fma(_931, _941, _1001);
                float _1005 = -_963;
                float _1007 = fma(_927, _941, _1005);
                float _1009 = -_971;
                float _1011 = fma(_947, _941, _1009);
                float _1013 = -_973;
                float _1015 = fma(_945, _941, _1013);
                float _1017 = -_975;
                float _1019 = fma(_943, _941, _1017);
                float _1021 = _929 * _935;
                float _1023 = -_993;
                float _1025 = fma(_929, _939, _1023);
                float _1027 = -_995;
                float _1029 = fma(_927, _939, _1027);
                float _1031 = -_997;
                float _1033 = fma(_945, _939, _1031);
                float _1035 = -_999;
                float _1037 = fma(_943, _939, _1035);
                float _1039 = _947 * _929;
                float _1041 = _947 * _927;
                float _1043 = -_1021;
                float _1045 = fma(_927, _937, _1043);
                float _1047 = _945 * _927;
                float _1049 = -_1039;
                float _1051 = fma(_945, _931, _1049);
                float _1053 = -_1041;
                float _1055 = fma(_943, _931, _1053);
                float _1057 = _947 * _1007;
                float _1059 = -_1047;
                float _1061 = fma(_943, _929, _1059);
                float _1063 = _947 * _979;
                float _1065 = _945 * _935;
                float _1067 = -_1057;
                float _1069 = fma(_943, _1003, _1067);
                float _1071 = _945 * _1007;
                float _1073 = -_1063;
                float _1075 = fma(_945, _1003, _1073);
                float _1077 = -_1065;
                float _1079 = fma(_943, _937, _1077);
                float _1081 = fma(_949, _1029, _1069);
                float _1083 = _945 * _1029;
                float _1085 = -_1071;
                float _1087 = fma(_943, _979, _1085);
                float _1089 = fma(_949, _1025, _1075);
                float _1091 = _953 * _1081;
                float _1093 = -_1083;
                float _1095 = fma(_943, _1025, _1093);
                float _1097 = _955 * _979;
                float _1099 = fma(_949, _1045, _1087);
                float _1101 = -_1091;
                float _1103 = fma(_951, _1089, _1101);
                float _1105 = fma(_947, _1045, _1095);
                float _1107 = -_1097;
                float _1109 = fma(_953, _1003, _1107);
                float _1111 = _955 * _1007;
                float _1113 = fma(_955, _1099, _1103);
                float _1115 = _953 * _1007;
                float _1117 = _955 * _987;
                float _1119 = -_1111;
                float _1121 = fma(_951, _1003, _1119);
                float _1123 = -_957;
                float _1125 = fma(_1123, _1105, _1113);
                float _1127 = _955 * _1019;
                float _1129 = -_1115;
                float _1131 = fma(_951, _979, _1129);
                float _1133 = _955 * _1015;
                float _1135 = 1.0 / _1125;
                float _1137 = -_1127;
                float _1139 = fma(_951, _1011, _1137);
                float _1141 = _955 * _991;
                float _1143 = fma(_957, _1025, _1109);
                float _1145 = _953 * _1019;
                float _1147 = -_1117;
                float _1149 = fma(_953, _983, _1147);
                float _1151 = fma(_957, _1045, _1131);
                float _1153 = _953 * _991;
                float _1155 = -_1141;
                float _1157 = fma(_951, _983, _1155);
                float _1159 = fma(_957, _1029, _1121);
                float _1161 = -_1133;
                float _1163 = fma(_953, _1011, _1161);
                float _1165 = -_1145;
                float _1167 = fma(_951, _1015, _1165);
                float _1169 = -_1153;
                float _1171 = fma(_951, _987, _1169);
                float _1173 = fma(_957, _1037, _1139);
                float _1175 = fma(_957, _1033, _1163);
                float _1177 = fma(_957, _1079, _1167);
                float _1179 = _1081 * _1135;
                float _1181 = _1143 * _1135;
                float _1183 = _1151 * _1135;
                float _1185 = _1159 * _1135;
                float _1187 = _919 * _1179;
                float _1189 = _1089 * _1135;
                float _1191 = _921 * _1181;
                float _1193 = _1099 * _1135;
                float _1195 = _921 * _1183;
                float _1197 = -_1187;
                float _1199 = fma(_921, _1185, _1197);
                float _1201 = -_1191;
                float _1203 = fma(_919, _1189, _1201);
                float _1205 = _1175 * _1135;
                float _1207 = -_1195;
                float _1209 = fma(_919, _1193, _1207);
                float _1211 = _1173 * _1135;
                float _1213 = _1177 * _1135;
                float _1215 = fma(_957, _1051, _1149);
                float _1217 = fma(_923, _1205, _1203);
                float _1219 = fma(_957, _1055, _1157);
                float _1221 = fma(_957, _1061, _1171);
                float _1223 = -_1211;
                float _1225 = fma(_923, _1223, _1199);
                float _1227 = fma(_923, _1213, _1209);
                float _1229 = -_1215;
                float _1231 = fma(_1229, _1135, _1217);
                float _1233 = fma(_1219, _1135, _1225);
                float _1235 = -_1221;
                float _1237 = fma(_1235, _1135, _1227);
                _659 = _1231;
                _661 = _1233;
                _663 = _1237;
                _913 = _1181;
                _1239 = true;
            }
            else
            {
                int _1241 = as_type<int>(_151) & 1024;
                bool _1243 = _1241 != 0;
                bool _1245 = !_1243;
                if (!_1245)
                {
                    float _1247 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                    uint _1249 = uint(int(uint(_153) >> uint(2)));
                    float _1251 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1249)]);
                    int _1253 = _153 + 4;
                    uint _1255 = uint(int(uint(_1253) >> uint(2)));
                    float _1257 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1255)]);
                    int _1259 = _153 + 8;
                    uint _1261 = uint(int(uint(_1259) >> uint(2)));
                    float _1263 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1261)]);
                    uint _1265 = uint(int(uint(_153) >> uint(2)));
                    float _1267 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1265)]);
                    int _1269 = _153 + 4;
                    uint _1271 = uint(int(uint(_1269) >> uint(2)));
                    float _1273 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1271)]);
                    int _1275 = _153 + 8;
                    uint _1277 = uint(int(uint(_1275) >> uint(2)));
                    float _1279 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1277)]);
                    uint _1281 = uint(int(uint(_153) >> uint(2)));
                    float _1283 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1281)]);
                    int _1285 = _153 + 4;
                    uint _1287 = uint(int(uint(_1285) >> uint(2)));
                    float _1289 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1287)]);
                    int _1291 = _153 + 8;
                    uint _1293 = uint(int(uint(_1291) >> uint(2)));
                    float _1295 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1293)]);
                    float _1297 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                    float _1299 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                    float _1301 = _1263 * _1267;
                    float _1303 = _1263 * _1273;
                    float _1305 = -_1301;
                    float _1307 = fma(_1251, _1279, _1305);
                    float _1309 = _1257 * _1267;
                    float _1311 = -_1303;
                    float _1313 = fma(_1257, _1279, _1311);
                    float _1315 = _1289 * _1307;
                    float _1317 = -_1309;
                    float _1319 = fma(_1251, _1273, _1317);
                    float _1321 = -_1315;
                    float _1323 = fma(_1283, _1313, _1321);
                    float _1325 = _1247 * _1279;
                    float _1327 = _1247 * _1273;
                    float _1329 = _1247 * _1267;
                    float _1331 = fma(_1295, _1319, _1323);
                    float _1333 = 1.0 / _1331;
                    float _1335 = _1295 * _1267;
                    float _1337 = _1289 * _1279;
                    float _1339 = -_1327;
                    float _1341 = fma(_1297, _1257, _1339);
                    float _1343 = -_1251;
                    float _1345 = fma(_1343, _1279, _1301);
                    float _1347 = _1283 * _1273;
                    float _1349 = -_1325;
                    float _1351 = fma(_1297, _1263, _1349);
                    float _1353 = -_1329;
                    float _1355 = fma(_1297, _1251, _1353);
                    float _1357 = _1283 * _1263;
                    float _1359 = -_1335;
                    float _1361 = fma(_1283, _1279, _1359);
                    float _1363 = -_1337;
                    float _1365 = fma(_1295, _1273, _1363);
                    float _1367 = _1289 * _1251;
                    float _1369 = -_1347;
                    float _1371 = fma(_1289, _1267, _1369);
                    float _1373 = -_1357;
                    float _1375 = fma(_1295, _1251, _1373);
                    float _1377 = _1295 * _1257;
                    float _1379 = _1295 * _1341;
                    float _1381 = _1365 * _1333;
                    float _1383 = _1361 * _1333;
                    float _1385 = -_1367;
                    float _1387 = fma(_1283, _1257, _1385);
                    float _1389 = _1371 * _1333;
                    float _1391 = _1295 * _1355;
                    float _1393 = -_1377;
                    float _1395 = fma(_1289, _1263, _1393);
                    float _1397 = _1289 * _1355;
                    float _1399 = -_1379;
                    float _1401 = fma(_1289, _1351, _1399);
                    float _1403 = _1381 * _921;
                    float _1405 = _1383 * _921;
                    float _1407 = _1389 * _921;
                    float _1409 = _1345 * _1333;
                    float _1411 = _1313 * _1333;
                    float _1413 = _1319 * _1333;
                    float _1415 = -_1391;
                    float _1417 = fma(_1283, _1351, _1415);
                    float _1419 = fma(_1409, _919, _1405);
                    float _1421 = fma(_919, _1411, _1403);
                    float _1423 = fma(_919, _1413, _1407);
                    float _1425 = _1375 * _1333;
                    float _1427 = _1395 * _1333;
                    float _1429 = _1387 * _1333;
                    float _1431 = -_1397;
                    float _1433 = fma(_1283, _1341, _1431);
                    float _1435 = fma(_1425, _923, _1419);
                    float _1437 = fma(_1427, _923, _1421);
                    float _1439 = fma(_1299, _1307, _1417);
                    float _1441 = fma(_1429, _923, _1423);
                    float _1443 = fma(_1299, _1313, _1401);
                    float _1445 = fma(_1299, _1319, _1433);
                    float _1447 = fma(_1439, _1333, _1435);
                    float _1449 = -_1443;
                    float _1451 = fma(_1449, _1333, _1437);
                    float _1453 = -_1445;
                    float _1455 = fma(_1453, _1333, _1441);
                    _659 = _1451;
                    _661 = _1447;
                    _663 = _1455;
                    _913 = _1411;
                    _1239 = true;
                }
                else
                {
                    int _1457 = as_type<int>(_151) & 2048;
                    bool _1459 = _1457 != 0;
                    bool _1461 = !_1459;
                    if (!_1461)
                    {
                        uint _1463 = uint(int(uint(_153) >> uint(2)));
                        float _1465 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1463)]);
                        int _1467 = _153 + 4;
                        uint _1469 = uint(int(uint(_1467) >> uint(2)));
                        float _1471 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1469)]);
                        int _1473 = _153 + 8;
                        uint _1475 = uint(int(uint(_1473) >> uint(2)));
                        float _1477 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1475)]);
                        int _1479 = _153 + 12;
                        uint _1481 = uint(int(uint(_1479) >> uint(2)));
                        float _1483 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1481)]);
                        uint _1485 = uint(int(uint(_153) >> uint(2)));
                        float _1487 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1485)]);
                        int _1489 = _153 + 4;
                        uint _1491 = uint(int(uint(_1489) >> uint(2)));
                        float _1493 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1491)]);
                        int _1495 = _153 + 8;
                        uint _1497 = uint(int(uint(_1495) >> uint(2)));
                        float _1499 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1497)]);
                        int _1501 = _153 + 12;
                        uint _1503 = uint(int(uint(_1501) >> uint(2)));
                        float _1505 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1503)]);
                        uint _1507 = uint(int(uint(_153) >> uint(2)));
                        float _1509 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1507)]);
                        int _1511 = _153 + 4;
                        uint _1513 = uint(int(uint(_1511) >> uint(2)));
                        float _1515 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1513)]);
                        int _1517 = _153 + 8;
                        uint _1519 = uint(int(uint(_1517) >> uint(2)));
                        float _1521 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1519)]);
                        int _1523 = _153 + 12;
                        uint _1525 = uint(int(uint(_1523) >> uint(2)));
                        float _1527 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1525)]);
                        float _1529 = _1477 * _1487;
                        float _1531 = _1477 * _1493;
                        float _1533 = _1471 * _1487;
                        float _1535 = _1483 * _1493;
                        float _1537 = -_1529;
                        float _1539 = fma(_1465, _1499, _1537);
                        float _1541 = -_1531;
                        float _1543 = fma(_1471, _1499, _1541);
                        float _1545 = -_1533;
                        float _1547 = fma(_1465, _1493, _1545);
                        float _1549 = _1515 * _1499;
                        float _1551 = _1515 * _1539;
                        float _1553 = _1509 * _1493;
                        float _1555 = _1483 * _1499;
                        float _1557 = -_1549;
                        float _1559 = fma(_1521, _1493, _1557);
                        float _1561 = -_1551;
                        float _1563 = fma(_1509, _1543, _1561);
                        float _1565 = _1521 * _1487;
                        float _1567 = _1483 * _1487;
                        float _1569 = -_1535;
                        float _1571 = fma(_1471, _1505, _1569);
                        float _1573 = fma(_1521, _1547, _1563);
                        float _1575 = -_1465;
                        float _1577 = fma(_1575, _1499, _1529);
                        float _1579 = -_1565;
                        float _1581 = fma(_1509, _1499, _1579);
                        float _1583 = -_1553;
                        float _1585 = fma(_1515, _1487, _1583);
                        float _1587 = -_1555;
                        float _1589 = fma(_1477, _1505, _1587);
                        float _1591 = -_1567;
                        float _1593 = fma(_1465, _1505, _1591);
                        float _1595 = 1.0 / _1573;
                        float _1597 = _1509 * _1477;
                        float _1599 = _1521 * _1471;
                        float _1601 = _1515 * _1465;
                        float _1603 = _1515 * _1593;
                        float _1605 = -_1597;
                        float _1607 = fma(_1521, _1465, _1605);
                        float _1609 = -_1599;
                        float _1611 = fma(_1515, _1477, _1609);
                        float _1613 = _1521 * _1571;
                        float _1615 = -_1601;
                        float _1617 = fma(_1509, _1471, _1615);
                        float _1619 = _1521 * _1593;
                        float _1621 = -_1603;
                        float _1623 = fma(_1509, _1571, _1621);
                        float _1625 = -_1613;
                        float _1627 = fma(_1515, _1589, _1625);
                        float _1629 = -_1619;
                        float _1631 = fma(_1509, _1589, _1629);
                        float _1633 = fma(_1527, _1547, _1623);
                        float _1635 = fma(_1527, _1543, _1627);
                        float _1637 = _1559 * _1595;
                        float _1639 = _1581 * _1595;
                        float _1641 = _1585 * _1595;
                        float _1643 = _1577 * _1595;
                        float _1645 = _1637 * _921;
                        float _1647 = _1639 * _921;
                        float _1649 = _1641 * _921;
                        float _1651 = _1543 * _1595;
                        float _1653 = _1547 * _1595;
                        float _1655 = fma(_1643, _919, _1647);
                        float _1657 = _1607 * _1595;
                        float _1659 = fma(_919, _1651, _1645);
                        float _1661 = fma(_919, _1653, _1649);
                        float _1663 = _1611 * _1595;
                        float _1665 = _1617 * _1595;
                        float _1667 = fma(_1657, _923, _1655);
                        float _1669 = fma(_1527, _1539, _1631);
                        float _1671 = fma(_1663, _923, _1659);
                        float _1673 = fma(_1665, _923, _1661);
                        float _1675 = fma(_1669, _1595, _1667);
                        float _1677 = -_1635;
                        float _1679 = fma(_1677, _1595, _1671);
                        float _1681 = -_1633;
                        float _1683 = fma(_1681, _1595, _1673);
                        _659 = _1679;
                        _661 = _1675;
                        _663 = _1683;
                        _913 = _1611;
                    }
                }
            }
        }
        _1239 = false;
        float _1685 = _659;
        float _1687 = _661;
        float _1689 = _663;
        float _1691 = _913;
        float _1693 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[33]);
        float _1695 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[34]);
        float _1697 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[35]);
        bool _1699 = _1693 != 0.0;
        bool _1701 = isnan(_1693);
        bool _1703 = _1699 || _1701;
        bool _1705 = isnan(0.0);
        bool _1707 = _1703 || _1705;
        bool _1709 = _1695 != 0.0;
        bool _1711 = isnan(_1695);
        bool _1713 = _1709 || _1711;
        bool _1715 = isnan(0.0);
        bool _1717 = _1713 || _1715;
        bool _1719 = _1697 != 0.0;
        bool _1721 = isnan(_1697);
        bool _1723 = _1719 || _1721;
        bool _1725 = isnan(0.0);
        bool _1727 = _1723 || _1725;
        float _1729 = _1693;
        float _1731 = _1685;
        float _1733 = _1689;
        float _1735 = _1687;
        float _1737 = _1691;
        if (_1707)
        {
            float _1739 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[31]);
            _1729 = _1739;
        }
        float _1741 = _1729;
        float _1743 = _1695;
        if (_1717)
        {
            float _1745 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[31]);
            _1743 = _1745;
        }
        float _1747 = _1743;
        float _1749 = _1697;
        if (_1727)
        {
            float _1751 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[31]);
            _1749 = _1751;
        }
        float _1753 = _1749;
        if (_1707)
        {
            float _1755 = _905 + _1685;
            _1731 = _1755;
        }
        float _1757 = _1731;
        float _1759 = _1757;
        if (_1717)
        {
            float _1761 = _907 + _1687;
            _915 = _1761;
        }
        float _1763 = _915;
        if (_1727)
        {
            float _1765 = _909 + _1689;
            _917 = _1765;
        }
        float _1767 = _917;
        if (!_1707)
        {
            _1733 = 0.0;
        }
        float _1769 = _1733;
        float _1771 = _1769;
        if (_1707)
        {
            float _1773 = -_555;
            float _1775 = _1757 + _1773;
            _1759 = _1775;
        }
        float _1777 = _1759;
        float _1779 = _1777;
        if (_1717)
        {
            float _1781 = -_573;
            float _1783 = _1763 + _1781;
            _1735 = _1783;
        }
        float _1785 = _1735;
        float _1787 = _1785;
        if (_1727)
        {
            float _1789 = -_581;
            float _1791 = _1767 + _1789;
            _1737 = _1791;
        }
        float _1793 = _1737;
        float _1795 = _1793;
        if (_1707)
        {
            float _1797 = -_575;
            float _1799 = _1797 + _1777;
            _1779 = _1799;
        }
        float _1801 = _1779;
        float _1803 = _1801;
        if (_1717)
        {
            float _1805 = -_577;
            float _1807 = _1805 + _1785;
            _1787 = _1807;
        }
        float _1809 = _1787;
        float _1811 = _1809;
        if (_1727)
        {
            float _1813 = -_579;
            float _1815 = _1813 + _1793;
            _1795 = _1815;
        }
        float _1817 = _1795;
        float _1819 = _1817;
        if (_1707)
        {
            float _1821 = _1801 * _1741;
            _1803 = _1821;
        }
        float _1823 = _1803;
        float _1825 = _1747;
        float _1827 = _1823;
        if (_1717)
        {
            float _1829 = _1809 * _1747;
            _1825 = _1829;
        }
        float _1831 = _1825;
        float _1833 = _1831;
        if (_1707)
        {
            float _1835 = _269 * _1823;
            _1827 = _1835;
        }
        float _1837 = _1827;
        float _1839 = _1837;
        if (!_1717)
        {
            _1811 = 0.0;
        }
        float _1841 = _1811;
        float _1843 = _1841;
        if (_1727)
        {
            float _1845 = _1817 * _1753;
            _1819 = _1845;
        }
        float _1847 = _1819;
        float _1849 = _1847;
        if (_1717)
        {
            float _1851 = _269 * _1831;
            _1833 = _1851;
        }
        float _1853 = _1833;
        if (_1707)
        {
            float _1855 = _515 * _1837;
            _1771 = _1855;
        }
        float _1857 = _1771;
        _603 = _1857;
        if (!_1727)
        {
            _1839 = 0.0;
        }
        float _1859 = _1839;
        _613 = _1859;
        if (_1727)
        {
            float _1861 = _269 * _1847;
            _1849 = _1861;
        }
        float _1863 = _1849;
        if (_1717)
        {
            float _1865 = _515 * _1853;
            _1843 = _1865;
        }
        float _1867 = _1843;
        _611 = _1867;
        if (_1727)
        {
            float _1869 = _515 * _1863;
            _613 = _1869;
        }
    }
    float _1871 = _603;
    float _1873 = _611;
    float _1875 = _613;
    uint _1877 = uint(int(uint(_175) >> uint(2)));
    float _1879 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1877)]);
    int _1881 = _153 + 4;
    float _1883 = _575 + _1871;
    int _1885 = _153 + 8;
    float _1887 = _577 + _1873;
    float _1889 = _579 + _1875;
    float _1891 = _585 * _585;
    float _1893 = fma(_583, _583, _1891);
    float _1895 = fma(_587, _587, _1893);
    float _1897 = sqrt(_1895);
    uint _1899 = uint(int(uint(_175) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1899)] = as_type<uint>(_1879);
    uint _1901 = uint(int(uint(_153) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1901)] = as_type<uint>(_555);
    uint _1903 = uint(int(uint(_1881) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1903)] = as_type<uint>(_573);
    uint _1905 = uint(int(uint(_1885) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1905)] = as_type<uint>(_581);
    uint _1907 = uint(int(uint(_153) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1907)] = as_type<uint>(_1883);
    uint _1909 = uint(int(uint(_1881) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1909)] = as_type<uint>(_1887);
    uint _1911 = uint(int(uint(_1885) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1911)] = as_type<uint>(_1889);
    uint _1913 = uint(int(uint(_153) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1913)] = as_type<uint>(_583);
    uint _1915 = uint(int(uint(_1881) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1915)] = as_type<uint>(_585);
    uint _1917 = uint(int(uint(_1885) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1917)] = as_type<uint>(_587);
    float _1919 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1921 = _1887 * _1887;
    bool _1923 = _1897 >= 9.9999999747524270787835121154785e-07;
    bool _1925 = isnan(_1897);
    bool _1927 = _1923 || _1925;
    bool _1929 = isnan(9.9999999747524270787835121154785e-07);
    bool _1931 = _1927 || _1929;
    float _1933 = fma(_1883, _1883, _1921);
    float _1935 = fma(_1889, _1889, _1933);
    float _1937 = sqrt(_1935);
    int _1953;
    if (!_1931)
    {
        bool _1939 = _519 != _265;
        bool _1941 = isnan(_519);
        bool _1943 = _1939 || _1941;
        bool _1945 = isnan(_265);
        bool _1947 = _1943 || _1945;
        if (_1947)
        {
            _597 = as_type<int>(_195);
        }
        int _1949 = _597;
        int _1951 = _1949;
        _1953 = _1949;
        _1955 = _1947;
        if (!_1955)
        {
            float _1957 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _1959 = _1957 > 0.0;
            bool _1961 = !_1959;
            if (!_1961)
            {
                float _1963 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _1965 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _1967 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _1969 = _1965 * _487;
                float _1971 = _1965 * _485;
                float _1973 = _1965 * _489;
                float _1975 = fma(_1963, _493, _1969);
                float _1977 = fma(_1963, _491, _1971);
                float _1979 = fma(_1963, _495, _1973);
                float _1981 = fma(_1967, _499, _1975);
                float _1983 = fma(_1967, _497, _1977);
                float _1985 = fma(_1967, _501, _1979);
                float _1987 = _1981 * _1981;
                float _1989 = fma(_1983, _1983, _1987);
                float _1991 = fma(_1985, _1985, _1989);
                float _1993 = rsqrt(_1991);
                float _1995 = _1993 * 9.9999999747524270787835121154785e-07;
                float _1997 = _1983 * _1995;
                float _1999 = _1981 * _1995;
                float _2001 = _1985 * _1995;
                _1953 = as_type<int>(_1997);
                _305 = as_type<int>(_1999);
                _307 = as_type<int>(_2001);
                _1955 = true;
            }
            else
            {
                bool _2003 = _1937 >= 9.9999999747524270787835121154785e-07;
                bool _2005 = isnan(_1937);
                bool _2007 = _2003 || _2005;
                bool _2009 = isnan(9.9999999747524270787835121154785e-07);
                bool _2011 = _2007 || _2009;
                if (!_2011)
                {
                    float _2013 = _573 * _573;
                    float _2015 = fma(_555, _555, _2013);
                    float _2017 = fma(_581, _581, _2015);
                    float _2019 = sqrt(_2017);
                    bool _2021 = _2019 >= 9.9999999747524270787835121154785e-07;
                    bool _2023 = isnan(_2019);
                    bool _2025 = _2021 || _2023;
                    bool _2027 = isnan(9.9999999747524270787835121154785e-07);
                    bool _2029 = _2025 || _2027;
                    float _2031 = _2019;
                    if (_2029)
                    {
                        float _2033 = rsqrt(_2017);
                        _2031 = _2033;
                    }
                    float _2035 = _2031;
                    if (!_2029)
                    {
                        _1951 = 0;
                    }
                    int _2037 = _1951;
                    int _2039 = _2037;
                    if (!_2029)
                    {
                        _297 = 897988541;
                    }
                    int _2041 = _297;
                    int _2043 = _2041;
                    if (!_2029)
                    {
                        _299 = 0;
                    }
                    int _2045 = _299;
                    float _2047 = _2035;
                    int _2049 = _2045;
                    if (_2029)
                    {
                        float _2051 = _2035 * 9.9999999747524270787835121154785e-07;
                        _2047 = _2051;
                    }
                    float _2053 = _2047;
                    if (_2029)
                    {
                        float _2055 = _555 * _2053;
                        _2039 = as_type<int>(_2055);
                    }
                    int _2057 = _2039;
                    _1953 = _2057;
                    if (_2029)
                    {
                        float _2059 = _573 * _2053;
                        _2043 = as_type<int>(_2059);
                    }
                    int _2061 = _2043;
                    _305 = _2061;
                    if (_2029)
                    {
                        float _2063 = _581 * _2053;
                        _2049 = as_type<int>(_2063);
                    }
                    int _2065 = _2049;
                    _307 = _2065;
                    _1955 = true;
                }
                else
                {
                    float _2067 = rsqrt(_1935);
                    float _2069 = _2067 * 9.9999999747524270787835121154785e-07;
                    float _2071 = _1883 * _2069;
                    float _2073 = _1887 * _2069;
                    float _2075 = _1889 * _2069;
                    _1953 = as_type<int>(_2071);
                    _305 = as_type<int>(_2073);
                    _307 = as_type<int>(_2075);
                    _1955 = true;
                }
            }
        }
    }
    else
    {
        float _2077 = _1937 * _1919;
        bool _2079 = _2077 >= 0.001000000047497451305389404296875;
        bool _2081 = isnan(_2077);
        bool _2083 = _2079 || _2081;
        bool _2085 = isnan(0.001000000047497451305389404296875);
        bool _2087 = _2083 || _2085;
        bool _2089 = _2077 > 0.0;
        bool _2091 = !_2087;
        bool _2093 = _2089 && _2091;
        bool _2095 = _1897 < 0.001000000047497451305389404296875;
        bool _2097 = _2095 && _2093;
        if (!_2097)
        {
            _301 = as_type<int>(_585);
        }
        int _2099 = _301;
        int _2101 = _2099;
        if (_2097)
        {
            float _2103 = _1883 * _1919;
            _599 = as_type<int>(_2103);
        }
        int _2105 = _599;
        _1953 = _2105;
        if (!_2097)
        {
            _303 = as_type<int>(_587);
        }
        int _2107 = _303;
        _307 = _2107;
        if (_2097)
        {
            float _2109 = _1887 * _1919;
            _2101 = as_type<int>(_2109);
        }
        int _2111 = _2101;
        _305 = _2111;
        if (_2097)
        {
            float _2113 = _1889 * _1919;
            _307 = as_type<int>(_2113);
        }
    }
    _1955 = false;
    int _2115 = _1953;
    int _2117 = _305;
    int _2119 = _307;
    uint _2121 = uint(int(uint(_153) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2121)] = uint(_2115);
    uint _2123 = uint(int(uint(_1881) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2123)] = uint(_2117);
    uint _2125 = uint(int(uint(_1885) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2125)] = uint(_2119);
}

