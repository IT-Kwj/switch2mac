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
    float4 m_52 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
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
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1415 = false;
    bool _881 = false;
    bool _595 = false;
    bool _445 = false;
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
        float _1796 = as_type<float>(_87);
        out.gl_Position.z = _1796;
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
    float _109 = 0.0;
    if (_101)
    {
        float _111 = float(_71);
        _81 = _111;
    }
    float _113 = _81;
    bool _115 = _105 >= _113;
    bool _117 = !_101;
    bool _119 = _115 || _117;
    float _121 = _113;
    if (_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    if (_119)
    {
        out.m_35.x = 0.0;
    }
    if (_119)
    {
        float _125 = _123 * 5.0;
        _89 = as_type<int>(_125);
    }
    int _127 = _89;
    float _129 = as_type<float>(_127);
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1867 = as_type<float>(_127);
        out.gl_Position.z = _1867;
    }
    if (_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = in.m_37.x;
    float _133 = in.m_37.y;
    float _135 = in.m_37.z;
    float _137 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _139 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _141 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _143 = _139 || _141;
    bool _145 = isnan(1.0);
    bool _147 = _143 || _145;
    float _149 = _137;
    if (!_147)
    {
        float _151 = _137 * _137;
        float _153 = _151 * 0.5;
        _129 = _153;
    }
    float _155 = _129;
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
    bool _171 = !_147;
    float _173 = _169;
    if (!_171)
    {
        float _175 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _177 = log2(_175);
        float _179 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _181 = _179 + 1.0;
        float _183 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _185 = _137 * _177;
        float _187 = 1.0 / _181;
        float _189 = _183 * 0.693147182464599609375;
        float _191 = exp2(_185);
        float _193 = 1.0 / _189;
        float _195 = _191 + (-1.0);
        float _197 = -_195;
        float _199 = fma(_197, _193, _137);
        float _201 = _199 * _187;
        float _203 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _107 = _193;
        _173 = _203;
        _109 = _191;
    }
    float _205 = _107;
    float _207 = _173;
    float _209 = _109;
    bool _211 = !_147;
    float _213 = _205;
    float _215 = _209;
    if (!_211)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = 1.0 / _223;
        float _227 = _137 * _219;
        float _229 = exp2(_227);
        float _231 = -_229;
        float _233 = _231 + 1.0;
        float _235 = _233 * _225;
        _213 = _229;
        _215 = _223;
        _149 = _235;
    }
    float _237 = _213;
    float _239 = _215;
    float _241 = _149;
    float _243 = _239;
    float _245 = _237;
    if (!_147)
    {
        _243 = _105;
    }
    float _247 = _243;
    float _249 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _251 = _247;
    if (!_147)
    {
        float _253 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _245 = _253;
    }
    float _255 = _245;
    bool _257 = !_147;
    float _259 = _255;
    if (!_257)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _271 = _105 * _263;
        float _273 = 1.0 / _267;
        float _275 = _269 * 0.693147182464599609375;
        float _277 = exp2(_271);
        float _279 = 1.0 / _275;
        float _281 = _277 + (-1.0);
        float _283 = -_281;
        float _285 = fma(_283, _279, _105);
        float _287 = _285 * _273;
        float _289 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _259 = _289;
    }
    float _291 = _259;
    bool _293 = !_147;
    if (!_293)
    {
        float _295 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _297 = log2(_295);
        float _299 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _301 = _299 + 1.0;
        float _303 = 1.0 / _301;
        float _305 = _105 * _297;
        float _307 = exp2(_305);
        float _309 = -_307;
        float _311 = _309 + 1.0;
        float _313 = _311 * _303;
        _251 = _313;
    }
    float _315 = _251;
    float _317 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _319 = fma(_241, _133, _249);
    float _321 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _323 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _325 = fma(_315, _133, _317);
    float _327 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _329 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _331 = fma(_241, _131, _321);
    float _333 = fma(_315, _131, _323);
    float _335 = -_325;
    float _337 = _319 + _335;
    float _339 = fma(_241, _135, _327);
    float _341 = fma(_315, _135, _329);
    float _343 = -_333;
    float _345 = _331 + _343;
    float _347 = _337 * _337;
    float _349 = in.m_39.w;
    float _351 = -_341;
    float _353 = _339 + _351;
    float _355 = _337 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _357 = fma(_345, _345, _347);
    float _359 = _337 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _361 = _337 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _363 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[4].x, _355);
    float _365 = fma(_353, _353, _357);
    float _367 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[5].x, _359);
    float _369 = in.m_32.x;
    float _371 = in.m_32.y;
    float _373 = in.m_32.z;
    float _375 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[6].x, _361);
    float _377 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[4].z, _363);
    float _379 = sqrt(_365);
    float _381 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[5].z, _367);
    float _383 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[6].z, _375);
    bool _385 = _379 >= 9.9999999747524270787835121154785e-07;
    bool _387 = isnan(_379);
    bool _389 = _385 || _387;
    bool _391 = isnan(9.9999999747524270787835121154785e-07);
    bool _393 = _389 || _391;
    float _395 = fma(_331, _349, _369);
    float _397 = fma(_319, _349, _371);
    float _399 = fma(_339, _349, _373);
    float _401 = _381;
    float _403 = _377;
    float _405 = _383;
    if (!_393)
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
            _401 = _441;
            _403 = _439;
            _405 = _443;
            _445 = true;
        }
        else
        {
            float _447 = _133 * _133;
            float _449 = fma(_131, _131, _447);
            float _451 = fma(_135, _135, _449);
            float _453 = sqrt(_451);
            bool _455 = _453 >= 9.9999999747524270787835121154785e-07;
            bool _457 = isnan(_453);
            bool _459 = _455 || _457;
            bool _461 = isnan(9.9999999747524270787835121154785e-07);
            bool _463 = _459 || _461;
            if (!_463)
            {
                float _465 = _371 * _371;
                float _467 = fma(_369, _369, _465);
                float _469 = fma(_373, _373, _467);
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
                    _401 = _495;
                    _403 = _493;
                    _405 = _497;
                    _445 = true;
                }
                else
                {
                    float _499 = _371 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _501 = _371 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _503 = _371 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _505 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].x, _499);
                    float _507 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].x, _501);
                    float _509 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].x, _503);
                    float _511 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].z, _505);
                    float _513 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].z, _507);
                    float _515 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].z, _509);
                    float _517 = _511 * _511;
                    float _519 = fma(_513, _513, _517);
                    float _521 = fma(_515, _515, _519);
                    float _523 = rsqrt(_521);
                    float _525 = _523 * 9.9999999747524270787835121154785e-07;
                    float _527 = _513 * _525;
                    float _529 = _511 * _525;
                    float _531 = _515 * _525;
                    _401 = _529;
                    _403 = _527;
                    _405 = _531;
                    _445 = true;
                }
            }
            else
            {
                float _533 = _133 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _535 = _133 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _537 = _133 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _539 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[5].x, _533);
                float _541 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[4].x, _535);
                float _543 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[6].x, _537);
                float _545 = fma(_135, (*spvDescriptorSet0.vp_c10)._m0[5].z, _539);
                float _547 = fma(_135, (*spvDescriptorSet0.vp_c10)._m0[4].z, _541);
                float _549 = fma(_135, (*spvDescriptorSet0.vp_c10)._m0[6].z, _543);
                float _551 = _545 * _545;
                float _553 = fma(_547, _547, _551);
                float _555 = fma(_549, _549, _553);
                float _557 = rsqrt(_555);
                float _559 = _557 * 9.9999999747524270787835121154785e-07;
                float _561 = _547 * _559;
                float _563 = _545 * _559;
                float _565 = _549 * _559;
                _401 = _563;
                _403 = _561;
                _405 = _565;
            }
        }
    }
    _445 = false;
    float _567 = _401;
    float _569 = _403;
    float _571 = _405;
    bool _573 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _575 = !_573;
    float _593;
    if (!_575)
    {
        float _577 = in.m_41.x;
        float _579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _581 = _577 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _583 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _585 = _583 * _579;
        float _587 = floor(_585);
        float _589 = -_587;
        float _591 = _585 + _589;
        _593 = _591;
        _595 = true;
    }
    else
    {
        float _597 = float(_71);
        float _599 = 1.0 / _597;
        float _601 = _105 * _599;
        _593 = _601;
    }
    _595 = false;
    float _603 = _593;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _607 = _603 + _605;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _609;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _617;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _625;
    float _629 = 1.0 / _611;
    bool _631 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _633 = 1.0 / _615;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _637 = _603 + _635;
    float _639 = 1.0 / _623;
    float _641 = _637 * _629;
    bool _643 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _645 = isnan(_603);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    bool _655 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _657 = isnan(_603);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = 1.0 / _627;
    float _669 = _607 * _633;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _673 = _603 + _671;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _677 = _603 + _675;
    float _679 = 1.0 / _619;
    float _681 = _673 * _639;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _683;
    float _687 = fma(_685, _641, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _691 = _603 + _689;
    float _693 = _691 * _667;
    bool _695 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _697 = isnan(_603);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = _677 * _679;
    bool _709 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _711 = isnan(_603);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = -_653;
    float _723 = _721 + 1.0;
    float _725 = -_705;
    float _727 = _725 + 1.0;
    float _729 = -_719;
    float _731 = _729 + 1.0;
    float _733 = _705 * _723;
    float _735 = _719 * _727;
    bool _737 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _739 = isnan(_603);
    bool _741 = _737 || _739;
    bool _743 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _745 = _741 || _743;
    float _747 = float(_745);
    float _749 = _665 * _731;
    float _751 = -_665;
    float _753 = _751 + 1.0;
    bool _755 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _757 = isnan(_603);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _767;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _773 = _771 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _775 = _747 * _753;
    float _777 = -_747;
    float _779 = _777 + 1.0;
    float _781 = fma(_769, _641, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _783 = -_765;
    float _785 = _783 + 1.0;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _789 = _787 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _791 = _765 * _779;
    float _793 = fma(_773, _669, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _795;
    float _799 = fma(_789, _669, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _801 = _781 * _791;
    float _803 = _687 * _791;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _805;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _811 = _809 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _813 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[143].x, _801);
    float _815 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[143].y, _803);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _819 = _817 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _821 = fma(_797, _707, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _823 = fma(_807, _707, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _825 = fma(_793, _775, _813);
    float _827 = fma(_799, _775, _815);
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _829;
    float _833 = fma(_819, _681, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _835 = fma(_811, _681, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _837;
    float _841 = fma(_821, _749, _825);
    float _843 = fma(_823, _749, _827);
    float _845 = fma(_831, _693, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _847 = fma(_839, _693, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _849 = fma(_833, _735, _841);
    float _851 = fma(_835, _735, _843);
    float _853 = fma(_845, _733, _849);
    float _855 = fma(_847, _733, _851);
    float _857 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[148].x, _853);
    float _859 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[148].y, _855);
    bool _861 = !_631;
    float _879;
    if (!_861)
    {
        float _863 = in.m_41.x;
        float _865 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _867 = _863 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _869 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[11].x, _105);
        float _871 = _869 * _865;
        float _873 = floor(_871);
        float _875 = -_873;
        float _877 = _871 + _875;
        _879 = _877;
        _881 = true;
    }
    else
    {
        float _883 = float(_71);
        float _885 = 1.0 / _883;
        float _887 = _105 * _885;
        _879 = _887;
    }
    _881 = false;
    float _889 = _879;
    float _891 = _567 * _567;
    float _893 = in.m_41.x;
    float _895 = in.m_41.y;
    float _897 = _397 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _899 = fma(_569, _569, _891);
    float _901 = as_type<float>(int(gl_VertexIndex));
    float _903 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].x, _897);
    float _905 = fma(_571, _571, _899);
    float _907 = in.m_39.x;
    float _909 = in.m_39.y;
    float _911 = rsqrt(_905);
    bool _913 = _893 > 0.5;
    bool _915 = _895 > 0.5;
    float _917 = _911 * _571;
    float _919 = _911 * _569;
    float _921 = _911 * _567;
    float _923 = _397 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _925 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _927 = _917 * _925;
    float _929 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _931 = _919 * _929;
    float _933 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _935 = _921 * _933;
    float _937 = _397 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _939 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _941 = -_927;
    float _943 = fma(_919, _939, _941);
    float _945 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _947 = -_931;
    float _949 = fma(_921, _945, _947);
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _953 = -_935;
    float _955 = fma(_917, _951, _953);
    float _957 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].x, _923);
    float _959 = _943 * _943;
    int _961 = as_type<int>(_901) & 1;
    bool _963 = _961 != 0;
    int _965 = as_type<int>(_901) & 2;
    bool _967 = _965 != 0;
    float _969 = _857 * _907;
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _973 = _971 != 0;
    float _975 = fma(_955, _955, _959);
    float _977 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].x, _937);
    int _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _981 = _979 != 0;
    float _983 = _969 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _985 = fma(_949, _949, _975);
    float _987 = _859 * _909;
    float _989 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[6].z, _977);
    float _991 = rsqrt(_985);
    bool _993 = !_967;
    float _995 = _993 ? (-0.5) : 0.5;
    float _997 = _987 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _999;
    bool _1003 = !_963;
    float _1005 = _1003 ? (-0.5) : 0.5;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1009 = _1007 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1011 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _995);
    float _1013 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[5].z, _903);
    float _1015 = 1.0 / _1001;
    float _1017 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[4].z, _957);
    float _1019 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1005);
    float _1021 = _997 * _1011;
    float _1023 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1025 = _983 * _1019;
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1029 = _889 + _1027;
    float _1031 = _949 * _991;
    float _1033 = _943 * _991;
    float _1035 = _955 * _991;
    float _1037 = _1021 * _919;
    float _1039 = _921 * _1031;
    float _1041 = _1021 * _917;
    float _1043 = _919 * _1033;
    float _1045 = 1.0 / _1009;
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1049 = _889 + _1047;
    float _1051 = fma(_1025, _1035, _1037);
    float _1053 = fma(_1025, _1031, _1041);
    float _1055 = -_1043;
    float _1057 = fma(_921, _1035, _1055);
    float _1059 = _1049 * _1015;
    float _1061 = _1017 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1063 = fma(_1023, _1057, _1053);
    float _1065 = -_1039;
    float _1067 = fma(_917, _1033, _1065);
    float _1069 = _1021 * _921;
    float _1071 = _917 * _1035;
    float _1073 = -_1005;
    int _1075 = _913 ? as_type<int>(_1073) : as_type<int>(_1005);
    float _1077 = fma(_1023, _1067, _1051);
    float _1079 = _989 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1081 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1081;
    float _1085 = _1029 * _1045;
    float _1087 = _1061 + _1077;
    float _1089 = _1079 + _1063;
    float _1091 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1091;
    float _1095 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1095;
    float _1099 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1101 = _1087 + _1099;
    float _1103 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1105 = _1089 + _1103;
    float _1107 = fma(_1083, _1059, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1111 = _1109 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1113 = _1101 * _1101;
    float _1115 = _1105 * _1105;
    float _1117 = fma(_1093, _1059, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1119 = fma(_1097, _1059, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1123 = _1121 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1125 = _1113 + _1115;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1129 = _1127 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1131 = fma(_1111, _1085, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1133 = fma(_1123, _1085, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1135 = sqrt(_1125);
    float _1137 = fma(_1129, _1085, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _1139 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1141 = isnan(_889);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    float _1151 = fma(_1025, _1033, _1069);
    bool _1153 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1155 = isnan(_889);
    bool _1157 = _1153 || _1155;
    bool _1159 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1161 = _1157 || _1159;
    float _1163 = float(_1161);
    float _1165 = -_1071;
    float _1167 = fma(_919, _1031, _1165);
    bool _1169 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1171 = isnan(_889);
    bool _1173 = _1169 || _1171;
    bool _1175 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1177 = _1173 || _1175;
    float _1179 = float(_1177);
    float _1181 = -_1149;
    float _1183 = _1181 + 1.0;
    float _1185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1187 = fma(_1023, _1167, _1151);
    float _1189 = _1013 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1191 = _1179 * _1183;
    float _1193 = -_1163;
    float _1195 = _1193 + 1.0;
    float _1197 = -_1179;
    float _1199 = _1197 + 1.0;
    bool _1201 = !_973;
    float _1203 = _1201 ? _1005 : as_type<float>(_1075);
    float _1205 = _1117 * _1191;
    bool _1207 = _1135 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1209 = _1189 + _1187;
    float _1211 = -_995;
    int _1213 = _915 ? as_type<int>(_1211) : as_type<int>(_995);
    float _1215 = _1149 * _1195;
    float _1217 = _1107 * _1191;
    float _1219 = _1119 * _1191;
    float _1221 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1205);
    bool _1223 = !_981;
    float _1225 = _1223 ? _995 : as_type<float>(_1213);
    float _1227 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1217);
    float _1229 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1219);
    float _1231 = fma(_1131, _1215, _1221);
    float _1233 = _1167;
    float _1235 = _1113;
    float _1237 = _1115;
    float _1239 = _1087;
    float _1241 = _1089;
    float _1243 = _1163;
    if (!_1207)
    {
        _1233 = _1209;
    }
    float _1245 = _1233;
    bool _1247 = !_1207;
    float _1249 = _1245;
    if (!_1247)
    {
        float _1251 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1253 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1255 = _1135 + _1253;
        float _1257 = _1209 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1259 = rsqrt(_1125);
        float _1261 = _1255 * _1251;
        float _1263 = _1261 * 0.15915493667125701904296875;
        float _1265 = _1263 * 6.283185482025146484375;
        float _1267 = sin(_1265);
        float _1269 = _1263 * 6.283185482025146484375;
        float _1271 = cos(_1269);
        float _1273 = fma(_1267, _1257, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1275 = _1259 * _1273;
        float _1277 = _1271 + (-1.0);
        float _1279 = fma(_1101, _1275, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1281 = fma(_1105, _1275, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1283 = _1277 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1285 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1287 = _1279 + _1285;
        float _1289 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1291 = _1281 + _1289;
        float _1293 = fma(_1209, _1271, _1283);
        float _1295 = _1287 * _1287;
        float _1297 = _1291 * _1291;
        _1249 = _1293;
        _1235 = _1295;
        _1237 = _1297;
        _1239 = _1279;
        _1241 = _1281;
    }
    float _1299 = _1249;
    float _1301 = _1235;
    float _1303 = _1237;
    float _1305 = _1239;
    float _1307 = _1241;
    float _1309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1311 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1313 = _1299 + _1311;
    float _1315 = _1203 + 0.5;
    float _1317 = -_1225;
    float _1319 = _1317 + 0.5;
    float _1321 = fma(_1133, _1215, _1227);
    float _1323 = fma(_1313, _1313, _1301);
    float _1325 = fma(_1137, _1215, _1229);
    float _1327 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1329 = _1323 + _1303;
    float _1331 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1333 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1231);
    float _1335 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1321);
    float _1337 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1325);
    float _1339 = _1327 * _1185;
    float _1341 = sqrt(_1329);
    float _1343 = _1331 * _1309;
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1349 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1351 = _1333 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1353 = _1335 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1355 = _1337 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1357 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1359 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1361 = _1347 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1363 = _1349 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1365 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1367 = _1353 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1369 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_46.x = _1339;
    out.m_46.y = _1343;
    bool _1371 = _1341 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1373 = isnan(_1341);
    bool _1375 = _1371 || _1373;
    bool _1377 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1379 = _1375 || _1377;
    out.m_48.x = _1359;
    out.m_48.y = _1361;
    out.m_48.z = _1363;
    out.m_50.x = _1365;
    out.m_50.y = _1367;
    out.m_50.z = _1369;
    out.m_50.w = _1357;
    if (!_1379)
    {
        _1243 = 1.0;
    }
    float _1381 = _1243;
    bool _1383 = !_1379;
    float _1385 = _1381;
    if (!_1383)
    {
        bool _1387 = _1341 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1389 = isnan(_1341);
        bool _1391 = _1387 || _1389;
        bool _1393 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1395 = _1391 || _1393;
        if (!_1395)
        {
            float _1397 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1399 = _1341 + _1397;
            float _1401 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1403 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1401;
            float _1405 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1407 = _1405 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1409 = 1.0 / _1403;
            float _1411 = _1399 * _1409;
            float _1413 = fma(_1411, _1407, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1385 = _1413;
            _1415 = true;
        }
        else
        {
            bool _1417 = _1341 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1419 = isnan(_1341);
            bool _1421 = _1417 || _1419;
            bool _1423 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1425 = _1421 || _1423;
            if (!_1425)
            {
                float _1427 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1429 = _1341 + _1427;
                float _1431 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1433 = _1431 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1435 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1437 = _1435 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1439 = 1.0 / _1433;
                float _1441 = _1429 * _1439;
                float _1443 = fma(_1441, _1437, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1385 = _1443;
                _1415 = true;
            }
            else
            {
                _1385 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1415 = false;
    float _1445 = _1385;
    float _1447 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1449 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1451 = _1305 + _1449;
    float _1453 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1455 = _1299 + _1453;
    float _1457 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1447);
    float _1459 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1461 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1463 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1465 = _1461 || _1463;
    bool _1467 = isnan(0.5);
    bool _1469 = _1465 || _1467;
    float _1471 = fma(_1451, _1445, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1473 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1457);
    float _1475 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1459);
    float _1477 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1479 = _1307 + _1477;
    float _1481 = _1473 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1483 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1475);
    float _1485 = fma(_1455, _1445, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1487 = fma(_1479, _1445, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1489 = 1.0 / _1481;
    float _1491 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1493 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1495 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1497 = _1493 || _1495;
    bool _1499 = isnan(0.5);
    bool _1501 = _1497 || _1499;
    float _1503 = _1479;
    float _1505 = _1491;
    float _1507 = _1445;
    if (_1469)
    {
        _1503 = _1471;
    }
    float _1509 = _1503;
    float _1511 = _1491 + _1481;
    float _1513 = _1509;
    if (_1469)
    {
        _1505 = _1485;
    }
    float _1515 = _1505;
    float _1517 = _1515;
    if (_1469)
    {
        _1507 = _1487;
    }
    float _1519 = _1507;
    float _1521 = _1519;
    if (!_1469)
    {
        float _1523 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1525 = _1189 + _1523;
        float _1527 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1529 = _1061 + _1527;
        float _1531 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1533 = _1525 * _1525;
        float _1535 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1537 = _1079 + _1535;
        float _1539 = fma(_1529, _1529, _1533);
        float _1541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1543 = fma(_1537, _1537, _1539);
        float _1545 = sqrt(_1543);
        float _1547 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1549 = -_1079;
        float _1551 = _1549 + _1487;
        float _1553 = precise::min(_1545, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1555 = _1553 * _1541;
        float _1557 = -_1061;
        float _1559 = _1557 + _1471;
        float _1561 = _1547 * _1555;
        float _1563 = -_1189;
        float _1565 = _1563 + _1485;
        float _1567 = fma(_1559, _1561, _1061);
        float _1569 = fma(_1565, _1561, _1189);
        float _1571 = fma(_1551, _1561, _1079);
        _1517 = _1569;
        _1513 = _1567;
        _1521 = _1571;
    }
    float _1573 = _1517;
    float _1575 = _1513;
    float _1577 = _1521;
    float _1579 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1581 = _1511 * _1489;
    float _1583 = _1581 * 0.5;
    float _1585 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1587 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1589 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1591 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1579);
    float _1593 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1585);
    float _1595 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1587);
    float _1597 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1589);
    float _1599 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1591);
    float _1601 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1593);
    float _1603 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1595);
    float _1605 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1597);
    float _1607 = _1599 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1609 = _1585;
    if (_1501)
    {
        _1609 = 1.0;
    }
    float _1611 = _1609;
    float _1613 = _1611;
    if (!_1501)
    {
        float _1615 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1617 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1619 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1617);
        float _1621 = _1615 * 0.15915493667125701904296875;
        float _1623 = _1621 * 6.283185482025146484375;
        float _1625 = cos(_1623);
        float _1627 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1629 = _1627 * 0.15915493667125701904296875;
        float _1631 = _1621 * 6.283185482025146484375;
        float _1633 = sin(_1631);
        float _1635 = 1.0 / _1625;
        float _1637 = _1629 * 6.283185482025146484375;
        float _1639 = cos(_1637);
        float _1641 = _1633 * _1635;
        float _1643 = 1.0 / _1619;
        float _1645 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1647 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1645;
        float _1649 = _1639 * _1641;
        float _1651 = _1629 * 6.283185482025146484375;
        float _1653 = sin(_1651);
        float _1655 = 1.0 / _1649;
        float _1657 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1659 = _1643 * _1657;
        float _1661 = 1.0 / _1647;
        float _1663 = _1653 * _1655;
        float _1665 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1667 = fma(_1663, _1659, _1665);
        float _1669 = _1667 * _1661;
        float _1671 = precise::clamp(_1669, 0.0, 1.0);
        _1613 = _1671;
    }
    float _1673 = _1613;
    float _1675 = _1601 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1677 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1679 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1681 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1683 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1685 = _1603 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1687 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1677);
    float _1689 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1679);
    float _1691 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1681);
    float _1693 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1683);
    float _1695 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1697 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1687);
    float _1699 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1689);
    float _1701 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1691);
    float _1703 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1693);
    bool _1705 = _1673 > 0.0;
    bool _1707 = isnan(_1673);
    bool _1709 = _1705 || _1707;
    bool _1711 = isnan(0.0);
    bool _1713 = _1709 || _1711;
    float _1715 = _1673 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1717 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1697);
    float _1719 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1701);
    float _1721 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1699);
    float _1723 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1703);
    float _1725 = _1715 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1727 = _1717 + _1719;
    float _1729 = _1721 + _1719;
    float _1731 = _1719 * 0.5;
    float _1733 = _1727 * 0.5;
    float _1735 = _1729 * 0.5;
    float _1737 = fma(_1723, -0.5, _1731);
    out.m_35.x = _1725;
    out.gl_Position.x = _1717;
    out.gl_Position.y = _1723;
    out.gl_Position.z = _1721;
    out.gl_Position.w = _1719;
    out.m_52.x = _1733;
    out.m_52.y = _1737;
    out.m_52.z = _1735;
    out.m_52.w = _1719;
    if (_1713)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _1739 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1739;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1415 = false;
    bool _881 = false;
    bool _595 = false;
    bool _445 = false;
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
        float _1796 = as_type<float>(_87);
        out.gl_Position.z = _1796;
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
    float _109 = 0.0;
    if (_101)
    {
        float _111 = float(_71);
        _81 = _111;
    }
    float _113 = _81;
    bool _115 = _105 >= _113;
    bool _117 = !_101;
    bool _119 = _115 || _117;
    float _121 = _113;
    if (_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    if (_119)
    {
        out.m_35.x = 0.0;
    }
    if (_119)
    {
        float _125 = _123 * 5.0;
        _89 = as_type<int>(_125);
    }
    int _127 = _89;
    float _129 = as_type<float>(_127);
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1867 = as_type<float>(_127);
        out.gl_Position.z = _1867;
    }
    if (_119)
    {
        return out;
    }
    float _131 = in.m_37.x;
    float _133 = in.m_37.y;
    float _135 = in.m_37.z;
    float _137 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _139 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _141 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _143 = _139 || _141;
    bool _145 = isnan(1.0);
    bool _147 = _143 || _145;
    float _149 = _137;
    if (!_147)
    {
        float _151 = _137 * _137;
        float _153 = _151 * 0.5;
        _129 = _153;
    }
    float _155 = _129;
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
    bool _171 = !_147;
    float _173 = _169;
    if (!_171)
    {
        float _175 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _177 = log2(_175);
        float _179 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _181 = _179 + 1.0;
        float _183 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _185 = _137 * _177;
        float _187 = 1.0 / _181;
        float _189 = _183 * 0.693147182464599609375;
        float _191 = exp2(_185);
        float _193 = 1.0 / _189;
        float _195 = _191 + (-1.0);
        float _197 = -_195;
        float _199 = fma(_197, _193, _137);
        float _201 = _199 * _187;
        float _203 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _107 = _193;
        _173 = _203;
        _109 = _191;
    }
    float _205 = _107;
    float _207 = _173;
    float _209 = _109;
    bool _211 = !_147;
    float _213 = _205;
    float _215 = _209;
    if (!_211)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = 1.0 / _223;
        float _227 = _137 * _219;
        float _229 = exp2(_227);
        float _231 = -_229;
        float _233 = _231 + 1.0;
        float _235 = _233 * _225;
        _213 = _229;
        _215 = _223;
        _149 = _235;
    }
    float _237 = _213;
    float _239 = _215;
    float _241 = _149;
    float _243 = _239;
    float _245 = _237;
    if (!_147)
    {
        _243 = _105;
    }
    float _247 = _243;
    float _249 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _251 = _247;
    if (!_147)
    {
        float _253 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _245 = _253;
    }
    float _255 = _245;
    bool _257 = !_147;
    float _259 = _255;
    if (!_257)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _271 = _105 * _263;
        float _273 = 1.0 / _267;
        float _275 = _269 * 0.693147182464599609375;
        float _277 = exp2(_271);
        float _279 = 1.0 / _275;
        float _281 = _277 + (-1.0);
        float _283 = -_281;
        float _285 = fma(_283, _279, _105);
        float _287 = _285 * _273;
        float _289 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _259 = _289;
    }
    float _291 = _259;
    bool _293 = !_147;
    if (!_293)
    {
        float _295 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _297 = log2(_295);
        float _299 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _301 = _299 + 1.0;
        float _303 = 1.0 / _301;
        float _305 = _105 * _297;
        float _307 = exp2(_305);
        float _309 = -_307;
        float _311 = _309 + 1.0;
        float _313 = _311 * _303;
        _251 = _313;
    }
    float _315 = _251;
    float _317 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _319 = fma(_241, _133, _249);
    float _321 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _323 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _325 = fma(_315, _133, _317);
    float _327 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _329 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _331 = fma(_241, _131, _321);
    float _333 = fma(_315, _131, _323);
    float _335 = -_325;
    float _337 = _319 + _335;
    float _339 = fma(_241, _135, _327);
    float _341 = fma(_315, _135, _329);
    float _343 = -_333;
    float _345 = _331 + _343;
    float _347 = _337 * _337;
    float _349 = in.m_39.w;
    float _351 = -_341;
    float _353 = _339 + _351;
    float _355 = _337 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _357 = fma(_345, _345, _347);
    float _359 = _337 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _361 = _337 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _363 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[4].x, _355);
    float _365 = fma(_353, _353, _357);
    float _367 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[5].x, _359);
    float _369 = in.m_32.x;
    float _371 = in.m_32.y;
    float _373 = in.m_32.z;
    float _375 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[6].x, _361);
    float _377 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[4].z, _363);
    float _379 = sqrt(_365);
    float _381 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[5].z, _367);
    float _383 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[6].z, _375);
    bool _385 = _379 >= 9.9999999747524270787835121154785e-07;
    bool _387 = isnan(_379);
    bool _389 = _385 || _387;
    bool _391 = isnan(9.9999999747524270787835121154785e-07);
    bool _393 = _389 || _391;
    float _395 = fma(_331, _349, _369);
    float _397 = fma(_319, _349, _371);
    float _399 = fma(_339, _349, _373);
    float _401 = _381;
    float _403 = _377;
    float _405 = _383;
    if (!_393)
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
            _401 = _441;
            _403 = _439;
            _405 = _443;
            _445 = true;
        }
        else
        {
            float _447 = _133 * _133;
            float _449 = fma(_131, _131, _447);
            float _451 = fma(_135, _135, _449);
            float _453 = sqrt(_451);
            bool _455 = _453 >= 9.9999999747524270787835121154785e-07;
            bool _457 = isnan(_453);
            bool _459 = _455 || _457;
            bool _461 = isnan(9.9999999747524270787835121154785e-07);
            bool _463 = _459 || _461;
            if (!_463)
            {
                float _465 = _371 * _371;
                float _467 = fma(_369, _369, _465);
                float _469 = fma(_373, _373, _467);
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
                    _401 = _495;
                    _403 = _493;
                    _405 = _497;
                    _445 = true;
                }
                else
                {
                    float _499 = _371 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _501 = _371 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _503 = _371 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _505 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].x, _499);
                    float _507 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].x, _501);
                    float _509 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].x, _503);
                    float _511 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].z, _505);
                    float _513 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].z, _507);
                    float _515 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].z, _509);
                    float _517 = _511 * _511;
                    float _519 = fma(_513, _513, _517);
                    float _521 = fma(_515, _515, _519);
                    float _523 = rsqrt(_521);
                    float _525 = _523 * 9.9999999747524270787835121154785e-07;
                    float _527 = _513 * _525;
                    float _529 = _511 * _525;
                    float _531 = _515 * _525;
                    _401 = _529;
                    _403 = _527;
                    _405 = _531;
                    _445 = true;
                }
            }
            else
            {
                float _533 = _133 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _535 = _133 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _537 = _133 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _539 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[5].x, _533);
                float _541 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[4].x, _535);
                float _543 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[6].x, _537);
                float _545 = fma(_135, (*spvDescriptorSet0.vp_c10)._m0[5].z, _539);
                float _547 = fma(_135, (*spvDescriptorSet0.vp_c10)._m0[4].z, _541);
                float _549 = fma(_135, (*spvDescriptorSet0.vp_c10)._m0[6].z, _543);
                float _551 = _545 * _545;
                float _553 = fma(_547, _547, _551);
                float _555 = fma(_549, _549, _553);
                float _557 = rsqrt(_555);
                float _559 = _557 * 9.9999999747524270787835121154785e-07;
                float _561 = _547 * _559;
                float _563 = _545 * _559;
                float _565 = _549 * _559;
                _401 = _563;
                _403 = _561;
                _405 = _565;
            }
        }
    }
    _445 = false;
    float _567 = _401;
    float _569 = _403;
    float _571 = _405;
    bool _573 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _575 = !_573;
    float _593;
    if (!_575)
    {
        float _577 = in.m_41.x;
        float _579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _581 = _577 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _583 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _585 = _583 * _579;
        float _587 = floor(_585);
        float _589 = -_587;
        float _591 = _585 + _589;
        _593 = _591;
        _595 = true;
    }
    else
    {
        float _597 = float(_71);
        float _599 = 1.0 / _597;
        float _601 = _105 * _599;
        _593 = _601;
    }
    _595 = false;
    float _603 = _593;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _607 = _603 + _605;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _609;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _617;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _625;
    float _629 = 1.0 / _611;
    bool _631 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _633 = 1.0 / _615;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _637 = _603 + _635;
    float _639 = 1.0 / _623;
    float _641 = _637 * _629;
    bool _643 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _645 = isnan(_603);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    bool _655 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _657 = isnan(_603);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = 1.0 / _627;
    float _669 = _607 * _633;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _673 = _603 + _671;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _677 = _603 + _675;
    float _679 = 1.0 / _619;
    float _681 = _673 * _639;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _683;
    float _687 = fma(_685, _641, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _691 = _603 + _689;
    float _693 = _691 * _667;
    bool _695 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _697 = isnan(_603);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = _677 * _679;
    bool _709 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _711 = isnan(_603);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = -_653;
    float _723 = _721 + 1.0;
    float _725 = -_705;
    float _727 = _725 + 1.0;
    float _729 = -_719;
    float _731 = _729 + 1.0;
    float _733 = _705 * _723;
    float _735 = _719 * _727;
    bool _737 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _739 = isnan(_603);
    bool _741 = _737 || _739;
    bool _743 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _745 = _741 || _743;
    float _747 = float(_745);
    float _749 = _665 * _731;
    float _751 = -_665;
    float _753 = _751 + 1.0;
    bool _755 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _757 = isnan(_603);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _767;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _773 = _771 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _775 = _747 * _753;
    float _777 = -_747;
    float _779 = _777 + 1.0;
    float _781 = fma(_769, _641, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _783 = -_765;
    float _785 = _783 + 1.0;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _789 = _787 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _791 = _765 * _779;
    float _793 = fma(_773, _669, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _795;
    float _799 = fma(_789, _669, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _801 = _781 * _791;
    float _803 = _687 * _791;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _805;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _811 = _809 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _813 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[143].x, _801);
    float _815 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[143].y, _803);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _819 = _817 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _821 = fma(_797, _707, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _823 = fma(_807, _707, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _825 = fma(_793, _775, _813);
    float _827 = fma(_799, _775, _815);
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _829;
    float _833 = fma(_819, _681, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _835 = fma(_811, _681, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _837;
    float _841 = fma(_821, _749, _825);
    float _843 = fma(_823, _749, _827);
    float _845 = fma(_831, _693, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _847 = fma(_839, _693, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _849 = fma(_833, _735, _841);
    float _851 = fma(_835, _735, _843);
    float _853 = fma(_845, _733, _849);
    float _855 = fma(_847, _733, _851);
    float _857 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[148].x, _853);
    float _859 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[148].y, _855);
    bool _861 = !_631;
    float _879;
    if (!_861)
    {
        float _863 = in.m_41.x;
        float _865 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _867 = _863 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _869 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[11].x, _105);
        float _871 = _869 * _865;
        float _873 = floor(_871);
        float _875 = -_873;
        float _877 = _871 + _875;
        _879 = _877;
        _881 = true;
    }
    else
    {
        float _883 = float(_71);
        float _885 = 1.0 / _883;
        float _887 = _105 * _885;
        _879 = _887;
    }
    _881 = false;
    float _889 = _879;
    float _891 = _567 * _567;
    float _893 = in.m_41.x;
    float _895 = in.m_41.y;
    float _897 = _397 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _899 = fma(_569, _569, _891);
    float _901 = as_type<float>(int(gl_VertexIndex));
    float _903 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].x, _897);
    float _905 = fma(_571, _571, _899);
    float _907 = in.m_39.x;
    float _909 = in.m_39.y;
    float _911 = rsqrt(_905);
    bool _913 = _893 > 0.5;
    bool _915 = _895 > 0.5;
    float _917 = _911 * _571;
    float _919 = _911 * _569;
    float _921 = _911 * _567;
    float _923 = _397 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _925 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _927 = _917 * _925;
    float _929 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _931 = _919 * _929;
    float _933 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _935 = _921 * _933;
    float _937 = _397 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _939 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _941 = -_927;
    float _943 = fma(_919, _939, _941);
    float _945 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _947 = -_931;
    float _949 = fma(_921, _945, _947);
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _953 = -_935;
    float _955 = fma(_917, _951, _953);
    float _957 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].x, _923);
    float _959 = _943 * _943;
    int _961 = as_type<int>(_901) & 1;
    bool _963 = _961 != 0;
    int _965 = as_type<int>(_901) & 2;
    bool _967 = _965 != 0;
    float _969 = _857 * _907;
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _973 = _971 != 0;
    float _975 = fma(_955, _955, _959);
    float _977 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].x, _937);
    int _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _981 = _979 != 0;
    float _983 = _969 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _985 = fma(_949, _949, _975);
    float _987 = _859 * _909;
    float _989 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[6].z, _977);
    float _991 = rsqrt(_985);
    bool _993 = !_967;
    float _995 = _993 ? (-0.5) : 0.5;
    float _997 = _987 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _999;
    bool _1003 = !_963;
    float _1005 = _1003 ? (-0.5) : 0.5;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1009 = _1007 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1011 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _995);
    float _1013 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[5].z, _903);
    float _1015 = 1.0 / _1001;
    float _1017 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[4].z, _957);
    float _1019 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1005);
    float _1021 = _997 * _1011;
    float _1023 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1025 = _983 * _1019;
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1029 = _889 + _1027;
    float _1031 = _949 * _991;
    float _1033 = _943 * _991;
    float _1035 = _955 * _991;
    float _1037 = _1021 * _919;
    float _1039 = _921 * _1031;
    float _1041 = _1021 * _917;
    float _1043 = _919 * _1033;
    float _1045 = 1.0 / _1009;
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1049 = _889 + _1047;
    float _1051 = fma(_1025, _1035, _1037);
    float _1053 = fma(_1025, _1031, _1041);
    float _1055 = -_1043;
    float _1057 = fma(_921, _1035, _1055);
    float _1059 = _1049 * _1015;
    float _1061 = _1017 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1063 = fma(_1023, _1057, _1053);
    float _1065 = -_1039;
    float _1067 = fma(_917, _1033, _1065);
    float _1069 = _1021 * _921;
    float _1071 = _917 * _1035;
    float _1073 = -_1005;
    int _1075 = _913 ? as_type<int>(_1073) : as_type<int>(_1005);
    float _1077 = fma(_1023, _1067, _1051);
    float _1079 = _989 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1081 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1081;
    float _1085 = _1029 * _1045;
    float _1087 = _1061 + _1077;
    float _1089 = _1079 + _1063;
    float _1091 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1091;
    float _1095 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1095;
    float _1099 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1101 = _1087 + _1099;
    float _1103 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1105 = _1089 + _1103;
    float _1107 = fma(_1083, _1059, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1111 = _1109 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1113 = _1101 * _1101;
    float _1115 = _1105 * _1105;
    float _1117 = fma(_1093, _1059, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1119 = fma(_1097, _1059, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1123 = _1121 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1125 = _1113 + _1115;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1129 = _1127 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1131 = fma(_1111, _1085, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1133 = fma(_1123, _1085, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1135 = sqrt(_1125);
    float _1137 = fma(_1129, _1085, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _1139 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1141 = isnan(_889);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    float _1151 = fma(_1025, _1033, _1069);
    bool _1153 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1155 = isnan(_889);
    bool _1157 = _1153 || _1155;
    bool _1159 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1161 = _1157 || _1159;
    float _1163 = float(_1161);
    float _1165 = -_1071;
    float _1167 = fma(_919, _1031, _1165);
    bool _1169 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1171 = isnan(_889);
    bool _1173 = _1169 || _1171;
    bool _1175 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1177 = _1173 || _1175;
    float _1179 = float(_1177);
    float _1181 = -_1149;
    float _1183 = _1181 + 1.0;
    float _1185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1187 = fma(_1023, _1167, _1151);
    float _1189 = _1013 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1191 = _1179 * _1183;
    float _1193 = -_1163;
    float _1195 = _1193 + 1.0;
    float _1197 = -_1179;
    float _1199 = _1197 + 1.0;
    bool _1201 = !_973;
    float _1203 = _1201 ? _1005 : as_type<float>(_1075);
    float _1205 = _1117 * _1191;
    bool _1207 = _1135 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1209 = _1189 + _1187;
    float _1211 = -_995;
    int _1213 = _915 ? as_type<int>(_1211) : as_type<int>(_995);
    float _1215 = _1149 * _1195;
    float _1217 = _1107 * _1191;
    float _1219 = _1119 * _1191;
    float _1221 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1205);
    bool _1223 = !_981;
    float _1225 = _1223 ? _995 : as_type<float>(_1213);
    float _1227 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1217);
    float _1229 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1219);
    float _1231 = fma(_1131, _1215, _1221);
    float _1233 = _1167;
    float _1235 = _1113;
    float _1237 = _1115;
    float _1239 = _1087;
    float _1241 = _1089;
    float _1243 = _1163;
    if (!_1207)
    {
        _1233 = _1209;
    }
    float _1245 = _1233;
    bool _1247 = !_1207;
    float _1249 = _1245;
    if (!_1247)
    {
        float _1251 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1253 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1255 = _1135 + _1253;
        float _1257 = _1209 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1259 = rsqrt(_1125);
        float _1261 = _1255 * _1251;
        float _1263 = _1261 * 0.15915493667125701904296875;
        float _1265 = _1263 * 6.283185482025146484375;
        float _1267 = sin(_1265);
        float _1269 = _1263 * 6.283185482025146484375;
        float _1271 = cos(_1269);
        float _1273 = fma(_1267, _1257, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1275 = _1259 * _1273;
        float _1277 = _1271 + (-1.0);
        float _1279 = fma(_1101, _1275, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1281 = fma(_1105, _1275, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1283 = _1277 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1285 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1287 = _1279 + _1285;
        float _1289 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1291 = _1281 + _1289;
        float _1293 = fma(_1209, _1271, _1283);
        float _1295 = _1287 * _1287;
        float _1297 = _1291 * _1291;
        _1249 = _1293;
        _1235 = _1295;
        _1237 = _1297;
        _1239 = _1279;
        _1241 = _1281;
    }
    float _1299 = _1249;
    float _1301 = _1235;
    float _1303 = _1237;
    float _1305 = _1239;
    float _1307 = _1241;
    float _1309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1311 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1313 = _1299 + _1311;
    float _1315 = _1203 + 0.5;
    float _1317 = -_1225;
    float _1319 = _1317 + 0.5;
    float _1321 = fma(_1133, _1215, _1227);
    float _1323 = fma(_1313, _1313, _1301);
    float _1325 = fma(_1137, _1215, _1229);
    float _1327 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1329 = _1323 + _1303;
    float _1331 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1333 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1231);
    float _1335 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1321);
    float _1337 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1325);
    float _1339 = _1327 * _1185;
    float _1341 = sqrt(_1329);
    float _1343 = _1331 * _1309;
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1349 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1351 = _1333 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1353 = _1335 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1355 = _1337 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1357 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1359 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1361 = _1347 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1363 = _1349 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1365 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1367 = _1353 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1369 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_46.x = _1339;
    out.m_46.y = _1343;
    bool _1371 = _1341 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1373 = isnan(_1341);
    bool _1375 = _1371 || _1373;
    bool _1377 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1379 = _1375 || _1377;
    out.m_48.x = _1359;
    out.m_48.y = _1361;
    out.m_48.z = _1363;
    out.m_50.x = _1365;
    out.m_50.y = _1367;
    out.m_50.z = _1369;
    out.m_50.w = _1357;
    if (!_1379)
    {
        _1243 = 1.0;
    }
    float _1381 = _1243;
    bool _1383 = !_1379;
    float _1385 = _1381;
    if (!_1383)
    {
        bool _1387 = _1341 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1389 = isnan(_1341);
        bool _1391 = _1387 || _1389;
        bool _1393 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1395 = _1391 || _1393;
        if (!_1395)
        {
            float _1397 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1399 = _1341 + _1397;
            float _1401 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1403 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1401;
            float _1405 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1407 = _1405 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1409 = 1.0 / _1403;
            float _1411 = _1399 * _1409;
            float _1413 = fma(_1411, _1407, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1385 = _1413;
            _1415 = true;
        }
        else
        {
            bool _1417 = _1341 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1419 = isnan(_1341);
            bool _1421 = _1417 || _1419;
            bool _1423 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1425 = _1421 || _1423;
            if (!_1425)
            {
                float _1427 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1429 = _1341 + _1427;
                float _1431 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1433 = _1431 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1435 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1437 = _1435 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1439 = 1.0 / _1433;
                float _1441 = _1429 * _1439;
                float _1443 = fma(_1441, _1437, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1385 = _1443;
                _1415 = true;
            }
            else
            {
                _1385 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1415 = false;
    float _1445 = _1385;
    float _1447 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1449 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1451 = _1305 + _1449;
    float _1453 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1455 = _1299 + _1453;
    float _1457 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1447);
    float _1459 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1461 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1463 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1465 = _1461 || _1463;
    bool _1467 = isnan(0.5);
    bool _1469 = _1465 || _1467;
    float _1471 = fma(_1451, _1445, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1473 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1457);
    float _1475 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1459);
    float _1477 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1479 = _1307 + _1477;
    float _1481 = _1473 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1483 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1475);
    float _1485 = fma(_1455, _1445, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1487 = fma(_1479, _1445, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1489 = 1.0 / _1481;
    float _1491 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1493 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1495 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1497 = _1493 || _1495;
    bool _1499 = isnan(0.5);
    bool _1501 = _1497 || _1499;
    float _1503 = _1479;
    float _1505 = _1491;
    float _1507 = _1445;
    if (_1469)
    {
        _1503 = _1471;
    }
    float _1509 = _1503;
    float _1511 = _1491 + _1481;
    float _1513 = _1509;
    if (_1469)
    {
        _1505 = _1485;
    }
    float _1515 = _1505;
    float _1517 = _1515;
    if (_1469)
    {
        _1507 = _1487;
    }
    float _1519 = _1507;
    float _1521 = _1519;
    if (!_1469)
    {
        float _1523 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1525 = _1189 + _1523;
        float _1527 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1529 = _1061 + _1527;
        float _1531 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1533 = _1525 * _1525;
        float _1535 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1537 = _1079 + _1535;
        float _1539 = fma(_1529, _1529, _1533);
        float _1541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1543 = fma(_1537, _1537, _1539);
        float _1545 = sqrt(_1543);
        float _1547 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1549 = -_1079;
        float _1551 = _1549 + _1487;
        float _1553 = precise::min(_1545, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1555 = _1553 * _1541;
        float _1557 = -_1061;
        float _1559 = _1557 + _1471;
        float _1561 = _1547 * _1555;
        float _1563 = -_1189;
        float _1565 = _1563 + _1485;
        float _1567 = fma(_1559, _1561, _1061);
        float _1569 = fma(_1565, _1561, _1189);
        float _1571 = fma(_1551, _1561, _1079);
        _1517 = _1569;
        _1513 = _1567;
        _1521 = _1571;
    }
    float _1573 = _1517;
    float _1575 = _1513;
    float _1577 = _1521;
    float _1579 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1581 = _1511 * _1489;
    float _1583 = _1581 * 0.5;
    float _1585 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1587 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1589 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1591 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1579);
    float _1593 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1585);
    float _1595 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1587);
    float _1597 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1589);
    float _1599 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1591);
    float _1601 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1593);
    float _1603 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1595);
    float _1605 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1597);
    float _1607 = _1599 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1609 = _1585;
    if (_1501)
    {
        _1609 = 1.0;
    }
    float _1611 = _1609;
    float _1613 = _1611;
    if (!_1501)
    {
        float _1615 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1617 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1619 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1617);
        float _1621 = _1615 * 0.15915493667125701904296875;
        float _1623 = _1621 * 6.283185482025146484375;
        float _1625 = cos(_1623);
        float _1627 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1629 = _1627 * 0.15915493667125701904296875;
        float _1631 = _1621 * 6.283185482025146484375;
        float _1633 = sin(_1631);
        float _1635 = 1.0 / _1625;
        float _1637 = _1629 * 6.283185482025146484375;
        float _1639 = cos(_1637);
        float _1641 = _1633 * _1635;
        float _1643 = 1.0 / _1619;
        float _1645 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1647 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1645;
        float _1649 = _1639 * _1641;
        float _1651 = _1629 * 6.283185482025146484375;
        float _1653 = sin(_1651);
        float _1655 = 1.0 / _1649;
        float _1657 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1659 = _1643 * _1657;
        float _1661 = 1.0 / _1647;
        float _1663 = _1653 * _1655;
        float _1665 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1667 = fma(_1663, _1659, _1665);
        float _1669 = _1667 * _1661;
        float _1671 = precise::clamp(_1669, 0.0, 1.0);
        _1613 = _1671;
    }
    float _1673 = _1613;
    float _1675 = _1601 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1677 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1679 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1681 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1683 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1685 = _1603 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1687 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1677);
    float _1689 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1679);
    float _1691 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1681);
    float _1693 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1683);
    float _1695 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1697 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1687);
    float _1699 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1689);
    float _1701 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1691);
    float _1703 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1693);
    bool _1705 = _1673 > 0.0;
    bool _1707 = isnan(_1673);
    bool _1709 = _1705 || _1707;
    bool _1711 = isnan(0.0);
    bool _1713 = _1709 || _1711;
    float _1715 = _1673 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1717 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1697);
    float _1719 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1701);
    float _1721 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1699);
    float _1723 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1703);
    float _1725 = _1715 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1727 = _1717 + _1719;
    float _1729 = _1721 + _1719;
    float _1731 = _1719 * 0.5;
    float _1733 = _1727 * 0.5;
    float _1735 = _1729 * 0.5;
    float _1737 = fma(_1723, -0.5, _1731);
    out.m_35.x = _1725;
    out.gl_Position.x = _1717;
    out.gl_Position.y = _1723;
    out.gl_Position.z = _1721;
    out.gl_Position.w = _1719;
    out.m_52.x = _1733;
    out.m_52.y = _1737;
    out.m_52.z = _1735;
    out.m_52.w = _1719;
    if (_1713)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _1739 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1739;
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
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1415 = false;
    bool _881 = false;
    bool _595 = false;
    bool _445 = false;
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
        float _1796 = as_type<float>(_87);
        out.gl_Position.z = _1796;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _109 = 0.0;
    if (_101)
    {
        float _111 = float(_71);
        _81 = _111;
    }
    float _113 = _81;
    bool _115 = _105 >= _113;
    bool _117 = !_101;
    bool _119 = _115 || _117;
    float _121 = _113;
    if (_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    if (_119)
    {
        out.m_35.x = 0.0;
    }
    if (_119)
    {
        float _125 = _123 * 5.0;
        _89 = as_type<int>(_125);
    }
    int _127 = _89;
    float _129 = as_type<float>(_127);
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1867 = as_type<float>(_127);
        out.gl_Position.z = _1867;
    }
    if (_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_37.x;
    float _133 = in.m_37.y;
    float _135 = in.m_37.z;
    float _137 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _139 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _141 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _143 = _139 || _141;
    bool _145 = isnan(1.0);
    bool _147 = _143 || _145;
    float _149 = _137;
    if (!_147)
    {
        float _151 = _137 * _137;
        float _153 = _151 * 0.5;
        _129 = _153;
    }
    float _155 = _129;
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
    bool _171 = !_147;
    float _173 = _169;
    if (!_171)
    {
        float _175 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _177 = log2(_175);
        float _179 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _181 = _179 + 1.0;
        float _183 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _185 = _137 * _177;
        float _187 = 1.0 / _181;
        float _189 = _183 * 0.693147182464599609375;
        float _191 = exp2(_185);
        float _193 = 1.0 / _189;
        float _195 = _191 + (-1.0);
        float _197 = -_195;
        float _199 = fma(_197, _193, _137);
        float _201 = _199 * _187;
        float _203 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _107 = _193;
        _173 = _203;
        _109 = _191;
    }
    float _205 = _107;
    float _207 = _173;
    float _209 = _109;
    bool _211 = !_147;
    float _213 = _205;
    float _215 = _209;
    if (!_211)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = 1.0 / _223;
        float _227 = _137 * _219;
        float _229 = exp2(_227);
        float _231 = -_229;
        float _233 = _231 + 1.0;
        float _235 = _233 * _225;
        _213 = _229;
        _215 = _223;
        _149 = _235;
    }
    float _237 = _213;
    float _239 = _215;
    float _241 = _149;
    float _243 = _239;
    float _245 = _237;
    if (!_147)
    {
        _243 = _105;
    }
    float _247 = _243;
    float _249 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _251 = _247;
    if (!_147)
    {
        float _253 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _245 = _253;
    }
    float _255 = _245;
    bool _257 = !_147;
    float _259 = _255;
    if (!_257)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _271 = _105 * _263;
        float _273 = 1.0 / _267;
        float _275 = _269 * 0.693147182464599609375;
        float _277 = exp2(_271);
        float _279 = 1.0 / _275;
        float _281 = _277 + (-1.0);
        float _283 = -_281;
        float _285 = fma(_283, _279, _105);
        float _287 = _285 * _273;
        float _289 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _259 = _289;
    }
    float _291 = _259;
    bool _293 = !_147;
    if (!_293)
    {
        float _295 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _297 = log2(_295);
        float _299 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _301 = _299 + 1.0;
        float _303 = 1.0 / _301;
        float _305 = _105 * _297;
        float _307 = exp2(_305);
        float _309 = -_307;
        float _311 = _309 + 1.0;
        float _313 = _311 * _303;
        _251 = _313;
    }
    float _315 = _251;
    float _317 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _319 = fma(_241, _133, _249);
    float _321 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _323 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _325 = fma(_315, _133, _317);
    float _327 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _329 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _331 = fma(_241, _131, _321);
    float _333 = fma(_315, _131, _323);
    float _335 = -_325;
    float _337 = _319 + _335;
    float _339 = fma(_241, _135, _327);
    float _341 = fma(_315, _135, _329);
    float _343 = -_333;
    float _345 = _331 + _343;
    float _347 = _337 * _337;
    float _349 = in.m_39.w;
    float _351 = -_341;
    float _353 = _339 + _351;
    float _355 = _337 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _357 = fma(_345, _345, _347);
    float _359 = _337 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _361 = _337 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _363 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[4].x, _355);
    float _365 = fma(_353, _353, _357);
    float _367 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[5].x, _359);
    float _369 = in.m_32.x;
    float _371 = in.m_32.y;
    float _373 = in.m_32.z;
    float _375 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[6].x, _361);
    float _377 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[4].z, _363);
    float _379 = sqrt(_365);
    float _381 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[5].z, _367);
    float _383 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[6].z, _375);
    bool _385 = _379 >= 9.9999999747524270787835121154785e-07;
    bool _387 = isnan(_379);
    bool _389 = _385 || _387;
    bool _391 = isnan(9.9999999747524270787835121154785e-07);
    bool _393 = _389 || _391;
    float _395 = fma(_331, _349, _369);
    float _397 = fma(_319, _349, _371);
    float _399 = fma(_339, _349, _373);
    float _401 = _381;
    float _403 = _377;
    float _405 = _383;
    if (!_393)
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
            _401 = _441;
            _403 = _439;
            _405 = _443;
            _445 = true;
        }
        else
        {
            float _447 = _133 * _133;
            float _449 = fma(_131, _131, _447);
            float _451 = fma(_135, _135, _449);
            float _453 = sqrt(_451);
            bool _455 = _453 >= 9.9999999747524270787835121154785e-07;
            bool _457 = isnan(_453);
            bool _459 = _455 || _457;
            bool _461 = isnan(9.9999999747524270787835121154785e-07);
            bool _463 = _459 || _461;
            if (!_463)
            {
                float _465 = _371 * _371;
                float _467 = fma(_369, _369, _465);
                float _469 = fma(_373, _373, _467);
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
                    _401 = _495;
                    _403 = _493;
                    _405 = _497;
                    _445 = true;
                }
                else
                {
                    float _499 = _371 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _501 = _371 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _503 = _371 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _505 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].x, _499);
                    float _507 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].x, _501);
                    float _509 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].x, _503);
                    float _511 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].z, _505);
                    float _513 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].z, _507);
                    float _515 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].z, _509);
                    float _517 = _511 * _511;
                    float _519 = fma(_513, _513, _517);
                    float _521 = fma(_515, _515, _519);
                    float _523 = rsqrt(_521);
                    float _525 = _523 * 9.9999999747524270787835121154785e-07;
                    float _527 = _513 * _525;
                    float _529 = _511 * _525;
                    float _531 = _515 * _525;
                    _401 = _529;
                    _403 = _527;
                    _405 = _531;
                    _445 = true;
                }
            }
            else
            {
                float _533 = _133 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _535 = _133 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _537 = _133 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _539 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[5].x, _533);
                float _541 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[4].x, _535);
                float _543 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[6].x, _537);
                float _545 = fma(_135, (*spvDescriptorSet0.vp_c10)._m0[5].z, _539);
                float _547 = fma(_135, (*spvDescriptorSet0.vp_c10)._m0[4].z, _541);
                float _549 = fma(_135, (*spvDescriptorSet0.vp_c10)._m0[6].z, _543);
                float _551 = _545 * _545;
                float _553 = fma(_547, _547, _551);
                float _555 = fma(_549, _549, _553);
                float _557 = rsqrt(_555);
                float _559 = _557 * 9.9999999747524270787835121154785e-07;
                float _561 = _547 * _559;
                float _563 = _545 * _559;
                float _565 = _549 * _559;
                _401 = _563;
                _403 = _561;
                _405 = _565;
            }
        }
    }
    _445 = false;
    float _567 = _401;
    float _569 = _403;
    float _571 = _405;
    bool _573 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _575 = !_573;
    float _593;
    if (!_575)
    {
        float _577 = in.m_41.x;
        float _579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _581 = _577 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _583 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _585 = _583 * _579;
        float _587 = floor(_585);
        float _589 = -_587;
        float _591 = _585 + _589;
        _593 = _591;
        _595 = true;
    }
    else
    {
        float _597 = float(_71);
        float _599 = 1.0 / _597;
        float _601 = _105 * _599;
        _593 = _601;
    }
    _595 = false;
    float _603 = _593;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _607 = _603 + _605;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _609;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _617;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _625;
    float _629 = 1.0 / _611;
    bool _631 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _633 = 1.0 / _615;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _637 = _603 + _635;
    float _639 = 1.0 / _623;
    float _641 = _637 * _629;
    bool _643 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _645 = isnan(_603);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    bool _655 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _657 = isnan(_603);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = 1.0 / _627;
    float _669 = _607 * _633;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _673 = _603 + _671;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _677 = _603 + _675;
    float _679 = 1.0 / _619;
    float _681 = _673 * _639;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _683;
    float _687 = fma(_685, _641, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _691 = _603 + _689;
    float _693 = _691 * _667;
    bool _695 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _697 = isnan(_603);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = _677 * _679;
    bool _709 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _711 = isnan(_603);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = -_653;
    float _723 = _721 + 1.0;
    float _725 = -_705;
    float _727 = _725 + 1.0;
    float _729 = -_719;
    float _731 = _729 + 1.0;
    float _733 = _705 * _723;
    float _735 = _719 * _727;
    bool _737 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _739 = isnan(_603);
    bool _741 = _737 || _739;
    bool _743 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _745 = _741 || _743;
    float _747 = float(_745);
    float _749 = _665 * _731;
    float _751 = -_665;
    float _753 = _751 + 1.0;
    bool _755 = _603 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _757 = isnan(_603);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _767;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _773 = _771 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _775 = _747 * _753;
    float _777 = -_747;
    float _779 = _777 + 1.0;
    float _781 = fma(_769, _641, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _783 = -_765;
    float _785 = _783 + 1.0;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _789 = _787 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _791 = _765 * _779;
    float _793 = fma(_773, _669, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _795;
    float _799 = fma(_789, _669, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _801 = _781 * _791;
    float _803 = _687 * _791;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _805;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _811 = _809 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _813 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[143].x, _801);
    float _815 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[143].y, _803);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _819 = _817 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _821 = fma(_797, _707, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _823 = fma(_807, _707, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _825 = fma(_793, _775, _813);
    float _827 = fma(_799, _775, _815);
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _829;
    float _833 = fma(_819, _681, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _835 = fma(_811, _681, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _837;
    float _841 = fma(_821, _749, _825);
    float _843 = fma(_823, _749, _827);
    float _845 = fma(_831, _693, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _847 = fma(_839, _693, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _849 = fma(_833, _735, _841);
    float _851 = fma(_835, _735, _843);
    float _853 = fma(_845, _733, _849);
    float _855 = fma(_847, _733, _851);
    float _857 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[148].x, _853);
    float _859 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[148].y, _855);
    bool _861 = !_631;
    float _879;
    if (!_861)
    {
        float _863 = in.m_41.x;
        float _865 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _867 = _863 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _869 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[11].x, _105);
        float _871 = _869 * _865;
        float _873 = floor(_871);
        float _875 = -_873;
        float _877 = _871 + _875;
        _879 = _877;
        _881 = true;
    }
    else
    {
        float _883 = float(_71);
        float _885 = 1.0 / _883;
        float _887 = _105 * _885;
        _879 = _887;
    }
    _881 = false;
    float _889 = _879;
    float _891 = _567 * _567;
    float _893 = in.m_41.x;
    float _895 = in.m_41.y;
    float _897 = _397 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _899 = fma(_569, _569, _891);
    float _901 = as_type<float>(int(gl_VertexIndex));
    float _903 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].x, _897);
    float _905 = fma(_571, _571, _899);
    float _907 = in.m_39.x;
    float _909 = in.m_39.y;
    float _911 = rsqrt(_905);
    bool _913 = _893 > 0.5;
    bool _915 = _895 > 0.5;
    float _917 = _911 * _571;
    float _919 = _911 * _569;
    float _921 = _911 * _567;
    float _923 = _397 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _925 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _927 = _917 * _925;
    float _929 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _931 = _919 * _929;
    float _933 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _935 = _921 * _933;
    float _937 = _397 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _939 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _941 = -_927;
    float _943 = fma(_919, _939, _941);
    float _945 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _947 = -_931;
    float _949 = fma(_921, _945, _947);
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _953 = -_935;
    float _955 = fma(_917, _951, _953);
    float _957 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].x, _923);
    float _959 = _943 * _943;
    int _961 = as_type<int>(_901) & 1;
    bool _963 = _961 != 0;
    int _965 = as_type<int>(_901) & 2;
    bool _967 = _965 != 0;
    float _969 = _857 * _907;
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _973 = _971 != 0;
    float _975 = fma(_955, _955, _959);
    float _977 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].x, _937);
    int _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _981 = _979 != 0;
    float _983 = _969 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _985 = fma(_949, _949, _975);
    float _987 = _859 * _909;
    float _989 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[6].z, _977);
    float _991 = rsqrt(_985);
    bool _993 = !_967;
    float _995 = _993 ? (-0.5) : 0.5;
    float _997 = _987 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _999;
    bool _1003 = !_963;
    float _1005 = _1003 ? (-0.5) : 0.5;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1009 = _1007 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1011 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _995);
    float _1013 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[5].z, _903);
    float _1015 = 1.0 / _1001;
    float _1017 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[4].z, _957);
    float _1019 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1005);
    float _1021 = _997 * _1011;
    float _1023 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1025 = _983 * _1019;
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1029 = _889 + _1027;
    float _1031 = _949 * _991;
    float _1033 = _943 * _991;
    float _1035 = _955 * _991;
    float _1037 = _1021 * _919;
    float _1039 = _921 * _1031;
    float _1041 = _1021 * _917;
    float _1043 = _919 * _1033;
    float _1045 = 1.0 / _1009;
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1049 = _889 + _1047;
    float _1051 = fma(_1025, _1035, _1037);
    float _1053 = fma(_1025, _1031, _1041);
    float _1055 = -_1043;
    float _1057 = fma(_921, _1035, _1055);
    float _1059 = _1049 * _1015;
    float _1061 = _1017 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1063 = fma(_1023, _1057, _1053);
    float _1065 = -_1039;
    float _1067 = fma(_917, _1033, _1065);
    float _1069 = _1021 * _921;
    float _1071 = _917 * _1035;
    float _1073 = -_1005;
    int _1075 = _913 ? as_type<int>(_1073) : as_type<int>(_1005);
    float _1077 = fma(_1023, _1067, _1051);
    float _1079 = _989 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1081 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1081;
    float _1085 = _1029 * _1045;
    float _1087 = _1061 + _1077;
    float _1089 = _1079 + _1063;
    float _1091 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1091;
    float _1095 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1095;
    float _1099 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1101 = _1087 + _1099;
    float _1103 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1105 = _1089 + _1103;
    float _1107 = fma(_1083, _1059, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1111 = _1109 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1113 = _1101 * _1101;
    float _1115 = _1105 * _1105;
    float _1117 = fma(_1093, _1059, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1119 = fma(_1097, _1059, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1123 = _1121 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1125 = _1113 + _1115;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1129 = _1127 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1131 = fma(_1111, _1085, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1133 = fma(_1123, _1085, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1135 = sqrt(_1125);
    float _1137 = fma(_1129, _1085, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _1139 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1141 = isnan(_889);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    float _1151 = fma(_1025, _1033, _1069);
    bool _1153 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1155 = isnan(_889);
    bool _1157 = _1153 || _1155;
    bool _1159 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1161 = _1157 || _1159;
    float _1163 = float(_1161);
    float _1165 = -_1071;
    float _1167 = fma(_919, _1031, _1165);
    bool _1169 = _889 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1171 = isnan(_889);
    bool _1173 = _1169 || _1171;
    bool _1175 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1177 = _1173 || _1175;
    float _1179 = float(_1177);
    float _1181 = -_1149;
    float _1183 = _1181 + 1.0;
    float _1185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1187 = fma(_1023, _1167, _1151);
    float _1189 = _1013 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1191 = _1179 * _1183;
    float _1193 = -_1163;
    float _1195 = _1193 + 1.0;
    float _1197 = -_1179;
    float _1199 = _1197 + 1.0;
    bool _1201 = !_973;
    float _1203 = _1201 ? _1005 : as_type<float>(_1075);
    float _1205 = _1117 * _1191;
    bool _1207 = _1135 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1209 = _1189 + _1187;
    float _1211 = -_995;
    int _1213 = _915 ? as_type<int>(_1211) : as_type<int>(_995);
    float _1215 = _1149 * _1195;
    float _1217 = _1107 * _1191;
    float _1219 = _1119 * _1191;
    float _1221 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1205);
    bool _1223 = !_981;
    float _1225 = _1223 ? _995 : as_type<float>(_1213);
    float _1227 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1217);
    float _1229 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1219);
    float _1231 = fma(_1131, _1215, _1221);
    float _1233 = _1167;
    float _1235 = _1113;
    float _1237 = _1115;
    float _1239 = _1087;
    float _1241 = _1089;
    float _1243 = _1163;
    if (!_1207)
    {
        _1233 = _1209;
    }
    float _1245 = _1233;
    bool _1247 = !_1207;
    float _1249 = _1245;
    if (!_1247)
    {
        float _1251 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1253 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1255 = _1135 + _1253;
        float _1257 = _1209 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1259 = rsqrt(_1125);
        float _1261 = _1255 * _1251;
        float _1263 = _1261 * 0.15915493667125701904296875;
        float _1265 = _1263 * 6.283185482025146484375;
        float _1267 = sin(_1265);
        float _1269 = _1263 * 6.283185482025146484375;
        float _1271 = cos(_1269);
        float _1273 = fma(_1267, _1257, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1275 = _1259 * _1273;
        float _1277 = _1271 + (-1.0);
        float _1279 = fma(_1101, _1275, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1281 = fma(_1105, _1275, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1283 = _1277 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1285 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1287 = _1279 + _1285;
        float _1289 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1291 = _1281 + _1289;
        float _1293 = fma(_1209, _1271, _1283);
        float _1295 = _1287 * _1287;
        float _1297 = _1291 * _1291;
        _1249 = _1293;
        _1235 = _1295;
        _1237 = _1297;
        _1239 = _1279;
        _1241 = _1281;
    }
    float _1299 = _1249;
    float _1301 = _1235;
    float _1303 = _1237;
    float _1305 = _1239;
    float _1307 = _1241;
    float _1309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1311 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1313 = _1299 + _1311;
    float _1315 = _1203 + 0.5;
    float _1317 = -_1225;
    float _1319 = _1317 + 0.5;
    float _1321 = fma(_1133, _1215, _1227);
    float _1323 = fma(_1313, _1313, _1301);
    float _1325 = fma(_1137, _1215, _1229);
    float _1327 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1329 = _1323 + _1303;
    float _1331 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1333 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1231);
    float _1335 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1321);
    float _1337 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1325);
    float _1339 = _1327 * _1185;
    float _1341 = sqrt(_1329);
    float _1343 = _1331 * _1309;
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1349 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1351 = _1333 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1353 = _1335 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1355 = _1337 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1357 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1359 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1361 = _1347 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1363 = _1349 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1365 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1367 = _1353 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1369 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_46.x = _1339;
    out.m_46.y = _1343;
    bool _1371 = _1341 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1373 = isnan(_1341);
    bool _1375 = _1371 || _1373;
    bool _1377 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1379 = _1375 || _1377;
    out.m_48.x = _1359;
    out.m_48.y = _1361;
    out.m_48.z = _1363;
    out.m_50.x = _1365;
    out.m_50.y = _1367;
    out.m_50.z = _1369;
    out.m_50.w = _1357;
    if (!_1379)
    {
        _1243 = 1.0;
    }
    float _1381 = _1243;
    bool _1383 = !_1379;
    float _1385 = _1381;
    if (!_1383)
    {
        bool _1387 = _1341 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1389 = isnan(_1341);
        bool _1391 = _1387 || _1389;
        bool _1393 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1395 = _1391 || _1393;
        if (!_1395)
        {
            float _1397 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1399 = _1341 + _1397;
            float _1401 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1403 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1401;
            float _1405 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1407 = _1405 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1409 = 1.0 / _1403;
            float _1411 = _1399 * _1409;
            float _1413 = fma(_1411, _1407, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1385 = _1413;
            _1415 = true;
        }
        else
        {
            bool _1417 = _1341 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1419 = isnan(_1341);
            bool _1421 = _1417 || _1419;
            bool _1423 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1425 = _1421 || _1423;
            if (!_1425)
            {
                float _1427 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1429 = _1341 + _1427;
                float _1431 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1433 = _1431 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1435 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1437 = _1435 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1439 = 1.0 / _1433;
                float _1441 = _1429 * _1439;
                float _1443 = fma(_1441, _1437, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1385 = _1443;
                _1415 = true;
            }
            else
            {
                _1385 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1415 = false;
    float _1445 = _1385;
    float _1447 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1449 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1451 = _1305 + _1449;
    float _1453 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1455 = _1299 + _1453;
    float _1457 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1447);
    float _1459 = _1189 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1461 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1463 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1465 = _1461 || _1463;
    bool _1467 = isnan(0.5);
    bool _1469 = _1465 || _1467;
    float _1471 = fma(_1451, _1445, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1473 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1457);
    float _1475 = fma(_1061, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1459);
    float _1477 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1479 = _1307 + _1477;
    float _1481 = _1473 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1483 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1475);
    float _1485 = fma(_1455, _1445, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1487 = fma(_1479, _1445, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1489 = 1.0 / _1481;
    float _1491 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1493 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1495 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1497 = _1493 || _1495;
    bool _1499 = isnan(0.5);
    bool _1501 = _1497 || _1499;
    float _1503 = _1479;
    float _1505 = _1491;
    float _1507 = _1445;
    if (_1469)
    {
        _1503 = _1471;
    }
    float _1509 = _1503;
    float _1511 = _1491 + _1481;
    float _1513 = _1509;
    if (_1469)
    {
        _1505 = _1485;
    }
    float _1515 = _1505;
    float _1517 = _1515;
    if (_1469)
    {
        _1507 = _1487;
    }
    float _1519 = _1507;
    float _1521 = _1519;
    if (!_1469)
    {
        float _1523 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1525 = _1189 + _1523;
        float _1527 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1529 = _1061 + _1527;
        float _1531 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1533 = _1525 * _1525;
        float _1535 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1537 = _1079 + _1535;
        float _1539 = fma(_1529, _1529, _1533);
        float _1541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1543 = fma(_1537, _1537, _1539);
        float _1545 = sqrt(_1543);
        float _1547 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1549 = -_1079;
        float _1551 = _1549 + _1487;
        float _1553 = precise::min(_1545, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1555 = _1553 * _1541;
        float _1557 = -_1061;
        float _1559 = _1557 + _1471;
        float _1561 = _1547 * _1555;
        float _1563 = -_1189;
        float _1565 = _1563 + _1485;
        float _1567 = fma(_1559, _1561, _1061);
        float _1569 = fma(_1565, _1561, _1189);
        float _1571 = fma(_1551, _1561, _1079);
        _1517 = _1569;
        _1513 = _1567;
        _1521 = _1571;
    }
    float _1573 = _1517;
    float _1575 = _1513;
    float _1577 = _1521;
    float _1579 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1581 = _1511 * _1489;
    float _1583 = _1581 * 0.5;
    float _1585 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1587 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1589 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1591 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1579);
    float _1593 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1585);
    float _1595 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1587);
    float _1597 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1589);
    float _1599 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1591);
    float _1601 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1593);
    float _1603 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1595);
    float _1605 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1597);
    float _1607 = _1599 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1609 = _1585;
    if (_1501)
    {
        _1609 = 1.0;
    }
    float _1611 = _1609;
    float _1613 = _1611;
    if (!_1501)
    {
        float _1615 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1617 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1619 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1617);
        float _1621 = _1615 * 0.15915493667125701904296875;
        float _1623 = _1621 * 6.283185482025146484375;
        float _1625 = cos(_1623);
        float _1627 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1629 = _1627 * 0.15915493667125701904296875;
        float _1631 = _1621 * 6.283185482025146484375;
        float _1633 = sin(_1631);
        float _1635 = 1.0 / _1625;
        float _1637 = _1629 * 6.283185482025146484375;
        float _1639 = cos(_1637);
        float _1641 = _1633 * _1635;
        float _1643 = 1.0 / _1619;
        float _1645 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1647 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1645;
        float _1649 = _1639 * _1641;
        float _1651 = _1629 * 6.283185482025146484375;
        float _1653 = sin(_1651);
        float _1655 = 1.0 / _1649;
        float _1657 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1659 = _1643 * _1657;
        float _1661 = 1.0 / _1647;
        float _1663 = _1653 * _1655;
        float _1665 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1667 = fma(_1663, _1659, _1665);
        float _1669 = _1667 * _1661;
        float _1671 = precise::clamp(_1669, 0.0, 1.0);
        _1613 = _1671;
    }
    float _1673 = _1613;
    float _1675 = _1601 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1677 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1679 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1681 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1683 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1685 = _1603 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1687 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1677);
    float _1689 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1679);
    float _1691 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1681);
    float _1693 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1683);
    float _1695 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1697 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1687);
    float _1699 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1689);
    float _1701 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1691);
    float _1703 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1693);
    bool _1705 = _1673 > 0.0;
    bool _1707 = isnan(_1673);
    bool _1709 = _1705 || _1707;
    bool _1711 = isnan(0.0);
    bool _1713 = _1709 || _1711;
    float _1715 = _1673 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1717 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1697);
    float _1719 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1701);
    float _1721 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1699);
    float _1723 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1703);
    float _1725 = _1715 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1727 = _1717 + _1719;
    float _1729 = _1721 + _1719;
    float _1731 = _1719 * 0.5;
    float _1733 = _1727 * 0.5;
    float _1735 = _1729 * 0.5;
    float _1737 = fma(_1723, -0.5, _1731);
    out.m_35.x = _1725;
    out.gl_Position.x = _1717;
    out.gl_Position.y = _1723;
    out.gl_Position.z = _1721;
    out.gl_Position.w = _1719;
    out.m_52.x = _1733;
    out.m_52.y = _1737;
    out.m_52.z = _1735;
    out.m_52.w = _1719;
    if (_1713)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _1739 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1739;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

