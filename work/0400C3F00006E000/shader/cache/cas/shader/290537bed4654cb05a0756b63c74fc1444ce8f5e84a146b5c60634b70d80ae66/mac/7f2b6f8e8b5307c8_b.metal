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
    bool _549 = false;
    bool _351 = false;
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
    float _145 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _147 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    int _149 = _66 << 4;
    float _151 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _153 = _149 + 12;
    float _155 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _157 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    uint _159 = uint(int(uint(_149) >> uint(2)));
    float _161 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_159)]);
    int _163 = _149 + 4;
    uint _165 = uint(int(uint(_163) >> uint(2)));
    float _167 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_165)]);
    int _169 = _149 + 8;
    uint _171 = uint(int(uint(_169) >> uint(2)));
    float _173 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_171)]);
    uint _175 = uint(int(uint(_153) >> uint(2)));
    float _177 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_175)]);
    uint _179 = uint(int(uint(_149) >> uint(2)));
    float _181 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_179)]);
    int _183 = _149 + 4;
    uint _185 = uint(int(uint(_183) >> uint(2)));
    float _187 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_185)]);
    int _189 = _149 + 8;
    uint _191 = uint(int(uint(_189) >> uint(2)));
    float _193 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_191)]);
    uint _195 = uint(int(uint(_149) >> uint(2)));
    float _197 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_195)]);
    int _199 = _149 + 4;
    uint _201 = uint(int(uint(_199) >> uint(2)));
    float _203 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_201)]);
    int _205 = _149 + 8;
    uint _207 = uint(int(uint(_205) >> uint(2)));
    float _209 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_207)]);
    float _211 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _213 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[0]);
    float _215 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[77]);
    uint _217 = uint(int(uint(_153) >> uint(2)));
    float _219 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_217)]);
    uint _221 = uint(int(uint(_153) >> uint(2)));
    float _223 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_221)]);
    float _225 = abs(_147);
    float _227 = log2(_225);
    int _229 = as_type<int>(_151) & 512;
    bool _231 = _229 != 0;
    float _233 = _145 * _227;
    float _235 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[2]);
    float _237 = exp2(_233);
    float _239 = _155 * _157;
    float _241 = _177 * _145;
    float _243 = _145 * _239;
    float _245 = _181 * _241;
    float _247 = _187 * _241;
    float _249 = _193 * _241;
    float _251 = _197 + _245;
    float _253 = _209 + _249;
    float _255 = fma(_187, _237, _243);
    float _257 = _203 + _247;
    bool _259 = !_231;
    bool _261 = _231;
    float _263 = _197;
    float _265 = _235;
    int _267 = as_type<int>(_167);
    int _269 = as_type<int>(_167);
    int _271 = as_type<int>(_173);
    int _273 = as_type<int>(_161);
    int _275 = as_type<int>(_167);
    int _277 = as_type<int>(_173);
    float _349;
    if (!_259)
    {
        float _279 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _281 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _283 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _285 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _287 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _289 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _291 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _293 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _295 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _297 = _283 * _285;
        float _299 = _283 * _287;
        float _301 = _281 * _285;
        float _303 = -_297;
        float _305 = fma(_279, _289, _303);
        float _307 = -_299;
        float _309 = fma(_281, _289, _307);
        float _311 = -_301;
        float _313 = fma(_279, _287, _311);
        float _315 = _293 * _279;
        float _317 = _293 * _305;
        float _319 = -_315;
        float _321 = fma(_291, _281, _319);
        float _323 = -_317;
        float _325 = fma(_291, _309, _323);
        float _327 = fma(_295, _313, _325);
        float _329 = _295 * _281;
        float _331 = 1.0 / _327;
        float _333 = -_329;
        float _335 = fma(_293, _283, _333);
        float _337 = _235 * _331;
        float _339 = _213 * _331;
        float _341 = _335 * _337;
        float _343 = _321 * _337;
        float _345 = fma(_309, _339, _341);
        float _347 = fma(_313, _339, _343);
        _349 = _345;
        _265 = _347;
        _351 = true;
    }
    else
    {
        int _353 = as_type<int>(_151) & 1024;
        bool _355 = _353 != 0;
        if (_355)
        {
            _261 = true;
        }
        bool _357 = _261;
        bool _359 = _357;
        if (!_355)
        {
            int _361 = as_type<int>(_151) & 2048;
            bool _363 = _361 != 0;
            _359 = _363;
        }
        bool _365 = _359;
        if (!_365)
        {
            _263 = _213;
        }
        float _367 = _263;
        bool _369 = !_365;
        _349 = _367;
        if (!_369)
        {
            uint _371 = uint(int(uint(_149) >> uint(2)));
            float _373 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_371)]);
            int _375 = _149 + 4;
            uint _377 = uint(int(uint(_375) >> uint(2)));
            float _379 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_377)]);
            int _381 = _149 + 8;
            uint _383 = uint(int(uint(_381) >> uint(2)));
            float _385 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_383)]);
            uint _387 = uint(int(uint(_149) >> uint(2)));
            float _389 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_387)]);
            int _391 = _149 + 4;
            uint _393 = uint(int(uint(_391) >> uint(2)));
            float _395 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_393)]);
            int _397 = _149 + 8;
            uint _399 = uint(int(uint(_397) >> uint(2)));
            float _401 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_399)]);
            uint _403 = uint(int(uint(_149) >> uint(2)));
            float _405 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_403)]);
            int _407 = _149 + 4;
            uint _409 = uint(int(uint(_407) >> uint(2)));
            float _411 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_409)]);
            int _413 = _149 + 8;
            uint _415 = uint(int(uint(_413) >> uint(2)));
            float _417 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_415)]);
            float _419 = _385 * _389;
            float _421 = _385 * _395;
            float _423 = _379 * _389;
            float _425 = -_419;
            float _427 = fma(_373, _401, _425);
            float _429 = -_421;
            float _431 = fma(_379, _401, _429);
            float _433 = -_423;
            float _435 = fma(_373, _395, _433);
            float _437 = _411 * _373;
            float _439 = _411 * _427;
            float _441 = -_437;
            float _443 = fma(_405, _379, _441);
            float _445 = -_439;
            float _447 = fma(_405, _431, _445);
            float _449 = fma(_417, _435, _447);
            float _451 = _417 * _379;
            float _453 = 1.0 / _449;
            float _455 = -_451;
            float _457 = fma(_411, _385, _455);
            float _459 = _235 * _453;
            float _461 = _213 * _453;
            float _463 = _457 * _459;
            float _465 = _443 * _459;
            float _467 = fma(_431, _461, _463);
            float _469 = fma(_435, _461, _465);
            _349 = _467;
            _265 = _469;
        }
    }
    _351 = false;
    float _471 = _349;
    float _473 = _265;
    float _475 = 1.0 / _145;
    int _477 = _149 + 4;
    int _479 = _149 + 8;
    uint _481 = uint(int(uint(_153) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_481)] = as_type<uint>(_223);
    uint _483 = uint(int(uint(_149) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_483)] = as_type<uint>(_251);
    uint _485 = uint(int(uint(_477) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_485)] = as_type<uint>(_257);
    float _487 = -_475;
    float _489 = _215 * _487;
    uint _491 = uint(int(uint(_479) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_491)] = as_type<uint>(_253);
    float _493 = _471 * _489;
    float _495 = _473 * _489;
    uint _497 = uint(int(uint(_149) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_497)] = as_type<uint>(_493);
    uint _499 = uint(int(uint(_477) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_499)] = as_type<uint>(_255);
    uint _501 = uint(int(uint(_479) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_501)] = as_type<uint>(_495);
    uint _503 = uint(int(uint(_149) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_503)] = as_type<uint>(_245);
    uint _505 = uint(int(uint(_477) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_505)] = as_type<uint>(_247);
    uint _507 = uint(int(uint(_479) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_507)] = as_type<uint>(_249);
    float _509 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _511 = _247 * _247;
    float _513 = _255 * _255;
    float _515 = fma(_245, _245, _511);
    float _517 = fma(_493, _493, _513);
    float _519 = fma(_249, _249, _515);
    float _521 = fma(_495, _495, _517);
    float _523 = sqrt(_521);
    float _525 = sqrt(_519);
    bool _527 = _525 >= 9.9999999747524270787835121154785e-07;
    bool _529 = isnan(_525);
    bool _531 = _527 || _529;
    bool _533 = isnan(9.9999999747524270787835121154785e-07);
    bool _535 = _531 || _533;
    float _537 = _525;
    if (!_535)
    {
        bool _539 = _211 != _219;
        bool _541 = isnan(_211);
        bool _543 = _539 || _541;
        bool _545 = isnan(_219);
        bool _547 = _543 || _545;
        _549 = _547;
        if (!_549)
        {
            float _551 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _553 = _551 > 0.0;
            bool _555 = !_553;
            if (!_555)
            {
                float _557 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _559 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _561 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _563 = _559 * _559;
                float _565 = fma(_557, _557, _563);
                float _567 = fma(_561, _561, _565);
                float _569 = rsqrt(_567);
                float _571 = _569 * 9.9999999747524270787835121154785e-07;
                float _573 = _557 * _571;
                float _575 = _559 * _571;
                float _577 = _561 * _571;
                _273 = as_type<int>(_573);
                _275 = as_type<int>(_575);
                _277 = as_type<int>(_577);
                _549 = true;
            }
            else
            {
                bool _579 = _523 >= 9.9999999747524270787835121154785e-07;
                bool _581 = isnan(_523);
                bool _583 = _579 || _581;
                bool _585 = isnan(9.9999999747524270787835121154785e-07);
                bool _587 = _583 || _585;
                if (!_587)
                {
                    float _589 = _257 * _257;
                    float _591 = fma(_251, _251, _589);
                    float _593 = fma(_253, _253, _591);
                    float _595 = sqrt(_593);
                    bool _597 = _595 >= 9.9999999747524270787835121154785e-07;
                    bool _599 = isnan(_595);
                    bool _601 = _597 || _599;
                    bool _603 = isnan(9.9999999747524270787835121154785e-07);
                    bool _605 = _601 || _603;
                    int _607 = as_type<int>(_173);
                    int _609 = as_type<int>(_595);
                    if (_605)
                    {
                        float _611 = rsqrt(_593);
                        _607 = as_type<int>(_611);
                    }
                    int _613 = _607;
                    if (!_605)
                    {
                        _609 = 0;
                    }
                    int _615 = _609;
                    int _617 = _615;
                    if (!_605)
                    {
                        _267 = 897988541;
                    }
                    int _619 = _267;
                    int _621 = _613;
                    int _623 = _619;
                    if (_605)
                    {
                        float _625 = as_type<float>(_613) * 9.9999999747524270787835121154785e-07;
                        _537 = _625;
                    }
                    float _627 = _537;
                    if (!_605)
                    {
                        _621 = 0;
                    }
                    int _629 = _621;
                    int _631 = _629;
                    if (_605)
                    {
                        float _633 = _251 * _627;
                        _617 = as_type<int>(_633);
                    }
                    int _635 = _617;
                    _273 = _635;
                    if (_605)
                    {
                        float _637 = _257 * _627;
                        _623 = as_type<int>(_637);
                    }
                    int _639 = _623;
                    _275 = _639;
                    if (_605)
                    {
                        float _641 = _253 * _627;
                        _631 = as_type<int>(_641);
                    }
                    int _643 = _631;
                    _277 = _643;
                    _549 = true;
                }
                else
                {
                    float _645 = rsqrt(_521);
                    float _647 = _645 * 9.9999999747524270787835121154785e-07;
                    float _649 = _493 * _647;
                    float _651 = _255 * _647;
                    float _653 = _495 * _647;
                    _273 = as_type<int>(_649);
                    _275 = as_type<int>(_651);
                    _277 = as_type<int>(_653);
                    _549 = true;
                }
            }
        }
    }
    else
    {
        float _655 = _523 * _509;
        bool _657 = _655 >= 0.001000000047497451305389404296875;
        bool _659 = isnan(_655);
        bool _661 = _657 || _659;
        bool _663 = isnan(0.001000000047497451305389404296875);
        bool _665 = _661 || _663;
        bool _667 = _655 > 0.0;
        bool _669 = !_665;
        bool _671 = _667 && _669;
        bool _673 = _525 < 0.001000000047497451305389404296875;
        bool _675 = _673 && _671;
        int _677 = as_type<int>(_655);
        if (!_675)
        {
            _677 = as_type<int>(_245);
        }
        int _679 = _677;
        int _681 = _679;
        if (_675)
        {
            float _683 = _493 * _509;
            _681 = as_type<int>(_683);
        }
        int _685 = _681;
        _273 = _685;
        if (!_675)
        {
            _269 = as_type<int>(_247);
        }
        int _687 = _269;
        int _689 = _687;
        if (_675)
        {
            float _691 = _255 * _509;
            _689 = as_type<int>(_691);
        }
        int _693 = _689;
        _275 = _693;
        if (!_675)
        {
            _271 = as_type<int>(_249);
        }
        int _695 = _271;
        _277 = _695;
        if (_675)
        {
            float _697 = _495 * _509;
            _277 = as_type<int>(_697);
        }
    }
    _549 = false;
    int _699 = _273;
    int _701 = _275;
    int _703 = _277;
    uint _705 = uint(int(uint(_149) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_705)] = uint(_699);
    uint _707 = uint(int(uint(_477) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_707)] = uint(_701);
    uint _709 = uint(int(uint(_479) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_709)] = uint(_703);
}

