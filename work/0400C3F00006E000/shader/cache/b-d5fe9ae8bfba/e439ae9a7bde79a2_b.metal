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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
};

struct main0_out
{
    float4 m_43 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_48 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_41 [[attribute(4)]];
    float4 m_39 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1529 = false;
    bool _1067 = false;
    bool _925 = false;
    bool _803 = false;
    bool _655 = false;
    bool _497 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_32.w;
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
        out.m_35.x = 0.0;
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
        float _2068 = as_type<float>(_87);
        out.gl_Position.z = _2068;
    }
    if (!_75)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _91 = in.m_37.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _107 = 0.0;
    if (_101)
    {
        float _109 = float(_71);
        _107 = _109;
    }
    float _111 = _107;
    bool _113 = _105 >= _111;
    bool _115 = !_101;
    bool _117 = _113 || _115;
    if (_117)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _81;
    if (_117)
    {
        out.m_35.x = 0.0;
    }
    if (_117)
    {
        float _121 = _119 * 5.0;
        _89 = as_type<int>(_121);
    }
    int _123 = _89;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2136 = as_type<float>(_123);
        out.gl_Position.z = _2136;
    }
    if (_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_37.x;
    float _127 = in.m_37.y;
    float _129 = in.m_37.z;
    float _131 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _133 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _135 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _137 = _133 || _135;
    bool _139 = isnan(1.0);
    bool _141 = _137 || _139;
    float _143 = 0.0;
    float _145 = _131;
    if (!_141)
    {
        float _147 = _131 * _131;
        float _149 = _147 * 0.5;
        _143 = _149;
    }
    float _151 = _143;
    float _153 = _151;
    if (!_141)
    {
        float _155 = _151 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _153 = _155;
    }
    float _157 = _153;
    bool _159 = !_141;
    float _161 = _157;
    float _163 = _127;
    float _165 = _127;
    float _167 = _129;
    if (!_159)
    {
        float _169 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _171 = log2(_169);
        float _173 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _175 = _173 + 1.0;
        float _177 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _179 = _131 * _171;
        float _181 = 1.0 / _175;
        float _183 = _177 * 0.693147182464599609375;
        float _185 = exp2(_179);
        float _187 = 1.0 / _183;
        float _189 = _185 + (-1.0);
        float _191 = -_189;
        float _193 = fma(_191, _187, _131);
        float _195 = _193 * _181;
        float _197 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _161 = _197;
    }
    float _199 = _161;
    float _201 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _203 = !_141;
    if (!_203)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = 1.0 / _211;
        float _215 = _131 * _207;
        float _217 = exp2(_215);
        float _219 = -_217;
        float _221 = _219 + 1.0;
        float _223 = _221 * _213;
        _145 = _223;
    }
    float _225 = _145;
    float _227 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _229 = _201 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _231 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _233 = _201 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _235 = _201 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _237 = fma(_227, (*spvDescriptorSet0.vp_c10)._m0[8].x, _229);
    float _239 = _229;
    float _241 = _233;
    if (!_141)
    {
        float _243 = _105 * _105;
        float _245 = _243 * 0.5;
        _239 = _245;
    }
    float _247 = _239;
    float _249 = fma(_227, (*spvDescriptorSet0.vp_c10)._m0[8].y, _233);
    float _251 = fma(_227, (*spvDescriptorSet0.vp_c10)._m0[8].z, _235);
    float _253 = fma(_231, (*spvDescriptorSet0.vp_c10)._m0[10].x, _237);
    if (!_141)
    {
        float _255 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _241 = _255;
    }
    float _257 = _241;
    bool _259 = !_141;
    float _261 = _257;
    if (!_259)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _273 = _105 * _265;
        float _275 = 1.0 / _269;
        float _277 = _271 * 0.693147182464599609375;
        float _279 = exp2(_273);
        float _281 = 1.0 / _277;
        float _283 = _279 + (-1.0);
        float _285 = -_283;
        float _287 = fma(_285, _281, _105);
        float _289 = _287 * _275;
        float _291 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _261 = _291;
    }
    float _293 = _261;
    float _295 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _297 = fma(_231, (*spvDescriptorSet0.vp_c10)._m0[10].z, _251);
    float _299 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _301 = fma(_231, (*spvDescriptorSet0.vp_c10)._m0[10].y, _249);
    float _303 = _295 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _305 = _295 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _307 = _295 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _309 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _311 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].y, _303);
    float _313 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].x, _305);
    float _315 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].z, _307);
    float _317 = fma(_225, _127, _301);
    float _319 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[10].y, _311);
    float _321 = _293;
    if (!_141)
    {
        _321 = _105;
    }
    float _323 = _321;
    bool _325 = !_141;
    float _327 = _323;
    if (!_325)
    {
        float _329 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _331 = log2(_329);
        float _333 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _335 = _333 + 1.0;
        float _337 = 1.0 / _335;
        float _339 = _105 * _331;
        float _341 = exp2(_339);
        float _343 = -_341;
        float _345 = _343 + 1.0;
        float _347 = _345 * _337;
        _327 = _347;
    }
    float _349 = _327;
    float _351 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[10].x, _313);
    float _353 = fma(_349, _127, _319);
    float _355 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[10].z, _315);
    float _357 = fma(_225, _125, _253);
    float _359 = fma(_349, _125, _351);
    float _361 = -_353;
    float _363 = _317 + _361;
    float _365 = fma(_349, _129, _355);
    float _367 = fma(_225, _129, _297);
    float _369 = -_359;
    float _371 = _357 + _369;
    float _373 = _363 * _363;
    float _375 = in.m_39.w;
    float _377 = -_365;
    float _379 = _367 + _377;
    float _381 = _363 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _383 = fma(_371, _371, _373);
    float _385 = _363 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _387 = _363 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _389 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].x, _381);
    float _391 = fma(_379, _379, _383);
    float _393 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].x, _385);
    float _395 = in.m_32.x;
    float _397 = in.m_32.y;
    float _399 = in.m_32.z;
    float _401 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].x, _387);
    float _403 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[4].z, _389);
    float _405 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[5].z, _393);
    float _407 = sqrt(_391);
    float _409 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[6].z, _401);
    bool _411 = _407 >= 9.9999999747524270787835121154785e-07;
    bool _413 = isnan(_407);
    bool _415 = _411 || _413;
    bool _417 = isnan(9.9999999747524270787835121154785e-07);
    bool _419 = _415 || _417;
    float _421 = fma(_357, _375, _395);
    float _423 = fma(_317, _375, _397);
    float _425 = fma(_367, _375, _399);
    float _427 = _393;
    float _429 = _379;
    float _431 = _409;
    if (_419)
    {
        _427 = _403;
    }
    float _433 = _427;
    float _435 = _433;
    if (_419)
    {
        _429 = _405;
    }
    float _437 = _429;
    float _439 = _437;
    if (!_419)
    {
        bool _441 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _443 = !_441;
        if (!_443)
        {
            float _445 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _447 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _449 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _451 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].y, _445);
            float _453 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].x, _447);
            float _455 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].z, _449);
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].y, _451);
            float _459 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].x, _453);
            float _461 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].z, _455);
            float _463 = _457 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _465 = _457 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _467 = _457 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _469 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[5].x, _463);
            float _471 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[4].x, _465);
            float _473 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[6].x, _467);
            float _475 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[5].z, _469);
            float _477 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[4].z, _471);
            float _479 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[6].z, _473);
            float _481 = _475 * _475;
            float _483 = fma(_477, _477, _481);
            float _485 = fma(_479, _479, _483);
            float _487 = rsqrt(_485);
            float _489 = _487 * 9.9999999747524270787835121154785e-07;
            float _491 = _477 * _489;
            float _493 = _475 * _489;
            float _495 = _479 * _489;
            _439 = _493;
            _435 = _491;
            _431 = _495;
            _497 = true;
        }
        else
        {
            float _499 = _127 * _127;
            float _501 = fma(_125, _125, _499);
            float _503 = fma(_129, _129, _501);
            float _505 = sqrt(_503);
            bool _507 = _505 >= 9.9999999747524270787835121154785e-07;
            bool _509 = isnan(_505);
            bool _511 = _507 || _509;
            bool _513 = isnan(9.9999999747524270787835121154785e-07);
            bool _515 = _511 || _513;
            if (!_515)
            {
                float _517 = _397 * _397;
                float _519 = fma(_395, _395, _517);
                float _521 = fma(_399, _399, _519);
                float _523 = sqrt(_521);
                bool _525 = _523 >= 9.9999999747524270787835121154785e-07;
                bool _527 = isnan(_523);
                bool _529 = _525 || _527;
                bool _531 = isnan(9.9999999747524270787835121154785e-07);
                bool _533 = _529 || _531;
                if (!_533)
                {
                    float _535 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _537 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _535);
                    float _539 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _537);
                    float _541 = rsqrt(_539);
                    float _543 = _541 * 9.9999999747524270787835121154785e-07;
                    float _545 = _543 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _547 = _543 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _549 = _543 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _439 = _547;
                    _435 = _545;
                    _431 = _549;
                    _497 = true;
                }
                else
                {
                    float _551 = _397 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _553 = _397 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _555 = _397 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _557 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].x, _551);
                    float _559 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].x, _553);
                    float _561 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].x, _555);
                    float _563 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[5].z, _557);
                    float _565 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[4].z, _559);
                    float _567 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[6].z, _561);
                    float _569 = _563 * _563;
                    float _571 = fma(_565, _565, _569);
                    float _573 = fma(_567, _567, _571);
                    float _575 = rsqrt(_573);
                    float _577 = _575 * 9.9999999747524270787835121154785e-07;
                    float _579 = _565 * _577;
                    float _581 = _563 * _577;
                    float _583 = _567 * _577;
                    _439 = _581;
                    _435 = _579;
                    _431 = _583;
                    _497 = true;
                }
            }
            else
            {
                float _585 = _127 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _587 = _127 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _589 = _127 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _591 = fma(_125, (*spvDescriptorSet0.vp_c10)._m0[5].x, _585);
                float _593 = fma(_125, (*spvDescriptorSet0.vp_c10)._m0[4].x, _587);
                float _595 = fma(_125, (*spvDescriptorSet0.vp_c10)._m0[6].x, _589);
                float _597 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[5].z, _591);
                float _599 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[4].z, _593);
                float _601 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[6].z, _595);
                float _603 = _597 * _597;
                float _605 = fma(_599, _599, _603);
                float _607 = fma(_601, _601, _605);
                float _609 = rsqrt(_607);
                float _611 = _609 * 9.9999999747524270787835121154785e-07;
                float _613 = _599 * _611;
                float _615 = _597 * _611;
                float _617 = _601 * _611;
                _439 = _615;
                _435 = _613;
                _431 = _617;
            }
        }
    }
    _497 = false;
    float _619 = _439;
    float _621 = _435;
    float _623 = _431;
    bool _625 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _627 = !_625;
    float _629 = _623;
    float _631 = _619;
    float _633 = _621;
    float _635 = _623;
    float _653;
    if (!_627)
    {
        float _637 = in.m_41.x;
        float _639 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _641 = _637 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _643 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _645 = _643 * _639;
        float _647 = floor(_645);
        float _649 = -_647;
        float _651 = _645 + _649;
        _653 = _651;
        _655 = true;
    }
    else
    {
        float _657 = float(_71);
        float _659 = 1.0 / _657;
        float _661 = _105 * _659;
        _653 = _661;
    }
    _655 = false;
    float _663 = _653;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _667 = _663 + _665;
    bool _669 = _663 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _671 = isnan(_663);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _681;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _689 = _663 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _691 = isnan(_663);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = -_679;
    float _703 = _701 + 1.0;
    float _705 = 1.0 / _687;
    bool _707 = _663 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _709 = isnan(_663);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _715 = _711 || _713;
    float _717 = float(_715);
    float _719 = _699 * _703;
    bool _721 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _723 = 1.0 / _683;
    float _725 = -_699;
    float _727 = _725 + 1.0;
    float _729 = _717 * _727;
    float _731 = -_717;
    float _733 = _731 + 1.0;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _739 = _667 * _723;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _743 = _663 + _741;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _745;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _749;
    float _753 = _743 * _705;
    float _755 = fma(_747, _739, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _757 = fma(_751, _739, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _763 = fma(_737, _753, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _765 = _755 * _729;
    float _767 = _757 * _729;
    float _769 = fma(_761, _753, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _771 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[143].x, _765);
    float _773 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[143].y, _767);
    float _775 = fma(_769, _719, _771);
    float _777 = fma(_763, _719, _773);
    float _779 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[145].x, _775);
    float _781 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[145].y, _777);
    bool _783 = !_721;
    float _801;
    if (!_783)
    {
        float _785 = in.m_41.x;
        float _787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _789 = _785 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _791 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[11].x, _105);
        float _793 = _791 * _787;
        float _795 = floor(_793);
        float _797 = -_795;
        float _799 = _793 + _797;
        _801 = _799;
        _803 = true;
    }
    else
    {
        float _805 = float(_71);
        float _807 = 1.0 / _805;
        float _809 = _105 * _807;
        _801 = _809;
    }
    _803 = false;
    float _811 = _801;
    float _813 = in.m_39.x;
    float _815 = in.m_39.y;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _819 = _811 + _817;
    bool _821 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _823 = isnan(_811);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _833;
    float _837 = -_831;
    float _839 = _837 + 1.0;
    bool _841 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _843 = 1.0 / _835;
    float _845 = _781 * _815;
    float _847 = _819 * _843;
    bool _849 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _851 = isnan(_811);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _857 = _853 || _855;
    float _859 = float(_857);
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _861;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _865;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _869;
    float _873 = _859 * _839;
    float _875 = fma(_863, _847, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _877 = fma(_867, _847, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _879 = fma(_871, _847, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _881 = -_859;
    float _883 = _881 + 1.0;
    float _885 = _875 * _873;
    float _887 = _877 * _873;
    float _889 = _879 * _873;
    float _891 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[107].x, _885);
    float _893 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[107].y, _887);
    float _895 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[107].z, _889);
    float _897 = _779 * _813;
    float _899 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[108].x, _891);
    float _901 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[108].y, _893);
    float _903 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[108].z, _895);
    bool _905 = !_841;
    float _923;
    if (!_905)
    {
        float _907 = in.m_41.x;
        float _909 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _911 = _907 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _913 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _915 = _913 * _909;
        float _917 = floor(_915);
        float _919 = -_917;
        float _921 = _915 + _919;
        _923 = _921;
        _925 = true;
    }
    else
    {
        float _927 = float(_71);
        float _929 = 1.0 / _927;
        float _931 = _105 * _929;
        _923 = _931;
    }
    _925 = false;
    float _933 = _923;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _937 = _933 + _935;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _943 = _933 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _945 = isnan(_933);
    bool _947 = _943 || _945;
    bool _949 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _951 = _947 || _949;
    float _953 = float(_951);
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _957 = _955 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _959 = _933 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _961 = isnan(_933);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _967 = _963 || _965;
    float _969 = float(_967);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _971;
    bool _975 = _933 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _977 = isnan(_933);
    bool _979 = _975 || _977;
    bool _981 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _983 = _979 || _981;
    float _985 = float(_983);
    float _987 = 1.0 / _941;
    float _989 = -_953;
    float _991 = _989 + 1.0;
    bool _993 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _995 = _969 * _991;
    float _997 = -_969;
    float _999 = _997 + 1.0;
    float _1001 = 1.0 / _957;
    float _1003 = _973 * _987;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1009 = fma(_1003, _937, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1011 = -_985;
    float _1013 = _1011 + 1.0;
    float _1015 = _1009 * _995;
    float _1017 = _1007 * _1001;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1021 = _933 + _1019;
    float _1023 = _953 * _1013;
    float _1025 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1015);
    float _1027 = _899 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1029 = fma(_1017, _1021, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1031 = _901 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1033 = _903 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1035 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1037 = fma(_1029, _1023, _1025);
    float _1039 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1037);
    float _1041 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1043 = _1033 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1045 = _1039 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.x = _1035;
    out.m_43.y = _1041;
    out.m_43.z = _1043;
    out.m_43.w = _1045;
    bool _1047 = !_993;
    float _1065;
    if (!_1047)
    {
        float _1049 = in.m_41.x;
        float _1051 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1053 = _1049 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1055 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[11].z, _105);
        float _1057 = _1055 * _1051;
        float _1059 = floor(_1057);
        float _1061 = -_1059;
        float _1063 = _1057 + _1061;
        _1065 = _1063;
        _1067 = true;
    }
    else
    {
        float _1069 = float(_71);
        float _1071 = 1.0 / _1069;
        float _1073 = _105 * _1071;
        _1065 = _1073;
    }
    _1067 = false;
    float _1075 = _1065;
    float _1077 = _619 * _619;
    float _1079 = as_type<float>(int(gl_VertexIndex));
    float _1081 = _845 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1083 = fma(_621, _621, _1077);
    float _1085 = _897 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1087 = _423 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1089 = fma(_623, _623, _1083);
    float _1091 = rsqrt(_1089);
    int _1093 = as_type<int>(_1079) & 1;
    bool _1095 = _1093 != 0;
    int _1097 = as_type<int>(_1079) & 2;
    bool _1099 = _1097 != 0;
    int _1101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1103 = _1101 != 0;
    float _1105 = _1091 * _623;
    float _1107 = _1091 * _621;
    float _1109 = _1091 * _619;
    int _1111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1113 = _1111 != 0;
    float _1115 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1117 = _1105 * _1115;
    float _1119 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1121 = _1109 * _1119;
    float _1123 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1125 = -_1117;
    float _1127 = fma(_1107, _1123, _1125);
    float _1129 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1131 = _1107 * _1129;
    float _1133 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1135 = -_1121;
    float _1137 = fma(_1105, _1133, _1135);
    float _1139 = _1127 * _1127;
    float _1141 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1143 = -_1131;
    float _1145 = fma(_1109, _1141, _1143);
    bool _1147 = !_1095;
    float _1149 = _1147 ? (-0.5) : 0.5;
    float _1151 = fma(_1137, _1137, _1139);
    float _1153 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1149);
    float _1155 = fma(_1145, _1145, _1151);
    bool _1157 = !_1099;
    float _1159 = _1157 ? (-0.5) : 0.5;
    float _1161 = _1085 * _1153;
    float _1163 = rsqrt(_1155);
    float _1165 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1159);
    float _1167 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1169 = _1081 * _1165;
    float _1171 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1087);
    float _1173 = _1169 * _1107;
    float _1175 = _1169 * _1105;
    float _1177 = _1169 * _1109;
    float _1179 = _1145 * _1163;
    float _1181 = _1137 * _1163;
    float _1183 = _1127 * _1163;
    float _1185 = _1109 * _1179;
    float _1187 = fma(_1161, _1181, _1173);
    float _1189 = _423 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1191 = fma(_1161, _1179, _1175);
    float _1193 = -_1185;
    float _1195 = fma(_1105, _1183, _1193);
    float _1197 = _1105 * _1181;
    float _1199 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1189);
    float _1201 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1171);
    float _1203 = fma(_1167, _1195, _1187);
    float _1205 = _1107 * _1183;
    float _1207 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1199);
    float _1209 = _1201 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1211 = in.m_41.x;
    float _1213 = in.m_41.y;
    float _1215 = -_1205;
    float _1217 = fma(_1109, _1181, _1215);
    float _1219 = _1207 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1221 = fma(_1161, _1183, _1177);
    float _1223 = -_1197;
    float _1225 = fma(_1107, _1179, _1223);
    float _1227 = fma(_1167, _1217, _1191);
    float _1229 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1231 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1229;
    float _1233 = _1219 + _1203;
    float _1235 = _423 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1237 = _1209 + _1227;
    float _1239 = 1.0 / _1231;
    float _1241 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1243 = _1233 + _1241;
    float _1245 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1235);
    float _1247 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1249 = _1237 + _1247;
    float _1251 = fma(_1167, _1225, _1221);
    float _1253 = _1243 * _1243;
    float _1255 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1245);
    float _1257 = _1249 * _1249;
    bool _1259 = _1075 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1261 = isnan(_1075);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1267 = _1263 || _1265;
    float _1269 = float(_1267);
    float _1271 = _1253 + _1257;
    bool _1273 = _1075 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1275 = isnan(_1075);
    bool _1277 = _1273 || _1275;
    bool _1279 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1281 = _1277 || _1279;
    float _1283 = float(_1281);
    float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1285;
    bool _1289 = _1211 > 0.5;
    float _1291 = sqrt(_1271);
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1295 = _1075 + _1293;
    bool _1297 = _1213 > 0.5;
    float _1299 = -_1269;
    float _1301 = _1299 + 1.0;
    float _1303 = _1295 * _1239;
    float _1305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1307 = -_1159;
    int _1309 = _1297 ? as_type<int>(_1307) : as_type<int>(_1159);
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1313 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1311;
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1315;
    float _1319 = -_1149;
    int _1321 = _1289 ? as_type<int>(_1319) : as_type<int>(_1149);
    float _1323 = fma(_1287, _1303, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1325 = !_1113;
    float _1327 = _1325 ? _1159 : as_type<float>(_1309);
    float _1329 = fma(_1317, _1303, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1331 = _1291 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1333 = _1255 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1335 = _1283 * _1301;
    float _1337 = fma(_1313, _1303, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1339 = !_1103;
    float _1341 = _1339 ? _1149 : as_type<float>(_1321);
    float _1343 = _1333 + _1251;
    float _1345 = _1301;
    float _1347 = _1253;
    float _1349 = _1257;
    float _1351 = _1233;
    float _1353 = _1237;
    float _1355 = _1337;
    float _1357 = _1089;
    if (!_1331)
    {
        _1345 = _1343;
    }
    float _1359 = _1345;
    bool _1361 = !_1331;
    float _1363 = _1359;
    if (!_1361)
    {
        float _1365 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1367 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1369 = _1291 + _1367;
        float _1371 = _1343 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1373 = rsqrt(_1271);
        float _1375 = _1369 * _1365;
        float _1377 = _1375 * 0.15915493667125701904296875;
        float _1379 = _1377 * 6.283185482025146484375;
        float _1381 = sin(_1379);
        float _1383 = _1377 * 6.283185482025146484375;
        float _1385 = cos(_1383);
        float _1387 = fma(_1381, _1371, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1389 = _1373 * _1387;
        float _1391 = fma(_1243, _1389, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1393 = _1385 + (-1.0);
        float _1395 = fma(_1249, _1389, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1397 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1399 = _1391 + _1397;
        float _1401 = _1393 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1403 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1405 = _1395 + _1403;
        float _1407 = _1399 * _1399;
        float _1409 = fma(_1343, _1385, _1401);
        float _1411 = _1405 * _1405;
        _1363 = _1409;
        _1347 = _1407;
        _1349 = _1411;
        _1351 = _1391;
        _1353 = _1395;
    }
    float _1413 = _1363;
    float _1415 = _1347;
    float _1417 = _1349;
    float _1419 = _1351;
    float _1421 = _1353;
    float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1425 = _1413 + _1423;
    float _1427 = _1323 * _1335;
    float _1429 = _1337 * _1335;
    float _1431 = _1329 * _1335;
    float _1433 = -_1283;
    float _1435 = _1433 + 1.0;
    float _1437 = fma(_1425, _1425, _1415);
    float _1439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1441 = _1341 + 0.5;
    float _1443 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1427);
    float _1445 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1429);
    float _1447 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1431);
    float _1449 = _1437 + _1417;
    float _1451 = -_1327;
    float _1453 = _1451 + 0.5;
    float _1455 = _1441 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1457 = fma(_1269, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1443);
    float _1459 = fma(_1269, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1445);
    float _1461 = fma(_1269, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1447);
    float _1463 = sqrt(_1449);
    float _1465 = _1455 * _1305;
    float _1467 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1469 = _1457 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1471 = _1459 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1473 = _1461 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1475 = _1467 * _1439;
    float _1477 = _1469 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1479 = _1471 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1481 = _1473 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_48.x = _1465;
    out.m_48.y = _1475;
    out.m_50.x = _1477;
    out.m_50.y = _1479;
    out.m_50.z = _1481;
    bool _1483 = _1463 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1485 = isnan(_1463);
    bool _1487 = _1483 || _1485;
    bool _1489 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1491 = _1487 || _1489;
    float _1493 = _1467;
    if (!_1491)
    {
        _1493 = 1.0;
    }
    float _1495 = _1493;
    bool _1497 = !_1491;
    float _1499 = _1495;
    if (!_1497)
    {
        bool _1501 = _1463 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1503 = isnan(_1463);
        bool _1505 = _1501 || _1503;
        bool _1507 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1509 = _1505 || _1507;
        if (!_1509)
        {
            float _1511 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1513 = _1463 + _1511;
            float _1515 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1517 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1515;
            float _1519 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1521 = _1519 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1523 = 1.0 / _1517;
            float _1525 = _1513 * _1523;
            float _1527 = fma(_1525, _1521, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1499 = _1527;
            _1529 = true;
        }
        else
        {
            bool _1531 = _1463 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1533 = isnan(_1463);
            bool _1535 = _1531 || _1533;
            bool _1537 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1539 = _1535 || _1537;
            if (!_1539)
            {
                float _1541 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1543 = _1463 + _1541;
                float _1545 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1547 = _1545 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1549 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1551 = _1549 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1553 = 1.0 / _1547;
                float _1555 = _1543 * _1553;
                float _1557 = fma(_1555, _1551, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1499 = _1557;
                _1529 = true;
            }
            else
            {
                _1499 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1529 = false;
    float _1559 = _1499;
    float _1561 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1563 = _1413 + _1561;
    float _1565 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1567 = _1419 + _1565;
    float _1569 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1571 = _1421 + _1569;
    float _1573 = fma(_1563, _1559, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1575 = fma(_1567, _1559, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1577 = fma(_1571, _1559, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1579 = -_1333;
    float _1581 = _1579 + _1573;
    float _1583 = -_1219;
    float _1585 = _1583 + _1575;
    float _1587 = -_1209;
    float _1589 = _1587 + _1577;
    float _1591 = _1581 * _1581;
    float _1593 = fma(_1585, _1585, _1591);
    float _1595 = fma(_1589, _1589, _1593);
    float _1597 = sqrt(_1595);
    bool _1599 = _1597 > 0.0;
    bool _1601 = !_1599;
    float _1603 = _1597;
    float _1605 = _1563;
    float _1607 = _1575;
    float _1609 = _1573;
    float _1611 = _1577;
    if (!_1601)
    {
        bool _1613 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1615 = _1465;
        if (_1613)
        {
            float _1617 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1615 = _1617;
        }
        float _1619 = _1615;
        if (_1613)
        {
            _1355 = _1089;
        }
        float _1621 = _1355;
        float _1623 = _1621;
        if (_1613)
        {
            float _1625 = _1619 * _621;
            _1603 = _1625;
        }
        float _1627 = _1603;
        float _1629 = _1627;
        if (_1613)
        {
            float _1631 = _1619 * _619;
            _1605 = _1631;
        }
        float _1633 = _1605;
        float _1635 = _1633;
        if (_1613)
        {
            float _1637 = _1619 * _623;
            _1357 = _1637;
        }
        float _1639 = _1357;
        float _1641 = _1639;
        if (!_1613)
        {
            float _1643 = _105 + 1.0;
            if (!_141)
            {
                float _1645 = _1643 * _1643;
                float _1647 = _1645 * 0.5;
                _629 = _1647;
            }
            float _1649 = _629;
            float _1651 = _1649;
            if (!_141)
            {
                float _1653 = _1649 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1651 = _1653;
            }
            float _1655 = _1651;
            bool _1657 = !_141;
            float _1659 = _1655;
            if (!_1657)
            {
                float _1661 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1663 = log2(_1661);
                float _1665 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1667 = _1665 + 1.0;
                float _1669 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1671 = _1663 * _1643;
                float _1673 = 1.0 / _1667;
                float _1675 = _1669 * 0.693147182464599609375;
                float _1677 = exp2(_1671);
                float _1679 = 1.0 / _1675;
                float _1681 = _1677 + (-1.0);
                float _1683 = -_1681;
                float _1685 = fma(_1683, _1679, _1643);
                float _1687 = _1685 * _1673;
                float _1689 = _1687 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1659 = _1689;
            }
            float _1691 = _1659;
            float _1693 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1695 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1697 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1699 = _1691;
            if (!_141)
            {
                _1699 = _1643;
            }
            float _1701 = _1699;
            float _1703 = _1693 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _1705 = _1693 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _1707 = _1693 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _1709 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1703);
            float _1711 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1705);
            float _1713 = fma(_1697, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1709);
            bool _1715 = !_141;
            float _1717 = _1701;
            if (!_1715)
            {
                float _1719 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1721 = log2(_1719);
                float _1723 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1725 = _1723 + 1.0;
                float _1727 = 1.0 / _1725;
                float _1729 = _1721 * _1643;
                float _1731 = exp2(_1729);
                float _1733 = -_1731;
                float _1735 = _1733 + 1.0;
                float _1737 = _1735 * _1727;
                _1717 = _1737;
            }
            float _1739 = _1717;
            float _1741 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1707);
            float _1743 = fma(_1697, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1711);
            float _1745 = fma(_1739, _127, _1713);
            float _1747 = fma(_1697, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1741);
            float _1749 = fma(_1739, _125, _1743);
            float _1751 = -_353;
            float _1753 = _1751 + _1745;
            float _1755 = fma(_1739, _129, _1747);
            float _1757 = -_359;
            float _1759 = _1757 + _1749;
            float _1761 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1763 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1765 = -_365;
            float _1767 = _1765 + _1755;
            float _1769 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1771 = fma(_1759, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1761);
            float _1773 = fma(_1759, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1763);
            float _1775 = fma(_1759, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1769);
            float _1777 = fma(_1767, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1771);
            float _1779 = fma(_1767, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1773);
            float _1781 = fma(_1767, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1775);
            float _1783 = _1777 * _1777;
            float _1785 = fma(_1779, _1779, _1783);
            float _1787 = fma(_1781, _1781, _1785);
            _1623 = _1787;
            _631 = _1777;
            _633 = _1779;
            _635 = _1781;
            _1629 = _1779;
            _1635 = _1777;
            _1641 = _1781;
            _163 = _1769;
        }
        float _1789 = _1623;
        float _1791 = _631;
        float _1793 = _633;
        float _1795 = _635;
        float _1797 = _1629;
        float _1799 = _1635;
        float _1801 = _1641;
        float _1803 = _163;
        float _1805 = sqrt(_1789);
        float _1807 = rsqrt(_1595);
        bool _1809 = _1805 > 0.0;
        float _1811 = _1585 * _1807;
        float _1813 = _1581 * _1807;
        float _1815 = _1589 * _1807;
        bool _1817 = !_1809;
        _165 = _1803;
        _167 = _1813;
        if (!_1817)
        {
            float _1819 = rsqrt(_1789);
            float _1821 = _1819 * _1791;
            float _1823 = _1819 * _1793;
            float _1825 = _1813 * _1821;
            float _1827 = _1819 * _1795;
            float _1829 = fma(_1811, _1823, _1825);
            float _1831 = fma(_1815, _1827, _1829);
            float _1833 = _1831 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1835 = fma(_1797, _1833, _1575);
            float _1837 = fma(_1799, _1833, _1573);
            float _1839 = fma(_1801, _1833, _1577);
            _1607 = _1835;
            _1609 = _1837;
            _1611 = _1839;
            _165 = _1827;
        }
    }
    float _1841 = _1607;
    float _1843 = _1609;
    float _1845 = _1611;
    float _1847 = _165;
    float _1849 = _167;
    bool _1851 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1853 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1855 = _1851 || _1853;
    bool _1857 = isnan(0.5);
    bool _1859 = _1855 || _1857;
    float _1861 = _1849;
    float _1863 = _1847;
    float _1865 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (_1859)
    {
        _1861 = _1841;
    }
    float _1867 = _1861;
    float _1869 = _1867;
    if (_1859)
    {
        _1863 = _1843;
    }
    float _1871 = _1863;
    float _1873 = _1871;
    if (_1859)
    {
        _1865 = _1845;
    }
    float _1875 = _1865;
    float _1877 = _1875;
    if (!_1859)
    {
        float _1879 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1881 = _1333 + _1879;
        float _1883 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1885 = _1219 + _1883;
        float _1887 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1889 = -_1219;
        float _1891 = _1889 + _1841;
        float _1893 = _1881 * _1881;
        float _1895 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1897 = _1209 + _1895;
        float _1899 = -_1333;
        float _1901 = _1899 + _1843;
        float _1903 = -_1209;
        float _1905 = _1903 + _1845;
        float _1907 = fma(_1885, _1885, _1893);
        float _1909 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1911 = fma(_1897, _1897, _1907);
        float _1913 = sqrt(_1911);
        float _1915 = _1887 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1917 = precise::min(_1913, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1919 = _1917 * _1909;
        float _1921 = _1915 * _1919;
        float _1923 = fma(_1891, _1921, _1219);
        float _1925 = fma(_1901, _1921, _1333);
        float _1927 = fma(_1905, _1921, _1209);
        _1873 = _1925;
        _1869 = _1923;
        _1877 = _1927;
    }
    float _1929 = _1873;
    float _1931 = _1869;
    float _1933 = _1877;
    float _1935 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1937 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1939 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1941 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1943 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1935);
    float _1945 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1937);
    float _1947 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1939);
    float _1949 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1941);
    float _1951 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1943);
    float _1953 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1945);
    float _1955 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1947);
    float _1957 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1949);
    float _1959 = _1951 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1961 = _1953 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1963 = _1955 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1965 = _1957 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1967 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1969 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1971 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1973 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1975 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1967);
    float _1977 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1969);
    float _1979 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1971);
    float _1981 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1973);
    float _1983 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1975);
    float _1985 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1977);
    float _1987 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1979);
    float _1989 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1981);
    float _1991 = fma(_1965, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1983);
    float _1993 = fma(_1965, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1985);
    float _1995 = fma(_1965, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1987);
    float _1997 = fma(_1965, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1989);
    float _1999 = _1991 + _1995;
    float _2001 = _1993 + _1995;
    float _2003 = _1995 * 0.5;
    float _2005 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2007 = _1999 * 0.5;
    float _2009 = _2001 * 0.5;
    float _2011 = fma(_1997, -0.5, _2003);
    out.m_35.x = _2005;
    out.gl_Position.x = _1991;
    out.gl_Position.y = _1997;
    out.gl_Position.z = _1993;
    out.gl_Position.w = _1995;
    out.m_52.x = _2007;
    out.m_52.y = _2011;
    out.m_52.z = _2009;
    out.m_52.w = _1995;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1529 = false;
    bool _1067 = false;
    bool _925 = false;
    bool _803 = false;
    bool _655 = false;
    bool _497 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_32.w;
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
        out.m_35.x = 0.0;
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
        float _2068 = as_type<float>(_87);
        out.gl_Position.z = _2068;
    }
    if (!_75)
    {
        return out;
    }
    float _91 = in.m_37.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _107 = 0.0;
    if (_101)
    {
        float _109 = float(_71);
        _107 = _109;
    }
    float _111 = _107;
    bool _113 = _105 >= _111;
    bool _115 = !_101;
    bool _117 = _113 || _115;
    if (_117)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _81;
    if (_117)
    {
        out.m_35.x = 0.0;
    }
    if (_117)
    {
        float _121 = _119 * 5.0;
        _89 = as_type<int>(_121);
    }
    int _123 = _89;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2136 = as_type<float>(_123);
        out.gl_Position.z = _2136;
    }
    if (_117)
    {
        return out;
    }
    float _125 = in.m_37.x;
    float _127 = in.m_37.y;
    float _129 = in.m_37.z;
    float _131 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _133 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _135 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _137 = _133 || _135;
    bool _139 = isnan(1.0);
    bool _141 = _137 || _139;
    float _143 = 0.0;
    float _145 = _131;
    if (!_141)
    {
        float _147 = _131 * _131;
        float _149 = _147 * 0.5;
        _143 = _149;
    }
    float _151 = _143;
    float _153 = _151;
    if (!_141)
    {
        float _155 = _151 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _153 = _155;
    }
    float _157 = _153;
    bool _159 = !_141;
    float _161 = _157;
    float _163 = _127;
    float _165 = _127;
    float _167 = _129;
    if (!_159)
    {
        float _169 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _171 = log2(_169);
        float _173 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _175 = _173 + 1.0;
        float _177 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _179 = _131 * _171;
        float _181 = 1.0 / _175;
        float _183 = _177 * 0.693147182464599609375;
        float _185 = exp2(_179);
        float _187 = 1.0 / _183;
        float _189 = _185 + (-1.0);
        float _191 = -_189;
        float _193 = fma(_191, _187, _131);
        float _195 = _193 * _181;
        float _197 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _161 = _197;
    }
    float _199 = _161;
    float _201 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _203 = !_141;
    if (!_203)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = 1.0 / _211;
        float _215 = _131 * _207;
        float _217 = exp2(_215);
        float _219 = -_217;
        float _221 = _219 + 1.0;
        float _223 = _221 * _213;
        _145 = _223;
    }
    float _225 = _145;
    float _227 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _229 = _201 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _231 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _233 = _201 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _235 = _201 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _237 = fma(_227, (*spvDescriptorSet0.vp_c10)._m0[8].x, _229);
    float _239 = _229;
    float _241 = _233;
    if (!_141)
    {
        float _243 = _105 * _105;
        float _245 = _243 * 0.5;
        _239 = _245;
    }
    float _247 = _239;
    float _249 = fma(_227, (*spvDescriptorSet0.vp_c10)._m0[8].y, _233);
    float _251 = fma(_227, (*spvDescriptorSet0.vp_c10)._m0[8].z, _235);
    float _253 = fma(_231, (*spvDescriptorSet0.vp_c10)._m0[10].x, _237);
    if (!_141)
    {
        float _255 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _241 = _255;
    }
    float _257 = _241;
    bool _259 = !_141;
    float _261 = _257;
    if (!_259)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _273 = _105 * _265;
        float _275 = 1.0 / _269;
        float _277 = _271 * 0.693147182464599609375;
        float _279 = exp2(_273);
        float _281 = 1.0 / _277;
        float _283 = _279 + (-1.0);
        float _285 = -_283;
        float _287 = fma(_285, _281, _105);
        float _289 = _287 * _275;
        float _291 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _261 = _291;
    }
    float _293 = _261;
    float _295 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _297 = fma(_231, (*spvDescriptorSet0.vp_c10)._m0[10].z, _251);
    float _299 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _301 = fma(_231, (*spvDescriptorSet0.vp_c10)._m0[10].y, _249);
    float _303 = _295 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _305 = _295 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _307 = _295 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _309 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _311 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].y, _303);
    float _313 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].x, _305);
    float _315 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].z, _307);
    float _317 = fma(_225, _127, _301);
    float _319 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[10].y, _311);
    float _321 = _293;
    if (!_141)
    {
        _321 = _105;
    }
    float _323 = _321;
    bool _325 = !_141;
    float _327 = _323;
    if (!_325)
    {
        float _329 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _331 = log2(_329);
        float _333 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _335 = _333 + 1.0;
        float _337 = 1.0 / _335;
        float _339 = _105 * _331;
        float _341 = exp2(_339);
        float _343 = -_341;
        float _345 = _343 + 1.0;
        float _347 = _345 * _337;
        _327 = _347;
    }
    float _349 = _327;
    float _351 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[10].x, _313);
    float _353 = fma(_349, _127, _319);
    float _355 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[10].z, _315);
    float _357 = fma(_225, _125, _253);
    float _359 = fma(_349, _125, _351);
    float _361 = -_353;
    float _363 = _317 + _361;
    float _365 = fma(_349, _129, _355);
    float _367 = fma(_225, _129, _297);
    float _369 = -_359;
    float _371 = _357 + _369;
    float _373 = _363 * _363;
    float _375 = in.m_39.w;
    float _377 = -_365;
    float _379 = _367 + _377;
    float _381 = _363 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _383 = fma(_371, _371, _373);
    float _385 = _363 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _387 = _363 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _389 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].x, _381);
    float _391 = fma(_379, _379, _383);
    float _393 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].x, _385);
    float _395 = in.m_32.x;
    float _397 = in.m_32.y;
    float _399 = in.m_32.z;
    float _401 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].x, _387);
    float _403 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[4].z, _389);
    float _405 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[5].z, _393);
    float _407 = sqrt(_391);
    float _409 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[6].z, _401);
    bool _411 = _407 >= 9.9999999747524270787835121154785e-07;
    bool _413 = isnan(_407);
    bool _415 = _411 || _413;
    bool _417 = isnan(9.9999999747524270787835121154785e-07);
    bool _419 = _415 || _417;
    float _421 = fma(_357, _375, _395);
    float _423 = fma(_317, _375, _397);
    float _425 = fma(_367, _375, _399);
    float _427 = _393;
    float _429 = _379;
    float _431 = _409;
    if (_419)
    {
        _427 = _403;
    }
    float _433 = _427;
    float _435 = _433;
    if (_419)
    {
        _429 = _405;
    }
    float _437 = _429;
    float _439 = _437;
    if (!_419)
    {
        bool _441 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _443 = !_441;
        if (!_443)
        {
            float _445 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _447 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _449 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _451 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].y, _445);
            float _453 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].x, _447);
            float _455 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].z, _449);
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].y, _451);
            float _459 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].x, _453);
            float _461 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].z, _455);
            float _463 = _457 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _465 = _457 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _467 = _457 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _469 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[5].x, _463);
            float _471 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[4].x, _465);
            float _473 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[6].x, _467);
            float _475 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[5].z, _469);
            float _477 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[4].z, _471);
            float _479 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[6].z, _473);
            float _481 = _475 * _475;
            float _483 = fma(_477, _477, _481);
            float _485 = fma(_479, _479, _483);
            float _487 = rsqrt(_485);
            float _489 = _487 * 9.9999999747524270787835121154785e-07;
            float _491 = _477 * _489;
            float _493 = _475 * _489;
            float _495 = _479 * _489;
            _439 = _493;
            _435 = _491;
            _431 = _495;
            _497 = true;
        }
        else
        {
            float _499 = _127 * _127;
            float _501 = fma(_125, _125, _499);
            float _503 = fma(_129, _129, _501);
            float _505 = sqrt(_503);
            bool _507 = _505 >= 9.9999999747524270787835121154785e-07;
            bool _509 = isnan(_505);
            bool _511 = _507 || _509;
            bool _513 = isnan(9.9999999747524270787835121154785e-07);
            bool _515 = _511 || _513;
            if (!_515)
            {
                float _517 = _397 * _397;
                float _519 = fma(_395, _395, _517);
                float _521 = fma(_399, _399, _519);
                float _523 = sqrt(_521);
                bool _525 = _523 >= 9.9999999747524270787835121154785e-07;
                bool _527 = isnan(_523);
                bool _529 = _525 || _527;
                bool _531 = isnan(9.9999999747524270787835121154785e-07);
                bool _533 = _529 || _531;
                if (!_533)
                {
                    float _535 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _537 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _535);
                    float _539 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _537);
                    float _541 = rsqrt(_539);
                    float _543 = _541 * 9.9999999747524270787835121154785e-07;
                    float _545 = _543 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _547 = _543 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _549 = _543 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _439 = _547;
                    _435 = _545;
                    _431 = _549;
                    _497 = true;
                }
                else
                {
                    float _551 = _397 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _553 = _397 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _555 = _397 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _557 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].x, _551);
                    float _559 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].x, _553);
                    float _561 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].x, _555);
                    float _563 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[5].z, _557);
                    float _565 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[4].z, _559);
                    float _567 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[6].z, _561);
                    float _569 = _563 * _563;
                    float _571 = fma(_565, _565, _569);
                    float _573 = fma(_567, _567, _571);
                    float _575 = rsqrt(_573);
                    float _577 = _575 * 9.9999999747524270787835121154785e-07;
                    float _579 = _565 * _577;
                    float _581 = _563 * _577;
                    float _583 = _567 * _577;
                    _439 = _581;
                    _435 = _579;
                    _431 = _583;
                    _497 = true;
                }
            }
            else
            {
                float _585 = _127 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _587 = _127 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _589 = _127 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _591 = fma(_125, (*spvDescriptorSet0.vp_c10)._m0[5].x, _585);
                float _593 = fma(_125, (*spvDescriptorSet0.vp_c10)._m0[4].x, _587);
                float _595 = fma(_125, (*spvDescriptorSet0.vp_c10)._m0[6].x, _589);
                float _597 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[5].z, _591);
                float _599 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[4].z, _593);
                float _601 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[6].z, _595);
                float _603 = _597 * _597;
                float _605 = fma(_599, _599, _603);
                float _607 = fma(_601, _601, _605);
                float _609 = rsqrt(_607);
                float _611 = _609 * 9.9999999747524270787835121154785e-07;
                float _613 = _599 * _611;
                float _615 = _597 * _611;
                float _617 = _601 * _611;
                _439 = _615;
                _435 = _613;
                _431 = _617;
            }
        }
    }
    _497 = false;
    float _619 = _439;
    float _621 = _435;
    float _623 = _431;
    bool _625 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _627 = !_625;
    float _629 = _623;
    float _631 = _619;
    float _633 = _621;
    float _635 = _623;
    float _653;
    if (!_627)
    {
        float _637 = in.m_41.x;
        float _639 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _641 = _637 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _643 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _645 = _643 * _639;
        float _647 = floor(_645);
        float _649 = -_647;
        float _651 = _645 + _649;
        _653 = _651;
        _655 = true;
    }
    else
    {
        float _657 = float(_71);
        float _659 = 1.0 / _657;
        float _661 = _105 * _659;
        _653 = _661;
    }
    _655 = false;
    float _663 = _653;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _667 = _663 + _665;
    bool _669 = _663 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _671 = isnan(_663);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _681;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _689 = _663 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _691 = isnan(_663);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = -_679;
    float _703 = _701 + 1.0;
    float _705 = 1.0 / _687;
    bool _707 = _663 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _709 = isnan(_663);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _715 = _711 || _713;
    float _717 = float(_715);
    float _719 = _699 * _703;
    bool _721 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _723 = 1.0 / _683;
    float _725 = -_699;
    float _727 = _725 + 1.0;
    float _729 = _717 * _727;
    float _731 = -_717;
    float _733 = _731 + 1.0;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _739 = _667 * _723;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _743 = _663 + _741;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _745;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _749;
    float _753 = _743 * _705;
    float _755 = fma(_747, _739, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _757 = fma(_751, _739, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _763 = fma(_737, _753, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _765 = _755 * _729;
    float _767 = _757 * _729;
    float _769 = fma(_761, _753, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _771 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[143].x, _765);
    float _773 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[143].y, _767);
    float _775 = fma(_769, _719, _771);
    float _777 = fma(_763, _719, _773);
    float _779 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[145].x, _775);
    float _781 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[145].y, _777);
    bool _783 = !_721;
    float _801;
    if (!_783)
    {
        float _785 = in.m_41.x;
        float _787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _789 = _785 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _791 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[11].x, _105);
        float _793 = _791 * _787;
        float _795 = floor(_793);
        float _797 = -_795;
        float _799 = _793 + _797;
        _801 = _799;
        _803 = true;
    }
    else
    {
        float _805 = float(_71);
        float _807 = 1.0 / _805;
        float _809 = _105 * _807;
        _801 = _809;
    }
    _803 = false;
    float _811 = _801;
    float _813 = in.m_39.x;
    float _815 = in.m_39.y;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _819 = _811 + _817;
    bool _821 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _823 = isnan(_811);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _833;
    float _837 = -_831;
    float _839 = _837 + 1.0;
    bool _841 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _843 = 1.0 / _835;
    float _845 = _781 * _815;
    float _847 = _819 * _843;
    bool _849 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _851 = isnan(_811);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _857 = _853 || _855;
    float _859 = float(_857);
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _861;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _865;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _869;
    float _873 = _859 * _839;
    float _875 = fma(_863, _847, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _877 = fma(_867, _847, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _879 = fma(_871, _847, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _881 = -_859;
    float _883 = _881 + 1.0;
    float _885 = _875 * _873;
    float _887 = _877 * _873;
    float _889 = _879 * _873;
    float _891 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[107].x, _885);
    float _893 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[107].y, _887);
    float _895 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[107].z, _889);
    float _897 = _779 * _813;
    float _899 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[108].x, _891);
    float _901 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[108].y, _893);
    float _903 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[108].z, _895);
    bool _905 = !_841;
    float _923;
    if (!_905)
    {
        float _907 = in.m_41.x;
        float _909 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _911 = _907 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _913 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _915 = _913 * _909;
        float _917 = floor(_915);
        float _919 = -_917;
        float _921 = _915 + _919;
        _923 = _921;
        _925 = true;
    }
    else
    {
        float _927 = float(_71);
        float _929 = 1.0 / _927;
        float _931 = _105 * _929;
        _923 = _931;
    }
    _925 = false;
    float _933 = _923;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _937 = _933 + _935;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _943 = _933 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _945 = isnan(_933);
    bool _947 = _943 || _945;
    bool _949 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _951 = _947 || _949;
    float _953 = float(_951);
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _957 = _955 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _959 = _933 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _961 = isnan(_933);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _967 = _963 || _965;
    float _969 = float(_967);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _971;
    bool _975 = _933 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _977 = isnan(_933);
    bool _979 = _975 || _977;
    bool _981 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _983 = _979 || _981;
    float _985 = float(_983);
    float _987 = 1.0 / _941;
    float _989 = -_953;
    float _991 = _989 + 1.0;
    bool _993 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _995 = _969 * _991;
    float _997 = -_969;
    float _999 = _997 + 1.0;
    float _1001 = 1.0 / _957;
    float _1003 = _973 * _987;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1009 = fma(_1003, _937, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1011 = -_985;
    float _1013 = _1011 + 1.0;
    float _1015 = _1009 * _995;
    float _1017 = _1007 * _1001;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1021 = _933 + _1019;
    float _1023 = _953 * _1013;
    float _1025 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1015);
    float _1027 = _899 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1029 = fma(_1017, _1021, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1031 = _901 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1033 = _903 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1035 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1037 = fma(_1029, _1023, _1025);
    float _1039 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1037);
    float _1041 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1043 = _1033 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1045 = _1039 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.x = _1035;
    out.m_43.y = _1041;
    out.m_43.z = _1043;
    out.m_43.w = _1045;
    bool _1047 = !_993;
    float _1065;
    if (!_1047)
    {
        float _1049 = in.m_41.x;
        float _1051 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1053 = _1049 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1055 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[11].z, _105);
        float _1057 = _1055 * _1051;
        float _1059 = floor(_1057);
        float _1061 = -_1059;
        float _1063 = _1057 + _1061;
        _1065 = _1063;
        _1067 = true;
    }
    else
    {
        float _1069 = float(_71);
        float _1071 = 1.0 / _1069;
        float _1073 = _105 * _1071;
        _1065 = _1073;
    }
    _1067 = false;
    float _1075 = _1065;
    float _1077 = _619 * _619;
    float _1079 = as_type<float>(int(gl_VertexIndex));
    float _1081 = _845 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1083 = fma(_621, _621, _1077);
    float _1085 = _897 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1087 = _423 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1089 = fma(_623, _623, _1083);
    float _1091 = rsqrt(_1089);
    int _1093 = as_type<int>(_1079) & 1;
    bool _1095 = _1093 != 0;
    int _1097 = as_type<int>(_1079) & 2;
    bool _1099 = _1097 != 0;
    int _1101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1103 = _1101 != 0;
    float _1105 = _1091 * _623;
    float _1107 = _1091 * _621;
    float _1109 = _1091 * _619;
    int _1111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1113 = _1111 != 0;
    float _1115 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1117 = _1105 * _1115;
    float _1119 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1121 = _1109 * _1119;
    float _1123 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1125 = -_1117;
    float _1127 = fma(_1107, _1123, _1125);
    float _1129 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1131 = _1107 * _1129;
    float _1133 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1135 = -_1121;
    float _1137 = fma(_1105, _1133, _1135);
    float _1139 = _1127 * _1127;
    float _1141 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1143 = -_1131;
    float _1145 = fma(_1109, _1141, _1143);
    bool _1147 = !_1095;
    float _1149 = _1147 ? (-0.5) : 0.5;
    float _1151 = fma(_1137, _1137, _1139);
    float _1153 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1149);
    float _1155 = fma(_1145, _1145, _1151);
    bool _1157 = !_1099;
    float _1159 = _1157 ? (-0.5) : 0.5;
    float _1161 = _1085 * _1153;
    float _1163 = rsqrt(_1155);
    float _1165 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1159);
    float _1167 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1169 = _1081 * _1165;
    float _1171 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1087);
    float _1173 = _1169 * _1107;
    float _1175 = _1169 * _1105;
    float _1177 = _1169 * _1109;
    float _1179 = _1145 * _1163;
    float _1181 = _1137 * _1163;
    float _1183 = _1127 * _1163;
    float _1185 = _1109 * _1179;
    float _1187 = fma(_1161, _1181, _1173);
    float _1189 = _423 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1191 = fma(_1161, _1179, _1175);
    float _1193 = -_1185;
    float _1195 = fma(_1105, _1183, _1193);
    float _1197 = _1105 * _1181;
    float _1199 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1189);
    float _1201 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1171);
    float _1203 = fma(_1167, _1195, _1187);
    float _1205 = _1107 * _1183;
    float _1207 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1199);
    float _1209 = _1201 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1211 = in.m_41.x;
    float _1213 = in.m_41.y;
    float _1215 = -_1205;
    float _1217 = fma(_1109, _1181, _1215);
    float _1219 = _1207 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1221 = fma(_1161, _1183, _1177);
    float _1223 = -_1197;
    float _1225 = fma(_1107, _1179, _1223);
    float _1227 = fma(_1167, _1217, _1191);
    float _1229 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1231 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1229;
    float _1233 = _1219 + _1203;
    float _1235 = _423 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1237 = _1209 + _1227;
    float _1239 = 1.0 / _1231;
    float _1241 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1243 = _1233 + _1241;
    float _1245 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1235);
    float _1247 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1249 = _1237 + _1247;
    float _1251 = fma(_1167, _1225, _1221);
    float _1253 = _1243 * _1243;
    float _1255 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1245);
    float _1257 = _1249 * _1249;
    bool _1259 = _1075 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1261 = isnan(_1075);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1267 = _1263 || _1265;
    float _1269 = float(_1267);
    float _1271 = _1253 + _1257;
    bool _1273 = _1075 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1275 = isnan(_1075);
    bool _1277 = _1273 || _1275;
    bool _1279 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1281 = _1277 || _1279;
    float _1283 = float(_1281);
    float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1285;
    bool _1289 = _1211 > 0.5;
    float _1291 = sqrt(_1271);
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1295 = _1075 + _1293;
    bool _1297 = _1213 > 0.5;
    float _1299 = -_1269;
    float _1301 = _1299 + 1.0;
    float _1303 = _1295 * _1239;
    float _1305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1307 = -_1159;
    int _1309 = _1297 ? as_type<int>(_1307) : as_type<int>(_1159);
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1313 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1311;
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1315;
    float _1319 = -_1149;
    int _1321 = _1289 ? as_type<int>(_1319) : as_type<int>(_1149);
    float _1323 = fma(_1287, _1303, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1325 = !_1113;
    float _1327 = _1325 ? _1159 : as_type<float>(_1309);
    float _1329 = fma(_1317, _1303, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1331 = _1291 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1333 = _1255 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1335 = _1283 * _1301;
    float _1337 = fma(_1313, _1303, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1339 = !_1103;
    float _1341 = _1339 ? _1149 : as_type<float>(_1321);
    float _1343 = _1333 + _1251;
    float _1345 = _1301;
    float _1347 = _1253;
    float _1349 = _1257;
    float _1351 = _1233;
    float _1353 = _1237;
    float _1355 = _1337;
    float _1357 = _1089;
    if (!_1331)
    {
        _1345 = _1343;
    }
    float _1359 = _1345;
    bool _1361 = !_1331;
    float _1363 = _1359;
    if (!_1361)
    {
        float _1365 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1367 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1369 = _1291 + _1367;
        float _1371 = _1343 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1373 = rsqrt(_1271);
        float _1375 = _1369 * _1365;
        float _1377 = _1375 * 0.15915493667125701904296875;
        float _1379 = _1377 * 6.283185482025146484375;
        float _1381 = sin(_1379);
        float _1383 = _1377 * 6.283185482025146484375;
        float _1385 = cos(_1383);
        float _1387 = fma(_1381, _1371, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1389 = _1373 * _1387;
        float _1391 = fma(_1243, _1389, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1393 = _1385 + (-1.0);
        float _1395 = fma(_1249, _1389, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1397 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1399 = _1391 + _1397;
        float _1401 = _1393 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1403 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1405 = _1395 + _1403;
        float _1407 = _1399 * _1399;
        float _1409 = fma(_1343, _1385, _1401);
        float _1411 = _1405 * _1405;
        _1363 = _1409;
        _1347 = _1407;
        _1349 = _1411;
        _1351 = _1391;
        _1353 = _1395;
    }
    float _1413 = _1363;
    float _1415 = _1347;
    float _1417 = _1349;
    float _1419 = _1351;
    float _1421 = _1353;
    float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1425 = _1413 + _1423;
    float _1427 = _1323 * _1335;
    float _1429 = _1337 * _1335;
    float _1431 = _1329 * _1335;
    float _1433 = -_1283;
    float _1435 = _1433 + 1.0;
    float _1437 = fma(_1425, _1425, _1415);
    float _1439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1441 = _1341 + 0.5;
    float _1443 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1427);
    float _1445 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1429);
    float _1447 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1431);
    float _1449 = _1437 + _1417;
    float _1451 = -_1327;
    float _1453 = _1451 + 0.5;
    float _1455 = _1441 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1457 = fma(_1269, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1443);
    float _1459 = fma(_1269, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1445);
    float _1461 = fma(_1269, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1447);
    float _1463 = sqrt(_1449);
    float _1465 = _1455 * _1305;
    float _1467 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1469 = _1457 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1471 = _1459 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1473 = _1461 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1475 = _1467 * _1439;
    float _1477 = _1469 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1479 = _1471 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1481 = _1473 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_48.x = _1465;
    out.m_48.y = _1475;
    out.m_50.x = _1477;
    out.m_50.y = _1479;
    out.m_50.z = _1481;
    bool _1483 = _1463 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1485 = isnan(_1463);
    bool _1487 = _1483 || _1485;
    bool _1489 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1491 = _1487 || _1489;
    float _1493 = _1467;
    if (!_1491)
    {
        _1493 = 1.0;
    }
    float _1495 = _1493;
    bool _1497 = !_1491;
    float _1499 = _1495;
    if (!_1497)
    {
        bool _1501 = _1463 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1503 = isnan(_1463);
        bool _1505 = _1501 || _1503;
        bool _1507 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1509 = _1505 || _1507;
        if (!_1509)
        {
            float _1511 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1513 = _1463 + _1511;
            float _1515 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1517 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1515;
            float _1519 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1521 = _1519 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1523 = 1.0 / _1517;
            float _1525 = _1513 * _1523;
            float _1527 = fma(_1525, _1521, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1499 = _1527;
            _1529 = true;
        }
        else
        {
            bool _1531 = _1463 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1533 = isnan(_1463);
            bool _1535 = _1531 || _1533;
            bool _1537 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1539 = _1535 || _1537;
            if (!_1539)
            {
                float _1541 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1543 = _1463 + _1541;
                float _1545 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1547 = _1545 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1549 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1551 = _1549 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1553 = 1.0 / _1547;
                float _1555 = _1543 * _1553;
                float _1557 = fma(_1555, _1551, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1499 = _1557;
                _1529 = true;
            }
            else
            {
                _1499 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1529 = false;
    float _1559 = _1499;
    float _1561 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1563 = _1413 + _1561;
    float _1565 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1567 = _1419 + _1565;
    float _1569 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1571 = _1421 + _1569;
    float _1573 = fma(_1563, _1559, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1575 = fma(_1567, _1559, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1577 = fma(_1571, _1559, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1579 = -_1333;
    float _1581 = _1579 + _1573;
    float _1583 = -_1219;
    float _1585 = _1583 + _1575;
    float _1587 = -_1209;
    float _1589 = _1587 + _1577;
    float _1591 = _1581 * _1581;
    float _1593 = fma(_1585, _1585, _1591);
    float _1595 = fma(_1589, _1589, _1593);
    float _1597 = sqrt(_1595);
    bool _1599 = _1597 > 0.0;
    bool _1601 = !_1599;
    float _1603 = _1597;
    float _1605 = _1563;
    float _1607 = _1575;
    float _1609 = _1573;
    float _1611 = _1577;
    if (!_1601)
    {
        bool _1613 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1615 = _1465;
        if (_1613)
        {
            float _1617 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1615 = _1617;
        }
        float _1619 = _1615;
        if (_1613)
        {
            _1355 = _1089;
        }
        float _1621 = _1355;
        float _1623 = _1621;
        if (_1613)
        {
            float _1625 = _1619 * _621;
            _1603 = _1625;
        }
        float _1627 = _1603;
        float _1629 = _1627;
        if (_1613)
        {
            float _1631 = _1619 * _619;
            _1605 = _1631;
        }
        float _1633 = _1605;
        float _1635 = _1633;
        if (_1613)
        {
            float _1637 = _1619 * _623;
            _1357 = _1637;
        }
        float _1639 = _1357;
        float _1641 = _1639;
        if (!_1613)
        {
            float _1643 = _105 + 1.0;
            if (!_141)
            {
                float _1645 = _1643 * _1643;
                float _1647 = _1645 * 0.5;
                _629 = _1647;
            }
            float _1649 = _629;
            float _1651 = _1649;
            if (!_141)
            {
                float _1653 = _1649 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1651 = _1653;
            }
            float _1655 = _1651;
            bool _1657 = !_141;
            float _1659 = _1655;
            if (!_1657)
            {
                float _1661 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1663 = log2(_1661);
                float _1665 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1667 = _1665 + 1.0;
                float _1669 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1671 = _1663 * _1643;
                float _1673 = 1.0 / _1667;
                float _1675 = _1669 * 0.693147182464599609375;
                float _1677 = exp2(_1671);
                float _1679 = 1.0 / _1675;
                float _1681 = _1677 + (-1.0);
                float _1683 = -_1681;
                float _1685 = fma(_1683, _1679, _1643);
                float _1687 = _1685 * _1673;
                float _1689 = _1687 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1659 = _1689;
            }
            float _1691 = _1659;
            float _1693 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1695 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1697 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1699 = _1691;
            if (!_141)
            {
                _1699 = _1643;
            }
            float _1701 = _1699;
            float _1703 = _1693 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _1705 = _1693 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _1707 = _1693 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _1709 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1703);
            float _1711 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1705);
            float _1713 = fma(_1697, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1709);
            bool _1715 = !_141;
            float _1717 = _1701;
            if (!_1715)
            {
                float _1719 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1721 = log2(_1719);
                float _1723 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1725 = _1723 + 1.0;
                float _1727 = 1.0 / _1725;
                float _1729 = _1721 * _1643;
                float _1731 = exp2(_1729);
                float _1733 = -_1731;
                float _1735 = _1733 + 1.0;
                float _1737 = _1735 * _1727;
                _1717 = _1737;
            }
            float _1739 = _1717;
            float _1741 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1707);
            float _1743 = fma(_1697, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1711);
            float _1745 = fma(_1739, _127, _1713);
            float _1747 = fma(_1697, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1741);
            float _1749 = fma(_1739, _125, _1743);
            float _1751 = -_353;
            float _1753 = _1751 + _1745;
            float _1755 = fma(_1739, _129, _1747);
            float _1757 = -_359;
            float _1759 = _1757 + _1749;
            float _1761 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1763 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1765 = -_365;
            float _1767 = _1765 + _1755;
            float _1769 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1771 = fma(_1759, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1761);
            float _1773 = fma(_1759, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1763);
            float _1775 = fma(_1759, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1769);
            float _1777 = fma(_1767, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1771);
            float _1779 = fma(_1767, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1773);
            float _1781 = fma(_1767, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1775);
            float _1783 = _1777 * _1777;
            float _1785 = fma(_1779, _1779, _1783);
            float _1787 = fma(_1781, _1781, _1785);
            _1623 = _1787;
            _631 = _1777;
            _633 = _1779;
            _635 = _1781;
            _1629 = _1779;
            _1635 = _1777;
            _1641 = _1781;
            _163 = _1769;
        }
        float _1789 = _1623;
        float _1791 = _631;
        float _1793 = _633;
        float _1795 = _635;
        float _1797 = _1629;
        float _1799 = _1635;
        float _1801 = _1641;
        float _1803 = _163;
        float _1805 = sqrt(_1789);
        float _1807 = rsqrt(_1595);
        bool _1809 = _1805 > 0.0;
        float _1811 = _1585 * _1807;
        float _1813 = _1581 * _1807;
        float _1815 = _1589 * _1807;
        bool _1817 = !_1809;
        _165 = _1803;
        _167 = _1813;
        if (!_1817)
        {
            float _1819 = rsqrt(_1789);
            float _1821 = _1819 * _1791;
            float _1823 = _1819 * _1793;
            float _1825 = _1813 * _1821;
            float _1827 = _1819 * _1795;
            float _1829 = fma(_1811, _1823, _1825);
            float _1831 = fma(_1815, _1827, _1829);
            float _1833 = _1831 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1835 = fma(_1797, _1833, _1575);
            float _1837 = fma(_1799, _1833, _1573);
            float _1839 = fma(_1801, _1833, _1577);
            _1607 = _1835;
            _1609 = _1837;
            _1611 = _1839;
            _165 = _1827;
        }
    }
    float _1841 = _1607;
    float _1843 = _1609;
    float _1845 = _1611;
    float _1847 = _165;
    float _1849 = _167;
    bool _1851 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1853 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1855 = _1851 || _1853;
    bool _1857 = isnan(0.5);
    bool _1859 = _1855 || _1857;
    float _1861 = _1849;
    float _1863 = _1847;
    float _1865 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (_1859)
    {
        _1861 = _1841;
    }
    float _1867 = _1861;
    float _1869 = _1867;
    if (_1859)
    {
        _1863 = _1843;
    }
    float _1871 = _1863;
    float _1873 = _1871;
    if (_1859)
    {
        _1865 = _1845;
    }
    float _1875 = _1865;
    float _1877 = _1875;
    if (!_1859)
    {
        float _1879 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1881 = _1333 + _1879;
        float _1883 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1885 = _1219 + _1883;
        float _1887 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1889 = -_1219;
        float _1891 = _1889 + _1841;
        float _1893 = _1881 * _1881;
        float _1895 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1897 = _1209 + _1895;
        float _1899 = -_1333;
        float _1901 = _1899 + _1843;
        float _1903 = -_1209;
        float _1905 = _1903 + _1845;
        float _1907 = fma(_1885, _1885, _1893);
        float _1909 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1911 = fma(_1897, _1897, _1907);
        float _1913 = sqrt(_1911);
        float _1915 = _1887 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1917 = precise::min(_1913, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1919 = _1917 * _1909;
        float _1921 = _1915 * _1919;
        float _1923 = fma(_1891, _1921, _1219);
        float _1925 = fma(_1901, _1921, _1333);
        float _1927 = fma(_1905, _1921, _1209);
        _1873 = _1925;
        _1869 = _1923;
        _1877 = _1927;
    }
    float _1929 = _1873;
    float _1931 = _1869;
    float _1933 = _1877;
    float _1935 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1937 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1939 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1941 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1943 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1935);
    float _1945 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1937);
    float _1947 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1939);
    float _1949 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1941);
    float _1951 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1943);
    float _1953 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1945);
    float _1955 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1947);
    float _1957 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1949);
    float _1959 = _1951 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1961 = _1953 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1963 = _1955 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1965 = _1957 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1967 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1969 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1971 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1973 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1975 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1967);
    float _1977 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1969);
    float _1979 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1971);
    float _1981 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1973);
    float _1983 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1975);
    float _1985 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1977);
    float _1987 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1979);
    float _1989 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1981);
    float _1991 = fma(_1965, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1983);
    float _1993 = fma(_1965, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1985);
    float _1995 = fma(_1965, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1987);
    float _1997 = fma(_1965, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1989);
    float _1999 = _1991 + _1995;
    float _2001 = _1993 + _1995;
    float _2003 = _1995 * 0.5;
    float _2005 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2007 = _1999 * 0.5;
    float _2009 = _2001 * 0.5;
    float _2011 = fma(_1997, -0.5, _2003);
    out.m_35.x = _2005;
    out.gl_Position.x = _1991;
    out.gl_Position.y = _1997;
    out.gl_Position.z = _1993;
    out.gl_Position.w = _1995;
    out.m_52.x = _2007;
    out.m_52.y = _2011;
    out.m_52.z = _2009;
    out.m_52.w = _1995;
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
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1529 = false;
    bool _1067 = false;
    bool _925 = false;
    bool _803 = false;
    bool _655 = false;
    bool _497 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_32.w;
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
        out.m_35.x = 0.0;
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
        float _2068 = as_type<float>(_87);
        out.gl_Position.z = _2068;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _91 = in.m_37.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _107 = 0.0;
    if (_101)
    {
        float _109 = float(_71);
        _107 = _109;
    }
    float _111 = _107;
    bool _113 = _105 >= _111;
    bool _115 = !_101;
    bool _117 = _113 || _115;
    if (_117)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _81;
    if (_117)
    {
        out.m_35.x = 0.0;
    }
    if (_117)
    {
        float _121 = _119 * 5.0;
        _89 = as_type<int>(_121);
    }
    int _123 = _89;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2136 = as_type<float>(_123);
        out.gl_Position.z = _2136;
    }
    if (_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_37.x;
    float _127 = in.m_37.y;
    float _129 = in.m_37.z;
    float _131 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _133 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _135 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _137 = _133 || _135;
    bool _139 = isnan(1.0);
    bool _141 = _137 || _139;
    float _143 = 0.0;
    float _145 = _131;
    if (!_141)
    {
        float _147 = _131 * _131;
        float _149 = _147 * 0.5;
        _143 = _149;
    }
    float _151 = _143;
    float _153 = _151;
    if (!_141)
    {
        float _155 = _151 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _153 = _155;
    }
    float _157 = _153;
    bool _159 = !_141;
    float _161 = _157;
    float _163 = _127;
    float _165 = _127;
    float _167 = _129;
    if (!_159)
    {
        float _169 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _171 = log2(_169);
        float _173 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _175 = _173 + 1.0;
        float _177 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _179 = _131 * _171;
        float _181 = 1.0 / _175;
        float _183 = _177 * 0.693147182464599609375;
        float _185 = exp2(_179);
        float _187 = 1.0 / _183;
        float _189 = _185 + (-1.0);
        float _191 = -_189;
        float _193 = fma(_191, _187, _131);
        float _195 = _193 * _181;
        float _197 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _161 = _197;
    }
    float _199 = _161;
    float _201 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _203 = !_141;
    if (!_203)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = 1.0 / _211;
        float _215 = _131 * _207;
        float _217 = exp2(_215);
        float _219 = -_217;
        float _221 = _219 + 1.0;
        float _223 = _221 * _213;
        _145 = _223;
    }
    float _225 = _145;
    float _227 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _229 = _201 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _231 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _233 = _201 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _235 = _201 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _237 = fma(_227, (*spvDescriptorSet0.vp_c10)._m0[8].x, _229);
    float _239 = _229;
    float _241 = _233;
    if (!_141)
    {
        float _243 = _105 * _105;
        float _245 = _243 * 0.5;
        _239 = _245;
    }
    float _247 = _239;
    float _249 = fma(_227, (*spvDescriptorSet0.vp_c10)._m0[8].y, _233);
    float _251 = fma(_227, (*spvDescriptorSet0.vp_c10)._m0[8].z, _235);
    float _253 = fma(_231, (*spvDescriptorSet0.vp_c10)._m0[10].x, _237);
    if (!_141)
    {
        float _255 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _241 = _255;
    }
    float _257 = _241;
    bool _259 = !_141;
    float _261 = _257;
    if (!_259)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _273 = _105 * _265;
        float _275 = 1.0 / _269;
        float _277 = _271 * 0.693147182464599609375;
        float _279 = exp2(_273);
        float _281 = 1.0 / _277;
        float _283 = _279 + (-1.0);
        float _285 = -_283;
        float _287 = fma(_285, _281, _105);
        float _289 = _287 * _275;
        float _291 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _261 = _291;
    }
    float _293 = _261;
    float _295 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _297 = fma(_231, (*spvDescriptorSet0.vp_c10)._m0[10].z, _251);
    float _299 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _301 = fma(_231, (*spvDescriptorSet0.vp_c10)._m0[10].y, _249);
    float _303 = _295 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _305 = _295 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _307 = _295 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _309 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _311 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].y, _303);
    float _313 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].x, _305);
    float _315 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].z, _307);
    float _317 = fma(_225, _127, _301);
    float _319 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[10].y, _311);
    float _321 = _293;
    if (!_141)
    {
        _321 = _105;
    }
    float _323 = _321;
    bool _325 = !_141;
    float _327 = _323;
    if (!_325)
    {
        float _329 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _331 = log2(_329);
        float _333 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _335 = _333 + 1.0;
        float _337 = 1.0 / _335;
        float _339 = _105 * _331;
        float _341 = exp2(_339);
        float _343 = -_341;
        float _345 = _343 + 1.0;
        float _347 = _345 * _337;
        _327 = _347;
    }
    float _349 = _327;
    float _351 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[10].x, _313);
    float _353 = fma(_349, _127, _319);
    float _355 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[10].z, _315);
    float _357 = fma(_225, _125, _253);
    float _359 = fma(_349, _125, _351);
    float _361 = -_353;
    float _363 = _317 + _361;
    float _365 = fma(_349, _129, _355);
    float _367 = fma(_225, _129, _297);
    float _369 = -_359;
    float _371 = _357 + _369;
    float _373 = _363 * _363;
    float _375 = in.m_39.w;
    float _377 = -_365;
    float _379 = _367 + _377;
    float _381 = _363 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _383 = fma(_371, _371, _373);
    float _385 = _363 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _387 = _363 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _389 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].x, _381);
    float _391 = fma(_379, _379, _383);
    float _393 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].x, _385);
    float _395 = in.m_32.x;
    float _397 = in.m_32.y;
    float _399 = in.m_32.z;
    float _401 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].x, _387);
    float _403 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[4].z, _389);
    float _405 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[5].z, _393);
    float _407 = sqrt(_391);
    float _409 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[6].z, _401);
    bool _411 = _407 >= 9.9999999747524270787835121154785e-07;
    bool _413 = isnan(_407);
    bool _415 = _411 || _413;
    bool _417 = isnan(9.9999999747524270787835121154785e-07);
    bool _419 = _415 || _417;
    float _421 = fma(_357, _375, _395);
    float _423 = fma(_317, _375, _397);
    float _425 = fma(_367, _375, _399);
    float _427 = _393;
    float _429 = _379;
    float _431 = _409;
    if (_419)
    {
        _427 = _403;
    }
    float _433 = _427;
    float _435 = _433;
    if (_419)
    {
        _429 = _405;
    }
    float _437 = _429;
    float _439 = _437;
    if (!_419)
    {
        bool _441 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _443 = !_441;
        if (!_443)
        {
            float _445 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _447 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _449 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _451 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].y, _445);
            float _453 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].x, _447);
            float _455 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].z, _449);
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].y, _451);
            float _459 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].x, _453);
            float _461 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].z, _455);
            float _463 = _457 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _465 = _457 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _467 = _457 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _469 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[5].x, _463);
            float _471 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[4].x, _465);
            float _473 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[6].x, _467);
            float _475 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[5].z, _469);
            float _477 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[4].z, _471);
            float _479 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[6].z, _473);
            float _481 = _475 * _475;
            float _483 = fma(_477, _477, _481);
            float _485 = fma(_479, _479, _483);
            float _487 = rsqrt(_485);
            float _489 = _487 * 9.9999999747524270787835121154785e-07;
            float _491 = _477 * _489;
            float _493 = _475 * _489;
            float _495 = _479 * _489;
            _439 = _493;
            _435 = _491;
            _431 = _495;
            _497 = true;
        }
        else
        {
            float _499 = _127 * _127;
            float _501 = fma(_125, _125, _499);
            float _503 = fma(_129, _129, _501);
            float _505 = sqrt(_503);
            bool _507 = _505 >= 9.9999999747524270787835121154785e-07;
            bool _509 = isnan(_505);
            bool _511 = _507 || _509;
            bool _513 = isnan(9.9999999747524270787835121154785e-07);
            bool _515 = _511 || _513;
            if (!_515)
            {
                float _517 = _397 * _397;
                float _519 = fma(_395, _395, _517);
                float _521 = fma(_399, _399, _519);
                float _523 = sqrt(_521);
                bool _525 = _523 >= 9.9999999747524270787835121154785e-07;
                bool _527 = isnan(_523);
                bool _529 = _525 || _527;
                bool _531 = isnan(9.9999999747524270787835121154785e-07);
                bool _533 = _529 || _531;
                if (!_533)
                {
                    float _535 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _537 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _535);
                    float _539 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _537);
                    float _541 = rsqrt(_539);
                    float _543 = _541 * 9.9999999747524270787835121154785e-07;
                    float _545 = _543 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _547 = _543 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _549 = _543 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _439 = _547;
                    _435 = _545;
                    _431 = _549;
                    _497 = true;
                }
                else
                {
                    float _551 = _397 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _553 = _397 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _555 = _397 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _557 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].x, _551);
                    float _559 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].x, _553);
                    float _561 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].x, _555);
                    float _563 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[5].z, _557);
                    float _565 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[4].z, _559);
                    float _567 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[6].z, _561);
                    float _569 = _563 * _563;
                    float _571 = fma(_565, _565, _569);
                    float _573 = fma(_567, _567, _571);
                    float _575 = rsqrt(_573);
                    float _577 = _575 * 9.9999999747524270787835121154785e-07;
                    float _579 = _565 * _577;
                    float _581 = _563 * _577;
                    float _583 = _567 * _577;
                    _439 = _581;
                    _435 = _579;
                    _431 = _583;
                    _497 = true;
                }
            }
            else
            {
                float _585 = _127 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _587 = _127 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _589 = _127 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _591 = fma(_125, (*spvDescriptorSet0.vp_c10)._m0[5].x, _585);
                float _593 = fma(_125, (*spvDescriptorSet0.vp_c10)._m0[4].x, _587);
                float _595 = fma(_125, (*spvDescriptorSet0.vp_c10)._m0[6].x, _589);
                float _597 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[5].z, _591);
                float _599 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[4].z, _593);
                float _601 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[6].z, _595);
                float _603 = _597 * _597;
                float _605 = fma(_599, _599, _603);
                float _607 = fma(_601, _601, _605);
                float _609 = rsqrt(_607);
                float _611 = _609 * 9.9999999747524270787835121154785e-07;
                float _613 = _599 * _611;
                float _615 = _597 * _611;
                float _617 = _601 * _611;
                _439 = _615;
                _435 = _613;
                _431 = _617;
            }
        }
    }
    _497 = false;
    float _619 = _439;
    float _621 = _435;
    float _623 = _431;
    bool _625 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _627 = !_625;
    float _629 = _623;
    float _631 = _619;
    float _633 = _621;
    float _635 = _623;
    float _653;
    if (!_627)
    {
        float _637 = in.m_41.x;
        float _639 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _641 = _637 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _643 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _645 = _643 * _639;
        float _647 = floor(_645);
        float _649 = -_647;
        float _651 = _645 + _649;
        _653 = _651;
        _655 = true;
    }
    else
    {
        float _657 = float(_71);
        float _659 = 1.0 / _657;
        float _661 = _105 * _659;
        _653 = _661;
    }
    _655 = false;
    float _663 = _653;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _667 = _663 + _665;
    bool _669 = _663 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _671 = isnan(_663);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _681;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _689 = _663 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _691 = isnan(_663);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = -_679;
    float _703 = _701 + 1.0;
    float _705 = 1.0 / _687;
    bool _707 = _663 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _709 = isnan(_663);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _715 = _711 || _713;
    float _717 = float(_715);
    float _719 = _699 * _703;
    bool _721 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _723 = 1.0 / _683;
    float _725 = -_699;
    float _727 = _725 + 1.0;
    float _729 = _717 * _727;
    float _731 = -_717;
    float _733 = _731 + 1.0;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _739 = _667 * _723;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _743 = _663 + _741;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _745;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _749;
    float _753 = _743 * _705;
    float _755 = fma(_747, _739, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _757 = fma(_751, _739, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _763 = fma(_737, _753, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _765 = _755 * _729;
    float _767 = _757 * _729;
    float _769 = fma(_761, _753, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _771 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[143].x, _765);
    float _773 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[143].y, _767);
    float _775 = fma(_769, _719, _771);
    float _777 = fma(_763, _719, _773);
    float _779 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[145].x, _775);
    float _781 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[145].y, _777);
    bool _783 = !_721;
    float _801;
    if (!_783)
    {
        float _785 = in.m_41.x;
        float _787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _789 = _785 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _791 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[11].x, _105);
        float _793 = _791 * _787;
        float _795 = floor(_793);
        float _797 = -_795;
        float _799 = _793 + _797;
        _801 = _799;
        _803 = true;
    }
    else
    {
        float _805 = float(_71);
        float _807 = 1.0 / _805;
        float _809 = _105 * _807;
        _801 = _809;
    }
    _803 = false;
    float _811 = _801;
    float _813 = in.m_39.x;
    float _815 = in.m_39.y;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _819 = _811 + _817;
    bool _821 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _823 = isnan(_811);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _833;
    float _837 = -_831;
    float _839 = _837 + 1.0;
    bool _841 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _843 = 1.0 / _835;
    float _845 = _781 * _815;
    float _847 = _819 * _843;
    bool _849 = _811 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _851 = isnan(_811);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _857 = _853 || _855;
    float _859 = float(_857);
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _861;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _865;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _869;
    float _873 = _859 * _839;
    float _875 = fma(_863, _847, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _877 = fma(_867, _847, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _879 = fma(_871, _847, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _881 = -_859;
    float _883 = _881 + 1.0;
    float _885 = _875 * _873;
    float _887 = _877 * _873;
    float _889 = _879 * _873;
    float _891 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[107].x, _885);
    float _893 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[107].y, _887);
    float _895 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[107].z, _889);
    float _897 = _779 * _813;
    float _899 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[108].x, _891);
    float _901 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[108].y, _893);
    float _903 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[108].z, _895);
    bool _905 = !_841;
    float _923;
    if (!_905)
    {
        float _907 = in.m_41.x;
        float _909 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _911 = _907 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _913 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _915 = _913 * _909;
        float _917 = floor(_915);
        float _919 = -_917;
        float _921 = _915 + _919;
        _923 = _921;
        _925 = true;
    }
    else
    {
        float _927 = float(_71);
        float _929 = 1.0 / _927;
        float _931 = _105 * _929;
        _923 = _931;
    }
    _925 = false;
    float _933 = _923;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _937 = _933 + _935;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _943 = _933 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _945 = isnan(_933);
    bool _947 = _943 || _945;
    bool _949 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _951 = _947 || _949;
    float _953 = float(_951);
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _957 = _955 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _959 = _933 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _961 = isnan(_933);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _967 = _963 || _965;
    float _969 = float(_967);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _971;
    bool _975 = _933 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _977 = isnan(_933);
    bool _979 = _975 || _977;
    bool _981 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _983 = _979 || _981;
    float _985 = float(_983);
    float _987 = 1.0 / _941;
    float _989 = -_953;
    float _991 = _989 + 1.0;
    bool _993 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _995 = _969 * _991;
    float _997 = -_969;
    float _999 = _997 + 1.0;
    float _1001 = 1.0 / _957;
    float _1003 = _973 * _987;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1009 = fma(_1003, _937, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1011 = -_985;
    float _1013 = _1011 + 1.0;
    float _1015 = _1009 * _995;
    float _1017 = _1007 * _1001;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1021 = _933 + _1019;
    float _1023 = _953 * _1013;
    float _1025 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1015);
    float _1027 = _899 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1029 = fma(_1017, _1021, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1031 = _901 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1033 = _903 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1035 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1037 = fma(_1029, _1023, _1025);
    float _1039 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1037);
    float _1041 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1043 = _1033 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1045 = _1039 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.x = _1035;
    out.m_43.y = _1041;
    out.m_43.z = _1043;
    out.m_43.w = _1045;
    bool _1047 = !_993;
    float _1065;
    if (!_1047)
    {
        float _1049 = in.m_41.x;
        float _1051 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1053 = _1049 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1055 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[11].z, _105);
        float _1057 = _1055 * _1051;
        float _1059 = floor(_1057);
        float _1061 = -_1059;
        float _1063 = _1057 + _1061;
        _1065 = _1063;
        _1067 = true;
    }
    else
    {
        float _1069 = float(_71);
        float _1071 = 1.0 / _1069;
        float _1073 = _105 * _1071;
        _1065 = _1073;
    }
    _1067 = false;
    float _1075 = _1065;
    float _1077 = _619 * _619;
    float _1079 = as_type<float>(int(gl_VertexIndex));
    float _1081 = _845 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1083 = fma(_621, _621, _1077);
    float _1085 = _897 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1087 = _423 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1089 = fma(_623, _623, _1083);
    float _1091 = rsqrt(_1089);
    int _1093 = as_type<int>(_1079) & 1;
    bool _1095 = _1093 != 0;
    int _1097 = as_type<int>(_1079) & 2;
    bool _1099 = _1097 != 0;
    int _1101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1103 = _1101 != 0;
    float _1105 = _1091 * _623;
    float _1107 = _1091 * _621;
    float _1109 = _1091 * _619;
    int _1111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1113 = _1111 != 0;
    float _1115 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1117 = _1105 * _1115;
    float _1119 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1121 = _1109 * _1119;
    float _1123 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1125 = -_1117;
    float _1127 = fma(_1107, _1123, _1125);
    float _1129 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1131 = _1107 * _1129;
    float _1133 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1135 = -_1121;
    float _1137 = fma(_1105, _1133, _1135);
    float _1139 = _1127 * _1127;
    float _1141 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1143 = -_1131;
    float _1145 = fma(_1109, _1141, _1143);
    bool _1147 = !_1095;
    float _1149 = _1147 ? (-0.5) : 0.5;
    float _1151 = fma(_1137, _1137, _1139);
    float _1153 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1149);
    float _1155 = fma(_1145, _1145, _1151);
    bool _1157 = !_1099;
    float _1159 = _1157 ? (-0.5) : 0.5;
    float _1161 = _1085 * _1153;
    float _1163 = rsqrt(_1155);
    float _1165 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1159);
    float _1167 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1169 = _1081 * _1165;
    float _1171 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1087);
    float _1173 = _1169 * _1107;
    float _1175 = _1169 * _1105;
    float _1177 = _1169 * _1109;
    float _1179 = _1145 * _1163;
    float _1181 = _1137 * _1163;
    float _1183 = _1127 * _1163;
    float _1185 = _1109 * _1179;
    float _1187 = fma(_1161, _1181, _1173);
    float _1189 = _423 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1191 = fma(_1161, _1179, _1175);
    float _1193 = -_1185;
    float _1195 = fma(_1105, _1183, _1193);
    float _1197 = _1105 * _1181;
    float _1199 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1189);
    float _1201 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1171);
    float _1203 = fma(_1167, _1195, _1187);
    float _1205 = _1107 * _1183;
    float _1207 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1199);
    float _1209 = _1201 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1211 = in.m_41.x;
    float _1213 = in.m_41.y;
    float _1215 = -_1205;
    float _1217 = fma(_1109, _1181, _1215);
    float _1219 = _1207 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1221 = fma(_1161, _1183, _1177);
    float _1223 = -_1197;
    float _1225 = fma(_1107, _1179, _1223);
    float _1227 = fma(_1167, _1217, _1191);
    float _1229 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1231 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1229;
    float _1233 = _1219 + _1203;
    float _1235 = _423 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1237 = _1209 + _1227;
    float _1239 = 1.0 / _1231;
    float _1241 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1243 = _1233 + _1241;
    float _1245 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1235);
    float _1247 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1249 = _1237 + _1247;
    float _1251 = fma(_1167, _1225, _1221);
    float _1253 = _1243 * _1243;
    float _1255 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1245);
    float _1257 = _1249 * _1249;
    bool _1259 = _1075 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1261 = isnan(_1075);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1267 = _1263 || _1265;
    float _1269 = float(_1267);
    float _1271 = _1253 + _1257;
    bool _1273 = _1075 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1275 = isnan(_1075);
    bool _1277 = _1273 || _1275;
    bool _1279 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1281 = _1277 || _1279;
    float _1283 = float(_1281);
    float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1285;
    bool _1289 = _1211 > 0.5;
    float _1291 = sqrt(_1271);
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1295 = _1075 + _1293;
    bool _1297 = _1213 > 0.5;
    float _1299 = -_1269;
    float _1301 = _1299 + 1.0;
    float _1303 = _1295 * _1239;
    float _1305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1307 = -_1159;
    int _1309 = _1297 ? as_type<int>(_1307) : as_type<int>(_1159);
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1313 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1311;
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1315;
    float _1319 = -_1149;
    int _1321 = _1289 ? as_type<int>(_1319) : as_type<int>(_1149);
    float _1323 = fma(_1287, _1303, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1325 = !_1113;
    float _1327 = _1325 ? _1159 : as_type<float>(_1309);
    float _1329 = fma(_1317, _1303, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1331 = _1291 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1333 = _1255 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1335 = _1283 * _1301;
    float _1337 = fma(_1313, _1303, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1339 = !_1103;
    float _1341 = _1339 ? _1149 : as_type<float>(_1321);
    float _1343 = _1333 + _1251;
    float _1345 = _1301;
    float _1347 = _1253;
    float _1349 = _1257;
    float _1351 = _1233;
    float _1353 = _1237;
    float _1355 = _1337;
    float _1357 = _1089;
    if (!_1331)
    {
        _1345 = _1343;
    }
    float _1359 = _1345;
    bool _1361 = !_1331;
    float _1363 = _1359;
    if (!_1361)
    {
        float _1365 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1367 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1369 = _1291 + _1367;
        float _1371 = _1343 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1373 = rsqrt(_1271);
        float _1375 = _1369 * _1365;
        float _1377 = _1375 * 0.15915493667125701904296875;
        float _1379 = _1377 * 6.283185482025146484375;
        float _1381 = sin(_1379);
        float _1383 = _1377 * 6.283185482025146484375;
        float _1385 = cos(_1383);
        float _1387 = fma(_1381, _1371, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1389 = _1373 * _1387;
        float _1391 = fma(_1243, _1389, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1393 = _1385 + (-1.0);
        float _1395 = fma(_1249, _1389, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1397 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1399 = _1391 + _1397;
        float _1401 = _1393 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1403 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1405 = _1395 + _1403;
        float _1407 = _1399 * _1399;
        float _1409 = fma(_1343, _1385, _1401);
        float _1411 = _1405 * _1405;
        _1363 = _1409;
        _1347 = _1407;
        _1349 = _1411;
        _1351 = _1391;
        _1353 = _1395;
    }
    float _1413 = _1363;
    float _1415 = _1347;
    float _1417 = _1349;
    float _1419 = _1351;
    float _1421 = _1353;
    float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1425 = _1413 + _1423;
    float _1427 = _1323 * _1335;
    float _1429 = _1337 * _1335;
    float _1431 = _1329 * _1335;
    float _1433 = -_1283;
    float _1435 = _1433 + 1.0;
    float _1437 = fma(_1425, _1425, _1415);
    float _1439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1441 = _1341 + 0.5;
    float _1443 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1427);
    float _1445 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1429);
    float _1447 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1431);
    float _1449 = _1437 + _1417;
    float _1451 = -_1327;
    float _1453 = _1451 + 0.5;
    float _1455 = _1441 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1457 = fma(_1269, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1443);
    float _1459 = fma(_1269, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1445);
    float _1461 = fma(_1269, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1447);
    float _1463 = sqrt(_1449);
    float _1465 = _1455 * _1305;
    float _1467 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1469 = _1457 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1471 = _1459 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1473 = _1461 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1475 = _1467 * _1439;
    float _1477 = _1469 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1479 = _1471 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1481 = _1473 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_48.x = _1465;
    out.m_48.y = _1475;
    out.m_50.x = _1477;
    out.m_50.y = _1479;
    out.m_50.z = _1481;
    bool _1483 = _1463 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1485 = isnan(_1463);
    bool _1487 = _1483 || _1485;
    bool _1489 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1491 = _1487 || _1489;
    float _1493 = _1467;
    if (!_1491)
    {
        _1493 = 1.0;
    }
    float _1495 = _1493;
    bool _1497 = !_1491;
    float _1499 = _1495;
    if (!_1497)
    {
        bool _1501 = _1463 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1503 = isnan(_1463);
        bool _1505 = _1501 || _1503;
        bool _1507 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1509 = _1505 || _1507;
        if (!_1509)
        {
            float _1511 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1513 = _1463 + _1511;
            float _1515 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1517 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1515;
            float _1519 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1521 = _1519 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1523 = 1.0 / _1517;
            float _1525 = _1513 * _1523;
            float _1527 = fma(_1525, _1521, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1499 = _1527;
            _1529 = true;
        }
        else
        {
            bool _1531 = _1463 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1533 = isnan(_1463);
            bool _1535 = _1531 || _1533;
            bool _1537 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1539 = _1535 || _1537;
            if (!_1539)
            {
                float _1541 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1543 = _1463 + _1541;
                float _1545 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1547 = _1545 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1549 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1551 = _1549 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1553 = 1.0 / _1547;
                float _1555 = _1543 * _1553;
                float _1557 = fma(_1555, _1551, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1499 = _1557;
                _1529 = true;
            }
            else
            {
                _1499 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1529 = false;
    float _1559 = _1499;
    float _1561 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1563 = _1413 + _1561;
    float _1565 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1567 = _1419 + _1565;
    float _1569 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1571 = _1421 + _1569;
    float _1573 = fma(_1563, _1559, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1575 = fma(_1567, _1559, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1577 = fma(_1571, _1559, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1579 = -_1333;
    float _1581 = _1579 + _1573;
    float _1583 = -_1219;
    float _1585 = _1583 + _1575;
    float _1587 = -_1209;
    float _1589 = _1587 + _1577;
    float _1591 = _1581 * _1581;
    float _1593 = fma(_1585, _1585, _1591);
    float _1595 = fma(_1589, _1589, _1593);
    float _1597 = sqrt(_1595);
    bool _1599 = _1597 > 0.0;
    bool _1601 = !_1599;
    float _1603 = _1597;
    float _1605 = _1563;
    float _1607 = _1575;
    float _1609 = _1573;
    float _1611 = _1577;
    if (!_1601)
    {
        bool _1613 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1615 = _1465;
        if (_1613)
        {
            float _1617 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1615 = _1617;
        }
        float _1619 = _1615;
        if (_1613)
        {
            _1355 = _1089;
        }
        float _1621 = _1355;
        float _1623 = _1621;
        if (_1613)
        {
            float _1625 = _1619 * _621;
            _1603 = _1625;
        }
        float _1627 = _1603;
        float _1629 = _1627;
        if (_1613)
        {
            float _1631 = _1619 * _619;
            _1605 = _1631;
        }
        float _1633 = _1605;
        float _1635 = _1633;
        if (_1613)
        {
            float _1637 = _1619 * _623;
            _1357 = _1637;
        }
        float _1639 = _1357;
        float _1641 = _1639;
        if (!_1613)
        {
            float _1643 = _105 + 1.0;
            if (!_141)
            {
                float _1645 = _1643 * _1643;
                float _1647 = _1645 * 0.5;
                _629 = _1647;
            }
            float _1649 = _629;
            float _1651 = _1649;
            if (!_141)
            {
                float _1653 = _1649 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1651 = _1653;
            }
            float _1655 = _1651;
            bool _1657 = !_141;
            float _1659 = _1655;
            if (!_1657)
            {
                float _1661 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1663 = log2(_1661);
                float _1665 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1667 = _1665 + 1.0;
                float _1669 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1671 = _1663 * _1643;
                float _1673 = 1.0 / _1667;
                float _1675 = _1669 * 0.693147182464599609375;
                float _1677 = exp2(_1671);
                float _1679 = 1.0 / _1675;
                float _1681 = _1677 + (-1.0);
                float _1683 = -_1681;
                float _1685 = fma(_1683, _1679, _1643);
                float _1687 = _1685 * _1673;
                float _1689 = _1687 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1659 = _1689;
            }
            float _1691 = _1659;
            float _1693 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1695 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1697 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1699 = _1691;
            if (!_141)
            {
                _1699 = _1643;
            }
            float _1701 = _1699;
            float _1703 = _1693 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _1705 = _1693 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _1707 = _1693 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _1709 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1703);
            float _1711 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1705);
            float _1713 = fma(_1697, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1709);
            bool _1715 = !_141;
            float _1717 = _1701;
            if (!_1715)
            {
                float _1719 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1721 = log2(_1719);
                float _1723 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1725 = _1723 + 1.0;
                float _1727 = 1.0 / _1725;
                float _1729 = _1721 * _1643;
                float _1731 = exp2(_1729);
                float _1733 = -_1731;
                float _1735 = _1733 + 1.0;
                float _1737 = _1735 * _1727;
                _1717 = _1737;
            }
            float _1739 = _1717;
            float _1741 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1707);
            float _1743 = fma(_1697, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1711);
            float _1745 = fma(_1739, _127, _1713);
            float _1747 = fma(_1697, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1741);
            float _1749 = fma(_1739, _125, _1743);
            float _1751 = -_353;
            float _1753 = _1751 + _1745;
            float _1755 = fma(_1739, _129, _1747);
            float _1757 = -_359;
            float _1759 = _1757 + _1749;
            float _1761 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1763 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1765 = -_365;
            float _1767 = _1765 + _1755;
            float _1769 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1771 = fma(_1759, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1761);
            float _1773 = fma(_1759, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1763);
            float _1775 = fma(_1759, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1769);
            float _1777 = fma(_1767, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1771);
            float _1779 = fma(_1767, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1773);
            float _1781 = fma(_1767, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1775);
            float _1783 = _1777 * _1777;
            float _1785 = fma(_1779, _1779, _1783);
            float _1787 = fma(_1781, _1781, _1785);
            _1623 = _1787;
            _631 = _1777;
            _633 = _1779;
            _635 = _1781;
            _1629 = _1779;
            _1635 = _1777;
            _1641 = _1781;
            _163 = _1769;
        }
        float _1789 = _1623;
        float _1791 = _631;
        float _1793 = _633;
        float _1795 = _635;
        float _1797 = _1629;
        float _1799 = _1635;
        float _1801 = _1641;
        float _1803 = _163;
        float _1805 = sqrt(_1789);
        float _1807 = rsqrt(_1595);
        bool _1809 = _1805 > 0.0;
        float _1811 = _1585 * _1807;
        float _1813 = _1581 * _1807;
        float _1815 = _1589 * _1807;
        bool _1817 = !_1809;
        _165 = _1803;
        _167 = _1813;
        if (!_1817)
        {
            float _1819 = rsqrt(_1789);
            float _1821 = _1819 * _1791;
            float _1823 = _1819 * _1793;
            float _1825 = _1813 * _1821;
            float _1827 = _1819 * _1795;
            float _1829 = fma(_1811, _1823, _1825);
            float _1831 = fma(_1815, _1827, _1829);
            float _1833 = _1831 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1835 = fma(_1797, _1833, _1575);
            float _1837 = fma(_1799, _1833, _1573);
            float _1839 = fma(_1801, _1833, _1577);
            _1607 = _1835;
            _1609 = _1837;
            _1611 = _1839;
            _165 = _1827;
        }
    }
    float _1841 = _1607;
    float _1843 = _1609;
    float _1845 = _1611;
    float _1847 = _165;
    float _1849 = _167;
    bool _1851 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1853 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1855 = _1851 || _1853;
    bool _1857 = isnan(0.5);
    bool _1859 = _1855 || _1857;
    float _1861 = _1849;
    float _1863 = _1847;
    float _1865 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (_1859)
    {
        _1861 = _1841;
    }
    float _1867 = _1861;
    float _1869 = _1867;
    if (_1859)
    {
        _1863 = _1843;
    }
    float _1871 = _1863;
    float _1873 = _1871;
    if (_1859)
    {
        _1865 = _1845;
    }
    float _1875 = _1865;
    float _1877 = _1875;
    if (!_1859)
    {
        float _1879 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1881 = _1333 + _1879;
        float _1883 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1885 = _1219 + _1883;
        float _1887 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1889 = -_1219;
        float _1891 = _1889 + _1841;
        float _1893 = _1881 * _1881;
        float _1895 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1897 = _1209 + _1895;
        float _1899 = -_1333;
        float _1901 = _1899 + _1843;
        float _1903 = -_1209;
        float _1905 = _1903 + _1845;
        float _1907 = fma(_1885, _1885, _1893);
        float _1909 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1911 = fma(_1897, _1897, _1907);
        float _1913 = sqrt(_1911);
        float _1915 = _1887 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1917 = precise::min(_1913, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1919 = _1917 * _1909;
        float _1921 = _1915 * _1919;
        float _1923 = fma(_1891, _1921, _1219);
        float _1925 = fma(_1901, _1921, _1333);
        float _1927 = fma(_1905, _1921, _1209);
        _1873 = _1925;
        _1869 = _1923;
        _1877 = _1927;
    }
    float _1929 = _1873;
    float _1931 = _1869;
    float _1933 = _1877;
    float _1935 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1937 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1939 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1941 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1943 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1935);
    float _1945 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1937);
    float _1947 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1939);
    float _1949 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1941);
    float _1951 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1943);
    float _1953 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1945);
    float _1955 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1947);
    float _1957 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1949);
    float _1959 = _1951 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1961 = _1953 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1963 = _1955 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1965 = _1957 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1967 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1969 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1971 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1973 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1975 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1967);
    float _1977 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1969);
    float _1979 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1971);
    float _1981 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1973);
    float _1983 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1975);
    float _1985 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1977);
    float _1987 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1979);
    float _1989 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1981);
    float _1991 = fma(_1965, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1983);
    float _1993 = fma(_1965, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1985);
    float _1995 = fma(_1965, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1987);
    float _1997 = fma(_1965, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1989);
    float _1999 = _1991 + _1995;
    float _2001 = _1993 + _1995;
    float _2003 = _1995 * 0.5;
    float _2005 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2007 = _1999 * 0.5;
    float _2009 = _2001 * 0.5;
    float _2011 = fma(_1997, -0.5, _2003);
    out.m_35.x = _2005;
    out.gl_Position.x = _1991;
    out.gl_Position.y = _1997;
    out.gl_Position.z = _1993;
    out.gl_Position.w = _1995;
    out.m_52.x = _2007;
    out.m_52.y = _2011;
    out.m_52.z = _2009;
    out.m_52.w = _1995;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

