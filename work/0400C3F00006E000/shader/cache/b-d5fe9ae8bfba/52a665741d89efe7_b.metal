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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
};

struct main0_out
{
    float4 m_44 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_48 [[user(locn4)]];
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
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _703 = false;
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
        float _1420 = as_type<float>(_85);
        out.gl_Position.z = _1420;
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
        float _1490 = as_type<float>(_123);
        out.gl_Position.z = _1490;
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
    float _395 = _343;
    float _397 = _369;
    float _399 = _325;
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
    float _701;
    if (!_683)
    {
        float _685 = in.m_39.x;
        float _687 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _689 = _685 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _693 = _691 * _687;
        float _695 = floor(_693);
        float _697 = -_695;
        float _699 = _693 + _697;
        _701 = _699;
        _703 = true;
    }
    else
    {
        float _705 = float(_69);
        float _707 = 1.0 / _705;
        float _709 = _103 * _707;
        _701 = _709;
    }
    _703 = false;
    float _711 = _701;
    float _713 = as_type<float>(int(gl_VertexIndex));
    float _715 = _573 * _573;
    float _717 = in.m_39.z;
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _721 = _719 != 0;
    float _723 = fma(_575, _575, _715);
    float _725 = in.m_39.w;
    float _727 = fma(_577, _577, _723);
    float _729 = _391 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _731 = in.m_39.x;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _737 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].x, _729);
    float _739 = in.m_37.x;
    float _741 = in.m_37.y;
    float _743 = 1.0 / _735;
    float _745 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    int _747 = as_type<int>(_713) & 1;
    bool _749 = _747 != 0;
    int _751 = as_type<int>(_713) & 2;
    bool _753 = _751 != 0;
    float _755 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _757 = _717 > 0.5;
    out.m_33.x = _745;
    bool _759 = !_749;
    float _761 = _759 ? (-0.5) : 0.5;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _767 = _725 > 0.5;
    bool _769 = !_753;
    float _771 = _769 ? (-0.5) : 0.5;
    float _773 = 1.0 / _765;
    float _775 = -_761;
    int _777 = _757 ? as_type<int>(_775) : as_type<int>(_761);
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _781 = _779 != 0;
    int _783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _785 = _783 != 0;
    float _787 = _679 * _739;
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _791 = _789 != 0;
    float _793 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].z, _737);
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _797 = _795 != 0;
    float _799 = _391 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _801 = _731 > 0.5;
    float _803 = _391 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _805 = _681 * _741;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _809 = _807 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _811 = rsqrt(_727);
    float _813 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].x, _799);
    float _815 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].x, _803);
    float _817 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].z, _813);
    float _819 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].z, _815);
    float _821 = 1.0 / _809;
    float _823 = _393;
    if (!_721)
    {
        float _825 = in.m_39.y;
        _823 = _825;
    }
    float _827 = _823;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _833 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _835 = isnan(_711);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _845;
    float _849 = _817 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _851 = _831 * _743;
    bool _853 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _855 = isnan(_711);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = _811 * _577;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _867;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _873 = _711 + _871;
    float _875 = _811 * _575;
    float _877 = _811 * _573;
    float _879 = _869 * _773;
    float _881 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _883 = _865 * _881;
    float _885 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _887 = _875 * _885;
    float _889 = _847 * _821;
    float _891 = fma(_879, _873, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _895 = _877 * _893;
    float _897 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _899 = -_883;
    float _901 = fma(_875, _897, _899);
    float _903 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _905 = -_887;
    float _907 = fma(_877, _903, _905);
    bool _909 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _911 = isnan(_711);
    bool _913 = _909 || _911;
    bool _915 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _917 = _913 || _915;
    float _919 = float(_917);
    float _921 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _923 = -_895;
    float _925 = fma(_865, _921, _923);
    float _927 = _901 * _901;
    bool _929 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _931 = isnan(_711);
    bool _933 = _929 || _931;
    bool _935 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _937 = _933 || _935;
    float _939 = float(_937);
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _943 = _711 + _941;
    float _945 = -_919;
    float _947 = _945 + 1.0;
    float _949 = fma(_925, _925, _927);
    float _951 = _895;
    if (!_721)
    {
        _951 = _827;
    }
    float _953 = _951;
    float _955 = fma(_851, _943, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _957 = _939 * _947;
    float _959 = fma(_907, _907, _949);
    float _961 = -_939;
    float _963 = _961 + 1.0;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _967 = _711 + _965;
    float _969 = _953;
    float _971 = _827;
    if (_721)
    {
        float _973 = in.m_39.x;
        float _975 = in.m_39.y;
        _969 = _973;
        _971 = _975;
    }
    float _977 = _969;
    float _979 = _971;
    float _981 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _761);
    float _983 = _863 * _963;
    float _985 = rsqrt(_959);
    float _987 = -_863;
    float _989 = _987 + 1.0;
    float _991 = fma(_889, _967, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _993 = _787 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _995 = -_761;
    float _997 = _801 ? _995 : _761;
    float _999 = _843 * _989;
    float _1001 = _805 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1003 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _771);
    bool _1005 = !_781;
    float _1007 = _1005 ? _761 : as_type<float>(_777);
    float _1009 = _993 * _981;
    bool _1011 = !_791;
    float _1013 = _1011 ? _761 : _997;
    float _1015 = _891 * _999;
    float _1017 = _1001 * _1003;
    float _1019 = _997;
    float _1021 = _999;
    if (!_721)
    {
        _1019 = _717;
    }
    float _1023 = _1019;
    float _1025 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1027 = _1023;
    if (!_721)
    {
        _1021 = _717;
    }
    float _1029 = _1021;
    float _1031 = _901 * _985;
    float _1033 = _907 * _985;
    float _1035 = _1017 * _865;
    float _1037 = _925 * _985;
    float _1039 = _875 * _1031;
    float _1041 = _1017 * _875;
    float _1043 = _877 * _1033;
    float _1045 = fma(_1009, _1033, _1035);
    float _1047 = -_1039;
    float _1049 = fma(_877, _1037, _1047);
    float _1051 = _1029;
    if (_721)
    {
        _1027 = _979;
    }
    float _1053 = _1027;
    float _1055 = fma(_1009, _1037, _1041);
    if (_721)
    {
        _1051 = _979;
    }
    float _1057 = _1051;
    float _1059 = -_1043;
    float _1061 = fma(_865, _1031, _1059);
    bool _1063 = _979 > 0.5;
    float _1065 = fma(_1025, _1049, _1045);
    float _1067 = _793 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1069 = -_843;
    float _1071 = _1069 + 1.0;
    float _1073 = fma(_1025, _1061, _1055);
    float _1075 = _1067 + _1065;
    float _1077 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1015);
    float _1079 = _849 + _1073;
    float _1081 = _977 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1083 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1085 = _1075 + _1083;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1089 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1091 = _1079 + _1089;
    float _1093 = fma(_955, _983, _1077);
    float _1095 = _1085 * _1085;
    float _1097 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1087);
    float _1099 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1101 = fma(_1091, _1091, _1095);
    float _1103 = _1017 * _877;
    float _1105 = _865 * _1037;
    float _1107 = _1053 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1111 = sqrt(_1101);
    float _1113 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1115 = -_771;
    int _1117 = _1063 ? as_type<int>(_1115) : as_type<int>(_771);
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1121 = -_771;
    int _1123 = _767 ? as_type<int>(_1121) : as_type<int>(_771);
    float _1125 = fma(_1009, _1031, _1103);
    float _1127 = -_1105;
    float _1129 = fma(_875, _1033, _1127);
    float _1131 = fma(_1107, -2.0, _1113);
    float _1133 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1109);
    float _1135 = -_1119;
    float _1137 = fma(_1081, 2.0, _1135);
    bool _1139 = !_785;
    float _1141 = _1139 ? _771 : as_type<float>(_1123);
    float _1143 = fma(_1025, _1129, _1125);
    float _1145 = _819 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1147 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1097);
    float _1149 = -_103;
    float _1151 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1137);
    float _1153 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1133);
    bool _1155 = _1111 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1157 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1131);
    float _1159 = fma(_991, _957, _1093);
    float _1161 = _1145 + _1143;
    float _1163 = _755 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1165 = _1099 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1167 = _1007 + 0.5;
    float _1169 = _1141 + (-0.5);
    float _1171 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1159);
    bool _1173 = !_797;
    float _1175 = _1173 ? _771 : as_type<float>(_1117);
    float _1177 = fma(_1163, _1167, _1151);
    float _1179 = -_1165;
    float _1181 = -_1157;
    float _1183 = fma(_1179, _1169, _1181);
    float _1185 = _1159;
    float _1187 = _1079;
    float _1189 = _1075;
    if (!_1155)
    {
        _1185 = _1161;
    }
    float _1191 = _1185;
    bool _1193 = !_1155;
    float _1195 = _1191;
    if (!_1193)
    {
        float _1197 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1199 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1201 = _1111 + _1199;
        float _1203 = rsqrt(_1101);
        float _1205 = _1201 * _1197;
        float _1207 = _1161 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1209 = _1205 * 0.15915493667125701904296875;
        float _1211 = _1209 * 6.283185482025146484375;
        float _1213 = sin(_1211);
        float _1215 = _1209 * 6.283185482025146484375;
        float _1217 = cos(_1215);
        float _1219 = fma(_1213, _1207, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1221 = _1203 * _1219;
        float _1223 = _1217 + (-1.0);
        float _1225 = fma(_1091, _1221, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1227 = fma(_1085, _1221, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1229 = _1223 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1231 = fma(_1161, _1217, _1229);
        _1195 = _1231;
        _1187 = _1225;
        _1189 = _1227;
    }
    float _1233 = _1195;
    float _1235 = _1187;
    float _1237 = _1189;
    float _1239 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1241 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1243 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1245 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1247 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1239);
    float _1249 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1241);
    float _1251 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1243);
    float _1253 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1245);
    float _1255 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1247);
    float _1257 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1249);
    float _1259 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1251);
    float _1261 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1253);
    float _1263 = _1255 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1265 = _1257 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1267 = _1259 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1269 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1271 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1273 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1275 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1277 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1279 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1271);
    float _1281 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1273);
    float _1283 = -_1175;
    float _1285 = _1283 + 0.5;
    float _1287 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1275);
    float _1289 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1277);
    float _1291 = -_1147;
    float _1293 = _1291 + 1.0;
    float _1295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1297 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1279);
    float _1299 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1281);
    float _1301 = _1261 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1303 = _1013 + 0.5;
    float _1305 = -_1153;
    float _1307 = _1305 + 1.0;
    float _1309 = _1285 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1311 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1287);
    float _1313 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1289);
    float _1315 = -_1293;
    float _1317 = fma(_1007, _1315, _1177);
    float _1319 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1299);
    float _1321 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1323 = fma(_1141, _1307, _1183);
    float _1325 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1297);
    float _1327 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1311);
    float _1329 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1313);
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1335 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1337 = _1331 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1339 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1341 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1343 = _1319 + _1329;
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1347 = _1321 * _1269;
    float _1349 = _1333 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1351 = _1335 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1353 = _1171 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1355 = _1309 * _1295;
    float _1357 = _1339 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1359 = _1341 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1361 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1363 = _1343 * 0.5;
    out.m_44.x = _1337;
    out.m_44.y = _1357;
    out.m_44.z = _1359;
    out.m_44.w = _1353;
    out.m_46.x = _1351;
    out.m_46.y = _1349;
    out.m_46.z = _1361;
    out.m_48.x = _1347;
    out.m_48.y = _1355;
    out.m_48.z = _1317;
    out.m_48.w = _1323;
    out.gl_Position.x = _1325;
    out.gl_Position.y = _1327;
    out.gl_Position.z = _1319;
    out.gl_Position.w = _1329;
    out.m_50.z = _1363;
    out.m_50.w = _1329;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _703 = false;
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
        float _1420 = as_type<float>(_85);
        out.gl_Position.z = _1420;
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
        float _1490 = as_type<float>(_123);
        out.gl_Position.z = _1490;
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
    float _395 = _343;
    float _397 = _369;
    float _399 = _325;
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
    float _701;
    if (!_683)
    {
        float _685 = in.m_39.x;
        float _687 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _689 = _685 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _693 = _691 * _687;
        float _695 = floor(_693);
        float _697 = -_695;
        float _699 = _693 + _697;
        _701 = _699;
        _703 = true;
    }
    else
    {
        float _705 = float(_69);
        float _707 = 1.0 / _705;
        float _709 = _103 * _707;
        _701 = _709;
    }
    _703 = false;
    float _711 = _701;
    float _713 = as_type<float>(int(gl_VertexIndex));
    float _715 = _573 * _573;
    float _717 = in.m_39.z;
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _721 = _719 != 0;
    float _723 = fma(_575, _575, _715);
    float _725 = in.m_39.w;
    float _727 = fma(_577, _577, _723);
    float _729 = _391 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _731 = in.m_39.x;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _737 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].x, _729);
    float _739 = in.m_37.x;
    float _741 = in.m_37.y;
    float _743 = 1.0 / _735;
    float _745 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    int _747 = as_type<int>(_713) & 1;
    bool _749 = _747 != 0;
    int _751 = as_type<int>(_713) & 2;
    bool _753 = _751 != 0;
    float _755 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _757 = _717 > 0.5;
    out.m_33.x = _745;
    bool _759 = !_749;
    float _761 = _759 ? (-0.5) : 0.5;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _767 = _725 > 0.5;
    bool _769 = !_753;
    float _771 = _769 ? (-0.5) : 0.5;
    float _773 = 1.0 / _765;
    float _775 = -_761;
    int _777 = _757 ? as_type<int>(_775) : as_type<int>(_761);
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _781 = _779 != 0;
    int _783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _785 = _783 != 0;
    float _787 = _679 * _739;
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _791 = _789 != 0;
    float _793 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].z, _737);
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _797 = _795 != 0;
    float _799 = _391 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _801 = _731 > 0.5;
    float _803 = _391 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _805 = _681 * _741;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _809 = _807 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _811 = rsqrt(_727);
    float _813 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].x, _799);
    float _815 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].x, _803);
    float _817 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].z, _813);
    float _819 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].z, _815);
    float _821 = 1.0 / _809;
    float _823 = _393;
    if (!_721)
    {
        float _825 = in.m_39.y;
        _823 = _825;
    }
    float _827 = _823;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _833 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _835 = isnan(_711);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _845;
    float _849 = _817 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _851 = _831 * _743;
    bool _853 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _855 = isnan(_711);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = _811 * _577;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _867;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _873 = _711 + _871;
    float _875 = _811 * _575;
    float _877 = _811 * _573;
    float _879 = _869 * _773;
    float _881 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _883 = _865 * _881;
    float _885 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _887 = _875 * _885;
    float _889 = _847 * _821;
    float _891 = fma(_879, _873, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _895 = _877 * _893;
    float _897 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _899 = -_883;
    float _901 = fma(_875, _897, _899);
    float _903 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _905 = -_887;
    float _907 = fma(_877, _903, _905);
    bool _909 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _911 = isnan(_711);
    bool _913 = _909 || _911;
    bool _915 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _917 = _913 || _915;
    float _919 = float(_917);
    float _921 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _923 = -_895;
    float _925 = fma(_865, _921, _923);
    float _927 = _901 * _901;
    bool _929 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _931 = isnan(_711);
    bool _933 = _929 || _931;
    bool _935 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _937 = _933 || _935;
    float _939 = float(_937);
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _943 = _711 + _941;
    float _945 = -_919;
    float _947 = _945 + 1.0;
    float _949 = fma(_925, _925, _927);
    float _951 = _895;
    if (!_721)
    {
        _951 = _827;
    }
    float _953 = _951;
    float _955 = fma(_851, _943, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _957 = _939 * _947;
    float _959 = fma(_907, _907, _949);
    float _961 = -_939;
    float _963 = _961 + 1.0;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _967 = _711 + _965;
    float _969 = _953;
    float _971 = _827;
    if (_721)
    {
        float _973 = in.m_39.x;
        float _975 = in.m_39.y;
        _969 = _973;
        _971 = _975;
    }
    float _977 = _969;
    float _979 = _971;
    float _981 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _761);
    float _983 = _863 * _963;
    float _985 = rsqrt(_959);
    float _987 = -_863;
    float _989 = _987 + 1.0;
    float _991 = fma(_889, _967, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _993 = _787 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _995 = -_761;
    float _997 = _801 ? _995 : _761;
    float _999 = _843 * _989;
    float _1001 = _805 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1003 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _771);
    bool _1005 = !_781;
    float _1007 = _1005 ? _761 : as_type<float>(_777);
    float _1009 = _993 * _981;
    bool _1011 = !_791;
    float _1013 = _1011 ? _761 : _997;
    float _1015 = _891 * _999;
    float _1017 = _1001 * _1003;
    float _1019 = _997;
    float _1021 = _999;
    if (!_721)
    {
        _1019 = _717;
    }
    float _1023 = _1019;
    float _1025 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1027 = _1023;
    if (!_721)
    {
        _1021 = _717;
    }
    float _1029 = _1021;
    float _1031 = _901 * _985;
    float _1033 = _907 * _985;
    float _1035 = _1017 * _865;
    float _1037 = _925 * _985;
    float _1039 = _875 * _1031;
    float _1041 = _1017 * _875;
    float _1043 = _877 * _1033;
    float _1045 = fma(_1009, _1033, _1035);
    float _1047 = -_1039;
    float _1049 = fma(_877, _1037, _1047);
    float _1051 = _1029;
    if (_721)
    {
        _1027 = _979;
    }
    float _1053 = _1027;
    float _1055 = fma(_1009, _1037, _1041);
    if (_721)
    {
        _1051 = _979;
    }
    float _1057 = _1051;
    float _1059 = -_1043;
    float _1061 = fma(_865, _1031, _1059);
    bool _1063 = _979 > 0.5;
    float _1065 = fma(_1025, _1049, _1045);
    float _1067 = _793 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1069 = -_843;
    float _1071 = _1069 + 1.0;
    float _1073 = fma(_1025, _1061, _1055);
    float _1075 = _1067 + _1065;
    float _1077 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1015);
    float _1079 = _849 + _1073;
    float _1081 = _977 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1083 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1085 = _1075 + _1083;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1089 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1091 = _1079 + _1089;
    float _1093 = fma(_955, _983, _1077);
    float _1095 = _1085 * _1085;
    float _1097 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1087);
    float _1099 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1101 = fma(_1091, _1091, _1095);
    float _1103 = _1017 * _877;
    float _1105 = _865 * _1037;
    float _1107 = _1053 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1111 = sqrt(_1101);
    float _1113 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1115 = -_771;
    int _1117 = _1063 ? as_type<int>(_1115) : as_type<int>(_771);
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1121 = -_771;
    int _1123 = _767 ? as_type<int>(_1121) : as_type<int>(_771);
    float _1125 = fma(_1009, _1031, _1103);
    float _1127 = -_1105;
    float _1129 = fma(_875, _1033, _1127);
    float _1131 = fma(_1107, -2.0, _1113);
    float _1133 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1109);
    float _1135 = -_1119;
    float _1137 = fma(_1081, 2.0, _1135);
    bool _1139 = !_785;
    float _1141 = _1139 ? _771 : as_type<float>(_1123);
    float _1143 = fma(_1025, _1129, _1125);
    float _1145 = _819 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1147 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1097);
    float _1149 = -_103;
    float _1151 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1137);
    float _1153 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1133);
    bool _1155 = _1111 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1157 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1131);
    float _1159 = fma(_991, _957, _1093);
    float _1161 = _1145 + _1143;
    float _1163 = _755 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1165 = _1099 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1167 = _1007 + 0.5;
    float _1169 = _1141 + (-0.5);
    float _1171 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1159);
    bool _1173 = !_797;
    float _1175 = _1173 ? _771 : as_type<float>(_1117);
    float _1177 = fma(_1163, _1167, _1151);
    float _1179 = -_1165;
    float _1181 = -_1157;
    float _1183 = fma(_1179, _1169, _1181);
    float _1185 = _1159;
    float _1187 = _1079;
    float _1189 = _1075;
    if (!_1155)
    {
        _1185 = _1161;
    }
    float _1191 = _1185;
    bool _1193 = !_1155;
    float _1195 = _1191;
    if (!_1193)
    {
        float _1197 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1199 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1201 = _1111 + _1199;
        float _1203 = rsqrt(_1101);
        float _1205 = _1201 * _1197;
        float _1207 = _1161 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1209 = _1205 * 0.15915493667125701904296875;
        float _1211 = _1209 * 6.283185482025146484375;
        float _1213 = sin(_1211);
        float _1215 = _1209 * 6.283185482025146484375;
        float _1217 = cos(_1215);
        float _1219 = fma(_1213, _1207, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1221 = _1203 * _1219;
        float _1223 = _1217 + (-1.0);
        float _1225 = fma(_1091, _1221, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1227 = fma(_1085, _1221, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1229 = _1223 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1231 = fma(_1161, _1217, _1229);
        _1195 = _1231;
        _1187 = _1225;
        _1189 = _1227;
    }
    float _1233 = _1195;
    float _1235 = _1187;
    float _1237 = _1189;
    float _1239 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1241 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1243 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1245 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1247 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1239);
    float _1249 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1241);
    float _1251 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1243);
    float _1253 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1245);
    float _1255 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1247);
    float _1257 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1249);
    float _1259 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1251);
    float _1261 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1253);
    float _1263 = _1255 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1265 = _1257 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1267 = _1259 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1269 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1271 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1273 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1275 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1277 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1279 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1271);
    float _1281 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1273);
    float _1283 = -_1175;
    float _1285 = _1283 + 0.5;
    float _1287 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1275);
    float _1289 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1277);
    float _1291 = -_1147;
    float _1293 = _1291 + 1.0;
    float _1295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1297 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1279);
    float _1299 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1281);
    float _1301 = _1261 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1303 = _1013 + 0.5;
    float _1305 = -_1153;
    float _1307 = _1305 + 1.0;
    float _1309 = _1285 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1311 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1287);
    float _1313 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1289);
    float _1315 = -_1293;
    float _1317 = fma(_1007, _1315, _1177);
    float _1319 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1299);
    float _1321 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1323 = fma(_1141, _1307, _1183);
    float _1325 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1297);
    float _1327 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1311);
    float _1329 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1313);
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1335 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1337 = _1331 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1339 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1341 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1343 = _1319 + _1329;
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1347 = _1321 * _1269;
    float _1349 = _1333 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1351 = _1335 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1353 = _1171 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1355 = _1309 * _1295;
    float _1357 = _1339 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1359 = _1341 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1361 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1363 = _1343 * 0.5;
    out.m_44.x = _1337;
    out.m_44.y = _1357;
    out.m_44.z = _1359;
    out.m_44.w = _1353;
    out.m_46.x = _1351;
    out.m_46.y = _1349;
    out.m_46.z = _1361;
    out.m_48.x = _1347;
    out.m_48.y = _1355;
    out.m_48.z = _1317;
    out.m_48.w = _1323;
    out.gl_Position.x = _1325;
    out.gl_Position.y = _1327;
    out.gl_Position.z = _1319;
    out.gl_Position.w = _1329;
    out.m_50.z = _1363;
    out.m_50.w = _1329;
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
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _703 = false;
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
        float _1420 = as_type<float>(_85);
        out.gl_Position.z = _1420;
    }
    if (!_73)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1490 = as_type<float>(_123);
        out.gl_Position.z = _1490;
    }
    if (_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _395 = _343;
    float _397 = _369;
    float _399 = _325;
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
    float _701;
    if (!_683)
    {
        float _685 = in.m_39.x;
        float _687 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _689 = _685 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _693 = _691 * _687;
        float _695 = floor(_693);
        float _697 = -_695;
        float _699 = _693 + _697;
        _701 = _699;
        _703 = true;
    }
    else
    {
        float _705 = float(_69);
        float _707 = 1.0 / _705;
        float _709 = _103 * _707;
        _701 = _709;
    }
    _703 = false;
    float _711 = _701;
    float _713 = as_type<float>(int(gl_VertexIndex));
    float _715 = _573 * _573;
    float _717 = in.m_39.z;
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _721 = _719 != 0;
    float _723 = fma(_575, _575, _715);
    float _725 = in.m_39.w;
    float _727 = fma(_577, _577, _723);
    float _729 = _391 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _731 = in.m_39.x;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _737 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].x, _729);
    float _739 = in.m_37.x;
    float _741 = in.m_37.y;
    float _743 = 1.0 / _735;
    float _745 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    int _747 = as_type<int>(_713) & 1;
    bool _749 = _747 != 0;
    int _751 = as_type<int>(_713) & 2;
    bool _753 = _751 != 0;
    float _755 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _757 = _717 > 0.5;
    out.m_33.x = _745;
    bool _759 = !_749;
    float _761 = _759 ? (-0.5) : 0.5;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _767 = _725 > 0.5;
    bool _769 = !_753;
    float _771 = _769 ? (-0.5) : 0.5;
    float _773 = 1.0 / _765;
    float _775 = -_761;
    int _777 = _757 ? as_type<int>(_775) : as_type<int>(_761);
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _781 = _779 != 0;
    int _783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _785 = _783 != 0;
    float _787 = _679 * _739;
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _791 = _789 != 0;
    float _793 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].z, _737);
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _797 = _795 != 0;
    float _799 = _391 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _801 = _731 > 0.5;
    float _803 = _391 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _805 = _681 * _741;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _809 = _807 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _811 = rsqrt(_727);
    float _813 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].x, _799);
    float _815 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].x, _803);
    float _817 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].z, _813);
    float _819 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].z, _815);
    float _821 = 1.0 / _809;
    float _823 = _393;
    if (!_721)
    {
        float _825 = in.m_39.y;
        _823 = _825;
    }
    float _827 = _823;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _833 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _835 = isnan(_711);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _845;
    float _849 = _817 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _851 = _831 * _743;
    bool _853 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _855 = isnan(_711);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = _811 * _577;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _867;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _873 = _711 + _871;
    float _875 = _811 * _575;
    float _877 = _811 * _573;
    float _879 = _869 * _773;
    float _881 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _883 = _865 * _881;
    float _885 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _887 = _875 * _885;
    float _889 = _847 * _821;
    float _891 = fma(_879, _873, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _895 = _877 * _893;
    float _897 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _899 = -_883;
    float _901 = fma(_875, _897, _899);
    float _903 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _905 = -_887;
    float _907 = fma(_877, _903, _905);
    bool _909 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _911 = isnan(_711);
    bool _913 = _909 || _911;
    bool _915 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _917 = _913 || _915;
    float _919 = float(_917);
    float _921 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _923 = -_895;
    float _925 = fma(_865, _921, _923);
    float _927 = _901 * _901;
    bool _929 = _711 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _931 = isnan(_711);
    bool _933 = _929 || _931;
    bool _935 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _937 = _933 || _935;
    float _939 = float(_937);
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _943 = _711 + _941;
    float _945 = -_919;
    float _947 = _945 + 1.0;
    float _949 = fma(_925, _925, _927);
    float _951 = _895;
    if (!_721)
    {
        _951 = _827;
    }
    float _953 = _951;
    float _955 = fma(_851, _943, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _957 = _939 * _947;
    float _959 = fma(_907, _907, _949);
    float _961 = -_939;
    float _963 = _961 + 1.0;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _967 = _711 + _965;
    float _969 = _953;
    float _971 = _827;
    if (_721)
    {
        float _973 = in.m_39.x;
        float _975 = in.m_39.y;
        _969 = _973;
        _971 = _975;
    }
    float _977 = _969;
    float _979 = _971;
    float _981 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _761);
    float _983 = _863 * _963;
    float _985 = rsqrt(_959);
    float _987 = -_863;
    float _989 = _987 + 1.0;
    float _991 = fma(_889, _967, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _993 = _787 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _995 = -_761;
    float _997 = _801 ? _995 : _761;
    float _999 = _843 * _989;
    float _1001 = _805 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1003 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _771);
    bool _1005 = !_781;
    float _1007 = _1005 ? _761 : as_type<float>(_777);
    float _1009 = _993 * _981;
    bool _1011 = !_791;
    float _1013 = _1011 ? _761 : _997;
    float _1015 = _891 * _999;
    float _1017 = _1001 * _1003;
    float _1019 = _997;
    float _1021 = _999;
    if (!_721)
    {
        _1019 = _717;
    }
    float _1023 = _1019;
    float _1025 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1027 = _1023;
    if (!_721)
    {
        _1021 = _717;
    }
    float _1029 = _1021;
    float _1031 = _901 * _985;
    float _1033 = _907 * _985;
    float _1035 = _1017 * _865;
    float _1037 = _925 * _985;
    float _1039 = _875 * _1031;
    float _1041 = _1017 * _875;
    float _1043 = _877 * _1033;
    float _1045 = fma(_1009, _1033, _1035);
    float _1047 = -_1039;
    float _1049 = fma(_877, _1037, _1047);
    float _1051 = _1029;
    if (_721)
    {
        _1027 = _979;
    }
    float _1053 = _1027;
    float _1055 = fma(_1009, _1037, _1041);
    if (_721)
    {
        _1051 = _979;
    }
    float _1057 = _1051;
    float _1059 = -_1043;
    float _1061 = fma(_865, _1031, _1059);
    bool _1063 = _979 > 0.5;
    float _1065 = fma(_1025, _1049, _1045);
    float _1067 = _793 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1069 = -_843;
    float _1071 = _1069 + 1.0;
    float _1073 = fma(_1025, _1061, _1055);
    float _1075 = _1067 + _1065;
    float _1077 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1015);
    float _1079 = _849 + _1073;
    float _1081 = _977 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1083 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1085 = _1075 + _1083;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1089 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1091 = _1079 + _1089;
    float _1093 = fma(_955, _983, _1077);
    float _1095 = _1085 * _1085;
    float _1097 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1087);
    float _1099 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1101 = fma(_1091, _1091, _1095);
    float _1103 = _1017 * _877;
    float _1105 = _865 * _1037;
    float _1107 = _1053 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1111 = sqrt(_1101);
    float _1113 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1115 = -_771;
    int _1117 = _1063 ? as_type<int>(_1115) : as_type<int>(_771);
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1121 = -_771;
    int _1123 = _767 ? as_type<int>(_1121) : as_type<int>(_771);
    float _1125 = fma(_1009, _1031, _1103);
    float _1127 = -_1105;
    float _1129 = fma(_875, _1033, _1127);
    float _1131 = fma(_1107, -2.0, _1113);
    float _1133 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1109);
    float _1135 = -_1119;
    float _1137 = fma(_1081, 2.0, _1135);
    bool _1139 = !_785;
    float _1141 = _1139 ? _771 : as_type<float>(_1123);
    float _1143 = fma(_1025, _1129, _1125);
    float _1145 = _819 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1147 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1097);
    float _1149 = -_103;
    float _1151 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1137);
    float _1153 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1133);
    bool _1155 = _1111 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1157 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1131);
    float _1159 = fma(_991, _957, _1093);
    float _1161 = _1145 + _1143;
    float _1163 = _755 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1165 = _1099 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1167 = _1007 + 0.5;
    float _1169 = _1141 + (-0.5);
    float _1171 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1159);
    bool _1173 = !_797;
    float _1175 = _1173 ? _771 : as_type<float>(_1117);
    float _1177 = fma(_1163, _1167, _1151);
    float _1179 = -_1165;
    float _1181 = -_1157;
    float _1183 = fma(_1179, _1169, _1181);
    float _1185 = _1159;
    float _1187 = _1079;
    float _1189 = _1075;
    if (!_1155)
    {
        _1185 = _1161;
    }
    float _1191 = _1185;
    bool _1193 = !_1155;
    float _1195 = _1191;
    if (!_1193)
    {
        float _1197 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1199 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1201 = _1111 + _1199;
        float _1203 = rsqrt(_1101);
        float _1205 = _1201 * _1197;
        float _1207 = _1161 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1209 = _1205 * 0.15915493667125701904296875;
        float _1211 = _1209 * 6.283185482025146484375;
        float _1213 = sin(_1211);
        float _1215 = _1209 * 6.283185482025146484375;
        float _1217 = cos(_1215);
        float _1219 = fma(_1213, _1207, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1221 = _1203 * _1219;
        float _1223 = _1217 + (-1.0);
        float _1225 = fma(_1091, _1221, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1227 = fma(_1085, _1221, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1229 = _1223 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1231 = fma(_1161, _1217, _1229);
        _1195 = _1231;
        _1187 = _1225;
        _1189 = _1227;
    }
    float _1233 = _1195;
    float _1235 = _1187;
    float _1237 = _1189;
    float _1239 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1241 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1243 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1245 = _1233 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1247 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1239);
    float _1249 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1241);
    float _1251 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1243);
    float _1253 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1245);
    float _1255 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1247);
    float _1257 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1249);
    float _1259 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1251);
    float _1261 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1253);
    float _1263 = _1255 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1265 = _1257 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1267 = _1259 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1269 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1271 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1273 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1275 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1277 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1279 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1271);
    float _1281 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1273);
    float _1283 = -_1175;
    float _1285 = _1283 + 0.5;
    float _1287 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1275);
    float _1289 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1277);
    float _1291 = -_1147;
    float _1293 = _1291 + 1.0;
    float _1295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1297 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1279);
    float _1299 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1281);
    float _1301 = _1261 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1303 = _1013 + 0.5;
    float _1305 = -_1153;
    float _1307 = _1305 + 1.0;
    float _1309 = _1285 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1311 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1287);
    float _1313 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1289);
    float _1315 = -_1293;
    float _1317 = fma(_1007, _1315, _1177);
    float _1319 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1299);
    float _1321 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1323 = fma(_1141, _1307, _1183);
    float _1325 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1297);
    float _1327 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1311);
    float _1329 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1313);
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1335 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1337 = _1331 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1339 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1341 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1343 = _1319 + _1329;
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1347 = _1321 * _1269;
    float _1349 = _1333 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1351 = _1335 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1353 = _1171 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1355 = _1309 * _1295;
    float _1357 = _1339 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1359 = _1341 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1361 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1363 = _1343 * 0.5;
    out.m_44.x = _1337;
    out.m_44.y = _1357;
    out.m_44.z = _1359;
    out.m_44.w = _1353;
    out.m_46.x = _1351;
    out.m_46.y = _1349;
    out.m_46.z = _1361;
    out.m_48.x = _1347;
    out.m_48.y = _1355;
    out.m_48.z = _1317;
    out.m_48.w = _1323;
    out.gl_Position.x = _1325;
    out.gl_Position.y = _1327;
    out.gl_Position.z = _1319;
    out.gl_Position.w = _1329;
    out.m_50.z = _1363;
    out.m_50.w = _1329;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

