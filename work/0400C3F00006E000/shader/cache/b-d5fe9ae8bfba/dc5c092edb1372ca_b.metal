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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
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
    bool _711 = false;
    bool _605 = false;
    bool _455 = false;
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
    if (!_73)
    {
        out.m_33.x = 0.0;
    }
    int _79 = 0;
    if (!_73)
    {
        float _81 = _77 * 5.0;
        _79 = as_type<int>(_81);
    }
    int _83 = _79;
    int _85 = _83;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1968 = as_type<float>(_83);
        out.gl_Position.z = _1968;
    }
    if (!_73)
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
    float _103 = 0.0;
    if (_97)
    {
        float _105 = float(_69);
        _103 = _105;
    }
    float _107 = _103;
    bool _109 = _101 >= _107;
    bool _111 = !_97;
    bool _113 = _109 || _111;
    float _115 = 0.0;
    float _117 = _107;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _115;
    float _121 = _119;
    if (_113)
    {
        out.m_33.x = 0.0;
    }
    if (_113)
    {
        float _123 = _119 * 5.0;
        _85 = as_type<int>(_123);
    }
    int _125 = _85;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2038 = as_type<float>(_125);
        out.gl_Position.z = _2038;
    }
    if (_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_35.x;
    float _129 = in.m_35.y;
    float _131 = in.m_35.z;
    float _133 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _135 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _137 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _139 = _135 || _137;
    bool _141 = isnan(1.0);
    bool _143 = _139 || _141;
    float _145 = 0.0;
    float _147 = _133;
    if (!_143)
    {
        float _149 = _133 * _133;
        float _151 = _149 * 0.5;
        _145 = _151;
    }
    float _153 = _145;
    float _155 = 0.0;
    float _157 = _153;
    if (!_143)
    {
        float _159 = _101 * _101;
        float _161 = _159 * 0.5;
        _155 = _161;
    }
    float _163 = _155;
    if (!_143)
    {
        float _165 = _153 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _157 = _165;
    }
    float _167 = _157;
    bool _169 = !_143;
    float _171 = _167;
    if (!_169)
    {
        float _173 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _175 = log2(_173);
        float _177 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _179 = _177 + 1.0;
        float _181 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _183 = _133 * _175;
        float _185 = 1.0 / _179;
        float _187 = _181 * 0.693147182464599609375;
        float _189 = exp2(_183);
        float _191 = 1.0 / _187;
        float _193 = _189 + (-1.0);
        float _195 = -_193;
        float _197 = fma(_195, _191, _133);
        float _199 = _197 * _185;
        float _201 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _121 = _191;
        _171 = _201;
        _117 = _189;
    }
    float _203 = _121;
    float _205 = _171;
    float _207 = _117;
    bool _209 = !_143;
    float _211 = _203;
    float _213 = _207;
    if (!_209)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = 1.0 / _221;
        float _225 = _133 * _217;
        float _227 = exp2(_225);
        float _229 = -_227;
        float _231 = _229 + 1.0;
        float _233 = _231 * _223;
        _211 = _227;
        _213 = _221;
        _147 = _233;
    }
    float _235 = _211;
    float _237 = _213;
    float _239 = _147;
    float _241 = _237;
    float _243 = _235;
    if (!_143)
    {
        _241 = _101;
    }
    float _245 = _241;
    float _247 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _245;
    if (!_143)
    {
        float _251 = _163 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _243 = _251;
    }
    float _253 = _243;
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
    float _317 = fma(_239, _129, _247);
    float _319 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _321 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _323 = fma(_313, _129, _315);
    float _325 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _327 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _329 = fma(_239, _127, _319);
    float _331 = fma(_313, _127, _321);
    float _333 = -_323;
    float _335 = _317 + _333;
    float _337 = fma(_239, _131, _325);
    float _339 = fma(_313, _131, _327);
    float _341 = -_331;
    float _343 = _329 + _341;
    float _345 = _335 * _335;
    float _347 = in.m_37.w;
    float _349 = -_339;
    float _351 = _337 + _349;
    float _353 = _335 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _355 = fma(_343, _343, _345);
    float _357 = _335 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _359 = in.m_30.x;
    float _361 = in.m_30.y;
    float _363 = in.m_30.z;
    float _365 = _335 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _367 = fma(_351, _351, _355);
    float _369 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].x, _353);
    float _371 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].x, _357);
    float _373 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].x, _365);
    float _375 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[4].z, _369);
    float _377 = sqrt(_367);
    float _379 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[6].z, _373);
    bool _381 = _377 >= 9.9999999747524270787835121154785e-07;
    bool _383 = isnan(_377);
    bool _385 = _381 || _383;
    bool _387 = isnan(9.9999999747524270787835121154785e-07);
    bool _389 = _385 || _387;
    float _391 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[5].z, _371);
    float _393 = fma(_329, _347, _359);
    float _395 = fma(_317, _347, _361);
    float _397 = fma(_337, _347, _363);
    float _399 = _371;
    float _401 = _375;
    float _403 = _391;
    if (_389)
    {
        _399 = _375;
    }
    float _405 = _399;
    float _407 = _405;
    if (_389)
    {
        _401 = _391;
    }
    float _409 = _401;
    float _411 = _409;
    if (_389)
    {
        _403 = _379;
    }
    float _413 = _403;
    float _415 = _413;
    if (!_389)
    {
        bool _417 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _419 = !_417;
        if (!_419)
        {
            float _421 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _423 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _425 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _427 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _421);
            float _429 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _423);
            float _431 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _425);
            float _433 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _427);
            float _435 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _429);
            float _437 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _431);
            float _439 = _433 * _433;
            float _441 = fma(_435, _435, _439);
            float _443 = fma(_437, _437, _441);
            float _445 = rsqrt(_443);
            float _447 = _445 * 9.9999999747524270787835121154785e-07;
            float _449 = _435 * _447;
            float _451 = _433 * _447;
            float _453 = _437 * _447;
            _411 = _451;
            _407 = _449;
            _415 = _453;
            _455 = true;
        }
        else
        {
            float _457 = _129 * _129;
            float _459 = fma(_127, _127, _457);
            float _461 = fma(_131, _131, _459);
            float _463 = sqrt(_461);
            bool _465 = _463 >= 9.9999999747524270787835121154785e-07;
            bool _467 = isnan(_463);
            bool _469 = _465 || _467;
            bool _471 = isnan(9.9999999747524270787835121154785e-07);
            bool _473 = _469 || _471;
            if (!_473)
            {
                float _475 = _361 * _361;
                float _477 = fma(_359, _359, _475);
                float _479 = fma(_363, _363, _477);
                float _481 = sqrt(_479);
                bool _483 = _481 >= 9.9999999747524270787835121154785e-07;
                bool _485 = isnan(_481);
                bool _487 = _483 || _485;
                bool _489 = isnan(9.9999999747524270787835121154785e-07);
                bool _491 = _487 || _489;
                if (!_491)
                {
                    float _493 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _495 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _493);
                    float _497 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _495);
                    float _499 = rsqrt(_497);
                    float _501 = _499 * 9.9999999747524270787835121154785e-07;
                    float _503 = _501 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _505 = _501 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _507 = _501 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _411 = _505;
                    _407 = _503;
                    _415 = _507;
                    _455 = true;
                }
                else
                {
                    float _509 = _361 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _511 = _361 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _513 = _361 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _515 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].x, _509);
                    float _517 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].x, _511);
                    float _519 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].x, _513);
                    float _521 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].z, _515);
                    float _523 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].z, _517);
                    float _525 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].z, _519);
                    float _527 = _521 * _521;
                    float _529 = fma(_523, _523, _527);
                    float _531 = fma(_525, _525, _529);
                    float _533 = rsqrt(_531);
                    float _535 = _533 * 9.9999999747524270787835121154785e-07;
                    float _537 = _523 * _535;
                    float _539 = _521 * _535;
                    float _541 = _525 * _535;
                    _411 = _539;
                    _407 = _537;
                    _415 = _541;
                    _455 = true;
                }
            }
            else
            {
                float _543 = _129 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _545 = _129 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _547 = _129 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _549 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[5].x, _543);
                float _551 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[4].x, _545);
                float _553 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[6].x, _547);
                float _555 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[5].z, _549);
                float _557 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[4].z, _551);
                float _559 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[6].z, _553);
                float _561 = _555 * _555;
                float _563 = fma(_557, _557, _561);
                float _565 = fma(_559, _559, _563);
                float _567 = rsqrt(_565);
                float _569 = _567 * 9.9999999747524270787835121154785e-07;
                float _571 = _557 * _569;
                float _573 = _555 * _569;
                float _575 = _559 * _569;
                _411 = _573;
                _407 = _571;
                _415 = _575;
            }
        }
    }
    _455 = false;
    float _577 = _411;
    float _579 = _407;
    float _581 = _415;
    bool _583 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _585 = !_583;
    float _603;
    if (!_585)
    {
        float _587 = in.m_39.x;
        float _589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _591 = _587 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _593 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[12].x, _101);
        float _595 = _593 * _589;
        float _597 = floor(_595);
        float _599 = -_597;
        float _601 = _595 + _599;
        _603 = _601;
        _605 = true;
    }
    else
    {
        float _607 = float(_69);
        float _609 = 1.0 / _607;
        float _611 = _101 * _609;
        _603 = _611;
    }
    _605 = false;
    float _613 = _603;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _617 = _613 + _615;
    bool _619 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _621 = isnan(_613);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _631;
    float _635 = -_629;
    float _637 = _635 + 1.0;
    bool _639 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _641 = isnan(_613);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _651;
    bool _655 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _657 = 1.0 / _633;
    float _659 = _649 * _637;
    float _661 = -_649;
    float _663 = _661 + 1.0;
    float _665 = _617 * _657;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _667;
    float _671 = fma(_653, _665, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _673 = fma(_669, _665, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _675 = _671 * _659;
    float _677 = _673 * _659;
    float _679 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[143].x, _675);
    float _681 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[143].y, _677);
    float _683 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[144].x, _679);
    float _685 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[144].y, _681);
    bool _687 = !_655;
    float _707;
    float _709;
    if (!_687)
    {
        float _689 = in.m_39.x;
        float _691 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _693 = float(_69);
        float _695 = _689 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _697 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[11].y, _101);
        float _699 = _697 * _691;
        float _701 = floor(_699);
        float _703 = -_701;
        float _705 = _699 + _703;
        _707 = _693;
        _709 = _705;
        _711 = true;
    }
    else
    {
        float _713 = float(_69);
        float _715 = 1.0 / _713;
        float _717 = _101 * _715;
        _707 = _713;
        _709 = _717;
    }
    _711 = false;
    float _719 = _707;
    float _721 = _709;
    float _723 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _725 = int(_723);
    float _727 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _729 = int(_727);
    float _731 = float(_725);
    float _733 = 1.0 / _719;
    float _735 = float(uint(_729));
    float _737 = 1.0 / _731;
    int _739 = ~_729;
    int _741 = _739 + 1;
    int _743 = ~_729;
    int _745 = _743 + 1;
    float _747 = float(_729);
    bool _749 = _729 == 0;
    float _751 = 1.0 / _735;
    int _753 = _729 + (-1);
    float _755 = _101 * _737;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _759 = _757 != 0;
    float _761 = trunc(_755);
    int _763 = int(_761);
    int _765 = as_type<int>(_751) + (-2);
    bool _767 = !_759;
    float _769 = _767 ? 7.345489978790283203125 : 1.0;
    float _771 = float(uint(_763));
    float _773 = as_type<float>(_765) * _771;
    float _775 = in.m_39.x;
    float _777 = in.m_39.y;
    float _779 = trunc(_773);
    float _781 = precise::max(_779, 0.0);
    uint _784 = uint(_781);
    int _786 = _741 * int(_784);
    int _788 = _786 + _763;
    float _790 = float(uint(_788));
    float _792 = _769 * _775;
    float _794 = _777 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _796 = as_type<float>(_765) * _790;
    float _798 = float(_763);
    float _800 = floor(_792);
    bool _802 = _798 >= _747;
    bool _804 = isnan(_798);
    bool _806 = _802 || _804;
    bool _808 = isnan(_747);
    bool _810 = _806 || _808;
    float _812 = float(_810);
    float _814 = trunc(_796);
    float _816 = precise::max(_814, 0.0);
    uint _818 = uint(_816);
    float _820 = trunc(_812);
    int _822 = int(_820);
    int _824 = int(_784) + int(_818);
    int _826 = _745 * _824;
    int _828 = _826 + _763;
    bool _830 = uint(_828) >= uint(_729);
    float _832 = -_800;
    float _834 = _792 + _832;
    bool _836 = !_830;
    int _838 = _836 ? 0 : (-1);
    int _840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _842 = _840 != 0;
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _846 = _844 != 0;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _850 = _848 != 0;
    int _852 = ~_824;
    int _854 = _852 + _838;
    int _856 = _854 + 1;
    float _858 = _834 * _747;
    float _860 = _101 * _747;
    int _862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _864 = _862 != 0;
    int _866 = _729 * _856;
    int _868 = _866 + _763;
    float _870 = _860 * _733;
    int _872 = ~_822;
    int _874 = _872 + 1;
    int _876 = _874 + 1;
    float _878 = trunc(_858);
    int _880 = int(_878);
    bool _882 = !_864;
    int _884 = _882 ? 0 : 1;
    bool _886 = !_749;
    int _888 = _886 ? _868 : (-1);
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _892 = _890 != 0;
    int _894 = abs(_884);
    int _896 = _888 * _876;
    float _898 = trunc(_870);
    int _900 = int(_898);
    bool _902 = !_846;
    int _904 = _902 ? 0 : 1;
    int _906 = _822 * _753;
    int _908 = _906 + _896;
    bool _910 = !_842;
    int _912 = _910 ? 0 : 1;
    int _914 = abs(_904);
    int _916 = _880 * _894;
    int _918 = _916 + _763;
    bool _920 = !_850;
    int _922 = _920 ? 0 : 1;
    int _924 = abs(_912);
    bool _926 = !_892;
    int _928 = _926 ? 0 : 1;
    int _930 = abs(_922);
    int _932 = _908 * _914;
    int _934 = abs(_928);
    int _936 = _900 * _924;
    int _938 = _936 + _932;
    float _940 = float(uint(_918));
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _944 = _942 != 0;
    int _946 = _918 * _930;
    int _948 = _946 + _938;
    int _950 = ~_729;
    int _952 = _950 + 1;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _956 = _954 != 0;
    int _958 = _880 * _934;
    int _960 = _958 + _948;
    int _962 = ~_729;
    int _964 = _962 + 1;
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _968 = _966 != 0;
    float _970 = float(uint(_960));
    bool _972 = !_944;
    int _974 = _972 ? 0 : 1;
    float _976 = as_type<float>(_765) * _970;
    float _978 = trunc(_976);
    float _980 = precise::max(_978, 0.0);
    uint _982 = uint(_980);
    float _984 = as_type<float>(int(gl_VertexIndex));
    int _986 = _952 * int(_982);
    int _988 = _986 + _960;
    float _990 = float(uint(_988));
    float _992 = as_type<float>(_765) * _940;
    float _994 = as_type<float>(_765) * _990;
    float _996 = trunc(_992);
    float _998 = precise::max(_996, 0.0);
    uint _1000 = uint(_998);
    float _1002 = trunc(_994);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    int _1008 = int(_982) + int(_1006);
    int _1010 = _964 * _1008;
    int _1012 = _1010 + _960;
    bool _1014 = uint(_1012) >= uint(_729);
    int _1016 = ~_729;
    int _1018 = _1016 + 1;
    bool _1020 = !_1014;
    int _1022 = _1020 ? 0 : (-1);
    int _1024 = as_type<int>(_984) & 1;
    bool _1026 = _1024 != 0;
    int _1028 = as_type<int>(_984) & 2;
    bool _1030 = _1028 != 0;
    int _1032 = _1018 * int(_1000);
    int _1034 = _1032 + _918;
    int _1036 = ~_1008;
    int _1038 = _1036 + _1022;
    int _1040 = _1038 + 1;
    float _1042 = _395 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1044 = float(uint(_1034));
    int _1046 = _729 * _1040;
    int _1048 = _1046 + _960;
    float _1050 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1042);
    float _1052 = in.m_37.x;
    float _1054 = in.m_37.y;
    float _1056 = as_type<float>(_765) * _1044;
    bool _1058 = !_749;
    int _1060 = _1058 ? _1048 : (-1);
    float _1062 = _395 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1064 = _395 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1066 = _1060 >> 31;
    float _1068 = trunc(_1056);
    float _1070 = precise::max(_1068, 0.0);
    uint _1072 = uint(_1070);
    float _1074 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1064);
    float _1076 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1062);
    int _1078 = _1066 & 3;
    int _1080 = _1060 & 3;
    bool _1082 = _1080 != 0;
    int _1084 = _1060 + _1078;
    int _1086 = _1060 & 3;
    bool _1088 = _1086 != 0;
    int _1090 = _1084 >> 2;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1094 = _1082 ? 0 : 1;
    float _1096 = _683 * _1052;
    bool _1098 = uint(_1086) > 1u;
    float _1100 = _775 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1102 = _685 * _1054;
    int _1104 = _1090 << 4;
    int _1106 = _1104 + 368;
    float _1108 = _1096 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1110 = -_1092;
    float _1112 = fma(_1100, 2.0, _1110);
    int _1114 = int(_1000) + int(_1072);
    float _1116 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    uint _1118 = uint(int(uint(_1106) >> uint(2)));
    uint _1120 = uint(int(uint(int(_1118)) >> uint(2)));
    int _1122 = int(_1118) & 3;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[int(_1120)][_1122];
    int _1126 = int(_1118) + 1;
    uint _1128 = uint(int(uint(_1126) >> uint(2)));
    int _1130 = _1126 & 3;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[int(_1128)][_1130];
    bool _1134 = !_1088;
    int _1136 = _1134 ? 0 : 1;
    float _1138 = -_101;
    float _1140 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1112);
    bool _1142 = uint(_1086) >= 2u;
    int _1144 = ~_1094;
    int _1146 = _1144 + 1;
    int _1148 = _1146 + 1;
    int _1150 = _1148;
    if (!_1098)
    {
        int _1152 = ~_1094;
        int _1154 = _1152 + 1;
        _1150 = _1154;
    }
    int _1156 = _1150;
    int _1158 = _1142 ? 0 : 1;
    bool _1160 = _1086 != 3;
    bool _1162 = _1086 != 3;
    int _1164 = _1106 + 8;
    uint _1166 = uint(int(uint(_1164) >> uint(2)));
    uint _1168 = uint(int(uint(int(_1166)) >> uint(2)));
    int _1170 = int(_1166) & 3;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[int(_1168)][_1170];
    int _1174 = int(_1166) + 1;
    uint _1176 = uint(int(uint(_1174) >> uint(2)));
    int _1178 = _1174 & 3;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[int(_1176)][_1178];
    int _1182 = ~_729;
    int _1184 = _1182 + 1;
    int _1186 = ~_1158;
    int _1188 = _1186 + 1;
    int _1190 = _1188 + 1;
    float _1192 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1194 = abs(_1156);
    int _1196 = _1184 * _1114;
    int _1198 = _1196 + _918;
    int _1200 = _1190;
    if (_1160)
    {
        int _1202 = ~_1158;
        int _1204 = _1202 + 1;
        _1200 = _1204;
    }
    int _1206 = _1200;
    float _1208 = fma(_794, -2.0, _1192);
    float _1210 = _577 * _577;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1214 = uint(_1198) >= uint(_729);
    float _1216 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1050);
    float _1218 = fma(_579, _579, _1210);
    float _1220 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1212);
    bool _1222 = !_1214;
    int _1224 = _1222 ? 0 : (-1);
    float _1226 = fma(_581, _581, _1218);
    int _1228 = abs(_1136);
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1232 = _1216 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1234 = _777 > 0.5;
    float _1236 = rsqrt(_1226);
    float _1238 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1076);
    float _1240 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1074);
    float _1242 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1230);
    int _1244 = ~_1194;
    int _1246 = _1244 + 1;
    int _1248 = _1246 + 1;
    float _1250 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1208);
    bool _1252 = !_1162;
    int _1254 = _1252 ? 0 : (-1);
    float _1256 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1242);
    bool _1258 = _775 > 0.5;
    int _1260 = _1248 * as_type<int>(_1132);
    float _1262 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1220);
    int _1264 = ~_1228;
    int _1266 = _1264 + 1;
    int _1268 = _1266 + 1;
    float _1270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1272 = abs(_1206);
    float _1274 = _1236 * _581;
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1278 = _1276 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1280 = _1268 * as_type<int>(_1124);
    int _1282 = _1280 + _1260;
    int _1284 = ~_1114;
    int _1286 = _1284 + _1224;
    int _1288 = _1286 + 1;
    float _1290 = _1236 * _577;
    int _1292 = ~_1272;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    float _1298 = _1236 * _579;
    float _1300 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1302 = _1274 * _1300;
    float _1304 = 1.0 / _1278;
    int _1306 = _1296 * as_type<int>(_1172);
    int _1308 = _1306 + _1282;
    float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1312 = _1290 * _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1316 = -_1302;
    float _1318 = fma(_1298, _1314, _1316);
    float _1320 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1322 = _1298 * _1320;
    int _1324 = _729 * _1288;
    int _1326 = _1324 + _918;
    float _1328 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1330 = -_1312;
    float _1332 = fma(_1274, _1328, _1330);
    float _1334 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1336 = int(_1334);
    float _1338 = _1318 * _1318;
    float _1340 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1342 = -_1322;
    float _1344 = fma(_1290, _1340, _1342);
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1346;
    bool _1350 = !_1030;
    float _1352 = _1350 ? (-0.5) : 0.5;
    float _1354 = fma(_1332, _1332, _1338);
    float _1356 = _1238 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1358 = _1348 * _1304;
    float _1360 = fma(_1344, _1344, _1354);
    int _1362 = abs(_1254);
    float _1364 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1352);
    int _1366 = abs(_974);
    float _1368 = rsqrt(_1360);
    int _1370 = ~_1362;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    int _1376 = abs(_1336);
    float _1378 = float(uint(_1336));
    int _1380 = _1374 * as_type<int>(_1180);
    int _1382 = _1380 + _1308;
    float _1384 = float(uint(_1376));
    int _1386 = ~_1366;
    int _1388 = _1386 + 1;
    int _1390 = _1388 + 1;
    float _1392 = 1.0 / _1378;
    float _1394 = _1116 * _1364;
    float _1396 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1398 = _1382 * _1390;
    bool _1400 = !_749;
    int _1402 = _1400 ? _1326 : (-1);
    float _1404 = _1318 * _1368;
    float _1406 = _1332 * _1368;
    float _1408 = 1.0 / _1384;
    bool _1410 = !_1026;
    float _1412 = _1410 ? (-0.5) : 0.5;
    int _1414 = _1402 * _1366;
    int _1416 = _1414 + _1398;
    float _1418 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1422 = _721 + _1420;
    float _1424 = _1344 * _1368;
    float _1426 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1412);
    int _1428 = abs(_1416);
    float _1430 = fma(_1358, _1422, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1432 = as_type<int>(_1392) + (-2);
    float _1434 = _1108 * _1426;
    float _1436 = float(uint(_1416));
    float _1438 = _1394 * _1298;
    float _1440 = float(uint(_1428));
    float _1442 = _1290 * _1424;
    float _1444 = _1394 * _1274;
    int _1446 = as_type<int>(_1408) + (-2);
    float _1448 = as_type<float>(_1432) * _1436;
    float _1450 = fma(_1434, _1406, _1438);
    float _1452 = -_1442;
    float _1454 = fma(_1274, _1404, _1452);
    float _1456 = _1298 * _1404;
    float _1458 = as_type<float>(_1446) * _1440;
    float _1460 = trunc(_1448);
    float _1462 = precise::max(_1460, 0.0);
    uint _1464 = uint(_1462);
    float _1466 = fma(_1396, _1454, _1450);
    int _1468 = ~_1336;
    int _1470 = _1468 + 1;
    float _1472 = fma(_1434, _1424, _1444);
    out.m_33.x = _1418;
    float _1474 = -_1456;
    float _1476 = fma(_1290, _1406, _1474);
    float _1478 = _1232 + _1466;
    float _1480 = trunc(_1458);
    float _1482 = precise::max(_1480, 0.0);
    uint _1484 = uint(_1482);
    float _1486 = fma(_1396, _1476, _1472);
    bool _1488 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1490 = isnan(_721);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1496 = _1492 || _1494;
    float _1498 = float(_1496);
    float _1500 = _1240 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1502 = ~_1376;
    int _1504 = _1502 + 1;
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1508 = _1506 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1510 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1512 = isnan(_721);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1518 = _1514 || _1516;
    float _1520 = float(_1518);
    float _1522 = -_1498;
    float _1524 = _1522 + 1.0;
    int _1526 = _1470 * int(_1464);
    int _1528 = _1526 + _1416;
    float _1530 = _1500 + _1486;
    float _1532 = 1.0 / _1508;
    float _1534 = _1274 * _1406;
    int _1536 = ~_1376;
    int _1538 = _1536 + 1;
    float _1540 = float(uint(_1528));
    float _1542 = -_1534;
    float _1544 = fma(_1298, _1424, _1542);
    int _1546 = _1504 * int(_1484);
    int _1548 = _1546 + _1428;
    float _1550 = -_1412;
    int _1552 = _1258 ? as_type<int>(_1550) : as_type<int>(_1412);
    float _1554 = as_type<float>(_1432) * _1540;
    float _1556 = -_1520;
    float _1558 = _1556 + 1.0;
    float _1560 = float(uint(_1548));
    float _1562 = _1520 * _1524;
    bool _1564 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1566 = isnan(_721);
    bool _1568 = _1564 || _1566;
    bool _1570 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1572 = _1568 || _1570;
    float _1574 = float(_1572);
    float _1576 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1578 = _1530 + _1576;
    float _1580 = trunc(_1554);
    float _1582 = precise::max(_1580, 0.0);
    uint _1584 = uint(_1582);
    float _1586 = as_type<float>(_1446) * _1560;
    float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1590 = _1588 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1592 = _1574 * _1558;
    float _1594 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1596 = _1478 + _1594;
    float _1598 = _1578 * _1578;
    bool _1600 = !_956;
    float _1602 = _1600 ? _1412 : as_type<float>(_1552);
    float _1604 = _1430 * _1592;
    float _1606 = _1394 * _1290;
    float _1608 = fma(_1596, _1596, _1598);
    float _1610 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1612 = _721 + _1610;
    float _1614 = trunc(_1586);
    float _1616 = precise::max(_1614, 0.0);
    uint _1618 = uint(_1616);
    float _1620 = fma(_1434, _1404, _1606);
    int _1622 = ~_1336;
    int _1624 = _1622 + 1;
    float _1626 = _1590 * _1532;
    float _1628 = -_1574;
    float _1630 = _1628 + 1.0;
    int _1632 = int(_1464) + int(_1584);
    float _1634 = fma(_1396, _1544, _1620);
    float _1636 = fma(_1626, _1612, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1638 = sqrt(_1608);
    float _1640 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1604);
    int _1642 = _1624 * _1632;
    int _1644 = _1642 + _1416;
    float _1646 = _1356 + _1634;
    float _1648 = -_1352;
    int _1650 = _1234 ? as_type<int>(_1648) : as_type<int>(_1352);
    float _1652 = fma(_1636, _1562, _1640);
    bool _1654 = uint(_1644) >= uint(_1336);
    int _1656 = int(_1484) + int(_1618);
    float _1658 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1652);
    bool _1660 = !_968;
    float _1662 = _1660 ? _1352 : as_type<float>(_1650);
    bool _1664 = !_1654;
    int _1666 = _1664 ? 0 : (-1);
    int _1668 = _1538 * _1656;
    int _1670 = _1668 + _1428;
    bool _1672 = _1638 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1674 = _1356;
    float _1676 = _1478;
    float _1678 = _1530;
    if (!_1672)
    {
        _1674 = _1646;
    }
    float _1680 = _1674;
    bool _1682 = !_1672;
    float _1684 = _1680;
    if (!_1682)
    {
        float _1686 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1688 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1690 = _1638 + _1688;
        float _1692 = rsqrt(_1608);
        float _1694 = _1690 * _1686;
        float _1696 = _1646 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1698 = _1694 * 0.15915493667125701904296875;
        float _1700 = _1698 * 6.283185482025146484375;
        float _1702 = cos(_1700);
        float _1704 = _1698 * 6.283185482025146484375;
        float _1706 = sin(_1704);
        float _1708 = _1702 + (-1.0);
        float _1710 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1712 = fma(_1706, _1696, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1714 = fma(_1646, _1702, _1710);
        float _1716 = _1692 * _1712;
        float _1718 = fma(_1596, _1716, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1720 = fma(_1578, _1716, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1684 = _1714;
        _1676 = _1718;
        _1678 = _1720;
    }
    float _1722 = _1684;
    float _1724 = _1676;
    float _1726 = _1678;
    int _1728 = ~_1632;
    int _1730 = _1728 + _1666;
    int _1732 = _1730 + 1;
    float _1734 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _1736 = uint(_1670) >= uint(_1376);
    float _1738 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1740 = _1416 ^ _1336;
    int _1742 = _1336 * _1732;
    int _1744 = _1742 + _1416;
    bool _1746 = !_1736;
    int _1748 = _1746 ? 0 : (-1);
    float _1750 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    uint _1752 = uint(int(uint(_1740) >> uint(31)));
    float _1754 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1756 = _1336 == 0;
    float _1758 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1750);
    bool _1760 = _1336 == 0;
    float _1762 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1734);
    int _1764 = ~_1748;
    int _1766 = _1656 + _1764;
    int _1768 = _1766 + 1;
    float _1770 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1772 = ~int(_1752);
    int _1774 = _1772 + 1;
    float _1776 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1738);
    bool _1778 = !_1756;
    int _1780 = _1778 ? _1744 : (-1);
    float _1782 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1758);
    int _1784 = _1768 ^ _1774;
    float _1786 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1754);
    float _1788 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1790 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1762);
    int _1792 = ~_1774;
    int _1794 = _1792 + _1784;
    int _1796 = _1794 + 1;
    float _1798 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1776);
    float _1800 = _1782 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1802 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1786);
    float _1804 = float(_1780);
    float _1806 = _1790 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1808 = !_1760;
    int _1810 = _1808 ? _1796 : (-1);
    float _1812 = _1800 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1814 = _1800 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1816 = _1800 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1818 = _1800 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1820 = fma(_1788, _1804, _1140);
    float _1822 = _1602 + 0.5;
    float _1824 = float(_1810);
    float _1826 = _1770 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1828 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1812);
    float _1830 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1814);
    float _1832 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1816);
    float _1834 = _1798 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1836 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1818);
    float _1838 = fma(_1788, _1822, _1820);
    float _1840 = -_1256;
    float _1842 = _1840 + 1.0;
    float _1844 = -_1250;
    float _1846 = fma(_1826, _1824, _1844);
    float _1848 = _1662 + (-0.5);
    float _1850 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1828);
    float _1852 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1830);
    float _1854 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1832);
    float _1856 = _1802 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1858 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1836);
    float _1860 = -_1826;
    float _1862 = fma(_1860, _1848, _1846);
    float _1864 = -_1842;
    float _1866 = fma(_1602, _1864, _1838);
    float _1868 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1858);
    float _1870 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1854);
    float _1872 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1852);
    float _1874 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1850);
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1878 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1880 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1882 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1886 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1888 = -_1262;
    float _1890 = _1888 + 1.0;
    float _1892 = _1870 + _1868;
    float _1894 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1896 = _1876 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1898 = _1878 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1900 = _1880 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1902 = _1882 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1904 = _1884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1906 = _1886 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1908 = _1658 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1910 = _1892 * 0.5;
    float _1912 = fma(_1662, _1890, _1862);
    out.m_44.x = _1902;
    out.m_44.y = _1904;
    out.m_44.z = _1906;
    out.m_44.w = _1894;
    out.m_46.x = _1896;
    out.m_46.y = _1898;
    out.m_46.z = _1900;
    out.m_46.w = _1908;
    out.gl_Position.x = _1874;
    out.gl_Position.y = _1872;
    out.gl_Position.z = _1870;
    out.gl_Position.w = _1868;
    out.m_48.z = _1910;
    out.m_48.w = _1868;
    out.m_50.x = _1866;
    out.m_50.y = _1912;
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
    bool _711 = false;
    bool _605 = false;
    bool _455 = false;
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
    if (!_73)
    {
        out.m_33.x = 0.0;
    }
    int _79 = 0;
    if (!_73)
    {
        float _81 = _77 * 5.0;
        _79 = as_type<int>(_81);
    }
    int _83 = _79;
    int _85 = _83;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1968 = as_type<float>(_83);
        out.gl_Position.z = _1968;
    }
    if (!_73)
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
    float _103 = 0.0;
    if (_97)
    {
        float _105 = float(_69);
        _103 = _105;
    }
    float _107 = _103;
    bool _109 = _101 >= _107;
    bool _111 = !_97;
    bool _113 = _109 || _111;
    float _115 = 0.0;
    float _117 = _107;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _115;
    float _121 = _119;
    if (_113)
    {
        out.m_33.x = 0.0;
    }
    if (_113)
    {
        float _123 = _119 * 5.0;
        _85 = as_type<int>(_123);
    }
    int _125 = _85;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2038 = as_type<float>(_125);
        out.gl_Position.z = _2038;
    }
    if (_113)
    {
        return out;
    }
    float _127 = in.m_35.x;
    float _129 = in.m_35.y;
    float _131 = in.m_35.z;
    float _133 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _135 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _137 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _139 = _135 || _137;
    bool _141 = isnan(1.0);
    bool _143 = _139 || _141;
    float _145 = 0.0;
    float _147 = _133;
    if (!_143)
    {
        float _149 = _133 * _133;
        float _151 = _149 * 0.5;
        _145 = _151;
    }
    float _153 = _145;
    float _155 = 0.0;
    float _157 = _153;
    if (!_143)
    {
        float _159 = _101 * _101;
        float _161 = _159 * 0.5;
        _155 = _161;
    }
    float _163 = _155;
    if (!_143)
    {
        float _165 = _153 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _157 = _165;
    }
    float _167 = _157;
    bool _169 = !_143;
    float _171 = _167;
    if (!_169)
    {
        float _173 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _175 = log2(_173);
        float _177 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _179 = _177 + 1.0;
        float _181 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _183 = _133 * _175;
        float _185 = 1.0 / _179;
        float _187 = _181 * 0.693147182464599609375;
        float _189 = exp2(_183);
        float _191 = 1.0 / _187;
        float _193 = _189 + (-1.0);
        float _195 = -_193;
        float _197 = fma(_195, _191, _133);
        float _199 = _197 * _185;
        float _201 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _121 = _191;
        _171 = _201;
        _117 = _189;
    }
    float _203 = _121;
    float _205 = _171;
    float _207 = _117;
    bool _209 = !_143;
    float _211 = _203;
    float _213 = _207;
    if (!_209)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = 1.0 / _221;
        float _225 = _133 * _217;
        float _227 = exp2(_225);
        float _229 = -_227;
        float _231 = _229 + 1.0;
        float _233 = _231 * _223;
        _211 = _227;
        _213 = _221;
        _147 = _233;
    }
    float _235 = _211;
    float _237 = _213;
    float _239 = _147;
    float _241 = _237;
    float _243 = _235;
    if (!_143)
    {
        _241 = _101;
    }
    float _245 = _241;
    float _247 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _245;
    if (!_143)
    {
        float _251 = _163 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _243 = _251;
    }
    float _253 = _243;
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
    float _317 = fma(_239, _129, _247);
    float _319 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _321 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _323 = fma(_313, _129, _315);
    float _325 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _327 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _329 = fma(_239, _127, _319);
    float _331 = fma(_313, _127, _321);
    float _333 = -_323;
    float _335 = _317 + _333;
    float _337 = fma(_239, _131, _325);
    float _339 = fma(_313, _131, _327);
    float _341 = -_331;
    float _343 = _329 + _341;
    float _345 = _335 * _335;
    float _347 = in.m_37.w;
    float _349 = -_339;
    float _351 = _337 + _349;
    float _353 = _335 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _355 = fma(_343, _343, _345);
    float _357 = _335 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _359 = in.m_30.x;
    float _361 = in.m_30.y;
    float _363 = in.m_30.z;
    float _365 = _335 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _367 = fma(_351, _351, _355);
    float _369 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].x, _353);
    float _371 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].x, _357);
    float _373 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].x, _365);
    float _375 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[4].z, _369);
    float _377 = sqrt(_367);
    float _379 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[6].z, _373);
    bool _381 = _377 >= 9.9999999747524270787835121154785e-07;
    bool _383 = isnan(_377);
    bool _385 = _381 || _383;
    bool _387 = isnan(9.9999999747524270787835121154785e-07);
    bool _389 = _385 || _387;
    float _391 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[5].z, _371);
    float _393 = fma(_329, _347, _359);
    float _395 = fma(_317, _347, _361);
    float _397 = fma(_337, _347, _363);
    float _399 = _371;
    float _401 = _375;
    float _403 = _391;
    if (_389)
    {
        _399 = _375;
    }
    float _405 = _399;
    float _407 = _405;
    if (_389)
    {
        _401 = _391;
    }
    float _409 = _401;
    float _411 = _409;
    if (_389)
    {
        _403 = _379;
    }
    float _413 = _403;
    float _415 = _413;
    if (!_389)
    {
        bool _417 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _419 = !_417;
        if (!_419)
        {
            float _421 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _423 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _425 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _427 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _421);
            float _429 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _423);
            float _431 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _425);
            float _433 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _427);
            float _435 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _429);
            float _437 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _431);
            float _439 = _433 * _433;
            float _441 = fma(_435, _435, _439);
            float _443 = fma(_437, _437, _441);
            float _445 = rsqrt(_443);
            float _447 = _445 * 9.9999999747524270787835121154785e-07;
            float _449 = _435 * _447;
            float _451 = _433 * _447;
            float _453 = _437 * _447;
            _411 = _451;
            _407 = _449;
            _415 = _453;
            _455 = true;
        }
        else
        {
            float _457 = _129 * _129;
            float _459 = fma(_127, _127, _457);
            float _461 = fma(_131, _131, _459);
            float _463 = sqrt(_461);
            bool _465 = _463 >= 9.9999999747524270787835121154785e-07;
            bool _467 = isnan(_463);
            bool _469 = _465 || _467;
            bool _471 = isnan(9.9999999747524270787835121154785e-07);
            bool _473 = _469 || _471;
            if (!_473)
            {
                float _475 = _361 * _361;
                float _477 = fma(_359, _359, _475);
                float _479 = fma(_363, _363, _477);
                float _481 = sqrt(_479);
                bool _483 = _481 >= 9.9999999747524270787835121154785e-07;
                bool _485 = isnan(_481);
                bool _487 = _483 || _485;
                bool _489 = isnan(9.9999999747524270787835121154785e-07);
                bool _491 = _487 || _489;
                if (!_491)
                {
                    float _493 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _495 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _493);
                    float _497 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _495);
                    float _499 = rsqrt(_497);
                    float _501 = _499 * 9.9999999747524270787835121154785e-07;
                    float _503 = _501 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _505 = _501 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _507 = _501 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _411 = _505;
                    _407 = _503;
                    _415 = _507;
                    _455 = true;
                }
                else
                {
                    float _509 = _361 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _511 = _361 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _513 = _361 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _515 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].x, _509);
                    float _517 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].x, _511);
                    float _519 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].x, _513);
                    float _521 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].z, _515);
                    float _523 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].z, _517);
                    float _525 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].z, _519);
                    float _527 = _521 * _521;
                    float _529 = fma(_523, _523, _527);
                    float _531 = fma(_525, _525, _529);
                    float _533 = rsqrt(_531);
                    float _535 = _533 * 9.9999999747524270787835121154785e-07;
                    float _537 = _523 * _535;
                    float _539 = _521 * _535;
                    float _541 = _525 * _535;
                    _411 = _539;
                    _407 = _537;
                    _415 = _541;
                    _455 = true;
                }
            }
            else
            {
                float _543 = _129 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _545 = _129 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _547 = _129 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _549 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[5].x, _543);
                float _551 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[4].x, _545);
                float _553 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[6].x, _547);
                float _555 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[5].z, _549);
                float _557 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[4].z, _551);
                float _559 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[6].z, _553);
                float _561 = _555 * _555;
                float _563 = fma(_557, _557, _561);
                float _565 = fma(_559, _559, _563);
                float _567 = rsqrt(_565);
                float _569 = _567 * 9.9999999747524270787835121154785e-07;
                float _571 = _557 * _569;
                float _573 = _555 * _569;
                float _575 = _559 * _569;
                _411 = _573;
                _407 = _571;
                _415 = _575;
            }
        }
    }
    _455 = false;
    float _577 = _411;
    float _579 = _407;
    float _581 = _415;
    bool _583 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _585 = !_583;
    float _603;
    if (!_585)
    {
        float _587 = in.m_39.x;
        float _589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _591 = _587 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _593 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[12].x, _101);
        float _595 = _593 * _589;
        float _597 = floor(_595);
        float _599 = -_597;
        float _601 = _595 + _599;
        _603 = _601;
        _605 = true;
    }
    else
    {
        float _607 = float(_69);
        float _609 = 1.0 / _607;
        float _611 = _101 * _609;
        _603 = _611;
    }
    _605 = false;
    float _613 = _603;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _617 = _613 + _615;
    bool _619 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _621 = isnan(_613);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _631;
    float _635 = -_629;
    float _637 = _635 + 1.0;
    bool _639 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _641 = isnan(_613);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _651;
    bool _655 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _657 = 1.0 / _633;
    float _659 = _649 * _637;
    float _661 = -_649;
    float _663 = _661 + 1.0;
    float _665 = _617 * _657;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _667;
    float _671 = fma(_653, _665, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _673 = fma(_669, _665, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _675 = _671 * _659;
    float _677 = _673 * _659;
    float _679 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[143].x, _675);
    float _681 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[143].y, _677);
    float _683 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[144].x, _679);
    float _685 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[144].y, _681);
    bool _687 = !_655;
    float _707;
    float _709;
    if (!_687)
    {
        float _689 = in.m_39.x;
        float _691 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _693 = float(_69);
        float _695 = _689 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _697 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[11].y, _101);
        float _699 = _697 * _691;
        float _701 = floor(_699);
        float _703 = -_701;
        float _705 = _699 + _703;
        _707 = _693;
        _709 = _705;
        _711 = true;
    }
    else
    {
        float _713 = float(_69);
        float _715 = 1.0 / _713;
        float _717 = _101 * _715;
        _707 = _713;
        _709 = _717;
    }
    _711 = false;
    float _719 = _707;
    float _721 = _709;
    float _723 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _725 = int(_723);
    float _727 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _729 = int(_727);
    float _731 = float(_725);
    float _733 = 1.0 / _719;
    float _735 = float(uint(_729));
    float _737 = 1.0 / _731;
    int _739 = ~_729;
    int _741 = _739 + 1;
    int _743 = ~_729;
    int _745 = _743 + 1;
    float _747 = float(_729);
    bool _749 = _729 == 0;
    float _751 = 1.0 / _735;
    int _753 = _729 + (-1);
    float _755 = _101 * _737;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _759 = _757 != 0;
    float _761 = trunc(_755);
    int _763 = int(_761);
    int _765 = as_type<int>(_751) + (-2);
    bool _767 = !_759;
    float _769 = _767 ? 7.345489978790283203125 : 1.0;
    float _771 = float(uint(_763));
    float _773 = as_type<float>(_765) * _771;
    float _775 = in.m_39.x;
    float _777 = in.m_39.y;
    float _779 = trunc(_773);
    float _781 = precise::max(_779, 0.0);
    uint _784 = uint(_781);
    int _786 = _741 * int(_784);
    int _788 = _786 + _763;
    float _790 = float(uint(_788));
    float _792 = _769 * _775;
    float _794 = _777 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _796 = as_type<float>(_765) * _790;
    float _798 = float(_763);
    float _800 = floor(_792);
    bool _802 = _798 >= _747;
    bool _804 = isnan(_798);
    bool _806 = _802 || _804;
    bool _808 = isnan(_747);
    bool _810 = _806 || _808;
    float _812 = float(_810);
    float _814 = trunc(_796);
    float _816 = precise::max(_814, 0.0);
    uint _818 = uint(_816);
    float _820 = trunc(_812);
    int _822 = int(_820);
    int _824 = int(_784) + int(_818);
    int _826 = _745 * _824;
    int _828 = _826 + _763;
    bool _830 = uint(_828) >= uint(_729);
    float _832 = -_800;
    float _834 = _792 + _832;
    bool _836 = !_830;
    int _838 = _836 ? 0 : (-1);
    int _840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _842 = _840 != 0;
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _846 = _844 != 0;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _850 = _848 != 0;
    int _852 = ~_824;
    int _854 = _852 + _838;
    int _856 = _854 + 1;
    float _858 = _834 * _747;
    float _860 = _101 * _747;
    int _862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _864 = _862 != 0;
    int _866 = _729 * _856;
    int _868 = _866 + _763;
    float _870 = _860 * _733;
    int _872 = ~_822;
    int _874 = _872 + 1;
    int _876 = _874 + 1;
    float _878 = trunc(_858);
    int _880 = int(_878);
    bool _882 = !_864;
    int _884 = _882 ? 0 : 1;
    bool _886 = !_749;
    int _888 = _886 ? _868 : (-1);
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _892 = _890 != 0;
    int _894 = abs(_884);
    int _896 = _888 * _876;
    float _898 = trunc(_870);
    int _900 = int(_898);
    bool _902 = !_846;
    int _904 = _902 ? 0 : 1;
    int _906 = _822 * _753;
    int _908 = _906 + _896;
    bool _910 = !_842;
    int _912 = _910 ? 0 : 1;
    int _914 = abs(_904);
    int _916 = _880 * _894;
    int _918 = _916 + _763;
    bool _920 = !_850;
    int _922 = _920 ? 0 : 1;
    int _924 = abs(_912);
    bool _926 = !_892;
    int _928 = _926 ? 0 : 1;
    int _930 = abs(_922);
    int _932 = _908 * _914;
    int _934 = abs(_928);
    int _936 = _900 * _924;
    int _938 = _936 + _932;
    float _940 = float(uint(_918));
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _944 = _942 != 0;
    int _946 = _918 * _930;
    int _948 = _946 + _938;
    int _950 = ~_729;
    int _952 = _950 + 1;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _956 = _954 != 0;
    int _958 = _880 * _934;
    int _960 = _958 + _948;
    int _962 = ~_729;
    int _964 = _962 + 1;
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _968 = _966 != 0;
    float _970 = float(uint(_960));
    bool _972 = !_944;
    int _974 = _972 ? 0 : 1;
    float _976 = as_type<float>(_765) * _970;
    float _978 = trunc(_976);
    float _980 = precise::max(_978, 0.0);
    uint _982 = uint(_980);
    float _984 = as_type<float>(int(gl_VertexIndex));
    int _986 = _952 * int(_982);
    int _988 = _986 + _960;
    float _990 = float(uint(_988));
    float _992 = as_type<float>(_765) * _940;
    float _994 = as_type<float>(_765) * _990;
    float _996 = trunc(_992);
    float _998 = precise::max(_996, 0.0);
    uint _1000 = uint(_998);
    float _1002 = trunc(_994);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    int _1008 = int(_982) + int(_1006);
    int _1010 = _964 * _1008;
    int _1012 = _1010 + _960;
    bool _1014 = uint(_1012) >= uint(_729);
    int _1016 = ~_729;
    int _1018 = _1016 + 1;
    bool _1020 = !_1014;
    int _1022 = _1020 ? 0 : (-1);
    int _1024 = as_type<int>(_984) & 1;
    bool _1026 = _1024 != 0;
    int _1028 = as_type<int>(_984) & 2;
    bool _1030 = _1028 != 0;
    int _1032 = _1018 * int(_1000);
    int _1034 = _1032 + _918;
    int _1036 = ~_1008;
    int _1038 = _1036 + _1022;
    int _1040 = _1038 + 1;
    float _1042 = _395 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1044 = float(uint(_1034));
    int _1046 = _729 * _1040;
    int _1048 = _1046 + _960;
    float _1050 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1042);
    float _1052 = in.m_37.x;
    float _1054 = in.m_37.y;
    float _1056 = as_type<float>(_765) * _1044;
    bool _1058 = !_749;
    int _1060 = _1058 ? _1048 : (-1);
    float _1062 = _395 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1064 = _395 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1066 = _1060 >> 31;
    float _1068 = trunc(_1056);
    float _1070 = precise::max(_1068, 0.0);
    uint _1072 = uint(_1070);
    float _1074 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1064);
    float _1076 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1062);
    int _1078 = _1066 & 3;
    int _1080 = _1060 & 3;
    bool _1082 = _1080 != 0;
    int _1084 = _1060 + _1078;
    int _1086 = _1060 & 3;
    bool _1088 = _1086 != 0;
    int _1090 = _1084 >> 2;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1094 = _1082 ? 0 : 1;
    float _1096 = _683 * _1052;
    bool _1098 = uint(_1086) > 1u;
    float _1100 = _775 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1102 = _685 * _1054;
    int _1104 = _1090 << 4;
    int _1106 = _1104 + 368;
    float _1108 = _1096 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1110 = -_1092;
    float _1112 = fma(_1100, 2.0, _1110);
    int _1114 = int(_1000) + int(_1072);
    float _1116 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    uint _1118 = uint(int(uint(_1106) >> uint(2)));
    uint _1120 = uint(int(uint(int(_1118)) >> uint(2)));
    int _1122 = int(_1118) & 3;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[int(_1120)][_1122];
    int _1126 = int(_1118) + 1;
    uint _1128 = uint(int(uint(_1126) >> uint(2)));
    int _1130 = _1126 & 3;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[int(_1128)][_1130];
    bool _1134 = !_1088;
    int _1136 = _1134 ? 0 : 1;
    float _1138 = -_101;
    float _1140 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1112);
    bool _1142 = uint(_1086) >= 2u;
    int _1144 = ~_1094;
    int _1146 = _1144 + 1;
    int _1148 = _1146 + 1;
    int _1150 = _1148;
    if (!_1098)
    {
        int _1152 = ~_1094;
        int _1154 = _1152 + 1;
        _1150 = _1154;
    }
    int _1156 = _1150;
    int _1158 = _1142 ? 0 : 1;
    bool _1160 = _1086 != 3;
    bool _1162 = _1086 != 3;
    int _1164 = _1106 + 8;
    uint _1166 = uint(int(uint(_1164) >> uint(2)));
    uint _1168 = uint(int(uint(int(_1166)) >> uint(2)));
    int _1170 = int(_1166) & 3;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[int(_1168)][_1170];
    int _1174 = int(_1166) + 1;
    uint _1176 = uint(int(uint(_1174) >> uint(2)));
    int _1178 = _1174 & 3;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[int(_1176)][_1178];
    int _1182 = ~_729;
    int _1184 = _1182 + 1;
    int _1186 = ~_1158;
    int _1188 = _1186 + 1;
    int _1190 = _1188 + 1;
    float _1192 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1194 = abs(_1156);
    int _1196 = _1184 * _1114;
    int _1198 = _1196 + _918;
    int _1200 = _1190;
    if (_1160)
    {
        int _1202 = ~_1158;
        int _1204 = _1202 + 1;
        _1200 = _1204;
    }
    int _1206 = _1200;
    float _1208 = fma(_794, -2.0, _1192);
    float _1210 = _577 * _577;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1214 = uint(_1198) >= uint(_729);
    float _1216 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1050);
    float _1218 = fma(_579, _579, _1210);
    float _1220 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1212);
    bool _1222 = !_1214;
    int _1224 = _1222 ? 0 : (-1);
    float _1226 = fma(_581, _581, _1218);
    int _1228 = abs(_1136);
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1232 = _1216 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1234 = _777 > 0.5;
    float _1236 = rsqrt(_1226);
    float _1238 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1076);
    float _1240 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1074);
    float _1242 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1230);
    int _1244 = ~_1194;
    int _1246 = _1244 + 1;
    int _1248 = _1246 + 1;
    float _1250 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1208);
    bool _1252 = !_1162;
    int _1254 = _1252 ? 0 : (-1);
    float _1256 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1242);
    bool _1258 = _775 > 0.5;
    int _1260 = _1248 * as_type<int>(_1132);
    float _1262 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1220);
    int _1264 = ~_1228;
    int _1266 = _1264 + 1;
    int _1268 = _1266 + 1;
    float _1270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1272 = abs(_1206);
    float _1274 = _1236 * _581;
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1278 = _1276 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1280 = _1268 * as_type<int>(_1124);
    int _1282 = _1280 + _1260;
    int _1284 = ~_1114;
    int _1286 = _1284 + _1224;
    int _1288 = _1286 + 1;
    float _1290 = _1236 * _577;
    int _1292 = ~_1272;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    float _1298 = _1236 * _579;
    float _1300 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1302 = _1274 * _1300;
    float _1304 = 1.0 / _1278;
    int _1306 = _1296 * as_type<int>(_1172);
    int _1308 = _1306 + _1282;
    float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1312 = _1290 * _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1316 = -_1302;
    float _1318 = fma(_1298, _1314, _1316);
    float _1320 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1322 = _1298 * _1320;
    int _1324 = _729 * _1288;
    int _1326 = _1324 + _918;
    float _1328 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1330 = -_1312;
    float _1332 = fma(_1274, _1328, _1330);
    float _1334 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1336 = int(_1334);
    float _1338 = _1318 * _1318;
    float _1340 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1342 = -_1322;
    float _1344 = fma(_1290, _1340, _1342);
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1346;
    bool _1350 = !_1030;
    float _1352 = _1350 ? (-0.5) : 0.5;
    float _1354 = fma(_1332, _1332, _1338);
    float _1356 = _1238 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1358 = _1348 * _1304;
    float _1360 = fma(_1344, _1344, _1354);
    int _1362 = abs(_1254);
    float _1364 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1352);
    int _1366 = abs(_974);
    float _1368 = rsqrt(_1360);
    int _1370 = ~_1362;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    int _1376 = abs(_1336);
    float _1378 = float(uint(_1336));
    int _1380 = _1374 * as_type<int>(_1180);
    int _1382 = _1380 + _1308;
    float _1384 = float(uint(_1376));
    int _1386 = ~_1366;
    int _1388 = _1386 + 1;
    int _1390 = _1388 + 1;
    float _1392 = 1.0 / _1378;
    float _1394 = _1116 * _1364;
    float _1396 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1398 = _1382 * _1390;
    bool _1400 = !_749;
    int _1402 = _1400 ? _1326 : (-1);
    float _1404 = _1318 * _1368;
    float _1406 = _1332 * _1368;
    float _1408 = 1.0 / _1384;
    bool _1410 = !_1026;
    float _1412 = _1410 ? (-0.5) : 0.5;
    int _1414 = _1402 * _1366;
    int _1416 = _1414 + _1398;
    float _1418 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1422 = _721 + _1420;
    float _1424 = _1344 * _1368;
    float _1426 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1412);
    int _1428 = abs(_1416);
    float _1430 = fma(_1358, _1422, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1432 = as_type<int>(_1392) + (-2);
    float _1434 = _1108 * _1426;
    float _1436 = float(uint(_1416));
    float _1438 = _1394 * _1298;
    float _1440 = float(uint(_1428));
    float _1442 = _1290 * _1424;
    float _1444 = _1394 * _1274;
    int _1446 = as_type<int>(_1408) + (-2);
    float _1448 = as_type<float>(_1432) * _1436;
    float _1450 = fma(_1434, _1406, _1438);
    float _1452 = -_1442;
    float _1454 = fma(_1274, _1404, _1452);
    float _1456 = _1298 * _1404;
    float _1458 = as_type<float>(_1446) * _1440;
    float _1460 = trunc(_1448);
    float _1462 = precise::max(_1460, 0.0);
    uint _1464 = uint(_1462);
    float _1466 = fma(_1396, _1454, _1450);
    int _1468 = ~_1336;
    int _1470 = _1468 + 1;
    float _1472 = fma(_1434, _1424, _1444);
    out.m_33.x = _1418;
    float _1474 = -_1456;
    float _1476 = fma(_1290, _1406, _1474);
    float _1478 = _1232 + _1466;
    float _1480 = trunc(_1458);
    float _1482 = precise::max(_1480, 0.0);
    uint _1484 = uint(_1482);
    float _1486 = fma(_1396, _1476, _1472);
    bool _1488 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1490 = isnan(_721);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1496 = _1492 || _1494;
    float _1498 = float(_1496);
    float _1500 = _1240 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1502 = ~_1376;
    int _1504 = _1502 + 1;
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1508 = _1506 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1510 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1512 = isnan(_721);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1518 = _1514 || _1516;
    float _1520 = float(_1518);
    float _1522 = -_1498;
    float _1524 = _1522 + 1.0;
    int _1526 = _1470 * int(_1464);
    int _1528 = _1526 + _1416;
    float _1530 = _1500 + _1486;
    float _1532 = 1.0 / _1508;
    float _1534 = _1274 * _1406;
    int _1536 = ~_1376;
    int _1538 = _1536 + 1;
    float _1540 = float(uint(_1528));
    float _1542 = -_1534;
    float _1544 = fma(_1298, _1424, _1542);
    int _1546 = _1504 * int(_1484);
    int _1548 = _1546 + _1428;
    float _1550 = -_1412;
    int _1552 = _1258 ? as_type<int>(_1550) : as_type<int>(_1412);
    float _1554 = as_type<float>(_1432) * _1540;
    float _1556 = -_1520;
    float _1558 = _1556 + 1.0;
    float _1560 = float(uint(_1548));
    float _1562 = _1520 * _1524;
    bool _1564 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1566 = isnan(_721);
    bool _1568 = _1564 || _1566;
    bool _1570 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1572 = _1568 || _1570;
    float _1574 = float(_1572);
    float _1576 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1578 = _1530 + _1576;
    float _1580 = trunc(_1554);
    float _1582 = precise::max(_1580, 0.0);
    uint _1584 = uint(_1582);
    float _1586 = as_type<float>(_1446) * _1560;
    float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1590 = _1588 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1592 = _1574 * _1558;
    float _1594 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1596 = _1478 + _1594;
    float _1598 = _1578 * _1578;
    bool _1600 = !_956;
    float _1602 = _1600 ? _1412 : as_type<float>(_1552);
    float _1604 = _1430 * _1592;
    float _1606 = _1394 * _1290;
    float _1608 = fma(_1596, _1596, _1598);
    float _1610 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1612 = _721 + _1610;
    float _1614 = trunc(_1586);
    float _1616 = precise::max(_1614, 0.0);
    uint _1618 = uint(_1616);
    float _1620 = fma(_1434, _1404, _1606);
    int _1622 = ~_1336;
    int _1624 = _1622 + 1;
    float _1626 = _1590 * _1532;
    float _1628 = -_1574;
    float _1630 = _1628 + 1.0;
    int _1632 = int(_1464) + int(_1584);
    float _1634 = fma(_1396, _1544, _1620);
    float _1636 = fma(_1626, _1612, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1638 = sqrt(_1608);
    float _1640 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1604);
    int _1642 = _1624 * _1632;
    int _1644 = _1642 + _1416;
    float _1646 = _1356 + _1634;
    float _1648 = -_1352;
    int _1650 = _1234 ? as_type<int>(_1648) : as_type<int>(_1352);
    float _1652 = fma(_1636, _1562, _1640);
    bool _1654 = uint(_1644) >= uint(_1336);
    int _1656 = int(_1484) + int(_1618);
    float _1658 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1652);
    bool _1660 = !_968;
    float _1662 = _1660 ? _1352 : as_type<float>(_1650);
    bool _1664 = !_1654;
    int _1666 = _1664 ? 0 : (-1);
    int _1668 = _1538 * _1656;
    int _1670 = _1668 + _1428;
    bool _1672 = _1638 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1674 = _1356;
    float _1676 = _1478;
    float _1678 = _1530;
    if (!_1672)
    {
        _1674 = _1646;
    }
    float _1680 = _1674;
    bool _1682 = !_1672;
    float _1684 = _1680;
    if (!_1682)
    {
        float _1686 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1688 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1690 = _1638 + _1688;
        float _1692 = rsqrt(_1608);
        float _1694 = _1690 * _1686;
        float _1696 = _1646 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1698 = _1694 * 0.15915493667125701904296875;
        float _1700 = _1698 * 6.283185482025146484375;
        float _1702 = cos(_1700);
        float _1704 = _1698 * 6.283185482025146484375;
        float _1706 = sin(_1704);
        float _1708 = _1702 + (-1.0);
        float _1710 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1712 = fma(_1706, _1696, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1714 = fma(_1646, _1702, _1710);
        float _1716 = _1692 * _1712;
        float _1718 = fma(_1596, _1716, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1720 = fma(_1578, _1716, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1684 = _1714;
        _1676 = _1718;
        _1678 = _1720;
    }
    float _1722 = _1684;
    float _1724 = _1676;
    float _1726 = _1678;
    int _1728 = ~_1632;
    int _1730 = _1728 + _1666;
    int _1732 = _1730 + 1;
    float _1734 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _1736 = uint(_1670) >= uint(_1376);
    float _1738 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1740 = _1416 ^ _1336;
    int _1742 = _1336 * _1732;
    int _1744 = _1742 + _1416;
    bool _1746 = !_1736;
    int _1748 = _1746 ? 0 : (-1);
    float _1750 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    uint _1752 = uint(int(uint(_1740) >> uint(31)));
    float _1754 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1756 = _1336 == 0;
    float _1758 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1750);
    bool _1760 = _1336 == 0;
    float _1762 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1734);
    int _1764 = ~_1748;
    int _1766 = _1656 + _1764;
    int _1768 = _1766 + 1;
    float _1770 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1772 = ~int(_1752);
    int _1774 = _1772 + 1;
    float _1776 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1738);
    bool _1778 = !_1756;
    int _1780 = _1778 ? _1744 : (-1);
    float _1782 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1758);
    int _1784 = _1768 ^ _1774;
    float _1786 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1754);
    float _1788 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1790 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1762);
    int _1792 = ~_1774;
    int _1794 = _1792 + _1784;
    int _1796 = _1794 + 1;
    float _1798 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1776);
    float _1800 = _1782 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1802 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1786);
    float _1804 = float(_1780);
    float _1806 = _1790 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1808 = !_1760;
    int _1810 = _1808 ? _1796 : (-1);
    float _1812 = _1800 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1814 = _1800 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1816 = _1800 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1818 = _1800 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1820 = fma(_1788, _1804, _1140);
    float _1822 = _1602 + 0.5;
    float _1824 = float(_1810);
    float _1826 = _1770 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1828 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1812);
    float _1830 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1814);
    float _1832 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1816);
    float _1834 = _1798 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1836 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1818);
    float _1838 = fma(_1788, _1822, _1820);
    float _1840 = -_1256;
    float _1842 = _1840 + 1.0;
    float _1844 = -_1250;
    float _1846 = fma(_1826, _1824, _1844);
    float _1848 = _1662 + (-0.5);
    float _1850 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1828);
    float _1852 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1830);
    float _1854 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1832);
    float _1856 = _1802 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1858 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1836);
    float _1860 = -_1826;
    float _1862 = fma(_1860, _1848, _1846);
    float _1864 = -_1842;
    float _1866 = fma(_1602, _1864, _1838);
    float _1868 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1858);
    float _1870 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1854);
    float _1872 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1852);
    float _1874 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1850);
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1878 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1880 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1882 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1886 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1888 = -_1262;
    float _1890 = _1888 + 1.0;
    float _1892 = _1870 + _1868;
    float _1894 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1896 = _1876 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1898 = _1878 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1900 = _1880 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1902 = _1882 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1904 = _1884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1906 = _1886 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1908 = _1658 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1910 = _1892 * 0.5;
    float _1912 = fma(_1662, _1890, _1862);
    out.m_44.x = _1902;
    out.m_44.y = _1904;
    out.m_44.z = _1906;
    out.m_44.w = _1894;
    out.m_46.x = _1896;
    out.m_46.y = _1898;
    out.m_46.z = _1900;
    out.m_46.w = _1908;
    out.gl_Position.x = _1874;
    out.gl_Position.y = _1872;
    out.gl_Position.z = _1870;
    out.gl_Position.w = _1868;
    out.m_48.z = _1910;
    out.m_48.w = _1868;
    out.m_50.x = _1866;
    out.m_50.y = _1912;
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
    bool _711 = false;
    bool _605 = false;
    bool _455 = false;
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
    if (!_73)
    {
        out.m_33.x = 0.0;
    }
    int _79 = 0;
    if (!_73)
    {
        float _81 = _77 * 5.0;
        _79 = as_type<int>(_81);
    }
    int _83 = _79;
    int _85 = _83;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1968 = as_type<float>(_83);
        out.gl_Position.z = _1968;
    }
    if (!_73)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _87 = in.m_35.w;
    bool _89 = _87 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _91 = isnan(_87);
    bool _93 = _89 || _91;
    bool _95 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _97 = _93 || _95;
    float _99 = -_87;
    float _101 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _103 = 0.0;
    if (_97)
    {
        float _105 = float(_69);
        _103 = _105;
    }
    float _107 = _103;
    bool _109 = _101 >= _107;
    bool _111 = !_97;
    bool _113 = _109 || _111;
    float _115 = 0.0;
    float _117 = _107;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _115;
    float _121 = _119;
    if (_113)
    {
        out.m_33.x = 0.0;
    }
    if (_113)
    {
        float _123 = _119 * 5.0;
        _85 = as_type<int>(_123);
    }
    int _125 = _85;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2038 = as_type<float>(_125);
        out.gl_Position.z = _2038;
    }
    if (_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_35.x;
    float _129 = in.m_35.y;
    float _131 = in.m_35.z;
    float _133 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _135 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _137 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _139 = _135 || _137;
    bool _141 = isnan(1.0);
    bool _143 = _139 || _141;
    float _145 = 0.0;
    float _147 = _133;
    if (!_143)
    {
        float _149 = _133 * _133;
        float _151 = _149 * 0.5;
        _145 = _151;
    }
    float _153 = _145;
    float _155 = 0.0;
    float _157 = _153;
    if (!_143)
    {
        float _159 = _101 * _101;
        float _161 = _159 * 0.5;
        _155 = _161;
    }
    float _163 = _155;
    if (!_143)
    {
        float _165 = _153 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _157 = _165;
    }
    float _167 = _157;
    bool _169 = !_143;
    float _171 = _167;
    if (!_169)
    {
        float _173 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _175 = log2(_173);
        float _177 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _179 = _177 + 1.0;
        float _181 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _183 = _133 * _175;
        float _185 = 1.0 / _179;
        float _187 = _181 * 0.693147182464599609375;
        float _189 = exp2(_183);
        float _191 = 1.0 / _187;
        float _193 = _189 + (-1.0);
        float _195 = -_193;
        float _197 = fma(_195, _191, _133);
        float _199 = _197 * _185;
        float _201 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _121 = _191;
        _171 = _201;
        _117 = _189;
    }
    float _203 = _121;
    float _205 = _171;
    float _207 = _117;
    bool _209 = !_143;
    float _211 = _203;
    float _213 = _207;
    if (!_209)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = 1.0 / _221;
        float _225 = _133 * _217;
        float _227 = exp2(_225);
        float _229 = -_227;
        float _231 = _229 + 1.0;
        float _233 = _231 * _223;
        _211 = _227;
        _213 = _221;
        _147 = _233;
    }
    float _235 = _211;
    float _237 = _213;
    float _239 = _147;
    float _241 = _237;
    float _243 = _235;
    if (!_143)
    {
        _241 = _101;
    }
    float _245 = _241;
    float _247 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _245;
    if (!_143)
    {
        float _251 = _163 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _243 = _251;
    }
    float _253 = _243;
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
    float _317 = fma(_239, _129, _247);
    float _319 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _321 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _323 = fma(_313, _129, _315);
    float _325 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _327 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _329 = fma(_239, _127, _319);
    float _331 = fma(_313, _127, _321);
    float _333 = -_323;
    float _335 = _317 + _333;
    float _337 = fma(_239, _131, _325);
    float _339 = fma(_313, _131, _327);
    float _341 = -_331;
    float _343 = _329 + _341;
    float _345 = _335 * _335;
    float _347 = in.m_37.w;
    float _349 = -_339;
    float _351 = _337 + _349;
    float _353 = _335 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _355 = fma(_343, _343, _345);
    float _357 = _335 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _359 = in.m_30.x;
    float _361 = in.m_30.y;
    float _363 = in.m_30.z;
    float _365 = _335 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _367 = fma(_351, _351, _355);
    float _369 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].x, _353);
    float _371 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].x, _357);
    float _373 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].x, _365);
    float _375 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[4].z, _369);
    float _377 = sqrt(_367);
    float _379 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[6].z, _373);
    bool _381 = _377 >= 9.9999999747524270787835121154785e-07;
    bool _383 = isnan(_377);
    bool _385 = _381 || _383;
    bool _387 = isnan(9.9999999747524270787835121154785e-07);
    bool _389 = _385 || _387;
    float _391 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[5].z, _371);
    float _393 = fma(_329, _347, _359);
    float _395 = fma(_317, _347, _361);
    float _397 = fma(_337, _347, _363);
    float _399 = _371;
    float _401 = _375;
    float _403 = _391;
    if (_389)
    {
        _399 = _375;
    }
    float _405 = _399;
    float _407 = _405;
    if (_389)
    {
        _401 = _391;
    }
    float _409 = _401;
    float _411 = _409;
    if (_389)
    {
        _403 = _379;
    }
    float _413 = _403;
    float _415 = _413;
    if (!_389)
    {
        bool _417 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _419 = !_417;
        if (!_419)
        {
            float _421 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _423 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _425 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _427 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _421);
            float _429 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _423);
            float _431 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _425);
            float _433 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _427);
            float _435 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _429);
            float _437 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _431);
            float _439 = _433 * _433;
            float _441 = fma(_435, _435, _439);
            float _443 = fma(_437, _437, _441);
            float _445 = rsqrt(_443);
            float _447 = _445 * 9.9999999747524270787835121154785e-07;
            float _449 = _435 * _447;
            float _451 = _433 * _447;
            float _453 = _437 * _447;
            _411 = _451;
            _407 = _449;
            _415 = _453;
            _455 = true;
        }
        else
        {
            float _457 = _129 * _129;
            float _459 = fma(_127, _127, _457);
            float _461 = fma(_131, _131, _459);
            float _463 = sqrt(_461);
            bool _465 = _463 >= 9.9999999747524270787835121154785e-07;
            bool _467 = isnan(_463);
            bool _469 = _465 || _467;
            bool _471 = isnan(9.9999999747524270787835121154785e-07);
            bool _473 = _469 || _471;
            if (!_473)
            {
                float _475 = _361 * _361;
                float _477 = fma(_359, _359, _475);
                float _479 = fma(_363, _363, _477);
                float _481 = sqrt(_479);
                bool _483 = _481 >= 9.9999999747524270787835121154785e-07;
                bool _485 = isnan(_481);
                bool _487 = _483 || _485;
                bool _489 = isnan(9.9999999747524270787835121154785e-07);
                bool _491 = _487 || _489;
                if (!_491)
                {
                    float _493 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _495 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _493);
                    float _497 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _495);
                    float _499 = rsqrt(_497);
                    float _501 = _499 * 9.9999999747524270787835121154785e-07;
                    float _503 = _501 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _505 = _501 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _507 = _501 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _411 = _505;
                    _407 = _503;
                    _415 = _507;
                    _455 = true;
                }
                else
                {
                    float _509 = _361 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _511 = _361 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _513 = _361 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _515 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].x, _509);
                    float _517 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].x, _511);
                    float _519 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].x, _513);
                    float _521 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].z, _515);
                    float _523 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].z, _517);
                    float _525 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].z, _519);
                    float _527 = _521 * _521;
                    float _529 = fma(_523, _523, _527);
                    float _531 = fma(_525, _525, _529);
                    float _533 = rsqrt(_531);
                    float _535 = _533 * 9.9999999747524270787835121154785e-07;
                    float _537 = _523 * _535;
                    float _539 = _521 * _535;
                    float _541 = _525 * _535;
                    _411 = _539;
                    _407 = _537;
                    _415 = _541;
                    _455 = true;
                }
            }
            else
            {
                float _543 = _129 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _545 = _129 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _547 = _129 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _549 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[5].x, _543);
                float _551 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[4].x, _545);
                float _553 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[6].x, _547);
                float _555 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[5].z, _549);
                float _557 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[4].z, _551);
                float _559 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[6].z, _553);
                float _561 = _555 * _555;
                float _563 = fma(_557, _557, _561);
                float _565 = fma(_559, _559, _563);
                float _567 = rsqrt(_565);
                float _569 = _567 * 9.9999999747524270787835121154785e-07;
                float _571 = _557 * _569;
                float _573 = _555 * _569;
                float _575 = _559 * _569;
                _411 = _573;
                _407 = _571;
                _415 = _575;
            }
        }
    }
    _455 = false;
    float _577 = _411;
    float _579 = _407;
    float _581 = _415;
    bool _583 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _585 = !_583;
    float _603;
    if (!_585)
    {
        float _587 = in.m_39.x;
        float _589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _591 = _587 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _593 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[12].x, _101);
        float _595 = _593 * _589;
        float _597 = floor(_595);
        float _599 = -_597;
        float _601 = _595 + _599;
        _603 = _601;
        _605 = true;
    }
    else
    {
        float _607 = float(_69);
        float _609 = 1.0 / _607;
        float _611 = _101 * _609;
        _603 = _611;
    }
    _605 = false;
    float _613 = _603;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _617 = _613 + _615;
    bool _619 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _621 = isnan(_613);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _631;
    float _635 = -_629;
    float _637 = _635 + 1.0;
    bool _639 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _641 = isnan(_613);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _651;
    bool _655 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _657 = 1.0 / _633;
    float _659 = _649 * _637;
    float _661 = -_649;
    float _663 = _661 + 1.0;
    float _665 = _617 * _657;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _667;
    float _671 = fma(_653, _665, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _673 = fma(_669, _665, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _675 = _671 * _659;
    float _677 = _673 * _659;
    float _679 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[143].x, _675);
    float _681 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[143].y, _677);
    float _683 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[144].x, _679);
    float _685 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[144].y, _681);
    bool _687 = !_655;
    float _707;
    float _709;
    if (!_687)
    {
        float _689 = in.m_39.x;
        float _691 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _693 = float(_69);
        float _695 = _689 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _697 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[11].y, _101);
        float _699 = _697 * _691;
        float _701 = floor(_699);
        float _703 = -_701;
        float _705 = _699 + _703;
        _707 = _693;
        _709 = _705;
        _711 = true;
    }
    else
    {
        float _713 = float(_69);
        float _715 = 1.0 / _713;
        float _717 = _101 * _715;
        _707 = _713;
        _709 = _717;
    }
    _711 = false;
    float _719 = _707;
    float _721 = _709;
    float _723 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _725 = int(_723);
    float _727 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _729 = int(_727);
    float _731 = float(_725);
    float _733 = 1.0 / _719;
    float _735 = float(uint(_729));
    float _737 = 1.0 / _731;
    int _739 = ~_729;
    int _741 = _739 + 1;
    int _743 = ~_729;
    int _745 = _743 + 1;
    float _747 = float(_729);
    bool _749 = _729 == 0;
    float _751 = 1.0 / _735;
    int _753 = _729 + (-1);
    float _755 = _101 * _737;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _759 = _757 != 0;
    float _761 = trunc(_755);
    int _763 = int(_761);
    int _765 = as_type<int>(_751) + (-2);
    bool _767 = !_759;
    float _769 = _767 ? 7.345489978790283203125 : 1.0;
    float _771 = float(uint(_763));
    float _773 = as_type<float>(_765) * _771;
    float _775 = in.m_39.x;
    float _777 = in.m_39.y;
    float _779 = trunc(_773);
    float _781 = precise::max(_779, 0.0);
    uint _784 = uint(_781);
    int _786 = _741 * int(_784);
    int _788 = _786 + _763;
    float _790 = float(uint(_788));
    float _792 = _769 * _775;
    float _794 = _777 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _796 = as_type<float>(_765) * _790;
    float _798 = float(_763);
    float _800 = floor(_792);
    bool _802 = _798 >= _747;
    bool _804 = isnan(_798);
    bool _806 = _802 || _804;
    bool _808 = isnan(_747);
    bool _810 = _806 || _808;
    float _812 = float(_810);
    float _814 = trunc(_796);
    float _816 = precise::max(_814, 0.0);
    uint _818 = uint(_816);
    float _820 = trunc(_812);
    int _822 = int(_820);
    int _824 = int(_784) + int(_818);
    int _826 = _745 * _824;
    int _828 = _826 + _763;
    bool _830 = uint(_828) >= uint(_729);
    float _832 = -_800;
    float _834 = _792 + _832;
    bool _836 = !_830;
    int _838 = _836 ? 0 : (-1);
    int _840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _842 = _840 != 0;
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _846 = _844 != 0;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _850 = _848 != 0;
    int _852 = ~_824;
    int _854 = _852 + _838;
    int _856 = _854 + 1;
    float _858 = _834 * _747;
    float _860 = _101 * _747;
    int _862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _864 = _862 != 0;
    int _866 = _729 * _856;
    int _868 = _866 + _763;
    float _870 = _860 * _733;
    int _872 = ~_822;
    int _874 = _872 + 1;
    int _876 = _874 + 1;
    float _878 = trunc(_858);
    int _880 = int(_878);
    bool _882 = !_864;
    int _884 = _882 ? 0 : 1;
    bool _886 = !_749;
    int _888 = _886 ? _868 : (-1);
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _892 = _890 != 0;
    int _894 = abs(_884);
    int _896 = _888 * _876;
    float _898 = trunc(_870);
    int _900 = int(_898);
    bool _902 = !_846;
    int _904 = _902 ? 0 : 1;
    int _906 = _822 * _753;
    int _908 = _906 + _896;
    bool _910 = !_842;
    int _912 = _910 ? 0 : 1;
    int _914 = abs(_904);
    int _916 = _880 * _894;
    int _918 = _916 + _763;
    bool _920 = !_850;
    int _922 = _920 ? 0 : 1;
    int _924 = abs(_912);
    bool _926 = !_892;
    int _928 = _926 ? 0 : 1;
    int _930 = abs(_922);
    int _932 = _908 * _914;
    int _934 = abs(_928);
    int _936 = _900 * _924;
    int _938 = _936 + _932;
    float _940 = float(uint(_918));
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _944 = _942 != 0;
    int _946 = _918 * _930;
    int _948 = _946 + _938;
    int _950 = ~_729;
    int _952 = _950 + 1;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _956 = _954 != 0;
    int _958 = _880 * _934;
    int _960 = _958 + _948;
    int _962 = ~_729;
    int _964 = _962 + 1;
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _968 = _966 != 0;
    float _970 = float(uint(_960));
    bool _972 = !_944;
    int _974 = _972 ? 0 : 1;
    float _976 = as_type<float>(_765) * _970;
    float _978 = trunc(_976);
    float _980 = precise::max(_978, 0.0);
    uint _982 = uint(_980);
    float _984 = as_type<float>(int(gl_VertexIndex));
    int _986 = _952 * int(_982);
    int _988 = _986 + _960;
    float _990 = float(uint(_988));
    float _992 = as_type<float>(_765) * _940;
    float _994 = as_type<float>(_765) * _990;
    float _996 = trunc(_992);
    float _998 = precise::max(_996, 0.0);
    uint _1000 = uint(_998);
    float _1002 = trunc(_994);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    int _1008 = int(_982) + int(_1006);
    int _1010 = _964 * _1008;
    int _1012 = _1010 + _960;
    bool _1014 = uint(_1012) >= uint(_729);
    int _1016 = ~_729;
    int _1018 = _1016 + 1;
    bool _1020 = !_1014;
    int _1022 = _1020 ? 0 : (-1);
    int _1024 = as_type<int>(_984) & 1;
    bool _1026 = _1024 != 0;
    int _1028 = as_type<int>(_984) & 2;
    bool _1030 = _1028 != 0;
    int _1032 = _1018 * int(_1000);
    int _1034 = _1032 + _918;
    int _1036 = ~_1008;
    int _1038 = _1036 + _1022;
    int _1040 = _1038 + 1;
    float _1042 = _395 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1044 = float(uint(_1034));
    int _1046 = _729 * _1040;
    int _1048 = _1046 + _960;
    float _1050 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1042);
    float _1052 = in.m_37.x;
    float _1054 = in.m_37.y;
    float _1056 = as_type<float>(_765) * _1044;
    bool _1058 = !_749;
    int _1060 = _1058 ? _1048 : (-1);
    float _1062 = _395 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1064 = _395 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1066 = _1060 >> 31;
    float _1068 = trunc(_1056);
    float _1070 = precise::max(_1068, 0.0);
    uint _1072 = uint(_1070);
    float _1074 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1064);
    float _1076 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1062);
    int _1078 = _1066 & 3;
    int _1080 = _1060 & 3;
    bool _1082 = _1080 != 0;
    int _1084 = _1060 + _1078;
    int _1086 = _1060 & 3;
    bool _1088 = _1086 != 0;
    int _1090 = _1084 >> 2;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1094 = _1082 ? 0 : 1;
    float _1096 = _683 * _1052;
    bool _1098 = uint(_1086) > 1u;
    float _1100 = _775 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1102 = _685 * _1054;
    int _1104 = _1090 << 4;
    int _1106 = _1104 + 368;
    float _1108 = _1096 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1110 = -_1092;
    float _1112 = fma(_1100, 2.0, _1110);
    int _1114 = int(_1000) + int(_1072);
    float _1116 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    uint _1118 = uint(int(uint(_1106) >> uint(2)));
    uint _1120 = uint(int(uint(int(_1118)) >> uint(2)));
    int _1122 = int(_1118) & 3;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[int(_1120)][_1122];
    int _1126 = int(_1118) + 1;
    uint _1128 = uint(int(uint(_1126) >> uint(2)));
    int _1130 = _1126 & 3;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[int(_1128)][_1130];
    bool _1134 = !_1088;
    int _1136 = _1134 ? 0 : 1;
    float _1138 = -_101;
    float _1140 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1112);
    bool _1142 = uint(_1086) >= 2u;
    int _1144 = ~_1094;
    int _1146 = _1144 + 1;
    int _1148 = _1146 + 1;
    int _1150 = _1148;
    if (!_1098)
    {
        int _1152 = ~_1094;
        int _1154 = _1152 + 1;
        _1150 = _1154;
    }
    int _1156 = _1150;
    int _1158 = _1142 ? 0 : 1;
    bool _1160 = _1086 != 3;
    bool _1162 = _1086 != 3;
    int _1164 = _1106 + 8;
    uint _1166 = uint(int(uint(_1164) >> uint(2)));
    uint _1168 = uint(int(uint(int(_1166)) >> uint(2)));
    int _1170 = int(_1166) & 3;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[int(_1168)][_1170];
    int _1174 = int(_1166) + 1;
    uint _1176 = uint(int(uint(_1174) >> uint(2)));
    int _1178 = _1174 & 3;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[int(_1176)][_1178];
    int _1182 = ~_729;
    int _1184 = _1182 + 1;
    int _1186 = ~_1158;
    int _1188 = _1186 + 1;
    int _1190 = _1188 + 1;
    float _1192 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1194 = abs(_1156);
    int _1196 = _1184 * _1114;
    int _1198 = _1196 + _918;
    int _1200 = _1190;
    if (_1160)
    {
        int _1202 = ~_1158;
        int _1204 = _1202 + 1;
        _1200 = _1204;
    }
    int _1206 = _1200;
    float _1208 = fma(_794, -2.0, _1192);
    float _1210 = _577 * _577;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1214 = uint(_1198) >= uint(_729);
    float _1216 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1050);
    float _1218 = fma(_579, _579, _1210);
    float _1220 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1212);
    bool _1222 = !_1214;
    int _1224 = _1222 ? 0 : (-1);
    float _1226 = fma(_581, _581, _1218);
    int _1228 = abs(_1136);
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1232 = _1216 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1234 = _777 > 0.5;
    float _1236 = rsqrt(_1226);
    float _1238 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1076);
    float _1240 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1074);
    float _1242 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1230);
    int _1244 = ~_1194;
    int _1246 = _1244 + 1;
    int _1248 = _1246 + 1;
    float _1250 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1208);
    bool _1252 = !_1162;
    int _1254 = _1252 ? 0 : (-1);
    float _1256 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1242);
    bool _1258 = _775 > 0.5;
    int _1260 = _1248 * as_type<int>(_1132);
    float _1262 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1220);
    int _1264 = ~_1228;
    int _1266 = _1264 + 1;
    int _1268 = _1266 + 1;
    float _1270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1272 = abs(_1206);
    float _1274 = _1236 * _581;
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1278 = _1276 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1280 = _1268 * as_type<int>(_1124);
    int _1282 = _1280 + _1260;
    int _1284 = ~_1114;
    int _1286 = _1284 + _1224;
    int _1288 = _1286 + 1;
    float _1290 = _1236 * _577;
    int _1292 = ~_1272;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    float _1298 = _1236 * _579;
    float _1300 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1302 = _1274 * _1300;
    float _1304 = 1.0 / _1278;
    int _1306 = _1296 * as_type<int>(_1172);
    int _1308 = _1306 + _1282;
    float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1312 = _1290 * _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1316 = -_1302;
    float _1318 = fma(_1298, _1314, _1316);
    float _1320 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1322 = _1298 * _1320;
    int _1324 = _729 * _1288;
    int _1326 = _1324 + _918;
    float _1328 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1330 = -_1312;
    float _1332 = fma(_1274, _1328, _1330);
    float _1334 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1336 = int(_1334);
    float _1338 = _1318 * _1318;
    float _1340 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1342 = -_1322;
    float _1344 = fma(_1290, _1340, _1342);
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1346;
    bool _1350 = !_1030;
    float _1352 = _1350 ? (-0.5) : 0.5;
    float _1354 = fma(_1332, _1332, _1338);
    float _1356 = _1238 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1358 = _1348 * _1304;
    float _1360 = fma(_1344, _1344, _1354);
    int _1362 = abs(_1254);
    float _1364 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1352);
    int _1366 = abs(_974);
    float _1368 = rsqrt(_1360);
    int _1370 = ~_1362;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    int _1376 = abs(_1336);
    float _1378 = float(uint(_1336));
    int _1380 = _1374 * as_type<int>(_1180);
    int _1382 = _1380 + _1308;
    float _1384 = float(uint(_1376));
    int _1386 = ~_1366;
    int _1388 = _1386 + 1;
    int _1390 = _1388 + 1;
    float _1392 = 1.0 / _1378;
    float _1394 = _1116 * _1364;
    float _1396 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1398 = _1382 * _1390;
    bool _1400 = !_749;
    int _1402 = _1400 ? _1326 : (-1);
    float _1404 = _1318 * _1368;
    float _1406 = _1332 * _1368;
    float _1408 = 1.0 / _1384;
    bool _1410 = !_1026;
    float _1412 = _1410 ? (-0.5) : 0.5;
    int _1414 = _1402 * _1366;
    int _1416 = _1414 + _1398;
    float _1418 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1422 = _721 + _1420;
    float _1424 = _1344 * _1368;
    float _1426 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1412);
    int _1428 = abs(_1416);
    float _1430 = fma(_1358, _1422, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1432 = as_type<int>(_1392) + (-2);
    float _1434 = _1108 * _1426;
    float _1436 = float(uint(_1416));
    float _1438 = _1394 * _1298;
    float _1440 = float(uint(_1428));
    float _1442 = _1290 * _1424;
    float _1444 = _1394 * _1274;
    int _1446 = as_type<int>(_1408) + (-2);
    float _1448 = as_type<float>(_1432) * _1436;
    float _1450 = fma(_1434, _1406, _1438);
    float _1452 = -_1442;
    float _1454 = fma(_1274, _1404, _1452);
    float _1456 = _1298 * _1404;
    float _1458 = as_type<float>(_1446) * _1440;
    float _1460 = trunc(_1448);
    float _1462 = precise::max(_1460, 0.0);
    uint _1464 = uint(_1462);
    float _1466 = fma(_1396, _1454, _1450);
    int _1468 = ~_1336;
    int _1470 = _1468 + 1;
    float _1472 = fma(_1434, _1424, _1444);
    out.m_33.x = _1418;
    float _1474 = -_1456;
    float _1476 = fma(_1290, _1406, _1474);
    float _1478 = _1232 + _1466;
    float _1480 = trunc(_1458);
    float _1482 = precise::max(_1480, 0.0);
    uint _1484 = uint(_1482);
    float _1486 = fma(_1396, _1476, _1472);
    bool _1488 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1490 = isnan(_721);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1496 = _1492 || _1494;
    float _1498 = float(_1496);
    float _1500 = _1240 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1502 = ~_1376;
    int _1504 = _1502 + 1;
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1508 = _1506 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1510 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1512 = isnan(_721);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1518 = _1514 || _1516;
    float _1520 = float(_1518);
    float _1522 = -_1498;
    float _1524 = _1522 + 1.0;
    int _1526 = _1470 * int(_1464);
    int _1528 = _1526 + _1416;
    float _1530 = _1500 + _1486;
    float _1532 = 1.0 / _1508;
    float _1534 = _1274 * _1406;
    int _1536 = ~_1376;
    int _1538 = _1536 + 1;
    float _1540 = float(uint(_1528));
    float _1542 = -_1534;
    float _1544 = fma(_1298, _1424, _1542);
    int _1546 = _1504 * int(_1484);
    int _1548 = _1546 + _1428;
    float _1550 = -_1412;
    int _1552 = _1258 ? as_type<int>(_1550) : as_type<int>(_1412);
    float _1554 = as_type<float>(_1432) * _1540;
    float _1556 = -_1520;
    float _1558 = _1556 + 1.0;
    float _1560 = float(uint(_1548));
    float _1562 = _1520 * _1524;
    bool _1564 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1566 = isnan(_721);
    bool _1568 = _1564 || _1566;
    bool _1570 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1572 = _1568 || _1570;
    float _1574 = float(_1572);
    float _1576 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1578 = _1530 + _1576;
    float _1580 = trunc(_1554);
    float _1582 = precise::max(_1580, 0.0);
    uint _1584 = uint(_1582);
    float _1586 = as_type<float>(_1446) * _1560;
    float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1590 = _1588 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1592 = _1574 * _1558;
    float _1594 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1596 = _1478 + _1594;
    float _1598 = _1578 * _1578;
    bool _1600 = !_956;
    float _1602 = _1600 ? _1412 : as_type<float>(_1552);
    float _1604 = _1430 * _1592;
    float _1606 = _1394 * _1290;
    float _1608 = fma(_1596, _1596, _1598);
    float _1610 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1612 = _721 + _1610;
    float _1614 = trunc(_1586);
    float _1616 = precise::max(_1614, 0.0);
    uint _1618 = uint(_1616);
    float _1620 = fma(_1434, _1404, _1606);
    int _1622 = ~_1336;
    int _1624 = _1622 + 1;
    float _1626 = _1590 * _1532;
    float _1628 = -_1574;
    float _1630 = _1628 + 1.0;
    int _1632 = int(_1464) + int(_1584);
    float _1634 = fma(_1396, _1544, _1620);
    float _1636 = fma(_1626, _1612, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1638 = sqrt(_1608);
    float _1640 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1604);
    int _1642 = _1624 * _1632;
    int _1644 = _1642 + _1416;
    float _1646 = _1356 + _1634;
    float _1648 = -_1352;
    int _1650 = _1234 ? as_type<int>(_1648) : as_type<int>(_1352);
    float _1652 = fma(_1636, _1562, _1640);
    bool _1654 = uint(_1644) >= uint(_1336);
    int _1656 = int(_1484) + int(_1618);
    float _1658 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1652);
    bool _1660 = !_968;
    float _1662 = _1660 ? _1352 : as_type<float>(_1650);
    bool _1664 = !_1654;
    int _1666 = _1664 ? 0 : (-1);
    int _1668 = _1538 * _1656;
    int _1670 = _1668 + _1428;
    bool _1672 = _1638 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1674 = _1356;
    float _1676 = _1478;
    float _1678 = _1530;
    if (!_1672)
    {
        _1674 = _1646;
    }
    float _1680 = _1674;
    bool _1682 = !_1672;
    float _1684 = _1680;
    if (!_1682)
    {
        float _1686 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1688 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1690 = _1638 + _1688;
        float _1692 = rsqrt(_1608);
        float _1694 = _1690 * _1686;
        float _1696 = _1646 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1698 = _1694 * 0.15915493667125701904296875;
        float _1700 = _1698 * 6.283185482025146484375;
        float _1702 = cos(_1700);
        float _1704 = _1698 * 6.283185482025146484375;
        float _1706 = sin(_1704);
        float _1708 = _1702 + (-1.0);
        float _1710 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1712 = fma(_1706, _1696, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1714 = fma(_1646, _1702, _1710);
        float _1716 = _1692 * _1712;
        float _1718 = fma(_1596, _1716, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1720 = fma(_1578, _1716, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1684 = _1714;
        _1676 = _1718;
        _1678 = _1720;
    }
    float _1722 = _1684;
    float _1724 = _1676;
    float _1726 = _1678;
    int _1728 = ~_1632;
    int _1730 = _1728 + _1666;
    int _1732 = _1730 + 1;
    float _1734 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _1736 = uint(_1670) >= uint(_1376);
    float _1738 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1740 = _1416 ^ _1336;
    int _1742 = _1336 * _1732;
    int _1744 = _1742 + _1416;
    bool _1746 = !_1736;
    int _1748 = _1746 ? 0 : (-1);
    float _1750 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    uint _1752 = uint(int(uint(_1740) >> uint(31)));
    float _1754 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1756 = _1336 == 0;
    float _1758 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1750);
    bool _1760 = _1336 == 0;
    float _1762 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1734);
    int _1764 = ~_1748;
    int _1766 = _1656 + _1764;
    int _1768 = _1766 + 1;
    float _1770 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1772 = ~int(_1752);
    int _1774 = _1772 + 1;
    float _1776 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1738);
    bool _1778 = !_1756;
    int _1780 = _1778 ? _1744 : (-1);
    float _1782 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1758);
    int _1784 = _1768 ^ _1774;
    float _1786 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1754);
    float _1788 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1790 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1762);
    int _1792 = ~_1774;
    int _1794 = _1792 + _1784;
    int _1796 = _1794 + 1;
    float _1798 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1776);
    float _1800 = _1782 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1802 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1786);
    float _1804 = float(_1780);
    float _1806 = _1790 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1808 = !_1760;
    int _1810 = _1808 ? _1796 : (-1);
    float _1812 = _1800 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1814 = _1800 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1816 = _1800 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1818 = _1800 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1820 = fma(_1788, _1804, _1140);
    float _1822 = _1602 + 0.5;
    float _1824 = float(_1810);
    float _1826 = _1770 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1828 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1812);
    float _1830 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1814);
    float _1832 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1816);
    float _1834 = _1798 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1836 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1818);
    float _1838 = fma(_1788, _1822, _1820);
    float _1840 = -_1256;
    float _1842 = _1840 + 1.0;
    float _1844 = -_1250;
    float _1846 = fma(_1826, _1824, _1844);
    float _1848 = _1662 + (-0.5);
    float _1850 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1828);
    float _1852 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1830);
    float _1854 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1832);
    float _1856 = _1802 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1858 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1836);
    float _1860 = -_1826;
    float _1862 = fma(_1860, _1848, _1846);
    float _1864 = -_1842;
    float _1866 = fma(_1602, _1864, _1838);
    float _1868 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1858);
    float _1870 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1854);
    float _1872 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1852);
    float _1874 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1850);
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1878 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1880 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1882 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1886 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1888 = -_1262;
    float _1890 = _1888 + 1.0;
    float _1892 = _1870 + _1868;
    float _1894 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1896 = _1876 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1898 = _1878 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1900 = _1880 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1902 = _1882 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1904 = _1884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1906 = _1886 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1908 = _1658 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1910 = _1892 * 0.5;
    float _1912 = fma(_1662, _1890, _1862);
    out.m_44.x = _1902;
    out.m_44.y = _1904;
    out.m_44.z = _1906;
    out.m_44.w = _1894;
    out.m_46.x = _1896;
    out.m_46.y = _1898;
    out.m_46.z = _1900;
    out.m_46.w = _1908;
    out.gl_Position.x = _1874;
    out.gl_Position.y = _1872;
    out.gl_Position.z = _1870;
    out.gl_Position.w = _1868;
    out.m_48.z = _1910;
    out.m_48.w = _1868;
    out.m_50.x = _1866;
    out.m_50.y = _1912;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

