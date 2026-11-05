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
    float4 m_50 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_54 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 m_52 [[user(locn6)]];
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
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1257 = false;
    bool _699 = false;
    bool _597 = false;
    bool _447 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_32.w;
    float _70 = trunc(_68);
    int _73 = int(_70);
    bool _77 = _73 >= 1;
    float _79 = 0.0;
    if (!_77)
    {
        _79 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _79;
    float _83 = _81;
    if (!_77)
    {
        out.m_35.x = 0.0;
    }
    int _85 = 0;
    if (!_77)
    {
        float _87 = _81 * 5.0;
        _85 = as_type<int>(_87);
    }
    int _89 = _85;
    int _91 = _89;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1720 = as_type<float>(_89);
        out.gl_Position.z = _1720;
    }
    if (!_77)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _93 = in.m_37.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _109 = 0.0;
    float _111 = 0.0;
    if (_103)
    {
        float _113 = float(_73);
        _83 = _113;
    }
    float _115 = _83;
    bool _117 = _107 >= _115;
    bool _119 = !_103;
    bool _121 = _117 || _119;
    float _123 = _115;
    if (_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    if (_121)
    {
        out.m_35.x = 0.0;
    }
    if (_121)
    {
        float _127 = _125 * 5.0;
        _91 = as_type<int>(_127);
    }
    int _129 = _91;
    float _131 = as_type<float>(_129);
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1791 = as_type<float>(_129);
        out.gl_Position.z = _1791;
    }
    if (_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = in.m_37.x;
    float _135 = in.m_37.y;
    float _137 = in.m_37.z;
    float _139 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _141 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _143 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _145 = _141 || _143;
    bool _147 = isnan(1.0);
    bool _149 = _145 || _147;
    float _151 = _139;
    if (!_149)
    {
        float _153 = _139 * _139;
        float _155 = _153 * 0.5;
        _131 = _155;
    }
    float _157 = _131;
    float _159 = 0.0;
    float _161 = _157;
    if (!_149)
    {
        float _163 = _107 * _107;
        float _165 = _163 * 0.5;
        _159 = _165;
    }
    float _167 = _159;
    if (!_149)
    {
        float _169 = _157 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _161 = _169;
    }
    float _171 = _161;
    bool _173 = !_149;
    float _175 = _171;
    if (!_173)
    {
        float _177 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _179 = log2(_177);
        float _181 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _183 = _181 + 1.0;
        float _185 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _187 = _139 * _179;
        float _189 = 1.0 / _183;
        float _191 = _185 * 0.693147182464599609375;
        float _193 = exp2(_187);
        float _195 = 1.0 / _191;
        float _197 = _193 + (-1.0);
        float _199 = -_197;
        float _201 = fma(_199, _195, _139);
        float _203 = _201 * _189;
        float _205 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _109 = _195;
        _175 = _205;
        _111 = _193;
    }
    float _207 = _109;
    float _209 = _175;
    float _211 = _111;
    bool _213 = !_149;
    float _215 = _207;
    float _217 = _211;
    if (!_213)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = 1.0 / _225;
        float _229 = _139 * _221;
        float _231 = exp2(_229);
        float _233 = -_231;
        float _235 = _233 + 1.0;
        float _237 = _235 * _227;
        _215 = _231;
        _217 = _225;
        _151 = _237;
    }
    float _239 = _215;
    float _241 = _217;
    float _243 = _151;
    float _245 = _241;
    float _247 = _239;
    if (!_149)
    {
        _245 = _107;
    }
    float _249 = _245;
    float _251 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _253 = _249;
    if (!_149)
    {
        float _255 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _247 = _255;
    }
    float _257 = _247;
    bool _259 = !_149;
    float _261 = _257;
    if (!_259)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _273 = _107 * _265;
        float _275 = 1.0 / _269;
        float _277 = _271 * 0.693147182464599609375;
        float _279 = exp2(_273);
        float _281 = 1.0 / _277;
        float _283 = _279 + (-1.0);
        float _285 = -_283;
        float _287 = fma(_285, _281, _107);
        float _289 = _287 * _275;
        float _291 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _261 = _291;
    }
    float _293 = _261;
    bool _295 = !_149;
    if (!_295)
    {
        float _297 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = log2(_297);
        float _301 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _303 = _301 + 1.0;
        float _305 = 1.0 / _303;
        float _307 = _107 * _299;
        float _309 = exp2(_307);
        float _311 = -_309;
        float _313 = _311 + 1.0;
        float _315 = _313 * _305;
        _253 = _315;
    }
    float _317 = _253;
    float _319 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _321 = fma(_243, _135, _251);
    float _323 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _325 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _327 = fma(_317, _135, _319);
    float _329 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _331 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _333 = fma(_243, _133, _323);
    float _335 = fma(_317, _133, _325);
    float _337 = -_327;
    float _339 = _321 + _337;
    float _341 = fma(_243, _137, _329);
    float _343 = fma(_317, _137, _331);
    float _345 = -_335;
    float _347 = _333 + _345;
    float _349 = _339 * _339;
    float _351 = in.m_39.w;
    float _353 = -_343;
    float _355 = _341 + _353;
    float _357 = _339 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _359 = fma(_347, _347, _349);
    float _361 = _339 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _363 = _339 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _365 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[4].x, _357);
    float _367 = fma(_355, _355, _359);
    float _369 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[5].x, _361);
    float _371 = in.m_32.x;
    float _373 = in.m_32.y;
    float _375 = in.m_32.z;
    float _377 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[6].x, _363);
    float _379 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[4].z, _365);
    float _381 = sqrt(_367);
    float _383 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[5].z, _369);
    float _385 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[6].z, _377);
    bool _387 = _381 >= 9.9999999747524270787835121154785e-07;
    bool _389 = isnan(_381);
    bool _391 = _387 || _389;
    bool _393 = isnan(9.9999999747524270787835121154785e-07);
    bool _395 = _391 || _393;
    float _397 = fma(_333, _351, _371);
    float _399 = fma(_321, _351, _373);
    float _401 = fma(_341, _351, _375);
    float _403 = _383;
    float _405 = _379;
    float _407 = _385;
    if (!_395)
    {
        bool _409 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _411 = !_409;
        if (!_411)
        {
            float _413 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _415 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _417 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _419 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _413);
            float _421 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _415);
            float _423 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _417);
            float _425 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _419);
            float _427 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _421);
            float _429 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _423);
            float _431 = _425 * _425;
            float _433 = fma(_427, _427, _431);
            float _435 = fma(_429, _429, _433);
            float _437 = rsqrt(_435);
            float _439 = _437 * 9.9999999747524270787835121154785e-07;
            float _441 = _427 * _439;
            float _443 = _425 * _439;
            float _445 = _429 * _439;
            _403 = _443;
            _405 = _441;
            _407 = _445;
            _447 = true;
        }
        else
        {
            float _449 = _135 * _135;
            float _451 = fma(_133, _133, _449);
            float _453 = fma(_137, _137, _451);
            float _455 = sqrt(_453);
            bool _457 = _455 >= 9.9999999747524270787835121154785e-07;
            bool _459 = isnan(_455);
            bool _461 = _457 || _459;
            bool _463 = isnan(9.9999999747524270787835121154785e-07);
            bool _465 = _461 || _463;
            if (!_465)
            {
                float _467 = _373 * _373;
                float _469 = fma(_371, _371, _467);
                float _471 = fma(_375, _375, _469);
                float _473 = sqrt(_471);
                bool _475 = _473 >= 9.9999999747524270787835121154785e-07;
                bool _477 = isnan(_473);
                bool _479 = _475 || _477;
                bool _481 = isnan(9.9999999747524270787835121154785e-07);
                bool _483 = _479 || _481;
                if (!_483)
                {
                    float _485 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _487 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _485);
                    float _489 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _487);
                    float _491 = rsqrt(_489);
                    float _493 = _491 * 9.9999999747524270787835121154785e-07;
                    float _495 = _493 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _497 = _493 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _499 = _493 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _403 = _497;
                    _405 = _495;
                    _407 = _499;
                    _447 = true;
                }
                else
                {
                    float _501 = _373 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _503 = _373 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _505 = _373 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _507 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].x, _501);
                    float _509 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].x, _503);
                    float _511 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].x, _505);
                    float _513 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].z, _507);
                    float _515 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].z, _509);
                    float _517 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].z, _511);
                    float _519 = _513 * _513;
                    float _521 = fma(_515, _515, _519);
                    float _523 = fma(_517, _517, _521);
                    float _525 = rsqrt(_523);
                    float _527 = _525 * 9.9999999747524270787835121154785e-07;
                    float _529 = _515 * _527;
                    float _531 = _513 * _527;
                    float _533 = _517 * _527;
                    _403 = _531;
                    _405 = _529;
                    _407 = _533;
                    _447 = true;
                }
            }
            else
            {
                float _535 = _135 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _537 = _135 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _539 = _135 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _541 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[5].x, _535);
                float _543 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[4].x, _537);
                float _545 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[6].x, _539);
                float _547 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[5].z, _541);
                float _549 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[4].z, _543);
                float _551 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[6].z, _545);
                float _553 = _547 * _547;
                float _555 = fma(_549, _549, _553);
                float _557 = fma(_551, _551, _555);
                float _559 = rsqrt(_557);
                float _561 = _559 * 9.9999999747524270787835121154785e-07;
                float _563 = _549 * _561;
                float _565 = _547 * _561;
                float _567 = _551 * _561;
                _403 = _565;
                _405 = _563;
                _407 = _567;
            }
        }
    }
    _447 = false;
    float _569 = _403;
    float _571 = _405;
    float _573 = _407;
    bool _575 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _577 = !_575;
    float _595;
    if (!_577)
    {
        float _579 = in.m_41.x;
        float _581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _583 = _579 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _585 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _587 = _585 * _581;
        float _589 = floor(_587);
        float _591 = -_589;
        float _593 = _587 + _591;
        _595 = _593;
        _597 = true;
    }
    else
    {
        float _599 = float(_73);
        float _601 = 1.0 / _599;
        float _603 = _107 * _601;
        _595 = _603;
    }
    _597 = false;
    float _605 = _595;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _609 = _605 + _607;
    bool _611 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _613 = isnan(_605);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _623;
    float _627 = -_621;
    float _629 = _627 + 1.0;
    bool _631 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _633 = isnan(_605);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _643;
    bool _647 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _649 = 1.0 / _625;
    float _651 = _641 * _629;
    float _653 = -_641;
    float _655 = _653 + 1.0;
    float _657 = _609 * _649;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _659;
    float _663 = fma(_645, _657, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _665 = fma(_661, _657, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _667 = _663 * _651;
    float _669 = _665 * _651;
    float _671 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[143].x, _667);
    float _673 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[143].y, _669);
    float _675 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[144].x, _671);
    float _677 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[144].y, _673);
    bool _679 = !_647;
    float _697;
    if (!_679)
    {
        float _681 = in.m_41.x;
        float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _685 = _681 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _689 = _687 * _683;
        float _691 = floor(_689);
        float _693 = -_691;
        float _695 = _689 + _693;
        _697 = _695;
        _699 = true;
    }
    else
    {
        float _701 = float(_73);
        float _703 = 1.0 / _701;
        float _705 = _107 * _703;
        _697 = _705;
    }
    _699 = false;
    float _707 = _697;
    float _709 = _399 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _711 = _399 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _713 = _399 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _715 = as_type<float>(int(gl_VertexIndex));
    float _717 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[5].x, _709);
    float _719 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[4].x, _711);
    float _721 = _569 * _569;
    float _723 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[6].x, _713);
    float _725 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[5].z, _717);
    float _727 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[4].z, _719);
    float _729 = fma(_571, _571, _721);
    float _731 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[6].z, _723);
    float _733 = _725 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _735 = _727 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _737 = fma(_573, _573, _729);
    float _739 = _731 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _741 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _743 = _733 + _741;
    float _745 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _747 = _735 + _745;
    float _749 = rsqrt(_737);
    float _751 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _753 = _739 + _751;
    float _755 = _743 * _743;
    float _757 = in.m_41.x;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _761 = _707 + _759;
    float _763 = fma(_747, _747, _755);
    float _765 = in.m_41.y;
    int _767 = as_type<int>(_715) & 1;
    bool _769 = _767 != 0;
    int _771 = as_type<int>(_715) & 2;
    bool _773 = _771 != 0;
    float _775 = fma(_753, _753, _763);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _781 = rsqrt(_775);
    float _783 = _749 * _573;
    float _785 = _749 * _571;
    float _787 = _749 * _569;
    float _789 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _791 = _783 * _789;
    float _793 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _795 = _785 * _793;
    float _797 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _799 = _787 * _797;
    float _801 = in.m_39.x;
    float _803 = in.m_39.y;
    float _805 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _807 = -_791;
    float _809 = fma(_785, _805, _807);
    float _811 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _813 = -_795;
    float _815 = fma(_787, _811, _813);
    float _817 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _819 = -_799;
    float _821 = fma(_783, _817, _819);
    bool _823 = _757 > 0.5;
    float _825 = _809 * _809;
    float _827 = 1.0 / _779;
    float _829 = _743 * _781;
    float _831 = _747 * _781;
    float _833 = fma(_821, _821, _825);
    float _835 = -_829;
    float _837 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[18].w, _743);
    float _839 = -_831;
    float _841 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[18].w, _747);
    float _843 = _753 * _781;
    float _845 = _837 * _837;
    float _847 = -_843;
    float _849 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[18].w, _753);
    float _851 = fma(_841, _841, _845);
    float _853 = fma(_815, _815, _833);
    float _855 = fma(_849, _849, _851);
    float _857 = _677 * _803;
    float _859 = _675 * _801;
    float _861 = rsqrt(_853);
    bool _863 = !_769;
    float _865 = _863 ? (-0.5) : 0.5;
    float _867 = -_865;
    int _869 = _823 ? as_type<int>(_867) : as_type<int>(_865);
    float _871 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _865);
    float _873 = sqrt(_855);
    float _875 = _821 * _861;
    float _877 = _809 * _861;
    float _879 = _815 * _861;
    bool _881 = !_773;
    float _883 = _881 ? (-0.5) : 0.5;
    float _885 = _857 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _887 = _765 > 0.5;
    float _889 = _783 * _875;
    bool _891 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _893 = isnan(_707);
    bool _895 = _891 || _893;
    bool _897 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _899 = _895 || _897;
    float _901 = float(_899);
    float _903 = _781 * _873;
    float _905 = _859 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _907 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _883);
    float _909 = _885 * _903;
    float _911 = _905 * _903;
    float _913 = _787 * _879;
    float _915 = _909 * _907;
    float _917 = _911 * _871;
    float _919 = _785 * _877;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _925 = _915 * _785;
    float _927 = _915 * _783;
    float _929 = -_913;
    float _931 = fma(_783, _877, _929);
    float _933 = _903 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _935 = _933 * 0.5;
    float _937 = fma(_917, _875, _925);
    float _939 = -_919;
    float _941 = fma(_787, _875, _939);
    float _943 = fma(_917, _879, _927);
    float _945 = 1.0 / _923;
    float _947 = fma(_935, _931, _937);
    float _949 = _915 * _787;
    float _951 = fma(_935, _941, _943);
    float _953 = _735 + _947;
    float _955 = -_889;
    float _957 = fma(_785, _879, _955);
    float _959 = _739 + _951;
    int _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _963 = _961 != 0;
    float _965 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _967 = _953 + _965;
    float _969 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _971 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _969;
    float _973 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _975 = _959 + _973;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _979 = _977 != 0;
    float _981 = _967 * _967;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _985 = _983 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _987 = _975 * _975;
    float _989 = _971 * _945;
    bool _991 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _993 = isnan(_707);
    bool _995 = _991 || _993;
    bool _997 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _999 = _995 || _997;
    float _1001 = float(_999);
    float _1003 = _985 * _827;
    float _1005 = _981 + _987;
    float _1007 = fma(_989, _761, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1009 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1011 = isnan(_707);
    bool _1013 = _1009 || _1011;
    bool _1015 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1017 = _1013 || _1015;
    float _1019 = float(_1017);
    float _1021 = -_1001;
    float _1023 = _1021 + 1.0;
    float _1025 = sqrt(_1005);
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1029 = _707 + _1027;
    float _1031 = fma(_917, _877, _949);
    float _1033 = _1019 * _1023;
    float _1035 = -_1019;
    float _1037 = _1035 + 1.0;
    float _1039 = fma(_1003, _1029, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1041 = -_883;
    int _1043 = _887 ? as_type<int>(_1041) : as_type<int>(_883);
    float _1045 = fma(_935, _957, _1031);
    float _1047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1049 = _901 * _1037;
    bool _1051 = !_963;
    float _1053 = _1051 ? _865 : as_type<float>(_869);
    float _1055 = -_901;
    float _1057 = _1055 + 1.0;
    bool _1059 = !_979;
    float _1061 = _1059 ? _883 : as_type<float>(_1043);
    float _1063 = _1007 * _1049;
    float _1065 = _733 + _1045;
    float _1067 = _1053 + 0.5;
    bool _1069 = _1025 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1071 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1073 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1063);
    float _1075 = -_1061;
    float _1077 = _1075 + 0.5;
    float _1079 = _865;
    float _1081 = _917;
    float _1083 = _935;
    float _1085 = _981;
    float _1087 = _987;
    if (!_1069)
    {
        _1079 = _953;
    }
    float _1089 = _1079;
    float _1091 = _1089;
    if (!_1069)
    {
        _1081 = _959;
    }
    float _1093 = _1081;
    float _1095 = _1093;
    if (!_1069)
    {
        _1083 = _1065;
    }
    float _1097 = _1083;
    bool _1099 = !_1069;
    float _1101 = _1097;
    if (!_1099)
    {
        float _1103 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1105 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1107 = _1025 + _1105;
        float _1109 = _1065 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1111 = rsqrt(_1005);
        float _1113 = _1107 * _1103;
        float _1115 = _1113 * 0.15915493667125701904296875;
        float _1117 = _1115 * 6.283185482025146484375;
        float _1119 = sin(_1117);
        float _1121 = _1115 * 6.283185482025146484375;
        float _1123 = cos(_1121);
        float _1125 = fma(_1119, _1109, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1127 = _1111 * _1125;
        float _1129 = _1123 + (-1.0);
        float _1131 = fma(_967, _1127, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1133 = fma(_975, _1127, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1135 = _1129 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1137 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1139 = _1131 + _1137;
        float _1141 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1143 = _1133 + _1141;
        float _1145 = fma(_1065, _1123, _1135);
        float _1147 = _1139 * _1139;
        float _1149 = _1143 * _1143;
        _1101 = _1145;
        _1085 = _1147;
        _1087 = _1149;
        _1095 = _1133;
        _1091 = _1131;
    }
    float _1151 = _1101;
    float _1153 = _1085;
    float _1155 = _1087;
    float _1157 = _1095;
    float _1159 = _1091;
    float _1161 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1163 = _1151 + _1161;
    float _1165 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1167 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1169 = fma(_1039, _1033, _1073);
    float _1171 = fma(_1163, _1163, _1153);
    float _1173 = _1165 * _1047;
    float _1175 = _1167 * _1071;
    float _1177 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1169);
    float _1179 = _1171 + _1155;
    out.m_46.x = _1173;
    float _1181 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1183 = sqrt(_1179);
    float _1185 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1197 = _1185 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1201 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1203 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1205 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1207 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1209 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_46.y = _1175;
    bool _1211 = _1183 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1213 = isnan(_1183);
    bool _1215 = _1211 || _1213;
    bool _1217 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1219 = _1215 || _1217;
    out.m_48.x = _1201;
    out.m_48.y = _1203;
    out.m_48.z = _1205;
    out.m_48.w = _1199;
    out.m_50.x = _1197;
    out.m_50.y = _1207;
    out.m_50.z = _1209;
    out.m_50.w = _1181;
    float _1221 = _1177;
    if (!_1219)
    {
        _1221 = 1.0;
    }
    float _1223 = _1221;
    bool _1225 = !_1219;
    float _1227 = _1223;
    if (!_1225)
    {
        bool _1229 = _1183 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1231 = isnan(_1183);
        bool _1233 = _1229 || _1231;
        bool _1235 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1237 = _1233 || _1235;
        if (!_1237)
        {
            float _1239 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1241 = _1183 + _1239;
            float _1243 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1245 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1243;
            float _1247 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1249 = _1247 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1251 = 1.0 / _1245;
            float _1253 = _1241 * _1251;
            float _1255 = fma(_1253, _1249, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1227 = _1255;
            _1257 = true;
        }
        else
        {
            bool _1259 = _1183 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1261 = isnan(_1183);
            bool _1263 = _1259 || _1261;
            bool _1265 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1267 = _1263 || _1265;
            if (!_1267)
            {
                float _1269 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1271 = _1183 + _1269;
                float _1273 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1275 = _1273 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1277 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1279 = _1277 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1281 = 1.0 / _1275;
                float _1283 = _1271 * _1281;
                float _1285 = fma(_1283, _1279, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1227 = _1285;
                _1257 = true;
            }
            else
            {
                _1227 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1257 = false;
    float _1287 = _1227;
    float _1289 = -_829;
    float _1291 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[18].w, _733);
    float _1293 = -_831;
    float _1295 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[18].w, _735);
    float _1297 = -_843;
    float _1299 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[18].w, _739);
    float _1301 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1303 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1305 = _1151 + _1303;
    float _1307 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1309 = _1157 + _1307;
    bool _1311 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1313 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1315 = _1311 || _1313;
    bool _1317 = isnan(0.5);
    bool _1319 = _1315 || _1317;
    float _1321 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1301);
    float _1323 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1325 = _1159 + _1323;
    float _1327 = fma(_1305, _1287, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1329 = fma(_1309, _1287, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1331 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1321);
    float _1333 = fma(_1325, _1287, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1335 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1337 = -_843;
    float _1339 = fma(_1337, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1329);
    float _1341 = _1331 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1343 = -_831;
    float _1345 = fma(_1343, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1333);
    float _1347 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1335);
    float _1349 = -_829;
    float _1351 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1327);
    float _1353 = 1.0 / _1341;
    float _1355 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1347);
    float _1357 = _1347;
    float _1359 = _1351;
    float _1361 = _1339;
    if (_1319)
    {
        _1357 = _1345;
    }
    float _1363 = _1357;
    float _1365 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1367 = _1363;
    if (!_1319)
    {
        float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1371 = _1291 + _1369;
        float _1373 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1375 = _1295 + _1373;
        float _1377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1379 = -_735;
        float _1381 = _1379 + _1333;
        float _1383 = _1371 * _1371;
        float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1387 = _1299 + _1385;
        float _1389 = -_733;
        float _1391 = _1389 + _1327;
        float _1393 = -_739;
        float _1395 = _1393 + _1329;
        float _1397 = fma(_1375, _1375, _1383);
        float _1399 = 1.0 / _903;
        float _1401 = fma(_1387, _1387, _1397);
        float _1403 = sqrt(_1401);
        float _1405 = precise::min(_1403, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1407 = _1405 * _1377;
        float _1409 = _1407 * _1399;
        float _1411 = fma(_1381, _1409, _1295);
        float _1413 = fma(_1391, _1409, _1291);
        float _1415 = fma(_1395, _1409, _1299);
        _1359 = _1413;
        _1367 = _1411;
        _1361 = _1415;
    }
    float _1417 = _1359;
    float _1419 = _1367;
    float _1421 = _1361;
    float _1423 = _1365 + _1341;
    float _1425 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1427 = _1423 * _1353;
    float _1429 = _1427 * 0.5;
    float _1431 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1433 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1425);
    bool _1435 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1437 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1439 = _1435 || _1437;
    bool _1441 = isnan(0.5);
    bool _1443 = _1439 || _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1447 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1445);
    float _1449 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1431);
    float _1451 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1433);
    float _1453 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1455 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1457 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1449);
    float _1459 = 1.0 / _1447;
    float _1461 = _1451 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1463 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1453);
    float _1465 = _1457 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1467 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1455);
    float _1469 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1471 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1473 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1475 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1477 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1463);
    float _1479 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1469);
    float _1481 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1471);
    float _1483 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1473);
    float _1485 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1475);
    float _1487 = _1465;
    float _1489 = _1469;
    if (_1443)
    {
        _1487 = 1.0;
    }
    float _1491 = _1487;
    float _1493 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1467);
    float _1495 = _1491;
    if (_1443)
    {
        _1489 = 1.0;
    }
    float _1497 = _1489;
    float _1499 = _1477 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1501 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1503 = _1459 * _1501;
    float _1505 = _1497;
    if (!_1443)
    {
        float _1507 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1509 = _1507 * 0.15915493667125701904296875;
        float _1511 = _1509 * 6.283185482025146484375;
        float _1513 = cos(_1511);
        float _1515 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1517 = _1515 * 0.15915493667125701904296875;
        float _1519 = _1509 * 6.283185482025146484375;
        float _1521 = sin(_1519);
        float _1523 = 1.0 / _1513;
        float _1525 = _1517 * 6.283185482025146484375;
        float _1527 = cos(_1525);
        float _1529 = _1521 * _1523;
        float _1531 = _1517 * 6.283185482025146484375;
        float _1533 = sin(_1531);
        float _1535 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1537 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1535;
        float _1539 = _1527 * _1529;
        float _1541 = 1.0 / _1537;
        float _1543 = 1.0 / _1539;
        float _1545 = _1533 * _1543;
        float _1547 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1549 = fma(_1503, _1545, _1547);
        float _1551 = _1549 * _1541;
        float _1553 = precise::clamp(_1551, 0.0, 1.0);
        _1495 = _1553;
    }
    float _1555 = _1495;
    if (!_1443)
    {
        float _1557 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1559 = _1557 * 0.15915493667125701904296875;
        float _1561 = _1559 * 6.283185482025146484375;
        float _1563 = cos(_1561);
        float _1565 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1567 = _1565 * 0.15915493667125701904296875;
        float _1569 = _1559 * 6.283185482025146484375;
        float _1571 = sin(_1569);
        float _1573 = 1.0 / _1563;
        float _1575 = _1567 * 6.283185482025146484375;
        float _1577 = cos(_1575);
        float _1579 = _1571 * _1573;
        float _1581 = _1567 * 6.283185482025146484375;
        float _1583 = sin(_1581);
        float _1585 = _1577 * _1579;
        float _1587 = 1.0 / _1585;
        float _1589 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1591 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1589;
        float _1593 = 1.0 / _1591;
        float _1595 = _1583 * _1587;
        float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1599 = fma(_1503, _1595, _1597);
        float _1601 = _1599 * _1593;
        float _1603 = precise::clamp(_1601, 0.0, 1.0);
        float _1605 = -_1603;
        float _1607 = _1605 + 1.0;
        _1505 = _1607;
    }
    float _1609 = _1505;
    bool _1611 = _1555 > 0.0;
    bool _1613 = isnan(_1555);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan(0.0);
    bool _1619 = _1615 || _1617;
    float _1621 = _1493 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1623 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1479);
    float _1625 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1483);
    float _1627 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1485);
    float _1629 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1481);
    float _1631 = _1555 * _1609;
    bool _1633 = _1609 <= 0.0;
    bool _1635 = !_1619;
    bool _1637 = _1633 || _1635;
    float _1639 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1623);
    float _1641 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1627);
    float _1643 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1625);
    float _1645 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1629);
    float _1647 = _1631 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1649 = _1639 + _1641;
    float _1651 = _1643 + _1641;
    float _1653 = _1641 * 0.5;
    float _1655 = _1649 * 0.5;
    float _1657 = _1651 * 0.5;
    float _1659 = fma(_1645, -0.5, _1653);
    float _1661 = _1647 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_52.x = _1419;
    out.m_52.y = _1417;
    out.m_52.z = _1421;
    out.gl_Position.x = _1639;
    out.gl_Position.y = _1645;
    out.gl_Position.z = _1643;
    out.gl_Position.w = _1641;
    out.m_54.x = _1655;
    out.m_54.y = _1659;
    out.m_54.z = _1657;
    out.m_54.w = _1641;
    out.m_35.x = _1661;
    if (!_1637)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _1663 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1663;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1257 = false;
    bool _699 = false;
    bool _597 = false;
    bool _447 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_32.w;
    float _70 = trunc(_68);
    int _73 = int(_70);
    bool _77 = _73 >= 1;
    float _79 = 0.0;
    if (!_77)
    {
        _79 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _79;
    float _83 = _81;
    if (!_77)
    {
        out.m_35.x = 0.0;
    }
    int _85 = 0;
    if (!_77)
    {
        float _87 = _81 * 5.0;
        _85 = as_type<int>(_87);
    }
    int _89 = _85;
    int _91 = _89;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1720 = as_type<float>(_89);
        out.gl_Position.z = _1720;
    }
    if (!_77)
    {
        return out;
    }
    float _93 = in.m_37.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _109 = 0.0;
    float _111 = 0.0;
    if (_103)
    {
        float _113 = float(_73);
        _83 = _113;
    }
    float _115 = _83;
    bool _117 = _107 >= _115;
    bool _119 = !_103;
    bool _121 = _117 || _119;
    float _123 = _115;
    if (_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    if (_121)
    {
        out.m_35.x = 0.0;
    }
    if (_121)
    {
        float _127 = _125 * 5.0;
        _91 = as_type<int>(_127);
    }
    int _129 = _91;
    float _131 = as_type<float>(_129);
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1791 = as_type<float>(_129);
        out.gl_Position.z = _1791;
    }
    if (_121)
    {
        return out;
    }
    float _133 = in.m_37.x;
    float _135 = in.m_37.y;
    float _137 = in.m_37.z;
    float _139 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _141 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _143 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _145 = _141 || _143;
    bool _147 = isnan(1.0);
    bool _149 = _145 || _147;
    float _151 = _139;
    if (!_149)
    {
        float _153 = _139 * _139;
        float _155 = _153 * 0.5;
        _131 = _155;
    }
    float _157 = _131;
    float _159 = 0.0;
    float _161 = _157;
    if (!_149)
    {
        float _163 = _107 * _107;
        float _165 = _163 * 0.5;
        _159 = _165;
    }
    float _167 = _159;
    if (!_149)
    {
        float _169 = _157 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _161 = _169;
    }
    float _171 = _161;
    bool _173 = !_149;
    float _175 = _171;
    if (!_173)
    {
        float _177 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _179 = log2(_177);
        float _181 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _183 = _181 + 1.0;
        float _185 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _187 = _139 * _179;
        float _189 = 1.0 / _183;
        float _191 = _185 * 0.693147182464599609375;
        float _193 = exp2(_187);
        float _195 = 1.0 / _191;
        float _197 = _193 + (-1.0);
        float _199 = -_197;
        float _201 = fma(_199, _195, _139);
        float _203 = _201 * _189;
        float _205 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _109 = _195;
        _175 = _205;
        _111 = _193;
    }
    float _207 = _109;
    float _209 = _175;
    float _211 = _111;
    bool _213 = !_149;
    float _215 = _207;
    float _217 = _211;
    if (!_213)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = 1.0 / _225;
        float _229 = _139 * _221;
        float _231 = exp2(_229);
        float _233 = -_231;
        float _235 = _233 + 1.0;
        float _237 = _235 * _227;
        _215 = _231;
        _217 = _225;
        _151 = _237;
    }
    float _239 = _215;
    float _241 = _217;
    float _243 = _151;
    float _245 = _241;
    float _247 = _239;
    if (!_149)
    {
        _245 = _107;
    }
    float _249 = _245;
    float _251 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _253 = _249;
    if (!_149)
    {
        float _255 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _247 = _255;
    }
    float _257 = _247;
    bool _259 = !_149;
    float _261 = _257;
    if (!_259)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _273 = _107 * _265;
        float _275 = 1.0 / _269;
        float _277 = _271 * 0.693147182464599609375;
        float _279 = exp2(_273);
        float _281 = 1.0 / _277;
        float _283 = _279 + (-1.0);
        float _285 = -_283;
        float _287 = fma(_285, _281, _107);
        float _289 = _287 * _275;
        float _291 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _261 = _291;
    }
    float _293 = _261;
    bool _295 = !_149;
    if (!_295)
    {
        float _297 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = log2(_297);
        float _301 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _303 = _301 + 1.0;
        float _305 = 1.0 / _303;
        float _307 = _107 * _299;
        float _309 = exp2(_307);
        float _311 = -_309;
        float _313 = _311 + 1.0;
        float _315 = _313 * _305;
        _253 = _315;
    }
    float _317 = _253;
    float _319 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _321 = fma(_243, _135, _251);
    float _323 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _325 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _327 = fma(_317, _135, _319);
    float _329 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _331 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _333 = fma(_243, _133, _323);
    float _335 = fma(_317, _133, _325);
    float _337 = -_327;
    float _339 = _321 + _337;
    float _341 = fma(_243, _137, _329);
    float _343 = fma(_317, _137, _331);
    float _345 = -_335;
    float _347 = _333 + _345;
    float _349 = _339 * _339;
    float _351 = in.m_39.w;
    float _353 = -_343;
    float _355 = _341 + _353;
    float _357 = _339 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _359 = fma(_347, _347, _349);
    float _361 = _339 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _363 = _339 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _365 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[4].x, _357);
    float _367 = fma(_355, _355, _359);
    float _369 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[5].x, _361);
    float _371 = in.m_32.x;
    float _373 = in.m_32.y;
    float _375 = in.m_32.z;
    float _377 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[6].x, _363);
    float _379 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[4].z, _365);
    float _381 = sqrt(_367);
    float _383 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[5].z, _369);
    float _385 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[6].z, _377);
    bool _387 = _381 >= 9.9999999747524270787835121154785e-07;
    bool _389 = isnan(_381);
    bool _391 = _387 || _389;
    bool _393 = isnan(9.9999999747524270787835121154785e-07);
    bool _395 = _391 || _393;
    float _397 = fma(_333, _351, _371);
    float _399 = fma(_321, _351, _373);
    float _401 = fma(_341, _351, _375);
    float _403 = _383;
    float _405 = _379;
    float _407 = _385;
    if (!_395)
    {
        bool _409 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _411 = !_409;
        if (!_411)
        {
            float _413 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _415 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _417 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _419 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _413);
            float _421 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _415);
            float _423 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _417);
            float _425 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _419);
            float _427 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _421);
            float _429 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _423);
            float _431 = _425 * _425;
            float _433 = fma(_427, _427, _431);
            float _435 = fma(_429, _429, _433);
            float _437 = rsqrt(_435);
            float _439 = _437 * 9.9999999747524270787835121154785e-07;
            float _441 = _427 * _439;
            float _443 = _425 * _439;
            float _445 = _429 * _439;
            _403 = _443;
            _405 = _441;
            _407 = _445;
            _447 = true;
        }
        else
        {
            float _449 = _135 * _135;
            float _451 = fma(_133, _133, _449);
            float _453 = fma(_137, _137, _451);
            float _455 = sqrt(_453);
            bool _457 = _455 >= 9.9999999747524270787835121154785e-07;
            bool _459 = isnan(_455);
            bool _461 = _457 || _459;
            bool _463 = isnan(9.9999999747524270787835121154785e-07);
            bool _465 = _461 || _463;
            if (!_465)
            {
                float _467 = _373 * _373;
                float _469 = fma(_371, _371, _467);
                float _471 = fma(_375, _375, _469);
                float _473 = sqrt(_471);
                bool _475 = _473 >= 9.9999999747524270787835121154785e-07;
                bool _477 = isnan(_473);
                bool _479 = _475 || _477;
                bool _481 = isnan(9.9999999747524270787835121154785e-07);
                bool _483 = _479 || _481;
                if (!_483)
                {
                    float _485 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _487 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _485);
                    float _489 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _487);
                    float _491 = rsqrt(_489);
                    float _493 = _491 * 9.9999999747524270787835121154785e-07;
                    float _495 = _493 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _497 = _493 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _499 = _493 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _403 = _497;
                    _405 = _495;
                    _407 = _499;
                    _447 = true;
                }
                else
                {
                    float _501 = _373 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _503 = _373 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _505 = _373 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _507 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].x, _501);
                    float _509 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].x, _503);
                    float _511 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].x, _505);
                    float _513 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].z, _507);
                    float _515 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].z, _509);
                    float _517 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].z, _511);
                    float _519 = _513 * _513;
                    float _521 = fma(_515, _515, _519);
                    float _523 = fma(_517, _517, _521);
                    float _525 = rsqrt(_523);
                    float _527 = _525 * 9.9999999747524270787835121154785e-07;
                    float _529 = _515 * _527;
                    float _531 = _513 * _527;
                    float _533 = _517 * _527;
                    _403 = _531;
                    _405 = _529;
                    _407 = _533;
                    _447 = true;
                }
            }
            else
            {
                float _535 = _135 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _537 = _135 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _539 = _135 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _541 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[5].x, _535);
                float _543 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[4].x, _537);
                float _545 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[6].x, _539);
                float _547 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[5].z, _541);
                float _549 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[4].z, _543);
                float _551 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[6].z, _545);
                float _553 = _547 * _547;
                float _555 = fma(_549, _549, _553);
                float _557 = fma(_551, _551, _555);
                float _559 = rsqrt(_557);
                float _561 = _559 * 9.9999999747524270787835121154785e-07;
                float _563 = _549 * _561;
                float _565 = _547 * _561;
                float _567 = _551 * _561;
                _403 = _565;
                _405 = _563;
                _407 = _567;
            }
        }
    }
    _447 = false;
    float _569 = _403;
    float _571 = _405;
    float _573 = _407;
    bool _575 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _577 = !_575;
    float _595;
    if (!_577)
    {
        float _579 = in.m_41.x;
        float _581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _583 = _579 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _585 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _587 = _585 * _581;
        float _589 = floor(_587);
        float _591 = -_589;
        float _593 = _587 + _591;
        _595 = _593;
        _597 = true;
    }
    else
    {
        float _599 = float(_73);
        float _601 = 1.0 / _599;
        float _603 = _107 * _601;
        _595 = _603;
    }
    _597 = false;
    float _605 = _595;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _609 = _605 + _607;
    bool _611 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _613 = isnan(_605);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _623;
    float _627 = -_621;
    float _629 = _627 + 1.0;
    bool _631 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _633 = isnan(_605);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _643;
    bool _647 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _649 = 1.0 / _625;
    float _651 = _641 * _629;
    float _653 = -_641;
    float _655 = _653 + 1.0;
    float _657 = _609 * _649;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _659;
    float _663 = fma(_645, _657, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _665 = fma(_661, _657, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _667 = _663 * _651;
    float _669 = _665 * _651;
    float _671 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[143].x, _667);
    float _673 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[143].y, _669);
    float _675 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[144].x, _671);
    float _677 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[144].y, _673);
    bool _679 = !_647;
    float _697;
    if (!_679)
    {
        float _681 = in.m_41.x;
        float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _685 = _681 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _689 = _687 * _683;
        float _691 = floor(_689);
        float _693 = -_691;
        float _695 = _689 + _693;
        _697 = _695;
        _699 = true;
    }
    else
    {
        float _701 = float(_73);
        float _703 = 1.0 / _701;
        float _705 = _107 * _703;
        _697 = _705;
    }
    _699 = false;
    float _707 = _697;
    float _709 = _399 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _711 = _399 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _713 = _399 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _715 = as_type<float>(int(gl_VertexIndex));
    float _717 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[5].x, _709);
    float _719 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[4].x, _711);
    float _721 = _569 * _569;
    float _723 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[6].x, _713);
    float _725 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[5].z, _717);
    float _727 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[4].z, _719);
    float _729 = fma(_571, _571, _721);
    float _731 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[6].z, _723);
    float _733 = _725 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _735 = _727 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _737 = fma(_573, _573, _729);
    float _739 = _731 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _741 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _743 = _733 + _741;
    float _745 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _747 = _735 + _745;
    float _749 = rsqrt(_737);
    float _751 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _753 = _739 + _751;
    float _755 = _743 * _743;
    float _757 = in.m_41.x;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _761 = _707 + _759;
    float _763 = fma(_747, _747, _755);
    float _765 = in.m_41.y;
    int _767 = as_type<int>(_715) & 1;
    bool _769 = _767 != 0;
    int _771 = as_type<int>(_715) & 2;
    bool _773 = _771 != 0;
    float _775 = fma(_753, _753, _763);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _781 = rsqrt(_775);
    float _783 = _749 * _573;
    float _785 = _749 * _571;
    float _787 = _749 * _569;
    float _789 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _791 = _783 * _789;
    float _793 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _795 = _785 * _793;
    float _797 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _799 = _787 * _797;
    float _801 = in.m_39.x;
    float _803 = in.m_39.y;
    float _805 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _807 = -_791;
    float _809 = fma(_785, _805, _807);
    float _811 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _813 = -_795;
    float _815 = fma(_787, _811, _813);
    float _817 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _819 = -_799;
    float _821 = fma(_783, _817, _819);
    bool _823 = _757 > 0.5;
    float _825 = _809 * _809;
    float _827 = 1.0 / _779;
    float _829 = _743 * _781;
    float _831 = _747 * _781;
    float _833 = fma(_821, _821, _825);
    float _835 = -_829;
    float _837 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[18].w, _743);
    float _839 = -_831;
    float _841 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[18].w, _747);
    float _843 = _753 * _781;
    float _845 = _837 * _837;
    float _847 = -_843;
    float _849 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[18].w, _753);
    float _851 = fma(_841, _841, _845);
    float _853 = fma(_815, _815, _833);
    float _855 = fma(_849, _849, _851);
    float _857 = _677 * _803;
    float _859 = _675 * _801;
    float _861 = rsqrt(_853);
    bool _863 = !_769;
    float _865 = _863 ? (-0.5) : 0.5;
    float _867 = -_865;
    int _869 = _823 ? as_type<int>(_867) : as_type<int>(_865);
    float _871 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _865);
    float _873 = sqrt(_855);
    float _875 = _821 * _861;
    float _877 = _809 * _861;
    float _879 = _815 * _861;
    bool _881 = !_773;
    float _883 = _881 ? (-0.5) : 0.5;
    float _885 = _857 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _887 = _765 > 0.5;
    float _889 = _783 * _875;
    bool _891 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _893 = isnan(_707);
    bool _895 = _891 || _893;
    bool _897 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _899 = _895 || _897;
    float _901 = float(_899);
    float _903 = _781 * _873;
    float _905 = _859 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _907 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _883);
    float _909 = _885 * _903;
    float _911 = _905 * _903;
    float _913 = _787 * _879;
    float _915 = _909 * _907;
    float _917 = _911 * _871;
    float _919 = _785 * _877;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _925 = _915 * _785;
    float _927 = _915 * _783;
    float _929 = -_913;
    float _931 = fma(_783, _877, _929);
    float _933 = _903 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _935 = _933 * 0.5;
    float _937 = fma(_917, _875, _925);
    float _939 = -_919;
    float _941 = fma(_787, _875, _939);
    float _943 = fma(_917, _879, _927);
    float _945 = 1.0 / _923;
    float _947 = fma(_935, _931, _937);
    float _949 = _915 * _787;
    float _951 = fma(_935, _941, _943);
    float _953 = _735 + _947;
    float _955 = -_889;
    float _957 = fma(_785, _879, _955);
    float _959 = _739 + _951;
    int _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _963 = _961 != 0;
    float _965 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _967 = _953 + _965;
    float _969 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _971 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _969;
    float _973 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _975 = _959 + _973;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _979 = _977 != 0;
    float _981 = _967 * _967;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _985 = _983 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _987 = _975 * _975;
    float _989 = _971 * _945;
    bool _991 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _993 = isnan(_707);
    bool _995 = _991 || _993;
    bool _997 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _999 = _995 || _997;
    float _1001 = float(_999);
    float _1003 = _985 * _827;
    float _1005 = _981 + _987;
    float _1007 = fma(_989, _761, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1009 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1011 = isnan(_707);
    bool _1013 = _1009 || _1011;
    bool _1015 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1017 = _1013 || _1015;
    float _1019 = float(_1017);
    float _1021 = -_1001;
    float _1023 = _1021 + 1.0;
    float _1025 = sqrt(_1005);
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1029 = _707 + _1027;
    float _1031 = fma(_917, _877, _949);
    float _1033 = _1019 * _1023;
    float _1035 = -_1019;
    float _1037 = _1035 + 1.0;
    float _1039 = fma(_1003, _1029, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1041 = -_883;
    int _1043 = _887 ? as_type<int>(_1041) : as_type<int>(_883);
    float _1045 = fma(_935, _957, _1031);
    float _1047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1049 = _901 * _1037;
    bool _1051 = !_963;
    float _1053 = _1051 ? _865 : as_type<float>(_869);
    float _1055 = -_901;
    float _1057 = _1055 + 1.0;
    bool _1059 = !_979;
    float _1061 = _1059 ? _883 : as_type<float>(_1043);
    float _1063 = _1007 * _1049;
    float _1065 = _733 + _1045;
    float _1067 = _1053 + 0.5;
    bool _1069 = _1025 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1071 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1073 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1063);
    float _1075 = -_1061;
    float _1077 = _1075 + 0.5;
    float _1079 = _865;
    float _1081 = _917;
    float _1083 = _935;
    float _1085 = _981;
    float _1087 = _987;
    if (!_1069)
    {
        _1079 = _953;
    }
    float _1089 = _1079;
    float _1091 = _1089;
    if (!_1069)
    {
        _1081 = _959;
    }
    float _1093 = _1081;
    float _1095 = _1093;
    if (!_1069)
    {
        _1083 = _1065;
    }
    float _1097 = _1083;
    bool _1099 = !_1069;
    float _1101 = _1097;
    if (!_1099)
    {
        float _1103 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1105 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1107 = _1025 + _1105;
        float _1109 = _1065 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1111 = rsqrt(_1005);
        float _1113 = _1107 * _1103;
        float _1115 = _1113 * 0.15915493667125701904296875;
        float _1117 = _1115 * 6.283185482025146484375;
        float _1119 = sin(_1117);
        float _1121 = _1115 * 6.283185482025146484375;
        float _1123 = cos(_1121);
        float _1125 = fma(_1119, _1109, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1127 = _1111 * _1125;
        float _1129 = _1123 + (-1.0);
        float _1131 = fma(_967, _1127, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1133 = fma(_975, _1127, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1135 = _1129 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1137 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1139 = _1131 + _1137;
        float _1141 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1143 = _1133 + _1141;
        float _1145 = fma(_1065, _1123, _1135);
        float _1147 = _1139 * _1139;
        float _1149 = _1143 * _1143;
        _1101 = _1145;
        _1085 = _1147;
        _1087 = _1149;
        _1095 = _1133;
        _1091 = _1131;
    }
    float _1151 = _1101;
    float _1153 = _1085;
    float _1155 = _1087;
    float _1157 = _1095;
    float _1159 = _1091;
    float _1161 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1163 = _1151 + _1161;
    float _1165 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1167 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1169 = fma(_1039, _1033, _1073);
    float _1171 = fma(_1163, _1163, _1153);
    float _1173 = _1165 * _1047;
    float _1175 = _1167 * _1071;
    float _1177 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1169);
    float _1179 = _1171 + _1155;
    out.m_46.x = _1173;
    float _1181 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1183 = sqrt(_1179);
    float _1185 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1197 = _1185 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1201 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1203 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1205 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1207 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1209 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_46.y = _1175;
    bool _1211 = _1183 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1213 = isnan(_1183);
    bool _1215 = _1211 || _1213;
    bool _1217 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1219 = _1215 || _1217;
    out.m_48.x = _1201;
    out.m_48.y = _1203;
    out.m_48.z = _1205;
    out.m_48.w = _1199;
    out.m_50.x = _1197;
    out.m_50.y = _1207;
    out.m_50.z = _1209;
    out.m_50.w = _1181;
    float _1221 = _1177;
    if (!_1219)
    {
        _1221 = 1.0;
    }
    float _1223 = _1221;
    bool _1225 = !_1219;
    float _1227 = _1223;
    if (!_1225)
    {
        bool _1229 = _1183 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1231 = isnan(_1183);
        bool _1233 = _1229 || _1231;
        bool _1235 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1237 = _1233 || _1235;
        if (!_1237)
        {
            float _1239 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1241 = _1183 + _1239;
            float _1243 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1245 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1243;
            float _1247 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1249 = _1247 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1251 = 1.0 / _1245;
            float _1253 = _1241 * _1251;
            float _1255 = fma(_1253, _1249, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1227 = _1255;
            _1257 = true;
        }
        else
        {
            bool _1259 = _1183 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1261 = isnan(_1183);
            bool _1263 = _1259 || _1261;
            bool _1265 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1267 = _1263 || _1265;
            if (!_1267)
            {
                float _1269 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1271 = _1183 + _1269;
                float _1273 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1275 = _1273 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1277 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1279 = _1277 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1281 = 1.0 / _1275;
                float _1283 = _1271 * _1281;
                float _1285 = fma(_1283, _1279, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1227 = _1285;
                _1257 = true;
            }
            else
            {
                _1227 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1257 = false;
    float _1287 = _1227;
    float _1289 = -_829;
    float _1291 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[18].w, _733);
    float _1293 = -_831;
    float _1295 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[18].w, _735);
    float _1297 = -_843;
    float _1299 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[18].w, _739);
    float _1301 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1303 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1305 = _1151 + _1303;
    float _1307 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1309 = _1157 + _1307;
    bool _1311 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1313 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1315 = _1311 || _1313;
    bool _1317 = isnan(0.5);
    bool _1319 = _1315 || _1317;
    float _1321 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1301);
    float _1323 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1325 = _1159 + _1323;
    float _1327 = fma(_1305, _1287, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1329 = fma(_1309, _1287, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1331 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1321);
    float _1333 = fma(_1325, _1287, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1335 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1337 = -_843;
    float _1339 = fma(_1337, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1329);
    float _1341 = _1331 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1343 = -_831;
    float _1345 = fma(_1343, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1333);
    float _1347 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1335);
    float _1349 = -_829;
    float _1351 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1327);
    float _1353 = 1.0 / _1341;
    float _1355 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1347);
    float _1357 = _1347;
    float _1359 = _1351;
    float _1361 = _1339;
    if (_1319)
    {
        _1357 = _1345;
    }
    float _1363 = _1357;
    float _1365 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1367 = _1363;
    if (!_1319)
    {
        float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1371 = _1291 + _1369;
        float _1373 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1375 = _1295 + _1373;
        float _1377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1379 = -_735;
        float _1381 = _1379 + _1333;
        float _1383 = _1371 * _1371;
        float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1387 = _1299 + _1385;
        float _1389 = -_733;
        float _1391 = _1389 + _1327;
        float _1393 = -_739;
        float _1395 = _1393 + _1329;
        float _1397 = fma(_1375, _1375, _1383);
        float _1399 = 1.0 / _903;
        float _1401 = fma(_1387, _1387, _1397);
        float _1403 = sqrt(_1401);
        float _1405 = precise::min(_1403, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1407 = _1405 * _1377;
        float _1409 = _1407 * _1399;
        float _1411 = fma(_1381, _1409, _1295);
        float _1413 = fma(_1391, _1409, _1291);
        float _1415 = fma(_1395, _1409, _1299);
        _1359 = _1413;
        _1367 = _1411;
        _1361 = _1415;
    }
    float _1417 = _1359;
    float _1419 = _1367;
    float _1421 = _1361;
    float _1423 = _1365 + _1341;
    float _1425 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1427 = _1423 * _1353;
    float _1429 = _1427 * 0.5;
    float _1431 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1433 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1425);
    bool _1435 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1437 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1439 = _1435 || _1437;
    bool _1441 = isnan(0.5);
    bool _1443 = _1439 || _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1447 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1445);
    float _1449 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1431);
    float _1451 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1433);
    float _1453 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1455 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1457 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1449);
    float _1459 = 1.0 / _1447;
    float _1461 = _1451 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1463 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1453);
    float _1465 = _1457 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1467 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1455);
    float _1469 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1471 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1473 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1475 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1477 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1463);
    float _1479 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1469);
    float _1481 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1471);
    float _1483 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1473);
    float _1485 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1475);
    float _1487 = _1465;
    float _1489 = _1469;
    if (_1443)
    {
        _1487 = 1.0;
    }
    float _1491 = _1487;
    float _1493 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1467);
    float _1495 = _1491;
    if (_1443)
    {
        _1489 = 1.0;
    }
    float _1497 = _1489;
    float _1499 = _1477 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1501 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1503 = _1459 * _1501;
    float _1505 = _1497;
    if (!_1443)
    {
        float _1507 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1509 = _1507 * 0.15915493667125701904296875;
        float _1511 = _1509 * 6.283185482025146484375;
        float _1513 = cos(_1511);
        float _1515 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1517 = _1515 * 0.15915493667125701904296875;
        float _1519 = _1509 * 6.283185482025146484375;
        float _1521 = sin(_1519);
        float _1523 = 1.0 / _1513;
        float _1525 = _1517 * 6.283185482025146484375;
        float _1527 = cos(_1525);
        float _1529 = _1521 * _1523;
        float _1531 = _1517 * 6.283185482025146484375;
        float _1533 = sin(_1531);
        float _1535 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1537 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1535;
        float _1539 = _1527 * _1529;
        float _1541 = 1.0 / _1537;
        float _1543 = 1.0 / _1539;
        float _1545 = _1533 * _1543;
        float _1547 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1549 = fma(_1503, _1545, _1547);
        float _1551 = _1549 * _1541;
        float _1553 = precise::clamp(_1551, 0.0, 1.0);
        _1495 = _1553;
    }
    float _1555 = _1495;
    if (!_1443)
    {
        float _1557 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1559 = _1557 * 0.15915493667125701904296875;
        float _1561 = _1559 * 6.283185482025146484375;
        float _1563 = cos(_1561);
        float _1565 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1567 = _1565 * 0.15915493667125701904296875;
        float _1569 = _1559 * 6.283185482025146484375;
        float _1571 = sin(_1569);
        float _1573 = 1.0 / _1563;
        float _1575 = _1567 * 6.283185482025146484375;
        float _1577 = cos(_1575);
        float _1579 = _1571 * _1573;
        float _1581 = _1567 * 6.283185482025146484375;
        float _1583 = sin(_1581);
        float _1585 = _1577 * _1579;
        float _1587 = 1.0 / _1585;
        float _1589 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1591 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1589;
        float _1593 = 1.0 / _1591;
        float _1595 = _1583 * _1587;
        float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1599 = fma(_1503, _1595, _1597);
        float _1601 = _1599 * _1593;
        float _1603 = precise::clamp(_1601, 0.0, 1.0);
        float _1605 = -_1603;
        float _1607 = _1605 + 1.0;
        _1505 = _1607;
    }
    float _1609 = _1505;
    bool _1611 = _1555 > 0.0;
    bool _1613 = isnan(_1555);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan(0.0);
    bool _1619 = _1615 || _1617;
    float _1621 = _1493 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1623 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1479);
    float _1625 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1483);
    float _1627 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1485);
    float _1629 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1481);
    float _1631 = _1555 * _1609;
    bool _1633 = _1609 <= 0.0;
    bool _1635 = !_1619;
    bool _1637 = _1633 || _1635;
    float _1639 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1623);
    float _1641 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1627);
    float _1643 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1625);
    float _1645 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1629);
    float _1647 = _1631 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1649 = _1639 + _1641;
    float _1651 = _1643 + _1641;
    float _1653 = _1641 * 0.5;
    float _1655 = _1649 * 0.5;
    float _1657 = _1651 * 0.5;
    float _1659 = fma(_1645, -0.5, _1653);
    float _1661 = _1647 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_52.x = _1419;
    out.m_52.y = _1417;
    out.m_52.z = _1421;
    out.gl_Position.x = _1639;
    out.gl_Position.y = _1645;
    out.gl_Position.z = _1643;
    out.gl_Position.w = _1641;
    out.m_54.x = _1655;
    out.m_54.y = _1659;
    out.m_54.z = _1657;
    out.m_54.w = _1641;
    out.m_35.x = _1661;
    if (!_1637)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _1663 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1663;
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
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1257 = false;
    bool _699 = false;
    bool _597 = false;
    bool _447 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_32.w;
    float _70 = trunc(_68);
    int _73 = int(_70);
    bool _77 = _73 >= 1;
    float _79 = 0.0;
    if (!_77)
    {
        _79 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _79;
    float _83 = _81;
    if (!_77)
    {
        out.m_35.x = 0.0;
    }
    int _85 = 0;
    if (!_77)
    {
        float _87 = _81 * 5.0;
        _85 = as_type<int>(_87);
    }
    int _89 = _85;
    int _91 = _89;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1720 = as_type<float>(_89);
        out.gl_Position.z = _1720;
    }
    if (!_77)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _93 = in.m_37.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _109 = 0.0;
    float _111 = 0.0;
    if (_103)
    {
        float _113 = float(_73);
        _83 = _113;
    }
    float _115 = _83;
    bool _117 = _107 >= _115;
    bool _119 = !_103;
    bool _121 = _117 || _119;
    float _123 = _115;
    if (_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    if (_121)
    {
        out.m_35.x = 0.0;
    }
    if (_121)
    {
        float _127 = _125 * 5.0;
        _91 = as_type<int>(_127);
    }
    int _129 = _91;
    float _131 = as_type<float>(_129);
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1791 = as_type<float>(_129);
        out.gl_Position.z = _1791;
    }
    if (_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_37.x;
    float _135 = in.m_37.y;
    float _137 = in.m_37.z;
    float _139 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _141 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _143 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _145 = _141 || _143;
    bool _147 = isnan(1.0);
    bool _149 = _145 || _147;
    float _151 = _139;
    if (!_149)
    {
        float _153 = _139 * _139;
        float _155 = _153 * 0.5;
        _131 = _155;
    }
    float _157 = _131;
    float _159 = 0.0;
    float _161 = _157;
    if (!_149)
    {
        float _163 = _107 * _107;
        float _165 = _163 * 0.5;
        _159 = _165;
    }
    float _167 = _159;
    if (!_149)
    {
        float _169 = _157 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _161 = _169;
    }
    float _171 = _161;
    bool _173 = !_149;
    float _175 = _171;
    if (!_173)
    {
        float _177 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _179 = log2(_177);
        float _181 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _183 = _181 + 1.0;
        float _185 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _187 = _139 * _179;
        float _189 = 1.0 / _183;
        float _191 = _185 * 0.693147182464599609375;
        float _193 = exp2(_187);
        float _195 = 1.0 / _191;
        float _197 = _193 + (-1.0);
        float _199 = -_197;
        float _201 = fma(_199, _195, _139);
        float _203 = _201 * _189;
        float _205 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _109 = _195;
        _175 = _205;
        _111 = _193;
    }
    float _207 = _109;
    float _209 = _175;
    float _211 = _111;
    bool _213 = !_149;
    float _215 = _207;
    float _217 = _211;
    if (!_213)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = 1.0 / _225;
        float _229 = _139 * _221;
        float _231 = exp2(_229);
        float _233 = -_231;
        float _235 = _233 + 1.0;
        float _237 = _235 * _227;
        _215 = _231;
        _217 = _225;
        _151 = _237;
    }
    float _239 = _215;
    float _241 = _217;
    float _243 = _151;
    float _245 = _241;
    float _247 = _239;
    if (!_149)
    {
        _245 = _107;
    }
    float _249 = _245;
    float _251 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _253 = _249;
    if (!_149)
    {
        float _255 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _247 = _255;
    }
    float _257 = _247;
    bool _259 = !_149;
    float _261 = _257;
    if (!_259)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _273 = _107 * _265;
        float _275 = 1.0 / _269;
        float _277 = _271 * 0.693147182464599609375;
        float _279 = exp2(_273);
        float _281 = 1.0 / _277;
        float _283 = _279 + (-1.0);
        float _285 = -_283;
        float _287 = fma(_285, _281, _107);
        float _289 = _287 * _275;
        float _291 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _261 = _291;
    }
    float _293 = _261;
    bool _295 = !_149;
    if (!_295)
    {
        float _297 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = log2(_297);
        float _301 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _303 = _301 + 1.0;
        float _305 = 1.0 / _303;
        float _307 = _107 * _299;
        float _309 = exp2(_307);
        float _311 = -_309;
        float _313 = _311 + 1.0;
        float _315 = _313 * _305;
        _253 = _315;
    }
    float _317 = _253;
    float _319 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _321 = fma(_243, _135, _251);
    float _323 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _325 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _327 = fma(_317, _135, _319);
    float _329 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _331 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _333 = fma(_243, _133, _323);
    float _335 = fma(_317, _133, _325);
    float _337 = -_327;
    float _339 = _321 + _337;
    float _341 = fma(_243, _137, _329);
    float _343 = fma(_317, _137, _331);
    float _345 = -_335;
    float _347 = _333 + _345;
    float _349 = _339 * _339;
    float _351 = in.m_39.w;
    float _353 = -_343;
    float _355 = _341 + _353;
    float _357 = _339 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _359 = fma(_347, _347, _349);
    float _361 = _339 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _363 = _339 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _365 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[4].x, _357);
    float _367 = fma(_355, _355, _359);
    float _369 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[5].x, _361);
    float _371 = in.m_32.x;
    float _373 = in.m_32.y;
    float _375 = in.m_32.z;
    float _377 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[6].x, _363);
    float _379 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[4].z, _365);
    float _381 = sqrt(_367);
    float _383 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[5].z, _369);
    float _385 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[6].z, _377);
    bool _387 = _381 >= 9.9999999747524270787835121154785e-07;
    bool _389 = isnan(_381);
    bool _391 = _387 || _389;
    bool _393 = isnan(9.9999999747524270787835121154785e-07);
    bool _395 = _391 || _393;
    float _397 = fma(_333, _351, _371);
    float _399 = fma(_321, _351, _373);
    float _401 = fma(_341, _351, _375);
    float _403 = _383;
    float _405 = _379;
    float _407 = _385;
    if (!_395)
    {
        bool _409 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _411 = !_409;
        if (!_411)
        {
            float _413 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _415 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _417 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _419 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _413);
            float _421 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _415);
            float _423 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _417);
            float _425 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _419);
            float _427 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _421);
            float _429 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _423);
            float _431 = _425 * _425;
            float _433 = fma(_427, _427, _431);
            float _435 = fma(_429, _429, _433);
            float _437 = rsqrt(_435);
            float _439 = _437 * 9.9999999747524270787835121154785e-07;
            float _441 = _427 * _439;
            float _443 = _425 * _439;
            float _445 = _429 * _439;
            _403 = _443;
            _405 = _441;
            _407 = _445;
            _447 = true;
        }
        else
        {
            float _449 = _135 * _135;
            float _451 = fma(_133, _133, _449);
            float _453 = fma(_137, _137, _451);
            float _455 = sqrt(_453);
            bool _457 = _455 >= 9.9999999747524270787835121154785e-07;
            bool _459 = isnan(_455);
            bool _461 = _457 || _459;
            bool _463 = isnan(9.9999999747524270787835121154785e-07);
            bool _465 = _461 || _463;
            if (!_465)
            {
                float _467 = _373 * _373;
                float _469 = fma(_371, _371, _467);
                float _471 = fma(_375, _375, _469);
                float _473 = sqrt(_471);
                bool _475 = _473 >= 9.9999999747524270787835121154785e-07;
                bool _477 = isnan(_473);
                bool _479 = _475 || _477;
                bool _481 = isnan(9.9999999747524270787835121154785e-07);
                bool _483 = _479 || _481;
                if (!_483)
                {
                    float _485 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _487 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _485);
                    float _489 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _487);
                    float _491 = rsqrt(_489);
                    float _493 = _491 * 9.9999999747524270787835121154785e-07;
                    float _495 = _493 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _497 = _493 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _499 = _493 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _403 = _497;
                    _405 = _495;
                    _407 = _499;
                    _447 = true;
                }
                else
                {
                    float _501 = _373 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _503 = _373 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _505 = _373 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _507 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].x, _501);
                    float _509 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].x, _503);
                    float _511 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].x, _505);
                    float _513 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].z, _507);
                    float _515 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].z, _509);
                    float _517 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].z, _511);
                    float _519 = _513 * _513;
                    float _521 = fma(_515, _515, _519);
                    float _523 = fma(_517, _517, _521);
                    float _525 = rsqrt(_523);
                    float _527 = _525 * 9.9999999747524270787835121154785e-07;
                    float _529 = _515 * _527;
                    float _531 = _513 * _527;
                    float _533 = _517 * _527;
                    _403 = _531;
                    _405 = _529;
                    _407 = _533;
                    _447 = true;
                }
            }
            else
            {
                float _535 = _135 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _537 = _135 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _539 = _135 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _541 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[5].x, _535);
                float _543 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[4].x, _537);
                float _545 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[6].x, _539);
                float _547 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[5].z, _541);
                float _549 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[4].z, _543);
                float _551 = fma(_137, (*spvDescriptorSet0.vp_c10)._m0[6].z, _545);
                float _553 = _547 * _547;
                float _555 = fma(_549, _549, _553);
                float _557 = fma(_551, _551, _555);
                float _559 = rsqrt(_557);
                float _561 = _559 * 9.9999999747524270787835121154785e-07;
                float _563 = _549 * _561;
                float _565 = _547 * _561;
                float _567 = _551 * _561;
                _403 = _565;
                _405 = _563;
                _407 = _567;
            }
        }
    }
    _447 = false;
    float _569 = _403;
    float _571 = _405;
    float _573 = _407;
    bool _575 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _577 = !_575;
    float _595;
    if (!_577)
    {
        float _579 = in.m_41.x;
        float _581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _583 = _579 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _585 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _587 = _585 * _581;
        float _589 = floor(_587);
        float _591 = -_589;
        float _593 = _587 + _591;
        _595 = _593;
        _597 = true;
    }
    else
    {
        float _599 = float(_73);
        float _601 = 1.0 / _599;
        float _603 = _107 * _601;
        _595 = _603;
    }
    _597 = false;
    float _605 = _595;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _609 = _605 + _607;
    bool _611 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _613 = isnan(_605);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _623;
    float _627 = -_621;
    float _629 = _627 + 1.0;
    bool _631 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _633 = isnan(_605);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _643;
    bool _647 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _649 = 1.0 / _625;
    float _651 = _641 * _629;
    float _653 = -_641;
    float _655 = _653 + 1.0;
    float _657 = _609 * _649;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _659;
    float _663 = fma(_645, _657, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _665 = fma(_661, _657, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _667 = _663 * _651;
    float _669 = _665 * _651;
    float _671 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[143].x, _667);
    float _673 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[143].y, _669);
    float _675 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[144].x, _671);
    float _677 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[144].y, _673);
    bool _679 = !_647;
    float _697;
    if (!_679)
    {
        float _681 = in.m_41.x;
        float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _685 = _681 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _689 = _687 * _683;
        float _691 = floor(_689);
        float _693 = -_691;
        float _695 = _689 + _693;
        _697 = _695;
        _699 = true;
    }
    else
    {
        float _701 = float(_73);
        float _703 = 1.0 / _701;
        float _705 = _107 * _703;
        _697 = _705;
    }
    _699 = false;
    float _707 = _697;
    float _709 = _399 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _711 = _399 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _713 = _399 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _715 = as_type<float>(int(gl_VertexIndex));
    float _717 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[5].x, _709);
    float _719 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[4].x, _711);
    float _721 = _569 * _569;
    float _723 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[6].x, _713);
    float _725 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[5].z, _717);
    float _727 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[4].z, _719);
    float _729 = fma(_571, _571, _721);
    float _731 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[6].z, _723);
    float _733 = _725 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _735 = _727 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _737 = fma(_573, _573, _729);
    float _739 = _731 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _741 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _743 = _733 + _741;
    float _745 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _747 = _735 + _745;
    float _749 = rsqrt(_737);
    float _751 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _753 = _739 + _751;
    float _755 = _743 * _743;
    float _757 = in.m_41.x;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _761 = _707 + _759;
    float _763 = fma(_747, _747, _755);
    float _765 = in.m_41.y;
    int _767 = as_type<int>(_715) & 1;
    bool _769 = _767 != 0;
    int _771 = as_type<int>(_715) & 2;
    bool _773 = _771 != 0;
    float _775 = fma(_753, _753, _763);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _781 = rsqrt(_775);
    float _783 = _749 * _573;
    float _785 = _749 * _571;
    float _787 = _749 * _569;
    float _789 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _791 = _783 * _789;
    float _793 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _795 = _785 * _793;
    float _797 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _799 = _787 * _797;
    float _801 = in.m_39.x;
    float _803 = in.m_39.y;
    float _805 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _807 = -_791;
    float _809 = fma(_785, _805, _807);
    float _811 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _813 = -_795;
    float _815 = fma(_787, _811, _813);
    float _817 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _819 = -_799;
    float _821 = fma(_783, _817, _819);
    bool _823 = _757 > 0.5;
    float _825 = _809 * _809;
    float _827 = 1.0 / _779;
    float _829 = _743 * _781;
    float _831 = _747 * _781;
    float _833 = fma(_821, _821, _825);
    float _835 = -_829;
    float _837 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[18].w, _743);
    float _839 = -_831;
    float _841 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[18].w, _747);
    float _843 = _753 * _781;
    float _845 = _837 * _837;
    float _847 = -_843;
    float _849 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[18].w, _753);
    float _851 = fma(_841, _841, _845);
    float _853 = fma(_815, _815, _833);
    float _855 = fma(_849, _849, _851);
    float _857 = _677 * _803;
    float _859 = _675 * _801;
    float _861 = rsqrt(_853);
    bool _863 = !_769;
    float _865 = _863 ? (-0.5) : 0.5;
    float _867 = -_865;
    int _869 = _823 ? as_type<int>(_867) : as_type<int>(_865);
    float _871 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _865);
    float _873 = sqrt(_855);
    float _875 = _821 * _861;
    float _877 = _809 * _861;
    float _879 = _815 * _861;
    bool _881 = !_773;
    float _883 = _881 ? (-0.5) : 0.5;
    float _885 = _857 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _887 = _765 > 0.5;
    float _889 = _783 * _875;
    bool _891 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _893 = isnan(_707);
    bool _895 = _891 || _893;
    bool _897 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _899 = _895 || _897;
    float _901 = float(_899);
    float _903 = _781 * _873;
    float _905 = _859 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _907 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _883);
    float _909 = _885 * _903;
    float _911 = _905 * _903;
    float _913 = _787 * _879;
    float _915 = _909 * _907;
    float _917 = _911 * _871;
    float _919 = _785 * _877;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _925 = _915 * _785;
    float _927 = _915 * _783;
    float _929 = -_913;
    float _931 = fma(_783, _877, _929);
    float _933 = _903 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _935 = _933 * 0.5;
    float _937 = fma(_917, _875, _925);
    float _939 = -_919;
    float _941 = fma(_787, _875, _939);
    float _943 = fma(_917, _879, _927);
    float _945 = 1.0 / _923;
    float _947 = fma(_935, _931, _937);
    float _949 = _915 * _787;
    float _951 = fma(_935, _941, _943);
    float _953 = _735 + _947;
    float _955 = -_889;
    float _957 = fma(_785, _879, _955);
    float _959 = _739 + _951;
    int _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _963 = _961 != 0;
    float _965 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _967 = _953 + _965;
    float _969 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _971 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _969;
    float _973 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _975 = _959 + _973;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _979 = _977 != 0;
    float _981 = _967 * _967;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _985 = _983 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _987 = _975 * _975;
    float _989 = _971 * _945;
    bool _991 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _993 = isnan(_707);
    bool _995 = _991 || _993;
    bool _997 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _999 = _995 || _997;
    float _1001 = float(_999);
    float _1003 = _985 * _827;
    float _1005 = _981 + _987;
    float _1007 = fma(_989, _761, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1009 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1011 = isnan(_707);
    bool _1013 = _1009 || _1011;
    bool _1015 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1017 = _1013 || _1015;
    float _1019 = float(_1017);
    float _1021 = -_1001;
    float _1023 = _1021 + 1.0;
    float _1025 = sqrt(_1005);
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1029 = _707 + _1027;
    float _1031 = fma(_917, _877, _949);
    float _1033 = _1019 * _1023;
    float _1035 = -_1019;
    float _1037 = _1035 + 1.0;
    float _1039 = fma(_1003, _1029, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1041 = -_883;
    int _1043 = _887 ? as_type<int>(_1041) : as_type<int>(_883);
    float _1045 = fma(_935, _957, _1031);
    float _1047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1049 = _901 * _1037;
    bool _1051 = !_963;
    float _1053 = _1051 ? _865 : as_type<float>(_869);
    float _1055 = -_901;
    float _1057 = _1055 + 1.0;
    bool _1059 = !_979;
    float _1061 = _1059 ? _883 : as_type<float>(_1043);
    float _1063 = _1007 * _1049;
    float _1065 = _733 + _1045;
    float _1067 = _1053 + 0.5;
    bool _1069 = _1025 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1071 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1073 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1063);
    float _1075 = -_1061;
    float _1077 = _1075 + 0.5;
    float _1079 = _865;
    float _1081 = _917;
    float _1083 = _935;
    float _1085 = _981;
    float _1087 = _987;
    if (!_1069)
    {
        _1079 = _953;
    }
    float _1089 = _1079;
    float _1091 = _1089;
    if (!_1069)
    {
        _1081 = _959;
    }
    float _1093 = _1081;
    float _1095 = _1093;
    if (!_1069)
    {
        _1083 = _1065;
    }
    float _1097 = _1083;
    bool _1099 = !_1069;
    float _1101 = _1097;
    if (!_1099)
    {
        float _1103 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1105 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1107 = _1025 + _1105;
        float _1109 = _1065 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1111 = rsqrt(_1005);
        float _1113 = _1107 * _1103;
        float _1115 = _1113 * 0.15915493667125701904296875;
        float _1117 = _1115 * 6.283185482025146484375;
        float _1119 = sin(_1117);
        float _1121 = _1115 * 6.283185482025146484375;
        float _1123 = cos(_1121);
        float _1125 = fma(_1119, _1109, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1127 = _1111 * _1125;
        float _1129 = _1123 + (-1.0);
        float _1131 = fma(_967, _1127, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1133 = fma(_975, _1127, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1135 = _1129 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1137 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1139 = _1131 + _1137;
        float _1141 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1143 = _1133 + _1141;
        float _1145 = fma(_1065, _1123, _1135);
        float _1147 = _1139 * _1139;
        float _1149 = _1143 * _1143;
        _1101 = _1145;
        _1085 = _1147;
        _1087 = _1149;
        _1095 = _1133;
        _1091 = _1131;
    }
    float _1151 = _1101;
    float _1153 = _1085;
    float _1155 = _1087;
    float _1157 = _1095;
    float _1159 = _1091;
    float _1161 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1163 = _1151 + _1161;
    float _1165 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1167 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1169 = fma(_1039, _1033, _1073);
    float _1171 = fma(_1163, _1163, _1153);
    float _1173 = _1165 * _1047;
    float _1175 = _1167 * _1071;
    float _1177 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1169);
    float _1179 = _1171 + _1155;
    out.m_46.x = _1173;
    float _1181 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1183 = sqrt(_1179);
    float _1185 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1197 = _1185 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1201 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1203 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1205 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1207 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1209 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_46.y = _1175;
    bool _1211 = _1183 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1213 = isnan(_1183);
    bool _1215 = _1211 || _1213;
    bool _1217 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1219 = _1215 || _1217;
    out.m_48.x = _1201;
    out.m_48.y = _1203;
    out.m_48.z = _1205;
    out.m_48.w = _1199;
    out.m_50.x = _1197;
    out.m_50.y = _1207;
    out.m_50.z = _1209;
    out.m_50.w = _1181;
    float _1221 = _1177;
    if (!_1219)
    {
        _1221 = 1.0;
    }
    float _1223 = _1221;
    bool _1225 = !_1219;
    float _1227 = _1223;
    if (!_1225)
    {
        bool _1229 = _1183 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1231 = isnan(_1183);
        bool _1233 = _1229 || _1231;
        bool _1235 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1237 = _1233 || _1235;
        if (!_1237)
        {
            float _1239 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1241 = _1183 + _1239;
            float _1243 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1245 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1243;
            float _1247 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1249 = _1247 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1251 = 1.0 / _1245;
            float _1253 = _1241 * _1251;
            float _1255 = fma(_1253, _1249, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1227 = _1255;
            _1257 = true;
        }
        else
        {
            bool _1259 = _1183 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1261 = isnan(_1183);
            bool _1263 = _1259 || _1261;
            bool _1265 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1267 = _1263 || _1265;
            if (!_1267)
            {
                float _1269 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1271 = _1183 + _1269;
                float _1273 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1275 = _1273 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1277 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1279 = _1277 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1281 = 1.0 / _1275;
                float _1283 = _1271 * _1281;
                float _1285 = fma(_1283, _1279, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1227 = _1285;
                _1257 = true;
            }
            else
            {
                _1227 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1257 = false;
    float _1287 = _1227;
    float _1289 = -_829;
    float _1291 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[18].w, _733);
    float _1293 = -_831;
    float _1295 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[18].w, _735);
    float _1297 = -_843;
    float _1299 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[18].w, _739);
    float _1301 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1303 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1305 = _1151 + _1303;
    float _1307 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1309 = _1157 + _1307;
    bool _1311 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1313 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1315 = _1311 || _1313;
    bool _1317 = isnan(0.5);
    bool _1319 = _1315 || _1317;
    float _1321 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1301);
    float _1323 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1325 = _1159 + _1323;
    float _1327 = fma(_1305, _1287, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1329 = fma(_1309, _1287, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1331 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1321);
    float _1333 = fma(_1325, _1287, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1335 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1337 = -_843;
    float _1339 = fma(_1337, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1329);
    float _1341 = _1331 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1343 = -_831;
    float _1345 = fma(_1343, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1333);
    float _1347 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1335);
    float _1349 = -_829;
    float _1351 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1327);
    float _1353 = 1.0 / _1341;
    float _1355 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1347);
    float _1357 = _1347;
    float _1359 = _1351;
    float _1361 = _1339;
    if (_1319)
    {
        _1357 = _1345;
    }
    float _1363 = _1357;
    float _1365 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1367 = _1363;
    if (!_1319)
    {
        float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1371 = _1291 + _1369;
        float _1373 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1375 = _1295 + _1373;
        float _1377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1379 = -_735;
        float _1381 = _1379 + _1333;
        float _1383 = _1371 * _1371;
        float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1387 = _1299 + _1385;
        float _1389 = -_733;
        float _1391 = _1389 + _1327;
        float _1393 = -_739;
        float _1395 = _1393 + _1329;
        float _1397 = fma(_1375, _1375, _1383);
        float _1399 = 1.0 / _903;
        float _1401 = fma(_1387, _1387, _1397);
        float _1403 = sqrt(_1401);
        float _1405 = precise::min(_1403, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1407 = _1405 * _1377;
        float _1409 = _1407 * _1399;
        float _1411 = fma(_1381, _1409, _1295);
        float _1413 = fma(_1391, _1409, _1291);
        float _1415 = fma(_1395, _1409, _1299);
        _1359 = _1413;
        _1367 = _1411;
        _1361 = _1415;
    }
    float _1417 = _1359;
    float _1419 = _1367;
    float _1421 = _1361;
    float _1423 = _1365 + _1341;
    float _1425 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1427 = _1423 * _1353;
    float _1429 = _1427 * 0.5;
    float _1431 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1433 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1425);
    bool _1435 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1437 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1439 = _1435 || _1437;
    bool _1441 = isnan(0.5);
    bool _1443 = _1439 || _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1447 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1445);
    float _1449 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1431);
    float _1451 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1433);
    float _1453 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1455 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1457 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1449);
    float _1459 = 1.0 / _1447;
    float _1461 = _1451 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1463 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1453);
    float _1465 = _1457 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1467 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1455);
    float _1469 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1471 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1473 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1475 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1477 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1463);
    float _1479 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1469);
    float _1481 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1471);
    float _1483 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1473);
    float _1485 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1475);
    float _1487 = _1465;
    float _1489 = _1469;
    if (_1443)
    {
        _1487 = 1.0;
    }
    float _1491 = _1487;
    float _1493 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1467);
    float _1495 = _1491;
    if (_1443)
    {
        _1489 = 1.0;
    }
    float _1497 = _1489;
    float _1499 = _1477 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1501 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1503 = _1459 * _1501;
    float _1505 = _1497;
    if (!_1443)
    {
        float _1507 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1509 = _1507 * 0.15915493667125701904296875;
        float _1511 = _1509 * 6.283185482025146484375;
        float _1513 = cos(_1511);
        float _1515 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1517 = _1515 * 0.15915493667125701904296875;
        float _1519 = _1509 * 6.283185482025146484375;
        float _1521 = sin(_1519);
        float _1523 = 1.0 / _1513;
        float _1525 = _1517 * 6.283185482025146484375;
        float _1527 = cos(_1525);
        float _1529 = _1521 * _1523;
        float _1531 = _1517 * 6.283185482025146484375;
        float _1533 = sin(_1531);
        float _1535 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1537 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1535;
        float _1539 = _1527 * _1529;
        float _1541 = 1.0 / _1537;
        float _1543 = 1.0 / _1539;
        float _1545 = _1533 * _1543;
        float _1547 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1549 = fma(_1503, _1545, _1547);
        float _1551 = _1549 * _1541;
        float _1553 = precise::clamp(_1551, 0.0, 1.0);
        _1495 = _1553;
    }
    float _1555 = _1495;
    if (!_1443)
    {
        float _1557 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1559 = _1557 * 0.15915493667125701904296875;
        float _1561 = _1559 * 6.283185482025146484375;
        float _1563 = cos(_1561);
        float _1565 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1567 = _1565 * 0.15915493667125701904296875;
        float _1569 = _1559 * 6.283185482025146484375;
        float _1571 = sin(_1569);
        float _1573 = 1.0 / _1563;
        float _1575 = _1567 * 6.283185482025146484375;
        float _1577 = cos(_1575);
        float _1579 = _1571 * _1573;
        float _1581 = _1567 * 6.283185482025146484375;
        float _1583 = sin(_1581);
        float _1585 = _1577 * _1579;
        float _1587 = 1.0 / _1585;
        float _1589 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1591 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1589;
        float _1593 = 1.0 / _1591;
        float _1595 = _1583 * _1587;
        float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1599 = fma(_1503, _1595, _1597);
        float _1601 = _1599 * _1593;
        float _1603 = precise::clamp(_1601, 0.0, 1.0);
        float _1605 = -_1603;
        float _1607 = _1605 + 1.0;
        _1505 = _1607;
    }
    float _1609 = _1505;
    bool _1611 = _1555 > 0.0;
    bool _1613 = isnan(_1555);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan(0.0);
    bool _1619 = _1615 || _1617;
    float _1621 = _1493 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1623 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1479);
    float _1625 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1483);
    float _1627 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1485);
    float _1629 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1481);
    float _1631 = _1555 * _1609;
    bool _1633 = _1609 <= 0.0;
    bool _1635 = !_1619;
    bool _1637 = _1633 || _1635;
    float _1639 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1623);
    float _1641 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1627);
    float _1643 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1625);
    float _1645 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1629);
    float _1647 = _1631 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1649 = _1639 + _1641;
    float _1651 = _1643 + _1641;
    float _1653 = _1641 * 0.5;
    float _1655 = _1649 * 0.5;
    float _1657 = _1651 * 0.5;
    float _1659 = fma(_1645, -0.5, _1653);
    float _1661 = _1647 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_52.x = _1419;
    out.m_52.y = _1417;
    out.m_52.z = _1421;
    out.gl_Position.x = _1639;
    out.gl_Position.y = _1645;
    out.gl_Position.z = _1643;
    out.gl_Position.w = _1641;
    out.m_54.x = _1655;
    out.m_54.y = _1659;
    out.m_54.z = _1657;
    out.m_54.w = _1641;
    out.m_35.x = _1661;
    if (!_1637)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _1663 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1663;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

