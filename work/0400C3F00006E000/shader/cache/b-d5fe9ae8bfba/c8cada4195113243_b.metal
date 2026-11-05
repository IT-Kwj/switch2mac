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
    float4 m_46 [[user(locn2)]];
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
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _705 = false;
    bool _599 = false;
    bool _449 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _62 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _1993 = as_type<float>(_83);
        out.gl_Position.z = _1993;
    }
    if (!_71)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _87 = in.m_35.w;
    bool _89 = _87 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _91 = isnan(_87);
    bool _93 = _89 || _91;
    bool _95 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _97 = _93 || _95;
    float _99 = -_87;
    float _101 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_97)
    {
        float _103 = float(_67);
        _77 = _103;
    }
    float _105 = _77;
    bool _107 = _101 >= _105;
    bool _109 = !_97;
    bool _111 = _107 || _109;
    float _113 = _105;
    if (_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (_111)
    {
        out.m_33.x = 0.0;
    }
    if (_111)
    {
        float _119 = _115 * 5.0;
        _85 = as_type<int>(_119);
    }
    int _121 = _85;
    if (_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2063 = as_type<float>(_121);
        out.gl_Position.z = _2063;
    }
    if (_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = in.m_35.x;
    float _125 = in.m_35.y;
    float _127 = in.m_35.z;
    float _129 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _131 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _133 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _135 = _131 || _133;
    bool _137 = isnan(1.0);
    bool _139 = _135 || _137;
    float _141 = 0.0;
    float _143 = _129;
    if (!_139)
    {
        float _145 = _129 * _129;
        float _147 = _145 * 0.5;
        _141 = _147;
    }
    float _149 = _141;
    float _151 = 0.0;
    float _153 = _149;
    if (!_139)
    {
        float _155 = _101 * _101;
        float _157 = _155 * 0.5;
        _151 = _157;
    }
    float _159 = _151;
    if (!_139)
    {
        float _161 = _149 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _153 = _161;
    }
    float _163 = _153;
    bool _165 = !_139;
    float _167 = _163;
    float _169 = 0.0;
    if (!_165)
    {
        float _171 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _173 = log2(_171);
        float _175 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _177 = _175 + 1.0;
        float _179 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _181 = _129 * _173;
        float _183 = 1.0 / _177;
        float _185 = _179 * 0.693147182464599609375;
        float _187 = exp2(_181);
        float _189 = 1.0 / _185;
        float _191 = _187 + (-1.0);
        float _193 = -_191;
        float _195 = fma(_193, _189, _129);
        float _197 = _195 * _183;
        float _199 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _167 = _199;
        _169 = _187;
        _117 = _189;
    }
    float _201 = _167;
    float _203 = _169;
    float _205 = _117;
    bool _207 = !_139;
    float _209 = _205;
    float _211 = _203;
    if (!_207)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = 1.0 / _219;
        float _223 = _129 * _215;
        float _225 = exp2(_223);
        float _227 = -_225;
        float _229 = _227 + 1.0;
        float _231 = _229 * _221;
        _209 = _219;
        _143 = _231;
    }
    float _233 = _209;
    float _235 = _143;
    float _237 = _233;
    if (!_139)
    {
        _237 = _101;
    }
    float _239 = _237;
    float _241 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _243 = _239;
    if (!_139)
    {
        float _245 = _159 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _245;
    }
    float _247 = _211;
    bool _249 = !_139;
    float _251 = _247;
    if (!_249)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = _101 * _255;
        float _265 = 1.0 / _259;
        float _267 = _261 * 0.693147182464599609375;
        float _269 = exp2(_263);
        float _271 = 1.0 / _267;
        float _273 = _269 + (-1.0);
        float _275 = -_273;
        float _277 = fma(_275, _271, _101);
        float _279 = _277 * _265;
        float _281 = _279 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _251 = _281;
    }
    float _283 = _251;
    bool _285 = !_139;
    if (!_285)
    {
        float _287 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _289 = log2(_287);
        float _291 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _293 = _291 + 1.0;
        float _295 = 1.0 / _293;
        float _297 = _101 * _289;
        float _299 = exp2(_297);
        float _301 = -_299;
        float _303 = _301 + 1.0;
        float _305 = _303 * _295;
        _243 = _305;
    }
    float _307 = _243;
    float _309 = _283 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _311 = fma(_235, _125, _241);
    float _313 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _315 = _283 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _317 = fma(_307, _125, _309);
    float _319 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _321 = _283 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _323 = fma(_235, _123, _313);
    float _325 = fma(_307, _123, _315);
    float _327 = -_317;
    float _329 = _311 + _327;
    float _331 = fma(_235, _127, _319);
    float _333 = fma(_307, _127, _321);
    float _335 = -_325;
    float _337 = _323 + _335;
    float _339 = _329 * _329;
    float _341 = in.m_37.w;
    float _343 = -_333;
    float _345 = _331 + _343;
    float _347 = _329 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _349 = fma(_337, _337, _339);
    float _351 = _329 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _353 = _329 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _355 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[4].x, _347);
    float _357 = fma(_345, _345, _349);
    float _359 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[5].x, _351);
    float _361 = in.m_30.x;
    float _363 = in.m_30.y;
    float _365 = in.m_30.z;
    float _367 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[6].x, _353);
    float _369 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[4].z, _355);
    float _371 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[5].z, _359);
    float _373 = sqrt(_357);
    float _375 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[6].z, _367);
    bool _377 = _373 >= 9.9999999747524270787835121154785e-07;
    bool _379 = isnan(_373);
    bool _381 = _377 || _379;
    bool _383 = isnan(9.9999999747524270787835121154785e-07);
    bool _385 = _381 || _383;
    float _387 = fma(_323, _341, _361);
    float _389 = fma(_311, _341, _363);
    float _391 = fma(_331, _341, _365);
    float _393 = _367;
    float _395 = _341;
    float _397 = _369;
    if (_385)
    {
        _393 = _369;
    }
    float _399 = _393;
    float _401 = _399;
    if (_385)
    {
        _395 = _371;
    }
    float _403 = _395;
    float _405 = _403;
    if (_385)
    {
        _397 = _375;
    }
    float _407 = _397;
    float _409 = _407;
    if (!_385)
    {
        bool _411 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _413 = !_411;
        if (!_413)
        {
            float _415 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _417 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _419 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _421 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _415);
            float _423 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _417);
            float _425 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _419);
            float _427 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _421);
            float _429 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _423);
            float _431 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _425);
            float _433 = _427 * _427;
            float _435 = fma(_429, _429, _433);
            float _437 = fma(_431, _431, _435);
            float _439 = rsqrt(_437);
            float _441 = _439 * 9.9999999747524270787835121154785e-07;
            float _443 = _429 * _441;
            float _445 = _427 * _441;
            float _447 = _431 * _441;
            _405 = _445;
            _401 = _443;
            _409 = _447;
            _449 = true;
        }
        else
        {
            float _451 = _125 * _125;
            float _453 = fma(_123, _123, _451);
            float _455 = fma(_127, _127, _453);
            float _457 = sqrt(_455);
            bool _459 = _457 >= 9.9999999747524270787835121154785e-07;
            bool _461 = isnan(_457);
            bool _463 = _459 || _461;
            bool _465 = isnan(9.9999999747524270787835121154785e-07);
            bool _467 = _463 || _465;
            if (!_467)
            {
                float _469 = _363 * _363;
                float _471 = fma(_361, _361, _469);
                float _473 = fma(_365, _365, _471);
                float _475 = sqrt(_473);
                bool _477 = _475 >= 9.9999999747524270787835121154785e-07;
                bool _479 = isnan(_475);
                bool _481 = _477 || _479;
                bool _483 = isnan(9.9999999747524270787835121154785e-07);
                bool _485 = _481 || _483;
                if (!_485)
                {
                    float _487 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _489 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _487);
                    float _491 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _489);
                    float _493 = rsqrt(_491);
                    float _495 = _493 * 9.9999999747524270787835121154785e-07;
                    float _497 = _495 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _499 = _495 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _501 = _495 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _405 = _499;
                    _401 = _497;
                    _409 = _501;
                    _449 = true;
                }
                else
                {
                    float _503 = _363 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _505 = _363 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _507 = _363 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _509 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[5].x, _503);
                    float _511 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[4].x, _505);
                    float _513 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[6].x, _507);
                    float _515 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].z, _509);
                    float _517 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].z, _511);
                    float _519 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].z, _513);
                    float _521 = _515 * _515;
                    float _523 = fma(_517, _517, _521);
                    float _525 = fma(_519, _519, _523);
                    float _527 = rsqrt(_525);
                    float _529 = _527 * 9.9999999747524270787835121154785e-07;
                    float _531 = _517 * _529;
                    float _533 = _515 * _529;
                    float _535 = _519 * _529;
                    _405 = _533;
                    _401 = _531;
                    _409 = _535;
                    _449 = true;
                }
            }
            else
            {
                float _537 = _125 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _539 = _125 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _541 = _125 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _543 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[5].x, _537);
                float _545 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[4].x, _539);
                float _547 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[6].x, _541);
                float _549 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[5].z, _543);
                float _551 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[4].z, _545);
                float _553 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[6].z, _547);
                float _555 = _549 * _549;
                float _557 = fma(_551, _551, _555);
                float _559 = fma(_553, _553, _557);
                float _561 = rsqrt(_559);
                float _563 = _561 * 9.9999999747524270787835121154785e-07;
                float _565 = _551 * _563;
                float _567 = _549 * _563;
                float _569 = _553 * _563;
                _405 = _567;
                _401 = _565;
                _409 = _569;
            }
        }
    }
    _449 = false;
    float _571 = _405;
    float _573 = _401;
    float _575 = _409;
    bool _577 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _579 = !_577;
    float _597;
    if (!_579)
    {
        float _581 = in.m_39.x;
        float _583 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _585 = _581 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _587 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[12].x, _101);
        float _589 = _587 * _583;
        float _591 = floor(_589);
        float _593 = -_591;
        float _595 = _589 + _593;
        _597 = _595;
        _599 = true;
    }
    else
    {
        float _601 = float(_67);
        float _603 = 1.0 / _601;
        float _605 = _101 * _603;
        _597 = _605;
    }
    _599 = false;
    float _607 = _597;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _611 = _607 + _609;
    bool _613 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _615 = isnan(_607);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _625;
    float _629 = -_623;
    float _631 = _629 + 1.0;
    bool _633 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _635 = isnan(_607);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _645;
    bool _649 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _651 = 1.0 / _627;
    float _653 = _643 * _631;
    float _655 = -_643;
    float _657 = _655 + 1.0;
    float _659 = _611 * _651;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _661;
    float _665 = fma(_647, _659, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _667 = fma(_663, _659, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _669 = _665 * _653;
    float _671 = _667 * _653;
    float _673 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[143].x, _669);
    float _675 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[143].y, _671);
    float _677 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[144].x, _673);
    float _679 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[144].y, _675);
    bool _681 = !_649;
    float _701;
    float _703;
    if (!_681)
    {
        float _683 = in.m_39.x;
        float _685 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _687 = float(_67);
        float _689 = _683 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[11].y, _101);
        float _693 = _691 * _685;
        float _695 = floor(_693);
        float _697 = -_695;
        float _699 = _693 + _697;
        _701 = _687;
        _703 = _699;
        _705 = true;
    }
    else
    {
        float _707 = float(_67);
        float _709 = 1.0 / _707;
        float _711 = _101 * _709;
        _701 = _707;
        _703 = _711;
    }
    _705 = false;
    float _713 = _701;
    float _715 = _703;
    float _717 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _719 = int(_717);
    float _721 = in.m_39.x;
    float _723 = _389 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _727 = _725 != 0;
    float _729 = as_type<float>(int(gl_VertexIndex));
    float _731 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _733 = int(_731);
    bool _735 = !_727;
    float _737 = _735 ? 1.2345600128173828125 : 1.0;
    float _739 = _389 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _741 = _389 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _743 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _723);
    float _745 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _739);
    float _747 = float(_719);
    float _749 = 1.0 / _713;
    float _751 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _741);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _753;
    float _757 = float(uint(_733));
    float _759 = 1.0 / _747;
    int _761 = ~_733;
    int _763 = _761 + 1;
    float _765 = 1.0 / _757;
    float _767 = _101 * _759;
    float _769 = _759;
    float _771 = _747;
    if (!_727)
    {
        float _773 = in.m_39.y;
        _769 = _773;
    }
    float _775 = _769;
    float _777 = trunc(_767);
    int _779 = int(_777);
    int _781 = as_type<int>(_765) + (-2);
    int _783 = ~_733;
    int _785 = _783 + 1;
    float _787 = float(uint(_779));
    if (!_727)
    {
        _771 = _775;
    }
    float _789 = _771;
    float _791 = as_type<float>(_781) * _787;
    float _793 = trunc(_791);
    float _795 = precise::max(_793, 0.0);
    uint _798 = uint(_795);
    float _800 = _789;
    int _802 = as_type<int>(_775);
    if (_727)
    {
        float _804 = in.m_39.x;
        float _806 = in.m_39.y;
        _800 = _804;
        _802 = as_type<int>(_806);
    }
    float _808 = _800;
    int _810 = _802;
    float _812 = float(_779);
    int _814 = _785 * int(_798);
    int _816 = _814 + _779;
    float _818 = float(uint(_816));
    float _820 = as_type<float>(_781) * _818;
    bool _822 = !_727;
    float _824 = _822 ? as_type<float>(_810) : _721;
    int _826 = ~_733;
    int _828 = _826 + 1;
    float _830 = trunc(_820);
    float _832 = precise::max(_830, 0.0);
    uint _834 = uint(_832);
    float _836 = _824 * _737;
    float _838 = float(_733);
    float _840 = _101 * _838;
    int _842 = int(_798) + int(_834);
    float _844 = floor(_836);
    bool _846 = _812 >= _838;
    bool _848 = isnan(_812);
    bool _850 = _846 || _848;
    bool _852 = isnan(_838);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    int _858 = _828 * _842;
    int _860 = _858 + _779;
    bool _862 = uint(_860) >= uint(_733);
    float _864 = trunc(_856);
    int _866 = int(_864);
    bool _868 = !_862;
    int _870 = _868 ? 0 : (-1);
    int _872 = as_type<int>(_729) & 1;
    bool _874 = _872 != 0;
    int _876 = as_type<int>(_729) & 2;
    bool _878 = _876 != 0;
    int _880 = ~_842;
    int _882 = _880 + _870;
    int _884 = _882 + 1;
    float _886 = -_844;
    float _888 = _836 + _886;
    bool _890 = _733 == 0;
    int _892 = _733 * _884;
    int _894 = _892 + _779;
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _898 = _896 != 0;
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _902 = _900 != 0;
    float _904 = _838 * _888;
    bool _906 = !_874;
    float _908 = _906 ? (-0.5) : 0.5;
    bool _910 = !_878;
    float _912 = _910 ? (-0.5) : 0.5;
    float _914 = trunc(_904);
    int _916 = int(_914);
    int _918 = ~_866;
    int _920 = _918 + 1;
    int _922 = _920 + 1;
    bool _924 = !_890;
    int _926 = _924 ? _894 : (-1);
    int _928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _930 = _928 != 0;
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _934 = _932 != 0;
    float _936 = _840 * _749;
    int _938 = _922 * _926;
    int _940 = _733 + (-1);
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _944 = _942 != 0;
    float _946 = trunc(_936);
    int _948 = int(_946);
    bool _950 = !_934;
    int _952 = _950 ? 0 : 1;
    int _954 = _866 * _940;
    int _956 = _954 + _938;
    bool _958 = !_930;
    int _960 = _958 ? 0 : 1;
    bool _962 = !_944;
    int _964 = _962 ? 0 : 1;
    int _966 = abs(_952);
    bool _968 = !_898;
    int _970 = _968 ? 0 : 1;
    int _972 = abs(_960);
    int _974 = _956 * _966;
    int _976 = abs(_964);
    bool _978 = !_902;
    int _980 = _978 ? 0 : 1;
    int _982 = abs(_970);
    int _984 = _916 * _976;
    int _986 = _984 + _779;
    int _988 = abs(_980);
    int _990 = _948 * _972;
    int _992 = _990 + _974;
    int _994 = ~_733;
    int _996 = _994 + 1;
    int _998 = _986 * _982;
    int _1000 = _998 + _992;
    int _1002 = ~_733;
    int _1004 = _1002 + 1;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1008 = _1006 != 0;
    int _1010 = _916 * _988;
    int _1012 = _1010 + _1000;
    float _1014 = float(uint(_1012));
    float _1016 = as_type<float>(_781) * _1014;
    float _1018 = trunc(_1016);
    float _1020 = precise::max(_1018, 0.0);
    uint _1022 = uint(_1020);
    int _1024 = _996 * int(_1022);
    int _1026 = _1024 + _1012;
    float _1028 = float(uint(_1026));
    float _1030 = as_type<float>(_781) * _1028;
    float _1032 = trunc(_1030);
    float _1034 = precise::max(_1032, 0.0);
    uint _1036 = uint(_1034);
    int _1038 = int(_1022) + int(_1036);
    float _1040 = float(uint(_986));
    int _1042 = _1004 * _1038;
    int _1044 = _1042 + _1012;
    float _1046 = as_type<float>(_781) * _1040;
    bool _1048 = uint(_1044) >= uint(_733);
    float _1050 = in.m_37.x;
    float _1052 = in.m_37.y;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1056 = _1054 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1058 = !_1048;
    int _1060 = _1058 ? 0 : (-1);
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1064 = _1062 != 0;
    float _1066 = 1.0 / _1056;
    int _1068 = ~_1038;
    int _1070 = _1068 + _1060;
    int _1072 = _1070 + 1;
    float _1074 = in.m_39.w;
    int _1076 = _733 * _1072;
    int _1078 = _1076 + _1012;
    bool _1080 = !_890;
    int _1082 = _1080 ? _1078 : (-1);
    int _1084 = _1082 & 3;
    bool _1086 = _1084 != 0;
    int _1088 = _1082 >> 31;
    bool _1090 = uint(_1084) >= 2u;
    float _1092 = _679 * _1052;
    bool _1094 = _1084 != 3;
    float _1096 = _677 * _1050;
    int _1098 = _1088 & 3;
    float _1100 = _755 * _1066;
    int _1102 = _1090 ? 0 : 1;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1106 = _715 + _1104;
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1110 = _1108 != 0;
    float _1112 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].z, _745);
    int _1114 = _1082 + _1098;
    float _1116 = fma(_1100, _1106, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1118 = trunc(_1046);
    float _1120 = precise::max(_1118, 0.0);
    uint _1122 = uint(_1120);
    int _1124 = ~_1102;
    int _1126 = _1124 + 1;
    int _1128 = _1126 + 1;
    float _1130 = _1096 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1132 = _1114 >> 2;
    float _1134 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1136 = _1128;
    if (_1094)
    {
        int _1138 = ~_1102;
        int _1140 = _1138 + 1;
        _1136 = _1140;
    }
    int _1142 = _1136;
    int _1144 = _1132 << 4;
    int _1146 = _1144 + 512;
    int _1148 = _1086 ? 0 : 1;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1152 = _1150 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1154 = _1074 > 0.5;
    uint _1156 = uint(int(uint(_1146) >> uint(2)));
    uint _1158 = uint(int(uint(int(_1156)) >> uint(2)));
    int _1160 = int(_1156) & 3;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[int(_1158)][_1160];
    int _1164 = int(_1156) + 1;
    uint _1166 = uint(int(uint(_1164) >> uint(2)));
    int _1168 = _1164 & 3;
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[int(_1166)][_1168];
    bool _1172 = uint(_1084) > 1u;
    int _1174 = _763 * int(_1122);
    int _1176 = _1174 + _986;
    float _1178 = 1.0 / _1152;
    float _1180 = float(uint(_1176));
    int _1182 = ~_1148;
    int _1184 = _1182 + 1;
    int _1186 = _1184 + 1;
    float _1188 = as_type<float>(_781) * _1180;
    int _1190 = _1186;
    if (!_1172)
    {
        int _1192 = ~_1148;
        int _1194 = _1192 + 1;
        _1190 = _1194;
    }
    int _1196 = _1190;
    int _1198 = _1146 + 8;
    uint _1200 = uint(int(uint(_1198) >> uint(2)));
    uint _1202 = uint(int(uint(int(_1200)) >> uint(2)));
    int _1204 = int(_1200) & 3;
    float _1206 = (*spvDescriptorSet0.vp_c9)._m0[int(_1202)][_1204];
    int _1208 = int(_1200) + 1;
    uint _1210 = uint(int(uint(_1208) >> uint(2)));
    int _1212 = _1208 & 3;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[int(_1210)][_1212];
    int _1216 = _1082 & 3;
    bool _1218 = _1216 != 0;
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1222 = _1220 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1224 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].z, _743);
    float _1226 = trunc(_1188);
    float _1228 = precise::max(_1226, 0.0);
    uint _1230 = uint(_1228);
    float _1232 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].z, _751);
    bool _1234 = !_1218;
    int _1236 = _1234 ? 0 : 1;
    float _1238 = _1222 * _1178;
    int _1240 = abs(_1196);
    float _1242 = _1232 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1244 = ~_733;
    int _1246 = _1244 + 1;
    int _1248 = ~_1240;
    int _1250 = _1248 + 1;
    int _1252 = _1250 + 1;
    bool _1254 = _1084 != 3;
    int _1256 = int(_1122) + int(_1230);
    int _1258 = abs(_1236);
    float _1260 = _571 * _571;
    int _1262 = _1246 * _1256;
    int _1264 = _1262 + _986;
    int _1266 = ~_1258;
    int _1268 = _1266 + 1;
    int _1270 = _1268 + 1;
    float _1272 = fma(_573, _573, _1260);
    int _1274 = _1252 * as_type<int>(_1170);
    float _1276 = fma(_575, _575, _1272);
    bool _1278 = !_1254;
    int _1280 = _1278 ? 0 : (-1);
    bool _1282 = uint(_1264) >= uint(_733);
    float _1284 = rsqrt(_1276);
    int _1286 = abs(_1142);
    int _1288 = _1270 * as_type<int>(_1162);
    int _1290 = _1288 + _1274;
    int _1292 = abs(_1280);
    float _1294 = in.m_39.z;
    int _1296 = ~_1286;
    int _1298 = _1296 + 1;
    int _1300 = _1298 + 1;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1304 = _715 + _1302;
    bool _1306 = !_1110;
    int _1308 = _1306 ? 0 : 1;
    float _1310 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1312 = int(_1310);
    int _1314 = ~_1292;
    int _1316 = _1314 + 1;
    int _1318 = _1316 + 1;
    int _1320 = _1300 * as_type<int>(_1206);
    int _1322 = _1320 + _1290;
    int _1324 = abs(_1308);
    float _1326 = fma(_1238, _1304, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1328 = !_1282;
    int _1330 = _1328 ? 0 : (-1);
    int _1332 = _1318 * as_type<int>(_1214);
    int _1334 = _1332 + _1322;
    int _1336 = ~_1324;
    int _1338 = _1336 + 1;
    int _1340 = _1338 + 1;
    float _1342 = _1284 * _575;
    float _1344 = _1284 * _571;
    float _1346 = _1284 * _573;
    int _1348 = ~_1256;
    int _1350 = _1348 + _1330;
    int _1352 = _1350 + 1;
    float _1354 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1356 = _1342 * _1354;
    float _1358 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1360 = _1344 * _1358;
    int _1362 = _1340 * _1334;
    bool _1364 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1366 = isnan(_715);
    bool _1368 = _1364 || _1366;
    bool _1370 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1372 = _1368 || _1370;
    float _1374 = float(_1372);
    float _1376 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1378 = -_1356;
    float _1380 = fma(_1346, _1376, _1378);
    int _1382 = abs(_1312);
    float _1384 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1386 = -_1360;
    float _1388 = fma(_1342, _1384, _1386);
    float _1390 = float(uint(_1312));
    float _1392 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1394 = _1346 * _1392;
    float _1396 = _1380 * _1380;
    float _1398 = float(uint(_1382));
    float _1400 = 1.0 / _1390;
    bool _1402 = _1294 > 0.5;
    int _1404 = _733 * _1352;
    int _1406 = _1404 + _986;
    float _1408 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1410 = -_1394;
    float _1412 = fma(_1344, _1408, _1410);
    float _1414 = fma(_1388, _1388, _1396);
    bool _1416 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1418 = isnan(_715);
    bool _1420 = _1416 || _1418;
    bool _1422 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1424 = _1420 || _1422;
    float _1426 = float(_1424);
    float _1428 = -_1374;
    float _1430 = _1428 + 1.0;
    bool _1432 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1434 = isnan(_715);
    bool _1436 = _1432 || _1434;
    bool _1438 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1440 = _1436 || _1438;
    float _1442 = float(_1440);
    float _1444 = 1.0 / _1398;
    float _1446 = -_908;
    int _1448 = _1402 ? as_type<int>(_1446) : as_type<int>(_908);
    float _1450 = fma(_1412, _1412, _1414);
    float _1452 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _908);
    bool _1454 = !_890;
    int _1456 = _1454 ? _1406 : (-1);
    float _1458 = _1442 * _1430;
    bool _1460 = !_1064;
    float _1462 = _1460 ? _908 : as_type<float>(_1448);
    float _1464 = -_1442;
    float _1466 = _1464 + 1.0;
    float _1468 = _1130 * _1452;
    float _1470 = -_912;
    int _1472 = _1154 ? as_type<int>(_1470) : as_type<int>(_912);
    int _1474 = _1456 * _1324;
    int _1476 = _1474 + _1362;
    float _1478 = _1426 * _1466;
    float _1480 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _912);
    bool _1482 = !_1008;
    float _1484 = _1482 ? _912 : as_type<float>(_1472);
    float _1486 = rsqrt(_1450);
    int _1488 = as_type<int>(_1400) + (-2);
    float _1490 = _1134 * _1480;
    float _1492 = float(uint(_1476));
    float _1494 = _1116 * _1478;
    int _1496 = abs(_1476);
    float _1498 = _1490 * _1346;
    float _1500 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1502 = as_type<float>(_1488) * _1492;
    int _1504 = as_type<int>(_1444) + (-2);
    float _1506 = float(uint(_1496));
    int _1508 = ~_1312;
    int _1510 = _1508 + 1;
    float _1512 = trunc(_1502);
    float _1514 = precise::max(_1512, 0.0);
    uint _1516 = uint(_1514);
    int _1518 = ~_1382;
    int _1520 = _1518 + 1;
    float _1522 = as_type<float>(_1504) * _1506;
    float _1524 = _1380 * _1486;
    float _1526 = _1412 * _1486;
    float _1528 = _1388 * _1486;
    float _1530 = _1490 * _1342;
    float _1532 = _1346 * _1524;
    float _1534 = trunc(_1522);
    float _1536 = precise::max(_1534, 0.0);
    uint _1538 = uint(_1536);
    float _1540 = _1344 * _1526;
    float _1542 = fma(_1468, _1526, _1530);
    float _1544 = -_1532;
    float _1546 = fma(_1344, _1528, _1544);
    float _1548 = fma(_1468, _1528, _1498);
    float _1550 = -_1540;
    float _1552 = fma(_1342, _1524, _1550);
    float _1554 = _1412;
    float _1556 = _1294;
    float _1558 = as_type<float>(_1496);
    if (!_727)
    {
        _1554 = _1294;
    }
    float _1560 = _1554;
    float _1562 = fma(_1500, _1546, _1542);
    int _1564 = _1510 * int(_1516);
    int _1566 = _1564 + _1476;
    float _1568 = _1560;
    if (_727)
    {
        _1568 = as_type<float>(_810);
    }
    float _1570 = _1568;
    float _1572 = fma(_1500, _1552, _1548);
    if (_727)
    {
        _1556 = as_type<float>(_810);
    }
    float _1574 = _1556;
    float _1576 = _1224 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1578 = float(uint(_1566));
    float _1580 = _1242 + _1562;
    int _1582 = _1520 * int(_1538);
    int _1584 = _1582 + _1496;
    float _1586 = _1576 + _1572;
    float _1588 = as_type<float>(_1488) * _1578;
    float _1590 = _1490 * _1344;
    float _1592 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1594 = float(uint(_1584));
    float _1596 = _808 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1598 = trunc(_1588);
    float _1600 = precise::max(_1598, 0.0);
    uint _1602 = uint(_1600);
    float _1604 = _1342 * _1528;
    float _1606 = as_type<float>(_1504) * _1594;
    float _1608 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1592);
    float _1610 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1612 = _1580 + _1610;
    float _1614 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1616 = _1586 + _1614;
    float _1618 = -_1426;
    float _1620 = _1618 + 1.0;
    float _1622 = trunc(_1606);
    float _1624 = precise::max(_1622, 0.0);
    uint _1626 = uint(_1624);
    float _1628 = _1612 * _1612;
    float _1630 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1632 = fma(_1620, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1494);
    float _1634 = fma(_1616, _1616, _1628);
    float _1636 = _1570 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1638 = -_1630;
    float _1640 = fma(_1596, 2.0, _1638);
    float _1642 = fma(_1326, _1458, _1632);
    float _1644 = sqrt(_1634);
    float _1646 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1648 = fma(_1468, _1524, _1590);
    int _1650 = int(_1516) + int(_1602);
    float _1652 = -_1604;
    float _1654 = fma(_1346, _1526, _1652);
    int _1656 = ~_1312;
    int _1658 = _1656 + 1;
    float _1660 = fma(_1636, -2.0, _1646);
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1666 = fma(_1500, _1654, _1648);
    float _1668 = _1112 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1670 = _1658 * _1650;
    int _1672 = _1670 + _1476;
    float _1674 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1642);
    int _1676 = int(_1538) + int(_1626);
    float _1678 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1662);
    bool _1680 = _1644 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1682 = _1668 + _1666;
    int _1684 = ~_1382;
    int _1686 = _1684 + 1;
    float _1688 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1608);
    bool _1690 = uint(_1672) >= uint(_1312);
    float _1692 = -_101;
    float _1694 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1640);
    float _1696 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1678);
    int _1698 = _1686 * _1676;
    int _1700 = _1698 + _1496;
    float _1702 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1660);
    bool _1704 = !_1690;
    int _1706 = _1704 ? 0 : (-1);
    float _1708 = _1586;
    float _1710 = _1580;
    if (!_1680)
    {
        _1558 = _1586;
    }
    float _1712 = _1558;
    float _1714 = _1712;
    if (!_1680)
    {
        _1708 = _1682;
    }
    float _1716 = _1708;
    bool _1718 = !_1680;
    float _1720 = _1716;
    if (!_1718)
    {
        float _1722 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1724 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1726 = _1644 + _1724;
        float _1728 = _1682 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1730 = rsqrt(_1634);
        float _1732 = _1726 * _1722;
        float _1734 = _1732 * 0.15915493667125701904296875;
        float _1736 = _1734 * 6.283185482025146484375;
        float _1738 = sin(_1736);
        float _1740 = _1734 * 6.283185482025146484375;
        float _1742 = cos(_1740);
        float _1744 = fma(_1738, _1728, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1746 = _1730 * _1744;
        float _1748 = _1742 + (-1.0);
        float _1750 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1752 = fma(_1616, _1746, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1754 = fma(_1612, _1746, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1756 = fma(_1682, _1742, _1750);
        _1720 = _1756;
        _1714 = _1752;
        _1710 = _1754;
    }
    float _1758 = _1720;
    float _1760 = _1714;
    float _1762 = _1710;
    int _1764 = ~_1650;
    int _1766 = _1764 + _1706;
    int _1768 = _1766 + 1;
    float _1770 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _1772 = uint(_1700) >= uint(_1382);
    float _1774 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _1776 = _1476 ^ _1312;
    float _1778 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1780 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1782 = !_1772;
    int _1784 = _1782 ? 0 : (-1);
    int _1786 = _1312 * _1768;
    int _1788 = _1786 + _1476;
    uint _1790 = uint(int(uint(_1776) >> uint(31)));
    float _1792 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1794 = _1312 == 0;
    float _1796 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1774);
    bool _1798 = _1312 == 0;
    float _1800 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1770);
    int _1802 = ~_1784;
    int _1804 = _1676 + _1802;
    int _1806 = _1804 + 1;
    float _1808 = _1664 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _1810 = ~int(_1790);
    int _1812 = _1810 + 1;
    float _1814 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1796);
    bool _1816 = !_1794;
    int _1818 = _1816 ? _1788 : (-1);
    float _1820 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1778);
    int _1822 = _1806 ^ _1812;
    float _1824 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1800);
    float _1826 = float(_1818);
    float _1828 = _1814 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _1830 = ~_1812;
    int _1832 = _1830 + _1822;
    int _1834 = _1832 + 1;
    float _1836 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1780);
    float _1838 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1820);
    float _1840 = fma(_1808, _1826, _1694);
    bool _1842 = !_1798;
    int _1844 = _1842 ? _1834 : (-1);
    float _1846 = _1824 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1848 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1850 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1852 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1854 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1856 = float(_1844);
    float _1858 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1860 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1836);
    float _1862 = _1462 + 0.5;
    float _1864 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1848);
    float _1866 = _1838 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1868 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1852);
    float _1870 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1854);
    float _1872 = -_1702;
    float _1874 = fma(_1858, _1856, _1872);
    float _1876 = fma(_1808, _1862, _1840);
    float _1878 = _1484 + (-0.5);
    float _1880 = -_1688;
    float _1882 = _1880 + 1.0;
    float _1884 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1864);
    float _1886 = _1860 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1888 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1868);
    float _1890 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1870);
    float _1892 = -_1858;
    float _1894 = fma(_1892, _1878, _1874);
    float _1896 = -_1882;
    float _1898 = fma(_1462, _1896, _1876);
    float _1900 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1884);
    float _1902 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1850);
    float _1904 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1888);
    float _1906 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1890);
    float _1908 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1902);
    float _1910 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1912 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1914 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1916 = -_1696;
    float _1918 = _1916 + 1.0;
    float _1920 = _1904 + _1906;
    float _1922 = _1674 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1924 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1908);
    float _1926 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1928 = _1910 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1930 = _1912 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1932 = _1914 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1934 = _1920 * 0.5;
    float _1936 = fma(_1484, _1918, _1894);
    out.m_33.x = _1926;
    out.m_44.x = _1928;
    out.m_44.y = _1930;
    out.m_44.z = _1932;
    out.m_44.w = _1922;
    out.gl_Position.x = _1900;
    out.gl_Position.y = _1924;
    out.gl_Position.z = _1904;
    out.gl_Position.w = _1906;
    out.m_46.z = _1934;
    out.m_46.w = _1906;
    out.m_48.z = _1898;
    out.m_48.w = _1936;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _705 = false;
    bool _599 = false;
    bool _449 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _62 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _1993 = as_type<float>(_83);
        out.gl_Position.z = _1993;
    }
    if (!_71)
    {
        return out;
    }
    float _87 = in.m_35.w;
    bool _89 = _87 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _91 = isnan(_87);
    bool _93 = _89 || _91;
    bool _95 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _97 = _93 || _95;
    float _99 = -_87;
    float _101 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_97)
    {
        float _103 = float(_67);
        _77 = _103;
    }
    float _105 = _77;
    bool _107 = _101 >= _105;
    bool _109 = !_97;
    bool _111 = _107 || _109;
    float _113 = _105;
    if (_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (_111)
    {
        out.m_33.x = 0.0;
    }
    if (_111)
    {
        float _119 = _115 * 5.0;
        _85 = as_type<int>(_119);
    }
    int _121 = _85;
    if (_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2063 = as_type<float>(_121);
        out.gl_Position.z = _2063;
    }
    if (_111)
    {
        return out;
    }
    float _123 = in.m_35.x;
    float _125 = in.m_35.y;
    float _127 = in.m_35.z;
    float _129 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _131 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _133 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _135 = _131 || _133;
    bool _137 = isnan(1.0);
    bool _139 = _135 || _137;
    float _141 = 0.0;
    float _143 = _129;
    if (!_139)
    {
        float _145 = _129 * _129;
        float _147 = _145 * 0.5;
        _141 = _147;
    }
    float _149 = _141;
    float _151 = 0.0;
    float _153 = _149;
    if (!_139)
    {
        float _155 = _101 * _101;
        float _157 = _155 * 0.5;
        _151 = _157;
    }
    float _159 = _151;
    if (!_139)
    {
        float _161 = _149 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _153 = _161;
    }
    float _163 = _153;
    bool _165 = !_139;
    float _167 = _163;
    float _169 = 0.0;
    if (!_165)
    {
        float _171 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _173 = log2(_171);
        float _175 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _177 = _175 + 1.0;
        float _179 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _181 = _129 * _173;
        float _183 = 1.0 / _177;
        float _185 = _179 * 0.693147182464599609375;
        float _187 = exp2(_181);
        float _189 = 1.0 / _185;
        float _191 = _187 + (-1.0);
        float _193 = -_191;
        float _195 = fma(_193, _189, _129);
        float _197 = _195 * _183;
        float _199 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _167 = _199;
        _169 = _187;
        _117 = _189;
    }
    float _201 = _167;
    float _203 = _169;
    float _205 = _117;
    bool _207 = !_139;
    float _209 = _205;
    float _211 = _203;
    if (!_207)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = 1.0 / _219;
        float _223 = _129 * _215;
        float _225 = exp2(_223);
        float _227 = -_225;
        float _229 = _227 + 1.0;
        float _231 = _229 * _221;
        _209 = _219;
        _143 = _231;
    }
    float _233 = _209;
    float _235 = _143;
    float _237 = _233;
    if (!_139)
    {
        _237 = _101;
    }
    float _239 = _237;
    float _241 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _243 = _239;
    if (!_139)
    {
        float _245 = _159 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _245;
    }
    float _247 = _211;
    bool _249 = !_139;
    float _251 = _247;
    if (!_249)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = _101 * _255;
        float _265 = 1.0 / _259;
        float _267 = _261 * 0.693147182464599609375;
        float _269 = exp2(_263);
        float _271 = 1.0 / _267;
        float _273 = _269 + (-1.0);
        float _275 = -_273;
        float _277 = fma(_275, _271, _101);
        float _279 = _277 * _265;
        float _281 = _279 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _251 = _281;
    }
    float _283 = _251;
    bool _285 = !_139;
    if (!_285)
    {
        float _287 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _289 = log2(_287);
        float _291 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _293 = _291 + 1.0;
        float _295 = 1.0 / _293;
        float _297 = _101 * _289;
        float _299 = exp2(_297);
        float _301 = -_299;
        float _303 = _301 + 1.0;
        float _305 = _303 * _295;
        _243 = _305;
    }
    float _307 = _243;
    float _309 = _283 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _311 = fma(_235, _125, _241);
    float _313 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _315 = _283 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _317 = fma(_307, _125, _309);
    float _319 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _321 = _283 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _323 = fma(_235, _123, _313);
    float _325 = fma(_307, _123, _315);
    float _327 = -_317;
    float _329 = _311 + _327;
    float _331 = fma(_235, _127, _319);
    float _333 = fma(_307, _127, _321);
    float _335 = -_325;
    float _337 = _323 + _335;
    float _339 = _329 * _329;
    float _341 = in.m_37.w;
    float _343 = -_333;
    float _345 = _331 + _343;
    float _347 = _329 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _349 = fma(_337, _337, _339);
    float _351 = _329 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _353 = _329 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _355 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[4].x, _347);
    float _357 = fma(_345, _345, _349);
    float _359 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[5].x, _351);
    float _361 = in.m_30.x;
    float _363 = in.m_30.y;
    float _365 = in.m_30.z;
    float _367 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[6].x, _353);
    float _369 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[4].z, _355);
    float _371 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[5].z, _359);
    float _373 = sqrt(_357);
    float _375 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[6].z, _367);
    bool _377 = _373 >= 9.9999999747524270787835121154785e-07;
    bool _379 = isnan(_373);
    bool _381 = _377 || _379;
    bool _383 = isnan(9.9999999747524270787835121154785e-07);
    bool _385 = _381 || _383;
    float _387 = fma(_323, _341, _361);
    float _389 = fma(_311, _341, _363);
    float _391 = fma(_331, _341, _365);
    float _393 = _367;
    float _395 = _341;
    float _397 = _369;
    if (_385)
    {
        _393 = _369;
    }
    float _399 = _393;
    float _401 = _399;
    if (_385)
    {
        _395 = _371;
    }
    float _403 = _395;
    float _405 = _403;
    if (_385)
    {
        _397 = _375;
    }
    float _407 = _397;
    float _409 = _407;
    if (!_385)
    {
        bool _411 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _413 = !_411;
        if (!_413)
        {
            float _415 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _417 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _419 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _421 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _415);
            float _423 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _417);
            float _425 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _419);
            float _427 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _421);
            float _429 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _423);
            float _431 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _425);
            float _433 = _427 * _427;
            float _435 = fma(_429, _429, _433);
            float _437 = fma(_431, _431, _435);
            float _439 = rsqrt(_437);
            float _441 = _439 * 9.9999999747524270787835121154785e-07;
            float _443 = _429 * _441;
            float _445 = _427 * _441;
            float _447 = _431 * _441;
            _405 = _445;
            _401 = _443;
            _409 = _447;
            _449 = true;
        }
        else
        {
            float _451 = _125 * _125;
            float _453 = fma(_123, _123, _451);
            float _455 = fma(_127, _127, _453);
            float _457 = sqrt(_455);
            bool _459 = _457 >= 9.9999999747524270787835121154785e-07;
            bool _461 = isnan(_457);
            bool _463 = _459 || _461;
            bool _465 = isnan(9.9999999747524270787835121154785e-07);
            bool _467 = _463 || _465;
            if (!_467)
            {
                float _469 = _363 * _363;
                float _471 = fma(_361, _361, _469);
                float _473 = fma(_365, _365, _471);
                float _475 = sqrt(_473);
                bool _477 = _475 >= 9.9999999747524270787835121154785e-07;
                bool _479 = isnan(_475);
                bool _481 = _477 || _479;
                bool _483 = isnan(9.9999999747524270787835121154785e-07);
                bool _485 = _481 || _483;
                if (!_485)
                {
                    float _487 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _489 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _487);
                    float _491 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _489);
                    float _493 = rsqrt(_491);
                    float _495 = _493 * 9.9999999747524270787835121154785e-07;
                    float _497 = _495 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _499 = _495 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _501 = _495 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _405 = _499;
                    _401 = _497;
                    _409 = _501;
                    _449 = true;
                }
                else
                {
                    float _503 = _363 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _505 = _363 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _507 = _363 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _509 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[5].x, _503);
                    float _511 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[4].x, _505);
                    float _513 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[6].x, _507);
                    float _515 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].z, _509);
                    float _517 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].z, _511);
                    float _519 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].z, _513);
                    float _521 = _515 * _515;
                    float _523 = fma(_517, _517, _521);
                    float _525 = fma(_519, _519, _523);
                    float _527 = rsqrt(_525);
                    float _529 = _527 * 9.9999999747524270787835121154785e-07;
                    float _531 = _517 * _529;
                    float _533 = _515 * _529;
                    float _535 = _519 * _529;
                    _405 = _533;
                    _401 = _531;
                    _409 = _535;
                    _449 = true;
                }
            }
            else
            {
                float _537 = _125 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _539 = _125 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _541 = _125 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _543 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[5].x, _537);
                float _545 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[4].x, _539);
                float _547 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[6].x, _541);
                float _549 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[5].z, _543);
                float _551 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[4].z, _545);
                float _553 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[6].z, _547);
                float _555 = _549 * _549;
                float _557 = fma(_551, _551, _555);
                float _559 = fma(_553, _553, _557);
                float _561 = rsqrt(_559);
                float _563 = _561 * 9.9999999747524270787835121154785e-07;
                float _565 = _551 * _563;
                float _567 = _549 * _563;
                float _569 = _553 * _563;
                _405 = _567;
                _401 = _565;
                _409 = _569;
            }
        }
    }
    _449 = false;
    float _571 = _405;
    float _573 = _401;
    float _575 = _409;
    bool _577 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _579 = !_577;
    float _597;
    if (!_579)
    {
        float _581 = in.m_39.x;
        float _583 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _585 = _581 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _587 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[12].x, _101);
        float _589 = _587 * _583;
        float _591 = floor(_589);
        float _593 = -_591;
        float _595 = _589 + _593;
        _597 = _595;
        _599 = true;
    }
    else
    {
        float _601 = float(_67);
        float _603 = 1.0 / _601;
        float _605 = _101 * _603;
        _597 = _605;
    }
    _599 = false;
    float _607 = _597;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _611 = _607 + _609;
    bool _613 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _615 = isnan(_607);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _625;
    float _629 = -_623;
    float _631 = _629 + 1.0;
    bool _633 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _635 = isnan(_607);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _645;
    bool _649 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _651 = 1.0 / _627;
    float _653 = _643 * _631;
    float _655 = -_643;
    float _657 = _655 + 1.0;
    float _659 = _611 * _651;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _661;
    float _665 = fma(_647, _659, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _667 = fma(_663, _659, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _669 = _665 * _653;
    float _671 = _667 * _653;
    float _673 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[143].x, _669);
    float _675 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[143].y, _671);
    float _677 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[144].x, _673);
    float _679 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[144].y, _675);
    bool _681 = !_649;
    float _701;
    float _703;
    if (!_681)
    {
        float _683 = in.m_39.x;
        float _685 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _687 = float(_67);
        float _689 = _683 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[11].y, _101);
        float _693 = _691 * _685;
        float _695 = floor(_693);
        float _697 = -_695;
        float _699 = _693 + _697;
        _701 = _687;
        _703 = _699;
        _705 = true;
    }
    else
    {
        float _707 = float(_67);
        float _709 = 1.0 / _707;
        float _711 = _101 * _709;
        _701 = _707;
        _703 = _711;
    }
    _705 = false;
    float _713 = _701;
    float _715 = _703;
    float _717 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _719 = int(_717);
    float _721 = in.m_39.x;
    float _723 = _389 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _727 = _725 != 0;
    float _729 = as_type<float>(int(gl_VertexIndex));
    float _731 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _733 = int(_731);
    bool _735 = !_727;
    float _737 = _735 ? 1.2345600128173828125 : 1.0;
    float _739 = _389 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _741 = _389 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _743 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _723);
    float _745 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _739);
    float _747 = float(_719);
    float _749 = 1.0 / _713;
    float _751 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _741);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _753;
    float _757 = float(uint(_733));
    float _759 = 1.0 / _747;
    int _761 = ~_733;
    int _763 = _761 + 1;
    float _765 = 1.0 / _757;
    float _767 = _101 * _759;
    float _769 = _759;
    float _771 = _747;
    if (!_727)
    {
        float _773 = in.m_39.y;
        _769 = _773;
    }
    float _775 = _769;
    float _777 = trunc(_767);
    int _779 = int(_777);
    int _781 = as_type<int>(_765) + (-2);
    int _783 = ~_733;
    int _785 = _783 + 1;
    float _787 = float(uint(_779));
    if (!_727)
    {
        _771 = _775;
    }
    float _789 = _771;
    float _791 = as_type<float>(_781) * _787;
    float _793 = trunc(_791);
    float _795 = precise::max(_793, 0.0);
    uint _798 = uint(_795);
    float _800 = _789;
    int _802 = as_type<int>(_775);
    if (_727)
    {
        float _804 = in.m_39.x;
        float _806 = in.m_39.y;
        _800 = _804;
        _802 = as_type<int>(_806);
    }
    float _808 = _800;
    int _810 = _802;
    float _812 = float(_779);
    int _814 = _785 * int(_798);
    int _816 = _814 + _779;
    float _818 = float(uint(_816));
    float _820 = as_type<float>(_781) * _818;
    bool _822 = !_727;
    float _824 = _822 ? as_type<float>(_810) : _721;
    int _826 = ~_733;
    int _828 = _826 + 1;
    float _830 = trunc(_820);
    float _832 = precise::max(_830, 0.0);
    uint _834 = uint(_832);
    float _836 = _824 * _737;
    float _838 = float(_733);
    float _840 = _101 * _838;
    int _842 = int(_798) + int(_834);
    float _844 = floor(_836);
    bool _846 = _812 >= _838;
    bool _848 = isnan(_812);
    bool _850 = _846 || _848;
    bool _852 = isnan(_838);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    int _858 = _828 * _842;
    int _860 = _858 + _779;
    bool _862 = uint(_860) >= uint(_733);
    float _864 = trunc(_856);
    int _866 = int(_864);
    bool _868 = !_862;
    int _870 = _868 ? 0 : (-1);
    int _872 = as_type<int>(_729) & 1;
    bool _874 = _872 != 0;
    int _876 = as_type<int>(_729) & 2;
    bool _878 = _876 != 0;
    int _880 = ~_842;
    int _882 = _880 + _870;
    int _884 = _882 + 1;
    float _886 = -_844;
    float _888 = _836 + _886;
    bool _890 = _733 == 0;
    int _892 = _733 * _884;
    int _894 = _892 + _779;
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _898 = _896 != 0;
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _902 = _900 != 0;
    float _904 = _838 * _888;
    bool _906 = !_874;
    float _908 = _906 ? (-0.5) : 0.5;
    bool _910 = !_878;
    float _912 = _910 ? (-0.5) : 0.5;
    float _914 = trunc(_904);
    int _916 = int(_914);
    int _918 = ~_866;
    int _920 = _918 + 1;
    int _922 = _920 + 1;
    bool _924 = !_890;
    int _926 = _924 ? _894 : (-1);
    int _928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _930 = _928 != 0;
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _934 = _932 != 0;
    float _936 = _840 * _749;
    int _938 = _922 * _926;
    int _940 = _733 + (-1);
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _944 = _942 != 0;
    float _946 = trunc(_936);
    int _948 = int(_946);
    bool _950 = !_934;
    int _952 = _950 ? 0 : 1;
    int _954 = _866 * _940;
    int _956 = _954 + _938;
    bool _958 = !_930;
    int _960 = _958 ? 0 : 1;
    bool _962 = !_944;
    int _964 = _962 ? 0 : 1;
    int _966 = abs(_952);
    bool _968 = !_898;
    int _970 = _968 ? 0 : 1;
    int _972 = abs(_960);
    int _974 = _956 * _966;
    int _976 = abs(_964);
    bool _978 = !_902;
    int _980 = _978 ? 0 : 1;
    int _982 = abs(_970);
    int _984 = _916 * _976;
    int _986 = _984 + _779;
    int _988 = abs(_980);
    int _990 = _948 * _972;
    int _992 = _990 + _974;
    int _994 = ~_733;
    int _996 = _994 + 1;
    int _998 = _986 * _982;
    int _1000 = _998 + _992;
    int _1002 = ~_733;
    int _1004 = _1002 + 1;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1008 = _1006 != 0;
    int _1010 = _916 * _988;
    int _1012 = _1010 + _1000;
    float _1014 = float(uint(_1012));
    float _1016 = as_type<float>(_781) * _1014;
    float _1018 = trunc(_1016);
    float _1020 = precise::max(_1018, 0.0);
    uint _1022 = uint(_1020);
    int _1024 = _996 * int(_1022);
    int _1026 = _1024 + _1012;
    float _1028 = float(uint(_1026));
    float _1030 = as_type<float>(_781) * _1028;
    float _1032 = trunc(_1030);
    float _1034 = precise::max(_1032, 0.0);
    uint _1036 = uint(_1034);
    int _1038 = int(_1022) + int(_1036);
    float _1040 = float(uint(_986));
    int _1042 = _1004 * _1038;
    int _1044 = _1042 + _1012;
    float _1046 = as_type<float>(_781) * _1040;
    bool _1048 = uint(_1044) >= uint(_733);
    float _1050 = in.m_37.x;
    float _1052 = in.m_37.y;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1056 = _1054 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1058 = !_1048;
    int _1060 = _1058 ? 0 : (-1);
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1064 = _1062 != 0;
    float _1066 = 1.0 / _1056;
    int _1068 = ~_1038;
    int _1070 = _1068 + _1060;
    int _1072 = _1070 + 1;
    float _1074 = in.m_39.w;
    int _1076 = _733 * _1072;
    int _1078 = _1076 + _1012;
    bool _1080 = !_890;
    int _1082 = _1080 ? _1078 : (-1);
    int _1084 = _1082 & 3;
    bool _1086 = _1084 != 0;
    int _1088 = _1082 >> 31;
    bool _1090 = uint(_1084) >= 2u;
    float _1092 = _679 * _1052;
    bool _1094 = _1084 != 3;
    float _1096 = _677 * _1050;
    int _1098 = _1088 & 3;
    float _1100 = _755 * _1066;
    int _1102 = _1090 ? 0 : 1;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1106 = _715 + _1104;
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1110 = _1108 != 0;
    float _1112 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].z, _745);
    int _1114 = _1082 + _1098;
    float _1116 = fma(_1100, _1106, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1118 = trunc(_1046);
    float _1120 = precise::max(_1118, 0.0);
    uint _1122 = uint(_1120);
    int _1124 = ~_1102;
    int _1126 = _1124 + 1;
    int _1128 = _1126 + 1;
    float _1130 = _1096 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1132 = _1114 >> 2;
    float _1134 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1136 = _1128;
    if (_1094)
    {
        int _1138 = ~_1102;
        int _1140 = _1138 + 1;
        _1136 = _1140;
    }
    int _1142 = _1136;
    int _1144 = _1132 << 4;
    int _1146 = _1144 + 512;
    int _1148 = _1086 ? 0 : 1;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1152 = _1150 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1154 = _1074 > 0.5;
    uint _1156 = uint(int(uint(_1146) >> uint(2)));
    uint _1158 = uint(int(uint(int(_1156)) >> uint(2)));
    int _1160 = int(_1156) & 3;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[int(_1158)][_1160];
    int _1164 = int(_1156) + 1;
    uint _1166 = uint(int(uint(_1164) >> uint(2)));
    int _1168 = _1164 & 3;
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[int(_1166)][_1168];
    bool _1172 = uint(_1084) > 1u;
    int _1174 = _763 * int(_1122);
    int _1176 = _1174 + _986;
    float _1178 = 1.0 / _1152;
    float _1180 = float(uint(_1176));
    int _1182 = ~_1148;
    int _1184 = _1182 + 1;
    int _1186 = _1184 + 1;
    float _1188 = as_type<float>(_781) * _1180;
    int _1190 = _1186;
    if (!_1172)
    {
        int _1192 = ~_1148;
        int _1194 = _1192 + 1;
        _1190 = _1194;
    }
    int _1196 = _1190;
    int _1198 = _1146 + 8;
    uint _1200 = uint(int(uint(_1198) >> uint(2)));
    uint _1202 = uint(int(uint(int(_1200)) >> uint(2)));
    int _1204 = int(_1200) & 3;
    float _1206 = (*spvDescriptorSet0.vp_c9)._m0[int(_1202)][_1204];
    int _1208 = int(_1200) + 1;
    uint _1210 = uint(int(uint(_1208) >> uint(2)));
    int _1212 = _1208 & 3;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[int(_1210)][_1212];
    int _1216 = _1082 & 3;
    bool _1218 = _1216 != 0;
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1222 = _1220 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1224 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].z, _743);
    float _1226 = trunc(_1188);
    float _1228 = precise::max(_1226, 0.0);
    uint _1230 = uint(_1228);
    float _1232 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].z, _751);
    bool _1234 = !_1218;
    int _1236 = _1234 ? 0 : 1;
    float _1238 = _1222 * _1178;
    int _1240 = abs(_1196);
    float _1242 = _1232 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1244 = ~_733;
    int _1246 = _1244 + 1;
    int _1248 = ~_1240;
    int _1250 = _1248 + 1;
    int _1252 = _1250 + 1;
    bool _1254 = _1084 != 3;
    int _1256 = int(_1122) + int(_1230);
    int _1258 = abs(_1236);
    float _1260 = _571 * _571;
    int _1262 = _1246 * _1256;
    int _1264 = _1262 + _986;
    int _1266 = ~_1258;
    int _1268 = _1266 + 1;
    int _1270 = _1268 + 1;
    float _1272 = fma(_573, _573, _1260);
    int _1274 = _1252 * as_type<int>(_1170);
    float _1276 = fma(_575, _575, _1272);
    bool _1278 = !_1254;
    int _1280 = _1278 ? 0 : (-1);
    bool _1282 = uint(_1264) >= uint(_733);
    float _1284 = rsqrt(_1276);
    int _1286 = abs(_1142);
    int _1288 = _1270 * as_type<int>(_1162);
    int _1290 = _1288 + _1274;
    int _1292 = abs(_1280);
    float _1294 = in.m_39.z;
    int _1296 = ~_1286;
    int _1298 = _1296 + 1;
    int _1300 = _1298 + 1;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1304 = _715 + _1302;
    bool _1306 = !_1110;
    int _1308 = _1306 ? 0 : 1;
    float _1310 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1312 = int(_1310);
    int _1314 = ~_1292;
    int _1316 = _1314 + 1;
    int _1318 = _1316 + 1;
    int _1320 = _1300 * as_type<int>(_1206);
    int _1322 = _1320 + _1290;
    int _1324 = abs(_1308);
    float _1326 = fma(_1238, _1304, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1328 = !_1282;
    int _1330 = _1328 ? 0 : (-1);
    int _1332 = _1318 * as_type<int>(_1214);
    int _1334 = _1332 + _1322;
    int _1336 = ~_1324;
    int _1338 = _1336 + 1;
    int _1340 = _1338 + 1;
    float _1342 = _1284 * _575;
    float _1344 = _1284 * _571;
    float _1346 = _1284 * _573;
    int _1348 = ~_1256;
    int _1350 = _1348 + _1330;
    int _1352 = _1350 + 1;
    float _1354 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1356 = _1342 * _1354;
    float _1358 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1360 = _1344 * _1358;
    int _1362 = _1340 * _1334;
    bool _1364 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1366 = isnan(_715);
    bool _1368 = _1364 || _1366;
    bool _1370 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1372 = _1368 || _1370;
    float _1374 = float(_1372);
    float _1376 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1378 = -_1356;
    float _1380 = fma(_1346, _1376, _1378);
    int _1382 = abs(_1312);
    float _1384 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1386 = -_1360;
    float _1388 = fma(_1342, _1384, _1386);
    float _1390 = float(uint(_1312));
    float _1392 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1394 = _1346 * _1392;
    float _1396 = _1380 * _1380;
    float _1398 = float(uint(_1382));
    float _1400 = 1.0 / _1390;
    bool _1402 = _1294 > 0.5;
    int _1404 = _733 * _1352;
    int _1406 = _1404 + _986;
    float _1408 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1410 = -_1394;
    float _1412 = fma(_1344, _1408, _1410);
    float _1414 = fma(_1388, _1388, _1396);
    bool _1416 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1418 = isnan(_715);
    bool _1420 = _1416 || _1418;
    bool _1422 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1424 = _1420 || _1422;
    float _1426 = float(_1424);
    float _1428 = -_1374;
    float _1430 = _1428 + 1.0;
    bool _1432 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1434 = isnan(_715);
    bool _1436 = _1432 || _1434;
    bool _1438 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1440 = _1436 || _1438;
    float _1442 = float(_1440);
    float _1444 = 1.0 / _1398;
    float _1446 = -_908;
    int _1448 = _1402 ? as_type<int>(_1446) : as_type<int>(_908);
    float _1450 = fma(_1412, _1412, _1414);
    float _1452 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _908);
    bool _1454 = !_890;
    int _1456 = _1454 ? _1406 : (-1);
    float _1458 = _1442 * _1430;
    bool _1460 = !_1064;
    float _1462 = _1460 ? _908 : as_type<float>(_1448);
    float _1464 = -_1442;
    float _1466 = _1464 + 1.0;
    float _1468 = _1130 * _1452;
    float _1470 = -_912;
    int _1472 = _1154 ? as_type<int>(_1470) : as_type<int>(_912);
    int _1474 = _1456 * _1324;
    int _1476 = _1474 + _1362;
    float _1478 = _1426 * _1466;
    float _1480 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _912);
    bool _1482 = !_1008;
    float _1484 = _1482 ? _912 : as_type<float>(_1472);
    float _1486 = rsqrt(_1450);
    int _1488 = as_type<int>(_1400) + (-2);
    float _1490 = _1134 * _1480;
    float _1492 = float(uint(_1476));
    float _1494 = _1116 * _1478;
    int _1496 = abs(_1476);
    float _1498 = _1490 * _1346;
    float _1500 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1502 = as_type<float>(_1488) * _1492;
    int _1504 = as_type<int>(_1444) + (-2);
    float _1506 = float(uint(_1496));
    int _1508 = ~_1312;
    int _1510 = _1508 + 1;
    float _1512 = trunc(_1502);
    float _1514 = precise::max(_1512, 0.0);
    uint _1516 = uint(_1514);
    int _1518 = ~_1382;
    int _1520 = _1518 + 1;
    float _1522 = as_type<float>(_1504) * _1506;
    float _1524 = _1380 * _1486;
    float _1526 = _1412 * _1486;
    float _1528 = _1388 * _1486;
    float _1530 = _1490 * _1342;
    float _1532 = _1346 * _1524;
    float _1534 = trunc(_1522);
    float _1536 = precise::max(_1534, 0.0);
    uint _1538 = uint(_1536);
    float _1540 = _1344 * _1526;
    float _1542 = fma(_1468, _1526, _1530);
    float _1544 = -_1532;
    float _1546 = fma(_1344, _1528, _1544);
    float _1548 = fma(_1468, _1528, _1498);
    float _1550 = -_1540;
    float _1552 = fma(_1342, _1524, _1550);
    float _1554 = _1412;
    float _1556 = _1294;
    float _1558 = as_type<float>(_1496);
    if (!_727)
    {
        _1554 = _1294;
    }
    float _1560 = _1554;
    float _1562 = fma(_1500, _1546, _1542);
    int _1564 = _1510 * int(_1516);
    int _1566 = _1564 + _1476;
    float _1568 = _1560;
    if (_727)
    {
        _1568 = as_type<float>(_810);
    }
    float _1570 = _1568;
    float _1572 = fma(_1500, _1552, _1548);
    if (_727)
    {
        _1556 = as_type<float>(_810);
    }
    float _1574 = _1556;
    float _1576 = _1224 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1578 = float(uint(_1566));
    float _1580 = _1242 + _1562;
    int _1582 = _1520 * int(_1538);
    int _1584 = _1582 + _1496;
    float _1586 = _1576 + _1572;
    float _1588 = as_type<float>(_1488) * _1578;
    float _1590 = _1490 * _1344;
    float _1592 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1594 = float(uint(_1584));
    float _1596 = _808 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1598 = trunc(_1588);
    float _1600 = precise::max(_1598, 0.0);
    uint _1602 = uint(_1600);
    float _1604 = _1342 * _1528;
    float _1606 = as_type<float>(_1504) * _1594;
    float _1608 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1592);
    float _1610 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1612 = _1580 + _1610;
    float _1614 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1616 = _1586 + _1614;
    float _1618 = -_1426;
    float _1620 = _1618 + 1.0;
    float _1622 = trunc(_1606);
    float _1624 = precise::max(_1622, 0.0);
    uint _1626 = uint(_1624);
    float _1628 = _1612 * _1612;
    float _1630 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1632 = fma(_1620, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1494);
    float _1634 = fma(_1616, _1616, _1628);
    float _1636 = _1570 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1638 = -_1630;
    float _1640 = fma(_1596, 2.0, _1638);
    float _1642 = fma(_1326, _1458, _1632);
    float _1644 = sqrt(_1634);
    float _1646 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1648 = fma(_1468, _1524, _1590);
    int _1650 = int(_1516) + int(_1602);
    float _1652 = -_1604;
    float _1654 = fma(_1346, _1526, _1652);
    int _1656 = ~_1312;
    int _1658 = _1656 + 1;
    float _1660 = fma(_1636, -2.0, _1646);
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1666 = fma(_1500, _1654, _1648);
    float _1668 = _1112 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1670 = _1658 * _1650;
    int _1672 = _1670 + _1476;
    float _1674 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1642);
    int _1676 = int(_1538) + int(_1626);
    float _1678 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1662);
    bool _1680 = _1644 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1682 = _1668 + _1666;
    int _1684 = ~_1382;
    int _1686 = _1684 + 1;
    float _1688 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1608);
    bool _1690 = uint(_1672) >= uint(_1312);
    float _1692 = -_101;
    float _1694 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1640);
    float _1696 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1678);
    int _1698 = _1686 * _1676;
    int _1700 = _1698 + _1496;
    float _1702 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1660);
    bool _1704 = !_1690;
    int _1706 = _1704 ? 0 : (-1);
    float _1708 = _1586;
    float _1710 = _1580;
    if (!_1680)
    {
        _1558 = _1586;
    }
    float _1712 = _1558;
    float _1714 = _1712;
    if (!_1680)
    {
        _1708 = _1682;
    }
    float _1716 = _1708;
    bool _1718 = !_1680;
    float _1720 = _1716;
    if (!_1718)
    {
        float _1722 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1724 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1726 = _1644 + _1724;
        float _1728 = _1682 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1730 = rsqrt(_1634);
        float _1732 = _1726 * _1722;
        float _1734 = _1732 * 0.15915493667125701904296875;
        float _1736 = _1734 * 6.283185482025146484375;
        float _1738 = sin(_1736);
        float _1740 = _1734 * 6.283185482025146484375;
        float _1742 = cos(_1740);
        float _1744 = fma(_1738, _1728, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1746 = _1730 * _1744;
        float _1748 = _1742 + (-1.0);
        float _1750 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1752 = fma(_1616, _1746, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1754 = fma(_1612, _1746, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1756 = fma(_1682, _1742, _1750);
        _1720 = _1756;
        _1714 = _1752;
        _1710 = _1754;
    }
    float _1758 = _1720;
    float _1760 = _1714;
    float _1762 = _1710;
    int _1764 = ~_1650;
    int _1766 = _1764 + _1706;
    int _1768 = _1766 + 1;
    float _1770 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _1772 = uint(_1700) >= uint(_1382);
    float _1774 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _1776 = _1476 ^ _1312;
    float _1778 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1780 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1782 = !_1772;
    int _1784 = _1782 ? 0 : (-1);
    int _1786 = _1312 * _1768;
    int _1788 = _1786 + _1476;
    uint _1790 = uint(int(uint(_1776) >> uint(31)));
    float _1792 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1794 = _1312 == 0;
    float _1796 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1774);
    bool _1798 = _1312 == 0;
    float _1800 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1770);
    int _1802 = ~_1784;
    int _1804 = _1676 + _1802;
    int _1806 = _1804 + 1;
    float _1808 = _1664 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _1810 = ~int(_1790);
    int _1812 = _1810 + 1;
    float _1814 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1796);
    bool _1816 = !_1794;
    int _1818 = _1816 ? _1788 : (-1);
    float _1820 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1778);
    int _1822 = _1806 ^ _1812;
    float _1824 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1800);
    float _1826 = float(_1818);
    float _1828 = _1814 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _1830 = ~_1812;
    int _1832 = _1830 + _1822;
    int _1834 = _1832 + 1;
    float _1836 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1780);
    float _1838 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1820);
    float _1840 = fma(_1808, _1826, _1694);
    bool _1842 = !_1798;
    int _1844 = _1842 ? _1834 : (-1);
    float _1846 = _1824 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1848 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1850 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1852 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1854 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1856 = float(_1844);
    float _1858 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1860 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1836);
    float _1862 = _1462 + 0.5;
    float _1864 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1848);
    float _1866 = _1838 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1868 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1852);
    float _1870 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1854);
    float _1872 = -_1702;
    float _1874 = fma(_1858, _1856, _1872);
    float _1876 = fma(_1808, _1862, _1840);
    float _1878 = _1484 + (-0.5);
    float _1880 = -_1688;
    float _1882 = _1880 + 1.0;
    float _1884 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1864);
    float _1886 = _1860 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1888 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1868);
    float _1890 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1870);
    float _1892 = -_1858;
    float _1894 = fma(_1892, _1878, _1874);
    float _1896 = -_1882;
    float _1898 = fma(_1462, _1896, _1876);
    float _1900 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1884);
    float _1902 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1850);
    float _1904 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1888);
    float _1906 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1890);
    float _1908 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1902);
    float _1910 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1912 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1914 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1916 = -_1696;
    float _1918 = _1916 + 1.0;
    float _1920 = _1904 + _1906;
    float _1922 = _1674 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1924 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1908);
    float _1926 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1928 = _1910 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1930 = _1912 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1932 = _1914 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1934 = _1920 * 0.5;
    float _1936 = fma(_1484, _1918, _1894);
    out.m_33.x = _1926;
    out.m_44.x = _1928;
    out.m_44.y = _1930;
    out.m_44.z = _1932;
    out.m_44.w = _1922;
    out.gl_Position.x = _1900;
    out.gl_Position.y = _1924;
    out.gl_Position.z = _1904;
    out.gl_Position.w = _1906;
    out.m_46.z = _1934;
    out.m_46.w = _1906;
    out.m_48.z = _1898;
    out.m_48.w = _1936;
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
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _705 = false;
    bool _599 = false;
    bool _449 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _62 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _1993 = as_type<float>(_83);
        out.gl_Position.z = _1993;
    }
    if (!_71)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _87 = in.m_35.w;
    bool _89 = _87 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _91 = isnan(_87);
    bool _93 = _89 || _91;
    bool _95 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _97 = _93 || _95;
    float _99 = -_87;
    float _101 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_97)
    {
        float _103 = float(_67);
        _77 = _103;
    }
    float _105 = _77;
    bool _107 = _101 >= _105;
    bool _109 = !_97;
    bool _111 = _107 || _109;
    float _113 = _105;
    if (_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (_111)
    {
        out.m_33.x = 0.0;
    }
    if (_111)
    {
        float _119 = _115 * 5.0;
        _85 = as_type<int>(_119);
    }
    int _121 = _85;
    if (_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2063 = as_type<float>(_121);
        out.gl_Position.z = _2063;
    }
    if (_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = in.m_35.x;
    float _125 = in.m_35.y;
    float _127 = in.m_35.z;
    float _129 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _131 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _133 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _135 = _131 || _133;
    bool _137 = isnan(1.0);
    bool _139 = _135 || _137;
    float _141 = 0.0;
    float _143 = _129;
    if (!_139)
    {
        float _145 = _129 * _129;
        float _147 = _145 * 0.5;
        _141 = _147;
    }
    float _149 = _141;
    float _151 = 0.0;
    float _153 = _149;
    if (!_139)
    {
        float _155 = _101 * _101;
        float _157 = _155 * 0.5;
        _151 = _157;
    }
    float _159 = _151;
    if (!_139)
    {
        float _161 = _149 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _153 = _161;
    }
    float _163 = _153;
    bool _165 = !_139;
    float _167 = _163;
    float _169 = 0.0;
    if (!_165)
    {
        float _171 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _173 = log2(_171);
        float _175 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _177 = _175 + 1.0;
        float _179 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _181 = _129 * _173;
        float _183 = 1.0 / _177;
        float _185 = _179 * 0.693147182464599609375;
        float _187 = exp2(_181);
        float _189 = 1.0 / _185;
        float _191 = _187 + (-1.0);
        float _193 = -_191;
        float _195 = fma(_193, _189, _129);
        float _197 = _195 * _183;
        float _199 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _167 = _199;
        _169 = _187;
        _117 = _189;
    }
    float _201 = _167;
    float _203 = _169;
    float _205 = _117;
    bool _207 = !_139;
    float _209 = _205;
    float _211 = _203;
    if (!_207)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = 1.0 / _219;
        float _223 = _129 * _215;
        float _225 = exp2(_223);
        float _227 = -_225;
        float _229 = _227 + 1.0;
        float _231 = _229 * _221;
        _209 = _219;
        _143 = _231;
    }
    float _233 = _209;
    float _235 = _143;
    float _237 = _233;
    if (!_139)
    {
        _237 = _101;
    }
    float _239 = _237;
    float _241 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _243 = _239;
    if (!_139)
    {
        float _245 = _159 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _245;
    }
    float _247 = _211;
    bool _249 = !_139;
    float _251 = _247;
    if (!_249)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = _101 * _255;
        float _265 = 1.0 / _259;
        float _267 = _261 * 0.693147182464599609375;
        float _269 = exp2(_263);
        float _271 = 1.0 / _267;
        float _273 = _269 + (-1.0);
        float _275 = -_273;
        float _277 = fma(_275, _271, _101);
        float _279 = _277 * _265;
        float _281 = _279 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _251 = _281;
    }
    float _283 = _251;
    bool _285 = !_139;
    if (!_285)
    {
        float _287 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _289 = log2(_287);
        float _291 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _293 = _291 + 1.0;
        float _295 = 1.0 / _293;
        float _297 = _101 * _289;
        float _299 = exp2(_297);
        float _301 = -_299;
        float _303 = _301 + 1.0;
        float _305 = _303 * _295;
        _243 = _305;
    }
    float _307 = _243;
    float _309 = _283 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _311 = fma(_235, _125, _241);
    float _313 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _315 = _283 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _317 = fma(_307, _125, _309);
    float _319 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _321 = _283 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _323 = fma(_235, _123, _313);
    float _325 = fma(_307, _123, _315);
    float _327 = -_317;
    float _329 = _311 + _327;
    float _331 = fma(_235, _127, _319);
    float _333 = fma(_307, _127, _321);
    float _335 = -_325;
    float _337 = _323 + _335;
    float _339 = _329 * _329;
    float _341 = in.m_37.w;
    float _343 = -_333;
    float _345 = _331 + _343;
    float _347 = _329 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _349 = fma(_337, _337, _339);
    float _351 = _329 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _353 = _329 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _355 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[4].x, _347);
    float _357 = fma(_345, _345, _349);
    float _359 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[5].x, _351);
    float _361 = in.m_30.x;
    float _363 = in.m_30.y;
    float _365 = in.m_30.z;
    float _367 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[6].x, _353);
    float _369 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[4].z, _355);
    float _371 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[5].z, _359);
    float _373 = sqrt(_357);
    float _375 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[6].z, _367);
    bool _377 = _373 >= 9.9999999747524270787835121154785e-07;
    bool _379 = isnan(_373);
    bool _381 = _377 || _379;
    bool _383 = isnan(9.9999999747524270787835121154785e-07);
    bool _385 = _381 || _383;
    float _387 = fma(_323, _341, _361);
    float _389 = fma(_311, _341, _363);
    float _391 = fma(_331, _341, _365);
    float _393 = _367;
    float _395 = _341;
    float _397 = _369;
    if (_385)
    {
        _393 = _369;
    }
    float _399 = _393;
    float _401 = _399;
    if (_385)
    {
        _395 = _371;
    }
    float _403 = _395;
    float _405 = _403;
    if (_385)
    {
        _397 = _375;
    }
    float _407 = _397;
    float _409 = _407;
    if (!_385)
    {
        bool _411 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _413 = !_411;
        if (!_413)
        {
            float _415 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _417 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _419 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _421 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _415);
            float _423 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _417);
            float _425 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _419);
            float _427 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _421);
            float _429 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _423);
            float _431 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _425);
            float _433 = _427 * _427;
            float _435 = fma(_429, _429, _433);
            float _437 = fma(_431, _431, _435);
            float _439 = rsqrt(_437);
            float _441 = _439 * 9.9999999747524270787835121154785e-07;
            float _443 = _429 * _441;
            float _445 = _427 * _441;
            float _447 = _431 * _441;
            _405 = _445;
            _401 = _443;
            _409 = _447;
            _449 = true;
        }
        else
        {
            float _451 = _125 * _125;
            float _453 = fma(_123, _123, _451);
            float _455 = fma(_127, _127, _453);
            float _457 = sqrt(_455);
            bool _459 = _457 >= 9.9999999747524270787835121154785e-07;
            bool _461 = isnan(_457);
            bool _463 = _459 || _461;
            bool _465 = isnan(9.9999999747524270787835121154785e-07);
            bool _467 = _463 || _465;
            if (!_467)
            {
                float _469 = _363 * _363;
                float _471 = fma(_361, _361, _469);
                float _473 = fma(_365, _365, _471);
                float _475 = sqrt(_473);
                bool _477 = _475 >= 9.9999999747524270787835121154785e-07;
                bool _479 = isnan(_475);
                bool _481 = _477 || _479;
                bool _483 = isnan(9.9999999747524270787835121154785e-07);
                bool _485 = _481 || _483;
                if (!_485)
                {
                    float _487 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _489 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _487);
                    float _491 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _489);
                    float _493 = rsqrt(_491);
                    float _495 = _493 * 9.9999999747524270787835121154785e-07;
                    float _497 = _495 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _499 = _495 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _501 = _495 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _405 = _499;
                    _401 = _497;
                    _409 = _501;
                    _449 = true;
                }
                else
                {
                    float _503 = _363 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _505 = _363 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _507 = _363 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _509 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[5].x, _503);
                    float _511 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[4].x, _505);
                    float _513 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[6].x, _507);
                    float _515 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].z, _509);
                    float _517 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].z, _511);
                    float _519 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].z, _513);
                    float _521 = _515 * _515;
                    float _523 = fma(_517, _517, _521);
                    float _525 = fma(_519, _519, _523);
                    float _527 = rsqrt(_525);
                    float _529 = _527 * 9.9999999747524270787835121154785e-07;
                    float _531 = _517 * _529;
                    float _533 = _515 * _529;
                    float _535 = _519 * _529;
                    _405 = _533;
                    _401 = _531;
                    _409 = _535;
                    _449 = true;
                }
            }
            else
            {
                float _537 = _125 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _539 = _125 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _541 = _125 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _543 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[5].x, _537);
                float _545 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[4].x, _539);
                float _547 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[6].x, _541);
                float _549 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[5].z, _543);
                float _551 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[4].z, _545);
                float _553 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[6].z, _547);
                float _555 = _549 * _549;
                float _557 = fma(_551, _551, _555);
                float _559 = fma(_553, _553, _557);
                float _561 = rsqrt(_559);
                float _563 = _561 * 9.9999999747524270787835121154785e-07;
                float _565 = _551 * _563;
                float _567 = _549 * _563;
                float _569 = _553 * _563;
                _405 = _567;
                _401 = _565;
                _409 = _569;
            }
        }
    }
    _449 = false;
    float _571 = _405;
    float _573 = _401;
    float _575 = _409;
    bool _577 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _579 = !_577;
    float _597;
    if (!_579)
    {
        float _581 = in.m_39.x;
        float _583 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _585 = _581 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _587 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[12].x, _101);
        float _589 = _587 * _583;
        float _591 = floor(_589);
        float _593 = -_591;
        float _595 = _589 + _593;
        _597 = _595;
        _599 = true;
    }
    else
    {
        float _601 = float(_67);
        float _603 = 1.0 / _601;
        float _605 = _101 * _603;
        _597 = _605;
    }
    _599 = false;
    float _607 = _597;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _611 = _607 + _609;
    bool _613 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _615 = isnan(_607);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _625;
    float _629 = -_623;
    float _631 = _629 + 1.0;
    bool _633 = _607 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _635 = isnan(_607);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _645;
    bool _649 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _651 = 1.0 / _627;
    float _653 = _643 * _631;
    float _655 = -_643;
    float _657 = _655 + 1.0;
    float _659 = _611 * _651;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _661;
    float _665 = fma(_647, _659, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _667 = fma(_663, _659, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _669 = _665 * _653;
    float _671 = _667 * _653;
    float _673 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[143].x, _669);
    float _675 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[143].y, _671);
    float _677 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[144].x, _673);
    float _679 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[144].y, _675);
    bool _681 = !_649;
    float _701;
    float _703;
    if (!_681)
    {
        float _683 = in.m_39.x;
        float _685 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _687 = float(_67);
        float _689 = _683 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[11].y, _101);
        float _693 = _691 * _685;
        float _695 = floor(_693);
        float _697 = -_695;
        float _699 = _693 + _697;
        _701 = _687;
        _703 = _699;
        _705 = true;
    }
    else
    {
        float _707 = float(_67);
        float _709 = 1.0 / _707;
        float _711 = _101 * _709;
        _701 = _707;
        _703 = _711;
    }
    _705 = false;
    float _713 = _701;
    float _715 = _703;
    float _717 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _719 = int(_717);
    float _721 = in.m_39.x;
    float _723 = _389 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _727 = _725 != 0;
    float _729 = as_type<float>(int(gl_VertexIndex));
    float _731 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _733 = int(_731);
    bool _735 = !_727;
    float _737 = _735 ? 1.2345600128173828125 : 1.0;
    float _739 = _389 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _741 = _389 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _743 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _723);
    float _745 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _739);
    float _747 = float(_719);
    float _749 = 1.0 / _713;
    float _751 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _741);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _753;
    float _757 = float(uint(_733));
    float _759 = 1.0 / _747;
    int _761 = ~_733;
    int _763 = _761 + 1;
    float _765 = 1.0 / _757;
    float _767 = _101 * _759;
    float _769 = _759;
    float _771 = _747;
    if (!_727)
    {
        float _773 = in.m_39.y;
        _769 = _773;
    }
    float _775 = _769;
    float _777 = trunc(_767);
    int _779 = int(_777);
    int _781 = as_type<int>(_765) + (-2);
    int _783 = ~_733;
    int _785 = _783 + 1;
    float _787 = float(uint(_779));
    if (!_727)
    {
        _771 = _775;
    }
    float _789 = _771;
    float _791 = as_type<float>(_781) * _787;
    float _793 = trunc(_791);
    float _795 = precise::max(_793, 0.0);
    uint _798 = uint(_795);
    float _800 = _789;
    int _802 = as_type<int>(_775);
    if (_727)
    {
        float _804 = in.m_39.x;
        float _806 = in.m_39.y;
        _800 = _804;
        _802 = as_type<int>(_806);
    }
    float _808 = _800;
    int _810 = _802;
    float _812 = float(_779);
    int _814 = _785 * int(_798);
    int _816 = _814 + _779;
    float _818 = float(uint(_816));
    float _820 = as_type<float>(_781) * _818;
    bool _822 = !_727;
    float _824 = _822 ? as_type<float>(_810) : _721;
    int _826 = ~_733;
    int _828 = _826 + 1;
    float _830 = trunc(_820);
    float _832 = precise::max(_830, 0.0);
    uint _834 = uint(_832);
    float _836 = _824 * _737;
    float _838 = float(_733);
    float _840 = _101 * _838;
    int _842 = int(_798) + int(_834);
    float _844 = floor(_836);
    bool _846 = _812 >= _838;
    bool _848 = isnan(_812);
    bool _850 = _846 || _848;
    bool _852 = isnan(_838);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    int _858 = _828 * _842;
    int _860 = _858 + _779;
    bool _862 = uint(_860) >= uint(_733);
    float _864 = trunc(_856);
    int _866 = int(_864);
    bool _868 = !_862;
    int _870 = _868 ? 0 : (-1);
    int _872 = as_type<int>(_729) & 1;
    bool _874 = _872 != 0;
    int _876 = as_type<int>(_729) & 2;
    bool _878 = _876 != 0;
    int _880 = ~_842;
    int _882 = _880 + _870;
    int _884 = _882 + 1;
    float _886 = -_844;
    float _888 = _836 + _886;
    bool _890 = _733 == 0;
    int _892 = _733 * _884;
    int _894 = _892 + _779;
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _898 = _896 != 0;
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _902 = _900 != 0;
    float _904 = _838 * _888;
    bool _906 = !_874;
    float _908 = _906 ? (-0.5) : 0.5;
    bool _910 = !_878;
    float _912 = _910 ? (-0.5) : 0.5;
    float _914 = trunc(_904);
    int _916 = int(_914);
    int _918 = ~_866;
    int _920 = _918 + 1;
    int _922 = _920 + 1;
    bool _924 = !_890;
    int _926 = _924 ? _894 : (-1);
    int _928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _930 = _928 != 0;
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _934 = _932 != 0;
    float _936 = _840 * _749;
    int _938 = _922 * _926;
    int _940 = _733 + (-1);
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _944 = _942 != 0;
    float _946 = trunc(_936);
    int _948 = int(_946);
    bool _950 = !_934;
    int _952 = _950 ? 0 : 1;
    int _954 = _866 * _940;
    int _956 = _954 + _938;
    bool _958 = !_930;
    int _960 = _958 ? 0 : 1;
    bool _962 = !_944;
    int _964 = _962 ? 0 : 1;
    int _966 = abs(_952);
    bool _968 = !_898;
    int _970 = _968 ? 0 : 1;
    int _972 = abs(_960);
    int _974 = _956 * _966;
    int _976 = abs(_964);
    bool _978 = !_902;
    int _980 = _978 ? 0 : 1;
    int _982 = abs(_970);
    int _984 = _916 * _976;
    int _986 = _984 + _779;
    int _988 = abs(_980);
    int _990 = _948 * _972;
    int _992 = _990 + _974;
    int _994 = ~_733;
    int _996 = _994 + 1;
    int _998 = _986 * _982;
    int _1000 = _998 + _992;
    int _1002 = ~_733;
    int _1004 = _1002 + 1;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1008 = _1006 != 0;
    int _1010 = _916 * _988;
    int _1012 = _1010 + _1000;
    float _1014 = float(uint(_1012));
    float _1016 = as_type<float>(_781) * _1014;
    float _1018 = trunc(_1016);
    float _1020 = precise::max(_1018, 0.0);
    uint _1022 = uint(_1020);
    int _1024 = _996 * int(_1022);
    int _1026 = _1024 + _1012;
    float _1028 = float(uint(_1026));
    float _1030 = as_type<float>(_781) * _1028;
    float _1032 = trunc(_1030);
    float _1034 = precise::max(_1032, 0.0);
    uint _1036 = uint(_1034);
    int _1038 = int(_1022) + int(_1036);
    float _1040 = float(uint(_986));
    int _1042 = _1004 * _1038;
    int _1044 = _1042 + _1012;
    float _1046 = as_type<float>(_781) * _1040;
    bool _1048 = uint(_1044) >= uint(_733);
    float _1050 = in.m_37.x;
    float _1052 = in.m_37.y;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1056 = _1054 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1058 = !_1048;
    int _1060 = _1058 ? 0 : (-1);
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1064 = _1062 != 0;
    float _1066 = 1.0 / _1056;
    int _1068 = ~_1038;
    int _1070 = _1068 + _1060;
    int _1072 = _1070 + 1;
    float _1074 = in.m_39.w;
    int _1076 = _733 * _1072;
    int _1078 = _1076 + _1012;
    bool _1080 = !_890;
    int _1082 = _1080 ? _1078 : (-1);
    int _1084 = _1082 & 3;
    bool _1086 = _1084 != 0;
    int _1088 = _1082 >> 31;
    bool _1090 = uint(_1084) >= 2u;
    float _1092 = _679 * _1052;
    bool _1094 = _1084 != 3;
    float _1096 = _677 * _1050;
    int _1098 = _1088 & 3;
    float _1100 = _755 * _1066;
    int _1102 = _1090 ? 0 : 1;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1106 = _715 + _1104;
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1110 = _1108 != 0;
    float _1112 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].z, _745);
    int _1114 = _1082 + _1098;
    float _1116 = fma(_1100, _1106, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1118 = trunc(_1046);
    float _1120 = precise::max(_1118, 0.0);
    uint _1122 = uint(_1120);
    int _1124 = ~_1102;
    int _1126 = _1124 + 1;
    int _1128 = _1126 + 1;
    float _1130 = _1096 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1132 = _1114 >> 2;
    float _1134 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1136 = _1128;
    if (_1094)
    {
        int _1138 = ~_1102;
        int _1140 = _1138 + 1;
        _1136 = _1140;
    }
    int _1142 = _1136;
    int _1144 = _1132 << 4;
    int _1146 = _1144 + 512;
    int _1148 = _1086 ? 0 : 1;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1152 = _1150 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1154 = _1074 > 0.5;
    uint _1156 = uint(int(uint(_1146) >> uint(2)));
    uint _1158 = uint(int(uint(int(_1156)) >> uint(2)));
    int _1160 = int(_1156) & 3;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[int(_1158)][_1160];
    int _1164 = int(_1156) + 1;
    uint _1166 = uint(int(uint(_1164) >> uint(2)));
    int _1168 = _1164 & 3;
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[int(_1166)][_1168];
    bool _1172 = uint(_1084) > 1u;
    int _1174 = _763 * int(_1122);
    int _1176 = _1174 + _986;
    float _1178 = 1.0 / _1152;
    float _1180 = float(uint(_1176));
    int _1182 = ~_1148;
    int _1184 = _1182 + 1;
    int _1186 = _1184 + 1;
    float _1188 = as_type<float>(_781) * _1180;
    int _1190 = _1186;
    if (!_1172)
    {
        int _1192 = ~_1148;
        int _1194 = _1192 + 1;
        _1190 = _1194;
    }
    int _1196 = _1190;
    int _1198 = _1146 + 8;
    uint _1200 = uint(int(uint(_1198) >> uint(2)));
    uint _1202 = uint(int(uint(int(_1200)) >> uint(2)));
    int _1204 = int(_1200) & 3;
    float _1206 = (*spvDescriptorSet0.vp_c9)._m0[int(_1202)][_1204];
    int _1208 = int(_1200) + 1;
    uint _1210 = uint(int(uint(_1208) >> uint(2)));
    int _1212 = _1208 & 3;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[int(_1210)][_1212];
    int _1216 = _1082 & 3;
    bool _1218 = _1216 != 0;
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1222 = _1220 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1224 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].z, _743);
    float _1226 = trunc(_1188);
    float _1228 = precise::max(_1226, 0.0);
    uint _1230 = uint(_1228);
    float _1232 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].z, _751);
    bool _1234 = !_1218;
    int _1236 = _1234 ? 0 : 1;
    float _1238 = _1222 * _1178;
    int _1240 = abs(_1196);
    float _1242 = _1232 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1244 = ~_733;
    int _1246 = _1244 + 1;
    int _1248 = ~_1240;
    int _1250 = _1248 + 1;
    int _1252 = _1250 + 1;
    bool _1254 = _1084 != 3;
    int _1256 = int(_1122) + int(_1230);
    int _1258 = abs(_1236);
    float _1260 = _571 * _571;
    int _1262 = _1246 * _1256;
    int _1264 = _1262 + _986;
    int _1266 = ~_1258;
    int _1268 = _1266 + 1;
    int _1270 = _1268 + 1;
    float _1272 = fma(_573, _573, _1260);
    int _1274 = _1252 * as_type<int>(_1170);
    float _1276 = fma(_575, _575, _1272);
    bool _1278 = !_1254;
    int _1280 = _1278 ? 0 : (-1);
    bool _1282 = uint(_1264) >= uint(_733);
    float _1284 = rsqrt(_1276);
    int _1286 = abs(_1142);
    int _1288 = _1270 * as_type<int>(_1162);
    int _1290 = _1288 + _1274;
    int _1292 = abs(_1280);
    float _1294 = in.m_39.z;
    int _1296 = ~_1286;
    int _1298 = _1296 + 1;
    int _1300 = _1298 + 1;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1304 = _715 + _1302;
    bool _1306 = !_1110;
    int _1308 = _1306 ? 0 : 1;
    float _1310 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1312 = int(_1310);
    int _1314 = ~_1292;
    int _1316 = _1314 + 1;
    int _1318 = _1316 + 1;
    int _1320 = _1300 * as_type<int>(_1206);
    int _1322 = _1320 + _1290;
    int _1324 = abs(_1308);
    float _1326 = fma(_1238, _1304, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1328 = !_1282;
    int _1330 = _1328 ? 0 : (-1);
    int _1332 = _1318 * as_type<int>(_1214);
    int _1334 = _1332 + _1322;
    int _1336 = ~_1324;
    int _1338 = _1336 + 1;
    int _1340 = _1338 + 1;
    float _1342 = _1284 * _575;
    float _1344 = _1284 * _571;
    float _1346 = _1284 * _573;
    int _1348 = ~_1256;
    int _1350 = _1348 + _1330;
    int _1352 = _1350 + 1;
    float _1354 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1356 = _1342 * _1354;
    float _1358 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1360 = _1344 * _1358;
    int _1362 = _1340 * _1334;
    bool _1364 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1366 = isnan(_715);
    bool _1368 = _1364 || _1366;
    bool _1370 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1372 = _1368 || _1370;
    float _1374 = float(_1372);
    float _1376 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1378 = -_1356;
    float _1380 = fma(_1346, _1376, _1378);
    int _1382 = abs(_1312);
    float _1384 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1386 = -_1360;
    float _1388 = fma(_1342, _1384, _1386);
    float _1390 = float(uint(_1312));
    float _1392 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1394 = _1346 * _1392;
    float _1396 = _1380 * _1380;
    float _1398 = float(uint(_1382));
    float _1400 = 1.0 / _1390;
    bool _1402 = _1294 > 0.5;
    int _1404 = _733 * _1352;
    int _1406 = _1404 + _986;
    float _1408 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1410 = -_1394;
    float _1412 = fma(_1344, _1408, _1410);
    float _1414 = fma(_1388, _1388, _1396);
    bool _1416 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1418 = isnan(_715);
    bool _1420 = _1416 || _1418;
    bool _1422 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1424 = _1420 || _1422;
    float _1426 = float(_1424);
    float _1428 = -_1374;
    float _1430 = _1428 + 1.0;
    bool _1432 = _715 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1434 = isnan(_715);
    bool _1436 = _1432 || _1434;
    bool _1438 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1440 = _1436 || _1438;
    float _1442 = float(_1440);
    float _1444 = 1.0 / _1398;
    float _1446 = -_908;
    int _1448 = _1402 ? as_type<int>(_1446) : as_type<int>(_908);
    float _1450 = fma(_1412, _1412, _1414);
    float _1452 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _908);
    bool _1454 = !_890;
    int _1456 = _1454 ? _1406 : (-1);
    float _1458 = _1442 * _1430;
    bool _1460 = !_1064;
    float _1462 = _1460 ? _908 : as_type<float>(_1448);
    float _1464 = -_1442;
    float _1466 = _1464 + 1.0;
    float _1468 = _1130 * _1452;
    float _1470 = -_912;
    int _1472 = _1154 ? as_type<int>(_1470) : as_type<int>(_912);
    int _1474 = _1456 * _1324;
    int _1476 = _1474 + _1362;
    float _1478 = _1426 * _1466;
    float _1480 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _912);
    bool _1482 = !_1008;
    float _1484 = _1482 ? _912 : as_type<float>(_1472);
    float _1486 = rsqrt(_1450);
    int _1488 = as_type<int>(_1400) + (-2);
    float _1490 = _1134 * _1480;
    float _1492 = float(uint(_1476));
    float _1494 = _1116 * _1478;
    int _1496 = abs(_1476);
    float _1498 = _1490 * _1346;
    float _1500 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1502 = as_type<float>(_1488) * _1492;
    int _1504 = as_type<int>(_1444) + (-2);
    float _1506 = float(uint(_1496));
    int _1508 = ~_1312;
    int _1510 = _1508 + 1;
    float _1512 = trunc(_1502);
    float _1514 = precise::max(_1512, 0.0);
    uint _1516 = uint(_1514);
    int _1518 = ~_1382;
    int _1520 = _1518 + 1;
    float _1522 = as_type<float>(_1504) * _1506;
    float _1524 = _1380 * _1486;
    float _1526 = _1412 * _1486;
    float _1528 = _1388 * _1486;
    float _1530 = _1490 * _1342;
    float _1532 = _1346 * _1524;
    float _1534 = trunc(_1522);
    float _1536 = precise::max(_1534, 0.0);
    uint _1538 = uint(_1536);
    float _1540 = _1344 * _1526;
    float _1542 = fma(_1468, _1526, _1530);
    float _1544 = -_1532;
    float _1546 = fma(_1344, _1528, _1544);
    float _1548 = fma(_1468, _1528, _1498);
    float _1550 = -_1540;
    float _1552 = fma(_1342, _1524, _1550);
    float _1554 = _1412;
    float _1556 = _1294;
    float _1558 = as_type<float>(_1496);
    if (!_727)
    {
        _1554 = _1294;
    }
    float _1560 = _1554;
    float _1562 = fma(_1500, _1546, _1542);
    int _1564 = _1510 * int(_1516);
    int _1566 = _1564 + _1476;
    float _1568 = _1560;
    if (_727)
    {
        _1568 = as_type<float>(_810);
    }
    float _1570 = _1568;
    float _1572 = fma(_1500, _1552, _1548);
    if (_727)
    {
        _1556 = as_type<float>(_810);
    }
    float _1574 = _1556;
    float _1576 = _1224 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1578 = float(uint(_1566));
    float _1580 = _1242 + _1562;
    int _1582 = _1520 * int(_1538);
    int _1584 = _1582 + _1496;
    float _1586 = _1576 + _1572;
    float _1588 = as_type<float>(_1488) * _1578;
    float _1590 = _1490 * _1344;
    float _1592 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1594 = float(uint(_1584));
    float _1596 = _808 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1598 = trunc(_1588);
    float _1600 = precise::max(_1598, 0.0);
    uint _1602 = uint(_1600);
    float _1604 = _1342 * _1528;
    float _1606 = as_type<float>(_1504) * _1594;
    float _1608 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1592);
    float _1610 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1612 = _1580 + _1610;
    float _1614 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1616 = _1586 + _1614;
    float _1618 = -_1426;
    float _1620 = _1618 + 1.0;
    float _1622 = trunc(_1606);
    float _1624 = precise::max(_1622, 0.0);
    uint _1626 = uint(_1624);
    float _1628 = _1612 * _1612;
    float _1630 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1632 = fma(_1620, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1494);
    float _1634 = fma(_1616, _1616, _1628);
    float _1636 = _1570 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1638 = -_1630;
    float _1640 = fma(_1596, 2.0, _1638);
    float _1642 = fma(_1326, _1458, _1632);
    float _1644 = sqrt(_1634);
    float _1646 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1648 = fma(_1468, _1524, _1590);
    int _1650 = int(_1516) + int(_1602);
    float _1652 = -_1604;
    float _1654 = fma(_1346, _1526, _1652);
    int _1656 = ~_1312;
    int _1658 = _1656 + 1;
    float _1660 = fma(_1636, -2.0, _1646);
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1666 = fma(_1500, _1654, _1648);
    float _1668 = _1112 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1670 = _1658 * _1650;
    int _1672 = _1670 + _1476;
    float _1674 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1642);
    int _1676 = int(_1538) + int(_1626);
    float _1678 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1662);
    bool _1680 = _1644 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1682 = _1668 + _1666;
    int _1684 = ~_1382;
    int _1686 = _1684 + 1;
    float _1688 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1608);
    bool _1690 = uint(_1672) >= uint(_1312);
    float _1692 = -_101;
    float _1694 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1640);
    float _1696 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1678);
    int _1698 = _1686 * _1676;
    int _1700 = _1698 + _1496;
    float _1702 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1660);
    bool _1704 = !_1690;
    int _1706 = _1704 ? 0 : (-1);
    float _1708 = _1586;
    float _1710 = _1580;
    if (!_1680)
    {
        _1558 = _1586;
    }
    float _1712 = _1558;
    float _1714 = _1712;
    if (!_1680)
    {
        _1708 = _1682;
    }
    float _1716 = _1708;
    bool _1718 = !_1680;
    float _1720 = _1716;
    if (!_1718)
    {
        float _1722 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1724 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1726 = _1644 + _1724;
        float _1728 = _1682 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1730 = rsqrt(_1634);
        float _1732 = _1726 * _1722;
        float _1734 = _1732 * 0.15915493667125701904296875;
        float _1736 = _1734 * 6.283185482025146484375;
        float _1738 = sin(_1736);
        float _1740 = _1734 * 6.283185482025146484375;
        float _1742 = cos(_1740);
        float _1744 = fma(_1738, _1728, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1746 = _1730 * _1744;
        float _1748 = _1742 + (-1.0);
        float _1750 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1752 = fma(_1616, _1746, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1754 = fma(_1612, _1746, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1756 = fma(_1682, _1742, _1750);
        _1720 = _1756;
        _1714 = _1752;
        _1710 = _1754;
    }
    float _1758 = _1720;
    float _1760 = _1714;
    float _1762 = _1710;
    int _1764 = ~_1650;
    int _1766 = _1764 + _1706;
    int _1768 = _1766 + 1;
    float _1770 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _1772 = uint(_1700) >= uint(_1382);
    float _1774 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _1776 = _1476 ^ _1312;
    float _1778 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1780 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1782 = !_1772;
    int _1784 = _1782 ? 0 : (-1);
    int _1786 = _1312 * _1768;
    int _1788 = _1786 + _1476;
    uint _1790 = uint(int(uint(_1776) >> uint(31)));
    float _1792 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1794 = _1312 == 0;
    float _1796 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1774);
    bool _1798 = _1312 == 0;
    float _1800 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1770);
    int _1802 = ~_1784;
    int _1804 = _1676 + _1802;
    int _1806 = _1804 + 1;
    float _1808 = _1664 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _1810 = ~int(_1790);
    int _1812 = _1810 + 1;
    float _1814 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1796);
    bool _1816 = !_1794;
    int _1818 = _1816 ? _1788 : (-1);
    float _1820 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1778);
    int _1822 = _1806 ^ _1812;
    float _1824 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1800);
    float _1826 = float(_1818);
    float _1828 = _1814 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _1830 = ~_1812;
    int _1832 = _1830 + _1822;
    int _1834 = _1832 + 1;
    float _1836 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1780);
    float _1838 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1820);
    float _1840 = fma(_1808, _1826, _1694);
    bool _1842 = !_1798;
    int _1844 = _1842 ? _1834 : (-1);
    float _1846 = _1824 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1848 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1850 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1852 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1854 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1856 = float(_1844);
    float _1858 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1860 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1836);
    float _1862 = _1462 + 0.5;
    float _1864 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1848);
    float _1866 = _1838 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1868 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1852);
    float _1870 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1854);
    float _1872 = -_1702;
    float _1874 = fma(_1858, _1856, _1872);
    float _1876 = fma(_1808, _1862, _1840);
    float _1878 = _1484 + (-0.5);
    float _1880 = -_1688;
    float _1882 = _1880 + 1.0;
    float _1884 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1864);
    float _1886 = _1860 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1888 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1868);
    float _1890 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1870);
    float _1892 = -_1858;
    float _1894 = fma(_1892, _1878, _1874);
    float _1896 = -_1882;
    float _1898 = fma(_1462, _1896, _1876);
    float _1900 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1884);
    float _1902 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1850);
    float _1904 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1888);
    float _1906 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1890);
    float _1908 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1902);
    float _1910 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1912 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1914 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1916 = -_1696;
    float _1918 = _1916 + 1.0;
    float _1920 = _1904 + _1906;
    float _1922 = _1674 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1924 = fma(_1886, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1908);
    float _1926 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1928 = _1910 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1930 = _1912 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1932 = _1914 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1934 = _1920 * 0.5;
    float _1936 = fma(_1484, _1918, _1894);
    out.m_33.x = _1926;
    out.m_44.x = _1928;
    out.m_44.y = _1930;
    out.m_44.z = _1932;
    out.m_44.w = _1922;
    out.gl_Position.x = _1900;
    out.gl_Position.y = _1924;
    out.gl_Position.z = _1904;
    out.gl_Position.w = _1906;
    out.m_46.z = _1934;
    out.m_46.w = _1906;
    out.m_48.z = _1898;
    out.m_48.w = _1936;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

