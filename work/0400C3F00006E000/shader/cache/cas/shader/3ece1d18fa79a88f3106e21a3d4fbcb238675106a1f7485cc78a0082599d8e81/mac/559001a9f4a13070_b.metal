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
    bool _3751 = false;
    bool _3495 = false;
    bool _2833 = false;
    bool _2081 = false;
    bool _1175 = false;
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
    float _285 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_283)]);
    uint _287 = uint(int(uint(_179) >> uint(2)));
    float _289 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_287)]);
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
    float _313 = _195;
    float _315 = _183;
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
    float _535 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[3]);
    float _537 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[16]);
    float _539 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[17]);
    float _541 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _543 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _545 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
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
    float _573 = _567 ? _281 : 0.92653000354766845703125;
    float _575 = _535 * _569;
    float _577 = _537 * 0.00999999977648258209228515625;
    float _579 = _535 * _571;
    float _581 = _535 * _573;
    float _583 = _535 * _577;
    float _585 = _571;
    float _587 = _573;
    float _589 = _581;
    float _591 = _575;
    float _593 = _583;
    if (_567)
    {
        _585 = _575;
    }
    float _595 = _585;
    float _597 = _595;
    if (_567)
    {
        _587 = _579;
    }
    float _599 = _587;
    float _601 = _557;
    float _603 = _599;
    float _605 = _541;
    if (!_567)
    {
        float _607 = _539 * 0.00999999977648258209228515625;
        float _609 = _547 * _583;
        float _611 = fma(_275, 2.0, -1.0);
        float _613 = _535 * _607;
        float _615 = fma(_269, 2.0, -1.0);
        float _617 = fma(_281, 2.0, -1.0);
        float _619 = fma(_613, _611, _609);
        float _621 = fma(_613, _615, _609);
        float _623 = fma(_613, _617, _609);
        float _625 = _579 + _619;
        float _627 = _575 + _621;
        float _629 = _581 + _623;
        _601 = _623;
        _597 = _627;
        _603 = _625;
        _589 = _629;
    }
    float _631 = _601;
    float _633 = _597;
    float _635 = _603;
    float _637 = _589;
    float _639 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[13]);
    float _641 = -_541;
    float _643 = _641 + 1.0;
    float _645 = -_545;
    float _647 = _645 + 1.0;
    float _649 = abs(_545);
    float _651 = log2(_649);
    float _653 = _529 * _543;
    float _655 = 0.0;
    float _657 = _631;
    float _659 = _633;
    float _661 = _635;
    float _663 = _637;
    if (_567)
    {
        _655 = 0.0;
    }
    float _665 = _655;
    float _667 = fma(_643, _647, _545);
    float _669 = -_289;
    float _671 = _547 + _669;
    float _673 = _665;
    float _675 = _671;
    if (!_567)
    {
        float _677 = _541 * _583;
        _673 = _677;
    }
    float _679 = _673;
    float _681 = _653 * _509;
    bool _683 = _667 != 1.0;
    bool _685 = isnan(_667);
    bool _687 = _683 || _685;
    bool _689 = isnan(1.0);
    bool _691 = _687 || _689;
    bool _693 = _679 != 0.0;
    bool _695 = isnan(_679);
    bool _697 = _693 || _695;
    bool _699 = isnan(0.0);
    bool _701 = _697 || _699;
    bool _703 = _549 != 1.0;
    bool _705 = isnan(_549);
    bool _707 = _703 || _705;
    bool _709 = isnan(1.0);
    bool _711 = _707 || _709;
    bool _713 = !_691;
    bool _715 = _711 || _713;
    float _717 = _541 * _651;
    float _719 = _549;
    if (!_715)
    {
        float _721 = abs(_667);
        float _723 = log2(_721);
        _719 = _723;
    }
    float _725 = _719;
    if (!_715)
    {
        float _727 = -_667;
        float _729 = _727 + 1.0;
        _657 = _729;
    }
    float _731 = _657;
    float _733 = 0.0;
    if (_715)
    {
        _733 = _671;
    }
    float _735 = _733;
    float _737 = 0.0;
    float _739 = _735;
    if (!_715)
    {
        float _741 = 1.0 / _731;
        _737 = _741;
    }
    float _743 = _737;
    float _745 = _743;
    if (!_715)
    {
        float _747 = _671 * _725;
        _591 = _747;
    }
    float _749 = _591;
    float _751 = _527 * _543;
    float _753 = _653 * _511;
    float _755 = exp2(_717);
    float _757 = _653 * _513;
    float _759 = _531 * _543;
    float _761 = fma(_751, _515, _681);
    float _763 = fma(_751, _517, _753);
    float _765 = fma(_751, _519, _757);
    float _767 = _285 * _541;
    float _769 = fma(_759, _521, _761);
    float _771 = _749;
    if (!_715)
    {
        float _773 = exp2(_749);
        _771 = _773;
    }
    float _775 = _771;
    float _777 = fma(_759, _523, _763);
    float _779 = fma(_759, _525, _765);
    float _781 = _541 * _769;
    float _783 = fma(_189, _767, _167);
    float _785 = _541 * _777;
    float _787 = _541 * _779;
    float _789 = fma(_183, _755, _781);
    float _791 = fma(_189, _755, _785);
    float _793 = fma(_195, _755, _787);
    float _795 = _775;
    float _797 = _785;
    float _799 = _785;
    float _801 = _787;
    if (!_715)
    {
        float _803 = -_775;
        float _805 = _803 + 1.0;
        _795 = _805;
    }
    float _807 = _795;
    if (!_715)
    {
        float _809 = _807 * _743;
        _739 = _809;
    }
    float _811 = _739;
    float _813 = fma(_183, _767, _161);
    float _815 = fma(_195, _767, _173);
    float _817 = _811 + _633;
    float _819 = _541 + _817;
    float _821 = _819 + _679;
    bool _823 = _639 != 1.0;
    bool _825 = isnan(_639);
    bool _827 = _823 || _825;
    bool _829 = isnan(1.0);
    bool _831 = _827 || _829;
    float _833 = _819;
    float _835 = _819;
    float _837 = _817;
    float _925;
    float _933;
    float _935;
    float _937;
    float _1071;
    float _1103;
    float _1129;
    float _1141;
    float _1149;
    float _1151;
    float _1155;
    float _1159;
    float _1163;
    float _1167;
    float _1171;
    float _1173;
    if (!_701)
    {
        if (_831)
        {
            _833 = 0.60000002384185791015625;
        }
        float _839 = _833;
        float _841 = 0.0;
        if (!_831)
        {
            float _843 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[9]);
            _841 = _843;
        }
        float _845 = _841;
        if (_831)
        {
            _309 = 0.4199999868869781494140625;
        }
        float _847 = _309;
        if (_831)
        {
            _311 = 0.23000000417232513427734375;
        }
        float _849 = _311;
        float _851 = 0.0;
        if (!_831)
        {
            float _853 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[8]);
            _851 = _853;
        }
        float _855 = _851;
        float _857 = _839;
        if (!_831)
        {
            float _859 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _857 = _859;
        }
        float _861 = _857;
        float _863 = _847;
        if (!_831)
        {
            float _865 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _863 = _865;
        }
        float _867 = _863;
        if (_831)
        {
            _797 = 0.1500000059604644775390625;
        }
        float _869 = _797;
        float _871 = _849;
        if (!_831)
        {
            float _873 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _871 = _873;
        }
        float _875 = _871;
        float _877 = _869;
        if (!_831)
        {
            float _879 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _877 = _879;
        }
        float _881 = _877;
        float _883 = 0.0;
        if (!_831)
        {
            float _885 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[10]);
            _883 = _885;
        }
        float _887 = _883;
        float _889 = 0.0;
        if (!_831)
        {
            float _891 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[11]);
            _889 = _891;
        }
        float _893 = _889;
        if (_831)
        {
            _659 = 0.60000002384185791015625;
        }
        float _895 = _659;
        float _897 = _535 * _861;
        float _899 = _895;
        float _901 = _861;
        if (!_831)
        {
            _899 = _861;
        }
        float _903 = _899;
        float _905 = _903;
        if (_831)
        {
            _901 = 0.4199999868869781494140625;
        }
        float _907 = _901;
        float _909 = _535 * _867;
        float _911 = 1.0 / _897;
        float _913 = _907;
        if (!_831)
        {
            _913 = _867;
        }
        float _915 = _913;
        float _917 = _535 * _875;
        float _919 = _535 * _903;
        float _921 = 1.0 / _909;
        float _923 = _915;
        _925 = _845;
        if (_831)
        {
            _905 = 0.23000000417232513427734375;
        }
        float _927 = _905;
        float _929 = _535 * _881;
        float _931 = _927;
        _933 = _855;
        _935 = _887;
        _937 = _893;
        if (!_831)
        {
            _931 = _875;
        }
        float _939 = _931;
        float _941 = _821 * 6.283184051513671875;
        float _943 = _535 * _915;
        float _945 = 1.0 / _917;
        float _947 = _911 * _941;
        if (_831)
        {
            _923 = 0.1500000059604644775390625;
        }
        float _949 = _923;
        float _951 = _949;
        if (!_831)
        {
            _951 = _881;
        }
        float _953 = _951;
        float _955 = 1.0 / _943;
        float _957 = _535 * _939;
        float _959 = _947 * 0.15915493667125701904296875;
        float _961 = 1.0 / _929;
        float _963 = _921 * _941;
        float _965 = 1.0 / _919;
        float _967 = _535 * _953;
        float _969 = _963 * 0.15915493667125701904296875;
        float _971 = _945 * _941;
        float _973 = 1.0 / _957;
        float _975 = _971 * 0.15915493667125701904296875;
        float _977 = _817 * _955;
        float _979 = _961 * _941;
        float _981 = 1.0 / _967;
        float _983 = _977 * 6.283184051513671875;
        float _985 = _979 * 0.15915493667125701904296875;
        float _987 = _817 * _965;
        float _989 = _983 * 0.15915493667125701904296875;
        float _991 = _987 * 6.283184051513671875;
        float _993 = _817 * _973;
        float _995 = _969 * 6.283185482025146484375;
        float _997 = sin(_995);
        float _999 = _991 * 0.15915493667125701904296875;
        float _1001 = _993 * 6.283184051513671875;
        float _1003 = _817 * _981;
        float _1005 = _989 * 6.283185482025146484375;
        float _1007 = sin(_1005);
        float _1009 = _1001 * 0.15915493667125701904296875;
        float _1011 = _1003 * 6.283184051513671875;
        float _1013 = _959 * 6.283185482025146484375;
        float _1015 = sin(_1013);
        float _1017 = _1011 * 0.15915493667125701904296875;
        float _1019 = _973;
        float _1021 = _993;
        float _1023 = _1001;
        float _1025 = _1011;
        if (_831)
        {
            _1019 = 3.0;
        }
        float _1027 = _1019;
        float _1029 = _1027;
        if (_831)
        {
            _1021 = 3.0;
        }
        float _1031 = _1021;
        float _1033 = _999 * 6.283185482025146484375;
        float _1035 = sin(_1033);
        float _1037 = _1031;
        if (!_831)
        {
            _1029 = _845;
        }
        float _1039 = _1029;
        float _1041 = _1039;
        if (!_831)
        {
            _1037 = _845;
        }
        float _1043 = _1037;
        float _1045 = _1043;
        if (_831)
        {
            _1023 = 4.0;
        }
        float _1047 = _1023;
        float _1049 = _975 * 6.283185482025146484375;
        float _1051 = sin(_1049);
        float _1053 = _1047;
        if (!_831)
        {
            _1053 = _855;
        }
        float _1055 = _1053;
        float _1057 = _997 * _1039;
        float _1059 = _1007 * _1043;
        float _1061 = _1009 * 6.283185482025146484375;
        float _1063 = sin(_1061);
        float _1065 = _1055;
        float _1067 = _1057;
        float _1069 = _997;
        _1071 = _1007;
        if (_831)
        {
            _1045 = 4.0;
        }
        float _1073 = _1045;
        float _1075 = _1073;
        if (!_831)
        {
            _1075 = _855;
        }
        float _1077 = _1075;
        float _1079 = _985 * 6.283185482025146484375;
        float _1081 = sin(_1079);
        float _1083 = fma(_1015, _1055, _1057);
        float _1085 = _1015;
        float _1087 = _1083;
        if (_831)
        {
            _1041 = 2.0;
        }
        float _1089 = _1041;
        float _1091 = _1017 * 6.283185482025146484375;
        float _1093 = sin(_1091);
        float _1095 = _1089;
        if (_831)
        {
            _1065 = 2.0;
        }
        float _1097 = _1065;
        float _1099 = fma(_1035, _1077, _1059);
        float _1101 = _1097;
        _1103 = _1035;
        if (!_831)
        {
            _1095 = _887;
        }
        float _1105 = _1095;
        if (!_831)
        {
            _1101 = _887;
        }
        float _1107 = _1101;
        float _1109 = _1107;
        if (_831)
        {
            _1067 = 1.5;
        }
        float _1111 = _1067;
        float _1113 = _1111;
        if (_831)
        {
            _1025 = 1.5;
        }
        float _1115 = _1025;
        float _1117 = fma(_1051, _1105, _1083);
        float _1119 = _1115;
        float _1121 = _1117;
        if (!_831)
        {
            _1113 = _893;
        }
        float _1123 = _1113;
        float _1125 = fma(_1063, _1107, _1099);
        float _1127 = _1123;
        _1129 = _1125;
        if (!_831)
        {
            _1119 = _893;
        }
        float _1131 = _1119;
        float _1133 = fma(_1081, _1123, _1117);
        float _1135 = fma(_1093, _1131, _1125);
        float _1137 = _1135;
        if (_831)
        {
            _1121 = 1.5;
        }
        float _1139 = _1121;
        _1141 = _1139;
        if (_831)
        {
            _1127 = 2.0;
        }
        float _1143 = _1127;
        float _1145 = -_1135;
        float _1147 = _1133 + _1145;
        _1149 = _1143;
        _1151 = _1147;
        if (_831)
        {
            _1137 = 3.0;
        }
        float _1153 = _1137;
        _1155 = _1153;
        if (_831)
        {
            _1109 = 4.0;
        }
        float _1157 = _1109;
        _1159 = _1157;
        if (_831)
        {
            _1085 = 0.1500000059604644775390625;
        }
        float _1161 = _1085;
        _1163 = _1161;
        if (_831)
        {
            _1069 = 0.23000000417232513427734375;
        }
        float _1165 = _1069;
        _1167 = _1165;
        if (_831)
        {
            _1087 = 0.4199999868869781494140625;
        }
        float _1169 = _1087;
        _1171 = _1169;
        _1173 = 0.0;
        _1175 = true;
    }
    else
    {
        if (_831)
        {
            _313 = 0.4199999868869781494140625;
        }
        float _1177 = _313;
        float _1179 = 0.0;
        if (!_831)
        {
            float _1181 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[9]);
            _1179 = _1181;
        }
        float _1183 = _1179;
        if (_831)
        {
            _799 = 0.60000002384185791015625;
        }
        float _1185 = _799;
        if (_831)
        {
            _801 = 0.23000000417232513427734375;
        }
        float _1187 = _801;
        float _1189 = 0.0;
        if (!_831)
        {
            float _1191 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[8]);
            _1189 = _1191;
        }
        float _1193 = _1189;
        float _1195 = _1177;
        if (!_831)
        {
            float _1197 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _1195 = _1197;
        }
        float _1199 = _1195;
        if (_831)
        {
            _593 = 0.1500000059604644775390625;
        }
        float _1201 = _593;
        float _1203 = _1185;
        if (!_831)
        {
            float _1205 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _1203 = _1205;
        }
        float _1207 = _1203;
        float _1209 = _1187;
        if (!_831)
        {
            float _1211 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _1209 = _1211;
        }
        float _1213 = _1209;
        float _1215 = _1201;
        if (!_831)
        {
            float _1217 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _1215 = _1217;
        }
        float _1219 = _1215;
        float _1221 = 0.0;
        if (!_831)
        {
            float _1223 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[10]);
            _1221 = _1223;
        }
        float _1225 = _1221;
        float _1227 = 0.0;
        if (!_831)
        {
            float _1229 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[11]);
            _1227 = _1229;
        }
        float _1231 = _1227;
        if (_831)
        {
            _835 = 0.4199999868869781494140625;
        }
        float _1233 = _835;
        float _1235 = _1233;
        if (_831)
        {
            _315 = 0.4199999868869781494140625;
        }
        float _1237 = _315;
        float _1239 = _633 * 6.283184051513671875;
        float _1241 = _1237;
        float _1243 = _1199;
        if (!_831)
        {
            _1235 = _1199;
        }
        float _1245 = _1235;
        float _1247 = _535 * _1199;
        float _1249 = _1245;
        if (!_831)
        {
            _1241 = _1199;
        }
        float _1251 = _1241;
        float _1253 = _535 * _1245;
        float _1255 = _1251;
        if (_831)
        {
            _1249 = 0.4199999868869781494140625;
        }
        float _1257 = _1249;
        float _1259 = _1257;
        if (!_831)
        {
            _1259 = _1199;
        }
        float _1261 = _1259;
        float _1263 = 1.0 / _1247;
        float _1265 = _1261;
        if (_831)
        {
            _1243 = 0.60000002384185791015625;
        }
        float _1267 = _1243;
        float _1269 = _535 * _1207;
        float _1271 = _535 * _1261;
        float _1273 = _1267;
        if (_831)
        {
            _1265 = 0.60000002384185791015625;
        }
        float _1275 = _1265;
        float _1277 = _535 * _1213;
        float _1279 = _1275;
        _925 = _1183;
        if (!_831)
        {
            _1273 = _1207;
        }
        float _1281 = _1273;
        float _1283 = _535 * _1251;
        float _1285 = _1281;
        if (_831)
        {
            _1255 = 0.60000002384185791015625;
        }
        float _1287 = _1255;
        float _1289 = _1287;
        if (!_831)
        {
            _1289 = _1207;
        }
        float _1291 = _1289;
        float _1293 = _1291;
        if (!_831)
        {
            _1279 = _1207;
        }
        float _1295 = _1279;
        float _1297 = 1.0 / _1269;
        float _1299 = _535 * _1219;
        float _1301 = 1.0 / _1277;
        float _1303 = _535 * _1281;
        float _1305 = _1295;
        if (_831)
        {
            _1285 = 0.23000000417232513427734375;
        }
        float _1307 = _1285;
        float _1309 = _1307;
        if (!_831)
        {
            _1309 = _1213;
        }
        float _1311 = _1309;
        float _1313 = 1.0 / _1253;
        float _1315 = _535 * _1291;
        float _1317 = _1311;
        if (_831)
        {
            _1293 = 0.23000000417232513427734375;
        }
        float _1319 = _1293;
        float _1321 = _1319;
        if (!_831)
        {
            _1321 = _1213;
        }
        float _1323 = _1321;
        float _1325 = _535 * _1295;
        float _1327 = _1323;
        if (_831)
        {
            _1305 = 0.23000000417232513427734375;
        }
        float _1329 = _1305;
        float _1331 = _1329;
        if (!_831)
        {
            _1331 = _1213;
        }
        float _1333 = _1331;
        float _1335 = 1.0 / _1299;
        float _1337 = 1.0 / _1283;
        float _1339 = _535 * _1323;
        float _1341 = _1333;
        if (_831)
        {
            _1327 = 0.1500000059604644775390625;
        }
        float _1343 = _1327;
        float _1345 = _1343;
        if (!_831)
        {
            _1345 = _1219;
        }
        float _1347 = _1345;
        float _1349 = 1.0 / _1271;
        float _1351 = _535 * _1311;
        if (_831)
        {
            _1317 = 0.1500000059604644775390625;
        }
        float _1353 = _1317;
        float _1355 = _1353;
        if (!_831)
        {
            _1355 = _1219;
        }
        float _1357 = _1355;
        float _1359 = _535 * _1333;
        if (_831)
        {
            _1341 = 0.1500000059604644775390625;
        }
        float _1361 = _1341;
        float _1363 = _1361;
        if (!_831)
        {
            _1363 = _1219;
        }
        float _1365 = _1363;
        float _1367 = _821 * 6.283184051513671875;
        float _1369 = 1.0 / _1303;
        float _1371 = _535 * _1365;
        float _1373 = 1.0 / _1351;
        float _1375 = _1263 * _1367;
        float _1377 = _1375 * 0.15915493667125701904296875;
        float _1379 = _1297 * _1367;
        float _1381 = 1.0 / _1325;
        float _1383 = _1379 * 0.15915493667125701904296875;
        float _1385 = _1301 * _1367;
        float _1387 = 1.0 / _1339;
        float _1389 = 1.0 / _1315;
        float _1391 = _633 + _679;
        float _1393 = _535 * _1357;
        float _1395 = _1385 * 0.15915493667125701904296875;
        float _1397 = _1335 * _1367;
        float _1399 = _1391 * 6.283184051513671875;
        float _1401 = 1.0 / _1371;
        float _1403 = _1337 * _1399;
        float _1405 = _817 * _1313;
        float _1407 = _1403 * 0.15915493667125701904296875;
        float _1409 = _1349 * _1239;
        float _1411 = _1377 * 6.283185482025146484375;
        float _1413 = sin(_1411);
        float _1415 = _1405 * 6.283184051513671875;
        float _1417 = _1409 * 0.15915493667125701904296875;
        float _1419 = _1389 * _1399;
        float _1421 = _535 * _1347;
        float _1423 = 1.0 / _1359;
        float _1425 = _1419 * 0.15915493667125701904296875;
        float _1427 = _1381 * _1239;
        float _1429 = _1415 * 0.15915493667125701904296875;
        float _1431 = _1417 * 6.283185482025146484375;
        float _1433 = sin(_1431);
        float _1435 = _1427 * 0.15915493667125701904296875;
        float _1437 = _1427;
        if (_831)
        {
            _1437 = 3.0;
        }
        float _1439 = _1437;
        float _1441 = _1439;
        if (!_831)
        {
            _1441 = _1183;
        }
        float _1443 = _1441;
        float _1445 = _1407 * 6.283185482025146484375;
        float _1447 = sin(_1445);
        float _1449 = _1387 * _1399;
        float _1451 = 1.0 / _1421;
        float _1453 = _1429 * 6.283185482025146484375;
        float _1455 = sin(_1453);
        float _1457 = _1413 * _1443;
        float _1459 = _1443;
        float _1461 = _1449;
        float _1463 = _1413;
        if (_831)
        {
            _1459 = 3.0;
        }
        float _1465 = _1459;
        float _1467 = _1449 * 0.15915493667125701904296875;
        float _1469 = _1465;
        if (!_831)
        {
            _1469 = _1183;
        }
        float _1471 = _1469;
        if (_831)
        {
            _1461 = 3.0;
        }
        float _1473 = _1461;
        float _1475 = _1425 * 6.283185482025146484375;
        float _1477 = sin(_1475);
        float _1479 = _1473;
        if (_831)
        {
            _1463 = 3.0;
        }
        float _1481 = _1463;
        float _1483 = _1423 * _1239;
        float _1485 = _1481;
        if (!_831)
        {
            _1479 = _1183;
        }
        float _1487 = _1479;
        float _1489 = _1433 * _1471;
        float _1491 = _1487;
        _745 = _1433;
        if (!_831)
        {
            _1485 = _1183;
        }
        float _1493 = _1485;
        float _1495 = 1.0 / _1393;
        float _1497 = _817 * _1369;
        float _1499 = _1483 * 0.15915493667125701904296875;
        float _1501 = _1447 * _1487;
        float _1503 = _1383 * 6.283185482025146484375;
        float _1505 = sin(_1503);
        float _1507 = _1451 * _1399;
        float _1509 = _1455 * _1493;
        float _1511 = _1497 * 6.283184051513671875;
        float _1513 = _1493;
        float _1515 = _1497;
        _933 = _1193;
        _935 = _1225;
        _937 = _1231;
        if (_831)
        {
            _1491 = 4.0;
        }
        float _1517 = _1491;
        float _1519 = _1517;
        if (!_831)
        {
            _1519 = _1193;
        }
        float _1521 = _1519;
        float _1523 = _1507 * 0.15915493667125701904296875;
        float _1525 = _817 * _1373;
        float _1527 = _1435 * 6.283185482025146484375;
        float _1529 = sin(_1527);
        if (_831)
        {
            _1513 = 4.0;
        }
        float _1531 = _1513;
        float _1533 = _1511 * 0.15915493667125701904296875;
        float _1535 = _1531;
        if (!_831)
        {
            _1535 = _1193;
        }
        float _1537 = _1535;
        float _1539 = fma(_1477, _1521, _1501);
        float _1541 = _817 * _1495;
        float _1543 = _1525 * 6.283184051513671875;
        float _1545 = _1533 * 6.283185482025146484375;
        float _1547 = sin(_1545);
        float _1549 = fma(_1505, _1537, _1457);
        float _1551 = _1543 * 0.15915493667125701904296875;
        float _1553 = _1541 * 6.283184051513671875;
        float _1555 = _1401 * _1239;
        float _1557 = _1495;
        float _1559 = _1543;
        float _1561 = _1553;
        _1171 = _1549;
        if (_831)
        {
            _1515 = 4.0;
        }
        float _1563 = _1515;
        float _1565 = _1397 * 0.15915493667125701904296875;
        float _1567 = _1563;
        if (!_831)
        {
            _1567 = _1193;
        }
        float _1569 = _1567;
        float _1571 = _1395 * 6.283185482025146484375;
        float _1573 = sin(_1571);
        float _1575 = _1553 * 0.15915493667125701904296875;
        float _1577 = _1555 * 0.15915493667125701904296875;
        float _1579 = _1467 * 6.283185482025146484375;
        float _1581 = sin(_1579);
        float _1583 = fma(_1529, _1569, _1489);
        float _1585 = _1569;
        if (_831)
        {
            _1557 = 4.0;
        }
        float _1587 = _1557;
        float _1589 = _1499 * 6.283185482025146484375;
        float _1591 = sin(_1589);
        float _1593 = _1587;
        if (!_831)
        {
            _1593 = _1193;
        }
        float _1595 = _1593;
        float _1597 = _1551 * 6.283185482025146484375;
        float _1599 = sin(_1597);
        float _1601 = _1595;
        if (_831)
        {
            _1585 = 2.0;
        }
        float _1603 = _1585;
        float _1605 = _1603;
        if (_831)
        {
            _837 = 2.0;
        }
        float _1607 = _837;
        float _1609 = _1607;
        if (_831)
        {
            _1559 = 2.0;
        }
        float _1611 = _1559;
        float _1613 = _1565 * 6.283185482025146484375;
        float _1615 = sin(_1613);
        float _1617 = _1611;
        if (!_831)
        {
            _1605 = _1225;
        }
        float _1619 = _1605;
        float _1621 = fma(_1547, _1595, _1509);
        float _1623 = _1619;
        _1103 = _1547;
        if (!_831)
        {
            _1609 = _1225;
        }
        float _1625 = _1609;
        float _1627 = _1523 * 6.283185482025146484375;
        float _1629 = sin(_1627);
        float _1631 = _1625;
        if (!_831)
        {
            _1617 = _1225;
        }
        float _1633 = _1617;
        float _1635 = _1577 * 6.283185482025146484375;
        float _1637 = sin(_1635);
        float _1639 = _1633;
        if (_831)
        {
            _1601 = 2.0;
        }
        float _1641 = _1601;
        float _1643 = _1575 * 6.283185482025146484375;
        float _1645 = sin(_1643);
        float _1647 = _1641;
        if (!_831)
        {
            _1647 = _1225;
        }
        float _1649 = _1647;
        float _1651 = fma(_1573, _1619, _1549);
        float _1653 = fma(_1581, _1625, _1539);
        float _1655 = fma(_1591, _1633, _1583);
        _1071 = _1653;
        _1173 = _1591;
        if (_831)
        {
            _1561 = 1.5;
        }
        float _1657 = _1561;
        float _1659 = _1657;
        if (_831)
        {
            _1623 = 1.5;
        }
        float _1661 = _1623;
        float _1663 = _1661;
        if (_831)
        {
            _1631 = 1.5;
        }
        float _1665 = _1631;
        float _1667 = _1665;
        if (_831)
        {
            _1639 = 1.5;
        }
        float _1669 = _1639;
        float _1671 = fma(_1599, _1649, _1621);
        float _1673 = _1669;
        float _1675 = _1599;
        if (!_831)
        {
            _1659 = _1231;
        }
        float _1677 = _1659;
        if (!_831)
        {
            _1667 = _1231;
        }
        float _1679 = _1667;
        if (!_831)
        {
            _1673 = _1231;
        }
        float _1681 = _1673;
        if (!_831)
        {
            _1663 = _1231;
        }
        float _1683 = _1663;
        float _1685 = fma(_1615, _1677, _1651);
        float _1687 = fma(_1629, _1679, _1653);
        float _1689 = fma(_1637, _1681, _1655);
        float _1691 = fma(_1645, _1683, _1671);
        float _1693 = -_1687;
        float _1695 = _1693 + _1689;
        float _1697 = -_1691;
        float _1699 = _1685 + _1697;
        float _1701 = _1691;
        float _1703 = _1683;
        float _1705 = _1687;
        float _1707 = _1615;
        float _1709 = _1699;
        _1129 = _1637;
        if (_831)
        {
            _1701 = 1.5;
        }
        float _1711 = _1701;
        _1141 = _1711;
        if (_831)
        {
            _1703 = 2.0;
        }
        float _1713 = _1703;
        float _1715 = _1699 + _1695;
        _1149 = _1713;
        _1151 = _1715;
        if (_831)
        {
            _1705 = 3.0;
        }
        float _1717 = _1705;
        _1155 = _1717;
        if (_831)
        {
            _1707 = 4.0;
        }
        float _1719 = _1707;
        _1159 = _1719;
        if (_831)
        {
            _1709 = 0.1500000059604644775390625;
        }
        float _1721 = _1709;
        _1163 = _1721;
        if (_831)
        {
            _1675 = 0.23000000417232513427734375;
        }
        float _1723 = _1675;
        _1167 = _1723;
        if (_831)
        {
            _1171 = 0.4199999868869781494140625;
        }
    }
    _1175 = false;
    float _1725 = _1171;
    float _1727 = _1167;
    float _1729 = _1103;
    float _1731 = _1163;
    float _1733 = _1071;
    float _1735 = _1129;
    float _1737 = _1155;
    float _1739 = _925;
    float _1741 = _1159;
    float _1743 = _933;
    float _1745 = _1149;
    float _1747 = _935;
    float _1749 = _1141;
    float _1751 = _937;
    float _1753 = _745;
    float _1755 = _1173;
    float _1757 = _1151;
    float _1759 = _811 + _635;
    float _1761 = _541 + _1759;
    float _1763 = _1761 + _679;
    float _1765 = _1729;
    float _1767 = _1733;
    float _1769 = _1735;
    float _1771 = _1761;
    float _1773 = _1759;
    float _1775 = _1733;
    float _1777 = _1735;
    float _1779 = _1753;
    float _1781 = _1755;
    float _1783 = _1761;
    float _1785 = _1729;
    float _1787 = _1759;
    float _1789 = _1755;
    float _1791 = _1725;
    float _1793 = _1727;
    float _1795 = _1731;
    float _1797 = _1745;
    float _1799 = _1737;
    float _1801 = _1741;
    float _1803 = _1749;
    float _1805 = _1725;
    float _1807 = _1727;
    float _1809 = _1731;
    float _1811 = _1749;
    float _1813 = _1751;
    float _1815 = _1745;
    float _1817 = _1737;
    float _1819 = _1741;
    float _2025;
    float _2041;
    float _2075;
    float _2077;
    float _2079;
    if (!_701)
    {
        if (_831)
        {
            _661 = _1725;
        }
        float _1821 = _661;
        if (_831)
        {
            _1765 = 0.60000002384185791015625;
        }
        float _1823 = _1765;
        float _1825 = _1821;
        if (!_831)
        {
            float _1827 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _1825 = _1827;
        }
        float _1829 = _1825;
        if (_831)
        {
            _1767 = _1727;
        }
        float _1831 = _1767;
        float _1833 = _1823;
        if (!_831)
        {
            float _1835 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _1833 = _1835;
        }
        float _1837 = _1833;
        if (_831)
        {
            _1769 = _1731;
        }
        float _1839 = _1769;
        float _1841 = _1831;
        if (!_831)
        {
            float _1843 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _1841 = _1843;
        }
        float _1845 = _1841;
        float _1847 = _1839;
        if (!_831)
        {
            float _1849 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _1847 = _1849;
        }
        float _1851 = _1847;
        if (_831)
        {
            _1771 = _1725;
        }
        float _1853 = _1771;
        float _1855 = _535 * _1829;
        float _1857 = _1853;
        float _1859 = _1829;
        if (!_831)
        {
            _1857 = _1829;
        }
        float _1861 = _1857;
        float _1863 = _1861;
        if (_831)
        {
            _1859 = 0.60000002384185791015625;
        }
        float _1865 = _1859;
        float _1867 = _535 * _1837;
        float _1869 = _1865;
        if (!_831)
        {
            _1869 = _1837;
        }
        float _1871 = _1869;
        float _1873 = 1.0 / _1855;
        float _1875 = _535 * _1861;
        float _1877 = _535 * _1845;
        float _1879 = _1871;
        if (_831)
        {
            _1863 = _1727;
        }
        float _1881 = _1863;
        float _1883 = _1881;
        if (!_831)
        {
            _1883 = _1845;
        }
        float _1885 = _1883;
        float _1887 = _535 * _1851;
        float _1889 = 1.0 / _1867;
        float _1891 = _535 * _1885;
        float _1893 = 1.0 / _1877;
        float _1895 = _535 * _1871;
        if (_831)
        {
            _1879 = _1731;
        }
        float _1897 = _1879;
        float _1899 = _1897;
        if (!_831)
        {
            _1899 = _1851;
        }
        float _1901 = _1899;
        float _1903 = _1763 * 6.283184051513671875;
        float _1905 = 1.0 / _1887;
        float _1907 = _535 * _1901;
        float _1909 = _1873 * _1903;
        float _1911 = _1909 * 0.15915493667125701904296875;
        float _1913 = _1889 * _1903;
        float _1915 = 1.0 / _1875;
        float _1917 = _1913 * 0.15915493667125701904296875;
        float _1919 = _1893 * _1903;
        float _1921 = 1.0 / _1895;
        float _1923 = _1919 * 0.15915493667125701904296875;
        float _1925 = _1905 * _1903;
        float _1927 = 1.0 / _1891;
        float _1929 = _1759 * _1915;
        float _1931 = _1929 * 6.283184051513671875;
        float _1933 = 1.0 / _1907;
        float _1935 = _1931 * 0.15915493667125701904296875;
        float _1937 = _1911 * 6.283185482025146484375;
        float _1939 = sin(_1937);
        float _1941 = _1925 * 0.15915493667125701904296875;
        float _1943 = _1759 * _1921;
        float _1945 = _1943 * 6.283184051513671875;
        float _1947 = _1759 * _1927;
        float _1949 = _1935 * 6.283185482025146484375;
        float _1951 = sin(_1949);
        float _1953 = _1759 * _1933;
        float _1955 = _1945 * 0.15915493667125701904296875;
        float _1957 = _1947 * 6.283184051513671875;
        float _1959 = _1945;
        float _1961 = _1947;
        if (_831)
        {
            _1959 = _1737;
        }
        float _1963 = _1959;
        float _1965 = _1963;
        if (_831)
        {
            _1961 = _1737;
        }
        float _1967 = _1961;
        float _1969 = _1957 * 0.15915493667125701904296875;
        float _1971 = _1917 * 6.283185482025146484375;
        float _1973 = sin(_1971);
        float _1975 = _1953 * 6.283184051513671875;
        float _1977 = _1967;
        if (!_831)
        {
            _1965 = _1739;
        }
        float _1979 = _1965;
        float _1981 = _1979;
        if (!_831)
        {
            _1977 = _1739;
        }
        float _1983 = _1977;
        float _1985 = _1975 * 0.15915493667125701904296875;
        float _1987 = _1983;
        if (_831)
        {
            _1773 = _1741;
        }
        float _1989 = _1773;
        float _1991 = _1939 * _1979;
        float _1993 = _1955 * 6.283185482025146484375;
        float _1995 = sin(_1993);
        float _1997 = _1989;
        float _1999 = _1939;
        if (!_831)
        {
            _1997 = _1743;
        }
        float _2001 = _1997;
        float _2003 = _1951 * _1983;
        float _2005 = _2001;
        if (_831)
        {
            _1987 = _1741;
        }
        float _2007 = _1987;
        float _2009 = _2007;
        if (!_831)
        {
            _2009 = _1743;
        }
        float _2011 = _2009;
        if (_831)
        {
            _1999 = _1745;
        }
        float _2013 = _1999;
        float _2015 = _1923 * 6.283185482025146484375;
        float _2017 = sin(_2015);
        float _2019 = fma(_1973, _2001, _1991);
        float _2021 = _2013;
        float _2023 = _1973;
        _2025 = _2019;
        if (_831)
        {
            _2005 = _1745;
        }
        float _2027 = _2005;
        float _2029 = _2027;
        if (!_831)
        {
            _2021 = _1747;
        }
        float _2031 = _2021;
        if (!_831)
        {
            _2029 = _1747;
        }
        float _2033 = _2029;
        float _2035 = _1969 * 6.283185482025146484375;
        float _2037 = sin(_2035);
        float _2039 = fma(_1995, _2011, _2003);
        _2041 = _2039;
        if (_831)
        {
            _2023 = _1749;
        }
        float _2043 = _2023;
        float _2045 = _2043;
        if (_831)
        {
            _1981 = _1749;
        }
        float _2047 = _1981;
        float _2049 = _2047;
        if (!_831)
        {
            _2045 = _1751;
        }
        float _2051 = _2045;
        float _2053 = _1941 * 6.283185482025146484375;
        float _2055 = sin(_2053);
        if (!_831)
        {
            _2049 = _1751;
        }
        float _2057 = _2049;
        float _2059 = fma(_2017, _2031, _2019);
        float _2061 = _1985 * 6.283185482025146484375;
        float _2063 = sin(_2061);
        float _2065 = fma(_2037, _2033, _2039);
        float _2067 = fma(_2055, _2051, _2059);
        float _2069 = fma(_2063, _2057, _2065);
        float _2071 = -_2069;
        float _2073 = _2067 + _2071;
        _2075 = _2055;
        _2077 = _2069;
        _2079 = _2073;
        _2081 = true;
    }
    else
    {
        if (_831)
        {
            _1775 = _1725;
        }
        float _2083 = _1775;
        if (_831)
        {
            _1777 = 0.60000002384185791015625;
        }
        float _2085 = _1777;
        float _2087 = _2083;
        if (!_831)
        {
            float _2089 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _2087 = _2089;
        }
        float _2091 = _2087;
        if (_831)
        {
            _1779 = _1727;
        }
        float _2093 = _1779;
        float _2095 = _2085;
        if (!_831)
        {
            float _2097 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _2095 = _2097;
        }
        float _2099 = _2095;
        float _2101 = _2093;
        if (!_831)
        {
            float _2103 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _2101 = _2103;
        }
        float _2105 = _2101;
        if (_831)
        {
            _1781 = _1731;
        }
        float _2107 = _1781;
        float _2109 = _2107;
        if (!_831)
        {
            float _2111 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _2109 = _2111;
        }
        float _2113 = _2109;
        if (_831)
        {
            _1783 = _1725;
        }
        float _2115 = _1783;
        float _2117 = _635 * 6.283184051513671875;
        float _2119 = _2115;
        if (_831)
        {
            _1785 = _1725;
        }
        float _2121 = _1785;
        float _2123 = _2121;
        float _2125 = _2091;
        if (!_831)
        {
            _2119 = _2091;
        }
        float _2127 = _2119;
        float _2129 = _535 * _2091;
        float _2131 = _2127;
        if (!_831)
        {
            _2123 = _2091;
        }
        float _2133 = _2123;
        float _2135 = _535 * _2099;
        float _2137 = _535 * _2127;
        float _2139 = _2133;
        if (_831)
        {
            _2131 = _1725;
        }
        float _2141 = _2131;
        float _2143 = 1.0 / _2129;
        float _2145 = _2141;
        if (!_831)
        {
            _2145 = _2091;
        }
        float _2147 = _2145;
        float _2149 = _535 * _2105;
        float _2151 = _2147;
        if (_831)
        {
            _2125 = 0.60000002384185791015625;
        }
        float _2153 = _2125;
        float _2155 = _2153;
        if (!_831)
        {
            _2155 = _2099;
        }
        float _2157 = _2155;
        float _2159 = _535 * _2147;
        float _2161 = _2157;
        if (_831)
        {
            _2151 = 0.60000002384185791015625;
        }
        float _2163 = _2151;
        float _2165 = 1.0 / _2135;
        float _2167 = _2163;
        if (!_831)
        {
            _2167 = _2099;
        }
        float _2169 = _2167;
        float _2171 = _535 * _2113;
        float _2173 = 1.0 / _2149;
        float _2175 = _535 * _2133;
        float _2177 = _2169;
        if (_831)
        {
            _2139 = 0.60000002384185791015625;
        }
        float _2179 = _2139;
        float _2181 = _2179;
        if (!_831)
        {
            _2181 = _2099;
        }
        float _2183 = _2181;
        float _2185 = _535 * _2169;
        float _2187 = _2183;
        if (_831)
        {
            _2177 = _1727;
        }
        float _2189 = _2177;
        float _2191 = _2189;
        if (!_831)
        {
            _2191 = _2105;
        }
        float _2193 = _2191;
        float _2195 = _535 * _2157;
        float _2197 = _2193;
        if (_831)
        {
            _2161 = _1727;
        }
        float _2199 = _2161;
        float _2201 = _535 * _2183;
        float _2203 = _2199;
        if (!_831)
        {
            _2203 = _2105;
        }
        float _2205 = _2203;
        float _2207 = 1.0 / _2175;
        float _2209 = _2205;
        if (_831)
        {
            _2187 = _1727;
        }
        float _2211 = _2187;
        float _2213 = _2211;
        if (!_831)
        {
            _2213 = _2105;
        }
        float _2215 = _2213;
        float _2217 = _535 * _2193;
        float _2219 = _2215;
        if (_831)
        {
            _2197 = _1731;
        }
        float _2221 = _2197;
        float _2223 = _2221;
        if (!_831)
        {
            _2223 = _2113;
        }
        float _2225 = _2223;
        float _2227 = 1.0 / _2171;
        float _2229 = _535 * _2205;
        if (_831)
        {
            _2209 = _1731;
        }
        float _2231 = _2209;
        float _2233 = _2231;
        if (!_831)
        {
            _2233 = _2113;
        }
        float _2235 = _2233;
        float _2237 = 1.0 / _2137;
        float _2239 = _535 * _2215;
        if (_831)
        {
            _2219 = _1731;
        }
        float _2241 = _2219;
        float _2243 = _2241;
        if (!_831)
        {
            _2243 = _2113;
        }
        float _2245 = _2243;
        float _2247 = _1763 * 6.283184051513671875;
        float _2249 = 1.0 / _2159;
        float _2251 = _535 * _2245;
        float _2253 = 1.0 / _2201;
        float _2255 = 1.0 / _2185;
        float _2257 = _535 * _2235;
        float _2259 = _635 + _679;
        float _2261 = _2249 * _2117;
        float _2263 = 1.0 / _2239;
        float _2265 = _535 * _2225;
        float _2267 = _2143 * _2247;
        float _2269 = _2259 * 6.283184051513671875;
        float _2271 = _2207 * _2269;
        float _2273 = 1.0 / _2265;
        float _2275 = _2267 * 0.15915493667125701904296875;
        float _2277 = _2165 * _2247;
        float _2279 = _2261 * 0.15915493667125701904296875;
        float _2281 = _2253 * _2269;
        float _2283 = _2277 * 0.15915493667125701904296875;
        float _2285 = _2173 * _2247;
        float _2287 = 1.0 / _2217;
        float _2289 = _2271 * 0.15915493667125701904296875;
        float _2291 = _1759 * _2237;
        float _2293 = _2291 * 6.283184051513671875;
        float _2295 = 1.0 / _2251;
        float _2297 = _2293 * 0.15915493667125701904296875;
        float _2299 = _2263 * _2269;
        float _2301 = _2275 * 6.283185482025146484375;
        float _2303 = sin(_2301);
        float _2305 = _2285 * 0.15915493667125701904296875;
        float _2307 = _2227 * _2247;
        float _2309 = _2281 * 0.15915493667125701904296875;
        float _2311 = _2255 * _2117;
        float _2313 = _2299 * 0.15915493667125701904296875;
        float _2315 = _2299;
        float _2317 = _2311;
        if (_831)
        {
            _2315 = _1737;
        }
        float _2319 = _2315;
        float _2321 = _2287 * _2117;
        float _2323 = 1.0 / _2195;
        float _2325 = _2311 * 0.15915493667125701904296875;
        float _2327 = _2319;
        if (_831)
        {
            _2317 = _1737;
        }
        float _2329 = _2317;
        float _2331 = _2321 * 0.15915493667125701904296875;
        float _2333 = _2329;
        if (!_831)
        {
            _2333 = _1739;
        }
        float _2335 = _2333;
        float _2337 = _2295 * _2269;
        float _2339 = _2335;
        if (!_831)
        {
            _2327 = _1739;
        }
        float _2341 = _2327;
        float _2343 = _2307 * 0.15915493667125701904296875;
        float _2345 = _2289 * 6.283185482025146484375;
        float _2347 = sin(_2345);
        float _2349 = _2337 * 0.15915493667125701904296875;
        float _2351 = _2279 * 6.283185482025146484375;
        float _2353 = sin(_2351);
        float _2355 = _2303 * _2335;
        float _2357 = _2303;
        float _2359 = _2341;
        if (_831)
        {
            _2339 = _1737;
        }
        float _2361 = _2339;
        float _2363 = _1759 * _2323;
        float _2365 = _2361;
        float _2367 = _2363;
        if (_831)
        {
            _2357 = _1737;
        }
        float _2369 = _2357;
        float _2371 = _2369;
        if (!_831)
        {
            _2365 = _1739;
        }
        float _2373 = _2365;
        float _2375 = _2297 * 6.283185482025146484375;
        float _2377 = sin(_2375);
        float _2379 = _2373;
        if (!_831)
        {
            _2371 = _1739;
        }
        float _2381 = _2371;
        float _2383 = _2347 * _2341;
        if (_831)
        {
            _2359 = _1741;
        }
        float _2385 = _2359;
        float _2387 = _2385;
        if (!_831)
        {
            _2387 = _1743;
        }
        float _2389 = _2387;
        float _2391 = 1.0 / _2229;
        float _2393 = _2353 * _2373;
        if (_831)
        {
            _2379 = _1741;
        }
        float _2395 = _2379;
        float _2397 = _2395;
        if (!_831)
        {
            _2397 = _1743;
        }
        float _2399 = _2397;
        float _2401 = _2325 * 6.283185482025146484375;
        float _2403 = sin(_2401);
        float _2405 = _2377 * _2381;
        float _2407 = _2363 * 6.283184051513671875;
        if (_831)
        {
            _2367 = _1741;
        }
        float _2409 = _2367;
        float _2411 = _2409;
        if (!_831)
        {
            _2411 = _1743;
        }
        float _2413 = _2411;
        float _2415 = _2407 * 0.15915493667125701904296875;
        float _2417 = _2273 * _2117;
        float _2419 = _2309 * 6.283185482025146484375;
        float _2421 = sin(_2419);
        float _2423 = _1759 * _2391;
        float _2425 = _2417 * 0.15915493667125701904296875;
        float _2427 = 1.0 / _2257;
        float _2429 = fma(_2403, _2399, _2393);
        float _2431 = _2423 * 6.283184051513671875;
        float _2433 = _2423;
        float _2435 = _2431;
        if (_831)
        {
            _2433 = _1741;
        }
        float _2437 = _2433;
        float _2439 = _2437;
        if (!_831)
        {
            _2439 = _1743;
        }
        float _2441 = _2439;
        float _2443 = _2283 * 6.283185482025146484375;
        float _2445 = sin(_2443);
        float _2447 = fma(_2421, _2413, _2383);
        float _2449 = _2305 * 6.283185482025146484375;
        float _2451 = sin(_2449);
        float _2453 = _1759 * _2427;
        float _2455 = _2427;
        float _2457 = _2441;
        if (_831)
        {
            _2455 = _1745;
        }
        float _2459 = _2455;
        float _2461 = _2459;
        if (!_831)
        {
            _2461 = _1747;
        }
        float _2463 = _2461;
        float _2465 = _2453 * 6.283184051513671875;
        float _2467 = _2465;
        float _2469 = _2463;
        if (_831)
        {
            _1787 = _1745;
        }
        float _2471 = _1787;
        float _2473 = _2415 * 6.283185482025146484375;
        float _2475 = sin(_2473);
        float _2477 = fma(_2445, _2389, _2355);
        float _2479 = _2431 * 0.15915493667125701904296875;
        float _2481 = _2465 * 0.15915493667125701904296875;
        float _2483 = _2471;
        _2041 = _2481;
        if (_831)
        {
            _2435 = _1745;
        }
        float _2485 = _2435;
        float _2487 = _2485;
        if (!_831)
        {
            _2483 = _1747;
        }
        float _2489 = _2483;
        float _2491 = _2313 * 6.283185482025146484375;
        float _2493 = sin(_2491);
        float _2495 = fma(_2451, _2463, _2477);
        float _2497 = _2489;
        if (!_831)
        {
            _2487 = _1747;
        }
        float _2499 = _2487;
        float _2501 = _2499;
        if (_831)
        {
            _2467 = _1749;
        }
        float _2503 = _2467;
        float _2505 = _2503;
        if (_831)
        {
            _2469 = _1749;
        }
        float _2507 = _2469;
        float _2509 = _2331 * 6.283185482025146484375;
        float _2511 = sin(_2509);
        float _2513 = fma(_2475, _2441, _2405);
        float _2515 = _2507;
        _2077 = _2475;
        if (_831)
        {
            _2457 = _1745;
        }
        float _2517 = _2457;
        float _2519 = _2517;
        if (!_831)
        {
            _2519 = _1747;
        }
        float _2521 = _2519;
        if (!_831)
        {
            _2505 = _1751;
        }
        float _2523 = _2505;
        float _2525 = _2479 * 6.283185482025146484375;
        float _2527 = sin(_2525);
        float _2529 = fma(_2493, _2489, _2447);
        if (_831)
        {
            _2497 = _1749;
        }
        float _2531 = _2497;
        float _2533 = _2531;
        if (!_831)
        {
            _2533 = _1751;
        }
        float _2535 = _2533;
        if (!_831)
        {
            _2515 = _1751;
        }
        float _2537 = _2515;
        float _2539 = _2343 * 6.283185482025146484375;
        float _2541 = sin(_2539);
        float _2543 = fma(_2511, _2499, _2429);
        if (_831)
        {
            _2501 = _1749;
        }
        float _2545 = _2501;
        float _2547 = _2545;
        if (!_831)
        {
            _2547 = _1751;
        }
        float _2549 = _2547;
        float _2551 = _2349 * 6.283185482025146484375;
        float _2553 = sin(_2551);
        float _2555 = fma(_2527, _2521, _2513);
        float _2557 = _2425 * 6.283185482025146484375;
        float _2559 = sin(_2557);
        float _2561 = fma(_2541, _2523, _2495);
        float _2563 = _2481 * 6.283185482025146484375;
        float _2565 = sin(_2563);
        float _2567 = fma(_2553, _2535, _2529);
        float _2569 = fma(_2559, _2549, _2543);
        float _2571 = -_2567;
        float _2573 = _2571 + _2569;
        float _2575 = fma(_2565, _2537, _2555);
        float _2577 = -_2575;
        float _2579 = _2561 + _2577;
        float _2581 = _2579 + _2573;
        _2025 = _2579;
        _2075 = _2527;
        _1789 = _2567;
        _2079 = _2581;
    }
    _2081 = false;
    float _2583 = _2025;
    float _2585 = _2075;
    float _2587 = _2041;
    float _2589 = _2077;
    float _2591 = _1789;
    float _2593 = _2079;
    float _2595 = _811 + _637;
    float _2597 = _541 + _2595;
    float _2599 = _2597 + _679;
    float _2601 = _2597;
    float _2603 = _2583;
    float _2605 = _2585;
    float _2607 = _2587;
    float _2609 = _2585;
    float _2611 = _2589;
    float _2613 = _2591;
    float _2615 = _2597;
    float _2617 = _2583;
    float _2831;
    if (!_701)
    {
        if (_831)
        {
            _663 = _1725;
        }
        float _2619 = _663;
        if (_831)
        {
            _2601 = 0.60000002384185791015625;
        }
        float _2621 = _2601;
        if (_831)
        {
            _2603 = _1727;
        }
        float _2623 = _2603;
        float _2625 = _2619;
        if (!_831)
        {
            float _2627 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _2625 = _2627;
        }
        float _2629 = _2625;
        float _2631 = _2621;
        if (!_831)
        {
            float _2633 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _2631 = _2633;
        }
        float _2635 = _2631;
        if (_831)
        {
            _2605 = _1731;
        }
        float _2637 = _2605;
        float _2639 = _2623;
        if (!_831)
        {
            float _2641 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _2639 = _2641;
        }
        float _2643 = _2639;
        float _2645 = _2637;
        if (!_831)
        {
            float _2647 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _2645 = _2647;
        }
        float _2649 = _2645;
        float _2651 = _535 * _2629;
        float _2653 = _2629;
        if (!_831)
        {
            _1791 = _2629;
        }
        float _2655 = _1791;
        if (_831)
        {
            _2653 = 0.60000002384185791015625;
        }
        float _2657 = _2653;
        float _2659 = _535 * _2635;
        float _2661 = 1.0 / _2651;
        float _2663 = _535 * _2655;
        float _2665 = _2657;
        if (!_831)
        {
            _2665 = _2635;
        }
        float _2667 = _2665;
        float _2669 = _535 * _2643;
        if (!_831)
        {
            _1793 = _2643;
        }
        float _2671 = _1793;
        float _2673 = _2599 * 6.283184051513671875;
        float _2675 = _535 * _2649;
        float _2677 = 1.0 / _2659;
        if (!_831)
        {
            _1795 = _2649;
        }
        float _2679 = _1795;
        float _2681 = _535 * _2667;
        float _2683 = _535 * _2671;
        float _2685 = _535 * _2679;
        float _2687 = 1.0 / _2669;
        float _2689 = _2661 * _2673;
        float _2691 = _2689 * 0.15915493667125701904296875;
        float _2693 = 1.0 / _2675;
        float _2695 = _2677 * _2673;
        float _2697 = _2695 * 0.15915493667125701904296875;
        float _2699 = 1.0 / _2663;
        float _2701 = _2687 * _2673;
        float _2703 = 1.0 / _2681;
        float _2705 = 1.0 / _2683;
        float _2707 = _2595 * _2699;
        float _2709 = _2707 * 6.283184051513671875;
        float _2711 = 1.0 / _2685;
        float _2713 = _2701 * 0.15915493667125701904296875;
        float _2715 = _2693 * _2673;
        float _2717 = _2709 * 0.15915493667125701904296875;
        float _2719 = _2715 * 0.15915493667125701904296875;
        float _2721 = _2595 * _2703;
        float _2723 = _2691 * 6.283185482025146484375;
        float _2725 = sin(_2723);
        float _2727 = _2685;
        if (_831)
        {
            _2727 = _1745;
        }
        float _2729 = _2727;
        float _2731 = _2721 * 6.283184051513671875;
        float _2733 = _2595 * _2705;
        float _2735 = _2729;
        float _2737 = _2731;
        if (!_831)
        {
            _2735 = _1747;
        }
        float _2739 = _2735;
        if (!_831)
        {
            _1797 = _1747;
        }
        float _2741 = _1797;
        float _2743 = _2717 * 6.283185482025146484375;
        float _2745 = sin(_2743);
        float _2747 = _2731 * 0.15915493667125701904296875;
        float _2749 = _2733 * 6.283184051513671875;
        float _2751 = _2595 * _2711;
        float _2753 = _2749;
        if (_831)
        {
            _2737 = _1737;
        }
        float _2755 = _2737;
        float _2757 = _2749 * 0.15915493667125701904296875;
        float _2759 = _2751 * 6.283184051513671875;
        float _2761 = _2697 * 6.283185482025146484375;
        float _2763 = sin(_2761);
        float _2765 = _2755;
        if (!_831)
        {
            _2765 = _1739;
        }
        float _2767 = _2765;
        float _2769 = _2759 * 0.15915493667125701904296875;
        if (!_831)
        {
            _1799 = _1739;
        }
        float _2771 = _1799;
        float _2773 = _2771;
        if (_831)
        {
            _2753 = _1741;
        }
        float _2775 = _2753;
        float _2777 = _2725 * _2767;
        float _2779 = _2747 * 6.283185482025146484375;
        float _2781 = sin(_2779);
        float _2783 = _2775;
        if (!_831)
        {
            _2783 = _1743;
        }
        float _2785 = _2783;
        float _2787 = _2745 * _2771;
        if (!_831)
        {
            _1801 = _1743;
        }
        float _2789 = _1801;
        if (_831)
        {
            _2773 = _1749;
        }
        float _2791 = _2773;
        float _2793 = _2791;
        if (!_831)
        {
            _2793 = _1751;
        }
        float _2795 = _2793;
        float _2797 = _2713 * 6.283185482025146484375;
        float _2799 = sin(_2797);
        float _2801 = fma(_2763, _2785, _2777);
        if (!_831)
        {
            _1803 = _1751;
        }
        float _2803 = _1803;
        float _2805 = _2757 * 6.283185482025146484375;
        float _2807 = sin(_2805);
        float _2809 = fma(_2781, _2789, _2787);
        float _2811 = _2719 * 6.283185482025146484375;
        float _2813 = sin(_2811);
        float _2815 = fma(_2799, _2739, _2801);
        float _2817 = _2769 * 6.283185482025146484375;
        float _2819 = sin(_2817);
        float _2821 = fma(_2807, _2741, _2809);
        float _2823 = fma(_2813, _2795, _2815);
        float _2825 = fma(_2819, _2803, _2821);
        float _2827 = -_2825;
        float _2829 = _2823 + _2827;
        _2831 = _2829;
        _2833 = true;
    }
    else
    {
        if (_831)
        {
            _2607 = _1725;
        }
        float _2835 = _2607;
        if (_831)
        {
            _2609 = 0.60000002384185791015625;
        }
        float _2837 = _2609;
        float _2839 = _2835;
        if (!_831)
        {
            float _2841 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _2839 = _2841;
        }
        float _2843 = _2839;
        if (_831)
        {
            _2611 = _1727;
        }
        float _2845 = _2611;
        if (_831)
        {
            _2613 = _1731;
        }
        float _2847 = _2613;
        float _2849 = _2837;
        if (!_831)
        {
            float _2851 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _2849 = _2851;
        }
        float _2853 = _2849;
        float _2855 = _2845;
        if (!_831)
        {
            float _2857 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _2855 = _2857;
        }
        float _2859 = _2855;
        float _2861 = _2847;
        if (!_831)
        {
            float _2863 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _2861 = _2863;
        }
        float _2865 = _2861;
        if (_831)
        {
            _2615 = _1725;
        }
        float _2867 = _2615;
        float _2869 = _637 + _679;
        float _2871 = _2867;
        if (_831)
        {
            _2617 = _1725;
        }
        float _2873 = _2617;
        float _2875 = _2599 * 6.283184051513671875;
        float _2877 = _2873;
        if (!_831)
        {
            _2871 = _2843;
        }
        float _2879 = _2871;
        float _2881 = _535 * _2843;
        float _2883 = _2879;
        if (!_831)
        {
            _2877 = _2843;
        }
        float _2885 = _2877;
        float _2887 = _535 * _2853;
        float _2889 = _535 * _2879;
        float _2891 = _2885;
        if (_831)
        {
            _2883 = 0.60000002384185791015625;
        }
        float _2893 = _2883;
        float _2895 = _535 * _2885;
        float _2897 = _2893;
        if (!_831)
        {
            _2897 = _2853;
        }
        float _2899 = _2897;
        float _2901 = 1.0 / _2887;
        float _2903 = _2899;
        if (!_831)
        {
            _1805 = _2843;
        }
        float _2905 = _1805;
        float _2907 = _535 * _2859;
        if (_831)
        {
            _2891 = 0.60000002384185791015625;
        }
        float _2909 = _2891;
        float _2911 = _535 * _2865;
        float _2913 = _2909;
        if (!_831)
        {
            _2913 = _2853;
        }
        float _2915 = _2913;
        float _2917 = _535 * _2905;
        float _2919 = 1.0 / _2889;
        float _2921 = _535 * _2899;
        float _2923 = _2915;
        if (_831)
        {
            _2903 = 0.60000002384185791015625;
        }
        float _2925 = _2903;
        float _2927 = _2925;
        if (!_831)
        {
            _2927 = _2853;
        }
        float _2929 = _2927;
        float _2931 = 1.0 / _2907;
        float _2933 = 1.0 / _2911;
        float _2935 = _535 * _2915;
        float _2937 = _2929;
        if (_831)
        {
            _2923 = _1727;
        }
        float _2939 = _2923;
        float _2941 = _2939;
        if (!_831)
        {
            _2941 = _2859;
        }
        float _2943 = _2941;
        float _2945 = 1.0 / _2917;
        float _2947 = _535 * _2929;
        if (_831)
        {
            _2937 = _1727;
        }
        float _2949 = _2937;
        float _2951 = _2949;
        if (!_831)
        {
            _1807 = _2859;
        }
        float _2953 = _1807;
        float _2955 = _2953;
        if (!_831)
        {
            _2951 = _2859;
        }
        float _2957 = _2951;
        float _2959 = _2869 * 6.283184051513671875;
        float _2961 = 1.0 / _2881;
        float _2963 = _535 * _2953;
        float _2965 = _2957;
        if (_831)
        {
            _2955 = _1731;
        }
        float _2967 = _2955;
        float _2969 = _535 * _2943;
        float _2971 = _2967;
        if (!_831)
        {
            _2971 = _2865;
        }
        float _2973 = _2971;
        float _2975 = _535 * _2957;
        float _2977 = _2919 * _2959;
        if (_831)
        {
            _2965 = _1731;
        }
        float _2979 = _2965;
        float _2981 = 1.0 / _2895;
        float _2983 = _637 * 6.283184051513671875;
        float _2985 = _2979;
        float _2987 = _2983;
        if (!_831)
        {
            _2985 = _2865;
        }
        float _2989 = _2985;
        float _2991 = _2977 * 0.15915493667125701904296875;
        if (!_831)
        {
            _1809 = _2865;
        }
        float _2993 = _1809;
        float _2995 = _2945 * _2983;
        float _2997 = 1.0 / _2935;
        float _2999 = _2995 * 0.15915493667125701904296875;
        float _3001 = 1.0 / _2947;
        float _3003 = _535 * _2989;
        float _3005 = _2595 * _2981;
        float _3007 = _3005 * 6.283184051513671875;
        float _3009 = 1.0 / _2975;
        float _3011 = _535 * _2973;
        float _3013 = _2997 * _2959;
        float _3015 = _3007 * 0.15915493667125701904296875;
        float _3017 = _2997;
        float _3019 = _3015;
        if (_831)
        {
            _3017 = _1749;
        }
        float _3021 = _3017;
        float _3023 = _3021;
        if (!_831)
        {
            _3023 = _1751;
        }
        float _3025 = _3023;
        float _3027 = 1.0 / _3011;
        float _3029 = _535 * _2993;
        float _3031 = _2961 * _2875;
        float _3033 = _3031 * 0.15915493667125701904296875;
        float _3035 = _2901 * _2875;
        float _3037 = 1.0 / _3029;
        float _3039 = _3013 * 0.15915493667125701904296875;
        float _3041 = _3001 * _2983;
        float _3043 = _3035 * 0.15915493667125701904296875;
        float _3045 = _2931 * _2875;
        float _3047 = _3041 * 0.15915493667125701904296875;
        float _3049 = _3009 * _2959;
        float _3051 = 1.0 / _2921;
        float _3053 = _3045 * 0.15915493667125701904296875;
        float _3055 = _2933 * _2875;
        float _3057 = _3049 * 0.15915493667125701904296875;
        float _3059 = _3027 * _2959;
        float _3061 = _3009;
        float _3063 = _3027;
        if (_831)
        {
            _3061 = _1749;
        }
        float _3065 = _3061;
        float _3067 = _3055 * 0.15915493667125701904296875;
        float _3069 = _3065;
        if (_831)
        {
            _3063 = _1749;
        }
        float _3071 = _3063;
        float _3073 = 1.0 / _2963;
        float _3075 = _3059 * 0.15915493667125701904296875;
        float _3077 = _3037 * _2983;
        float _3079 = _3071;
        float _3081 = _3037;
        float _3083 = _3073;
        if (!_831)
        {
            _3069 = _1751;
        }
        float _3085 = _3069;
        if (!_831)
        {
            _3079 = _1751;
        }
        float _3087 = _3079;
        float _3089 = _3077 * 0.15915493667125701904296875;
        if (!_831)
        {
            _1811 = _1751;
        }
        float _3091 = _1811;
        float _3093 = 1.0 / _2969;
        float _3095 = _2595 * _3051;
        float _3097 = _3051;
        if (_831)
        {
            _1813 = _1737;
        }
        float _3099 = _1813;
        float _3101 = _3099;
        if (_831)
        {
            _3097 = _1737;
        }
        float _3103 = _3097;
        float _3105 = _3095 * 6.283184051513671875;
        float _3107 = _3103;
        float _3109 = _3105;
        if (!_831)
        {
            _3101 = _1739;
        }
        float _3111 = _3101;
        float _3113 = 1.0 / _3003;
        float _3115 = _3105 * 0.15915493667125701904296875;
        if (!_831)
        {
            _3107 = _1739;
        }
        float _3117 = _3107;
        if (_831)
        {
            _3109 = _1741;
        }
        float _3119 = _3109;
        float _3121 = _3119;
        if (!_831)
        {
            _3121 = _1743;
        }
        float _3123 = _3121;
        float _3125 = _2991 * 6.283185482025146484375;
        float _3127 = sin(_3125);
        float _3129 = _2595 * _3093;
        if (_831)
        {
            _3081 = _1745;
        }
        float _3131 = _3081;
        float _3133 = _3131;
        if (!_831)
        {
            _3133 = _1747;
        }
        float _3135 = _3133;
        float _3137 = _3129 * 6.283184051513671875;
        float _3139 = _2595 * _3113;
        float _3141 = _3073 * _2983;
        float _3143 = _3033 * 6.283185482025146484375;
        float _3145 = sin(_3143);
        float _3147 = _3137;
        if (_831)
        {
            _2987 = _1745;
        }
        float _3149 = _2987;
        float _3151 = _3139 * 6.283184051513671875;
        float _3153 = _3141 * 0.15915493667125701904296875;
        float _3155 = _3149;
        float _3157 = _3153;
        if (_831)
        {
            _3083 = _1745;
        }
        float _3159 = _3083;
        float _3161 = _3151 * 0.15915493667125701904296875;
        float _3163 = _3159;
        if (!_831)
        {
            _3155 = _1747;
        }
        float _3165 = _3155;
        float _3167 = _2999 * 6.283185482025146484375;
        float _3169 = sin(_3167);
        if (!_831)
        {
            _3163 = _1747;
        }
        float _3171 = _3163;
        if (!_831)
        {
            _1815 = _1747;
        }
        float _3173 = _1815;
        float _3175 = _3015 * 6.283185482025146484375;
        float _3177 = sin(_3175);
        float _3179 = _3145 * _3111;
        float _3181 = _3153 * 6.283185482025146484375;
        float _3183 = sin(_3181);
        if (_831)
        {
            _3019 = _1741;
        }
        float _3185 = _3019;
        float _3187 = _3185;
        if (!_831)
        {
            _3187 = _1743;
        }
        float _3189 = _3187;
        float _3191 = _3043 * 6.283185482025146484375;
        float _3193 = sin(_3191);
        if (_831)
        {
            _3157 = _1737;
        }
        float _3195 = _3157;
        float _3197 = _3177 * _3117;
        float _3199 = _3195;
        if (!_831)
        {
            _3199 = _1739;
        }
        float _3201 = _3199;
        if (!_831)
        {
            _1817 = _1739;
        }
        float _3203 = _1817;
        float _3205 = _3137 * 0.15915493667125701904296875;
        if (_831)
        {
            _3147 = _1741;
        }
        float _3207 = _3147;
        float _3209 = _3039 * 6.283185482025146484375;
        float _3211 = sin(_3209);
        float _3213 = _3207;
        if (!_831)
        {
            _3213 = _1743;
        }
        float _3215 = _3213;
        float _3217 = _3127 * _3201;
        if (!_831)
        {
            _1819 = _1743;
        }
        float _3219 = _1819;
        float _3221 = _3169 * _3203;
        float _3223 = _3047 * 6.283185482025146484375;
        float _3225 = sin(_3223);
        float _3227 = fma(_3193, _3215, _3179);
        float _3229 = _3115 * 6.283185482025146484375;
        float _3231 = sin(_3229);
        float _3233 = fma(_3211, _3123, _3217);
        float _3235 = _3053 * 6.283185482025146484375;
        float _3237 = sin(_3235);
        float _3239 = fma(_3225, _3219, _3221);
        float _3241 = fma(_3183, _3173, _3239);
        float _3243 = _3057 * 6.283185482025146484375;
        float _3245 = sin(_3243);
        float _3247 = fma(_3231, _3189, _3197);
        float _3249 = _3205 * 6.283185482025146484375;
        float _3251 = sin(_3249);
        float _3253 = fma(_3237, _3165, _3227);
        float _3255 = _3067 * 6.283185482025146484375;
        float _3257 = sin(_3255);
        float _3259 = fma(_3245, _3135, _3233);
        float _3261 = _3075 * 6.283185482025146484375;
        float _3263 = sin(_3261);
        float _3265 = fma(_3251, _3171, _3247);
        float _3267 = _3089 * 6.283185482025146484375;
        float _3269 = sin(_3267);
        float _3271 = fma(_3257, _3085, _3253);
        float _3273 = _3161 * 6.283185482025146484375;
        float _3275 = sin(_3273);
        float _3277 = fma(_3263, _3087, _3259);
        float _3279 = fma(_3269, _3091, _3241);
        float _3281 = -_3277;
        float _3283 = _3281 + _3279;
        float _3285 = fma(_3275, _3025, _3265);
        float _3287 = -_3285;
        float _3289 = _3271 + _3287;
        float _3291 = _3289 + _3283;
        _2831 = _3291;
    }
    _2833 = false;
    float _3293 = _2831;
    float _3295 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _3297 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _3299 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _3301 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _3303 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _3305 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    uint _3307 = uint(int(uint(_179) >> uint(2)));
    float _3309 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_3307)]);
    float _3311 = fma(_551, _1757, _813);
    float _3313 = fma(_553, _2593, _783);
    float _3315 = fma(_555, _3293, _815);
    bool _3317 = _3295 > 0.0;
    bool _3319 = _3297 > 0.0;
    float _3321 = _3299 * _3297;
    float _3323 = _541 * _3305;
    float _3325 = _3295;
    float _3327 = _3299;
    bool _3329 = _3319;
    if (_3317)
    {
        float _3331 = 1.0 / _3295;
        _3325 = _3331;
    }
    float _3333 = _3325;
    if (_3319)
    {
        float _3335 = -_3321;
        float _3337 = fma(_269, _3335, _3299);
        _3327 = _3337;
    }
    float _3339 = _3327;
    float _3341 = _541 * _3303;
    float _3343 = _3339;
    if (_3317)
    {
        float _3345 = _671 * _3333;
        _675 = _3345;
    }
    float _3347 = _675;
    float _3349 = _3347;
    if (_3317)
    {
        float _3351 = precise::min(_3347, 1.0);
        _3349 = _3351;
    }
    float _3353 = _3349;
    if (_3317)
    {
        float _3355 = _3353 * _3339;
        _3343 = _3355;
    }
    float _3357 = _3343;
    float _3359 = _541 * _3301;
    float _3361 = _3341 * _3357;
    float _3363 = _3359 * _3357;
    float _3365 = _3323 * _3357;
    bool _3367 = !_177;
    float _3369 = _3363;
    float _3371 = _3365;
    float _3493;
    if (!_3367)
    {
        float _3373 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _3375 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _3377 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _3379 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _3381 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _3383 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _3385 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _3387 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _3389 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _3391 = _3377 * _3379;
        float _3393 = _3377 * _3381;
        float _3395 = _3375 * _3379;
        float _3397 = -_3391;
        float _3399 = fma(_3373, _3383, _3397);
        float _3401 = -_3393;
        float _3403 = fma(_3375, _3383, _3401);
        float _3405 = -_3395;
        float _3407 = fma(_3373, _3381, _3405);
        float _3409 = _3387 * _3373;
        float _3411 = _3387 * _3399;
        float _3413 = _3389 * _3375;
        float _3415 = _3385 * _3381;
        float _3417 = -_3409;
        float _3419 = fma(_3385, _3375, _3417);
        float _3421 = -_3411;
        float _3423 = fma(_3385, _3403, _3421);
        float _3425 = _3387 * _3383;
        float _3427 = _3389 * _3379;
        float _3429 = _3385 * _3377;
        float _3431 = fma(_3389, _3407, _3423);
        float _3433 = -_3425;
        float _3435 = fma(_3389, _3381, _3433);
        float _3437 = -_3427;
        float _3439 = fma(_3385, _3383, _3437);
        float _3441 = -_3415;
        float _3443 = fma(_3387, _3379, _3441);
        float _3445 = -_3429;
        float _3447 = fma(_3389, _3373, _3445);
        float _3449 = -_3373;
        float _3451 = fma(_3449, _3383, _3391);
        float _3453 = 1.0 / _3431;
        float _3455 = -_3413;
        float _3457 = fma(_3387, _3377, _3455);
        float _3459 = _3435 * _3453;
        float _3461 = _3439 * _3453;
        float _3463 = _3443 * _3453;
        float _3465 = _3363 * _3453;
        float _3467 = _3361 * _3459;
        float _3469 = _3361 * _3461;
        float _3471 = _3451 * _3453;
        float _3473 = _3361 * _3463;
        float _3475 = _3457 * _3453;
        float _3477 = fma(_3403, _3465, _3467);
        float _3479 = _3447 * _3453;
        float _3481 = fma(_3363, _3471, _3469);
        float _3483 = _3419 * _3453;
        float _3485 = fma(_3407, _3465, _3473);
        float _3487 = fma(_3365, _3475, _3477);
        float _3489 = fma(_3365, _3479, _3481);
        float _3491 = fma(_3365, _3483, _3485);
        _3369 = _3487;
        _3493 = _3489;
        _3371 = _3491;
        _3495 = true;
    }
    else
    {
        int _3497 = as_type<int>(_155) & 1024;
        bool _3499 = _3497 != 0;
        if (_3499)
        {
            _3329 = true;
        }
        bool _3501 = _3329;
        bool _3503 = _3501;
        if (!_3499)
        {
            int _3505 = as_type<int>(_155) & 2048;
            bool _3507 = _3505 != 0;
            _3503 = _3507;
        }
        bool _3509 = _3503;
        if (!_3509)
        {
            _605 = _3361;
        }
        float _3511 = _605;
        bool _3513 = !_3509;
        _3493 = _3511;
        if (!_3513)
        {
            uint _3515 = uint(int(uint(_157) >> uint(2)));
            float _3517 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3515)]);
            int _3519 = _157 + 4;
            uint _3521 = uint(int(uint(_3519) >> uint(2)));
            float _3523 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3521)]);
            int _3525 = _157 + 8;
            uint _3527 = uint(int(uint(_3525) >> uint(2)));
            float _3529 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3527)]);
            uint _3531 = uint(int(uint(_157) >> uint(2)));
            float _3533 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3531)]);
            int _3535 = _157 + 4;
            uint _3537 = uint(int(uint(_3535) >> uint(2)));
            float _3539 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3537)]);
            int _3541 = _157 + 8;
            uint _3543 = uint(int(uint(_3541) >> uint(2)));
            float _3545 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3543)]);
            uint _3547 = uint(int(uint(_157) >> uint(2)));
            float _3549 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3547)]);
            int _3551 = _157 + 4;
            uint _3553 = uint(int(uint(_3551) >> uint(2)));
            float _3555 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3553)]);
            int _3557 = _157 + 8;
            uint _3559 = uint(int(uint(_3557) >> uint(2)));
            float _3561 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3559)]);
            float _3563 = _3529 * _3533;
            float _3565 = _3529 * _3539;
            float _3567 = _3523 * _3533;
            float _3569 = -_3563;
            float _3571 = fma(_3517, _3545, _3569);
            float _3573 = -_3565;
            float _3575 = fma(_3523, _3545, _3573);
            float _3577 = -_3567;
            float _3579 = fma(_3517, _3539, _3577);
            float _3581 = _3555 * _3517;
            float _3583 = _3555 * _3571;
            float _3585 = _3561 * _3523;
            float _3587 = _3549 * _3539;
            float _3589 = -_3581;
            float _3591 = fma(_3549, _3523, _3589);
            float _3593 = -_3583;
            float _3595 = fma(_3549, _3575, _3593);
            float _3597 = _3555 * _3545;
            float _3599 = _3561 * _3533;
            float _3601 = _3549 * _3529;
            float _3603 = fma(_3561, _3579, _3595);
            float _3605 = -_3597;
            float _3607 = fma(_3561, _3539, _3605);
            float _3609 = -_3599;
            float _3611 = fma(_3549, _3545, _3609);
            float _3613 = -_3587;
            float _3615 = fma(_3555, _3533, _3613);
            float _3617 = -_3601;
            float _3619 = fma(_3561, _3517, _3617);
            float _3621 = -_3517;
            float _3623 = fma(_3621, _3545, _3563);
            float _3625 = 1.0 / _3603;
            float _3627 = -_3585;
            float _3629 = fma(_3555, _3529, _3627);
            float _3631 = _3607 * _3625;
            float _3633 = _3611 * _3625;
            float _3635 = _3615 * _3625;
            float _3637 = _3363 * _3625;
            float _3639 = _3361 * _3631;
            float _3641 = _3361 * _3633;
            float _3643 = _3623 * _3625;
            float _3645 = _3361 * _3635;
            float _3647 = _3629 * _3625;
            float _3649 = fma(_3575, _3637, _3639);
            float _3651 = _3619 * _3625;
            float _3653 = fma(_3363, _3643, _3641);
            float _3655 = _3591 * _3625;
            float _3657 = fma(_3579, _3637, _3645);
            float _3659 = fma(_3365, _3647, _3649);
            float _3661 = fma(_3365, _3651, _3653);
            float _3663 = fma(_3365, _3655, _3657);
            _3369 = _3659;
            _3493 = _3661;
            _3371 = _3663;
        }
    }
    _3495 = false;
    float _3665 = _3369;
    float _3667 = _3493;
    float _3669 = _3371;
    float _3671 = _3311 + _3665;
    float _3673 = _3313 + _3667;
    int _3675 = _157 + 4;
    float _3677 = _3315 + _3669;
    int _3679 = _157 + 8;
    uint _3681 = uint(int(uint(_179) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3681)] = as_type<uint>(_3309);
    float _3683 = -_161;
    float _3685 = _3683 + _3671;
    float _3687 = -_167;
    float _3689 = _3687 + _3673;
    uint _3691 = uint(int(uint(_157) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3691)] = as_type<uint>(_3671);
    float _3693 = -_173;
    float _3695 = _3693 + _3677;
    uint _3697 = uint(int(uint(_3675) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3697)] = as_type<uint>(_3673);
    uint _3699 = uint(int(uint(_3679) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3699)] = as_type<uint>(_3677);
    uint _3701 = uint(int(uint(_157) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3701)] = as_type<uint>(_789);
    uint _3703 = uint(int(uint(_3675) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3703)] = as_type<uint>(_791);
    uint _3705 = uint(int(uint(_3679) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3705)] = as_type<uint>(_793);
    uint _3707 = uint(int(uint(_157) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3707)] = as_type<uint>(_3685);
    uint _3709 = uint(int(uint(_3675) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3709)] = as_type<uint>(_3689);
    uint _3711 = uint(int(uint(_3679) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3711)] = as_type<uint>(_3695);
    float _3713 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _3715 = _3689 * _3689;
    float _3717 = _791 * _791;
    float _3719 = fma(_3685, _3685, _3715);
    float _3721 = fma(_789, _789, _3717);
    float _3723 = fma(_3695, _3695, _3719);
    float _3725 = fma(_793, _793, _3721);
    float _3727 = sqrt(_3725);
    float _3729 = sqrt(_3723);
    bool _3731 = _3729 >= 9.9999999747524270787835121154785e-07;
    bool _3733 = isnan(_3729);
    bool _3735 = _3731 || _3733;
    bool _3737 = isnan(9.9999999747524270787835121154785e-07);
    bool _3739 = _3735 || _3737;
    if (!_3739)
    {
        bool _3741 = _547 != _289;
        bool _3743 = isnan(_547);
        bool _3745 = _3741 || _3743;
        bool _3747 = isnan(_289);
        bool _3749 = _3745 || _3747;
        _3751 = _3749;
        if (!_3751)
        {
            float _3753 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _3755 = _3753 > 0.0;
            bool _3757 = !_3755;
            if (!_3757)
            {
                float _3759 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _3761 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _3763 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _3765 = _3761 * _511;
                float _3767 = _3761 * _509;
                float _3769 = _3761 * _513;
                float _3771 = fma(_3759, _517, _3765);
                float _3773 = fma(_3759, _515, _3767);
                float _3775 = fma(_3759, _519, _3769);
                float _3777 = fma(_3763, _523, _3771);
                float _3779 = fma(_3763, _521, _3773);
                float _3781 = fma(_3763, _525, _3775);
                float _3783 = _3777 * _3777;
                float _3785 = fma(_3779, _3779, _3783);
                float _3787 = fma(_3781, _3781, _3785);
                float _3789 = rsqrt(_3787);
                float _3791 = _3789 * 9.9999999747524270787835121154785e-07;
                float _3793 = _3779 * _3791;
                float _3795 = _3777 * _3791;
                float _3797 = _3781 * _3791;
                _329 = as_type<int>(_3793);
                _331 = as_type<int>(_3795);
                _333 = as_type<int>(_3797);
                _3751 = true;
            }
            else
            {
                bool _3799 = _3727 >= 9.9999999747524270787835121154785e-07;
                bool _3801 = isnan(_3727);
                bool _3803 = _3799 || _3801;
                bool _3805 = isnan(9.9999999747524270787835121154785e-07);
                bool _3807 = _3803 || _3805;
                if (!_3807)
                {
                    float _3809 = _3673 * _3673;
                    float _3811 = fma(_3671, _3671, _3809);
                    float _3813 = fma(_3677, _3677, _3811);
                    float _3815 = sqrt(_3813);
                    bool _3817 = _3815 >= 9.9999999747524270787835121154785e-07;
                    bool _3819 = isnan(_3815);
                    bool _3821 = _3817 || _3819;
                    bool _3823 = isnan(9.9999999747524270787835121154785e-07);
                    bool _3825 = _3821 || _3823;
                    float _3827 = _3815;
                    if (_3825)
                    {
                        float _3829 = rsqrt(_3813);
                        _3827 = _3829;
                    }
                    float _3831 = _3827;
                    if (!_3825)
                    {
                        _317 = 0;
                    }
                    int _3833 = _317;
                    int _3835 = _3833;
                    if (!_3825)
                    {
                        _319 = 897988541;
                    }
                    int _3837 = _319;
                    int _3839 = _3837;
                    if (!_3825)
                    {
                        _321 = 0;
                    }
                    int _3841 = _321;
                    float _3843 = _3831;
                    int _3845 = _3841;
                    if (_3825)
                    {
                        float _3847 = _3831 * 9.9999999747524270787835121154785e-07;
                        _3843 = _3847;
                    }
                    float _3849 = _3843;
                    if (_3825)
                    {
                        float _3851 = _3671 * _3849;
                        _3835 = as_type<int>(_3851);
                    }
                    int _3853 = _3835;
                    _329 = _3853;
                    if (_3825)
                    {
                        float _3855 = _3673 * _3849;
                        _3839 = as_type<int>(_3855);
                    }
                    int _3857 = _3839;
                    _331 = _3857;
                    if (_3825)
                    {
                        float _3859 = _3677 * _3849;
                        _3845 = as_type<int>(_3859);
                    }
                    int _3861 = _3845;
                    _333 = _3861;
                    _3751 = true;
                }
                else
                {
                    float _3863 = rsqrt(_3725);
                    float _3865 = _3863 * 9.9999999747524270787835121154785e-07;
                    float _3867 = _789 * _3865;
                    float _3869 = _791 * _3865;
                    float _3871 = _793 * _3865;
                    _329 = as_type<int>(_3867);
                    _331 = as_type<int>(_3869);
                    _333 = as_type<int>(_3871);
                    _3751 = true;
                }
            }
        }
    }
    else
    {
        float _3873 = _3727 * _3713;
        bool _3875 = _3873 >= 0.001000000047497451305389404296875;
        bool _3877 = isnan(_3873);
        bool _3879 = _3875 || _3877;
        bool _3881 = isnan(0.001000000047497451305389404296875);
        bool _3883 = _3879 || _3881;
        bool _3885 = _3873 > 0.0;
        bool _3887 = !_3883;
        bool _3889 = _3885 && _3887;
        bool _3891 = _3729 < 0.001000000047497451305389404296875;
        bool _3893 = _3891 && _3889;
        if (!_3893)
        {
            _323 = as_type<int>(_3685);
        }
        int _3895 = _323;
        int _3897 = _3895;
        if (_3893)
        {
            float _3899 = _789 * _3713;
            _3897 = as_type<int>(_3899);
        }
        int _3901 = _3897;
        _329 = _3901;
        if (!_3893)
        {
            _325 = as_type<int>(_3689);
        }
        int _3903 = _325;
        int _3905 = _3903;
        if (_3893)
        {
            float _3907 = _791 * _3713;
            _3905 = as_type<int>(_3907);
        }
        int _3909 = _3905;
        _331 = _3909;
        if (!_3893)
        {
            _327 = as_type<int>(_3695);
        }
        int _3911 = _327;
        _333 = _3911;
        if (_3893)
        {
            float _3913 = _793 * _3713;
            _333 = as_type<int>(_3913);
        }
    }
    _3751 = false;
    int _3915 = _329;
    int _3917 = _331;
    int _3919 = _333;
    uint _3921 = uint(int(uint(_157) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3921)] = uint(_3915);
    uint _3923 = uint(int(uint(_3675) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3923)] = uint(_3917);
    uint _3925 = uint(int(uint(_3679) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3925)] = uint(_3919);
}

