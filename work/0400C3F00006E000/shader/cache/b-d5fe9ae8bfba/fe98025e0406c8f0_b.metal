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
    float4 m_46 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_50 [[user(locn4)]];
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
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _707 = false;
    bool _601 = false;
    bool _451 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _64 = in.m_30.w;
    float _66 = trunc(_64);
    int _69 = int(_66);
    bool _73 = _69 >= 1;
    float _75 = 0.0;
    if (!_73)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _77 = _75;
    float _79 = _77;
    if (!_73)
    {
        out.m_33.x = 0.0;
    }
    int _81 = 0;
    if (!_73)
    {
        float _83 = _77 * 5.0;
        _81 = as_type<int>(_83);
    }
    int _85 = _81;
    int _87 = _85;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1997 = as_type<float>(_85);
        out.gl_Position.z = _1997;
    }
    if (!_73)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _89 = in.m_35.w;
    bool _91 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _99 = _95 || _97;
    float _101 = -_89;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_99)
    {
        float _105 = float(_69);
        _79 = _105;
    }
    float _107 = _79;
    bool _109 = _103 >= _107;
    bool _111 = !_99;
    bool _113 = _109 || _111;
    float _115 = _107;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (_113)
    {
        out.m_33.x = 0.0;
    }
    if (_113)
    {
        float _121 = _117 * 5.0;
        _87 = as_type<int>(_121);
    }
    int _123 = _87;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2067 = as_type<float>(_123);
        out.gl_Position.z = _2067;
    }
    if (_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_35.x;
    float _127 = in.m_35.y;
    float _129 = in.m_35.z;
    float _131 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _153 = 0.0;
    float _155 = _151;
    if (!_141)
    {
        float _157 = _103 * _103;
        float _159 = _157 * 0.5;
        _153 = _159;
    }
    float _161 = _153;
    if (!_141)
    {
        float _163 = _151 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _155 = _163;
    }
    float _165 = _155;
    bool _167 = !_141;
    float _169 = _165;
    float _171 = 0.0;
    if (!_167)
    {
        float _173 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _175 = log2(_173);
        float _177 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _179 = _177 + 1.0;
        float _181 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _183 = _131 * _175;
        float _185 = 1.0 / _179;
        float _187 = _181 * 0.693147182464599609375;
        float _189 = exp2(_183);
        float _191 = 1.0 / _187;
        float _193 = _189 + (-1.0);
        float _195 = -_193;
        float _197 = fma(_195, _191, _131);
        float _199 = _197 * _185;
        float _201 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _169 = _201;
        _171 = _189;
        _119 = _191;
    }
    float _203 = _169;
    float _205 = _171;
    float _207 = _119;
    bool _209 = !_141;
    float _211 = _207;
    float _213 = _205;
    if (!_209)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = 1.0 / _221;
        float _225 = _131 * _217;
        float _227 = exp2(_225);
        float _229 = -_227;
        float _231 = _229 + 1.0;
        float _233 = _231 * _223;
        _211 = _221;
        _145 = _233;
    }
    float _235 = _211;
    float _237 = _145;
    float _239 = _235;
    if (!_141)
    {
        _239 = _103;
    }
    float _241 = _239;
    float _243 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _245 = _241;
    if (!_141)
    {
        float _247 = _161 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _247;
    }
    float _249 = _213;
    bool _251 = !_141;
    float _253 = _249;
    if (!_251)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = _103 * _257;
        float _267 = 1.0 / _261;
        float _269 = _263 * 0.693147182464599609375;
        float _271 = exp2(_265);
        float _273 = 1.0 / _269;
        float _275 = _271 + (-1.0);
        float _277 = -_275;
        float _279 = fma(_277, _273, _103);
        float _281 = _279 * _267;
        float _283 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _253 = _283;
    }
    float _285 = _253;
    bool _287 = !_141;
    if (!_287)
    {
        float _289 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _291 = log2(_289);
        float _293 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _295 = _293 + 1.0;
        float _297 = 1.0 / _295;
        float _299 = _103 * _291;
        float _301 = exp2(_299);
        float _303 = -_301;
        float _305 = _303 + 1.0;
        float _307 = _305 * _297;
        _245 = _307;
    }
    float _309 = _245;
    float _311 = _285 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _313 = fma(_237, _127, _243);
    float _315 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _317 = _285 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _319 = fma(_309, _127, _311);
    float _321 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _323 = _285 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _325 = fma(_237, _125, _315);
    float _327 = fma(_309, _125, _317);
    float _329 = -_319;
    float _331 = _313 + _329;
    float _333 = fma(_237, _129, _321);
    float _335 = fma(_309, _129, _323);
    float _337 = -_327;
    float _339 = _325 + _337;
    float _341 = _331 * _331;
    float _343 = in.m_37.w;
    float _345 = -_335;
    float _347 = _333 + _345;
    float _349 = _331 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _351 = fma(_339, _339, _341);
    float _353 = _331 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _355 = _331 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _357 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[4].x, _349);
    float _359 = fma(_347, _347, _351);
    float _361 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[5].x, _353);
    float _363 = in.m_30.x;
    float _365 = in.m_30.y;
    float _367 = in.m_30.z;
    float _369 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[6].x, _355);
    float _371 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[4].z, _357);
    float _373 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[5].z, _361);
    float _375 = sqrt(_359);
    float _377 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[6].z, _369);
    bool _379 = _375 >= 9.9999999747524270787835121154785e-07;
    bool _381 = isnan(_375);
    bool _383 = _379 || _381;
    bool _385 = isnan(9.9999999747524270787835121154785e-07);
    bool _387 = _383 || _385;
    float _389 = fma(_325, _343, _363);
    float _391 = fma(_313, _343, _365);
    float _393 = fma(_333, _343, _367);
    float _395 = _369;
    float _397 = _343;
    float _399 = _371;
    if (_387)
    {
        _395 = _371;
    }
    float _401 = _395;
    float _403 = _401;
    if (_387)
    {
        _397 = _373;
    }
    float _405 = _397;
    float _407 = _405;
    if (_387)
    {
        _399 = _377;
    }
    float _409 = _399;
    float _411 = _409;
    if (!_387)
    {
        bool _413 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _415 = !_413;
        if (!_415)
        {
            float _417 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _419 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _421 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _423 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _417);
            float _425 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _419);
            float _427 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _421);
            float _429 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _423);
            float _431 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _425);
            float _433 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _427);
            float _435 = _429 * _429;
            float _437 = fma(_431, _431, _435);
            float _439 = fma(_433, _433, _437);
            float _441 = rsqrt(_439);
            float _443 = _441 * 9.9999999747524270787835121154785e-07;
            float _445 = _431 * _443;
            float _447 = _429 * _443;
            float _449 = _433 * _443;
            _407 = _447;
            _403 = _445;
            _411 = _449;
            _451 = true;
        }
        else
        {
            float _453 = _127 * _127;
            float _455 = fma(_125, _125, _453);
            float _457 = fma(_129, _129, _455);
            float _459 = sqrt(_457);
            bool _461 = _459 >= 9.9999999747524270787835121154785e-07;
            bool _463 = isnan(_459);
            bool _465 = _461 || _463;
            bool _467 = isnan(9.9999999747524270787835121154785e-07);
            bool _469 = _465 || _467;
            if (!_469)
            {
                float _471 = _365 * _365;
                float _473 = fma(_363, _363, _471);
                float _475 = fma(_367, _367, _473);
                float _477 = sqrt(_475);
                bool _479 = _477 >= 9.9999999747524270787835121154785e-07;
                bool _481 = isnan(_477);
                bool _483 = _479 || _481;
                bool _485 = isnan(9.9999999747524270787835121154785e-07);
                bool _487 = _483 || _485;
                if (!_487)
                {
                    float _489 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _491 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _489);
                    float _493 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _491);
                    float _495 = rsqrt(_493);
                    float _497 = _495 * 9.9999999747524270787835121154785e-07;
                    float _499 = _497 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _501 = _497 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _503 = _497 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _407 = _501;
                    _403 = _499;
                    _411 = _503;
                    _451 = true;
                }
                else
                {
                    float _505 = _365 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _507 = _365 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _509 = _365 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _511 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].x, _505);
                    float _513 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].x, _507);
                    float _515 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].x, _509);
                    float _517 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[5].z, _511);
                    float _519 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[4].z, _513);
                    float _521 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[6].z, _515);
                    float _523 = _517 * _517;
                    float _525 = fma(_519, _519, _523);
                    float _527 = fma(_521, _521, _525);
                    float _529 = rsqrt(_527);
                    float _531 = _529 * 9.9999999747524270787835121154785e-07;
                    float _533 = _519 * _531;
                    float _535 = _517 * _531;
                    float _537 = _521 * _531;
                    _407 = _535;
                    _403 = _533;
                    _411 = _537;
                    _451 = true;
                }
            }
            else
            {
                float _539 = _127 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _541 = _127 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _543 = _127 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _545 = fma(_125, (*spvDescriptorSet0.vp_c10)._m0[5].x, _539);
                float _547 = fma(_125, (*spvDescriptorSet0.vp_c10)._m0[4].x, _541);
                float _549 = fma(_125, (*spvDescriptorSet0.vp_c10)._m0[6].x, _543);
                float _551 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[5].z, _545);
                float _553 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[4].z, _547);
                float _555 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[6].z, _549);
                float _557 = _551 * _551;
                float _559 = fma(_553, _553, _557);
                float _561 = fma(_555, _555, _559);
                float _563 = rsqrt(_561);
                float _565 = _563 * 9.9999999747524270787835121154785e-07;
                float _567 = _553 * _565;
                float _569 = _551 * _565;
                float _571 = _555 * _565;
                _407 = _569;
                _403 = _567;
                _411 = _571;
            }
        }
    }
    _451 = false;
    float _573 = _407;
    float _575 = _403;
    float _577 = _411;
    bool _579 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _581 = !_579;
    float _599;
    if (!_581)
    {
        float _583 = in.m_39.x;
        float _585 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _587 = _583 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _589 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _591 = _589 * _585;
        float _593 = floor(_591);
        float _595 = -_593;
        float _597 = _591 + _595;
        _599 = _597;
        _601 = true;
    }
    else
    {
        float _603 = float(_69);
        float _605 = 1.0 / _603;
        float _607 = _103 * _605;
        _599 = _607;
    }
    _601 = false;
    float _609 = _599;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _613 = _609 + _611;
    bool _615 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _617 = isnan(_609);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _627;
    float _631 = -_625;
    float _633 = _631 + 1.0;
    bool _635 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _637 = isnan(_609);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _647;
    bool _651 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _653 = 1.0 / _629;
    float _655 = _645 * _633;
    float _657 = -_645;
    float _659 = _657 + 1.0;
    float _661 = _613 * _653;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _663;
    float _667 = fma(_649, _661, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _669 = fma(_665, _661, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _671 = _667 * _655;
    float _673 = _669 * _655;
    float _675 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[143].x, _671);
    float _677 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[143].y, _673);
    float _679 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[144].x, _675);
    float _681 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[144].y, _677);
    bool _683 = !_651;
    float _703;
    float _705;
    if (!_683)
    {
        float _685 = in.m_39.x;
        float _687 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _689 = float(_69);
        float _691 = _685 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _693 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _695 = _693 * _687;
        float _697 = floor(_695);
        float _699 = -_697;
        float _701 = _695 + _699;
        _703 = _689;
        _705 = _701;
        _707 = true;
    }
    else
    {
        float _709 = float(_69);
        float _711 = 1.0 / _709;
        float _713 = _103 * _711;
        _703 = _709;
        _705 = _713;
    }
    _707 = false;
    float _715 = _703;
    float _717 = _705;
    float _719 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _721 = int(_719);
    float _723 = in.m_39.x;
    float _725 = _391 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _729 = _727 != 0;
    float _731 = as_type<float>(int(gl_VertexIndex));
    float _733 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _735 = int(_733);
    bool _737 = !_729;
    float _739 = _737 ? 1.2345600128173828125 : 1.0;
    float _741 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].x, _725);
    float _743 = float(_721);
    float _745 = 1.0 / _715;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _749 = _743;
    if (!_729)
    {
        float _751 = in.m_39.y;
        _747 = _751;
    }
    float _753 = _747;
    float _755 = float(uint(_735));
    float _757 = 1.0 / _743;
    float _759 = 1.0 / _755;
    float _761 = _103 * _757;
    if (!_729)
    {
        _749 = _753;
    }
    float _763 = _749;
    float _765 = trunc(_761);
    int _767 = int(_765);
    float _769 = _763;
    int _771 = as_type<int>(_753);
    if (_729)
    {
        float _773 = in.m_39.x;
        float _775 = in.m_39.y;
        _769 = _773;
        _771 = as_type<int>(_775);
    }
    float _777 = _769;
    int _779 = _771;
    int _781 = as_type<int>(_759) + (-2);
    int _783 = ~_735;
    int _785 = _783 + 1;
    float _787 = float(uint(_767));
    float _789 = as_type<float>(_781) * _787;
    float _791 = trunc(_789);
    float _793 = precise::max(_791, 0.0);
    uint _796 = uint(_793);
    float _798 = float(_735);
    int _800 = _785 * int(_796);
    int _802 = _800 + _767;
    float _804 = float(uint(_802));
    float _806 = as_type<float>(_781) * _804;
    bool _808 = !_729;
    float _810 = _808 ? as_type<float>(_779) : _723;
    int _812 = ~_735;
    int _814 = _812 + 1;
    float _816 = trunc(_806);
    float _818 = precise::max(_816, 0.0);
    uint _820 = uint(_818);
    float _822 = _810 * _739;
    float _824 = float(_767);
    int _826 = int(_796) + int(_820);
    float _828 = floor(_822);
    bool _830 = _824 >= _798;
    bool _832 = isnan(_824);
    bool _834 = _830 || _832;
    bool _836 = isnan(_798);
    bool _838 = _834 || _836;
    float _840 = float(_838);
    int _842 = _814 * _826;
    int _844 = _842 + _767;
    bool _846 = uint(_844) >= uint(_735);
    float _848 = trunc(_840);
    int _850 = int(_848);
    bool _852 = !_846;
    int _854 = _852 ? 0 : (-1);
    int _856 = as_type<int>(_731) & 1;
    bool _858 = _856 != 0;
    int _860 = as_type<int>(_731) & 2;
    bool _862 = _860 != 0;
    int _864 = ~_826;
    int _866 = _864 + _854;
    int _868 = _866 + 1;
    float _870 = -_828;
    float _872 = _822 + _870;
    bool _874 = _735 == 0;
    int _876 = _735 * _868;
    int _878 = _876 + _767;
    int _880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _882 = _880 != 0;
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _886 = _884 != 0;
    float _888 = _798 * _872;
    float _890 = _103 * _798;
    int _892 = ~_850;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    bool _898 = !_874;
    int _900 = _898 ? _878 : (-1);
    bool _902 = !_858;
    float _904 = _902 ? (-0.5) : 0.5;
    float _906 = trunc(_888);
    int _908 = int(_906);
    bool _910 = !_862;
    float _912 = _910 ? (-0.5) : 0.5;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _916 = _914 != 0;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _920 = _918 != 0;
    float _922 = _890 * _745;
    int _924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _926 = _924 != 0;
    int _928 = _896 * _900;
    int _930 = _735 + (-1);
    float _932 = trunc(_922);
    int _934 = int(_932);
    bool _936 = !_926;
    int _938 = _936 ? 0 : 1;
    bool _940 = !_920;
    int _942 = _940 ? 0 : 1;
    int _944 = _850 * _930;
    int _946 = _944 + _928;
    bool _948 = !_916;
    int _950 = _948 ? 0 : 1;
    int _952 = abs(_938);
    bool _954 = !_882;
    int _956 = _954 ? 0 : 1;
    int _958 = abs(_942);
    int _960 = abs(_950);
    int _962 = _946 * _958;
    bool _964 = !_886;
    int _966 = _964 ? 0 : 1;
    int _968 = abs(_956);
    int _970 = _908 * _952;
    int _972 = _970 + _767;
    int _974 = abs(_966);
    int _976 = _934 * _960;
    int _978 = _976 + _962;
    int _980 = ~_735;
    int _982 = _980 + 1;
    int _984 = _972 * _968;
    int _986 = _984 + _978;
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _990 = _988 != 0;
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _994 = _992 != 0;
    int _996 = _908 * _974;
    int _998 = _996 + _986;
    int _1000 = ~_735;
    int _1002 = _1000 + 1;
    int _1004 = ~_735;
    int _1006 = _1004 + 1;
    float _1008 = float(uint(_998));
    float _1010 = as_type<float>(_781) * _1008;
    float _1012 = trunc(_1010);
    float _1014 = precise::max(_1012, 0.0);
    uint _1016 = uint(_1014);
    int _1018 = _1002 * int(_1016);
    int _1020 = _1018 + _998;
    float _1022 = float(uint(_1020));
    float _1024 = as_type<float>(_781) * _1022;
    float _1026 = trunc(_1024);
    float _1028 = precise::max(_1026, 0.0);
    uint _1030 = uint(_1028);
    int _1032 = int(_1016) + int(_1030);
    float _1034 = in.m_39.w;
    int _1036 = _982 * _1032;
    int _1038 = _1036 + _998;
    bool _1040 = uint(_1038) >= uint(_735);
    bool _1042 = !_1040;
    int _1044 = _1042 ? 0 : (-1);
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1048 = _1046 != 0;
    float _1050 = _391 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1052 = ~_1032;
    int _1054 = _1052 + _1044;
    int _1056 = _1054 + 1;
    float _1058 = in.m_37.x;
    float _1060 = in.m_37.y;
    float _1062 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1050);
    int _1064 = _735 * _1056;
    int _1066 = _1064 + _998;
    bool _1068 = _1034 > 0.5;
    float _1070 = _391 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1072 = !_874;
    int _1074 = _1072 ? _1066 : (-1);
    float _1076 = float(uint(_972));
    float _1078 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1070);
    int _1080 = _1074 >> 31;
    int _1082 = _1074 & 3;
    bool _1084 = _1082 != 0;
    float _1086 = as_type<float>(_781) * _1076;
    int _1088 = _1080 & 3;
    float _1090 = trunc(_1086);
    float _1092 = precise::max(_1090, 0.0);
    uint _1094 = uint(_1092);
    int _1096 = _1074 + _1088;
    int _1098 = _1084 ? 0 : 1;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1102 = _1100 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1104 = _1096 >> 2;
    float _1106 = _679 * _1058;
    bool _1108 = uint(_1082) >= 2u;
    float _1110 = 1.0 / _1102;
    int _1112 = _1104 << 4;
    int _1114 = _1112 + 512;
    float _1116 = _681 * _1060;
    int _1118 = _1108 ? 0 : 1;
    uint _1120 = uint(int(uint(_1114) >> uint(2)));
    uint _1122 = uint(int(uint(int(_1120)) >> uint(2)));
    int _1124 = int(_1120) & 3;
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[int(_1122)][_1124];
    int _1128 = int(_1120) + 1;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    int _1132 = _1128 & 3;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[int(_1130)][_1132];
    bool _1136 = _1082 != 3;
    int _1138 = _1006 * int(_1094);
    int _1140 = _1138 + _972;
    int _1142 = ~_1118;
    int _1144 = _1142 + 1;
    int _1146 = _1144 + 1;
    float _1148 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1078);
    float _1150 = _1116 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1152 = float(uint(_1140));
    int _1154 = ~_1098;
    int _1156 = _1154 + 1;
    int _1158 = _1156 + 1;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1162 = _1160 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1164;
    float _1168 = as_type<float>(_781) * _1152;
    float _1170 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1062);
    int _1172 = _1146;
    int _1174 = _1158;
    if (_1136)
    {
        int _1176 = ~_1118;
        int _1178 = _1176 + 1;
        _1172 = _1178;
    }
    int _1180 = _1172;
    float _1182 = _1166 * _1110;
    int _1184 = _1114 + 8;
    uint _1186 = uint(int(uint(_1184) >> uint(2)));
    uint _1188 = uint(int(uint(int(_1186)) >> uint(2)));
    int _1190 = int(_1186) & 3;
    float _1192 = (*spvDescriptorSet0.vp_c9)._m0[int(_1188)][_1190];
    int _1194 = int(_1186) + 1;
    uint _1196 = uint(int(uint(_1194) >> uint(2)));
    int _1198 = _1194 & 3;
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[int(_1196)][_1198];
    bool _1202 = uint(_1082) > 1u;
    float _1204 = trunc(_1168);
    float _1206 = precise::max(_1204, 0.0);
    uint _1208 = uint(_1206);
    int _1210 = abs(_1180);
    float _1212 = _573 * _573;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1216 = 1.0 / _1162;
    float _1218 = fma(_575, _575, _1212);
    if (!_1202)
    {
        int _1220 = ~_1098;
        int _1222 = _1220 + 1;
        _1174 = _1222;
    }
    int _1224 = _1174;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1228 = _717 + _1226;
    int _1230 = _1074 & 3;
    bool _1232 = _1230 != 0;
    float _1234 = fma(_577, _577, _1218);
    int _1236 = abs(_1224);
    float _1238 = fma(_1182, _1228, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1240 = !_1232;
    int _1242 = _1240 ? 0 : 1;
    out.m_44.w = _1214;
    int _1244 = int(_1094) + int(_1208);
    float _1246 = rsqrt(_1234);
    int _1248 = abs(_1242);
    float _1250 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].z, _741);
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1254 = _1252 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1256 = ~_735;
    int _1258 = _1256 + 1;
    float _1260 = _1250 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1262 = ~_1236;
    int _1264 = _1262 + 1;
    int _1266 = _1264 + 1;
    float _1268 = _1254 * _1216;
    bool _1270 = _1082 != 3;
    int _1272 = _1266 * as_type<int>(_1134);
    int _1274 = ~_1248;
    int _1276 = _1274 + 1;
    int _1278 = _1276 + 1;
    int _1280 = _1258 * _1244;
    int _1282 = _1280 + _972;
    bool _1284 = !_1270;
    int _1286 = _1284 ? 0 : (-1);
    float _1288 = in.m_39.z;
    float _1290 = _1246 * _577;
    int _1292 = _1278 * as_type<int>(_1126);
    int _1294 = _1292 + _1272;
    int _1296 = abs(_1286);
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1300 = _717 + _1298;
    bool _1302 = uint(_1282) >= uint(_735);
    float _1304 = _1246 * _575;
    bool _1306 = !_1302;
    int _1308 = _1306 ? 0 : (-1);
    float _1310 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1312 = int(_1310);
    int _1314 = ~_1210;
    int _1316 = _1314 + 1;
    int _1318 = _1316 + 1;
    int _1320 = ~_1296;
    int _1322 = _1320 + 1;
    int _1324 = _1322 + 1;
    int _1326 = ~_1244;
    int _1328 = _1326 + _1308;
    int _1330 = _1328 + 1;
    int _1332 = _1318 * as_type<int>(_1192);
    int _1334 = _1332 + _1294;
    bool _1336 = !_994;
    int _1338 = _1336 ? 0 : 1;
    float _1340 = _1246 * _573;
    bool _1342 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1344 = isnan(_717);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1350 = _1346 || _1348;
    float _1352 = float(_1350);
    int _1354 = _1324 * as_type<int>(_1200);
    int _1356 = _1354 + _1334;
    bool _1358 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1360 = isnan(_717);
    bool _1362 = _1358 || _1360;
    bool _1364 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1366 = _1362 || _1364;
    float _1368 = float(_1366);
    int _1370 = _735 * _1330;
    int _1372 = _1370 + _972;
    bool _1374 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1376 = isnan(_717);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1382 = _1378 || _1380;
    float _1384 = float(_1382);
    float _1386 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1388 = _1290 * _1386;
    int _1390 = abs(_1338);
    float _1392 = fma(_1268, _1300, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1394 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1396 = _1340 * _1394;
    float _1398 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1400 = -_1388;
    float _1402 = fma(_1304, _1398, _1400);
    int _1404 = ~_1390;
    int _1406 = _1404 + 1;
    int _1408 = _1406 + 1;
    float _1410 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1412 = _1304 * _1410;
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1416 = -_1396;
    float _1418 = fma(_1290, _1414, _1416);
    float _1420 = _1402 * _1402;
    float _1422 = -_1352;
    float _1424 = _1422 + 1.0;
    int _1426 = _1408 * _1356;
    float _1428 = float(uint(_1312));
    float _1430 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1432 = -_1412;
    float _1434 = fma(_1340, _1430, _1432);
    int _1436 = abs(_1312);
    float _1438 = fma(_1418, _1418, _1420);
    bool _1440 = _1288 > 0.5;
    float _1442 = _1368 * _1424;
    float _1444 = 1.0 / _1428;
    float _1446 = float(uint(_1436));
    float _1448 = fma(_1434, _1434, _1438);
    float _1450 = -_904;
    int _1452 = _1440 ? as_type<int>(_1450) : as_type<int>(_904);
    float _1454 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1456 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _904);
    bool _1458 = !_874;
    int _1460 = _1458 ? _1372 : (-1);
    float _1462 = 1.0 / _1446;
    bool _1464 = !_990;
    float _1466 = _1464 ? _904 : as_type<float>(_1452);
    float _1468 = _1454 * _1456;
    float _1470 = -_1368;
    float _1472 = _1470 + 1.0;
    float _1474 = -_912;
    int _1476 = _1068 ? as_type<int>(_1474) : as_type<int>(_912);
    int _1478 = _1460 * _1390;
    int _1480 = _1478 + _1426;
    int _1482 = ~_1312;
    int _1484 = _1482 + 1;
    float _1486 = _1384 * _1472;
    bool _1488 = !_1048;
    float _1490 = _1488 ? _912 : as_type<float>(_1476);
    float _1492 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _912);
    int _1494 = abs(_1480);
    float _1496 = rsqrt(_1448);
    int _1498 = as_type<int>(_1444) + (-2);
    float _1500 = _1150 * _1492;
    float _1502 = float(uint(_1480));
    float _1504 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1506 = -_1384;
    float _1508 = _1506 + 1.0;
    int _1510 = as_type<int>(_1462) + (-2);
    float _1512 = _1238 * _1486;
    float _1514 = float(uint(_1494));
    float _1516 = as_type<float>(_1498) * _1502;
    int _1518 = ~_1436;
    int _1520 = _1518 + 1;
    float _1522 = as_type<float>(_1494);
    float _1524 = _1288;
    if (!_729)
    {
        _1522 = _1288;
    }
    float _1526 = _1522;
    float _1528 = as_type<float>(_1510) * _1514;
    float _1530 = _1402 * _1496;
    float _1532 = trunc(_1516);
    float _1534 = precise::max(_1532, 0.0);
    uint _1536 = uint(_1534);
    float _1538 = _1434 * _1496;
    float _1540 = _1418 * _1496;
    float _1542 = _1500 * _1304;
    float _1544 = _1500 * _1290;
    float _1546 = _1340 * _1538;
    float _1548 = _1304 * _1530;
    float _1550 = fma(_1468, _1540, _1542);
    float _1552 = trunc(_1528);
    float _1554 = precise::max(_1552, 0.0);
    uint _1556 = uint(_1554);
    float _1558 = fma(_1468, _1538, _1544);
    float _1560 = -_1546;
    float _1562 = fma(_1290, _1530, _1560);
    float _1564 = -_1548;
    float _1566 = fma(_1340, _1540, _1564);
    float _1568 = _1526;
    if (_729)
    {
        _1568 = as_type<float>(_779);
    }
    float _1570 = _1568;
    if (_729)
    {
        _1524 = as_type<float>(_779);
    }
    float _1572 = _1524;
    float _1574 = fma(_1504, _1566, _1558);
    int _1576 = _1484 * int(_1536);
    int _1578 = _1576 + _1480;
    float _1580 = fma(_1504, _1562, _1550);
    float _1582 = _1170 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1584 = _1260 + _1574;
    float _1586 = float(uint(_1578));
    float _1588 = _1582 + _1580;
    float _1590 = _1500 * _1340;
    int _1592 = _1520 * int(_1556);
    int _1594 = _1592 + _1494;
    float _1596 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1512);
    float _1598 = as_type<float>(_1498) * _1586;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1602 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1604 = _1588 + _1602;
    float _1606 = float(uint(_1594));
    float _1608 = trunc(_1598);
    float _1610 = precise::max(_1608, 0.0);
    uint _1612 = uint(_1610);
    float _1614 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1600);
    float _1616 = fma(_1392, _1442, _1596);
    float _1618 = as_type<float>(_1510) * _1606;
    float _1620 = _777 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1622 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1624 = _1584 + _1622;
    float _1626 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1628 = _1290 * _1540;
    float _1630 = _1624 * _1624;
    float _1632 = trunc(_1618);
    float _1634 = precise::max(_1632, 0.0);
    uint _1636 = uint(_1634);
    float _1638 = -_1626;
    float _1640 = fma(_1620, 2.0, _1638);
    float _1642 = fma(_1604, _1604, _1630);
    float _1644 = -_1628;
    float _1646 = fma(_1304, _1538, _1644);
    float _1648 = fma(_1468, _1530, _1590);
    float _1650 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1654 = sqrt(_1642);
    float _1656 = _1570 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1658 = int(_1536) + int(_1612);
    float _1660 = fma(_1504, _1646, _1648);
    int _1662 = ~_1312;
    int _1664 = _1662 + 1;
    float _1666 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1652);
    float _1668 = fma(_1656, -2.0, _1650);
    float _1670 = _1148 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1674 = _1664 * _1658;
    int _1676 = _1674 + _1480;
    float _1678 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1666);
    int _1680 = int(_1556) + int(_1636);
    float _1682 = _1670 + _1660;
    int _1684 = ~_1436;
    int _1686 = _1684 + 1;
    float _1688 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1616);
    bool _1690 = uint(_1676) >= uint(_1312);
    float _1692 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1614);
    bool _1694 = _1654 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1696 = -_103;
    float _1698 = fma(_1696, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1640);
    float _1700 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1668);
    int _1702 = _1686 * _1680;
    int _1704 = _1702 + _1494;
    bool _1706 = !_1690;
    int _1708 = _1706 ? 0 : (-1);
    float _1710 = _1670;
    float _1712 = _1588;
    float _1714 = _1584;
    if (!_1694)
    {
        _1710 = _1588;
    }
    float _1716 = _1710;
    float _1718 = _1716;
    if (!_1694)
    {
        _1712 = _1682;
    }
    float _1720 = _1712;
    bool _1722 = !_1694;
    float _1724 = _1720;
    if (!_1722)
    {
        float _1726 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1728 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1730 = _1654 + _1728;
        float _1732 = _1682 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1734 = rsqrt(_1642);
        float _1736 = _1730 * _1726;
        float _1738 = _1736 * 0.15915493667125701904296875;
        float _1740 = _1738 * 6.283185482025146484375;
        float _1742 = sin(_1740);
        float _1744 = _1738 * 6.283185482025146484375;
        float _1746 = cos(_1744);
        float _1748 = fma(_1742, _1732, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1750 = _1734 * _1748;
        float _1752 = _1746 + (-1.0);
        float _1754 = fma(_1604, _1750, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1756 = fma(_1624, _1750, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1758 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1760 = fma(_1682, _1746, _1758);
        _1724 = _1760;
        _1718 = _1754;
        _1714 = _1756;
    }
    float _1762 = _1724;
    float _1764 = _1718;
    float _1766 = _1714;
    int _1768 = ~_1658;
    int _1770 = _1768 + _1708;
    int _1772 = _1770 + 1;
    float _1774 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1776 = uint(_1704) >= uint(_1436);
    float _1778 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _1780 = _1480 ^ _1312;
    int _1782 = _1312 * _1772;
    int _1784 = _1782 + _1480;
    bool _1786 = !_1776;
    int _1788 = _1786 ? 0 : (-1);
    float _1790 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    uint _1792 = uint(int(uint(_1780) >> uint(31)));
    float _1794 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1796 = _1312 == 0;
    float _1798 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1800 = _1312 == 0;
    float _1802 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1778);
    int _1804 = ~_1788;
    int _1806 = _1680 + _1804;
    int _1808 = _1806 + 1;
    float _1810 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1790);
    int _1812 = ~int(_1792);
    int _1814 = _1812 + 1;
    float _1816 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1794);
    bool _1818 = !_1796;
    int _1820 = _1818 ? _1784 : (-1);
    float _1822 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1798);
    int _1824 = _1808 ^ _1814;
    float _1826 = _1672 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1828 = float(_1820);
    float _1830 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1810);
    int _1832 = ~_1814;
    int _1834 = _1832 + _1824;
    int _1836 = _1834 + 1;
    float _1838 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1802);
    float _1840 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1816);
    float _1842 = fma(_1826, _1828, _1698);
    bool _1844 = !_1800;
    int _1846 = _1844 ? _1836 : (-1);
    float _1848 = _1830 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1850 = _1774 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1852 = _1838 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1854 = float(_1846);
    float _1856 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1858 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1860 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1862 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1822);
    float _1864 = _1466 + 0.5;
    float _1866 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1868 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1856);
    float _1870 = _1840 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1872 = -_1700;
    float _1874 = fma(_1850, _1854, _1872);
    float _1876 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1858);
    float _1878 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1860);
    float _1880 = _1490 + (-0.5);
    float _1882 = fma(_1826, _1864, _1842);
    float _1884 = -_1692;
    float _1886 = _1884 + 1.0;
    float _1888 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1866);
    float _1890 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1868);
    float _1892 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1876);
    float _1894 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1878);
    float _1896 = -_1850;
    float _1898 = fma(_1896, _1880, _1874);
    float _1900 = _1862 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1902 = -_1886;
    float _1904 = fma(_1466, _1902, _1882);
    float _1906 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1888);
    float _1908 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1892);
    float _1910 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1894);
    float _1912 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1890);
    float _1914 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1906);
    float _1916 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1918 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1920 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1922 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1924 = -_1678;
    float _1926 = _1924 + 1.0;
    float _1928 = _1908 + _1910;
    float _1930 = _1688 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1932 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1934 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1936 = _1918 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1938 = _1928 * 0.5;
    float _1940 = fma(_1490, _1926, _1898);
    out.m_33.x = _1920;
    out.m_46.x = _1932;
    out.m_46.y = _1934;
    out.m_46.z = _1936;
    out.m_46.w = _1930;
    out.gl_Position.x = _1912;
    out.gl_Position.y = _1914;
    out.gl_Position.z = _1908;
    out.gl_Position.w = _1910;
    out.m_48.z = _1938;
    out.m_48.w = _1910;
    out.m_50.z = _1904;
    out.m_50.w = _1940;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _707 = false;
    bool _601 = false;
    bool _451 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _64 = in.m_30.w;
    float _66 = trunc(_64);
    int _69 = int(_66);
    bool _73 = _69 >= 1;
    float _75 = 0.0;
    if (!_73)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _77 = _75;
    float _79 = _77;
    if (!_73)
    {
        out.m_33.x = 0.0;
    }
    int _81 = 0;
    if (!_73)
    {
        float _83 = _77 * 5.0;
        _81 = as_type<int>(_83);
    }
    int _85 = _81;
    int _87 = _85;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1997 = as_type<float>(_85);
        out.gl_Position.z = _1997;
    }
    if (!_73)
    {
        return out;
    }
    float _89 = in.m_35.w;
    bool _91 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _99 = _95 || _97;
    float _101 = -_89;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_99)
    {
        float _105 = float(_69);
        _79 = _105;
    }
    float _107 = _79;
    bool _109 = _103 >= _107;
    bool _111 = !_99;
    bool _113 = _109 || _111;
    float _115 = _107;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (_113)
    {
        out.m_33.x = 0.0;
    }
    if (_113)
    {
        float _121 = _117 * 5.0;
        _87 = as_type<int>(_121);
    }
    int _123 = _87;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2067 = as_type<float>(_123);
        out.gl_Position.z = _2067;
    }
    if (_113)
    {
        return out;
    }
    float _125 = in.m_35.x;
    float _127 = in.m_35.y;
    float _129 = in.m_35.z;
    float _131 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _153 = 0.0;
    float _155 = _151;
    if (!_141)
    {
        float _157 = _103 * _103;
        float _159 = _157 * 0.5;
        _153 = _159;
    }
    float _161 = _153;
    if (!_141)
    {
        float _163 = _151 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _155 = _163;
    }
    float _165 = _155;
    bool _167 = !_141;
    float _169 = _165;
    float _171 = 0.0;
    if (!_167)
    {
        float _173 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _175 = log2(_173);
        float _177 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _179 = _177 + 1.0;
        float _181 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _183 = _131 * _175;
        float _185 = 1.0 / _179;
        float _187 = _181 * 0.693147182464599609375;
        float _189 = exp2(_183);
        float _191 = 1.0 / _187;
        float _193 = _189 + (-1.0);
        float _195 = -_193;
        float _197 = fma(_195, _191, _131);
        float _199 = _197 * _185;
        float _201 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _169 = _201;
        _171 = _189;
        _119 = _191;
    }
    float _203 = _169;
    float _205 = _171;
    float _207 = _119;
    bool _209 = !_141;
    float _211 = _207;
    float _213 = _205;
    if (!_209)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = 1.0 / _221;
        float _225 = _131 * _217;
        float _227 = exp2(_225);
        float _229 = -_227;
        float _231 = _229 + 1.0;
        float _233 = _231 * _223;
        _211 = _221;
        _145 = _233;
    }
    float _235 = _211;
    float _237 = _145;
    float _239 = _235;
    if (!_141)
    {
        _239 = _103;
    }
    float _241 = _239;
    float _243 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _245 = _241;
    if (!_141)
    {
        float _247 = _161 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _247;
    }
    float _249 = _213;
    bool _251 = !_141;
    float _253 = _249;
    if (!_251)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = _103 * _257;
        float _267 = 1.0 / _261;
        float _269 = _263 * 0.693147182464599609375;
        float _271 = exp2(_265);
        float _273 = 1.0 / _269;
        float _275 = _271 + (-1.0);
        float _277 = -_275;
        float _279 = fma(_277, _273, _103);
        float _281 = _279 * _267;
        float _283 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _253 = _283;
    }
    float _285 = _253;
    bool _287 = !_141;
    if (!_287)
    {
        float _289 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _291 = log2(_289);
        float _293 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _295 = _293 + 1.0;
        float _297 = 1.0 / _295;
        float _299 = _103 * _291;
        float _301 = exp2(_299);
        float _303 = -_301;
        float _305 = _303 + 1.0;
        float _307 = _305 * _297;
        _245 = _307;
    }
    float _309 = _245;
    float _311 = _285 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _313 = fma(_237, _127, _243);
    float _315 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _317 = _285 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _319 = fma(_309, _127, _311);
    float _321 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _323 = _285 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _325 = fma(_237, _125, _315);
    float _327 = fma(_309, _125, _317);
    float _329 = -_319;
    float _331 = _313 + _329;
    float _333 = fma(_237, _129, _321);
    float _335 = fma(_309, _129, _323);
    float _337 = -_327;
    float _339 = _325 + _337;
    float _341 = _331 * _331;
    float _343 = in.m_37.w;
    float _345 = -_335;
    float _347 = _333 + _345;
    float _349 = _331 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _351 = fma(_339, _339, _341);
    float _353 = _331 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _355 = _331 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _357 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[4].x, _349);
    float _359 = fma(_347, _347, _351);
    float _361 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[5].x, _353);
    float _363 = in.m_30.x;
    float _365 = in.m_30.y;
    float _367 = in.m_30.z;
    float _369 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[6].x, _355);
    float _371 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[4].z, _357);
    float _373 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[5].z, _361);
    float _375 = sqrt(_359);
    float _377 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[6].z, _369);
    bool _379 = _375 >= 9.9999999747524270787835121154785e-07;
    bool _381 = isnan(_375);
    bool _383 = _379 || _381;
    bool _385 = isnan(9.9999999747524270787835121154785e-07);
    bool _387 = _383 || _385;
    float _389 = fma(_325, _343, _363);
    float _391 = fma(_313, _343, _365);
    float _393 = fma(_333, _343, _367);
    float _395 = _369;
    float _397 = _343;
    float _399 = _371;
    if (_387)
    {
        _395 = _371;
    }
    float _401 = _395;
    float _403 = _401;
    if (_387)
    {
        _397 = _373;
    }
    float _405 = _397;
    float _407 = _405;
    if (_387)
    {
        _399 = _377;
    }
    float _409 = _399;
    float _411 = _409;
    if (!_387)
    {
        bool _413 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _415 = !_413;
        if (!_415)
        {
            float _417 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _419 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _421 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _423 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _417);
            float _425 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _419);
            float _427 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _421);
            float _429 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _423);
            float _431 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _425);
            float _433 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _427);
            float _435 = _429 * _429;
            float _437 = fma(_431, _431, _435);
            float _439 = fma(_433, _433, _437);
            float _441 = rsqrt(_439);
            float _443 = _441 * 9.9999999747524270787835121154785e-07;
            float _445 = _431 * _443;
            float _447 = _429 * _443;
            float _449 = _433 * _443;
            _407 = _447;
            _403 = _445;
            _411 = _449;
            _451 = true;
        }
        else
        {
            float _453 = _127 * _127;
            float _455 = fma(_125, _125, _453);
            float _457 = fma(_129, _129, _455);
            float _459 = sqrt(_457);
            bool _461 = _459 >= 9.9999999747524270787835121154785e-07;
            bool _463 = isnan(_459);
            bool _465 = _461 || _463;
            bool _467 = isnan(9.9999999747524270787835121154785e-07);
            bool _469 = _465 || _467;
            if (!_469)
            {
                float _471 = _365 * _365;
                float _473 = fma(_363, _363, _471);
                float _475 = fma(_367, _367, _473);
                float _477 = sqrt(_475);
                bool _479 = _477 >= 9.9999999747524270787835121154785e-07;
                bool _481 = isnan(_477);
                bool _483 = _479 || _481;
                bool _485 = isnan(9.9999999747524270787835121154785e-07);
                bool _487 = _483 || _485;
                if (!_487)
                {
                    float _489 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _491 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _489);
                    float _493 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _491);
                    float _495 = rsqrt(_493);
                    float _497 = _495 * 9.9999999747524270787835121154785e-07;
                    float _499 = _497 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _501 = _497 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _503 = _497 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _407 = _501;
                    _403 = _499;
                    _411 = _503;
                    _451 = true;
                }
                else
                {
                    float _505 = _365 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _507 = _365 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _509 = _365 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _511 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].x, _505);
                    float _513 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].x, _507);
                    float _515 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].x, _509);
                    float _517 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[5].z, _511);
                    float _519 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[4].z, _513);
                    float _521 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[6].z, _515);
                    float _523 = _517 * _517;
                    float _525 = fma(_519, _519, _523);
                    float _527 = fma(_521, _521, _525);
                    float _529 = rsqrt(_527);
                    float _531 = _529 * 9.9999999747524270787835121154785e-07;
                    float _533 = _519 * _531;
                    float _535 = _517 * _531;
                    float _537 = _521 * _531;
                    _407 = _535;
                    _403 = _533;
                    _411 = _537;
                    _451 = true;
                }
            }
            else
            {
                float _539 = _127 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _541 = _127 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _543 = _127 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _545 = fma(_125, (*spvDescriptorSet0.vp_c10)._m0[5].x, _539);
                float _547 = fma(_125, (*spvDescriptorSet0.vp_c10)._m0[4].x, _541);
                float _549 = fma(_125, (*spvDescriptorSet0.vp_c10)._m0[6].x, _543);
                float _551 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[5].z, _545);
                float _553 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[4].z, _547);
                float _555 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[6].z, _549);
                float _557 = _551 * _551;
                float _559 = fma(_553, _553, _557);
                float _561 = fma(_555, _555, _559);
                float _563 = rsqrt(_561);
                float _565 = _563 * 9.9999999747524270787835121154785e-07;
                float _567 = _553 * _565;
                float _569 = _551 * _565;
                float _571 = _555 * _565;
                _407 = _569;
                _403 = _567;
                _411 = _571;
            }
        }
    }
    _451 = false;
    float _573 = _407;
    float _575 = _403;
    float _577 = _411;
    bool _579 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _581 = !_579;
    float _599;
    if (!_581)
    {
        float _583 = in.m_39.x;
        float _585 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _587 = _583 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _589 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _591 = _589 * _585;
        float _593 = floor(_591);
        float _595 = -_593;
        float _597 = _591 + _595;
        _599 = _597;
        _601 = true;
    }
    else
    {
        float _603 = float(_69);
        float _605 = 1.0 / _603;
        float _607 = _103 * _605;
        _599 = _607;
    }
    _601 = false;
    float _609 = _599;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _613 = _609 + _611;
    bool _615 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _617 = isnan(_609);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _627;
    float _631 = -_625;
    float _633 = _631 + 1.0;
    bool _635 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _637 = isnan(_609);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _647;
    bool _651 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _653 = 1.0 / _629;
    float _655 = _645 * _633;
    float _657 = -_645;
    float _659 = _657 + 1.0;
    float _661 = _613 * _653;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _663;
    float _667 = fma(_649, _661, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _669 = fma(_665, _661, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _671 = _667 * _655;
    float _673 = _669 * _655;
    float _675 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[143].x, _671);
    float _677 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[143].y, _673);
    float _679 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[144].x, _675);
    float _681 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[144].y, _677);
    bool _683 = !_651;
    float _703;
    float _705;
    if (!_683)
    {
        float _685 = in.m_39.x;
        float _687 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _689 = float(_69);
        float _691 = _685 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _693 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _695 = _693 * _687;
        float _697 = floor(_695);
        float _699 = -_697;
        float _701 = _695 + _699;
        _703 = _689;
        _705 = _701;
        _707 = true;
    }
    else
    {
        float _709 = float(_69);
        float _711 = 1.0 / _709;
        float _713 = _103 * _711;
        _703 = _709;
        _705 = _713;
    }
    _707 = false;
    float _715 = _703;
    float _717 = _705;
    float _719 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _721 = int(_719);
    float _723 = in.m_39.x;
    float _725 = _391 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _729 = _727 != 0;
    float _731 = as_type<float>(int(gl_VertexIndex));
    float _733 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _735 = int(_733);
    bool _737 = !_729;
    float _739 = _737 ? 1.2345600128173828125 : 1.0;
    float _741 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].x, _725);
    float _743 = float(_721);
    float _745 = 1.0 / _715;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _749 = _743;
    if (!_729)
    {
        float _751 = in.m_39.y;
        _747 = _751;
    }
    float _753 = _747;
    float _755 = float(uint(_735));
    float _757 = 1.0 / _743;
    float _759 = 1.0 / _755;
    float _761 = _103 * _757;
    if (!_729)
    {
        _749 = _753;
    }
    float _763 = _749;
    float _765 = trunc(_761);
    int _767 = int(_765);
    float _769 = _763;
    int _771 = as_type<int>(_753);
    if (_729)
    {
        float _773 = in.m_39.x;
        float _775 = in.m_39.y;
        _769 = _773;
        _771 = as_type<int>(_775);
    }
    float _777 = _769;
    int _779 = _771;
    int _781 = as_type<int>(_759) + (-2);
    int _783 = ~_735;
    int _785 = _783 + 1;
    float _787 = float(uint(_767));
    float _789 = as_type<float>(_781) * _787;
    float _791 = trunc(_789);
    float _793 = precise::max(_791, 0.0);
    uint _796 = uint(_793);
    float _798 = float(_735);
    int _800 = _785 * int(_796);
    int _802 = _800 + _767;
    float _804 = float(uint(_802));
    float _806 = as_type<float>(_781) * _804;
    bool _808 = !_729;
    float _810 = _808 ? as_type<float>(_779) : _723;
    int _812 = ~_735;
    int _814 = _812 + 1;
    float _816 = trunc(_806);
    float _818 = precise::max(_816, 0.0);
    uint _820 = uint(_818);
    float _822 = _810 * _739;
    float _824 = float(_767);
    int _826 = int(_796) + int(_820);
    float _828 = floor(_822);
    bool _830 = _824 >= _798;
    bool _832 = isnan(_824);
    bool _834 = _830 || _832;
    bool _836 = isnan(_798);
    bool _838 = _834 || _836;
    float _840 = float(_838);
    int _842 = _814 * _826;
    int _844 = _842 + _767;
    bool _846 = uint(_844) >= uint(_735);
    float _848 = trunc(_840);
    int _850 = int(_848);
    bool _852 = !_846;
    int _854 = _852 ? 0 : (-1);
    int _856 = as_type<int>(_731) & 1;
    bool _858 = _856 != 0;
    int _860 = as_type<int>(_731) & 2;
    bool _862 = _860 != 0;
    int _864 = ~_826;
    int _866 = _864 + _854;
    int _868 = _866 + 1;
    float _870 = -_828;
    float _872 = _822 + _870;
    bool _874 = _735 == 0;
    int _876 = _735 * _868;
    int _878 = _876 + _767;
    int _880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _882 = _880 != 0;
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _886 = _884 != 0;
    float _888 = _798 * _872;
    float _890 = _103 * _798;
    int _892 = ~_850;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    bool _898 = !_874;
    int _900 = _898 ? _878 : (-1);
    bool _902 = !_858;
    float _904 = _902 ? (-0.5) : 0.5;
    float _906 = trunc(_888);
    int _908 = int(_906);
    bool _910 = !_862;
    float _912 = _910 ? (-0.5) : 0.5;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _916 = _914 != 0;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _920 = _918 != 0;
    float _922 = _890 * _745;
    int _924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _926 = _924 != 0;
    int _928 = _896 * _900;
    int _930 = _735 + (-1);
    float _932 = trunc(_922);
    int _934 = int(_932);
    bool _936 = !_926;
    int _938 = _936 ? 0 : 1;
    bool _940 = !_920;
    int _942 = _940 ? 0 : 1;
    int _944 = _850 * _930;
    int _946 = _944 + _928;
    bool _948 = !_916;
    int _950 = _948 ? 0 : 1;
    int _952 = abs(_938);
    bool _954 = !_882;
    int _956 = _954 ? 0 : 1;
    int _958 = abs(_942);
    int _960 = abs(_950);
    int _962 = _946 * _958;
    bool _964 = !_886;
    int _966 = _964 ? 0 : 1;
    int _968 = abs(_956);
    int _970 = _908 * _952;
    int _972 = _970 + _767;
    int _974 = abs(_966);
    int _976 = _934 * _960;
    int _978 = _976 + _962;
    int _980 = ~_735;
    int _982 = _980 + 1;
    int _984 = _972 * _968;
    int _986 = _984 + _978;
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _990 = _988 != 0;
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _994 = _992 != 0;
    int _996 = _908 * _974;
    int _998 = _996 + _986;
    int _1000 = ~_735;
    int _1002 = _1000 + 1;
    int _1004 = ~_735;
    int _1006 = _1004 + 1;
    float _1008 = float(uint(_998));
    float _1010 = as_type<float>(_781) * _1008;
    float _1012 = trunc(_1010);
    float _1014 = precise::max(_1012, 0.0);
    uint _1016 = uint(_1014);
    int _1018 = _1002 * int(_1016);
    int _1020 = _1018 + _998;
    float _1022 = float(uint(_1020));
    float _1024 = as_type<float>(_781) * _1022;
    float _1026 = trunc(_1024);
    float _1028 = precise::max(_1026, 0.0);
    uint _1030 = uint(_1028);
    int _1032 = int(_1016) + int(_1030);
    float _1034 = in.m_39.w;
    int _1036 = _982 * _1032;
    int _1038 = _1036 + _998;
    bool _1040 = uint(_1038) >= uint(_735);
    bool _1042 = !_1040;
    int _1044 = _1042 ? 0 : (-1);
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1048 = _1046 != 0;
    float _1050 = _391 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1052 = ~_1032;
    int _1054 = _1052 + _1044;
    int _1056 = _1054 + 1;
    float _1058 = in.m_37.x;
    float _1060 = in.m_37.y;
    float _1062 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1050);
    int _1064 = _735 * _1056;
    int _1066 = _1064 + _998;
    bool _1068 = _1034 > 0.5;
    float _1070 = _391 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1072 = !_874;
    int _1074 = _1072 ? _1066 : (-1);
    float _1076 = float(uint(_972));
    float _1078 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1070);
    int _1080 = _1074 >> 31;
    int _1082 = _1074 & 3;
    bool _1084 = _1082 != 0;
    float _1086 = as_type<float>(_781) * _1076;
    int _1088 = _1080 & 3;
    float _1090 = trunc(_1086);
    float _1092 = precise::max(_1090, 0.0);
    uint _1094 = uint(_1092);
    int _1096 = _1074 + _1088;
    int _1098 = _1084 ? 0 : 1;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1102 = _1100 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1104 = _1096 >> 2;
    float _1106 = _679 * _1058;
    bool _1108 = uint(_1082) >= 2u;
    float _1110 = 1.0 / _1102;
    int _1112 = _1104 << 4;
    int _1114 = _1112 + 512;
    float _1116 = _681 * _1060;
    int _1118 = _1108 ? 0 : 1;
    uint _1120 = uint(int(uint(_1114) >> uint(2)));
    uint _1122 = uint(int(uint(int(_1120)) >> uint(2)));
    int _1124 = int(_1120) & 3;
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[int(_1122)][_1124];
    int _1128 = int(_1120) + 1;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    int _1132 = _1128 & 3;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[int(_1130)][_1132];
    bool _1136 = _1082 != 3;
    int _1138 = _1006 * int(_1094);
    int _1140 = _1138 + _972;
    int _1142 = ~_1118;
    int _1144 = _1142 + 1;
    int _1146 = _1144 + 1;
    float _1148 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1078);
    float _1150 = _1116 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1152 = float(uint(_1140));
    int _1154 = ~_1098;
    int _1156 = _1154 + 1;
    int _1158 = _1156 + 1;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1162 = _1160 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1164;
    float _1168 = as_type<float>(_781) * _1152;
    float _1170 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1062);
    int _1172 = _1146;
    int _1174 = _1158;
    if (_1136)
    {
        int _1176 = ~_1118;
        int _1178 = _1176 + 1;
        _1172 = _1178;
    }
    int _1180 = _1172;
    float _1182 = _1166 * _1110;
    int _1184 = _1114 + 8;
    uint _1186 = uint(int(uint(_1184) >> uint(2)));
    uint _1188 = uint(int(uint(int(_1186)) >> uint(2)));
    int _1190 = int(_1186) & 3;
    float _1192 = (*spvDescriptorSet0.vp_c9)._m0[int(_1188)][_1190];
    int _1194 = int(_1186) + 1;
    uint _1196 = uint(int(uint(_1194) >> uint(2)));
    int _1198 = _1194 & 3;
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[int(_1196)][_1198];
    bool _1202 = uint(_1082) > 1u;
    float _1204 = trunc(_1168);
    float _1206 = precise::max(_1204, 0.0);
    uint _1208 = uint(_1206);
    int _1210 = abs(_1180);
    float _1212 = _573 * _573;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1216 = 1.0 / _1162;
    float _1218 = fma(_575, _575, _1212);
    if (!_1202)
    {
        int _1220 = ~_1098;
        int _1222 = _1220 + 1;
        _1174 = _1222;
    }
    int _1224 = _1174;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1228 = _717 + _1226;
    int _1230 = _1074 & 3;
    bool _1232 = _1230 != 0;
    float _1234 = fma(_577, _577, _1218);
    int _1236 = abs(_1224);
    float _1238 = fma(_1182, _1228, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1240 = !_1232;
    int _1242 = _1240 ? 0 : 1;
    out.m_44.w = _1214;
    int _1244 = int(_1094) + int(_1208);
    float _1246 = rsqrt(_1234);
    int _1248 = abs(_1242);
    float _1250 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].z, _741);
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1254 = _1252 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1256 = ~_735;
    int _1258 = _1256 + 1;
    float _1260 = _1250 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1262 = ~_1236;
    int _1264 = _1262 + 1;
    int _1266 = _1264 + 1;
    float _1268 = _1254 * _1216;
    bool _1270 = _1082 != 3;
    int _1272 = _1266 * as_type<int>(_1134);
    int _1274 = ~_1248;
    int _1276 = _1274 + 1;
    int _1278 = _1276 + 1;
    int _1280 = _1258 * _1244;
    int _1282 = _1280 + _972;
    bool _1284 = !_1270;
    int _1286 = _1284 ? 0 : (-1);
    float _1288 = in.m_39.z;
    float _1290 = _1246 * _577;
    int _1292 = _1278 * as_type<int>(_1126);
    int _1294 = _1292 + _1272;
    int _1296 = abs(_1286);
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1300 = _717 + _1298;
    bool _1302 = uint(_1282) >= uint(_735);
    float _1304 = _1246 * _575;
    bool _1306 = !_1302;
    int _1308 = _1306 ? 0 : (-1);
    float _1310 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1312 = int(_1310);
    int _1314 = ~_1210;
    int _1316 = _1314 + 1;
    int _1318 = _1316 + 1;
    int _1320 = ~_1296;
    int _1322 = _1320 + 1;
    int _1324 = _1322 + 1;
    int _1326 = ~_1244;
    int _1328 = _1326 + _1308;
    int _1330 = _1328 + 1;
    int _1332 = _1318 * as_type<int>(_1192);
    int _1334 = _1332 + _1294;
    bool _1336 = !_994;
    int _1338 = _1336 ? 0 : 1;
    float _1340 = _1246 * _573;
    bool _1342 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1344 = isnan(_717);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1350 = _1346 || _1348;
    float _1352 = float(_1350);
    int _1354 = _1324 * as_type<int>(_1200);
    int _1356 = _1354 + _1334;
    bool _1358 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1360 = isnan(_717);
    bool _1362 = _1358 || _1360;
    bool _1364 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1366 = _1362 || _1364;
    float _1368 = float(_1366);
    int _1370 = _735 * _1330;
    int _1372 = _1370 + _972;
    bool _1374 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1376 = isnan(_717);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1382 = _1378 || _1380;
    float _1384 = float(_1382);
    float _1386 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1388 = _1290 * _1386;
    int _1390 = abs(_1338);
    float _1392 = fma(_1268, _1300, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1394 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1396 = _1340 * _1394;
    float _1398 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1400 = -_1388;
    float _1402 = fma(_1304, _1398, _1400);
    int _1404 = ~_1390;
    int _1406 = _1404 + 1;
    int _1408 = _1406 + 1;
    float _1410 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1412 = _1304 * _1410;
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1416 = -_1396;
    float _1418 = fma(_1290, _1414, _1416);
    float _1420 = _1402 * _1402;
    float _1422 = -_1352;
    float _1424 = _1422 + 1.0;
    int _1426 = _1408 * _1356;
    float _1428 = float(uint(_1312));
    float _1430 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1432 = -_1412;
    float _1434 = fma(_1340, _1430, _1432);
    int _1436 = abs(_1312);
    float _1438 = fma(_1418, _1418, _1420);
    bool _1440 = _1288 > 0.5;
    float _1442 = _1368 * _1424;
    float _1444 = 1.0 / _1428;
    float _1446 = float(uint(_1436));
    float _1448 = fma(_1434, _1434, _1438);
    float _1450 = -_904;
    int _1452 = _1440 ? as_type<int>(_1450) : as_type<int>(_904);
    float _1454 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1456 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _904);
    bool _1458 = !_874;
    int _1460 = _1458 ? _1372 : (-1);
    float _1462 = 1.0 / _1446;
    bool _1464 = !_990;
    float _1466 = _1464 ? _904 : as_type<float>(_1452);
    float _1468 = _1454 * _1456;
    float _1470 = -_1368;
    float _1472 = _1470 + 1.0;
    float _1474 = -_912;
    int _1476 = _1068 ? as_type<int>(_1474) : as_type<int>(_912);
    int _1478 = _1460 * _1390;
    int _1480 = _1478 + _1426;
    int _1482 = ~_1312;
    int _1484 = _1482 + 1;
    float _1486 = _1384 * _1472;
    bool _1488 = !_1048;
    float _1490 = _1488 ? _912 : as_type<float>(_1476);
    float _1492 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _912);
    int _1494 = abs(_1480);
    float _1496 = rsqrt(_1448);
    int _1498 = as_type<int>(_1444) + (-2);
    float _1500 = _1150 * _1492;
    float _1502 = float(uint(_1480));
    float _1504 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1506 = -_1384;
    float _1508 = _1506 + 1.0;
    int _1510 = as_type<int>(_1462) + (-2);
    float _1512 = _1238 * _1486;
    float _1514 = float(uint(_1494));
    float _1516 = as_type<float>(_1498) * _1502;
    int _1518 = ~_1436;
    int _1520 = _1518 + 1;
    float _1522 = as_type<float>(_1494);
    float _1524 = _1288;
    if (!_729)
    {
        _1522 = _1288;
    }
    float _1526 = _1522;
    float _1528 = as_type<float>(_1510) * _1514;
    float _1530 = _1402 * _1496;
    float _1532 = trunc(_1516);
    float _1534 = precise::max(_1532, 0.0);
    uint _1536 = uint(_1534);
    float _1538 = _1434 * _1496;
    float _1540 = _1418 * _1496;
    float _1542 = _1500 * _1304;
    float _1544 = _1500 * _1290;
    float _1546 = _1340 * _1538;
    float _1548 = _1304 * _1530;
    float _1550 = fma(_1468, _1540, _1542);
    float _1552 = trunc(_1528);
    float _1554 = precise::max(_1552, 0.0);
    uint _1556 = uint(_1554);
    float _1558 = fma(_1468, _1538, _1544);
    float _1560 = -_1546;
    float _1562 = fma(_1290, _1530, _1560);
    float _1564 = -_1548;
    float _1566 = fma(_1340, _1540, _1564);
    float _1568 = _1526;
    if (_729)
    {
        _1568 = as_type<float>(_779);
    }
    float _1570 = _1568;
    if (_729)
    {
        _1524 = as_type<float>(_779);
    }
    float _1572 = _1524;
    float _1574 = fma(_1504, _1566, _1558);
    int _1576 = _1484 * int(_1536);
    int _1578 = _1576 + _1480;
    float _1580 = fma(_1504, _1562, _1550);
    float _1582 = _1170 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1584 = _1260 + _1574;
    float _1586 = float(uint(_1578));
    float _1588 = _1582 + _1580;
    float _1590 = _1500 * _1340;
    int _1592 = _1520 * int(_1556);
    int _1594 = _1592 + _1494;
    float _1596 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1512);
    float _1598 = as_type<float>(_1498) * _1586;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1602 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1604 = _1588 + _1602;
    float _1606 = float(uint(_1594));
    float _1608 = trunc(_1598);
    float _1610 = precise::max(_1608, 0.0);
    uint _1612 = uint(_1610);
    float _1614 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1600);
    float _1616 = fma(_1392, _1442, _1596);
    float _1618 = as_type<float>(_1510) * _1606;
    float _1620 = _777 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1622 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1624 = _1584 + _1622;
    float _1626 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1628 = _1290 * _1540;
    float _1630 = _1624 * _1624;
    float _1632 = trunc(_1618);
    float _1634 = precise::max(_1632, 0.0);
    uint _1636 = uint(_1634);
    float _1638 = -_1626;
    float _1640 = fma(_1620, 2.0, _1638);
    float _1642 = fma(_1604, _1604, _1630);
    float _1644 = -_1628;
    float _1646 = fma(_1304, _1538, _1644);
    float _1648 = fma(_1468, _1530, _1590);
    float _1650 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1654 = sqrt(_1642);
    float _1656 = _1570 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1658 = int(_1536) + int(_1612);
    float _1660 = fma(_1504, _1646, _1648);
    int _1662 = ~_1312;
    int _1664 = _1662 + 1;
    float _1666 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1652);
    float _1668 = fma(_1656, -2.0, _1650);
    float _1670 = _1148 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1674 = _1664 * _1658;
    int _1676 = _1674 + _1480;
    float _1678 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1666);
    int _1680 = int(_1556) + int(_1636);
    float _1682 = _1670 + _1660;
    int _1684 = ~_1436;
    int _1686 = _1684 + 1;
    float _1688 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1616);
    bool _1690 = uint(_1676) >= uint(_1312);
    float _1692 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1614);
    bool _1694 = _1654 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1696 = -_103;
    float _1698 = fma(_1696, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1640);
    float _1700 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1668);
    int _1702 = _1686 * _1680;
    int _1704 = _1702 + _1494;
    bool _1706 = !_1690;
    int _1708 = _1706 ? 0 : (-1);
    float _1710 = _1670;
    float _1712 = _1588;
    float _1714 = _1584;
    if (!_1694)
    {
        _1710 = _1588;
    }
    float _1716 = _1710;
    float _1718 = _1716;
    if (!_1694)
    {
        _1712 = _1682;
    }
    float _1720 = _1712;
    bool _1722 = !_1694;
    float _1724 = _1720;
    if (!_1722)
    {
        float _1726 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1728 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1730 = _1654 + _1728;
        float _1732 = _1682 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1734 = rsqrt(_1642);
        float _1736 = _1730 * _1726;
        float _1738 = _1736 * 0.15915493667125701904296875;
        float _1740 = _1738 * 6.283185482025146484375;
        float _1742 = sin(_1740);
        float _1744 = _1738 * 6.283185482025146484375;
        float _1746 = cos(_1744);
        float _1748 = fma(_1742, _1732, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1750 = _1734 * _1748;
        float _1752 = _1746 + (-1.0);
        float _1754 = fma(_1604, _1750, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1756 = fma(_1624, _1750, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1758 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1760 = fma(_1682, _1746, _1758);
        _1724 = _1760;
        _1718 = _1754;
        _1714 = _1756;
    }
    float _1762 = _1724;
    float _1764 = _1718;
    float _1766 = _1714;
    int _1768 = ~_1658;
    int _1770 = _1768 + _1708;
    int _1772 = _1770 + 1;
    float _1774 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1776 = uint(_1704) >= uint(_1436);
    float _1778 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _1780 = _1480 ^ _1312;
    int _1782 = _1312 * _1772;
    int _1784 = _1782 + _1480;
    bool _1786 = !_1776;
    int _1788 = _1786 ? 0 : (-1);
    float _1790 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    uint _1792 = uint(int(uint(_1780) >> uint(31)));
    float _1794 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1796 = _1312 == 0;
    float _1798 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1800 = _1312 == 0;
    float _1802 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1778);
    int _1804 = ~_1788;
    int _1806 = _1680 + _1804;
    int _1808 = _1806 + 1;
    float _1810 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1790);
    int _1812 = ~int(_1792);
    int _1814 = _1812 + 1;
    float _1816 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1794);
    bool _1818 = !_1796;
    int _1820 = _1818 ? _1784 : (-1);
    float _1822 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1798);
    int _1824 = _1808 ^ _1814;
    float _1826 = _1672 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1828 = float(_1820);
    float _1830 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1810);
    int _1832 = ~_1814;
    int _1834 = _1832 + _1824;
    int _1836 = _1834 + 1;
    float _1838 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1802);
    float _1840 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1816);
    float _1842 = fma(_1826, _1828, _1698);
    bool _1844 = !_1800;
    int _1846 = _1844 ? _1836 : (-1);
    float _1848 = _1830 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1850 = _1774 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1852 = _1838 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1854 = float(_1846);
    float _1856 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1858 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1860 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1862 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1822);
    float _1864 = _1466 + 0.5;
    float _1866 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1868 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1856);
    float _1870 = _1840 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1872 = -_1700;
    float _1874 = fma(_1850, _1854, _1872);
    float _1876 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1858);
    float _1878 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1860);
    float _1880 = _1490 + (-0.5);
    float _1882 = fma(_1826, _1864, _1842);
    float _1884 = -_1692;
    float _1886 = _1884 + 1.0;
    float _1888 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1866);
    float _1890 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1868);
    float _1892 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1876);
    float _1894 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1878);
    float _1896 = -_1850;
    float _1898 = fma(_1896, _1880, _1874);
    float _1900 = _1862 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1902 = -_1886;
    float _1904 = fma(_1466, _1902, _1882);
    float _1906 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1888);
    float _1908 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1892);
    float _1910 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1894);
    float _1912 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1890);
    float _1914 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1906);
    float _1916 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1918 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1920 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1922 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1924 = -_1678;
    float _1926 = _1924 + 1.0;
    float _1928 = _1908 + _1910;
    float _1930 = _1688 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1932 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1934 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1936 = _1918 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1938 = _1928 * 0.5;
    float _1940 = fma(_1490, _1926, _1898);
    out.m_33.x = _1920;
    out.m_46.x = _1932;
    out.m_46.y = _1934;
    out.m_46.z = _1936;
    out.m_46.w = _1930;
    out.gl_Position.x = _1912;
    out.gl_Position.y = _1914;
    out.gl_Position.z = _1908;
    out.gl_Position.w = _1910;
    out.m_48.z = _1938;
    out.m_48.w = _1910;
    out.m_50.z = _1904;
    out.m_50.w = _1940;
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
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _707 = false;
    bool _601 = false;
    bool _451 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _64 = in.m_30.w;
    float _66 = trunc(_64);
    int _69 = int(_66);
    bool _73 = _69 >= 1;
    float _75 = 0.0;
    if (!_73)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _77 = _75;
    float _79 = _77;
    if (!_73)
    {
        out.m_33.x = 0.0;
    }
    int _81 = 0;
    if (!_73)
    {
        float _83 = _77 * 5.0;
        _81 = as_type<int>(_83);
    }
    int _85 = _81;
    int _87 = _85;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1997 = as_type<float>(_85);
        out.gl_Position.z = _1997;
    }
    if (!_73)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _89 = in.m_35.w;
    bool _91 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _99 = _95 || _97;
    float _101 = -_89;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_99)
    {
        float _105 = float(_69);
        _79 = _105;
    }
    float _107 = _79;
    bool _109 = _103 >= _107;
    bool _111 = !_99;
    bool _113 = _109 || _111;
    float _115 = _107;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (_113)
    {
        out.m_33.x = 0.0;
    }
    if (_113)
    {
        float _121 = _117 * 5.0;
        _87 = as_type<int>(_121);
    }
    int _123 = _87;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2067 = as_type<float>(_123);
        out.gl_Position.z = _2067;
    }
    if (_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_35.x;
    float _127 = in.m_35.y;
    float _129 = in.m_35.z;
    float _131 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _153 = 0.0;
    float _155 = _151;
    if (!_141)
    {
        float _157 = _103 * _103;
        float _159 = _157 * 0.5;
        _153 = _159;
    }
    float _161 = _153;
    if (!_141)
    {
        float _163 = _151 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _155 = _163;
    }
    float _165 = _155;
    bool _167 = !_141;
    float _169 = _165;
    float _171 = 0.0;
    if (!_167)
    {
        float _173 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _175 = log2(_173);
        float _177 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _179 = _177 + 1.0;
        float _181 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _183 = _131 * _175;
        float _185 = 1.0 / _179;
        float _187 = _181 * 0.693147182464599609375;
        float _189 = exp2(_183);
        float _191 = 1.0 / _187;
        float _193 = _189 + (-1.0);
        float _195 = -_193;
        float _197 = fma(_195, _191, _131);
        float _199 = _197 * _185;
        float _201 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _169 = _201;
        _171 = _189;
        _119 = _191;
    }
    float _203 = _169;
    float _205 = _171;
    float _207 = _119;
    bool _209 = !_141;
    float _211 = _207;
    float _213 = _205;
    if (!_209)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = 1.0 / _221;
        float _225 = _131 * _217;
        float _227 = exp2(_225);
        float _229 = -_227;
        float _231 = _229 + 1.0;
        float _233 = _231 * _223;
        _211 = _221;
        _145 = _233;
    }
    float _235 = _211;
    float _237 = _145;
    float _239 = _235;
    if (!_141)
    {
        _239 = _103;
    }
    float _241 = _239;
    float _243 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _245 = _241;
    if (!_141)
    {
        float _247 = _161 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _247;
    }
    float _249 = _213;
    bool _251 = !_141;
    float _253 = _249;
    if (!_251)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = _103 * _257;
        float _267 = 1.0 / _261;
        float _269 = _263 * 0.693147182464599609375;
        float _271 = exp2(_265);
        float _273 = 1.0 / _269;
        float _275 = _271 + (-1.0);
        float _277 = -_275;
        float _279 = fma(_277, _273, _103);
        float _281 = _279 * _267;
        float _283 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _253 = _283;
    }
    float _285 = _253;
    bool _287 = !_141;
    if (!_287)
    {
        float _289 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _291 = log2(_289);
        float _293 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _295 = _293 + 1.0;
        float _297 = 1.0 / _295;
        float _299 = _103 * _291;
        float _301 = exp2(_299);
        float _303 = -_301;
        float _305 = _303 + 1.0;
        float _307 = _305 * _297;
        _245 = _307;
    }
    float _309 = _245;
    float _311 = _285 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _313 = fma(_237, _127, _243);
    float _315 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _317 = _285 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _319 = fma(_309, _127, _311);
    float _321 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _323 = _285 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _325 = fma(_237, _125, _315);
    float _327 = fma(_309, _125, _317);
    float _329 = -_319;
    float _331 = _313 + _329;
    float _333 = fma(_237, _129, _321);
    float _335 = fma(_309, _129, _323);
    float _337 = -_327;
    float _339 = _325 + _337;
    float _341 = _331 * _331;
    float _343 = in.m_37.w;
    float _345 = -_335;
    float _347 = _333 + _345;
    float _349 = _331 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _351 = fma(_339, _339, _341);
    float _353 = _331 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _355 = _331 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _357 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[4].x, _349);
    float _359 = fma(_347, _347, _351);
    float _361 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[5].x, _353);
    float _363 = in.m_30.x;
    float _365 = in.m_30.y;
    float _367 = in.m_30.z;
    float _369 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[6].x, _355);
    float _371 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[4].z, _357);
    float _373 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[5].z, _361);
    float _375 = sqrt(_359);
    float _377 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[6].z, _369);
    bool _379 = _375 >= 9.9999999747524270787835121154785e-07;
    bool _381 = isnan(_375);
    bool _383 = _379 || _381;
    bool _385 = isnan(9.9999999747524270787835121154785e-07);
    bool _387 = _383 || _385;
    float _389 = fma(_325, _343, _363);
    float _391 = fma(_313, _343, _365);
    float _393 = fma(_333, _343, _367);
    float _395 = _369;
    float _397 = _343;
    float _399 = _371;
    if (_387)
    {
        _395 = _371;
    }
    float _401 = _395;
    float _403 = _401;
    if (_387)
    {
        _397 = _373;
    }
    float _405 = _397;
    float _407 = _405;
    if (_387)
    {
        _399 = _377;
    }
    float _409 = _399;
    float _411 = _409;
    if (!_387)
    {
        bool _413 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _415 = !_413;
        if (!_415)
        {
            float _417 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _419 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _421 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _423 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _417);
            float _425 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _419);
            float _427 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _421);
            float _429 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _423);
            float _431 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _425);
            float _433 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _427);
            float _435 = _429 * _429;
            float _437 = fma(_431, _431, _435);
            float _439 = fma(_433, _433, _437);
            float _441 = rsqrt(_439);
            float _443 = _441 * 9.9999999747524270787835121154785e-07;
            float _445 = _431 * _443;
            float _447 = _429 * _443;
            float _449 = _433 * _443;
            _407 = _447;
            _403 = _445;
            _411 = _449;
            _451 = true;
        }
        else
        {
            float _453 = _127 * _127;
            float _455 = fma(_125, _125, _453);
            float _457 = fma(_129, _129, _455);
            float _459 = sqrt(_457);
            bool _461 = _459 >= 9.9999999747524270787835121154785e-07;
            bool _463 = isnan(_459);
            bool _465 = _461 || _463;
            bool _467 = isnan(9.9999999747524270787835121154785e-07);
            bool _469 = _465 || _467;
            if (!_469)
            {
                float _471 = _365 * _365;
                float _473 = fma(_363, _363, _471);
                float _475 = fma(_367, _367, _473);
                float _477 = sqrt(_475);
                bool _479 = _477 >= 9.9999999747524270787835121154785e-07;
                bool _481 = isnan(_477);
                bool _483 = _479 || _481;
                bool _485 = isnan(9.9999999747524270787835121154785e-07);
                bool _487 = _483 || _485;
                if (!_487)
                {
                    float _489 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _491 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _489);
                    float _493 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _491);
                    float _495 = rsqrt(_493);
                    float _497 = _495 * 9.9999999747524270787835121154785e-07;
                    float _499 = _497 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _501 = _497 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _503 = _497 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _407 = _501;
                    _403 = _499;
                    _411 = _503;
                    _451 = true;
                }
                else
                {
                    float _505 = _365 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _507 = _365 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _509 = _365 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _511 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].x, _505);
                    float _513 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].x, _507);
                    float _515 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].x, _509);
                    float _517 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[5].z, _511);
                    float _519 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[4].z, _513);
                    float _521 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[6].z, _515);
                    float _523 = _517 * _517;
                    float _525 = fma(_519, _519, _523);
                    float _527 = fma(_521, _521, _525);
                    float _529 = rsqrt(_527);
                    float _531 = _529 * 9.9999999747524270787835121154785e-07;
                    float _533 = _519 * _531;
                    float _535 = _517 * _531;
                    float _537 = _521 * _531;
                    _407 = _535;
                    _403 = _533;
                    _411 = _537;
                    _451 = true;
                }
            }
            else
            {
                float _539 = _127 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _541 = _127 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _543 = _127 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _545 = fma(_125, (*spvDescriptorSet0.vp_c10)._m0[5].x, _539);
                float _547 = fma(_125, (*spvDescriptorSet0.vp_c10)._m0[4].x, _541);
                float _549 = fma(_125, (*spvDescriptorSet0.vp_c10)._m0[6].x, _543);
                float _551 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[5].z, _545);
                float _553 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[4].z, _547);
                float _555 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[6].z, _549);
                float _557 = _551 * _551;
                float _559 = fma(_553, _553, _557);
                float _561 = fma(_555, _555, _559);
                float _563 = rsqrt(_561);
                float _565 = _563 * 9.9999999747524270787835121154785e-07;
                float _567 = _553 * _565;
                float _569 = _551 * _565;
                float _571 = _555 * _565;
                _407 = _569;
                _403 = _567;
                _411 = _571;
            }
        }
    }
    _451 = false;
    float _573 = _407;
    float _575 = _403;
    float _577 = _411;
    bool _579 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _581 = !_579;
    float _599;
    if (!_581)
    {
        float _583 = in.m_39.x;
        float _585 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _587 = _583 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _589 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _591 = _589 * _585;
        float _593 = floor(_591);
        float _595 = -_593;
        float _597 = _591 + _595;
        _599 = _597;
        _601 = true;
    }
    else
    {
        float _603 = float(_69);
        float _605 = 1.0 / _603;
        float _607 = _103 * _605;
        _599 = _607;
    }
    _601 = false;
    float _609 = _599;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _613 = _609 + _611;
    bool _615 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _617 = isnan(_609);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _627;
    float _631 = -_625;
    float _633 = _631 + 1.0;
    bool _635 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _637 = isnan(_609);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _647;
    bool _651 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _653 = 1.0 / _629;
    float _655 = _645 * _633;
    float _657 = -_645;
    float _659 = _657 + 1.0;
    float _661 = _613 * _653;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _663;
    float _667 = fma(_649, _661, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _669 = fma(_665, _661, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _671 = _667 * _655;
    float _673 = _669 * _655;
    float _675 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[143].x, _671);
    float _677 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[143].y, _673);
    float _679 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[144].x, _675);
    float _681 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[144].y, _677);
    bool _683 = !_651;
    float _703;
    float _705;
    if (!_683)
    {
        float _685 = in.m_39.x;
        float _687 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _689 = float(_69);
        float _691 = _685 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _693 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _695 = _693 * _687;
        float _697 = floor(_695);
        float _699 = -_697;
        float _701 = _695 + _699;
        _703 = _689;
        _705 = _701;
        _707 = true;
    }
    else
    {
        float _709 = float(_69);
        float _711 = 1.0 / _709;
        float _713 = _103 * _711;
        _703 = _709;
        _705 = _713;
    }
    _707 = false;
    float _715 = _703;
    float _717 = _705;
    float _719 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _721 = int(_719);
    float _723 = in.m_39.x;
    float _725 = _391 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _729 = _727 != 0;
    float _731 = as_type<float>(int(gl_VertexIndex));
    float _733 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _735 = int(_733);
    bool _737 = !_729;
    float _739 = _737 ? 1.2345600128173828125 : 1.0;
    float _741 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].x, _725);
    float _743 = float(_721);
    float _745 = 1.0 / _715;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _749 = _743;
    if (!_729)
    {
        float _751 = in.m_39.y;
        _747 = _751;
    }
    float _753 = _747;
    float _755 = float(uint(_735));
    float _757 = 1.0 / _743;
    float _759 = 1.0 / _755;
    float _761 = _103 * _757;
    if (!_729)
    {
        _749 = _753;
    }
    float _763 = _749;
    float _765 = trunc(_761);
    int _767 = int(_765);
    float _769 = _763;
    int _771 = as_type<int>(_753);
    if (_729)
    {
        float _773 = in.m_39.x;
        float _775 = in.m_39.y;
        _769 = _773;
        _771 = as_type<int>(_775);
    }
    float _777 = _769;
    int _779 = _771;
    int _781 = as_type<int>(_759) + (-2);
    int _783 = ~_735;
    int _785 = _783 + 1;
    float _787 = float(uint(_767));
    float _789 = as_type<float>(_781) * _787;
    float _791 = trunc(_789);
    float _793 = precise::max(_791, 0.0);
    uint _796 = uint(_793);
    float _798 = float(_735);
    int _800 = _785 * int(_796);
    int _802 = _800 + _767;
    float _804 = float(uint(_802));
    float _806 = as_type<float>(_781) * _804;
    bool _808 = !_729;
    float _810 = _808 ? as_type<float>(_779) : _723;
    int _812 = ~_735;
    int _814 = _812 + 1;
    float _816 = trunc(_806);
    float _818 = precise::max(_816, 0.0);
    uint _820 = uint(_818);
    float _822 = _810 * _739;
    float _824 = float(_767);
    int _826 = int(_796) + int(_820);
    float _828 = floor(_822);
    bool _830 = _824 >= _798;
    bool _832 = isnan(_824);
    bool _834 = _830 || _832;
    bool _836 = isnan(_798);
    bool _838 = _834 || _836;
    float _840 = float(_838);
    int _842 = _814 * _826;
    int _844 = _842 + _767;
    bool _846 = uint(_844) >= uint(_735);
    float _848 = trunc(_840);
    int _850 = int(_848);
    bool _852 = !_846;
    int _854 = _852 ? 0 : (-1);
    int _856 = as_type<int>(_731) & 1;
    bool _858 = _856 != 0;
    int _860 = as_type<int>(_731) & 2;
    bool _862 = _860 != 0;
    int _864 = ~_826;
    int _866 = _864 + _854;
    int _868 = _866 + 1;
    float _870 = -_828;
    float _872 = _822 + _870;
    bool _874 = _735 == 0;
    int _876 = _735 * _868;
    int _878 = _876 + _767;
    int _880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _882 = _880 != 0;
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _886 = _884 != 0;
    float _888 = _798 * _872;
    float _890 = _103 * _798;
    int _892 = ~_850;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    bool _898 = !_874;
    int _900 = _898 ? _878 : (-1);
    bool _902 = !_858;
    float _904 = _902 ? (-0.5) : 0.5;
    float _906 = trunc(_888);
    int _908 = int(_906);
    bool _910 = !_862;
    float _912 = _910 ? (-0.5) : 0.5;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _916 = _914 != 0;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _920 = _918 != 0;
    float _922 = _890 * _745;
    int _924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _926 = _924 != 0;
    int _928 = _896 * _900;
    int _930 = _735 + (-1);
    float _932 = trunc(_922);
    int _934 = int(_932);
    bool _936 = !_926;
    int _938 = _936 ? 0 : 1;
    bool _940 = !_920;
    int _942 = _940 ? 0 : 1;
    int _944 = _850 * _930;
    int _946 = _944 + _928;
    bool _948 = !_916;
    int _950 = _948 ? 0 : 1;
    int _952 = abs(_938);
    bool _954 = !_882;
    int _956 = _954 ? 0 : 1;
    int _958 = abs(_942);
    int _960 = abs(_950);
    int _962 = _946 * _958;
    bool _964 = !_886;
    int _966 = _964 ? 0 : 1;
    int _968 = abs(_956);
    int _970 = _908 * _952;
    int _972 = _970 + _767;
    int _974 = abs(_966);
    int _976 = _934 * _960;
    int _978 = _976 + _962;
    int _980 = ~_735;
    int _982 = _980 + 1;
    int _984 = _972 * _968;
    int _986 = _984 + _978;
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _990 = _988 != 0;
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _994 = _992 != 0;
    int _996 = _908 * _974;
    int _998 = _996 + _986;
    int _1000 = ~_735;
    int _1002 = _1000 + 1;
    int _1004 = ~_735;
    int _1006 = _1004 + 1;
    float _1008 = float(uint(_998));
    float _1010 = as_type<float>(_781) * _1008;
    float _1012 = trunc(_1010);
    float _1014 = precise::max(_1012, 0.0);
    uint _1016 = uint(_1014);
    int _1018 = _1002 * int(_1016);
    int _1020 = _1018 + _998;
    float _1022 = float(uint(_1020));
    float _1024 = as_type<float>(_781) * _1022;
    float _1026 = trunc(_1024);
    float _1028 = precise::max(_1026, 0.0);
    uint _1030 = uint(_1028);
    int _1032 = int(_1016) + int(_1030);
    float _1034 = in.m_39.w;
    int _1036 = _982 * _1032;
    int _1038 = _1036 + _998;
    bool _1040 = uint(_1038) >= uint(_735);
    bool _1042 = !_1040;
    int _1044 = _1042 ? 0 : (-1);
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1048 = _1046 != 0;
    float _1050 = _391 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1052 = ~_1032;
    int _1054 = _1052 + _1044;
    int _1056 = _1054 + 1;
    float _1058 = in.m_37.x;
    float _1060 = in.m_37.y;
    float _1062 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1050);
    int _1064 = _735 * _1056;
    int _1066 = _1064 + _998;
    bool _1068 = _1034 > 0.5;
    float _1070 = _391 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1072 = !_874;
    int _1074 = _1072 ? _1066 : (-1);
    float _1076 = float(uint(_972));
    float _1078 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1070);
    int _1080 = _1074 >> 31;
    int _1082 = _1074 & 3;
    bool _1084 = _1082 != 0;
    float _1086 = as_type<float>(_781) * _1076;
    int _1088 = _1080 & 3;
    float _1090 = trunc(_1086);
    float _1092 = precise::max(_1090, 0.0);
    uint _1094 = uint(_1092);
    int _1096 = _1074 + _1088;
    int _1098 = _1084 ? 0 : 1;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1102 = _1100 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1104 = _1096 >> 2;
    float _1106 = _679 * _1058;
    bool _1108 = uint(_1082) >= 2u;
    float _1110 = 1.0 / _1102;
    int _1112 = _1104 << 4;
    int _1114 = _1112 + 512;
    float _1116 = _681 * _1060;
    int _1118 = _1108 ? 0 : 1;
    uint _1120 = uint(int(uint(_1114) >> uint(2)));
    uint _1122 = uint(int(uint(int(_1120)) >> uint(2)));
    int _1124 = int(_1120) & 3;
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[int(_1122)][_1124];
    int _1128 = int(_1120) + 1;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    int _1132 = _1128 & 3;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[int(_1130)][_1132];
    bool _1136 = _1082 != 3;
    int _1138 = _1006 * int(_1094);
    int _1140 = _1138 + _972;
    int _1142 = ~_1118;
    int _1144 = _1142 + 1;
    int _1146 = _1144 + 1;
    float _1148 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1078);
    float _1150 = _1116 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1152 = float(uint(_1140));
    int _1154 = ~_1098;
    int _1156 = _1154 + 1;
    int _1158 = _1156 + 1;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1162 = _1160 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1164;
    float _1168 = as_type<float>(_781) * _1152;
    float _1170 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1062);
    int _1172 = _1146;
    int _1174 = _1158;
    if (_1136)
    {
        int _1176 = ~_1118;
        int _1178 = _1176 + 1;
        _1172 = _1178;
    }
    int _1180 = _1172;
    float _1182 = _1166 * _1110;
    int _1184 = _1114 + 8;
    uint _1186 = uint(int(uint(_1184) >> uint(2)));
    uint _1188 = uint(int(uint(int(_1186)) >> uint(2)));
    int _1190 = int(_1186) & 3;
    float _1192 = (*spvDescriptorSet0.vp_c9)._m0[int(_1188)][_1190];
    int _1194 = int(_1186) + 1;
    uint _1196 = uint(int(uint(_1194) >> uint(2)));
    int _1198 = _1194 & 3;
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[int(_1196)][_1198];
    bool _1202 = uint(_1082) > 1u;
    float _1204 = trunc(_1168);
    float _1206 = precise::max(_1204, 0.0);
    uint _1208 = uint(_1206);
    int _1210 = abs(_1180);
    float _1212 = _573 * _573;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1216 = 1.0 / _1162;
    float _1218 = fma(_575, _575, _1212);
    if (!_1202)
    {
        int _1220 = ~_1098;
        int _1222 = _1220 + 1;
        _1174 = _1222;
    }
    int _1224 = _1174;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1228 = _717 + _1226;
    int _1230 = _1074 & 3;
    bool _1232 = _1230 != 0;
    float _1234 = fma(_577, _577, _1218);
    int _1236 = abs(_1224);
    float _1238 = fma(_1182, _1228, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1240 = !_1232;
    int _1242 = _1240 ? 0 : 1;
    out.m_44.w = _1214;
    int _1244 = int(_1094) + int(_1208);
    float _1246 = rsqrt(_1234);
    int _1248 = abs(_1242);
    float _1250 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].z, _741);
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1254 = _1252 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1256 = ~_735;
    int _1258 = _1256 + 1;
    float _1260 = _1250 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1262 = ~_1236;
    int _1264 = _1262 + 1;
    int _1266 = _1264 + 1;
    float _1268 = _1254 * _1216;
    bool _1270 = _1082 != 3;
    int _1272 = _1266 * as_type<int>(_1134);
    int _1274 = ~_1248;
    int _1276 = _1274 + 1;
    int _1278 = _1276 + 1;
    int _1280 = _1258 * _1244;
    int _1282 = _1280 + _972;
    bool _1284 = !_1270;
    int _1286 = _1284 ? 0 : (-1);
    float _1288 = in.m_39.z;
    float _1290 = _1246 * _577;
    int _1292 = _1278 * as_type<int>(_1126);
    int _1294 = _1292 + _1272;
    int _1296 = abs(_1286);
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1300 = _717 + _1298;
    bool _1302 = uint(_1282) >= uint(_735);
    float _1304 = _1246 * _575;
    bool _1306 = !_1302;
    int _1308 = _1306 ? 0 : (-1);
    float _1310 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1312 = int(_1310);
    int _1314 = ~_1210;
    int _1316 = _1314 + 1;
    int _1318 = _1316 + 1;
    int _1320 = ~_1296;
    int _1322 = _1320 + 1;
    int _1324 = _1322 + 1;
    int _1326 = ~_1244;
    int _1328 = _1326 + _1308;
    int _1330 = _1328 + 1;
    int _1332 = _1318 * as_type<int>(_1192);
    int _1334 = _1332 + _1294;
    bool _1336 = !_994;
    int _1338 = _1336 ? 0 : 1;
    float _1340 = _1246 * _573;
    bool _1342 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1344 = isnan(_717);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1350 = _1346 || _1348;
    float _1352 = float(_1350);
    int _1354 = _1324 * as_type<int>(_1200);
    int _1356 = _1354 + _1334;
    bool _1358 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1360 = isnan(_717);
    bool _1362 = _1358 || _1360;
    bool _1364 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1366 = _1362 || _1364;
    float _1368 = float(_1366);
    int _1370 = _735 * _1330;
    int _1372 = _1370 + _972;
    bool _1374 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1376 = isnan(_717);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1382 = _1378 || _1380;
    float _1384 = float(_1382);
    float _1386 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1388 = _1290 * _1386;
    int _1390 = abs(_1338);
    float _1392 = fma(_1268, _1300, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1394 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1396 = _1340 * _1394;
    float _1398 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1400 = -_1388;
    float _1402 = fma(_1304, _1398, _1400);
    int _1404 = ~_1390;
    int _1406 = _1404 + 1;
    int _1408 = _1406 + 1;
    float _1410 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1412 = _1304 * _1410;
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1416 = -_1396;
    float _1418 = fma(_1290, _1414, _1416);
    float _1420 = _1402 * _1402;
    float _1422 = -_1352;
    float _1424 = _1422 + 1.0;
    int _1426 = _1408 * _1356;
    float _1428 = float(uint(_1312));
    float _1430 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1432 = -_1412;
    float _1434 = fma(_1340, _1430, _1432);
    int _1436 = abs(_1312);
    float _1438 = fma(_1418, _1418, _1420);
    bool _1440 = _1288 > 0.5;
    float _1442 = _1368 * _1424;
    float _1444 = 1.0 / _1428;
    float _1446 = float(uint(_1436));
    float _1448 = fma(_1434, _1434, _1438);
    float _1450 = -_904;
    int _1452 = _1440 ? as_type<int>(_1450) : as_type<int>(_904);
    float _1454 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1456 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _904);
    bool _1458 = !_874;
    int _1460 = _1458 ? _1372 : (-1);
    float _1462 = 1.0 / _1446;
    bool _1464 = !_990;
    float _1466 = _1464 ? _904 : as_type<float>(_1452);
    float _1468 = _1454 * _1456;
    float _1470 = -_1368;
    float _1472 = _1470 + 1.0;
    float _1474 = -_912;
    int _1476 = _1068 ? as_type<int>(_1474) : as_type<int>(_912);
    int _1478 = _1460 * _1390;
    int _1480 = _1478 + _1426;
    int _1482 = ~_1312;
    int _1484 = _1482 + 1;
    float _1486 = _1384 * _1472;
    bool _1488 = !_1048;
    float _1490 = _1488 ? _912 : as_type<float>(_1476);
    float _1492 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _912);
    int _1494 = abs(_1480);
    float _1496 = rsqrt(_1448);
    int _1498 = as_type<int>(_1444) + (-2);
    float _1500 = _1150 * _1492;
    float _1502 = float(uint(_1480));
    float _1504 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1506 = -_1384;
    float _1508 = _1506 + 1.0;
    int _1510 = as_type<int>(_1462) + (-2);
    float _1512 = _1238 * _1486;
    float _1514 = float(uint(_1494));
    float _1516 = as_type<float>(_1498) * _1502;
    int _1518 = ~_1436;
    int _1520 = _1518 + 1;
    float _1522 = as_type<float>(_1494);
    float _1524 = _1288;
    if (!_729)
    {
        _1522 = _1288;
    }
    float _1526 = _1522;
    float _1528 = as_type<float>(_1510) * _1514;
    float _1530 = _1402 * _1496;
    float _1532 = trunc(_1516);
    float _1534 = precise::max(_1532, 0.0);
    uint _1536 = uint(_1534);
    float _1538 = _1434 * _1496;
    float _1540 = _1418 * _1496;
    float _1542 = _1500 * _1304;
    float _1544 = _1500 * _1290;
    float _1546 = _1340 * _1538;
    float _1548 = _1304 * _1530;
    float _1550 = fma(_1468, _1540, _1542);
    float _1552 = trunc(_1528);
    float _1554 = precise::max(_1552, 0.0);
    uint _1556 = uint(_1554);
    float _1558 = fma(_1468, _1538, _1544);
    float _1560 = -_1546;
    float _1562 = fma(_1290, _1530, _1560);
    float _1564 = -_1548;
    float _1566 = fma(_1340, _1540, _1564);
    float _1568 = _1526;
    if (_729)
    {
        _1568 = as_type<float>(_779);
    }
    float _1570 = _1568;
    if (_729)
    {
        _1524 = as_type<float>(_779);
    }
    float _1572 = _1524;
    float _1574 = fma(_1504, _1566, _1558);
    int _1576 = _1484 * int(_1536);
    int _1578 = _1576 + _1480;
    float _1580 = fma(_1504, _1562, _1550);
    float _1582 = _1170 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1584 = _1260 + _1574;
    float _1586 = float(uint(_1578));
    float _1588 = _1582 + _1580;
    float _1590 = _1500 * _1340;
    int _1592 = _1520 * int(_1556);
    int _1594 = _1592 + _1494;
    float _1596 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1512);
    float _1598 = as_type<float>(_1498) * _1586;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1602 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1604 = _1588 + _1602;
    float _1606 = float(uint(_1594));
    float _1608 = trunc(_1598);
    float _1610 = precise::max(_1608, 0.0);
    uint _1612 = uint(_1610);
    float _1614 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1600);
    float _1616 = fma(_1392, _1442, _1596);
    float _1618 = as_type<float>(_1510) * _1606;
    float _1620 = _777 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1622 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1624 = _1584 + _1622;
    float _1626 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1628 = _1290 * _1540;
    float _1630 = _1624 * _1624;
    float _1632 = trunc(_1618);
    float _1634 = precise::max(_1632, 0.0);
    uint _1636 = uint(_1634);
    float _1638 = -_1626;
    float _1640 = fma(_1620, 2.0, _1638);
    float _1642 = fma(_1604, _1604, _1630);
    float _1644 = -_1628;
    float _1646 = fma(_1304, _1538, _1644);
    float _1648 = fma(_1468, _1530, _1590);
    float _1650 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1654 = sqrt(_1642);
    float _1656 = _1570 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1658 = int(_1536) + int(_1612);
    float _1660 = fma(_1504, _1646, _1648);
    int _1662 = ~_1312;
    int _1664 = _1662 + 1;
    float _1666 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1652);
    float _1668 = fma(_1656, -2.0, _1650);
    float _1670 = _1148 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1674 = _1664 * _1658;
    int _1676 = _1674 + _1480;
    float _1678 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1666);
    int _1680 = int(_1556) + int(_1636);
    float _1682 = _1670 + _1660;
    int _1684 = ~_1436;
    int _1686 = _1684 + 1;
    float _1688 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1616);
    bool _1690 = uint(_1676) >= uint(_1312);
    float _1692 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1614);
    bool _1694 = _1654 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1696 = -_103;
    float _1698 = fma(_1696, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1640);
    float _1700 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1668);
    int _1702 = _1686 * _1680;
    int _1704 = _1702 + _1494;
    bool _1706 = !_1690;
    int _1708 = _1706 ? 0 : (-1);
    float _1710 = _1670;
    float _1712 = _1588;
    float _1714 = _1584;
    if (!_1694)
    {
        _1710 = _1588;
    }
    float _1716 = _1710;
    float _1718 = _1716;
    if (!_1694)
    {
        _1712 = _1682;
    }
    float _1720 = _1712;
    bool _1722 = !_1694;
    float _1724 = _1720;
    if (!_1722)
    {
        float _1726 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1728 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1730 = _1654 + _1728;
        float _1732 = _1682 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1734 = rsqrt(_1642);
        float _1736 = _1730 * _1726;
        float _1738 = _1736 * 0.15915493667125701904296875;
        float _1740 = _1738 * 6.283185482025146484375;
        float _1742 = sin(_1740);
        float _1744 = _1738 * 6.283185482025146484375;
        float _1746 = cos(_1744);
        float _1748 = fma(_1742, _1732, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1750 = _1734 * _1748;
        float _1752 = _1746 + (-1.0);
        float _1754 = fma(_1604, _1750, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1756 = fma(_1624, _1750, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1758 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1760 = fma(_1682, _1746, _1758);
        _1724 = _1760;
        _1718 = _1754;
        _1714 = _1756;
    }
    float _1762 = _1724;
    float _1764 = _1718;
    float _1766 = _1714;
    int _1768 = ~_1658;
    int _1770 = _1768 + _1708;
    int _1772 = _1770 + 1;
    float _1774 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1776 = uint(_1704) >= uint(_1436);
    float _1778 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _1780 = _1480 ^ _1312;
    int _1782 = _1312 * _1772;
    int _1784 = _1782 + _1480;
    bool _1786 = !_1776;
    int _1788 = _1786 ? 0 : (-1);
    float _1790 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    uint _1792 = uint(int(uint(_1780) >> uint(31)));
    float _1794 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1796 = _1312 == 0;
    float _1798 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1800 = _1312 == 0;
    float _1802 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1778);
    int _1804 = ~_1788;
    int _1806 = _1680 + _1804;
    int _1808 = _1806 + 1;
    float _1810 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1790);
    int _1812 = ~int(_1792);
    int _1814 = _1812 + 1;
    float _1816 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1794);
    bool _1818 = !_1796;
    int _1820 = _1818 ? _1784 : (-1);
    float _1822 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1798);
    int _1824 = _1808 ^ _1814;
    float _1826 = _1672 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1828 = float(_1820);
    float _1830 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1810);
    int _1832 = ~_1814;
    int _1834 = _1832 + _1824;
    int _1836 = _1834 + 1;
    float _1838 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1802);
    float _1840 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1816);
    float _1842 = fma(_1826, _1828, _1698);
    bool _1844 = !_1800;
    int _1846 = _1844 ? _1836 : (-1);
    float _1848 = _1830 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1850 = _1774 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1852 = _1838 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1854 = float(_1846);
    float _1856 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1858 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1860 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1862 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1822);
    float _1864 = _1466 + 0.5;
    float _1866 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1868 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1856);
    float _1870 = _1840 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1872 = -_1700;
    float _1874 = fma(_1850, _1854, _1872);
    float _1876 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1858);
    float _1878 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1860);
    float _1880 = _1490 + (-0.5);
    float _1882 = fma(_1826, _1864, _1842);
    float _1884 = -_1692;
    float _1886 = _1884 + 1.0;
    float _1888 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1866);
    float _1890 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1868);
    float _1892 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1876);
    float _1894 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1878);
    float _1896 = -_1850;
    float _1898 = fma(_1896, _1880, _1874);
    float _1900 = _1862 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1902 = -_1886;
    float _1904 = fma(_1466, _1902, _1882);
    float _1906 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1888);
    float _1908 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1892);
    float _1910 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1894);
    float _1912 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1890);
    float _1914 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1906);
    float _1916 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1918 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1920 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1922 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1924 = -_1678;
    float _1926 = _1924 + 1.0;
    float _1928 = _1908 + _1910;
    float _1930 = _1688 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1932 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1934 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1936 = _1918 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1938 = _1928 * 0.5;
    float _1940 = fma(_1490, _1926, _1898);
    out.m_33.x = _1920;
    out.m_46.x = _1932;
    out.m_46.y = _1934;
    out.m_46.z = _1936;
    out.m_46.w = _1930;
    out.gl_Position.x = _1912;
    out.gl_Position.y = _1914;
    out.gl_Position.z = _1908;
    out.gl_Position.w = _1910;
    out.m_48.z = _1938;
    out.m_48.w = _1910;
    out.m_50.z = _1904;
    out.m_50.w = _1940;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

