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
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_44 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
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
    float4 m_42 [[attribute(4)]];
    float4 m_40 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _915 = false;
    bool _769 = false;
    bool _613 = false;
    bool _463 = false;
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
    float _89 = as_type<float>(_87);
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2176 = as_type<float>(_87);
        out.gl_Position.z = _2176;
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
    int _123 = 0;
    if (_117)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2245 = as_type<float>(_127);
        out.gl_Position.z = _2245;
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
        _107 = _153;
    }
    float _155 = _107;
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
    float _191 = 0.0;
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
        _89 = _211;
        _189 = _221;
        _191 = _209;
    }
    float _223 = _89;
    float _225 = _189;
    float _227 = _191;
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
        float _291 = 1.0 / _285;
        float _293 = _287 * 0.693147182464599609375;
        float _295 = exp2(_289);
        float _297 = 1.0 / _293;
        float _299 = _295 + (-1.0);
        float _301 = -_299;
        float _303 = fma(_301, _297, _105);
        float _305 = _303 * _291;
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
    float _347 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _349 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _351 = fma(_333, _133, _341);
    float _353 = -_343;
    float _355 = _339 + _353;
    float _357 = fma(_333, _137, _347);
    float _359 = fma(_259, _137, _349);
    float _361 = -_351;
    float _363 = _345 + _361;
    float _365 = _355 * _355;
    float _367 = in.m_40.w;
    float _369 = -_357;
    float _371 = _359 + _369;
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
    float _397 = sqrt(_383);
    float _399 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].z, _385);
    float _401 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].z, _393);
    bool _403 = _397 >= 9.9999999747524270787835121154785e-07;
    bool _405 = isnan(_397);
    bool _407 = _403 || _405;
    bool _409 = isnan(9.9999999747524270787835121154785e-07);
    bool _411 = _407 || _409;
    float _413 = fma(_345, _367, _387);
    float _415 = fma(_339, _367, _389);
    float _417 = fma(_359, _367, _391);
    float _419 = _399;
    float _421 = _395;
    float _423 = _401;
    if (!_411)
    {
        bool _425 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _427 = !_425;
        if (!_427)
        {
            float _429 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _431 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _433 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _435 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _429);
            float _437 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _431);
            float _439 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _433);
            float _441 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _435);
            float _443 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _437);
            float _445 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _439);
            float _447 = _441 * _441;
            float _449 = fma(_443, _443, _447);
            float _451 = fma(_445, _445, _449);
            float _453 = rsqrt(_451);
            float _455 = _453 * 9.9999999747524270787835121154785e-07;
            float _457 = _443 * _455;
            float _459 = _441 * _455;
            float _461 = _445 * _455;
            _419 = _459;
            _421 = _457;
            _423 = _461;
            _463 = true;
        }
        else
        {
            float _465 = _135 * _135;
            float _467 = fma(_133, _133, _465);
            float _469 = fma(_137, _137, _467);
            float _471 = sqrt(_469);
            bool _473 = _471 >= 9.9999999747524270787835121154785e-07;
            bool _475 = isnan(_471);
            bool _477 = _473 || _475;
            bool _479 = isnan(9.9999999747524270787835121154785e-07);
            bool _481 = _477 || _479;
            if (!_481)
            {
                float _483 = _389 * _389;
                float _485 = fma(_387, _387, _483);
                float _487 = fma(_391, _391, _485);
                float _489 = sqrt(_487);
                bool _491 = _489 >= 9.9999999747524270787835121154785e-07;
                bool _493 = isnan(_489);
                bool _495 = _491 || _493;
                bool _497 = isnan(9.9999999747524270787835121154785e-07);
                bool _499 = _495 || _497;
                if (!_499)
                {
                    float _501 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _503 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _501);
                    float _505 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _503);
                    float _507 = rsqrt(_505);
                    float _509 = _507 * 9.9999999747524270787835121154785e-07;
                    float _511 = _509 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _513 = _509 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _515 = _509 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _419 = _513;
                    _421 = _511;
                    _423 = _515;
                    _463 = true;
                }
                else
                {
                    float _517 = _389 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _519 = _389 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _521 = _389 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _523 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _517);
                    float _525 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _519);
                    float _527 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _521);
                    float _529 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].z, _523);
                    float _531 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].z, _525);
                    float _533 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].z, _527);
                    float _535 = _529 * _529;
                    float _537 = fma(_531, _531, _535);
                    float _539 = fma(_533, _533, _537);
                    float _541 = rsqrt(_539);
                    float _543 = _541 * 9.9999999747524270787835121154785e-07;
                    float _545 = _529 * _543;
                    float _547 = _531 * _543;
                    float _549 = _533 * _543;
                    _419 = _545;
                    _421 = _547;
                    _423 = _549;
                    _463 = true;
                }
            }
            else
            {
                float _551 = _135 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _553 = _135 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _555 = _135 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _557 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[5].x, _551);
                float _559 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[4].x, _553);
                float _561 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[6].x, _555);
                float _563 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[5].z, _557);
                float _565 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[4].z, _559);
                float _567 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[6].z, _561);
                float _569 = _563 * _563;
                float _571 = fma(_565, _565, _569);
                float _573 = fma(_567, _567, _571);
                float _575 = rsqrt(_573);
                float _577 = _575 * 9.9999999747524270787835121154785e-07;
                float _579 = _565 * _577;
                float _581 = _563 * _577;
                float _583 = _567 * _577;
                _419 = _581;
                _421 = _579;
                _423 = _583;
            }
        }
    }
    _463 = false;
    float _585 = _419;
    float _587 = _421;
    float _589 = _423;
    bool _591 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _593 = !_591;
    float _611;
    if (!_593)
    {
        float _595 = in.m_42.x;
        float _597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _599 = _595 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _601 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _603 = _601 * _597;
        float _605 = floor(_603);
        float _607 = -_605;
        float _609 = _603 + _607;
        _611 = _609;
        _613 = true;
    }
    else
    {
        float _615 = float(_71);
        float _617 = 1.0 / _615;
        float _619 = _105 * _617;
        _611 = _619;
    }
    _613 = false;
    float _621 = _611;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _625 = _621 + _623;
    bool _627 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _629 = isnan(_621);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _641 = _621 + _639;
    bool _643 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _645 = isnan(_621);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _655;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _663 = -_637;
    float _665 = _663 + 1.0;
    float _667 = 1.0 / _661;
    bool _669 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _671 = isnan(_621);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = _653 * _665;
    float _683 = -_653;
    float _685 = _683 + 1.0;
    bool _687 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _689 = 1.0 / _657;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _691;
    float _695 = _641 * _667;
    float _697 = _679 * _685;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _703 = -_679;
    float _705 = _703 + 1.0;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _711 = fma(_701, _695, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _713 = _625 * _689;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _715;
    float _719 = in.m_40.x;
    float _721 = in.m_40.y;
    float _723 = fma(_709, _695, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _725 = fma(_693, _713, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _727 = fma(_717, _713, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _729 = _727 * _697;
    float _731 = _725 * _697;
    float _733 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[143].x, _729);
    float _735 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[143].y, _731);
    float _737 = fma(_711, _681, _733);
    float _739 = fma(_723, _681, _735);
    float _741 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[145].x, _737);
    float _743 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[145].y, _739);
    float _745 = _741 * _719;
    float _747 = _743 * _721;
    bool _749 = !_687;
    float _767;
    if (!_749)
    {
        float _751 = in.m_42.x;
        float _753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _755 = _751 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _757 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _759 = _757 * _753;
        float _761 = floor(_759);
        float _763 = -_761;
        float _765 = _759 + _763;
        _767 = _765;
        _769 = true;
    }
    else
    {
        float _771 = float(_71);
        float _773 = 1.0 / _771;
        float _775 = _105 * _773;
        _767 = _775;
    }
    _769 = false;
    float _777 = _767;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _781 = _777 + _779;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _785 = _783 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _787 = _777 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _789 = isnan(_777);
    bool _791 = _787 || _789;
    bool _793 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _795 = _791 || _793;
    float _797 = float(_795);
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _801 = _799 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _803 = _777 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _805 = isnan(_777);
    bool _807 = _803 || _805;
    bool _809 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _811 = _807 || _809;
    float _813 = float(_811);
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _815;
    bool _819 = _777 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _821 = isnan(_777);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _827 = _823 || _825;
    float _829 = float(_827);
    float _831 = 1.0 / _785;
    float _833 = -_797;
    float _835 = _833 + 1.0;
    float _837 = _813 * _835;
    float _839 = -_813;
    float _841 = _839 + 1.0;
    float _843 = 1.0 / _801;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _849 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _853 = _845 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _855 = _847 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _857 = _817 * _831;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _861 = _859 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _863 = _851 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _865 = fma(_857, _781, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _867 = _861 * _843;
    float _869 = _865 * _837;
    float _871 = -_829;
    float _873 = _871 + 1.0;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _877 = _777 + _875;
    float _879 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[115].x, _869);
    float _881 = _797 * _873;
    float _883 = fma(_867, _877, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _885 = fma(_883, _881, _879);
    float _887 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[117].x, _885);
    float _889 = _887 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_44.x = _853;
    out.m_44.y = _855;
    out.m_44.z = _863;
    out.m_44.w = _889;
    bool _891 = !_849;
    float _911;
    float _913;
    if (!_891)
    {
        float _893 = in.m_42.x;
        float _895 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _897 = float(_71);
        float _899 = _893 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _901 = fma(_899, (*spvDescriptorSet0.vp_c9)._m0[11].w, _105);
        float _903 = _901 * _895;
        float _905 = floor(_903);
        float _907 = -_905;
        float _909 = _903 + _907;
        _911 = _897;
        _913 = _909;
        _915 = true;
    }
    else
    {
        float _917 = float(_71);
        float _919 = 1.0 / _917;
        float _921 = _105 * _919;
        _911 = _917;
        _913 = _921;
    }
    _915 = false;
    float _923 = _911;
    float _925 = _913;
    float _927 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _929 = int(_927);
    float _931 = _415 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _933 = _415 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _935 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _937 = _935 != 0;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _941 = _939 != 0;
    int _943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _945 = _943 != 0;
    float _947 = _415 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _951 = _949 != 0;
    float _953 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _955 = int(_953);
    float _957 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].x, _931);
    float _959 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].x, _933);
    float _961 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].x, _947);
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _965 = _963 != 0;
    float _967 = _745 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _969 = !_937;
    int _971 = _969 ? 0 : 1;
    float _973 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _975 = float(_929);
    float _977 = 1.0 / _923;
    int _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _981 = _979 != 0;
    float _983 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    int _985 = abs(_971);
    float _987 = float(uint(_955));
    float _989 = 1.0 / _975;
    int _991 = ~_955;
    int _993 = _991 + 1;
    float _995 = float(_955);
    float _997 = 1.0 / _987;
    float _999 = _105 * _989;
    float _1001 = trunc(_999);
    int _1003 = int(_1001);
    int _1005 = as_type<int>(_997) + (-2);
    float _1007 = float(uint(_1003));
    float _1009 = float(_1003);
    float _1011 = as_type<float>(_1005) * _1007;
    bool _1013 = _1009 >= _995;
    bool _1015 = isnan(_1009);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan(_995);
    bool _1021 = _1017 || _1019;
    float _1023 = float(_1021);
    float _1025 = trunc(_1011);
    float _1027 = precise::max(_1025, 0.0);
    uint _1030 = uint(_1027);
    float _1032 = trunc(_1023);
    int _1034 = int(_1032);
    int _1036 = ~_955;
    int _1038 = _1036 + 1;
    int _1040 = _993 * int(_1030);
    int _1042 = _1040 + _1003;
    float _1044 = float(uint(_1042));
    float _1046 = as_type<float>(_1005) * _1044;
    float _1048 = in.m_42.x;
    float _1050 = in.m_42.y;
    float _1052 = in.m_42.z;
    float _1054 = in.m_42.w;
    float _1056 = trunc(_1046);
    float _1058 = precise::max(_1056, 0.0);
    uint _1060 = uint(_1058);
    bool _1062 = !_945;
    int _1064 = _1062 ? 0 : 1;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1068 = _1066 != 0;
    int _1070 = int(_1030) + int(_1060);
    bool _1072 = !_941;
    int _1074 = _1072 ? 0 : 1;
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1078 = _1076 != 0;
    int _1080 = _1038 * _1070;
    int _1082 = _1080 + _1003;
    bool _1084 = _1054 > 0.5;
    float _1086 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1088 = abs(_1074);
    float _1090 = _1050 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1092 = -_185;
    int _1094 = _1084 ? as_type<int>(_1092) : as_type<int>(_185);
    bool _1096 = uint(_1082) >= uint(_955);
    bool _1098 = !_1078;
    float _1100 = _1098 ? _185 : as_type<float>(_1094);
    float _1102 = _747 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1104 = !_1096;
    int _1106 = _1104 ? 0 : (-1);
    bool _1108 = !_965;
    float _1110 = _1108 ? 7.345489978790283203125 : 1.0;
    int _1112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1114 = _1112 != 0;
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1118 = _1116 != 0;
    float _1120 = _1110 * _1048;
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1124 = _1122 != 0;
    float _1126 = _967 * _973;
    float _1128 = floor(_1120);
    float _1130 = _1102 * _983;
    bool _1132 = !_1124;
    int _1134 = _1132 ? 0 : 1;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1138 = ~_1070;
    int _1140 = _1138 + _1106;
    int _1142 = _1140 + 1;
    bool _1144 = _1050 > 0.5;
    float _1146 = -_1136;
    float _1148 = fma(_1086, 2.0, _1146);
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1152 = _1150 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1154 = _955 * _1142;
    int _1156 = _1154 + _1003;
    float _1158 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].z, _959);
    float _1160 = 1.0 / _1152;
    float _1162 = -_1128;
    float _1164 = _1120 + _1162;
    float _1166 = -_185;
    int _1168 = _1144 ? as_type<int>(_1166) : as_type<int>(_185);
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1170;
    bool _1174 = _955 == 0;
    float _1176 = _1164 * _995;
    float _1178 = _105 * _995;
    float _1180 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].z, _957);
    int _1182 = ~_1034;
    int _1184 = _1182 + 1;
    int _1186 = _1184 + 1;
    float _1188 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].z, _961);
    float _1190 = _1178 * _977;
    bool _1192 = !_1174;
    int _1194 = _1192 ? _1156 : (-1);
    float _1196 = trunc(_1176);
    int _1198 = int(_1196);
    int _1200 = _955 + (-1);
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1204 = !_1114;
    float _1206 = _1204 ? _185 : as_type<float>(_1168);
    int _1208 = _1194 * _1186;
    int _1210 = abs(_1134);
    float _1212 = fma(_1090, -2.0, _1202);
    float _1214 = trunc(_1190);
    int _1216 = int(_1214);
    int _1218 = _1034 * _1200;
    int _1220 = _1218 + _1208;
    float _1222 = _1172 * _1160;
    bool _1224 = !_951;
    int _1226 = _1224 ? 0 : 1;
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1230 = _1228 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1232 = _1048 > 0.5;
    int _1234 = _1220 * _1088;
    int _1236 = _1198 * _1210;
    int _1238 = _1236 + _1003;
    float _1240 = -_181;
    int _1242 = _1232 ? as_type<int>(_1240) : as_type<int>(_181);
    float _1244 = 1.0 / _1230;
    bool _1246 = _1052 > 0.5;
    float _1248 = -_105;
    float _1250 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1148);
    int _1252 = abs(_1064);
    float _1254 = _1188 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1256 = _1216 * _985;
    int _1258 = _1256 + _1234;
    float _1260 = -_181;
    int _1262 = _1246 ? as_type<int>(_1260) : as_type<int>(_181);
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1266 = _1264 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1270 = _925 + _1268;
    bool _1272 = !_1068;
    float _1274 = _1272 ? _181 : as_type<float>(_1242);
    bool _1276 = !_1118;
    float _1278 = _1276 ? _181 : as_type<float>(_1262);
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1282 = abs(_1226);
    int _1284 = _1238 * _1252;
    int _1286 = _1284 + _1258;
    float _1288 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1280);
    float _1290 = _585 * _585;
    int _1292 = _1198 * _1282;
    int _1294 = _1292 + _1286;
    float _1296 = as_type<float>(_1186);
    float _1298 = _957;
    float _1300 = as_type<float>(_1252);
    if (!_965)
    {
        _1296 = _1052;
    }
    float _1302 = _1296;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1306 = _1302;
    if (!_965)
    {
        _1298 = _1052;
    }
    float _1308 = _1298;
    float _1310 = fma(_587, _587, _1290);
    float _1312 = _1308;
    if (!_965)
    {
        _1300 = _1050;
    }
    float _1314 = _1300;
    float _1316 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1304);
    float _1318 = _1314;
    if (_965)
    {
        _1306 = _1050;
    }
    float _1320 = _1306;
    float _1322 = fma(_589, _589, _1310);
    if (_965)
    {
        _1312 = _1050;
    }
    float _1324 = _1312;
    float _1326 = _1266 * _1244;
    float _1328 = float(uint(_1294));
    float _1330 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1288);
    bool _1332 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1334 = isnan(_925);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1340 = _1336 || _1338;
    float _1342 = float(_1340);
    float _1344 = rsqrt(_1322);
    if (_965)
    {
        _1318 = _1048;
    }
    float _1346 = _1318;
    float _1348 = as_type<float>(_1005) * _1328;
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1352 = _925 + _1350;
    bool _1354 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1356 = isnan(_925);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1362 = _1358 || _1360;
    float _1364 = float(_1362);
    float _1366 = -_1342;
    float _1368 = _1366 + 1.0;
    float _1370 = fma(_1222, _1352, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1372 = trunc(_1348);
    float _1374 = precise::max(_1372, 0.0);
    uint _1376 = uint(_1374);
    bool _1378 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1380 = isnan(_925);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1386 = _1382 || _1384;
    float _1388 = float(_1386);
    float _1390 = _1364 * _1368;
    float _1392 = -_1364;
    float _1394 = _1392 + 1.0;
    int _1396 = ~_955;
    int _1398 = _1396 + 1;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1402 = fma(_1326, _1270, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1404 = _1388 * _1394;
    float _1406 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1400);
    float _1408 = _1344 * _587;
    float _1410 = _1274 + 0.5;
    float _1412 = _1370 * _1404;
    float _1414 = _1344 * _585;
    float _1416 = _1344 * _589;
    float _1418 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1250);
    int _1420 = _1398 * int(_1376);
    int _1422 = _1420 + _1294;
    float _1424 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1426 = float(uint(_1422));
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1430 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1212);
    float _1432 = _1206 + (-0.5);
    float _1434 = as_type<float>(_1005) * _1426;
    float _1436 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1428);
    float _1438 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1440 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1442 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1444 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1446 = -_1432;
    float _1448 = -_1430;
    float _1450 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1448);
    float _1452 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1454 = _1416 * _1452;
    float _1456 = trunc(_1434);
    float _1458 = precise::max(_1456, 0.0);
    uint _1460 = uint(_1458);
    float _1462 = -_1440;
    float _1464 = fma(_1438, 2.0, _1462);
    float _1466 = fma(_1444, -2.0, _1442);
    float _1468 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1470 = _1414 * _1468;
    float _1472 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1474 = -_1454;
    float _1476 = fma(_1408, _1472, _1474);
    float _1478 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1480 = _1408 * _1478;
    float _1482 = -_1388;
    float _1484 = _1482 + 1.0;
    float _1486 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1488 = -_1470;
    float _1490 = fma(_1416, _1486, _1488);
    float _1492 = _1476 * _1476;
    float _1494 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1496 = -_1480;
    float _1498 = fma(_1414, _1494, _1496);
    float _1500 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1502 = ~_955;
    int _1504 = _1502 + 1;
    float _1506 = fma(_1490, _1490, _1492);
    float _1508 = float(uint(_1238));
    float _1510 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1412);
    float _1512 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1436);
    int _1514 = int(_1376) + int(_1460);
    float _1516 = _1424 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1518 = as_type<float>(_1005) * _1508;
    float _1520 = fma(_1498, _1498, _1506);
    float _1522 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1316);
    float _1524 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1406);
    float _1526 = -_105;
    float _1528 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1464);
    float _1530 = trunc(_1518);
    float _1532 = precise::max(_1530, 0.0);
    uint _1534 = uint(_1532);
    int _1536 = _1504 * _1514;
    int _1538 = _1536 + _1294;
    float _1540 = fma(_1402, _1390, _1510);
    float _1542 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1466);
    float _1544 = _1500 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1546 = _1100 + (-0.5);
    bool _1548 = uint(_1538) >= uint(_955);
    float _1550 = _1278 + 0.5;
    float _1552 = rsqrt(_1520);
    int _1554 = ~_955;
    int _1556 = _1554 + 1;
    float _1558 = -_1544;
    float _1560 = -_1542;
    float _1562 = fma(_1558, _1546, _1560);
    bool _1564 = !_1548;
    int _1566 = _1564 ? 0 : (-1);
    float _1568 = fma(_1516, _1550, _1528);
    float _1570 = _1130 * _1408;
    int _1572 = ~_1514;
    int _1574 = _1572 + _1566;
    int _1576 = _1574 + 1;
    float _1578 = _1130 * _1416;
    bool _1580 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1582 = isnan(0.5);
    bool _1584 = _1580 || _1582;
    bool _1586 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1588 = _1584 || _1586;
    int _1590 = _1556 * int(_1534);
    int _1592 = _1590 + _1238;
    float _1594 = _1180 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1596 = -_1522;
    float _1598 = _1596 + 1.0;
    float _1600 = -_1512;
    float _1602 = _1600 + 1.0;
    float _1604 = _1130 * _1414;
    float _1606 = float(uint(_1592));
    float _1608 = _1498 * _1552;
    int _1610 = _955 * _1576;
    int _1612 = _1610 + _1294;
    float _1614 = _1490 * _1552;
    float _1616 = _1476 * _1552;
    float _1618 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1620 = _1414 * _1608;
    float _1622 = fma(_1126, _1614, _1570);
    bool _1624 = !_1174;
    int _1626 = _1624 ? _1612 : (-1);
    float _1628 = _1408 * _1616;
    float _1630 = as_type<float>(_1005) * _1606;
    float _1632 = -_1620;
    float _1634 = fma(_1416, _1616, _1632);
    float _1636 = _1158 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1638 = _1626 >> 31;
    float _1640 = fma(_1126, _1608, _1578);
    float _1642 = -_1628;
    float _1644 = fma(_1414, _1614, _1642);
    float _1646 = fma(_1618, _1634, _1622);
    int _1648 = _1638 & 3;
    float _1650 = _1636 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1652 = fma(_1618, _1644, _1640);
    float _1654 = _1636 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1656 = _1626 + _1648;
    float _1658 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1650);
    float _1660 = _1254 + _1652;
    float _1662 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1654);
    float _1664 = _1594 + _1646;
    int _1666 = _1656 >> 2;
    float _1668 = -_1330;
    float _1670 = _1668 + 1.0;
    float _1672 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1662);
    float _1674 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1658);
    int _1676 = _1666 << 4;
    int _1678 = _1676 + 368;
    float _1680 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1682 = _1660 + _1680;
    float _1684 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1686 = trunc(_1630);
    float _1688 = precise::max(_1686, 0.0);
    uint _1690 = uint(_1688);
    uint _1692 = uint(int(uint(_1678) >> uint(2)));
    uint _1694 = uint(int(uint(int(_1692)) >> uint(2)));
    int _1696 = int(_1692) & 3;
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[int(_1694)][_1696];
    int _1700 = int(_1692) + 1;
    uint _1702 = uint(int(uint(_1700) >> uint(2)));
    int _1704 = _1700 & 3;
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[int(_1702)][_1704];
    float _1708 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1710 = _1664 + _1708;
    float _1712 = _1682 * _1682;
    float _1714 = -_1670;
    float _1716 = fma(_1274, _1714, _1418);
    float _1718 = fma(_1206, _1598, _1450);
    int _1720 = ~_955;
    int _1722 = _1720 + 1;
    float _1724 = fma(_1710, _1710, _1712);
    float _1726 = -_1524;
    float _1728 = _1726 + 1.0;
    int _1730 = _1678 + 8;
    uint _1732 = uint(int(uint(_1730) >> uint(2)));
    uint _1734 = uint(int(uint(int(_1732)) >> uint(2)));
    int _1736 = int(_1732) & 3;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[int(_1734)][_1736];
    int _1740 = int(_1732) + 1;
    uint _1742 = uint(int(uint(_1740) >> uint(2)));
    int _1744 = _1740 & 3;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[int(_1742)][_1744];
    float _1748 = -_1602;
    float _1750 = fma(_1278, _1748, _1568);
    float _1752 = sqrt(_1724);
    float _1754 = _1416 * _1614;
    float _1756 = fma(_1126, _1616, _1604);
    int _1758 = _1626 & 3;
    bool _1760 = _1758 != 0;
    float _1762 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _1764 = int(_1534) + int(_1690);
    float _1766 = -_1754;
    float _1768 = fma(_1408, _1608, _1766);
    float _1770 = 1.0 / _1684;
    bool _1772 = uint(_1758) >= 2u;
    float _1774 = fma(_1100, _1728, _1562);
    int _1776 = _1722 * _1764;
    int _1778 = _1776 + _1238;
    float _1780 = fma(_1618, _1768, _1756);
    float _1782 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1540);
    float _1784 = _1762 + _1684;
    int _1786 = _1772 ? 0 : 1;
    float _1788 = _1636 + _1780;
    bool _1790 = _1752 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    out.m_46.x = _1716;
    out.m_46.y = _1718;
    out.m_46.z = _1750;
    out.m_46.w = _1774;
    bool _1792 = uint(_1778) >= uint(_955);
    bool _1794 = _1758 != 3;
    bool _1796 = !_1792;
    int _1798 = _1796 ? 0 : (-1);
    float _1800 = _1784 * _1770;
    float _1802 = _1800 * 0.5;
    int _1804 = _1626 & 3;
    bool _1806 = _1804 != 0;
    int _1808 = ~_1764;
    int _1810 = _1808 + _1798;
    int _1812 = _1810 + 1;
    int _1814 = _1806 ? 0 : 1;
    bool _1816 = uint(_1758) > 1u;
    int _1818 = _955 * _1812;
    int _1820 = _1818 + _1238;
    int _1822 = ~_1814;
    int _1824 = _1822 + 1;
    int _1826 = _1824 + 1;
    int _1828 = ~_1786;
    int _1830 = _1828 + 1;
    int _1832 = _1830 + 1;
    float _1834 = _1716;
    float _1836 = _1664;
    float _1838 = _1660;
    int _1840 = _1826;
    int _1842 = _1832;
    if (!_1790)
    {
        _1834 = _1788;
    }
    float _1844 = _1834;
    bool _1846 = !_1790;
    float _1848 = _1844;
    if (!_1846)
    {
        float _1850 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1852 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1854 = _1752 + _1852;
        float _1856 = _1788 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1858 = rsqrt(_1724);
        float _1860 = _1854 * _1850;
        float _1862 = _1860 * 0.15915493667125701904296875;
        float _1864 = _1862 * 6.283185482025146484375;
        float _1866 = cos(_1864);
        float _1868 = _1862 * 6.283185482025146484375;
        float _1870 = sin(_1868);
        float _1872 = _1866 + (-1.0);
        float _1874 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1876 = fma(_1870, _1856, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1878 = fma(_1788, _1866, _1874);
        float _1880 = _1858 * _1876;
        float _1882 = fma(_1710, _1880, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1884 = fma(_1682, _1880, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1848 = _1878;
        _1836 = _1882;
        _1838 = _1884;
    }
    float _1886 = _1848;
    float _1888 = _1836;
    float _1890 = _1838;
    if (!_1816)
    {
        int _1892 = ~_1814;
        int _1894 = _1892 + 1;
        _1840 = _1894;
    }
    int _1896 = _1840;
    float _1898 = _1886 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    bool _1900 = _1758 != 3;
    float _1902 = _1886 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _1904 = abs(_1896);
    float _1906 = _1886 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1908 = _1886 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1910 = !_1760;
    int _1912 = _1910 ? 0 : 1;
    float _1914 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1902);
    float _1916 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1908);
    float _1918 = _1902;
    if (_1794)
    {
        int _1920 = ~_1786;
        int _1922 = _1920 + 1;
        _1842 = _1922;
    }
    int _1924 = _1842;
    float _1926 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1898);
    int _1928 = abs(_1912);
    float _1930 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1906);
    int _1932 = ~_1904;
    int _1934 = _1932 + 1;
    int _1936 = _1934 + 1;
    bool _1938 = !_1900;
    int _1940 = _1938 ? 0 : (-1);
    int _1942 = abs(_1924);
    int _1944 = _1936 * as_type<int>(_1706);
    int _1946 = ~_1928;
    int _1948 = _1946 + 1;
    int _1950 = _1948 + 1;
    int _1952 = abs(_1940);
    bool _1954 = !_981;
    int _1956 = _1954 ? 0 : 1;
    int _1958 = _1950 * as_type<int>(_1698);
    int _1960 = _1958 + _1944;
    int _1962 = abs(_1956);
    int _1964 = ~_1942;
    int _1966 = _1964 + 1;
    int _1968 = _1966 + 1;
    if (_1588)
    {
        _1918 = 1.0;
    }
    float _1970 = _1918;
    float _1972 = _1970;
    if (!_1588)
    {
        float _1974 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1976 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1974);
        float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1980 = _1978 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _1982 = 1.0 / _1976;
        float _1984 = 1.0 / _1980;
        float _1986 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1988 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1990 = fma(_1982, _1986, _1988);
        float _1992 = _1990 * _1984;
        float _1994 = precise::clamp(_1992, 0.0, 1.0);
        _1972 = _1994;
    }
    float _1996 = _1972;
    float _1998 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1926);
    int _2000 = ~_1952;
    int _2002 = _2000 + 1;
    int _2004 = _2002 + 1;
    int _2006 = _1968 * as_type<int>(_1738);
    int _2008 = _2006 + _1960;
    float _2010 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1914);
    float _2012 = _1998 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2014 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1930);
    int _2016 = _2004 * as_type<int>(_1746);
    int _2018 = _2016 + _2008;
    float _2020 = _2010 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2022 = _2012 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    int _2024 = ~_1962;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    float _2030 = _2012 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2032 = _2012 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2034 = _2012 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2036 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1916);
    float _2038 = _2014 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2040 = fma(_2020, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2022);
    float _2042 = fma(_2020, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2030);
    bool _2044 = !_1174;
    int _2046 = _2044 ? _1820 : (-1);
    float _2048 = fma(_2020, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2032);
    int _2050 = _2018 * _2028;
    float _2052 = fma(_2020, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2034);
    float _2054 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2040);
    float _2056 = _2036 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2058 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2042);
    float _2060 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2048);
    int _2062 = _2046 * _1962;
    int _2064 = _2062 + _2050;
    float _2066 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2052);
    float _2068 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2054);
    bool _2070 = _1996 > 0.0;
    bool _2072 = isnan(_1996);
    bool _2074 = _2070 || _2072;
    bool _2076 = isnan(0.0);
    bool _2078 = _2074 || _2076;
    float _2080 = _1996 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2082 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2058);
    float _2084 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2060);
    float _2086 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2066);
    float _2088 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2090 = _2080 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2094 = _2068 + _2082;
    float _2096 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2098 = _2084 + _2082;
    float _2100 = _2082 * 0.5;
    float _2102 = _2094 * 0.5;
    float _2104 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2106 = _2088 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2108 = _2092 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2110 = _1782 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2112 = _2098 * 0.5;
    float _2114 = fma(_2086, -0.5, _2100);
    float _2116 = float(_2064);
    out.m_48.x = _2104;
    out.m_48.y = _2106;
    out.m_48.z = _2108;
    out.m_48.w = _2110;
    out.m_33.x = _2090;
    out.gl_Position.x = _2068;
    out.gl_Position.y = _2086;
    out.gl_Position.z = _2084;
    out.gl_Position.w = _2082;
    out.m_50.x = _2102;
    out.m_50.y = _2114;
    out.m_50.z = _2112;
    out.m_50.w = _2082;
    out.m_52.x = _2116;
    if (_2078)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _2118 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2118;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _915 = false;
    bool _769 = false;
    bool _613 = false;
    bool _463 = false;
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
    float _89 = as_type<float>(_87);
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2176 = as_type<float>(_87);
        out.gl_Position.z = _2176;
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
    int _123 = 0;
    if (_117)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2245 = as_type<float>(_127);
        out.gl_Position.z = _2245;
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
        _107 = _153;
    }
    float _155 = _107;
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
    float _191 = 0.0;
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
        _89 = _211;
        _189 = _221;
        _191 = _209;
    }
    float _223 = _89;
    float _225 = _189;
    float _227 = _191;
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
        float _291 = 1.0 / _285;
        float _293 = _287 * 0.693147182464599609375;
        float _295 = exp2(_289);
        float _297 = 1.0 / _293;
        float _299 = _295 + (-1.0);
        float _301 = -_299;
        float _303 = fma(_301, _297, _105);
        float _305 = _303 * _291;
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
    float _347 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _349 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _351 = fma(_333, _133, _341);
    float _353 = -_343;
    float _355 = _339 + _353;
    float _357 = fma(_333, _137, _347);
    float _359 = fma(_259, _137, _349);
    float _361 = -_351;
    float _363 = _345 + _361;
    float _365 = _355 * _355;
    float _367 = in.m_40.w;
    float _369 = -_357;
    float _371 = _359 + _369;
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
    float _397 = sqrt(_383);
    float _399 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].z, _385);
    float _401 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].z, _393);
    bool _403 = _397 >= 9.9999999747524270787835121154785e-07;
    bool _405 = isnan(_397);
    bool _407 = _403 || _405;
    bool _409 = isnan(9.9999999747524270787835121154785e-07);
    bool _411 = _407 || _409;
    float _413 = fma(_345, _367, _387);
    float _415 = fma(_339, _367, _389);
    float _417 = fma(_359, _367, _391);
    float _419 = _399;
    float _421 = _395;
    float _423 = _401;
    if (!_411)
    {
        bool _425 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _427 = !_425;
        if (!_427)
        {
            float _429 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _431 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _433 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _435 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _429);
            float _437 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _431);
            float _439 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _433);
            float _441 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _435);
            float _443 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _437);
            float _445 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _439);
            float _447 = _441 * _441;
            float _449 = fma(_443, _443, _447);
            float _451 = fma(_445, _445, _449);
            float _453 = rsqrt(_451);
            float _455 = _453 * 9.9999999747524270787835121154785e-07;
            float _457 = _443 * _455;
            float _459 = _441 * _455;
            float _461 = _445 * _455;
            _419 = _459;
            _421 = _457;
            _423 = _461;
            _463 = true;
        }
        else
        {
            float _465 = _135 * _135;
            float _467 = fma(_133, _133, _465);
            float _469 = fma(_137, _137, _467);
            float _471 = sqrt(_469);
            bool _473 = _471 >= 9.9999999747524270787835121154785e-07;
            bool _475 = isnan(_471);
            bool _477 = _473 || _475;
            bool _479 = isnan(9.9999999747524270787835121154785e-07);
            bool _481 = _477 || _479;
            if (!_481)
            {
                float _483 = _389 * _389;
                float _485 = fma(_387, _387, _483);
                float _487 = fma(_391, _391, _485);
                float _489 = sqrt(_487);
                bool _491 = _489 >= 9.9999999747524270787835121154785e-07;
                bool _493 = isnan(_489);
                bool _495 = _491 || _493;
                bool _497 = isnan(9.9999999747524270787835121154785e-07);
                bool _499 = _495 || _497;
                if (!_499)
                {
                    float _501 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _503 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _501);
                    float _505 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _503);
                    float _507 = rsqrt(_505);
                    float _509 = _507 * 9.9999999747524270787835121154785e-07;
                    float _511 = _509 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _513 = _509 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _515 = _509 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _419 = _513;
                    _421 = _511;
                    _423 = _515;
                    _463 = true;
                }
                else
                {
                    float _517 = _389 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _519 = _389 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _521 = _389 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _523 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _517);
                    float _525 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _519);
                    float _527 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _521);
                    float _529 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].z, _523);
                    float _531 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].z, _525);
                    float _533 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].z, _527);
                    float _535 = _529 * _529;
                    float _537 = fma(_531, _531, _535);
                    float _539 = fma(_533, _533, _537);
                    float _541 = rsqrt(_539);
                    float _543 = _541 * 9.9999999747524270787835121154785e-07;
                    float _545 = _529 * _543;
                    float _547 = _531 * _543;
                    float _549 = _533 * _543;
                    _419 = _545;
                    _421 = _547;
                    _423 = _549;
                    _463 = true;
                }
            }
            else
            {
                float _551 = _135 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _553 = _135 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _555 = _135 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _557 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[5].x, _551);
                float _559 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[4].x, _553);
                float _561 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[6].x, _555);
                float _563 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[5].z, _557);
                float _565 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[4].z, _559);
                float _567 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[6].z, _561);
                float _569 = _563 * _563;
                float _571 = fma(_565, _565, _569);
                float _573 = fma(_567, _567, _571);
                float _575 = rsqrt(_573);
                float _577 = _575 * 9.9999999747524270787835121154785e-07;
                float _579 = _565 * _577;
                float _581 = _563 * _577;
                float _583 = _567 * _577;
                _419 = _581;
                _421 = _579;
                _423 = _583;
            }
        }
    }
    _463 = false;
    float _585 = _419;
    float _587 = _421;
    float _589 = _423;
    bool _591 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _593 = !_591;
    float _611;
    if (!_593)
    {
        float _595 = in.m_42.x;
        float _597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _599 = _595 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _601 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _603 = _601 * _597;
        float _605 = floor(_603);
        float _607 = -_605;
        float _609 = _603 + _607;
        _611 = _609;
        _613 = true;
    }
    else
    {
        float _615 = float(_71);
        float _617 = 1.0 / _615;
        float _619 = _105 * _617;
        _611 = _619;
    }
    _613 = false;
    float _621 = _611;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _625 = _621 + _623;
    bool _627 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _629 = isnan(_621);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _641 = _621 + _639;
    bool _643 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _645 = isnan(_621);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _655;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _663 = -_637;
    float _665 = _663 + 1.0;
    float _667 = 1.0 / _661;
    bool _669 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _671 = isnan(_621);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = _653 * _665;
    float _683 = -_653;
    float _685 = _683 + 1.0;
    bool _687 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _689 = 1.0 / _657;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _691;
    float _695 = _641 * _667;
    float _697 = _679 * _685;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _703 = -_679;
    float _705 = _703 + 1.0;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _711 = fma(_701, _695, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _713 = _625 * _689;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _715;
    float _719 = in.m_40.x;
    float _721 = in.m_40.y;
    float _723 = fma(_709, _695, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _725 = fma(_693, _713, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _727 = fma(_717, _713, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _729 = _727 * _697;
    float _731 = _725 * _697;
    float _733 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[143].x, _729);
    float _735 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[143].y, _731);
    float _737 = fma(_711, _681, _733);
    float _739 = fma(_723, _681, _735);
    float _741 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[145].x, _737);
    float _743 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[145].y, _739);
    float _745 = _741 * _719;
    float _747 = _743 * _721;
    bool _749 = !_687;
    float _767;
    if (!_749)
    {
        float _751 = in.m_42.x;
        float _753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _755 = _751 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _757 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _759 = _757 * _753;
        float _761 = floor(_759);
        float _763 = -_761;
        float _765 = _759 + _763;
        _767 = _765;
        _769 = true;
    }
    else
    {
        float _771 = float(_71);
        float _773 = 1.0 / _771;
        float _775 = _105 * _773;
        _767 = _775;
    }
    _769 = false;
    float _777 = _767;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _781 = _777 + _779;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _785 = _783 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _787 = _777 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _789 = isnan(_777);
    bool _791 = _787 || _789;
    bool _793 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _795 = _791 || _793;
    float _797 = float(_795);
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _801 = _799 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _803 = _777 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _805 = isnan(_777);
    bool _807 = _803 || _805;
    bool _809 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _811 = _807 || _809;
    float _813 = float(_811);
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _815;
    bool _819 = _777 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _821 = isnan(_777);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _827 = _823 || _825;
    float _829 = float(_827);
    float _831 = 1.0 / _785;
    float _833 = -_797;
    float _835 = _833 + 1.0;
    float _837 = _813 * _835;
    float _839 = -_813;
    float _841 = _839 + 1.0;
    float _843 = 1.0 / _801;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _849 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _853 = _845 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _855 = _847 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _857 = _817 * _831;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _861 = _859 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _863 = _851 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _865 = fma(_857, _781, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _867 = _861 * _843;
    float _869 = _865 * _837;
    float _871 = -_829;
    float _873 = _871 + 1.0;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _877 = _777 + _875;
    float _879 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[115].x, _869);
    float _881 = _797 * _873;
    float _883 = fma(_867, _877, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _885 = fma(_883, _881, _879);
    float _887 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[117].x, _885);
    float _889 = _887 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_44.x = _853;
    out.m_44.y = _855;
    out.m_44.z = _863;
    out.m_44.w = _889;
    bool _891 = !_849;
    float _911;
    float _913;
    if (!_891)
    {
        float _893 = in.m_42.x;
        float _895 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _897 = float(_71);
        float _899 = _893 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _901 = fma(_899, (*spvDescriptorSet0.vp_c9)._m0[11].w, _105);
        float _903 = _901 * _895;
        float _905 = floor(_903);
        float _907 = -_905;
        float _909 = _903 + _907;
        _911 = _897;
        _913 = _909;
        _915 = true;
    }
    else
    {
        float _917 = float(_71);
        float _919 = 1.0 / _917;
        float _921 = _105 * _919;
        _911 = _917;
        _913 = _921;
    }
    _915 = false;
    float _923 = _911;
    float _925 = _913;
    float _927 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _929 = int(_927);
    float _931 = _415 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _933 = _415 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _935 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _937 = _935 != 0;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _941 = _939 != 0;
    int _943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _945 = _943 != 0;
    float _947 = _415 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _951 = _949 != 0;
    float _953 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _955 = int(_953);
    float _957 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].x, _931);
    float _959 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].x, _933);
    float _961 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].x, _947);
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _965 = _963 != 0;
    float _967 = _745 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _969 = !_937;
    int _971 = _969 ? 0 : 1;
    float _973 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _975 = float(_929);
    float _977 = 1.0 / _923;
    int _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _981 = _979 != 0;
    float _983 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    int _985 = abs(_971);
    float _987 = float(uint(_955));
    float _989 = 1.0 / _975;
    int _991 = ~_955;
    int _993 = _991 + 1;
    float _995 = float(_955);
    float _997 = 1.0 / _987;
    float _999 = _105 * _989;
    float _1001 = trunc(_999);
    int _1003 = int(_1001);
    int _1005 = as_type<int>(_997) + (-2);
    float _1007 = float(uint(_1003));
    float _1009 = float(_1003);
    float _1011 = as_type<float>(_1005) * _1007;
    bool _1013 = _1009 >= _995;
    bool _1015 = isnan(_1009);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan(_995);
    bool _1021 = _1017 || _1019;
    float _1023 = float(_1021);
    float _1025 = trunc(_1011);
    float _1027 = precise::max(_1025, 0.0);
    uint _1030 = uint(_1027);
    float _1032 = trunc(_1023);
    int _1034 = int(_1032);
    int _1036 = ~_955;
    int _1038 = _1036 + 1;
    int _1040 = _993 * int(_1030);
    int _1042 = _1040 + _1003;
    float _1044 = float(uint(_1042));
    float _1046 = as_type<float>(_1005) * _1044;
    float _1048 = in.m_42.x;
    float _1050 = in.m_42.y;
    float _1052 = in.m_42.z;
    float _1054 = in.m_42.w;
    float _1056 = trunc(_1046);
    float _1058 = precise::max(_1056, 0.0);
    uint _1060 = uint(_1058);
    bool _1062 = !_945;
    int _1064 = _1062 ? 0 : 1;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1068 = _1066 != 0;
    int _1070 = int(_1030) + int(_1060);
    bool _1072 = !_941;
    int _1074 = _1072 ? 0 : 1;
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1078 = _1076 != 0;
    int _1080 = _1038 * _1070;
    int _1082 = _1080 + _1003;
    bool _1084 = _1054 > 0.5;
    float _1086 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1088 = abs(_1074);
    float _1090 = _1050 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1092 = -_185;
    int _1094 = _1084 ? as_type<int>(_1092) : as_type<int>(_185);
    bool _1096 = uint(_1082) >= uint(_955);
    bool _1098 = !_1078;
    float _1100 = _1098 ? _185 : as_type<float>(_1094);
    float _1102 = _747 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1104 = !_1096;
    int _1106 = _1104 ? 0 : (-1);
    bool _1108 = !_965;
    float _1110 = _1108 ? 7.345489978790283203125 : 1.0;
    int _1112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1114 = _1112 != 0;
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1118 = _1116 != 0;
    float _1120 = _1110 * _1048;
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1124 = _1122 != 0;
    float _1126 = _967 * _973;
    float _1128 = floor(_1120);
    float _1130 = _1102 * _983;
    bool _1132 = !_1124;
    int _1134 = _1132 ? 0 : 1;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1138 = ~_1070;
    int _1140 = _1138 + _1106;
    int _1142 = _1140 + 1;
    bool _1144 = _1050 > 0.5;
    float _1146 = -_1136;
    float _1148 = fma(_1086, 2.0, _1146);
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1152 = _1150 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1154 = _955 * _1142;
    int _1156 = _1154 + _1003;
    float _1158 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].z, _959);
    float _1160 = 1.0 / _1152;
    float _1162 = -_1128;
    float _1164 = _1120 + _1162;
    float _1166 = -_185;
    int _1168 = _1144 ? as_type<int>(_1166) : as_type<int>(_185);
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1170;
    bool _1174 = _955 == 0;
    float _1176 = _1164 * _995;
    float _1178 = _105 * _995;
    float _1180 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].z, _957);
    int _1182 = ~_1034;
    int _1184 = _1182 + 1;
    int _1186 = _1184 + 1;
    float _1188 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].z, _961);
    float _1190 = _1178 * _977;
    bool _1192 = !_1174;
    int _1194 = _1192 ? _1156 : (-1);
    float _1196 = trunc(_1176);
    int _1198 = int(_1196);
    int _1200 = _955 + (-1);
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1204 = !_1114;
    float _1206 = _1204 ? _185 : as_type<float>(_1168);
    int _1208 = _1194 * _1186;
    int _1210 = abs(_1134);
    float _1212 = fma(_1090, -2.0, _1202);
    float _1214 = trunc(_1190);
    int _1216 = int(_1214);
    int _1218 = _1034 * _1200;
    int _1220 = _1218 + _1208;
    float _1222 = _1172 * _1160;
    bool _1224 = !_951;
    int _1226 = _1224 ? 0 : 1;
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1230 = _1228 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1232 = _1048 > 0.5;
    int _1234 = _1220 * _1088;
    int _1236 = _1198 * _1210;
    int _1238 = _1236 + _1003;
    float _1240 = -_181;
    int _1242 = _1232 ? as_type<int>(_1240) : as_type<int>(_181);
    float _1244 = 1.0 / _1230;
    bool _1246 = _1052 > 0.5;
    float _1248 = -_105;
    float _1250 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1148);
    int _1252 = abs(_1064);
    float _1254 = _1188 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1256 = _1216 * _985;
    int _1258 = _1256 + _1234;
    float _1260 = -_181;
    int _1262 = _1246 ? as_type<int>(_1260) : as_type<int>(_181);
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1266 = _1264 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1270 = _925 + _1268;
    bool _1272 = !_1068;
    float _1274 = _1272 ? _181 : as_type<float>(_1242);
    bool _1276 = !_1118;
    float _1278 = _1276 ? _181 : as_type<float>(_1262);
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1282 = abs(_1226);
    int _1284 = _1238 * _1252;
    int _1286 = _1284 + _1258;
    float _1288 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1280);
    float _1290 = _585 * _585;
    int _1292 = _1198 * _1282;
    int _1294 = _1292 + _1286;
    float _1296 = as_type<float>(_1186);
    float _1298 = _957;
    float _1300 = as_type<float>(_1252);
    if (!_965)
    {
        _1296 = _1052;
    }
    float _1302 = _1296;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1306 = _1302;
    if (!_965)
    {
        _1298 = _1052;
    }
    float _1308 = _1298;
    float _1310 = fma(_587, _587, _1290);
    float _1312 = _1308;
    if (!_965)
    {
        _1300 = _1050;
    }
    float _1314 = _1300;
    float _1316 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1304);
    float _1318 = _1314;
    if (_965)
    {
        _1306 = _1050;
    }
    float _1320 = _1306;
    float _1322 = fma(_589, _589, _1310);
    if (_965)
    {
        _1312 = _1050;
    }
    float _1324 = _1312;
    float _1326 = _1266 * _1244;
    float _1328 = float(uint(_1294));
    float _1330 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1288);
    bool _1332 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1334 = isnan(_925);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1340 = _1336 || _1338;
    float _1342 = float(_1340);
    float _1344 = rsqrt(_1322);
    if (_965)
    {
        _1318 = _1048;
    }
    float _1346 = _1318;
    float _1348 = as_type<float>(_1005) * _1328;
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1352 = _925 + _1350;
    bool _1354 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1356 = isnan(_925);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1362 = _1358 || _1360;
    float _1364 = float(_1362);
    float _1366 = -_1342;
    float _1368 = _1366 + 1.0;
    float _1370 = fma(_1222, _1352, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1372 = trunc(_1348);
    float _1374 = precise::max(_1372, 0.0);
    uint _1376 = uint(_1374);
    bool _1378 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1380 = isnan(_925);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1386 = _1382 || _1384;
    float _1388 = float(_1386);
    float _1390 = _1364 * _1368;
    float _1392 = -_1364;
    float _1394 = _1392 + 1.0;
    int _1396 = ~_955;
    int _1398 = _1396 + 1;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1402 = fma(_1326, _1270, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1404 = _1388 * _1394;
    float _1406 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1400);
    float _1408 = _1344 * _587;
    float _1410 = _1274 + 0.5;
    float _1412 = _1370 * _1404;
    float _1414 = _1344 * _585;
    float _1416 = _1344 * _589;
    float _1418 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1250);
    int _1420 = _1398 * int(_1376);
    int _1422 = _1420 + _1294;
    float _1424 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1426 = float(uint(_1422));
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1430 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1212);
    float _1432 = _1206 + (-0.5);
    float _1434 = as_type<float>(_1005) * _1426;
    float _1436 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1428);
    float _1438 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1440 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1442 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1444 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1446 = -_1432;
    float _1448 = -_1430;
    float _1450 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1448);
    float _1452 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1454 = _1416 * _1452;
    float _1456 = trunc(_1434);
    float _1458 = precise::max(_1456, 0.0);
    uint _1460 = uint(_1458);
    float _1462 = -_1440;
    float _1464 = fma(_1438, 2.0, _1462);
    float _1466 = fma(_1444, -2.0, _1442);
    float _1468 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1470 = _1414 * _1468;
    float _1472 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1474 = -_1454;
    float _1476 = fma(_1408, _1472, _1474);
    float _1478 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1480 = _1408 * _1478;
    float _1482 = -_1388;
    float _1484 = _1482 + 1.0;
    float _1486 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1488 = -_1470;
    float _1490 = fma(_1416, _1486, _1488);
    float _1492 = _1476 * _1476;
    float _1494 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1496 = -_1480;
    float _1498 = fma(_1414, _1494, _1496);
    float _1500 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1502 = ~_955;
    int _1504 = _1502 + 1;
    float _1506 = fma(_1490, _1490, _1492);
    float _1508 = float(uint(_1238));
    float _1510 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1412);
    float _1512 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1436);
    int _1514 = int(_1376) + int(_1460);
    float _1516 = _1424 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1518 = as_type<float>(_1005) * _1508;
    float _1520 = fma(_1498, _1498, _1506);
    float _1522 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1316);
    float _1524 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1406);
    float _1526 = -_105;
    float _1528 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1464);
    float _1530 = trunc(_1518);
    float _1532 = precise::max(_1530, 0.0);
    uint _1534 = uint(_1532);
    int _1536 = _1504 * _1514;
    int _1538 = _1536 + _1294;
    float _1540 = fma(_1402, _1390, _1510);
    float _1542 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1466);
    float _1544 = _1500 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1546 = _1100 + (-0.5);
    bool _1548 = uint(_1538) >= uint(_955);
    float _1550 = _1278 + 0.5;
    float _1552 = rsqrt(_1520);
    int _1554 = ~_955;
    int _1556 = _1554 + 1;
    float _1558 = -_1544;
    float _1560 = -_1542;
    float _1562 = fma(_1558, _1546, _1560);
    bool _1564 = !_1548;
    int _1566 = _1564 ? 0 : (-1);
    float _1568 = fma(_1516, _1550, _1528);
    float _1570 = _1130 * _1408;
    int _1572 = ~_1514;
    int _1574 = _1572 + _1566;
    int _1576 = _1574 + 1;
    float _1578 = _1130 * _1416;
    bool _1580 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1582 = isnan(0.5);
    bool _1584 = _1580 || _1582;
    bool _1586 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1588 = _1584 || _1586;
    int _1590 = _1556 * int(_1534);
    int _1592 = _1590 + _1238;
    float _1594 = _1180 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1596 = -_1522;
    float _1598 = _1596 + 1.0;
    float _1600 = -_1512;
    float _1602 = _1600 + 1.0;
    float _1604 = _1130 * _1414;
    float _1606 = float(uint(_1592));
    float _1608 = _1498 * _1552;
    int _1610 = _955 * _1576;
    int _1612 = _1610 + _1294;
    float _1614 = _1490 * _1552;
    float _1616 = _1476 * _1552;
    float _1618 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1620 = _1414 * _1608;
    float _1622 = fma(_1126, _1614, _1570);
    bool _1624 = !_1174;
    int _1626 = _1624 ? _1612 : (-1);
    float _1628 = _1408 * _1616;
    float _1630 = as_type<float>(_1005) * _1606;
    float _1632 = -_1620;
    float _1634 = fma(_1416, _1616, _1632);
    float _1636 = _1158 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1638 = _1626 >> 31;
    float _1640 = fma(_1126, _1608, _1578);
    float _1642 = -_1628;
    float _1644 = fma(_1414, _1614, _1642);
    float _1646 = fma(_1618, _1634, _1622);
    int _1648 = _1638 & 3;
    float _1650 = _1636 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1652 = fma(_1618, _1644, _1640);
    float _1654 = _1636 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1656 = _1626 + _1648;
    float _1658 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1650);
    float _1660 = _1254 + _1652;
    float _1662 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1654);
    float _1664 = _1594 + _1646;
    int _1666 = _1656 >> 2;
    float _1668 = -_1330;
    float _1670 = _1668 + 1.0;
    float _1672 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1662);
    float _1674 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1658);
    int _1676 = _1666 << 4;
    int _1678 = _1676 + 368;
    float _1680 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1682 = _1660 + _1680;
    float _1684 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1686 = trunc(_1630);
    float _1688 = precise::max(_1686, 0.0);
    uint _1690 = uint(_1688);
    uint _1692 = uint(int(uint(_1678) >> uint(2)));
    uint _1694 = uint(int(uint(int(_1692)) >> uint(2)));
    int _1696 = int(_1692) & 3;
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[int(_1694)][_1696];
    int _1700 = int(_1692) + 1;
    uint _1702 = uint(int(uint(_1700) >> uint(2)));
    int _1704 = _1700 & 3;
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[int(_1702)][_1704];
    float _1708 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1710 = _1664 + _1708;
    float _1712 = _1682 * _1682;
    float _1714 = -_1670;
    float _1716 = fma(_1274, _1714, _1418);
    float _1718 = fma(_1206, _1598, _1450);
    int _1720 = ~_955;
    int _1722 = _1720 + 1;
    float _1724 = fma(_1710, _1710, _1712);
    float _1726 = -_1524;
    float _1728 = _1726 + 1.0;
    int _1730 = _1678 + 8;
    uint _1732 = uint(int(uint(_1730) >> uint(2)));
    uint _1734 = uint(int(uint(int(_1732)) >> uint(2)));
    int _1736 = int(_1732) & 3;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[int(_1734)][_1736];
    int _1740 = int(_1732) + 1;
    uint _1742 = uint(int(uint(_1740) >> uint(2)));
    int _1744 = _1740 & 3;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[int(_1742)][_1744];
    float _1748 = -_1602;
    float _1750 = fma(_1278, _1748, _1568);
    float _1752 = sqrt(_1724);
    float _1754 = _1416 * _1614;
    float _1756 = fma(_1126, _1616, _1604);
    int _1758 = _1626 & 3;
    bool _1760 = _1758 != 0;
    float _1762 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _1764 = int(_1534) + int(_1690);
    float _1766 = -_1754;
    float _1768 = fma(_1408, _1608, _1766);
    float _1770 = 1.0 / _1684;
    bool _1772 = uint(_1758) >= 2u;
    float _1774 = fma(_1100, _1728, _1562);
    int _1776 = _1722 * _1764;
    int _1778 = _1776 + _1238;
    float _1780 = fma(_1618, _1768, _1756);
    float _1782 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1540);
    float _1784 = _1762 + _1684;
    int _1786 = _1772 ? 0 : 1;
    float _1788 = _1636 + _1780;
    bool _1790 = _1752 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    out.m_46.x = _1716;
    out.m_46.y = _1718;
    out.m_46.z = _1750;
    out.m_46.w = _1774;
    bool _1792 = uint(_1778) >= uint(_955);
    bool _1794 = _1758 != 3;
    bool _1796 = !_1792;
    int _1798 = _1796 ? 0 : (-1);
    float _1800 = _1784 * _1770;
    float _1802 = _1800 * 0.5;
    int _1804 = _1626 & 3;
    bool _1806 = _1804 != 0;
    int _1808 = ~_1764;
    int _1810 = _1808 + _1798;
    int _1812 = _1810 + 1;
    int _1814 = _1806 ? 0 : 1;
    bool _1816 = uint(_1758) > 1u;
    int _1818 = _955 * _1812;
    int _1820 = _1818 + _1238;
    int _1822 = ~_1814;
    int _1824 = _1822 + 1;
    int _1826 = _1824 + 1;
    int _1828 = ~_1786;
    int _1830 = _1828 + 1;
    int _1832 = _1830 + 1;
    float _1834 = _1716;
    float _1836 = _1664;
    float _1838 = _1660;
    int _1840 = _1826;
    int _1842 = _1832;
    if (!_1790)
    {
        _1834 = _1788;
    }
    float _1844 = _1834;
    bool _1846 = !_1790;
    float _1848 = _1844;
    if (!_1846)
    {
        float _1850 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1852 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1854 = _1752 + _1852;
        float _1856 = _1788 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1858 = rsqrt(_1724);
        float _1860 = _1854 * _1850;
        float _1862 = _1860 * 0.15915493667125701904296875;
        float _1864 = _1862 * 6.283185482025146484375;
        float _1866 = cos(_1864);
        float _1868 = _1862 * 6.283185482025146484375;
        float _1870 = sin(_1868);
        float _1872 = _1866 + (-1.0);
        float _1874 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1876 = fma(_1870, _1856, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1878 = fma(_1788, _1866, _1874);
        float _1880 = _1858 * _1876;
        float _1882 = fma(_1710, _1880, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1884 = fma(_1682, _1880, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1848 = _1878;
        _1836 = _1882;
        _1838 = _1884;
    }
    float _1886 = _1848;
    float _1888 = _1836;
    float _1890 = _1838;
    if (!_1816)
    {
        int _1892 = ~_1814;
        int _1894 = _1892 + 1;
        _1840 = _1894;
    }
    int _1896 = _1840;
    float _1898 = _1886 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    bool _1900 = _1758 != 3;
    float _1902 = _1886 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _1904 = abs(_1896);
    float _1906 = _1886 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1908 = _1886 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1910 = !_1760;
    int _1912 = _1910 ? 0 : 1;
    float _1914 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1902);
    float _1916 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1908);
    float _1918 = _1902;
    if (_1794)
    {
        int _1920 = ~_1786;
        int _1922 = _1920 + 1;
        _1842 = _1922;
    }
    int _1924 = _1842;
    float _1926 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1898);
    int _1928 = abs(_1912);
    float _1930 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1906);
    int _1932 = ~_1904;
    int _1934 = _1932 + 1;
    int _1936 = _1934 + 1;
    bool _1938 = !_1900;
    int _1940 = _1938 ? 0 : (-1);
    int _1942 = abs(_1924);
    int _1944 = _1936 * as_type<int>(_1706);
    int _1946 = ~_1928;
    int _1948 = _1946 + 1;
    int _1950 = _1948 + 1;
    int _1952 = abs(_1940);
    bool _1954 = !_981;
    int _1956 = _1954 ? 0 : 1;
    int _1958 = _1950 * as_type<int>(_1698);
    int _1960 = _1958 + _1944;
    int _1962 = abs(_1956);
    int _1964 = ~_1942;
    int _1966 = _1964 + 1;
    int _1968 = _1966 + 1;
    if (_1588)
    {
        _1918 = 1.0;
    }
    float _1970 = _1918;
    float _1972 = _1970;
    if (!_1588)
    {
        float _1974 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1976 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1974);
        float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1980 = _1978 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _1982 = 1.0 / _1976;
        float _1984 = 1.0 / _1980;
        float _1986 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1988 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1990 = fma(_1982, _1986, _1988);
        float _1992 = _1990 * _1984;
        float _1994 = precise::clamp(_1992, 0.0, 1.0);
        _1972 = _1994;
    }
    float _1996 = _1972;
    float _1998 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1926);
    int _2000 = ~_1952;
    int _2002 = _2000 + 1;
    int _2004 = _2002 + 1;
    int _2006 = _1968 * as_type<int>(_1738);
    int _2008 = _2006 + _1960;
    float _2010 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1914);
    float _2012 = _1998 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2014 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1930);
    int _2016 = _2004 * as_type<int>(_1746);
    int _2018 = _2016 + _2008;
    float _2020 = _2010 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2022 = _2012 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    int _2024 = ~_1962;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    float _2030 = _2012 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2032 = _2012 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2034 = _2012 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2036 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1916);
    float _2038 = _2014 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2040 = fma(_2020, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2022);
    float _2042 = fma(_2020, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2030);
    bool _2044 = !_1174;
    int _2046 = _2044 ? _1820 : (-1);
    float _2048 = fma(_2020, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2032);
    int _2050 = _2018 * _2028;
    float _2052 = fma(_2020, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2034);
    float _2054 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2040);
    float _2056 = _2036 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2058 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2042);
    float _2060 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2048);
    int _2062 = _2046 * _1962;
    int _2064 = _2062 + _2050;
    float _2066 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2052);
    float _2068 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2054);
    bool _2070 = _1996 > 0.0;
    bool _2072 = isnan(_1996);
    bool _2074 = _2070 || _2072;
    bool _2076 = isnan(0.0);
    bool _2078 = _2074 || _2076;
    float _2080 = _1996 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2082 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2058);
    float _2084 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2060);
    float _2086 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2066);
    float _2088 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2090 = _2080 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2094 = _2068 + _2082;
    float _2096 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2098 = _2084 + _2082;
    float _2100 = _2082 * 0.5;
    float _2102 = _2094 * 0.5;
    float _2104 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2106 = _2088 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2108 = _2092 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2110 = _1782 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2112 = _2098 * 0.5;
    float _2114 = fma(_2086, -0.5, _2100);
    float _2116 = float(_2064);
    out.m_48.x = _2104;
    out.m_48.y = _2106;
    out.m_48.z = _2108;
    out.m_48.w = _2110;
    out.m_33.x = _2090;
    out.gl_Position.x = _2068;
    out.gl_Position.y = _2086;
    out.gl_Position.z = _2084;
    out.gl_Position.w = _2082;
    out.m_50.x = _2102;
    out.m_50.y = _2114;
    out.m_50.z = _2112;
    out.m_50.w = _2082;
    out.m_52.x = _2116;
    if (_2078)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _2118 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2118;
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
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _915 = false;
    bool _769 = false;
    bool _613 = false;
    bool _463 = false;
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
    float _89 = as_type<float>(_87);
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2176 = as_type<float>(_87);
        out.gl_Position.z = _2176;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    int _123 = 0;
    if (_117)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2245 = as_type<float>(_127);
        out.gl_Position.z = _2245;
    }
    if (_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        _107 = _153;
    }
    float _155 = _107;
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
    float _191 = 0.0;
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
        _89 = _211;
        _189 = _221;
        _191 = _209;
    }
    float _223 = _89;
    float _225 = _189;
    float _227 = _191;
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
        float _291 = 1.0 / _285;
        float _293 = _287 * 0.693147182464599609375;
        float _295 = exp2(_289);
        float _297 = 1.0 / _293;
        float _299 = _295 + (-1.0);
        float _301 = -_299;
        float _303 = fma(_301, _297, _105);
        float _305 = _303 * _291;
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
    float _347 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _349 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _351 = fma(_333, _133, _341);
    float _353 = -_343;
    float _355 = _339 + _353;
    float _357 = fma(_333, _137, _347);
    float _359 = fma(_259, _137, _349);
    float _361 = -_351;
    float _363 = _345 + _361;
    float _365 = _355 * _355;
    float _367 = in.m_40.w;
    float _369 = -_357;
    float _371 = _359 + _369;
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
    float _397 = sqrt(_383);
    float _399 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].z, _385);
    float _401 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].z, _393);
    bool _403 = _397 >= 9.9999999747524270787835121154785e-07;
    bool _405 = isnan(_397);
    bool _407 = _403 || _405;
    bool _409 = isnan(9.9999999747524270787835121154785e-07);
    bool _411 = _407 || _409;
    float _413 = fma(_345, _367, _387);
    float _415 = fma(_339, _367, _389);
    float _417 = fma(_359, _367, _391);
    float _419 = _399;
    float _421 = _395;
    float _423 = _401;
    if (!_411)
    {
        bool _425 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _427 = !_425;
        if (!_427)
        {
            float _429 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _431 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _433 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _435 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _429);
            float _437 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _431);
            float _439 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _433);
            float _441 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _435);
            float _443 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _437);
            float _445 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _439);
            float _447 = _441 * _441;
            float _449 = fma(_443, _443, _447);
            float _451 = fma(_445, _445, _449);
            float _453 = rsqrt(_451);
            float _455 = _453 * 9.9999999747524270787835121154785e-07;
            float _457 = _443 * _455;
            float _459 = _441 * _455;
            float _461 = _445 * _455;
            _419 = _459;
            _421 = _457;
            _423 = _461;
            _463 = true;
        }
        else
        {
            float _465 = _135 * _135;
            float _467 = fma(_133, _133, _465);
            float _469 = fma(_137, _137, _467);
            float _471 = sqrt(_469);
            bool _473 = _471 >= 9.9999999747524270787835121154785e-07;
            bool _475 = isnan(_471);
            bool _477 = _473 || _475;
            bool _479 = isnan(9.9999999747524270787835121154785e-07);
            bool _481 = _477 || _479;
            if (!_481)
            {
                float _483 = _389 * _389;
                float _485 = fma(_387, _387, _483);
                float _487 = fma(_391, _391, _485);
                float _489 = sqrt(_487);
                bool _491 = _489 >= 9.9999999747524270787835121154785e-07;
                bool _493 = isnan(_489);
                bool _495 = _491 || _493;
                bool _497 = isnan(9.9999999747524270787835121154785e-07);
                bool _499 = _495 || _497;
                if (!_499)
                {
                    float _501 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _503 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _501);
                    float _505 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _503);
                    float _507 = rsqrt(_505);
                    float _509 = _507 * 9.9999999747524270787835121154785e-07;
                    float _511 = _509 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _513 = _509 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _515 = _509 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _419 = _513;
                    _421 = _511;
                    _423 = _515;
                    _463 = true;
                }
                else
                {
                    float _517 = _389 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _519 = _389 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _521 = _389 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _523 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _517);
                    float _525 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _519);
                    float _527 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _521);
                    float _529 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].z, _523);
                    float _531 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].z, _525);
                    float _533 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].z, _527);
                    float _535 = _529 * _529;
                    float _537 = fma(_531, _531, _535);
                    float _539 = fma(_533, _533, _537);
                    float _541 = rsqrt(_539);
                    float _543 = _541 * 9.9999999747524270787835121154785e-07;
                    float _545 = _529 * _543;
                    float _547 = _531 * _543;
                    float _549 = _533 * _543;
                    _419 = _545;
                    _421 = _547;
                    _423 = _549;
                    _463 = true;
                }
            }
            else
            {
                float _551 = _135 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _553 = _135 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _555 = _135 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _557 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[5].x, _551);
                float _559 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[4].x, _553);
                float _561 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[6].x, _555);
                float _563 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[5].z, _557);
                float _565 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[4].z, _559);
                float _567 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[6].z, _561);
                float _569 = _563 * _563;
                float _571 = fma(_565, _565, _569);
                float _573 = fma(_567, _567, _571);
                float _575 = rsqrt(_573);
                float _577 = _575 * 9.9999999747524270787835121154785e-07;
                float _579 = _565 * _577;
                float _581 = _563 * _577;
                float _583 = _567 * _577;
                _419 = _581;
                _421 = _579;
                _423 = _583;
            }
        }
    }
    _463 = false;
    float _585 = _419;
    float _587 = _421;
    float _589 = _423;
    bool _591 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _593 = !_591;
    float _611;
    if (!_593)
    {
        float _595 = in.m_42.x;
        float _597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _599 = _595 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _601 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _603 = _601 * _597;
        float _605 = floor(_603);
        float _607 = -_605;
        float _609 = _603 + _607;
        _611 = _609;
        _613 = true;
    }
    else
    {
        float _615 = float(_71);
        float _617 = 1.0 / _615;
        float _619 = _105 * _617;
        _611 = _619;
    }
    _613 = false;
    float _621 = _611;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _625 = _621 + _623;
    bool _627 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _629 = isnan(_621);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _641 = _621 + _639;
    bool _643 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _645 = isnan(_621);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _655;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _663 = -_637;
    float _665 = _663 + 1.0;
    float _667 = 1.0 / _661;
    bool _669 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _671 = isnan(_621);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = _653 * _665;
    float _683 = -_653;
    float _685 = _683 + 1.0;
    bool _687 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _689 = 1.0 / _657;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _691;
    float _695 = _641 * _667;
    float _697 = _679 * _685;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _703 = -_679;
    float _705 = _703 + 1.0;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _711 = fma(_701, _695, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _713 = _625 * _689;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _715;
    float _719 = in.m_40.x;
    float _721 = in.m_40.y;
    float _723 = fma(_709, _695, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _725 = fma(_693, _713, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _727 = fma(_717, _713, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _729 = _727 * _697;
    float _731 = _725 * _697;
    float _733 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[143].x, _729);
    float _735 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[143].y, _731);
    float _737 = fma(_711, _681, _733);
    float _739 = fma(_723, _681, _735);
    float _741 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[145].x, _737);
    float _743 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[145].y, _739);
    float _745 = _741 * _719;
    float _747 = _743 * _721;
    bool _749 = !_687;
    float _767;
    if (!_749)
    {
        float _751 = in.m_42.x;
        float _753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _755 = _751 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _757 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _759 = _757 * _753;
        float _761 = floor(_759);
        float _763 = -_761;
        float _765 = _759 + _763;
        _767 = _765;
        _769 = true;
    }
    else
    {
        float _771 = float(_71);
        float _773 = 1.0 / _771;
        float _775 = _105 * _773;
        _767 = _775;
    }
    _769 = false;
    float _777 = _767;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _781 = _777 + _779;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _785 = _783 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _787 = _777 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _789 = isnan(_777);
    bool _791 = _787 || _789;
    bool _793 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _795 = _791 || _793;
    float _797 = float(_795);
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _801 = _799 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _803 = _777 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _805 = isnan(_777);
    bool _807 = _803 || _805;
    bool _809 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _811 = _807 || _809;
    float _813 = float(_811);
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _815;
    bool _819 = _777 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _821 = isnan(_777);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _827 = _823 || _825;
    float _829 = float(_827);
    float _831 = 1.0 / _785;
    float _833 = -_797;
    float _835 = _833 + 1.0;
    float _837 = _813 * _835;
    float _839 = -_813;
    float _841 = _839 + 1.0;
    float _843 = 1.0 / _801;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _849 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _853 = _845 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _855 = _847 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _857 = _817 * _831;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _861 = _859 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _863 = _851 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _865 = fma(_857, _781, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _867 = _861 * _843;
    float _869 = _865 * _837;
    float _871 = -_829;
    float _873 = _871 + 1.0;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _877 = _777 + _875;
    float _879 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[115].x, _869);
    float _881 = _797 * _873;
    float _883 = fma(_867, _877, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _885 = fma(_883, _881, _879);
    float _887 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[117].x, _885);
    float _889 = _887 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_44.x = _853;
    out.m_44.y = _855;
    out.m_44.z = _863;
    out.m_44.w = _889;
    bool _891 = !_849;
    float _911;
    float _913;
    if (!_891)
    {
        float _893 = in.m_42.x;
        float _895 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _897 = float(_71);
        float _899 = _893 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _901 = fma(_899, (*spvDescriptorSet0.vp_c9)._m0[11].w, _105);
        float _903 = _901 * _895;
        float _905 = floor(_903);
        float _907 = -_905;
        float _909 = _903 + _907;
        _911 = _897;
        _913 = _909;
        _915 = true;
    }
    else
    {
        float _917 = float(_71);
        float _919 = 1.0 / _917;
        float _921 = _105 * _919;
        _911 = _917;
        _913 = _921;
    }
    _915 = false;
    float _923 = _911;
    float _925 = _913;
    float _927 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _929 = int(_927);
    float _931 = _415 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _933 = _415 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _935 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _937 = _935 != 0;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _941 = _939 != 0;
    int _943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _945 = _943 != 0;
    float _947 = _415 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _951 = _949 != 0;
    float _953 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _955 = int(_953);
    float _957 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].x, _931);
    float _959 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].x, _933);
    float _961 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].x, _947);
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _965 = _963 != 0;
    float _967 = _745 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _969 = !_937;
    int _971 = _969 ? 0 : 1;
    float _973 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _975 = float(_929);
    float _977 = 1.0 / _923;
    int _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _981 = _979 != 0;
    float _983 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    int _985 = abs(_971);
    float _987 = float(uint(_955));
    float _989 = 1.0 / _975;
    int _991 = ~_955;
    int _993 = _991 + 1;
    float _995 = float(_955);
    float _997 = 1.0 / _987;
    float _999 = _105 * _989;
    float _1001 = trunc(_999);
    int _1003 = int(_1001);
    int _1005 = as_type<int>(_997) + (-2);
    float _1007 = float(uint(_1003));
    float _1009 = float(_1003);
    float _1011 = as_type<float>(_1005) * _1007;
    bool _1013 = _1009 >= _995;
    bool _1015 = isnan(_1009);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan(_995);
    bool _1021 = _1017 || _1019;
    float _1023 = float(_1021);
    float _1025 = trunc(_1011);
    float _1027 = precise::max(_1025, 0.0);
    uint _1030 = uint(_1027);
    float _1032 = trunc(_1023);
    int _1034 = int(_1032);
    int _1036 = ~_955;
    int _1038 = _1036 + 1;
    int _1040 = _993 * int(_1030);
    int _1042 = _1040 + _1003;
    float _1044 = float(uint(_1042));
    float _1046 = as_type<float>(_1005) * _1044;
    float _1048 = in.m_42.x;
    float _1050 = in.m_42.y;
    float _1052 = in.m_42.z;
    float _1054 = in.m_42.w;
    float _1056 = trunc(_1046);
    float _1058 = precise::max(_1056, 0.0);
    uint _1060 = uint(_1058);
    bool _1062 = !_945;
    int _1064 = _1062 ? 0 : 1;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1068 = _1066 != 0;
    int _1070 = int(_1030) + int(_1060);
    bool _1072 = !_941;
    int _1074 = _1072 ? 0 : 1;
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1078 = _1076 != 0;
    int _1080 = _1038 * _1070;
    int _1082 = _1080 + _1003;
    bool _1084 = _1054 > 0.5;
    float _1086 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1088 = abs(_1074);
    float _1090 = _1050 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1092 = -_185;
    int _1094 = _1084 ? as_type<int>(_1092) : as_type<int>(_185);
    bool _1096 = uint(_1082) >= uint(_955);
    bool _1098 = !_1078;
    float _1100 = _1098 ? _185 : as_type<float>(_1094);
    float _1102 = _747 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1104 = !_1096;
    int _1106 = _1104 ? 0 : (-1);
    bool _1108 = !_965;
    float _1110 = _1108 ? 7.345489978790283203125 : 1.0;
    int _1112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1114 = _1112 != 0;
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1118 = _1116 != 0;
    float _1120 = _1110 * _1048;
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1124 = _1122 != 0;
    float _1126 = _967 * _973;
    float _1128 = floor(_1120);
    float _1130 = _1102 * _983;
    bool _1132 = !_1124;
    int _1134 = _1132 ? 0 : 1;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1138 = ~_1070;
    int _1140 = _1138 + _1106;
    int _1142 = _1140 + 1;
    bool _1144 = _1050 > 0.5;
    float _1146 = -_1136;
    float _1148 = fma(_1086, 2.0, _1146);
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1152 = _1150 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1154 = _955 * _1142;
    int _1156 = _1154 + _1003;
    float _1158 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].z, _959);
    float _1160 = 1.0 / _1152;
    float _1162 = -_1128;
    float _1164 = _1120 + _1162;
    float _1166 = -_185;
    int _1168 = _1144 ? as_type<int>(_1166) : as_type<int>(_185);
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1170;
    bool _1174 = _955 == 0;
    float _1176 = _1164 * _995;
    float _1178 = _105 * _995;
    float _1180 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].z, _957);
    int _1182 = ~_1034;
    int _1184 = _1182 + 1;
    int _1186 = _1184 + 1;
    float _1188 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].z, _961);
    float _1190 = _1178 * _977;
    bool _1192 = !_1174;
    int _1194 = _1192 ? _1156 : (-1);
    float _1196 = trunc(_1176);
    int _1198 = int(_1196);
    int _1200 = _955 + (-1);
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1204 = !_1114;
    float _1206 = _1204 ? _185 : as_type<float>(_1168);
    int _1208 = _1194 * _1186;
    int _1210 = abs(_1134);
    float _1212 = fma(_1090, -2.0, _1202);
    float _1214 = trunc(_1190);
    int _1216 = int(_1214);
    int _1218 = _1034 * _1200;
    int _1220 = _1218 + _1208;
    float _1222 = _1172 * _1160;
    bool _1224 = !_951;
    int _1226 = _1224 ? 0 : 1;
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1230 = _1228 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1232 = _1048 > 0.5;
    int _1234 = _1220 * _1088;
    int _1236 = _1198 * _1210;
    int _1238 = _1236 + _1003;
    float _1240 = -_181;
    int _1242 = _1232 ? as_type<int>(_1240) : as_type<int>(_181);
    float _1244 = 1.0 / _1230;
    bool _1246 = _1052 > 0.5;
    float _1248 = -_105;
    float _1250 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1148);
    int _1252 = abs(_1064);
    float _1254 = _1188 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1256 = _1216 * _985;
    int _1258 = _1256 + _1234;
    float _1260 = -_181;
    int _1262 = _1246 ? as_type<int>(_1260) : as_type<int>(_181);
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1266 = _1264 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1270 = _925 + _1268;
    bool _1272 = !_1068;
    float _1274 = _1272 ? _181 : as_type<float>(_1242);
    bool _1276 = !_1118;
    float _1278 = _1276 ? _181 : as_type<float>(_1262);
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1282 = abs(_1226);
    int _1284 = _1238 * _1252;
    int _1286 = _1284 + _1258;
    float _1288 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1280);
    float _1290 = _585 * _585;
    int _1292 = _1198 * _1282;
    int _1294 = _1292 + _1286;
    float _1296 = as_type<float>(_1186);
    float _1298 = _957;
    float _1300 = as_type<float>(_1252);
    if (!_965)
    {
        _1296 = _1052;
    }
    float _1302 = _1296;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1306 = _1302;
    if (!_965)
    {
        _1298 = _1052;
    }
    float _1308 = _1298;
    float _1310 = fma(_587, _587, _1290);
    float _1312 = _1308;
    if (!_965)
    {
        _1300 = _1050;
    }
    float _1314 = _1300;
    float _1316 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1304);
    float _1318 = _1314;
    if (_965)
    {
        _1306 = _1050;
    }
    float _1320 = _1306;
    float _1322 = fma(_589, _589, _1310);
    if (_965)
    {
        _1312 = _1050;
    }
    float _1324 = _1312;
    float _1326 = _1266 * _1244;
    float _1328 = float(uint(_1294));
    float _1330 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1288);
    bool _1332 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1334 = isnan(_925);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1340 = _1336 || _1338;
    float _1342 = float(_1340);
    float _1344 = rsqrt(_1322);
    if (_965)
    {
        _1318 = _1048;
    }
    float _1346 = _1318;
    float _1348 = as_type<float>(_1005) * _1328;
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1352 = _925 + _1350;
    bool _1354 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1356 = isnan(_925);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1362 = _1358 || _1360;
    float _1364 = float(_1362);
    float _1366 = -_1342;
    float _1368 = _1366 + 1.0;
    float _1370 = fma(_1222, _1352, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1372 = trunc(_1348);
    float _1374 = precise::max(_1372, 0.0);
    uint _1376 = uint(_1374);
    bool _1378 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1380 = isnan(_925);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1386 = _1382 || _1384;
    float _1388 = float(_1386);
    float _1390 = _1364 * _1368;
    float _1392 = -_1364;
    float _1394 = _1392 + 1.0;
    int _1396 = ~_955;
    int _1398 = _1396 + 1;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1402 = fma(_1326, _1270, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1404 = _1388 * _1394;
    float _1406 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1400);
    float _1408 = _1344 * _587;
    float _1410 = _1274 + 0.5;
    float _1412 = _1370 * _1404;
    float _1414 = _1344 * _585;
    float _1416 = _1344 * _589;
    float _1418 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1250);
    int _1420 = _1398 * int(_1376);
    int _1422 = _1420 + _1294;
    float _1424 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1426 = float(uint(_1422));
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1430 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1212);
    float _1432 = _1206 + (-0.5);
    float _1434 = as_type<float>(_1005) * _1426;
    float _1436 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1428);
    float _1438 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1440 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1442 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1444 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1446 = -_1432;
    float _1448 = -_1430;
    float _1450 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1448);
    float _1452 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1454 = _1416 * _1452;
    float _1456 = trunc(_1434);
    float _1458 = precise::max(_1456, 0.0);
    uint _1460 = uint(_1458);
    float _1462 = -_1440;
    float _1464 = fma(_1438, 2.0, _1462);
    float _1466 = fma(_1444, -2.0, _1442);
    float _1468 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1470 = _1414 * _1468;
    float _1472 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1474 = -_1454;
    float _1476 = fma(_1408, _1472, _1474);
    float _1478 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1480 = _1408 * _1478;
    float _1482 = -_1388;
    float _1484 = _1482 + 1.0;
    float _1486 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1488 = -_1470;
    float _1490 = fma(_1416, _1486, _1488);
    float _1492 = _1476 * _1476;
    float _1494 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1496 = -_1480;
    float _1498 = fma(_1414, _1494, _1496);
    float _1500 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1502 = ~_955;
    int _1504 = _1502 + 1;
    float _1506 = fma(_1490, _1490, _1492);
    float _1508 = float(uint(_1238));
    float _1510 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1412);
    float _1512 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1436);
    int _1514 = int(_1376) + int(_1460);
    float _1516 = _1424 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1518 = as_type<float>(_1005) * _1508;
    float _1520 = fma(_1498, _1498, _1506);
    float _1522 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1316);
    float _1524 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1406);
    float _1526 = -_105;
    float _1528 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1464);
    float _1530 = trunc(_1518);
    float _1532 = precise::max(_1530, 0.0);
    uint _1534 = uint(_1532);
    int _1536 = _1504 * _1514;
    int _1538 = _1536 + _1294;
    float _1540 = fma(_1402, _1390, _1510);
    float _1542 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1466);
    float _1544 = _1500 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1546 = _1100 + (-0.5);
    bool _1548 = uint(_1538) >= uint(_955);
    float _1550 = _1278 + 0.5;
    float _1552 = rsqrt(_1520);
    int _1554 = ~_955;
    int _1556 = _1554 + 1;
    float _1558 = -_1544;
    float _1560 = -_1542;
    float _1562 = fma(_1558, _1546, _1560);
    bool _1564 = !_1548;
    int _1566 = _1564 ? 0 : (-1);
    float _1568 = fma(_1516, _1550, _1528);
    float _1570 = _1130 * _1408;
    int _1572 = ~_1514;
    int _1574 = _1572 + _1566;
    int _1576 = _1574 + 1;
    float _1578 = _1130 * _1416;
    bool _1580 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1582 = isnan(0.5);
    bool _1584 = _1580 || _1582;
    bool _1586 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1588 = _1584 || _1586;
    int _1590 = _1556 * int(_1534);
    int _1592 = _1590 + _1238;
    float _1594 = _1180 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1596 = -_1522;
    float _1598 = _1596 + 1.0;
    float _1600 = -_1512;
    float _1602 = _1600 + 1.0;
    float _1604 = _1130 * _1414;
    float _1606 = float(uint(_1592));
    float _1608 = _1498 * _1552;
    int _1610 = _955 * _1576;
    int _1612 = _1610 + _1294;
    float _1614 = _1490 * _1552;
    float _1616 = _1476 * _1552;
    float _1618 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1620 = _1414 * _1608;
    float _1622 = fma(_1126, _1614, _1570);
    bool _1624 = !_1174;
    int _1626 = _1624 ? _1612 : (-1);
    float _1628 = _1408 * _1616;
    float _1630 = as_type<float>(_1005) * _1606;
    float _1632 = -_1620;
    float _1634 = fma(_1416, _1616, _1632);
    float _1636 = _1158 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1638 = _1626 >> 31;
    float _1640 = fma(_1126, _1608, _1578);
    float _1642 = -_1628;
    float _1644 = fma(_1414, _1614, _1642);
    float _1646 = fma(_1618, _1634, _1622);
    int _1648 = _1638 & 3;
    float _1650 = _1636 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1652 = fma(_1618, _1644, _1640);
    float _1654 = _1636 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1656 = _1626 + _1648;
    float _1658 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1650);
    float _1660 = _1254 + _1652;
    float _1662 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1654);
    float _1664 = _1594 + _1646;
    int _1666 = _1656 >> 2;
    float _1668 = -_1330;
    float _1670 = _1668 + 1.0;
    float _1672 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1662);
    float _1674 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1658);
    int _1676 = _1666 << 4;
    int _1678 = _1676 + 368;
    float _1680 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1682 = _1660 + _1680;
    float _1684 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1686 = trunc(_1630);
    float _1688 = precise::max(_1686, 0.0);
    uint _1690 = uint(_1688);
    uint _1692 = uint(int(uint(_1678) >> uint(2)));
    uint _1694 = uint(int(uint(int(_1692)) >> uint(2)));
    int _1696 = int(_1692) & 3;
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[int(_1694)][_1696];
    int _1700 = int(_1692) + 1;
    uint _1702 = uint(int(uint(_1700) >> uint(2)));
    int _1704 = _1700 & 3;
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[int(_1702)][_1704];
    float _1708 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1710 = _1664 + _1708;
    float _1712 = _1682 * _1682;
    float _1714 = -_1670;
    float _1716 = fma(_1274, _1714, _1418);
    float _1718 = fma(_1206, _1598, _1450);
    int _1720 = ~_955;
    int _1722 = _1720 + 1;
    float _1724 = fma(_1710, _1710, _1712);
    float _1726 = -_1524;
    float _1728 = _1726 + 1.0;
    int _1730 = _1678 + 8;
    uint _1732 = uint(int(uint(_1730) >> uint(2)));
    uint _1734 = uint(int(uint(int(_1732)) >> uint(2)));
    int _1736 = int(_1732) & 3;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[int(_1734)][_1736];
    int _1740 = int(_1732) + 1;
    uint _1742 = uint(int(uint(_1740) >> uint(2)));
    int _1744 = _1740 & 3;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[int(_1742)][_1744];
    float _1748 = -_1602;
    float _1750 = fma(_1278, _1748, _1568);
    float _1752 = sqrt(_1724);
    float _1754 = _1416 * _1614;
    float _1756 = fma(_1126, _1616, _1604);
    int _1758 = _1626 & 3;
    bool _1760 = _1758 != 0;
    float _1762 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _1764 = int(_1534) + int(_1690);
    float _1766 = -_1754;
    float _1768 = fma(_1408, _1608, _1766);
    float _1770 = 1.0 / _1684;
    bool _1772 = uint(_1758) >= 2u;
    float _1774 = fma(_1100, _1728, _1562);
    int _1776 = _1722 * _1764;
    int _1778 = _1776 + _1238;
    float _1780 = fma(_1618, _1768, _1756);
    float _1782 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1540);
    float _1784 = _1762 + _1684;
    int _1786 = _1772 ? 0 : 1;
    float _1788 = _1636 + _1780;
    bool _1790 = _1752 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    out.m_46.x = _1716;
    out.m_46.y = _1718;
    out.m_46.z = _1750;
    out.m_46.w = _1774;
    bool _1792 = uint(_1778) >= uint(_955);
    bool _1794 = _1758 != 3;
    bool _1796 = !_1792;
    int _1798 = _1796 ? 0 : (-1);
    float _1800 = _1784 * _1770;
    float _1802 = _1800 * 0.5;
    int _1804 = _1626 & 3;
    bool _1806 = _1804 != 0;
    int _1808 = ~_1764;
    int _1810 = _1808 + _1798;
    int _1812 = _1810 + 1;
    int _1814 = _1806 ? 0 : 1;
    bool _1816 = uint(_1758) > 1u;
    int _1818 = _955 * _1812;
    int _1820 = _1818 + _1238;
    int _1822 = ~_1814;
    int _1824 = _1822 + 1;
    int _1826 = _1824 + 1;
    int _1828 = ~_1786;
    int _1830 = _1828 + 1;
    int _1832 = _1830 + 1;
    float _1834 = _1716;
    float _1836 = _1664;
    float _1838 = _1660;
    int _1840 = _1826;
    int _1842 = _1832;
    if (!_1790)
    {
        _1834 = _1788;
    }
    float _1844 = _1834;
    bool _1846 = !_1790;
    float _1848 = _1844;
    if (!_1846)
    {
        float _1850 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1852 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1854 = _1752 + _1852;
        float _1856 = _1788 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1858 = rsqrt(_1724);
        float _1860 = _1854 * _1850;
        float _1862 = _1860 * 0.15915493667125701904296875;
        float _1864 = _1862 * 6.283185482025146484375;
        float _1866 = cos(_1864);
        float _1868 = _1862 * 6.283185482025146484375;
        float _1870 = sin(_1868);
        float _1872 = _1866 + (-1.0);
        float _1874 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1876 = fma(_1870, _1856, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1878 = fma(_1788, _1866, _1874);
        float _1880 = _1858 * _1876;
        float _1882 = fma(_1710, _1880, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1884 = fma(_1682, _1880, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1848 = _1878;
        _1836 = _1882;
        _1838 = _1884;
    }
    float _1886 = _1848;
    float _1888 = _1836;
    float _1890 = _1838;
    if (!_1816)
    {
        int _1892 = ~_1814;
        int _1894 = _1892 + 1;
        _1840 = _1894;
    }
    int _1896 = _1840;
    float _1898 = _1886 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    bool _1900 = _1758 != 3;
    float _1902 = _1886 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _1904 = abs(_1896);
    float _1906 = _1886 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1908 = _1886 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1910 = !_1760;
    int _1912 = _1910 ? 0 : 1;
    float _1914 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1902);
    float _1916 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1908);
    float _1918 = _1902;
    if (_1794)
    {
        int _1920 = ~_1786;
        int _1922 = _1920 + 1;
        _1842 = _1922;
    }
    int _1924 = _1842;
    float _1926 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1898);
    int _1928 = abs(_1912);
    float _1930 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1906);
    int _1932 = ~_1904;
    int _1934 = _1932 + 1;
    int _1936 = _1934 + 1;
    bool _1938 = !_1900;
    int _1940 = _1938 ? 0 : (-1);
    int _1942 = abs(_1924);
    int _1944 = _1936 * as_type<int>(_1706);
    int _1946 = ~_1928;
    int _1948 = _1946 + 1;
    int _1950 = _1948 + 1;
    int _1952 = abs(_1940);
    bool _1954 = !_981;
    int _1956 = _1954 ? 0 : 1;
    int _1958 = _1950 * as_type<int>(_1698);
    int _1960 = _1958 + _1944;
    int _1962 = abs(_1956);
    int _1964 = ~_1942;
    int _1966 = _1964 + 1;
    int _1968 = _1966 + 1;
    if (_1588)
    {
        _1918 = 1.0;
    }
    float _1970 = _1918;
    float _1972 = _1970;
    if (!_1588)
    {
        float _1974 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1976 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1974);
        float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1980 = _1978 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _1982 = 1.0 / _1976;
        float _1984 = 1.0 / _1980;
        float _1986 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1988 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1990 = fma(_1982, _1986, _1988);
        float _1992 = _1990 * _1984;
        float _1994 = precise::clamp(_1992, 0.0, 1.0);
        _1972 = _1994;
    }
    float _1996 = _1972;
    float _1998 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1926);
    int _2000 = ~_1952;
    int _2002 = _2000 + 1;
    int _2004 = _2002 + 1;
    int _2006 = _1968 * as_type<int>(_1738);
    int _2008 = _2006 + _1960;
    float _2010 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1914);
    float _2012 = _1998 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2014 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1930);
    int _2016 = _2004 * as_type<int>(_1746);
    int _2018 = _2016 + _2008;
    float _2020 = _2010 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2022 = _2012 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    int _2024 = ~_1962;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    float _2030 = _2012 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2032 = _2012 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2034 = _2012 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2036 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1916);
    float _2038 = _2014 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2040 = fma(_2020, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2022);
    float _2042 = fma(_2020, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2030);
    bool _2044 = !_1174;
    int _2046 = _2044 ? _1820 : (-1);
    float _2048 = fma(_2020, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2032);
    int _2050 = _2018 * _2028;
    float _2052 = fma(_2020, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2034);
    float _2054 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2040);
    float _2056 = _2036 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2058 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2042);
    float _2060 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2048);
    int _2062 = _2046 * _1962;
    int _2064 = _2062 + _2050;
    float _2066 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2052);
    float _2068 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2054);
    bool _2070 = _1996 > 0.0;
    bool _2072 = isnan(_1996);
    bool _2074 = _2070 || _2072;
    bool _2076 = isnan(0.0);
    bool _2078 = _2074 || _2076;
    float _2080 = _1996 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2082 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2058);
    float _2084 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2060);
    float _2086 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2066);
    float _2088 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2090 = _2080 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2094 = _2068 + _2082;
    float _2096 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2098 = _2084 + _2082;
    float _2100 = _2082 * 0.5;
    float _2102 = _2094 * 0.5;
    float _2104 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2106 = _2088 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2108 = _2092 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2110 = _1782 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2112 = _2098 * 0.5;
    float _2114 = fma(_2086, -0.5, _2100);
    float _2116 = float(_2064);
    out.m_48.x = _2104;
    out.m_48.y = _2106;
    out.m_48.z = _2108;
    out.m_48.w = _2110;
    out.m_33.x = _2090;
    out.gl_Position.x = _2068;
    out.gl_Position.y = _2086;
    out.gl_Position.z = _2084;
    out.gl_Position.w = _2082;
    out.m_50.x = _2102;
    out.m_50.y = _2114;
    out.m_50.z = _2112;
    out.m_50.w = _2082;
    out.m_52.x = _2116;
    if (_2078)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _2118 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2118;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

