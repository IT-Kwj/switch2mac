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
    bool _1029 = false;
    bool _773 = false;
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
    bool _219 = _177;
    if (_177)
    {
        float _221 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _223 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _225 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _213 = _221;
        _215 = _223;
        _217 = _225;
    }
    float _227 = _213;
    float _229 = _215;
    float _231 = _217;
    float _233 = 0.0;
    float _235 = 0.0;
    float _237 = 0.0;
    if (_177)
    {
        float _239 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _241 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _243 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _233 = _239;
        _235 = _241;
        _237 = _243;
    }
    float _245 = _233;
    float _247 = _235;
    float _249 = _237;
    float _251 = as_type<float>(_145);
    float _253 = _147;
    float _255 = _149;
    if (_177)
    {
        float _257 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _259 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _261 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _251 = _257;
        _253 = _259;
        _255 = _261;
    }
    float _263 = _251;
    float _265 = _253;
    float _267 = _255;
    uint _269 = uint(int(uint(_157) >> uint(2)));
    float _271 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_269)]);
    uint _273 = uint(int(uint(_179) >> uint(2)));
    float _275 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_273)]);
    uint _277 = uint(int(uint(_179) >> uint(2)));
    float _279 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_277)]);
    float _281 = _245;
    float _283 = _247;
    float _285 = _249;
    float _287 = _227;
    float _289 = _229;
    float _291 = _231;
    float _293 = _263;
    float _295 = _265;
    float _297 = _267;
    float _299 = _183;
    int _301 = as_type<int>(_199);
    int _303 = as_type<int>(_205);
    int _305 = as_type<int>(_211);
    int _307 = as_type<int>(_199);
    int _309 = as_type<int>(_205);
    int _311 = as_type<int>(_211);
    int _313 = as_type<int>(_199);
    int _315 = as_type<int>(_205);
    int _317 = as_type<int>(_211);
    if (!_177)
    {
        int _319 = _157 + 4;
        uint _321 = uint(int(uint(_157) >> uint(2)));
        float _323 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_321)]);
        int _325 = _157 + 8;
        uint _327 = uint(int(uint(_157) >> uint(2)));
        float _329 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_327)]);
        uint _331 = uint(int(uint(_319) >> uint(2)));
        float _333 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_331)]);
        uint _335 = uint(int(uint(_319) >> uint(2)));
        float _337 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_335)]);
        uint _339 = uint(int(uint(_325) >> uint(2)));
        float _341 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_339)]);
        uint _343 = uint(int(uint(_157) >> uint(2)));
        float _345 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_343)]);
        uint _347 = uint(int(uint(_325) >> uint(2)));
        float _349 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_347)]);
        uint _351 = uint(int(uint(_319) >> uint(2)));
        float _353 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_351)]);
        uint _355 = uint(int(uint(_325) >> uint(2)));
        float _357 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_355)]);
        float _359 = _323 * _323;
        float _361 = fma(_329, _329, _359);
        float _363 = _333 * _333;
        float _365 = fma(_337, _337, _363);
        float _367 = _341 * _341;
        float _369 = fma(_345, _345, _361);
        float _371 = fma(_349, _349, _367);
        float _373 = sqrt(_369);
        float _375 = fma(_353, _353, _365);
        float _377 = fma(_357, _357, _371);
        float _379 = sqrt(_375);
        float _381 = sqrt(_377);
        bool _383 = _373 > 0.0;
        bool _385 = _379 > 0.0;
        bool _387 = _381 > 0.0;
        float _389 = _379;
        float _391 = _381;
        float _393 = _371;
        float _395 = _323;
        float _397 = _373;
        float _399 = _329;
        float _401 = _365;
        float _403 = _333;
        float _405 = _353;
        float _407 = _345;
        if (_383)
        {
            float _409 = rsqrt(_369);
            _389 = _409;
        }
        float _411 = _389;
        float _413 = 0.0;
        if (_385)
        {
            float _415 = rsqrt(_375);
            _413 = _415;
        }
        float _417 = _413;
        float _419 = 0.0;
        if (_387)
        {
            float _421 = rsqrt(_377);
            _419 = _421;
        }
        float _423 = _419;
        if (!_383)
        {
            _391 = 0.0;
        }
        float _425 = _391;
        float _427 = _425;
        if (_383)
        {
            float _429 = _323 * _411;
            _427 = _429;
        }
        float _431 = _427;
        _281 = _431;
        if (!_383)
        {
            _393 = 0.0;
        }
        float _433 = _393;
        float _435 = _433;
        if (_383)
        {
            float _437 = _329 * _411;
            _435 = _437;
        }
        float _439 = _435;
        _287 = _439;
        if (!_383)
        {
            _395 = 0.0;
        }
        float _441 = _395;
        float _443 = _441;
        if (_383)
        {
            float _445 = _345 * _411;
            _443 = _445;
        }
        float _447 = _443;
        _293 = _447;
        if (!_385)
        {
            _397 = 0.0;
        }
        float _449 = _397;
        float _451 = _449;
        if (_385)
        {
            float _453 = _333 * _417;
            _451 = _453;
        }
        float _455 = _451;
        _283 = _455;
        if (!_385)
        {
            _399 = 0.0;
        }
        float _457 = _399;
        float _459 = _457;
        if (_385)
        {
            float _461 = _353 * _417;
            _459 = _461;
        }
        float _463 = _459;
        _295 = _463;
        if (!_385)
        {
            _401 = 0.0;
        }
        float _465 = _401;
        float _467 = _465;
        if (_385)
        {
            float _469 = _337 * _417;
            _467 = _469;
        }
        float _471 = _467;
        _289 = _471;
        if (!_387)
        {
            _403 = 0.0;
        }
        float _473 = _403;
        float _475 = _473;
        if (!_387)
        {
            _405 = 0.0;
        }
        float _477 = _405;
        float _479 = _477;
        if (_387)
        {
            float _481 = _341 * _423;
            _475 = _481;
        }
        float _483 = _475;
        _285 = _483;
        if (!_387)
        {
            _407 = 0.0;
        }
        float _485 = _407;
        _297 = _485;
        if (_387)
        {
            float _487 = _349 * _423;
            _479 = _487;
        }
        float _489 = _479;
        _291 = _489;
        if (_387)
        {
            float _491 = _357 * _423;
            _297 = _491;
        }
    }
    float _493 = _281;
    float _495 = _283;
    float _497 = _285;
    float _499 = _287;
    float _501 = _289;
    float _503 = _291;
    float _505 = _293;
    float _507 = _295;
    float _509 = _297;
    float _511 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _513 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _515 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _517 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _519 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _521 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _523 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _525 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _527 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _529 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _531 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _533 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _535 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _537 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    uint _539 = uint(int(uint(_179) >> uint(2)));
    float _541 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_539)]);
    bool _543 = _513 > 0.0;
    float _545 = abs(_511);
    float _547 = log2(_545);
    bool _549 = _515 > 0.0;
    float _551 = 0.0;
    float _553 = _527;
    float _555 = _525;
    if (_543)
    {
        float _557 = 1.0 / _513;
        _551 = _557;
    }
    float _559 = _551;
    float _561 = -_279;
    float _563 = _517 + _561;
    float _565 = _527 * _515;
    float _567 = _521 * _529;
    float _569 = _519 * _529;
    float _571 = _565;
    if (_549)
    {
        float _573 = -_565;
        float _575 = fma(_271, _573, _527);
        _553 = _575;
    }
    float _577 = _553;
    float _579 = _567 * _493;
    float _581 = _577;
    if (_543)
    {
        float _583 = _563 * _559;
        _555 = _583;
    }
    float _585 = _555;
    float _587 = _531 * _547;
    float _589 = _567 * _495;
    float _591 = _567 * _497;
    float _593 = exp2(_587);
    float _595 = _523 * _529;
    float _597 = fma(_569, _499, _579);
    if (_543)
    {
        float _599 = precise::min(_585, 1.0);
        _571 = _599;
    }
    float _601 = _571;
    float _603 = fma(_569, _501, _589);
    float _605 = fma(_569, _503, _591);
    float _607 = fma(_595, _505, _597);
    float _609 = fma(_595, _507, _603);
    if (_543)
    {
        float _611 = _601 * _577;
        _581 = _611;
    }
    float _613 = _581;
    float _615 = fma(_595, _509, _605);
    float _617 = _531 * _607;
    float _619 = _275 * _531;
    float _621 = _531 * _609;
    float _623 = _531 * _613;
    float _625 = _531 * _615;
    float _627 = fma(_183, _593, _617);
    float _629 = fma(_183, _619, _161);
    float _631 = fma(_189, _593, _621);
    float _633 = fma(_189, _619, _167);
    float _635 = fma(_195, _619, _173);
    float _637 = fma(_195, _593, _625);
    float _639 = _533 * _623;
    float _641 = _535 * _623;
    float _643 = _537 * _623;
    bool _645 = !_177;
    float _647 = _639;
    float _649 = _643;
    float _771;
    if (!_645)
    {
        float _651 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _653 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _655 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _657 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _659 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _661 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _663 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _665 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _667 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _669 = _655 * _657;
        float _671 = _655 * _659;
        float _673 = _653 * _657;
        float _675 = -_669;
        float _677 = fma(_651, _661, _675);
        float _679 = -_671;
        float _681 = fma(_653, _661, _679);
        float _683 = -_673;
        float _685 = fma(_651, _659, _683);
        float _687 = _665 * _651;
        float _689 = _665 * _677;
        float _691 = _667 * _653;
        float _693 = _663 * _659;
        float _695 = -_687;
        float _697 = fma(_663, _653, _695);
        float _699 = -_689;
        float _701 = fma(_663, _681, _699);
        float _703 = _665 * _661;
        float _705 = _667 * _657;
        float _707 = _663 * _655;
        float _709 = fma(_667, _685, _701);
        float _711 = -_703;
        float _713 = fma(_667, _659, _711);
        float _715 = -_705;
        float _717 = fma(_663, _661, _715);
        float _719 = -_693;
        float _721 = fma(_665, _657, _719);
        float _723 = -_707;
        float _725 = fma(_667, _651, _723);
        float _727 = -_651;
        float _729 = fma(_727, _661, _669);
        float _731 = 1.0 / _709;
        float _733 = -_691;
        float _735 = fma(_665, _655, _733);
        float _737 = _713 * _731;
        float _739 = _717 * _731;
        float _741 = _721 * _731;
        float _743 = _639 * _731;
        float _745 = _641 * _737;
        float _747 = _641 * _739;
        float _749 = _729 * _731;
        float _751 = _641 * _741;
        float _753 = _735 * _731;
        float _755 = _725 * _731;
        float _757 = fma(_681, _743, _745);
        float _759 = fma(_639, _749, _747);
        float _761 = _697 * _731;
        float _763 = fma(_685, _743, _751);
        float _765 = fma(_643, _753, _757);
        float _767 = fma(_643, _755, _759);
        float _769 = fma(_643, _761, _763);
        _647 = _765;
        _771 = _767;
        _649 = _769;
        _773 = true;
    }
    else
    {
        int _775 = as_type<int>(_155) & 1024;
        bool _777 = _775 != 0;
        if (_777)
        {
            _219 = true;
        }
        bool _779 = _219;
        bool _781 = _779;
        if (!_777)
        {
            int _783 = as_type<int>(_155) & 2048;
            bool _785 = _783 != 0;
            _781 = _785;
        }
        bool _787 = _781;
        if (!_787)
        {
            _299 = _641;
        }
        float _789 = _299;
        bool _791 = !_787;
        _771 = _789;
        if (!_791)
        {
            uint _793 = uint(int(uint(_157) >> uint(2)));
            float _795 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_793)]);
            int _797 = _157 + 4;
            uint _799 = uint(int(uint(_797) >> uint(2)));
            float _801 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_799)]);
            int _803 = _157 + 8;
            uint _805 = uint(int(uint(_803) >> uint(2)));
            float _807 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_805)]);
            uint _809 = uint(int(uint(_157) >> uint(2)));
            float _811 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_809)]);
            int _813 = _157 + 4;
            uint _815 = uint(int(uint(_813) >> uint(2)));
            float _817 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_815)]);
            int _819 = _157 + 8;
            uint _821 = uint(int(uint(_819) >> uint(2)));
            float _823 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_821)]);
            uint _825 = uint(int(uint(_157) >> uint(2)));
            float _827 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_825)]);
            int _829 = _157 + 4;
            uint _831 = uint(int(uint(_829) >> uint(2)));
            float _833 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_831)]);
            int _835 = _157 + 8;
            uint _837 = uint(int(uint(_835) >> uint(2)));
            float _839 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_837)]);
            float _841 = _807 * _811;
            float _843 = _807 * _817;
            float _845 = _801 * _811;
            float _847 = -_841;
            float _849 = fma(_795, _823, _847);
            float _851 = -_843;
            float _853 = fma(_801, _823, _851);
            float _855 = -_845;
            float _857 = fma(_795, _817, _855);
            float _859 = _833 * _795;
            float _861 = _833 * _849;
            float _863 = _839 * _801;
            float _865 = _827 * _817;
            float _867 = -_859;
            float _869 = fma(_827, _801, _867);
            float _871 = -_861;
            float _873 = fma(_827, _853, _871);
            float _875 = _833 * _823;
            float _877 = _839 * _811;
            float _879 = _827 * _807;
            float _881 = fma(_839, _857, _873);
            float _883 = -_875;
            float _885 = fma(_839, _817, _883);
            float _887 = -_877;
            float _889 = fma(_827, _823, _887);
            float _891 = -_865;
            float _893 = fma(_833, _811, _891);
            float _895 = -_879;
            float _897 = fma(_839, _795, _895);
            float _899 = -_795;
            float _901 = fma(_899, _823, _841);
            float _903 = 1.0 / _881;
            float _905 = -_863;
            float _907 = fma(_833, _807, _905);
            float _909 = _885 * _903;
            float _911 = _889 * _903;
            float _913 = _893 * _903;
            float _915 = _639 * _903;
            float _917 = _641 * _909;
            float _919 = _641 * _911;
            float _921 = _901 * _903;
            float _923 = _641 * _913;
            float _925 = _907 * _903;
            float _927 = _897 * _903;
            float _929 = fma(_853, _915, _917);
            float _931 = fma(_639, _921, _919);
            float _933 = _869 * _903;
            float _935 = fma(_857, _915, _923);
            float _937 = fma(_643, _925, _929);
            float _939 = fma(_643, _927, _931);
            float _941 = fma(_643, _933, _935);
            _647 = _937;
            _771 = _939;
            _649 = _941;
        }
    }
    _773 = false;
    float _943 = _647;
    float _945 = _771;
    float _947 = _649;
    float _949 = _629 + _943;
    float _951 = _633 + _945;
    int _953 = _157 + 4;
    float _955 = _635 + _947;
    int _957 = _157 + 8;
    uint _959 = uint(int(uint(_179) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_959)] = as_type<uint>(_541);
    float _961 = -_161;
    float _963 = _961 + _949;
    float _965 = -_167;
    float _967 = _965 + _951;
    uint _969 = uint(int(uint(_157) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_969)] = as_type<uint>(_949);
    float _971 = -_173;
    float _973 = _971 + _955;
    uint _975 = uint(int(uint(_953) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_975)] = as_type<uint>(_951);
    uint _977 = uint(int(uint(_957) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_977)] = as_type<uint>(_955);
    uint _979 = uint(int(uint(_157) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_979)] = as_type<uint>(_627);
    uint _981 = uint(int(uint(_953) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_981)] = as_type<uint>(_631);
    uint _983 = uint(int(uint(_957) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_983)] = as_type<uint>(_637);
    uint _985 = uint(int(uint(_157) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_985)] = as_type<uint>(_963);
    uint _987 = uint(int(uint(_953) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_987)] = as_type<uint>(_967);
    uint _989 = uint(int(uint(_957) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_989)] = as_type<uint>(_973);
    float _991 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _993 = _967 * _967;
    float _995 = _631 * _631;
    float _997 = fma(_963, _963, _993);
    float _999 = fma(_627, _627, _995);
    float _1001 = fma(_973, _973, _997);
    float _1003 = fma(_637, _637, _999);
    float _1005 = sqrt(_1003);
    float _1007 = sqrt(_1001);
    bool _1009 = _1007 >= 9.9999999747524270787835121154785e-07;
    bool _1011 = isnan(_1007);
    bool _1013 = _1009 || _1011;
    bool _1015 = isnan(9.9999999747524270787835121154785e-07);
    bool _1017 = _1013 || _1015;
    if (!_1017)
    {
        bool _1019 = _517 != _279;
        bool _1021 = isnan(_517);
        bool _1023 = _1019 || _1021;
        bool _1025 = isnan(_279);
        bool _1027 = _1023 || _1025;
        _1029 = _1027;
        if (!_1029)
        {
            float _1031 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _1033 = _1031 > 0.0;
            bool _1035 = !_1033;
            if (!_1035)
            {
                float _1037 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _1039 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _1041 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _1043 = _1039 * _495;
                float _1045 = _1039 * _493;
                float _1047 = _1039 * _497;
                float _1049 = fma(_1037, _501, _1043);
                float _1051 = fma(_1037, _499, _1045);
                float _1053 = fma(_1037, _503, _1047);
                float _1055 = fma(_1041, _507, _1049);
                float _1057 = fma(_1041, _505, _1051);
                float _1059 = fma(_1041, _509, _1053);
                float _1061 = _1055 * _1055;
                float _1063 = fma(_1057, _1057, _1061);
                float _1065 = fma(_1059, _1059, _1063);
                float _1067 = rsqrt(_1065);
                float _1069 = _1067 * 9.9999999747524270787835121154785e-07;
                float _1071 = _1057 * _1069;
                float _1073 = _1055 * _1069;
                float _1075 = _1059 * _1069;
                _313 = as_type<int>(_1071);
                _315 = as_type<int>(_1073);
                _317 = as_type<int>(_1075);
                _1029 = true;
            }
            else
            {
                bool _1077 = _1005 >= 9.9999999747524270787835121154785e-07;
                bool _1079 = isnan(_1005);
                bool _1081 = _1077 || _1079;
                bool _1083 = isnan(9.9999999747524270787835121154785e-07);
                bool _1085 = _1081 || _1083;
                if (!_1085)
                {
                    float _1087 = _951 * _951;
                    float _1089 = fma(_949, _949, _1087);
                    float _1091 = fma(_955, _955, _1089);
                    float _1093 = sqrt(_1091);
                    bool _1095 = _1093 >= 9.9999999747524270787835121154785e-07;
                    bool _1097 = isnan(_1093);
                    bool _1099 = _1095 || _1097;
                    bool _1101 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1103 = _1099 || _1101;
                    float _1105 = _1093;
                    if (_1103)
                    {
                        float _1107 = rsqrt(_1091);
                        _1105 = _1107;
                    }
                    float _1109 = _1105;
                    if (!_1103)
                    {
                        _301 = 0;
                    }
                    int _1111 = _301;
                    int _1113 = _1111;
                    if (!_1103)
                    {
                        _303 = 897988541;
                    }
                    int _1115 = _303;
                    int _1117 = _1115;
                    if (!_1103)
                    {
                        _305 = 0;
                    }
                    int _1119 = _305;
                    float _1121 = _1109;
                    int _1123 = _1119;
                    if (_1103)
                    {
                        float _1125 = _1109 * 9.9999999747524270787835121154785e-07;
                        _1121 = _1125;
                    }
                    float _1127 = _1121;
                    if (_1103)
                    {
                        float _1129 = _949 * _1127;
                        _1113 = as_type<int>(_1129);
                    }
                    int _1131 = _1113;
                    _313 = _1131;
                    if (_1103)
                    {
                        float _1133 = _951 * _1127;
                        _1117 = as_type<int>(_1133);
                    }
                    int _1135 = _1117;
                    _315 = _1135;
                    if (_1103)
                    {
                        float _1137 = _955 * _1127;
                        _1123 = as_type<int>(_1137);
                    }
                    int _1139 = _1123;
                    _317 = _1139;
                    _1029 = true;
                }
                else
                {
                    float _1141 = rsqrt(_1003);
                    float _1143 = _1141 * 9.9999999747524270787835121154785e-07;
                    float _1145 = _627 * _1143;
                    float _1147 = _631 * _1143;
                    float _1149 = _637 * _1143;
                    _313 = as_type<int>(_1145);
                    _315 = as_type<int>(_1147);
                    _317 = as_type<int>(_1149);
                    _1029 = true;
                }
            }
        }
    }
    else
    {
        float _1151 = _1005 * _991;
        bool _1153 = _1151 >= 0.001000000047497451305389404296875;
        bool _1155 = isnan(_1151);
        bool _1157 = _1153 || _1155;
        bool _1159 = isnan(0.001000000047497451305389404296875);
        bool _1161 = _1157 || _1159;
        bool _1163 = _1151 > 0.0;
        bool _1165 = !_1161;
        bool _1167 = _1163 && _1165;
        bool _1169 = _1007 < 0.001000000047497451305389404296875;
        bool _1171 = _1169 && _1167;
        if (!_1171)
        {
            _307 = as_type<int>(_963);
        }
        int _1173 = _307;
        int _1175 = _1173;
        if (_1171)
        {
            float _1177 = _627 * _991;
            _1175 = as_type<int>(_1177);
        }
        int _1179 = _1175;
        _313 = _1179;
        if (!_1171)
        {
            _309 = as_type<int>(_967);
        }
        int _1181 = _309;
        int _1183 = _1181;
        if (_1171)
        {
            float _1185 = _631 * _991;
            _1183 = as_type<int>(_1185);
        }
        int _1187 = _1183;
        _315 = _1187;
        if (!_1171)
        {
            _311 = as_type<int>(_973);
        }
        int _1189 = _311;
        _317 = _1189;
        if (_1171)
        {
            float _1191 = _637 * _991;
            _317 = as_type<int>(_1191);
        }
    }
    _1029 = false;
    int _1193 = _313;
    int _1195 = _315;
    int _1197 = _317;
    uint _1199 = uint(int(uint(_157) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1199)] = uint(_1193);
    uint _1201 = uint(int(uint(_953) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1201)] = uint(_1195);
    uint _1203 = uint(int(uint(_957) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1203)] = uint(_1197);
}

