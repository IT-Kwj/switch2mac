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
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _639 = false;
    float _49 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _51 = as_type<float>(gl_LocalInvocationID.x);
    float _53 = as_type<float>(gl_WorkGroupID.x);
    int _56 = as_type<int>(_53) << 5;
    int _58 = _56 + as_type<int>(_51);
    float _60 = trunc(_49);
    int _62 = int(_60);
    bool _66 = _58 >= _62;
    int _68 = 0;
    if (_66)
    {
        _68 = 0;
    }
    int _70 = _68;
    int _72 = _70;
    int _74 = _70;
    if (!_66)
    {
        int _76 = _58 << 4;
        int _78 = _76 + 12;
        uint _81 = uint(int(uint(_78) >> uint(2)));
        float _83 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_81)]);
        float _85 = trunc(_83);
        int _87 = int(_85);
        bool _89 = _87 >= 1;
        int _91 = _89 ? (-1) : 0;
        if (!_89)
        {
            _72 = 0;
        }
        int _93 = _72;
        bool _95 = !_89;
        _74 = _93;
        if (!_95)
        {
            float _97 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _99 = uint(int(uint(_78) >> uint(2)));
            float _101 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_99)]);
            float _103 = float(_87);
            float _105 = -_101;
            float _107 = _97 + _105;
            bool _109 = _107 > _103;
            int _111 = as_type<int>(_97);
            if (!_109)
            {
                bool _113 = _97 >= _101;
                bool _115 = isnan(_97);
                bool _117 = _113 || _115;
                bool _119 = isnan(_101);
                bool _121 = _117 || _119;
                _91 = _121 ? (-1) : 0;
            }
            int _123 = _91;
            if (_109)
            {
                _111 = 0;
            }
            int _125 = _111;
            _74 = _125;
            if (!_109)
            {
                int _127 = ~_123;
                int _129 = (_127 != 0) ? 0 : 1;
                _74 = _129;
            }
        }
    }
    int _131 = _74;
    int _133 = _131 & 1;
    bool _135 = _133 != 0;
    if (!_135)
    {
        return;
    }
    int _137 = _58 << 4;
    float _139 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[50]);
    int _141 = _137 + 12;
    uint _143 = uint(int(uint(_137) >> uint(2)));
    float _145 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_143)]);
    int _147 = _137 + 4;
    uint _149 = uint(int(uint(_147) >> uint(2)));
    float _151 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_149)]);
    int _153 = _137 + 8;
    uint _155 = uint(int(uint(_153) >> uint(2)));
    float _157 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_155)]);
    float _159 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    uint _161 = uint(int(uint(_137) >> uint(2)));
    float _163 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_161)]);
    int _165 = _137 + 4;
    uint _167 = uint(int(uint(_165) >> uint(2)));
    float _169 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_167)]);
    int _171 = _137 + 8;
    uint _173 = uint(int(uint(_171) >> uint(2)));
    float _175 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_173)]);
    uint _177 = uint(int(uint(_141) >> uint(2)));
    float _179 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_177)]);
    float _181 = trunc(_139);
    int _183 = int(_181);
    float _185 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[68]);
    uint _187 = uint(int(uint(_141) >> uint(2)));
    float _189 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_187)]);
    bool _191 = _183 != 0;
    bool _193 = _183 != 1;
    bool _195 = _183 != 2;
    float _197 = _145 * _159;
    uint _199 = uint(int(uint(_137) >> uint(2)));
    float _201 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_199)]);
    int _203 = _137 + 4;
    uint _205 = uint(int(uint(_203) >> uint(2)));
    float _207 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_205)]);
    int _209 = _137 + 8;
    uint _211 = uint(int(uint(_209) >> uint(2)));
    float _213 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_211)]);
    int _215 = _137 + 12;
    uint _217 = uint(int(uint(_215) >> uint(2)));
    float _219 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_217)]);
    float _221 = _151 * _159;
    float _223 = fma(_179, _197, _163);
    float _225 = _157 * _159;
    float _227 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[64]);
    float _229 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[65]);
    float _231 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[66]);
    float _233 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[67]);
    float _235 = fma(_179, _221, _169);
    float _237 = fma(_179, _225, _175);
    float _239 = _219;
    float _241 = _237;
    float _243 = _235;
    float _245 = _179;
    int _247 = as_type<int>(_207);
    int _249 = as_type<int>(_201);
    int _251 = as_type<int>(_207);
    int _253 = as_type<int>(_213);
    int _255 = as_type<int>(_201);
    int _257 = as_type<int>(_207);
    int _259 = as_type<int>(_213);
    if (_193)
    {
        _239 = _223;
    }
    float _261 = _239;
    float _263 = _261;
    if (!_191)
    {
        float _265 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[48]);
        float _267 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[49]);
        float _269 = _179 * _265;
        float _271 = _159 * _269;
        bool _273 = _267 != 0.0;
        bool _275 = isnan(_267);
        bool _277 = _273 || _275;
        bool _279 = isnan(0.0);
        bool _281 = _277 || _279;
        float _283 = _271 * 0.15915493667125701904296875;
        float _285 = _283 * 6.283185482025146484375;
        float _287 = sin(_285);
        float _289 = _283 * 6.283185482025146484375;
        float _291 = cos(_289);
        float _293 = _237 * _287;
        float _295 = _235 * _287;
        float _297 = fma(_235, _291, _293);
        float _299 = -_295;
        float _301 = fma(_237, _291, _299);
        bool _303 = !_281;
        float _305 = _295;
        float _307 = _297;
        _241 = _301;
        _243 = _297;
        if (!_303)
        {
            float _309 = _301 * _301;
            float _311 = fma(_297, _297, _309);
            bool _313 = _311 > 0.0;
            float _315 = _291;
            if (_313)
            {
                float _317 = rsqrt(_311);
                _315 = _317;
            }
            float _319 = _315;
            float _321 = _319;
            if (_313)
            {
                float _323 = _267 * _319;
                _321 = _323;
            }
            float _325 = _321;
            if (_313)
            {
                float _327 = _179 * _325;
                _305 = _327;
            }
            float _329 = _305;
            float _331 = _329;
            if (_313)
            {
                float _333 = _159 * _329;
                _331 = _333;
            }
            float _335 = _331;
            if (_313)
            {
                float _337 = fma(_297, _335, _297);
                _307 = _337;
            }
            float _339 = _307;
            _243 = _339;
            if (_313)
            {
                float _341 = fma(_301, _335, _301);
                _241 = _341;
            }
        }
    }
    float _343 = _241;
    float _345 = _243;
    float _347 = _343;
    float _349 = _345;
    if (!_193)
    {
        float _351 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[48]);
        float _353 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[49]);
        float _355 = _179 * _351;
        float _357 = _159 * _355;
        bool _359 = _353 != 0.0;
        bool _361 = isnan(_353);
        bool _363 = _359 || _361;
        bool _365 = isnan(0.0);
        bool _367 = _363 || _365;
        float _369 = _357 * 0.15915493667125701904296875;
        float _371 = _369 * 6.283185482025146484375;
        float _373 = sin(_371);
        float _375 = _369 * 6.283185482025146484375;
        float _377 = cos(_375);
        float _379 = _373 * _343;
        float _381 = _373 * _223;
        float _383 = -_379;
        float _385 = fma(_377, _223, _383);
        float _387 = fma(_377, _343, _381);
        float _389 = _379;
        float _391 = _381;
        float _393 = _387;
        _347 = _387;
        if (!_367)
        {
            _389 = _385;
        }
        float _395 = _389;
        bool _397 = !_367;
        _263 = _395;
        if (!_397)
        {
            float _399 = _385 * _385;
            float _401 = fma(_387, _387, _399);
            bool _403 = _401 > 0.0;
            float _405 = _399;
            if (_403)
            {
                float _407 = rsqrt(_401);
                _405 = _407;
            }
            float _409 = _405;
            float _411 = _409;
            if (_403)
            {
                float _413 = _353 * _409;
                _411 = _413;
            }
            float _415 = _411;
            float _417 = _415;
            if (_403)
            {
                float _419 = _179 * _415;
                _391 = _419;
            }
            float _421 = _391;
            float _423 = _421;
            if (!_403)
            {
                _417 = _385;
            }
            float _425 = _417;
            _263 = _425;
            if (_403)
            {
                float _427 = _159 * _421;
                _423 = _427;
            }
            float _429 = _423;
            if (_403)
            {
                float _431 = fma(_387, _429, _387);
                _393 = _431;
            }
            float _433 = _393;
            _347 = _433;
            if (_403)
            {
                float _435 = fma(_385, _429, _385);
                _263 = _435;
            }
        }
    }
    float _437 = _263;
    float _439 = _347;
    float _441 = _437;
    float _443 = _437;
    if (!_195)
    {
        float _445 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[48]);
        float _447 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[49]);
        float _449 = _179 * _445;
        float _451 = _159 * _449;
        bool _453 = _447 != 0.0;
        bool _455 = isnan(_447);
        bool _457 = _453 || _455;
        bool _459 = isnan(0.0);
        bool _461 = _457 || _459;
        float _463 = _451 * 0.15915493667125701904296875;
        float _465 = _463 * 6.283185482025146484375;
        float _467 = sin(_465);
        float _469 = _463 * 6.283185482025146484375;
        float _471 = cos(_469);
        float _473 = _467 * _345;
        float _475 = _467 * _437;
        float _477 = fma(_471, _437, _473);
        float _479 = -_475;
        float _481 = fma(_471, _345, _479);
        _349 = _481;
        if (!_461)
        {
            _441 = _477;
        }
        float _483 = _441;
        bool _485 = !_461;
        _443 = _483;
        if (!_485)
        {
            float _487 = _481 * _481;
            float _489 = fma(_477, _477, _487);
            bool _491 = _489 > 0.0;
            float _493 = _487;
            if (_491)
            {
                float _495 = rsqrt(_489);
                _493 = _495;
            }
            float _497 = _493;
            float _499 = _497;
            if (_491)
            {
                float _501 = _447 * _497;
                _499 = _501;
            }
            float _503 = _499;
            float _505 = _503;
            if (_491)
            {
                float _507 = _179 * _503;
                _245 = _507;
            }
            float _509 = _245;
            float _511 = _509;
            if (!_491)
            {
                _505 = _477;
            }
            float _513 = _505;
            float _515 = _513;
            if (_491)
            {
                float _517 = _159 * _509;
                _511 = _517;
            }
            float _519 = _511;
            if (_491)
            {
                float _521 = fma(_477, _519, _477);
                _515 = _521;
            }
            float _523 = _515;
            _443 = _523;
            if (_491)
            {
                float _525 = fma(_481, _519, _481);
                _349 = _525;
            }
        }
    }
    float _527 = _443;
    float _529 = _349;
    uint _531 = uint(int(uint(_141) >> uint(2)));
    float _533 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_531)]);
    float _535 = abs(_185);
    float _537 = log2(_535);
    float _539 = _227 * _233;
    float _541 = _229 * _233;
    float _543 = _231 * _233;
    float _545 = -_163;
    float _547 = _545 + _527;
    float _549 = _159 * _539;
    float _551 = _159 * _541;
    float _553 = -_169;
    float _555 = _553 + _529;
    float _557 = _159 * _537;
    float _559 = _159 * _543;
    int _561 = _137 + 4;
    float _563 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _565 = exp2(_557);
    int _567 = _137 + 8;
    float _569 = fma(_145, _565, _549);
    float _571 = fma(_151, _565, _551);
    float _573 = fma(_157, _565, _559);
    float _575 = -_175;
    float _577 = _575 + _439;
    uint _579 = uint(int(uint(_141) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_579)] = as_type<uint>(_533);
    uint _581 = uint(int(uint(_137) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_581)] = as_type<uint>(_527);
    uint _583 = uint(int(uint(_561) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_583)] = as_type<uint>(_529);
    uint _585 = uint(int(uint(_567) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_585)] = as_type<uint>(_439);
    uint _587 = uint(int(uint(_137) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_587)] = as_type<uint>(_569);
    uint _589 = uint(int(uint(_561) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_589)] = as_type<uint>(_571);
    uint _591 = uint(int(uint(_567) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_591)] = as_type<uint>(_573);
    uint _593 = uint(int(uint(_137) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_593)] = as_type<uint>(_547);
    uint _595 = uint(int(uint(_561) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_595)] = as_type<uint>(_555);
    uint _597 = uint(int(uint(_567) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_597)] = as_type<uint>(_577);
    float _599 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _601 = _555 * _555;
    float _603 = fma(_547, _547, _601);
    float _605 = fma(_577, _577, _603);
    float _607 = sqrt(_605);
    float _609 = _571 * _571;
    float _611 = fma(_569, _569, _609);
    float _613 = fma(_573, _573, _611);
    float _615 = sqrt(_613);
    bool _617 = _607 >= 9.9999999747524270787835121154785e-07;
    bool _619 = isnan(_607);
    bool _621 = _617 || _619;
    bool _623 = isnan(9.9999999747524270787835121154785e-07);
    bool _625 = _621 || _623;
    float _627 = _613;
    if (!_625)
    {
        bool _629 = _563 != _189;
        bool _631 = isnan(_563);
        bool _633 = _629 || _631;
        bool _635 = isnan(_189);
        bool _637 = _633 || _635;
        _639 = _637;
        if (!_639)
        {
            float _641 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[67]);
            bool _643 = _641 > 0.0;
            bool _645 = !_643;
            if (!_645)
            {
                float _647 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[64]);
                float _649 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[65]);
                float _651 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[66]);
                float _653 = _649 * _649;
                float _655 = fma(_647, _647, _653);
                float _657 = fma(_651, _651, _655);
                float _659 = rsqrt(_657);
                float _661 = _659 * 9.9999999747524270787835121154785e-07;
                float _663 = _647 * _661;
                float _665 = _649 * _661;
                float _667 = _651 * _661;
                _255 = as_type<int>(_663);
                _257 = as_type<int>(_665);
                _259 = as_type<int>(_667);
                _639 = true;
            }
            else
            {
                bool _669 = _615 >= 9.9999999747524270787835121154785e-07;
                bool _671 = isnan(_615);
                bool _673 = _669 || _671;
                bool _675 = isnan(9.9999999747524270787835121154785e-07);
                bool _677 = _673 || _675;
                if (!_677)
                {
                    float _679 = _529 * _529;
                    float _681 = fma(_527, _527, _679);
                    float _683 = fma(_439, _439, _681);
                    float _685 = sqrt(_683);
                    bool _687 = _685 >= 9.9999999747524270787835121154785e-07;
                    bool _689 = isnan(_685);
                    bool _691 = _687 || _689;
                    bool _693 = isnan(9.9999999747524270787835121154785e-07);
                    bool _695 = _691 || _693;
                    int _697 = as_type<int>(_213);
                    int _699 = as_type<int>(_685);
                    if (_695)
                    {
                        float _701 = rsqrt(_683);
                        _697 = as_type<int>(_701);
                    }
                    int _703 = _697;
                    if (!_695)
                    {
                        _699 = 0;
                    }
                    int _705 = _699;
                    int _707 = _705;
                    if (!_695)
                    {
                        _247 = 897988541;
                    }
                    int _709 = _247;
                    int _711 = _703;
                    int _713 = _709;
                    if (_695)
                    {
                        float _715 = as_type<float>(_703) * 9.9999999747524270787835121154785e-07;
                        _627 = _715;
                    }
                    float _717 = _627;
                    if (!_695)
                    {
                        _711 = 0;
                    }
                    int _719 = _711;
                    int _721 = _719;
                    if (_695)
                    {
                        float _723 = _527 * _717;
                        _707 = as_type<int>(_723);
                    }
                    int _725 = _707;
                    _255 = _725;
                    if (_695)
                    {
                        float _727 = _529 * _717;
                        _713 = as_type<int>(_727);
                    }
                    int _729 = _713;
                    _257 = _729;
                    if (_695)
                    {
                        float _731 = _439 * _717;
                        _721 = as_type<int>(_731);
                    }
                    int _733 = _721;
                    _259 = _733;
                    _639 = true;
                }
                else
                {
                    float _735 = rsqrt(_613);
                    float _737 = _735 * 9.9999999747524270787835121154785e-07;
                    float _739 = _569 * _737;
                    float _741 = _571 * _737;
                    float _743 = _573 * _737;
                    _255 = as_type<int>(_739);
                    _257 = as_type<int>(_741);
                    _259 = as_type<int>(_743);
                    _639 = true;
                }
            }
        }
    }
    else
    {
        float _745 = _615 * _599;
        bool _747 = _745 >= 0.001000000047497451305389404296875;
        bool _749 = isnan(_745);
        bool _751 = _747 || _749;
        bool _753 = isnan(0.001000000047497451305389404296875);
        bool _755 = _751 || _753;
        bool _757 = _745 > 0.0;
        bool _759 = !_755;
        bool _761 = _757 && _759;
        bool _763 = _607 < 0.001000000047497451305389404296875;
        bool _765 = _763 && _761;
        if (!_765)
        {
            _249 = as_type<int>(_547);
        }
        int _767 = _249;
        int _769 = _767;
        if (_765)
        {
            float _771 = _569 * _599;
            _769 = as_type<int>(_771);
        }
        int _773 = _769;
        _255 = _773;
        if (!_765)
        {
            _251 = as_type<int>(_555);
        }
        int _775 = _251;
        int _777 = _775;
        if (_765)
        {
            float _779 = _571 * _599;
            _777 = as_type<int>(_779);
        }
        int _781 = _777;
        _257 = _781;
        if (!_765)
        {
            _253 = as_type<int>(_577);
        }
        int _783 = _253;
        _259 = _783;
        if (_765)
        {
            float _785 = _573 * _599;
            _259 = as_type<int>(_785);
        }
    }
    _639 = false;
    int _787 = _255;
    int _789 = _257;
    int _791 = _259;
    uint _793 = uint(int(uint(_137) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_793)] = uint(_787);
    uint _795 = uint(int(uint(_561) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_795)] = uint(_789);
    uint _797 = uint(int(uint(_567) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_797)] = uint(_791);
}

