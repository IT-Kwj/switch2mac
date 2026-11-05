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
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_44 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_52 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_50 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_42 [[attribute(4)]];
    float4 m_40 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1195 = false;
    bool _1045 = false;
    bool _931 = false;
    bool _635 = false;
    bool _479 = false;
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
        float _2478 = as_type<float>(_87);
        out.gl_Position.z = _2478;
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
    if (_101)
    {
        float _109 = float(_71);
        _81 = _109;
    }
    float _111 = _81;
    bool _113 = _105 >= _111;
    bool _115 = !_101;
    bool _117 = _113 || _115;
    float _119 = _111;
    if (_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (_117)
    {
        out.m_33.x = 0.0;
    }
    if (_117)
    {
        float _123 = _121 * 5.0;
        _89 = as_type<int>(_123);
    }
    int _125 = _89;
    float _127 = as_type<float>(_125);
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2549 = as_type<float>(_125);
        out.gl_Position.z = _2549;
    }
    if (_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = as_type<float>(int(gl_VertexIndex));
    float _131 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _133 = in.m_35.x;
    float _135 = in.m_35.y;
    float _137 = in.m_35.z;
    bool _139 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _141 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _143 = _139 || _141;
    bool _145 = isnan(1.0);
    bool _147 = _143 || _145;
    float _149 = _131;
    if (!_147)
    {
        float _151 = _131 * _131;
        float _153 = _151 * 0.5;
        _127 = _153;
    }
    float _155 = _127;
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
    int _171 = as_type<int>(_129) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_129) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_147;
    float _189 = _169;
    float _191 = _129;
    float _193 = _135;
    float _195 = _135;
    float _197 = _137;
    float _199 = _133;
    if (!_187)
    {
        float _201 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = log2(_201);
        float _205 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _207 = _205 + 1.0;
        float _209 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = _131 * _203;
        float _213 = 1.0 / _207;
        float _215 = _209 * 0.693147182464599609375;
        float _217 = exp2(_211);
        float _219 = 1.0 / _215;
        float _221 = _217 + (-1.0);
        float _223 = -_221;
        float _225 = fma(_223, _219, _131);
        float _227 = _225 * _213;
        float _229 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _107 = _217;
        _189 = _229;
        _191 = _219;
    }
    float _231 = _107;
    float _233 = _189;
    float _235 = _191;
    bool _237 = !_147;
    float _239 = _231;
    float _241 = _235;
    if (!_237)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = 1.0 / _249;
        float _253 = _131 * _245;
        float _255 = exp2(_253);
        float _257 = -_255;
        float _259 = _257 + 1.0;
        float _261 = _259 * _251;
        _239 = _255;
        _241 = _249;
        _149 = _261;
    }
    float _263 = _239;
    float _265 = _241;
    float _267 = _149;
    float _269 = _265;
    float _271 = _263;
    if (!_147)
    {
        _269 = _105;
    }
    float _273 = _269;
    float _275 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _277 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _279 = _273;
    if (!_147)
    {
        float _281 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _271 = _281;
    }
    float _283 = _271;
    bool _285 = !_147;
    float _287 = _283;
    if (!_285)
    {
        float _289 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _291 = log2(_289);
        float _293 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _295 = _293 + 1.0;
        float _297 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = _105 * _291;
        float _301 = 1.0 / _295;
        float _303 = _297 * 0.693147182464599609375;
        float _305 = exp2(_299);
        float _307 = 1.0 / _303;
        float _309 = _305 + (-1.0);
        float _311 = -_309;
        float _313 = fma(_311, _307, _105);
        float _315 = _313 * _301;
        float _317 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _287 = _317;
    }
    float _319 = _287;
    bool _321 = !_147;
    if (!_321)
    {
        float _323 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _325 = log2(_323);
        float _327 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _329 = _327 + 1.0;
        float _331 = 1.0 / _329;
        float _333 = _105 * _325;
        float _335 = exp2(_333);
        float _337 = -_335;
        float _339 = _337 + 1.0;
        float _341 = _339 * _331;
        _279 = _341;
    }
    float _343 = _279;
    float _345 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _347 = fma(_267, _135, _277);
    float _349 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _351 = fma(_267, _133, _275);
    float _353 = fma(_343, _135, _345);
    float _355 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _357 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _359 = fma(_343, _133, _349);
    float _361 = -_353;
    float _363 = _347 + _361;
    float _365 = fma(_343, _137, _355);
    float _367 = fma(_267, _137, _357);
    float _369 = -_359;
    float _371 = _351 + _369;
    float _373 = _363 * _363;
    float _375 = in.m_40.w;
    float _377 = -_365;
    float _379 = _367 + _377;
    float _381 = _363 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _383 = fma(_371, _371, _373);
    float _385 = _363 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _387 = _363 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _389 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].x, _381);
    float _391 = fma(_379, _379, _383);
    float _393 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].x, _385);
    float _395 = in.m_30.x;
    float _397 = in.m_30.y;
    float _399 = in.m_30.z;
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
    float _421 = fma(_351, _375, _395);
    float _423 = fma(_347, _375, _397);
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
            float _445 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _447 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _449 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _451 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _445);
            float _453 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _447);
            float _455 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _449);
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _451);
            float _459 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _453);
            float _461 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _455);
            float _463 = _457 * _457;
            float _465 = fma(_459, _459, _463);
            float _467 = fma(_461, _461, _465);
            float _469 = rsqrt(_467);
            float _471 = _469 * 9.9999999747524270787835121154785e-07;
            float _473 = _459 * _471;
            float _475 = _457 * _471;
            float _477 = _461 * _471;
            _439 = _475;
            _435 = _473;
            _431 = _477;
            _479 = true;
        }
        else
        {
            float _481 = _135 * _135;
            float _483 = fma(_133, _133, _481);
            float _485 = fma(_137, _137, _483);
            float _487 = sqrt(_485);
            bool _489 = _487 >= 9.9999999747524270787835121154785e-07;
            bool _491 = isnan(_487);
            bool _493 = _489 || _491;
            bool _495 = isnan(9.9999999747524270787835121154785e-07);
            bool _497 = _493 || _495;
            if (!_497)
            {
                float _499 = _397 * _397;
                float _501 = fma(_395, _395, _499);
                float _503 = fma(_399, _399, _501);
                float _505 = sqrt(_503);
                bool _507 = _505 >= 9.9999999747524270787835121154785e-07;
                bool _509 = isnan(_505);
                bool _511 = _507 || _509;
                bool _513 = isnan(9.9999999747524270787835121154785e-07);
                bool _515 = _511 || _513;
                if (!_515)
                {
                    float _517 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _519 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _517);
                    float _521 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _519);
                    float _523 = rsqrt(_521);
                    float _525 = _523 * 9.9999999747524270787835121154785e-07;
                    float _527 = _525 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _529 = _525 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _531 = _525 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _439 = _529;
                    _435 = _527;
                    _431 = _531;
                    _479 = true;
                }
                else
                {
                    float _533 = _397 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _535 = _397 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _537 = _397 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _539 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].x, _533);
                    float _541 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].x, _535);
                    float _543 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].x, _537);
                    float _545 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[5].z, _539);
                    float _547 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[4].z, _541);
                    float _549 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[6].z, _543);
                    float _551 = _545 * _545;
                    float _553 = fma(_547, _547, _551);
                    float _555 = fma(_549, _549, _553);
                    float _557 = rsqrt(_555);
                    float _559 = _557 * 9.9999999747524270787835121154785e-07;
                    float _561 = _547 * _559;
                    float _563 = _545 * _559;
                    float _565 = _549 * _559;
                    _439 = _563;
                    _435 = _561;
                    _431 = _565;
                    _479 = true;
                }
            }
            else
            {
                float _567 = _135 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _569 = _135 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _571 = _135 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _573 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[5].x, _567);
                float _575 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[4].x, _569);
                float _577 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[6].x, _571);
                float _579 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[5].z, _573);
                float _581 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[4].z, _575);
                float _583 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[6].z, _577);
                float _585 = _579 * _579;
                float _587 = fma(_581, _581, _585);
                float _589 = fma(_583, _583, _587);
                float _591 = rsqrt(_589);
                float _593 = _591 * 9.9999999747524270787835121154785e-07;
                float _595 = _581 * _593;
                float _597 = _579 * _593;
                float _599 = _583 * _593;
                _439 = _597;
                _435 = _595;
                _431 = _599;
            }
        }
    }
    _479 = false;
    float _601 = _439;
    float _603 = _435;
    float _605 = _431;
    bool _607 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _609 = !_607;
    float _611 = _601;
    float _613 = _603;
    float _615 = _605;
    float _633;
    if (!_609)
    {
        float _617 = in.m_42.x;
        float _619 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _621 = _617 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _623 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _625 = _623 * _619;
        float _627 = floor(_625);
        float _629 = -_627;
        float _631 = _625 + _629;
        _633 = _631;
        _635 = true;
    }
    else
    {
        float _637 = float(_71);
        float _639 = 1.0 / _637;
        float _641 = _105 * _639;
        _633 = _641;
    }
    _635 = false;
    float _643 = _633;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _647 = _643 + _645;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _649;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _657;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _665 = 1.0 / _651;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _667;
    bool _671 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _673 = 1.0 / _655;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _677 = _643 + _675;
    float _679 = 1.0 / _659;
    float _681 = _677 * _665;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _685 = _643 + _683;
    bool _687 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _689 = isnan(_643);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    float _699 = 1.0 / _663;
    float _701 = _647 * _673;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _705 = _643 + _703;
    bool _707 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _709 = isnan(_643);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _715 = _711 || _713;
    float _717 = float(_715);
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _721 = _643 + _719;
    float _723 = 1.0 / _669;
    float _725 = _685 * _679;
    bool _727 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _729 = isnan(_643);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _735 = _731 || _733;
    float _737 = float(_735);
    float _739 = -_697;
    float _741 = _739 + 1.0;
    float _743 = -_737;
    float _745 = _743 + 1.0;
    float _747 = _705 * _699;
    float _749 = -_717;
    float _751 = _749 + 1.0;
    float _753 = _697 * _745;
    bool _755 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _757 = isnan(_643);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = _737 * _751;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _769;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _773;
    float _777 = _721 * _723;
    bool _779 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _781 = isnan(_643);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    float _791 = fma(_771, _681, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _793 = fma(_775, _681, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _795 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _797 = isnan(_643);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _803 = _799 || _801;
    float _805 = float(_803);
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _809 = _807 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _811 = _789 * _741;
    float _813 = -_789;
    float _815 = _813 + 1.0;
    float _817 = -_765;
    float _819 = _817 + 1.0;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _825 = _765 * _815;
    float _827 = _805 * _819;
    float _829 = fma(_809, _701, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _831;
    float _835 = -_805;
    float _837 = _835 + 1.0;
    float _839 = _793 * _827;
    float _841 = _791 * _827;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _843;
    float _847 = fma(_823, _701, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _849 = fma(_833, _725, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _851 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[143].x, _839);
    float _853 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[143].y, _841);
    float _855 = in.m_40.x;
    float _857 = in.m_40.y;
    float _859 = fma(_845, _725, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _869 = fma(_829, _825, _851);
    float _871 = fma(_847, _825, _853);
    float _873 = fma(_867, _747, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _875;
    float _879 = fma(_863, _747, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _881;
    float _885 = fma(_849, _811, _869);
    float _887 = fma(_859, _811, _871);
    float _889 = fma(_877, _777, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _891 = fma(_883, _777, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _893 = fma(_879, _753, _885);
    float _895 = fma(_873, _753, _887);
    float _897 = fma(_889, _767, _893);
    float _899 = fma(_891, _767, _895);
    float _901 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[148].x, _897);
    float _903 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[148].y, _899);
    float _905 = _901 * _855;
    float _907 = _903 * _857;
    bool _909 = !_671;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _929;
    if (!_909)
    {
        float _913 = in.m_42.x;
        float _915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _917 = _913 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _919 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[11].x, _105);
        float _921 = _919 * _915;
        float _923 = floor(_921);
        float _925 = -_923;
        float _927 = _921 + _925;
        _929 = _927;
        _931 = true;
    }
    else
    {
        float _933 = float(_71);
        float _935 = 1.0 / _933;
        float _937 = _105 * _935;
        _929 = _937;
    }
    _931 = false;
    float _939 = _929;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _943 = _939 + _941;
    bool _945 = _939 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _947 = isnan(_939);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _953 = _949 || _951;
    float _955 = float(_953);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _957;
    bool _961 = _939 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _963 = isnan(_939);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    float _973 = -_955;
    float _975 = _973 + 1.0;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _979 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _977;
    float _981 = 1.0 / _959;
    bool _983 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _985 = _971 * _975;
    float _987 = -_971;
    float _989 = _987 + 1.0;
    float _991 = _943 * _981;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _993;
    float _997 = fma(_979, _991, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _999;
    float _1003 = fma(_995, _991, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1005 = _997 * _985;
    float _1007 = fma(_1001, _991, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1009 = _1003 * _985;
    float _1011 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1005);
    float _1013 = _1007 * _985;
    float _1015 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1009);
    float _1017 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1011);
    float _1019 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1013);
    float _1021 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1015);
    float _1023 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1019);
    bool _1025 = !_983;
    float _1043;
    if (!_1025)
    {
        float _1027 = in.m_42.x;
        float _1029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1031 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1033 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _1035 = _1033 * _1029;
        float _1037 = floor(_1035);
        float _1039 = -_1037;
        float _1041 = _1035 + _1039;
        _1043 = _1041;
        _1045 = true;
    }
    else
    {
        float _1047 = float(_71);
        float _1049 = 1.0 / _1047;
        float _1051 = _105 * _1049;
        _1043 = _1051;
    }
    _1045 = false;
    float _1053 = _1043;
    float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1057 = _1053 + _1055;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1061 = _1059 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1063 = _1053 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1065 = isnan(_1053);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1071 = _1067 || _1069;
    float _1073 = float(_1071);
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1077 = _1075 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1079 = _1053 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1081 = isnan(_1053);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1087 = _1083 || _1085;
    float _1089 = float(_1087);
    float _1091 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1091;
    bool _1095 = _1053 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1097 = isnan(_1053);
    bool _1099 = _1095 || _1097;
    bool _1101 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1103 = _1099 || _1101;
    float _1105 = float(_1103);
    float _1107 = 1.0 / _1061;
    float _1109 = -_1073;
    float _1111 = _1109 + 1.0;
    bool _1113 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1115 = _1089 * _1111;
    float _1117 = -_1089;
    float _1119 = _1117 + 1.0;
    float _1121 = 1.0 / _1077;
    float _1123 = _1093 * _1107;
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1127 = _1125 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1129 = fma(_1123, _1057, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1131 = -_1105;
    float _1133 = _1131 + 1.0;
    float _1135 = _1129 * _1115;
    float _1137 = _1127 * _1121;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1141 = _1053 + _1139;
    float _1143 = _1073 * _1133;
    float _1145 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1135);
    float _1147 = _1017 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1149 = fma(_1137, _1141, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1151 = _1021 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1153 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1155 = fma(_1149, _1143, _1145);
    float _1157 = _1023 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1159 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1161 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1155);
    float _1163 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1165 = _1161 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_44.x = _1153;
    out.m_44.y = _1163;
    out.m_44.z = _1159;
    out.m_44.w = _1165;
    bool _1167 = !_1113;
    float _1191;
    float _1193;
    if (!_1167)
    {
        float _1169 = in.m_42.x;
        float _1171 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1173 = float(_71);
        float _1175 = 1.0 / _1173;
        float _1177 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1179 = _105 * _1175;
        float _1181 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[11].z, _105);
        float _1183 = _1181 * _1171;
        float _1185 = floor(_1183);
        float _1187 = -_1185;
        float _1189 = _1183 + _1187;
        _1191 = _1189;
        _1193 = _1179;
        _1195 = true;
    }
    else
    {
        float _1197 = float(_71);
        float _1199 = 1.0 / _1197;
        float _1201 = _105 * _1199;
        _1191 = _1201;
        _1193 = _1201;
    }
    _1195 = false;
    float _1203 = _1191;
    float _1205 = _1193;
    float _1207 = in.m_42.x;
    float _1209 = in.m_42.y;
    float _1211 = in.m_42.z;
    float _1213 = in.m_42.w;
    float _1215 = _423 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1217 = _423 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1219 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1221 = _1219 != 0;
    float _1223 = _423 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1227 = _1225 != 0;
    float _1229 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1231 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1229;
    int _1233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1235 = _1233 != 0;
    float _1237 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1215);
    int _1239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1241 = _1239 != 0;
    float _1243 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1217);
    float _1245 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1223);
    float _1247 = 1.0 / _1231;
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1251 = _1249 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _1253 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1255 = _1253 != 0;
    float _1257 = _905 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1259 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _1261 = _907 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1263 = _1213 > 0.5;
    float _1265 = 1.0 / _1251;
    float _1267 = _1257 * _1259;
    float _1269 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1273 = _1271 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1275 = _601 * _601;
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1279 = _1277 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1281 = 1.0 / _1273;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1285;
    float _1289 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1291 = fma(_1269, -2.0, _1283);
    float _1293 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1243);
    float _1295 = 1.0 / _1279;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1299 = _1297 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1301 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1305;
    float _1309 = _1261 * _1301;
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1313 = _1311 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1315 = 1.0 / _1299;
    float _1317 = _1287 * _1281;
    float _1319 = -_1303;
    float _1321 = fma(_1289, 2.0, _1319);
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1329 = _1327 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1331 = 1.0 / _1313;
    float _1333 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1335 = _1203 + _1333;
    float _1337 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1339 = _1337 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1341 = _1329 * _1295;
    float _1343 = _1335 * _1247;
    float _1345 = -_185;
    int _1347 = _1263 ? as_type<int>(_1345) : as_type<int>(_185);
    float _1349 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1237);
    bool _1351 = _1209 > 0.5;
    float _1353 = _1325 * _1315;
    bool _1355 = !_1241;
    float _1357 = _1355 ? _185 : as_type<float>(_1347);
    float _1359 = 1.0 / _1339;
    float _1361 = -_185;
    int _1363 = _1351 ? as_type<int>(_1361) : as_type<int>(_185);
    float _1365 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1245);
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    bool _1371 = !_1227;
    float _1373 = _1371 ? _185 : as_type<float>(_1363);
    float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1377 = _1375 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1379 = _1307 * _1331;
    float _1381 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1383 = _1237;
    float _1385 = _1211;
    if (!_1255)
    {
        _1383 = _1209;
    }
    float _1387 = _1383;
    float _1389 = 1.0 / _1377;
    bool _1391 = _1207 > 0.5;
    float _1393 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1381);
    float _1395 = _1387;
    if (_1255)
    {
        _1395 = _1207;
    }
    float _1397 = _1395;
    float _1399 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1401 = _1211 > 0.5;
    float _1403 = _1369 * _1359;
    float _1405 = -_181;
    int _1407 = _1391 ? as_type<int>(_1405) : as_type<int>(_181);
    float _1409 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1399);
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1411;
    if (!_1255)
    {
        _911 = _1211;
    }
    float _1415 = _911;
    float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1419 = _1417 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1421 = _1415;
    if (_1255)
    {
        _1421 = _1209;
    }
    float _1423 = _1421;
    float _1425 = fma(_603, _603, _1275);
    if (_1255)
    {
        _1385 = _1209;
    }
    float _1427 = _1385;
    float _1429 = _1419 * _1265;
    float _1431 = _1413 * _1389;
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1435 = _1205 + _1433;
    bool _1437 = !_1221;
    float _1439 = _1437 ? _181 : as_type<float>(_1407);
    float _1441 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1443 = _1205 + _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1447 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1445;
    float _1449 = fma(_1317, _1435, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1453 = _1205 + _1451;
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1457 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1455;
    float _1459 = fma(_1447, _1343, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1463 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1461;
    float _1465 = fma(_1341, _1453, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1467 = -_181;
    int _1469 = _1401 ? as_type<int>(_1467) : as_type<int>(_181);
    float _1471 = fma(_1457, _1343, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1473 = fma(_605, _605, _1425);
    float _1475 = fma(_1463, _1343, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1479 = _1205 + _1477;
    bool _1481 = !_1235;
    float _1483 = _1481 ? _181 : as_type<float>(_1469);
    float _1485 = rsqrt(_1473);
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1489 = _1205 + _1487;
    float _1491 = fma(_1379, _1479, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1493 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1495 = _1205 + _1493;
    bool _1497 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1499 = isnan(_1205);
    bool _1501 = _1497 || _1499;
    bool _1503 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1505 = _1501 || _1503;
    float _1507 = float(_1505);
    float _1509 = fma(_1429, _1489, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1511 = fma(_1403, _1443, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1513 = fma(_1431, _1495, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1515 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1517 = _1205 + _1515;
    bool _1519 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1521 = isnan(_1205);
    bool _1523 = _1519 || _1521;
    bool _1525 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1527 = _1523 || _1525;
    float _1529 = float(_1527);
    float _1531 = -_1507;
    float _1533 = _1531 + 1.0;
    float _1535 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1537 = fma(_1353, _1517, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    bool _1539 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1541 = isnan(_1205);
    bool _1543 = _1539 || _1541;
    bool _1545 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1547 = _1543 || _1545;
    float _1549 = float(_1547);
    float _1551 = _1529 * _1533;
    float _1553 = -_1529;
    float _1555 = _1553 + 1.0;
    float _1557 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1535);
    float _1559 = _1485 * _605;
    float _1561 = -_1549;
    float _1563 = _1561 + 1.0;
    float _1565 = _1549 * _1555;
    float _1567 = _1485 * _603;
    float _1569 = _1485 * _601;
    float _1571 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1573 = _1559 * _1571;
    float _1575 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1577 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1579 = _1567 * _1577;
    float _1581 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1583 = _1569 * _1581;
    float _1585 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1587 = -_1573;
    float _1589 = fma(_1567, _1585, _1587);
    bool _1591 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1593 = isnan(_1205);
    bool _1595 = _1591 || _1593;
    bool _1597 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1599 = _1595 || _1597;
    float _1601 = float(_1599);
    float _1603 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1291);
    float _1605 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1607 = -_1583;
    float _1609 = fma(_1559, _1605, _1607);
    float _1611 = _1589 * _1589;
    float _1613 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1615 = -_1579;
    float _1617 = fma(_1569, _1613, _1615);
    float _1619 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1621 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1623 = isnan(_1205);
    bool _1625 = _1621 || _1623;
    bool _1627 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1629 = _1625 || _1627;
    float _1631 = float(_1629);
    float _1633 = fma(_1609, _1609, _1611);
    float _1635 = _1601 * _1563;
    bool _1637 = _1203 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1639 = isnan(_1203);
    bool _1641 = _1637 || _1639;
    bool _1643 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1645 = _1641 || _1643;
    float _1647 = float(_1645);
    float _1649 = -_1601;
    float _1651 = _1649 + 1.0;
    float _1653 = fma(_1617, _1617, _1633);
    float _1655 = _1575 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1657 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1659 = isnan(_1205);
    bool _1661 = _1657 || _1659;
    bool _1663 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1665 = _1661 || _1663;
    float _1667 = float(_1665);
    float _1669 = -_1631;
    float _1671 = _1669 + 1.0;
    float _1673 = rsqrt(_1653);
    bool _1675 = _1203 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1677 = isnan(_1203);
    bool _1679 = _1675 || _1677;
    bool _1681 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1683 = _1679 || _1681;
    float _1685 = float(_1683);
    float _1687 = _1631 * _1651;
    bool _1689 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1691 = isnan(_1205);
    bool _1693 = _1689 || _1691;
    bool _1695 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1697 = _1693 || _1695;
    float _1699 = float(_1697);
    float _1701 = _1667 * _1671;
    bool _1703 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1705 = isnan(_1205);
    bool _1707 = _1703 || _1705;
    bool _1709 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1711 = _1707 || _1709;
    float _1713 = float(_1711);
    float _1715 = -_1667;
    float _1717 = _1715 + 1.0;
    float _1719 = -_1685;
    float _1721 = _1719 + 1.0;
    float _1723 = _1619 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1725 = -_105;
    float _1727 = fma(_1725, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1321);
    float _1729 = _1439 + 0.5;
    float _1731 = -_1713;
    float _1733 = _1731 + 1.0;
    float _1735 = _1713 * _1717;
    float _1737 = _1647 * _1721;
    float _1739 = fma(_1723, _1729, _1727);
    float _1741 = _1373 + (-0.5);
    float _1743 = _1699 * _1733;
    float _1745 = _1589 * _1673;
    float _1747 = _1617 * _1673;
    float _1749 = _1471 * _1737;
    float _1751 = -_1655;
    float _1753 = -_1603;
    float _1755 = fma(_1751, _1741, _1753);
    float _1757 = _1475 * _1737;
    float _1759 = _1449 * _1743;
    float _1761 = _1459 * _1737;
    float _1763 = _1609 * _1673;
    float _1765 = _1309 * _1559;
    float _1767 = _1567 * _1745;
    float _1769 = _1309 * _1567;
    float _1771 = _1569 * _1747;
    float _1773 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1775 = -_1699;
    float _1777 = _1775 + 1.0;
    float _1779 = fma(_1267, _1747, _1765);
    float _1781 = -_1767;
    float _1783 = fma(_1569, _1763, _1781);
    float _1785 = fma(_1267, _1763, _1769);
    float _1787 = -_1771;
    float _1789 = fma(_1559, _1745, _1787);
    float _1791 = fma(_1777, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1759);
    float _1793 = fma(_1773, _1783, _1779);
    float _1795 = _1365 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1797 = fma(_1773, _1789, _1785);
    float _1799 = _1349 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1801 = _1795 + _1793;
    float _1803 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1805 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1807 = _1799 + _1797;
    float _1809 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1811 = _1801 + _1809;
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1815 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1805);
    float _1817 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1819 = _1807 + _1817;
    float _1821 = _1811 * _1811;
    float _1823 = _1423 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1825 = fma(_1509, _1735, _1791);
    float _1827 = -_1813;
    float _1829 = fma(_1803, 2.0, _1827);
    float _1831 = fma(_1819, _1819, _1821);
    float _1833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1835 = fma(_1537, _1701, _1825);
    float _1837 = -_1647;
    float _1839 = _1837 + 1.0;
    float _1841 = _1309 * _1569;
    float _1843 = _1559 * _1763;
    float _1845 = fma(_1465, _1687, _1835);
    float _1847 = _1293 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1849 = sqrt(_1831);
    float _1851 = fma(_1267, _1745, _1841);
    float _1853 = -_1843;
    float _1855 = fma(_1567, _1747, _1853);
    float _1857 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1859 = fma(_1491, _1635, _1845);
    float _1861 = fma(_1839, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1761);
    float _1863 = fma(_1773, _1855, _1851);
    float _1865 = fma(_1823, -2.0, _1857);
    float _1867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1869 = fma(_1839, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1749);
    float _1871 = fma(_1839, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1757);
    float _1873 = fma(_1511, _1565, _1859);
    float _1875 = _1847 + _1863;
    float _1877 = _1833 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1879 = _1483 + 0.5;
    float _1881 = _1357 + (-0.5);
    bool _1883 = _1849 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1885 = -_105;
    float _1887 = fma(_1885, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1829);
    float _1889 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1865);
    float _1891 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1393);
    float _1893 = fma(_1685, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1861);
    float _1895 = fma(_1685, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1869);
    float _1897 = fma(_1685, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1871);
    float _1899 = _1867 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1901 = fma(_1513, _1551, _1873);
    float _1903 = fma(_1877, _1879, _1887);
    float _1905 = -_1891;
    float _1907 = _1905 + 1.0;
    float _1909 = -_1899;
    float _1911 = -_1889;
    float _1913 = fma(_1909, _1881, _1911);
    float _1915 = _1871;
    float _1917 = _1807;
    float _1919 = _1801;
    float _1921 = _1473;
    if (!_1883)
    {
        _1915 = _1875;
    }
    float _1923 = _1915;
    bool _1925 = !_1883;
    float _1927 = _1923;
    if (!_1925)
    {
        float _1929 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1931 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1933 = _1849 + _1931;
        float _1935 = _1875 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1937 = rsqrt(_1831);
        float _1939 = _1933 * _1929;
        float _1941 = _1939 * 0.15915493667125701904296875;
        float _1943 = _1941 * 6.283185482025146484375;
        float _1945 = cos(_1943);
        float _1947 = _1941 * 6.283185482025146484375;
        float _1949 = sin(_1947);
        float _1951 = _1945 + (-1.0);
        float _1953 = fma(_1949, _1935, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1955 = _1951 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1957 = _1937 * _1953;
        float _1959 = fma(_1875, _1945, _1955);
        float _1961 = fma(_1819, _1957, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1963 = fma(_1811, _1957, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1927 = _1959;
        _1917 = _1961;
        _1919 = _1963;
    }
    float _1965 = _1927;
    float _1967 = _1917;
    float _1969 = _1919;
    float _1971 = -_1847;
    float _1973 = _1971 + _1965;
    float _1975 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1409);
    float _1977 = -_1907;
    float _1979 = fma(_1439, _1977, _1739);
    float _1981 = -_1799;
    float _1983 = _1981 + _1967;
    float _1985 = _1973 * _1973;
    float _1987 = -_1975;
    float _1989 = _1987 + 1.0;
    float _1991 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1815);
    float _1993 = -_1795;
    float _1995 = _1993 + _1969;
    float _1997 = fma(_1983, _1983, _1985);
    float _1999 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1557);
    float _2001 = -_1991;
    float _2003 = _2001 + 1.0;
    float _2005 = fma(_1373, _1989, _1755);
    float _2007 = fma(_1995, _1995, _1997);
    float _2009 = -_1999;
    float _2011 = _2009 + 1.0;
    float _2013 = -_2003;
    float _2015 = fma(_1483, _2013, _1903);
    float _2017 = sqrt(_2007);
    float _2019 = fma(_1357, _2011, _1913);
    float _2021 = _1893 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2023 = _1895 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2025 = _1897 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2027 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2029 = _2021 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2031 = _2023 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2033 = _2025 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2035 = fma(_1507, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1901);
    out.m_46.x = _1979;
    out.m_46.y = _2005;
    out.m_46.z = _2015;
    out.m_46.w = _2019;
    out.m_48.x = _2029;
    out.m_48.y = _2031;
    out.m_48.z = _2033;
    out.m_48.w = _2027;
    bool _2037 = _2017 > 0.0;
    out.m_50.x = _2035;
    bool _2039 = !_2037;
    float _2041 = _2019;
    float _2043 = _2005;
    float _2045 = _1967;
    float _2047 = _1965;
    float _2049 = _1969;
    if (!_2039)
    {
        bool _2051 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2053 = _1979;
        if (_2051)
        {
            float _2055 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2053 = _2055;
        }
        float _2057 = _2053;
        float _2059 = _2057;
        if (_2051)
        {
            float _2061 = _2057 * _603;
            _2041 = _2061;
        }
        float _2063 = _2041;
        float _2065 = _2063;
        if (_2051)
        {
            float _2067 = _2057 * _601;
            _2043 = _2067;
        }
        float _2069 = _2043;
        float _2071 = _2069;
        if (_2051)
        {
            float _2073 = _2057 * _605;
            _2059 = _2073;
        }
        float _2075 = _2059;
        float _2077 = _2075;
        float _2079 = _2075;
        if (!_2051)
        {
            float _2081 = _105 + 1.0;
            float _2083 = _2081;
            if (!_147)
            {
                float _2085 = _2081 * _2081;
                float _2087 = _2085 * 0.5;
                _2077 = _2087;
            }
            float _2089 = _2077;
            float _2091 = _2089;
            if (!_147)
            {
                float _2093 = _2089 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2091 = _2093;
            }
            float _2095 = _2091;
            bool _2097 = !_147;
            float _2099 = _2095;
            if (!_2097)
            {
                float _2101 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2103 = log2(_2101);
                float _2105 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2107 = _2105 + 1.0;
                float _2109 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2111 = _2103 * _2081;
                float _2113 = 1.0 / _2107;
                float _2115 = _2109 * 0.693147182464599609375;
                float _2117 = exp2(_2111);
                float _2119 = 1.0 / _2115;
                float _2121 = _2117 + (-1.0);
                float _2123 = -_2121;
                float _2125 = fma(_2123, _2119, _2081);
                float _2127 = _2125 * _2113;
                float _2129 = _2127 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2099 = _2129;
            }
            float _2131 = _2099;
            float _2133 = _2131 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2135 = _2131 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2137 = !_147;
            if (!_2137)
            {
                float _2139 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2141 = log2(_2139);
                float _2143 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2145 = _2143 + 1.0;
                float _2147 = 1.0 / _2145;
                float _2149 = _2141 * _2081;
                float _2151 = exp2(_2149);
                float _2153 = -_2151;
                float _2155 = _2153 + 1.0;
                float _2157 = _2155 * _2147;
                _2083 = _2157;
            }
            float _2159 = _2083;
            float _2161 = fma(_2159, _135, _2135);
            float _2163 = _2131 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2165 = fma(_2159, _133, _2133);
            float _2167 = -_353;
            float _2169 = _2167 + _2161;
            float _2171 = fma(_2159, _137, _2163);
            float _2173 = -_359;
            float _2175 = _2173 + _2165;
            float _2177 = _2169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2179 = _2169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2181 = -_365;
            float _2183 = _2181 + _2171;
            float _2185 = _2169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2187 = fma(_2175, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2177);
            float _2189 = fma(_2175, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2179);
            float _2191 = fma(_2175, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2185);
            float _2193 = fma(_2183, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2187);
            float _2195 = fma(_2183, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2189);
            float _2197 = fma(_2183, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2191);
            float _2199 = _2193 * _2193;
            float _2201 = fma(_2195, _2195, _2199);
            float _2203 = fma(_2197, _2197, _2201);
            _1921 = _2203;
            _611 = _2193;
            _613 = _2195;
            _615 = _2197;
            _2065 = _2195;
            _2071 = _2193;
            _2079 = _2197;
            _193 = _2185;
        }
        float _2205 = _1921;
        float _2207 = _611;
        float _2209 = _613;
        float _2211 = _615;
        float _2213 = _2065;
        float _2215 = _2071;
        float _2217 = _2079;
        float _2219 = _193;
        float _2221 = sqrt(_2205);
        float _2223 = rsqrt(_2007);
        bool _2225 = _2221 > 0.0;
        float _2227 = _1983 * _2223;
        float _2229 = _1973 * _2223;
        float _2231 = _1995 * _2223;
        bool _2233 = !_2225;
        _195 = _2219;
        _197 = _2227;
        _199 = _2221;
        if (!_2233)
        {
            float _2235 = rsqrt(_2205);
            float _2237 = _2235 * _2207;
            float _2239 = _2235 * _2209;
            float _2241 = _2229 * _2237;
            float _2243 = _2235 * _2211;
            float _2245 = fma(_2227, _2239, _2241);
            float _2247 = fma(_2231, _2243, _2245);
            float _2249 = _2247 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2251 = fma(_2213, _2249, _1967);
            float _2253 = fma(_2215, _2249, _1965);
            float _2255 = fma(_2217, _2249, _1969);
            _2045 = _2251;
            _2047 = _2253;
            _2049 = _2255;
            _195 = _2243;
            _199 = _2249;
        }
    }
    float _2257 = _2045;
    float _2259 = _2047;
    float _2261 = _2049;
    float _2263 = _195;
    float _2265 = _197;
    float _2267 = _199;
    bool _2269 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2271 = isnan(0.5);
    bool _2273 = _2269 || _2271;
    bool _2275 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2277 = _2273 || _2275;
    float _2279 = _2265;
    float _2281 = _2263;
    float _2283 = _2267;
    if (_2277)
    {
        _2279 = _2257;
    }
    float _2285 = _2279;
    float _2287 = _2285;
    if (_2277)
    {
        _2281 = _2259;
    }
    float _2289 = _2281;
    float _2291 = _2289;
    if (_2277)
    {
        _2283 = _2261;
    }
    float _2293 = _2283;
    float _2295 = _2293;
    if (!_2277)
    {
        float _2297 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2299 = _1847 + _2297;
        float _2301 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2303 = _1799 + _2301;
        float _2305 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2307 = -_1847;
        float _2309 = _2307 + _2259;
        float _2311 = _2299 * _2299;
        float _2313 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2315 = _1795 + _2313;
        float _2317 = -_1795;
        float _2319 = _2317 + _2261;
        float _2321 = fma(_2303, _2303, _2311);
        float _2323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2325 = fma(_2315, _2315, _2321);
        float _2327 = sqrt(_2325);
        float _2329 = _2305 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2331 = precise::min(_2327, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2333 = _2331 * _2323;
        float _2335 = -_1799;
        float _2337 = _2335 + _2257;
        float _2339 = _2329 * _2333;
        float _2341 = fma(_2337, _2339, _1799);
        float _2343 = fma(_2309, _2339, _1847);
        float _2345 = fma(_2319, _2339, _1795);
        _2291 = _2343;
        _2287 = _2341;
        _2295 = _2345;
    }
    float _2347 = _2291;
    float _2349 = _2287;
    float _2351 = _2295;
    float _2353 = _2347 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2355 = _2347 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2357 = _2347 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2359 = _2347 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2361 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2353);
    float _2363 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2355);
    float _2365 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2357);
    float _2367 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2359);
    float _2369 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2361);
    float _2371 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2363);
    float _2373 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2365);
    float _2375 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2367);
    float _2377 = _2369 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2379 = _2371 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2381 = _2373 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2383 = _2375 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2385 = _2377 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2387 = _2377 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2389 = _2377 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2391 = _2377 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2393 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2385);
    float _2395 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2387);
    float _2397 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2389);
    float _2399 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2391);
    float _2401 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2393);
    float _2403 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2395);
    float _2405 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2397);
    float _2407 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2399);
    float _2409 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2401);
    float _2411 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2403);
    float _2413 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2405);
    float _2415 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2407);
    float _2417 = _2409 + _2411;
    float _2419 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2421 = _2417 * 0.5;
    out.m_33.x = _2419;
    out.gl_Position.x = _2413;
    out.gl_Position.y = _2415;
    out.gl_Position.z = _2409;
    out.gl_Position.w = _2411;
    out.m_52.z = _2421;
    out.m_52.w = _2411;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1195 = false;
    bool _1045 = false;
    bool _931 = false;
    bool _635 = false;
    bool _479 = false;
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
        float _2478 = as_type<float>(_87);
        out.gl_Position.z = _2478;
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
    if (_101)
    {
        float _109 = float(_71);
        _81 = _109;
    }
    float _111 = _81;
    bool _113 = _105 >= _111;
    bool _115 = !_101;
    bool _117 = _113 || _115;
    float _119 = _111;
    if (_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (_117)
    {
        out.m_33.x = 0.0;
    }
    if (_117)
    {
        float _123 = _121 * 5.0;
        _89 = as_type<int>(_123);
    }
    int _125 = _89;
    float _127 = as_type<float>(_125);
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2549 = as_type<float>(_125);
        out.gl_Position.z = _2549;
    }
    if (_117)
    {
        return out;
    }
    float _129 = as_type<float>(int(gl_VertexIndex));
    float _131 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _133 = in.m_35.x;
    float _135 = in.m_35.y;
    float _137 = in.m_35.z;
    bool _139 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _141 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _143 = _139 || _141;
    bool _145 = isnan(1.0);
    bool _147 = _143 || _145;
    float _149 = _131;
    if (!_147)
    {
        float _151 = _131 * _131;
        float _153 = _151 * 0.5;
        _127 = _153;
    }
    float _155 = _127;
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
    int _171 = as_type<int>(_129) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_129) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_147;
    float _189 = _169;
    float _191 = _129;
    float _193 = _135;
    float _195 = _135;
    float _197 = _137;
    float _199 = _133;
    if (!_187)
    {
        float _201 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = log2(_201);
        float _205 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _207 = _205 + 1.0;
        float _209 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = _131 * _203;
        float _213 = 1.0 / _207;
        float _215 = _209 * 0.693147182464599609375;
        float _217 = exp2(_211);
        float _219 = 1.0 / _215;
        float _221 = _217 + (-1.0);
        float _223 = -_221;
        float _225 = fma(_223, _219, _131);
        float _227 = _225 * _213;
        float _229 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _107 = _217;
        _189 = _229;
        _191 = _219;
    }
    float _231 = _107;
    float _233 = _189;
    float _235 = _191;
    bool _237 = !_147;
    float _239 = _231;
    float _241 = _235;
    if (!_237)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = 1.0 / _249;
        float _253 = _131 * _245;
        float _255 = exp2(_253);
        float _257 = -_255;
        float _259 = _257 + 1.0;
        float _261 = _259 * _251;
        _239 = _255;
        _241 = _249;
        _149 = _261;
    }
    float _263 = _239;
    float _265 = _241;
    float _267 = _149;
    float _269 = _265;
    float _271 = _263;
    if (!_147)
    {
        _269 = _105;
    }
    float _273 = _269;
    float _275 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _277 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _279 = _273;
    if (!_147)
    {
        float _281 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _271 = _281;
    }
    float _283 = _271;
    bool _285 = !_147;
    float _287 = _283;
    if (!_285)
    {
        float _289 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _291 = log2(_289);
        float _293 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _295 = _293 + 1.0;
        float _297 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = _105 * _291;
        float _301 = 1.0 / _295;
        float _303 = _297 * 0.693147182464599609375;
        float _305 = exp2(_299);
        float _307 = 1.0 / _303;
        float _309 = _305 + (-1.0);
        float _311 = -_309;
        float _313 = fma(_311, _307, _105);
        float _315 = _313 * _301;
        float _317 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _287 = _317;
    }
    float _319 = _287;
    bool _321 = !_147;
    if (!_321)
    {
        float _323 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _325 = log2(_323);
        float _327 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _329 = _327 + 1.0;
        float _331 = 1.0 / _329;
        float _333 = _105 * _325;
        float _335 = exp2(_333);
        float _337 = -_335;
        float _339 = _337 + 1.0;
        float _341 = _339 * _331;
        _279 = _341;
    }
    float _343 = _279;
    float _345 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _347 = fma(_267, _135, _277);
    float _349 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _351 = fma(_267, _133, _275);
    float _353 = fma(_343, _135, _345);
    float _355 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _357 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _359 = fma(_343, _133, _349);
    float _361 = -_353;
    float _363 = _347 + _361;
    float _365 = fma(_343, _137, _355);
    float _367 = fma(_267, _137, _357);
    float _369 = -_359;
    float _371 = _351 + _369;
    float _373 = _363 * _363;
    float _375 = in.m_40.w;
    float _377 = -_365;
    float _379 = _367 + _377;
    float _381 = _363 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _383 = fma(_371, _371, _373);
    float _385 = _363 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _387 = _363 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _389 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].x, _381);
    float _391 = fma(_379, _379, _383);
    float _393 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].x, _385);
    float _395 = in.m_30.x;
    float _397 = in.m_30.y;
    float _399 = in.m_30.z;
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
    float _421 = fma(_351, _375, _395);
    float _423 = fma(_347, _375, _397);
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
            float _445 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _447 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _449 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _451 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _445);
            float _453 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _447);
            float _455 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _449);
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _451);
            float _459 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _453);
            float _461 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _455);
            float _463 = _457 * _457;
            float _465 = fma(_459, _459, _463);
            float _467 = fma(_461, _461, _465);
            float _469 = rsqrt(_467);
            float _471 = _469 * 9.9999999747524270787835121154785e-07;
            float _473 = _459 * _471;
            float _475 = _457 * _471;
            float _477 = _461 * _471;
            _439 = _475;
            _435 = _473;
            _431 = _477;
            _479 = true;
        }
        else
        {
            float _481 = _135 * _135;
            float _483 = fma(_133, _133, _481);
            float _485 = fma(_137, _137, _483);
            float _487 = sqrt(_485);
            bool _489 = _487 >= 9.9999999747524270787835121154785e-07;
            bool _491 = isnan(_487);
            bool _493 = _489 || _491;
            bool _495 = isnan(9.9999999747524270787835121154785e-07);
            bool _497 = _493 || _495;
            if (!_497)
            {
                float _499 = _397 * _397;
                float _501 = fma(_395, _395, _499);
                float _503 = fma(_399, _399, _501);
                float _505 = sqrt(_503);
                bool _507 = _505 >= 9.9999999747524270787835121154785e-07;
                bool _509 = isnan(_505);
                bool _511 = _507 || _509;
                bool _513 = isnan(9.9999999747524270787835121154785e-07);
                bool _515 = _511 || _513;
                if (!_515)
                {
                    float _517 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _519 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _517);
                    float _521 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _519);
                    float _523 = rsqrt(_521);
                    float _525 = _523 * 9.9999999747524270787835121154785e-07;
                    float _527 = _525 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _529 = _525 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _531 = _525 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _439 = _529;
                    _435 = _527;
                    _431 = _531;
                    _479 = true;
                }
                else
                {
                    float _533 = _397 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _535 = _397 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _537 = _397 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _539 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].x, _533);
                    float _541 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].x, _535);
                    float _543 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].x, _537);
                    float _545 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[5].z, _539);
                    float _547 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[4].z, _541);
                    float _549 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[6].z, _543);
                    float _551 = _545 * _545;
                    float _553 = fma(_547, _547, _551);
                    float _555 = fma(_549, _549, _553);
                    float _557 = rsqrt(_555);
                    float _559 = _557 * 9.9999999747524270787835121154785e-07;
                    float _561 = _547 * _559;
                    float _563 = _545 * _559;
                    float _565 = _549 * _559;
                    _439 = _563;
                    _435 = _561;
                    _431 = _565;
                    _479 = true;
                }
            }
            else
            {
                float _567 = _135 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _569 = _135 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _571 = _135 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _573 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[5].x, _567);
                float _575 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[4].x, _569);
                float _577 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[6].x, _571);
                float _579 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[5].z, _573);
                float _581 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[4].z, _575);
                float _583 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[6].z, _577);
                float _585 = _579 * _579;
                float _587 = fma(_581, _581, _585);
                float _589 = fma(_583, _583, _587);
                float _591 = rsqrt(_589);
                float _593 = _591 * 9.9999999747524270787835121154785e-07;
                float _595 = _581 * _593;
                float _597 = _579 * _593;
                float _599 = _583 * _593;
                _439 = _597;
                _435 = _595;
                _431 = _599;
            }
        }
    }
    _479 = false;
    float _601 = _439;
    float _603 = _435;
    float _605 = _431;
    bool _607 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _609 = !_607;
    float _611 = _601;
    float _613 = _603;
    float _615 = _605;
    float _633;
    if (!_609)
    {
        float _617 = in.m_42.x;
        float _619 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _621 = _617 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _623 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _625 = _623 * _619;
        float _627 = floor(_625);
        float _629 = -_627;
        float _631 = _625 + _629;
        _633 = _631;
        _635 = true;
    }
    else
    {
        float _637 = float(_71);
        float _639 = 1.0 / _637;
        float _641 = _105 * _639;
        _633 = _641;
    }
    _635 = false;
    float _643 = _633;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _647 = _643 + _645;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _649;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _657;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _665 = 1.0 / _651;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _667;
    bool _671 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _673 = 1.0 / _655;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _677 = _643 + _675;
    float _679 = 1.0 / _659;
    float _681 = _677 * _665;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _685 = _643 + _683;
    bool _687 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _689 = isnan(_643);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    float _699 = 1.0 / _663;
    float _701 = _647 * _673;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _705 = _643 + _703;
    bool _707 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _709 = isnan(_643);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _715 = _711 || _713;
    float _717 = float(_715);
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _721 = _643 + _719;
    float _723 = 1.0 / _669;
    float _725 = _685 * _679;
    bool _727 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _729 = isnan(_643);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _735 = _731 || _733;
    float _737 = float(_735);
    float _739 = -_697;
    float _741 = _739 + 1.0;
    float _743 = -_737;
    float _745 = _743 + 1.0;
    float _747 = _705 * _699;
    float _749 = -_717;
    float _751 = _749 + 1.0;
    float _753 = _697 * _745;
    bool _755 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _757 = isnan(_643);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = _737 * _751;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _769;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _773;
    float _777 = _721 * _723;
    bool _779 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _781 = isnan(_643);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    float _791 = fma(_771, _681, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _793 = fma(_775, _681, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _795 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _797 = isnan(_643);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _803 = _799 || _801;
    float _805 = float(_803);
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _809 = _807 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _811 = _789 * _741;
    float _813 = -_789;
    float _815 = _813 + 1.0;
    float _817 = -_765;
    float _819 = _817 + 1.0;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _825 = _765 * _815;
    float _827 = _805 * _819;
    float _829 = fma(_809, _701, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _831;
    float _835 = -_805;
    float _837 = _835 + 1.0;
    float _839 = _793 * _827;
    float _841 = _791 * _827;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _843;
    float _847 = fma(_823, _701, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _849 = fma(_833, _725, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _851 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[143].x, _839);
    float _853 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[143].y, _841);
    float _855 = in.m_40.x;
    float _857 = in.m_40.y;
    float _859 = fma(_845, _725, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _869 = fma(_829, _825, _851);
    float _871 = fma(_847, _825, _853);
    float _873 = fma(_867, _747, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _875;
    float _879 = fma(_863, _747, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _881;
    float _885 = fma(_849, _811, _869);
    float _887 = fma(_859, _811, _871);
    float _889 = fma(_877, _777, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _891 = fma(_883, _777, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _893 = fma(_879, _753, _885);
    float _895 = fma(_873, _753, _887);
    float _897 = fma(_889, _767, _893);
    float _899 = fma(_891, _767, _895);
    float _901 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[148].x, _897);
    float _903 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[148].y, _899);
    float _905 = _901 * _855;
    float _907 = _903 * _857;
    bool _909 = !_671;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _929;
    if (!_909)
    {
        float _913 = in.m_42.x;
        float _915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _917 = _913 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _919 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[11].x, _105);
        float _921 = _919 * _915;
        float _923 = floor(_921);
        float _925 = -_923;
        float _927 = _921 + _925;
        _929 = _927;
        _931 = true;
    }
    else
    {
        float _933 = float(_71);
        float _935 = 1.0 / _933;
        float _937 = _105 * _935;
        _929 = _937;
    }
    _931 = false;
    float _939 = _929;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _943 = _939 + _941;
    bool _945 = _939 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _947 = isnan(_939);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _953 = _949 || _951;
    float _955 = float(_953);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _957;
    bool _961 = _939 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _963 = isnan(_939);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    float _973 = -_955;
    float _975 = _973 + 1.0;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _979 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _977;
    float _981 = 1.0 / _959;
    bool _983 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _985 = _971 * _975;
    float _987 = -_971;
    float _989 = _987 + 1.0;
    float _991 = _943 * _981;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _993;
    float _997 = fma(_979, _991, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _999;
    float _1003 = fma(_995, _991, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1005 = _997 * _985;
    float _1007 = fma(_1001, _991, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1009 = _1003 * _985;
    float _1011 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1005);
    float _1013 = _1007 * _985;
    float _1015 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1009);
    float _1017 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1011);
    float _1019 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1013);
    float _1021 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1015);
    float _1023 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1019);
    bool _1025 = !_983;
    float _1043;
    if (!_1025)
    {
        float _1027 = in.m_42.x;
        float _1029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1031 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1033 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _1035 = _1033 * _1029;
        float _1037 = floor(_1035);
        float _1039 = -_1037;
        float _1041 = _1035 + _1039;
        _1043 = _1041;
        _1045 = true;
    }
    else
    {
        float _1047 = float(_71);
        float _1049 = 1.0 / _1047;
        float _1051 = _105 * _1049;
        _1043 = _1051;
    }
    _1045 = false;
    float _1053 = _1043;
    float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1057 = _1053 + _1055;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1061 = _1059 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1063 = _1053 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1065 = isnan(_1053);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1071 = _1067 || _1069;
    float _1073 = float(_1071);
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1077 = _1075 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1079 = _1053 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1081 = isnan(_1053);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1087 = _1083 || _1085;
    float _1089 = float(_1087);
    float _1091 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1091;
    bool _1095 = _1053 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1097 = isnan(_1053);
    bool _1099 = _1095 || _1097;
    bool _1101 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1103 = _1099 || _1101;
    float _1105 = float(_1103);
    float _1107 = 1.0 / _1061;
    float _1109 = -_1073;
    float _1111 = _1109 + 1.0;
    bool _1113 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1115 = _1089 * _1111;
    float _1117 = -_1089;
    float _1119 = _1117 + 1.0;
    float _1121 = 1.0 / _1077;
    float _1123 = _1093 * _1107;
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1127 = _1125 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1129 = fma(_1123, _1057, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1131 = -_1105;
    float _1133 = _1131 + 1.0;
    float _1135 = _1129 * _1115;
    float _1137 = _1127 * _1121;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1141 = _1053 + _1139;
    float _1143 = _1073 * _1133;
    float _1145 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1135);
    float _1147 = _1017 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1149 = fma(_1137, _1141, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1151 = _1021 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1153 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1155 = fma(_1149, _1143, _1145);
    float _1157 = _1023 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1159 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1161 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1155);
    float _1163 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1165 = _1161 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_44.x = _1153;
    out.m_44.y = _1163;
    out.m_44.z = _1159;
    out.m_44.w = _1165;
    bool _1167 = !_1113;
    float _1191;
    float _1193;
    if (!_1167)
    {
        float _1169 = in.m_42.x;
        float _1171 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1173 = float(_71);
        float _1175 = 1.0 / _1173;
        float _1177 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1179 = _105 * _1175;
        float _1181 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[11].z, _105);
        float _1183 = _1181 * _1171;
        float _1185 = floor(_1183);
        float _1187 = -_1185;
        float _1189 = _1183 + _1187;
        _1191 = _1189;
        _1193 = _1179;
        _1195 = true;
    }
    else
    {
        float _1197 = float(_71);
        float _1199 = 1.0 / _1197;
        float _1201 = _105 * _1199;
        _1191 = _1201;
        _1193 = _1201;
    }
    _1195 = false;
    float _1203 = _1191;
    float _1205 = _1193;
    float _1207 = in.m_42.x;
    float _1209 = in.m_42.y;
    float _1211 = in.m_42.z;
    float _1213 = in.m_42.w;
    float _1215 = _423 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1217 = _423 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1219 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1221 = _1219 != 0;
    float _1223 = _423 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1227 = _1225 != 0;
    float _1229 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1231 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1229;
    int _1233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1235 = _1233 != 0;
    float _1237 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1215);
    int _1239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1241 = _1239 != 0;
    float _1243 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1217);
    float _1245 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1223);
    float _1247 = 1.0 / _1231;
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1251 = _1249 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _1253 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1255 = _1253 != 0;
    float _1257 = _905 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1259 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _1261 = _907 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1263 = _1213 > 0.5;
    float _1265 = 1.0 / _1251;
    float _1267 = _1257 * _1259;
    float _1269 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1273 = _1271 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1275 = _601 * _601;
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1279 = _1277 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1281 = 1.0 / _1273;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1285;
    float _1289 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1291 = fma(_1269, -2.0, _1283);
    float _1293 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1243);
    float _1295 = 1.0 / _1279;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1299 = _1297 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1301 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1305;
    float _1309 = _1261 * _1301;
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1313 = _1311 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1315 = 1.0 / _1299;
    float _1317 = _1287 * _1281;
    float _1319 = -_1303;
    float _1321 = fma(_1289, 2.0, _1319);
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1329 = _1327 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1331 = 1.0 / _1313;
    float _1333 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1335 = _1203 + _1333;
    float _1337 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1339 = _1337 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1341 = _1329 * _1295;
    float _1343 = _1335 * _1247;
    float _1345 = -_185;
    int _1347 = _1263 ? as_type<int>(_1345) : as_type<int>(_185);
    float _1349 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1237);
    bool _1351 = _1209 > 0.5;
    float _1353 = _1325 * _1315;
    bool _1355 = !_1241;
    float _1357 = _1355 ? _185 : as_type<float>(_1347);
    float _1359 = 1.0 / _1339;
    float _1361 = -_185;
    int _1363 = _1351 ? as_type<int>(_1361) : as_type<int>(_185);
    float _1365 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1245);
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    bool _1371 = !_1227;
    float _1373 = _1371 ? _185 : as_type<float>(_1363);
    float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1377 = _1375 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1379 = _1307 * _1331;
    float _1381 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1383 = _1237;
    float _1385 = _1211;
    if (!_1255)
    {
        _1383 = _1209;
    }
    float _1387 = _1383;
    float _1389 = 1.0 / _1377;
    bool _1391 = _1207 > 0.5;
    float _1393 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1381);
    float _1395 = _1387;
    if (_1255)
    {
        _1395 = _1207;
    }
    float _1397 = _1395;
    float _1399 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1401 = _1211 > 0.5;
    float _1403 = _1369 * _1359;
    float _1405 = -_181;
    int _1407 = _1391 ? as_type<int>(_1405) : as_type<int>(_181);
    float _1409 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1399);
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1411;
    if (!_1255)
    {
        _911 = _1211;
    }
    float _1415 = _911;
    float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1419 = _1417 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1421 = _1415;
    if (_1255)
    {
        _1421 = _1209;
    }
    float _1423 = _1421;
    float _1425 = fma(_603, _603, _1275);
    if (_1255)
    {
        _1385 = _1209;
    }
    float _1427 = _1385;
    float _1429 = _1419 * _1265;
    float _1431 = _1413 * _1389;
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1435 = _1205 + _1433;
    bool _1437 = !_1221;
    float _1439 = _1437 ? _181 : as_type<float>(_1407);
    float _1441 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1443 = _1205 + _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1447 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1445;
    float _1449 = fma(_1317, _1435, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1453 = _1205 + _1451;
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1457 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1455;
    float _1459 = fma(_1447, _1343, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1463 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1461;
    float _1465 = fma(_1341, _1453, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1467 = -_181;
    int _1469 = _1401 ? as_type<int>(_1467) : as_type<int>(_181);
    float _1471 = fma(_1457, _1343, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1473 = fma(_605, _605, _1425);
    float _1475 = fma(_1463, _1343, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1479 = _1205 + _1477;
    bool _1481 = !_1235;
    float _1483 = _1481 ? _181 : as_type<float>(_1469);
    float _1485 = rsqrt(_1473);
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1489 = _1205 + _1487;
    float _1491 = fma(_1379, _1479, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1493 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1495 = _1205 + _1493;
    bool _1497 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1499 = isnan(_1205);
    bool _1501 = _1497 || _1499;
    bool _1503 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1505 = _1501 || _1503;
    float _1507 = float(_1505);
    float _1509 = fma(_1429, _1489, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1511 = fma(_1403, _1443, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1513 = fma(_1431, _1495, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1515 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1517 = _1205 + _1515;
    bool _1519 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1521 = isnan(_1205);
    bool _1523 = _1519 || _1521;
    bool _1525 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1527 = _1523 || _1525;
    float _1529 = float(_1527);
    float _1531 = -_1507;
    float _1533 = _1531 + 1.0;
    float _1535 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1537 = fma(_1353, _1517, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    bool _1539 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1541 = isnan(_1205);
    bool _1543 = _1539 || _1541;
    bool _1545 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1547 = _1543 || _1545;
    float _1549 = float(_1547);
    float _1551 = _1529 * _1533;
    float _1553 = -_1529;
    float _1555 = _1553 + 1.0;
    float _1557 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1535);
    float _1559 = _1485 * _605;
    float _1561 = -_1549;
    float _1563 = _1561 + 1.0;
    float _1565 = _1549 * _1555;
    float _1567 = _1485 * _603;
    float _1569 = _1485 * _601;
    float _1571 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1573 = _1559 * _1571;
    float _1575 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1577 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1579 = _1567 * _1577;
    float _1581 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1583 = _1569 * _1581;
    float _1585 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1587 = -_1573;
    float _1589 = fma(_1567, _1585, _1587);
    bool _1591 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1593 = isnan(_1205);
    bool _1595 = _1591 || _1593;
    bool _1597 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1599 = _1595 || _1597;
    float _1601 = float(_1599);
    float _1603 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1291);
    float _1605 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1607 = -_1583;
    float _1609 = fma(_1559, _1605, _1607);
    float _1611 = _1589 * _1589;
    float _1613 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1615 = -_1579;
    float _1617 = fma(_1569, _1613, _1615);
    float _1619 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1621 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1623 = isnan(_1205);
    bool _1625 = _1621 || _1623;
    bool _1627 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1629 = _1625 || _1627;
    float _1631 = float(_1629);
    float _1633 = fma(_1609, _1609, _1611);
    float _1635 = _1601 * _1563;
    bool _1637 = _1203 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1639 = isnan(_1203);
    bool _1641 = _1637 || _1639;
    bool _1643 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1645 = _1641 || _1643;
    float _1647 = float(_1645);
    float _1649 = -_1601;
    float _1651 = _1649 + 1.0;
    float _1653 = fma(_1617, _1617, _1633);
    float _1655 = _1575 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1657 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1659 = isnan(_1205);
    bool _1661 = _1657 || _1659;
    bool _1663 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1665 = _1661 || _1663;
    float _1667 = float(_1665);
    float _1669 = -_1631;
    float _1671 = _1669 + 1.0;
    float _1673 = rsqrt(_1653);
    bool _1675 = _1203 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1677 = isnan(_1203);
    bool _1679 = _1675 || _1677;
    bool _1681 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1683 = _1679 || _1681;
    float _1685 = float(_1683);
    float _1687 = _1631 * _1651;
    bool _1689 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1691 = isnan(_1205);
    bool _1693 = _1689 || _1691;
    bool _1695 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1697 = _1693 || _1695;
    float _1699 = float(_1697);
    float _1701 = _1667 * _1671;
    bool _1703 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1705 = isnan(_1205);
    bool _1707 = _1703 || _1705;
    bool _1709 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1711 = _1707 || _1709;
    float _1713 = float(_1711);
    float _1715 = -_1667;
    float _1717 = _1715 + 1.0;
    float _1719 = -_1685;
    float _1721 = _1719 + 1.0;
    float _1723 = _1619 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1725 = -_105;
    float _1727 = fma(_1725, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1321);
    float _1729 = _1439 + 0.5;
    float _1731 = -_1713;
    float _1733 = _1731 + 1.0;
    float _1735 = _1713 * _1717;
    float _1737 = _1647 * _1721;
    float _1739 = fma(_1723, _1729, _1727);
    float _1741 = _1373 + (-0.5);
    float _1743 = _1699 * _1733;
    float _1745 = _1589 * _1673;
    float _1747 = _1617 * _1673;
    float _1749 = _1471 * _1737;
    float _1751 = -_1655;
    float _1753 = -_1603;
    float _1755 = fma(_1751, _1741, _1753);
    float _1757 = _1475 * _1737;
    float _1759 = _1449 * _1743;
    float _1761 = _1459 * _1737;
    float _1763 = _1609 * _1673;
    float _1765 = _1309 * _1559;
    float _1767 = _1567 * _1745;
    float _1769 = _1309 * _1567;
    float _1771 = _1569 * _1747;
    float _1773 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1775 = -_1699;
    float _1777 = _1775 + 1.0;
    float _1779 = fma(_1267, _1747, _1765);
    float _1781 = -_1767;
    float _1783 = fma(_1569, _1763, _1781);
    float _1785 = fma(_1267, _1763, _1769);
    float _1787 = -_1771;
    float _1789 = fma(_1559, _1745, _1787);
    float _1791 = fma(_1777, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1759);
    float _1793 = fma(_1773, _1783, _1779);
    float _1795 = _1365 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1797 = fma(_1773, _1789, _1785);
    float _1799 = _1349 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1801 = _1795 + _1793;
    float _1803 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1805 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1807 = _1799 + _1797;
    float _1809 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1811 = _1801 + _1809;
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1815 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1805);
    float _1817 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1819 = _1807 + _1817;
    float _1821 = _1811 * _1811;
    float _1823 = _1423 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1825 = fma(_1509, _1735, _1791);
    float _1827 = -_1813;
    float _1829 = fma(_1803, 2.0, _1827);
    float _1831 = fma(_1819, _1819, _1821);
    float _1833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1835 = fma(_1537, _1701, _1825);
    float _1837 = -_1647;
    float _1839 = _1837 + 1.0;
    float _1841 = _1309 * _1569;
    float _1843 = _1559 * _1763;
    float _1845 = fma(_1465, _1687, _1835);
    float _1847 = _1293 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1849 = sqrt(_1831);
    float _1851 = fma(_1267, _1745, _1841);
    float _1853 = -_1843;
    float _1855 = fma(_1567, _1747, _1853);
    float _1857 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1859 = fma(_1491, _1635, _1845);
    float _1861 = fma(_1839, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1761);
    float _1863 = fma(_1773, _1855, _1851);
    float _1865 = fma(_1823, -2.0, _1857);
    float _1867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1869 = fma(_1839, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1749);
    float _1871 = fma(_1839, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1757);
    float _1873 = fma(_1511, _1565, _1859);
    float _1875 = _1847 + _1863;
    float _1877 = _1833 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1879 = _1483 + 0.5;
    float _1881 = _1357 + (-0.5);
    bool _1883 = _1849 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1885 = -_105;
    float _1887 = fma(_1885, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1829);
    float _1889 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1865);
    float _1891 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1393);
    float _1893 = fma(_1685, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1861);
    float _1895 = fma(_1685, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1869);
    float _1897 = fma(_1685, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1871);
    float _1899 = _1867 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1901 = fma(_1513, _1551, _1873);
    float _1903 = fma(_1877, _1879, _1887);
    float _1905 = -_1891;
    float _1907 = _1905 + 1.0;
    float _1909 = -_1899;
    float _1911 = -_1889;
    float _1913 = fma(_1909, _1881, _1911);
    float _1915 = _1871;
    float _1917 = _1807;
    float _1919 = _1801;
    float _1921 = _1473;
    if (!_1883)
    {
        _1915 = _1875;
    }
    float _1923 = _1915;
    bool _1925 = !_1883;
    float _1927 = _1923;
    if (!_1925)
    {
        float _1929 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1931 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1933 = _1849 + _1931;
        float _1935 = _1875 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1937 = rsqrt(_1831);
        float _1939 = _1933 * _1929;
        float _1941 = _1939 * 0.15915493667125701904296875;
        float _1943 = _1941 * 6.283185482025146484375;
        float _1945 = cos(_1943);
        float _1947 = _1941 * 6.283185482025146484375;
        float _1949 = sin(_1947);
        float _1951 = _1945 + (-1.0);
        float _1953 = fma(_1949, _1935, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1955 = _1951 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1957 = _1937 * _1953;
        float _1959 = fma(_1875, _1945, _1955);
        float _1961 = fma(_1819, _1957, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1963 = fma(_1811, _1957, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1927 = _1959;
        _1917 = _1961;
        _1919 = _1963;
    }
    float _1965 = _1927;
    float _1967 = _1917;
    float _1969 = _1919;
    float _1971 = -_1847;
    float _1973 = _1971 + _1965;
    float _1975 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1409);
    float _1977 = -_1907;
    float _1979 = fma(_1439, _1977, _1739);
    float _1981 = -_1799;
    float _1983 = _1981 + _1967;
    float _1985 = _1973 * _1973;
    float _1987 = -_1975;
    float _1989 = _1987 + 1.0;
    float _1991 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1815);
    float _1993 = -_1795;
    float _1995 = _1993 + _1969;
    float _1997 = fma(_1983, _1983, _1985);
    float _1999 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1557);
    float _2001 = -_1991;
    float _2003 = _2001 + 1.0;
    float _2005 = fma(_1373, _1989, _1755);
    float _2007 = fma(_1995, _1995, _1997);
    float _2009 = -_1999;
    float _2011 = _2009 + 1.0;
    float _2013 = -_2003;
    float _2015 = fma(_1483, _2013, _1903);
    float _2017 = sqrt(_2007);
    float _2019 = fma(_1357, _2011, _1913);
    float _2021 = _1893 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2023 = _1895 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2025 = _1897 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2027 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2029 = _2021 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2031 = _2023 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2033 = _2025 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2035 = fma(_1507, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1901);
    out.m_46.x = _1979;
    out.m_46.y = _2005;
    out.m_46.z = _2015;
    out.m_46.w = _2019;
    out.m_48.x = _2029;
    out.m_48.y = _2031;
    out.m_48.z = _2033;
    out.m_48.w = _2027;
    bool _2037 = _2017 > 0.0;
    out.m_50.x = _2035;
    bool _2039 = !_2037;
    float _2041 = _2019;
    float _2043 = _2005;
    float _2045 = _1967;
    float _2047 = _1965;
    float _2049 = _1969;
    if (!_2039)
    {
        bool _2051 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2053 = _1979;
        if (_2051)
        {
            float _2055 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2053 = _2055;
        }
        float _2057 = _2053;
        float _2059 = _2057;
        if (_2051)
        {
            float _2061 = _2057 * _603;
            _2041 = _2061;
        }
        float _2063 = _2041;
        float _2065 = _2063;
        if (_2051)
        {
            float _2067 = _2057 * _601;
            _2043 = _2067;
        }
        float _2069 = _2043;
        float _2071 = _2069;
        if (_2051)
        {
            float _2073 = _2057 * _605;
            _2059 = _2073;
        }
        float _2075 = _2059;
        float _2077 = _2075;
        float _2079 = _2075;
        if (!_2051)
        {
            float _2081 = _105 + 1.0;
            float _2083 = _2081;
            if (!_147)
            {
                float _2085 = _2081 * _2081;
                float _2087 = _2085 * 0.5;
                _2077 = _2087;
            }
            float _2089 = _2077;
            float _2091 = _2089;
            if (!_147)
            {
                float _2093 = _2089 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2091 = _2093;
            }
            float _2095 = _2091;
            bool _2097 = !_147;
            float _2099 = _2095;
            if (!_2097)
            {
                float _2101 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2103 = log2(_2101);
                float _2105 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2107 = _2105 + 1.0;
                float _2109 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2111 = _2103 * _2081;
                float _2113 = 1.0 / _2107;
                float _2115 = _2109 * 0.693147182464599609375;
                float _2117 = exp2(_2111);
                float _2119 = 1.0 / _2115;
                float _2121 = _2117 + (-1.0);
                float _2123 = -_2121;
                float _2125 = fma(_2123, _2119, _2081);
                float _2127 = _2125 * _2113;
                float _2129 = _2127 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2099 = _2129;
            }
            float _2131 = _2099;
            float _2133 = _2131 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2135 = _2131 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2137 = !_147;
            if (!_2137)
            {
                float _2139 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2141 = log2(_2139);
                float _2143 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2145 = _2143 + 1.0;
                float _2147 = 1.0 / _2145;
                float _2149 = _2141 * _2081;
                float _2151 = exp2(_2149);
                float _2153 = -_2151;
                float _2155 = _2153 + 1.0;
                float _2157 = _2155 * _2147;
                _2083 = _2157;
            }
            float _2159 = _2083;
            float _2161 = fma(_2159, _135, _2135);
            float _2163 = _2131 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2165 = fma(_2159, _133, _2133);
            float _2167 = -_353;
            float _2169 = _2167 + _2161;
            float _2171 = fma(_2159, _137, _2163);
            float _2173 = -_359;
            float _2175 = _2173 + _2165;
            float _2177 = _2169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2179 = _2169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2181 = -_365;
            float _2183 = _2181 + _2171;
            float _2185 = _2169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2187 = fma(_2175, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2177);
            float _2189 = fma(_2175, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2179);
            float _2191 = fma(_2175, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2185);
            float _2193 = fma(_2183, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2187);
            float _2195 = fma(_2183, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2189);
            float _2197 = fma(_2183, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2191);
            float _2199 = _2193 * _2193;
            float _2201 = fma(_2195, _2195, _2199);
            float _2203 = fma(_2197, _2197, _2201);
            _1921 = _2203;
            _611 = _2193;
            _613 = _2195;
            _615 = _2197;
            _2065 = _2195;
            _2071 = _2193;
            _2079 = _2197;
            _193 = _2185;
        }
        float _2205 = _1921;
        float _2207 = _611;
        float _2209 = _613;
        float _2211 = _615;
        float _2213 = _2065;
        float _2215 = _2071;
        float _2217 = _2079;
        float _2219 = _193;
        float _2221 = sqrt(_2205);
        float _2223 = rsqrt(_2007);
        bool _2225 = _2221 > 0.0;
        float _2227 = _1983 * _2223;
        float _2229 = _1973 * _2223;
        float _2231 = _1995 * _2223;
        bool _2233 = !_2225;
        _195 = _2219;
        _197 = _2227;
        _199 = _2221;
        if (!_2233)
        {
            float _2235 = rsqrt(_2205);
            float _2237 = _2235 * _2207;
            float _2239 = _2235 * _2209;
            float _2241 = _2229 * _2237;
            float _2243 = _2235 * _2211;
            float _2245 = fma(_2227, _2239, _2241);
            float _2247 = fma(_2231, _2243, _2245);
            float _2249 = _2247 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2251 = fma(_2213, _2249, _1967);
            float _2253 = fma(_2215, _2249, _1965);
            float _2255 = fma(_2217, _2249, _1969);
            _2045 = _2251;
            _2047 = _2253;
            _2049 = _2255;
            _195 = _2243;
            _199 = _2249;
        }
    }
    float _2257 = _2045;
    float _2259 = _2047;
    float _2261 = _2049;
    float _2263 = _195;
    float _2265 = _197;
    float _2267 = _199;
    bool _2269 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2271 = isnan(0.5);
    bool _2273 = _2269 || _2271;
    bool _2275 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2277 = _2273 || _2275;
    float _2279 = _2265;
    float _2281 = _2263;
    float _2283 = _2267;
    if (_2277)
    {
        _2279 = _2257;
    }
    float _2285 = _2279;
    float _2287 = _2285;
    if (_2277)
    {
        _2281 = _2259;
    }
    float _2289 = _2281;
    float _2291 = _2289;
    if (_2277)
    {
        _2283 = _2261;
    }
    float _2293 = _2283;
    float _2295 = _2293;
    if (!_2277)
    {
        float _2297 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2299 = _1847 + _2297;
        float _2301 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2303 = _1799 + _2301;
        float _2305 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2307 = -_1847;
        float _2309 = _2307 + _2259;
        float _2311 = _2299 * _2299;
        float _2313 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2315 = _1795 + _2313;
        float _2317 = -_1795;
        float _2319 = _2317 + _2261;
        float _2321 = fma(_2303, _2303, _2311);
        float _2323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2325 = fma(_2315, _2315, _2321);
        float _2327 = sqrt(_2325);
        float _2329 = _2305 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2331 = precise::min(_2327, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2333 = _2331 * _2323;
        float _2335 = -_1799;
        float _2337 = _2335 + _2257;
        float _2339 = _2329 * _2333;
        float _2341 = fma(_2337, _2339, _1799);
        float _2343 = fma(_2309, _2339, _1847);
        float _2345 = fma(_2319, _2339, _1795);
        _2291 = _2343;
        _2287 = _2341;
        _2295 = _2345;
    }
    float _2347 = _2291;
    float _2349 = _2287;
    float _2351 = _2295;
    float _2353 = _2347 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2355 = _2347 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2357 = _2347 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2359 = _2347 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2361 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2353);
    float _2363 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2355);
    float _2365 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2357);
    float _2367 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2359);
    float _2369 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2361);
    float _2371 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2363);
    float _2373 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2365);
    float _2375 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2367);
    float _2377 = _2369 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2379 = _2371 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2381 = _2373 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2383 = _2375 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2385 = _2377 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2387 = _2377 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2389 = _2377 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2391 = _2377 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2393 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2385);
    float _2395 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2387);
    float _2397 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2389);
    float _2399 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2391);
    float _2401 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2393);
    float _2403 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2395);
    float _2405 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2397);
    float _2407 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2399);
    float _2409 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2401);
    float _2411 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2403);
    float _2413 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2405);
    float _2415 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2407);
    float _2417 = _2409 + _2411;
    float _2419 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2421 = _2417 * 0.5;
    out.m_33.x = _2419;
    out.gl_Position.x = _2413;
    out.gl_Position.y = _2415;
    out.gl_Position.z = _2409;
    out.gl_Position.w = _2411;
    out.m_52.z = _2421;
    out.m_52.w = _2411;
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
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1195 = false;
    bool _1045 = false;
    bool _931 = false;
    bool _635 = false;
    bool _479 = false;
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
        float _2478 = as_type<float>(_87);
        out.gl_Position.z = _2478;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    if (_101)
    {
        float _109 = float(_71);
        _81 = _109;
    }
    float _111 = _81;
    bool _113 = _105 >= _111;
    bool _115 = !_101;
    bool _117 = _113 || _115;
    float _119 = _111;
    if (_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (_117)
    {
        out.m_33.x = 0.0;
    }
    if (_117)
    {
        float _123 = _121 * 5.0;
        _89 = as_type<int>(_123);
    }
    int _125 = _89;
    float _127 = as_type<float>(_125);
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2549 = as_type<float>(_125);
        out.gl_Position.z = _2549;
    }
    if (_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = as_type<float>(int(gl_VertexIndex));
    float _131 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _133 = in.m_35.x;
    float _135 = in.m_35.y;
    float _137 = in.m_35.z;
    bool _139 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _141 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _143 = _139 || _141;
    bool _145 = isnan(1.0);
    bool _147 = _143 || _145;
    float _149 = _131;
    if (!_147)
    {
        float _151 = _131 * _131;
        float _153 = _151 * 0.5;
        _127 = _153;
    }
    float _155 = _127;
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
    int _171 = as_type<int>(_129) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_129) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_147;
    float _189 = _169;
    float _191 = _129;
    float _193 = _135;
    float _195 = _135;
    float _197 = _137;
    float _199 = _133;
    if (!_187)
    {
        float _201 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = log2(_201);
        float _205 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _207 = _205 + 1.0;
        float _209 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = _131 * _203;
        float _213 = 1.0 / _207;
        float _215 = _209 * 0.693147182464599609375;
        float _217 = exp2(_211);
        float _219 = 1.0 / _215;
        float _221 = _217 + (-1.0);
        float _223 = -_221;
        float _225 = fma(_223, _219, _131);
        float _227 = _225 * _213;
        float _229 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _107 = _217;
        _189 = _229;
        _191 = _219;
    }
    float _231 = _107;
    float _233 = _189;
    float _235 = _191;
    bool _237 = !_147;
    float _239 = _231;
    float _241 = _235;
    if (!_237)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = 1.0 / _249;
        float _253 = _131 * _245;
        float _255 = exp2(_253);
        float _257 = -_255;
        float _259 = _257 + 1.0;
        float _261 = _259 * _251;
        _239 = _255;
        _241 = _249;
        _149 = _261;
    }
    float _263 = _239;
    float _265 = _241;
    float _267 = _149;
    float _269 = _265;
    float _271 = _263;
    if (!_147)
    {
        _269 = _105;
    }
    float _273 = _269;
    float _275 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _277 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _279 = _273;
    if (!_147)
    {
        float _281 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _271 = _281;
    }
    float _283 = _271;
    bool _285 = !_147;
    float _287 = _283;
    if (!_285)
    {
        float _289 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _291 = log2(_289);
        float _293 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _295 = _293 + 1.0;
        float _297 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = _105 * _291;
        float _301 = 1.0 / _295;
        float _303 = _297 * 0.693147182464599609375;
        float _305 = exp2(_299);
        float _307 = 1.0 / _303;
        float _309 = _305 + (-1.0);
        float _311 = -_309;
        float _313 = fma(_311, _307, _105);
        float _315 = _313 * _301;
        float _317 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _287 = _317;
    }
    float _319 = _287;
    bool _321 = !_147;
    if (!_321)
    {
        float _323 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _325 = log2(_323);
        float _327 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _329 = _327 + 1.0;
        float _331 = 1.0 / _329;
        float _333 = _105 * _325;
        float _335 = exp2(_333);
        float _337 = -_335;
        float _339 = _337 + 1.0;
        float _341 = _339 * _331;
        _279 = _341;
    }
    float _343 = _279;
    float _345 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _347 = fma(_267, _135, _277);
    float _349 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _351 = fma(_267, _133, _275);
    float _353 = fma(_343, _135, _345);
    float _355 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _357 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _359 = fma(_343, _133, _349);
    float _361 = -_353;
    float _363 = _347 + _361;
    float _365 = fma(_343, _137, _355);
    float _367 = fma(_267, _137, _357);
    float _369 = -_359;
    float _371 = _351 + _369;
    float _373 = _363 * _363;
    float _375 = in.m_40.w;
    float _377 = -_365;
    float _379 = _367 + _377;
    float _381 = _363 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _383 = fma(_371, _371, _373);
    float _385 = _363 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _387 = _363 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _389 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].x, _381);
    float _391 = fma(_379, _379, _383);
    float _393 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].x, _385);
    float _395 = in.m_30.x;
    float _397 = in.m_30.y;
    float _399 = in.m_30.z;
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
    float _421 = fma(_351, _375, _395);
    float _423 = fma(_347, _375, _397);
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
            float _445 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _447 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _449 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _451 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _445);
            float _453 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _447);
            float _455 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _449);
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _451);
            float _459 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _453);
            float _461 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _455);
            float _463 = _457 * _457;
            float _465 = fma(_459, _459, _463);
            float _467 = fma(_461, _461, _465);
            float _469 = rsqrt(_467);
            float _471 = _469 * 9.9999999747524270787835121154785e-07;
            float _473 = _459 * _471;
            float _475 = _457 * _471;
            float _477 = _461 * _471;
            _439 = _475;
            _435 = _473;
            _431 = _477;
            _479 = true;
        }
        else
        {
            float _481 = _135 * _135;
            float _483 = fma(_133, _133, _481);
            float _485 = fma(_137, _137, _483);
            float _487 = sqrt(_485);
            bool _489 = _487 >= 9.9999999747524270787835121154785e-07;
            bool _491 = isnan(_487);
            bool _493 = _489 || _491;
            bool _495 = isnan(9.9999999747524270787835121154785e-07);
            bool _497 = _493 || _495;
            if (!_497)
            {
                float _499 = _397 * _397;
                float _501 = fma(_395, _395, _499);
                float _503 = fma(_399, _399, _501);
                float _505 = sqrt(_503);
                bool _507 = _505 >= 9.9999999747524270787835121154785e-07;
                bool _509 = isnan(_505);
                bool _511 = _507 || _509;
                bool _513 = isnan(9.9999999747524270787835121154785e-07);
                bool _515 = _511 || _513;
                if (!_515)
                {
                    float _517 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _519 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _517);
                    float _521 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _519);
                    float _523 = rsqrt(_521);
                    float _525 = _523 * 9.9999999747524270787835121154785e-07;
                    float _527 = _525 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _529 = _525 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _531 = _525 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _439 = _529;
                    _435 = _527;
                    _431 = _531;
                    _479 = true;
                }
                else
                {
                    float _533 = _397 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _535 = _397 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _537 = _397 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _539 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].x, _533);
                    float _541 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].x, _535);
                    float _543 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].x, _537);
                    float _545 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[5].z, _539);
                    float _547 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[4].z, _541);
                    float _549 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[6].z, _543);
                    float _551 = _545 * _545;
                    float _553 = fma(_547, _547, _551);
                    float _555 = fma(_549, _549, _553);
                    float _557 = rsqrt(_555);
                    float _559 = _557 * 9.9999999747524270787835121154785e-07;
                    float _561 = _547 * _559;
                    float _563 = _545 * _559;
                    float _565 = _549 * _559;
                    _439 = _563;
                    _435 = _561;
                    _431 = _565;
                    _479 = true;
                }
            }
            else
            {
                float _567 = _135 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _569 = _135 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _571 = _135 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _573 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[5].x, _567);
                float _575 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[4].x, _569);
                float _577 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[6].x, _571);
                float _579 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[5].z, _573);
                float _581 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[4].z, _575);
                float _583 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[6].z, _577);
                float _585 = _579 * _579;
                float _587 = fma(_581, _581, _585);
                float _589 = fma(_583, _583, _587);
                float _591 = rsqrt(_589);
                float _593 = _591 * 9.9999999747524270787835121154785e-07;
                float _595 = _581 * _593;
                float _597 = _579 * _593;
                float _599 = _583 * _593;
                _439 = _597;
                _435 = _595;
                _431 = _599;
            }
        }
    }
    _479 = false;
    float _601 = _439;
    float _603 = _435;
    float _605 = _431;
    bool _607 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _609 = !_607;
    float _611 = _601;
    float _613 = _603;
    float _615 = _605;
    float _633;
    if (!_609)
    {
        float _617 = in.m_42.x;
        float _619 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _621 = _617 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _623 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _625 = _623 * _619;
        float _627 = floor(_625);
        float _629 = -_627;
        float _631 = _625 + _629;
        _633 = _631;
        _635 = true;
    }
    else
    {
        float _637 = float(_71);
        float _639 = 1.0 / _637;
        float _641 = _105 * _639;
        _633 = _641;
    }
    _635 = false;
    float _643 = _633;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _647 = _643 + _645;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _649;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _657;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _665 = 1.0 / _651;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _667;
    bool _671 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _673 = 1.0 / _655;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _677 = _643 + _675;
    float _679 = 1.0 / _659;
    float _681 = _677 * _665;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _685 = _643 + _683;
    bool _687 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _689 = isnan(_643);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    float _699 = 1.0 / _663;
    float _701 = _647 * _673;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _705 = _643 + _703;
    bool _707 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _709 = isnan(_643);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _715 = _711 || _713;
    float _717 = float(_715);
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _721 = _643 + _719;
    float _723 = 1.0 / _669;
    float _725 = _685 * _679;
    bool _727 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _729 = isnan(_643);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _735 = _731 || _733;
    float _737 = float(_735);
    float _739 = -_697;
    float _741 = _739 + 1.0;
    float _743 = -_737;
    float _745 = _743 + 1.0;
    float _747 = _705 * _699;
    float _749 = -_717;
    float _751 = _749 + 1.0;
    float _753 = _697 * _745;
    bool _755 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _757 = isnan(_643);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = _737 * _751;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _769;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _773;
    float _777 = _721 * _723;
    bool _779 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _781 = isnan(_643);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    float _791 = fma(_771, _681, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _793 = fma(_775, _681, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _795 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _797 = isnan(_643);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _803 = _799 || _801;
    float _805 = float(_803);
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _809 = _807 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _811 = _789 * _741;
    float _813 = -_789;
    float _815 = _813 + 1.0;
    float _817 = -_765;
    float _819 = _817 + 1.0;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _825 = _765 * _815;
    float _827 = _805 * _819;
    float _829 = fma(_809, _701, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _831;
    float _835 = -_805;
    float _837 = _835 + 1.0;
    float _839 = _793 * _827;
    float _841 = _791 * _827;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _843;
    float _847 = fma(_823, _701, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _849 = fma(_833, _725, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _851 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[143].x, _839);
    float _853 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[143].y, _841);
    float _855 = in.m_40.x;
    float _857 = in.m_40.y;
    float _859 = fma(_845, _725, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _869 = fma(_829, _825, _851);
    float _871 = fma(_847, _825, _853);
    float _873 = fma(_867, _747, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _875;
    float _879 = fma(_863, _747, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _881;
    float _885 = fma(_849, _811, _869);
    float _887 = fma(_859, _811, _871);
    float _889 = fma(_877, _777, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _891 = fma(_883, _777, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _893 = fma(_879, _753, _885);
    float _895 = fma(_873, _753, _887);
    float _897 = fma(_889, _767, _893);
    float _899 = fma(_891, _767, _895);
    float _901 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[148].x, _897);
    float _903 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[148].y, _899);
    float _905 = _901 * _855;
    float _907 = _903 * _857;
    bool _909 = !_671;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _929;
    if (!_909)
    {
        float _913 = in.m_42.x;
        float _915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _917 = _913 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _919 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[11].x, _105);
        float _921 = _919 * _915;
        float _923 = floor(_921);
        float _925 = -_923;
        float _927 = _921 + _925;
        _929 = _927;
        _931 = true;
    }
    else
    {
        float _933 = float(_71);
        float _935 = 1.0 / _933;
        float _937 = _105 * _935;
        _929 = _937;
    }
    _931 = false;
    float _939 = _929;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _943 = _939 + _941;
    bool _945 = _939 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _947 = isnan(_939);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _953 = _949 || _951;
    float _955 = float(_953);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _957;
    bool _961 = _939 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _963 = isnan(_939);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    float _973 = -_955;
    float _975 = _973 + 1.0;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _979 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _977;
    float _981 = 1.0 / _959;
    bool _983 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _985 = _971 * _975;
    float _987 = -_971;
    float _989 = _987 + 1.0;
    float _991 = _943 * _981;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _993;
    float _997 = fma(_979, _991, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _999;
    float _1003 = fma(_995, _991, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1005 = _997 * _985;
    float _1007 = fma(_1001, _991, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1009 = _1003 * _985;
    float _1011 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1005);
    float _1013 = _1007 * _985;
    float _1015 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1009);
    float _1017 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1011);
    float _1019 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1013);
    float _1021 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1015);
    float _1023 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1019);
    bool _1025 = !_983;
    float _1043;
    if (!_1025)
    {
        float _1027 = in.m_42.x;
        float _1029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1031 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1033 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _1035 = _1033 * _1029;
        float _1037 = floor(_1035);
        float _1039 = -_1037;
        float _1041 = _1035 + _1039;
        _1043 = _1041;
        _1045 = true;
    }
    else
    {
        float _1047 = float(_71);
        float _1049 = 1.0 / _1047;
        float _1051 = _105 * _1049;
        _1043 = _1051;
    }
    _1045 = false;
    float _1053 = _1043;
    float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1057 = _1053 + _1055;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1061 = _1059 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1063 = _1053 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1065 = isnan(_1053);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1071 = _1067 || _1069;
    float _1073 = float(_1071);
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1077 = _1075 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1079 = _1053 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1081 = isnan(_1053);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1087 = _1083 || _1085;
    float _1089 = float(_1087);
    float _1091 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1091;
    bool _1095 = _1053 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1097 = isnan(_1053);
    bool _1099 = _1095 || _1097;
    bool _1101 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1103 = _1099 || _1101;
    float _1105 = float(_1103);
    float _1107 = 1.0 / _1061;
    float _1109 = -_1073;
    float _1111 = _1109 + 1.0;
    bool _1113 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1115 = _1089 * _1111;
    float _1117 = -_1089;
    float _1119 = _1117 + 1.0;
    float _1121 = 1.0 / _1077;
    float _1123 = _1093 * _1107;
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1127 = _1125 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1129 = fma(_1123, _1057, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1131 = -_1105;
    float _1133 = _1131 + 1.0;
    float _1135 = _1129 * _1115;
    float _1137 = _1127 * _1121;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1141 = _1053 + _1139;
    float _1143 = _1073 * _1133;
    float _1145 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1135);
    float _1147 = _1017 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1149 = fma(_1137, _1141, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1151 = _1021 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1153 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1155 = fma(_1149, _1143, _1145);
    float _1157 = _1023 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1159 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1161 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1155);
    float _1163 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1165 = _1161 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_44.x = _1153;
    out.m_44.y = _1163;
    out.m_44.z = _1159;
    out.m_44.w = _1165;
    bool _1167 = !_1113;
    float _1191;
    float _1193;
    if (!_1167)
    {
        float _1169 = in.m_42.x;
        float _1171 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1173 = float(_71);
        float _1175 = 1.0 / _1173;
        float _1177 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1179 = _105 * _1175;
        float _1181 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[11].z, _105);
        float _1183 = _1181 * _1171;
        float _1185 = floor(_1183);
        float _1187 = -_1185;
        float _1189 = _1183 + _1187;
        _1191 = _1189;
        _1193 = _1179;
        _1195 = true;
    }
    else
    {
        float _1197 = float(_71);
        float _1199 = 1.0 / _1197;
        float _1201 = _105 * _1199;
        _1191 = _1201;
        _1193 = _1201;
    }
    _1195 = false;
    float _1203 = _1191;
    float _1205 = _1193;
    float _1207 = in.m_42.x;
    float _1209 = in.m_42.y;
    float _1211 = in.m_42.z;
    float _1213 = in.m_42.w;
    float _1215 = _423 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1217 = _423 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1219 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1221 = _1219 != 0;
    float _1223 = _423 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1227 = _1225 != 0;
    float _1229 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1231 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1229;
    int _1233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1235 = _1233 != 0;
    float _1237 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1215);
    int _1239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1241 = _1239 != 0;
    float _1243 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1217);
    float _1245 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1223);
    float _1247 = 1.0 / _1231;
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1251 = _1249 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _1253 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1255 = _1253 != 0;
    float _1257 = _905 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1259 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _1261 = _907 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1263 = _1213 > 0.5;
    float _1265 = 1.0 / _1251;
    float _1267 = _1257 * _1259;
    float _1269 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1273 = _1271 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1275 = _601 * _601;
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1279 = _1277 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1281 = 1.0 / _1273;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1285;
    float _1289 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1291 = fma(_1269, -2.0, _1283);
    float _1293 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1243);
    float _1295 = 1.0 / _1279;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1299 = _1297 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1301 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1305;
    float _1309 = _1261 * _1301;
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1313 = _1311 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1315 = 1.0 / _1299;
    float _1317 = _1287 * _1281;
    float _1319 = -_1303;
    float _1321 = fma(_1289, 2.0, _1319);
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1329 = _1327 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1331 = 1.0 / _1313;
    float _1333 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1335 = _1203 + _1333;
    float _1337 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1339 = _1337 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1341 = _1329 * _1295;
    float _1343 = _1335 * _1247;
    float _1345 = -_185;
    int _1347 = _1263 ? as_type<int>(_1345) : as_type<int>(_185);
    float _1349 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1237);
    bool _1351 = _1209 > 0.5;
    float _1353 = _1325 * _1315;
    bool _1355 = !_1241;
    float _1357 = _1355 ? _185 : as_type<float>(_1347);
    float _1359 = 1.0 / _1339;
    float _1361 = -_185;
    int _1363 = _1351 ? as_type<int>(_1361) : as_type<int>(_185);
    float _1365 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1245);
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    bool _1371 = !_1227;
    float _1373 = _1371 ? _185 : as_type<float>(_1363);
    float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1377 = _1375 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1379 = _1307 * _1331;
    float _1381 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1383 = _1237;
    float _1385 = _1211;
    if (!_1255)
    {
        _1383 = _1209;
    }
    float _1387 = _1383;
    float _1389 = 1.0 / _1377;
    bool _1391 = _1207 > 0.5;
    float _1393 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1381);
    float _1395 = _1387;
    if (_1255)
    {
        _1395 = _1207;
    }
    float _1397 = _1395;
    float _1399 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1401 = _1211 > 0.5;
    float _1403 = _1369 * _1359;
    float _1405 = -_181;
    int _1407 = _1391 ? as_type<int>(_1405) : as_type<int>(_181);
    float _1409 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1399);
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1411;
    if (!_1255)
    {
        _911 = _1211;
    }
    float _1415 = _911;
    float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1419 = _1417 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1421 = _1415;
    if (_1255)
    {
        _1421 = _1209;
    }
    float _1423 = _1421;
    float _1425 = fma(_603, _603, _1275);
    if (_1255)
    {
        _1385 = _1209;
    }
    float _1427 = _1385;
    float _1429 = _1419 * _1265;
    float _1431 = _1413 * _1389;
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1435 = _1205 + _1433;
    bool _1437 = !_1221;
    float _1439 = _1437 ? _181 : as_type<float>(_1407);
    float _1441 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1443 = _1205 + _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1447 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1445;
    float _1449 = fma(_1317, _1435, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1453 = _1205 + _1451;
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1457 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1455;
    float _1459 = fma(_1447, _1343, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1463 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1461;
    float _1465 = fma(_1341, _1453, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1467 = -_181;
    int _1469 = _1401 ? as_type<int>(_1467) : as_type<int>(_181);
    float _1471 = fma(_1457, _1343, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1473 = fma(_605, _605, _1425);
    float _1475 = fma(_1463, _1343, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1479 = _1205 + _1477;
    bool _1481 = !_1235;
    float _1483 = _1481 ? _181 : as_type<float>(_1469);
    float _1485 = rsqrt(_1473);
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1489 = _1205 + _1487;
    float _1491 = fma(_1379, _1479, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1493 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1495 = _1205 + _1493;
    bool _1497 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1499 = isnan(_1205);
    bool _1501 = _1497 || _1499;
    bool _1503 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1505 = _1501 || _1503;
    float _1507 = float(_1505);
    float _1509 = fma(_1429, _1489, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1511 = fma(_1403, _1443, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1513 = fma(_1431, _1495, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1515 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1517 = _1205 + _1515;
    bool _1519 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1521 = isnan(_1205);
    bool _1523 = _1519 || _1521;
    bool _1525 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1527 = _1523 || _1525;
    float _1529 = float(_1527);
    float _1531 = -_1507;
    float _1533 = _1531 + 1.0;
    float _1535 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1537 = fma(_1353, _1517, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    bool _1539 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1541 = isnan(_1205);
    bool _1543 = _1539 || _1541;
    bool _1545 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1547 = _1543 || _1545;
    float _1549 = float(_1547);
    float _1551 = _1529 * _1533;
    float _1553 = -_1529;
    float _1555 = _1553 + 1.0;
    float _1557 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1535);
    float _1559 = _1485 * _605;
    float _1561 = -_1549;
    float _1563 = _1561 + 1.0;
    float _1565 = _1549 * _1555;
    float _1567 = _1485 * _603;
    float _1569 = _1485 * _601;
    float _1571 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1573 = _1559 * _1571;
    float _1575 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1577 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1579 = _1567 * _1577;
    float _1581 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1583 = _1569 * _1581;
    float _1585 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1587 = -_1573;
    float _1589 = fma(_1567, _1585, _1587);
    bool _1591 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1593 = isnan(_1205);
    bool _1595 = _1591 || _1593;
    bool _1597 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1599 = _1595 || _1597;
    float _1601 = float(_1599);
    float _1603 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1291);
    float _1605 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1607 = -_1583;
    float _1609 = fma(_1559, _1605, _1607);
    float _1611 = _1589 * _1589;
    float _1613 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1615 = -_1579;
    float _1617 = fma(_1569, _1613, _1615);
    float _1619 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1621 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1623 = isnan(_1205);
    bool _1625 = _1621 || _1623;
    bool _1627 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1629 = _1625 || _1627;
    float _1631 = float(_1629);
    float _1633 = fma(_1609, _1609, _1611);
    float _1635 = _1601 * _1563;
    bool _1637 = _1203 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1639 = isnan(_1203);
    bool _1641 = _1637 || _1639;
    bool _1643 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1645 = _1641 || _1643;
    float _1647 = float(_1645);
    float _1649 = -_1601;
    float _1651 = _1649 + 1.0;
    float _1653 = fma(_1617, _1617, _1633);
    float _1655 = _1575 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1657 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1659 = isnan(_1205);
    bool _1661 = _1657 || _1659;
    bool _1663 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1665 = _1661 || _1663;
    float _1667 = float(_1665);
    float _1669 = -_1631;
    float _1671 = _1669 + 1.0;
    float _1673 = rsqrt(_1653);
    bool _1675 = _1203 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1677 = isnan(_1203);
    bool _1679 = _1675 || _1677;
    bool _1681 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1683 = _1679 || _1681;
    float _1685 = float(_1683);
    float _1687 = _1631 * _1651;
    bool _1689 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1691 = isnan(_1205);
    bool _1693 = _1689 || _1691;
    bool _1695 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1697 = _1693 || _1695;
    float _1699 = float(_1697);
    float _1701 = _1667 * _1671;
    bool _1703 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1705 = isnan(_1205);
    bool _1707 = _1703 || _1705;
    bool _1709 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1711 = _1707 || _1709;
    float _1713 = float(_1711);
    float _1715 = -_1667;
    float _1717 = _1715 + 1.0;
    float _1719 = -_1685;
    float _1721 = _1719 + 1.0;
    float _1723 = _1619 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1725 = -_105;
    float _1727 = fma(_1725, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1321);
    float _1729 = _1439 + 0.5;
    float _1731 = -_1713;
    float _1733 = _1731 + 1.0;
    float _1735 = _1713 * _1717;
    float _1737 = _1647 * _1721;
    float _1739 = fma(_1723, _1729, _1727);
    float _1741 = _1373 + (-0.5);
    float _1743 = _1699 * _1733;
    float _1745 = _1589 * _1673;
    float _1747 = _1617 * _1673;
    float _1749 = _1471 * _1737;
    float _1751 = -_1655;
    float _1753 = -_1603;
    float _1755 = fma(_1751, _1741, _1753);
    float _1757 = _1475 * _1737;
    float _1759 = _1449 * _1743;
    float _1761 = _1459 * _1737;
    float _1763 = _1609 * _1673;
    float _1765 = _1309 * _1559;
    float _1767 = _1567 * _1745;
    float _1769 = _1309 * _1567;
    float _1771 = _1569 * _1747;
    float _1773 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1775 = -_1699;
    float _1777 = _1775 + 1.0;
    float _1779 = fma(_1267, _1747, _1765);
    float _1781 = -_1767;
    float _1783 = fma(_1569, _1763, _1781);
    float _1785 = fma(_1267, _1763, _1769);
    float _1787 = -_1771;
    float _1789 = fma(_1559, _1745, _1787);
    float _1791 = fma(_1777, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1759);
    float _1793 = fma(_1773, _1783, _1779);
    float _1795 = _1365 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1797 = fma(_1773, _1789, _1785);
    float _1799 = _1349 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1801 = _1795 + _1793;
    float _1803 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1805 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1807 = _1799 + _1797;
    float _1809 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1811 = _1801 + _1809;
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1815 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1805);
    float _1817 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1819 = _1807 + _1817;
    float _1821 = _1811 * _1811;
    float _1823 = _1423 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1825 = fma(_1509, _1735, _1791);
    float _1827 = -_1813;
    float _1829 = fma(_1803, 2.0, _1827);
    float _1831 = fma(_1819, _1819, _1821);
    float _1833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1835 = fma(_1537, _1701, _1825);
    float _1837 = -_1647;
    float _1839 = _1837 + 1.0;
    float _1841 = _1309 * _1569;
    float _1843 = _1559 * _1763;
    float _1845 = fma(_1465, _1687, _1835);
    float _1847 = _1293 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1849 = sqrt(_1831);
    float _1851 = fma(_1267, _1745, _1841);
    float _1853 = -_1843;
    float _1855 = fma(_1567, _1747, _1853);
    float _1857 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1859 = fma(_1491, _1635, _1845);
    float _1861 = fma(_1839, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1761);
    float _1863 = fma(_1773, _1855, _1851);
    float _1865 = fma(_1823, -2.0, _1857);
    float _1867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1869 = fma(_1839, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1749);
    float _1871 = fma(_1839, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1757);
    float _1873 = fma(_1511, _1565, _1859);
    float _1875 = _1847 + _1863;
    float _1877 = _1833 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1879 = _1483 + 0.5;
    float _1881 = _1357 + (-0.5);
    bool _1883 = _1849 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1885 = -_105;
    float _1887 = fma(_1885, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1829);
    float _1889 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1865);
    float _1891 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1393);
    float _1893 = fma(_1685, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1861);
    float _1895 = fma(_1685, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1869);
    float _1897 = fma(_1685, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1871);
    float _1899 = _1867 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1901 = fma(_1513, _1551, _1873);
    float _1903 = fma(_1877, _1879, _1887);
    float _1905 = -_1891;
    float _1907 = _1905 + 1.0;
    float _1909 = -_1899;
    float _1911 = -_1889;
    float _1913 = fma(_1909, _1881, _1911);
    float _1915 = _1871;
    float _1917 = _1807;
    float _1919 = _1801;
    float _1921 = _1473;
    if (!_1883)
    {
        _1915 = _1875;
    }
    float _1923 = _1915;
    bool _1925 = !_1883;
    float _1927 = _1923;
    if (!_1925)
    {
        float _1929 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1931 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1933 = _1849 + _1931;
        float _1935 = _1875 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1937 = rsqrt(_1831);
        float _1939 = _1933 * _1929;
        float _1941 = _1939 * 0.15915493667125701904296875;
        float _1943 = _1941 * 6.283185482025146484375;
        float _1945 = cos(_1943);
        float _1947 = _1941 * 6.283185482025146484375;
        float _1949 = sin(_1947);
        float _1951 = _1945 + (-1.0);
        float _1953 = fma(_1949, _1935, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1955 = _1951 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1957 = _1937 * _1953;
        float _1959 = fma(_1875, _1945, _1955);
        float _1961 = fma(_1819, _1957, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1963 = fma(_1811, _1957, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1927 = _1959;
        _1917 = _1961;
        _1919 = _1963;
    }
    float _1965 = _1927;
    float _1967 = _1917;
    float _1969 = _1919;
    float _1971 = -_1847;
    float _1973 = _1971 + _1965;
    float _1975 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1409);
    float _1977 = -_1907;
    float _1979 = fma(_1439, _1977, _1739);
    float _1981 = -_1799;
    float _1983 = _1981 + _1967;
    float _1985 = _1973 * _1973;
    float _1987 = -_1975;
    float _1989 = _1987 + 1.0;
    float _1991 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1815);
    float _1993 = -_1795;
    float _1995 = _1993 + _1969;
    float _1997 = fma(_1983, _1983, _1985);
    float _1999 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1557);
    float _2001 = -_1991;
    float _2003 = _2001 + 1.0;
    float _2005 = fma(_1373, _1989, _1755);
    float _2007 = fma(_1995, _1995, _1997);
    float _2009 = -_1999;
    float _2011 = _2009 + 1.0;
    float _2013 = -_2003;
    float _2015 = fma(_1483, _2013, _1903);
    float _2017 = sqrt(_2007);
    float _2019 = fma(_1357, _2011, _1913);
    float _2021 = _1893 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2023 = _1895 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2025 = _1897 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2027 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2029 = _2021 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2031 = _2023 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2033 = _2025 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2035 = fma(_1507, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1901);
    out.m_46.x = _1979;
    out.m_46.y = _2005;
    out.m_46.z = _2015;
    out.m_46.w = _2019;
    out.m_48.x = _2029;
    out.m_48.y = _2031;
    out.m_48.z = _2033;
    out.m_48.w = _2027;
    bool _2037 = _2017 > 0.0;
    out.m_50.x = _2035;
    bool _2039 = !_2037;
    float _2041 = _2019;
    float _2043 = _2005;
    float _2045 = _1967;
    float _2047 = _1965;
    float _2049 = _1969;
    if (!_2039)
    {
        bool _2051 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2053 = _1979;
        if (_2051)
        {
            float _2055 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2053 = _2055;
        }
        float _2057 = _2053;
        float _2059 = _2057;
        if (_2051)
        {
            float _2061 = _2057 * _603;
            _2041 = _2061;
        }
        float _2063 = _2041;
        float _2065 = _2063;
        if (_2051)
        {
            float _2067 = _2057 * _601;
            _2043 = _2067;
        }
        float _2069 = _2043;
        float _2071 = _2069;
        if (_2051)
        {
            float _2073 = _2057 * _605;
            _2059 = _2073;
        }
        float _2075 = _2059;
        float _2077 = _2075;
        float _2079 = _2075;
        if (!_2051)
        {
            float _2081 = _105 + 1.0;
            float _2083 = _2081;
            if (!_147)
            {
                float _2085 = _2081 * _2081;
                float _2087 = _2085 * 0.5;
                _2077 = _2087;
            }
            float _2089 = _2077;
            float _2091 = _2089;
            if (!_147)
            {
                float _2093 = _2089 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2091 = _2093;
            }
            float _2095 = _2091;
            bool _2097 = !_147;
            float _2099 = _2095;
            if (!_2097)
            {
                float _2101 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2103 = log2(_2101);
                float _2105 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2107 = _2105 + 1.0;
                float _2109 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2111 = _2103 * _2081;
                float _2113 = 1.0 / _2107;
                float _2115 = _2109 * 0.693147182464599609375;
                float _2117 = exp2(_2111);
                float _2119 = 1.0 / _2115;
                float _2121 = _2117 + (-1.0);
                float _2123 = -_2121;
                float _2125 = fma(_2123, _2119, _2081);
                float _2127 = _2125 * _2113;
                float _2129 = _2127 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2099 = _2129;
            }
            float _2131 = _2099;
            float _2133 = _2131 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2135 = _2131 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2137 = !_147;
            if (!_2137)
            {
                float _2139 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2141 = log2(_2139);
                float _2143 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2145 = _2143 + 1.0;
                float _2147 = 1.0 / _2145;
                float _2149 = _2141 * _2081;
                float _2151 = exp2(_2149);
                float _2153 = -_2151;
                float _2155 = _2153 + 1.0;
                float _2157 = _2155 * _2147;
                _2083 = _2157;
            }
            float _2159 = _2083;
            float _2161 = fma(_2159, _135, _2135);
            float _2163 = _2131 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2165 = fma(_2159, _133, _2133);
            float _2167 = -_353;
            float _2169 = _2167 + _2161;
            float _2171 = fma(_2159, _137, _2163);
            float _2173 = -_359;
            float _2175 = _2173 + _2165;
            float _2177 = _2169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2179 = _2169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2181 = -_365;
            float _2183 = _2181 + _2171;
            float _2185 = _2169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2187 = fma(_2175, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2177);
            float _2189 = fma(_2175, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2179);
            float _2191 = fma(_2175, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2185);
            float _2193 = fma(_2183, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2187);
            float _2195 = fma(_2183, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2189);
            float _2197 = fma(_2183, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2191);
            float _2199 = _2193 * _2193;
            float _2201 = fma(_2195, _2195, _2199);
            float _2203 = fma(_2197, _2197, _2201);
            _1921 = _2203;
            _611 = _2193;
            _613 = _2195;
            _615 = _2197;
            _2065 = _2195;
            _2071 = _2193;
            _2079 = _2197;
            _193 = _2185;
        }
        float _2205 = _1921;
        float _2207 = _611;
        float _2209 = _613;
        float _2211 = _615;
        float _2213 = _2065;
        float _2215 = _2071;
        float _2217 = _2079;
        float _2219 = _193;
        float _2221 = sqrt(_2205);
        float _2223 = rsqrt(_2007);
        bool _2225 = _2221 > 0.0;
        float _2227 = _1983 * _2223;
        float _2229 = _1973 * _2223;
        float _2231 = _1995 * _2223;
        bool _2233 = !_2225;
        _195 = _2219;
        _197 = _2227;
        _199 = _2221;
        if (!_2233)
        {
            float _2235 = rsqrt(_2205);
            float _2237 = _2235 * _2207;
            float _2239 = _2235 * _2209;
            float _2241 = _2229 * _2237;
            float _2243 = _2235 * _2211;
            float _2245 = fma(_2227, _2239, _2241);
            float _2247 = fma(_2231, _2243, _2245);
            float _2249 = _2247 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2251 = fma(_2213, _2249, _1967);
            float _2253 = fma(_2215, _2249, _1965);
            float _2255 = fma(_2217, _2249, _1969);
            _2045 = _2251;
            _2047 = _2253;
            _2049 = _2255;
            _195 = _2243;
            _199 = _2249;
        }
    }
    float _2257 = _2045;
    float _2259 = _2047;
    float _2261 = _2049;
    float _2263 = _195;
    float _2265 = _197;
    float _2267 = _199;
    bool _2269 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2271 = isnan(0.5);
    bool _2273 = _2269 || _2271;
    bool _2275 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2277 = _2273 || _2275;
    float _2279 = _2265;
    float _2281 = _2263;
    float _2283 = _2267;
    if (_2277)
    {
        _2279 = _2257;
    }
    float _2285 = _2279;
    float _2287 = _2285;
    if (_2277)
    {
        _2281 = _2259;
    }
    float _2289 = _2281;
    float _2291 = _2289;
    if (_2277)
    {
        _2283 = _2261;
    }
    float _2293 = _2283;
    float _2295 = _2293;
    if (!_2277)
    {
        float _2297 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2299 = _1847 + _2297;
        float _2301 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2303 = _1799 + _2301;
        float _2305 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2307 = -_1847;
        float _2309 = _2307 + _2259;
        float _2311 = _2299 * _2299;
        float _2313 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2315 = _1795 + _2313;
        float _2317 = -_1795;
        float _2319 = _2317 + _2261;
        float _2321 = fma(_2303, _2303, _2311);
        float _2323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2325 = fma(_2315, _2315, _2321);
        float _2327 = sqrt(_2325);
        float _2329 = _2305 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2331 = precise::min(_2327, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2333 = _2331 * _2323;
        float _2335 = -_1799;
        float _2337 = _2335 + _2257;
        float _2339 = _2329 * _2333;
        float _2341 = fma(_2337, _2339, _1799);
        float _2343 = fma(_2309, _2339, _1847);
        float _2345 = fma(_2319, _2339, _1795);
        _2291 = _2343;
        _2287 = _2341;
        _2295 = _2345;
    }
    float _2347 = _2291;
    float _2349 = _2287;
    float _2351 = _2295;
    float _2353 = _2347 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2355 = _2347 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2357 = _2347 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2359 = _2347 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2361 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2353);
    float _2363 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2355);
    float _2365 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2357);
    float _2367 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2359);
    float _2369 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2361);
    float _2371 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2363);
    float _2373 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2365);
    float _2375 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2367);
    float _2377 = _2369 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2379 = _2371 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2381 = _2373 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2383 = _2375 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2385 = _2377 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2387 = _2377 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2389 = _2377 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2391 = _2377 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2393 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2385);
    float _2395 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2387);
    float _2397 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2389);
    float _2399 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2391);
    float _2401 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2393);
    float _2403 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2395);
    float _2405 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2397);
    float _2407 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2399);
    float _2409 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2401);
    float _2411 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2403);
    float _2413 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2405);
    float _2415 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2407);
    float _2417 = _2409 + _2411;
    float _2419 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2421 = _2417 * 0.5;
    out.m_33.x = _2419;
    out.gl_Position.x = _2413;
    out.gl_Position.y = _2415;
    out.gl_Position.z = _2409;
    out.gl_Position.w = _2411;
    out.m_52.z = _2421;
    out.m_52.w = _2411;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

