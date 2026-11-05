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
    float4 m_42 [[user(locn0)]];
    float4 m_29 [[user(locn2)]];
    float4 m_40 [[user(locn3)]];
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
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    bool _779 = false;
    bool _585 = false;
    bool _435 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _56 = in.m_26.w;
    float _58 = trunc(_56);
    int _61 = int(_58);
    bool _65 = _61 >= 1;
    float _67 = 0.0;
    if (!_65)
    {
        _67 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _69 = _67;
    float _71 = _69;
    if (!_65)
    {
        out.m_29.x = 0.0;
    }
    int _73 = 0;
    if (!_65)
    {
        float _75 = _69 * 5.0;
        _73 = as_type<int>(_75);
    }
    int _77 = _73;
    int _79 = _77;
    if (!_65)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1318 = as_type<float>(_77);
        out.gl_Position.z = _1318;
    }
    if (!_65)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _81 = in.m_31.w;
    bool _83 = _81 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _85 = isnan(_81);
    bool _87 = _83 || _85;
    bool _89 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _91 = _87 || _89;
    float _93 = -_81;
    float _95 = _93 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _97 = 0.0;
    float _99 = 0.0;
    if (_91)
    {
        float _101 = float(_61);
        _71 = _101;
    }
    float _103 = _71;
    bool _105 = _95 >= _103;
    bool _107 = !_91;
    bool _109 = _105 || _107;
    float _111 = _103;
    if (_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    if (_109)
    {
        out.m_29.x = 0.0;
    }
    if (_109)
    {
        float _115 = _113 * 5.0;
        _79 = as_type<int>(_115);
    }
    int _117 = _79;
    float _119 = as_type<float>(_117);
    if (_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1389 = as_type<float>(_117);
        out.gl_Position.z = _1389;
    }
    if (_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _121 = in.m_31.x;
    float _123 = in.m_31.y;
    float _125 = in.m_31.z;
    float _127 = _95 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _129 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _131 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _133 = _129 || _131;
    bool _135 = isnan(1.0);
    bool _137 = _133 || _135;
    float _139 = _127;
    if (!_137)
    {
        float _141 = _127 * _127;
        float _143 = _141 * 0.5;
        _119 = _143;
    }
    float _145 = _119;
    float _147 = 0.0;
    float _149 = _145;
    if (!_137)
    {
        float _151 = _95 * _95;
        float _153 = _151 * 0.5;
        _147 = _153;
    }
    float _155 = _147;
    if (!_137)
    {
        float _157 = _145 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _149 = _157;
    }
    float _159 = _149;
    bool _161 = !_137;
    float _163 = _159;
    if (!_161)
    {
        float _165 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _167 = log2(_165);
        float _169 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _171 = _169 + 1.0;
        float _173 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _175 = _127 * _167;
        float _177 = 1.0 / _171;
        float _179 = _173 * 0.693147182464599609375;
        float _181 = exp2(_175);
        float _183 = 1.0 / _179;
        float _185 = _181 + (-1.0);
        float _187 = -_185;
        float _189 = fma(_187, _183, _127);
        float _191 = _189 * _177;
        float _193 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _97 = _183;
        _163 = _193;
        _99 = _181;
    }
    float _195 = _97;
    float _197 = _163;
    float _199 = _99;
    bool _201 = !_137;
    float _203 = _195;
    float _205 = _199;
    if (!_201)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = 1.0 / _213;
        float _217 = _127 * _209;
        float _219 = exp2(_217);
        float _221 = -_219;
        float _223 = _221 + 1.0;
        float _225 = _223 * _215;
        _203 = _219;
        _205 = _213;
        _139 = _225;
    }
    float _227 = _203;
    float _229 = _205;
    float _231 = _139;
    float _233 = _229;
    float _235 = _227;
    if (!_137)
    {
        _233 = _95;
    }
    float _237 = _233;
    float _239 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _241 = _237;
    if (!_137)
    {
        float _243 = _155 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _243;
    }
    float _245 = _235;
    bool _247 = !_137;
    float _249 = _245;
    if (!_247)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = _95 * _253;
        float _263 = 1.0 / _257;
        float _265 = _259 * 0.693147182464599609375;
        float _267 = exp2(_261);
        float _269 = 1.0 / _265;
        float _271 = _267 + (-1.0);
        float _273 = -_271;
        float _275 = fma(_273, _269, _95);
        float _277 = _275 * _263;
        float _279 = _277 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _249 = _279;
    }
    float _281 = _249;
    bool _283 = !_137;
    if (!_283)
    {
        float _285 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = log2(_285);
        float _289 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _291 = _289 + 1.0;
        float _293 = 1.0 / _291;
        float _295 = _95 * _287;
        float _297 = exp2(_295);
        float _299 = -_297;
        float _301 = _299 + 1.0;
        float _303 = _301 * _293;
        _241 = _303;
    }
    float _305 = _241;
    float _307 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _309 = fma(_231, _123, _239);
    float _311 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _313 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _315 = fma(_305, _123, _307);
    float _317 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _319 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _321 = fma(_231, _121, _311);
    float _323 = fma(_305, _121, _313);
    float _325 = -_315;
    float _327 = _309 + _325;
    float _329 = fma(_231, _125, _317);
    float _331 = fma(_305, _125, _319);
    float _333 = -_323;
    float _335 = _321 + _333;
    float _337 = _327 * _327;
    float _339 = in.m_33.w;
    float _341 = -_331;
    float _343 = _329 + _341;
    float _345 = _327 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _347 = fma(_335, _335, _337);
    float _349 = _327 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _351 = _327 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _353 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[4].x, _345);
    float _355 = fma(_343, _343, _347);
    float _357 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[5].x, _349);
    float _359 = in.m_26.x;
    float _361 = in.m_26.y;
    float _363 = in.m_26.z;
    float _365 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[6].x, _351);
    float _367 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].z, _353);
    float _369 = sqrt(_355);
    float _371 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].z, _357);
    float _373 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].z, _365);
    bool _375 = _369 >= 9.9999999747524270787835121154785e-07;
    bool _377 = isnan(_369);
    bool _379 = _375 || _377;
    bool _381 = isnan(9.9999999747524270787835121154785e-07);
    bool _383 = _379 || _381;
    float _385 = fma(_321, _339, _359);
    float _387 = fma(_309, _339, _361);
    float _389 = fma(_329, _339, _363);
    float _391 = _371;
    float _393 = _367;
    float _395 = _373;
    if (!_383)
    {
        bool _397 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _399 = !_397;
        if (!_399)
        {
            float _401 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _403 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _405 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _407 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _401);
            float _409 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _403);
            float _411 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _405);
            float _413 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _407);
            float _415 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _409);
            float _417 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _411);
            float _419 = _413 * _413;
            float _421 = fma(_415, _415, _419);
            float _423 = fma(_417, _417, _421);
            float _425 = rsqrt(_423);
            float _427 = _425 * 9.9999999747524270787835121154785e-07;
            float _429 = _415 * _427;
            float _431 = _413 * _427;
            float _433 = _417 * _427;
            _391 = _431;
            _393 = _429;
            _395 = _433;
            _435 = true;
        }
        else
        {
            float _437 = _123 * _123;
            float _439 = fma(_121, _121, _437);
            float _441 = fma(_125, _125, _439);
            float _443 = sqrt(_441);
            bool _445 = _443 >= 9.9999999747524270787835121154785e-07;
            bool _447 = isnan(_443);
            bool _449 = _445 || _447;
            bool _451 = isnan(9.9999999747524270787835121154785e-07);
            bool _453 = _449 || _451;
            if (!_453)
            {
                float _455 = _361 * _361;
                float _457 = fma(_359, _359, _455);
                float _459 = fma(_363, _363, _457);
                float _461 = sqrt(_459);
                bool _463 = _461 >= 9.9999999747524270787835121154785e-07;
                bool _465 = isnan(_461);
                bool _467 = _463 || _465;
                bool _469 = isnan(9.9999999747524270787835121154785e-07);
                bool _471 = _467 || _469;
                if (!_471)
                {
                    float _473 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _475 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _473);
                    float _477 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _475);
                    float _479 = rsqrt(_477);
                    float _481 = _479 * 9.9999999747524270787835121154785e-07;
                    float _483 = _481 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _485 = _481 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _487 = _481 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _391 = _485;
                    _393 = _483;
                    _395 = _487;
                    _435 = true;
                }
                else
                {
                    float _489 = _361 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _491 = _361 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _493 = _361 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _495 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].x, _489);
                    float _497 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].x, _491);
                    float _499 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].x, _493);
                    float _501 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].z, _495);
                    float _503 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].z, _497);
                    float _505 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].z, _499);
                    float _507 = _501 * _501;
                    float _509 = fma(_503, _503, _507);
                    float _511 = fma(_505, _505, _509);
                    float _513 = rsqrt(_511);
                    float _515 = _513 * 9.9999999747524270787835121154785e-07;
                    float _517 = _503 * _515;
                    float _519 = _501 * _515;
                    float _521 = _505 * _515;
                    _391 = _519;
                    _393 = _517;
                    _395 = _521;
                    _435 = true;
                }
            }
            else
            {
                float _523 = _123 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _525 = _123 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _527 = _123 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _529 = fma(_121, (*spvDescriptorSet0.vp_c10)._m0[5].x, _523);
                float _531 = fma(_121, (*spvDescriptorSet0.vp_c10)._m0[4].x, _525);
                float _533 = fma(_121, (*spvDescriptorSet0.vp_c10)._m0[6].x, _527);
                float _535 = fma(_125, (*spvDescriptorSet0.vp_c10)._m0[5].z, _529);
                float _537 = fma(_125, (*spvDescriptorSet0.vp_c10)._m0[4].z, _531);
                float _539 = fma(_125, (*spvDescriptorSet0.vp_c10)._m0[6].z, _533);
                float _541 = _535 * _535;
                float _543 = fma(_537, _537, _541);
                float _545 = fma(_539, _539, _543);
                float _547 = rsqrt(_545);
                float _549 = _547 * 9.9999999747524270787835121154785e-07;
                float _551 = _537 * _549;
                float _553 = _535 * _549;
                float _555 = _539 * _549;
                _391 = _553;
                _393 = _551;
                _395 = _555;
            }
        }
    }
    _435 = false;
    float _557 = _391;
    float _559 = _393;
    float _561 = _395;
    bool _563 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _565 = !_563;
    float _583;
    if (!_565)
    {
        float _567 = in.m_35.x;
        float _569 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _571 = _567 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _573 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[12].x, _95);
        float _575 = _573 * _569;
        float _577 = floor(_575);
        float _579 = -_577;
        float _581 = _575 + _579;
        _583 = _581;
        _585 = true;
    }
    else
    {
        float _587 = float(_61);
        float _589 = 1.0 / _587;
        float _591 = _95 * _589;
        _583 = _591;
    }
    _585 = false;
    float _593 = _583;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _597 = _593 + _595;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _601 = _593 + _599;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _605 = _593 + _603;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _607;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _615;
    bool _619 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _621 = isnan(_593);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    bool _631 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _633 = 1.0 / _609;
    float _635 = 1.0 / _617;
    float _637 = 1.0 / _613;
    float _639 = _597 * _633;
    bool _641 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _643 = isnan(_593);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = -_629;
    float _655 = _653 + 1.0;
    bool _657 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _659 = isnan(_593);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _665 = _661 || _663;
    float _667 = float(_665);
    float _669 = _651 * _655;
    float _671 = _601 * _635;
    float _673 = -_651;
    float _675 = _673 + 1.0;
    float _677 = _667 * _675;
    float _679 = -_667;
    float _681 = _679 + 1.0;
    float _683 = _605 * _637;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _689 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _691 = isnan(_593);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _701;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _705;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _713 = fma(_703, _639, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _715 = _699 * _681;
    float _717 = fma(_707, _639, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _719 = -_699;
    float _721 = _719 + 1.0;
    float _723 = _713 * _715;
    float _725 = _717 * _715;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _727;
    float _731 = fma(_687, _683, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _733 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[143].x, _723);
    float _735 = fma(_711, _683, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _737;
    float _741 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[143].y, _725);
    float _743 = fma(_729, _671, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _745 = fma(_731, _677, _733);
    float _747 = fma(_739, _671, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _749 = fma(_735, _677, _741);
    float _751 = fma(_743, _669, _745);
    float _753 = fma(_747, _669, _749);
    float _755 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[146].x, _751);
    float _757 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[146].y, _753);
    bool _759 = !_631;
    float _777;
    if (!_759)
    {
        float _761 = in.m_35.x;
        float _763 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _765 = _761 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _767 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[11].y, _95);
        float _769 = _767 * _763;
        float _771 = floor(_769);
        float _773 = -_771;
        float _775 = _769 + _773;
        _777 = _775;
        _779 = true;
    }
    else
    {
        float _781 = float(_61);
        float _783 = 1.0 / _781;
        float _785 = _95 * _783;
        _777 = _785;
    }
    _779 = false;
    float _787 = _777;
    float _789 = as_type<float>(int(gl_VertexIndex));
    float _791 = _387 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _795 = in.m_33.x;
    float _797 = in.m_33.y;
    float _799 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].x, _791);
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _803 = in.m_35.x;
    float _805 = in.m_35.y;
    int _807 = as_type<int>(_789) & 1;
    bool _809 = _807 != 0;
    int _811 = as_type<int>(_789) & 2;
    bool _813 = _811 != 0;
    float _815 = _387 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _817 = _387 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _821 = _819 != 0;
    float _823 = _755 * _795;
    float _825 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].x, _815);
    float _827 = _757 * _797;
    int _829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _831 = _829 != 0;
    float _833 = _803 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _835 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].x, _817);
    float _837 = -_801;
    float _839 = fma(_833, 2.0, _837);
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _847 = _803 > 0.5;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _853 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[78].z, _841);
    float _855 = 1.0 / _845;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _861 = _805 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _863 = _557 * _557;
    bool _865 = _805 > 0.5;
    float _867 = 1.0 / _851;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _873 = fma(_861, -2.0, _869);
    float _875 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[78].w, _871);
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _877;
    float _881 = 1.0 / _859;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _887 = fma(_559, _559, _863);
    float _889 = _879 * _855;
    float _891 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].z, _799);
    bool _893 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _895 = isnan(_787);
    bool _897 = _893 || _895;
    bool _899 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _901 = _897 || _899;
    float _903 = float(_901);
    float _905 = fma(_561, _561, _887);
    bool _907 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _909 = isnan(_787);
    bool _911 = _907 || _909;
    bool _913 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _915 = _911 || _913;
    float _917 = float(_915);
    float _919 = _885 * _867;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _921;
    float _925 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].z, _825);
    float _927 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].z, _835);
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _931 = _787 + _929;
    float _933 = -_903;
    float _935 = _933 + 1.0;
    float _937 = fma(_95, (*spvDescriptorSet0.vp_c9)._m0[76].y, _873);
    bool _939 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _941 = isnan(_787);
    bool _943 = _939 || _941;
    bool _945 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _947 = _943 || _945;
    float _949 = float(_947);
    float _951 = _923 * _881;
    float _953 = -_917;
    float _955 = _953 + 1.0;
    float _957 = rsqrt(_905);
    float _959 = fma(_889, _931, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _961 = _917 * _935;
    bool _963 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _965 = isnan(_787);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _971 = _967 || _969;
    float _973 = float(_971);
    float _975 = _949 * _955;
    float _977 = -_949;
    float _979 = _977 + 1.0;
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _983 = _787 + _981;
    float _985 = -_95;
    float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[76].x, _839);
    float _989 = fma(_95, (*spvDescriptorSet0.vp_c9)._m0[77].z, _853);
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _993 = _787 + _991;
    float _995 = _973 * _979;
    float _997 = fma(_95, (*spvDescriptorSet0.vp_c9)._m0[77].w, _875);
    float _999 = fma(_919, _983, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1001 = fma(_951, _993, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1003 = _959 * _995;
    float _1005 = -_973;
    float _1007 = _1005 + 1.0;
    float _1009 = _957 * _561;
    float _1011 = _957 * _559;
    float _1013 = _957 * _557;
    float _1015 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1003);
    float _1017 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1019 = _1009 * _1017;
    float _1021 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1023 = _1011 * _1021;
    float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1027 = _1013 * _1025;
    float _1029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1031 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1033 = -_1019;
    float _1035 = fma(_1011, _1031, _1033);
    float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1039 = -_1023;
    float _1041 = fma(_1013, _1037, _1039);
    float _1043 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1045 = -_1027;
    float _1047 = fma(_1009, _1043, _1045);
    bool _1049 = !_809;
    float _1051 = _1049 ? (-0.5) : 0.5;
    float _1053 = _1035 * _1035;
    bool _1055 = !_813;
    float _1057 = _1055 ? (-0.5) : 0.5;
    float _1059 = fma(_999, _975, _1015);
    float _1061 = -_1051;
    int _1063 = _847 ? as_type<int>(_1061) : as_type<int>(_1051);
    float _1065 = fma(_1047, _1047, _1053);
    float _1067 = _823 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1069 = fma(_1001, _961, _1059);
    bool _1071 = !_821;
    float _1073 = _1071 ? _1051 : as_type<float>(_1063);
    float _1075 = fma(_1041, _1041, _1065);
    float _1077 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1051);
    float _1079 = -_1057;
    int _1081 = _865 ? as_type<int>(_1079) : as_type<int>(_1057);
    float _1083 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1057);
    float _1085 = _1029 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1087 = _1067 * _1077;
    float _1089 = rsqrt(_1075);
    bool _1091 = !_831;
    float _1093 = _1091 ? _1057 : as_type<float>(_1081);
    float _1095 = _827 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1097 = _793 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1099 = _1073 + 0.5;
    float _1101 = _891 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1103 = _1093 + (-0.5);
    float _1105 = _1095 * _1083;
    float _1107 = fma(_1097, _1099, _987);
    float _1109 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1111 = -_1085;
    float _1113 = -_937;
    float _1115 = fma(_1111, _1103, _1113);
    float _1117 = _1105 * _1009;
    float _1119 = _1105 * _1013;
    float _1121 = _1105 * _1011;
    float _1123 = _925 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1125 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1069);
    float _1127 = _1047 * _1089;
    float _1129 = _1035 * _1089;
    float _1131 = _1041 * _1089;
    float _1133 = _927 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1135 = _1009 * _1127;
    float _1137 = fma(_1087, _1129, _1119);
    float _1139 = fma(_1087, _1131, _1117);
    float _1141 = -_989;
    float _1143 = _1141 + 1.0;
    float _1145 = -_1135;
    float _1147 = fma(_1011, _1131, _1145);
    float _1149 = _1013 * _1131;
    float _1151 = _1011 * _1129;
    float _1153 = fma(_1087, _1127, _1121);
    float _1155 = fma(_1109, _1147, _1137);
    float _1157 = -_1149;
    float _1159 = fma(_1009, _1129, _1157);
    float _1161 = -_1151;
    float _1163 = fma(_1013, _1127, _1161);
    float _1165 = -_997;
    float _1167 = _1165 + 1.0;
    float _1169 = _1101 + _1155;
    float _1171 = fma(_1109, _1159, _1153);
    float _1173 = fma(_1109, _1163, _1139);
    float _1175 = fma(_1093, _1167, _1115);
    float _1177 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1179 = _1123 + _1171;
    float _1181 = _1133 + _1173;
    float _1183 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1185 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1187 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1177);
    float _1189 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1191 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1183);
    float _1193 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1185);
    float _1195 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1187);
    float _1197 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1189);
    float _1199 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1191);
    float _1201 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1193);
    float _1203 = _1195 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1205 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1197);
    float _1207 = _1199 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1209 = _1201 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1211 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1213 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1215 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1217 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1219 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1211);
    float _1221 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1213);
    float _1223 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1215);
    float _1225 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1217);
    float _1227 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1219);
    float _1229 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1221);
    float _1231 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1223);
    float _1233 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1225);
    float _1235 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1237 = _1205 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1241 = -_1143;
    float _1243 = fma(_1073, _1241, _1107);
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1247 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1249 = _1239 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1251 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1253 = _1125 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1255 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1227);
    float _1257 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1229);
    float _1259 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1231);
    float _1261 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1233);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_40.x = _1243;
    out.m_40.y = _1175;
    out.m_42.x = _1247;
    out.m_42.y = _1249;
    out.m_42.z = _1251;
    out.m_42.w = _1253;
    out.gl_Position.x = _1255;
    out.gl_Position.y = _1257;
    out.gl_Position.z = _1259;
    out.gl_Position.w = _1261;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    bool _779 = false;
    bool _585 = false;
    bool _435 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _56 = in.m_26.w;
    float _58 = trunc(_56);
    int _61 = int(_58);
    bool _65 = _61 >= 1;
    float _67 = 0.0;
    if (!_65)
    {
        _67 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _69 = _67;
    float _71 = _69;
    if (!_65)
    {
        out.m_29.x = 0.0;
    }
    int _73 = 0;
    if (!_65)
    {
        float _75 = _69 * 5.0;
        _73 = as_type<int>(_75);
    }
    int _77 = _73;
    int _79 = _77;
    if (!_65)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1318 = as_type<float>(_77);
        out.gl_Position.z = _1318;
    }
    if (!_65)
    {
        return out;
    }
    float _81 = in.m_31.w;
    bool _83 = _81 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _85 = isnan(_81);
    bool _87 = _83 || _85;
    bool _89 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _91 = _87 || _89;
    float _93 = -_81;
    float _95 = _93 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _97 = 0.0;
    float _99 = 0.0;
    if (_91)
    {
        float _101 = float(_61);
        _71 = _101;
    }
    float _103 = _71;
    bool _105 = _95 >= _103;
    bool _107 = !_91;
    bool _109 = _105 || _107;
    float _111 = _103;
    if (_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    if (_109)
    {
        out.m_29.x = 0.0;
    }
    if (_109)
    {
        float _115 = _113 * 5.0;
        _79 = as_type<int>(_115);
    }
    int _117 = _79;
    float _119 = as_type<float>(_117);
    if (_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1389 = as_type<float>(_117);
        out.gl_Position.z = _1389;
    }
    if (_109)
    {
        return out;
    }
    float _121 = in.m_31.x;
    float _123 = in.m_31.y;
    float _125 = in.m_31.z;
    float _127 = _95 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _129 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _131 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _133 = _129 || _131;
    bool _135 = isnan(1.0);
    bool _137 = _133 || _135;
    float _139 = _127;
    if (!_137)
    {
        float _141 = _127 * _127;
        float _143 = _141 * 0.5;
        _119 = _143;
    }
    float _145 = _119;
    float _147 = 0.0;
    float _149 = _145;
    if (!_137)
    {
        float _151 = _95 * _95;
        float _153 = _151 * 0.5;
        _147 = _153;
    }
    float _155 = _147;
    if (!_137)
    {
        float _157 = _145 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _149 = _157;
    }
    float _159 = _149;
    bool _161 = !_137;
    float _163 = _159;
    if (!_161)
    {
        float _165 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _167 = log2(_165);
        float _169 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _171 = _169 + 1.0;
        float _173 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _175 = _127 * _167;
        float _177 = 1.0 / _171;
        float _179 = _173 * 0.693147182464599609375;
        float _181 = exp2(_175);
        float _183 = 1.0 / _179;
        float _185 = _181 + (-1.0);
        float _187 = -_185;
        float _189 = fma(_187, _183, _127);
        float _191 = _189 * _177;
        float _193 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _97 = _183;
        _163 = _193;
        _99 = _181;
    }
    float _195 = _97;
    float _197 = _163;
    float _199 = _99;
    bool _201 = !_137;
    float _203 = _195;
    float _205 = _199;
    if (!_201)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = 1.0 / _213;
        float _217 = _127 * _209;
        float _219 = exp2(_217);
        float _221 = -_219;
        float _223 = _221 + 1.0;
        float _225 = _223 * _215;
        _203 = _219;
        _205 = _213;
        _139 = _225;
    }
    float _227 = _203;
    float _229 = _205;
    float _231 = _139;
    float _233 = _229;
    float _235 = _227;
    if (!_137)
    {
        _233 = _95;
    }
    float _237 = _233;
    float _239 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _241 = _237;
    if (!_137)
    {
        float _243 = _155 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _243;
    }
    float _245 = _235;
    bool _247 = !_137;
    float _249 = _245;
    if (!_247)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = _95 * _253;
        float _263 = 1.0 / _257;
        float _265 = _259 * 0.693147182464599609375;
        float _267 = exp2(_261);
        float _269 = 1.0 / _265;
        float _271 = _267 + (-1.0);
        float _273 = -_271;
        float _275 = fma(_273, _269, _95);
        float _277 = _275 * _263;
        float _279 = _277 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _249 = _279;
    }
    float _281 = _249;
    bool _283 = !_137;
    if (!_283)
    {
        float _285 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = log2(_285);
        float _289 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _291 = _289 + 1.0;
        float _293 = 1.0 / _291;
        float _295 = _95 * _287;
        float _297 = exp2(_295);
        float _299 = -_297;
        float _301 = _299 + 1.0;
        float _303 = _301 * _293;
        _241 = _303;
    }
    float _305 = _241;
    float _307 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _309 = fma(_231, _123, _239);
    float _311 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _313 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _315 = fma(_305, _123, _307);
    float _317 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _319 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _321 = fma(_231, _121, _311);
    float _323 = fma(_305, _121, _313);
    float _325 = -_315;
    float _327 = _309 + _325;
    float _329 = fma(_231, _125, _317);
    float _331 = fma(_305, _125, _319);
    float _333 = -_323;
    float _335 = _321 + _333;
    float _337 = _327 * _327;
    float _339 = in.m_33.w;
    float _341 = -_331;
    float _343 = _329 + _341;
    float _345 = _327 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _347 = fma(_335, _335, _337);
    float _349 = _327 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _351 = _327 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _353 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[4].x, _345);
    float _355 = fma(_343, _343, _347);
    float _357 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[5].x, _349);
    float _359 = in.m_26.x;
    float _361 = in.m_26.y;
    float _363 = in.m_26.z;
    float _365 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[6].x, _351);
    float _367 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].z, _353);
    float _369 = sqrt(_355);
    float _371 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].z, _357);
    float _373 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].z, _365);
    bool _375 = _369 >= 9.9999999747524270787835121154785e-07;
    bool _377 = isnan(_369);
    bool _379 = _375 || _377;
    bool _381 = isnan(9.9999999747524270787835121154785e-07);
    bool _383 = _379 || _381;
    float _385 = fma(_321, _339, _359);
    float _387 = fma(_309, _339, _361);
    float _389 = fma(_329, _339, _363);
    float _391 = _371;
    float _393 = _367;
    float _395 = _373;
    if (!_383)
    {
        bool _397 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _399 = !_397;
        if (!_399)
        {
            float _401 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _403 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _405 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _407 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _401);
            float _409 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _403);
            float _411 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _405);
            float _413 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _407);
            float _415 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _409);
            float _417 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _411);
            float _419 = _413 * _413;
            float _421 = fma(_415, _415, _419);
            float _423 = fma(_417, _417, _421);
            float _425 = rsqrt(_423);
            float _427 = _425 * 9.9999999747524270787835121154785e-07;
            float _429 = _415 * _427;
            float _431 = _413 * _427;
            float _433 = _417 * _427;
            _391 = _431;
            _393 = _429;
            _395 = _433;
            _435 = true;
        }
        else
        {
            float _437 = _123 * _123;
            float _439 = fma(_121, _121, _437);
            float _441 = fma(_125, _125, _439);
            float _443 = sqrt(_441);
            bool _445 = _443 >= 9.9999999747524270787835121154785e-07;
            bool _447 = isnan(_443);
            bool _449 = _445 || _447;
            bool _451 = isnan(9.9999999747524270787835121154785e-07);
            bool _453 = _449 || _451;
            if (!_453)
            {
                float _455 = _361 * _361;
                float _457 = fma(_359, _359, _455);
                float _459 = fma(_363, _363, _457);
                float _461 = sqrt(_459);
                bool _463 = _461 >= 9.9999999747524270787835121154785e-07;
                bool _465 = isnan(_461);
                bool _467 = _463 || _465;
                bool _469 = isnan(9.9999999747524270787835121154785e-07);
                bool _471 = _467 || _469;
                if (!_471)
                {
                    float _473 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _475 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _473);
                    float _477 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _475);
                    float _479 = rsqrt(_477);
                    float _481 = _479 * 9.9999999747524270787835121154785e-07;
                    float _483 = _481 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _485 = _481 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _487 = _481 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _391 = _485;
                    _393 = _483;
                    _395 = _487;
                    _435 = true;
                }
                else
                {
                    float _489 = _361 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _491 = _361 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _493 = _361 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _495 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].x, _489);
                    float _497 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].x, _491);
                    float _499 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].x, _493);
                    float _501 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].z, _495);
                    float _503 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].z, _497);
                    float _505 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].z, _499);
                    float _507 = _501 * _501;
                    float _509 = fma(_503, _503, _507);
                    float _511 = fma(_505, _505, _509);
                    float _513 = rsqrt(_511);
                    float _515 = _513 * 9.9999999747524270787835121154785e-07;
                    float _517 = _503 * _515;
                    float _519 = _501 * _515;
                    float _521 = _505 * _515;
                    _391 = _519;
                    _393 = _517;
                    _395 = _521;
                    _435 = true;
                }
            }
            else
            {
                float _523 = _123 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _525 = _123 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _527 = _123 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _529 = fma(_121, (*spvDescriptorSet0.vp_c10)._m0[5].x, _523);
                float _531 = fma(_121, (*spvDescriptorSet0.vp_c10)._m0[4].x, _525);
                float _533 = fma(_121, (*spvDescriptorSet0.vp_c10)._m0[6].x, _527);
                float _535 = fma(_125, (*spvDescriptorSet0.vp_c10)._m0[5].z, _529);
                float _537 = fma(_125, (*spvDescriptorSet0.vp_c10)._m0[4].z, _531);
                float _539 = fma(_125, (*spvDescriptorSet0.vp_c10)._m0[6].z, _533);
                float _541 = _535 * _535;
                float _543 = fma(_537, _537, _541);
                float _545 = fma(_539, _539, _543);
                float _547 = rsqrt(_545);
                float _549 = _547 * 9.9999999747524270787835121154785e-07;
                float _551 = _537 * _549;
                float _553 = _535 * _549;
                float _555 = _539 * _549;
                _391 = _553;
                _393 = _551;
                _395 = _555;
            }
        }
    }
    _435 = false;
    float _557 = _391;
    float _559 = _393;
    float _561 = _395;
    bool _563 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _565 = !_563;
    float _583;
    if (!_565)
    {
        float _567 = in.m_35.x;
        float _569 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _571 = _567 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _573 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[12].x, _95);
        float _575 = _573 * _569;
        float _577 = floor(_575);
        float _579 = -_577;
        float _581 = _575 + _579;
        _583 = _581;
        _585 = true;
    }
    else
    {
        float _587 = float(_61);
        float _589 = 1.0 / _587;
        float _591 = _95 * _589;
        _583 = _591;
    }
    _585 = false;
    float _593 = _583;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _597 = _593 + _595;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _601 = _593 + _599;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _605 = _593 + _603;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _607;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _615;
    bool _619 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _621 = isnan(_593);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    bool _631 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _633 = 1.0 / _609;
    float _635 = 1.0 / _617;
    float _637 = 1.0 / _613;
    float _639 = _597 * _633;
    bool _641 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _643 = isnan(_593);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = -_629;
    float _655 = _653 + 1.0;
    bool _657 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _659 = isnan(_593);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _665 = _661 || _663;
    float _667 = float(_665);
    float _669 = _651 * _655;
    float _671 = _601 * _635;
    float _673 = -_651;
    float _675 = _673 + 1.0;
    float _677 = _667 * _675;
    float _679 = -_667;
    float _681 = _679 + 1.0;
    float _683 = _605 * _637;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _689 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _691 = isnan(_593);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _701;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _705;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _713 = fma(_703, _639, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _715 = _699 * _681;
    float _717 = fma(_707, _639, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _719 = -_699;
    float _721 = _719 + 1.0;
    float _723 = _713 * _715;
    float _725 = _717 * _715;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _727;
    float _731 = fma(_687, _683, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _733 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[143].x, _723);
    float _735 = fma(_711, _683, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _737;
    float _741 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[143].y, _725);
    float _743 = fma(_729, _671, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _745 = fma(_731, _677, _733);
    float _747 = fma(_739, _671, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _749 = fma(_735, _677, _741);
    float _751 = fma(_743, _669, _745);
    float _753 = fma(_747, _669, _749);
    float _755 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[146].x, _751);
    float _757 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[146].y, _753);
    bool _759 = !_631;
    float _777;
    if (!_759)
    {
        float _761 = in.m_35.x;
        float _763 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _765 = _761 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _767 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[11].y, _95);
        float _769 = _767 * _763;
        float _771 = floor(_769);
        float _773 = -_771;
        float _775 = _769 + _773;
        _777 = _775;
        _779 = true;
    }
    else
    {
        float _781 = float(_61);
        float _783 = 1.0 / _781;
        float _785 = _95 * _783;
        _777 = _785;
    }
    _779 = false;
    float _787 = _777;
    float _789 = as_type<float>(int(gl_VertexIndex));
    float _791 = _387 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _795 = in.m_33.x;
    float _797 = in.m_33.y;
    float _799 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].x, _791);
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _803 = in.m_35.x;
    float _805 = in.m_35.y;
    int _807 = as_type<int>(_789) & 1;
    bool _809 = _807 != 0;
    int _811 = as_type<int>(_789) & 2;
    bool _813 = _811 != 0;
    float _815 = _387 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _817 = _387 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _821 = _819 != 0;
    float _823 = _755 * _795;
    float _825 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].x, _815);
    float _827 = _757 * _797;
    int _829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _831 = _829 != 0;
    float _833 = _803 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _835 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].x, _817);
    float _837 = -_801;
    float _839 = fma(_833, 2.0, _837);
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _847 = _803 > 0.5;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _853 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[78].z, _841);
    float _855 = 1.0 / _845;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _861 = _805 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _863 = _557 * _557;
    bool _865 = _805 > 0.5;
    float _867 = 1.0 / _851;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _873 = fma(_861, -2.0, _869);
    float _875 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[78].w, _871);
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _877;
    float _881 = 1.0 / _859;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _887 = fma(_559, _559, _863);
    float _889 = _879 * _855;
    float _891 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].z, _799);
    bool _893 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _895 = isnan(_787);
    bool _897 = _893 || _895;
    bool _899 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _901 = _897 || _899;
    float _903 = float(_901);
    float _905 = fma(_561, _561, _887);
    bool _907 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _909 = isnan(_787);
    bool _911 = _907 || _909;
    bool _913 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _915 = _911 || _913;
    float _917 = float(_915);
    float _919 = _885 * _867;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _921;
    float _925 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].z, _825);
    float _927 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].z, _835);
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _931 = _787 + _929;
    float _933 = -_903;
    float _935 = _933 + 1.0;
    float _937 = fma(_95, (*spvDescriptorSet0.vp_c9)._m0[76].y, _873);
    bool _939 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _941 = isnan(_787);
    bool _943 = _939 || _941;
    bool _945 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _947 = _943 || _945;
    float _949 = float(_947);
    float _951 = _923 * _881;
    float _953 = -_917;
    float _955 = _953 + 1.0;
    float _957 = rsqrt(_905);
    float _959 = fma(_889, _931, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _961 = _917 * _935;
    bool _963 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _965 = isnan(_787);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _971 = _967 || _969;
    float _973 = float(_971);
    float _975 = _949 * _955;
    float _977 = -_949;
    float _979 = _977 + 1.0;
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _983 = _787 + _981;
    float _985 = -_95;
    float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[76].x, _839);
    float _989 = fma(_95, (*spvDescriptorSet0.vp_c9)._m0[77].z, _853);
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _993 = _787 + _991;
    float _995 = _973 * _979;
    float _997 = fma(_95, (*spvDescriptorSet0.vp_c9)._m0[77].w, _875);
    float _999 = fma(_919, _983, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1001 = fma(_951, _993, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1003 = _959 * _995;
    float _1005 = -_973;
    float _1007 = _1005 + 1.0;
    float _1009 = _957 * _561;
    float _1011 = _957 * _559;
    float _1013 = _957 * _557;
    float _1015 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1003);
    float _1017 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1019 = _1009 * _1017;
    float _1021 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1023 = _1011 * _1021;
    float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1027 = _1013 * _1025;
    float _1029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1031 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1033 = -_1019;
    float _1035 = fma(_1011, _1031, _1033);
    float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1039 = -_1023;
    float _1041 = fma(_1013, _1037, _1039);
    float _1043 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1045 = -_1027;
    float _1047 = fma(_1009, _1043, _1045);
    bool _1049 = !_809;
    float _1051 = _1049 ? (-0.5) : 0.5;
    float _1053 = _1035 * _1035;
    bool _1055 = !_813;
    float _1057 = _1055 ? (-0.5) : 0.5;
    float _1059 = fma(_999, _975, _1015);
    float _1061 = -_1051;
    int _1063 = _847 ? as_type<int>(_1061) : as_type<int>(_1051);
    float _1065 = fma(_1047, _1047, _1053);
    float _1067 = _823 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1069 = fma(_1001, _961, _1059);
    bool _1071 = !_821;
    float _1073 = _1071 ? _1051 : as_type<float>(_1063);
    float _1075 = fma(_1041, _1041, _1065);
    float _1077 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1051);
    float _1079 = -_1057;
    int _1081 = _865 ? as_type<int>(_1079) : as_type<int>(_1057);
    float _1083 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1057);
    float _1085 = _1029 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1087 = _1067 * _1077;
    float _1089 = rsqrt(_1075);
    bool _1091 = !_831;
    float _1093 = _1091 ? _1057 : as_type<float>(_1081);
    float _1095 = _827 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1097 = _793 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1099 = _1073 + 0.5;
    float _1101 = _891 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1103 = _1093 + (-0.5);
    float _1105 = _1095 * _1083;
    float _1107 = fma(_1097, _1099, _987);
    float _1109 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1111 = -_1085;
    float _1113 = -_937;
    float _1115 = fma(_1111, _1103, _1113);
    float _1117 = _1105 * _1009;
    float _1119 = _1105 * _1013;
    float _1121 = _1105 * _1011;
    float _1123 = _925 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1125 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1069);
    float _1127 = _1047 * _1089;
    float _1129 = _1035 * _1089;
    float _1131 = _1041 * _1089;
    float _1133 = _927 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1135 = _1009 * _1127;
    float _1137 = fma(_1087, _1129, _1119);
    float _1139 = fma(_1087, _1131, _1117);
    float _1141 = -_989;
    float _1143 = _1141 + 1.0;
    float _1145 = -_1135;
    float _1147 = fma(_1011, _1131, _1145);
    float _1149 = _1013 * _1131;
    float _1151 = _1011 * _1129;
    float _1153 = fma(_1087, _1127, _1121);
    float _1155 = fma(_1109, _1147, _1137);
    float _1157 = -_1149;
    float _1159 = fma(_1009, _1129, _1157);
    float _1161 = -_1151;
    float _1163 = fma(_1013, _1127, _1161);
    float _1165 = -_997;
    float _1167 = _1165 + 1.0;
    float _1169 = _1101 + _1155;
    float _1171 = fma(_1109, _1159, _1153);
    float _1173 = fma(_1109, _1163, _1139);
    float _1175 = fma(_1093, _1167, _1115);
    float _1177 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1179 = _1123 + _1171;
    float _1181 = _1133 + _1173;
    float _1183 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1185 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1187 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1177);
    float _1189 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1191 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1183);
    float _1193 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1185);
    float _1195 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1187);
    float _1197 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1189);
    float _1199 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1191);
    float _1201 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1193);
    float _1203 = _1195 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1205 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1197);
    float _1207 = _1199 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1209 = _1201 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1211 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1213 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1215 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1217 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1219 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1211);
    float _1221 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1213);
    float _1223 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1215);
    float _1225 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1217);
    float _1227 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1219);
    float _1229 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1221);
    float _1231 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1223);
    float _1233 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1225);
    float _1235 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1237 = _1205 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1241 = -_1143;
    float _1243 = fma(_1073, _1241, _1107);
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1247 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1249 = _1239 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1251 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1253 = _1125 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1255 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1227);
    float _1257 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1229);
    float _1259 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1231);
    float _1261 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1233);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_40.x = _1243;
    out.m_40.y = _1175;
    out.m_42.x = _1247;
    out.m_42.y = _1249;
    out.m_42.z = _1251;
    out.m_42.w = _1253;
    out.gl_Position.x = _1255;
    out.gl_Position.y = _1257;
    out.gl_Position.z = _1259;
    out.gl_Position.w = _1261;
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
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    bool _779 = false;
    bool _585 = false;
    bool _435 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _56 = in.m_26.w;
    float _58 = trunc(_56);
    int _61 = int(_58);
    bool _65 = _61 >= 1;
    float _67 = 0.0;
    if (!_65)
    {
        _67 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _69 = _67;
    float _71 = _69;
    if (!_65)
    {
        out.m_29.x = 0.0;
    }
    int _73 = 0;
    if (!_65)
    {
        float _75 = _69 * 5.0;
        _73 = as_type<int>(_75);
    }
    int _77 = _73;
    int _79 = _77;
    if (!_65)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1318 = as_type<float>(_77);
        out.gl_Position.z = _1318;
    }
    if (!_65)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _81 = in.m_31.w;
    bool _83 = _81 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _85 = isnan(_81);
    bool _87 = _83 || _85;
    bool _89 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _91 = _87 || _89;
    float _93 = -_81;
    float _95 = _93 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _97 = 0.0;
    float _99 = 0.0;
    if (_91)
    {
        float _101 = float(_61);
        _71 = _101;
    }
    float _103 = _71;
    bool _105 = _95 >= _103;
    bool _107 = !_91;
    bool _109 = _105 || _107;
    float _111 = _103;
    if (_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    if (_109)
    {
        out.m_29.x = 0.0;
    }
    if (_109)
    {
        float _115 = _113 * 5.0;
        _79 = as_type<int>(_115);
    }
    int _117 = _79;
    float _119 = as_type<float>(_117);
    if (_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1389 = as_type<float>(_117);
        out.gl_Position.z = _1389;
    }
    if (_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _121 = in.m_31.x;
    float _123 = in.m_31.y;
    float _125 = in.m_31.z;
    float _127 = _95 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _129 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _131 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _133 = _129 || _131;
    bool _135 = isnan(1.0);
    bool _137 = _133 || _135;
    float _139 = _127;
    if (!_137)
    {
        float _141 = _127 * _127;
        float _143 = _141 * 0.5;
        _119 = _143;
    }
    float _145 = _119;
    float _147 = 0.0;
    float _149 = _145;
    if (!_137)
    {
        float _151 = _95 * _95;
        float _153 = _151 * 0.5;
        _147 = _153;
    }
    float _155 = _147;
    if (!_137)
    {
        float _157 = _145 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _149 = _157;
    }
    float _159 = _149;
    bool _161 = !_137;
    float _163 = _159;
    if (!_161)
    {
        float _165 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _167 = log2(_165);
        float _169 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _171 = _169 + 1.0;
        float _173 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _175 = _127 * _167;
        float _177 = 1.0 / _171;
        float _179 = _173 * 0.693147182464599609375;
        float _181 = exp2(_175);
        float _183 = 1.0 / _179;
        float _185 = _181 + (-1.0);
        float _187 = -_185;
        float _189 = fma(_187, _183, _127);
        float _191 = _189 * _177;
        float _193 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _97 = _183;
        _163 = _193;
        _99 = _181;
    }
    float _195 = _97;
    float _197 = _163;
    float _199 = _99;
    bool _201 = !_137;
    float _203 = _195;
    float _205 = _199;
    if (!_201)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = 1.0 / _213;
        float _217 = _127 * _209;
        float _219 = exp2(_217);
        float _221 = -_219;
        float _223 = _221 + 1.0;
        float _225 = _223 * _215;
        _203 = _219;
        _205 = _213;
        _139 = _225;
    }
    float _227 = _203;
    float _229 = _205;
    float _231 = _139;
    float _233 = _229;
    float _235 = _227;
    if (!_137)
    {
        _233 = _95;
    }
    float _237 = _233;
    float _239 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _241 = _237;
    if (!_137)
    {
        float _243 = _155 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _243;
    }
    float _245 = _235;
    bool _247 = !_137;
    float _249 = _245;
    if (!_247)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = _95 * _253;
        float _263 = 1.0 / _257;
        float _265 = _259 * 0.693147182464599609375;
        float _267 = exp2(_261);
        float _269 = 1.0 / _265;
        float _271 = _267 + (-1.0);
        float _273 = -_271;
        float _275 = fma(_273, _269, _95);
        float _277 = _275 * _263;
        float _279 = _277 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _249 = _279;
    }
    float _281 = _249;
    bool _283 = !_137;
    if (!_283)
    {
        float _285 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = log2(_285);
        float _289 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _291 = _289 + 1.0;
        float _293 = 1.0 / _291;
        float _295 = _95 * _287;
        float _297 = exp2(_295);
        float _299 = -_297;
        float _301 = _299 + 1.0;
        float _303 = _301 * _293;
        _241 = _303;
    }
    float _305 = _241;
    float _307 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _309 = fma(_231, _123, _239);
    float _311 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _313 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _315 = fma(_305, _123, _307);
    float _317 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _319 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _321 = fma(_231, _121, _311);
    float _323 = fma(_305, _121, _313);
    float _325 = -_315;
    float _327 = _309 + _325;
    float _329 = fma(_231, _125, _317);
    float _331 = fma(_305, _125, _319);
    float _333 = -_323;
    float _335 = _321 + _333;
    float _337 = _327 * _327;
    float _339 = in.m_33.w;
    float _341 = -_331;
    float _343 = _329 + _341;
    float _345 = _327 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _347 = fma(_335, _335, _337);
    float _349 = _327 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _351 = _327 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _353 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[4].x, _345);
    float _355 = fma(_343, _343, _347);
    float _357 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[5].x, _349);
    float _359 = in.m_26.x;
    float _361 = in.m_26.y;
    float _363 = in.m_26.z;
    float _365 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[6].x, _351);
    float _367 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].z, _353);
    float _369 = sqrt(_355);
    float _371 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].z, _357);
    float _373 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].z, _365);
    bool _375 = _369 >= 9.9999999747524270787835121154785e-07;
    bool _377 = isnan(_369);
    bool _379 = _375 || _377;
    bool _381 = isnan(9.9999999747524270787835121154785e-07);
    bool _383 = _379 || _381;
    float _385 = fma(_321, _339, _359);
    float _387 = fma(_309, _339, _361);
    float _389 = fma(_329, _339, _363);
    float _391 = _371;
    float _393 = _367;
    float _395 = _373;
    if (!_383)
    {
        bool _397 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _399 = !_397;
        if (!_399)
        {
            float _401 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _403 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _405 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _407 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _401);
            float _409 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _403);
            float _411 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _405);
            float _413 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _407);
            float _415 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _409);
            float _417 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _411);
            float _419 = _413 * _413;
            float _421 = fma(_415, _415, _419);
            float _423 = fma(_417, _417, _421);
            float _425 = rsqrt(_423);
            float _427 = _425 * 9.9999999747524270787835121154785e-07;
            float _429 = _415 * _427;
            float _431 = _413 * _427;
            float _433 = _417 * _427;
            _391 = _431;
            _393 = _429;
            _395 = _433;
            _435 = true;
        }
        else
        {
            float _437 = _123 * _123;
            float _439 = fma(_121, _121, _437);
            float _441 = fma(_125, _125, _439);
            float _443 = sqrt(_441);
            bool _445 = _443 >= 9.9999999747524270787835121154785e-07;
            bool _447 = isnan(_443);
            bool _449 = _445 || _447;
            bool _451 = isnan(9.9999999747524270787835121154785e-07);
            bool _453 = _449 || _451;
            if (!_453)
            {
                float _455 = _361 * _361;
                float _457 = fma(_359, _359, _455);
                float _459 = fma(_363, _363, _457);
                float _461 = sqrt(_459);
                bool _463 = _461 >= 9.9999999747524270787835121154785e-07;
                bool _465 = isnan(_461);
                bool _467 = _463 || _465;
                bool _469 = isnan(9.9999999747524270787835121154785e-07);
                bool _471 = _467 || _469;
                if (!_471)
                {
                    float _473 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _475 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _473);
                    float _477 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _475);
                    float _479 = rsqrt(_477);
                    float _481 = _479 * 9.9999999747524270787835121154785e-07;
                    float _483 = _481 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _485 = _481 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _487 = _481 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _391 = _485;
                    _393 = _483;
                    _395 = _487;
                    _435 = true;
                }
                else
                {
                    float _489 = _361 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _491 = _361 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _493 = _361 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _495 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].x, _489);
                    float _497 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].x, _491);
                    float _499 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].x, _493);
                    float _501 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].z, _495);
                    float _503 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].z, _497);
                    float _505 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].z, _499);
                    float _507 = _501 * _501;
                    float _509 = fma(_503, _503, _507);
                    float _511 = fma(_505, _505, _509);
                    float _513 = rsqrt(_511);
                    float _515 = _513 * 9.9999999747524270787835121154785e-07;
                    float _517 = _503 * _515;
                    float _519 = _501 * _515;
                    float _521 = _505 * _515;
                    _391 = _519;
                    _393 = _517;
                    _395 = _521;
                    _435 = true;
                }
            }
            else
            {
                float _523 = _123 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _525 = _123 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _527 = _123 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _529 = fma(_121, (*spvDescriptorSet0.vp_c10)._m0[5].x, _523);
                float _531 = fma(_121, (*spvDescriptorSet0.vp_c10)._m0[4].x, _525);
                float _533 = fma(_121, (*spvDescriptorSet0.vp_c10)._m0[6].x, _527);
                float _535 = fma(_125, (*spvDescriptorSet0.vp_c10)._m0[5].z, _529);
                float _537 = fma(_125, (*spvDescriptorSet0.vp_c10)._m0[4].z, _531);
                float _539 = fma(_125, (*spvDescriptorSet0.vp_c10)._m0[6].z, _533);
                float _541 = _535 * _535;
                float _543 = fma(_537, _537, _541);
                float _545 = fma(_539, _539, _543);
                float _547 = rsqrt(_545);
                float _549 = _547 * 9.9999999747524270787835121154785e-07;
                float _551 = _537 * _549;
                float _553 = _535 * _549;
                float _555 = _539 * _549;
                _391 = _553;
                _393 = _551;
                _395 = _555;
            }
        }
    }
    _435 = false;
    float _557 = _391;
    float _559 = _393;
    float _561 = _395;
    bool _563 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _565 = !_563;
    float _583;
    if (!_565)
    {
        float _567 = in.m_35.x;
        float _569 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _571 = _567 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _573 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[12].x, _95);
        float _575 = _573 * _569;
        float _577 = floor(_575);
        float _579 = -_577;
        float _581 = _575 + _579;
        _583 = _581;
        _585 = true;
    }
    else
    {
        float _587 = float(_61);
        float _589 = 1.0 / _587;
        float _591 = _95 * _589;
        _583 = _591;
    }
    _585 = false;
    float _593 = _583;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _597 = _593 + _595;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _601 = _593 + _599;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _605 = _593 + _603;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _607;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _615;
    bool _619 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _621 = isnan(_593);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    bool _631 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _633 = 1.0 / _609;
    float _635 = 1.0 / _617;
    float _637 = 1.0 / _613;
    float _639 = _597 * _633;
    bool _641 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _643 = isnan(_593);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = -_629;
    float _655 = _653 + 1.0;
    bool _657 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _659 = isnan(_593);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _665 = _661 || _663;
    float _667 = float(_665);
    float _669 = _651 * _655;
    float _671 = _601 * _635;
    float _673 = -_651;
    float _675 = _673 + 1.0;
    float _677 = _667 * _675;
    float _679 = -_667;
    float _681 = _679 + 1.0;
    float _683 = _605 * _637;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _689 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _691 = isnan(_593);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _701;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _705;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _713 = fma(_703, _639, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _715 = _699 * _681;
    float _717 = fma(_707, _639, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _719 = -_699;
    float _721 = _719 + 1.0;
    float _723 = _713 * _715;
    float _725 = _717 * _715;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _727;
    float _731 = fma(_687, _683, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _733 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[143].x, _723);
    float _735 = fma(_711, _683, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _737;
    float _741 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[143].y, _725);
    float _743 = fma(_729, _671, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _745 = fma(_731, _677, _733);
    float _747 = fma(_739, _671, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _749 = fma(_735, _677, _741);
    float _751 = fma(_743, _669, _745);
    float _753 = fma(_747, _669, _749);
    float _755 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[146].x, _751);
    float _757 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[146].y, _753);
    bool _759 = !_631;
    float _777;
    if (!_759)
    {
        float _761 = in.m_35.x;
        float _763 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _765 = _761 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _767 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[11].y, _95);
        float _769 = _767 * _763;
        float _771 = floor(_769);
        float _773 = -_771;
        float _775 = _769 + _773;
        _777 = _775;
        _779 = true;
    }
    else
    {
        float _781 = float(_61);
        float _783 = 1.0 / _781;
        float _785 = _95 * _783;
        _777 = _785;
    }
    _779 = false;
    float _787 = _777;
    float _789 = as_type<float>(int(gl_VertexIndex));
    float _791 = _387 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _795 = in.m_33.x;
    float _797 = in.m_33.y;
    float _799 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].x, _791);
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _803 = in.m_35.x;
    float _805 = in.m_35.y;
    int _807 = as_type<int>(_789) & 1;
    bool _809 = _807 != 0;
    int _811 = as_type<int>(_789) & 2;
    bool _813 = _811 != 0;
    float _815 = _387 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _817 = _387 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _821 = _819 != 0;
    float _823 = _755 * _795;
    float _825 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].x, _815);
    float _827 = _757 * _797;
    int _829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _831 = _829 != 0;
    float _833 = _803 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _835 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].x, _817);
    float _837 = -_801;
    float _839 = fma(_833, 2.0, _837);
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _847 = _803 > 0.5;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _853 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[78].z, _841);
    float _855 = 1.0 / _845;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _861 = _805 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _863 = _557 * _557;
    bool _865 = _805 > 0.5;
    float _867 = 1.0 / _851;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _873 = fma(_861, -2.0, _869);
    float _875 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[78].w, _871);
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _877;
    float _881 = 1.0 / _859;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _887 = fma(_559, _559, _863);
    float _889 = _879 * _855;
    float _891 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].z, _799);
    bool _893 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _895 = isnan(_787);
    bool _897 = _893 || _895;
    bool _899 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _901 = _897 || _899;
    float _903 = float(_901);
    float _905 = fma(_561, _561, _887);
    bool _907 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _909 = isnan(_787);
    bool _911 = _907 || _909;
    bool _913 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _915 = _911 || _913;
    float _917 = float(_915);
    float _919 = _885 * _867;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _921;
    float _925 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].z, _825);
    float _927 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].z, _835);
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _931 = _787 + _929;
    float _933 = -_903;
    float _935 = _933 + 1.0;
    float _937 = fma(_95, (*spvDescriptorSet0.vp_c9)._m0[76].y, _873);
    bool _939 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _941 = isnan(_787);
    bool _943 = _939 || _941;
    bool _945 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _947 = _943 || _945;
    float _949 = float(_947);
    float _951 = _923 * _881;
    float _953 = -_917;
    float _955 = _953 + 1.0;
    float _957 = rsqrt(_905);
    float _959 = fma(_889, _931, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _961 = _917 * _935;
    bool _963 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _965 = isnan(_787);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _971 = _967 || _969;
    float _973 = float(_971);
    float _975 = _949 * _955;
    float _977 = -_949;
    float _979 = _977 + 1.0;
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _983 = _787 + _981;
    float _985 = -_95;
    float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[76].x, _839);
    float _989 = fma(_95, (*spvDescriptorSet0.vp_c9)._m0[77].z, _853);
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _993 = _787 + _991;
    float _995 = _973 * _979;
    float _997 = fma(_95, (*spvDescriptorSet0.vp_c9)._m0[77].w, _875);
    float _999 = fma(_919, _983, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1001 = fma(_951, _993, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1003 = _959 * _995;
    float _1005 = -_973;
    float _1007 = _1005 + 1.0;
    float _1009 = _957 * _561;
    float _1011 = _957 * _559;
    float _1013 = _957 * _557;
    float _1015 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1003);
    float _1017 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1019 = _1009 * _1017;
    float _1021 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1023 = _1011 * _1021;
    float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1027 = _1013 * _1025;
    float _1029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1031 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1033 = -_1019;
    float _1035 = fma(_1011, _1031, _1033);
    float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1039 = -_1023;
    float _1041 = fma(_1013, _1037, _1039);
    float _1043 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1045 = -_1027;
    float _1047 = fma(_1009, _1043, _1045);
    bool _1049 = !_809;
    float _1051 = _1049 ? (-0.5) : 0.5;
    float _1053 = _1035 * _1035;
    bool _1055 = !_813;
    float _1057 = _1055 ? (-0.5) : 0.5;
    float _1059 = fma(_999, _975, _1015);
    float _1061 = -_1051;
    int _1063 = _847 ? as_type<int>(_1061) : as_type<int>(_1051);
    float _1065 = fma(_1047, _1047, _1053);
    float _1067 = _823 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1069 = fma(_1001, _961, _1059);
    bool _1071 = !_821;
    float _1073 = _1071 ? _1051 : as_type<float>(_1063);
    float _1075 = fma(_1041, _1041, _1065);
    float _1077 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1051);
    float _1079 = -_1057;
    int _1081 = _865 ? as_type<int>(_1079) : as_type<int>(_1057);
    float _1083 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1057);
    float _1085 = _1029 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1087 = _1067 * _1077;
    float _1089 = rsqrt(_1075);
    bool _1091 = !_831;
    float _1093 = _1091 ? _1057 : as_type<float>(_1081);
    float _1095 = _827 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1097 = _793 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1099 = _1073 + 0.5;
    float _1101 = _891 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1103 = _1093 + (-0.5);
    float _1105 = _1095 * _1083;
    float _1107 = fma(_1097, _1099, _987);
    float _1109 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1111 = -_1085;
    float _1113 = -_937;
    float _1115 = fma(_1111, _1103, _1113);
    float _1117 = _1105 * _1009;
    float _1119 = _1105 * _1013;
    float _1121 = _1105 * _1011;
    float _1123 = _925 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1125 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1069);
    float _1127 = _1047 * _1089;
    float _1129 = _1035 * _1089;
    float _1131 = _1041 * _1089;
    float _1133 = _927 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1135 = _1009 * _1127;
    float _1137 = fma(_1087, _1129, _1119);
    float _1139 = fma(_1087, _1131, _1117);
    float _1141 = -_989;
    float _1143 = _1141 + 1.0;
    float _1145 = -_1135;
    float _1147 = fma(_1011, _1131, _1145);
    float _1149 = _1013 * _1131;
    float _1151 = _1011 * _1129;
    float _1153 = fma(_1087, _1127, _1121);
    float _1155 = fma(_1109, _1147, _1137);
    float _1157 = -_1149;
    float _1159 = fma(_1009, _1129, _1157);
    float _1161 = -_1151;
    float _1163 = fma(_1013, _1127, _1161);
    float _1165 = -_997;
    float _1167 = _1165 + 1.0;
    float _1169 = _1101 + _1155;
    float _1171 = fma(_1109, _1159, _1153);
    float _1173 = fma(_1109, _1163, _1139);
    float _1175 = fma(_1093, _1167, _1115);
    float _1177 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1179 = _1123 + _1171;
    float _1181 = _1133 + _1173;
    float _1183 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1185 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1187 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1177);
    float _1189 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1191 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1183);
    float _1193 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1185);
    float _1195 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1187);
    float _1197 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1189);
    float _1199 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1191);
    float _1201 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1193);
    float _1203 = _1195 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1205 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1197);
    float _1207 = _1199 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1209 = _1201 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1211 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1213 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1215 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1217 = _1203 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1219 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1211);
    float _1221 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1213);
    float _1223 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1215);
    float _1225 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1217);
    float _1227 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1219);
    float _1229 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1221);
    float _1231 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1223);
    float _1233 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1225);
    float _1235 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1237 = _1205 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1241 = -_1143;
    float _1243 = fma(_1073, _1241, _1107);
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1247 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1249 = _1239 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1251 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1253 = _1125 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1255 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1227);
    float _1257 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1229);
    float _1259 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1231);
    float _1261 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1233);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_40.x = _1243;
    out.m_40.y = _1175;
    out.m_42.x = _1247;
    out.m_42.y = _1249;
    out.m_42.z = _1251;
    out.m_42.w = _1253;
    out.gl_Position.x = _1255;
    out.gl_Position.y = _1257;
    out.gl_Position.z = _1259;
    out.gl_Position.w = _1261;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

