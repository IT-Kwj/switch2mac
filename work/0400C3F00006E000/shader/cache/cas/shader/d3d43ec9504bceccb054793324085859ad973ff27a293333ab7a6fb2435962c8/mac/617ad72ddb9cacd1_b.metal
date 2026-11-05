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
    bool _2357 = false;
    bool _2101 = false;
    bool _1255 = false;
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
    uint _271 = uint(int(uint(_179) >> uint(2)));
    float _273 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_271)]);
    uint _275 = uint(int(uint(_179) >> uint(2)));
    float _277 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_275)]);
    float _279 = _245;
    float _281 = _243;
    float _283 = _247;
    float _285 = _227;
    float _287 = _225;
    float _289 = _229;
    float _291 = _263;
    float _293 = _261;
    float _295 = _265;
    float _297 = _277;
    int _299 = as_type<int>(_199);
    int _301 = as_type<int>(_205);
    int _303 = as_type<int>(_211);
    int _305 = as_type<int>(_199);
    int _307 = as_type<int>(_205);
    int _309 = as_type<int>(_211);
    int _311 = as_type<int>(_199);
    int _313 = as_type<int>(_205);
    int _315 = as_type<int>(_211);
    if (!_177)
    {
        int _317 = _157 + 4;
        uint _319 = uint(int(uint(_157) >> uint(2)));
        float _321 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_319)]);
        int _323 = _157 + 8;
        uint _325 = uint(int(uint(_157) >> uint(2)));
        float _327 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_325)]);
        uint _329 = uint(int(uint(_317) >> uint(2)));
        float _331 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_329)]);
        uint _333 = uint(int(uint(_317) >> uint(2)));
        float _335 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_333)]);
        uint _337 = uint(int(uint(_323) >> uint(2)));
        float _339 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_337)]);
        uint _341 = uint(int(uint(_157) >> uint(2)));
        float _343 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_341)]);
        uint _345 = uint(int(uint(_323) >> uint(2)));
        float _347 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_345)]);
        uint _349 = uint(int(uint(_317) >> uint(2)));
        float _351 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_349)]);
        uint _353 = uint(int(uint(_323) >> uint(2)));
        float _355 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_353)]);
        float _357 = _321 * _321;
        float _359 = fma(_327, _327, _357);
        float _361 = _331 * _331;
        float _363 = fma(_335, _335, _361);
        float _365 = _339 * _339;
        float _367 = fma(_343, _343, _359);
        float _369 = fma(_347, _347, _365);
        float _371 = sqrt(_367);
        float _373 = fma(_351, _351, _363);
        float _375 = fma(_355, _355, _369);
        float _377 = sqrt(_373);
        float _379 = sqrt(_375);
        bool _381 = _371 > 0.0;
        bool _383 = _377 > 0.0;
        bool _385 = _379 > 0.0;
        float _387 = _377;
        float _389 = _379;
        float _391 = _369;
        float _393 = _321;
        float _395 = _371;
        float _397 = _327;
        float _399 = _363;
        float _401 = _331;
        float _403 = _351;
        float _405 = _343;
        if (_381)
        {
            float _407 = rsqrt(_367);
            _387 = _407;
        }
        float _409 = _387;
        float _411 = 0.0;
        if (_383)
        {
            float _413 = rsqrt(_373);
            _411 = _413;
        }
        float _415 = _411;
        float _417 = 0.0;
        if (_385)
        {
            float _419 = rsqrt(_375);
            _417 = _419;
        }
        float _421 = _417;
        if (!_381)
        {
            _389 = 0.0;
        }
        float _423 = _389;
        float _425 = _423;
        if (_381)
        {
            float _427 = _321 * _409;
            _425 = _427;
        }
        float _429 = _425;
        _281 = _429;
        if (!_381)
        {
            _391 = 0.0;
        }
        float _431 = _391;
        float _433 = _431;
        if (_381)
        {
            float _435 = _327 * _409;
            _433 = _435;
        }
        float _437 = _433;
        _287 = _437;
        if (!_381)
        {
            _393 = 0.0;
        }
        float _439 = _393;
        float _441 = _439;
        if (_381)
        {
            float _443 = _343 * _409;
            _441 = _443;
        }
        float _445 = _441;
        _293 = _445;
        if (!_383)
        {
            _395 = 0.0;
        }
        float _447 = _395;
        float _449 = _447;
        if (_383)
        {
            float _451 = _331 * _415;
            _449 = _451;
        }
        float _453 = _449;
        _279 = _453;
        if (!_383)
        {
            _397 = 0.0;
        }
        float _455 = _397;
        float _457 = _455;
        if (_383)
        {
            float _459 = _351 * _415;
            _457 = _459;
        }
        float _461 = _457;
        _291 = _461;
        if (!_383)
        {
            _399 = 0.0;
        }
        float _463 = _399;
        float _465 = _463;
        if (_383)
        {
            float _467 = _335 * _415;
            _465 = _467;
        }
        float _469 = _465;
        _285 = _469;
        if (!_385)
        {
            _401 = 0.0;
        }
        float _471 = _401;
        float _473 = _471;
        if (!_385)
        {
            _403 = 0.0;
        }
        float _475 = _403;
        float _477 = _475;
        if (_385)
        {
            float _479 = _339 * _421;
            _473 = _479;
        }
        float _481 = _473;
        _283 = _481;
        if (!_385)
        {
            _405 = 0.0;
        }
        float _483 = _405;
        _295 = _483;
        if (_385)
        {
            float _485 = _347 * _421;
            _477 = _485;
        }
        float _487 = _477;
        _289 = _487;
        if (_385)
        {
            float _489 = _355 * _421;
            _295 = _489;
        }
    }
    float _491 = _279;
    float _493 = _281;
    float _495 = _283;
    float _497 = _285;
    float _499 = _287;
    float _501 = _289;
    float _503 = _291;
    float _505 = _293;
    float _507 = _295;
    float _509 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _511 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[36]);
    float _513 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _515 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _517 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _519 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _521 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    bool _523 = _511 > 0.0;
    float _525 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _527 = 0.0;
    if (_523)
    {
        float _529 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[52]);
        _527 = _529;
    }
    float _531 = _527;
    float _533 = abs(_509);
    float _535 = log2(_533);
    float _537 = _515 * _519;
    float _539 = _513 * _519;
    float _541 = _537 * _491;
    float _543 = _537 * _493;
    float _545 = _537 * _495;
    float _547 = _517 * _519;
    float _549 = fma(_539, _497, _541);
    float _551 = _521 * _535;
    float _553 = exp2(_551);
    float _555 = fma(_539, _499, _543);
    float _557 = fma(_539, _501, _545);
    float _559 = fma(_547, _503, _549);
    float _561 = fma(_547, _505, _555);
    float _563 = fma(_547, _507, _557);
    float _565 = _521 * _559;
    float _567 = _521 * _561;
    float _569 = _521 * _563;
    float _571 = _277 * _521;
    float _573 = fma(_189, _553, _565);
    float _575 = fma(_183, _553, _567);
    float _577 = fma(_195, _553, _569);
    float _579 = fma(_189, _571, _167);
    float _581 = fma(_183, _571, _161);
    float _583 = fma(_195, _571, _173);
    bool _585 = _531 == 0.0;
    bool _587 = _531 == 0.0;
    bool _589 = _587 && _523;
    float _591 = -_273;
    float _593 = _525 + _591;
    float _595 = _561;
    float _597 = _557;
    float _599 = _569;
    float _601 = _565;
    float _603 = _531;
    float _605 = _531;
    float _607 = _593;
    if (_589)
    {
        _595 = 0.0;
        _597 = 0.0;
    }
    float _609 = _595;
    float _611 = _597;
    float _613 = _611;
    float _615 = _609;
    if (_589)
    {
        _599 = 0.0;
    }
    float _617 = _599;
    bool _619 = _523 && _585;
    float _621 = _617;
    float _623 = _617;
    if (!_619)
    {
        float _625 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[32]);
        bool _627 = _531 > 0.0;
        bool _629 = _627 && _523;
        float _631 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[28]);
        float _633 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[29]);
        float _635 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[30]);
        float _637 = trunc(_625);
        int _639 = int(_637);
        bool _641 = _639 != 0;
        float _643 = 0.0;
        if (!_641)
        {
            _643 = 0.0;
        }
        float _645 = _643;
        float _647 = 0.0;
        float _649 = 0.0;
        float _651 = _645;
        float _653 = _645;
        if (!_641)
        {
            _647 = 0.0;
            _649 = 0.0;
        }
        float _655 = _647;
        float _657 = _649;
        bool _659 = !_641;
        float _661 = _655;
        float _663 = _657;
        float _665 = _655;
        float _667 = _657;
        float _669 = _631;
        float _671 = _633;
        float _673 = _635;
        if (!_659)
        {
            int _675 = as_type<int>(_155) & 2048;
            bool _677 = _675 != 0;
            if (!_677)
            {
                _651 = 0.0;
            }
            float _679 = _651;
            _653 = _679;
            if (!_677)
            {
                _661 = 0.0;
                _663 = 0.0;
            }
            float _681 = _661;
            float _683 = _663;
            bool _685 = !_677;
            _665 = _681;
            _667 = _683;
            if (!_685)
            {
                float _687 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                uint _689 = uint(int(uint(_157) >> uint(2)));
                float _691 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_689)]);
                int _693 = _157 + 4;
                uint _695 = uint(int(uint(_693) >> uint(2)));
                float _697 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_695)]);
                int _699 = _157 + 8;
                uint _701 = uint(int(uint(_699) >> uint(2)));
                float _703 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_701)]);
                int _705 = _157 + 12;
                uint _707 = uint(int(uint(_705) >> uint(2)));
                float _709 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_707)]);
                uint _711 = uint(int(uint(_157) >> uint(2)));
                float _713 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_711)]);
                int _715 = _157 + 4;
                uint _717 = uint(int(uint(_715) >> uint(2)));
                float _719 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_717)]);
                int _721 = _157 + 8;
                uint _723 = uint(int(uint(_721) >> uint(2)));
                float _725 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_723)]);
                int _727 = _157 + 12;
                uint _729 = uint(int(uint(_727) >> uint(2)));
                float _731 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_729)]);
                uint _733 = uint(int(uint(_157) >> uint(2)));
                float _735 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_733)]);
                int _737 = _157 + 4;
                uint _739 = uint(int(uint(_737) >> uint(2)));
                float _741 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_739)]);
                int _743 = _157 + 8;
                uint _745 = uint(int(uint(_743) >> uint(2)));
                float _747 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_745)]);
                int _749 = _157 + 12;
                uint _751 = uint(int(uint(_749) >> uint(2)));
                float _753 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_751)]);
                float _755 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                float _757 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _759 = _703 * _713;
                float _761 = _703 * _719;
                float _763 = -_759;
                float _765 = fma(_691, _725, _763);
                float _767 = _709 * _725;
                float _769 = _709 * _719;
                float _771 = _709 * _713;
                float _773 = _697 * _713;
                float _775 = -_761;
                float _777 = fma(_697, _725, _775);
                float _779 = _741 * _765;
                float _781 = -_773;
                float _783 = fma(_691, _719, _781);
                float _785 = -_779;
                float _787 = fma(_735, _777, _785);
                float _789 = fma(_747, _783, _787);
                float _791 = -_769;
                float _793 = fma(_697, _731, _791);
                float _795 = 1.0 / _789;
                float _797 = -_771;
                float _799 = fma(_691, _731, _797);
                float _801 = _735 * _719;
                float _803 = _735 * _703;
                float _805 = -_767;
                float _807 = fma(_703, _731, _805);
                float _809 = _747 * _799;
                float _811 = _741 * _725;
                float _813 = _747 * _713;
                float _815 = -_691;
                float _817 = fma(_815, _725, _759);
                float _819 = -_801;
                float _821 = fma(_741, _713, _819);
                float _823 = -_803;
                float _825 = fma(_747, _691, _823);
                float _827 = _741 * _691;
                float _829 = _741 * _799;
                float _831 = -_809;
                float _833 = fma(_735, _807, _831);
                float _835 = -_811;
                float _837 = fma(_747, _719, _835);
                float _839 = -_813;
                float _841 = fma(_735, _725, _839);
                float _843 = _747 * _697;
                float _845 = -_827;
                float _847 = fma(_735, _697, _845);
                float _849 = -_829;
                float _851 = fma(_735, _793, _849);
                float _853 = fma(_753, _765, _833);
                float _855 = _747 * _793;
                float _857 = _841 * _795;
                float _859 = _837 * _795;
                float _861 = _821 * _795;
                float _863 = -_843;
                float _865 = fma(_741, _703, _863);
                float _867 = -_855;
                float _869 = fma(_741, _807, _867);
                float _871 = _817 * _795;
                float _873 = _687 * _857;
                float _875 = _687 * _859;
                float _877 = _755 * _795;
                float _879 = _687 * _861;
                float _881 = fma(_755, _871, _873);
                float _883 = _865 * _795;
                float _885 = fma(_777, _877, _875);
                float _887 = fma(_783, _877, _879);
                float _889 = _825 * _795;
                float _891 = _847 * _795;
                float _893 = fma(_753, _777, _869);
                float _895 = fma(_753, _783, _851);
                float _897 = fma(_757, _883, _885);
                float _899 = fma(_757, _889, _881);
                float _901 = fma(_757, _891, _887);
                float _903 = -_893;
                float _905 = fma(_903, _795, _897);
                float _907 = fma(_853, _795, _899);
                float _909 = -_895;
                float _911 = fma(_909, _795, _901);
                _601 = _881;
                _621 = _873;
                _603 = _877;
                _653 = _905;
                _665 = _907;
                _667 = _911;
            }
        }
        float _913 = _601;
        float _915 = _621;
        float _917 = _603;
        float _919 = _653;
        float _921 = _665;
        float _923 = _667;
        bool _925 = !_629;
        float _927 = _913;
        float _929 = _915;
        float _931 = _917;
        float _933 = _921;
        if (!_925)
        {
            float _935 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[48]);
            float _937 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[49]);
            float _939 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[50]);
            bool _941 = !_177;
            _669 = _935;
            _671 = _937;
            _673 = _939;
            if (!_941)
            {
                float _943 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
                float _945 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
                float _947 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
                float _949 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _951 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
                float _953 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
                float _955 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
                float _957 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                float _959 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[28]);
                float _961 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[29]);
                float _963 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[30]);
                float _965 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[31]);
                float _967 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
                float _969 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
                float _971 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
                float _973 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                float _975 = _957 * _945;
                float _977 = _957 * _947;
                float _979 = _957 * _943;
                float _981 = _949 * _961;
                float _983 = -_975;
                float _985 = fma(_953, _949, _983);
                float _987 = _949 * _963;
                float _989 = _949 * _959;
                float _991 = _957 * _963;
                float _993 = _957 * _961;
                float _995 = _957 * _959;
                float _997 = -_981;
                float _999 = fma(_945, _965, _997);
                float _1001 = -_977;
                float _1003 = fma(_955, _949, _1001);
                float _1005 = -_979;
                float _1007 = fma(_951, _949, _1005);
                float _1009 = _947 * _961;
                float _1011 = _947 * _959;
                float _1013 = _955 * _961;
                float _1015 = _955 * _959;
                float _1017 = -_987;
                float _1019 = fma(_947, _965, _1017);
                float _1021 = -_989;
                float _1023 = fma(_943, _965, _1021);
                float _1025 = -_991;
                float _1027 = fma(_955, _965, _1025);
                float _1029 = -_993;
                float _1031 = fma(_953, _965, _1029);
                float _1033 = -_995;
                float _1035 = fma(_951, _965, _1033);
                float _1037 = _945 * _959;
                float _1039 = -_1009;
                float _1041 = fma(_945, _963, _1039);
                float _1043 = -_1011;
                float _1045 = fma(_943, _963, _1043);
                float _1047 = -_1013;
                float _1049 = fma(_953, _963, _1047);
                float _1051 = -_1015;
                float _1053 = fma(_951, _963, _1051);
                float _1055 = _955 * _945;
                float _1057 = _955 * _943;
                float _1059 = -_1037;
                float _1061 = fma(_943, _961, _1059);
                float _1063 = _953 * _943;
                float _1065 = -_1055;
                float _1067 = fma(_953, _947, _1065);
                float _1069 = -_1057;
                float _1071 = fma(_951, _947, _1069);
                float _1073 = _955 * _1023;
                float _1075 = -_1063;
                float _1077 = fma(_951, _945, _1075);
                float _1079 = _955 * _999;
                float _1081 = -_1073;
                float _1083 = fma(_951, _1019, _1081);
                float _1085 = _953 * _959;
                float _1087 = _953 * _1023;
                float _1089 = -_1079;
                float _1091 = fma(_953, _1019, _1089);
                float _1093 = fma(_957, _1045, _1083);
                float _1095 = -_1085;
                float _1097 = fma(_951, _961, _1095);
                float _1099 = _953 * _1045;
                float _1101 = -_1087;
                float _1103 = fma(_951, _999, _1101);
                float _1105 = fma(_957, _1041, _1091);
                float _1107 = _969 * _1093;
                float _1109 = -_1099;
                float _1111 = fma(_951, _1041, _1109);
                float _1113 = _971 * _999;
                float _1115 = fma(_957, _1061, _1103);
                float _1117 = -_1107;
                float _1119 = fma(_967, _1105, _1117);
                float _1121 = fma(_955, _1061, _1111);
                float _1123 = -_1113;
                float _1125 = fma(_969, _1019, _1123);
                float _1127 = fma(_971, _1115, _1119);
                float _1129 = -_973;
                float _1131 = fma(_1129, _1121, _1127);
                float _1133 = _971 * _1023;
                float _1135 = 1.0 / _1131;
                float _1137 = -_1133;
                float _1139 = fma(_967, _1019, _1137);
                float _1141 = _969 * _1023;
                float _1143 = _971 * _1035;
                float _1145 = _971 * _985;
                float _1147 = -_1141;
                float _1149 = fma(_967, _999, _1147);
                float _1151 = -_1143;
                float _1153 = fma(_967, _1027, _1151);
                float _1155 = _971 * _1007;
                float _1157 = _971 * _1031;
                float _1159 = fma(_973, _1041, _1125);
                float _1161 = _969 * _1035;
                float _1163 = -_1145;
                float _1165 = fma(_969, _1003, _1163);
                float _1167 = fma(_973, _1061, _1149);
                float _1169 = _969 * _1007;
                float _1171 = -_1155;
                float _1173 = fma(_967, _1003, _1171);
                float _1175 = fma(_973, _1045, _1139);
                float _1177 = _1093 * _1135;
                float _1179 = -_1157;
                float _1181 = fma(_969, _1027, _1179);
                float _1183 = _1159 * _1135;
                float _1185 = -_1161;
                float _1187 = fma(_967, _1031, _1185);
                float _1189 = _1167 * _1135;
                float _1191 = -_1169;
                float _1193 = fma(_967, _985, _1191);
                float _1195 = _1175 * _1135;
                float _1197 = _935 * _1177;
                float _1199 = fma(_973, _1049, _1181);
                float _1201 = _1105 * _1135;
                float _1203 = _937 * _1183;
                float _1205 = fma(_973, _1053, _1153);
                float _1207 = fma(_973, _1097, _1187);
                float _1209 = _1115 * _1135;
                float _1211 = _937 * _1189;
                float _1213 = -_1197;
                float _1215 = fma(_937, _1195, _1213);
                float _1217 = -_1203;
                float _1219 = fma(_935, _1201, _1217);
                float _1221 = _1199 * _1135;
                float _1223 = -_1211;
                float _1225 = fma(_935, _1209, _1223);
                float _1227 = _1205 * _1135;
                float _1229 = _1207 * _1135;
                float _1231 = fma(_973, _1067, _1165);
                float _1233 = fma(_939, _1221, _1219);
                float _1235 = fma(_973, _1071, _1173);
                float _1237 = fma(_973, _1077, _1193);
                float _1239 = -_1227;
                float _1241 = fma(_939, _1239, _1215);
                float _1243 = fma(_939, _1229, _1225);
                float _1245 = -_1231;
                float _1247 = fma(_1245, _1135, _1233);
                float _1249 = fma(_1235, _1135, _1241);
                float _1251 = -_1237;
                float _1253 = fma(_1251, _1135, _1243);
                _927 = _1183;
                _669 = _1247;
                _671 = _1249;
                _673 = _1253;
                _929 = _1197;
                _931 = _1219;
                _1255 = true;
            }
            else
            {
                int _1257 = as_type<int>(_155) & 1024;
                bool _1259 = _1257 != 0;
                bool _1261 = !_1259;
                if (!_1261)
                {
                    float _1263 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                    uint _1265 = uint(int(uint(_157) >> uint(2)));
                    float _1267 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1265)]);
                    int _1269 = _157 + 4;
                    uint _1271 = uint(int(uint(_1269) >> uint(2)));
                    float _1273 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1271)]);
                    int _1275 = _157 + 8;
                    uint _1277 = uint(int(uint(_1275) >> uint(2)));
                    float _1279 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1277)]);
                    uint _1281 = uint(int(uint(_157) >> uint(2)));
                    float _1283 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1281)]);
                    int _1285 = _157 + 4;
                    uint _1287 = uint(int(uint(_1285) >> uint(2)));
                    float _1289 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1287)]);
                    int _1291 = _157 + 8;
                    uint _1293 = uint(int(uint(_1291) >> uint(2)));
                    float _1295 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1293)]);
                    uint _1297 = uint(int(uint(_157) >> uint(2)));
                    float _1299 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1297)]);
                    int _1301 = _157 + 4;
                    uint _1303 = uint(int(uint(_1301) >> uint(2)));
                    float _1305 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1303)]);
                    int _1307 = _157 + 8;
                    uint _1309 = uint(int(uint(_1307) >> uint(2)));
                    float _1311 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1309)]);
                    float _1313 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                    float _1315 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                    float _1317 = _1279 * _1283;
                    float _1319 = _1279 * _1289;
                    float _1321 = -_1317;
                    float _1323 = fma(_1267, _1295, _1321);
                    float _1325 = _1273 * _1283;
                    float _1327 = -_1319;
                    float _1329 = fma(_1273, _1295, _1327);
                    float _1331 = _1305 * _1323;
                    float _1333 = -_1325;
                    float _1335 = fma(_1267, _1289, _1333);
                    float _1337 = -_1331;
                    float _1339 = fma(_1299, _1329, _1337);
                    float _1341 = _1263 * _1295;
                    float _1343 = _1263 * _1289;
                    float _1345 = _1263 * _1283;
                    float _1347 = fma(_1311, _1335, _1339);
                    float _1349 = 1.0 / _1347;
                    float _1351 = _1311 * _1283;
                    float _1353 = _1305 * _1295;
                    float _1355 = -_1343;
                    float _1357 = fma(_1313, _1273, _1355);
                    float _1359 = -_1267;
                    float _1361 = fma(_1359, _1295, _1317);
                    float _1363 = _1299 * _1289;
                    float _1365 = -_1341;
                    float _1367 = fma(_1313, _1279, _1365);
                    float _1369 = -_1345;
                    float _1371 = fma(_1313, _1267, _1369);
                    float _1373 = _1299 * _1279;
                    float _1375 = -_1351;
                    float _1377 = fma(_1299, _1295, _1375);
                    float _1379 = -_1353;
                    float _1381 = fma(_1311, _1289, _1379);
                    float _1383 = _1305 * _1267;
                    float _1385 = -_1363;
                    float _1387 = fma(_1305, _1283, _1385);
                    float _1389 = -_1373;
                    float _1391 = fma(_1311, _1267, _1389);
                    float _1393 = _1311 * _1273;
                    float _1395 = _1311 * _1357;
                    float _1397 = _1381 * _1349;
                    float _1399 = _1377 * _1349;
                    float _1401 = -_1383;
                    float _1403 = fma(_1299, _1273, _1401);
                    float _1405 = _1387 * _1349;
                    float _1407 = _1311 * _1371;
                    float _1409 = -_1393;
                    float _1411 = fma(_1305, _1279, _1409);
                    float _1413 = _1305 * _1371;
                    float _1415 = -_1395;
                    float _1417 = fma(_1305, _1367, _1415);
                    float _1419 = _1397 * _937;
                    float _1421 = _1399 * _937;
                    float _1423 = _1405 * _937;
                    float _1425 = _1361 * _1349;
                    float _1427 = _1329 * _1349;
                    float _1429 = _1335 * _1349;
                    float _1431 = -_1407;
                    float _1433 = fma(_1299, _1367, _1431);
                    float _1435 = fma(_1425, _935, _1421);
                    float _1437 = fma(_935, _1427, _1419);
                    float _1439 = fma(_935, _1429, _1423);
                    float _1441 = _1391 * _1349;
                    float _1443 = _1411 * _1349;
                    float _1445 = _1403 * _1349;
                    float _1447 = -_1413;
                    float _1449 = fma(_1299, _1357, _1447);
                    float _1451 = fma(_1441, _939, _1435);
                    float _1453 = fma(_1443, _939, _1437);
                    float _1455 = fma(_1315, _1323, _1433);
                    float _1457 = fma(_1445, _939, _1439);
                    float _1459 = fma(_1315, _1329, _1417);
                    float _1461 = fma(_1315, _1335, _1449);
                    float _1463 = fma(_1455, _1349, _1451);
                    float _1465 = -_1459;
                    float _1467 = fma(_1465, _1349, _1453);
                    float _1469 = -_1461;
                    float _1471 = fma(_1469, _1349, _1457);
                    _927 = _1427;
                    _669 = _1467;
                    _671 = _1463;
                    _673 = _1471;
                    _929 = _1459;
                    _931 = _1455;
                    _1255 = true;
                }
                else
                {
                    int _1473 = as_type<int>(_155) & 2048;
                    bool _1475 = _1473 != 0;
                    bool _1477 = !_1475;
                    if (!_1477)
                    {
                        uint _1479 = uint(int(uint(_157) >> uint(2)));
                        float _1481 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1479)]);
                        int _1483 = _157 + 4;
                        uint _1485 = uint(int(uint(_1483) >> uint(2)));
                        float _1487 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1485)]);
                        int _1489 = _157 + 8;
                        uint _1491 = uint(int(uint(_1489) >> uint(2)));
                        float _1493 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1491)]);
                        int _1495 = _157 + 12;
                        uint _1497 = uint(int(uint(_1495) >> uint(2)));
                        float _1499 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1497)]);
                        uint _1501 = uint(int(uint(_157) >> uint(2)));
                        float _1503 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1501)]);
                        int _1505 = _157 + 4;
                        uint _1507 = uint(int(uint(_1505) >> uint(2)));
                        float _1509 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1507)]);
                        int _1511 = _157 + 8;
                        uint _1513 = uint(int(uint(_1511) >> uint(2)));
                        float _1515 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1513)]);
                        int _1517 = _157 + 12;
                        uint _1519 = uint(int(uint(_1517) >> uint(2)));
                        float _1521 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1519)]);
                        uint _1523 = uint(int(uint(_157) >> uint(2)));
                        float _1525 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1523)]);
                        int _1527 = _157 + 4;
                        uint _1529 = uint(int(uint(_1527) >> uint(2)));
                        float _1531 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1529)]);
                        int _1533 = _157 + 8;
                        uint _1535 = uint(int(uint(_1533) >> uint(2)));
                        float _1537 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1535)]);
                        int _1539 = _157 + 12;
                        uint _1541 = uint(int(uint(_1539) >> uint(2)));
                        float _1543 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1541)]);
                        float _1545 = _1493 * _1503;
                        float _1547 = _1493 * _1509;
                        float _1549 = _1487 * _1503;
                        float _1551 = _1499 * _1515;
                        float _1553 = -_1545;
                        float _1555 = fma(_1481, _1515, _1553);
                        float _1557 = -_1547;
                        float _1559 = fma(_1487, _1515, _1557);
                        float _1561 = -_1549;
                        float _1563 = fma(_1481, _1509, _1561);
                        float _1565 = _1499 * _1509;
                        float _1567 = _1531 * _1555;
                        float _1569 = _1499 * _1503;
                        float _1571 = -_1551;
                        float _1573 = fma(_1493, _1521, _1571);
                        float _1575 = -_1565;
                        float _1577 = fma(_1487, _1521, _1575);
                        float _1579 = -_1567;
                        float _1581 = fma(_1525, _1559, _1579);
                        float _1583 = -_1569;
                        float _1585 = fma(_1481, _1521, _1583);
                        float _1587 = _1531 * _1515;
                        float _1589 = _1525 * _1509;
                        float _1591 = fma(_1537, _1563, _1581);
                        float _1593 = _1537 * _1503;
                        float _1595 = -_1481;
                        float _1597 = fma(_1595, _1515, _1545);
                        float _1599 = -_1587;
                        float _1601 = fma(_1537, _1509, _1599);
                        float _1603 = -_1589;
                        float _1605 = fma(_1531, _1503, _1603);
                        float _1607 = -_1593;
                        float _1609 = fma(_1525, _1515, _1607);
                        float _1611 = 1.0 / _1591;
                        float _1613 = _1525 * _1493;
                        float _1615 = _1531 * _1481;
                        float _1617 = _1537 * _1487;
                        float _1619 = _1537 * _1577;
                        float _1621 = -_1613;
                        float _1623 = fma(_1537, _1481, _1621);
                        float _1625 = _1537 * _1585;
                        float _1627 = _1531 * _1585;
                        float _1629 = -_1615;
                        float _1631 = fma(_1525, _1487, _1629);
                        float _1633 = -_1617;
                        float _1635 = fma(_1531, _1493, _1633);
                        float _1637 = -_1625;
                        float _1639 = fma(_1525, _1573, _1637);
                        float _1641 = -_1627;
                        float _1643 = fma(_1525, _1577, _1641);
                        float _1645 = -_1619;
                        float _1647 = fma(_1531, _1573, _1645);
                        float _1649 = fma(_1543, _1555, _1639);
                        float _1651 = fma(_1543, _1563, _1643);
                        float _1653 = _1601 * _1611;
                        float _1655 = _1609 * _1611;
                        float _1657 = _1605 * _1611;
                        float _1659 = _1597 * _1611;
                        float _1661 = _1653 * _937;
                        float _1663 = _1655 * _937;
                        float _1665 = _1657 * _937;
                        float _1667 = _1559 * _1611;
                        float _1669 = _1563 * _1611;
                        float _1671 = fma(_1659, _935, _1663);
                        float _1673 = _1623 * _1611;
                        float _1675 = fma(_935, _1667, _1661);
                        float _1677 = fma(_935, _1669, _1665);
                        float _1679 = _1635 * _1611;
                        float _1681 = _1631 * _1611;
                        float _1683 = fma(_1673, _939, _1671);
                        float _1685 = fma(_1543, _1559, _1647);
                        float _1687 = fma(_1679, _939, _1675);
                        float _1689 = fma(_1681, _939, _1677);
                        float _1691 = fma(_1649, _1611, _1683);
                        float _1693 = -_1685;
                        float _1695 = fma(_1693, _1611, _1687);
                        float _1697 = -_1651;
                        float _1699 = fma(_1697, _1611, _1689);
                        _927 = _1675;
                        _669 = _1695;
                        _671 = _1691;
                        _673 = _1699;
                        _929 = _1671;
                        _931 = _1531;
                    }
                }
            }
        }
        _1255 = false;
        float _1701 = _927;
        float _1703 = _669;
        float _1705 = _671;
        float _1707 = _673;
        float _1709 = _929;
        float _1711 = _931;
        float _1713 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[33]);
        float _1715 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[34]);
        float _1717 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[35]);
        bool _1719 = _1713 != 0.0;
        bool _1721 = isnan(_1713);
        bool _1723 = _1719 || _1721;
        bool _1725 = isnan(0.0);
        bool _1727 = _1723 || _1725;
        bool _1729 = _1715 != 0.0;
        bool _1731 = isnan(_1715);
        bool _1733 = _1729 || _1731;
        bool _1735 = isnan(0.0);
        bool _1737 = _1733 || _1735;
        bool _1739 = _1717 != 0.0;
        bool _1741 = isnan(_1717);
        bool _1743 = _1739 || _1741;
        bool _1745 = isnan(0.0);
        bool _1747 = _1743 || _1745;
        float _1749 = _1715;
        float _1751 = _1703;
        float _1753 = _1707;
        float _1755 = _1717;
        float _1757 = _1705;
        float _1759 = _1709;
        _605 = _1711;
        if (_1727)
        {
            float _1761 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[31]);
            _1749 = _1761;
        }
        float _1763 = _1749;
        float _1765 = _1713;
        if (_1737)
        {
            float _1767 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[31]);
            _1765 = _1767;
        }
        float _1769 = _1765;
        float _1771 = _1701;
        if (_1747)
        {
            float _1773 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[31]);
            _1771 = _1773;
        }
        float _1775 = _1771;
        if (_1727)
        {
            float _1777 = _919 + _1703;
            _1751 = _1777;
        }
        float _1779 = _1751;
        float _1781 = _1779;
        if (_1737)
        {
            float _1783 = _921 + _1705;
            _933 = _1783;
        }
        float _1785 = _933;
        float _1787 = _1785;
        if (_1747)
        {
            float _1789 = _923 + _1707;
            _1753 = _1789;
        }
        float _1791 = _1753;
        float _1793 = _1791;
        if (!_1727)
        {
            _1755 = 0.0;
        }
        float _1795 = _1755;
        float _1797 = _1795;
        if (_1727)
        {
            float _1799 = -_581;
            float _1801 = _1779 + _1799;
            _1757 = _1801;
        }
        float _1803 = _1757;
        float _1805 = _1803;
        if (_1737)
        {
            float _1807 = -_579;
            float _1809 = _1785 + _1807;
            _1787 = _1809;
        }
        float _1811 = _1787;
        float _1813 = _1811;
        if (_1747)
        {
            float _1815 = -_583;
            float _1817 = _1791 + _1815;
            _1793 = _1817;
        }
        float _1819 = _1793;
        float _1821 = _1819;
        if (!_1737)
        {
            _1759 = 0.0;
        }
        float _1823 = _1759;
        float _1825 = _1823;
        if (_1727)
        {
            float _1827 = -_575;
            float _1829 = _1827 + _1803;
            _1805 = _1829;
        }
        float _1831 = _1805;
        float _1833 = _1831;
        if (_1737)
        {
            float _1835 = -_573;
            float _1837 = _1835 + _1811;
            _1813 = _1837;
        }
        float _1839 = _1813;
        float _1841 = _1763;
        if (_1727)
        {
            float _1843 = _1831 * _1763;
            _1833 = _1843;
        }
        float _1845 = _1833;
        float _1847 = _1845;
        if (!_1747)
        {
            _1841 = 0.0;
        }
        float _1849 = _1841;
        _615 = _1849;
        if (_1727)
        {
            float _1851 = _277 * _1845;
            _1781 = _1851;
        }
        float _1853 = _1781;
        if (_1747)
        {
            float _1855 = -_577;
            float _1857 = _1855 + _1819;
            _1847 = _1857;
        }
        float _1859 = _1847;
        float _1861 = _1769;
        float _1863 = _1859;
        if (_1737)
        {
            float _1865 = _1839 * _1769;
            _1861 = _1865;
        }
        float _1867 = _1861;
        if (_1727)
        {
            float _1869 = _521 * _1853;
            _1797 = _1869;
        }
        float _1871 = _1797;
        _613 = _1871;
        if (_1747)
        {
            float _1873 = _1859 * _1775;
            _1863 = _1873;
        }
        float _1875 = _1863;
        if (_1737)
        {
            float _1877 = _277 * _1867;
            _1821 = _1877;
        }
        float _1879 = _1821;
        if (_1747)
        {
            float _1881 = _277 * _1875;
            _297 = _1881;
        }
        float _1883 = _297;
        if (_1737)
        {
            float _1885 = _521 * _1879;
            _1825 = _1885;
        }
        float _1887 = _1825;
        _623 = _1887;
        if (_1747)
        {
            float _1889 = _521 * _1883;
            _615 = _1889;
        }
    }
    float _1891 = _623;
    float _1893 = _605;
    float _1895 = _613;
    float _1897 = _615;
    float _1899 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _1901 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _1903 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _1905 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _1907 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _1909 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    uint _1911 = uint(int(uint(_179) >> uint(2)));
    float _1913 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1911)]);
    float _1915 = _573 + _1891;
    bool _1917 = _1899 > 0.0;
    bool _1919 = _1901 > 0.0;
    float _1921 = _1903 * _1901;
    float _1923 = _521 * _1905;
    float _1925 = _1893;
    float _1927 = _1903;
    bool _1929 = _1919;
    float _1931 = _1905;
    if (_1917)
    {
        float _1933 = 1.0 / _1899;
        _1925 = _1933;
    }
    float _1935 = _1925;
    float _1937 = _521 * _1907;
    if (_1919)
    {
        float _1939 = -_1921;
        float _1941 = fma(_269, _1939, _1903);
        _1927 = _1941;
    }
    float _1943 = _1927;
    float _1945 = _575 + _1895;
    float _1947 = _1935;
    float _1949 = _1943;
    if (_1917)
    {
        float _1951 = _593 * _1935;
        _607 = _1951;
    }
    float _1953 = _607;
    if (_1917)
    {
        float _1955 = precise::min(_1953, 1.0);
        _1947 = _1955;
    }
    float _1957 = _1947;
    if (_1917)
    {
        float _1959 = _1957 * _1943;
        _1949 = _1959;
    }
    float _1961 = _1949;
    float _1963 = _521 * _1909;
    float _1965 = _577 + _1897;
    float _1967 = _1923 * _1961;
    float _1969 = _1937 * _1961;
    float _1971 = _1963 * _1961;
    bool _1973 = !_177;
    float _1975 = _1967;
    float _1977 = _1971;
    float _2099;
    if (!_1973)
    {
        float _1979 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1981 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1983 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1985 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1987 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1989 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1991 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1993 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1995 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1997 = _1983 * _1985;
        float _1999 = _1983 * _1987;
        float _2001 = _1981 * _1985;
        float _2003 = -_1997;
        float _2005 = fma(_1979, _1989, _2003);
        float _2007 = -_1999;
        float _2009 = fma(_1981, _1989, _2007);
        float _2011 = -_2001;
        float _2013 = fma(_1979, _1987, _2011);
        float _2015 = _1993 * _1979;
        float _2017 = _1993 * _2005;
        float _2019 = _1995 * _1981;
        float _2021 = _1991 * _1987;
        float _2023 = -_2015;
        float _2025 = fma(_1991, _1981, _2023);
        float _2027 = -_2017;
        float _2029 = fma(_1991, _2009, _2027);
        float _2031 = _1993 * _1989;
        float _2033 = _1995 * _1985;
        float _2035 = _1991 * _1983;
        float _2037 = fma(_1995, _2013, _2029);
        float _2039 = -_2031;
        float _2041 = fma(_1995, _1987, _2039);
        float _2043 = -_2033;
        float _2045 = fma(_1991, _1989, _2043);
        float _2047 = -_2021;
        float _2049 = fma(_1993, _1985, _2047);
        float _2051 = 1.0 / _2037;
        float _2053 = -_2035;
        float _2055 = fma(_1995, _1979, _2053);
        float _2057 = -_1979;
        float _2059 = fma(_2057, _1989, _1997);
        float _2061 = -_2019;
        float _2063 = fma(_1993, _1983, _2061);
        float _2065 = _2041 * _2051;
        float _2067 = _2045 * _2051;
        float _2069 = _2049 * _2051;
        float _2071 = _1967 * _2051;
        float _2073 = _1969 * _2065;
        float _2075 = _1969 * _2067;
        float _2077 = _2059 * _2051;
        float _2079 = _1969 * _2069;
        float _2081 = fma(_2009, _2071, _2073);
        float _2083 = _2063 * _2051;
        float _2085 = _2055 * _2051;
        float _2087 = fma(_1967, _2077, _2075);
        float _2089 = _2025 * _2051;
        float _2091 = fma(_2013, _2071, _2079);
        float _2093 = fma(_1971, _2083, _2081);
        float _2095 = fma(_1971, _2085, _2087);
        float _2097 = fma(_1971, _2089, _2091);
        _1975 = _2093;
        _2099 = _2095;
        _1977 = _2097;
        _2101 = true;
    }
    else
    {
        int _2103 = as_type<int>(_155) & 1024;
        bool _2105 = _2103 != 0;
        if (_2105)
        {
            _1929 = true;
        }
        bool _2107 = _1929;
        bool _2109 = _2107;
        if (!_2105)
        {
            int _2111 = as_type<int>(_155) & 2048;
            bool _2113 = _2111 != 0;
            _2109 = _2113;
        }
        bool _2115 = _2109;
        if (!_2115)
        {
            _1931 = _1969;
        }
        float _2117 = _1931;
        bool _2119 = !_2115;
        _2099 = _2117;
        if (!_2119)
        {
            uint _2121 = uint(int(uint(_157) >> uint(2)));
            float _2123 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2121)]);
            int _2125 = _157 + 4;
            uint _2127 = uint(int(uint(_2125) >> uint(2)));
            float _2129 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2127)]);
            int _2131 = _157 + 8;
            uint _2133 = uint(int(uint(_2131) >> uint(2)));
            float _2135 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2133)]);
            uint _2137 = uint(int(uint(_157) >> uint(2)));
            float _2139 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2137)]);
            int _2141 = _157 + 4;
            uint _2143 = uint(int(uint(_2141) >> uint(2)));
            float _2145 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2143)]);
            int _2147 = _157 + 8;
            uint _2149 = uint(int(uint(_2147) >> uint(2)));
            float _2151 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2149)]);
            uint _2153 = uint(int(uint(_157) >> uint(2)));
            float _2155 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2153)]);
            int _2157 = _157 + 4;
            uint _2159 = uint(int(uint(_2157) >> uint(2)));
            float _2161 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2159)]);
            int _2163 = _157 + 8;
            uint _2165 = uint(int(uint(_2163) >> uint(2)));
            float _2167 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2165)]);
            float _2169 = _2135 * _2139;
            float _2171 = _2135 * _2145;
            float _2173 = _2129 * _2139;
            float _2175 = -_2169;
            float _2177 = fma(_2123, _2151, _2175);
            float _2179 = -_2171;
            float _2181 = fma(_2129, _2151, _2179);
            float _2183 = -_2173;
            float _2185 = fma(_2123, _2145, _2183);
            float _2187 = _2161 * _2123;
            float _2189 = _2161 * _2177;
            float _2191 = _2167 * _2129;
            float _2193 = _2167 * _2139;
            float _2195 = -_2187;
            float _2197 = fma(_2155, _2129, _2195);
            float _2199 = -_2189;
            float _2201 = fma(_2155, _2181, _2199);
            float _2203 = _2161 * _2151;
            float _2205 = _2155 * _2145;
            float _2207 = -_2191;
            float _2209 = fma(_2161, _2135, _2207);
            float _2211 = fma(_2167, _2185, _2201);
            float _2213 = -_2203;
            float _2215 = fma(_2167, _2145, _2213);
            float _2217 = -_2193;
            float _2219 = fma(_2155, _2151, _2217);
            float _2221 = -_2205;
            float _2223 = fma(_2161, _2139, _2221);
            float _2225 = 1.0 / _2211;
            float _2227 = _2155 * _2135;
            float _2229 = -_2123;
            float _2231 = fma(_2229, _2151, _2169);
            float _2233 = -_2227;
            float _2235 = fma(_2167, _2123, _2233);
            float _2237 = _2215 * _2225;
            float _2239 = _2219 * _2225;
            float _2241 = _2223 * _2225;
            float _2243 = _1967 * _2225;
            float _2245 = _2237 * _1969;
            float _2247 = _2239 * _1969;
            float _2249 = _2231 * _2225;
            float _2251 = _2241 * _1969;
            float _2253 = _2209 * _2225;
            float _2255 = fma(_2181, _2243, _2245);
            float _2257 = _2235 * _2225;
            float _2259 = fma(_2249, _1967, _2247);
            float _2261 = _2197 * _2225;
            float _2263 = fma(_2185, _2243, _2251);
            float _2265 = fma(_2253, _1971, _2255);
            float _2267 = fma(_2257, _1971, _2259);
            float _2269 = fma(_2261, _1971, _2263);
            _1975 = _2265;
            _2099 = _2267;
            _1977 = _2269;
        }
    }
    _2101 = false;
    float _2271 = _1975;
    float _2273 = _2099;
    float _2275 = _1977;
    float _2277 = _2271 + _581;
    float _2279 = _2273 + _579;
    int _2281 = _157 + 4;
    float _2283 = _2275 + _583;
    int _2285 = _157 + 8;
    uint _2287 = uint(int(uint(_179) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2287)] = as_type<uint>(_1913);
    float _2289 = -_161;
    float _2291 = _2289 + _2277;
    float _2293 = -_167;
    float _2295 = _2293 + _2279;
    uint _2297 = uint(int(uint(_157) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2297)] = as_type<uint>(_2277);
    float _2299 = -_173;
    float _2301 = _2299 + _2283;
    uint _2303 = uint(int(uint(_2281) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2303)] = as_type<uint>(_2279);
    uint _2305 = uint(int(uint(_2285) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2305)] = as_type<uint>(_2283);
    uint _2307 = uint(int(uint(_157) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2307)] = as_type<uint>(_1945);
    uint _2309 = uint(int(uint(_2281) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2309)] = as_type<uint>(_1915);
    uint _2311 = uint(int(uint(_2285) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2311)] = as_type<uint>(_1965);
    uint _2313 = uint(int(uint(_157) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2313)] = as_type<uint>(_2291);
    uint _2315 = uint(int(uint(_2281) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2315)] = as_type<uint>(_2295);
    uint _2317 = uint(int(uint(_2285) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2317)] = as_type<uint>(_2301);
    float _2319 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _2321 = _2295 * _2295;
    float _2323 = _1915 * _1915;
    float _2325 = fma(_2291, _2291, _2321);
    float _2327 = fma(_1945, _1945, _2323);
    float _2329 = fma(_2301, _2301, _2325);
    float _2331 = fma(_1965, _1965, _2327);
    float _2333 = sqrt(_2331);
    float _2335 = sqrt(_2329);
    bool _2337 = _2335 >= 9.9999999747524270787835121154785e-07;
    bool _2339 = isnan(_2335);
    bool _2341 = _2337 || _2339;
    bool _2343 = isnan(9.9999999747524270787835121154785e-07);
    bool _2345 = _2341 || _2343;
    if (!_2345)
    {
        bool _2347 = _525 != _273;
        bool _2349 = isnan(_525);
        bool _2351 = _2347 || _2349;
        bool _2353 = isnan(_273);
        bool _2355 = _2351 || _2353;
        _2357 = _2355;
        if (!_2357)
        {
            float _2359 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _2361 = _2359 > 0.0;
            bool _2363 = !_2361;
            if (!_2363)
            {
                float _2365 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _2367 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _2369 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _2371 = _2367 * _491;
                float _2373 = _2367 * _493;
                float _2375 = _2367 * _495;
                float _2377 = fma(_2365, _497, _2371);
                float _2379 = fma(_2365, _499, _2373);
                float _2381 = fma(_2365, _501, _2375);
                float _2383 = fma(_2369, _503, _2377);
                float _2385 = fma(_2369, _505, _2379);
                float _2387 = fma(_2369, _507, _2381);
                float _2389 = _2383 * _2383;
                float _2391 = fma(_2385, _2385, _2389);
                float _2393 = fma(_2387, _2387, _2391);
                float _2395 = rsqrt(_2393);
                float _2397 = _2395 * 9.9999999747524270787835121154785e-07;
                float _2399 = _2385 * _2397;
                float _2401 = _2383 * _2397;
                float _2403 = _2387 * _2397;
                _311 = as_type<int>(_2399);
                _313 = as_type<int>(_2401);
                _315 = as_type<int>(_2403);
                _2357 = true;
            }
            else
            {
                bool _2405 = _2333 >= 9.9999999747524270787835121154785e-07;
                bool _2407 = isnan(_2333);
                bool _2409 = _2405 || _2407;
                bool _2411 = isnan(9.9999999747524270787835121154785e-07);
                bool _2413 = _2409 || _2411;
                if (!_2413)
                {
                    float _2415 = _2279 * _2279;
                    float _2417 = fma(_2277, _2277, _2415);
                    float _2419 = fma(_2283, _2283, _2417);
                    float _2421 = sqrt(_2419);
                    bool _2423 = _2421 >= 9.9999999747524270787835121154785e-07;
                    bool _2425 = isnan(_2421);
                    bool _2427 = _2423 || _2425;
                    bool _2429 = isnan(9.9999999747524270787835121154785e-07);
                    bool _2431 = _2427 || _2429;
                    float _2433 = _2421;
                    if (_2431)
                    {
                        float _2435 = rsqrt(_2419);
                        _2433 = _2435;
                    }
                    float _2437 = _2433;
                    if (!_2431)
                    {
                        _299 = 0;
                    }
                    int _2439 = _299;
                    int _2441 = _2439;
                    if (!_2431)
                    {
                        _301 = 897988541;
                    }
                    int _2443 = _301;
                    int _2445 = _2443;
                    if (!_2431)
                    {
                        _303 = 0;
                    }
                    int _2447 = _303;
                    float _2449 = _2437;
                    int _2451 = _2447;
                    if (_2431)
                    {
                        float _2453 = _2437 * 9.9999999747524270787835121154785e-07;
                        _2449 = _2453;
                    }
                    float _2455 = _2449;
                    if (_2431)
                    {
                        float _2457 = _2277 * _2455;
                        _2441 = as_type<int>(_2457);
                    }
                    int _2459 = _2441;
                    _311 = _2459;
                    if (_2431)
                    {
                        float _2461 = _2279 * _2455;
                        _2445 = as_type<int>(_2461);
                    }
                    int _2463 = _2445;
                    _313 = _2463;
                    if (_2431)
                    {
                        float _2465 = _2283 * _2455;
                        _2451 = as_type<int>(_2465);
                    }
                    int _2467 = _2451;
                    _315 = _2467;
                    _2357 = true;
                }
                else
                {
                    float _2469 = rsqrt(_2331);
                    float _2471 = _2469 * 9.9999999747524270787835121154785e-07;
                    float _2473 = _1945 * _2471;
                    float _2475 = _1915 * _2471;
                    float _2477 = _1965 * _2471;
                    _311 = as_type<int>(_2473);
                    _313 = as_type<int>(_2475);
                    _315 = as_type<int>(_2477);
                    _2357 = true;
                }
            }
        }
    }
    else
    {
        float _2479 = _2333 * _2319;
        bool _2481 = _2479 >= 0.001000000047497451305389404296875;
        bool _2483 = isnan(_2479);
        bool _2485 = _2481 || _2483;
        bool _2487 = isnan(0.001000000047497451305389404296875);
        bool _2489 = _2485 || _2487;
        bool _2491 = _2479 > 0.0;
        bool _2493 = !_2489;
        bool _2495 = _2491 && _2493;
        bool _2497 = _2335 < 0.001000000047497451305389404296875;
        bool _2499 = _2497 && _2495;
        if (!_2499)
        {
            _305 = as_type<int>(_2291);
        }
        int _2501 = _305;
        int _2503 = _2501;
        if (_2499)
        {
            float _2505 = _1945 * _2319;
            _2503 = as_type<int>(_2505);
        }
        int _2507 = _2503;
        _311 = _2507;
        if (!_2499)
        {
            _307 = as_type<int>(_2295);
        }
        int _2509 = _307;
        int _2511 = _2509;
        if (_2499)
        {
            float _2513 = _1915 * _2319;
            _2511 = as_type<int>(_2513);
        }
        int _2515 = _2511;
        _313 = _2515;
        if (!_2499)
        {
            _309 = as_type<int>(_2301);
        }
        int _2517 = _309;
        _315 = _2517;
        if (_2499)
        {
            float _2519 = _1965 * _2319;
            _315 = as_type<int>(_2519);
        }
    }
    _2357 = false;
    int _2521 = _311;
    int _2523 = _313;
    int _2525 = _315;
    uint _2527 = uint(int(uint(_157) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2527)] = uint(_2521);
    uint _2529 = uint(int(uint(_2281) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2529)] = uint(_2523);
    uint _2531 = uint(int(uint(_2285) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2531)] = uint(_2525);
}

