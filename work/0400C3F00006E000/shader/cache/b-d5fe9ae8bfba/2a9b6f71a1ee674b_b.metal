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
    float4 m_46 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_42 [[user(locn3)]];
    float4 m_48 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
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
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1213 = false;
    bool _1025 = false;
    bool _795 = false;
    bool _601 = false;
    bool _445 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _62 = in.m_26.w;
    float _64 = trunc(_62);
    int _67 = int(_64);
    bool _71 = _67 >= 1;
    float _73 = 0.0;
    if (!_71)
    {
        _73 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _75 = _73;
    float _77 = _75;
    if (!_71)
    {
        out.m_29.x = 0.0;
    }
    int _79 = 0;
    if (!_71)
    {
        float _81 = _75 * 5.0;
        _79 = as_type<int>(_81);
    }
    int _83 = _79;
    int _85 = _83;
    if (!_71)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2468 = as_type<float>(_83);
        out.gl_Position.z = _2468;
    }
    if (!_71)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _87 = in.m_31.w;
    bool _89 = _87 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _91 = isnan(_87);
    bool _93 = _89 || _91;
    bool _95 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _97 = _93 || _95;
    float _99 = -_87;
    float _101 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _103 = 0.0;
    float _105 = 0.0;
    if (_97)
    {
        float _107 = float(_67);
        _77 = _107;
    }
    float _109 = _77;
    bool _111 = _101 >= _109;
    bool _113 = !_97;
    bool _115 = _111 || _113;
    float _117 = _109;
    if (_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    if (_115)
    {
        out.m_29.x = 0.0;
    }
    if (_115)
    {
        float _121 = _119 * 5.0;
        _85 = as_type<int>(_121);
    }
    int _123 = _85;
    float _125 = as_type<float>(_123);
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2539 = as_type<float>(_123);
        out.gl_Position.z = _2539;
    }
    if (_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_31.x;
    float _129 = in.m_31.y;
    float _131 = in.m_31.z;
    float _133 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _135 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _137 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _139 = _135 || _137;
    bool _141 = isnan(1.0);
    bool _143 = _139 || _141;
    float _145 = _133;
    if (!_143)
    {
        float _147 = _133 * _133;
        float _149 = _147 * 0.5;
        _125 = _149;
    }
    float _151 = _125;
    float _153 = 0.0;
    float _155 = _151;
    if (!_143)
    {
        float _157 = _101 * _101;
        float _159 = _157 * 0.5;
        _153 = _159;
    }
    float _161 = _153;
    if (!_143)
    {
        float _163 = _151 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _155 = _163;
    }
    float _165 = _155;
    bool _167 = !_143;
    float _169 = _165;
    if (!_167)
    {
        float _171 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _173 = log2(_171);
        float _175 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _177 = _175 + 1.0;
        float _179 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _181 = _133 * _173;
        float _183 = 1.0 / _177;
        float _185 = _179 * 0.693147182464599609375;
        float _187 = exp2(_181);
        float _189 = 1.0 / _185;
        float _191 = _187 + (-1.0);
        float _193 = -_191;
        float _195 = fma(_193, _189, _133);
        float _197 = _195 * _183;
        float _199 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _103 = _189;
        _169 = _199;
        _105 = _187;
    }
    float _201 = _103;
    float _203 = _169;
    float _205 = _105;
    bool _207 = !_143;
    float _209 = _201;
    float _211 = _205;
    if (!_207)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = 1.0 / _219;
        float _223 = _133 * _215;
        float _225 = exp2(_223);
        float _227 = -_225;
        float _229 = _227 + 1.0;
        float _231 = _229 * _221;
        _209 = _225;
        _211 = _219;
        _145 = _231;
    }
    float _233 = _209;
    float _235 = _211;
    float _237 = _145;
    float _239 = _235;
    float _241 = _233;
    if (!_143)
    {
        _239 = _101;
    }
    float _243 = _239;
    float _245 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _247 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _243;
    if (!_143)
    {
        float _251 = _161 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _241 = _251;
    }
    float _253 = _241;
    bool _255 = !_143;
    float _257 = _253;
    if (!_255)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _269 = _101 * _261;
        float _271 = 1.0 / _265;
        float _273 = _267 * 0.693147182464599609375;
        float _275 = exp2(_269);
        float _277 = 1.0 / _273;
        float _279 = _275 + (-1.0);
        float _281 = -_279;
        float _283 = fma(_281, _277, _101);
        float _285 = _283 * _271;
        float _287 = _285 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _257 = _287;
    }
    float _289 = _257;
    bool _291 = !_143;
    if (!_291)
    {
        float _293 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = log2(_293);
        float _297 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _299 = _297 + 1.0;
        float _301 = 1.0 / _299;
        float _303 = _101 * _295;
        float _305 = exp2(_303);
        float _307 = -_305;
        float _309 = _307 + 1.0;
        float _311 = _309 * _301;
        _249 = _311;
    }
    float _313 = _249;
    float _315 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _317 = fma(_237, _129, _247);
    float _319 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _321 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _323 = fma(_313, _129, _315);
    float _325 = fma(_237, _127, _245);
    float _327 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _329 = fma(_313, _127, _319);
    float _331 = -_323;
    float _333 = _317 + _331;
    float _335 = fma(_237, _131, _321);
    float _337 = fma(_313, _131, _327);
    float _339 = -_329;
    float _341 = _325 + _339;
    float _343 = _333 * _333;
    float _345 = in.m_33.w;
    float _347 = -_337;
    float _349 = _335 + _347;
    float _351 = _333 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _353 = fma(_341, _341, _343);
    float _355 = _333 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _357 = _333 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _359 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[5].x, _351);
    float _361 = fma(_349, _349, _353);
    float _363 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[4].x, _355);
    float _365 = in.m_26.x;
    float _367 = in.m_26.y;
    float _369 = in.m_26.z;
    float _371 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[6].x, _357);
    float _373 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[5].z, _359);
    float _375 = sqrt(_361);
    float _377 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[4].z, _363);
    float _379 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[6].z, _371);
    bool _381 = _375 >= 9.9999999747524270787835121154785e-07;
    bool _383 = isnan(_375);
    bool _385 = _381 || _383;
    bool _387 = isnan(9.9999999747524270787835121154785e-07);
    bool _389 = _385 || _387;
    float _391 = fma(_325, _345, _365);
    float _393 = fma(_317, _345, _367);
    float _395 = fma(_335, _345, _369);
    float _397 = _371;
    float _399 = _377;
    float _401 = _379;
    if (_389)
    {
        _397 = _373;
    }
    float _403 = _397;
    float _405 = _403;
    if (!_389)
    {
        bool _407 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _409 = !_407;
        if (!_409)
        {
            float _411 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _413 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _415 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _417 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _411);
            float _419 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _413);
            float _421 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _415);
            float _423 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _417);
            float _425 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _419);
            float _427 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _421);
            float _429 = _423 * _423;
            float _431 = fma(_425, _425, _429);
            float _433 = fma(_427, _427, _431);
            float _435 = rsqrt(_433);
            float _437 = _435 * 9.9999999747524270787835121154785e-07;
            float _439 = _425 * _437;
            float _441 = _423 * _437;
            float _443 = _427 * _437;
            _405 = _441;
            _399 = _439;
            _401 = _443;
            _445 = true;
        }
        else
        {
            float _447 = _129 * _129;
            float _449 = fma(_127, _127, _447);
            float _451 = fma(_131, _131, _449);
            float _453 = sqrt(_451);
            bool _455 = _453 >= 9.9999999747524270787835121154785e-07;
            bool _457 = isnan(_453);
            bool _459 = _455 || _457;
            bool _461 = isnan(9.9999999747524270787835121154785e-07);
            bool _463 = _459 || _461;
            if (!_463)
            {
                float _465 = _367 * _367;
                float _467 = fma(_365, _365, _465);
                float _469 = fma(_369, _369, _467);
                float _471 = sqrt(_469);
                bool _473 = _471 >= 9.9999999747524270787835121154785e-07;
                bool _475 = isnan(_471);
                bool _477 = _473 || _475;
                bool _479 = isnan(9.9999999747524270787835121154785e-07);
                bool _481 = _477 || _479;
                if (!_481)
                {
                    float _483 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _485 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _483);
                    float _487 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _485);
                    float _489 = rsqrt(_487);
                    float _491 = _489 * 9.9999999747524270787835121154785e-07;
                    float _493 = _491 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _495 = _491 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _497 = _491 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _405 = _495;
                    _399 = _493;
                    _401 = _497;
                    _445 = true;
                }
                else
                {
                    float _499 = _367 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _501 = _367 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _503 = _367 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _505 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _499);
                    float _507 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _501);
                    float _509 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _503);
                    float _511 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].z, _505);
                    float _513 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].z, _507);
                    float _515 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].z, _509);
                    float _517 = _511 * _511;
                    float _519 = fma(_513, _513, _517);
                    float _521 = fma(_515, _515, _519);
                    float _523 = rsqrt(_521);
                    float _525 = _523 * 9.9999999747524270787835121154785e-07;
                    float _527 = _513 * _525;
                    float _529 = _511 * _525;
                    float _531 = _515 * _525;
                    _405 = _529;
                    _399 = _527;
                    _401 = _531;
                    _445 = true;
                }
            }
            else
            {
                float _533 = _129 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _535 = _129 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _537 = _129 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _539 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[5].x, _533);
                float _541 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[4].x, _535);
                float _543 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[6].x, _537);
                float _545 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[5].z, _539);
                float _547 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[4].z, _541);
                float _549 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[6].z, _543);
                float _551 = _545 * _545;
                float _553 = fma(_547, _547, _551);
                float _555 = fma(_549, _549, _553);
                float _557 = rsqrt(_555);
                float _559 = _557 * 9.9999999747524270787835121154785e-07;
                float _561 = _547 * _559;
                float _563 = _545 * _559;
                float _565 = _549 * _559;
                _405 = _563;
                _399 = _561;
                _401 = _565;
            }
        }
    }
    _445 = false;
    float _567 = _405;
    float _569 = _399;
    float _571 = _401;
    bool _573 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _575 = !_573;
    float _577 = _567;
    float _579 = _569;
    float _581 = _571;
    float _599;
    if (!_575)
    {
        float _583 = in.m_35.x;
        float _585 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _587 = _583 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _589 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[12].x, _101);
        float _591 = _589 * _585;
        float _593 = floor(_591);
        float _595 = -_593;
        float _597 = _591 + _595;
        _599 = _597;
        _601 = true;
    }
    else
    {
        float _603 = float(_67);
        float _605 = 1.0 / _603;
        float _607 = _101 * _605;
        _599 = _607;
    }
    _601 = false;
    float _609 = _599;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _613 = _609 + _611;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _617 = _609 + _615;
    bool _619 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _621 = isnan(_609);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _631;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _639;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _645 = _609 + _643;
    float _647 = 1.0 / _633;
    bool _649 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _651 = 1.0 / _641;
    float _653 = 1.0 / _637;
    float _655 = _613 * _647;
    bool _657 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _659 = isnan(_609);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _665 = _661 || _663;
    float _667 = float(_665);
    float _669 = -_629;
    float _671 = _669 + 1.0;
    float _673 = _667 * _671;
    float _675 = _617 * _651;
    bool _677 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _679 = isnan(_609);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = -_667;
    float _691 = _689 + 1.0;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _697 = _645 * _653;
    bool _699 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _701 = isnan(_609);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _707 = _703 || _705;
    float _709 = float(_707);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _711;
    float _715 = _687 * _691;
    float _717 = -_687;
    float _719 = _717 + 1.0;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _721;
    float _725 = fma(_713, _655, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _727 = _709 * _719;
    float _729 = fma(_723, _655, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _731 = -_709;
    float _733 = _731 + 1.0;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _739 = _725 * _727;
    float _741 = _729 * _727;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _743;
    float _747 = fma(_695, _697, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _749 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[143].x, _739);
    float _751 = fma(_737, _697, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _753;
    float _757 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[143].y, _741);
    float _759 = fma(_745, _675, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _761 = fma(_747, _715, _749);
    float _763 = fma(_755, _675, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _765 = fma(_751, _715, _757);
    float _767 = fma(_759, _673, _761);
    float _769 = fma(_763, _673, _765);
    float _771 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[146].x, _767);
    float _773 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[146].y, _769);
    bool _775 = !_649;
    float _793;
    if (!_775)
    {
        float _777 = in.m_35.x;
        float _779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _781 = _777 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _783 = fma(_781, (*spvDescriptorSet0.vp_c9)._m0[11].x, _101);
        float _785 = _783 * _779;
        float _787 = floor(_785);
        float _789 = -_787;
        float _791 = _785 + _789;
        _793 = _791;
        _795 = true;
    }
    else
    {
        float _797 = float(_67);
        float _799 = 1.0 / _797;
        float _801 = _101 * _799;
        _793 = _801;
    }
    _795 = false;
    float _803 = _793;
    float _805 = in.m_33.x;
    float _807 = in.m_33.y;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _811 = _803 + _809;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _815 = _803 + _813;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _817;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _823 = _803 + _821;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _825;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _833 = 1.0 / _819;
    bool _835 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _837 = 1.0 / _827;
    float _839 = _773 * _807;
    float _841 = _771 * _805;
    float _843 = 1.0 / _831;
    bool _845 = _803 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _847 = isnan(_803);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    float _857 = _811 * _833;
    bool _859 = _803 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _861 = isnan(_803);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _867 = _863 || _865;
    float _869 = float(_867);
    bool _871 = _803 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _873 = isnan(_803);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = _815 * _837;
    float _885 = -_855;
    float _887 = _885 + 1.0;
    float _889 = -_881;
    float _891 = _889 + 1.0;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _893;
    float _897 = _869 * _887;
    bool _899 = _803 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _901 = isnan(_803);
    bool _903 = _899 || _901;
    bool _905 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _907 = _903 || _905;
    float _909 = float(_907);
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _913 = _911 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _915 = _823 * _843;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _917;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _921;
    float _925 = -_869;
    float _927 = _925 + 1.0;
    float _929 = _909 * _891;
    float _931 = fma(_919, _883, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _933 = fma(_895, _883, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _935 = fma(_923, _883, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _937 = _881 * _927;
    float _939 = _931 * _929;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _943 = _941 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _947 = _945 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _949 = _933 * _929;
    float _951 = -_909;
    float _953 = _951 + 1.0;
    float _955 = _935 * _929;
    float _957 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[107].x, _949);
    float _959 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[107].y, _939);
    float _961 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[107].z, _955);
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _963;
    float _967 = fma(_913, _915, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _969 = fma(_943, _915, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _971 = fma(_947, _915, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _973;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _979 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _977;
    float _981 = fma(_967, _937, _957);
    float _983 = fma(_965, _857, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _985 = fma(_975, _857, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _987 = fma(_979, _857, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _989 = fma(_969, _937, _959);
    float _991 = fma(_971, _937, _961);
    float _993 = fma(_983, _897, _981);
    float _995 = fma(_985, _897, _989);
    float _997 = fma(_987, _897, _991);
    float _999 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[110].x, _993);
    float _1001 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[110].y, _995);
    float _1003 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[110].z, _997);
    bool _1005 = !_835;
    float _1023;
    if (!_1005)
    {
        float _1007 = in.m_35.x;
        float _1009 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1011 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1013 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[11].y, _101);
        float _1015 = _1013 * _1009;
        float _1017 = floor(_1015);
        float _1019 = -_1017;
        float _1021 = _1015 + _1019;
        _1023 = _1021;
        _1025 = true;
    }
    else
    {
        float _1027 = float(_67);
        float _1029 = 1.0 / _1027;
        float _1031 = _101 * _1029;
        _1023 = _1031;
    }
    _1025 = false;
    float _1033 = _1023;
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1037 = _1033 + _1035;
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1043 = _1033 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1045 = isnan(_1033);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1051 = _1047 || _1049;
    float _1053 = float(_1051);
    float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1057 = _1055 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1061 = _1059 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1063 = _1033 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1065 = isnan(_1033);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1071 = _1067 || _1069;
    float _1073 = float(_1071);
    float _1075 = 1.0 / _1041;
    float _1077 = -_1053;
    float _1079 = _1077 + 1.0;
    float _1081 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1081;
    bool _1085 = _1033 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1087 = isnan(_1033);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1093 = _1089 || _1091;
    float _1095 = float(_1093);
    float _1097 = _1073 * _1079;
    float _1099 = -_1073;
    float _1101 = _1099 + 1.0;
    bool _1103 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1105 = 1.0 / _1057;
    float _1107 = _1095 * _1101;
    float _1109 = -_1095;
    float _1111 = _1109 + 1.0;
    float _1113 = 1.0 / _1061;
    float _1115 = _1083 * _1075;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1121 = fma(_1115, _1037, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1123 = _1119 * _1105;
    bool _1125 = _1033 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1127 = isnan(_1033);
    bool _1129 = _1125 || _1127;
    bool _1131 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1133 = _1129 || _1131;
    float _1135 = float(_1133);
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1139 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1137;
    float _1141 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1143 = _1033 + _1141;
    float _1145 = _1121 * _1107;
    float _1147 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1149 = _1033 + _1147;
    float _1151 = -_1135;
    float _1153 = _1151 + 1.0;
    float _1155 = fma(_1123, _1143, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1157 = _1139 * _1113;
    float _1159 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1145);
    float _1161 = _1053 * _1153;
    float _1163 = _999 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1165 = fma(_1157, _1149, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1167 = fma(_1155, _1097, _1159);
    float _1169 = _1001 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1171 = _1003 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1173 = fma(_1165, _1161, _1167);
    float _1175 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1177 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1179 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1173);
    float _1181 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1183 = _1179 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.x = _1181;
    out.m_37.y = _1175;
    out.m_37.z = _1177;
    out.m_37.w = _1183;
    bool _1185 = !_1103;
    float _1209;
    float _1211;
    if (!_1185)
    {
        float _1187 = in.m_35.x;
        float _1189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1191 = float(_67);
        float _1193 = 1.0 / _1191;
        float _1195 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1197 = _101 * _1193;
        float _1199 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[11].z, _101);
        float _1201 = _1199 * _1189;
        float _1203 = floor(_1201);
        float _1205 = -_1203;
        float _1207 = _1201 + _1205;
        _1209 = _1207;
        _1211 = _1197;
        _1213 = true;
    }
    else
    {
        float _1215 = float(_67);
        float _1217 = 1.0 / _1215;
        float _1219 = _101 * _1217;
        _1209 = _1219;
        _1211 = _1219;
    }
    _1213 = false;
    float _1221 = _1209;
    float _1223 = _1211;
    float _1225 = as_type<float>(int(gl_VertexIndex));
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1229 = _1221 + _1227;
    float _1231 = in.m_35.x;
    float _1233 = in.m_35.y;
    float _1235 = in.m_35.z;
    float _1237 = in.m_35.w;
    float _1239 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1239;
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1245 = _1243 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1249 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1247;
    float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1253 = _1251 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1255 = 1.0 / _1241;
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1259 = _1257 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1263 = _1223 + _1261;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1267 = 1.0 / _1253;
    float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1271 = _1269 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1275 = _1273 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1279 = as_type<int>(_1225) & 1;
    bool _1281 = _1279 != 0;
    int _1283 = as_type<int>(_1225) & 2;
    bool _1285 = _1283 != 0;
    float _1287 = 1.0 / _1245;
    float _1289 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1291 = _1237 > 0.5;
    float _1293 = _1229 * _1255;
    float _1295 = fma(_1289, -2.0, _1265);
    bool _1297 = _1231 > 0.5;
    float _1299 = 1.0 / _1249;
    bool _1301 = !_1281;
    float _1303 = _1301 ? (-0.5) : 0.5;
    float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1307 = _1221 + _1305;
    int _1309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1311 = _1309 != 0;
    float _1313 = _567 * _567;
    float _1315 = -_1303;
    int _1317 = _1297 ? as_type<int>(_1315) : as_type<int>(_1303);
    float _1319 = _839 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1321 = _1235 > 0.5;
    float _1323 = 1.0 / _1259;
    bool _1325 = !_1311;
    float _1327 = _1325 ? _1303 : as_type<float>(_1317);
    float _1329 = _1307 * _1287;
    bool _1331 = !_1285;
    float _1333 = _1331 ? (-0.5) : 0.5;
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1337 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1335;
    bool _1339 = _1233 > 0.5;
    float _1341 = _841 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1345 = _1343 != 0;
    float _1347 = 1.0 / _1271;
    float _1349 = -_1303;
    int _1351 = _1321 ? as_type<int>(_1349) : as_type<int>(_1303);
    int _1353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1355 = _1353 != 0;
    int _1357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1359 = _1357 != 0;
    float _1361 = -_1333;
    int _1363 = _1339 ? as_type<int>(_1361) : as_type<int>(_1333);
    float _1365 = 1.0 / _1275;
    float _1367 = -_1303;
    int _1369 = _1339 ? as_type<int>(_1367) : as_type<int>(_1303);
    float _1371 = _1337 * _1323;
    bool _1373 = !_1345;
    float _1375 = _1373 ? _1303 : as_type<float>(_1351);
    float _1377 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1381 = _1379 != 0;
    int _1383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1385 = _1383 != 0;
    float _1387 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1277);
    float _1389 = _1375 + 0.5;
    float _1391 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1387);
    float _1393 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1397 = _1395 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1399 = -_1393;
    float _1401 = fma(_1377, 2.0, _1399);
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1405 = _1403 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1407 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1411 = _1221 + _1409;
    float _1413 = 1.0 / _1397;
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1415;
    float _1419 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1407);
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1423 = _1221 + _1421;
    float _1425 = _1411 * _1299;
    float _1427 = -_101;
    float _1429 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1401);
    float _1431 = _1423 * _1267;
    float _1433 = 1.0 / _1405;
    float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1437 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1435;
    float _1439 = -_1391;
    float _1441 = _1439 + 1.0;
    float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1445 = _1443 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1449 = _1447 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1453 = _1451 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1457 = _1455 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1459;
    float _1463 = _1437 * _1347;
    float _1465 = _1449 * _1365;
    float _1467 = 1.0 / _1445;
    float _1469 = _1453 * _1433;
    float _1471 = _1461 * _1413;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1475 = _1473 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1479 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1477;
    float _1481 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1481;
    float _1485 = 1.0 / _1457;
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1487;
    float _1491 = fma(_1483, _1293, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1493 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1495 = _1493 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1497 = fma(_1489, _1293, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1499 = fma(_1417, _1293, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1503 = _1501 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1505 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1507 = _1505 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1509 = fma(_1495, _1329, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1511 = _1479 * _1467;
    float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1515 = _1513 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1517 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1519 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1517;
    float _1521 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1523 = _1521 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1525 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1527 = _1525 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1529 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1531 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1529;
    float _1533 = _1475 * _1485;
    float _1535 = fma(_1503, _1329, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1537 = fma(_1507, _1329, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1541 = _1223 + _1539;
    float _1543 = fma(_1515, _1431, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1545 = fma(_1523, _1431, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1547 = fma(_1519, _1425, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1549 = fma(_1371, _1541, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1551 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1553 = _1223 + _1551;
    float _1555 = fma(_1527, _1431, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1557 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1559 = _1223 + _1557;
    float _1561 = fma(_1465, _1263, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1563 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1565 = _1223 + _1563;
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1569 = _1223 + _1567;
    float _1571 = fma(_1531, _1425, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1573 = fma(_1471, _1553, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _1575 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1577 = isnan(_1223);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1583 = _1579 || _1581;
    float _1585 = float(_1583);
    float _1587 = fma(_1463, _1559, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    bool _1589 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1591 = isnan(_1221);
    bool _1593 = _1589 || _1591;
    bool _1595 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1597 = _1593 || _1595;
    float _1599 = float(_1597);
    float _1601 = fma(_1469, _1565, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _1603 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1605 = isnan(_1221);
    bool _1607 = _1603 || _1605;
    bool _1609 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1611 = _1607 || _1609;
    float _1613 = float(_1611);
    float _1615 = fma(_1533, _1569, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    bool _1617 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1619 = isnan(_1221);
    bool _1621 = _1617 || _1619;
    bool _1623 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1625 = _1621 || _1623;
    float _1627 = float(_1625);
    float _1629 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1631 = _1223 + _1629;
    bool _1633 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1635 = isnan(_1221);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1641 = _1637 || _1639;
    float _1643 = float(_1641);
    float _1645 = -_1585;
    float _1647 = _1645 + 1.0;
    bool _1649 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1651 = isnan(_1223);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    float _1661 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1663 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1661;
    bool _1665 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1667 = isnan(_1221);
    bool _1669 = _1665 || _1667;
    bool _1671 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1673 = _1669 || _1671;
    float _1675 = float(_1673);
    float _1677 = -_1643;
    float _1679 = _1677 + 1.0;
    bool _1681 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1683 = isnan(_1223);
    bool _1685 = _1681 || _1683;
    bool _1687 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1689 = _1685 || _1687;
    float _1691 = float(_1689);
    float _1693 = -_1659;
    float _1695 = _1693 + 1.0;
    bool _1697 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1699 = isnan(_1223);
    bool _1701 = _1697 || _1699;
    bool _1703 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1705 = _1701 || _1703;
    float _1707 = float(_1705);
    float _1709 = -_1675;
    float _1711 = _1709 + 1.0;
    bool _1713 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1715 = isnan(_1223);
    bool _1717 = _1713 || _1715;
    bool _1719 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1721 = _1717 || _1719;
    float _1723 = float(_1721);
    float _1725 = _1659 * _1647;
    bool _1727 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1729 = isnan(_1223);
    bool _1731 = _1727 || _1729;
    bool _1733 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1735 = _1731 || _1733;
    float _1737 = float(_1735);
    float _1739 = _1643 * _1711;
    bool _1741 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1743 = isnan(_1223);
    bool _1745 = _1741 || _1743;
    bool _1747 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1749 = _1745 || _1747;
    float _1751 = float(_1749);
    float _1753 = _1627 * _1679;
    bool _1755 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1757 = isnan(_1223);
    bool _1759 = _1755 || _1757;
    bool _1761 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1763 = _1759 || _1761;
    float _1765 = float(_1763);
    float _1767 = fma(_1511, _1631, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1769 = -_1691;
    float _1771 = _1769 + 1.0;
    float _1773 = -_1751;
    float _1775 = _1773 + 1.0;
    float _1777 = -_1613;
    float _1779 = _1777 + 1.0;
    float _1781 = _1765 * _1695;
    float _1783 = -_1765;
    float _1785 = _1783 + 1.0;
    float _1787 = -_1627;
    float _1789 = _1787 + 1.0;
    float _1791 = _1737 * _1775;
    float _1793 = fma(_569, _569, _1313);
    float _1795 = _1751 * _1785;
    float _1797 = -_1737;
    float _1799 = _1797 + 1.0;
    float _1801 = _1613 * _1789;
    float _1803 = fma(_571, _571, _1793);
    float _1805 = _1585 * _1771;
    float _1807 = _1723 * _1799;
    bool _1809 = !_1381;
    float _1811 = _1809 ? _1303 : as_type<float>(_1369);
    float _1813 = fma(_1663, _1425, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1815 = rsqrt(_1803);
    float _1817 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1303);
    float _1819 = _1599 * _1779;
    bool _1821 = !_1355;
    float _1823 = _1821 ? _1333 : as_type<float>(_1363);
    float _1825 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1333);
    float _1827 = -_1333;
    int _1829 = _1291 ? as_type<int>(_1827) : as_type<int>(_1333);
    float _1831 = _1491 * _1819;
    float _1833 = -_1333;
    int _1835 = _1321 ? as_type<int>(_1833) : as_type<int>(_1333);
    float _1837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1839 = _1497 * _1819;
    float _1841 = _1499 * _1819;
    float _1843 = -_1723;
    float _1845 = _1843 + 1.0;
    float _1847 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1295);
    float _1849 = _1319 * _1825;
    bool _1851 = !_1359;
    float _1853 = _1851 ? _1333 : as_type<float>(_1829);
    float _1855 = _1327 + 0.5;
    float _1857 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1859 = _1815 * _571;
    bool _1861 = !_1385;
    float _1863 = _1861 ? _1333 : as_type<float>(_1835);
    float _1865 = _1341 * _1817;
    float _1867 = _1815 * _567;
    float _1869 = _1823 + (-0.5);
    float _1871 = _1707 * _1845;
    float _1873 = -_1599;
    float _1875 = _1873 + 1.0;
    float _1877 = _1837 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1879 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1881 = _1549 * _1871;
    float _1883 = -_1853;
    float _1885 = _1883 + 0.5;
    float _1887 = fma(_1877, _1855, _1429);
    float _1889 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1891 = _1867 * _1889;
    float _1893 = _1811 + 0.5;
    float _1895 = -_1863;
    float _1897 = _1895 + 0.5;
    float _1899 = _1857 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1901 = _1815 * _569;
    float _1903 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1905 = _1859 * _1903;
    float _1907 = -_1441;
    float _1909 = fma(_1327, _1907, _1887);
    float _1911 = -_1899;
    float _1913 = -_1847;
    float _1915 = fma(_1911, _1869, _1913);
    float _1917 = -_1707;
    float _1919 = _1917 + 1.0;
    float _1921 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1923 = -_1905;
    float _1925 = fma(_1901, _1921, _1923);
    float _1927 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1929 = _1901 * _1927;
    float _1931 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1933 = -_1891;
    float _1935 = fma(_1859, _1931, _1933);
    float _1937 = fma(_1919, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1881);
    float _1939 = _1925 * _1925;
    float _1941 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1943 = -_1929;
    float _1945 = fma(_1867, _1941, _1943);
    float _1947 = fma(_1875, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1831);
    float _1949 = fma(_1561, _1807, _1937);
    float _1951 = fma(_1935, _1935, _1939);
    float _1953 = fma(_1875, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1839);
    float _1955 = fma(_1875, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1841);
    float _1957 = fma(_1509, _1801, _1947);
    float _1959 = fma(_1945, _1945, _1951);
    float _1961 = fma(_1535, _1801, _1953);
    float _1963 = fma(_1537, _1801, _1955);
    float _1965 = fma(_1547, _1753, _1957);
    float _1967 = rsqrt(_1959);
    float _1969 = fma(_1571, _1753, _1961);
    float _1971 = fma(_1813, _1753, _1963);
    float _1973 = fma(_1543, _1739, _1965);
    float _1975 = _1849 * _1867;
    float _1977 = fma(_1545, _1739, _1969);
    float _1979 = fma(_1555, _1739, _1971);
    float _1981 = fma(_1675, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1973);
    float _1983 = _1849 * _1901;
    float _1985 = fma(_1675, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1977);
    float _1987 = fma(_1675, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1979);
    float _1989 = fma(_1587, _1791, _1949);
    float _1991 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1993 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1995 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1419);
    float _1997 = fma(_1601, _1795, _1989);
    float _1999 = _1925 * _1967;
    float _2001 = _1945 * _1967;
    float _2003 = _1935 * _1967;
    float _2005 = _1849 * _1859;
    float _2007 = fma(_1865, _1999, _1975);
    float _2009 = _1867 * _2001;
    float _2011 = _1859 * _2003;
    float _2013 = fma(_1865, _2003, _1983);
    float _2015 = fma(_1865, _2001, _2005);
    float _2017 = -_2009;
    float _2019 = fma(_1859, _1999, _2017);
    float _2021 = -_2011;
    float _2023 = fma(_1901, _2001, _2021);
    float _2025 = _1901 * _1999;
    float _2027 = fma(_1573, _1781, _1997);
    float _2029 = fma(_1879, _2019, _2013);
    float _2031 = fma(_1879, _2023, _2007);
    float _2033 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2035 = -_2025;
    float _2037 = fma(_1867, _2003, _2035);
    float _2039 = fma(_1615, _1725, _2027);
    float _2041 = _2031 * _2031;
    float _2043 = fma(_1879, _2037, _2015);
    float _2045 = _1885 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2047 = fma(_2029, _2029, _2041);
    float _2049 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2051 = fma(_1767, _1805, _2039);
    float _2053 = _1893 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2055 = fma(_2043, _2043, _2047);
    float _2057 = _1981 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2059 = _1897 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2061 = _1985 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2063 = fma(_1691, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2051);
    float _2065 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2067 = _2045 * _2033;
    float _2069 = _1987 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2071 = _2053 * _1991;
    float _2073 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2075 = _2057 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2077 = _2061 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2079 = _2069 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2081 = sqrt(_2055);
    float _2083 = _2059 * _2049;
    out.m_42.x = _2063;
    float _2085 = _393 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2087 = -_1995;
    float _2089 = _2087 + 1.0;
    out.m_44.x = _2071;
    out.m_44.y = _2083;
    float _2091 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2085);
    float _2093 = _1993 * _2065;
    float _2095 = _393 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    out.m_46.x = _2075;
    out.m_46.y = _2077;
    out.m_46.z = _2079;
    out.m_46.w = _2073;
    float _2097 = _393 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2099 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2091);
    float _2101 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2095);
    float _2103 = fma(_1823, _2089, _1915);
    float _2105 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2097);
    bool _2107 = _2081 > 0.0;
    float _2109 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2101);
    float _2111 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2105);
    float _2113 = _2099 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2115 = _2109 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    out.m_48.x = _1909;
    out.m_48.y = _2103;
    out.m_48.z = _2093;
    out.m_48.w = _2067;
    float _2117 = _2111 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2119 = _2115 + _2029;
    float _2121 = _2113 + _2031;
    float _2123 = _2117 + _2043;
    bool _2125 = !_2107;
    float _2127 = _2113;
    float _2129 = _2117;
    float _2131 = _1803;
    float _2133 = _2121;
    float _2135 = _2119;
    float _2137 = _2123;
    if (!_2125)
    {
        bool _2139 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2141 = _2067;
        if (_2139)
        {
            float _2143 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2141 = _2143;
        }
        float _2145 = _2141;
        float _2147 = _2145;
        if (_2139)
        {
            float _2149 = _2145 * _569;
            _2127 = _2149;
        }
        float _2151 = _2127;
        float _2153 = _2151;
        if (_2139)
        {
            float _2155 = _2145 * _567;
            _2129 = _2155;
        }
        float _2157 = _2129;
        float _2159 = _2157;
        if (_2139)
        {
            float _2161 = _2145 * _571;
            _2147 = _2161;
        }
        float _2163 = _2147;
        float _2165 = _2163;
        float _2167 = _2163;
        if (!_2139)
        {
            float _2169 = _101 + 1.0;
            float _2171 = _2169;
            if (!_143)
            {
                float _2173 = _2169 * _2169;
                float _2175 = _2173 * 0.5;
                _2165 = _2175;
            }
            float _2177 = _2165;
            float _2179 = _2177;
            if (!_143)
            {
                float _2181 = _2177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2179 = _2181;
            }
            float _2183 = _2179;
            bool _2185 = !_143;
            float _2187 = _2183;
            if (!_2185)
            {
                float _2189 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2191 = log2(_2189);
                float _2193 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2195 = _2193 + 1.0;
                float _2197 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2199 = _2191 * _2169;
                float _2201 = 1.0 / _2195;
                float _2203 = _2197 * 0.693147182464599609375;
                float _2205 = exp2(_2199);
                float _2207 = 1.0 / _2203;
                float _2209 = _2205 + (-1.0);
                float _2211 = -_2209;
                float _2213 = fma(_2211, _2207, _2169);
                float _2215 = _2213 * _2201;
                float _2217 = _2215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2187 = _2217;
            }
            float _2219 = _2187;
            float _2221 = _2219 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2223 = _2219 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2225 = !_143;
            if (!_2225)
            {
                float _2227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2229 = log2(_2227);
                float _2231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2233 = _2231 + 1.0;
                float _2235 = 1.0 / _2233;
                float _2237 = _2229 * _2169;
                float _2239 = exp2(_2237);
                float _2241 = -_2239;
                float _2243 = _2241 + 1.0;
                float _2245 = _2243 * _2235;
                _2171 = _2245;
            }
            float _2247 = _2171;
            float _2249 = fma(_2247, _129, _2223);
            float _2251 = fma(_2247, _127, _2221);
            float _2253 = _2219 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2255 = -_323;
            float _2257 = _2255 + _2249;
            float _2259 = -_329;
            float _2261 = _2259 + _2251;
            float _2263 = fma(_2247, _131, _2253);
            float _2265 = _2257 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2267 = _2257 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2269 = -_337;
            float _2271 = _2269 + _2263;
            float _2273 = _2257 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2275 = fma(_2261, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2265);
            float _2277 = fma(_2261, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2267);
            float _2279 = fma(_2261, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2273);
            float _2281 = fma(_2271, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2275);
            float _2283 = fma(_2271, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2277);
            float _2285 = fma(_2271, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2279);
            float _2287 = _2281 * _2281;
            float _2289 = fma(_2283, _2283, _2287);
            float _2291 = fma(_2285, _2285, _2289);
            _2131 = _2291;
            _577 = _2281;
            _579 = _2283;
            _581 = _2285;
            _2153 = _2283;
            _2159 = _2281;
            _2167 = _2285;
        }
        float _2293 = _2131;
        float _2295 = _577;
        float _2297 = _579;
        float _2299 = _581;
        float _2301 = _2153;
        float _2303 = _2159;
        float _2305 = _2167;
        float _2307 = sqrt(_2293);
        float _2309 = rsqrt(_2055);
        bool _2311 = _2307 > 0.0;
        float _2313 = _2029 * _2309;
        float _2315 = _2031 * _2309;
        float _2317 = _2043 * _2309;
        bool _2319 = !_2311;
        if (!_2319)
        {
            float _2321 = rsqrt(_2293);
            float _2323 = _2321 * _2295;
            float _2325 = _2321 * _2297;
            float _2327 = _2321 * _2299;
            float _2329 = _2315 * _2323;
            float _2331 = fma(_2313, _2325, _2329);
            float _2333 = fma(_2317, _2327, _2331);
            float _2335 = _2333 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2337 = fma(_2301, _2335, _2119);
            float _2339 = fma(_2303, _2335, _2121);
            float _2341 = fma(_2305, _2335, _2123);
            _2133 = _2339;
            _2135 = _2337;
            _2137 = _2341;
        }
    }
    float _2343 = _2133;
    float _2345 = _2135;
    float _2347 = _2137;
    float _2349 = _2343 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2351 = _2343 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2353 = _2343 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2355 = _2343 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2357 = fma(_2345, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2349);
    float _2359 = fma(_2345, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2351);
    float _2361 = fma(_2345, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2353);
    float _2363 = fma(_2345, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2355);
    float _2365 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2357);
    float _2367 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2359);
    float _2369 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2361);
    float _2371 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2363);
    float _2373 = _2365 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2375 = _2367 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2377 = _2369 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2379 = _2371 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2381 = _2373 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2383 = _2373 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2385 = _2373 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2387 = _2373 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2389 = fma(_2375, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2381);
    float _2391 = fma(_2375, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2383);
    float _2393 = fma(_2375, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2385);
    float _2395 = fma(_2375, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2387);
    float _2397 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2389);
    float _2399 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2391);
    float _2401 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2393);
    float _2403 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2395);
    float _2405 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2397);
    float _2407 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2399);
    float _2409 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2401);
    float _2411 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2403);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _2407;
    out.gl_Position.y = _2405;
    out.gl_Position.z = _2409;
    out.gl_Position.w = _2411;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1213 = false;
    bool _1025 = false;
    bool _795 = false;
    bool _601 = false;
    bool _445 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _62 = in.m_26.w;
    float _64 = trunc(_62);
    int _67 = int(_64);
    bool _71 = _67 >= 1;
    float _73 = 0.0;
    if (!_71)
    {
        _73 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _75 = _73;
    float _77 = _75;
    if (!_71)
    {
        out.m_29.x = 0.0;
    }
    int _79 = 0;
    if (!_71)
    {
        float _81 = _75 * 5.0;
        _79 = as_type<int>(_81);
    }
    int _83 = _79;
    int _85 = _83;
    if (!_71)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2468 = as_type<float>(_83);
        out.gl_Position.z = _2468;
    }
    if (!_71)
    {
        return out;
    }
    float _87 = in.m_31.w;
    bool _89 = _87 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _91 = isnan(_87);
    bool _93 = _89 || _91;
    bool _95 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _97 = _93 || _95;
    float _99 = -_87;
    float _101 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _103 = 0.0;
    float _105 = 0.0;
    if (_97)
    {
        float _107 = float(_67);
        _77 = _107;
    }
    float _109 = _77;
    bool _111 = _101 >= _109;
    bool _113 = !_97;
    bool _115 = _111 || _113;
    float _117 = _109;
    if (_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    if (_115)
    {
        out.m_29.x = 0.0;
    }
    if (_115)
    {
        float _121 = _119 * 5.0;
        _85 = as_type<int>(_121);
    }
    int _123 = _85;
    float _125 = as_type<float>(_123);
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2539 = as_type<float>(_123);
        out.gl_Position.z = _2539;
    }
    if (_115)
    {
        return out;
    }
    float _127 = in.m_31.x;
    float _129 = in.m_31.y;
    float _131 = in.m_31.z;
    float _133 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _135 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _137 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _139 = _135 || _137;
    bool _141 = isnan(1.0);
    bool _143 = _139 || _141;
    float _145 = _133;
    if (!_143)
    {
        float _147 = _133 * _133;
        float _149 = _147 * 0.5;
        _125 = _149;
    }
    float _151 = _125;
    float _153 = 0.0;
    float _155 = _151;
    if (!_143)
    {
        float _157 = _101 * _101;
        float _159 = _157 * 0.5;
        _153 = _159;
    }
    float _161 = _153;
    if (!_143)
    {
        float _163 = _151 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _155 = _163;
    }
    float _165 = _155;
    bool _167 = !_143;
    float _169 = _165;
    if (!_167)
    {
        float _171 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _173 = log2(_171);
        float _175 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _177 = _175 + 1.0;
        float _179 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _181 = _133 * _173;
        float _183 = 1.0 / _177;
        float _185 = _179 * 0.693147182464599609375;
        float _187 = exp2(_181);
        float _189 = 1.0 / _185;
        float _191 = _187 + (-1.0);
        float _193 = -_191;
        float _195 = fma(_193, _189, _133);
        float _197 = _195 * _183;
        float _199 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _103 = _189;
        _169 = _199;
        _105 = _187;
    }
    float _201 = _103;
    float _203 = _169;
    float _205 = _105;
    bool _207 = !_143;
    float _209 = _201;
    float _211 = _205;
    if (!_207)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = 1.0 / _219;
        float _223 = _133 * _215;
        float _225 = exp2(_223);
        float _227 = -_225;
        float _229 = _227 + 1.0;
        float _231 = _229 * _221;
        _209 = _225;
        _211 = _219;
        _145 = _231;
    }
    float _233 = _209;
    float _235 = _211;
    float _237 = _145;
    float _239 = _235;
    float _241 = _233;
    if (!_143)
    {
        _239 = _101;
    }
    float _243 = _239;
    float _245 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _247 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _243;
    if (!_143)
    {
        float _251 = _161 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _241 = _251;
    }
    float _253 = _241;
    bool _255 = !_143;
    float _257 = _253;
    if (!_255)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _269 = _101 * _261;
        float _271 = 1.0 / _265;
        float _273 = _267 * 0.693147182464599609375;
        float _275 = exp2(_269);
        float _277 = 1.0 / _273;
        float _279 = _275 + (-1.0);
        float _281 = -_279;
        float _283 = fma(_281, _277, _101);
        float _285 = _283 * _271;
        float _287 = _285 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _257 = _287;
    }
    float _289 = _257;
    bool _291 = !_143;
    if (!_291)
    {
        float _293 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = log2(_293);
        float _297 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _299 = _297 + 1.0;
        float _301 = 1.0 / _299;
        float _303 = _101 * _295;
        float _305 = exp2(_303);
        float _307 = -_305;
        float _309 = _307 + 1.0;
        float _311 = _309 * _301;
        _249 = _311;
    }
    float _313 = _249;
    float _315 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _317 = fma(_237, _129, _247);
    float _319 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _321 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _323 = fma(_313, _129, _315);
    float _325 = fma(_237, _127, _245);
    float _327 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _329 = fma(_313, _127, _319);
    float _331 = -_323;
    float _333 = _317 + _331;
    float _335 = fma(_237, _131, _321);
    float _337 = fma(_313, _131, _327);
    float _339 = -_329;
    float _341 = _325 + _339;
    float _343 = _333 * _333;
    float _345 = in.m_33.w;
    float _347 = -_337;
    float _349 = _335 + _347;
    float _351 = _333 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _353 = fma(_341, _341, _343);
    float _355 = _333 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _357 = _333 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _359 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[5].x, _351);
    float _361 = fma(_349, _349, _353);
    float _363 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[4].x, _355);
    float _365 = in.m_26.x;
    float _367 = in.m_26.y;
    float _369 = in.m_26.z;
    float _371 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[6].x, _357);
    float _373 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[5].z, _359);
    float _375 = sqrt(_361);
    float _377 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[4].z, _363);
    float _379 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[6].z, _371);
    bool _381 = _375 >= 9.9999999747524270787835121154785e-07;
    bool _383 = isnan(_375);
    bool _385 = _381 || _383;
    bool _387 = isnan(9.9999999747524270787835121154785e-07);
    bool _389 = _385 || _387;
    float _391 = fma(_325, _345, _365);
    float _393 = fma(_317, _345, _367);
    float _395 = fma(_335, _345, _369);
    float _397 = _371;
    float _399 = _377;
    float _401 = _379;
    if (_389)
    {
        _397 = _373;
    }
    float _403 = _397;
    float _405 = _403;
    if (!_389)
    {
        bool _407 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _409 = !_407;
        if (!_409)
        {
            float _411 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _413 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _415 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _417 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _411);
            float _419 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _413);
            float _421 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _415);
            float _423 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _417);
            float _425 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _419);
            float _427 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _421);
            float _429 = _423 * _423;
            float _431 = fma(_425, _425, _429);
            float _433 = fma(_427, _427, _431);
            float _435 = rsqrt(_433);
            float _437 = _435 * 9.9999999747524270787835121154785e-07;
            float _439 = _425 * _437;
            float _441 = _423 * _437;
            float _443 = _427 * _437;
            _405 = _441;
            _399 = _439;
            _401 = _443;
            _445 = true;
        }
        else
        {
            float _447 = _129 * _129;
            float _449 = fma(_127, _127, _447);
            float _451 = fma(_131, _131, _449);
            float _453 = sqrt(_451);
            bool _455 = _453 >= 9.9999999747524270787835121154785e-07;
            bool _457 = isnan(_453);
            bool _459 = _455 || _457;
            bool _461 = isnan(9.9999999747524270787835121154785e-07);
            bool _463 = _459 || _461;
            if (!_463)
            {
                float _465 = _367 * _367;
                float _467 = fma(_365, _365, _465);
                float _469 = fma(_369, _369, _467);
                float _471 = sqrt(_469);
                bool _473 = _471 >= 9.9999999747524270787835121154785e-07;
                bool _475 = isnan(_471);
                bool _477 = _473 || _475;
                bool _479 = isnan(9.9999999747524270787835121154785e-07);
                bool _481 = _477 || _479;
                if (!_481)
                {
                    float _483 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _485 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _483);
                    float _487 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _485);
                    float _489 = rsqrt(_487);
                    float _491 = _489 * 9.9999999747524270787835121154785e-07;
                    float _493 = _491 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _495 = _491 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _497 = _491 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _405 = _495;
                    _399 = _493;
                    _401 = _497;
                    _445 = true;
                }
                else
                {
                    float _499 = _367 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _501 = _367 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _503 = _367 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _505 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _499);
                    float _507 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _501);
                    float _509 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _503);
                    float _511 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].z, _505);
                    float _513 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].z, _507);
                    float _515 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].z, _509);
                    float _517 = _511 * _511;
                    float _519 = fma(_513, _513, _517);
                    float _521 = fma(_515, _515, _519);
                    float _523 = rsqrt(_521);
                    float _525 = _523 * 9.9999999747524270787835121154785e-07;
                    float _527 = _513 * _525;
                    float _529 = _511 * _525;
                    float _531 = _515 * _525;
                    _405 = _529;
                    _399 = _527;
                    _401 = _531;
                    _445 = true;
                }
            }
            else
            {
                float _533 = _129 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _535 = _129 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _537 = _129 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _539 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[5].x, _533);
                float _541 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[4].x, _535);
                float _543 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[6].x, _537);
                float _545 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[5].z, _539);
                float _547 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[4].z, _541);
                float _549 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[6].z, _543);
                float _551 = _545 * _545;
                float _553 = fma(_547, _547, _551);
                float _555 = fma(_549, _549, _553);
                float _557 = rsqrt(_555);
                float _559 = _557 * 9.9999999747524270787835121154785e-07;
                float _561 = _547 * _559;
                float _563 = _545 * _559;
                float _565 = _549 * _559;
                _405 = _563;
                _399 = _561;
                _401 = _565;
            }
        }
    }
    _445 = false;
    float _567 = _405;
    float _569 = _399;
    float _571 = _401;
    bool _573 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _575 = !_573;
    float _577 = _567;
    float _579 = _569;
    float _581 = _571;
    float _599;
    if (!_575)
    {
        float _583 = in.m_35.x;
        float _585 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _587 = _583 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _589 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[12].x, _101);
        float _591 = _589 * _585;
        float _593 = floor(_591);
        float _595 = -_593;
        float _597 = _591 + _595;
        _599 = _597;
        _601 = true;
    }
    else
    {
        float _603 = float(_67);
        float _605 = 1.0 / _603;
        float _607 = _101 * _605;
        _599 = _607;
    }
    _601 = false;
    float _609 = _599;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _613 = _609 + _611;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _617 = _609 + _615;
    bool _619 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _621 = isnan(_609);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _631;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _639;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _645 = _609 + _643;
    float _647 = 1.0 / _633;
    bool _649 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _651 = 1.0 / _641;
    float _653 = 1.0 / _637;
    float _655 = _613 * _647;
    bool _657 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _659 = isnan(_609);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _665 = _661 || _663;
    float _667 = float(_665);
    float _669 = -_629;
    float _671 = _669 + 1.0;
    float _673 = _667 * _671;
    float _675 = _617 * _651;
    bool _677 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _679 = isnan(_609);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = -_667;
    float _691 = _689 + 1.0;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _697 = _645 * _653;
    bool _699 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _701 = isnan(_609);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _707 = _703 || _705;
    float _709 = float(_707);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _711;
    float _715 = _687 * _691;
    float _717 = -_687;
    float _719 = _717 + 1.0;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _721;
    float _725 = fma(_713, _655, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _727 = _709 * _719;
    float _729 = fma(_723, _655, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _731 = -_709;
    float _733 = _731 + 1.0;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _739 = _725 * _727;
    float _741 = _729 * _727;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _743;
    float _747 = fma(_695, _697, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _749 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[143].x, _739);
    float _751 = fma(_737, _697, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _753;
    float _757 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[143].y, _741);
    float _759 = fma(_745, _675, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _761 = fma(_747, _715, _749);
    float _763 = fma(_755, _675, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _765 = fma(_751, _715, _757);
    float _767 = fma(_759, _673, _761);
    float _769 = fma(_763, _673, _765);
    float _771 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[146].x, _767);
    float _773 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[146].y, _769);
    bool _775 = !_649;
    float _793;
    if (!_775)
    {
        float _777 = in.m_35.x;
        float _779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _781 = _777 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _783 = fma(_781, (*spvDescriptorSet0.vp_c9)._m0[11].x, _101);
        float _785 = _783 * _779;
        float _787 = floor(_785);
        float _789 = -_787;
        float _791 = _785 + _789;
        _793 = _791;
        _795 = true;
    }
    else
    {
        float _797 = float(_67);
        float _799 = 1.0 / _797;
        float _801 = _101 * _799;
        _793 = _801;
    }
    _795 = false;
    float _803 = _793;
    float _805 = in.m_33.x;
    float _807 = in.m_33.y;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _811 = _803 + _809;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _815 = _803 + _813;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _817;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _823 = _803 + _821;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _825;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _833 = 1.0 / _819;
    bool _835 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _837 = 1.0 / _827;
    float _839 = _773 * _807;
    float _841 = _771 * _805;
    float _843 = 1.0 / _831;
    bool _845 = _803 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _847 = isnan(_803);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    float _857 = _811 * _833;
    bool _859 = _803 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _861 = isnan(_803);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _867 = _863 || _865;
    float _869 = float(_867);
    bool _871 = _803 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _873 = isnan(_803);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = _815 * _837;
    float _885 = -_855;
    float _887 = _885 + 1.0;
    float _889 = -_881;
    float _891 = _889 + 1.0;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _893;
    float _897 = _869 * _887;
    bool _899 = _803 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _901 = isnan(_803);
    bool _903 = _899 || _901;
    bool _905 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _907 = _903 || _905;
    float _909 = float(_907);
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _913 = _911 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _915 = _823 * _843;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _917;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _921;
    float _925 = -_869;
    float _927 = _925 + 1.0;
    float _929 = _909 * _891;
    float _931 = fma(_919, _883, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _933 = fma(_895, _883, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _935 = fma(_923, _883, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _937 = _881 * _927;
    float _939 = _931 * _929;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _943 = _941 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _947 = _945 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _949 = _933 * _929;
    float _951 = -_909;
    float _953 = _951 + 1.0;
    float _955 = _935 * _929;
    float _957 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[107].x, _949);
    float _959 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[107].y, _939);
    float _961 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[107].z, _955);
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _963;
    float _967 = fma(_913, _915, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _969 = fma(_943, _915, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _971 = fma(_947, _915, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _973;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _979 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _977;
    float _981 = fma(_967, _937, _957);
    float _983 = fma(_965, _857, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _985 = fma(_975, _857, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _987 = fma(_979, _857, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _989 = fma(_969, _937, _959);
    float _991 = fma(_971, _937, _961);
    float _993 = fma(_983, _897, _981);
    float _995 = fma(_985, _897, _989);
    float _997 = fma(_987, _897, _991);
    float _999 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[110].x, _993);
    float _1001 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[110].y, _995);
    float _1003 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[110].z, _997);
    bool _1005 = !_835;
    float _1023;
    if (!_1005)
    {
        float _1007 = in.m_35.x;
        float _1009 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1011 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1013 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[11].y, _101);
        float _1015 = _1013 * _1009;
        float _1017 = floor(_1015);
        float _1019 = -_1017;
        float _1021 = _1015 + _1019;
        _1023 = _1021;
        _1025 = true;
    }
    else
    {
        float _1027 = float(_67);
        float _1029 = 1.0 / _1027;
        float _1031 = _101 * _1029;
        _1023 = _1031;
    }
    _1025 = false;
    float _1033 = _1023;
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1037 = _1033 + _1035;
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1043 = _1033 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1045 = isnan(_1033);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1051 = _1047 || _1049;
    float _1053 = float(_1051);
    float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1057 = _1055 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1061 = _1059 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1063 = _1033 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1065 = isnan(_1033);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1071 = _1067 || _1069;
    float _1073 = float(_1071);
    float _1075 = 1.0 / _1041;
    float _1077 = -_1053;
    float _1079 = _1077 + 1.0;
    float _1081 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1081;
    bool _1085 = _1033 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1087 = isnan(_1033);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1093 = _1089 || _1091;
    float _1095 = float(_1093);
    float _1097 = _1073 * _1079;
    float _1099 = -_1073;
    float _1101 = _1099 + 1.0;
    bool _1103 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1105 = 1.0 / _1057;
    float _1107 = _1095 * _1101;
    float _1109 = -_1095;
    float _1111 = _1109 + 1.0;
    float _1113 = 1.0 / _1061;
    float _1115 = _1083 * _1075;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1121 = fma(_1115, _1037, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1123 = _1119 * _1105;
    bool _1125 = _1033 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1127 = isnan(_1033);
    bool _1129 = _1125 || _1127;
    bool _1131 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1133 = _1129 || _1131;
    float _1135 = float(_1133);
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1139 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1137;
    float _1141 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1143 = _1033 + _1141;
    float _1145 = _1121 * _1107;
    float _1147 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1149 = _1033 + _1147;
    float _1151 = -_1135;
    float _1153 = _1151 + 1.0;
    float _1155 = fma(_1123, _1143, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1157 = _1139 * _1113;
    float _1159 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1145);
    float _1161 = _1053 * _1153;
    float _1163 = _999 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1165 = fma(_1157, _1149, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1167 = fma(_1155, _1097, _1159);
    float _1169 = _1001 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1171 = _1003 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1173 = fma(_1165, _1161, _1167);
    float _1175 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1177 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1179 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1173);
    float _1181 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1183 = _1179 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.x = _1181;
    out.m_37.y = _1175;
    out.m_37.z = _1177;
    out.m_37.w = _1183;
    bool _1185 = !_1103;
    float _1209;
    float _1211;
    if (!_1185)
    {
        float _1187 = in.m_35.x;
        float _1189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1191 = float(_67);
        float _1193 = 1.0 / _1191;
        float _1195 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1197 = _101 * _1193;
        float _1199 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[11].z, _101);
        float _1201 = _1199 * _1189;
        float _1203 = floor(_1201);
        float _1205 = -_1203;
        float _1207 = _1201 + _1205;
        _1209 = _1207;
        _1211 = _1197;
        _1213 = true;
    }
    else
    {
        float _1215 = float(_67);
        float _1217 = 1.0 / _1215;
        float _1219 = _101 * _1217;
        _1209 = _1219;
        _1211 = _1219;
    }
    _1213 = false;
    float _1221 = _1209;
    float _1223 = _1211;
    float _1225 = as_type<float>(int(gl_VertexIndex));
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1229 = _1221 + _1227;
    float _1231 = in.m_35.x;
    float _1233 = in.m_35.y;
    float _1235 = in.m_35.z;
    float _1237 = in.m_35.w;
    float _1239 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1239;
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1245 = _1243 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1249 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1247;
    float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1253 = _1251 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1255 = 1.0 / _1241;
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1259 = _1257 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1263 = _1223 + _1261;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1267 = 1.0 / _1253;
    float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1271 = _1269 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1275 = _1273 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1279 = as_type<int>(_1225) & 1;
    bool _1281 = _1279 != 0;
    int _1283 = as_type<int>(_1225) & 2;
    bool _1285 = _1283 != 0;
    float _1287 = 1.0 / _1245;
    float _1289 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1291 = _1237 > 0.5;
    float _1293 = _1229 * _1255;
    float _1295 = fma(_1289, -2.0, _1265);
    bool _1297 = _1231 > 0.5;
    float _1299 = 1.0 / _1249;
    bool _1301 = !_1281;
    float _1303 = _1301 ? (-0.5) : 0.5;
    float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1307 = _1221 + _1305;
    int _1309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1311 = _1309 != 0;
    float _1313 = _567 * _567;
    float _1315 = -_1303;
    int _1317 = _1297 ? as_type<int>(_1315) : as_type<int>(_1303);
    float _1319 = _839 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1321 = _1235 > 0.5;
    float _1323 = 1.0 / _1259;
    bool _1325 = !_1311;
    float _1327 = _1325 ? _1303 : as_type<float>(_1317);
    float _1329 = _1307 * _1287;
    bool _1331 = !_1285;
    float _1333 = _1331 ? (-0.5) : 0.5;
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1337 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1335;
    bool _1339 = _1233 > 0.5;
    float _1341 = _841 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1345 = _1343 != 0;
    float _1347 = 1.0 / _1271;
    float _1349 = -_1303;
    int _1351 = _1321 ? as_type<int>(_1349) : as_type<int>(_1303);
    int _1353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1355 = _1353 != 0;
    int _1357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1359 = _1357 != 0;
    float _1361 = -_1333;
    int _1363 = _1339 ? as_type<int>(_1361) : as_type<int>(_1333);
    float _1365 = 1.0 / _1275;
    float _1367 = -_1303;
    int _1369 = _1339 ? as_type<int>(_1367) : as_type<int>(_1303);
    float _1371 = _1337 * _1323;
    bool _1373 = !_1345;
    float _1375 = _1373 ? _1303 : as_type<float>(_1351);
    float _1377 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1381 = _1379 != 0;
    int _1383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1385 = _1383 != 0;
    float _1387 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1277);
    float _1389 = _1375 + 0.5;
    float _1391 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1387);
    float _1393 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1397 = _1395 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1399 = -_1393;
    float _1401 = fma(_1377, 2.0, _1399);
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1405 = _1403 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1407 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1411 = _1221 + _1409;
    float _1413 = 1.0 / _1397;
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1415;
    float _1419 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1407);
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1423 = _1221 + _1421;
    float _1425 = _1411 * _1299;
    float _1427 = -_101;
    float _1429 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1401);
    float _1431 = _1423 * _1267;
    float _1433 = 1.0 / _1405;
    float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1437 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1435;
    float _1439 = -_1391;
    float _1441 = _1439 + 1.0;
    float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1445 = _1443 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1449 = _1447 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1453 = _1451 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1457 = _1455 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1459;
    float _1463 = _1437 * _1347;
    float _1465 = _1449 * _1365;
    float _1467 = 1.0 / _1445;
    float _1469 = _1453 * _1433;
    float _1471 = _1461 * _1413;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1475 = _1473 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1479 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1477;
    float _1481 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1481;
    float _1485 = 1.0 / _1457;
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1487;
    float _1491 = fma(_1483, _1293, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1493 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1495 = _1493 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1497 = fma(_1489, _1293, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1499 = fma(_1417, _1293, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1503 = _1501 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1505 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1507 = _1505 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1509 = fma(_1495, _1329, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1511 = _1479 * _1467;
    float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1515 = _1513 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1517 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1519 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1517;
    float _1521 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1523 = _1521 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1525 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1527 = _1525 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1529 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1531 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1529;
    float _1533 = _1475 * _1485;
    float _1535 = fma(_1503, _1329, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1537 = fma(_1507, _1329, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1541 = _1223 + _1539;
    float _1543 = fma(_1515, _1431, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1545 = fma(_1523, _1431, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1547 = fma(_1519, _1425, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1549 = fma(_1371, _1541, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1551 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1553 = _1223 + _1551;
    float _1555 = fma(_1527, _1431, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1557 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1559 = _1223 + _1557;
    float _1561 = fma(_1465, _1263, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1563 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1565 = _1223 + _1563;
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1569 = _1223 + _1567;
    float _1571 = fma(_1531, _1425, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1573 = fma(_1471, _1553, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _1575 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1577 = isnan(_1223);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1583 = _1579 || _1581;
    float _1585 = float(_1583);
    float _1587 = fma(_1463, _1559, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    bool _1589 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1591 = isnan(_1221);
    bool _1593 = _1589 || _1591;
    bool _1595 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1597 = _1593 || _1595;
    float _1599 = float(_1597);
    float _1601 = fma(_1469, _1565, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _1603 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1605 = isnan(_1221);
    bool _1607 = _1603 || _1605;
    bool _1609 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1611 = _1607 || _1609;
    float _1613 = float(_1611);
    float _1615 = fma(_1533, _1569, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    bool _1617 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1619 = isnan(_1221);
    bool _1621 = _1617 || _1619;
    bool _1623 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1625 = _1621 || _1623;
    float _1627 = float(_1625);
    float _1629 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1631 = _1223 + _1629;
    bool _1633 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1635 = isnan(_1221);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1641 = _1637 || _1639;
    float _1643 = float(_1641);
    float _1645 = -_1585;
    float _1647 = _1645 + 1.0;
    bool _1649 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1651 = isnan(_1223);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    float _1661 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1663 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1661;
    bool _1665 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1667 = isnan(_1221);
    bool _1669 = _1665 || _1667;
    bool _1671 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1673 = _1669 || _1671;
    float _1675 = float(_1673);
    float _1677 = -_1643;
    float _1679 = _1677 + 1.0;
    bool _1681 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1683 = isnan(_1223);
    bool _1685 = _1681 || _1683;
    bool _1687 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1689 = _1685 || _1687;
    float _1691 = float(_1689);
    float _1693 = -_1659;
    float _1695 = _1693 + 1.0;
    bool _1697 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1699 = isnan(_1223);
    bool _1701 = _1697 || _1699;
    bool _1703 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1705 = _1701 || _1703;
    float _1707 = float(_1705);
    float _1709 = -_1675;
    float _1711 = _1709 + 1.0;
    bool _1713 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1715 = isnan(_1223);
    bool _1717 = _1713 || _1715;
    bool _1719 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1721 = _1717 || _1719;
    float _1723 = float(_1721);
    float _1725 = _1659 * _1647;
    bool _1727 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1729 = isnan(_1223);
    bool _1731 = _1727 || _1729;
    bool _1733 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1735 = _1731 || _1733;
    float _1737 = float(_1735);
    float _1739 = _1643 * _1711;
    bool _1741 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1743 = isnan(_1223);
    bool _1745 = _1741 || _1743;
    bool _1747 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1749 = _1745 || _1747;
    float _1751 = float(_1749);
    float _1753 = _1627 * _1679;
    bool _1755 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1757 = isnan(_1223);
    bool _1759 = _1755 || _1757;
    bool _1761 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1763 = _1759 || _1761;
    float _1765 = float(_1763);
    float _1767 = fma(_1511, _1631, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1769 = -_1691;
    float _1771 = _1769 + 1.0;
    float _1773 = -_1751;
    float _1775 = _1773 + 1.0;
    float _1777 = -_1613;
    float _1779 = _1777 + 1.0;
    float _1781 = _1765 * _1695;
    float _1783 = -_1765;
    float _1785 = _1783 + 1.0;
    float _1787 = -_1627;
    float _1789 = _1787 + 1.0;
    float _1791 = _1737 * _1775;
    float _1793 = fma(_569, _569, _1313);
    float _1795 = _1751 * _1785;
    float _1797 = -_1737;
    float _1799 = _1797 + 1.0;
    float _1801 = _1613 * _1789;
    float _1803 = fma(_571, _571, _1793);
    float _1805 = _1585 * _1771;
    float _1807 = _1723 * _1799;
    bool _1809 = !_1381;
    float _1811 = _1809 ? _1303 : as_type<float>(_1369);
    float _1813 = fma(_1663, _1425, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1815 = rsqrt(_1803);
    float _1817 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1303);
    float _1819 = _1599 * _1779;
    bool _1821 = !_1355;
    float _1823 = _1821 ? _1333 : as_type<float>(_1363);
    float _1825 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1333);
    float _1827 = -_1333;
    int _1829 = _1291 ? as_type<int>(_1827) : as_type<int>(_1333);
    float _1831 = _1491 * _1819;
    float _1833 = -_1333;
    int _1835 = _1321 ? as_type<int>(_1833) : as_type<int>(_1333);
    float _1837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1839 = _1497 * _1819;
    float _1841 = _1499 * _1819;
    float _1843 = -_1723;
    float _1845 = _1843 + 1.0;
    float _1847 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1295);
    float _1849 = _1319 * _1825;
    bool _1851 = !_1359;
    float _1853 = _1851 ? _1333 : as_type<float>(_1829);
    float _1855 = _1327 + 0.5;
    float _1857 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1859 = _1815 * _571;
    bool _1861 = !_1385;
    float _1863 = _1861 ? _1333 : as_type<float>(_1835);
    float _1865 = _1341 * _1817;
    float _1867 = _1815 * _567;
    float _1869 = _1823 + (-0.5);
    float _1871 = _1707 * _1845;
    float _1873 = -_1599;
    float _1875 = _1873 + 1.0;
    float _1877 = _1837 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1879 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1881 = _1549 * _1871;
    float _1883 = -_1853;
    float _1885 = _1883 + 0.5;
    float _1887 = fma(_1877, _1855, _1429);
    float _1889 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1891 = _1867 * _1889;
    float _1893 = _1811 + 0.5;
    float _1895 = -_1863;
    float _1897 = _1895 + 0.5;
    float _1899 = _1857 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1901 = _1815 * _569;
    float _1903 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1905 = _1859 * _1903;
    float _1907 = -_1441;
    float _1909 = fma(_1327, _1907, _1887);
    float _1911 = -_1899;
    float _1913 = -_1847;
    float _1915 = fma(_1911, _1869, _1913);
    float _1917 = -_1707;
    float _1919 = _1917 + 1.0;
    float _1921 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1923 = -_1905;
    float _1925 = fma(_1901, _1921, _1923);
    float _1927 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1929 = _1901 * _1927;
    float _1931 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1933 = -_1891;
    float _1935 = fma(_1859, _1931, _1933);
    float _1937 = fma(_1919, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1881);
    float _1939 = _1925 * _1925;
    float _1941 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1943 = -_1929;
    float _1945 = fma(_1867, _1941, _1943);
    float _1947 = fma(_1875, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1831);
    float _1949 = fma(_1561, _1807, _1937);
    float _1951 = fma(_1935, _1935, _1939);
    float _1953 = fma(_1875, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1839);
    float _1955 = fma(_1875, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1841);
    float _1957 = fma(_1509, _1801, _1947);
    float _1959 = fma(_1945, _1945, _1951);
    float _1961 = fma(_1535, _1801, _1953);
    float _1963 = fma(_1537, _1801, _1955);
    float _1965 = fma(_1547, _1753, _1957);
    float _1967 = rsqrt(_1959);
    float _1969 = fma(_1571, _1753, _1961);
    float _1971 = fma(_1813, _1753, _1963);
    float _1973 = fma(_1543, _1739, _1965);
    float _1975 = _1849 * _1867;
    float _1977 = fma(_1545, _1739, _1969);
    float _1979 = fma(_1555, _1739, _1971);
    float _1981 = fma(_1675, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1973);
    float _1983 = _1849 * _1901;
    float _1985 = fma(_1675, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1977);
    float _1987 = fma(_1675, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1979);
    float _1989 = fma(_1587, _1791, _1949);
    float _1991 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1993 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1995 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1419);
    float _1997 = fma(_1601, _1795, _1989);
    float _1999 = _1925 * _1967;
    float _2001 = _1945 * _1967;
    float _2003 = _1935 * _1967;
    float _2005 = _1849 * _1859;
    float _2007 = fma(_1865, _1999, _1975);
    float _2009 = _1867 * _2001;
    float _2011 = _1859 * _2003;
    float _2013 = fma(_1865, _2003, _1983);
    float _2015 = fma(_1865, _2001, _2005);
    float _2017 = -_2009;
    float _2019 = fma(_1859, _1999, _2017);
    float _2021 = -_2011;
    float _2023 = fma(_1901, _2001, _2021);
    float _2025 = _1901 * _1999;
    float _2027 = fma(_1573, _1781, _1997);
    float _2029 = fma(_1879, _2019, _2013);
    float _2031 = fma(_1879, _2023, _2007);
    float _2033 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2035 = -_2025;
    float _2037 = fma(_1867, _2003, _2035);
    float _2039 = fma(_1615, _1725, _2027);
    float _2041 = _2031 * _2031;
    float _2043 = fma(_1879, _2037, _2015);
    float _2045 = _1885 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2047 = fma(_2029, _2029, _2041);
    float _2049 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2051 = fma(_1767, _1805, _2039);
    float _2053 = _1893 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2055 = fma(_2043, _2043, _2047);
    float _2057 = _1981 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2059 = _1897 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2061 = _1985 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2063 = fma(_1691, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2051);
    float _2065 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2067 = _2045 * _2033;
    float _2069 = _1987 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2071 = _2053 * _1991;
    float _2073 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2075 = _2057 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2077 = _2061 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2079 = _2069 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2081 = sqrt(_2055);
    float _2083 = _2059 * _2049;
    out.m_42.x = _2063;
    float _2085 = _393 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2087 = -_1995;
    float _2089 = _2087 + 1.0;
    out.m_44.x = _2071;
    out.m_44.y = _2083;
    float _2091 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2085);
    float _2093 = _1993 * _2065;
    float _2095 = _393 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    out.m_46.x = _2075;
    out.m_46.y = _2077;
    out.m_46.z = _2079;
    out.m_46.w = _2073;
    float _2097 = _393 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2099 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2091);
    float _2101 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2095);
    float _2103 = fma(_1823, _2089, _1915);
    float _2105 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2097);
    bool _2107 = _2081 > 0.0;
    float _2109 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2101);
    float _2111 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2105);
    float _2113 = _2099 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2115 = _2109 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    out.m_48.x = _1909;
    out.m_48.y = _2103;
    out.m_48.z = _2093;
    out.m_48.w = _2067;
    float _2117 = _2111 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2119 = _2115 + _2029;
    float _2121 = _2113 + _2031;
    float _2123 = _2117 + _2043;
    bool _2125 = !_2107;
    float _2127 = _2113;
    float _2129 = _2117;
    float _2131 = _1803;
    float _2133 = _2121;
    float _2135 = _2119;
    float _2137 = _2123;
    if (!_2125)
    {
        bool _2139 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2141 = _2067;
        if (_2139)
        {
            float _2143 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2141 = _2143;
        }
        float _2145 = _2141;
        float _2147 = _2145;
        if (_2139)
        {
            float _2149 = _2145 * _569;
            _2127 = _2149;
        }
        float _2151 = _2127;
        float _2153 = _2151;
        if (_2139)
        {
            float _2155 = _2145 * _567;
            _2129 = _2155;
        }
        float _2157 = _2129;
        float _2159 = _2157;
        if (_2139)
        {
            float _2161 = _2145 * _571;
            _2147 = _2161;
        }
        float _2163 = _2147;
        float _2165 = _2163;
        float _2167 = _2163;
        if (!_2139)
        {
            float _2169 = _101 + 1.0;
            float _2171 = _2169;
            if (!_143)
            {
                float _2173 = _2169 * _2169;
                float _2175 = _2173 * 0.5;
                _2165 = _2175;
            }
            float _2177 = _2165;
            float _2179 = _2177;
            if (!_143)
            {
                float _2181 = _2177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2179 = _2181;
            }
            float _2183 = _2179;
            bool _2185 = !_143;
            float _2187 = _2183;
            if (!_2185)
            {
                float _2189 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2191 = log2(_2189);
                float _2193 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2195 = _2193 + 1.0;
                float _2197 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2199 = _2191 * _2169;
                float _2201 = 1.0 / _2195;
                float _2203 = _2197 * 0.693147182464599609375;
                float _2205 = exp2(_2199);
                float _2207 = 1.0 / _2203;
                float _2209 = _2205 + (-1.0);
                float _2211 = -_2209;
                float _2213 = fma(_2211, _2207, _2169);
                float _2215 = _2213 * _2201;
                float _2217 = _2215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2187 = _2217;
            }
            float _2219 = _2187;
            float _2221 = _2219 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2223 = _2219 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2225 = !_143;
            if (!_2225)
            {
                float _2227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2229 = log2(_2227);
                float _2231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2233 = _2231 + 1.0;
                float _2235 = 1.0 / _2233;
                float _2237 = _2229 * _2169;
                float _2239 = exp2(_2237);
                float _2241 = -_2239;
                float _2243 = _2241 + 1.0;
                float _2245 = _2243 * _2235;
                _2171 = _2245;
            }
            float _2247 = _2171;
            float _2249 = fma(_2247, _129, _2223);
            float _2251 = fma(_2247, _127, _2221);
            float _2253 = _2219 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2255 = -_323;
            float _2257 = _2255 + _2249;
            float _2259 = -_329;
            float _2261 = _2259 + _2251;
            float _2263 = fma(_2247, _131, _2253);
            float _2265 = _2257 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2267 = _2257 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2269 = -_337;
            float _2271 = _2269 + _2263;
            float _2273 = _2257 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2275 = fma(_2261, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2265);
            float _2277 = fma(_2261, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2267);
            float _2279 = fma(_2261, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2273);
            float _2281 = fma(_2271, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2275);
            float _2283 = fma(_2271, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2277);
            float _2285 = fma(_2271, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2279);
            float _2287 = _2281 * _2281;
            float _2289 = fma(_2283, _2283, _2287);
            float _2291 = fma(_2285, _2285, _2289);
            _2131 = _2291;
            _577 = _2281;
            _579 = _2283;
            _581 = _2285;
            _2153 = _2283;
            _2159 = _2281;
            _2167 = _2285;
        }
        float _2293 = _2131;
        float _2295 = _577;
        float _2297 = _579;
        float _2299 = _581;
        float _2301 = _2153;
        float _2303 = _2159;
        float _2305 = _2167;
        float _2307 = sqrt(_2293);
        float _2309 = rsqrt(_2055);
        bool _2311 = _2307 > 0.0;
        float _2313 = _2029 * _2309;
        float _2315 = _2031 * _2309;
        float _2317 = _2043 * _2309;
        bool _2319 = !_2311;
        if (!_2319)
        {
            float _2321 = rsqrt(_2293);
            float _2323 = _2321 * _2295;
            float _2325 = _2321 * _2297;
            float _2327 = _2321 * _2299;
            float _2329 = _2315 * _2323;
            float _2331 = fma(_2313, _2325, _2329);
            float _2333 = fma(_2317, _2327, _2331);
            float _2335 = _2333 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2337 = fma(_2301, _2335, _2119);
            float _2339 = fma(_2303, _2335, _2121);
            float _2341 = fma(_2305, _2335, _2123);
            _2133 = _2339;
            _2135 = _2337;
            _2137 = _2341;
        }
    }
    float _2343 = _2133;
    float _2345 = _2135;
    float _2347 = _2137;
    float _2349 = _2343 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2351 = _2343 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2353 = _2343 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2355 = _2343 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2357 = fma(_2345, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2349);
    float _2359 = fma(_2345, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2351);
    float _2361 = fma(_2345, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2353);
    float _2363 = fma(_2345, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2355);
    float _2365 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2357);
    float _2367 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2359);
    float _2369 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2361);
    float _2371 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2363);
    float _2373 = _2365 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2375 = _2367 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2377 = _2369 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2379 = _2371 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2381 = _2373 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2383 = _2373 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2385 = _2373 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2387 = _2373 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2389 = fma(_2375, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2381);
    float _2391 = fma(_2375, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2383);
    float _2393 = fma(_2375, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2385);
    float _2395 = fma(_2375, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2387);
    float _2397 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2389);
    float _2399 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2391);
    float _2401 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2393);
    float _2403 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2395);
    float _2405 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2397);
    float _2407 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2399);
    float _2409 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2401);
    float _2411 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2403);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _2407;
    out.gl_Position.y = _2405;
    out.gl_Position.z = _2409;
    out.gl_Position.w = _2411;
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
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1213 = false;
    bool _1025 = false;
    bool _795 = false;
    bool _601 = false;
    bool _445 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _62 = in.m_26.w;
    float _64 = trunc(_62);
    int _67 = int(_64);
    bool _71 = _67 >= 1;
    float _73 = 0.0;
    if (!_71)
    {
        _73 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _75 = _73;
    float _77 = _75;
    if (!_71)
    {
        out.m_29.x = 0.0;
    }
    int _79 = 0;
    if (!_71)
    {
        float _81 = _75 * 5.0;
        _79 = as_type<int>(_81);
    }
    int _83 = _79;
    int _85 = _83;
    if (!_71)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2468 = as_type<float>(_83);
        out.gl_Position.z = _2468;
    }
    if (!_71)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _87 = in.m_31.w;
    bool _89 = _87 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _91 = isnan(_87);
    bool _93 = _89 || _91;
    bool _95 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _97 = _93 || _95;
    float _99 = -_87;
    float _101 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _103 = 0.0;
    float _105 = 0.0;
    if (_97)
    {
        float _107 = float(_67);
        _77 = _107;
    }
    float _109 = _77;
    bool _111 = _101 >= _109;
    bool _113 = !_97;
    bool _115 = _111 || _113;
    float _117 = _109;
    if (_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    if (_115)
    {
        out.m_29.x = 0.0;
    }
    if (_115)
    {
        float _121 = _119 * 5.0;
        _85 = as_type<int>(_121);
    }
    int _123 = _85;
    float _125 = as_type<float>(_123);
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2539 = as_type<float>(_123);
        out.gl_Position.z = _2539;
    }
    if (_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_31.x;
    float _129 = in.m_31.y;
    float _131 = in.m_31.z;
    float _133 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _135 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _137 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _139 = _135 || _137;
    bool _141 = isnan(1.0);
    bool _143 = _139 || _141;
    float _145 = _133;
    if (!_143)
    {
        float _147 = _133 * _133;
        float _149 = _147 * 0.5;
        _125 = _149;
    }
    float _151 = _125;
    float _153 = 0.0;
    float _155 = _151;
    if (!_143)
    {
        float _157 = _101 * _101;
        float _159 = _157 * 0.5;
        _153 = _159;
    }
    float _161 = _153;
    if (!_143)
    {
        float _163 = _151 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _155 = _163;
    }
    float _165 = _155;
    bool _167 = !_143;
    float _169 = _165;
    if (!_167)
    {
        float _171 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _173 = log2(_171);
        float _175 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _177 = _175 + 1.0;
        float _179 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _181 = _133 * _173;
        float _183 = 1.0 / _177;
        float _185 = _179 * 0.693147182464599609375;
        float _187 = exp2(_181);
        float _189 = 1.0 / _185;
        float _191 = _187 + (-1.0);
        float _193 = -_191;
        float _195 = fma(_193, _189, _133);
        float _197 = _195 * _183;
        float _199 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _103 = _189;
        _169 = _199;
        _105 = _187;
    }
    float _201 = _103;
    float _203 = _169;
    float _205 = _105;
    bool _207 = !_143;
    float _209 = _201;
    float _211 = _205;
    if (!_207)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = 1.0 / _219;
        float _223 = _133 * _215;
        float _225 = exp2(_223);
        float _227 = -_225;
        float _229 = _227 + 1.0;
        float _231 = _229 * _221;
        _209 = _225;
        _211 = _219;
        _145 = _231;
    }
    float _233 = _209;
    float _235 = _211;
    float _237 = _145;
    float _239 = _235;
    float _241 = _233;
    if (!_143)
    {
        _239 = _101;
    }
    float _243 = _239;
    float _245 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _247 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _243;
    if (!_143)
    {
        float _251 = _161 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _241 = _251;
    }
    float _253 = _241;
    bool _255 = !_143;
    float _257 = _253;
    if (!_255)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _269 = _101 * _261;
        float _271 = 1.0 / _265;
        float _273 = _267 * 0.693147182464599609375;
        float _275 = exp2(_269);
        float _277 = 1.0 / _273;
        float _279 = _275 + (-1.0);
        float _281 = -_279;
        float _283 = fma(_281, _277, _101);
        float _285 = _283 * _271;
        float _287 = _285 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _257 = _287;
    }
    float _289 = _257;
    bool _291 = !_143;
    if (!_291)
    {
        float _293 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = log2(_293);
        float _297 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _299 = _297 + 1.0;
        float _301 = 1.0 / _299;
        float _303 = _101 * _295;
        float _305 = exp2(_303);
        float _307 = -_305;
        float _309 = _307 + 1.0;
        float _311 = _309 * _301;
        _249 = _311;
    }
    float _313 = _249;
    float _315 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _317 = fma(_237, _129, _247);
    float _319 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _321 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _323 = fma(_313, _129, _315);
    float _325 = fma(_237, _127, _245);
    float _327 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _329 = fma(_313, _127, _319);
    float _331 = -_323;
    float _333 = _317 + _331;
    float _335 = fma(_237, _131, _321);
    float _337 = fma(_313, _131, _327);
    float _339 = -_329;
    float _341 = _325 + _339;
    float _343 = _333 * _333;
    float _345 = in.m_33.w;
    float _347 = -_337;
    float _349 = _335 + _347;
    float _351 = _333 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _353 = fma(_341, _341, _343);
    float _355 = _333 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _357 = _333 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _359 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[5].x, _351);
    float _361 = fma(_349, _349, _353);
    float _363 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[4].x, _355);
    float _365 = in.m_26.x;
    float _367 = in.m_26.y;
    float _369 = in.m_26.z;
    float _371 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[6].x, _357);
    float _373 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[5].z, _359);
    float _375 = sqrt(_361);
    float _377 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[4].z, _363);
    float _379 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[6].z, _371);
    bool _381 = _375 >= 9.9999999747524270787835121154785e-07;
    bool _383 = isnan(_375);
    bool _385 = _381 || _383;
    bool _387 = isnan(9.9999999747524270787835121154785e-07);
    bool _389 = _385 || _387;
    float _391 = fma(_325, _345, _365);
    float _393 = fma(_317, _345, _367);
    float _395 = fma(_335, _345, _369);
    float _397 = _371;
    float _399 = _377;
    float _401 = _379;
    if (_389)
    {
        _397 = _373;
    }
    float _403 = _397;
    float _405 = _403;
    if (!_389)
    {
        bool _407 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _409 = !_407;
        if (!_409)
        {
            float _411 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _413 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _415 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _417 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _411);
            float _419 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _413);
            float _421 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _415);
            float _423 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _417);
            float _425 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _419);
            float _427 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _421);
            float _429 = _423 * _423;
            float _431 = fma(_425, _425, _429);
            float _433 = fma(_427, _427, _431);
            float _435 = rsqrt(_433);
            float _437 = _435 * 9.9999999747524270787835121154785e-07;
            float _439 = _425 * _437;
            float _441 = _423 * _437;
            float _443 = _427 * _437;
            _405 = _441;
            _399 = _439;
            _401 = _443;
            _445 = true;
        }
        else
        {
            float _447 = _129 * _129;
            float _449 = fma(_127, _127, _447);
            float _451 = fma(_131, _131, _449);
            float _453 = sqrt(_451);
            bool _455 = _453 >= 9.9999999747524270787835121154785e-07;
            bool _457 = isnan(_453);
            bool _459 = _455 || _457;
            bool _461 = isnan(9.9999999747524270787835121154785e-07);
            bool _463 = _459 || _461;
            if (!_463)
            {
                float _465 = _367 * _367;
                float _467 = fma(_365, _365, _465);
                float _469 = fma(_369, _369, _467);
                float _471 = sqrt(_469);
                bool _473 = _471 >= 9.9999999747524270787835121154785e-07;
                bool _475 = isnan(_471);
                bool _477 = _473 || _475;
                bool _479 = isnan(9.9999999747524270787835121154785e-07);
                bool _481 = _477 || _479;
                if (!_481)
                {
                    float _483 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _485 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _483);
                    float _487 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _485);
                    float _489 = rsqrt(_487);
                    float _491 = _489 * 9.9999999747524270787835121154785e-07;
                    float _493 = _491 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _495 = _491 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _497 = _491 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _405 = _495;
                    _399 = _493;
                    _401 = _497;
                    _445 = true;
                }
                else
                {
                    float _499 = _367 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _501 = _367 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _503 = _367 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _505 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _499);
                    float _507 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _501);
                    float _509 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _503);
                    float _511 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].z, _505);
                    float _513 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].z, _507);
                    float _515 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].z, _509);
                    float _517 = _511 * _511;
                    float _519 = fma(_513, _513, _517);
                    float _521 = fma(_515, _515, _519);
                    float _523 = rsqrt(_521);
                    float _525 = _523 * 9.9999999747524270787835121154785e-07;
                    float _527 = _513 * _525;
                    float _529 = _511 * _525;
                    float _531 = _515 * _525;
                    _405 = _529;
                    _399 = _527;
                    _401 = _531;
                    _445 = true;
                }
            }
            else
            {
                float _533 = _129 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _535 = _129 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _537 = _129 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _539 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[5].x, _533);
                float _541 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[4].x, _535);
                float _543 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[6].x, _537);
                float _545 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[5].z, _539);
                float _547 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[4].z, _541);
                float _549 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[6].z, _543);
                float _551 = _545 * _545;
                float _553 = fma(_547, _547, _551);
                float _555 = fma(_549, _549, _553);
                float _557 = rsqrt(_555);
                float _559 = _557 * 9.9999999747524270787835121154785e-07;
                float _561 = _547 * _559;
                float _563 = _545 * _559;
                float _565 = _549 * _559;
                _405 = _563;
                _399 = _561;
                _401 = _565;
            }
        }
    }
    _445 = false;
    float _567 = _405;
    float _569 = _399;
    float _571 = _401;
    bool _573 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _575 = !_573;
    float _577 = _567;
    float _579 = _569;
    float _581 = _571;
    float _599;
    if (!_575)
    {
        float _583 = in.m_35.x;
        float _585 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _587 = _583 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _589 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[12].x, _101);
        float _591 = _589 * _585;
        float _593 = floor(_591);
        float _595 = -_593;
        float _597 = _591 + _595;
        _599 = _597;
        _601 = true;
    }
    else
    {
        float _603 = float(_67);
        float _605 = 1.0 / _603;
        float _607 = _101 * _605;
        _599 = _607;
    }
    _601 = false;
    float _609 = _599;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _613 = _609 + _611;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _617 = _609 + _615;
    bool _619 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _621 = isnan(_609);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _631;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _639;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _645 = _609 + _643;
    float _647 = 1.0 / _633;
    bool _649 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _651 = 1.0 / _641;
    float _653 = 1.0 / _637;
    float _655 = _613 * _647;
    bool _657 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _659 = isnan(_609);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _665 = _661 || _663;
    float _667 = float(_665);
    float _669 = -_629;
    float _671 = _669 + 1.0;
    float _673 = _667 * _671;
    float _675 = _617 * _651;
    bool _677 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _679 = isnan(_609);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = -_667;
    float _691 = _689 + 1.0;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _697 = _645 * _653;
    bool _699 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _701 = isnan(_609);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _707 = _703 || _705;
    float _709 = float(_707);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _711;
    float _715 = _687 * _691;
    float _717 = -_687;
    float _719 = _717 + 1.0;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _721;
    float _725 = fma(_713, _655, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _727 = _709 * _719;
    float _729 = fma(_723, _655, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _731 = -_709;
    float _733 = _731 + 1.0;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _739 = _725 * _727;
    float _741 = _729 * _727;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _743;
    float _747 = fma(_695, _697, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _749 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[143].x, _739);
    float _751 = fma(_737, _697, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _753;
    float _757 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[143].y, _741);
    float _759 = fma(_745, _675, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _761 = fma(_747, _715, _749);
    float _763 = fma(_755, _675, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _765 = fma(_751, _715, _757);
    float _767 = fma(_759, _673, _761);
    float _769 = fma(_763, _673, _765);
    float _771 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[146].x, _767);
    float _773 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[146].y, _769);
    bool _775 = !_649;
    float _793;
    if (!_775)
    {
        float _777 = in.m_35.x;
        float _779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _781 = _777 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _783 = fma(_781, (*spvDescriptorSet0.vp_c9)._m0[11].x, _101);
        float _785 = _783 * _779;
        float _787 = floor(_785);
        float _789 = -_787;
        float _791 = _785 + _789;
        _793 = _791;
        _795 = true;
    }
    else
    {
        float _797 = float(_67);
        float _799 = 1.0 / _797;
        float _801 = _101 * _799;
        _793 = _801;
    }
    _795 = false;
    float _803 = _793;
    float _805 = in.m_33.x;
    float _807 = in.m_33.y;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _811 = _803 + _809;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _815 = _803 + _813;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _817;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _823 = _803 + _821;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _825;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _833 = 1.0 / _819;
    bool _835 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _837 = 1.0 / _827;
    float _839 = _773 * _807;
    float _841 = _771 * _805;
    float _843 = 1.0 / _831;
    bool _845 = _803 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _847 = isnan(_803);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    float _857 = _811 * _833;
    bool _859 = _803 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _861 = isnan(_803);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _867 = _863 || _865;
    float _869 = float(_867);
    bool _871 = _803 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _873 = isnan(_803);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = _815 * _837;
    float _885 = -_855;
    float _887 = _885 + 1.0;
    float _889 = -_881;
    float _891 = _889 + 1.0;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _893;
    float _897 = _869 * _887;
    bool _899 = _803 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _901 = isnan(_803);
    bool _903 = _899 || _901;
    bool _905 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _907 = _903 || _905;
    float _909 = float(_907);
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _913 = _911 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _915 = _823 * _843;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _917;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _921;
    float _925 = -_869;
    float _927 = _925 + 1.0;
    float _929 = _909 * _891;
    float _931 = fma(_919, _883, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _933 = fma(_895, _883, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _935 = fma(_923, _883, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _937 = _881 * _927;
    float _939 = _931 * _929;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _943 = _941 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _947 = _945 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _949 = _933 * _929;
    float _951 = -_909;
    float _953 = _951 + 1.0;
    float _955 = _935 * _929;
    float _957 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[107].x, _949);
    float _959 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[107].y, _939);
    float _961 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[107].z, _955);
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _963;
    float _967 = fma(_913, _915, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _969 = fma(_943, _915, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _971 = fma(_947, _915, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _973;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _979 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _977;
    float _981 = fma(_967, _937, _957);
    float _983 = fma(_965, _857, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _985 = fma(_975, _857, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _987 = fma(_979, _857, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _989 = fma(_969, _937, _959);
    float _991 = fma(_971, _937, _961);
    float _993 = fma(_983, _897, _981);
    float _995 = fma(_985, _897, _989);
    float _997 = fma(_987, _897, _991);
    float _999 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[110].x, _993);
    float _1001 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[110].y, _995);
    float _1003 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[110].z, _997);
    bool _1005 = !_835;
    float _1023;
    if (!_1005)
    {
        float _1007 = in.m_35.x;
        float _1009 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1011 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1013 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[11].y, _101);
        float _1015 = _1013 * _1009;
        float _1017 = floor(_1015);
        float _1019 = -_1017;
        float _1021 = _1015 + _1019;
        _1023 = _1021;
        _1025 = true;
    }
    else
    {
        float _1027 = float(_67);
        float _1029 = 1.0 / _1027;
        float _1031 = _101 * _1029;
        _1023 = _1031;
    }
    _1025 = false;
    float _1033 = _1023;
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1037 = _1033 + _1035;
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1043 = _1033 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1045 = isnan(_1033);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1051 = _1047 || _1049;
    float _1053 = float(_1051);
    float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1057 = _1055 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1061 = _1059 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1063 = _1033 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1065 = isnan(_1033);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1071 = _1067 || _1069;
    float _1073 = float(_1071);
    float _1075 = 1.0 / _1041;
    float _1077 = -_1053;
    float _1079 = _1077 + 1.0;
    float _1081 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1081;
    bool _1085 = _1033 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1087 = isnan(_1033);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1093 = _1089 || _1091;
    float _1095 = float(_1093);
    float _1097 = _1073 * _1079;
    float _1099 = -_1073;
    float _1101 = _1099 + 1.0;
    bool _1103 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1105 = 1.0 / _1057;
    float _1107 = _1095 * _1101;
    float _1109 = -_1095;
    float _1111 = _1109 + 1.0;
    float _1113 = 1.0 / _1061;
    float _1115 = _1083 * _1075;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1121 = fma(_1115, _1037, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1123 = _1119 * _1105;
    bool _1125 = _1033 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1127 = isnan(_1033);
    bool _1129 = _1125 || _1127;
    bool _1131 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1133 = _1129 || _1131;
    float _1135 = float(_1133);
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1139 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1137;
    float _1141 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1143 = _1033 + _1141;
    float _1145 = _1121 * _1107;
    float _1147 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1149 = _1033 + _1147;
    float _1151 = -_1135;
    float _1153 = _1151 + 1.0;
    float _1155 = fma(_1123, _1143, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1157 = _1139 * _1113;
    float _1159 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1145);
    float _1161 = _1053 * _1153;
    float _1163 = _999 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1165 = fma(_1157, _1149, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1167 = fma(_1155, _1097, _1159);
    float _1169 = _1001 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1171 = _1003 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1173 = fma(_1165, _1161, _1167);
    float _1175 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1177 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1179 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1173);
    float _1181 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1183 = _1179 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.x = _1181;
    out.m_37.y = _1175;
    out.m_37.z = _1177;
    out.m_37.w = _1183;
    bool _1185 = !_1103;
    float _1209;
    float _1211;
    if (!_1185)
    {
        float _1187 = in.m_35.x;
        float _1189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1191 = float(_67);
        float _1193 = 1.0 / _1191;
        float _1195 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1197 = _101 * _1193;
        float _1199 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[11].z, _101);
        float _1201 = _1199 * _1189;
        float _1203 = floor(_1201);
        float _1205 = -_1203;
        float _1207 = _1201 + _1205;
        _1209 = _1207;
        _1211 = _1197;
        _1213 = true;
    }
    else
    {
        float _1215 = float(_67);
        float _1217 = 1.0 / _1215;
        float _1219 = _101 * _1217;
        _1209 = _1219;
        _1211 = _1219;
    }
    _1213 = false;
    float _1221 = _1209;
    float _1223 = _1211;
    float _1225 = as_type<float>(int(gl_VertexIndex));
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1229 = _1221 + _1227;
    float _1231 = in.m_35.x;
    float _1233 = in.m_35.y;
    float _1235 = in.m_35.z;
    float _1237 = in.m_35.w;
    float _1239 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1239;
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1245 = _1243 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1249 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1247;
    float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1253 = _1251 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1255 = 1.0 / _1241;
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1259 = _1257 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1263 = _1223 + _1261;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1267 = 1.0 / _1253;
    float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1271 = _1269 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1275 = _1273 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1279 = as_type<int>(_1225) & 1;
    bool _1281 = _1279 != 0;
    int _1283 = as_type<int>(_1225) & 2;
    bool _1285 = _1283 != 0;
    float _1287 = 1.0 / _1245;
    float _1289 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1291 = _1237 > 0.5;
    float _1293 = _1229 * _1255;
    float _1295 = fma(_1289, -2.0, _1265);
    bool _1297 = _1231 > 0.5;
    float _1299 = 1.0 / _1249;
    bool _1301 = !_1281;
    float _1303 = _1301 ? (-0.5) : 0.5;
    float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1307 = _1221 + _1305;
    int _1309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1311 = _1309 != 0;
    float _1313 = _567 * _567;
    float _1315 = -_1303;
    int _1317 = _1297 ? as_type<int>(_1315) : as_type<int>(_1303);
    float _1319 = _839 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1321 = _1235 > 0.5;
    float _1323 = 1.0 / _1259;
    bool _1325 = !_1311;
    float _1327 = _1325 ? _1303 : as_type<float>(_1317);
    float _1329 = _1307 * _1287;
    bool _1331 = !_1285;
    float _1333 = _1331 ? (-0.5) : 0.5;
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1337 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1335;
    bool _1339 = _1233 > 0.5;
    float _1341 = _841 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1345 = _1343 != 0;
    float _1347 = 1.0 / _1271;
    float _1349 = -_1303;
    int _1351 = _1321 ? as_type<int>(_1349) : as_type<int>(_1303);
    int _1353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1355 = _1353 != 0;
    int _1357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1359 = _1357 != 0;
    float _1361 = -_1333;
    int _1363 = _1339 ? as_type<int>(_1361) : as_type<int>(_1333);
    float _1365 = 1.0 / _1275;
    float _1367 = -_1303;
    int _1369 = _1339 ? as_type<int>(_1367) : as_type<int>(_1303);
    float _1371 = _1337 * _1323;
    bool _1373 = !_1345;
    float _1375 = _1373 ? _1303 : as_type<float>(_1351);
    float _1377 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1381 = _1379 != 0;
    int _1383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1385 = _1383 != 0;
    float _1387 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1277);
    float _1389 = _1375 + 0.5;
    float _1391 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1387);
    float _1393 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1397 = _1395 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1399 = -_1393;
    float _1401 = fma(_1377, 2.0, _1399);
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1405 = _1403 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1407 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1411 = _1221 + _1409;
    float _1413 = 1.0 / _1397;
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1415;
    float _1419 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1407);
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1423 = _1221 + _1421;
    float _1425 = _1411 * _1299;
    float _1427 = -_101;
    float _1429 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1401);
    float _1431 = _1423 * _1267;
    float _1433 = 1.0 / _1405;
    float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1437 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1435;
    float _1439 = -_1391;
    float _1441 = _1439 + 1.0;
    float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1445 = _1443 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1449 = _1447 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1453 = _1451 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1457 = _1455 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1459;
    float _1463 = _1437 * _1347;
    float _1465 = _1449 * _1365;
    float _1467 = 1.0 / _1445;
    float _1469 = _1453 * _1433;
    float _1471 = _1461 * _1413;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1475 = _1473 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1479 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1477;
    float _1481 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1481;
    float _1485 = 1.0 / _1457;
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1487;
    float _1491 = fma(_1483, _1293, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1493 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1495 = _1493 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1497 = fma(_1489, _1293, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1499 = fma(_1417, _1293, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1503 = _1501 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1505 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1507 = _1505 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1509 = fma(_1495, _1329, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1511 = _1479 * _1467;
    float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1515 = _1513 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1517 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1519 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1517;
    float _1521 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1523 = _1521 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1525 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1527 = _1525 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1529 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1531 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1529;
    float _1533 = _1475 * _1485;
    float _1535 = fma(_1503, _1329, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1537 = fma(_1507, _1329, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1541 = _1223 + _1539;
    float _1543 = fma(_1515, _1431, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1545 = fma(_1523, _1431, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1547 = fma(_1519, _1425, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1549 = fma(_1371, _1541, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1551 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1553 = _1223 + _1551;
    float _1555 = fma(_1527, _1431, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1557 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1559 = _1223 + _1557;
    float _1561 = fma(_1465, _1263, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1563 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1565 = _1223 + _1563;
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1569 = _1223 + _1567;
    float _1571 = fma(_1531, _1425, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1573 = fma(_1471, _1553, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _1575 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1577 = isnan(_1223);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1583 = _1579 || _1581;
    float _1585 = float(_1583);
    float _1587 = fma(_1463, _1559, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    bool _1589 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1591 = isnan(_1221);
    bool _1593 = _1589 || _1591;
    bool _1595 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1597 = _1593 || _1595;
    float _1599 = float(_1597);
    float _1601 = fma(_1469, _1565, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _1603 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1605 = isnan(_1221);
    bool _1607 = _1603 || _1605;
    bool _1609 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1611 = _1607 || _1609;
    float _1613 = float(_1611);
    float _1615 = fma(_1533, _1569, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    bool _1617 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1619 = isnan(_1221);
    bool _1621 = _1617 || _1619;
    bool _1623 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1625 = _1621 || _1623;
    float _1627 = float(_1625);
    float _1629 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1631 = _1223 + _1629;
    bool _1633 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1635 = isnan(_1221);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1641 = _1637 || _1639;
    float _1643 = float(_1641);
    float _1645 = -_1585;
    float _1647 = _1645 + 1.0;
    bool _1649 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1651 = isnan(_1223);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    float _1661 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1663 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1661;
    bool _1665 = _1221 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1667 = isnan(_1221);
    bool _1669 = _1665 || _1667;
    bool _1671 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1673 = _1669 || _1671;
    float _1675 = float(_1673);
    float _1677 = -_1643;
    float _1679 = _1677 + 1.0;
    bool _1681 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1683 = isnan(_1223);
    bool _1685 = _1681 || _1683;
    bool _1687 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1689 = _1685 || _1687;
    float _1691 = float(_1689);
    float _1693 = -_1659;
    float _1695 = _1693 + 1.0;
    bool _1697 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1699 = isnan(_1223);
    bool _1701 = _1697 || _1699;
    bool _1703 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1705 = _1701 || _1703;
    float _1707 = float(_1705);
    float _1709 = -_1675;
    float _1711 = _1709 + 1.0;
    bool _1713 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1715 = isnan(_1223);
    bool _1717 = _1713 || _1715;
    bool _1719 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1721 = _1717 || _1719;
    float _1723 = float(_1721);
    float _1725 = _1659 * _1647;
    bool _1727 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1729 = isnan(_1223);
    bool _1731 = _1727 || _1729;
    bool _1733 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1735 = _1731 || _1733;
    float _1737 = float(_1735);
    float _1739 = _1643 * _1711;
    bool _1741 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1743 = isnan(_1223);
    bool _1745 = _1741 || _1743;
    bool _1747 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1749 = _1745 || _1747;
    float _1751 = float(_1749);
    float _1753 = _1627 * _1679;
    bool _1755 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1757 = isnan(_1223);
    bool _1759 = _1755 || _1757;
    bool _1761 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1763 = _1759 || _1761;
    float _1765 = float(_1763);
    float _1767 = fma(_1511, _1631, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1769 = -_1691;
    float _1771 = _1769 + 1.0;
    float _1773 = -_1751;
    float _1775 = _1773 + 1.0;
    float _1777 = -_1613;
    float _1779 = _1777 + 1.0;
    float _1781 = _1765 * _1695;
    float _1783 = -_1765;
    float _1785 = _1783 + 1.0;
    float _1787 = -_1627;
    float _1789 = _1787 + 1.0;
    float _1791 = _1737 * _1775;
    float _1793 = fma(_569, _569, _1313);
    float _1795 = _1751 * _1785;
    float _1797 = -_1737;
    float _1799 = _1797 + 1.0;
    float _1801 = _1613 * _1789;
    float _1803 = fma(_571, _571, _1793);
    float _1805 = _1585 * _1771;
    float _1807 = _1723 * _1799;
    bool _1809 = !_1381;
    float _1811 = _1809 ? _1303 : as_type<float>(_1369);
    float _1813 = fma(_1663, _1425, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1815 = rsqrt(_1803);
    float _1817 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1303);
    float _1819 = _1599 * _1779;
    bool _1821 = !_1355;
    float _1823 = _1821 ? _1333 : as_type<float>(_1363);
    float _1825 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1333);
    float _1827 = -_1333;
    int _1829 = _1291 ? as_type<int>(_1827) : as_type<int>(_1333);
    float _1831 = _1491 * _1819;
    float _1833 = -_1333;
    int _1835 = _1321 ? as_type<int>(_1833) : as_type<int>(_1333);
    float _1837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1839 = _1497 * _1819;
    float _1841 = _1499 * _1819;
    float _1843 = -_1723;
    float _1845 = _1843 + 1.0;
    float _1847 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1295);
    float _1849 = _1319 * _1825;
    bool _1851 = !_1359;
    float _1853 = _1851 ? _1333 : as_type<float>(_1829);
    float _1855 = _1327 + 0.5;
    float _1857 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1859 = _1815 * _571;
    bool _1861 = !_1385;
    float _1863 = _1861 ? _1333 : as_type<float>(_1835);
    float _1865 = _1341 * _1817;
    float _1867 = _1815 * _567;
    float _1869 = _1823 + (-0.5);
    float _1871 = _1707 * _1845;
    float _1873 = -_1599;
    float _1875 = _1873 + 1.0;
    float _1877 = _1837 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1879 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1881 = _1549 * _1871;
    float _1883 = -_1853;
    float _1885 = _1883 + 0.5;
    float _1887 = fma(_1877, _1855, _1429);
    float _1889 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1891 = _1867 * _1889;
    float _1893 = _1811 + 0.5;
    float _1895 = -_1863;
    float _1897 = _1895 + 0.5;
    float _1899 = _1857 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1901 = _1815 * _569;
    float _1903 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1905 = _1859 * _1903;
    float _1907 = -_1441;
    float _1909 = fma(_1327, _1907, _1887);
    float _1911 = -_1899;
    float _1913 = -_1847;
    float _1915 = fma(_1911, _1869, _1913);
    float _1917 = -_1707;
    float _1919 = _1917 + 1.0;
    float _1921 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1923 = -_1905;
    float _1925 = fma(_1901, _1921, _1923);
    float _1927 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1929 = _1901 * _1927;
    float _1931 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1933 = -_1891;
    float _1935 = fma(_1859, _1931, _1933);
    float _1937 = fma(_1919, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1881);
    float _1939 = _1925 * _1925;
    float _1941 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1943 = -_1929;
    float _1945 = fma(_1867, _1941, _1943);
    float _1947 = fma(_1875, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1831);
    float _1949 = fma(_1561, _1807, _1937);
    float _1951 = fma(_1935, _1935, _1939);
    float _1953 = fma(_1875, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1839);
    float _1955 = fma(_1875, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1841);
    float _1957 = fma(_1509, _1801, _1947);
    float _1959 = fma(_1945, _1945, _1951);
    float _1961 = fma(_1535, _1801, _1953);
    float _1963 = fma(_1537, _1801, _1955);
    float _1965 = fma(_1547, _1753, _1957);
    float _1967 = rsqrt(_1959);
    float _1969 = fma(_1571, _1753, _1961);
    float _1971 = fma(_1813, _1753, _1963);
    float _1973 = fma(_1543, _1739, _1965);
    float _1975 = _1849 * _1867;
    float _1977 = fma(_1545, _1739, _1969);
    float _1979 = fma(_1555, _1739, _1971);
    float _1981 = fma(_1675, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1973);
    float _1983 = _1849 * _1901;
    float _1985 = fma(_1675, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1977);
    float _1987 = fma(_1675, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1979);
    float _1989 = fma(_1587, _1791, _1949);
    float _1991 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1993 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1995 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1419);
    float _1997 = fma(_1601, _1795, _1989);
    float _1999 = _1925 * _1967;
    float _2001 = _1945 * _1967;
    float _2003 = _1935 * _1967;
    float _2005 = _1849 * _1859;
    float _2007 = fma(_1865, _1999, _1975);
    float _2009 = _1867 * _2001;
    float _2011 = _1859 * _2003;
    float _2013 = fma(_1865, _2003, _1983);
    float _2015 = fma(_1865, _2001, _2005);
    float _2017 = -_2009;
    float _2019 = fma(_1859, _1999, _2017);
    float _2021 = -_2011;
    float _2023 = fma(_1901, _2001, _2021);
    float _2025 = _1901 * _1999;
    float _2027 = fma(_1573, _1781, _1997);
    float _2029 = fma(_1879, _2019, _2013);
    float _2031 = fma(_1879, _2023, _2007);
    float _2033 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2035 = -_2025;
    float _2037 = fma(_1867, _2003, _2035);
    float _2039 = fma(_1615, _1725, _2027);
    float _2041 = _2031 * _2031;
    float _2043 = fma(_1879, _2037, _2015);
    float _2045 = _1885 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2047 = fma(_2029, _2029, _2041);
    float _2049 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2051 = fma(_1767, _1805, _2039);
    float _2053 = _1893 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2055 = fma(_2043, _2043, _2047);
    float _2057 = _1981 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2059 = _1897 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2061 = _1985 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2063 = fma(_1691, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2051);
    float _2065 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2067 = _2045 * _2033;
    float _2069 = _1987 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2071 = _2053 * _1991;
    float _2073 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2075 = _2057 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2077 = _2061 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2079 = _2069 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2081 = sqrt(_2055);
    float _2083 = _2059 * _2049;
    out.m_42.x = _2063;
    float _2085 = _393 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2087 = -_1995;
    float _2089 = _2087 + 1.0;
    out.m_44.x = _2071;
    out.m_44.y = _2083;
    float _2091 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2085);
    float _2093 = _1993 * _2065;
    float _2095 = _393 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    out.m_46.x = _2075;
    out.m_46.y = _2077;
    out.m_46.z = _2079;
    out.m_46.w = _2073;
    float _2097 = _393 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2099 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2091);
    float _2101 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2095);
    float _2103 = fma(_1823, _2089, _1915);
    float _2105 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2097);
    bool _2107 = _2081 > 0.0;
    float _2109 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2101);
    float _2111 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2105);
    float _2113 = _2099 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2115 = _2109 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    out.m_48.x = _1909;
    out.m_48.y = _2103;
    out.m_48.z = _2093;
    out.m_48.w = _2067;
    float _2117 = _2111 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2119 = _2115 + _2029;
    float _2121 = _2113 + _2031;
    float _2123 = _2117 + _2043;
    bool _2125 = !_2107;
    float _2127 = _2113;
    float _2129 = _2117;
    float _2131 = _1803;
    float _2133 = _2121;
    float _2135 = _2119;
    float _2137 = _2123;
    if (!_2125)
    {
        bool _2139 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2141 = _2067;
        if (_2139)
        {
            float _2143 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2141 = _2143;
        }
        float _2145 = _2141;
        float _2147 = _2145;
        if (_2139)
        {
            float _2149 = _2145 * _569;
            _2127 = _2149;
        }
        float _2151 = _2127;
        float _2153 = _2151;
        if (_2139)
        {
            float _2155 = _2145 * _567;
            _2129 = _2155;
        }
        float _2157 = _2129;
        float _2159 = _2157;
        if (_2139)
        {
            float _2161 = _2145 * _571;
            _2147 = _2161;
        }
        float _2163 = _2147;
        float _2165 = _2163;
        float _2167 = _2163;
        if (!_2139)
        {
            float _2169 = _101 + 1.0;
            float _2171 = _2169;
            if (!_143)
            {
                float _2173 = _2169 * _2169;
                float _2175 = _2173 * 0.5;
                _2165 = _2175;
            }
            float _2177 = _2165;
            float _2179 = _2177;
            if (!_143)
            {
                float _2181 = _2177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2179 = _2181;
            }
            float _2183 = _2179;
            bool _2185 = !_143;
            float _2187 = _2183;
            if (!_2185)
            {
                float _2189 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2191 = log2(_2189);
                float _2193 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2195 = _2193 + 1.0;
                float _2197 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2199 = _2191 * _2169;
                float _2201 = 1.0 / _2195;
                float _2203 = _2197 * 0.693147182464599609375;
                float _2205 = exp2(_2199);
                float _2207 = 1.0 / _2203;
                float _2209 = _2205 + (-1.0);
                float _2211 = -_2209;
                float _2213 = fma(_2211, _2207, _2169);
                float _2215 = _2213 * _2201;
                float _2217 = _2215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2187 = _2217;
            }
            float _2219 = _2187;
            float _2221 = _2219 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2223 = _2219 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2225 = !_143;
            if (!_2225)
            {
                float _2227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2229 = log2(_2227);
                float _2231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2233 = _2231 + 1.0;
                float _2235 = 1.0 / _2233;
                float _2237 = _2229 * _2169;
                float _2239 = exp2(_2237);
                float _2241 = -_2239;
                float _2243 = _2241 + 1.0;
                float _2245 = _2243 * _2235;
                _2171 = _2245;
            }
            float _2247 = _2171;
            float _2249 = fma(_2247, _129, _2223);
            float _2251 = fma(_2247, _127, _2221);
            float _2253 = _2219 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2255 = -_323;
            float _2257 = _2255 + _2249;
            float _2259 = -_329;
            float _2261 = _2259 + _2251;
            float _2263 = fma(_2247, _131, _2253);
            float _2265 = _2257 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2267 = _2257 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2269 = -_337;
            float _2271 = _2269 + _2263;
            float _2273 = _2257 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2275 = fma(_2261, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2265);
            float _2277 = fma(_2261, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2267);
            float _2279 = fma(_2261, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2273);
            float _2281 = fma(_2271, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2275);
            float _2283 = fma(_2271, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2277);
            float _2285 = fma(_2271, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2279);
            float _2287 = _2281 * _2281;
            float _2289 = fma(_2283, _2283, _2287);
            float _2291 = fma(_2285, _2285, _2289);
            _2131 = _2291;
            _577 = _2281;
            _579 = _2283;
            _581 = _2285;
            _2153 = _2283;
            _2159 = _2281;
            _2167 = _2285;
        }
        float _2293 = _2131;
        float _2295 = _577;
        float _2297 = _579;
        float _2299 = _581;
        float _2301 = _2153;
        float _2303 = _2159;
        float _2305 = _2167;
        float _2307 = sqrt(_2293);
        float _2309 = rsqrt(_2055);
        bool _2311 = _2307 > 0.0;
        float _2313 = _2029 * _2309;
        float _2315 = _2031 * _2309;
        float _2317 = _2043 * _2309;
        bool _2319 = !_2311;
        if (!_2319)
        {
            float _2321 = rsqrt(_2293);
            float _2323 = _2321 * _2295;
            float _2325 = _2321 * _2297;
            float _2327 = _2321 * _2299;
            float _2329 = _2315 * _2323;
            float _2331 = fma(_2313, _2325, _2329);
            float _2333 = fma(_2317, _2327, _2331);
            float _2335 = _2333 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2337 = fma(_2301, _2335, _2119);
            float _2339 = fma(_2303, _2335, _2121);
            float _2341 = fma(_2305, _2335, _2123);
            _2133 = _2339;
            _2135 = _2337;
            _2137 = _2341;
        }
    }
    float _2343 = _2133;
    float _2345 = _2135;
    float _2347 = _2137;
    float _2349 = _2343 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2351 = _2343 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2353 = _2343 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2355 = _2343 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2357 = fma(_2345, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2349);
    float _2359 = fma(_2345, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2351);
    float _2361 = fma(_2345, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2353);
    float _2363 = fma(_2345, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2355);
    float _2365 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2357);
    float _2367 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2359);
    float _2369 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2361);
    float _2371 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2363);
    float _2373 = _2365 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2375 = _2367 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2377 = _2369 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2379 = _2371 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2381 = _2373 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2383 = _2373 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2385 = _2373 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2387 = _2373 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2389 = fma(_2375, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2381);
    float _2391 = fma(_2375, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2383);
    float _2393 = fma(_2375, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2385);
    float _2395 = fma(_2375, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2387);
    float _2397 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2389);
    float _2399 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2391);
    float _2401 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2393);
    float _2403 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2395);
    float _2405 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2397);
    float _2407 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2399);
    float _2409 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2401);
    float _2411 = fma(_2379, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2403);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _2407;
    out.gl_Position.y = _2405;
    out.gl_Position.z = _2409;
    out.gl_Position.w = _2411;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

