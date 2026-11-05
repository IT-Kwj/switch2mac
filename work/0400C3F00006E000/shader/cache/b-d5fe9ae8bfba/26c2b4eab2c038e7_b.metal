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
    float4 m_46 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_48 [[user(locn4)]];
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
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _737 = false;
    bool _627 = false;
    bool _475 = false;
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
        float _1902 = as_type<float>(_87);
        out.gl_Position.z = _1902;
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
    if (_101)
    {
        float _111 = float(_71);
        _107 = _111;
    }
    float _113 = _107;
    bool _115 = _105 >= _113;
    bool _117 = !_101;
    bool _119 = _115 || _117;
    if (_119)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _81;
    if (_119)
    {
        out.m_33.x = 0.0;
    }
    if (_119)
    {
        float _123 = _121 * 5.0;
        _89 = as_type<int>(_123);
    }
    int _125 = _89;
    float _127 = as_type<float>(_125);
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1972 = as_type<float>(_125);
        out.gl_Position.z = _1972;
    }
    if (_119)
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
    float _189 = _129;
    float _191 = _169;
    if (!_187)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _131 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _131);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _211;
        _191 = _221;
        _109 = _209;
    }
    float _223 = _189;
    float _225 = _191;
    float _227 = _109;
    bool _229 = !_147;
    float _231 = _223;
    float _233 = _227;
    if (!_229)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _131 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _231 = _247;
        _233 = _241;
        _149 = _253;
    }
    float _255 = _231;
    float _257 = _233;
    float _259 = _149;
    float _261 = _257;
    float _263 = _255;
    if (!_147)
    {
        _261 = _105;
    }
    float _265 = _261;
    float _267 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _269 = _265;
    if (!_147)
    {
        float _271 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _263 = _271;
    }
    float _273 = _263;
    bool _275 = !_147;
    float _277 = _273;
    if (!_275)
    {
        float _279 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _281 = log2(_279);
        float _283 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _285 = _283 + 1.0;
        float _287 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _289 = _105 * _281;
        float _291 = exp2(_289);
        float _293 = _287 * 0.693147182464599609375;
        float _295 = 1.0 / _293;
        float _297 = 1.0 / _285;
        float _299 = _291 + (-1.0);
        float _301 = -_299;
        float _303 = fma(_301, _295, _105);
        float _305 = _303 * _297;
        float _307 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _307;
    }
    float _309 = _277;
    bool _311 = !_147;
    if (!_311)
    {
        float _313 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _315 = log2(_313);
        float _317 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _319 = _317 + 1.0;
        float _321 = 1.0 / _319;
        float _323 = _105 * _315;
        float _325 = exp2(_323);
        float _327 = -_325;
        float _329 = _327 + 1.0;
        float _331 = _329 * _321;
        _269 = _331;
    }
    float _333 = _269;
    float _335 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _337 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = fma(_259, _135, _267);
    float _341 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _343 = fma(_333, _135, _335);
    float _345 = fma(_259, _133, _337);
    float _347 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _349 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _351 = fma(_333, _133, _341);
    float _353 = -_343;
    float _355 = _339 + _353;
    float _357 = fma(_259, _137, _347);
    float _359 = fma(_333, _137, _349);
    float _361 = -_351;
    float _363 = _345 + _361;
    float _365 = _355 * _355;
    float _367 = in.m_40.w;
    float _369 = -_359;
    float _371 = _357 + _369;
    float _373 = _355 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _375 = fma(_363, _363, _365);
    float _377 = _355 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _379 = _355 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _381 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].x, _373);
    float _383 = fma(_371, _371, _375);
    float _385 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].x, _377);
    float _387 = in.m_30.x;
    float _389 = in.m_30.y;
    float _391 = in.m_30.z;
    float _393 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].x, _379);
    float _395 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].z, _381);
    float _397 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].z, _385);
    float _399 = sqrt(_383);
    float _401 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].z, _393);
    bool _403 = _399 >= 9.9999999747524270787835121154785e-07;
    bool _405 = isnan(_399);
    bool _407 = _403 || _405;
    bool _409 = isnan(9.9999999747524270787835121154785e-07);
    bool _411 = _407 || _409;
    float _413 = fma(_345, _367, _387);
    float _415 = fma(_339, _367, _389);
    float _417 = fma(_357, _367, _391);
    float _419 = _385;
    float _421 = _345;
    float _423 = _339;
    if (_411)
    {
        _419 = _395;
    }
    float _425 = _419;
    float _427 = _425;
    if (_411)
    {
        _421 = _397;
    }
    float _429 = _421;
    float _431 = _429;
    if (_411)
    {
        _423 = _401;
    }
    float _433 = _423;
    float _435 = _433;
    if (!_411)
    {
        bool _437 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _439 = !_437;
        if (!_439)
        {
            float _441 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _443 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _445 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _447 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _441);
            float _449 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _443);
            float _451 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _445);
            float _453 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _447);
            float _455 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _449);
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _451);
            float _459 = _453 * _453;
            float _461 = fma(_455, _455, _459);
            float _463 = fma(_457, _457, _461);
            float _465 = rsqrt(_463);
            float _467 = _465 * 9.9999999747524270787835121154785e-07;
            float _469 = _455 * _467;
            float _471 = _453 * _467;
            float _473 = _457 * _467;
            _431 = _471;
            _427 = _469;
            _435 = _473;
            _475 = true;
        }
        else
        {
            float _477 = _135 * _135;
            float _479 = fma(_133, _133, _477);
            float _481 = fma(_137, _137, _479);
            float _483 = sqrt(_481);
            bool _485 = _483 >= 9.9999999747524270787835121154785e-07;
            bool _487 = isnan(_483);
            bool _489 = _485 || _487;
            bool _491 = isnan(9.9999999747524270787835121154785e-07);
            bool _493 = _489 || _491;
            if (!_493)
            {
                float _495 = _389 * _389;
                float _497 = fma(_387, _387, _495);
                float _499 = fma(_391, _391, _497);
                float _501 = sqrt(_499);
                bool _503 = _501 >= 9.9999999747524270787835121154785e-07;
                bool _505 = isnan(_501);
                bool _507 = _503 || _505;
                bool _509 = isnan(9.9999999747524270787835121154785e-07);
                bool _511 = _507 || _509;
                if (!_511)
                {
                    float _513 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _515 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _513);
                    float _517 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _515);
                    float _519 = rsqrt(_517);
                    float _521 = _519 * 9.9999999747524270787835121154785e-07;
                    float _523 = _521 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _525 = _521 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _527 = _521 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _431 = _525;
                    _427 = _523;
                    _435 = _527;
                    _475 = true;
                }
                else
                {
                    float _529 = _389 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _531 = _389 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _533 = _389 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _535 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _529);
                    float _537 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _531);
                    float _539 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _533);
                    float _541 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].z, _535);
                    float _543 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].z, _537);
                    float _545 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].z, _539);
                    float _547 = _541 * _541;
                    float _549 = fma(_543, _543, _547);
                    float _551 = fma(_545, _545, _549);
                    float _553 = rsqrt(_551);
                    float _555 = _553 * 9.9999999747524270787835121154785e-07;
                    float _557 = _543 * _555;
                    float _559 = _541 * _555;
                    float _561 = _545 * _555;
                    _431 = _559;
                    _427 = _557;
                    _435 = _561;
                    _475 = true;
                }
            }
            else
            {
                float _563 = _135 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _565 = _135 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _567 = _135 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _569 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[5].x, _563);
                float _571 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[4].x, _565);
                float _573 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[6].x, _567);
                float _575 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[5].z, _569);
                float _577 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[4].z, _571);
                float _579 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[6].z, _573);
                float _581 = _575 * _575;
                float _583 = fma(_577, _577, _581);
                float _585 = fma(_579, _579, _583);
                float _587 = rsqrt(_585);
                float _589 = _587 * 9.9999999747524270787835121154785e-07;
                float _591 = _577 * _589;
                float _593 = _575 * _589;
                float _595 = _579 * _589;
                _431 = _593;
                _427 = _591;
                _435 = _595;
            }
        }
    }
    _475 = false;
    float _597 = _431;
    float _599 = _427;
    float _601 = _435;
    bool _603 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _605 = !_603;
    float _607 = _597;
    float _625;
    if (!_605)
    {
        float _609 = in.m_42.x;
        float _611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _613 = _609 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _615 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _617 = _615 * _611;
        float _619 = floor(_617);
        float _621 = -_619;
        float _623 = _617 + _621;
        _625 = _623;
        _627 = true;
    }
    else
    {
        float _629 = float(_71);
        float _631 = 1.0 / _629;
        float _633 = _105 * _631;
        _625 = _633;
    }
    _627 = false;
    float _635 = _625;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _639 = _635 + _637;
    float _641 = in.m_40.x;
    float _643 = in.m_40.y;
    bool _645 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _647 = isnan(_635);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _657;
    bool _661 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _663 = isnan(_635);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = -_655;
    float _675 = _673 + 1.0;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _677;
    float _681 = 1.0 / _659;
    bool _683 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _685 = _671 * _675;
    float _687 = -_671;
    float _689 = _687 + 1.0;
    float _691 = _639 * _681;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _693;
    float _697 = fma(_679, _691, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _699 = fma(_695, _691, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _701 = _697 * _685;
    float _703 = _699 * _685;
    float _705 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[143].x, _701);
    float _707 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[143].y, _703);
    float _709 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[144].x, _705);
    float _711 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[144].y, _707);
    float _713 = _709 * _641;
    float _715 = _711 * _643;
    bool _717 = !_683;
    float _735;
    if (!_717)
    {
        float _719 = in.m_42.x;
        float _721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _723 = _719 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _725 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _727 = _725 * _721;
        float _729 = floor(_727);
        float _731 = -_729;
        float _733 = _727 + _731;
        _735 = _733;
        _737 = true;
    }
    else
    {
        float _739 = float(_71);
        float _741 = 1.0 / _739;
        float _743 = _105 * _741;
        _735 = _743;
    }
    _737 = false;
    float _745 = _735;
    float _747 = in.m_42.x;
    float _749 = in.m_42.y;
    float _751 = in.m_42.z;
    float _753 = in.m_42.w;
    float _755 = _415 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _757 = _415 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _761 = _759 != 0;
    float _763 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].x, _755);
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _767 = _765 != 0;
    float _769 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].x, _757);
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _773 = _771 != 0;
    float _775 = _715 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _779 = _777 != 0;
    float _781 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _783 = _597 * _597;
    float _785 = _775 * _781;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _789 = fma(_599, _599, _783);
    float _791 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _793 = _749 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _795 = _747 > 0.5;
    float _797 = _747 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _799 = _749 > 0.5;
    float _801 = -_181;
    int _803 = _795 ? as_type<int>(_801) : as_type<int>(_181);
    float _805 = -_787;
    float _807 = fma(_797, 2.0, _805);
    bool _809 = _751 > 0.5;
    float _811 = fma(_601, _601, _789);
    bool _813 = _753 > 0.5;
    float _815 = -_105;
    float _817 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[76].x, _807);
    float _819 = -_181;
    int _821 = _809 ? as_type<int>(_819) : as_type<int>(_181);
    float _823 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].z, _763);
    float _825 = -_185;
    int _827 = _799 ? as_type<int>(_825) : as_type<int>(_185);
    float _829 = rsqrt(_811);
    float _831 = -_181;
    int _833 = _799 ? as_type<int>(_831) : as_type<int>(_181);
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _837 = !_761;
    float _839 = _837 ? _181 : as_type<float>(_803);
    int _841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _843 = _841 != 0;
    int _845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _847 = _845 != 0;
    float _849 = _415 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _851 = !_779;
    float _853 = _851 ? _181 : as_type<float>(_821);
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _857 = _855 != 0;
    float _859 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].x, _849);
    float _861 = _713 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _863 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _865 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].z, _859);
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _869 = _861 * _863;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _875 = fma(_793, -2.0, _867);
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _879 = _877 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _881 = 1.0 / _873;
    float _883 = _829 * _601;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _887 = _885 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _889 = _829 * _599;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _893 = !_843;
    float _895 = _893 ? _181 : as_type<float>(_833);
    float _897 = 1.0 / _879;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _901 = _891 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _903 = -_185;
    int _905 = _809 ? as_type<int>(_903) : as_type<int>(_185);
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _909 = _745 + _907;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _913 = _899 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _915 = 1.0 / _887;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _921 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _923 = _889 * _921;
    float _925 = _865 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _927 = _911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _929 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].z, _769);
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _931;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _935;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _941 = _909;
    float _943 = _751;
    if (!_857)
    {
        _939 = _749;
    }
    float _945 = _939;
    out.m_44.x = _927;
    out.m_44.y = _901;
    out.m_44.z = _913;
    float _947 = _933 * _897;
    float _949 = -_185;
    int _951 = _813 ? as_type<int>(_949) : as_type<int>(_185);
    float _953 = _919 * _915;
    float _955 = _937 * _881;
    bool _957 = !_767;
    float _959 = _957 ? _185 : as_type<float>(_827);
    bool _961 = !_773;
    float _963 = _961 ? _185 : as_type<float>(_951);
    float _965 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _969 = _745 + _967;
    bool _971 = !_847;
    float _973 = _971 ? _185 : as_type<float>(_905);
    float _975 = fma(_955, _909, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _979 = _745 + _977;
    float _981 = fma(_953, _969, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _987 = fma(_947, _979, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _991 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[78].w, _983);
    bool _993 = _745 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _995 = isnan(_745);
    bool _997 = _993 || _995;
    bool _999 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1001 = _997 || _999;
    float _1003 = float(_1001);
    float _1005 = _965 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1007 = _839 + 0.5;
    float _1009 = _945;
    if (!_857)
    {
        _941 = _945;
    }
    float _1011 = _941;
    float _1013 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[88].w, _989);
    float _1015 = _1011;
    if (_857)
    {
        _1009 = _749;
    }
    float _1017 = _1009;
    float _1019 = -_1003;
    float _1021 = _1019 + 1.0;
    bool _1023 = _745 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1025 = isnan(_745);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1031 = _1027 || _1029;
    float _1033 = float(_1031);
    float _1035 = fma(_1005, _1007, _817);
    bool _1037 = _745 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1039 = isnan(_745);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1045 = _1041 || _1043;
    float _1047 = float(_1045);
    float _1049 = _829 * _597;
    bool _1051 = _745 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1053 = isnan(_745);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1059 = _1055 || _1057;
    float _1061 = float(_1059);
    float _1063 = _1033 * _1021;
    float _1065 = -_1033;
    float _1067 = _1065 + 1.0;
    float _1069 = -_1047;
    float _1071 = _1069 + 1.0;
    float _1073 = _985 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1075 = _1017;
    if (_857)
    {
        _607 = _747;
    }
    float _1077 = _607;
    float _1079 = _1047 * _1067;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1083 = _1077;
    if (!_857)
    {
        _1083 = _751;
    }
    float _1085 = _1083;
    float _1087 = _1061 * _1071;
    float _1089 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _875);
    float _1091 = _959 + (-0.5);
    float _1093 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1095 = _883 * _1093;
    float _1097 = _975 * _1087;
    float _1099 = _1085 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1101 = -_1073;
    float _1103 = -_1089;
    float _1105 = fma(_1101, _1091, _1103);
    float _1107 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1109 = _1049 * _1107;
    float _1111 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1113 = -_1095;
    float _1115 = fma(_889, _1111, _1113);
    float _1117 = -_1061;
    float _1119 = _1117 + 1.0;
    float _1121 = -_1081;
    float _1123 = fma(_1099, 2.0, _1121);
    float _1125 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1127 = -_1109;
    float _1129 = fma(_883, _1125, _1127);
    float _1131 = _1115 * _1115;
    float _1133 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1135 = -_923;
    float _1137 = fma(_1049, _1133, _1135);
    float _1139 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1097);
    float _1141 = fma(_1129, _1129, _1131);
    float _1143 = _1091;
    if (_857)
    {
        _1015 = _747;
    }
    float _1145 = _1015;
    float _1147 = -_105;
    float _1149 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1123);
    float _1151 = fma(_1137, _1137, _1141);
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1155 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _991);
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1159 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1153);
    float _1161 = rsqrt(_1151);
    float _1163 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_857)
    {
        _1143 = _751;
    }
    float _1167 = _1143;
    float _1169 = fma(_981, _1079, _1139);
    float _1171 = _1167;
    if (_857)
    {
        _1171 = _1017;
    }
    float _1173 = _1171;
    float _1175 = -_1157;
    float _1177 = fma(_1163, 2.0, _1175);
    float _1179 = _791 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1181 = _895 + 0.5;
    float _1183 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1165);
    float _1185 = fma(_987, _1063, _1169);
    float _1187 = fma(_1179, _1181, _1149);
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1193 = _1115 * _1161;
    float _1195 = _1129 * _1161;
    float _1197 = _1137 * _1161;
    float _1199 = _785 * _1049;
    float _1201 = _889 * _1193;
    float _1203 = _785 * _889;
    if (_857)
    {
        _943 = _1017;
    }
    float _1205 = _943;
    float _1207 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1185);
    float _1209 = -_1201;
    float _1211 = fma(_1049, _1195, _1209);
    float _1213 = _1049 * _1197;
    float _1215 = _785 * _883;
    float _1217 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1189);
    float _1219 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1191);
    if (!_857)
    {
        _1075 = _747;
    }
    float _1221 = _1075;
    float _1223 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1225 = fma(_869, _1195, _1203);
    float _1227 = -_1213;
    float _1229 = fma(_883, _1193, _1227);
    float _1231 = _823 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1235 = fma(_869, _1197, _1215);
    float _1237 = fma(_1223, _1229, _1225);
    float _1239 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1243 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1245 = fma(_1223, _1211, _1235);
    float _1247 = _929 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1249 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1239);
    float _1251 = fma(_1243, -2.0, _1241);
    float _1253 = _1247 + _1245;
    float _1255 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1249);
    float _1257 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1259 = _925 + _1237;
    float _1261 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1263 = _1253 + _1261;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1267 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1269 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1271 = _1255 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1273 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1257);
    float _1275 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1277 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1279 = _1259 + _1277;
    float _1281 = _1263 * _1263;
    float _1283 = _1265 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = _1267 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1287 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1289 = fma(_1279, _1279, _1281);
    float _1291 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1273);
    float _1293 = -_105;
    float _1295 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1177);
    float _1297 = _883 * _1195;
    float _1299 = sqrt(_1289);
    float _1301 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1303 = fma(_869, _1193, _1199);
    float _1305 = -_1297;
    float _1307 = fma(_889, _1197, _1305);
    float _1309 = _1291 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1311 = _1207 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1313 = fma(_1301, -2.0, _835);
    float _1315 = fma(_1223, _1307, _1303);
    float _1317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1319 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1217);
    out.m_46.x = _1283;
    out.m_46.y = _1285;
    out.m_46.z = _1287;
    out.m_46.w = _1311;
    float _1321 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1219);
    float _1323 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1013);
    float _1325 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1159);
    float _1327 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1183);
    float _1329 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1251);
    float _1331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1333 = _1299 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1335 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1313);
    float _1337 = _1231 + _1315;
    float _1339 = _853 + 0.5;
    bool _1341 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1343 = isnan(0.5);
    bool _1345 = _1341 || _1343;
    bool _1347 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1349 = _1345 || _1347;
    float _1351 = 1.0 / _1271;
    float _1353 = _1317 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1355 = _963 + (-0.5);
    float _1357 = _973 + (-0.5);
    float _1359 = fma(_1275, _1339, _1295);
    float _1361 = -_1353;
    float _1363 = -_1329;
    float _1365 = fma(_1361, _1355, _1363);
    float _1367 = _1331 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1369 = _1309 + _1271;
    float _1371 = -_1367;
    float _1373 = -_1335;
    float _1375 = fma(_1371, _1357, _1373);
    float _1377 = _1357;
    float _1379 = _1259;
    float _1381 = _1253;
    float _1383 = _1331;
    float _1385 = _1335;
    float _1387 = _1315;
    if (!_1333)
    {
        _1377 = _1337;
    }
    float _1389 = _1377;
    float _1391 = _1369 * _1351;
    float _1393 = _1391 * 0.5;
    float _1395 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1397 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1395);
    bool _1399 = !_1333;
    float _1401 = _1389;
    if (!_1399)
    {
        float _1403 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1405 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1407 = _1299 + _1405;
        float _1409 = _1337 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1411 = rsqrt(_1289);
        float _1413 = _1407 * _1403;
        float _1415 = _1413 * 0.15915493667125701904296875;
        float _1417 = _1415 * 6.283185482025146484375;
        float _1419 = cos(_1417);
        float _1421 = _1415 * 6.283185482025146484375;
        float _1423 = sin(_1421);
        float _1425 = _1419 + (-1.0);
        float _1427 = fma(_1423, _1409, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1429 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1431 = _1411 * _1427;
        float _1433 = fma(_1337, _1419, _1429);
        float _1435 = fma(_1279, _1431, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1437 = fma(_1263, _1431, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1379 = _1435;
        _1381 = _1437;
        _1401 = _1433;
        _1383 = _1415;
        _1385 = _1423;
        _1387 = _1429;
    }
    float _1439 = _1379;
    float _1441 = _1381;
    float _1443 = _1401;
    float _1445 = _1383;
    float _1447 = _1385;
    float _1449 = _1387;
    float _1451 = _1447;
    float _1453 = _1449;
    float _1455 = _1445;
    float _1457 = _1443;
    if (_1349)
    {
        _1451 = _1439;
    }
    float _1459 = _1451;
    float _1461 = _1459;
    if (_1349)
    {
        _1453 = _1441;
    }
    float _1463 = _1453;
    float _1465 = _1463;
    if (!_1349)
    {
        float _1467 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1469 = _1231 + _1467;
        float _1471 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1473 = _925 + _1471;
        float _1475 = -_925;
        float _1477 = _1475 + _1439;
        float _1479 = -_1247;
        float _1481 = _1479 + _1441;
        float _1483 = _1469 * _1469;
        float _1485 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1487 = _1247 + _1485;
        float _1489 = fma(_1473, _1473, _1483);
        float _1491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1493 = fma(_1487, _1487, _1489);
        float _1495 = sqrt(_1493);
        float _1497 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _1499 = _1495 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1501 = isnan(_1495);
        bool _1503 = _1499 || _1501;
        bool _1505 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1507 = _1503 || _1505;
        float _1509 = precise::min(_1495, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1511 = _1509 * _1491;
        float _1513 = _1497 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1515 = -_1231;
        float _1517 = _1515 + _1443;
        float _1519 = _1513 * _1511;
        float _1521 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
        float _1523 = _1513;
        if (_1507)
        {
            float _1525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1521 = _1525;
        }
        float _1527 = _1521;
        if (_1507)
        {
            float _1529 = precise::max(_1495, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1455 = _1529;
        }
        float _1531 = _1455;
        float _1533 = fma(_1477, _1519, _925);
        float _1535 = fma(_1517, _1519, _1231);
        float _1537 = fma(_1481, _1519, _1247);
        float _1539 = _1531;
        float _1541 = _1533;
        float _1543 = _1535;
        if (_1507)
        {
            float _1545 = _1531 * _1527;
            _1539 = _1545;
        }
        float _1547 = _1539;
        float _1549 = _1547;
        if (_1507)
        {
            float _1551 = _1513 * _1547;
            _1549 = _1551;
        }
        float _1553 = _1549;
        if (!_1507)
        {
            _1523 = _1537;
        }
        float _1555 = _1523;
        _1465 = _1555;
        if (_1507)
        {
            float _1557 = fma(_1477, _1553, _925);
            _1541 = _1557;
        }
        float _1559 = _1541;
        _1461 = _1559;
        if (_1507)
        {
            float _1561 = fma(_1517, _1553, _1231);
            _1543 = _1561;
        }
        float _1563 = _1543;
        _1457 = _1563;
        if (_1507)
        {
            float _1565 = fma(_1481, _1553, _1247);
            _1465 = _1565;
        }
    }
    float _1567 = _1457;
    float _1569 = _1461;
    float _1571 = _1465;
    float _1573 = 1.0 / _1397;
    bool _1575 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1577 = isnan(0.5);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1583 = _1579 || _1581;
    float _1585 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1587 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1589 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1591 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1593 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1585);
    float _1595 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1587);
    float _1597 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1589);
    float _1599 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1591);
    float _1601 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1593);
    float _1603 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1595);
    float _1605 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1597);
    float _1607 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1599);
    float _1609 = _1587;
    float _1611 = _1593;
    if (_1583)
    {
        _1609 = 1.0;
    }
    float _1613 = _1609;
    float _1615 = _1601 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1617 = _1613;
    if (_1583)
    {
        _1611 = 1.0;
    }
    float _1619 = _1611;
    float _1621 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1623 = _1573 * _1621;
    float _1625 = _1619;
    if (!_1583)
    {
        float _1627 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1629 = _1627 * 0.15915493667125701904296875;
        float _1631 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1633 = _1629 * 6.283185482025146484375;
        float _1635 = cos(_1633);
        float _1637 = _1631 * 0.15915493667125701904296875;
        float _1639 = _1629 * 6.283185482025146484375;
        float _1641 = sin(_1639);
        float _1643 = 1.0 / _1635;
        float _1645 = _1637 * 6.283185482025146484375;
        float _1647 = cos(_1645);
        float _1649 = _1641 * _1643;
        float _1651 = _1637 * 6.283185482025146484375;
        float _1653 = sin(_1651);
        float _1655 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1657 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1655;
        float _1659 = _1647 * _1649;
        float _1661 = 1.0 / _1657;
        float _1663 = 1.0 / _1659;
        float _1665 = _1653 * _1663;
        float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1669 = fma(_1623, _1665, _1667);
        float _1671 = _1669 * _1661;
        float _1673 = precise::clamp(_1671, 0.0, 1.0);
        _1617 = _1673;
    }
    float _1675 = _1617;
    if (!_1583)
    {
        float _1677 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1679 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1681 = _1677 * 0.15915493667125701904296875;
        float _1683 = _1679 * 0.15915493667125701904296875;
        float _1685 = _1681 * 6.283185482025146484375;
        float _1687 = cos(_1685);
        float _1689 = _1681 * 6.283185482025146484375;
        float _1691 = sin(_1689);
        float _1693 = 1.0 / _1687;
        float _1695 = _1683 * 6.283185482025146484375;
        float _1697 = cos(_1695);
        float _1699 = _1691 * _1693;
        float _1701 = _1683 * 6.283185482025146484375;
        float _1703 = sin(_1701);
        float _1705 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1707 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1705;
        float _1709 = _1697 * _1699;
        float _1711 = 1.0 / _1709;
        float _1713 = 1.0 / _1707;
        float _1715 = _1703 * _1711;
        float _1717 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1719 = fma(_1623, _1715, _1717);
        float _1721 = _1719 * _1713;
        float _1723 = precise::clamp(_1721, 0.0, 1.0);
        float _1725 = -_1723;
        float _1727 = _1725 + 1.0;
        _1625 = _1727;
    }
    float _1729 = _1625;
    float _1731 = _1603 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1733 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1735 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1737 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1739 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1741 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1733);
    float _1743 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1735);
    float _1745 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1737);
    float _1747 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1749 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1739);
    bool _1751 = _1675 > 0.0;
    bool _1753 = isnan(_1675);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan(0.0);
    bool _1759 = _1755 || _1757;
    float _1761 = _1675 * _1729;
    float _1763 = -_1321;
    float _1765 = _1763 + 1.0;
    float _1767 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1741);
    float _1769 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1743);
    float _1771 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1745);
    float _1773 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1749);
    float _1775 = -_1323;
    float _1777 = _1775 + 1.0;
    float _1779 = -_1319;
    float _1781 = _1779 + 1.0;
    float _1783 = _1607 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1785 = -_1155;
    float _1787 = _1785 + 1.0;
    float _1789 = fma(_973, _1777, _1375);
    float _1791 = -_1781;
    float _1793 = fma(_839, _1791, _1035);
    float _1795 = -_1327;
    float _1797 = _1795 + 1.0;
    float _1799 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1767);
    float _1801 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1773);
    float _1803 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1771);
    bool _1805 = _1729 <= 0.0;
    bool _1807 = !_1759;
    bool _1809 = _1805 || _1807;
    float _1811 = fma(_959, _1787, _1105);
    float _1813 = fma(_963, _1797, _1365);
    float _1815 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1769);
    float _1817 = -_1325;
    float _1819 = _1817 + 1.0;
    float _1821 = _1761 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1823 = _1799 + _1801;
    float _1825 = _1803 + _1801;
    float _1827 = _1801 * 0.5;
    float _1829 = -_1765;
    float _1831 = fma(_895, _1829, _1187);
    float _1833 = -_1819;
    float _1835 = fma(_853, _1833, _1359);
    float _1837 = _1821 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1839 = _1823 * 0.5;
    float _1841 = _1825 * 0.5;
    float _1843 = fma(_1815, -0.5, _1827);
    out.m_48.x = _1793;
    out.m_48.y = _1811;
    out.m_48.z = _1835;
    out.m_48.w = _1813;
    out.m_50.x = _1831;
    out.m_50.y = _1789;
    out.m_33.x = _1837;
    out.gl_Position.x = _1799;
    out.gl_Position.y = _1815;
    out.gl_Position.z = _1803;
    out.gl_Position.w = _1801;
    out.m_52.x = _1839;
    out.m_52.y = _1843;
    out.m_52.z = _1841;
    out.m_52.w = _1801;
    if (!_1809)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1845 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1845;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _737 = false;
    bool _627 = false;
    bool _475 = false;
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
        float _1902 = as_type<float>(_87);
        out.gl_Position.z = _1902;
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
    if (_101)
    {
        float _111 = float(_71);
        _107 = _111;
    }
    float _113 = _107;
    bool _115 = _105 >= _113;
    bool _117 = !_101;
    bool _119 = _115 || _117;
    if (_119)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _81;
    if (_119)
    {
        out.m_33.x = 0.0;
    }
    if (_119)
    {
        float _123 = _121 * 5.0;
        _89 = as_type<int>(_123);
    }
    int _125 = _89;
    float _127 = as_type<float>(_125);
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1972 = as_type<float>(_125);
        out.gl_Position.z = _1972;
    }
    if (_119)
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
    float _189 = _129;
    float _191 = _169;
    if (!_187)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _131 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _131);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _211;
        _191 = _221;
        _109 = _209;
    }
    float _223 = _189;
    float _225 = _191;
    float _227 = _109;
    bool _229 = !_147;
    float _231 = _223;
    float _233 = _227;
    if (!_229)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _131 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _231 = _247;
        _233 = _241;
        _149 = _253;
    }
    float _255 = _231;
    float _257 = _233;
    float _259 = _149;
    float _261 = _257;
    float _263 = _255;
    if (!_147)
    {
        _261 = _105;
    }
    float _265 = _261;
    float _267 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _269 = _265;
    if (!_147)
    {
        float _271 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _263 = _271;
    }
    float _273 = _263;
    bool _275 = !_147;
    float _277 = _273;
    if (!_275)
    {
        float _279 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _281 = log2(_279);
        float _283 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _285 = _283 + 1.0;
        float _287 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _289 = _105 * _281;
        float _291 = exp2(_289);
        float _293 = _287 * 0.693147182464599609375;
        float _295 = 1.0 / _293;
        float _297 = 1.0 / _285;
        float _299 = _291 + (-1.0);
        float _301 = -_299;
        float _303 = fma(_301, _295, _105);
        float _305 = _303 * _297;
        float _307 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _307;
    }
    float _309 = _277;
    bool _311 = !_147;
    if (!_311)
    {
        float _313 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _315 = log2(_313);
        float _317 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _319 = _317 + 1.0;
        float _321 = 1.0 / _319;
        float _323 = _105 * _315;
        float _325 = exp2(_323);
        float _327 = -_325;
        float _329 = _327 + 1.0;
        float _331 = _329 * _321;
        _269 = _331;
    }
    float _333 = _269;
    float _335 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _337 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = fma(_259, _135, _267);
    float _341 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _343 = fma(_333, _135, _335);
    float _345 = fma(_259, _133, _337);
    float _347 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _349 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _351 = fma(_333, _133, _341);
    float _353 = -_343;
    float _355 = _339 + _353;
    float _357 = fma(_259, _137, _347);
    float _359 = fma(_333, _137, _349);
    float _361 = -_351;
    float _363 = _345 + _361;
    float _365 = _355 * _355;
    float _367 = in.m_40.w;
    float _369 = -_359;
    float _371 = _357 + _369;
    float _373 = _355 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _375 = fma(_363, _363, _365);
    float _377 = _355 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _379 = _355 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _381 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].x, _373);
    float _383 = fma(_371, _371, _375);
    float _385 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].x, _377);
    float _387 = in.m_30.x;
    float _389 = in.m_30.y;
    float _391 = in.m_30.z;
    float _393 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].x, _379);
    float _395 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].z, _381);
    float _397 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].z, _385);
    float _399 = sqrt(_383);
    float _401 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].z, _393);
    bool _403 = _399 >= 9.9999999747524270787835121154785e-07;
    bool _405 = isnan(_399);
    bool _407 = _403 || _405;
    bool _409 = isnan(9.9999999747524270787835121154785e-07);
    bool _411 = _407 || _409;
    float _413 = fma(_345, _367, _387);
    float _415 = fma(_339, _367, _389);
    float _417 = fma(_357, _367, _391);
    float _419 = _385;
    float _421 = _345;
    float _423 = _339;
    if (_411)
    {
        _419 = _395;
    }
    float _425 = _419;
    float _427 = _425;
    if (_411)
    {
        _421 = _397;
    }
    float _429 = _421;
    float _431 = _429;
    if (_411)
    {
        _423 = _401;
    }
    float _433 = _423;
    float _435 = _433;
    if (!_411)
    {
        bool _437 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _439 = !_437;
        if (!_439)
        {
            float _441 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _443 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _445 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _447 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _441);
            float _449 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _443);
            float _451 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _445);
            float _453 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _447);
            float _455 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _449);
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _451);
            float _459 = _453 * _453;
            float _461 = fma(_455, _455, _459);
            float _463 = fma(_457, _457, _461);
            float _465 = rsqrt(_463);
            float _467 = _465 * 9.9999999747524270787835121154785e-07;
            float _469 = _455 * _467;
            float _471 = _453 * _467;
            float _473 = _457 * _467;
            _431 = _471;
            _427 = _469;
            _435 = _473;
            _475 = true;
        }
        else
        {
            float _477 = _135 * _135;
            float _479 = fma(_133, _133, _477);
            float _481 = fma(_137, _137, _479);
            float _483 = sqrt(_481);
            bool _485 = _483 >= 9.9999999747524270787835121154785e-07;
            bool _487 = isnan(_483);
            bool _489 = _485 || _487;
            bool _491 = isnan(9.9999999747524270787835121154785e-07);
            bool _493 = _489 || _491;
            if (!_493)
            {
                float _495 = _389 * _389;
                float _497 = fma(_387, _387, _495);
                float _499 = fma(_391, _391, _497);
                float _501 = sqrt(_499);
                bool _503 = _501 >= 9.9999999747524270787835121154785e-07;
                bool _505 = isnan(_501);
                bool _507 = _503 || _505;
                bool _509 = isnan(9.9999999747524270787835121154785e-07);
                bool _511 = _507 || _509;
                if (!_511)
                {
                    float _513 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _515 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _513);
                    float _517 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _515);
                    float _519 = rsqrt(_517);
                    float _521 = _519 * 9.9999999747524270787835121154785e-07;
                    float _523 = _521 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _525 = _521 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _527 = _521 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _431 = _525;
                    _427 = _523;
                    _435 = _527;
                    _475 = true;
                }
                else
                {
                    float _529 = _389 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _531 = _389 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _533 = _389 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _535 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _529);
                    float _537 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _531);
                    float _539 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _533);
                    float _541 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].z, _535);
                    float _543 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].z, _537);
                    float _545 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].z, _539);
                    float _547 = _541 * _541;
                    float _549 = fma(_543, _543, _547);
                    float _551 = fma(_545, _545, _549);
                    float _553 = rsqrt(_551);
                    float _555 = _553 * 9.9999999747524270787835121154785e-07;
                    float _557 = _543 * _555;
                    float _559 = _541 * _555;
                    float _561 = _545 * _555;
                    _431 = _559;
                    _427 = _557;
                    _435 = _561;
                    _475 = true;
                }
            }
            else
            {
                float _563 = _135 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _565 = _135 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _567 = _135 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _569 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[5].x, _563);
                float _571 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[4].x, _565);
                float _573 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[6].x, _567);
                float _575 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[5].z, _569);
                float _577 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[4].z, _571);
                float _579 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[6].z, _573);
                float _581 = _575 * _575;
                float _583 = fma(_577, _577, _581);
                float _585 = fma(_579, _579, _583);
                float _587 = rsqrt(_585);
                float _589 = _587 * 9.9999999747524270787835121154785e-07;
                float _591 = _577 * _589;
                float _593 = _575 * _589;
                float _595 = _579 * _589;
                _431 = _593;
                _427 = _591;
                _435 = _595;
            }
        }
    }
    _475 = false;
    float _597 = _431;
    float _599 = _427;
    float _601 = _435;
    bool _603 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _605 = !_603;
    float _607 = _597;
    float _625;
    if (!_605)
    {
        float _609 = in.m_42.x;
        float _611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _613 = _609 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _615 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _617 = _615 * _611;
        float _619 = floor(_617);
        float _621 = -_619;
        float _623 = _617 + _621;
        _625 = _623;
        _627 = true;
    }
    else
    {
        float _629 = float(_71);
        float _631 = 1.0 / _629;
        float _633 = _105 * _631;
        _625 = _633;
    }
    _627 = false;
    float _635 = _625;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _639 = _635 + _637;
    float _641 = in.m_40.x;
    float _643 = in.m_40.y;
    bool _645 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _647 = isnan(_635);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _657;
    bool _661 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _663 = isnan(_635);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = -_655;
    float _675 = _673 + 1.0;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _677;
    float _681 = 1.0 / _659;
    bool _683 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _685 = _671 * _675;
    float _687 = -_671;
    float _689 = _687 + 1.0;
    float _691 = _639 * _681;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _693;
    float _697 = fma(_679, _691, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _699 = fma(_695, _691, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _701 = _697 * _685;
    float _703 = _699 * _685;
    float _705 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[143].x, _701);
    float _707 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[143].y, _703);
    float _709 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[144].x, _705);
    float _711 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[144].y, _707);
    float _713 = _709 * _641;
    float _715 = _711 * _643;
    bool _717 = !_683;
    float _735;
    if (!_717)
    {
        float _719 = in.m_42.x;
        float _721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _723 = _719 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _725 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _727 = _725 * _721;
        float _729 = floor(_727);
        float _731 = -_729;
        float _733 = _727 + _731;
        _735 = _733;
        _737 = true;
    }
    else
    {
        float _739 = float(_71);
        float _741 = 1.0 / _739;
        float _743 = _105 * _741;
        _735 = _743;
    }
    _737 = false;
    float _745 = _735;
    float _747 = in.m_42.x;
    float _749 = in.m_42.y;
    float _751 = in.m_42.z;
    float _753 = in.m_42.w;
    float _755 = _415 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _757 = _415 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _761 = _759 != 0;
    float _763 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].x, _755);
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _767 = _765 != 0;
    float _769 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].x, _757);
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _773 = _771 != 0;
    float _775 = _715 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _779 = _777 != 0;
    float _781 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _783 = _597 * _597;
    float _785 = _775 * _781;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _789 = fma(_599, _599, _783);
    float _791 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _793 = _749 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _795 = _747 > 0.5;
    float _797 = _747 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _799 = _749 > 0.5;
    float _801 = -_181;
    int _803 = _795 ? as_type<int>(_801) : as_type<int>(_181);
    float _805 = -_787;
    float _807 = fma(_797, 2.0, _805);
    bool _809 = _751 > 0.5;
    float _811 = fma(_601, _601, _789);
    bool _813 = _753 > 0.5;
    float _815 = -_105;
    float _817 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[76].x, _807);
    float _819 = -_181;
    int _821 = _809 ? as_type<int>(_819) : as_type<int>(_181);
    float _823 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].z, _763);
    float _825 = -_185;
    int _827 = _799 ? as_type<int>(_825) : as_type<int>(_185);
    float _829 = rsqrt(_811);
    float _831 = -_181;
    int _833 = _799 ? as_type<int>(_831) : as_type<int>(_181);
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _837 = !_761;
    float _839 = _837 ? _181 : as_type<float>(_803);
    int _841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _843 = _841 != 0;
    int _845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _847 = _845 != 0;
    float _849 = _415 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _851 = !_779;
    float _853 = _851 ? _181 : as_type<float>(_821);
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _857 = _855 != 0;
    float _859 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].x, _849);
    float _861 = _713 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _863 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _865 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].z, _859);
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _869 = _861 * _863;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _875 = fma(_793, -2.0, _867);
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _879 = _877 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _881 = 1.0 / _873;
    float _883 = _829 * _601;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _887 = _885 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _889 = _829 * _599;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _893 = !_843;
    float _895 = _893 ? _181 : as_type<float>(_833);
    float _897 = 1.0 / _879;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _901 = _891 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _903 = -_185;
    int _905 = _809 ? as_type<int>(_903) : as_type<int>(_185);
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _909 = _745 + _907;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _913 = _899 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _915 = 1.0 / _887;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _921 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _923 = _889 * _921;
    float _925 = _865 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _927 = _911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _929 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].z, _769);
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _931;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _935;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _941 = _909;
    float _943 = _751;
    if (!_857)
    {
        _939 = _749;
    }
    float _945 = _939;
    out.m_44.x = _927;
    out.m_44.y = _901;
    out.m_44.z = _913;
    float _947 = _933 * _897;
    float _949 = -_185;
    int _951 = _813 ? as_type<int>(_949) : as_type<int>(_185);
    float _953 = _919 * _915;
    float _955 = _937 * _881;
    bool _957 = !_767;
    float _959 = _957 ? _185 : as_type<float>(_827);
    bool _961 = !_773;
    float _963 = _961 ? _185 : as_type<float>(_951);
    float _965 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _969 = _745 + _967;
    bool _971 = !_847;
    float _973 = _971 ? _185 : as_type<float>(_905);
    float _975 = fma(_955, _909, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _979 = _745 + _977;
    float _981 = fma(_953, _969, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _987 = fma(_947, _979, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _991 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[78].w, _983);
    bool _993 = _745 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _995 = isnan(_745);
    bool _997 = _993 || _995;
    bool _999 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1001 = _997 || _999;
    float _1003 = float(_1001);
    float _1005 = _965 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1007 = _839 + 0.5;
    float _1009 = _945;
    if (!_857)
    {
        _941 = _945;
    }
    float _1011 = _941;
    float _1013 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[88].w, _989);
    float _1015 = _1011;
    if (_857)
    {
        _1009 = _749;
    }
    float _1017 = _1009;
    float _1019 = -_1003;
    float _1021 = _1019 + 1.0;
    bool _1023 = _745 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1025 = isnan(_745);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1031 = _1027 || _1029;
    float _1033 = float(_1031);
    float _1035 = fma(_1005, _1007, _817);
    bool _1037 = _745 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1039 = isnan(_745);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1045 = _1041 || _1043;
    float _1047 = float(_1045);
    float _1049 = _829 * _597;
    bool _1051 = _745 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1053 = isnan(_745);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1059 = _1055 || _1057;
    float _1061 = float(_1059);
    float _1063 = _1033 * _1021;
    float _1065 = -_1033;
    float _1067 = _1065 + 1.0;
    float _1069 = -_1047;
    float _1071 = _1069 + 1.0;
    float _1073 = _985 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1075 = _1017;
    if (_857)
    {
        _607 = _747;
    }
    float _1077 = _607;
    float _1079 = _1047 * _1067;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1083 = _1077;
    if (!_857)
    {
        _1083 = _751;
    }
    float _1085 = _1083;
    float _1087 = _1061 * _1071;
    float _1089 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _875);
    float _1091 = _959 + (-0.5);
    float _1093 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1095 = _883 * _1093;
    float _1097 = _975 * _1087;
    float _1099 = _1085 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1101 = -_1073;
    float _1103 = -_1089;
    float _1105 = fma(_1101, _1091, _1103);
    float _1107 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1109 = _1049 * _1107;
    float _1111 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1113 = -_1095;
    float _1115 = fma(_889, _1111, _1113);
    float _1117 = -_1061;
    float _1119 = _1117 + 1.0;
    float _1121 = -_1081;
    float _1123 = fma(_1099, 2.0, _1121);
    float _1125 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1127 = -_1109;
    float _1129 = fma(_883, _1125, _1127);
    float _1131 = _1115 * _1115;
    float _1133 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1135 = -_923;
    float _1137 = fma(_1049, _1133, _1135);
    float _1139 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1097);
    float _1141 = fma(_1129, _1129, _1131);
    float _1143 = _1091;
    if (_857)
    {
        _1015 = _747;
    }
    float _1145 = _1015;
    float _1147 = -_105;
    float _1149 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1123);
    float _1151 = fma(_1137, _1137, _1141);
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1155 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _991);
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1159 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1153);
    float _1161 = rsqrt(_1151);
    float _1163 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_857)
    {
        _1143 = _751;
    }
    float _1167 = _1143;
    float _1169 = fma(_981, _1079, _1139);
    float _1171 = _1167;
    if (_857)
    {
        _1171 = _1017;
    }
    float _1173 = _1171;
    float _1175 = -_1157;
    float _1177 = fma(_1163, 2.0, _1175);
    float _1179 = _791 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1181 = _895 + 0.5;
    float _1183 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1165);
    float _1185 = fma(_987, _1063, _1169);
    float _1187 = fma(_1179, _1181, _1149);
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1193 = _1115 * _1161;
    float _1195 = _1129 * _1161;
    float _1197 = _1137 * _1161;
    float _1199 = _785 * _1049;
    float _1201 = _889 * _1193;
    float _1203 = _785 * _889;
    if (_857)
    {
        _943 = _1017;
    }
    float _1205 = _943;
    float _1207 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1185);
    float _1209 = -_1201;
    float _1211 = fma(_1049, _1195, _1209);
    float _1213 = _1049 * _1197;
    float _1215 = _785 * _883;
    float _1217 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1189);
    float _1219 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1191);
    if (!_857)
    {
        _1075 = _747;
    }
    float _1221 = _1075;
    float _1223 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1225 = fma(_869, _1195, _1203);
    float _1227 = -_1213;
    float _1229 = fma(_883, _1193, _1227);
    float _1231 = _823 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1235 = fma(_869, _1197, _1215);
    float _1237 = fma(_1223, _1229, _1225);
    float _1239 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1243 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1245 = fma(_1223, _1211, _1235);
    float _1247 = _929 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1249 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1239);
    float _1251 = fma(_1243, -2.0, _1241);
    float _1253 = _1247 + _1245;
    float _1255 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1249);
    float _1257 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1259 = _925 + _1237;
    float _1261 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1263 = _1253 + _1261;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1267 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1269 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1271 = _1255 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1273 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1257);
    float _1275 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1277 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1279 = _1259 + _1277;
    float _1281 = _1263 * _1263;
    float _1283 = _1265 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = _1267 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1287 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1289 = fma(_1279, _1279, _1281);
    float _1291 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1273);
    float _1293 = -_105;
    float _1295 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1177);
    float _1297 = _883 * _1195;
    float _1299 = sqrt(_1289);
    float _1301 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1303 = fma(_869, _1193, _1199);
    float _1305 = -_1297;
    float _1307 = fma(_889, _1197, _1305);
    float _1309 = _1291 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1311 = _1207 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1313 = fma(_1301, -2.0, _835);
    float _1315 = fma(_1223, _1307, _1303);
    float _1317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1319 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1217);
    out.m_46.x = _1283;
    out.m_46.y = _1285;
    out.m_46.z = _1287;
    out.m_46.w = _1311;
    float _1321 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1219);
    float _1323 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1013);
    float _1325 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1159);
    float _1327 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1183);
    float _1329 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1251);
    float _1331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1333 = _1299 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1335 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1313);
    float _1337 = _1231 + _1315;
    float _1339 = _853 + 0.5;
    bool _1341 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1343 = isnan(0.5);
    bool _1345 = _1341 || _1343;
    bool _1347 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1349 = _1345 || _1347;
    float _1351 = 1.0 / _1271;
    float _1353 = _1317 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1355 = _963 + (-0.5);
    float _1357 = _973 + (-0.5);
    float _1359 = fma(_1275, _1339, _1295);
    float _1361 = -_1353;
    float _1363 = -_1329;
    float _1365 = fma(_1361, _1355, _1363);
    float _1367 = _1331 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1369 = _1309 + _1271;
    float _1371 = -_1367;
    float _1373 = -_1335;
    float _1375 = fma(_1371, _1357, _1373);
    float _1377 = _1357;
    float _1379 = _1259;
    float _1381 = _1253;
    float _1383 = _1331;
    float _1385 = _1335;
    float _1387 = _1315;
    if (!_1333)
    {
        _1377 = _1337;
    }
    float _1389 = _1377;
    float _1391 = _1369 * _1351;
    float _1393 = _1391 * 0.5;
    float _1395 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1397 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1395);
    bool _1399 = !_1333;
    float _1401 = _1389;
    if (!_1399)
    {
        float _1403 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1405 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1407 = _1299 + _1405;
        float _1409 = _1337 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1411 = rsqrt(_1289);
        float _1413 = _1407 * _1403;
        float _1415 = _1413 * 0.15915493667125701904296875;
        float _1417 = _1415 * 6.283185482025146484375;
        float _1419 = cos(_1417);
        float _1421 = _1415 * 6.283185482025146484375;
        float _1423 = sin(_1421);
        float _1425 = _1419 + (-1.0);
        float _1427 = fma(_1423, _1409, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1429 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1431 = _1411 * _1427;
        float _1433 = fma(_1337, _1419, _1429);
        float _1435 = fma(_1279, _1431, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1437 = fma(_1263, _1431, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1379 = _1435;
        _1381 = _1437;
        _1401 = _1433;
        _1383 = _1415;
        _1385 = _1423;
        _1387 = _1429;
    }
    float _1439 = _1379;
    float _1441 = _1381;
    float _1443 = _1401;
    float _1445 = _1383;
    float _1447 = _1385;
    float _1449 = _1387;
    float _1451 = _1447;
    float _1453 = _1449;
    float _1455 = _1445;
    float _1457 = _1443;
    if (_1349)
    {
        _1451 = _1439;
    }
    float _1459 = _1451;
    float _1461 = _1459;
    if (_1349)
    {
        _1453 = _1441;
    }
    float _1463 = _1453;
    float _1465 = _1463;
    if (!_1349)
    {
        float _1467 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1469 = _1231 + _1467;
        float _1471 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1473 = _925 + _1471;
        float _1475 = -_925;
        float _1477 = _1475 + _1439;
        float _1479 = -_1247;
        float _1481 = _1479 + _1441;
        float _1483 = _1469 * _1469;
        float _1485 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1487 = _1247 + _1485;
        float _1489 = fma(_1473, _1473, _1483);
        float _1491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1493 = fma(_1487, _1487, _1489);
        float _1495 = sqrt(_1493);
        float _1497 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _1499 = _1495 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1501 = isnan(_1495);
        bool _1503 = _1499 || _1501;
        bool _1505 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1507 = _1503 || _1505;
        float _1509 = precise::min(_1495, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1511 = _1509 * _1491;
        float _1513 = _1497 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1515 = -_1231;
        float _1517 = _1515 + _1443;
        float _1519 = _1513 * _1511;
        float _1521 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
        float _1523 = _1513;
        if (_1507)
        {
            float _1525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1521 = _1525;
        }
        float _1527 = _1521;
        if (_1507)
        {
            float _1529 = precise::max(_1495, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1455 = _1529;
        }
        float _1531 = _1455;
        float _1533 = fma(_1477, _1519, _925);
        float _1535 = fma(_1517, _1519, _1231);
        float _1537 = fma(_1481, _1519, _1247);
        float _1539 = _1531;
        float _1541 = _1533;
        float _1543 = _1535;
        if (_1507)
        {
            float _1545 = _1531 * _1527;
            _1539 = _1545;
        }
        float _1547 = _1539;
        float _1549 = _1547;
        if (_1507)
        {
            float _1551 = _1513 * _1547;
            _1549 = _1551;
        }
        float _1553 = _1549;
        if (!_1507)
        {
            _1523 = _1537;
        }
        float _1555 = _1523;
        _1465 = _1555;
        if (_1507)
        {
            float _1557 = fma(_1477, _1553, _925);
            _1541 = _1557;
        }
        float _1559 = _1541;
        _1461 = _1559;
        if (_1507)
        {
            float _1561 = fma(_1517, _1553, _1231);
            _1543 = _1561;
        }
        float _1563 = _1543;
        _1457 = _1563;
        if (_1507)
        {
            float _1565 = fma(_1481, _1553, _1247);
            _1465 = _1565;
        }
    }
    float _1567 = _1457;
    float _1569 = _1461;
    float _1571 = _1465;
    float _1573 = 1.0 / _1397;
    bool _1575 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1577 = isnan(0.5);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1583 = _1579 || _1581;
    float _1585 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1587 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1589 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1591 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1593 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1585);
    float _1595 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1587);
    float _1597 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1589);
    float _1599 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1591);
    float _1601 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1593);
    float _1603 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1595);
    float _1605 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1597);
    float _1607 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1599);
    float _1609 = _1587;
    float _1611 = _1593;
    if (_1583)
    {
        _1609 = 1.0;
    }
    float _1613 = _1609;
    float _1615 = _1601 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1617 = _1613;
    if (_1583)
    {
        _1611 = 1.0;
    }
    float _1619 = _1611;
    float _1621 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1623 = _1573 * _1621;
    float _1625 = _1619;
    if (!_1583)
    {
        float _1627 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1629 = _1627 * 0.15915493667125701904296875;
        float _1631 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1633 = _1629 * 6.283185482025146484375;
        float _1635 = cos(_1633);
        float _1637 = _1631 * 0.15915493667125701904296875;
        float _1639 = _1629 * 6.283185482025146484375;
        float _1641 = sin(_1639);
        float _1643 = 1.0 / _1635;
        float _1645 = _1637 * 6.283185482025146484375;
        float _1647 = cos(_1645);
        float _1649 = _1641 * _1643;
        float _1651 = _1637 * 6.283185482025146484375;
        float _1653 = sin(_1651);
        float _1655 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1657 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1655;
        float _1659 = _1647 * _1649;
        float _1661 = 1.0 / _1657;
        float _1663 = 1.0 / _1659;
        float _1665 = _1653 * _1663;
        float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1669 = fma(_1623, _1665, _1667);
        float _1671 = _1669 * _1661;
        float _1673 = precise::clamp(_1671, 0.0, 1.0);
        _1617 = _1673;
    }
    float _1675 = _1617;
    if (!_1583)
    {
        float _1677 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1679 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1681 = _1677 * 0.15915493667125701904296875;
        float _1683 = _1679 * 0.15915493667125701904296875;
        float _1685 = _1681 * 6.283185482025146484375;
        float _1687 = cos(_1685);
        float _1689 = _1681 * 6.283185482025146484375;
        float _1691 = sin(_1689);
        float _1693 = 1.0 / _1687;
        float _1695 = _1683 * 6.283185482025146484375;
        float _1697 = cos(_1695);
        float _1699 = _1691 * _1693;
        float _1701 = _1683 * 6.283185482025146484375;
        float _1703 = sin(_1701);
        float _1705 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1707 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1705;
        float _1709 = _1697 * _1699;
        float _1711 = 1.0 / _1709;
        float _1713 = 1.0 / _1707;
        float _1715 = _1703 * _1711;
        float _1717 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1719 = fma(_1623, _1715, _1717);
        float _1721 = _1719 * _1713;
        float _1723 = precise::clamp(_1721, 0.0, 1.0);
        float _1725 = -_1723;
        float _1727 = _1725 + 1.0;
        _1625 = _1727;
    }
    float _1729 = _1625;
    float _1731 = _1603 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1733 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1735 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1737 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1739 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1741 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1733);
    float _1743 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1735);
    float _1745 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1737);
    float _1747 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1749 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1739);
    bool _1751 = _1675 > 0.0;
    bool _1753 = isnan(_1675);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan(0.0);
    bool _1759 = _1755 || _1757;
    float _1761 = _1675 * _1729;
    float _1763 = -_1321;
    float _1765 = _1763 + 1.0;
    float _1767 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1741);
    float _1769 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1743);
    float _1771 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1745);
    float _1773 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1749);
    float _1775 = -_1323;
    float _1777 = _1775 + 1.0;
    float _1779 = -_1319;
    float _1781 = _1779 + 1.0;
    float _1783 = _1607 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1785 = -_1155;
    float _1787 = _1785 + 1.0;
    float _1789 = fma(_973, _1777, _1375);
    float _1791 = -_1781;
    float _1793 = fma(_839, _1791, _1035);
    float _1795 = -_1327;
    float _1797 = _1795 + 1.0;
    float _1799 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1767);
    float _1801 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1773);
    float _1803 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1771);
    bool _1805 = _1729 <= 0.0;
    bool _1807 = !_1759;
    bool _1809 = _1805 || _1807;
    float _1811 = fma(_959, _1787, _1105);
    float _1813 = fma(_963, _1797, _1365);
    float _1815 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1769);
    float _1817 = -_1325;
    float _1819 = _1817 + 1.0;
    float _1821 = _1761 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1823 = _1799 + _1801;
    float _1825 = _1803 + _1801;
    float _1827 = _1801 * 0.5;
    float _1829 = -_1765;
    float _1831 = fma(_895, _1829, _1187);
    float _1833 = -_1819;
    float _1835 = fma(_853, _1833, _1359);
    float _1837 = _1821 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1839 = _1823 * 0.5;
    float _1841 = _1825 * 0.5;
    float _1843 = fma(_1815, -0.5, _1827);
    out.m_48.x = _1793;
    out.m_48.y = _1811;
    out.m_48.z = _1835;
    out.m_48.w = _1813;
    out.m_50.x = _1831;
    out.m_50.y = _1789;
    out.m_33.x = _1837;
    out.gl_Position.x = _1799;
    out.gl_Position.y = _1815;
    out.gl_Position.z = _1803;
    out.gl_Position.w = _1801;
    out.m_52.x = _1839;
    out.m_52.y = _1843;
    out.m_52.z = _1841;
    out.m_52.w = _1801;
    if (!_1809)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1845 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1845;
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
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _737 = false;
    bool _627 = false;
    bool _475 = false;
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
        float _1902 = as_type<float>(_87);
        out.gl_Position.z = _1902;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    if (_101)
    {
        float _111 = float(_71);
        _107 = _111;
    }
    float _113 = _107;
    bool _115 = _105 >= _113;
    bool _117 = !_101;
    bool _119 = _115 || _117;
    if (_119)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _81;
    if (_119)
    {
        out.m_33.x = 0.0;
    }
    if (_119)
    {
        float _123 = _121 * 5.0;
        _89 = as_type<int>(_123);
    }
    int _125 = _89;
    float _127 = as_type<float>(_125);
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1972 = as_type<float>(_125);
        out.gl_Position.z = _1972;
    }
    if (_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _189 = _129;
    float _191 = _169;
    if (!_187)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _131 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _131);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _211;
        _191 = _221;
        _109 = _209;
    }
    float _223 = _189;
    float _225 = _191;
    float _227 = _109;
    bool _229 = !_147;
    float _231 = _223;
    float _233 = _227;
    if (!_229)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _131 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _231 = _247;
        _233 = _241;
        _149 = _253;
    }
    float _255 = _231;
    float _257 = _233;
    float _259 = _149;
    float _261 = _257;
    float _263 = _255;
    if (!_147)
    {
        _261 = _105;
    }
    float _265 = _261;
    float _267 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _269 = _265;
    if (!_147)
    {
        float _271 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _263 = _271;
    }
    float _273 = _263;
    bool _275 = !_147;
    float _277 = _273;
    if (!_275)
    {
        float _279 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _281 = log2(_279);
        float _283 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _285 = _283 + 1.0;
        float _287 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _289 = _105 * _281;
        float _291 = exp2(_289);
        float _293 = _287 * 0.693147182464599609375;
        float _295 = 1.0 / _293;
        float _297 = 1.0 / _285;
        float _299 = _291 + (-1.0);
        float _301 = -_299;
        float _303 = fma(_301, _295, _105);
        float _305 = _303 * _297;
        float _307 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _307;
    }
    float _309 = _277;
    bool _311 = !_147;
    if (!_311)
    {
        float _313 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _315 = log2(_313);
        float _317 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _319 = _317 + 1.0;
        float _321 = 1.0 / _319;
        float _323 = _105 * _315;
        float _325 = exp2(_323);
        float _327 = -_325;
        float _329 = _327 + 1.0;
        float _331 = _329 * _321;
        _269 = _331;
    }
    float _333 = _269;
    float _335 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _337 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = fma(_259, _135, _267);
    float _341 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _343 = fma(_333, _135, _335);
    float _345 = fma(_259, _133, _337);
    float _347 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _349 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _351 = fma(_333, _133, _341);
    float _353 = -_343;
    float _355 = _339 + _353;
    float _357 = fma(_259, _137, _347);
    float _359 = fma(_333, _137, _349);
    float _361 = -_351;
    float _363 = _345 + _361;
    float _365 = _355 * _355;
    float _367 = in.m_40.w;
    float _369 = -_359;
    float _371 = _357 + _369;
    float _373 = _355 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _375 = fma(_363, _363, _365);
    float _377 = _355 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _379 = _355 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _381 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].x, _373);
    float _383 = fma(_371, _371, _375);
    float _385 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].x, _377);
    float _387 = in.m_30.x;
    float _389 = in.m_30.y;
    float _391 = in.m_30.z;
    float _393 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].x, _379);
    float _395 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].z, _381);
    float _397 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].z, _385);
    float _399 = sqrt(_383);
    float _401 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].z, _393);
    bool _403 = _399 >= 9.9999999747524270787835121154785e-07;
    bool _405 = isnan(_399);
    bool _407 = _403 || _405;
    bool _409 = isnan(9.9999999747524270787835121154785e-07);
    bool _411 = _407 || _409;
    float _413 = fma(_345, _367, _387);
    float _415 = fma(_339, _367, _389);
    float _417 = fma(_357, _367, _391);
    float _419 = _385;
    float _421 = _345;
    float _423 = _339;
    if (_411)
    {
        _419 = _395;
    }
    float _425 = _419;
    float _427 = _425;
    if (_411)
    {
        _421 = _397;
    }
    float _429 = _421;
    float _431 = _429;
    if (_411)
    {
        _423 = _401;
    }
    float _433 = _423;
    float _435 = _433;
    if (!_411)
    {
        bool _437 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _439 = !_437;
        if (!_439)
        {
            float _441 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _443 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _445 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _447 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _441);
            float _449 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _443);
            float _451 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _445);
            float _453 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _447);
            float _455 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _449);
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _451);
            float _459 = _453 * _453;
            float _461 = fma(_455, _455, _459);
            float _463 = fma(_457, _457, _461);
            float _465 = rsqrt(_463);
            float _467 = _465 * 9.9999999747524270787835121154785e-07;
            float _469 = _455 * _467;
            float _471 = _453 * _467;
            float _473 = _457 * _467;
            _431 = _471;
            _427 = _469;
            _435 = _473;
            _475 = true;
        }
        else
        {
            float _477 = _135 * _135;
            float _479 = fma(_133, _133, _477);
            float _481 = fma(_137, _137, _479);
            float _483 = sqrt(_481);
            bool _485 = _483 >= 9.9999999747524270787835121154785e-07;
            bool _487 = isnan(_483);
            bool _489 = _485 || _487;
            bool _491 = isnan(9.9999999747524270787835121154785e-07);
            bool _493 = _489 || _491;
            if (!_493)
            {
                float _495 = _389 * _389;
                float _497 = fma(_387, _387, _495);
                float _499 = fma(_391, _391, _497);
                float _501 = sqrt(_499);
                bool _503 = _501 >= 9.9999999747524270787835121154785e-07;
                bool _505 = isnan(_501);
                bool _507 = _503 || _505;
                bool _509 = isnan(9.9999999747524270787835121154785e-07);
                bool _511 = _507 || _509;
                if (!_511)
                {
                    float _513 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _515 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _513);
                    float _517 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _515);
                    float _519 = rsqrt(_517);
                    float _521 = _519 * 9.9999999747524270787835121154785e-07;
                    float _523 = _521 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _525 = _521 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _527 = _521 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _431 = _525;
                    _427 = _523;
                    _435 = _527;
                    _475 = true;
                }
                else
                {
                    float _529 = _389 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _531 = _389 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _533 = _389 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _535 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _529);
                    float _537 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _531);
                    float _539 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _533);
                    float _541 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].z, _535);
                    float _543 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].z, _537);
                    float _545 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].z, _539);
                    float _547 = _541 * _541;
                    float _549 = fma(_543, _543, _547);
                    float _551 = fma(_545, _545, _549);
                    float _553 = rsqrt(_551);
                    float _555 = _553 * 9.9999999747524270787835121154785e-07;
                    float _557 = _543 * _555;
                    float _559 = _541 * _555;
                    float _561 = _545 * _555;
                    _431 = _559;
                    _427 = _557;
                    _435 = _561;
                    _475 = true;
                }
            }
            else
            {
                float _563 = _135 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _565 = _135 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _567 = _135 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _569 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[5].x, _563);
                float _571 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[4].x, _565);
                float _573 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[6].x, _567);
                float _575 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[5].z, _569);
                float _577 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[4].z, _571);
                float _579 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[6].z, _573);
                float _581 = _575 * _575;
                float _583 = fma(_577, _577, _581);
                float _585 = fma(_579, _579, _583);
                float _587 = rsqrt(_585);
                float _589 = _587 * 9.9999999747524270787835121154785e-07;
                float _591 = _577 * _589;
                float _593 = _575 * _589;
                float _595 = _579 * _589;
                _431 = _593;
                _427 = _591;
                _435 = _595;
            }
        }
    }
    _475 = false;
    float _597 = _431;
    float _599 = _427;
    float _601 = _435;
    bool _603 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _605 = !_603;
    float _607 = _597;
    float _625;
    if (!_605)
    {
        float _609 = in.m_42.x;
        float _611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _613 = _609 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _615 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _617 = _615 * _611;
        float _619 = floor(_617);
        float _621 = -_619;
        float _623 = _617 + _621;
        _625 = _623;
        _627 = true;
    }
    else
    {
        float _629 = float(_71);
        float _631 = 1.0 / _629;
        float _633 = _105 * _631;
        _625 = _633;
    }
    _627 = false;
    float _635 = _625;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _639 = _635 + _637;
    float _641 = in.m_40.x;
    float _643 = in.m_40.y;
    bool _645 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _647 = isnan(_635);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _657;
    bool _661 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _663 = isnan(_635);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = -_655;
    float _675 = _673 + 1.0;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _677;
    float _681 = 1.0 / _659;
    bool _683 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _685 = _671 * _675;
    float _687 = -_671;
    float _689 = _687 + 1.0;
    float _691 = _639 * _681;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _693;
    float _697 = fma(_679, _691, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _699 = fma(_695, _691, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _701 = _697 * _685;
    float _703 = _699 * _685;
    float _705 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[143].x, _701);
    float _707 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[143].y, _703);
    float _709 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[144].x, _705);
    float _711 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[144].y, _707);
    float _713 = _709 * _641;
    float _715 = _711 * _643;
    bool _717 = !_683;
    float _735;
    if (!_717)
    {
        float _719 = in.m_42.x;
        float _721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _723 = _719 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _725 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _727 = _725 * _721;
        float _729 = floor(_727);
        float _731 = -_729;
        float _733 = _727 + _731;
        _735 = _733;
        _737 = true;
    }
    else
    {
        float _739 = float(_71);
        float _741 = 1.0 / _739;
        float _743 = _105 * _741;
        _735 = _743;
    }
    _737 = false;
    float _745 = _735;
    float _747 = in.m_42.x;
    float _749 = in.m_42.y;
    float _751 = in.m_42.z;
    float _753 = in.m_42.w;
    float _755 = _415 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _757 = _415 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _761 = _759 != 0;
    float _763 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].x, _755);
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _767 = _765 != 0;
    float _769 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].x, _757);
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _773 = _771 != 0;
    float _775 = _715 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _779 = _777 != 0;
    float _781 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _783 = _597 * _597;
    float _785 = _775 * _781;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _789 = fma(_599, _599, _783);
    float _791 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _793 = _749 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _795 = _747 > 0.5;
    float _797 = _747 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _799 = _749 > 0.5;
    float _801 = -_181;
    int _803 = _795 ? as_type<int>(_801) : as_type<int>(_181);
    float _805 = -_787;
    float _807 = fma(_797, 2.0, _805);
    bool _809 = _751 > 0.5;
    float _811 = fma(_601, _601, _789);
    bool _813 = _753 > 0.5;
    float _815 = -_105;
    float _817 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[76].x, _807);
    float _819 = -_181;
    int _821 = _809 ? as_type<int>(_819) : as_type<int>(_181);
    float _823 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].z, _763);
    float _825 = -_185;
    int _827 = _799 ? as_type<int>(_825) : as_type<int>(_185);
    float _829 = rsqrt(_811);
    float _831 = -_181;
    int _833 = _799 ? as_type<int>(_831) : as_type<int>(_181);
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _837 = !_761;
    float _839 = _837 ? _181 : as_type<float>(_803);
    int _841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _843 = _841 != 0;
    int _845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _847 = _845 != 0;
    float _849 = _415 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _851 = !_779;
    float _853 = _851 ? _181 : as_type<float>(_821);
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _857 = _855 != 0;
    float _859 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].x, _849);
    float _861 = _713 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _863 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _865 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].z, _859);
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _869 = _861 * _863;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _875 = fma(_793, -2.0, _867);
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _879 = _877 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _881 = 1.0 / _873;
    float _883 = _829 * _601;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _887 = _885 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _889 = _829 * _599;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _893 = !_843;
    float _895 = _893 ? _181 : as_type<float>(_833);
    float _897 = 1.0 / _879;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _901 = _891 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _903 = -_185;
    int _905 = _809 ? as_type<int>(_903) : as_type<int>(_185);
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _909 = _745 + _907;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _913 = _899 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _915 = 1.0 / _887;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _921 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _923 = _889 * _921;
    float _925 = _865 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _927 = _911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _929 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].z, _769);
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _931;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _935;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _941 = _909;
    float _943 = _751;
    if (!_857)
    {
        _939 = _749;
    }
    float _945 = _939;
    out.m_44.x = _927;
    out.m_44.y = _901;
    out.m_44.z = _913;
    float _947 = _933 * _897;
    float _949 = -_185;
    int _951 = _813 ? as_type<int>(_949) : as_type<int>(_185);
    float _953 = _919 * _915;
    float _955 = _937 * _881;
    bool _957 = !_767;
    float _959 = _957 ? _185 : as_type<float>(_827);
    bool _961 = !_773;
    float _963 = _961 ? _185 : as_type<float>(_951);
    float _965 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _969 = _745 + _967;
    bool _971 = !_847;
    float _973 = _971 ? _185 : as_type<float>(_905);
    float _975 = fma(_955, _909, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _979 = _745 + _977;
    float _981 = fma(_953, _969, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _987 = fma(_947, _979, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _991 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[78].w, _983);
    bool _993 = _745 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _995 = isnan(_745);
    bool _997 = _993 || _995;
    bool _999 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1001 = _997 || _999;
    float _1003 = float(_1001);
    float _1005 = _965 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1007 = _839 + 0.5;
    float _1009 = _945;
    if (!_857)
    {
        _941 = _945;
    }
    float _1011 = _941;
    float _1013 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[88].w, _989);
    float _1015 = _1011;
    if (_857)
    {
        _1009 = _749;
    }
    float _1017 = _1009;
    float _1019 = -_1003;
    float _1021 = _1019 + 1.0;
    bool _1023 = _745 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1025 = isnan(_745);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1031 = _1027 || _1029;
    float _1033 = float(_1031);
    float _1035 = fma(_1005, _1007, _817);
    bool _1037 = _745 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1039 = isnan(_745);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1045 = _1041 || _1043;
    float _1047 = float(_1045);
    float _1049 = _829 * _597;
    bool _1051 = _745 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1053 = isnan(_745);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1059 = _1055 || _1057;
    float _1061 = float(_1059);
    float _1063 = _1033 * _1021;
    float _1065 = -_1033;
    float _1067 = _1065 + 1.0;
    float _1069 = -_1047;
    float _1071 = _1069 + 1.0;
    float _1073 = _985 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1075 = _1017;
    if (_857)
    {
        _607 = _747;
    }
    float _1077 = _607;
    float _1079 = _1047 * _1067;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1083 = _1077;
    if (!_857)
    {
        _1083 = _751;
    }
    float _1085 = _1083;
    float _1087 = _1061 * _1071;
    float _1089 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _875);
    float _1091 = _959 + (-0.5);
    float _1093 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1095 = _883 * _1093;
    float _1097 = _975 * _1087;
    float _1099 = _1085 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1101 = -_1073;
    float _1103 = -_1089;
    float _1105 = fma(_1101, _1091, _1103);
    float _1107 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1109 = _1049 * _1107;
    float _1111 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1113 = -_1095;
    float _1115 = fma(_889, _1111, _1113);
    float _1117 = -_1061;
    float _1119 = _1117 + 1.0;
    float _1121 = -_1081;
    float _1123 = fma(_1099, 2.0, _1121);
    float _1125 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1127 = -_1109;
    float _1129 = fma(_883, _1125, _1127);
    float _1131 = _1115 * _1115;
    float _1133 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1135 = -_923;
    float _1137 = fma(_1049, _1133, _1135);
    float _1139 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1097);
    float _1141 = fma(_1129, _1129, _1131);
    float _1143 = _1091;
    if (_857)
    {
        _1015 = _747;
    }
    float _1145 = _1015;
    float _1147 = -_105;
    float _1149 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1123);
    float _1151 = fma(_1137, _1137, _1141);
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1155 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _991);
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1159 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1153);
    float _1161 = rsqrt(_1151);
    float _1163 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_857)
    {
        _1143 = _751;
    }
    float _1167 = _1143;
    float _1169 = fma(_981, _1079, _1139);
    float _1171 = _1167;
    if (_857)
    {
        _1171 = _1017;
    }
    float _1173 = _1171;
    float _1175 = -_1157;
    float _1177 = fma(_1163, 2.0, _1175);
    float _1179 = _791 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1181 = _895 + 0.5;
    float _1183 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1165);
    float _1185 = fma(_987, _1063, _1169);
    float _1187 = fma(_1179, _1181, _1149);
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1193 = _1115 * _1161;
    float _1195 = _1129 * _1161;
    float _1197 = _1137 * _1161;
    float _1199 = _785 * _1049;
    float _1201 = _889 * _1193;
    float _1203 = _785 * _889;
    if (_857)
    {
        _943 = _1017;
    }
    float _1205 = _943;
    float _1207 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1185);
    float _1209 = -_1201;
    float _1211 = fma(_1049, _1195, _1209);
    float _1213 = _1049 * _1197;
    float _1215 = _785 * _883;
    float _1217 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1189);
    float _1219 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1191);
    if (!_857)
    {
        _1075 = _747;
    }
    float _1221 = _1075;
    float _1223 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1225 = fma(_869, _1195, _1203);
    float _1227 = -_1213;
    float _1229 = fma(_883, _1193, _1227);
    float _1231 = _823 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1235 = fma(_869, _1197, _1215);
    float _1237 = fma(_1223, _1229, _1225);
    float _1239 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1243 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1245 = fma(_1223, _1211, _1235);
    float _1247 = _929 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1249 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1239);
    float _1251 = fma(_1243, -2.0, _1241);
    float _1253 = _1247 + _1245;
    float _1255 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1249);
    float _1257 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1259 = _925 + _1237;
    float _1261 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1263 = _1253 + _1261;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1267 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1269 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1271 = _1255 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1273 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1257);
    float _1275 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1277 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1279 = _1259 + _1277;
    float _1281 = _1263 * _1263;
    float _1283 = _1265 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = _1267 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1287 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1289 = fma(_1279, _1279, _1281);
    float _1291 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1273);
    float _1293 = -_105;
    float _1295 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1177);
    float _1297 = _883 * _1195;
    float _1299 = sqrt(_1289);
    float _1301 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1303 = fma(_869, _1193, _1199);
    float _1305 = -_1297;
    float _1307 = fma(_889, _1197, _1305);
    float _1309 = _1291 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1311 = _1207 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1313 = fma(_1301, -2.0, _835);
    float _1315 = fma(_1223, _1307, _1303);
    float _1317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1319 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1217);
    out.m_46.x = _1283;
    out.m_46.y = _1285;
    out.m_46.z = _1287;
    out.m_46.w = _1311;
    float _1321 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1219);
    float _1323 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1013);
    float _1325 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1159);
    float _1327 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1183);
    float _1329 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1251);
    float _1331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1333 = _1299 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1335 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1313);
    float _1337 = _1231 + _1315;
    float _1339 = _853 + 0.5;
    bool _1341 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1343 = isnan(0.5);
    bool _1345 = _1341 || _1343;
    bool _1347 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1349 = _1345 || _1347;
    float _1351 = 1.0 / _1271;
    float _1353 = _1317 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1355 = _963 + (-0.5);
    float _1357 = _973 + (-0.5);
    float _1359 = fma(_1275, _1339, _1295);
    float _1361 = -_1353;
    float _1363 = -_1329;
    float _1365 = fma(_1361, _1355, _1363);
    float _1367 = _1331 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1369 = _1309 + _1271;
    float _1371 = -_1367;
    float _1373 = -_1335;
    float _1375 = fma(_1371, _1357, _1373);
    float _1377 = _1357;
    float _1379 = _1259;
    float _1381 = _1253;
    float _1383 = _1331;
    float _1385 = _1335;
    float _1387 = _1315;
    if (!_1333)
    {
        _1377 = _1337;
    }
    float _1389 = _1377;
    float _1391 = _1369 * _1351;
    float _1393 = _1391 * 0.5;
    float _1395 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1397 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1395);
    bool _1399 = !_1333;
    float _1401 = _1389;
    if (!_1399)
    {
        float _1403 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1405 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1407 = _1299 + _1405;
        float _1409 = _1337 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1411 = rsqrt(_1289);
        float _1413 = _1407 * _1403;
        float _1415 = _1413 * 0.15915493667125701904296875;
        float _1417 = _1415 * 6.283185482025146484375;
        float _1419 = cos(_1417);
        float _1421 = _1415 * 6.283185482025146484375;
        float _1423 = sin(_1421);
        float _1425 = _1419 + (-1.0);
        float _1427 = fma(_1423, _1409, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1429 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1431 = _1411 * _1427;
        float _1433 = fma(_1337, _1419, _1429);
        float _1435 = fma(_1279, _1431, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1437 = fma(_1263, _1431, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1379 = _1435;
        _1381 = _1437;
        _1401 = _1433;
        _1383 = _1415;
        _1385 = _1423;
        _1387 = _1429;
    }
    float _1439 = _1379;
    float _1441 = _1381;
    float _1443 = _1401;
    float _1445 = _1383;
    float _1447 = _1385;
    float _1449 = _1387;
    float _1451 = _1447;
    float _1453 = _1449;
    float _1455 = _1445;
    float _1457 = _1443;
    if (_1349)
    {
        _1451 = _1439;
    }
    float _1459 = _1451;
    float _1461 = _1459;
    if (_1349)
    {
        _1453 = _1441;
    }
    float _1463 = _1453;
    float _1465 = _1463;
    if (!_1349)
    {
        float _1467 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1469 = _1231 + _1467;
        float _1471 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1473 = _925 + _1471;
        float _1475 = -_925;
        float _1477 = _1475 + _1439;
        float _1479 = -_1247;
        float _1481 = _1479 + _1441;
        float _1483 = _1469 * _1469;
        float _1485 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1487 = _1247 + _1485;
        float _1489 = fma(_1473, _1473, _1483);
        float _1491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1493 = fma(_1487, _1487, _1489);
        float _1495 = sqrt(_1493);
        float _1497 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _1499 = _1495 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1501 = isnan(_1495);
        bool _1503 = _1499 || _1501;
        bool _1505 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1507 = _1503 || _1505;
        float _1509 = precise::min(_1495, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1511 = _1509 * _1491;
        float _1513 = _1497 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1515 = -_1231;
        float _1517 = _1515 + _1443;
        float _1519 = _1513 * _1511;
        float _1521 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
        float _1523 = _1513;
        if (_1507)
        {
            float _1525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1521 = _1525;
        }
        float _1527 = _1521;
        if (_1507)
        {
            float _1529 = precise::max(_1495, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1455 = _1529;
        }
        float _1531 = _1455;
        float _1533 = fma(_1477, _1519, _925);
        float _1535 = fma(_1517, _1519, _1231);
        float _1537 = fma(_1481, _1519, _1247);
        float _1539 = _1531;
        float _1541 = _1533;
        float _1543 = _1535;
        if (_1507)
        {
            float _1545 = _1531 * _1527;
            _1539 = _1545;
        }
        float _1547 = _1539;
        float _1549 = _1547;
        if (_1507)
        {
            float _1551 = _1513 * _1547;
            _1549 = _1551;
        }
        float _1553 = _1549;
        if (!_1507)
        {
            _1523 = _1537;
        }
        float _1555 = _1523;
        _1465 = _1555;
        if (_1507)
        {
            float _1557 = fma(_1477, _1553, _925);
            _1541 = _1557;
        }
        float _1559 = _1541;
        _1461 = _1559;
        if (_1507)
        {
            float _1561 = fma(_1517, _1553, _1231);
            _1543 = _1561;
        }
        float _1563 = _1543;
        _1457 = _1563;
        if (_1507)
        {
            float _1565 = fma(_1481, _1553, _1247);
            _1465 = _1565;
        }
    }
    float _1567 = _1457;
    float _1569 = _1461;
    float _1571 = _1465;
    float _1573 = 1.0 / _1397;
    bool _1575 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1577 = isnan(0.5);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1583 = _1579 || _1581;
    float _1585 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1587 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1589 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1591 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1593 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1585);
    float _1595 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1587);
    float _1597 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1589);
    float _1599 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1591);
    float _1601 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1593);
    float _1603 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1595);
    float _1605 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1597);
    float _1607 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1599);
    float _1609 = _1587;
    float _1611 = _1593;
    if (_1583)
    {
        _1609 = 1.0;
    }
    float _1613 = _1609;
    float _1615 = _1601 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1617 = _1613;
    if (_1583)
    {
        _1611 = 1.0;
    }
    float _1619 = _1611;
    float _1621 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1623 = _1573 * _1621;
    float _1625 = _1619;
    if (!_1583)
    {
        float _1627 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1629 = _1627 * 0.15915493667125701904296875;
        float _1631 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1633 = _1629 * 6.283185482025146484375;
        float _1635 = cos(_1633);
        float _1637 = _1631 * 0.15915493667125701904296875;
        float _1639 = _1629 * 6.283185482025146484375;
        float _1641 = sin(_1639);
        float _1643 = 1.0 / _1635;
        float _1645 = _1637 * 6.283185482025146484375;
        float _1647 = cos(_1645);
        float _1649 = _1641 * _1643;
        float _1651 = _1637 * 6.283185482025146484375;
        float _1653 = sin(_1651);
        float _1655 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1657 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1655;
        float _1659 = _1647 * _1649;
        float _1661 = 1.0 / _1657;
        float _1663 = 1.0 / _1659;
        float _1665 = _1653 * _1663;
        float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1669 = fma(_1623, _1665, _1667);
        float _1671 = _1669 * _1661;
        float _1673 = precise::clamp(_1671, 0.0, 1.0);
        _1617 = _1673;
    }
    float _1675 = _1617;
    if (!_1583)
    {
        float _1677 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1679 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1681 = _1677 * 0.15915493667125701904296875;
        float _1683 = _1679 * 0.15915493667125701904296875;
        float _1685 = _1681 * 6.283185482025146484375;
        float _1687 = cos(_1685);
        float _1689 = _1681 * 6.283185482025146484375;
        float _1691 = sin(_1689);
        float _1693 = 1.0 / _1687;
        float _1695 = _1683 * 6.283185482025146484375;
        float _1697 = cos(_1695);
        float _1699 = _1691 * _1693;
        float _1701 = _1683 * 6.283185482025146484375;
        float _1703 = sin(_1701);
        float _1705 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1707 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1705;
        float _1709 = _1697 * _1699;
        float _1711 = 1.0 / _1709;
        float _1713 = 1.0 / _1707;
        float _1715 = _1703 * _1711;
        float _1717 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1719 = fma(_1623, _1715, _1717);
        float _1721 = _1719 * _1713;
        float _1723 = precise::clamp(_1721, 0.0, 1.0);
        float _1725 = -_1723;
        float _1727 = _1725 + 1.0;
        _1625 = _1727;
    }
    float _1729 = _1625;
    float _1731 = _1603 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1733 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1735 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1737 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1739 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1741 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1733);
    float _1743 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1735);
    float _1745 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1737);
    float _1747 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1749 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1739);
    bool _1751 = _1675 > 0.0;
    bool _1753 = isnan(_1675);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan(0.0);
    bool _1759 = _1755 || _1757;
    float _1761 = _1675 * _1729;
    float _1763 = -_1321;
    float _1765 = _1763 + 1.0;
    float _1767 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1741);
    float _1769 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1743);
    float _1771 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1745);
    float _1773 = fma(_1747, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1749);
    float _1775 = -_1323;
    float _1777 = _1775 + 1.0;
    float _1779 = -_1319;
    float _1781 = _1779 + 1.0;
    float _1783 = _1607 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1785 = -_1155;
    float _1787 = _1785 + 1.0;
    float _1789 = fma(_973, _1777, _1375);
    float _1791 = -_1781;
    float _1793 = fma(_839, _1791, _1035);
    float _1795 = -_1327;
    float _1797 = _1795 + 1.0;
    float _1799 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1767);
    float _1801 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1773);
    float _1803 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1771);
    bool _1805 = _1729 <= 0.0;
    bool _1807 = !_1759;
    bool _1809 = _1805 || _1807;
    float _1811 = fma(_959, _1787, _1105);
    float _1813 = fma(_963, _1797, _1365);
    float _1815 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1769);
    float _1817 = -_1325;
    float _1819 = _1817 + 1.0;
    float _1821 = _1761 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1823 = _1799 + _1801;
    float _1825 = _1803 + _1801;
    float _1827 = _1801 * 0.5;
    float _1829 = -_1765;
    float _1831 = fma(_895, _1829, _1187);
    float _1833 = -_1819;
    float _1835 = fma(_853, _1833, _1359);
    float _1837 = _1821 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1839 = _1823 * 0.5;
    float _1841 = _1825 * 0.5;
    float _1843 = fma(_1815, -0.5, _1827);
    out.m_48.x = _1793;
    out.m_48.y = _1811;
    out.m_48.z = _1835;
    out.m_48.w = _1813;
    out.m_50.x = _1831;
    out.m_50.y = _1789;
    out.m_33.x = _1837;
    out.gl_Position.x = _1799;
    out.gl_Position.y = _1815;
    out.gl_Position.z = _1803;
    out.gl_Position.w = _1801;
    out.m_52.x = _1839;
    out.m_52.y = _1843;
    out.m_52.z = _1841;
    out.m_52.w = _1801;
    if (!_1809)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1845 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1845;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

