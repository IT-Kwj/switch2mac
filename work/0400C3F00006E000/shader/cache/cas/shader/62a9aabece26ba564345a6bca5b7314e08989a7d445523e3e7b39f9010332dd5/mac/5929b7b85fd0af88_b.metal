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

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
};

struct main0_out
{
    float4 m_48 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 m_52 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_39 [[attribute(4)]];
    float4 m_37 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _607 = false;
    bool _453 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_30.w;
    float _68 = trunc(_66);
    int _71 = int(_68);
    bool _75 = _71 >= 1;
    float _77 = 0.0;
    if (!_75)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _79 = _77;
    float _81 = _79;
    if (!_75)
    {
        out.m_33.x = 0.0;
    }
    int _83 = 0;
    if (!_75)
    {
        float _85 = _79 * 5.0;
        _83 = as_type<int>(_85);
    }
    int _87 = _83;
    int _89 = _87;
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1853 = as_type<float>(_87);
        out.gl_Position.z = _1853;
    }
    if (!_75)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _91 = in.m_35.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _107 = 0.0;
    float _109 = 0.0;
    float _111 = 0.0;
    if (_101)
    {
        float _113 = float(_71);
        _107 = _113;
    }
    float _115 = _107;
    bool _117 = _105 >= _115;
    bool _119 = !_101;
    bool _121 = _117 || _119;
    if (_121)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _81;
    if (_121)
    {
        out.m_33.x = 0.0;
    }
    if (_121)
    {
        float _125 = _123 * 5.0;
        _89 = as_type<int>(_125);
    }
    int _127 = _89;
    float _129 = as_type<float>(_127);
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1923 = as_type<float>(_127);
        out.gl_Position.z = _1923;
    }
    if (_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = in.m_35.x;
    float _133 = in.m_35.y;
    float _135 = in.m_35.z;
    float _137 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _139 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _141 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _143 = _139 || _141;
    bool _145 = isnan(1.0);
    bool _147 = _143 || _145;
    float _149 = _137;
    if (!_147)
    {
        float _151 = _137 * _137;
        float _153 = _151 * 0.5;
        _129 = _153;
    }
    float _155 = _129;
    float _157 = 0.0;
    float _159 = _155;
    if (!_147)
    {
        float _161 = _105 * _105;
        float _163 = _161 * 0.5;
        _157 = _163;
    }
    float _165 = _157;
    if (!_147)
    {
        float _167 = _155 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _159 = _167;
    }
    float _169 = _159;
    bool _171 = !_147;
    float _173 = _169;
    if (!_171)
    {
        float _175 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _177 = log2(_175);
        float _179 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _181 = _179 + 1.0;
        float _183 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _185 = _137 * _177;
        float _187 = 1.0 / _181;
        float _189 = _183 * 0.693147182464599609375;
        float _191 = exp2(_185);
        float _193 = 1.0 / _189;
        float _195 = _191 + (-1.0);
        float _197 = -_195;
        float _199 = fma(_197, _193, _137);
        float _201 = _199 * _187;
        float _203 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _109 = _193;
        _173 = _203;
        _111 = _191;
    }
    float _205 = _109;
    float _207 = _173;
    float _209 = _111;
    bool _211 = !_147;
    float _213 = _205;
    float _215 = _209;
    if (!_211)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = 1.0 / _223;
        float _227 = _137 * _219;
        float _229 = exp2(_227);
        float _231 = -_229;
        float _233 = _231 + 1.0;
        float _235 = _233 * _225;
        _213 = _229;
        _215 = _223;
        _149 = _235;
    }
    float _237 = _213;
    float _239 = _215;
    float _241 = _149;
    float _243 = _239;
    float _245 = _237;
    if (!_147)
    {
        _243 = _105;
    }
    float _247 = _243;
    float _249 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _251 = _247;
    if (!_147)
    {
        float _253 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _245 = _253;
    }
    float _255 = _245;
    bool _257 = !_147;
    float _259 = _255;
    if (!_257)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _271 = _105 * _263;
        float _273 = exp2(_271);
        float _275 = _269 * 0.693147182464599609375;
        float _277 = 1.0 / _275;
        float _279 = 1.0 / _267;
        float _281 = _273 + (-1.0);
        float _283 = -_281;
        float _285 = fma(_283, _277, _105);
        float _287 = _285 * _279;
        float _289 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _259 = _289;
    }
    float _291 = _259;
    bool _293 = !_147;
    if (!_293)
    {
        float _295 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _297 = log2(_295);
        float _299 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _301 = _299 + 1.0;
        float _303 = 1.0 / _301;
        float _305 = _105 * _297;
        float _307 = exp2(_305);
        float _309 = -_307;
        float _311 = _309 + 1.0;
        float _313 = _311 * _303;
        _251 = _313;
    }
    float _315 = _251;
    float _317 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _319 = fma(_241, _133, _249);
    float _321 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _323 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _325 = fma(_315, _133, _317);
    float _327 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _329 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _331 = fma(_241, _131, _321);
    float _333 = fma(_315, _131, _323);
    float _335 = -_325;
    float _337 = _319 + _335;
    float _339 = fma(_241, _135, _327);
    float _341 = fma(_315, _135, _329);
    float _343 = -_333;
    float _345 = _331 + _343;
    float _347 = _337 * _337;
    float _349 = in.m_37.w;
    float _351 = -_341;
    float _353 = _339 + _351;
    float _355 = _337 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _357 = fma(_345, _345, _347);
    float _359 = _337 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _361 = _337 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _363 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[4].x, _355);
    float _365 = fma(_353, _353, _357);
    float _367 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[5].x, _359);
    float _369 = in.m_30.x;
    float _371 = in.m_30.y;
    float _373 = in.m_30.z;
    float _375 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[6].x, _361);
    float _377 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[4].z, _363);
    float _379 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[5].z, _367);
    float _381 = sqrt(_365);
    float _383 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[6].z, _375);
    bool _385 = _381 >= 9.9999999747524270787835121154785e-07;
    bool _387 = isnan(_381);
    bool _389 = _385 || _387;
    bool _391 = isnan(9.9999999747524270787835121154785e-07);
    bool _393 = _389 || _391;
    float _395 = fma(_331, _349, _369);
    float _397 = fma(_319, _349, _371);
    float _399 = fma(_339, _349, _373);
    float _401 = _367;
    float _403 = _377;
    float _405 = _379;
    if (_393)
    {
        _401 = _377;
    }
    float _407 = _401;
    float _409 = _407;
    if (_393)
    {
        _403 = _383;
    }
    float _411 = _403;
    float _413 = _411;
    if (!_393)
    {
        bool _415 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _417 = !_415;
        if (!_417)
        {
            float _419 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _421 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _423 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _425 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _419);
            float _427 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _421);
            float _429 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _423);
            float _431 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _425);
            float _433 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _427);
            float _435 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _429);
            float _437 = _431 * _431;
            float _439 = fma(_433, _433, _437);
            float _441 = fma(_435, _435, _439);
            float _443 = rsqrt(_441);
            float _445 = _443 * 9.9999999747524270787835121154785e-07;
            float _447 = _433 * _445;
            float _449 = _431 * _445;
            float _451 = _435 * _445;
            _405 = _449;
            _409 = _447;
            _413 = _451;
            _453 = true;
        }
        else
        {
            float _455 = _133 * _133;
            float _457 = fma(_131, _131, _455);
            float _459 = fma(_135, _135, _457);
            float _461 = sqrt(_459);
            bool _463 = _461 >= 9.9999999747524270787835121154785e-07;
            bool _465 = isnan(_461);
            bool _467 = _463 || _465;
            bool _469 = isnan(9.9999999747524270787835121154785e-07);
            bool _471 = _467 || _469;
            if (!_471)
            {
                float _473 = _371 * _371;
                float _475 = fma(_369, _369, _473);
                float _477 = fma(_373, _373, _475);
                float _479 = sqrt(_477);
                bool _481 = _479 >= 9.9999999747524270787835121154785e-07;
                bool _483 = isnan(_479);
                bool _485 = _481 || _483;
                bool _487 = isnan(9.9999999747524270787835121154785e-07);
                bool _489 = _485 || _487;
                if (!_489)
                {
                    float _491 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _493 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _491);
                    float _495 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _493);
                    float _497 = rsqrt(_495);
                    float _499 = _497 * 9.9999999747524270787835121154785e-07;
                    float _501 = _499 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _503 = _499 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _505 = _499 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _405 = _503;
                    _409 = _501;
                    _413 = _505;
                    _453 = true;
                }
                else
                {
                    float _507 = _371 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _509 = _371 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _511 = _371 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _513 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].x, _507);
                    float _515 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].x, _509);
                    float _517 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].x, _511);
                    float _519 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].z, _513);
                    float _521 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].z, _515);
                    float _523 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].z, _517);
                    float _525 = _519 * _519;
                    float _527 = fma(_521, _521, _525);
                    float _529 = fma(_523, _523, _527);
                    float _531 = rsqrt(_529);
                    float _533 = _531 * 9.9999999747524270787835121154785e-07;
                    float _535 = _521 * _533;
                    float _537 = _519 * _533;
                    float _539 = _523 * _533;
                    _405 = _537;
                    _409 = _535;
                    _413 = _539;
                    _453 = true;
                }
            }
            else
            {
                float _541 = _133 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _543 = _133 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _545 = _133 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _547 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[5].x, _541);
                float _549 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[4].x, _543);
                float _551 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[6].x, _545);
                float _553 = fma(_135, (*spvDescriptorSet0.vp_c10)._m0[5].z, _547);
                float _555 = fma(_135, (*spvDescriptorSet0.vp_c10)._m0[4].z, _549);
                float _557 = fma(_135, (*spvDescriptorSet0.vp_c10)._m0[6].z, _551);
                float _559 = _553 * _553;
                float _561 = fma(_555, _555, _559);
                float _563 = fma(_557, _557, _561);
                float _565 = rsqrt(_563);
                float _567 = _565 * 9.9999999747524270787835121154785e-07;
                float _569 = _555 * _567;
                float _571 = _553 * _567;
                float _573 = _557 * _567;
                _405 = _571;
                _409 = _569;
                _413 = _573;
            }
        }
    }
    _453 = false;
    float _575 = _405;
    float _577 = _409;
    float _579 = _413;
    bool _581 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _583 = !_581;
    float _603;
    float _605;
    if (!_583)
    {
        float _585 = in.m_39.x;
        float _587 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _589 = _585 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _591 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _593 = _591 * _587;
        float _595 = float(_71);
        float _597 = floor(_593);
        float _599 = -_597;
        float _601 = _593 + _599;
        _603 = _595;
        _605 = _601;
        _607 = true;
    }
    else
    {
        float _609 = float(_71);
        float _611 = 1.0 / _609;
        float _613 = _105 * _611;
        _603 = _609;
        _605 = _613;
    }
    _607 = false;
    float _615 = _603;
    float _617 = _605;
    float _619 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _621 = int(_619);
    float _623 = in.m_39.x;
    float _625 = _397 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _627 = in.m_39.y;
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _631 = _629 != 0;
    int _633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _635 = _633 != 0;
    int _637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _639 = _637 != 0;
    float _641 = _397 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _643 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _645 = int(_643);
    float _647 = in.m_39.w;
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _651 = _649 != 0;
    float _653 = _397 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _655 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].x, _641);
    bool _657 = !_635;
    int _659 = _657 ? 0 : 1;
    float _661 = float(_621);
    float _663 = 1.0 / _615;
    bool _665 = !_631;
    int _667 = _665 ? 0 : 1;
    float _669 = float(uint(_645));
    float _671 = 1.0 / _661;
    int _673 = ~_645;
    int _675 = _673 + 1;
    float _677 = _623 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _679 = ~_645;
    int _681 = _679 + 1;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _685 = float(_645);
    float _687 = _627 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _689 = abs(_667);
    float _691 = 1.0 / _669;
    float _693 = fma(_687, -2.0, _683);
    int _695 = ~_645;
    int _697 = _695 + 1;
    int _699 = ~_645;
    int _701 = _699 + 1;
    int _703 = ~_645;
    int _705 = _703 + 1;
    float _707 = _105 * _671;
    float _709 = trunc(_707);
    int _711 = int(_709);
    int _713 = as_type<int>(_691) + (-2);
    float _715 = float(uint(_711));
    float _717 = as_type<float>(_713) * _715;
    float _719 = trunc(_717);
    float _721 = precise::max(_719, 0.0);
    uint _724 = uint(_721);
    int _726 = _675 * int(_724);
    int _728 = _726 + _711;
    float _730 = float(uint(_728));
    float _732 = as_type<float>(_713) * _730;
    float _734 = as_type<float>(int(gl_VertexIndex));
    float _736 = trunc(_732);
    float _738 = precise::max(_736, 0.0);
    uint _740 = uint(_738);
    int _742 = int(_724) + int(_740);
    int _744 = _681 * _742;
    int _746 = _744 + _711;
    int _748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _750 = _748 != 0;
    float _752 = in.m_39.z;
    bool _754 = !_639;
    int _756 = _754 ? 0 : 1;
    bool _758 = uint(_746) >= uint(_645);
    bool _760 = !_750;
    float _762 = _760 ? 7.345489978790283203125 : 1.0;
    bool _764 = !_758;
    int _766 = _764 ? 0 : (-1);
    int _768 = as_type<int>(_734) & 1;
    bool _770 = _768 != 0;
    int _772 = as_type<int>(_734) & 2;
    bool _774 = _772 != 0;
    float _776 = _762 * _623;
    int _778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _780 = _778 != 0;
    bool _782 = !_651;
    int _784 = _782 ? 0 : 1;
    bool _786 = !_770;
    float _788 = _786 ? (-0.5) : 0.5;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _792 = _790 != 0;
    int _794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _796 = _794 != 0;
    int _798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _800 = _798 != 0;
    int _802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _804 = _802 != 0;
    bool _806 = !_780;
    int _808 = _806 ? 0 : 1;
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _812 = _810 != 0;
    bool _814 = _623 > 0.5;
    float _816 = floor(_776);
    bool _818 = !_774;
    float _820 = _818 ? (-0.5) : 0.5;
    bool _822 = _627 > 0.5;
    float _824 = -_788;
    int _826 = _814 ? as_type<int>(_824) : as_type<int>(_788);
    bool _828 = _752 > 0.5;
    float _830 = -_820;
    int _832 = _822 ? as_type<int>(_830) : as_type<int>(_820);
    bool _834 = _647 > 0.5;
    float _836 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].x, _625);
    float _838 = float(_711);
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _842 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].x, _653);
    int _844 = ~_742;
    int _846 = _844 + _766;
    int _848 = _846 + 1;
    float _850 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[4].z, _836);
    bool _852 = _838 >= _685;
    bool _854 = isnan(_838);
    bool _856 = _852 || _854;
    bool _858 = isnan(_685);
    bool _860 = _856 || _858;
    float _862 = float(_860);
    float _864 = -_840;
    float _866 = fma(_677, 2.0, _864);
    float _868 = -_816;
    float _870 = _776 + _868;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _874 = trunc(_862);
    int _876 = int(_874);
    float _878 = _870 * _685;
    float _880 = _105 * _685;
    float _882 = -_788;
    int _884 = _828 ? as_type<int>(_882) : as_type<int>(_788);
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _888 = _645 * _848;
    int _890 = _888 + _711;
    bool _892 = _645 == 0;
    float _894 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[6].z, _842);
    float _896 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[78].w, _886);
    float _898 = _880 * _663;
    bool _900 = !_892;
    int _902 = _900 ? _890 : (-1);
    float _904 = trunc(_878);
    int _906 = int(_904);
    int _908 = _645 + (-1);
    float _910 = _894 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _912 = abs(_659);
    float _914 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[78].z, _872);
    int _916 = ~_876;
    int _918 = _916 + 1;
    int _920 = _918 + 1;
    float _922 = -_105;
    float _924 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[76].x, _866);
    float _926 = trunc(_898);
    int _928 = int(_926);
    int _930 = abs(_808);
    int _932 = _902 * _920;
    float _934 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _936 = _876 * _908;
    int _938 = _936 + _932;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _944 = _906 * _930;
    int _946 = _944 + _711;
    int _948 = _938 * _912;
    float _950 = _575 * _575;
    float _952 = 1.0 / _942;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _958 = _928 * _689;
    int _960 = _958 + _948;
    float _962 = fma(_577, _577, _950);
    int _964 = abs(_756);
    float _966 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _968 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _970 = _910 + _968;
    float _972 = fma(_579, _579, _962);
    float _974 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[5].z, _655);
    float _976 = _850 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    out.m_33.x = _966;
    float _978 = 1.0 / _956;
    float _980 = _974 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _982 = _946 * _964;
    int _984 = _982 + _960;
    int _986 = ~_645;
    int _988 = _986 + 1;
    float _990 = _934 * _623;
    float _992 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _994 = _980 + _992;
    float _996 = float(uint(_946));
    float _998 = rsqrt(_972);
    int _1000 = abs(_784);
    float _1002 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1004 = _976 + _1002;
    float _1006 = _994 * _994;
    float _1008 = as_type<float>(_713) * _996;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1012 = _617 + _1010;
    int _1014 = _906 * _1000;
    int _1016 = _1014 + _984;
    float _1018 = fma(_1004, _1004, _1006);
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1020;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1026 = _1024 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1028 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _914);
    float _1030 = fma(_970, _970, _1018);
    float _1032 = float(uint(_1016));
    float _1034 = _1026 * _978;
    float _1036 = _1022 * _952;
    float _1038 = trunc(_990);
    int _1040 = int(_1038);
    float _1042 = _998 * _579;
    float _1044 = as_type<float>(_713) * _1032;
    float _1046 = _998 * _577;
    float _1048 = _998 * _575;
    float _1050 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1052 = _1042 * _1050;
    bool _1054 = !_800;
    float _1056 = _1054 ? _820 : as_type<float>(_832);
    float _1058 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1060 = _1046 * _1058;
    float _1062 = rsqrt(_1030);
    float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1066 = _1048 * _1064;
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1070 = -_1052;
    float _1072 = fma(_1046, _1068, _1070);
    float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1076 = -_1060;
    float _1078 = fma(_1048, _1074, _1076);
    float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1082 = -_1066;
    float _1084 = fma(_1042, _1080, _1082);
    float _1086 = _1072 * _1072;
    float _1088 = trunc(_1044);
    float _1090 = precise::max(_1088, 0.0);
    uint _1092 = uint(_1090);
    float _1094 = fma(_1084, _1084, _1086);
    float _1096 = fma(_1078, _1078, _1094);
    float _1098 = _994 * _1062;
    float _1100 = _1004 * _1062;
    float _1102 = -_1098;
    float _1104 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[18].w, _994);
    float _1106 = -_1100;
    float _1108 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1004);
    float _1110 = rsqrt(_1096);
    float _1112 = _1104 * _1104;
    int _1114 = _988 * int(_1092);
    int _1116 = _1114 + _1016;
    float _1118 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _693);
    float _1120 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _896);
    float _1122 = fma(_1108, _1108, _1112);
    float _1124 = _970 * _1062;
    float _1126 = float(uint(_1116));
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1130 = _617 + _1128;
    float _1132 = trunc(_1008);
    float _1134 = precise::max(_1132, 0.0);
    uint _1136 = uint(_1134);
    float _1138 = -_1124;
    float _1140 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[18].w, _970);
    float _1142 = fma(_1036, _1012, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1144 = as_type<float>(_713) * _1126;
    float _1146 = fma(_1034, _1130, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1148 = in.m_37.x;
    float _1150 = in.m_37.y;
    float _1152 = fma(_1140, _1140, _1122);
    int _1154 = _1040 << 4;
    int _1156 = _1154 + 1968;
    float _1158 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _788);
    float _1160 = trunc(_1144);
    float _1162 = precise::max(_1160, 0.0);
    uint _1164 = uint(_1162);
    bool _1166 = !_796;
    float _1168 = _1166 ? _788 : as_type<float>(_826);
    float _1170 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _820);
    bool _1172 = !_804;
    float _1174 = _1172 ? _788 : as_type<float>(_884);
    float _1176 = _1078 * _1110;
    float _1178 = -_820;
    int _1180 = _834 ? as_type<int>(_1178) : as_type<int>(_820);
    uint _1182 = uint(int(uint(_1156) >> uint(2)));
    uint _1184 = uint(int(uint(int(_1182)) >> uint(2)));
    int _1186 = int(_1182) & 3;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[int(_1184)][_1186];
    int _1190 = int(_1182) + 1;
    uint _1192 = uint(int(uint(_1190) >> uint(2)));
    int _1194 = _1190 & 3;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[int(_1192)][_1194];
    float _1198 = sqrt(_1152);
    bool _1200 = !_812;
    float _1202 = _1200 ? _820 : as_type<float>(_1180);
    float _1204 = _1084 * _1110;
    float _1206 = _1072 * _1110;
    int _1208 = _701 * int(_1136);
    int _1210 = _1208 + _946;
    int _1212 = int(_1092) + int(_1164);
    float _1214 = float(uint(_1210));
    float _1216 = _1148 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1218 = _1150 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1220 = as_type<float>(_713) * _1214;
    float _1222 = _1062 * _1198;
    float _1224 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1226 = _697 * _1212;
    int _1228 = _1226 + _1016;
    float _1230 = _1218 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1232 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1234 = isnan(_617);
    bool _1236 = _1232 || _1234;
    bool _1238 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1240 = _1236 || _1238;
    float _1242 = float(_1240);
    float _1244 = _1224 * _1222;
    float _1246 = trunc(_1220);
    float _1248 = precise::max(_1246, 0.0);
    uint _1250 = uint(_1248);
    bool _1252 = uint(_1228) >= uint(_645);
    int _1254 = _1156 + 8;
    uint _1256 = uint(int(uint(_1254) >> uint(2)));
    uint _1258 = uint(int(uint(int(_1256)) >> uint(2)));
    int _1260 = int(_1256) & 3;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[int(_1258)][_1260];
    bool _1264 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1266 = isnan(_617);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1272 = _1268 || _1270;
    float _1274 = float(_1272);
    float _1276 = _1230 * _1222;
    bool _1278 = !_1252;
    int _1280 = _1278 ? 0 : (-1);
    float _1282 = _1244 * _1158;
    bool _1284 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1286 = isnan(_617);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1292 = _1288 || _1290;
    float _1294 = float(_1292);
    float _1296 = -_1274;
    float _1298 = _1296 + 1.0;
    int _1300 = ~_1212;
    int _1302 = _1300 + _1280;
    int _1304 = _1302 + 1;
    float _1306 = _1276 * _1170;
    float _1308 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1310 = _1308 * 0.5;
    float _1312 = _1242 * _1298;
    float _1314 = -_1242;
    float _1316 = _1314 + 1.0;
    int _1318 = _645 * _1304;
    int _1320 = _1318 + _1016;
    float _1322 = _1048 * _1176;
    float _1324 = _1306 * _1046;
    float _1326 = _1294 * _1316;
    float _1328 = _1046 * _1206;
    bool _1330 = !_892;
    int _1332 = _1330 ? _1320 : (-1);
    float _1334 = -_1322;
    float _1336 = fma(_1042, _1206, _1334);
    float _1338 = fma(_1282, _1204, _1324);
    float _1340 = _1142 * _1326;
    int _1342 = _1332 >> 31;
    float _1344 = _1306 * _1042;
    float _1346 = fma(_1310, _1336, _1338);
    float _1348 = -_1328;
    float _1350 = fma(_1048, _1204, _1348);
    int _1352 = _1342 & 3;
    float _1354 = fma(_1282, _1176, _1344);
    float _1356 = _976 + _1346;
    float _1358 = _1196 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1360 = _1332 + _1352;
    float _1362 = fma(_1310, _1350, _1354);
    float _1364 = -_1294;
    float _1366 = _1364 + 1.0;
    int _1368 = _1360 >> 2;
    float _1370 = _1188 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1372 = int(_1136) + int(_1250);
    float _1374 = _910 + _1362;
    int _1376 = _1368 << 4;
    int _1378 = _1376 + 368;
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1384 = _1356 + _1382;
    float _1386 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1388 = _1374 + _1386;
    uint _1390 = uint(int(uint(_1378) >> uint(2)));
    uint _1392 = uint(int(uint(int(_1390)) >> uint(2)));
    int _1394 = int(_1390) & 3;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[int(_1392)][_1394];
    int _1398 = int(_1390) + 1;
    uint _1400 = uint(int(uint(_1398) >> uint(2)));
    int _1402 = _1398 & 3;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[int(_1400)][_1402];
    int _1406 = _705 * _1372;
    int _1408 = _1406 + _946;
    float _1410 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1340);
    float _1412 = _1388 * _1388;
    float _1414 = _1042 * _1204;
    float _1416 = _1358 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1418 = _1332 & 3;
    bool _1420 = _1418 != 0;
    float _1422 = _1262 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1424 = _1378 + 8;
    uint _1426 = uint(int(uint(_1424) >> uint(2)));
    uint _1428 = uint(int(uint(int(_1426)) >> uint(2)));
    int _1430 = int(_1426) & 3;
    float _1432 = (*spvDescriptorSet0.vp_c9)._m0[int(_1428)][_1430];
    int _1434 = int(_1426) + 1;
    uint _1436 = uint(int(uint(_1434) >> uint(2)));
    int _1438 = _1434 & 3;
    float _1440 = (*spvDescriptorSet0.vp_c9)._m0[int(_1436)][_1438];
    float _1442 = fma(_1384, _1384, _1412);
    float _1444 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1446 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1448 = uint(_1408) >= uint(_645);
    float _1450 = sqrt(_1442);
    bool _1452 = uint(_1418) > 1u;
    float _1454 = _1306 * _1048;
    out.m_44.x = _1444;
    out.m_44.y = _1416;
    out.m_44.z = _1446;
    out.m_44.w = _1380;
    int _1456 = _1332 & 3;
    bool _1458 = _1456 != 0;
    float _1460 = -_1414;
    float _1462 = fma(_1046, _1176, _1460);
    float _1464 = fma(_1282, _1206, _1454);
    float _1466 = _1168 + 0.5;
    float _1468 = fma(_1146, _1312, _1410);
    float _1470 = fma(_1310, _1462, _1464);
    float _1472 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[80].x, _924);
    float _1474 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1468);
    float _1476 = _980 + _1470;
    bool _1478 = !_1448;
    int _1480 = _1478 ? 0 : (-1);
    float _1482 = _1056 + (-0.5);
    bool _1484 = _1450 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1486 = _1458 ? 0 : 1;
    float _1488 = -_1482;
    float _1490 = -_1118;
    float _1492 = fma(_1488, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1490);
    int _1494 = ~_1372;
    int _1496 = _1494 + _1480;
    int _1498 = _1496 + 1;
    int _1500 = ~_1486;
    int _1502 = _1500 + 1;
    int _1504 = _1502 + 1;
    int _1506 = _1504;
    float _1508 = as_type<float>(_1498);
    float _1510 = _1356;
    float _1512 = _1374;
    if (!_1452)
    {
        int _1514 = ~_1486;
        int _1516 = _1514 + 1;
        _1506 = _1516;
    }
    int _1518 = _1506;
    int _1520 = _645 * _1498;
    int _1522 = _1520 + _946;
    bool _1524 = !_1420;
    int _1526 = _1524 ? 0 : 1;
    bool _1528 = uint(_1418) >= 2u;
    bool _1530 = _1418 != 3;
    int _1532 = abs(_1518);
    int _1534 = abs(_1526);
    if (!_1484)
    {
        _1508 = _1476;
    }
    float _1536 = _1508;
    bool _1538 = !_1484;
    float _1540 = _1536;
    if (!_1538)
    {
        float _1542 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1546 = _1450 + _1544;
        float _1548 = _1476 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1550 = rsqrt(_1442);
        float _1552 = _1546 * _1542;
        float _1554 = _1552 * 0.15915493667125701904296875;
        float _1556 = _1554 * 6.283185482025146484375;
        float _1558 = cos(_1556);
        float _1560 = _1554 * 6.283185482025146484375;
        float _1562 = sin(_1560);
        float _1564 = _1558 + (-1.0);
        float _1566 = _1564 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1568 = fma(_1562, _1548, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1570 = fma(_1476, _1558, _1566);
        float _1572 = _1550 * _1568;
        float _1574 = fma(_1384, _1572, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1576 = fma(_1388, _1572, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1540 = _1570;
        _1510 = _1574;
        _1512 = _1576;
    }
    float _1578 = _1540;
    float _1580 = _1510;
    float _1582 = _1512;
    float _1584 = -_1098;
    float _1586 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1578);
    int _1588 = ~_1532;
    int _1590 = _1588 + 1;
    int _1592 = _1590 + 1;
    float _1594 = -_1100;
    float _1596 = fma(_1594, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1580);
    int _1598 = _1528 ? 0 : 1;
    float _1600 = -_1124;
    float _1602 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1582);
    int _1604 = ~_1534;
    int _1606 = _1604 + 1;
    int _1608 = _1606 + 1;
    int _1610 = _1592 * as_type<int>(_1404);
    int _1612 = ~_1598;
    int _1614 = _1612 + 1;
    int _1616 = _1614 + 1;
    float _1618 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _1620 = _1616;
    if (_1530)
    {
        int _1622 = ~_1598;
        int _1624 = _1622 + 1;
        _1620 = _1624;
    }
    int _1626 = _1620;
    int _1628 = _1608 * as_type<int>(_1396);
    int _1630 = _1628 + _1610;
    bool _1632 = _1418 != 3;
    float _1634 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _1636 = abs(_1626);
    float _1638 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1618);
    bool _1640 = !_1632;
    int _1642 = _1640 ? 0 : (-1);
    float _1644 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1634);
    bool _1646 = !_792;
    int _1648 = _1646 ? 0 : 1;
    float _1650 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1652 = abs(_1642);
    float _1654 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1638);
    int _1656 = ~_1636;
    int _1658 = _1656 + 1;
    int _1660 = _1658 + 1;
    float _1662 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    int _1664 = abs(_1648);
    float _1666 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1650);
    int _1668 = ~_1652;
    int _1670 = _1668 + 1;
    int _1672 = _1670 + 1;
    int _1674 = _1660 * as_type<int>(_1432);
    int _1676 = _1674 + _1630;
    float _1678 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1644);
    float _1680 = _1654 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1682 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1662);
    float _1684 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1666);
    int _1686 = _1672 * as_type<int>(_1440);
    int _1688 = _1686 + _1676;
    float _1690 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1692 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1694 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    int _1696 = ~_1664;
    int _1698 = _1696 + 1;
    int _1700 = _1698 + 1;
    float _1702 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1704 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1708 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1682);
    float _1710 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1692);
    float _1712 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1694);
    float _1714 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1716 = !_892;
    int _1718 = _1716 ? _1522 : (-1);
    float _1720 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1702);
    float _1722 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1704);
    float _1724 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1726 = _1688 * _1700;
    float _1728 = _1174 + 0.5;
    float _1730 = -_1028;
    float _1732 = _1730 + 1.0;
    float _1734 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1710);
    float _1736 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1712);
    float _1738 = _1708 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1740 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1720);
    float _1742 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1722);
    int _1744 = _1718 * _1664;
    int _1746 = _1744 + _1726;
    float _1748 = _1728 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1750 = -_1732;
    float _1752 = fma(_1168, _1750, _1472);
    float _1754 = -_1202;
    float _1756 = _1754 + 0.5;
    float _1758 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1734);
    float _1760 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1736);
    float _1762 = -_1120;
    float _1764 = _1762 + 1.0;
    float _1766 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1740);
    float _1768 = _1756 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1770 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1774 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1776 = _1758 + _1760;
    float _1778 = fma(_1056, _1764, _1492);
    float _1780 = _1748 * _1706;
    float _1782 = _1768 * _1724;
    float _1784 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1742);
    float _1786 = _1770 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1788 = _1772 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1790 = _1774 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1792 = _1474 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1794 = _1776 * 0.5;
    float _1796 = float(_1746);
    out.m_46.x = _1752;
    out.m_46.y = _1778;
    out.m_46.z = _1780;
    out.m_46.w = _1782;
    out.m_48.x = _1786;
    out.m_48.y = _1788;
    out.m_48.z = _1790;
    out.m_48.w = _1792;
    out.gl_Position.x = _1766;
    out.gl_Position.y = _1784;
    out.gl_Position.z = _1758;
    out.gl_Position.w = _1760;
    out.m_50.z = _1794;
    out.m_50.w = _1760;
    out.m_52.x = _1796;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _607 = false;
    bool _453 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_30.w;
    float _68 = trunc(_66);
    int _71 = int(_68);
    bool _75 = _71 >= 1;
    float _77 = 0.0;
    if (!_75)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _79 = _77;
    float _81 = _79;
    if (!_75)
    {
        out.m_33.x = 0.0;
    }
    int _83 = 0;
    if (!_75)
    {
        float _85 = _79 * 5.0;
        _83 = as_type<int>(_85);
    }
    int _87 = _83;
    int _89 = _87;
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1853 = as_type<float>(_87);
        out.gl_Position.z = _1853;
    }
    if (!_75)
    {
        return out;
    }
    float _91 = in.m_35.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _107 = 0.0;
    float _109 = 0.0;
    float _111 = 0.0;
    if (_101)
    {
        float _113 = float(_71);
        _107 = _113;
    }
    float _115 = _107;
    bool _117 = _105 >= _115;
    bool _119 = !_101;
    bool _121 = _117 || _119;
    if (_121)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _81;
    if (_121)
    {
        out.m_33.x = 0.0;
    }
    if (_121)
    {
        float _125 = _123 * 5.0;
        _89 = as_type<int>(_125);
    }
    int _127 = _89;
    float _129 = as_type<float>(_127);
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1923 = as_type<float>(_127);
        out.gl_Position.z = _1923;
    }
    if (_121)
    {
        return out;
    }
    float _131 = in.m_35.x;
    float _133 = in.m_35.y;
    float _135 = in.m_35.z;
    float _137 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _139 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _141 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _143 = _139 || _141;
    bool _145 = isnan(1.0);
    bool _147 = _143 || _145;
    float _149 = _137;
    if (!_147)
    {
        float _151 = _137 * _137;
        float _153 = _151 * 0.5;
        _129 = _153;
    }
    float _155 = _129;
    float _157 = 0.0;
    float _159 = _155;
    if (!_147)
    {
        float _161 = _105 * _105;
        float _163 = _161 * 0.5;
        _157 = _163;
    }
    float _165 = _157;
    if (!_147)
    {
        float _167 = _155 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _159 = _167;
    }
    float _169 = _159;
    bool _171 = !_147;
    float _173 = _169;
    if (!_171)
    {
        float _175 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _177 = log2(_175);
        float _179 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _181 = _179 + 1.0;
        float _183 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _185 = _137 * _177;
        float _187 = 1.0 / _181;
        float _189 = _183 * 0.693147182464599609375;
        float _191 = exp2(_185);
        float _193 = 1.0 / _189;
        float _195 = _191 + (-1.0);
        float _197 = -_195;
        float _199 = fma(_197, _193, _137);
        float _201 = _199 * _187;
        float _203 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _109 = _193;
        _173 = _203;
        _111 = _191;
    }
    float _205 = _109;
    float _207 = _173;
    float _209 = _111;
    bool _211 = !_147;
    float _213 = _205;
    float _215 = _209;
    if (!_211)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = 1.0 / _223;
        float _227 = _137 * _219;
        float _229 = exp2(_227);
        float _231 = -_229;
        float _233 = _231 + 1.0;
        float _235 = _233 * _225;
        _213 = _229;
        _215 = _223;
        _149 = _235;
    }
    float _237 = _213;
    float _239 = _215;
    float _241 = _149;
    float _243 = _239;
    float _245 = _237;
    if (!_147)
    {
        _243 = _105;
    }
    float _247 = _243;
    float _249 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _251 = _247;
    if (!_147)
    {
        float _253 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _245 = _253;
    }
    float _255 = _245;
    bool _257 = !_147;
    float _259 = _255;
    if (!_257)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _271 = _105 * _263;
        float _273 = exp2(_271);
        float _275 = _269 * 0.693147182464599609375;
        float _277 = 1.0 / _275;
        float _279 = 1.0 / _267;
        float _281 = _273 + (-1.0);
        float _283 = -_281;
        float _285 = fma(_283, _277, _105);
        float _287 = _285 * _279;
        float _289 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _259 = _289;
    }
    float _291 = _259;
    bool _293 = !_147;
    if (!_293)
    {
        float _295 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _297 = log2(_295);
        float _299 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _301 = _299 + 1.0;
        float _303 = 1.0 / _301;
        float _305 = _105 * _297;
        float _307 = exp2(_305);
        float _309 = -_307;
        float _311 = _309 + 1.0;
        float _313 = _311 * _303;
        _251 = _313;
    }
    float _315 = _251;
    float _317 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _319 = fma(_241, _133, _249);
    float _321 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _323 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _325 = fma(_315, _133, _317);
    float _327 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _329 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _331 = fma(_241, _131, _321);
    float _333 = fma(_315, _131, _323);
    float _335 = -_325;
    float _337 = _319 + _335;
    float _339 = fma(_241, _135, _327);
    float _341 = fma(_315, _135, _329);
    float _343 = -_333;
    float _345 = _331 + _343;
    float _347 = _337 * _337;
    float _349 = in.m_37.w;
    float _351 = -_341;
    float _353 = _339 + _351;
    float _355 = _337 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _357 = fma(_345, _345, _347);
    float _359 = _337 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _361 = _337 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _363 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[4].x, _355);
    float _365 = fma(_353, _353, _357);
    float _367 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[5].x, _359);
    float _369 = in.m_30.x;
    float _371 = in.m_30.y;
    float _373 = in.m_30.z;
    float _375 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[6].x, _361);
    float _377 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[4].z, _363);
    float _379 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[5].z, _367);
    float _381 = sqrt(_365);
    float _383 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[6].z, _375);
    bool _385 = _381 >= 9.9999999747524270787835121154785e-07;
    bool _387 = isnan(_381);
    bool _389 = _385 || _387;
    bool _391 = isnan(9.9999999747524270787835121154785e-07);
    bool _393 = _389 || _391;
    float _395 = fma(_331, _349, _369);
    float _397 = fma(_319, _349, _371);
    float _399 = fma(_339, _349, _373);
    float _401 = _367;
    float _403 = _377;
    float _405 = _379;
    if (_393)
    {
        _401 = _377;
    }
    float _407 = _401;
    float _409 = _407;
    if (_393)
    {
        _403 = _383;
    }
    float _411 = _403;
    float _413 = _411;
    if (!_393)
    {
        bool _415 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _417 = !_415;
        if (!_417)
        {
            float _419 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _421 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _423 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _425 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _419);
            float _427 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _421);
            float _429 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _423);
            float _431 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _425);
            float _433 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _427);
            float _435 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _429);
            float _437 = _431 * _431;
            float _439 = fma(_433, _433, _437);
            float _441 = fma(_435, _435, _439);
            float _443 = rsqrt(_441);
            float _445 = _443 * 9.9999999747524270787835121154785e-07;
            float _447 = _433 * _445;
            float _449 = _431 * _445;
            float _451 = _435 * _445;
            _405 = _449;
            _409 = _447;
            _413 = _451;
            _453 = true;
        }
        else
        {
            float _455 = _133 * _133;
            float _457 = fma(_131, _131, _455);
            float _459 = fma(_135, _135, _457);
            float _461 = sqrt(_459);
            bool _463 = _461 >= 9.9999999747524270787835121154785e-07;
            bool _465 = isnan(_461);
            bool _467 = _463 || _465;
            bool _469 = isnan(9.9999999747524270787835121154785e-07);
            bool _471 = _467 || _469;
            if (!_471)
            {
                float _473 = _371 * _371;
                float _475 = fma(_369, _369, _473);
                float _477 = fma(_373, _373, _475);
                float _479 = sqrt(_477);
                bool _481 = _479 >= 9.9999999747524270787835121154785e-07;
                bool _483 = isnan(_479);
                bool _485 = _481 || _483;
                bool _487 = isnan(9.9999999747524270787835121154785e-07);
                bool _489 = _485 || _487;
                if (!_489)
                {
                    float _491 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _493 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _491);
                    float _495 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _493);
                    float _497 = rsqrt(_495);
                    float _499 = _497 * 9.9999999747524270787835121154785e-07;
                    float _501 = _499 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _503 = _499 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _505 = _499 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _405 = _503;
                    _409 = _501;
                    _413 = _505;
                    _453 = true;
                }
                else
                {
                    float _507 = _371 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _509 = _371 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _511 = _371 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _513 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].x, _507);
                    float _515 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].x, _509);
                    float _517 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].x, _511);
                    float _519 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].z, _513);
                    float _521 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].z, _515);
                    float _523 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].z, _517);
                    float _525 = _519 * _519;
                    float _527 = fma(_521, _521, _525);
                    float _529 = fma(_523, _523, _527);
                    float _531 = rsqrt(_529);
                    float _533 = _531 * 9.9999999747524270787835121154785e-07;
                    float _535 = _521 * _533;
                    float _537 = _519 * _533;
                    float _539 = _523 * _533;
                    _405 = _537;
                    _409 = _535;
                    _413 = _539;
                    _453 = true;
                }
            }
            else
            {
                float _541 = _133 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _543 = _133 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _545 = _133 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _547 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[5].x, _541);
                float _549 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[4].x, _543);
                float _551 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[6].x, _545);
                float _553 = fma(_135, (*spvDescriptorSet0.vp_c10)._m0[5].z, _547);
                float _555 = fma(_135, (*spvDescriptorSet0.vp_c10)._m0[4].z, _549);
                float _557 = fma(_135, (*spvDescriptorSet0.vp_c10)._m0[6].z, _551);
                float _559 = _553 * _553;
                float _561 = fma(_555, _555, _559);
                float _563 = fma(_557, _557, _561);
                float _565 = rsqrt(_563);
                float _567 = _565 * 9.9999999747524270787835121154785e-07;
                float _569 = _555 * _567;
                float _571 = _553 * _567;
                float _573 = _557 * _567;
                _405 = _571;
                _409 = _569;
                _413 = _573;
            }
        }
    }
    _453 = false;
    float _575 = _405;
    float _577 = _409;
    float _579 = _413;
    bool _581 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _583 = !_581;
    float _603;
    float _605;
    if (!_583)
    {
        float _585 = in.m_39.x;
        float _587 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _589 = _585 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _591 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _593 = _591 * _587;
        float _595 = float(_71);
        float _597 = floor(_593);
        float _599 = -_597;
        float _601 = _593 + _599;
        _603 = _595;
        _605 = _601;
        _607 = true;
    }
    else
    {
        float _609 = float(_71);
        float _611 = 1.0 / _609;
        float _613 = _105 * _611;
        _603 = _609;
        _605 = _613;
    }
    _607 = false;
    float _615 = _603;
    float _617 = _605;
    float _619 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _621 = int(_619);
    float _623 = in.m_39.x;
    float _625 = _397 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _627 = in.m_39.y;
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _631 = _629 != 0;
    int _633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _635 = _633 != 0;
    int _637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _639 = _637 != 0;
    float _641 = _397 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _643 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _645 = int(_643);
    float _647 = in.m_39.w;
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _651 = _649 != 0;
    float _653 = _397 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _655 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].x, _641);
    bool _657 = !_635;
    int _659 = _657 ? 0 : 1;
    float _661 = float(_621);
    float _663 = 1.0 / _615;
    bool _665 = !_631;
    int _667 = _665 ? 0 : 1;
    float _669 = float(uint(_645));
    float _671 = 1.0 / _661;
    int _673 = ~_645;
    int _675 = _673 + 1;
    float _677 = _623 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _679 = ~_645;
    int _681 = _679 + 1;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _685 = float(_645);
    float _687 = _627 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _689 = abs(_667);
    float _691 = 1.0 / _669;
    float _693 = fma(_687, -2.0, _683);
    int _695 = ~_645;
    int _697 = _695 + 1;
    int _699 = ~_645;
    int _701 = _699 + 1;
    int _703 = ~_645;
    int _705 = _703 + 1;
    float _707 = _105 * _671;
    float _709 = trunc(_707);
    int _711 = int(_709);
    int _713 = as_type<int>(_691) + (-2);
    float _715 = float(uint(_711));
    float _717 = as_type<float>(_713) * _715;
    float _719 = trunc(_717);
    float _721 = precise::max(_719, 0.0);
    uint _724 = uint(_721);
    int _726 = _675 * int(_724);
    int _728 = _726 + _711;
    float _730 = float(uint(_728));
    float _732 = as_type<float>(_713) * _730;
    float _734 = as_type<float>(int(gl_VertexIndex));
    float _736 = trunc(_732);
    float _738 = precise::max(_736, 0.0);
    uint _740 = uint(_738);
    int _742 = int(_724) + int(_740);
    int _744 = _681 * _742;
    int _746 = _744 + _711;
    int _748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _750 = _748 != 0;
    float _752 = in.m_39.z;
    bool _754 = !_639;
    int _756 = _754 ? 0 : 1;
    bool _758 = uint(_746) >= uint(_645);
    bool _760 = !_750;
    float _762 = _760 ? 7.345489978790283203125 : 1.0;
    bool _764 = !_758;
    int _766 = _764 ? 0 : (-1);
    int _768 = as_type<int>(_734) & 1;
    bool _770 = _768 != 0;
    int _772 = as_type<int>(_734) & 2;
    bool _774 = _772 != 0;
    float _776 = _762 * _623;
    int _778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _780 = _778 != 0;
    bool _782 = !_651;
    int _784 = _782 ? 0 : 1;
    bool _786 = !_770;
    float _788 = _786 ? (-0.5) : 0.5;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _792 = _790 != 0;
    int _794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _796 = _794 != 0;
    int _798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _800 = _798 != 0;
    int _802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _804 = _802 != 0;
    bool _806 = !_780;
    int _808 = _806 ? 0 : 1;
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _812 = _810 != 0;
    bool _814 = _623 > 0.5;
    float _816 = floor(_776);
    bool _818 = !_774;
    float _820 = _818 ? (-0.5) : 0.5;
    bool _822 = _627 > 0.5;
    float _824 = -_788;
    int _826 = _814 ? as_type<int>(_824) : as_type<int>(_788);
    bool _828 = _752 > 0.5;
    float _830 = -_820;
    int _832 = _822 ? as_type<int>(_830) : as_type<int>(_820);
    bool _834 = _647 > 0.5;
    float _836 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].x, _625);
    float _838 = float(_711);
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _842 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].x, _653);
    int _844 = ~_742;
    int _846 = _844 + _766;
    int _848 = _846 + 1;
    float _850 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[4].z, _836);
    bool _852 = _838 >= _685;
    bool _854 = isnan(_838);
    bool _856 = _852 || _854;
    bool _858 = isnan(_685);
    bool _860 = _856 || _858;
    float _862 = float(_860);
    float _864 = -_840;
    float _866 = fma(_677, 2.0, _864);
    float _868 = -_816;
    float _870 = _776 + _868;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _874 = trunc(_862);
    int _876 = int(_874);
    float _878 = _870 * _685;
    float _880 = _105 * _685;
    float _882 = -_788;
    int _884 = _828 ? as_type<int>(_882) : as_type<int>(_788);
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _888 = _645 * _848;
    int _890 = _888 + _711;
    bool _892 = _645 == 0;
    float _894 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[6].z, _842);
    float _896 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[78].w, _886);
    float _898 = _880 * _663;
    bool _900 = !_892;
    int _902 = _900 ? _890 : (-1);
    float _904 = trunc(_878);
    int _906 = int(_904);
    int _908 = _645 + (-1);
    float _910 = _894 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _912 = abs(_659);
    float _914 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[78].z, _872);
    int _916 = ~_876;
    int _918 = _916 + 1;
    int _920 = _918 + 1;
    float _922 = -_105;
    float _924 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[76].x, _866);
    float _926 = trunc(_898);
    int _928 = int(_926);
    int _930 = abs(_808);
    int _932 = _902 * _920;
    float _934 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _936 = _876 * _908;
    int _938 = _936 + _932;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _944 = _906 * _930;
    int _946 = _944 + _711;
    int _948 = _938 * _912;
    float _950 = _575 * _575;
    float _952 = 1.0 / _942;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _958 = _928 * _689;
    int _960 = _958 + _948;
    float _962 = fma(_577, _577, _950);
    int _964 = abs(_756);
    float _966 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _968 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _970 = _910 + _968;
    float _972 = fma(_579, _579, _962);
    float _974 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[5].z, _655);
    float _976 = _850 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    out.m_33.x = _966;
    float _978 = 1.0 / _956;
    float _980 = _974 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _982 = _946 * _964;
    int _984 = _982 + _960;
    int _986 = ~_645;
    int _988 = _986 + 1;
    float _990 = _934 * _623;
    float _992 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _994 = _980 + _992;
    float _996 = float(uint(_946));
    float _998 = rsqrt(_972);
    int _1000 = abs(_784);
    float _1002 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1004 = _976 + _1002;
    float _1006 = _994 * _994;
    float _1008 = as_type<float>(_713) * _996;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1012 = _617 + _1010;
    int _1014 = _906 * _1000;
    int _1016 = _1014 + _984;
    float _1018 = fma(_1004, _1004, _1006);
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1020;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1026 = _1024 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1028 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _914);
    float _1030 = fma(_970, _970, _1018);
    float _1032 = float(uint(_1016));
    float _1034 = _1026 * _978;
    float _1036 = _1022 * _952;
    float _1038 = trunc(_990);
    int _1040 = int(_1038);
    float _1042 = _998 * _579;
    float _1044 = as_type<float>(_713) * _1032;
    float _1046 = _998 * _577;
    float _1048 = _998 * _575;
    float _1050 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1052 = _1042 * _1050;
    bool _1054 = !_800;
    float _1056 = _1054 ? _820 : as_type<float>(_832);
    float _1058 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1060 = _1046 * _1058;
    float _1062 = rsqrt(_1030);
    float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1066 = _1048 * _1064;
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1070 = -_1052;
    float _1072 = fma(_1046, _1068, _1070);
    float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1076 = -_1060;
    float _1078 = fma(_1048, _1074, _1076);
    float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1082 = -_1066;
    float _1084 = fma(_1042, _1080, _1082);
    float _1086 = _1072 * _1072;
    float _1088 = trunc(_1044);
    float _1090 = precise::max(_1088, 0.0);
    uint _1092 = uint(_1090);
    float _1094 = fma(_1084, _1084, _1086);
    float _1096 = fma(_1078, _1078, _1094);
    float _1098 = _994 * _1062;
    float _1100 = _1004 * _1062;
    float _1102 = -_1098;
    float _1104 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[18].w, _994);
    float _1106 = -_1100;
    float _1108 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1004);
    float _1110 = rsqrt(_1096);
    float _1112 = _1104 * _1104;
    int _1114 = _988 * int(_1092);
    int _1116 = _1114 + _1016;
    float _1118 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _693);
    float _1120 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _896);
    float _1122 = fma(_1108, _1108, _1112);
    float _1124 = _970 * _1062;
    float _1126 = float(uint(_1116));
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1130 = _617 + _1128;
    float _1132 = trunc(_1008);
    float _1134 = precise::max(_1132, 0.0);
    uint _1136 = uint(_1134);
    float _1138 = -_1124;
    float _1140 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[18].w, _970);
    float _1142 = fma(_1036, _1012, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1144 = as_type<float>(_713) * _1126;
    float _1146 = fma(_1034, _1130, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1148 = in.m_37.x;
    float _1150 = in.m_37.y;
    float _1152 = fma(_1140, _1140, _1122);
    int _1154 = _1040 << 4;
    int _1156 = _1154 + 1968;
    float _1158 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _788);
    float _1160 = trunc(_1144);
    float _1162 = precise::max(_1160, 0.0);
    uint _1164 = uint(_1162);
    bool _1166 = !_796;
    float _1168 = _1166 ? _788 : as_type<float>(_826);
    float _1170 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _820);
    bool _1172 = !_804;
    float _1174 = _1172 ? _788 : as_type<float>(_884);
    float _1176 = _1078 * _1110;
    float _1178 = -_820;
    int _1180 = _834 ? as_type<int>(_1178) : as_type<int>(_820);
    uint _1182 = uint(int(uint(_1156) >> uint(2)));
    uint _1184 = uint(int(uint(int(_1182)) >> uint(2)));
    int _1186 = int(_1182) & 3;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[int(_1184)][_1186];
    int _1190 = int(_1182) + 1;
    uint _1192 = uint(int(uint(_1190) >> uint(2)));
    int _1194 = _1190 & 3;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[int(_1192)][_1194];
    float _1198 = sqrt(_1152);
    bool _1200 = !_812;
    float _1202 = _1200 ? _820 : as_type<float>(_1180);
    float _1204 = _1084 * _1110;
    float _1206 = _1072 * _1110;
    int _1208 = _701 * int(_1136);
    int _1210 = _1208 + _946;
    int _1212 = int(_1092) + int(_1164);
    float _1214 = float(uint(_1210));
    float _1216 = _1148 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1218 = _1150 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1220 = as_type<float>(_713) * _1214;
    float _1222 = _1062 * _1198;
    float _1224 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1226 = _697 * _1212;
    int _1228 = _1226 + _1016;
    float _1230 = _1218 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1232 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1234 = isnan(_617);
    bool _1236 = _1232 || _1234;
    bool _1238 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1240 = _1236 || _1238;
    float _1242 = float(_1240);
    float _1244 = _1224 * _1222;
    float _1246 = trunc(_1220);
    float _1248 = precise::max(_1246, 0.0);
    uint _1250 = uint(_1248);
    bool _1252 = uint(_1228) >= uint(_645);
    int _1254 = _1156 + 8;
    uint _1256 = uint(int(uint(_1254) >> uint(2)));
    uint _1258 = uint(int(uint(int(_1256)) >> uint(2)));
    int _1260 = int(_1256) & 3;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[int(_1258)][_1260];
    bool _1264 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1266 = isnan(_617);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1272 = _1268 || _1270;
    float _1274 = float(_1272);
    float _1276 = _1230 * _1222;
    bool _1278 = !_1252;
    int _1280 = _1278 ? 0 : (-1);
    float _1282 = _1244 * _1158;
    bool _1284 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1286 = isnan(_617);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1292 = _1288 || _1290;
    float _1294 = float(_1292);
    float _1296 = -_1274;
    float _1298 = _1296 + 1.0;
    int _1300 = ~_1212;
    int _1302 = _1300 + _1280;
    int _1304 = _1302 + 1;
    float _1306 = _1276 * _1170;
    float _1308 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1310 = _1308 * 0.5;
    float _1312 = _1242 * _1298;
    float _1314 = -_1242;
    float _1316 = _1314 + 1.0;
    int _1318 = _645 * _1304;
    int _1320 = _1318 + _1016;
    float _1322 = _1048 * _1176;
    float _1324 = _1306 * _1046;
    float _1326 = _1294 * _1316;
    float _1328 = _1046 * _1206;
    bool _1330 = !_892;
    int _1332 = _1330 ? _1320 : (-1);
    float _1334 = -_1322;
    float _1336 = fma(_1042, _1206, _1334);
    float _1338 = fma(_1282, _1204, _1324);
    float _1340 = _1142 * _1326;
    int _1342 = _1332 >> 31;
    float _1344 = _1306 * _1042;
    float _1346 = fma(_1310, _1336, _1338);
    float _1348 = -_1328;
    float _1350 = fma(_1048, _1204, _1348);
    int _1352 = _1342 & 3;
    float _1354 = fma(_1282, _1176, _1344);
    float _1356 = _976 + _1346;
    float _1358 = _1196 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1360 = _1332 + _1352;
    float _1362 = fma(_1310, _1350, _1354);
    float _1364 = -_1294;
    float _1366 = _1364 + 1.0;
    int _1368 = _1360 >> 2;
    float _1370 = _1188 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1372 = int(_1136) + int(_1250);
    float _1374 = _910 + _1362;
    int _1376 = _1368 << 4;
    int _1378 = _1376 + 368;
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1384 = _1356 + _1382;
    float _1386 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1388 = _1374 + _1386;
    uint _1390 = uint(int(uint(_1378) >> uint(2)));
    uint _1392 = uint(int(uint(int(_1390)) >> uint(2)));
    int _1394 = int(_1390) & 3;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[int(_1392)][_1394];
    int _1398 = int(_1390) + 1;
    uint _1400 = uint(int(uint(_1398) >> uint(2)));
    int _1402 = _1398 & 3;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[int(_1400)][_1402];
    int _1406 = _705 * _1372;
    int _1408 = _1406 + _946;
    float _1410 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1340);
    float _1412 = _1388 * _1388;
    float _1414 = _1042 * _1204;
    float _1416 = _1358 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1418 = _1332 & 3;
    bool _1420 = _1418 != 0;
    float _1422 = _1262 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1424 = _1378 + 8;
    uint _1426 = uint(int(uint(_1424) >> uint(2)));
    uint _1428 = uint(int(uint(int(_1426)) >> uint(2)));
    int _1430 = int(_1426) & 3;
    float _1432 = (*spvDescriptorSet0.vp_c9)._m0[int(_1428)][_1430];
    int _1434 = int(_1426) + 1;
    uint _1436 = uint(int(uint(_1434) >> uint(2)));
    int _1438 = _1434 & 3;
    float _1440 = (*spvDescriptorSet0.vp_c9)._m0[int(_1436)][_1438];
    float _1442 = fma(_1384, _1384, _1412);
    float _1444 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1446 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1448 = uint(_1408) >= uint(_645);
    float _1450 = sqrt(_1442);
    bool _1452 = uint(_1418) > 1u;
    float _1454 = _1306 * _1048;
    out.m_44.x = _1444;
    out.m_44.y = _1416;
    out.m_44.z = _1446;
    out.m_44.w = _1380;
    int _1456 = _1332 & 3;
    bool _1458 = _1456 != 0;
    float _1460 = -_1414;
    float _1462 = fma(_1046, _1176, _1460);
    float _1464 = fma(_1282, _1206, _1454);
    float _1466 = _1168 + 0.5;
    float _1468 = fma(_1146, _1312, _1410);
    float _1470 = fma(_1310, _1462, _1464);
    float _1472 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[80].x, _924);
    float _1474 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1468);
    float _1476 = _980 + _1470;
    bool _1478 = !_1448;
    int _1480 = _1478 ? 0 : (-1);
    float _1482 = _1056 + (-0.5);
    bool _1484 = _1450 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1486 = _1458 ? 0 : 1;
    float _1488 = -_1482;
    float _1490 = -_1118;
    float _1492 = fma(_1488, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1490);
    int _1494 = ~_1372;
    int _1496 = _1494 + _1480;
    int _1498 = _1496 + 1;
    int _1500 = ~_1486;
    int _1502 = _1500 + 1;
    int _1504 = _1502 + 1;
    int _1506 = _1504;
    float _1508 = as_type<float>(_1498);
    float _1510 = _1356;
    float _1512 = _1374;
    if (!_1452)
    {
        int _1514 = ~_1486;
        int _1516 = _1514 + 1;
        _1506 = _1516;
    }
    int _1518 = _1506;
    int _1520 = _645 * _1498;
    int _1522 = _1520 + _946;
    bool _1524 = !_1420;
    int _1526 = _1524 ? 0 : 1;
    bool _1528 = uint(_1418) >= 2u;
    bool _1530 = _1418 != 3;
    int _1532 = abs(_1518);
    int _1534 = abs(_1526);
    if (!_1484)
    {
        _1508 = _1476;
    }
    float _1536 = _1508;
    bool _1538 = !_1484;
    float _1540 = _1536;
    if (!_1538)
    {
        float _1542 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1546 = _1450 + _1544;
        float _1548 = _1476 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1550 = rsqrt(_1442);
        float _1552 = _1546 * _1542;
        float _1554 = _1552 * 0.15915493667125701904296875;
        float _1556 = _1554 * 6.283185482025146484375;
        float _1558 = cos(_1556);
        float _1560 = _1554 * 6.283185482025146484375;
        float _1562 = sin(_1560);
        float _1564 = _1558 + (-1.0);
        float _1566 = _1564 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1568 = fma(_1562, _1548, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1570 = fma(_1476, _1558, _1566);
        float _1572 = _1550 * _1568;
        float _1574 = fma(_1384, _1572, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1576 = fma(_1388, _1572, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1540 = _1570;
        _1510 = _1574;
        _1512 = _1576;
    }
    float _1578 = _1540;
    float _1580 = _1510;
    float _1582 = _1512;
    float _1584 = -_1098;
    float _1586 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1578);
    int _1588 = ~_1532;
    int _1590 = _1588 + 1;
    int _1592 = _1590 + 1;
    float _1594 = -_1100;
    float _1596 = fma(_1594, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1580);
    int _1598 = _1528 ? 0 : 1;
    float _1600 = -_1124;
    float _1602 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1582);
    int _1604 = ~_1534;
    int _1606 = _1604 + 1;
    int _1608 = _1606 + 1;
    int _1610 = _1592 * as_type<int>(_1404);
    int _1612 = ~_1598;
    int _1614 = _1612 + 1;
    int _1616 = _1614 + 1;
    float _1618 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _1620 = _1616;
    if (_1530)
    {
        int _1622 = ~_1598;
        int _1624 = _1622 + 1;
        _1620 = _1624;
    }
    int _1626 = _1620;
    int _1628 = _1608 * as_type<int>(_1396);
    int _1630 = _1628 + _1610;
    bool _1632 = _1418 != 3;
    float _1634 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _1636 = abs(_1626);
    float _1638 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1618);
    bool _1640 = !_1632;
    int _1642 = _1640 ? 0 : (-1);
    float _1644 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1634);
    bool _1646 = !_792;
    int _1648 = _1646 ? 0 : 1;
    float _1650 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1652 = abs(_1642);
    float _1654 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1638);
    int _1656 = ~_1636;
    int _1658 = _1656 + 1;
    int _1660 = _1658 + 1;
    float _1662 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    int _1664 = abs(_1648);
    float _1666 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1650);
    int _1668 = ~_1652;
    int _1670 = _1668 + 1;
    int _1672 = _1670 + 1;
    int _1674 = _1660 * as_type<int>(_1432);
    int _1676 = _1674 + _1630;
    float _1678 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1644);
    float _1680 = _1654 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1682 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1662);
    float _1684 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1666);
    int _1686 = _1672 * as_type<int>(_1440);
    int _1688 = _1686 + _1676;
    float _1690 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1692 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1694 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    int _1696 = ~_1664;
    int _1698 = _1696 + 1;
    int _1700 = _1698 + 1;
    float _1702 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1704 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1708 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1682);
    float _1710 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1692);
    float _1712 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1694);
    float _1714 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1716 = !_892;
    int _1718 = _1716 ? _1522 : (-1);
    float _1720 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1702);
    float _1722 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1704);
    float _1724 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1726 = _1688 * _1700;
    float _1728 = _1174 + 0.5;
    float _1730 = -_1028;
    float _1732 = _1730 + 1.0;
    float _1734 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1710);
    float _1736 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1712);
    float _1738 = _1708 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1740 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1720);
    float _1742 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1722);
    int _1744 = _1718 * _1664;
    int _1746 = _1744 + _1726;
    float _1748 = _1728 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1750 = -_1732;
    float _1752 = fma(_1168, _1750, _1472);
    float _1754 = -_1202;
    float _1756 = _1754 + 0.5;
    float _1758 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1734);
    float _1760 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1736);
    float _1762 = -_1120;
    float _1764 = _1762 + 1.0;
    float _1766 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1740);
    float _1768 = _1756 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1770 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1774 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1776 = _1758 + _1760;
    float _1778 = fma(_1056, _1764, _1492);
    float _1780 = _1748 * _1706;
    float _1782 = _1768 * _1724;
    float _1784 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1742);
    float _1786 = _1770 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1788 = _1772 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1790 = _1774 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1792 = _1474 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1794 = _1776 * 0.5;
    float _1796 = float(_1746);
    out.m_46.x = _1752;
    out.m_46.y = _1778;
    out.m_46.z = _1780;
    out.m_46.w = _1782;
    out.m_48.x = _1786;
    out.m_48.y = _1788;
    out.m_48.z = _1790;
    out.m_48.w = _1792;
    out.gl_Position.x = _1766;
    out.gl_Position.y = _1784;
    out.gl_Position.z = _1758;
    out.gl_Position.w = _1760;
    out.m_50.z = _1794;
    out.m_50.w = _1760;
    out.m_52.x = _1796;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _607 = false;
    bool _453 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_30.w;
    float _68 = trunc(_66);
    int _71 = int(_68);
    bool _75 = _71 >= 1;
    float _77 = 0.0;
    if (!_75)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _79 = _77;
    float _81 = _79;
    if (!_75)
    {
        out.m_33.x = 0.0;
    }
    int _83 = 0;
    if (!_75)
    {
        float _85 = _79 * 5.0;
        _83 = as_type<int>(_85);
    }
    int _87 = _83;
    int _89 = _87;
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1853 = as_type<float>(_87);
        out.gl_Position.z = _1853;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _91 = in.m_35.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _107 = 0.0;
    float _109 = 0.0;
    float _111 = 0.0;
    if (_101)
    {
        float _113 = float(_71);
        _107 = _113;
    }
    float _115 = _107;
    bool _117 = _105 >= _115;
    bool _119 = !_101;
    bool _121 = _117 || _119;
    if (_121)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _81;
    if (_121)
    {
        out.m_33.x = 0.0;
    }
    if (_121)
    {
        float _125 = _123 * 5.0;
        _89 = as_type<int>(_125);
    }
    int _127 = _89;
    float _129 = as_type<float>(_127);
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1923 = as_type<float>(_127);
        out.gl_Position.z = _1923;
    }
    if (_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_35.x;
    float _133 = in.m_35.y;
    float _135 = in.m_35.z;
    float _137 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _139 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _141 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _143 = _139 || _141;
    bool _145 = isnan(1.0);
    bool _147 = _143 || _145;
    float _149 = _137;
    if (!_147)
    {
        float _151 = _137 * _137;
        float _153 = _151 * 0.5;
        _129 = _153;
    }
    float _155 = _129;
    float _157 = 0.0;
    float _159 = _155;
    if (!_147)
    {
        float _161 = _105 * _105;
        float _163 = _161 * 0.5;
        _157 = _163;
    }
    float _165 = _157;
    if (!_147)
    {
        float _167 = _155 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _159 = _167;
    }
    float _169 = _159;
    bool _171 = !_147;
    float _173 = _169;
    if (!_171)
    {
        float _175 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _177 = log2(_175);
        float _179 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _181 = _179 + 1.0;
        float _183 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _185 = _137 * _177;
        float _187 = 1.0 / _181;
        float _189 = _183 * 0.693147182464599609375;
        float _191 = exp2(_185);
        float _193 = 1.0 / _189;
        float _195 = _191 + (-1.0);
        float _197 = -_195;
        float _199 = fma(_197, _193, _137);
        float _201 = _199 * _187;
        float _203 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _109 = _193;
        _173 = _203;
        _111 = _191;
    }
    float _205 = _109;
    float _207 = _173;
    float _209 = _111;
    bool _211 = !_147;
    float _213 = _205;
    float _215 = _209;
    if (!_211)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = 1.0 / _223;
        float _227 = _137 * _219;
        float _229 = exp2(_227);
        float _231 = -_229;
        float _233 = _231 + 1.0;
        float _235 = _233 * _225;
        _213 = _229;
        _215 = _223;
        _149 = _235;
    }
    float _237 = _213;
    float _239 = _215;
    float _241 = _149;
    float _243 = _239;
    float _245 = _237;
    if (!_147)
    {
        _243 = _105;
    }
    float _247 = _243;
    float _249 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _251 = _247;
    if (!_147)
    {
        float _253 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _245 = _253;
    }
    float _255 = _245;
    bool _257 = !_147;
    float _259 = _255;
    if (!_257)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _271 = _105 * _263;
        float _273 = exp2(_271);
        float _275 = _269 * 0.693147182464599609375;
        float _277 = 1.0 / _275;
        float _279 = 1.0 / _267;
        float _281 = _273 + (-1.0);
        float _283 = -_281;
        float _285 = fma(_283, _277, _105);
        float _287 = _285 * _279;
        float _289 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _259 = _289;
    }
    float _291 = _259;
    bool _293 = !_147;
    if (!_293)
    {
        float _295 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _297 = log2(_295);
        float _299 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _301 = _299 + 1.0;
        float _303 = 1.0 / _301;
        float _305 = _105 * _297;
        float _307 = exp2(_305);
        float _309 = -_307;
        float _311 = _309 + 1.0;
        float _313 = _311 * _303;
        _251 = _313;
    }
    float _315 = _251;
    float _317 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _319 = fma(_241, _133, _249);
    float _321 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _323 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _325 = fma(_315, _133, _317);
    float _327 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _329 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _331 = fma(_241, _131, _321);
    float _333 = fma(_315, _131, _323);
    float _335 = -_325;
    float _337 = _319 + _335;
    float _339 = fma(_241, _135, _327);
    float _341 = fma(_315, _135, _329);
    float _343 = -_333;
    float _345 = _331 + _343;
    float _347 = _337 * _337;
    float _349 = in.m_37.w;
    float _351 = -_341;
    float _353 = _339 + _351;
    float _355 = _337 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _357 = fma(_345, _345, _347);
    float _359 = _337 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _361 = _337 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _363 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[4].x, _355);
    float _365 = fma(_353, _353, _357);
    float _367 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[5].x, _359);
    float _369 = in.m_30.x;
    float _371 = in.m_30.y;
    float _373 = in.m_30.z;
    float _375 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[6].x, _361);
    float _377 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[4].z, _363);
    float _379 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[5].z, _367);
    float _381 = sqrt(_365);
    float _383 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[6].z, _375);
    bool _385 = _381 >= 9.9999999747524270787835121154785e-07;
    bool _387 = isnan(_381);
    bool _389 = _385 || _387;
    bool _391 = isnan(9.9999999747524270787835121154785e-07);
    bool _393 = _389 || _391;
    float _395 = fma(_331, _349, _369);
    float _397 = fma(_319, _349, _371);
    float _399 = fma(_339, _349, _373);
    float _401 = _367;
    float _403 = _377;
    float _405 = _379;
    if (_393)
    {
        _401 = _377;
    }
    float _407 = _401;
    float _409 = _407;
    if (_393)
    {
        _403 = _383;
    }
    float _411 = _403;
    float _413 = _411;
    if (!_393)
    {
        bool _415 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _417 = !_415;
        if (!_417)
        {
            float _419 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _421 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _423 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _425 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _419);
            float _427 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _421);
            float _429 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _423);
            float _431 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _425);
            float _433 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _427);
            float _435 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _429);
            float _437 = _431 * _431;
            float _439 = fma(_433, _433, _437);
            float _441 = fma(_435, _435, _439);
            float _443 = rsqrt(_441);
            float _445 = _443 * 9.9999999747524270787835121154785e-07;
            float _447 = _433 * _445;
            float _449 = _431 * _445;
            float _451 = _435 * _445;
            _405 = _449;
            _409 = _447;
            _413 = _451;
            _453 = true;
        }
        else
        {
            float _455 = _133 * _133;
            float _457 = fma(_131, _131, _455);
            float _459 = fma(_135, _135, _457);
            float _461 = sqrt(_459);
            bool _463 = _461 >= 9.9999999747524270787835121154785e-07;
            bool _465 = isnan(_461);
            bool _467 = _463 || _465;
            bool _469 = isnan(9.9999999747524270787835121154785e-07);
            bool _471 = _467 || _469;
            if (!_471)
            {
                float _473 = _371 * _371;
                float _475 = fma(_369, _369, _473);
                float _477 = fma(_373, _373, _475);
                float _479 = sqrt(_477);
                bool _481 = _479 >= 9.9999999747524270787835121154785e-07;
                bool _483 = isnan(_479);
                bool _485 = _481 || _483;
                bool _487 = isnan(9.9999999747524270787835121154785e-07);
                bool _489 = _485 || _487;
                if (!_489)
                {
                    float _491 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _493 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _491);
                    float _495 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _493);
                    float _497 = rsqrt(_495);
                    float _499 = _497 * 9.9999999747524270787835121154785e-07;
                    float _501 = _499 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _503 = _499 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _505 = _499 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _405 = _503;
                    _409 = _501;
                    _413 = _505;
                    _453 = true;
                }
                else
                {
                    float _507 = _371 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _509 = _371 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _511 = _371 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _513 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].x, _507);
                    float _515 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].x, _509);
                    float _517 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].x, _511);
                    float _519 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].z, _513);
                    float _521 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].z, _515);
                    float _523 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].z, _517);
                    float _525 = _519 * _519;
                    float _527 = fma(_521, _521, _525);
                    float _529 = fma(_523, _523, _527);
                    float _531 = rsqrt(_529);
                    float _533 = _531 * 9.9999999747524270787835121154785e-07;
                    float _535 = _521 * _533;
                    float _537 = _519 * _533;
                    float _539 = _523 * _533;
                    _405 = _537;
                    _409 = _535;
                    _413 = _539;
                    _453 = true;
                }
            }
            else
            {
                float _541 = _133 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _543 = _133 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _545 = _133 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _547 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[5].x, _541);
                float _549 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[4].x, _543);
                float _551 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[6].x, _545);
                float _553 = fma(_135, (*spvDescriptorSet0.vp_c10)._m0[5].z, _547);
                float _555 = fma(_135, (*spvDescriptorSet0.vp_c10)._m0[4].z, _549);
                float _557 = fma(_135, (*spvDescriptorSet0.vp_c10)._m0[6].z, _551);
                float _559 = _553 * _553;
                float _561 = fma(_555, _555, _559);
                float _563 = fma(_557, _557, _561);
                float _565 = rsqrt(_563);
                float _567 = _565 * 9.9999999747524270787835121154785e-07;
                float _569 = _555 * _567;
                float _571 = _553 * _567;
                float _573 = _557 * _567;
                _405 = _571;
                _409 = _569;
                _413 = _573;
            }
        }
    }
    _453 = false;
    float _575 = _405;
    float _577 = _409;
    float _579 = _413;
    bool _581 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _583 = !_581;
    float _603;
    float _605;
    if (!_583)
    {
        float _585 = in.m_39.x;
        float _587 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _589 = _585 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _591 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _593 = _591 * _587;
        float _595 = float(_71);
        float _597 = floor(_593);
        float _599 = -_597;
        float _601 = _593 + _599;
        _603 = _595;
        _605 = _601;
        _607 = true;
    }
    else
    {
        float _609 = float(_71);
        float _611 = 1.0 / _609;
        float _613 = _105 * _611;
        _603 = _609;
        _605 = _613;
    }
    _607 = false;
    float _615 = _603;
    float _617 = _605;
    float _619 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _621 = int(_619);
    float _623 = in.m_39.x;
    float _625 = _397 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _627 = in.m_39.y;
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _631 = _629 != 0;
    int _633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _635 = _633 != 0;
    int _637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _639 = _637 != 0;
    float _641 = _397 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _643 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _645 = int(_643);
    float _647 = in.m_39.w;
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _651 = _649 != 0;
    float _653 = _397 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _655 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].x, _641);
    bool _657 = !_635;
    int _659 = _657 ? 0 : 1;
    float _661 = float(_621);
    float _663 = 1.0 / _615;
    bool _665 = !_631;
    int _667 = _665 ? 0 : 1;
    float _669 = float(uint(_645));
    float _671 = 1.0 / _661;
    int _673 = ~_645;
    int _675 = _673 + 1;
    float _677 = _623 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _679 = ~_645;
    int _681 = _679 + 1;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _685 = float(_645);
    float _687 = _627 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _689 = abs(_667);
    float _691 = 1.0 / _669;
    float _693 = fma(_687, -2.0, _683);
    int _695 = ~_645;
    int _697 = _695 + 1;
    int _699 = ~_645;
    int _701 = _699 + 1;
    int _703 = ~_645;
    int _705 = _703 + 1;
    float _707 = _105 * _671;
    float _709 = trunc(_707);
    int _711 = int(_709);
    int _713 = as_type<int>(_691) + (-2);
    float _715 = float(uint(_711));
    float _717 = as_type<float>(_713) * _715;
    float _719 = trunc(_717);
    float _721 = precise::max(_719, 0.0);
    uint _724 = uint(_721);
    int _726 = _675 * int(_724);
    int _728 = _726 + _711;
    float _730 = float(uint(_728));
    float _732 = as_type<float>(_713) * _730;
    float _734 = as_type<float>(int(gl_VertexIndex));
    float _736 = trunc(_732);
    float _738 = precise::max(_736, 0.0);
    uint _740 = uint(_738);
    int _742 = int(_724) + int(_740);
    int _744 = _681 * _742;
    int _746 = _744 + _711;
    int _748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _750 = _748 != 0;
    float _752 = in.m_39.z;
    bool _754 = !_639;
    int _756 = _754 ? 0 : 1;
    bool _758 = uint(_746) >= uint(_645);
    bool _760 = !_750;
    float _762 = _760 ? 7.345489978790283203125 : 1.0;
    bool _764 = !_758;
    int _766 = _764 ? 0 : (-1);
    int _768 = as_type<int>(_734) & 1;
    bool _770 = _768 != 0;
    int _772 = as_type<int>(_734) & 2;
    bool _774 = _772 != 0;
    float _776 = _762 * _623;
    int _778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _780 = _778 != 0;
    bool _782 = !_651;
    int _784 = _782 ? 0 : 1;
    bool _786 = !_770;
    float _788 = _786 ? (-0.5) : 0.5;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _792 = _790 != 0;
    int _794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _796 = _794 != 0;
    int _798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _800 = _798 != 0;
    int _802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _804 = _802 != 0;
    bool _806 = !_780;
    int _808 = _806 ? 0 : 1;
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _812 = _810 != 0;
    bool _814 = _623 > 0.5;
    float _816 = floor(_776);
    bool _818 = !_774;
    float _820 = _818 ? (-0.5) : 0.5;
    bool _822 = _627 > 0.5;
    float _824 = -_788;
    int _826 = _814 ? as_type<int>(_824) : as_type<int>(_788);
    bool _828 = _752 > 0.5;
    float _830 = -_820;
    int _832 = _822 ? as_type<int>(_830) : as_type<int>(_820);
    bool _834 = _647 > 0.5;
    float _836 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].x, _625);
    float _838 = float(_711);
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _842 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].x, _653);
    int _844 = ~_742;
    int _846 = _844 + _766;
    int _848 = _846 + 1;
    float _850 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[4].z, _836);
    bool _852 = _838 >= _685;
    bool _854 = isnan(_838);
    bool _856 = _852 || _854;
    bool _858 = isnan(_685);
    bool _860 = _856 || _858;
    float _862 = float(_860);
    float _864 = -_840;
    float _866 = fma(_677, 2.0, _864);
    float _868 = -_816;
    float _870 = _776 + _868;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _874 = trunc(_862);
    int _876 = int(_874);
    float _878 = _870 * _685;
    float _880 = _105 * _685;
    float _882 = -_788;
    int _884 = _828 ? as_type<int>(_882) : as_type<int>(_788);
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _888 = _645 * _848;
    int _890 = _888 + _711;
    bool _892 = _645 == 0;
    float _894 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[6].z, _842);
    float _896 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[78].w, _886);
    float _898 = _880 * _663;
    bool _900 = !_892;
    int _902 = _900 ? _890 : (-1);
    float _904 = trunc(_878);
    int _906 = int(_904);
    int _908 = _645 + (-1);
    float _910 = _894 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _912 = abs(_659);
    float _914 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[78].z, _872);
    int _916 = ~_876;
    int _918 = _916 + 1;
    int _920 = _918 + 1;
    float _922 = -_105;
    float _924 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[76].x, _866);
    float _926 = trunc(_898);
    int _928 = int(_926);
    int _930 = abs(_808);
    int _932 = _902 * _920;
    float _934 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _936 = _876 * _908;
    int _938 = _936 + _932;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _944 = _906 * _930;
    int _946 = _944 + _711;
    int _948 = _938 * _912;
    float _950 = _575 * _575;
    float _952 = 1.0 / _942;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _958 = _928 * _689;
    int _960 = _958 + _948;
    float _962 = fma(_577, _577, _950);
    int _964 = abs(_756);
    float _966 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _968 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _970 = _910 + _968;
    float _972 = fma(_579, _579, _962);
    float _974 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[5].z, _655);
    float _976 = _850 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    out.m_33.x = _966;
    float _978 = 1.0 / _956;
    float _980 = _974 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _982 = _946 * _964;
    int _984 = _982 + _960;
    int _986 = ~_645;
    int _988 = _986 + 1;
    float _990 = _934 * _623;
    float _992 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _994 = _980 + _992;
    float _996 = float(uint(_946));
    float _998 = rsqrt(_972);
    int _1000 = abs(_784);
    float _1002 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1004 = _976 + _1002;
    float _1006 = _994 * _994;
    float _1008 = as_type<float>(_713) * _996;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1012 = _617 + _1010;
    int _1014 = _906 * _1000;
    int _1016 = _1014 + _984;
    float _1018 = fma(_1004, _1004, _1006);
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1020;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1026 = _1024 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1028 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _914);
    float _1030 = fma(_970, _970, _1018);
    float _1032 = float(uint(_1016));
    float _1034 = _1026 * _978;
    float _1036 = _1022 * _952;
    float _1038 = trunc(_990);
    int _1040 = int(_1038);
    float _1042 = _998 * _579;
    float _1044 = as_type<float>(_713) * _1032;
    float _1046 = _998 * _577;
    float _1048 = _998 * _575;
    float _1050 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1052 = _1042 * _1050;
    bool _1054 = !_800;
    float _1056 = _1054 ? _820 : as_type<float>(_832);
    float _1058 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1060 = _1046 * _1058;
    float _1062 = rsqrt(_1030);
    float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1066 = _1048 * _1064;
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1070 = -_1052;
    float _1072 = fma(_1046, _1068, _1070);
    float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1076 = -_1060;
    float _1078 = fma(_1048, _1074, _1076);
    float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1082 = -_1066;
    float _1084 = fma(_1042, _1080, _1082);
    float _1086 = _1072 * _1072;
    float _1088 = trunc(_1044);
    float _1090 = precise::max(_1088, 0.0);
    uint _1092 = uint(_1090);
    float _1094 = fma(_1084, _1084, _1086);
    float _1096 = fma(_1078, _1078, _1094);
    float _1098 = _994 * _1062;
    float _1100 = _1004 * _1062;
    float _1102 = -_1098;
    float _1104 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[18].w, _994);
    float _1106 = -_1100;
    float _1108 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1004);
    float _1110 = rsqrt(_1096);
    float _1112 = _1104 * _1104;
    int _1114 = _988 * int(_1092);
    int _1116 = _1114 + _1016;
    float _1118 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _693);
    float _1120 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _896);
    float _1122 = fma(_1108, _1108, _1112);
    float _1124 = _970 * _1062;
    float _1126 = float(uint(_1116));
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1130 = _617 + _1128;
    float _1132 = trunc(_1008);
    float _1134 = precise::max(_1132, 0.0);
    uint _1136 = uint(_1134);
    float _1138 = -_1124;
    float _1140 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[18].w, _970);
    float _1142 = fma(_1036, _1012, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1144 = as_type<float>(_713) * _1126;
    float _1146 = fma(_1034, _1130, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1148 = in.m_37.x;
    float _1150 = in.m_37.y;
    float _1152 = fma(_1140, _1140, _1122);
    int _1154 = _1040 << 4;
    int _1156 = _1154 + 1968;
    float _1158 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _788);
    float _1160 = trunc(_1144);
    float _1162 = precise::max(_1160, 0.0);
    uint _1164 = uint(_1162);
    bool _1166 = !_796;
    float _1168 = _1166 ? _788 : as_type<float>(_826);
    float _1170 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _820);
    bool _1172 = !_804;
    float _1174 = _1172 ? _788 : as_type<float>(_884);
    float _1176 = _1078 * _1110;
    float _1178 = -_820;
    int _1180 = _834 ? as_type<int>(_1178) : as_type<int>(_820);
    uint _1182 = uint(int(uint(_1156) >> uint(2)));
    uint _1184 = uint(int(uint(int(_1182)) >> uint(2)));
    int _1186 = int(_1182) & 3;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[int(_1184)][_1186];
    int _1190 = int(_1182) + 1;
    uint _1192 = uint(int(uint(_1190) >> uint(2)));
    int _1194 = _1190 & 3;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[int(_1192)][_1194];
    float _1198 = sqrt(_1152);
    bool _1200 = !_812;
    float _1202 = _1200 ? _820 : as_type<float>(_1180);
    float _1204 = _1084 * _1110;
    float _1206 = _1072 * _1110;
    int _1208 = _701 * int(_1136);
    int _1210 = _1208 + _946;
    int _1212 = int(_1092) + int(_1164);
    float _1214 = float(uint(_1210));
    float _1216 = _1148 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1218 = _1150 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1220 = as_type<float>(_713) * _1214;
    float _1222 = _1062 * _1198;
    float _1224 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1226 = _697 * _1212;
    int _1228 = _1226 + _1016;
    float _1230 = _1218 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1232 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1234 = isnan(_617);
    bool _1236 = _1232 || _1234;
    bool _1238 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1240 = _1236 || _1238;
    float _1242 = float(_1240);
    float _1244 = _1224 * _1222;
    float _1246 = trunc(_1220);
    float _1248 = precise::max(_1246, 0.0);
    uint _1250 = uint(_1248);
    bool _1252 = uint(_1228) >= uint(_645);
    int _1254 = _1156 + 8;
    uint _1256 = uint(int(uint(_1254) >> uint(2)));
    uint _1258 = uint(int(uint(int(_1256)) >> uint(2)));
    int _1260 = int(_1256) & 3;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[int(_1258)][_1260];
    bool _1264 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1266 = isnan(_617);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1272 = _1268 || _1270;
    float _1274 = float(_1272);
    float _1276 = _1230 * _1222;
    bool _1278 = !_1252;
    int _1280 = _1278 ? 0 : (-1);
    float _1282 = _1244 * _1158;
    bool _1284 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1286 = isnan(_617);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1292 = _1288 || _1290;
    float _1294 = float(_1292);
    float _1296 = -_1274;
    float _1298 = _1296 + 1.0;
    int _1300 = ~_1212;
    int _1302 = _1300 + _1280;
    int _1304 = _1302 + 1;
    float _1306 = _1276 * _1170;
    float _1308 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1310 = _1308 * 0.5;
    float _1312 = _1242 * _1298;
    float _1314 = -_1242;
    float _1316 = _1314 + 1.0;
    int _1318 = _645 * _1304;
    int _1320 = _1318 + _1016;
    float _1322 = _1048 * _1176;
    float _1324 = _1306 * _1046;
    float _1326 = _1294 * _1316;
    float _1328 = _1046 * _1206;
    bool _1330 = !_892;
    int _1332 = _1330 ? _1320 : (-1);
    float _1334 = -_1322;
    float _1336 = fma(_1042, _1206, _1334);
    float _1338 = fma(_1282, _1204, _1324);
    float _1340 = _1142 * _1326;
    int _1342 = _1332 >> 31;
    float _1344 = _1306 * _1042;
    float _1346 = fma(_1310, _1336, _1338);
    float _1348 = -_1328;
    float _1350 = fma(_1048, _1204, _1348);
    int _1352 = _1342 & 3;
    float _1354 = fma(_1282, _1176, _1344);
    float _1356 = _976 + _1346;
    float _1358 = _1196 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1360 = _1332 + _1352;
    float _1362 = fma(_1310, _1350, _1354);
    float _1364 = -_1294;
    float _1366 = _1364 + 1.0;
    int _1368 = _1360 >> 2;
    float _1370 = _1188 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1372 = int(_1136) + int(_1250);
    float _1374 = _910 + _1362;
    int _1376 = _1368 << 4;
    int _1378 = _1376 + 368;
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1384 = _1356 + _1382;
    float _1386 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1388 = _1374 + _1386;
    uint _1390 = uint(int(uint(_1378) >> uint(2)));
    uint _1392 = uint(int(uint(int(_1390)) >> uint(2)));
    int _1394 = int(_1390) & 3;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[int(_1392)][_1394];
    int _1398 = int(_1390) + 1;
    uint _1400 = uint(int(uint(_1398) >> uint(2)));
    int _1402 = _1398 & 3;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[int(_1400)][_1402];
    int _1406 = _705 * _1372;
    int _1408 = _1406 + _946;
    float _1410 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1340);
    float _1412 = _1388 * _1388;
    float _1414 = _1042 * _1204;
    float _1416 = _1358 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1418 = _1332 & 3;
    bool _1420 = _1418 != 0;
    float _1422 = _1262 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1424 = _1378 + 8;
    uint _1426 = uint(int(uint(_1424) >> uint(2)));
    uint _1428 = uint(int(uint(int(_1426)) >> uint(2)));
    int _1430 = int(_1426) & 3;
    float _1432 = (*spvDescriptorSet0.vp_c9)._m0[int(_1428)][_1430];
    int _1434 = int(_1426) + 1;
    uint _1436 = uint(int(uint(_1434) >> uint(2)));
    int _1438 = _1434 & 3;
    float _1440 = (*spvDescriptorSet0.vp_c9)._m0[int(_1436)][_1438];
    float _1442 = fma(_1384, _1384, _1412);
    float _1444 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1446 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1448 = uint(_1408) >= uint(_645);
    float _1450 = sqrt(_1442);
    bool _1452 = uint(_1418) > 1u;
    float _1454 = _1306 * _1048;
    out.m_44.x = _1444;
    out.m_44.y = _1416;
    out.m_44.z = _1446;
    out.m_44.w = _1380;
    int _1456 = _1332 & 3;
    bool _1458 = _1456 != 0;
    float _1460 = -_1414;
    float _1462 = fma(_1046, _1176, _1460);
    float _1464 = fma(_1282, _1206, _1454);
    float _1466 = _1168 + 0.5;
    float _1468 = fma(_1146, _1312, _1410);
    float _1470 = fma(_1310, _1462, _1464);
    float _1472 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[80].x, _924);
    float _1474 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1468);
    float _1476 = _980 + _1470;
    bool _1478 = !_1448;
    int _1480 = _1478 ? 0 : (-1);
    float _1482 = _1056 + (-0.5);
    bool _1484 = _1450 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1486 = _1458 ? 0 : 1;
    float _1488 = -_1482;
    float _1490 = -_1118;
    float _1492 = fma(_1488, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1490);
    int _1494 = ~_1372;
    int _1496 = _1494 + _1480;
    int _1498 = _1496 + 1;
    int _1500 = ~_1486;
    int _1502 = _1500 + 1;
    int _1504 = _1502 + 1;
    int _1506 = _1504;
    float _1508 = as_type<float>(_1498);
    float _1510 = _1356;
    float _1512 = _1374;
    if (!_1452)
    {
        int _1514 = ~_1486;
        int _1516 = _1514 + 1;
        _1506 = _1516;
    }
    int _1518 = _1506;
    int _1520 = _645 * _1498;
    int _1522 = _1520 + _946;
    bool _1524 = !_1420;
    int _1526 = _1524 ? 0 : 1;
    bool _1528 = uint(_1418) >= 2u;
    bool _1530 = _1418 != 3;
    int _1532 = abs(_1518);
    int _1534 = abs(_1526);
    if (!_1484)
    {
        _1508 = _1476;
    }
    float _1536 = _1508;
    bool _1538 = !_1484;
    float _1540 = _1536;
    if (!_1538)
    {
        float _1542 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1546 = _1450 + _1544;
        float _1548 = _1476 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1550 = rsqrt(_1442);
        float _1552 = _1546 * _1542;
        float _1554 = _1552 * 0.15915493667125701904296875;
        float _1556 = _1554 * 6.283185482025146484375;
        float _1558 = cos(_1556);
        float _1560 = _1554 * 6.283185482025146484375;
        float _1562 = sin(_1560);
        float _1564 = _1558 + (-1.0);
        float _1566 = _1564 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1568 = fma(_1562, _1548, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1570 = fma(_1476, _1558, _1566);
        float _1572 = _1550 * _1568;
        float _1574 = fma(_1384, _1572, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1576 = fma(_1388, _1572, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1540 = _1570;
        _1510 = _1574;
        _1512 = _1576;
    }
    float _1578 = _1540;
    float _1580 = _1510;
    float _1582 = _1512;
    float _1584 = -_1098;
    float _1586 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1578);
    int _1588 = ~_1532;
    int _1590 = _1588 + 1;
    int _1592 = _1590 + 1;
    float _1594 = -_1100;
    float _1596 = fma(_1594, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1580);
    int _1598 = _1528 ? 0 : 1;
    float _1600 = -_1124;
    float _1602 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1582);
    int _1604 = ~_1534;
    int _1606 = _1604 + 1;
    int _1608 = _1606 + 1;
    int _1610 = _1592 * as_type<int>(_1404);
    int _1612 = ~_1598;
    int _1614 = _1612 + 1;
    int _1616 = _1614 + 1;
    float _1618 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _1620 = _1616;
    if (_1530)
    {
        int _1622 = ~_1598;
        int _1624 = _1622 + 1;
        _1620 = _1624;
    }
    int _1626 = _1620;
    int _1628 = _1608 * as_type<int>(_1396);
    int _1630 = _1628 + _1610;
    bool _1632 = _1418 != 3;
    float _1634 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _1636 = abs(_1626);
    float _1638 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1618);
    bool _1640 = !_1632;
    int _1642 = _1640 ? 0 : (-1);
    float _1644 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1634);
    bool _1646 = !_792;
    int _1648 = _1646 ? 0 : 1;
    float _1650 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1652 = abs(_1642);
    float _1654 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1638);
    int _1656 = ~_1636;
    int _1658 = _1656 + 1;
    int _1660 = _1658 + 1;
    float _1662 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    int _1664 = abs(_1648);
    float _1666 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1650);
    int _1668 = ~_1652;
    int _1670 = _1668 + 1;
    int _1672 = _1670 + 1;
    int _1674 = _1660 * as_type<int>(_1432);
    int _1676 = _1674 + _1630;
    float _1678 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1644);
    float _1680 = _1654 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1682 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1662);
    float _1684 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1666);
    int _1686 = _1672 * as_type<int>(_1440);
    int _1688 = _1686 + _1676;
    float _1690 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1692 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1694 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    int _1696 = ~_1664;
    int _1698 = _1696 + 1;
    int _1700 = _1698 + 1;
    float _1702 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1704 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1708 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1682);
    float _1710 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1692);
    float _1712 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1694);
    float _1714 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1716 = !_892;
    int _1718 = _1716 ? _1522 : (-1);
    float _1720 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1702);
    float _1722 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1704);
    float _1724 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1726 = _1688 * _1700;
    float _1728 = _1174 + 0.5;
    float _1730 = -_1028;
    float _1732 = _1730 + 1.0;
    float _1734 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1710);
    float _1736 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1712);
    float _1738 = _1708 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1740 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1720);
    float _1742 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1722);
    int _1744 = _1718 * _1664;
    int _1746 = _1744 + _1726;
    float _1748 = _1728 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1750 = -_1732;
    float _1752 = fma(_1168, _1750, _1472);
    float _1754 = -_1202;
    float _1756 = _1754 + 0.5;
    float _1758 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1734);
    float _1760 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1736);
    float _1762 = -_1120;
    float _1764 = _1762 + 1.0;
    float _1766 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1740);
    float _1768 = _1756 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1770 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1774 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1776 = _1758 + _1760;
    float _1778 = fma(_1056, _1764, _1492);
    float _1780 = _1748 * _1706;
    float _1782 = _1768 * _1724;
    float _1784 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1742);
    float _1786 = _1770 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1788 = _1772 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1790 = _1774 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1792 = _1474 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1794 = _1776 * 0.5;
    float _1796 = float(_1746);
    out.m_46.x = _1752;
    out.m_46.y = _1778;
    out.m_46.z = _1780;
    out.m_46.w = _1782;
    out.m_48.x = _1786;
    out.m_48.y = _1788;
    out.m_48.z = _1790;
    out.m_48.w = _1792;
    out.gl_Position.x = _1766;
    out.gl_Position.y = _1784;
    out.gl_Position.z = _1758;
    out.gl_Position.w = _1760;
    out.m_50.z = _1794;
    out.m_50.w = _1760;
    out.m_52.x = _1796;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

