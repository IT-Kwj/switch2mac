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
    bool _1423 = false;
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
    int _145 = _66 << 4;
    float _147 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _149 = _145 + 12;
    float _151 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    uint _153 = uint(int(uint(_149) >> uint(2)));
    float _155 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_153)]);
    uint _157 = uint(int(uint(_145) >> uint(2)));
    float _159 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_157)]);
    int _161 = _145 + 4;
    uint _163 = uint(int(uint(_161) >> uint(2)));
    float _165 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_163)]);
    int _167 = _145 + 8;
    uint _169 = uint(int(uint(_167) >> uint(2)));
    float _171 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_169)]);
    uint _173 = uint(int(uint(_145) >> uint(2)));
    float _175 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_173)]);
    int _177 = _145 + 4;
    uint _179 = uint(int(uint(_177) >> uint(2)));
    float _181 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_179)]);
    int _183 = _145 + 8;
    uint _185 = uint(int(uint(_183) >> uint(2)));
    float _187 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_185)]);
    float _189 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _191 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _193 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _195 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    uint _197 = uint(int(uint(_149) >> uint(2)));
    float _199 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_197)]);
    float _201 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _203 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _205 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    int _207 = as_type<int>(_147) & 512;
    bool _209 = _207 != 0;
    uint _211 = uint(int(uint(_149) >> uint(2)));
    float _213 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_211)]);
    float _215 = 0.0;
    float _217 = 0.0;
    float _219 = 0.0;
    float _221 = 0.0;
    if (_209)
    {
        float _223 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _225 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _227 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _229 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _215 = _223;
        _217 = _225;
        _219 = _227;
        _221 = _229;
    }
    float _231 = _215;
    float _233 = _217;
    float _235 = _219;
    float _237 = _221;
    float _239 = 0.0;
    float _241 = 0.0;
    float _243 = 0.0;
    float _245 = 0.0;
    if (_209)
    {
        float _247 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _249 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _251 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _253 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _239 = _247;
        _241 = _249;
        _243 = _251;
        _245 = _253;
    }
    float _255 = _239;
    float _257 = _241;
    float _259 = _243;
    float _261 = _245;
    float _263 = 0.0;
    float _265 = 0.0;
    float _267 = 0.0;
    float _269 = 0.0;
    if (_209)
    {
        float _271 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _273 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _275 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _277 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _263 = _271;
        _265 = _273;
        _267 = _275;
        _269 = _277;
    }
    float _279 = _263;
    float _281 = _265;
    float _283 = _267;
    float _285 = _269;
    float _287 = _155 * _151;
    float _289 = _165 * _287;
    float _291 = _159 * _287;
    float _293 = _181 + _289;
    float _295 = _171 * _287;
    float _297 = _175 + _291;
    float _299 = _187 + _295;
    float _301 = _195;
    int _303 = as_type<int>(_291);
    int _305 = as_type<int>(_295);
    int _307 = as_type<int>(_291);
    int _309 = as_type<int>(_295);
    if (!_209)
    {
        _301 = 0.0;
    }
    float _311 = _301;
    float _313 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[16]);
    float _315 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[17]);
    float _317 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[18]);
    float _319 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[13]);
    float _321 = 0.0;
    float _323 = _257;
    float _325 = _231;
    float _327 = _255;
    float _329 = _235;
    float _331 = _311;
    float _333 = _259;
    float _335 = _279;
    float _337 = _285;
    if (_209)
    {
        float _339 = _293 * _233;
        _321 = _339;
    }
    float _341 = _321;
    if (_209)
    {
        float _343 = _293 * _257;
        _323 = _343;
    }
    float _345 = _323;
    float _347 = _345;
    if (_209)
    {
        float _349 = fma(_297, _231, _341);
        _325 = _349;
    }
    float _351 = _325;
    float _353 = _351;
    if (_209)
    {
        float _355 = fma(_297, _255, _345);
        _347 = _355;
    }
    float _357 = _347;
    if (_209)
    {
        float _359 = _293 * _281;
        _327 = _359;
    }
    float _361 = _327;
    float _363 = _361;
    if (_209)
    {
        float _365 = fma(_299, _235, _351);
        _353 = _365;
    }
    float _367 = _353;
    if (_209)
    {
        float _369 = fma(_297, _279, _361);
        _329 = _369;
    }
    float _371 = _329;
    float _373 = _371;
    if (_209)
    {
        float _375 = fma(_299, _283, _371);
        _373 = _375;
    }
    float _377 = _373;
    if (!_209)
    {
        _363 = 0.0;
    }
    float _379 = _363;
    float _381 = _379;
    if (_209)
    {
        float _383 = _237 + _367;
        _381 = _383;
    }
    float _385 = _381;
    if (_209)
    {
        float _387 = _285 + _377;
        _331 = _387;
    }
    float _389 = _331;
    uint _391 = uint(int(uint(_145) >> uint(2)));
    float _393 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_391)]);
    int _395 = _145 + 4;
    uint _397 = uint(int(uint(_395) >> uint(2)));
    float _399 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_397)]);
    int _401 = _145 + 8;
    uint _403 = uint(int(uint(_401) >> uint(2)));
    float _405 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_403)]);
    int _407 = _145 + 12;
    uint _409 = uint(int(uint(_407) >> uint(2)));
    float _411 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_409)]);
    int _413 = as_type<int>(_147) & 1024;
    bool _415 = _413 != 0;
    float _417 = _389;
    if (_209)
    {
        float _419 = fma(_299, _259, _357);
        _333 = _419;
    }
    float _421 = _333;
    if (!_209)
    {
        _335 = 0.0;
    }
    float _423 = _335;
    int _425 = as_type<int>(_147) & 2048;
    bool _427 = _425 != 0;
    float _429 = _423;
    bool _431 = _427;
    if (_209)
    {
        float _433 = _261 + _421;
        _429 = _433;
    }
    float _435 = _429;
    float _437 = _411;
    float _439 = _435;
    int _441 = as_type<int>(_399);
    int _443 = as_type<int>(_399);
    int _445 = as_type<int>(_399);
    if (!_415)
    {
        _437 = _385;
    }
    float _447 = _437;
    bool _449 = !_415;
    float _451 = _447;
    if (!_449)
    {
        float _453 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        uint _455 = uint(int(uint(_145) >> uint(2)));
        float _457 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_455)]);
        int _459 = _145 + 4;
        uint _461 = uint(int(uint(_459) >> uint(2)));
        float _463 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_461)]);
        int _465 = _145 + 8;
        uint _467 = uint(int(uint(_465) >> uint(2)));
        float _469 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_467)]);
        int _471 = _145 + 12;
        uint _473 = uint(int(uint(_471) >> uint(2)));
        float _475 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_473)]);
        uint _477 = uint(int(uint(_145) >> uint(2)));
        float _479 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_477)]);
        int _481 = _145 + 4;
        uint _483 = uint(int(uint(_481) >> uint(2)));
        float _485 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_483)]);
        int _487 = _145 + 8;
        uint _489 = uint(int(uint(_487) >> uint(2)));
        float _491 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_489)]);
        uint _493 = uint(int(uint(_145) >> uint(2)));
        float _495 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_493)]);
        int _497 = _145 + 4;
        uint _499 = uint(int(uint(_497) >> uint(2)));
        float _501 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_499)]);
        int _503 = _145 + 8;
        uint _505 = uint(int(uint(_503) >> uint(2)));
        float _507 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_505)]);
        float _509 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        float _511 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _513 = _293 * _463;
        float _515 = _293 * _485;
        float _517 = fma(_297, _457, _513);
        float _519 = _293 * _501;
        float _521 = fma(_297, _479, _515);
        float _523 = fma(_297, _495, _519);
        float _525 = fma(_299, _469, _517);
        float _527 = fma(_299, _491, _521);
        float _529 = fma(_299, _507, _523);
        float _531 = _453 + _525;
        float _533 = _509 + _527;
        float _535 = _511 + _529;
        _439 = _531;
        _337 = _475;
        _451 = _533;
        _417 = _535;
    }
    float _537 = _439;
    float _539 = _337;
    float _541 = _451;
    float _543 = _417;
    bool _545 = !_427;
    float _547 = _537;
    float _549 = _541;
    float _551 = _543;
    float _553 = _539;
    if (!_545)
    {
        uint _555 = uint(int(uint(_145) >> uint(2)));
        float _557 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_555)]);
        int _559 = _145 + 4;
        uint _561 = uint(int(uint(_559) >> uint(2)));
        float _563 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_561)]);
        int _565 = _145 + 8;
        uint _567 = uint(int(uint(_565) >> uint(2)));
        float _569 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_567)]);
        int _571 = _145 + 12;
        uint _573 = uint(int(uint(_571) >> uint(2)));
        float _575 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_573)]);
        uint _577 = uint(int(uint(_145) >> uint(2)));
        float _579 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_577)]);
        int _581 = _145 + 4;
        uint _583 = uint(int(uint(_581) >> uint(2)));
        float _585 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_583)]);
        int _587 = _145 + 8;
        uint _589 = uint(int(uint(_587) >> uint(2)));
        float _591 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_589)]);
        int _593 = _145 + 12;
        uint _595 = uint(int(uint(_593) >> uint(2)));
        float _597 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_595)]);
        uint _599 = uint(int(uint(_145) >> uint(2)));
        float _601 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_599)]);
        int _603 = _145 + 4;
        uint _605 = uint(int(uint(_603) >> uint(2)));
        float _607 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_605)]);
        int _609 = _145 + 8;
        uint _611 = uint(int(uint(_609) >> uint(2)));
        float _613 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_611)]);
        int _615 = _145 + 12;
        uint _617 = uint(int(uint(_615) >> uint(2)));
        float _619 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_617)]);
        float _621 = _293 * _563;
        float _623 = _293 * _585;
        float _625 = _293 * _607;
        float _627 = fma(_297, _557, _621);
        float _629 = fma(_297, _579, _623);
        float _631 = fma(_297, _601, _625);
        float _633 = fma(_299, _569, _627);
        float _635 = fma(_299, _591, _629);
        float _637 = fma(_299, _613, _631);
        float _639 = _633 + _575;
        float _641 = _635 + _597;
        float _643 = _637 + _619;
        _547 = _641;
        _549 = _639;
        _551 = _643;
        _553 = _597;
    }
    float _645 = _547;
    float _647 = _549;
    float _649 = _551;
    float _651 = _553;
    float _653 = -_645;
    float _655 = _315 + _653;
    float _657 = -_647;
    float _659 = _313 + _657;
    float _661 = -_649;
    float _663 = _317 + _661;
    float _665 = _655 * _655;
    float _667 = fma(_659, _659, _665);
    float _669 = -_213;
    float _671 = _201 + _669;
    float _673 = fma(_663, _663, _667);
    bool _675 = _671 > 0.001000000047497451305389404296875;
    bool _677 = isnan(_671);
    bool _679 = _675 || _677;
    bool _681 = isnan(0.001000000047497451305389404296875);
    bool _683 = _679 || _681;
    float _685 = sqrt(_673);
    float _687 = _663;
    float _689 = 0.0;
    float _691 = 0.0;
    float _693 = 0.0;
    if (!_683)
    {
        bool _695 = _685 > _319;
        float _697 = float(_695);
        _687 = _697;
    }
    float _699 = _687;
    bool _701 = !_683;
    float _703 = _699;
    if (!_701)
    {
        float _705 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[20]);
        float _707 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[21]);
        float _709 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[22]);
        float _711 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[24]);
        float _713 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[25]);
        float _715 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[26]);
        float _717 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[28]);
        float _719 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[29]);
        float _721 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[30]);
        float _723 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[31]);
        uint _725 = uint(int(uint(_149) >> uint(2)));
        float _727 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_725)]);
        bool _729 = _685 > _319;
        float _731 = -_645;
        float _733 = _707 + _731;
        float _735 = -_647;
        float _737 = _705 + _735;
        float _739 = -_649;
        float _741 = _709 + _739;
        float _743 = -_645;
        float _745 = _713 + _743;
        float _747 = _733 * _733;
        float _749 = -_647;
        float _751 = _711 + _749;
        float _753 = -_649;
        float _755 = _715 + _753;
        float _757 = -_645;
        float _759 = _719 + _757;
        float _761 = _745 * _745;
        float _763 = -_647;
        float _765 = _717 + _763;
        float _767 = fma(_737, _737, _747);
        float _769 = _759 * _759;
        float _771 = fma(_751, _751, _761);
        float _773 = -_649;
        float _775 = _721 + _773;
        float _777 = fma(_741, _741, _767);
        float _779 = fma(_765, _765, _769);
        float _781 = fma(_755, _755, _771);
        float _783 = _647;
        int _785 = as_type<int>(_765);
        int _787 = as_type<int>(_775);
        int _789 = as_type<int>(_723);
        if (!_729)
        {
            float _791 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[12]);
            _783 = _791;
        }
        float _793 = _783;
        float _795 = sqrt(_777);
        float _797 = fma(_775, _775, _779);
        float _799 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[14]);
        float _801 = sqrt(_781);
        float _803 = sqrt(_797);
        bool _805 = _795 > _319;
        bool _807 = _801 > _319;
        float _809 = _651;
        if (!_805)
        {
            float _811 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[12]);
            _809 = _811;
        }
        float _813 = _809;
        bool _815 = _803 > _319;
        float _817 = _319;
        if (!_807)
        {
            float _819 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[12]);
            _817 = _819;
        }
        float _821 = _817;
        float _823 = _147;
        if (!_815)
        {
            float _825 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[12]);
            _823 = _825;
        }
        float _827 = _823;
        int _829 = as_type<int>(_727) << 24;
        int _831 = _829 >> 24;
        float _833 = float(_831);
        float _835 = _833 * 0.0078740157186985015869140625;
        float _837 = precise::min(_835, 1.0);
        float _839 = precise::max(_837, -1.0);
        int _841 = as_type<int>(_727) << 16;
        int _843 = as_type<int>(_727) << 8;
        bool _845 = _839 > 0.0;
        bool _847 = _845 || _729;
        int _849 = _841 >> 24;
        int _851 = _843 >> 24;
        int _853 = _849;
        if (!_729)
        {
            bool _855 = _839 >= 0.0;
            bool _857 = isnan(_839);
            bool _859 = _855 || _857;
            bool _861 = isnan(0.0);
            bool _863 = _859 || _861;
            _431 = _863;
        }
        bool _865 = _431;
        float _867 = float(_849);
        int _869 = as_type<int>(_727) >> 24;
        bool _871 = _865;
        if (!_729)
        {
            int _873 = _865 ? 0 : 1;
            _785 = _873;
        }
        int _875 = _785;
        float _877 = _867 * 0.0078740157186985015869140625;
        float _879 = float(_851);
        float _881 = float(_869);
        float _883 = _879;
        if (!_729)
        {
            int _885 = ~_875;
            int _887 = _885 + 1;
            int _889 = _887 + 1;
            _853 = _889;
        }
        int _891 = _853;
        int _893 = _891;
        if (!_847)
        {
            int _895 = ~_875;
            int _897 = _895 + 1;
            _893 = _897;
        }
        int _899 = _893;
        float _901 = _881 * 0.0078740157186985015869140625;
        float _903 = precise::min(_877, 1.0);
        int _905 = _899;
        int _907 = as_type<int>(_903);
        if (!_729)
        {
            float _909 = float(_899);
            _905 = as_type<int>(_909);
        }
        int _911 = _905;
        float _913 = precise::max(_903, -1.0);
        float _915 = precise::min(_901, 1.0);
        float _917 = precise::max(_915, -1.0);
        bool _919 = _913 > 0.0;
        bool _921 = _919 || _805;
        int _923 = as_type<int>(_915);
        int _925 = _911;
        bool _927 = _921;
        if (!_729)
        {
            bool _929 = _685 >= _793;
            bool _931 = isnan(_685);
            bool _933 = _929 || _931;
            bool _935 = isnan(_793);
            bool _937 = _933 || _935;
            _871 = _937;
        }
        bool _939 = _871;
        float _941 = _879 * 0.0078740157186985015869140625;
        bool _943 = _939;
        if (_729)
        {
            _883 = 1.0;
        }
        float _945 = _883;
        float _947 = precise::min(_941, 1.0);
        float _949 = _945;
        int _951 = as_type<int>(_947);
        if (!_729)
        {
            float _953 = _939 ? as_type<float>(_911) : (-1.0);
            _949 = _953;
        }
        float _955 = _949;
        float _957 = precise::max(_947, -1.0);
        if (!_805)
        {
            bool _959 = _913 >= 0.0;
            bool _961 = isnan(_913);
            bool _963 = _959 || _961;
            bool _965 = isnan(0.0);
            bool _967 = _963 || _965;
            _943 = _967;
        }
        bool _969 = _943;
        bool _971 = false;
        if (!_807)
        {
            bool _973 = _957 >= 0.0;
            bool _975 = isnan(_957);
            bool _977 = _973 || _975;
            bool _979 = isnan(0.0);
            bool _981 = _977 || _979;
            _971 = _981;
        }
        bool _983 = _971;
        bool _985 = _983;
        if (!_805)
        {
            int _987 = _969 ? 0 : 1;
            _951 = _987;
        }
        int _989 = _951;
        bool _991 = _957 > 0.0;
        bool _993 = _991 || _807;
        bool _995 = _917 > 0.0;
        bool _997 = _995 || _815;
        bool _999 = _993;
        bool _1001 = _997;
        float _1003 = as_type<float>(_989);
        if (!_807)
        {
            int _1005 = _983 ? 0 : 1;
            _907 = _1005;
        }
        int _1007 = _907;
        float _1009 = as_type<float>(_1007);
        if (!_815)
        {
            bool _1011 = _917 >= 0.0;
            bool _1013 = isnan(_917);
            bool _1015 = _1011 || _1013;
            bool _1017 = isnan(0.0);
            bool _1019 = _1015 || _1017;
            _985 = _1019;
        }
        bool _1021 = _985;
        float _1023 = 1.0 / _799;
        int _1025 = as_type<int>(_799);
        if (!_815)
        {
            int _1027 = _1021 ? 0 : 1;
            _923 = _1027;
        }
        int _1029 = _923;
        if (!_805)
        {
            int _1031 = ~_989;
            int _1033 = _1031 + 1;
            int _1035 = _1033 + 1;
            _925 = _1035;
        }
        int _1037 = _925;
        int _1039 = _1037;
        if (!_807)
        {
            int _1041 = ~_1007;
            int _1043 = _1041 + 1;
            int _1045 = _1043 + 1;
            _787 = _1045;
        }
        int _1047 = _787;
        int _1049 = _1047;
        if (!_815)
        {
            int _1051 = ~_1029;
            int _1053 = _1051 + 1;
            int _1055 = _1053 + 1;
            _789 = _1055;
        }
        int _1057 = _789;
        int _1059 = _1057;
        if (!_921)
        {
            int _1061 = ~_989;
            int _1063 = _1061 + 1;
            _1039 = _1063;
        }
        int _1065 = _1039;
        float _1067 = as_type<float>(_1065);
        if (!_993)
        {
            int _1069 = ~_1007;
            int _1071 = _1069 + 1;
            _1049 = _1071;
        }
        int _1073 = _1049;
        int _1075 = _1073;
        if (!_997)
        {
            int _1077 = ~_1029;
            int _1079 = _1077 + 1;
            _1059 = _1079;
        }
        int _1081 = _1059;
        int _1083 = _1081;
        if (!_805)
        {
            bool _1085 = _795 >= _813;
            bool _1087 = isnan(_795);
            bool _1089 = _1085 || _1087;
            bool _1091 = isnan(_813);
            bool _1093 = _1089 || _1091;
            _927 = _1093;
        }
        bool _1095 = _927;
        if (!_807)
        {
            bool _1097 = _801 >= _821;
            bool _1099 = isnan(_801);
            bool _1101 = _1097 || _1099;
            bool _1103 = isnan(_821);
            bool _1105 = _1101 || _1103;
            _999 = _1105;
        }
        bool _1107 = _999;
        if (!_815)
        {
            bool _1109 = _803 >= _827;
            bool _1111 = isnan(_803);
            bool _1113 = _1109 || _1111;
            bool _1115 = isnan(_827);
            bool _1117 = _1113 || _1115;
            _1001 = _1117;
        }
        bool _1119 = _1001;
        if (!_805)
        {
            float _1121 = float(_1065);
            _1025 = as_type<int>(_1121);
        }
        int _1123 = _1025;
        if (!_807)
        {
            float _1125 = float(_1073);
            _1075 = as_type<int>(_1125);
        }
        int _1127 = _1075;
        if (!_815)
        {
            float _1129 = float(_1081);
            _1083 = as_type<int>(_1129);
        }
        int _1131 = _1083;
        if (_805)
        {
            _1009 = 1.0;
        }
        float _1133 = _1009;
        float _1135 = _1133;
        if (_807)
        {
            _1003 = 1.0;
        }
        float _1137 = _1003;
        float _1139 = _1137;
        if (_815)
        {
            _1067 = 1.0;
        }
        float _1141 = _1067;
        float _1143 = _1141;
        if (!_805)
        {
            float _1145 = _1095 ? as_type<float>(_1123) : (-1.0);
            _1135 = _1145;
        }
        float _1147 = _1135;
        float _1149 = _151 * _1023;
        if (!_807)
        {
            float _1151 = _1107 ? as_type<float>(_1127) : (-1.0);
            _1139 = _1151;
        }
        float _1153 = _1139;
        if (!_815)
        {
            float _1155 = _1119 ? as_type<float>(_1131) : (-1.0);
            _1143 = _1155;
        }
        float _1157 = _1143;
        float _1159 = abs(_839);
        float _1161 = fma(_1149, _955, _1159);
        float _1163 = precise::clamp(_1161, 0.0, 1.0);
        float _1165 = abs(_913);
        float _1167 = fma(_1149, _1147, _1165);
        float _1169 = precise::clamp(_1167, 0.0, 1.0);
        float _1171 = abs(_957);
        float _1173 = fma(_1149, _1153, _1171);
        float _1175 = precise::clamp(_1173, 0.0, 1.0);
        float _1177 = abs(_917);
        float _1179 = fma(_1149, _1157, _1177);
        float _1181 = precise::clamp(_1179, 0.0, 1.0);
        float _1183 = _1163 * _955;
        float _1185 = _1169 * _1147;
        float _1187 = _1175 * _1153;
        float _1189 = _1181 * _1157;
        _703 = _1183;
        _689 = _1185;
        _691 = _1187;
        _693 = _1189;
    }
    float _1191 = _703;
    float _1193 = _689;
    float _1195 = _691;
    float _1197 = _693;
    float _1199 = precise::min(_1191, 1.0);
    float _1201 = abs(_205);
    float _1203 = log2(_1201);
    float _1205 = precise::max(_1199, -1.0);
    float _1207 = precise::min(_1193, 1.0);
    float _1209 = _1205 * 127.0;
    float _1211 = precise::max(_1207, -1.0);
    float _1213 = precise::min(_1195, 1.0);
    float _1215 = precise::min(_1197, 1.0);
    float _1217 = _1211 * 127.0;
    float _1219 = precise::max(_1213, -1.0);
    float _1221 = rint(_1209);
    int _1223 = int(_1221);
    float _1225 = precise::max(_1215, -1.0);
    float _1227 = _151 * _1203;
    float _1229 = _151 * _203;
    float _1231 = _1219 * 127.0;
    float _1233 = _1225 * 127.0;
    float _1235 = _189 * _1229;
    float _1237 = rint(_1217);
    int _1239 = int(_1237);
    float _1241 = _191 * _1229;
    float _1243 = _193 * _1229;
    float _1245 = rint(_1231);
    int _1247 = int(_1245);
    uint _1249 = extract_bits(uint(_1223), 0u, 8u);
    int _1251 = int(_1249) & 255;
    float _1253 = rint(_1233);
    int _1255 = int(_1253);
    uint _1257 = extract_bits(uint(_1251), 0u, 8u);
    int _1259 = int(_1257) & 255;
    uint _1261 = extract_bits(uint(_1239), 0u, 8u);
    int _1263 = int(_1261) & 255;
    int _1265 = _1263 << 8;
    int _1267 = _1259 | _1265;
    uint _1269 = extract_bits(uint(_1251), 16u, 8u);
    int _1271 = int(_1269) & 255;
    int _1273 = _1271 << 16;
    int _1275 = _1267 | _1273;
    uint _1277 = extract_bits(uint(_1251), 24u, 8u);
    int _1279 = int(_1277) & 255;
    int _1281 = _1279 << 24;
    int _1283 = _1275 | _1281;
    float _1285 = exp2(_1227);
    uint _1287 = extract_bits(uint(_1283), 0u, 8u);
    int _1289 = int(_1287) & 255;
    uint _1291 = extract_bits(uint(_1283), 8u, 8u);
    int _1293 = int(_1291) & 255;
    int _1295 = _1293 << 8;
    int _1297 = _1289 | _1295;
    uint _1299 = extract_bits(uint(_1247), 0u, 8u);
    int _1301 = int(_1299) & 255;
    int _1303 = _1301 << 16;
    int _1305 = _1297 | _1303;
    uint _1307 = extract_bits(uint(_1283), 24u, 8u);
    int _1309 = int(_1307) & 255;
    int _1311 = _1309 << 24;
    int _1313 = _1305 | _1311;
    uint _1315 = extract_bits(uint(_1313), 0u, 8u);
    int _1317 = int(_1315) & 255;
    uint _1319 = extract_bits(uint(_1313), 8u, 8u);
    int _1321 = int(_1319) & 255;
    int _1323 = _1321 << 8;
    int _1325 = _1317 | _1323;
    uint _1327 = extract_bits(uint(_1313), 16u, 8u);
    int _1329 = int(_1327) & 255;
    int _1331 = _1329 << 16;
    int _1333 = _1325 | _1331;
    uint _1335 = extract_bits(uint(_1255), 0u, 8u);
    int _1337 = int(_1335) & 255;
    int _1339 = _1337 << 24;
    int _1341 = _1333 | _1339;
    uint _1343 = uint(int(uint(_149) >> uint(2)));
    (*spvDescriptorSet0.cp_s10)._m0[int(_1343)] = uint(_1341);
    float _1345 = fma(_165, _1285, _1241);
    float _1347 = fma(_159, _1285, _1235);
    int _1349 = _145 + 4;
    uint _1351 = uint(int(uint(_149) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1351)] = as_type<uint>(_199);
    int _1353 = _145 + 8;
    float _1355 = fma(_171, _1285, _1243);
    uint _1357 = uint(int(uint(_145) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1357)] = as_type<uint>(_297);
    uint _1359 = uint(int(uint(_1349) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1359)] = as_type<uint>(_293);
    uint _1361 = uint(int(uint(_1353) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1361)] = as_type<uint>(_299);
    uint _1363 = uint(int(uint(_145) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1363)] = as_type<uint>(_1347);
    uint _1365 = uint(int(uint(_1349) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1365)] = as_type<uint>(_1345);
    uint _1367 = uint(int(uint(_1353) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1367)] = as_type<uint>(_1355);
    uint _1369 = uint(int(uint(_145) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1369)] = as_type<uint>(_291);
    uint _1371 = uint(int(uint(_1349) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1371)] = as_type<uint>(_289);
    uint _1373 = uint(int(uint(_1353) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1373)] = as_type<uint>(_295);
    float _1375 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1377 = _289 * _289;
    float _1379 = _1345 * _1345;
    float _1381 = fma(_291, _291, _1377);
    float _1383 = fma(_1347, _1347, _1379);
    float _1385 = fma(_295, _295, _1381);
    float _1387 = fma(_1355, _1355, _1383);
    float _1389 = sqrt(_1387);
    float _1391 = sqrt(_1385);
    bool _1393 = _1391 >= 9.9999999747524270787835121154785e-07;
    bool _1395 = isnan(_1391);
    bool _1397 = _1393 || _1395;
    bool _1399 = isnan(9.9999999747524270787835121154785e-07);
    bool _1401 = _1397 || _1399;
    float _1403 = _1345;
    int _1419;
    if (!_1401)
    {
        bool _1405 = _201 != _213;
        bool _1407 = isnan(_201);
        bool _1409 = _1405 || _1407;
        bool _1411 = isnan(_213);
        bool _1413 = _1409 || _1411;
        if (_1413)
        {
            _303 = as_type<int>(_393);
        }
        int _1415 = _303;
        int _1417 = _1415;
        _1419 = _1415;
        if (_1413)
        {
            _305 = as_type<int>(_405);
        }
        int _1421 = _305;
        _309 = _1421;
        _1423 = _1413;
        if (!_1423)
        {
            float _1425 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _1427 = _1425 > 0.0;
            bool _1429 = !_1427;
            if (!_1429)
            {
                float _1431 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _1433 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _1435 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _1437 = _1433 * _1433;
                float _1439 = fma(_1431, _1431, _1437);
                float _1441 = fma(_1435, _1435, _1439);
                float _1443 = rsqrt(_1441);
                float _1445 = _1443 * 9.9999999747524270787835121154785e-07;
                float _1447 = _1431 * _1445;
                float _1449 = _1433 * _1445;
                float _1451 = _1435 * _1445;
                _1419 = as_type<int>(_1447);
                _445 = as_type<int>(_1449);
                _309 = as_type<int>(_1451);
                _1423 = true;
            }
            else
            {
                bool _1453 = _1389 >= 9.9999999747524270787835121154785e-07;
                bool _1455 = isnan(_1389);
                bool _1457 = _1453 || _1455;
                bool _1459 = isnan(9.9999999747524270787835121154785e-07);
                bool _1461 = _1457 || _1459;
                if (!_1461)
                {
                    float _1463 = _293 * _293;
                    float _1465 = fma(_297, _297, _1463);
                    float _1467 = fma(_299, _299, _1465);
                    float _1469 = sqrt(_1467);
                    bool _1471 = _1469 >= 9.9999999747524270787835121154785e-07;
                    bool _1473 = isnan(_1469);
                    bool _1475 = _1471 || _1473;
                    bool _1477 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1479 = _1475 || _1477;
                    int _1481 = as_type<int>(_1469);
                    if (_1479)
                    {
                        float _1483 = rsqrt(_1467);
                        _1481 = as_type<int>(_1483);
                    }
                    int _1485 = _1481;
                    if (!_1479)
                    {
                        _1417 = 0;
                    }
                    int _1487 = _1417;
                    int _1489 = _1487;
                    if (!_1479)
                    {
                        _441 = 897988541;
                    }
                    int _1491 = _441;
                    int _1493 = _1485;
                    int _1495 = _1491;
                    if (_1479)
                    {
                        float _1497 = as_type<float>(_1485) * 9.9999999747524270787835121154785e-07;
                        _1403 = _1497;
                    }
                    float _1499 = _1403;
                    if (!_1479)
                    {
                        _1493 = 0;
                    }
                    int _1501 = _1493;
                    int _1503 = _1501;
                    if (_1479)
                    {
                        float _1505 = _297 * _1499;
                        _1489 = as_type<int>(_1505);
                    }
                    int _1507 = _1489;
                    _1419 = _1507;
                    if (_1479)
                    {
                        float _1509 = _293 * _1499;
                        _1495 = as_type<int>(_1509);
                    }
                    int _1511 = _1495;
                    _445 = _1511;
                    if (_1479)
                    {
                        float _1513 = _299 * _1499;
                        _1503 = as_type<int>(_1513);
                    }
                    int _1515 = _1503;
                    _309 = _1515;
                    _1423 = true;
                }
                else
                {
                    float _1517 = rsqrt(_1387);
                    float _1519 = _1517 * 9.9999999747524270787835121154785e-07;
                    float _1521 = _1347 * _1519;
                    float _1523 = _1345 * _1519;
                    float _1525 = _1355 * _1519;
                    _1419 = as_type<int>(_1521);
                    _445 = as_type<int>(_1523);
                    _309 = as_type<int>(_1525);
                    _1423 = true;
                }
            }
        }
    }
    else
    {
        float _1527 = _1389 * _1375;
        bool _1529 = _1527 >= 0.001000000047497451305389404296875;
        bool _1531 = isnan(_1527);
        bool _1533 = _1529 || _1531;
        bool _1535 = isnan(0.001000000047497451305389404296875);
        bool _1537 = _1533 || _1535;
        bool _1539 = _1527 > 0.0;
        bool _1541 = !_1537;
        bool _1543 = _1539 && _1541;
        bool _1545 = _1391 < 0.001000000047497451305389404296875;
        bool _1547 = _1545 && _1543;
        if (!_1547)
        {
            _443 = as_type<int>(_289);
        }
        int _1549 = _443;
        int _1551 = _1549;
        if (_1547)
        {
            float _1553 = _1347 * _1375;
            _307 = as_type<int>(_1553);
        }
        int _1555 = _307;
        _1419 = _1555;
        if (_1547)
        {
            float _1557 = _1345 * _1375;
            _1551 = as_type<int>(_1557);
        }
        int _1559 = _1551;
        _445 = _1559;
        if (_1547)
        {
            float _1561 = _1355 * _1375;
            _309 = as_type<int>(_1561);
        }
    }
    _1423 = false;
    int _1563 = _1419;
    int _1565 = _445;
    int _1567 = _309;
    uint _1569 = uint(int(uint(_145) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1569)] = uint(_1563);
    uint _1571 = uint(int(uint(_1349) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1571)] = uint(_1565);
    uint _1573 = uint(int(uint(_1353) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1573)] = uint(_1567);
}

