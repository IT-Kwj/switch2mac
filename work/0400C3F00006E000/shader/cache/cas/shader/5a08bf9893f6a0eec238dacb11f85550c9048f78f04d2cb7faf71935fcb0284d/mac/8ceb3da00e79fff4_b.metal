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
};

struct main0_out
{
    float4 m_37 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_42 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_35 [[attribute(4)]];
    float4 m_33 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1211 = false;
    bool _1023 = false;
    bool _847 = false;
    bool _607 = false;
    bool _451 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = in.m_26.w;
    float _62 = trunc(_60);
    int _65 = int(_62);
    bool _69 = _65 >= 1;
    float _71 = 0.0;
    if (!_69)
    {
        _71 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _73 = _71;
    float _75 = _73;
    if (!_69)
    {
        out.m_29.x = 0.0;
    }
    int _77 = 0;
    if (!_69)
    {
        float _79 = _73 * 5.0;
        _77 = as_type<int>(_79);
    }
    int _81 = _77;
    int _83 = _81;
    if (!_69)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2230 = as_type<float>(_81);
        out.gl_Position.z = _2230;
    }
    if (!_69)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _85 = in.m_31.w;
    bool _87 = _85 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _89 = isnan(_85);
    bool _91 = _87 || _89;
    bool _93 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _95 = _91 || _93;
    float _97 = -_85;
    float _99 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _101 = 0.0;
    float _103 = 0.0;
    if (_95)
    {
        float _105 = float(_65);
        _75 = _105;
    }
    float _107 = _75;
    bool _109 = _99 >= _107;
    bool _111 = !_95;
    bool _113 = _109 || _111;
    float _115 = _107;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (_113)
    {
        out.m_29.x = 0.0;
    }
    if (_113)
    {
        float _119 = _117 * 5.0;
        _83 = as_type<int>(_119);
    }
    int _121 = _83;
    float _123 = as_type<float>(_121);
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2301 = as_type<float>(_121);
        out.gl_Position.z = _2301;
    }
    if (_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_31.x;
    float _127 = in.m_31.y;
    float _129 = in.m_31.z;
    float _131 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _133 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _135 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _137 = _133 || _135;
    bool _139 = isnan(1.0);
    bool _141 = _137 || _139;
    float _143 = _131;
    if (!_141)
    {
        float _145 = _131 * _131;
        float _147 = _145 * 0.5;
        _123 = _147;
    }
    float _149 = _123;
    float _151 = 0.0;
    float _153 = _149;
    if (!_141)
    {
        float _155 = _99 * _99;
        float _157 = _155 * 0.5;
        _151 = _157;
    }
    float _159 = _151;
    if (!_141)
    {
        float _161 = _149 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _153 = _161;
    }
    float _163 = _153;
    bool _165 = !_141;
    float _167 = _163;
    if (!_165)
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
        _101 = _187;
        _167 = _197;
        _103 = _185;
    }
    float _199 = _101;
    float _201 = _167;
    float _203 = _103;
    bool _205 = !_141;
    float _207 = _199;
    float _209 = _203;
    if (!_205)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = 1.0 / _217;
        float _221 = _131 * _213;
        float _223 = exp2(_221);
        float _225 = -_223;
        float _227 = _225 + 1.0;
        float _229 = _227 * _219;
        _207 = _223;
        _209 = _217;
        _143 = _229;
    }
    float _231 = _207;
    float _233 = _209;
    float _235 = _143;
    float _237 = _233;
    float _239 = _231;
    if (!_141)
    {
        _237 = _99;
    }
    float _241 = _237;
    float _243 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _245 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _247 = _241;
    if (!_141)
    {
        float _249 = _159 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _239 = _249;
    }
    float _251 = _239;
    bool _253 = !_141;
    float _255 = _251;
    if (!_253)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = _99 * _259;
        float _269 = 1.0 / _263;
        float _271 = _265 * 0.693147182464599609375;
        float _273 = exp2(_267);
        float _275 = 1.0 / _271;
        float _277 = _273 + (-1.0);
        float _279 = -_277;
        float _281 = fma(_279, _275, _99);
        float _283 = _281 * _269;
        float _285 = _283 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _255 = _285;
    }
    float _287 = _255;
    bool _289 = !_141;
    if (!_289)
    {
        float _291 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _293 = log2(_291);
        float _295 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _297 = _295 + 1.0;
        float _299 = 1.0 / _297;
        float _301 = _99 * _293;
        float _303 = exp2(_301);
        float _305 = -_303;
        float _307 = _305 + 1.0;
        float _309 = _307 * _299;
        _247 = _309;
    }
    float _311 = _247;
    float _313 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _315 = fma(_235, _127, _245);
    float _317 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _319 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _321 = fma(_311, _127, _313);
    float _323 = fma(_235, _125, _243);
    float _325 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _327 = fma(_311, _125, _317);
    float _329 = -_321;
    float _331 = _315 + _329;
    float _333 = fma(_235, _129, _319);
    float _335 = fma(_311, _129, _325);
    float _337 = -_327;
    float _339 = _323 + _337;
    float _341 = _331 * _331;
    float _343 = in.m_33.w;
    float _345 = -_335;
    float _347 = _333 + _345;
    float _349 = _331 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _351 = fma(_339, _339, _341);
    float _353 = _331 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _355 = _331 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _357 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[4].x, _349);
    float _359 = fma(_347, _347, _351);
    float _361 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[5].x, _353);
    float _363 = in.m_26.x;
    float _365 = in.m_26.y;
    float _367 = in.m_26.z;
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
    float _389 = fma(_323, _343, _363);
    float _391 = fma(_315, _343, _365);
    float _393 = fma(_333, _343, _367);
    float _395 = _369;
    float _397 = _347;
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
    float _583 = _573;
    float _585 = _575;
    float _587 = _577;
    float _605;
    if (!_581)
    {
        float _589 = in.m_35.x;
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _593 = _589 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[12].x, _99);
        float _597 = _595 * _591;
        float _599 = floor(_597);
        float _601 = -_599;
        float _603 = _597 + _601;
        _605 = _603;
        _607 = true;
    }
    else
    {
        float _609 = float(_65);
        float _611 = 1.0 / _609;
        float _613 = _99 * _611;
        _605 = _613;
    }
    _607 = false;
    float _615 = _605;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _619 = _615 + _617;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _623 = _615 + _621;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _627 = _615 + _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _629;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _637;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _645 = 1.0 / _635;
    bool _647 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _649 = 1.0 / _631;
    float _651 = 1.0 / _639;
    float _653 = 1.0 / _643;
    float _655 = _619 * _649;
    bool _657 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _659 = isnan(_615);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _665 = _661 || _663;
    float _667 = float(_665);
    bool _669 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _671 = isnan(_615);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = -_667;
    float _683 = _681 + 1.0;
    float _685 = _623 * _651;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _689 = _615 + _687;
    float _691 = -_679;
    float _693 = _691 + 1.0;
    float _695 = _679 * _683;
    float _697 = _689 * _645;
    bool _699 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _701 = isnan(_615);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _707 = _703 || _705;
    float _709 = float(_707);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _711;
    float _715 = _627 * _653;
    bool _717 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _719 = isnan(_615);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = fma(_713, _685, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _731 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _733 = isnan(_615);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _743;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _751 = _727 * _693;
    float _753 = -_727;
    float _755 = _753 + 1.0;
    float _757 = fma(_745, _685, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _763 = fma(_749, _715, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _765 = _709 * _755;
    float _767 = -_709;
    float _769 = _767 + 1.0;
    float _771 = -_741;
    float _773 = _771 + 1.0;
    float _775 = fma(_761, _715, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _777 = _741 * _769;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _779;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _783;
    float _787 = _729 * _777;
    float _789 = _757 * _777;
    float _791 = fma(_781, _655, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _793 = fma(_785, _655, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _795 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[143].x, _787);
    float _797 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[143].y, _789);
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _801 = _799 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _807 = fma(_763, _765, _795);
    float _809 = fma(_775, _765, _797);
    float _811 = fma(_801, _697, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _813 = fma(_805, _697, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _815 = fma(_791, _751, _807);
    float _817 = fma(_793, _751, _809);
    float _819 = fma(_811, _695, _815);
    float _821 = fma(_813, _695, _817);
    float _823 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[147].x, _819);
    float _825 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[147].y, _821);
    bool _827 = !_647;
    float _845;
    if (!_827)
    {
        float _829 = in.m_35.x;
        float _831 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _833 = _829 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _835 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[11].x, _99);
        float _837 = _835 * _831;
        float _839 = floor(_837);
        float _841 = -_839;
        float _843 = _837 + _841;
        _845 = _843;
        _847 = true;
    }
    else
    {
        float _849 = float(_65);
        float _851 = 1.0 / _849;
        float _853 = _99 * _851;
        _845 = _853;
    }
    _847 = false;
    float _855 = _845;
    float _857 = in.m_33.x;
    float _859 = in.m_33.y;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _863 = _855 + _861;
    bool _865 = _855 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _867 = isnan(_855);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _873 = _869 || _871;
    float _875 = float(_873);
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _879 = _855 + _877;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _881;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _887 = _885 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _889 = -_875;
    float _891 = _889 + 1.0;
    float _893 = 1.0 / _887;
    bool _895 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _897 = 1.0 / _883;
    float _899 = _825 * _859;
    bool _901 = _855 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _903 = isnan(_855);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _909 = _905 || _907;
    float _911 = float(_909);
    float _913 = _823 * _857;
    bool _915 = _855 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _917 = isnan(_855);
    bool _919 = _915 || _917;
    bool _921 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _923 = _919 || _921;
    float _925 = float(_923);
    float _927 = _925 * _891;
    float _929 = -_925;
    float _931 = _929 + 1.0;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _933;
    float _937 = _863 * _897;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _939;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _943;
    float _947 = _911 * _931;
    float _949 = fma(_935, _937, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _951 = fma(_941, _937, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _953 = fma(_945, _937, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _955 = _879 * _893;
    float _957 = _949 * _947;
    float _959 = _951 * _947;
    float _961 = _953 * _947;
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _965 = _963 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _969 = _967 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _971 = -_911;
    float _973 = _971 + 1.0;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _977 = _975 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _979 = fma(_965, _955, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _981 = fma(_969, _955, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _983 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[107].x, _957);
    float _985 = fma(_977, _955, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _987 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[107].y, _959);
    float _989 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[107].z, _961);
    float _991 = fma(_979, _927, _983);
    float _993 = fma(_981, _927, _987);
    float _995 = fma(_985, _927, _989);
    float _997 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[109].x, _991);
    float _999 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[109].y, _993);
    float _1001 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[109].z, _995);
    bool _1003 = !_895;
    float _1021;
    if (!_1003)
    {
        float _1005 = in.m_35.x;
        float _1007 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1009 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1011 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[11].y, _99);
        float _1013 = _1011 * _1007;
        float _1015 = floor(_1013);
        float _1017 = -_1015;
        float _1019 = _1013 + _1017;
        _1021 = _1019;
        _1023 = true;
    }
    else
    {
        float _1025 = float(_65);
        float _1027 = 1.0 / _1025;
        float _1029 = _99 * _1027;
        _1021 = _1029;
    }
    _1023 = false;
    float _1031 = _1021;
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1035 = _1031 + _1033;
    float _1037 = _997 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1045 = _1043 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1047 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1049 = isnan(_1031);
    bool _1051 = _1047 || _1049;
    bool _1053 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1055 = _1051 || _1053;
    float _1057 = float(_1055);
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1061 = _1059 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1063 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1065 = isnan(_1031);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1071 = _1067 || _1069;
    float _1073 = float(_1071);
    float _1075 = 1.0 / _1041;
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1077;
    float _1081 = -_1057;
    float _1083 = _1081 + 1.0;
    bool _1085 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1087 = isnan(_1031);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1093 = _1089 || _1091;
    float _1095 = float(_1093);
    float _1097 = _999 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1099 = _1001 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1101 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1103 = 1.0 / _1045;
    float _1105 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1107 = _1099 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1109 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1111 = 1.0 / _1061;
    float _1113 = _1079 * _1075;
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1117 = _1115 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1119 = _1073 * _1083;
    float _1121 = -_1073;
    float _1123 = _1121 + 1.0;
    float _1125 = fma(_1113, _1035, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1127;
    float _1131 = _1095 * _1123;
    float _1133 = _1117 * _1103;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1137 = _1031 + _1135;
    bool _1139 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1141 = isnan(_1031);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    float _1151 = _1125 * _1131;
    float _1153 = -_1095;
    float _1155 = _1153 + 1.0;
    float _1157 = fma(_1133, _1137, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1161 = _1031 + _1159;
    float _1163 = _1129 * _1111;
    float _1165 = -_1149;
    float _1167 = _1165 + 1.0;
    float _1169 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1151);
    float _1171 = fma(_1163, _1161, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1173 = _1057 * _1167;
    float _1175 = fma(_1157, _1119, _1169);
    float _1177 = fma(_1171, _1173, _1175);
    float _1179 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1177);
    float _1181 = _1179 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.x = _1101;
    out.m_37.y = _1105;
    out.m_37.z = _1107;
    out.m_37.w = _1181;
    bool _1183 = !_1109;
    float _1207;
    float _1209;
    if (!_1183)
    {
        float _1185 = in.m_35.x;
        float _1187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1189 = float(_65);
        float _1191 = 1.0 / _1189;
        float _1193 = _1185 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1195 = _99 * _1191;
        float _1197 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[11].w, _99);
        float _1199 = _1197 * _1187;
        float _1201 = floor(_1199);
        float _1203 = -_1201;
        float _1205 = _1199 + _1203;
        _1207 = _1195;
        _1209 = _1205;
        _1211 = true;
    }
    else
    {
        float _1213 = float(_65);
        float _1215 = 1.0 / _1213;
        float _1217 = _99 * _1215;
        _1207 = _1217;
        _1209 = _1217;
    }
    _1211 = false;
    float _1219 = _1207;
    float _1221 = _1209;
    float _1223 = as_type<float>(int(gl_VertexIndex));
    float _1225 = _899 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1227 = in.m_35.x;
    float _1229 = in.m_35.y;
    float _1231 = in.m_35.z;
    float _1233 = in.m_35.w;
    float _1235 = _913 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1237 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1239 = _1237 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1243 = _1241 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1247 = 1.0 / _1239;
    float _1249 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1253 = _1251 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1257 = _1255 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1261 = _1259 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1263 = 1.0 / _1243;
    int _1265 = as_type<int>(_1223) & 1;
    bool _1267 = _1265 != 0;
    int _1269 = as_type<int>(_1223) & 2;
    bool _1271 = _1269 != 0;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1277 = _1275 != 0;
    float _1279 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1281 = _1231 > 0.5;
    float _1283 = 1.0 / _1253;
    int _1285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1287 = _1285 != 0;
    bool _1289 = !_1267;
    float _1291 = _1289 ? (-0.5) : 0.5;
    bool _1293 = !_1271;
    float _1295 = _1293 ? (-0.5) : 0.5;
    int _1297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1299 = _1297 != 0;
    float _1301 = 1.0 / _1257;
    int _1303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1305 = _1303 != 0;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1309 = _1233 > 0.5;
    float _1311 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1249);
    float _1313 = -_1307;
    float _1315 = fma(_1279, 2.0, _1313);
    float _1317 = _1229 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1319 = -_1291;
    int _1321 = _1281 ? as_type<int>(_1319) : as_type<int>(_1291);
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1325 = _1323 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1327 = _1227 > 0.5;
    float _1329 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1331 = _1329 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1333 = fma(_1317, -2.0, _1245);
    float _1335 = 1.0 / _1261;
    float _1337 = fma(_1229, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1273);
    float _1339 = -_1295;
    int _1341 = _1309 ? as_type<int>(_1339) : as_type<int>(_1295);
    float _1343 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1345 = _1343 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1347 = _1229 > 0.5;
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1349;
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1353;
    float _1357 = 1.0 / _1325;
    float _1359 = _1351 * _1247;
    float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1363 = _1361 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1365 = _1355 * _1263;
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1369 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1367;
    float _1371 = 1.0 / _1331;
    bool _1373 = _1219 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1375 = isnan(_1219);
    bool _1377 = _1373 || _1375;
    bool _1379 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1381 = _1377 || _1379;
    float _1383 = float(_1381);
    float _1385 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1333);
    bool _1387 = _1219 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1389 = isnan(_1219);
    bool _1391 = _1387 || _1389;
    bool _1393 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1395 = _1391 || _1393;
    float _1397 = float(_1395);
    float _1399 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1401 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1399;
    bool _1403 = !_1287;
    float _1405 = _1403 ? _1291 : as_type<float>(_1321);
    float _1407 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1291);
    float _1409 = -_1295;
    int _1411 = _1347 ? as_type<int>(_1409) : as_type<int>(_1295);
    float _1413 = 1.0 / _1345;
    float _1415 = _1363 * _1357;
    float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1419 = _1417 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1423 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1421;
    float _1425 = _1401 * _1335;
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1429 = _1219 + _1427;
    bool _1431 = !_1305;
    float _1433 = _1431 ? _1295 : as_type<float>(_1341);
    float _1435 = _1423 * _1301;
    float _1437 = _1369 * _1371;
    float _1439 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1441 = _1439 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1445 = _1221 + _1443;
    float _1447 = _1419 * _1283;
    float _1449 = fma(_1365, _1429, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1453 = _1219 + _1451;
    float _1455 = fma(_1359, _1445, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1457 = _1219 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1459 = isnan(_1219);
    bool _1461 = _1457 || _1459;
    bool _1463 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1465 = _1461 || _1463;
    float _1467 = float(_1465);
    float _1469 = _1441 * _1413;
    bool _1471 = _1219 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1473 = isnan(_1219);
    bool _1475 = _1471 || _1473;
    bool _1477 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1479 = _1475 || _1477;
    float _1481 = float(_1479);
    float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1485 = _1219 + _1483;
    bool _1487 = _1219 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1489 = isnan(_1219);
    bool _1491 = _1487 || _1489;
    bool _1493 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1495 = _1491 || _1493;
    float _1497 = float(_1495);
    float _1499 = -_1467;
    float _1501 = _1499 + 1.0;
    float _1503 = fma(_1437, _1453, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1505 = -_1481;
    float _1507 = _1505 + 1.0;
    float _1509 = fma(_1415, _1485, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _1511 = _1219 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1513 = isnan(_1219);
    bool _1515 = _1511 || _1513;
    bool _1517 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1519 = _1515 || _1517;
    float _1521 = float(_1519);
    float _1523 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1525 = _1219 + _1523;
    float _1527 = _1467 * _1507;
    float _1529 = _1497 * _1501;
    float _1531 = -_1497;
    float _1533 = _1531 + 1.0;
    float _1535 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1537 = _1219 + _1535;
    float _1539 = fma(_1435, _1525, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1541 = _573 * _573;
    float _1543 = _1521 * _1533;
    float _1545 = -_1521;
    float _1547 = _1545 + 1.0;
    float _1549 = fma(_1447, _1537, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _1551 = _1219 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1553 = isnan(_1219);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1559 = _1555 || _1557;
    float _1561 = float(_1559);
    float _1563 = fma(_575, _575, _1541);
    float _1565 = _1383 * _1547;
    float _1567 = -_1383;
    float _1569 = _1567 + 1.0;
    float _1571 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1573 = _1219 + _1571;
    float _1575 = -_1561;
    float _1577 = _1575 + 1.0;
    bool _1579 = _1219 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1581 = isnan(_1219);
    bool _1583 = _1579 || _1581;
    bool _1585 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1587 = _1583 || _1585;
    float _1589 = float(_1587);
    float _1591 = _1561 * _1569;
    float _1593 = fma(_577, _577, _1563);
    float _1595 = fma(_1469, _1573, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1597 = _1397 * _1577;
    float _1599 = -_1397;
    float _1601 = _1599 + 1.0;
    float _1603 = rsqrt(_1593);
    float _1605 = -_1291;
    int _1607 = _1327 ? as_type<int>(_1605) : as_type<int>(_1291);
    float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1611 = _1219 + _1609;
    float _1613 = _1589 * _1601;
    bool _1615 = !_1299;
    float _1617 = _1615 ? _1295 : as_type<float>(_1411);
    float _1619 = _1235 * _1407;
    bool _1621 = !_1277;
    float _1623 = _1621 ? _1291 : as_type<float>(_1607);
    float _1625 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1295);
    float _1627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1629 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1311);
    float _1631 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1337);
    float _1633 = _1225 * _1625;
    float _1635 = _1449 * _1613;
    float _1637 = -_1589;
    float _1639 = _1637 + 1.0;
    bool _1641 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1643 = isnan(_1221);
    bool _1645 = _1641 || _1643;
    bool _1647 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1649 = _1645 || _1647;
    float _1651 = float(_1649);
    float _1653 = _1405 + 0.5;
    float _1655 = _1603 * _577;
    float _1657 = _1603 * _575;
    float _1659 = _1603 * _573;
    float _1661 = fma(_1639, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1635);
    float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1665 = _1655 * _1663;
    float _1667 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1669 = _1657 * _1667;
    float _1671 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1673 = _1659 * _1671;
    bool _1675 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1677 = isnan(_1221);
    bool _1679 = _1675 || _1677;
    bool _1681 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1683 = _1679 || _1681;
    float _1685 = float(_1683);
    float _1687 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1689 = -_1665;
    float _1691 = fma(_1657, _1687, _1689);
    float _1693 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1695 = -_1669;
    float _1697 = fma(_1659, _1693, _1695);
    float _1699 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1701 = -_1673;
    float _1703 = fma(_1655, _1699, _1701);
    float _1705 = fma(_1509, _1597, _1661);
    float _1707 = _1691 * _1691;
    float _1709 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1711 = -_1651;
    float _1713 = _1711 + 1.0;
    float _1715 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1717 = fma(_1703, _1703, _1707);
    float _1719 = -_1433;
    float _1721 = _1719 + 0.5;
    float _1723 = _1685 * _1713;
    float _1725 = -_1685;
    float _1727 = _1725 + 1.0;
    float _1729 = fma(_1697, _1697, _1717);
    float _1731 = fma(_1503, _1591, _1705);
    float _1733 = fma(_1425, _1611, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1735 = -_99;
    float _1737 = fma(_1735, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1315);
    float _1739 = rsqrt(_1729);
    float _1741 = fma(_1549, _1565, _1731);
    float _1743 = _1617 + (-0.5);
    float _1745 = _1623 + 0.5;
    float _1747 = _1455 * _1723;
    float _1749 = fma(_1539, _1543, _1741);
    float _1751 = _1709 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1753 = -_1715;
    float _1755 = -_1385;
    float _1757 = fma(_1753, _1743, _1755);
    float _1759 = _1633 * _1659;
    float _1761 = fma(_1595, _1529, _1749);
    float _1763 = fma(_1751, _1745, _1737);
    float _1765 = fma(_1727, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1747);
    float _1767 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1769 = fma(_1733, _1527, _1761);
    float _1771 = _1633 * _1655;
    float _1773 = -_1629;
    float _1775 = _1773 + 1.0;
    float _1777 = _1703 * _1739;
    float _1779 = _1697 * _1739;
    float _1781 = _1691 * _1739;
    float _1783 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1785 = _1655 * _1777;
    float _1787 = fma(_1619, _1779, _1771);
    float _1789 = _1633 * _1657;
    float _1791 = fma(_1619, _1781, _1759);
    float _1793 = -_1785;
    float _1795 = fma(_1657, _1779, _1793);
    float _1797 = _1659 * _1779;
    float _1799 = _1657 * _1781;
    float _1801 = fma(_1619, _1777, _1789);
    float _1803 = fma(_1783, _1795, _1791);
    float _1805 = -_1797;
    float _1807 = fma(_1655, _1781, _1805);
    float _1809 = -_1799;
    float _1811 = fma(_1659, _1777, _1809);
    float _1813 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1769);
    float _1815 = _1803 * _1803;
    float _1817 = fma(_1783, _1807, _1801);
    float _1819 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1821 = fma(_1783, _1811, _1787);
    float _1823 = -_1631;
    float _1825 = _1823 + 1.0;
    float _1827 = fma(_1817, _1817, _1815);
    float _1829 = _1653 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1831 = fma(_1651, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1765);
    float _1833 = _1721 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1835 = fma(_1821, _1821, _1827);
    float _1837 = -_1775;
    float _1839 = fma(_1623, _1837, _1763);
    float _1841 = fma(_1617, _1825, _1757);
    float _1843 = _1831 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1845 = sqrt(_1835);
    out.m_42.x = _1813;
    float _1847 = _391 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1849 = _1829 * _1819;
    float _1851 = _1833 * _1767;
    out.m_44.w = _1843;
    float _1853 = _391 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1855 = _391 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1857 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1847);
    out.m_46.x = _1839;
    out.m_46.y = _1841;
    out.m_46.z = _1849;
    out.m_46.w = _1851;
    float _1859 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1853);
    float _1861 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1855);
    float _1863 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1857);
    bool _1865 = _1845 > 0.0;
    float _1867 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1859);
    float _1869 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1861);
    float _1871 = _1863 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1873 = _1867 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1875 = _1869 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1877 = _1871 + _1803;
    float _1879 = _1873 + _1817;
    float _1881 = _1875 + _1821;
    bool _1883 = !_1865;
    float _1885 = _1841;
    float _1887 = _1839;
    float _1889 = _1593;
    float _1891 = _1877;
    float _1893 = _1879;
    float _1895 = _1881;
    if (!_1883)
    {
        bool _1897 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1899 = _1875;
        if (_1897)
        {
            float _1901 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1899 = _1901;
        }
        float _1903 = _1899;
        if (_1897)
        {
            _1885 = _1593;
        }
        float _1905 = _1885;
        float _1907 = _1903;
        float _1909 = _1905;
        if (_1897)
        {
            float _1911 = _1903 * _575;
            _1887 = _1911;
        }
        float _1913 = _1887;
        float _1915 = _1913;
        if (_1897)
        {
            float _1917 = _1903 * _573;
            _1889 = _1917;
        }
        float _1919 = _1889;
        float _1921 = _1919;
        float _1923 = _1919;
        if (_1897)
        {
            float _1925 = _1903 * _577;
            _1907 = _1925;
        }
        float _1927 = _1907;
        float _1929 = _1927;
        if (!_1897)
        {
            float _1931 = _99 + 1.0;
            float _1933 = _1931;
            if (!_141)
            {
                float _1935 = _1931 * _1931;
                float _1937 = _1935 * 0.5;
                _1921 = _1937;
            }
            float _1939 = _1921;
            float _1941 = _1939;
            if (!_141)
            {
                float _1943 = _1939 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1941 = _1943;
            }
            float _1945 = _1941;
            bool _1947 = !_141;
            float _1949 = _1945;
            if (!_1947)
            {
                float _1951 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1953 = log2(_1951);
                float _1955 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1957 = _1955 + 1.0;
                float _1959 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1961 = _1953 * _1931;
                float _1963 = 1.0 / _1957;
                float _1965 = _1959 * 0.693147182464599609375;
                float _1967 = exp2(_1961);
                float _1969 = 1.0 / _1965;
                float _1971 = _1967 + (-1.0);
                float _1973 = -_1971;
                float _1975 = fma(_1973, _1969, _1931);
                float _1977 = _1975 * _1963;
                float _1979 = _1977 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1949 = _1979;
            }
            float _1981 = _1949;
            float _1983 = _1981 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1985 = _1981 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1987 = !_141;
            if (!_1987)
            {
                float _1989 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1991 = log2(_1989);
                float _1993 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1995 = _1993 + 1.0;
                float _1997 = 1.0 / _1995;
                float _1999 = _1991 * _1931;
                float _2001 = exp2(_1999);
                float _2003 = -_2001;
                float _2005 = _2003 + 1.0;
                float _2007 = _2005 * _1997;
                _1933 = _2007;
            }
            float _2009 = _1933;
            float _2011 = fma(_2009, _127, _1985);
            float _2013 = _1981 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2015 = fma(_2009, _125, _1983);
            float _2017 = -_321;
            float _2019 = _2017 + _2011;
            float _2021 = fma(_2009, _129, _2013);
            float _2023 = -_327;
            float _2025 = _2023 + _2015;
            float _2027 = _2019 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2029 = _2019 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2031 = -_335;
            float _2033 = _2031 + _2021;
            float _2035 = _2019 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2037 = fma(_2025, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2027);
            float _2039 = fma(_2025, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2029);
            float _2041 = fma(_2025, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2035);
            float _2043 = fma(_2033, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2037);
            float _2045 = fma(_2033, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2039);
            float _2047 = fma(_2033, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2041);
            float _2049 = _2043 * _2043;
            float _2051 = fma(_2045, _2045, _2049);
            float _2053 = fma(_2047, _2047, _2051);
            _1909 = _2053;
            _583 = _2043;
            _585 = _2045;
            _587 = _2047;
            _1915 = _2045;
            _1923 = _2043;
            _1929 = _2047;
        }
        float _2055 = _1909;
        float _2057 = _583;
        float _2059 = _585;
        float _2061 = _587;
        float _2063 = _1915;
        float _2065 = _1923;
        float _2067 = _1929;
        float _2069 = sqrt(_2055);
        float _2071 = rsqrt(_1835);
        bool _2073 = _2069 > 0.0;
        float _2075 = _1817 * _2071;
        float _2077 = _1803 * _2071;
        float _2079 = _1821 * _2071;
        bool _2081 = !_2073;
        if (!_2081)
        {
            float _2083 = rsqrt(_2055);
            float _2085 = _2083 * _2057;
            float _2087 = _2083 * _2059;
            float _2089 = _2077 * _2085;
            float _2091 = _2083 * _2061;
            float _2093 = fma(_2075, _2087, _2089);
            float _2095 = fma(_2079, _2091, _2093);
            float _2097 = _2095 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2099 = fma(_2063, _2097, _1879);
            float _2101 = fma(_2065, _2097, _1877);
            float _2103 = fma(_2067, _2097, _1881);
            _1891 = _2101;
            _1893 = _2099;
            _1895 = _2103;
        }
    }
    float _2105 = _1891;
    float _2107 = _1893;
    float _2109 = _1895;
    float _2111 = _2105 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2113 = _2105 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2115 = _2105 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2117 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2111);
    float _2119 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2113);
    float _2121 = _2105 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2123 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2115);
    float _2125 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2117);
    float _2127 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2119);
    float _2129 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2121);
    float _2131 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2123);
    float _2133 = _2125 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2135 = _2127 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2137 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2129);
    float _2139 = _2131 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2141 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2143 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2145 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2147 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2149 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2141);
    float _2151 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2143);
    float _2153 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2145);
    float _2155 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2147);
    float _2157 = _2137 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2159 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2149);
    float _2161 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2151);
    float _2163 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2153);
    float _2165 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2155);
    float _2167 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2159);
    float _2169 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2161);
    float _2171 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2163);
    float _2173 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2165);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _2169;
    out.gl_Position.y = _2167;
    out.gl_Position.z = _2171;
    out.gl_Position.w = _2173;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1211 = false;
    bool _1023 = false;
    bool _847 = false;
    bool _607 = false;
    bool _451 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = in.m_26.w;
    float _62 = trunc(_60);
    int _65 = int(_62);
    bool _69 = _65 >= 1;
    float _71 = 0.0;
    if (!_69)
    {
        _71 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _73 = _71;
    float _75 = _73;
    if (!_69)
    {
        out.m_29.x = 0.0;
    }
    int _77 = 0;
    if (!_69)
    {
        float _79 = _73 * 5.0;
        _77 = as_type<int>(_79);
    }
    int _81 = _77;
    int _83 = _81;
    if (!_69)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2230 = as_type<float>(_81);
        out.gl_Position.z = _2230;
    }
    if (!_69)
    {
        return out;
    }
    float _85 = in.m_31.w;
    bool _87 = _85 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _89 = isnan(_85);
    bool _91 = _87 || _89;
    bool _93 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _95 = _91 || _93;
    float _97 = -_85;
    float _99 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _101 = 0.0;
    float _103 = 0.0;
    if (_95)
    {
        float _105 = float(_65);
        _75 = _105;
    }
    float _107 = _75;
    bool _109 = _99 >= _107;
    bool _111 = !_95;
    bool _113 = _109 || _111;
    float _115 = _107;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (_113)
    {
        out.m_29.x = 0.0;
    }
    if (_113)
    {
        float _119 = _117 * 5.0;
        _83 = as_type<int>(_119);
    }
    int _121 = _83;
    float _123 = as_type<float>(_121);
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2301 = as_type<float>(_121);
        out.gl_Position.z = _2301;
    }
    if (_113)
    {
        return out;
    }
    float _125 = in.m_31.x;
    float _127 = in.m_31.y;
    float _129 = in.m_31.z;
    float _131 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _133 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _135 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _137 = _133 || _135;
    bool _139 = isnan(1.0);
    bool _141 = _137 || _139;
    float _143 = _131;
    if (!_141)
    {
        float _145 = _131 * _131;
        float _147 = _145 * 0.5;
        _123 = _147;
    }
    float _149 = _123;
    float _151 = 0.0;
    float _153 = _149;
    if (!_141)
    {
        float _155 = _99 * _99;
        float _157 = _155 * 0.5;
        _151 = _157;
    }
    float _159 = _151;
    if (!_141)
    {
        float _161 = _149 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _153 = _161;
    }
    float _163 = _153;
    bool _165 = !_141;
    float _167 = _163;
    if (!_165)
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
        _101 = _187;
        _167 = _197;
        _103 = _185;
    }
    float _199 = _101;
    float _201 = _167;
    float _203 = _103;
    bool _205 = !_141;
    float _207 = _199;
    float _209 = _203;
    if (!_205)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = 1.0 / _217;
        float _221 = _131 * _213;
        float _223 = exp2(_221);
        float _225 = -_223;
        float _227 = _225 + 1.0;
        float _229 = _227 * _219;
        _207 = _223;
        _209 = _217;
        _143 = _229;
    }
    float _231 = _207;
    float _233 = _209;
    float _235 = _143;
    float _237 = _233;
    float _239 = _231;
    if (!_141)
    {
        _237 = _99;
    }
    float _241 = _237;
    float _243 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _245 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _247 = _241;
    if (!_141)
    {
        float _249 = _159 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _239 = _249;
    }
    float _251 = _239;
    bool _253 = !_141;
    float _255 = _251;
    if (!_253)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = _99 * _259;
        float _269 = 1.0 / _263;
        float _271 = _265 * 0.693147182464599609375;
        float _273 = exp2(_267);
        float _275 = 1.0 / _271;
        float _277 = _273 + (-1.0);
        float _279 = -_277;
        float _281 = fma(_279, _275, _99);
        float _283 = _281 * _269;
        float _285 = _283 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _255 = _285;
    }
    float _287 = _255;
    bool _289 = !_141;
    if (!_289)
    {
        float _291 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _293 = log2(_291);
        float _295 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _297 = _295 + 1.0;
        float _299 = 1.0 / _297;
        float _301 = _99 * _293;
        float _303 = exp2(_301);
        float _305 = -_303;
        float _307 = _305 + 1.0;
        float _309 = _307 * _299;
        _247 = _309;
    }
    float _311 = _247;
    float _313 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _315 = fma(_235, _127, _245);
    float _317 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _319 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _321 = fma(_311, _127, _313);
    float _323 = fma(_235, _125, _243);
    float _325 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _327 = fma(_311, _125, _317);
    float _329 = -_321;
    float _331 = _315 + _329;
    float _333 = fma(_235, _129, _319);
    float _335 = fma(_311, _129, _325);
    float _337 = -_327;
    float _339 = _323 + _337;
    float _341 = _331 * _331;
    float _343 = in.m_33.w;
    float _345 = -_335;
    float _347 = _333 + _345;
    float _349 = _331 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _351 = fma(_339, _339, _341);
    float _353 = _331 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _355 = _331 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _357 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[4].x, _349);
    float _359 = fma(_347, _347, _351);
    float _361 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[5].x, _353);
    float _363 = in.m_26.x;
    float _365 = in.m_26.y;
    float _367 = in.m_26.z;
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
    float _389 = fma(_323, _343, _363);
    float _391 = fma(_315, _343, _365);
    float _393 = fma(_333, _343, _367);
    float _395 = _369;
    float _397 = _347;
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
    float _583 = _573;
    float _585 = _575;
    float _587 = _577;
    float _605;
    if (!_581)
    {
        float _589 = in.m_35.x;
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _593 = _589 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[12].x, _99);
        float _597 = _595 * _591;
        float _599 = floor(_597);
        float _601 = -_599;
        float _603 = _597 + _601;
        _605 = _603;
        _607 = true;
    }
    else
    {
        float _609 = float(_65);
        float _611 = 1.0 / _609;
        float _613 = _99 * _611;
        _605 = _613;
    }
    _607 = false;
    float _615 = _605;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _619 = _615 + _617;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _623 = _615 + _621;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _627 = _615 + _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _629;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _637;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _645 = 1.0 / _635;
    bool _647 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _649 = 1.0 / _631;
    float _651 = 1.0 / _639;
    float _653 = 1.0 / _643;
    float _655 = _619 * _649;
    bool _657 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _659 = isnan(_615);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _665 = _661 || _663;
    float _667 = float(_665);
    bool _669 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _671 = isnan(_615);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = -_667;
    float _683 = _681 + 1.0;
    float _685 = _623 * _651;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _689 = _615 + _687;
    float _691 = -_679;
    float _693 = _691 + 1.0;
    float _695 = _679 * _683;
    float _697 = _689 * _645;
    bool _699 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _701 = isnan(_615);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _707 = _703 || _705;
    float _709 = float(_707);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _711;
    float _715 = _627 * _653;
    bool _717 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _719 = isnan(_615);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = fma(_713, _685, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _731 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _733 = isnan(_615);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _743;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _751 = _727 * _693;
    float _753 = -_727;
    float _755 = _753 + 1.0;
    float _757 = fma(_745, _685, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _763 = fma(_749, _715, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _765 = _709 * _755;
    float _767 = -_709;
    float _769 = _767 + 1.0;
    float _771 = -_741;
    float _773 = _771 + 1.0;
    float _775 = fma(_761, _715, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _777 = _741 * _769;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _779;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _783;
    float _787 = _729 * _777;
    float _789 = _757 * _777;
    float _791 = fma(_781, _655, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _793 = fma(_785, _655, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _795 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[143].x, _787);
    float _797 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[143].y, _789);
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _801 = _799 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _807 = fma(_763, _765, _795);
    float _809 = fma(_775, _765, _797);
    float _811 = fma(_801, _697, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _813 = fma(_805, _697, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _815 = fma(_791, _751, _807);
    float _817 = fma(_793, _751, _809);
    float _819 = fma(_811, _695, _815);
    float _821 = fma(_813, _695, _817);
    float _823 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[147].x, _819);
    float _825 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[147].y, _821);
    bool _827 = !_647;
    float _845;
    if (!_827)
    {
        float _829 = in.m_35.x;
        float _831 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _833 = _829 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _835 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[11].x, _99);
        float _837 = _835 * _831;
        float _839 = floor(_837);
        float _841 = -_839;
        float _843 = _837 + _841;
        _845 = _843;
        _847 = true;
    }
    else
    {
        float _849 = float(_65);
        float _851 = 1.0 / _849;
        float _853 = _99 * _851;
        _845 = _853;
    }
    _847 = false;
    float _855 = _845;
    float _857 = in.m_33.x;
    float _859 = in.m_33.y;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _863 = _855 + _861;
    bool _865 = _855 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _867 = isnan(_855);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _873 = _869 || _871;
    float _875 = float(_873);
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _879 = _855 + _877;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _881;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _887 = _885 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _889 = -_875;
    float _891 = _889 + 1.0;
    float _893 = 1.0 / _887;
    bool _895 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _897 = 1.0 / _883;
    float _899 = _825 * _859;
    bool _901 = _855 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _903 = isnan(_855);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _909 = _905 || _907;
    float _911 = float(_909);
    float _913 = _823 * _857;
    bool _915 = _855 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _917 = isnan(_855);
    bool _919 = _915 || _917;
    bool _921 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _923 = _919 || _921;
    float _925 = float(_923);
    float _927 = _925 * _891;
    float _929 = -_925;
    float _931 = _929 + 1.0;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _933;
    float _937 = _863 * _897;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _939;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _943;
    float _947 = _911 * _931;
    float _949 = fma(_935, _937, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _951 = fma(_941, _937, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _953 = fma(_945, _937, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _955 = _879 * _893;
    float _957 = _949 * _947;
    float _959 = _951 * _947;
    float _961 = _953 * _947;
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _965 = _963 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _969 = _967 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _971 = -_911;
    float _973 = _971 + 1.0;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _977 = _975 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _979 = fma(_965, _955, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _981 = fma(_969, _955, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _983 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[107].x, _957);
    float _985 = fma(_977, _955, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _987 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[107].y, _959);
    float _989 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[107].z, _961);
    float _991 = fma(_979, _927, _983);
    float _993 = fma(_981, _927, _987);
    float _995 = fma(_985, _927, _989);
    float _997 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[109].x, _991);
    float _999 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[109].y, _993);
    float _1001 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[109].z, _995);
    bool _1003 = !_895;
    float _1021;
    if (!_1003)
    {
        float _1005 = in.m_35.x;
        float _1007 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1009 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1011 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[11].y, _99);
        float _1013 = _1011 * _1007;
        float _1015 = floor(_1013);
        float _1017 = -_1015;
        float _1019 = _1013 + _1017;
        _1021 = _1019;
        _1023 = true;
    }
    else
    {
        float _1025 = float(_65);
        float _1027 = 1.0 / _1025;
        float _1029 = _99 * _1027;
        _1021 = _1029;
    }
    _1023 = false;
    float _1031 = _1021;
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1035 = _1031 + _1033;
    float _1037 = _997 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1045 = _1043 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1047 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1049 = isnan(_1031);
    bool _1051 = _1047 || _1049;
    bool _1053 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1055 = _1051 || _1053;
    float _1057 = float(_1055);
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1061 = _1059 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1063 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1065 = isnan(_1031);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1071 = _1067 || _1069;
    float _1073 = float(_1071);
    float _1075 = 1.0 / _1041;
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1077;
    float _1081 = -_1057;
    float _1083 = _1081 + 1.0;
    bool _1085 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1087 = isnan(_1031);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1093 = _1089 || _1091;
    float _1095 = float(_1093);
    float _1097 = _999 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1099 = _1001 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1101 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1103 = 1.0 / _1045;
    float _1105 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1107 = _1099 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1109 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1111 = 1.0 / _1061;
    float _1113 = _1079 * _1075;
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1117 = _1115 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1119 = _1073 * _1083;
    float _1121 = -_1073;
    float _1123 = _1121 + 1.0;
    float _1125 = fma(_1113, _1035, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1127;
    float _1131 = _1095 * _1123;
    float _1133 = _1117 * _1103;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1137 = _1031 + _1135;
    bool _1139 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1141 = isnan(_1031);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    float _1151 = _1125 * _1131;
    float _1153 = -_1095;
    float _1155 = _1153 + 1.0;
    float _1157 = fma(_1133, _1137, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1161 = _1031 + _1159;
    float _1163 = _1129 * _1111;
    float _1165 = -_1149;
    float _1167 = _1165 + 1.0;
    float _1169 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1151);
    float _1171 = fma(_1163, _1161, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1173 = _1057 * _1167;
    float _1175 = fma(_1157, _1119, _1169);
    float _1177 = fma(_1171, _1173, _1175);
    float _1179 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1177);
    float _1181 = _1179 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.x = _1101;
    out.m_37.y = _1105;
    out.m_37.z = _1107;
    out.m_37.w = _1181;
    bool _1183 = !_1109;
    float _1207;
    float _1209;
    if (!_1183)
    {
        float _1185 = in.m_35.x;
        float _1187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1189 = float(_65);
        float _1191 = 1.0 / _1189;
        float _1193 = _1185 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1195 = _99 * _1191;
        float _1197 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[11].w, _99);
        float _1199 = _1197 * _1187;
        float _1201 = floor(_1199);
        float _1203 = -_1201;
        float _1205 = _1199 + _1203;
        _1207 = _1195;
        _1209 = _1205;
        _1211 = true;
    }
    else
    {
        float _1213 = float(_65);
        float _1215 = 1.0 / _1213;
        float _1217 = _99 * _1215;
        _1207 = _1217;
        _1209 = _1217;
    }
    _1211 = false;
    float _1219 = _1207;
    float _1221 = _1209;
    float _1223 = as_type<float>(int(gl_VertexIndex));
    float _1225 = _899 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1227 = in.m_35.x;
    float _1229 = in.m_35.y;
    float _1231 = in.m_35.z;
    float _1233 = in.m_35.w;
    float _1235 = _913 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1237 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1239 = _1237 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1243 = _1241 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1247 = 1.0 / _1239;
    float _1249 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1253 = _1251 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1257 = _1255 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1261 = _1259 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1263 = 1.0 / _1243;
    int _1265 = as_type<int>(_1223) & 1;
    bool _1267 = _1265 != 0;
    int _1269 = as_type<int>(_1223) & 2;
    bool _1271 = _1269 != 0;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1277 = _1275 != 0;
    float _1279 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1281 = _1231 > 0.5;
    float _1283 = 1.0 / _1253;
    int _1285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1287 = _1285 != 0;
    bool _1289 = !_1267;
    float _1291 = _1289 ? (-0.5) : 0.5;
    bool _1293 = !_1271;
    float _1295 = _1293 ? (-0.5) : 0.5;
    int _1297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1299 = _1297 != 0;
    float _1301 = 1.0 / _1257;
    int _1303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1305 = _1303 != 0;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1309 = _1233 > 0.5;
    float _1311 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1249);
    float _1313 = -_1307;
    float _1315 = fma(_1279, 2.0, _1313);
    float _1317 = _1229 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1319 = -_1291;
    int _1321 = _1281 ? as_type<int>(_1319) : as_type<int>(_1291);
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1325 = _1323 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1327 = _1227 > 0.5;
    float _1329 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1331 = _1329 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1333 = fma(_1317, -2.0, _1245);
    float _1335 = 1.0 / _1261;
    float _1337 = fma(_1229, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1273);
    float _1339 = -_1295;
    int _1341 = _1309 ? as_type<int>(_1339) : as_type<int>(_1295);
    float _1343 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1345 = _1343 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1347 = _1229 > 0.5;
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1349;
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1353;
    float _1357 = 1.0 / _1325;
    float _1359 = _1351 * _1247;
    float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1363 = _1361 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1365 = _1355 * _1263;
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1369 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1367;
    float _1371 = 1.0 / _1331;
    bool _1373 = _1219 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1375 = isnan(_1219);
    bool _1377 = _1373 || _1375;
    bool _1379 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1381 = _1377 || _1379;
    float _1383 = float(_1381);
    float _1385 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1333);
    bool _1387 = _1219 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1389 = isnan(_1219);
    bool _1391 = _1387 || _1389;
    bool _1393 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1395 = _1391 || _1393;
    float _1397 = float(_1395);
    float _1399 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1401 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1399;
    bool _1403 = !_1287;
    float _1405 = _1403 ? _1291 : as_type<float>(_1321);
    float _1407 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1291);
    float _1409 = -_1295;
    int _1411 = _1347 ? as_type<int>(_1409) : as_type<int>(_1295);
    float _1413 = 1.0 / _1345;
    float _1415 = _1363 * _1357;
    float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1419 = _1417 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1423 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1421;
    float _1425 = _1401 * _1335;
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1429 = _1219 + _1427;
    bool _1431 = !_1305;
    float _1433 = _1431 ? _1295 : as_type<float>(_1341);
    float _1435 = _1423 * _1301;
    float _1437 = _1369 * _1371;
    float _1439 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1441 = _1439 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1445 = _1221 + _1443;
    float _1447 = _1419 * _1283;
    float _1449 = fma(_1365, _1429, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1453 = _1219 + _1451;
    float _1455 = fma(_1359, _1445, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1457 = _1219 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1459 = isnan(_1219);
    bool _1461 = _1457 || _1459;
    bool _1463 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1465 = _1461 || _1463;
    float _1467 = float(_1465);
    float _1469 = _1441 * _1413;
    bool _1471 = _1219 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1473 = isnan(_1219);
    bool _1475 = _1471 || _1473;
    bool _1477 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1479 = _1475 || _1477;
    float _1481 = float(_1479);
    float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1485 = _1219 + _1483;
    bool _1487 = _1219 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1489 = isnan(_1219);
    bool _1491 = _1487 || _1489;
    bool _1493 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1495 = _1491 || _1493;
    float _1497 = float(_1495);
    float _1499 = -_1467;
    float _1501 = _1499 + 1.0;
    float _1503 = fma(_1437, _1453, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1505 = -_1481;
    float _1507 = _1505 + 1.0;
    float _1509 = fma(_1415, _1485, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _1511 = _1219 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1513 = isnan(_1219);
    bool _1515 = _1511 || _1513;
    bool _1517 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1519 = _1515 || _1517;
    float _1521 = float(_1519);
    float _1523 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1525 = _1219 + _1523;
    float _1527 = _1467 * _1507;
    float _1529 = _1497 * _1501;
    float _1531 = -_1497;
    float _1533 = _1531 + 1.0;
    float _1535 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1537 = _1219 + _1535;
    float _1539 = fma(_1435, _1525, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1541 = _573 * _573;
    float _1543 = _1521 * _1533;
    float _1545 = -_1521;
    float _1547 = _1545 + 1.0;
    float _1549 = fma(_1447, _1537, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _1551 = _1219 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1553 = isnan(_1219);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1559 = _1555 || _1557;
    float _1561 = float(_1559);
    float _1563 = fma(_575, _575, _1541);
    float _1565 = _1383 * _1547;
    float _1567 = -_1383;
    float _1569 = _1567 + 1.0;
    float _1571 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1573 = _1219 + _1571;
    float _1575 = -_1561;
    float _1577 = _1575 + 1.0;
    bool _1579 = _1219 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1581 = isnan(_1219);
    bool _1583 = _1579 || _1581;
    bool _1585 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1587 = _1583 || _1585;
    float _1589 = float(_1587);
    float _1591 = _1561 * _1569;
    float _1593 = fma(_577, _577, _1563);
    float _1595 = fma(_1469, _1573, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1597 = _1397 * _1577;
    float _1599 = -_1397;
    float _1601 = _1599 + 1.0;
    float _1603 = rsqrt(_1593);
    float _1605 = -_1291;
    int _1607 = _1327 ? as_type<int>(_1605) : as_type<int>(_1291);
    float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1611 = _1219 + _1609;
    float _1613 = _1589 * _1601;
    bool _1615 = !_1299;
    float _1617 = _1615 ? _1295 : as_type<float>(_1411);
    float _1619 = _1235 * _1407;
    bool _1621 = !_1277;
    float _1623 = _1621 ? _1291 : as_type<float>(_1607);
    float _1625 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1295);
    float _1627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1629 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1311);
    float _1631 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1337);
    float _1633 = _1225 * _1625;
    float _1635 = _1449 * _1613;
    float _1637 = -_1589;
    float _1639 = _1637 + 1.0;
    bool _1641 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1643 = isnan(_1221);
    bool _1645 = _1641 || _1643;
    bool _1647 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1649 = _1645 || _1647;
    float _1651 = float(_1649);
    float _1653 = _1405 + 0.5;
    float _1655 = _1603 * _577;
    float _1657 = _1603 * _575;
    float _1659 = _1603 * _573;
    float _1661 = fma(_1639, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1635);
    float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1665 = _1655 * _1663;
    float _1667 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1669 = _1657 * _1667;
    float _1671 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1673 = _1659 * _1671;
    bool _1675 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1677 = isnan(_1221);
    bool _1679 = _1675 || _1677;
    bool _1681 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1683 = _1679 || _1681;
    float _1685 = float(_1683);
    float _1687 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1689 = -_1665;
    float _1691 = fma(_1657, _1687, _1689);
    float _1693 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1695 = -_1669;
    float _1697 = fma(_1659, _1693, _1695);
    float _1699 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1701 = -_1673;
    float _1703 = fma(_1655, _1699, _1701);
    float _1705 = fma(_1509, _1597, _1661);
    float _1707 = _1691 * _1691;
    float _1709 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1711 = -_1651;
    float _1713 = _1711 + 1.0;
    float _1715 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1717 = fma(_1703, _1703, _1707);
    float _1719 = -_1433;
    float _1721 = _1719 + 0.5;
    float _1723 = _1685 * _1713;
    float _1725 = -_1685;
    float _1727 = _1725 + 1.0;
    float _1729 = fma(_1697, _1697, _1717);
    float _1731 = fma(_1503, _1591, _1705);
    float _1733 = fma(_1425, _1611, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1735 = -_99;
    float _1737 = fma(_1735, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1315);
    float _1739 = rsqrt(_1729);
    float _1741 = fma(_1549, _1565, _1731);
    float _1743 = _1617 + (-0.5);
    float _1745 = _1623 + 0.5;
    float _1747 = _1455 * _1723;
    float _1749 = fma(_1539, _1543, _1741);
    float _1751 = _1709 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1753 = -_1715;
    float _1755 = -_1385;
    float _1757 = fma(_1753, _1743, _1755);
    float _1759 = _1633 * _1659;
    float _1761 = fma(_1595, _1529, _1749);
    float _1763 = fma(_1751, _1745, _1737);
    float _1765 = fma(_1727, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1747);
    float _1767 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1769 = fma(_1733, _1527, _1761);
    float _1771 = _1633 * _1655;
    float _1773 = -_1629;
    float _1775 = _1773 + 1.0;
    float _1777 = _1703 * _1739;
    float _1779 = _1697 * _1739;
    float _1781 = _1691 * _1739;
    float _1783 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1785 = _1655 * _1777;
    float _1787 = fma(_1619, _1779, _1771);
    float _1789 = _1633 * _1657;
    float _1791 = fma(_1619, _1781, _1759);
    float _1793 = -_1785;
    float _1795 = fma(_1657, _1779, _1793);
    float _1797 = _1659 * _1779;
    float _1799 = _1657 * _1781;
    float _1801 = fma(_1619, _1777, _1789);
    float _1803 = fma(_1783, _1795, _1791);
    float _1805 = -_1797;
    float _1807 = fma(_1655, _1781, _1805);
    float _1809 = -_1799;
    float _1811 = fma(_1659, _1777, _1809);
    float _1813 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1769);
    float _1815 = _1803 * _1803;
    float _1817 = fma(_1783, _1807, _1801);
    float _1819 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1821 = fma(_1783, _1811, _1787);
    float _1823 = -_1631;
    float _1825 = _1823 + 1.0;
    float _1827 = fma(_1817, _1817, _1815);
    float _1829 = _1653 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1831 = fma(_1651, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1765);
    float _1833 = _1721 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1835 = fma(_1821, _1821, _1827);
    float _1837 = -_1775;
    float _1839 = fma(_1623, _1837, _1763);
    float _1841 = fma(_1617, _1825, _1757);
    float _1843 = _1831 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1845 = sqrt(_1835);
    out.m_42.x = _1813;
    float _1847 = _391 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1849 = _1829 * _1819;
    float _1851 = _1833 * _1767;
    out.m_44.w = _1843;
    float _1853 = _391 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1855 = _391 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1857 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1847);
    out.m_46.x = _1839;
    out.m_46.y = _1841;
    out.m_46.z = _1849;
    out.m_46.w = _1851;
    float _1859 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1853);
    float _1861 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1855);
    float _1863 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1857);
    bool _1865 = _1845 > 0.0;
    float _1867 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1859);
    float _1869 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1861);
    float _1871 = _1863 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1873 = _1867 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1875 = _1869 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1877 = _1871 + _1803;
    float _1879 = _1873 + _1817;
    float _1881 = _1875 + _1821;
    bool _1883 = !_1865;
    float _1885 = _1841;
    float _1887 = _1839;
    float _1889 = _1593;
    float _1891 = _1877;
    float _1893 = _1879;
    float _1895 = _1881;
    if (!_1883)
    {
        bool _1897 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1899 = _1875;
        if (_1897)
        {
            float _1901 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1899 = _1901;
        }
        float _1903 = _1899;
        if (_1897)
        {
            _1885 = _1593;
        }
        float _1905 = _1885;
        float _1907 = _1903;
        float _1909 = _1905;
        if (_1897)
        {
            float _1911 = _1903 * _575;
            _1887 = _1911;
        }
        float _1913 = _1887;
        float _1915 = _1913;
        if (_1897)
        {
            float _1917 = _1903 * _573;
            _1889 = _1917;
        }
        float _1919 = _1889;
        float _1921 = _1919;
        float _1923 = _1919;
        if (_1897)
        {
            float _1925 = _1903 * _577;
            _1907 = _1925;
        }
        float _1927 = _1907;
        float _1929 = _1927;
        if (!_1897)
        {
            float _1931 = _99 + 1.0;
            float _1933 = _1931;
            if (!_141)
            {
                float _1935 = _1931 * _1931;
                float _1937 = _1935 * 0.5;
                _1921 = _1937;
            }
            float _1939 = _1921;
            float _1941 = _1939;
            if (!_141)
            {
                float _1943 = _1939 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1941 = _1943;
            }
            float _1945 = _1941;
            bool _1947 = !_141;
            float _1949 = _1945;
            if (!_1947)
            {
                float _1951 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1953 = log2(_1951);
                float _1955 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1957 = _1955 + 1.0;
                float _1959 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1961 = _1953 * _1931;
                float _1963 = 1.0 / _1957;
                float _1965 = _1959 * 0.693147182464599609375;
                float _1967 = exp2(_1961);
                float _1969 = 1.0 / _1965;
                float _1971 = _1967 + (-1.0);
                float _1973 = -_1971;
                float _1975 = fma(_1973, _1969, _1931);
                float _1977 = _1975 * _1963;
                float _1979 = _1977 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1949 = _1979;
            }
            float _1981 = _1949;
            float _1983 = _1981 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1985 = _1981 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1987 = !_141;
            if (!_1987)
            {
                float _1989 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1991 = log2(_1989);
                float _1993 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1995 = _1993 + 1.0;
                float _1997 = 1.0 / _1995;
                float _1999 = _1991 * _1931;
                float _2001 = exp2(_1999);
                float _2003 = -_2001;
                float _2005 = _2003 + 1.0;
                float _2007 = _2005 * _1997;
                _1933 = _2007;
            }
            float _2009 = _1933;
            float _2011 = fma(_2009, _127, _1985);
            float _2013 = _1981 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2015 = fma(_2009, _125, _1983);
            float _2017 = -_321;
            float _2019 = _2017 + _2011;
            float _2021 = fma(_2009, _129, _2013);
            float _2023 = -_327;
            float _2025 = _2023 + _2015;
            float _2027 = _2019 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2029 = _2019 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2031 = -_335;
            float _2033 = _2031 + _2021;
            float _2035 = _2019 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2037 = fma(_2025, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2027);
            float _2039 = fma(_2025, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2029);
            float _2041 = fma(_2025, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2035);
            float _2043 = fma(_2033, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2037);
            float _2045 = fma(_2033, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2039);
            float _2047 = fma(_2033, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2041);
            float _2049 = _2043 * _2043;
            float _2051 = fma(_2045, _2045, _2049);
            float _2053 = fma(_2047, _2047, _2051);
            _1909 = _2053;
            _583 = _2043;
            _585 = _2045;
            _587 = _2047;
            _1915 = _2045;
            _1923 = _2043;
            _1929 = _2047;
        }
        float _2055 = _1909;
        float _2057 = _583;
        float _2059 = _585;
        float _2061 = _587;
        float _2063 = _1915;
        float _2065 = _1923;
        float _2067 = _1929;
        float _2069 = sqrt(_2055);
        float _2071 = rsqrt(_1835);
        bool _2073 = _2069 > 0.0;
        float _2075 = _1817 * _2071;
        float _2077 = _1803 * _2071;
        float _2079 = _1821 * _2071;
        bool _2081 = !_2073;
        if (!_2081)
        {
            float _2083 = rsqrt(_2055);
            float _2085 = _2083 * _2057;
            float _2087 = _2083 * _2059;
            float _2089 = _2077 * _2085;
            float _2091 = _2083 * _2061;
            float _2093 = fma(_2075, _2087, _2089);
            float _2095 = fma(_2079, _2091, _2093);
            float _2097 = _2095 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2099 = fma(_2063, _2097, _1879);
            float _2101 = fma(_2065, _2097, _1877);
            float _2103 = fma(_2067, _2097, _1881);
            _1891 = _2101;
            _1893 = _2099;
            _1895 = _2103;
        }
    }
    float _2105 = _1891;
    float _2107 = _1893;
    float _2109 = _1895;
    float _2111 = _2105 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2113 = _2105 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2115 = _2105 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2117 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2111);
    float _2119 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2113);
    float _2121 = _2105 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2123 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2115);
    float _2125 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2117);
    float _2127 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2119);
    float _2129 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2121);
    float _2131 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2123);
    float _2133 = _2125 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2135 = _2127 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2137 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2129);
    float _2139 = _2131 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2141 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2143 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2145 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2147 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2149 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2141);
    float _2151 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2143);
    float _2153 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2145);
    float _2155 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2147);
    float _2157 = _2137 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2159 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2149);
    float _2161 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2151);
    float _2163 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2153);
    float _2165 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2155);
    float _2167 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2159);
    float _2169 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2161);
    float _2171 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2163);
    float _2173 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2165);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _2169;
    out.gl_Position.y = _2167;
    out.gl_Position.z = _2171;
    out.gl_Position.w = _2173;
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
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1211 = false;
    bool _1023 = false;
    bool _847 = false;
    bool _607 = false;
    bool _451 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = in.m_26.w;
    float _62 = trunc(_60);
    int _65 = int(_62);
    bool _69 = _65 >= 1;
    float _71 = 0.0;
    if (!_69)
    {
        _71 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _73 = _71;
    float _75 = _73;
    if (!_69)
    {
        out.m_29.x = 0.0;
    }
    int _77 = 0;
    if (!_69)
    {
        float _79 = _73 * 5.0;
        _77 = as_type<int>(_79);
    }
    int _81 = _77;
    int _83 = _81;
    if (!_69)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2230 = as_type<float>(_81);
        out.gl_Position.z = _2230;
    }
    if (!_69)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _85 = in.m_31.w;
    bool _87 = _85 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _89 = isnan(_85);
    bool _91 = _87 || _89;
    bool _93 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _95 = _91 || _93;
    float _97 = -_85;
    float _99 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _101 = 0.0;
    float _103 = 0.0;
    if (_95)
    {
        float _105 = float(_65);
        _75 = _105;
    }
    float _107 = _75;
    bool _109 = _99 >= _107;
    bool _111 = !_95;
    bool _113 = _109 || _111;
    float _115 = _107;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (_113)
    {
        out.m_29.x = 0.0;
    }
    if (_113)
    {
        float _119 = _117 * 5.0;
        _83 = as_type<int>(_119);
    }
    int _121 = _83;
    float _123 = as_type<float>(_121);
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2301 = as_type<float>(_121);
        out.gl_Position.z = _2301;
    }
    if (_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_31.x;
    float _127 = in.m_31.y;
    float _129 = in.m_31.z;
    float _131 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _133 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _135 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _137 = _133 || _135;
    bool _139 = isnan(1.0);
    bool _141 = _137 || _139;
    float _143 = _131;
    if (!_141)
    {
        float _145 = _131 * _131;
        float _147 = _145 * 0.5;
        _123 = _147;
    }
    float _149 = _123;
    float _151 = 0.0;
    float _153 = _149;
    if (!_141)
    {
        float _155 = _99 * _99;
        float _157 = _155 * 0.5;
        _151 = _157;
    }
    float _159 = _151;
    if (!_141)
    {
        float _161 = _149 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _153 = _161;
    }
    float _163 = _153;
    bool _165 = !_141;
    float _167 = _163;
    if (!_165)
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
        _101 = _187;
        _167 = _197;
        _103 = _185;
    }
    float _199 = _101;
    float _201 = _167;
    float _203 = _103;
    bool _205 = !_141;
    float _207 = _199;
    float _209 = _203;
    if (!_205)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = 1.0 / _217;
        float _221 = _131 * _213;
        float _223 = exp2(_221);
        float _225 = -_223;
        float _227 = _225 + 1.0;
        float _229 = _227 * _219;
        _207 = _223;
        _209 = _217;
        _143 = _229;
    }
    float _231 = _207;
    float _233 = _209;
    float _235 = _143;
    float _237 = _233;
    float _239 = _231;
    if (!_141)
    {
        _237 = _99;
    }
    float _241 = _237;
    float _243 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _245 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _247 = _241;
    if (!_141)
    {
        float _249 = _159 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _239 = _249;
    }
    float _251 = _239;
    bool _253 = !_141;
    float _255 = _251;
    if (!_253)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = _99 * _259;
        float _269 = 1.0 / _263;
        float _271 = _265 * 0.693147182464599609375;
        float _273 = exp2(_267);
        float _275 = 1.0 / _271;
        float _277 = _273 + (-1.0);
        float _279 = -_277;
        float _281 = fma(_279, _275, _99);
        float _283 = _281 * _269;
        float _285 = _283 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _255 = _285;
    }
    float _287 = _255;
    bool _289 = !_141;
    if (!_289)
    {
        float _291 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _293 = log2(_291);
        float _295 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _297 = _295 + 1.0;
        float _299 = 1.0 / _297;
        float _301 = _99 * _293;
        float _303 = exp2(_301);
        float _305 = -_303;
        float _307 = _305 + 1.0;
        float _309 = _307 * _299;
        _247 = _309;
    }
    float _311 = _247;
    float _313 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _315 = fma(_235, _127, _245);
    float _317 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _319 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _321 = fma(_311, _127, _313);
    float _323 = fma(_235, _125, _243);
    float _325 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _327 = fma(_311, _125, _317);
    float _329 = -_321;
    float _331 = _315 + _329;
    float _333 = fma(_235, _129, _319);
    float _335 = fma(_311, _129, _325);
    float _337 = -_327;
    float _339 = _323 + _337;
    float _341 = _331 * _331;
    float _343 = in.m_33.w;
    float _345 = -_335;
    float _347 = _333 + _345;
    float _349 = _331 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _351 = fma(_339, _339, _341);
    float _353 = _331 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _355 = _331 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _357 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[4].x, _349);
    float _359 = fma(_347, _347, _351);
    float _361 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[5].x, _353);
    float _363 = in.m_26.x;
    float _365 = in.m_26.y;
    float _367 = in.m_26.z;
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
    float _389 = fma(_323, _343, _363);
    float _391 = fma(_315, _343, _365);
    float _393 = fma(_333, _343, _367);
    float _395 = _369;
    float _397 = _347;
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
    float _583 = _573;
    float _585 = _575;
    float _587 = _577;
    float _605;
    if (!_581)
    {
        float _589 = in.m_35.x;
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _593 = _589 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[12].x, _99);
        float _597 = _595 * _591;
        float _599 = floor(_597);
        float _601 = -_599;
        float _603 = _597 + _601;
        _605 = _603;
        _607 = true;
    }
    else
    {
        float _609 = float(_65);
        float _611 = 1.0 / _609;
        float _613 = _99 * _611;
        _605 = _613;
    }
    _607 = false;
    float _615 = _605;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _619 = _615 + _617;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _623 = _615 + _621;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _627 = _615 + _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _629;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _637;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _645 = 1.0 / _635;
    bool _647 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _649 = 1.0 / _631;
    float _651 = 1.0 / _639;
    float _653 = 1.0 / _643;
    float _655 = _619 * _649;
    bool _657 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _659 = isnan(_615);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _665 = _661 || _663;
    float _667 = float(_665);
    bool _669 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _671 = isnan(_615);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = -_667;
    float _683 = _681 + 1.0;
    float _685 = _623 * _651;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _689 = _615 + _687;
    float _691 = -_679;
    float _693 = _691 + 1.0;
    float _695 = _679 * _683;
    float _697 = _689 * _645;
    bool _699 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _701 = isnan(_615);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _707 = _703 || _705;
    float _709 = float(_707);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _711;
    float _715 = _627 * _653;
    bool _717 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _719 = isnan(_615);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = fma(_713, _685, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _731 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _733 = isnan(_615);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _743;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _751 = _727 * _693;
    float _753 = -_727;
    float _755 = _753 + 1.0;
    float _757 = fma(_745, _685, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _763 = fma(_749, _715, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _765 = _709 * _755;
    float _767 = -_709;
    float _769 = _767 + 1.0;
    float _771 = -_741;
    float _773 = _771 + 1.0;
    float _775 = fma(_761, _715, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _777 = _741 * _769;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _779;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _783;
    float _787 = _729 * _777;
    float _789 = _757 * _777;
    float _791 = fma(_781, _655, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _793 = fma(_785, _655, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _795 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[143].x, _787);
    float _797 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[143].y, _789);
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _801 = _799 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _807 = fma(_763, _765, _795);
    float _809 = fma(_775, _765, _797);
    float _811 = fma(_801, _697, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _813 = fma(_805, _697, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _815 = fma(_791, _751, _807);
    float _817 = fma(_793, _751, _809);
    float _819 = fma(_811, _695, _815);
    float _821 = fma(_813, _695, _817);
    float _823 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[147].x, _819);
    float _825 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[147].y, _821);
    bool _827 = !_647;
    float _845;
    if (!_827)
    {
        float _829 = in.m_35.x;
        float _831 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _833 = _829 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _835 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[11].x, _99);
        float _837 = _835 * _831;
        float _839 = floor(_837);
        float _841 = -_839;
        float _843 = _837 + _841;
        _845 = _843;
        _847 = true;
    }
    else
    {
        float _849 = float(_65);
        float _851 = 1.0 / _849;
        float _853 = _99 * _851;
        _845 = _853;
    }
    _847 = false;
    float _855 = _845;
    float _857 = in.m_33.x;
    float _859 = in.m_33.y;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _863 = _855 + _861;
    bool _865 = _855 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _867 = isnan(_855);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _873 = _869 || _871;
    float _875 = float(_873);
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _879 = _855 + _877;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _881;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _887 = _885 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _889 = -_875;
    float _891 = _889 + 1.0;
    float _893 = 1.0 / _887;
    bool _895 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _897 = 1.0 / _883;
    float _899 = _825 * _859;
    bool _901 = _855 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _903 = isnan(_855);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _909 = _905 || _907;
    float _911 = float(_909);
    float _913 = _823 * _857;
    bool _915 = _855 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _917 = isnan(_855);
    bool _919 = _915 || _917;
    bool _921 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _923 = _919 || _921;
    float _925 = float(_923);
    float _927 = _925 * _891;
    float _929 = -_925;
    float _931 = _929 + 1.0;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _933;
    float _937 = _863 * _897;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _939;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _943;
    float _947 = _911 * _931;
    float _949 = fma(_935, _937, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _951 = fma(_941, _937, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _953 = fma(_945, _937, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _955 = _879 * _893;
    float _957 = _949 * _947;
    float _959 = _951 * _947;
    float _961 = _953 * _947;
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _965 = _963 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _969 = _967 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _971 = -_911;
    float _973 = _971 + 1.0;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _977 = _975 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _979 = fma(_965, _955, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _981 = fma(_969, _955, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _983 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[107].x, _957);
    float _985 = fma(_977, _955, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _987 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[107].y, _959);
    float _989 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[107].z, _961);
    float _991 = fma(_979, _927, _983);
    float _993 = fma(_981, _927, _987);
    float _995 = fma(_985, _927, _989);
    float _997 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[109].x, _991);
    float _999 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[109].y, _993);
    float _1001 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[109].z, _995);
    bool _1003 = !_895;
    float _1021;
    if (!_1003)
    {
        float _1005 = in.m_35.x;
        float _1007 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1009 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1011 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[11].y, _99);
        float _1013 = _1011 * _1007;
        float _1015 = floor(_1013);
        float _1017 = -_1015;
        float _1019 = _1013 + _1017;
        _1021 = _1019;
        _1023 = true;
    }
    else
    {
        float _1025 = float(_65);
        float _1027 = 1.0 / _1025;
        float _1029 = _99 * _1027;
        _1021 = _1029;
    }
    _1023 = false;
    float _1031 = _1021;
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1035 = _1031 + _1033;
    float _1037 = _997 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1045 = _1043 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1047 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1049 = isnan(_1031);
    bool _1051 = _1047 || _1049;
    bool _1053 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1055 = _1051 || _1053;
    float _1057 = float(_1055);
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1061 = _1059 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1063 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1065 = isnan(_1031);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1071 = _1067 || _1069;
    float _1073 = float(_1071);
    float _1075 = 1.0 / _1041;
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1077;
    float _1081 = -_1057;
    float _1083 = _1081 + 1.0;
    bool _1085 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1087 = isnan(_1031);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1093 = _1089 || _1091;
    float _1095 = float(_1093);
    float _1097 = _999 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1099 = _1001 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1101 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1103 = 1.0 / _1045;
    float _1105 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1107 = _1099 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1109 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1111 = 1.0 / _1061;
    float _1113 = _1079 * _1075;
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1117 = _1115 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1119 = _1073 * _1083;
    float _1121 = -_1073;
    float _1123 = _1121 + 1.0;
    float _1125 = fma(_1113, _1035, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1127;
    float _1131 = _1095 * _1123;
    float _1133 = _1117 * _1103;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1137 = _1031 + _1135;
    bool _1139 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1141 = isnan(_1031);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    float _1151 = _1125 * _1131;
    float _1153 = -_1095;
    float _1155 = _1153 + 1.0;
    float _1157 = fma(_1133, _1137, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1161 = _1031 + _1159;
    float _1163 = _1129 * _1111;
    float _1165 = -_1149;
    float _1167 = _1165 + 1.0;
    float _1169 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1151);
    float _1171 = fma(_1163, _1161, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1173 = _1057 * _1167;
    float _1175 = fma(_1157, _1119, _1169);
    float _1177 = fma(_1171, _1173, _1175);
    float _1179 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1177);
    float _1181 = _1179 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.x = _1101;
    out.m_37.y = _1105;
    out.m_37.z = _1107;
    out.m_37.w = _1181;
    bool _1183 = !_1109;
    float _1207;
    float _1209;
    if (!_1183)
    {
        float _1185 = in.m_35.x;
        float _1187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1189 = float(_65);
        float _1191 = 1.0 / _1189;
        float _1193 = _1185 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1195 = _99 * _1191;
        float _1197 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[11].w, _99);
        float _1199 = _1197 * _1187;
        float _1201 = floor(_1199);
        float _1203 = -_1201;
        float _1205 = _1199 + _1203;
        _1207 = _1195;
        _1209 = _1205;
        _1211 = true;
    }
    else
    {
        float _1213 = float(_65);
        float _1215 = 1.0 / _1213;
        float _1217 = _99 * _1215;
        _1207 = _1217;
        _1209 = _1217;
    }
    _1211 = false;
    float _1219 = _1207;
    float _1221 = _1209;
    float _1223 = as_type<float>(int(gl_VertexIndex));
    float _1225 = _899 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1227 = in.m_35.x;
    float _1229 = in.m_35.y;
    float _1231 = in.m_35.z;
    float _1233 = in.m_35.w;
    float _1235 = _913 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1237 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1239 = _1237 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1243 = _1241 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1247 = 1.0 / _1239;
    float _1249 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1253 = _1251 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1257 = _1255 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1261 = _1259 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1263 = 1.0 / _1243;
    int _1265 = as_type<int>(_1223) & 1;
    bool _1267 = _1265 != 0;
    int _1269 = as_type<int>(_1223) & 2;
    bool _1271 = _1269 != 0;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1277 = _1275 != 0;
    float _1279 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1281 = _1231 > 0.5;
    float _1283 = 1.0 / _1253;
    int _1285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1287 = _1285 != 0;
    bool _1289 = !_1267;
    float _1291 = _1289 ? (-0.5) : 0.5;
    bool _1293 = !_1271;
    float _1295 = _1293 ? (-0.5) : 0.5;
    int _1297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1299 = _1297 != 0;
    float _1301 = 1.0 / _1257;
    int _1303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1305 = _1303 != 0;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1309 = _1233 > 0.5;
    float _1311 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1249);
    float _1313 = -_1307;
    float _1315 = fma(_1279, 2.0, _1313);
    float _1317 = _1229 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1319 = -_1291;
    int _1321 = _1281 ? as_type<int>(_1319) : as_type<int>(_1291);
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1325 = _1323 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1327 = _1227 > 0.5;
    float _1329 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1331 = _1329 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1333 = fma(_1317, -2.0, _1245);
    float _1335 = 1.0 / _1261;
    float _1337 = fma(_1229, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1273);
    float _1339 = -_1295;
    int _1341 = _1309 ? as_type<int>(_1339) : as_type<int>(_1295);
    float _1343 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1345 = _1343 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1347 = _1229 > 0.5;
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1349;
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1353;
    float _1357 = 1.0 / _1325;
    float _1359 = _1351 * _1247;
    float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1363 = _1361 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1365 = _1355 * _1263;
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1369 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1367;
    float _1371 = 1.0 / _1331;
    bool _1373 = _1219 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1375 = isnan(_1219);
    bool _1377 = _1373 || _1375;
    bool _1379 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1381 = _1377 || _1379;
    float _1383 = float(_1381);
    float _1385 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1333);
    bool _1387 = _1219 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1389 = isnan(_1219);
    bool _1391 = _1387 || _1389;
    bool _1393 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1395 = _1391 || _1393;
    float _1397 = float(_1395);
    float _1399 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1401 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1399;
    bool _1403 = !_1287;
    float _1405 = _1403 ? _1291 : as_type<float>(_1321);
    float _1407 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1291);
    float _1409 = -_1295;
    int _1411 = _1347 ? as_type<int>(_1409) : as_type<int>(_1295);
    float _1413 = 1.0 / _1345;
    float _1415 = _1363 * _1357;
    float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1419 = _1417 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1423 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1421;
    float _1425 = _1401 * _1335;
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1429 = _1219 + _1427;
    bool _1431 = !_1305;
    float _1433 = _1431 ? _1295 : as_type<float>(_1341);
    float _1435 = _1423 * _1301;
    float _1437 = _1369 * _1371;
    float _1439 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1441 = _1439 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1445 = _1221 + _1443;
    float _1447 = _1419 * _1283;
    float _1449 = fma(_1365, _1429, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1453 = _1219 + _1451;
    float _1455 = fma(_1359, _1445, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1457 = _1219 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1459 = isnan(_1219);
    bool _1461 = _1457 || _1459;
    bool _1463 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1465 = _1461 || _1463;
    float _1467 = float(_1465);
    float _1469 = _1441 * _1413;
    bool _1471 = _1219 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1473 = isnan(_1219);
    bool _1475 = _1471 || _1473;
    bool _1477 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1479 = _1475 || _1477;
    float _1481 = float(_1479);
    float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1485 = _1219 + _1483;
    bool _1487 = _1219 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1489 = isnan(_1219);
    bool _1491 = _1487 || _1489;
    bool _1493 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1495 = _1491 || _1493;
    float _1497 = float(_1495);
    float _1499 = -_1467;
    float _1501 = _1499 + 1.0;
    float _1503 = fma(_1437, _1453, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1505 = -_1481;
    float _1507 = _1505 + 1.0;
    float _1509 = fma(_1415, _1485, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _1511 = _1219 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1513 = isnan(_1219);
    bool _1515 = _1511 || _1513;
    bool _1517 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1519 = _1515 || _1517;
    float _1521 = float(_1519);
    float _1523 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1525 = _1219 + _1523;
    float _1527 = _1467 * _1507;
    float _1529 = _1497 * _1501;
    float _1531 = -_1497;
    float _1533 = _1531 + 1.0;
    float _1535 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1537 = _1219 + _1535;
    float _1539 = fma(_1435, _1525, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1541 = _573 * _573;
    float _1543 = _1521 * _1533;
    float _1545 = -_1521;
    float _1547 = _1545 + 1.0;
    float _1549 = fma(_1447, _1537, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _1551 = _1219 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1553 = isnan(_1219);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1559 = _1555 || _1557;
    float _1561 = float(_1559);
    float _1563 = fma(_575, _575, _1541);
    float _1565 = _1383 * _1547;
    float _1567 = -_1383;
    float _1569 = _1567 + 1.0;
    float _1571 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1573 = _1219 + _1571;
    float _1575 = -_1561;
    float _1577 = _1575 + 1.0;
    bool _1579 = _1219 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1581 = isnan(_1219);
    bool _1583 = _1579 || _1581;
    bool _1585 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1587 = _1583 || _1585;
    float _1589 = float(_1587);
    float _1591 = _1561 * _1569;
    float _1593 = fma(_577, _577, _1563);
    float _1595 = fma(_1469, _1573, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1597 = _1397 * _1577;
    float _1599 = -_1397;
    float _1601 = _1599 + 1.0;
    float _1603 = rsqrt(_1593);
    float _1605 = -_1291;
    int _1607 = _1327 ? as_type<int>(_1605) : as_type<int>(_1291);
    float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1611 = _1219 + _1609;
    float _1613 = _1589 * _1601;
    bool _1615 = !_1299;
    float _1617 = _1615 ? _1295 : as_type<float>(_1411);
    float _1619 = _1235 * _1407;
    bool _1621 = !_1277;
    float _1623 = _1621 ? _1291 : as_type<float>(_1607);
    float _1625 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1295);
    float _1627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1629 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1311);
    float _1631 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1337);
    float _1633 = _1225 * _1625;
    float _1635 = _1449 * _1613;
    float _1637 = -_1589;
    float _1639 = _1637 + 1.0;
    bool _1641 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1643 = isnan(_1221);
    bool _1645 = _1641 || _1643;
    bool _1647 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1649 = _1645 || _1647;
    float _1651 = float(_1649);
    float _1653 = _1405 + 0.5;
    float _1655 = _1603 * _577;
    float _1657 = _1603 * _575;
    float _1659 = _1603 * _573;
    float _1661 = fma(_1639, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1635);
    float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1665 = _1655 * _1663;
    float _1667 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1669 = _1657 * _1667;
    float _1671 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1673 = _1659 * _1671;
    bool _1675 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1677 = isnan(_1221);
    bool _1679 = _1675 || _1677;
    bool _1681 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1683 = _1679 || _1681;
    float _1685 = float(_1683);
    float _1687 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1689 = -_1665;
    float _1691 = fma(_1657, _1687, _1689);
    float _1693 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1695 = -_1669;
    float _1697 = fma(_1659, _1693, _1695);
    float _1699 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1701 = -_1673;
    float _1703 = fma(_1655, _1699, _1701);
    float _1705 = fma(_1509, _1597, _1661);
    float _1707 = _1691 * _1691;
    float _1709 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1711 = -_1651;
    float _1713 = _1711 + 1.0;
    float _1715 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1717 = fma(_1703, _1703, _1707);
    float _1719 = -_1433;
    float _1721 = _1719 + 0.5;
    float _1723 = _1685 * _1713;
    float _1725 = -_1685;
    float _1727 = _1725 + 1.0;
    float _1729 = fma(_1697, _1697, _1717);
    float _1731 = fma(_1503, _1591, _1705);
    float _1733 = fma(_1425, _1611, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1735 = -_99;
    float _1737 = fma(_1735, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1315);
    float _1739 = rsqrt(_1729);
    float _1741 = fma(_1549, _1565, _1731);
    float _1743 = _1617 + (-0.5);
    float _1745 = _1623 + 0.5;
    float _1747 = _1455 * _1723;
    float _1749 = fma(_1539, _1543, _1741);
    float _1751 = _1709 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1753 = -_1715;
    float _1755 = -_1385;
    float _1757 = fma(_1753, _1743, _1755);
    float _1759 = _1633 * _1659;
    float _1761 = fma(_1595, _1529, _1749);
    float _1763 = fma(_1751, _1745, _1737);
    float _1765 = fma(_1727, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1747);
    float _1767 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1769 = fma(_1733, _1527, _1761);
    float _1771 = _1633 * _1655;
    float _1773 = -_1629;
    float _1775 = _1773 + 1.0;
    float _1777 = _1703 * _1739;
    float _1779 = _1697 * _1739;
    float _1781 = _1691 * _1739;
    float _1783 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1785 = _1655 * _1777;
    float _1787 = fma(_1619, _1779, _1771);
    float _1789 = _1633 * _1657;
    float _1791 = fma(_1619, _1781, _1759);
    float _1793 = -_1785;
    float _1795 = fma(_1657, _1779, _1793);
    float _1797 = _1659 * _1779;
    float _1799 = _1657 * _1781;
    float _1801 = fma(_1619, _1777, _1789);
    float _1803 = fma(_1783, _1795, _1791);
    float _1805 = -_1797;
    float _1807 = fma(_1655, _1781, _1805);
    float _1809 = -_1799;
    float _1811 = fma(_1659, _1777, _1809);
    float _1813 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1769);
    float _1815 = _1803 * _1803;
    float _1817 = fma(_1783, _1807, _1801);
    float _1819 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1821 = fma(_1783, _1811, _1787);
    float _1823 = -_1631;
    float _1825 = _1823 + 1.0;
    float _1827 = fma(_1817, _1817, _1815);
    float _1829 = _1653 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1831 = fma(_1651, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1765);
    float _1833 = _1721 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1835 = fma(_1821, _1821, _1827);
    float _1837 = -_1775;
    float _1839 = fma(_1623, _1837, _1763);
    float _1841 = fma(_1617, _1825, _1757);
    float _1843 = _1831 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1845 = sqrt(_1835);
    out.m_42.x = _1813;
    float _1847 = _391 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1849 = _1829 * _1819;
    float _1851 = _1833 * _1767;
    out.m_44.w = _1843;
    float _1853 = _391 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1855 = _391 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1857 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1847);
    out.m_46.x = _1839;
    out.m_46.y = _1841;
    out.m_46.z = _1849;
    out.m_46.w = _1851;
    float _1859 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1853);
    float _1861 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1855);
    float _1863 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1857);
    bool _1865 = _1845 > 0.0;
    float _1867 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1859);
    float _1869 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1861);
    float _1871 = _1863 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1873 = _1867 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1875 = _1869 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1877 = _1871 + _1803;
    float _1879 = _1873 + _1817;
    float _1881 = _1875 + _1821;
    bool _1883 = !_1865;
    float _1885 = _1841;
    float _1887 = _1839;
    float _1889 = _1593;
    float _1891 = _1877;
    float _1893 = _1879;
    float _1895 = _1881;
    if (!_1883)
    {
        bool _1897 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1899 = _1875;
        if (_1897)
        {
            float _1901 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1899 = _1901;
        }
        float _1903 = _1899;
        if (_1897)
        {
            _1885 = _1593;
        }
        float _1905 = _1885;
        float _1907 = _1903;
        float _1909 = _1905;
        if (_1897)
        {
            float _1911 = _1903 * _575;
            _1887 = _1911;
        }
        float _1913 = _1887;
        float _1915 = _1913;
        if (_1897)
        {
            float _1917 = _1903 * _573;
            _1889 = _1917;
        }
        float _1919 = _1889;
        float _1921 = _1919;
        float _1923 = _1919;
        if (_1897)
        {
            float _1925 = _1903 * _577;
            _1907 = _1925;
        }
        float _1927 = _1907;
        float _1929 = _1927;
        if (!_1897)
        {
            float _1931 = _99 + 1.0;
            float _1933 = _1931;
            if (!_141)
            {
                float _1935 = _1931 * _1931;
                float _1937 = _1935 * 0.5;
                _1921 = _1937;
            }
            float _1939 = _1921;
            float _1941 = _1939;
            if (!_141)
            {
                float _1943 = _1939 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1941 = _1943;
            }
            float _1945 = _1941;
            bool _1947 = !_141;
            float _1949 = _1945;
            if (!_1947)
            {
                float _1951 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1953 = log2(_1951);
                float _1955 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1957 = _1955 + 1.0;
                float _1959 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1961 = _1953 * _1931;
                float _1963 = 1.0 / _1957;
                float _1965 = _1959 * 0.693147182464599609375;
                float _1967 = exp2(_1961);
                float _1969 = 1.0 / _1965;
                float _1971 = _1967 + (-1.0);
                float _1973 = -_1971;
                float _1975 = fma(_1973, _1969, _1931);
                float _1977 = _1975 * _1963;
                float _1979 = _1977 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1949 = _1979;
            }
            float _1981 = _1949;
            float _1983 = _1981 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1985 = _1981 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1987 = !_141;
            if (!_1987)
            {
                float _1989 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1991 = log2(_1989);
                float _1993 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1995 = _1993 + 1.0;
                float _1997 = 1.0 / _1995;
                float _1999 = _1991 * _1931;
                float _2001 = exp2(_1999);
                float _2003 = -_2001;
                float _2005 = _2003 + 1.0;
                float _2007 = _2005 * _1997;
                _1933 = _2007;
            }
            float _2009 = _1933;
            float _2011 = fma(_2009, _127, _1985);
            float _2013 = _1981 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2015 = fma(_2009, _125, _1983);
            float _2017 = -_321;
            float _2019 = _2017 + _2011;
            float _2021 = fma(_2009, _129, _2013);
            float _2023 = -_327;
            float _2025 = _2023 + _2015;
            float _2027 = _2019 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2029 = _2019 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2031 = -_335;
            float _2033 = _2031 + _2021;
            float _2035 = _2019 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2037 = fma(_2025, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2027);
            float _2039 = fma(_2025, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2029);
            float _2041 = fma(_2025, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2035);
            float _2043 = fma(_2033, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2037);
            float _2045 = fma(_2033, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2039);
            float _2047 = fma(_2033, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2041);
            float _2049 = _2043 * _2043;
            float _2051 = fma(_2045, _2045, _2049);
            float _2053 = fma(_2047, _2047, _2051);
            _1909 = _2053;
            _583 = _2043;
            _585 = _2045;
            _587 = _2047;
            _1915 = _2045;
            _1923 = _2043;
            _1929 = _2047;
        }
        float _2055 = _1909;
        float _2057 = _583;
        float _2059 = _585;
        float _2061 = _587;
        float _2063 = _1915;
        float _2065 = _1923;
        float _2067 = _1929;
        float _2069 = sqrt(_2055);
        float _2071 = rsqrt(_1835);
        bool _2073 = _2069 > 0.0;
        float _2075 = _1817 * _2071;
        float _2077 = _1803 * _2071;
        float _2079 = _1821 * _2071;
        bool _2081 = !_2073;
        if (!_2081)
        {
            float _2083 = rsqrt(_2055);
            float _2085 = _2083 * _2057;
            float _2087 = _2083 * _2059;
            float _2089 = _2077 * _2085;
            float _2091 = _2083 * _2061;
            float _2093 = fma(_2075, _2087, _2089);
            float _2095 = fma(_2079, _2091, _2093);
            float _2097 = _2095 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2099 = fma(_2063, _2097, _1879);
            float _2101 = fma(_2065, _2097, _1877);
            float _2103 = fma(_2067, _2097, _1881);
            _1891 = _2101;
            _1893 = _2099;
            _1895 = _2103;
        }
    }
    float _2105 = _1891;
    float _2107 = _1893;
    float _2109 = _1895;
    float _2111 = _2105 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2113 = _2105 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2115 = _2105 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2117 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2111);
    float _2119 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2113);
    float _2121 = _2105 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2123 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2115);
    float _2125 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2117);
    float _2127 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2119);
    float _2129 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2121);
    float _2131 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2123);
    float _2133 = _2125 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2135 = _2127 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2137 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2129);
    float _2139 = _2131 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2141 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2143 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2145 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2147 = _2133 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2149 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2141);
    float _2151 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2143);
    float _2153 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2145);
    float _2155 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2147);
    float _2157 = _2137 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2159 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2149);
    float _2161 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2151);
    float _2163 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2153);
    float _2165 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2155);
    float _2167 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2159);
    float _2169 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2161);
    float _2171 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2163);
    float _2173 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2165);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _2169;
    out.gl_Position.y = _2167;
    out.gl_Position.z = _2171;
    out.gl_Position.w = _2173;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

