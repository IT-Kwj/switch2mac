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
    float4 m_48 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
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
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _695 = false;
    bool _593 = false;
    bool _443 = false;
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
        float _1324 = as_type<float>(_85);
        out.gl_Position.z = _1324;
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
    float _105 = 0.0;
    float _107 = 0.0;
    if (_99)
    {
        float _109 = float(_69);
        _79 = _109;
    }
    float _111 = _79;
    bool _113 = _103 >= _111;
    bool _115 = !_99;
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
    if (_117)
    {
        float _123 = _121 * 5.0;
        _87 = as_type<int>(_123);
    }
    int _125 = _87;
    float _127 = as_type<float>(_125);
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1395 = as_type<float>(_125);
        out.gl_Position.z = _1395;
    }
    if (_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_35.x;
    float _131 = in.m_35.y;
    float _133 = in.m_35.z;
    float _135 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = _135;
    if (!_145)
    {
        float _149 = _135 * _135;
        float _151 = _149 * 0.5;
        _127 = _151;
    }
    float _153 = _127;
    float _155 = 0.0;
    float _157 = _153;
    if (!_145)
    {
        float _159 = _103 * _103;
        float _161 = _159 * 0.5;
        _155 = _161;
    }
    float _163 = _155;
    if (!_145)
    {
        float _165 = _153 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _157 = _165;
    }
    float _167 = _157;
    bool _169 = !_145;
    float _171 = _167;
    if (!_169)
    {
        float _173 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _175 = log2(_173);
        float _177 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _179 = _177 + 1.0;
        float _181 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _183 = _135 * _175;
        float _185 = 1.0 / _179;
        float _187 = _181 * 0.693147182464599609375;
        float _189 = exp2(_183);
        float _191 = 1.0 / _187;
        float _193 = _189 + (-1.0);
        float _195 = -_193;
        float _197 = fma(_195, _191, _135);
        float _199 = _197 * _185;
        float _201 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _105 = _191;
        _171 = _201;
        _107 = _189;
    }
    float _203 = _105;
    float _205 = _171;
    float _207 = _107;
    bool _209 = !_145;
    float _211 = _203;
    float _213 = _207;
    if (!_209)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = 1.0 / _221;
        float _225 = _135 * _217;
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
    if (!_145)
    {
        _241 = _103;
    }
    float _245 = _241;
    float _247 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _245;
    if (!_145)
    {
        float _251 = _163 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _243 = _251;
    }
    float _253 = _243;
    bool _255 = !_145;
    float _257 = _253;
    if (!_255)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _269 = _103 * _261;
        float _271 = 1.0 / _265;
        float _273 = _267 * 0.693147182464599609375;
        float _275 = exp2(_269);
        float _277 = 1.0 / _273;
        float _279 = _275 + (-1.0);
        float _281 = -_279;
        float _283 = fma(_281, _277, _103);
        float _285 = _283 * _271;
        float _287 = _285 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _257 = _287;
    }
    float _289 = _257;
    bool _291 = !_145;
    if (!_291)
    {
        float _293 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = log2(_293);
        float _297 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _299 = _297 + 1.0;
        float _301 = 1.0 / _299;
        float _303 = _103 * _295;
        float _305 = exp2(_303);
        float _307 = -_305;
        float _309 = _307 + 1.0;
        float _311 = _309 * _301;
        _249 = _311;
    }
    float _313 = _249;
    float _315 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _317 = fma(_239, _131, _247);
    float _319 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _321 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _323 = fma(_313, _131, _315);
    float _325 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _327 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _329 = fma(_239, _129, _319);
    float _331 = fma(_313, _129, _321);
    float _333 = -_323;
    float _335 = _317 + _333;
    float _337 = fma(_239, _133, _325);
    float _339 = fma(_313, _133, _327);
    float _341 = -_331;
    float _343 = _329 + _341;
    float _345 = _335 * _335;
    float _347 = in.m_37.w;
    float _349 = -_339;
    float _351 = _337 + _349;
    float _353 = _335 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _355 = fma(_343, _343, _345);
    float _357 = _335 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _359 = _335 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _361 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].x, _353);
    float _363 = fma(_351, _351, _355);
    float _365 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].x, _357);
    float _367 = in.m_30.x;
    float _369 = in.m_30.y;
    float _371 = in.m_30.z;
    float _373 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].x, _359);
    float _375 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[4].z, _361);
    float _377 = sqrt(_363);
    float _379 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[6].z, _373);
    bool _381 = _377 >= 9.9999999747524270787835121154785e-07;
    bool _383 = isnan(_377);
    bool _385 = _381 || _383;
    bool _387 = isnan(9.9999999747524270787835121154785e-07);
    bool _389 = _385 || _387;
    float _391 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[5].z, _365);
    float _393 = fma(_329, _347, _367);
    float _395 = fma(_317, _347, _369);
    float _397 = fma(_337, _347, _371);
    float _399 = _391;
    float _401 = _375;
    float _403 = _379;
    if (!_389)
    {
        bool _405 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _407 = !_405;
        if (!_407)
        {
            float _409 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _411 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _413 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _415 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _409);
            float _417 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _411);
            float _419 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _413);
            float _421 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _415);
            float _423 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _417);
            float _425 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _419);
            float _427 = _421 * _421;
            float _429 = fma(_423, _423, _427);
            float _431 = fma(_425, _425, _429);
            float _433 = rsqrt(_431);
            float _435 = _433 * 9.9999999747524270787835121154785e-07;
            float _437 = _423 * _435;
            float _439 = _421 * _435;
            float _441 = _425 * _435;
            _399 = _439;
            _401 = _437;
            _403 = _441;
            _443 = true;
        }
        else
        {
            float _445 = _131 * _131;
            float _447 = fma(_129, _129, _445);
            float _449 = fma(_133, _133, _447);
            float _451 = sqrt(_449);
            bool _453 = _451 >= 9.9999999747524270787835121154785e-07;
            bool _455 = isnan(_451);
            bool _457 = _453 || _455;
            bool _459 = isnan(9.9999999747524270787835121154785e-07);
            bool _461 = _457 || _459;
            if (!_461)
            {
                float _463 = _369 * _369;
                float _465 = fma(_367, _367, _463);
                float _467 = fma(_371, _371, _465);
                float _469 = sqrt(_467);
                bool _471 = _469 >= 9.9999999747524270787835121154785e-07;
                bool _473 = isnan(_469);
                bool _475 = _471 || _473;
                bool _477 = isnan(9.9999999747524270787835121154785e-07);
                bool _479 = _475 || _477;
                if (!_479)
                {
                    float _481 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _483 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _481);
                    float _485 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _483);
                    float _487 = rsqrt(_485);
                    float _489 = _487 * 9.9999999747524270787835121154785e-07;
                    float _491 = _489 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _493 = _489 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _495 = _489 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _399 = _493;
                    _401 = _491;
                    _403 = _495;
                    _443 = true;
                }
                else
                {
                    float _497 = _369 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _499 = _369 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _501 = _369 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _503 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[5].x, _497);
                    float _505 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[4].x, _499);
                    float _507 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[6].x, _501);
                    float _509 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].z, _503);
                    float _511 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].z, _505);
                    float _513 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].z, _507);
                    float _515 = _509 * _509;
                    float _517 = fma(_511, _511, _515);
                    float _519 = fma(_513, _513, _517);
                    float _521 = rsqrt(_519);
                    float _523 = _521 * 9.9999999747524270787835121154785e-07;
                    float _525 = _511 * _523;
                    float _527 = _509 * _523;
                    float _529 = _513 * _523;
                    _399 = _527;
                    _401 = _525;
                    _403 = _529;
                    _443 = true;
                }
            }
            else
            {
                float _531 = _131 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _533 = _131 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _535 = _131 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _537 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[5].x, _531);
                float _539 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[4].x, _533);
                float _541 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[6].x, _535);
                float _543 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[5].z, _537);
                float _545 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[4].z, _539);
                float _547 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[6].z, _541);
                float _549 = _543 * _543;
                float _551 = fma(_545, _545, _549);
                float _553 = fma(_547, _547, _551);
                float _555 = rsqrt(_553);
                float _557 = _555 * 9.9999999747524270787835121154785e-07;
                float _559 = _545 * _557;
                float _561 = _543 * _557;
                float _563 = _547 * _557;
                _399 = _561;
                _401 = _559;
                _403 = _563;
            }
        }
    }
    _443 = false;
    float _565 = _399;
    float _567 = _401;
    float _569 = _403;
    bool _571 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _573 = !_571;
    float _591;
    if (!_573)
    {
        float _575 = in.m_39.x;
        float _577 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _579 = _575 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _581 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _583 = _581 * _577;
        float _585 = floor(_583);
        float _587 = -_585;
        float _589 = _583 + _587;
        _591 = _589;
        _593 = true;
    }
    else
    {
        float _595 = float(_69);
        float _597 = 1.0 / _595;
        float _599 = _103 * _597;
        _591 = _599;
    }
    _593 = false;
    float _601 = _591;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _605 = _601 + _603;
    bool _607 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _609 = isnan(_601);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _615 = _611 || _613;
    float _617 = float(_615);
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _619;
    float _623 = -_617;
    float _625 = _623 + 1.0;
    bool _627 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _629 = isnan(_601);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _639;
    bool _643 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _645 = 1.0 / _621;
    float _647 = _637 * _625;
    float _649 = -_637;
    float _651 = _649 + 1.0;
    float _653 = _605 * _645;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _655;
    float _659 = fma(_641, _653, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _661 = fma(_657, _653, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _663 = _659 * _647;
    float _665 = _661 * _647;
    float _667 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[143].x, _663);
    float _669 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[143].y, _665);
    float _671 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[144].x, _667);
    float _673 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[144].y, _669);
    bool _675 = !_643;
    float _693;
    if (!_675)
    {
        float _677 = in.m_39.x;
        float _679 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _681 = _677 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _685 = _683 * _679;
        float _687 = floor(_685);
        float _689 = -_687;
        float _691 = _685 + _689;
        _693 = _691;
        _695 = true;
    }
    else
    {
        float _697 = float(_69);
        float _699 = 1.0 / _697;
        float _701 = _103 * _699;
        _693 = _701;
    }
    _695 = false;
    float _703 = _693;
    float _705 = _565 * _565;
    float _707 = as_type<float>(int(gl_VertexIndex));
    float _709 = fma(_567, _567, _705);
    float _711 = in.m_39.x;
    float _713 = in.m_39.y;
    float _715 = in.m_39.z;
    float _717 = in.m_39.w;
    float _719 = fma(_569, _569, _709);
    float _721 = in.m_37.x;
    float _723 = in.m_37.y;
    float _725 = rsqrt(_719);
    int _727 = as_type<int>(_707) & 1;
    bool _729 = _727 != 0;
    int _731 = as_type<int>(_707) & 2;
    bool _733 = _731 != 0;
    int _735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _737 = _735 != 0;
    float _739 = _725 * _569;
    float _741 = _725 * _565;
    float _743 = _725 * _567;
    float _745 = _395 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _747 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _749 = _739 * _747;
    bool _751 = _711 > 0.5;
    float _753 = _395 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _755 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _757 = _741 * _755;
    float _759 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _761 = -_749;
    float _763 = fma(_743, _759, _761);
    float _765 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].x, _745);
    float _767 = _395 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _769 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].x, _753);
    float _771 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _773 = -_757;
    float _775 = fma(_739, _771, _773);
    float _777 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _779 = _743 * _777;
    float _781 = _763 * _763;
    float _783 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].x, _767);
    bool _785 = !_729;
    float _787 = _785 ? (-0.5) : 0.5;
    float _789 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _791 = -_779;
    float _793 = fma(_741, _789, _791);
    float _795 = fma(_775, _775, _781);
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _799 = _797 != 0;
    float _801 = _671 * _721;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _805 = _803 != 0;
    float _807 = fma(_793, _793, _795);
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _811 = _809 != 0;
    float _813 = _673 * _723;
    float _815 = -_787;
    int _817 = _751 ? as_type<int>(_815) : as_type<int>(_787);
    float _819 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[4].z, _769);
    bool _821 = _717 > 0.5;
    float _823 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[5].z, _765);
    bool _825 = _713 > 0.5;
    float _827 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[6].z, _783);
    float _829 = rsqrt(_807);
    float _831 = _801 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _833 = _813 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _839 = !_733;
    float _841 = _839 ? (-0.5) : 0.5;
    float _843 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _787);
    bool _845 = _715 > 0.5;
    float _847 = 1.0 / _837;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _853 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _841);
    float _855 = _831 * _843;
    float _857 = _833 * _853;
    float _859 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _861 = 1.0 / _851;
    float _863 = _763 * _829;
    float _865 = _793 * _829;
    float _867 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _869 = _775 * _829;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _871;
    float _875 = _857 * _743;
    float _877 = _741 * _865;
    float _879 = _857 * _739;
    float _881 = _743 * _863;
    out.m_33.x = _867;
    float _883 = fma(_855, _869, _875);
    float _885 = fma(_855, _865, _879);
    float _887 = -_881;
    float _889 = fma(_741, _869, _887);
    float _891 = _873 * _847;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _897 = _827 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _899 = fma(_859, _889, _885);
    float _901 = -_877;
    float _903 = fma(_739, _863, _901);
    float _905 = _819 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _907 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _909 = isnan(_703);
    bool _911 = _907 || _909;
    bool _913 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _915 = _911 || _913;
    float _917 = float(_915);
    float _919 = _897 + _899;
    float _921 = fma(_859, _903, _883);
    float _923 = _895 * _861;
    float _925 = -_917;
    float _927 = _925 + 1.0;
    float _929 = _905 + _921;
    bool _931 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _933 = isnan(_703);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _939 = _935 || _937;
    float _941 = float(_939);
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _945 = _703 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _951 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _953 = _919 + _951;
    float _955 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _957 = _929 + _955;
    float _959 = _941 * _927;
    float _961 = -_941;
    float _963 = _961 + 1.0;
    float _965 = _953 * _953;
    bool _967 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _969 = isnan(_703);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _975 = _971 || _973;
    float _977 = float(_975);
    float _979 = 1.0 / _949;
    bool _981 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _983 = isnan(_703);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    float _993 = fma(_957, _957, _965);
    float _995 = fma(_891, _945, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _997 = _977 * _963;
    float _999 = -_977;
    float _1001 = _999 + 1.0;
    float _1003 = _857 * _741;
    float _1005 = _739 * _869;
    float _1007 = sqrt(_993);
    float _1009 = _991 * _1001;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1013 = _703 + _1011;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1015;
    float _1019 = -_991;
    float _1021 = _1019 + 1.0;
    float _1023 = _995 * _1009;
    float _1025 = -_787;
    int _1027 = _845 ? as_type<int>(_1025) : as_type<int>(_787);
    float _1029 = fma(_855, _863, _1003);
    float _1031 = -_1005;
    float _1033 = fma(_743, _865, _1031);
    float _1035 = _1017 * _979;
    float _1037 = fma(_923, _1013, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1041 = _703 + _1039;
    float _1043 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1023);
    float _1045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1047 = fma(_859, _1033, _1029);
    float _1049 = _823 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1051 = _1007 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1053 = fma(_1035, _1041, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1055 = fma(_1037, _997, _1043);
    bool _1057 = !_737;
    float _1059 = _1057 ? _787 : as_type<float>(_817);
    float _1061 = _1049 + _1047;
    bool _1063 = !_805;
    float _1065 = _1063 ? _787 : as_type<float>(_1027);
    float _1067 = fma(_1053, _959, _1055);
    float _1069 = -_841;
    int _1071 = _825 ? as_type<int>(_1069) : as_type<int>(_841);
    float _1073 = -_841;
    int _1075 = _821 ? as_type<int>(_1073) : as_type<int>(_841);
    float _1077 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1067);
    bool _1079 = !_799;
    float _1081 = _1079 ? _841 : as_type<float>(_1071);
    bool _1083 = !_811;
    float _1085 = _1083 ? _841 : as_type<float>(_1075);
    float _1087 = _1049;
    float _1089 = _929;
    float _1091 = _919;
    if (!_1051)
    {
        _1087 = _1061;
    }
    float _1093 = _1087;
    bool _1095 = !_1051;
    float _1097 = _1093;
    if (!_1095)
    {
        float _1099 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1101 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1103 = _1007 + _1101;
        float _1105 = _1061 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1107 = rsqrt(_993);
        float _1109 = _1103 * _1099;
        float _1111 = _1109 * 0.15915493667125701904296875;
        float _1113 = _1111 * 6.283185482025146484375;
        float _1115 = cos(_1113);
        float _1117 = _1111 * 6.283185482025146484375;
        float _1119 = sin(_1117);
        float _1121 = _1115 + (-1.0);
        float _1123 = _1121 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1125 = fma(_1119, _1105, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1127 = fma(_1061, _1115, _1123);
        float _1129 = _1107 * _1125;
        float _1131 = fma(_957, _1129, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1133 = fma(_953, _1129, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1097 = _1127;
        _1089 = _1131;
        _1091 = _1133;
    }
    float _1135 = _1097;
    float _1137 = _1089;
    float _1139 = _1091;
    float _1141 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1143 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1145 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1147 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1149 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1141);
    float _1151 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1143);
    float _1153 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1145);
    float _1155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1157 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1149);
    float _1159 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1151);
    float _1161 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1153);
    float _1163 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1147);
    float _1165 = _1157 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1167 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1169 = _1161 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1171 = _1059 + 0.5;
    float _1173 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1175 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1177 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1179 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1181 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1173);
    float _1183 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1175);
    float _1185 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1177);
    float _1187 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1163);
    float _1189 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1179);
    float _1191 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1181);
    float _1193 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1195 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1183);
    float _1197 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1185);
    float _1199 = -_1085;
    float _1201 = _1199 + 0.5;
    float _1203 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1189);
    float _1205 = -_1081;
    float _1207 = _1205 + 0.5;
    float _1209 = _1187 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1213 = _1193 * _1045;
    float _1215 = _1065 + 0.5;
    float _1217 = _1201 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1219 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1221 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1203);
    float _1223 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1195);
    float _1225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1227 = _1219 * _1155;
    float _1229 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1191);
    float _1231 = _1215 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1235 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1197);
    float _1237 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1241 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1249 = _1235 + _1221;
    float _1251 = _1217 * _1211;
    float _1253 = _1237 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1255 = _1239 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1257 = _1077 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1259 = _1231 * _1225;
    float _1261 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1263 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1265 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1267 = _1249 * 0.5;
    out.m_44.x = _1253;
    out.m_44.y = _1241;
    out.m_44.z = _1255;
    out.m_46.x = _1213;
    out.m_46.y = _1227;
    out.m_46.z = _1259;
    out.m_46.w = _1251;
    out.m_48.x = _1261;
    out.m_48.y = _1263;
    out.m_48.z = _1265;
    out.m_48.w = _1257;
    out.gl_Position.x = _1229;
    out.gl_Position.y = _1223;
    out.gl_Position.z = _1235;
    out.gl_Position.w = _1221;
    out.m_50.z = _1267;
    out.m_50.w = _1221;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _695 = false;
    bool _593 = false;
    bool _443 = false;
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
        float _1324 = as_type<float>(_85);
        out.gl_Position.z = _1324;
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
    float _105 = 0.0;
    float _107 = 0.0;
    if (_99)
    {
        float _109 = float(_69);
        _79 = _109;
    }
    float _111 = _79;
    bool _113 = _103 >= _111;
    bool _115 = !_99;
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
    if (_117)
    {
        float _123 = _121 * 5.0;
        _87 = as_type<int>(_123);
    }
    int _125 = _87;
    float _127 = as_type<float>(_125);
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1395 = as_type<float>(_125);
        out.gl_Position.z = _1395;
    }
    if (_117)
    {
        return out;
    }
    float _129 = in.m_35.x;
    float _131 = in.m_35.y;
    float _133 = in.m_35.z;
    float _135 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = _135;
    if (!_145)
    {
        float _149 = _135 * _135;
        float _151 = _149 * 0.5;
        _127 = _151;
    }
    float _153 = _127;
    float _155 = 0.0;
    float _157 = _153;
    if (!_145)
    {
        float _159 = _103 * _103;
        float _161 = _159 * 0.5;
        _155 = _161;
    }
    float _163 = _155;
    if (!_145)
    {
        float _165 = _153 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _157 = _165;
    }
    float _167 = _157;
    bool _169 = !_145;
    float _171 = _167;
    if (!_169)
    {
        float _173 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _175 = log2(_173);
        float _177 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _179 = _177 + 1.0;
        float _181 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _183 = _135 * _175;
        float _185 = 1.0 / _179;
        float _187 = _181 * 0.693147182464599609375;
        float _189 = exp2(_183);
        float _191 = 1.0 / _187;
        float _193 = _189 + (-1.0);
        float _195 = -_193;
        float _197 = fma(_195, _191, _135);
        float _199 = _197 * _185;
        float _201 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _105 = _191;
        _171 = _201;
        _107 = _189;
    }
    float _203 = _105;
    float _205 = _171;
    float _207 = _107;
    bool _209 = !_145;
    float _211 = _203;
    float _213 = _207;
    if (!_209)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = 1.0 / _221;
        float _225 = _135 * _217;
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
    if (!_145)
    {
        _241 = _103;
    }
    float _245 = _241;
    float _247 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _245;
    if (!_145)
    {
        float _251 = _163 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _243 = _251;
    }
    float _253 = _243;
    bool _255 = !_145;
    float _257 = _253;
    if (!_255)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _269 = _103 * _261;
        float _271 = 1.0 / _265;
        float _273 = _267 * 0.693147182464599609375;
        float _275 = exp2(_269);
        float _277 = 1.0 / _273;
        float _279 = _275 + (-1.0);
        float _281 = -_279;
        float _283 = fma(_281, _277, _103);
        float _285 = _283 * _271;
        float _287 = _285 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _257 = _287;
    }
    float _289 = _257;
    bool _291 = !_145;
    if (!_291)
    {
        float _293 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = log2(_293);
        float _297 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _299 = _297 + 1.0;
        float _301 = 1.0 / _299;
        float _303 = _103 * _295;
        float _305 = exp2(_303);
        float _307 = -_305;
        float _309 = _307 + 1.0;
        float _311 = _309 * _301;
        _249 = _311;
    }
    float _313 = _249;
    float _315 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _317 = fma(_239, _131, _247);
    float _319 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _321 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _323 = fma(_313, _131, _315);
    float _325 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _327 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _329 = fma(_239, _129, _319);
    float _331 = fma(_313, _129, _321);
    float _333 = -_323;
    float _335 = _317 + _333;
    float _337 = fma(_239, _133, _325);
    float _339 = fma(_313, _133, _327);
    float _341 = -_331;
    float _343 = _329 + _341;
    float _345 = _335 * _335;
    float _347 = in.m_37.w;
    float _349 = -_339;
    float _351 = _337 + _349;
    float _353 = _335 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _355 = fma(_343, _343, _345);
    float _357 = _335 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _359 = _335 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _361 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].x, _353);
    float _363 = fma(_351, _351, _355);
    float _365 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].x, _357);
    float _367 = in.m_30.x;
    float _369 = in.m_30.y;
    float _371 = in.m_30.z;
    float _373 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].x, _359);
    float _375 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[4].z, _361);
    float _377 = sqrt(_363);
    float _379 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[6].z, _373);
    bool _381 = _377 >= 9.9999999747524270787835121154785e-07;
    bool _383 = isnan(_377);
    bool _385 = _381 || _383;
    bool _387 = isnan(9.9999999747524270787835121154785e-07);
    bool _389 = _385 || _387;
    float _391 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[5].z, _365);
    float _393 = fma(_329, _347, _367);
    float _395 = fma(_317, _347, _369);
    float _397 = fma(_337, _347, _371);
    float _399 = _391;
    float _401 = _375;
    float _403 = _379;
    if (!_389)
    {
        bool _405 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _407 = !_405;
        if (!_407)
        {
            float _409 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _411 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _413 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _415 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _409);
            float _417 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _411);
            float _419 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _413);
            float _421 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _415);
            float _423 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _417);
            float _425 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _419);
            float _427 = _421 * _421;
            float _429 = fma(_423, _423, _427);
            float _431 = fma(_425, _425, _429);
            float _433 = rsqrt(_431);
            float _435 = _433 * 9.9999999747524270787835121154785e-07;
            float _437 = _423 * _435;
            float _439 = _421 * _435;
            float _441 = _425 * _435;
            _399 = _439;
            _401 = _437;
            _403 = _441;
            _443 = true;
        }
        else
        {
            float _445 = _131 * _131;
            float _447 = fma(_129, _129, _445);
            float _449 = fma(_133, _133, _447);
            float _451 = sqrt(_449);
            bool _453 = _451 >= 9.9999999747524270787835121154785e-07;
            bool _455 = isnan(_451);
            bool _457 = _453 || _455;
            bool _459 = isnan(9.9999999747524270787835121154785e-07);
            bool _461 = _457 || _459;
            if (!_461)
            {
                float _463 = _369 * _369;
                float _465 = fma(_367, _367, _463);
                float _467 = fma(_371, _371, _465);
                float _469 = sqrt(_467);
                bool _471 = _469 >= 9.9999999747524270787835121154785e-07;
                bool _473 = isnan(_469);
                bool _475 = _471 || _473;
                bool _477 = isnan(9.9999999747524270787835121154785e-07);
                bool _479 = _475 || _477;
                if (!_479)
                {
                    float _481 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _483 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _481);
                    float _485 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _483);
                    float _487 = rsqrt(_485);
                    float _489 = _487 * 9.9999999747524270787835121154785e-07;
                    float _491 = _489 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _493 = _489 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _495 = _489 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _399 = _493;
                    _401 = _491;
                    _403 = _495;
                    _443 = true;
                }
                else
                {
                    float _497 = _369 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _499 = _369 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _501 = _369 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _503 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[5].x, _497);
                    float _505 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[4].x, _499);
                    float _507 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[6].x, _501);
                    float _509 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].z, _503);
                    float _511 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].z, _505);
                    float _513 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].z, _507);
                    float _515 = _509 * _509;
                    float _517 = fma(_511, _511, _515);
                    float _519 = fma(_513, _513, _517);
                    float _521 = rsqrt(_519);
                    float _523 = _521 * 9.9999999747524270787835121154785e-07;
                    float _525 = _511 * _523;
                    float _527 = _509 * _523;
                    float _529 = _513 * _523;
                    _399 = _527;
                    _401 = _525;
                    _403 = _529;
                    _443 = true;
                }
            }
            else
            {
                float _531 = _131 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _533 = _131 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _535 = _131 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _537 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[5].x, _531);
                float _539 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[4].x, _533);
                float _541 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[6].x, _535);
                float _543 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[5].z, _537);
                float _545 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[4].z, _539);
                float _547 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[6].z, _541);
                float _549 = _543 * _543;
                float _551 = fma(_545, _545, _549);
                float _553 = fma(_547, _547, _551);
                float _555 = rsqrt(_553);
                float _557 = _555 * 9.9999999747524270787835121154785e-07;
                float _559 = _545 * _557;
                float _561 = _543 * _557;
                float _563 = _547 * _557;
                _399 = _561;
                _401 = _559;
                _403 = _563;
            }
        }
    }
    _443 = false;
    float _565 = _399;
    float _567 = _401;
    float _569 = _403;
    bool _571 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _573 = !_571;
    float _591;
    if (!_573)
    {
        float _575 = in.m_39.x;
        float _577 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _579 = _575 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _581 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _583 = _581 * _577;
        float _585 = floor(_583);
        float _587 = -_585;
        float _589 = _583 + _587;
        _591 = _589;
        _593 = true;
    }
    else
    {
        float _595 = float(_69);
        float _597 = 1.0 / _595;
        float _599 = _103 * _597;
        _591 = _599;
    }
    _593 = false;
    float _601 = _591;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _605 = _601 + _603;
    bool _607 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _609 = isnan(_601);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _615 = _611 || _613;
    float _617 = float(_615);
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _619;
    float _623 = -_617;
    float _625 = _623 + 1.0;
    bool _627 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _629 = isnan(_601);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _639;
    bool _643 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _645 = 1.0 / _621;
    float _647 = _637 * _625;
    float _649 = -_637;
    float _651 = _649 + 1.0;
    float _653 = _605 * _645;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _655;
    float _659 = fma(_641, _653, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _661 = fma(_657, _653, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _663 = _659 * _647;
    float _665 = _661 * _647;
    float _667 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[143].x, _663);
    float _669 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[143].y, _665);
    float _671 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[144].x, _667);
    float _673 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[144].y, _669);
    bool _675 = !_643;
    float _693;
    if (!_675)
    {
        float _677 = in.m_39.x;
        float _679 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _681 = _677 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _685 = _683 * _679;
        float _687 = floor(_685);
        float _689 = -_687;
        float _691 = _685 + _689;
        _693 = _691;
        _695 = true;
    }
    else
    {
        float _697 = float(_69);
        float _699 = 1.0 / _697;
        float _701 = _103 * _699;
        _693 = _701;
    }
    _695 = false;
    float _703 = _693;
    float _705 = _565 * _565;
    float _707 = as_type<float>(int(gl_VertexIndex));
    float _709 = fma(_567, _567, _705);
    float _711 = in.m_39.x;
    float _713 = in.m_39.y;
    float _715 = in.m_39.z;
    float _717 = in.m_39.w;
    float _719 = fma(_569, _569, _709);
    float _721 = in.m_37.x;
    float _723 = in.m_37.y;
    float _725 = rsqrt(_719);
    int _727 = as_type<int>(_707) & 1;
    bool _729 = _727 != 0;
    int _731 = as_type<int>(_707) & 2;
    bool _733 = _731 != 0;
    int _735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _737 = _735 != 0;
    float _739 = _725 * _569;
    float _741 = _725 * _565;
    float _743 = _725 * _567;
    float _745 = _395 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _747 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _749 = _739 * _747;
    bool _751 = _711 > 0.5;
    float _753 = _395 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _755 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _757 = _741 * _755;
    float _759 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _761 = -_749;
    float _763 = fma(_743, _759, _761);
    float _765 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].x, _745);
    float _767 = _395 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _769 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].x, _753);
    float _771 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _773 = -_757;
    float _775 = fma(_739, _771, _773);
    float _777 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _779 = _743 * _777;
    float _781 = _763 * _763;
    float _783 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].x, _767);
    bool _785 = !_729;
    float _787 = _785 ? (-0.5) : 0.5;
    float _789 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _791 = -_779;
    float _793 = fma(_741, _789, _791);
    float _795 = fma(_775, _775, _781);
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _799 = _797 != 0;
    float _801 = _671 * _721;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _805 = _803 != 0;
    float _807 = fma(_793, _793, _795);
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _811 = _809 != 0;
    float _813 = _673 * _723;
    float _815 = -_787;
    int _817 = _751 ? as_type<int>(_815) : as_type<int>(_787);
    float _819 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[4].z, _769);
    bool _821 = _717 > 0.5;
    float _823 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[5].z, _765);
    bool _825 = _713 > 0.5;
    float _827 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[6].z, _783);
    float _829 = rsqrt(_807);
    float _831 = _801 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _833 = _813 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _839 = !_733;
    float _841 = _839 ? (-0.5) : 0.5;
    float _843 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _787);
    bool _845 = _715 > 0.5;
    float _847 = 1.0 / _837;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _853 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _841);
    float _855 = _831 * _843;
    float _857 = _833 * _853;
    float _859 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _861 = 1.0 / _851;
    float _863 = _763 * _829;
    float _865 = _793 * _829;
    float _867 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _869 = _775 * _829;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _871;
    float _875 = _857 * _743;
    float _877 = _741 * _865;
    float _879 = _857 * _739;
    float _881 = _743 * _863;
    out.m_33.x = _867;
    float _883 = fma(_855, _869, _875);
    float _885 = fma(_855, _865, _879);
    float _887 = -_881;
    float _889 = fma(_741, _869, _887);
    float _891 = _873 * _847;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _897 = _827 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _899 = fma(_859, _889, _885);
    float _901 = -_877;
    float _903 = fma(_739, _863, _901);
    float _905 = _819 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _907 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _909 = isnan(_703);
    bool _911 = _907 || _909;
    bool _913 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _915 = _911 || _913;
    float _917 = float(_915);
    float _919 = _897 + _899;
    float _921 = fma(_859, _903, _883);
    float _923 = _895 * _861;
    float _925 = -_917;
    float _927 = _925 + 1.0;
    float _929 = _905 + _921;
    bool _931 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _933 = isnan(_703);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _939 = _935 || _937;
    float _941 = float(_939);
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _945 = _703 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _951 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _953 = _919 + _951;
    float _955 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _957 = _929 + _955;
    float _959 = _941 * _927;
    float _961 = -_941;
    float _963 = _961 + 1.0;
    float _965 = _953 * _953;
    bool _967 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _969 = isnan(_703);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _975 = _971 || _973;
    float _977 = float(_975);
    float _979 = 1.0 / _949;
    bool _981 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _983 = isnan(_703);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    float _993 = fma(_957, _957, _965);
    float _995 = fma(_891, _945, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _997 = _977 * _963;
    float _999 = -_977;
    float _1001 = _999 + 1.0;
    float _1003 = _857 * _741;
    float _1005 = _739 * _869;
    float _1007 = sqrt(_993);
    float _1009 = _991 * _1001;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1013 = _703 + _1011;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1015;
    float _1019 = -_991;
    float _1021 = _1019 + 1.0;
    float _1023 = _995 * _1009;
    float _1025 = -_787;
    int _1027 = _845 ? as_type<int>(_1025) : as_type<int>(_787);
    float _1029 = fma(_855, _863, _1003);
    float _1031 = -_1005;
    float _1033 = fma(_743, _865, _1031);
    float _1035 = _1017 * _979;
    float _1037 = fma(_923, _1013, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1041 = _703 + _1039;
    float _1043 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1023);
    float _1045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1047 = fma(_859, _1033, _1029);
    float _1049 = _823 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1051 = _1007 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1053 = fma(_1035, _1041, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1055 = fma(_1037, _997, _1043);
    bool _1057 = !_737;
    float _1059 = _1057 ? _787 : as_type<float>(_817);
    float _1061 = _1049 + _1047;
    bool _1063 = !_805;
    float _1065 = _1063 ? _787 : as_type<float>(_1027);
    float _1067 = fma(_1053, _959, _1055);
    float _1069 = -_841;
    int _1071 = _825 ? as_type<int>(_1069) : as_type<int>(_841);
    float _1073 = -_841;
    int _1075 = _821 ? as_type<int>(_1073) : as_type<int>(_841);
    float _1077 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1067);
    bool _1079 = !_799;
    float _1081 = _1079 ? _841 : as_type<float>(_1071);
    bool _1083 = !_811;
    float _1085 = _1083 ? _841 : as_type<float>(_1075);
    float _1087 = _1049;
    float _1089 = _929;
    float _1091 = _919;
    if (!_1051)
    {
        _1087 = _1061;
    }
    float _1093 = _1087;
    bool _1095 = !_1051;
    float _1097 = _1093;
    if (!_1095)
    {
        float _1099 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1101 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1103 = _1007 + _1101;
        float _1105 = _1061 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1107 = rsqrt(_993);
        float _1109 = _1103 * _1099;
        float _1111 = _1109 * 0.15915493667125701904296875;
        float _1113 = _1111 * 6.283185482025146484375;
        float _1115 = cos(_1113);
        float _1117 = _1111 * 6.283185482025146484375;
        float _1119 = sin(_1117);
        float _1121 = _1115 + (-1.0);
        float _1123 = _1121 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1125 = fma(_1119, _1105, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1127 = fma(_1061, _1115, _1123);
        float _1129 = _1107 * _1125;
        float _1131 = fma(_957, _1129, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1133 = fma(_953, _1129, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1097 = _1127;
        _1089 = _1131;
        _1091 = _1133;
    }
    float _1135 = _1097;
    float _1137 = _1089;
    float _1139 = _1091;
    float _1141 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1143 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1145 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1147 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1149 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1141);
    float _1151 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1143);
    float _1153 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1145);
    float _1155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1157 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1149);
    float _1159 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1151);
    float _1161 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1153);
    float _1163 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1147);
    float _1165 = _1157 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1167 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1169 = _1161 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1171 = _1059 + 0.5;
    float _1173 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1175 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1177 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1179 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1181 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1173);
    float _1183 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1175);
    float _1185 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1177);
    float _1187 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1163);
    float _1189 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1179);
    float _1191 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1181);
    float _1193 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1195 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1183);
    float _1197 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1185);
    float _1199 = -_1085;
    float _1201 = _1199 + 0.5;
    float _1203 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1189);
    float _1205 = -_1081;
    float _1207 = _1205 + 0.5;
    float _1209 = _1187 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1213 = _1193 * _1045;
    float _1215 = _1065 + 0.5;
    float _1217 = _1201 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1219 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1221 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1203);
    float _1223 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1195);
    float _1225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1227 = _1219 * _1155;
    float _1229 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1191);
    float _1231 = _1215 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1235 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1197);
    float _1237 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1241 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1249 = _1235 + _1221;
    float _1251 = _1217 * _1211;
    float _1253 = _1237 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1255 = _1239 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1257 = _1077 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1259 = _1231 * _1225;
    float _1261 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1263 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1265 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1267 = _1249 * 0.5;
    out.m_44.x = _1253;
    out.m_44.y = _1241;
    out.m_44.z = _1255;
    out.m_46.x = _1213;
    out.m_46.y = _1227;
    out.m_46.z = _1259;
    out.m_46.w = _1251;
    out.m_48.x = _1261;
    out.m_48.y = _1263;
    out.m_48.z = _1265;
    out.m_48.w = _1257;
    out.gl_Position.x = _1229;
    out.gl_Position.y = _1223;
    out.gl_Position.z = _1235;
    out.gl_Position.w = _1221;
    out.m_50.z = _1267;
    out.m_50.w = _1221;
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
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _695 = false;
    bool _593 = false;
    bool _443 = false;
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
        float _1324 = as_type<float>(_85);
        out.gl_Position.z = _1324;
    }
    if (!_73)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _89 = in.m_35.w;
    bool _91 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _99 = _95 || _97;
    float _101 = -_89;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _105 = 0.0;
    float _107 = 0.0;
    if (_99)
    {
        float _109 = float(_69);
        _79 = _109;
    }
    float _111 = _79;
    bool _113 = _103 >= _111;
    bool _115 = !_99;
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
    if (_117)
    {
        float _123 = _121 * 5.0;
        _87 = as_type<int>(_123);
    }
    int _125 = _87;
    float _127 = as_type<float>(_125);
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1395 = as_type<float>(_125);
        out.gl_Position.z = _1395;
    }
    if (_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_35.x;
    float _131 = in.m_35.y;
    float _133 = in.m_35.z;
    float _135 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = _135;
    if (!_145)
    {
        float _149 = _135 * _135;
        float _151 = _149 * 0.5;
        _127 = _151;
    }
    float _153 = _127;
    float _155 = 0.0;
    float _157 = _153;
    if (!_145)
    {
        float _159 = _103 * _103;
        float _161 = _159 * 0.5;
        _155 = _161;
    }
    float _163 = _155;
    if (!_145)
    {
        float _165 = _153 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _157 = _165;
    }
    float _167 = _157;
    bool _169 = !_145;
    float _171 = _167;
    if (!_169)
    {
        float _173 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _175 = log2(_173);
        float _177 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _179 = _177 + 1.0;
        float _181 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _183 = _135 * _175;
        float _185 = 1.0 / _179;
        float _187 = _181 * 0.693147182464599609375;
        float _189 = exp2(_183);
        float _191 = 1.0 / _187;
        float _193 = _189 + (-1.0);
        float _195 = -_193;
        float _197 = fma(_195, _191, _135);
        float _199 = _197 * _185;
        float _201 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _105 = _191;
        _171 = _201;
        _107 = _189;
    }
    float _203 = _105;
    float _205 = _171;
    float _207 = _107;
    bool _209 = !_145;
    float _211 = _203;
    float _213 = _207;
    if (!_209)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = 1.0 / _221;
        float _225 = _135 * _217;
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
    if (!_145)
    {
        _241 = _103;
    }
    float _245 = _241;
    float _247 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _245;
    if (!_145)
    {
        float _251 = _163 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _243 = _251;
    }
    float _253 = _243;
    bool _255 = !_145;
    float _257 = _253;
    if (!_255)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _269 = _103 * _261;
        float _271 = 1.0 / _265;
        float _273 = _267 * 0.693147182464599609375;
        float _275 = exp2(_269);
        float _277 = 1.0 / _273;
        float _279 = _275 + (-1.0);
        float _281 = -_279;
        float _283 = fma(_281, _277, _103);
        float _285 = _283 * _271;
        float _287 = _285 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _257 = _287;
    }
    float _289 = _257;
    bool _291 = !_145;
    if (!_291)
    {
        float _293 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = log2(_293);
        float _297 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _299 = _297 + 1.0;
        float _301 = 1.0 / _299;
        float _303 = _103 * _295;
        float _305 = exp2(_303);
        float _307 = -_305;
        float _309 = _307 + 1.0;
        float _311 = _309 * _301;
        _249 = _311;
    }
    float _313 = _249;
    float _315 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _317 = fma(_239, _131, _247);
    float _319 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _321 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _323 = fma(_313, _131, _315);
    float _325 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _327 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _329 = fma(_239, _129, _319);
    float _331 = fma(_313, _129, _321);
    float _333 = -_323;
    float _335 = _317 + _333;
    float _337 = fma(_239, _133, _325);
    float _339 = fma(_313, _133, _327);
    float _341 = -_331;
    float _343 = _329 + _341;
    float _345 = _335 * _335;
    float _347 = in.m_37.w;
    float _349 = -_339;
    float _351 = _337 + _349;
    float _353 = _335 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _355 = fma(_343, _343, _345);
    float _357 = _335 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _359 = _335 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _361 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].x, _353);
    float _363 = fma(_351, _351, _355);
    float _365 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].x, _357);
    float _367 = in.m_30.x;
    float _369 = in.m_30.y;
    float _371 = in.m_30.z;
    float _373 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].x, _359);
    float _375 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[4].z, _361);
    float _377 = sqrt(_363);
    float _379 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[6].z, _373);
    bool _381 = _377 >= 9.9999999747524270787835121154785e-07;
    bool _383 = isnan(_377);
    bool _385 = _381 || _383;
    bool _387 = isnan(9.9999999747524270787835121154785e-07);
    bool _389 = _385 || _387;
    float _391 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[5].z, _365);
    float _393 = fma(_329, _347, _367);
    float _395 = fma(_317, _347, _369);
    float _397 = fma(_337, _347, _371);
    float _399 = _391;
    float _401 = _375;
    float _403 = _379;
    if (!_389)
    {
        bool _405 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _407 = !_405;
        if (!_407)
        {
            float _409 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _411 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _413 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _415 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _409);
            float _417 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _411);
            float _419 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _413);
            float _421 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _415);
            float _423 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _417);
            float _425 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _419);
            float _427 = _421 * _421;
            float _429 = fma(_423, _423, _427);
            float _431 = fma(_425, _425, _429);
            float _433 = rsqrt(_431);
            float _435 = _433 * 9.9999999747524270787835121154785e-07;
            float _437 = _423 * _435;
            float _439 = _421 * _435;
            float _441 = _425 * _435;
            _399 = _439;
            _401 = _437;
            _403 = _441;
            _443 = true;
        }
        else
        {
            float _445 = _131 * _131;
            float _447 = fma(_129, _129, _445);
            float _449 = fma(_133, _133, _447);
            float _451 = sqrt(_449);
            bool _453 = _451 >= 9.9999999747524270787835121154785e-07;
            bool _455 = isnan(_451);
            bool _457 = _453 || _455;
            bool _459 = isnan(9.9999999747524270787835121154785e-07);
            bool _461 = _457 || _459;
            if (!_461)
            {
                float _463 = _369 * _369;
                float _465 = fma(_367, _367, _463);
                float _467 = fma(_371, _371, _465);
                float _469 = sqrt(_467);
                bool _471 = _469 >= 9.9999999747524270787835121154785e-07;
                bool _473 = isnan(_469);
                bool _475 = _471 || _473;
                bool _477 = isnan(9.9999999747524270787835121154785e-07);
                bool _479 = _475 || _477;
                if (!_479)
                {
                    float _481 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _483 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _481);
                    float _485 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _483);
                    float _487 = rsqrt(_485);
                    float _489 = _487 * 9.9999999747524270787835121154785e-07;
                    float _491 = _489 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _493 = _489 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _495 = _489 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _399 = _493;
                    _401 = _491;
                    _403 = _495;
                    _443 = true;
                }
                else
                {
                    float _497 = _369 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _499 = _369 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _501 = _369 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _503 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[5].x, _497);
                    float _505 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[4].x, _499);
                    float _507 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[6].x, _501);
                    float _509 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].z, _503);
                    float _511 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].z, _505);
                    float _513 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].z, _507);
                    float _515 = _509 * _509;
                    float _517 = fma(_511, _511, _515);
                    float _519 = fma(_513, _513, _517);
                    float _521 = rsqrt(_519);
                    float _523 = _521 * 9.9999999747524270787835121154785e-07;
                    float _525 = _511 * _523;
                    float _527 = _509 * _523;
                    float _529 = _513 * _523;
                    _399 = _527;
                    _401 = _525;
                    _403 = _529;
                    _443 = true;
                }
            }
            else
            {
                float _531 = _131 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _533 = _131 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _535 = _131 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _537 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[5].x, _531);
                float _539 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[4].x, _533);
                float _541 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[6].x, _535);
                float _543 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[5].z, _537);
                float _545 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[4].z, _539);
                float _547 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[6].z, _541);
                float _549 = _543 * _543;
                float _551 = fma(_545, _545, _549);
                float _553 = fma(_547, _547, _551);
                float _555 = rsqrt(_553);
                float _557 = _555 * 9.9999999747524270787835121154785e-07;
                float _559 = _545 * _557;
                float _561 = _543 * _557;
                float _563 = _547 * _557;
                _399 = _561;
                _401 = _559;
                _403 = _563;
            }
        }
    }
    _443 = false;
    float _565 = _399;
    float _567 = _401;
    float _569 = _403;
    bool _571 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _573 = !_571;
    float _591;
    if (!_573)
    {
        float _575 = in.m_39.x;
        float _577 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _579 = _575 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _581 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _583 = _581 * _577;
        float _585 = floor(_583);
        float _587 = -_585;
        float _589 = _583 + _587;
        _591 = _589;
        _593 = true;
    }
    else
    {
        float _595 = float(_69);
        float _597 = 1.0 / _595;
        float _599 = _103 * _597;
        _591 = _599;
    }
    _593 = false;
    float _601 = _591;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _605 = _601 + _603;
    bool _607 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _609 = isnan(_601);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _615 = _611 || _613;
    float _617 = float(_615);
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _619;
    float _623 = -_617;
    float _625 = _623 + 1.0;
    bool _627 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _629 = isnan(_601);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _639;
    bool _643 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _645 = 1.0 / _621;
    float _647 = _637 * _625;
    float _649 = -_637;
    float _651 = _649 + 1.0;
    float _653 = _605 * _645;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _655;
    float _659 = fma(_641, _653, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _661 = fma(_657, _653, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _663 = _659 * _647;
    float _665 = _661 * _647;
    float _667 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[143].x, _663);
    float _669 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[143].y, _665);
    float _671 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[144].x, _667);
    float _673 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[144].y, _669);
    bool _675 = !_643;
    float _693;
    if (!_675)
    {
        float _677 = in.m_39.x;
        float _679 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _681 = _677 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _685 = _683 * _679;
        float _687 = floor(_685);
        float _689 = -_687;
        float _691 = _685 + _689;
        _693 = _691;
        _695 = true;
    }
    else
    {
        float _697 = float(_69);
        float _699 = 1.0 / _697;
        float _701 = _103 * _699;
        _693 = _701;
    }
    _695 = false;
    float _703 = _693;
    float _705 = _565 * _565;
    float _707 = as_type<float>(int(gl_VertexIndex));
    float _709 = fma(_567, _567, _705);
    float _711 = in.m_39.x;
    float _713 = in.m_39.y;
    float _715 = in.m_39.z;
    float _717 = in.m_39.w;
    float _719 = fma(_569, _569, _709);
    float _721 = in.m_37.x;
    float _723 = in.m_37.y;
    float _725 = rsqrt(_719);
    int _727 = as_type<int>(_707) & 1;
    bool _729 = _727 != 0;
    int _731 = as_type<int>(_707) & 2;
    bool _733 = _731 != 0;
    int _735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _737 = _735 != 0;
    float _739 = _725 * _569;
    float _741 = _725 * _565;
    float _743 = _725 * _567;
    float _745 = _395 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _747 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _749 = _739 * _747;
    bool _751 = _711 > 0.5;
    float _753 = _395 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _755 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _757 = _741 * _755;
    float _759 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _761 = -_749;
    float _763 = fma(_743, _759, _761);
    float _765 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].x, _745);
    float _767 = _395 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _769 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].x, _753);
    float _771 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _773 = -_757;
    float _775 = fma(_739, _771, _773);
    float _777 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _779 = _743 * _777;
    float _781 = _763 * _763;
    float _783 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].x, _767);
    bool _785 = !_729;
    float _787 = _785 ? (-0.5) : 0.5;
    float _789 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _791 = -_779;
    float _793 = fma(_741, _789, _791);
    float _795 = fma(_775, _775, _781);
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _799 = _797 != 0;
    float _801 = _671 * _721;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _805 = _803 != 0;
    float _807 = fma(_793, _793, _795);
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _811 = _809 != 0;
    float _813 = _673 * _723;
    float _815 = -_787;
    int _817 = _751 ? as_type<int>(_815) : as_type<int>(_787);
    float _819 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[4].z, _769);
    bool _821 = _717 > 0.5;
    float _823 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[5].z, _765);
    bool _825 = _713 > 0.5;
    float _827 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[6].z, _783);
    float _829 = rsqrt(_807);
    float _831 = _801 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _833 = _813 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _839 = !_733;
    float _841 = _839 ? (-0.5) : 0.5;
    float _843 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _787);
    bool _845 = _715 > 0.5;
    float _847 = 1.0 / _837;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _853 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _841);
    float _855 = _831 * _843;
    float _857 = _833 * _853;
    float _859 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _861 = 1.0 / _851;
    float _863 = _763 * _829;
    float _865 = _793 * _829;
    float _867 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _869 = _775 * _829;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _871;
    float _875 = _857 * _743;
    float _877 = _741 * _865;
    float _879 = _857 * _739;
    float _881 = _743 * _863;
    out.m_33.x = _867;
    float _883 = fma(_855, _869, _875);
    float _885 = fma(_855, _865, _879);
    float _887 = -_881;
    float _889 = fma(_741, _869, _887);
    float _891 = _873 * _847;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _897 = _827 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _899 = fma(_859, _889, _885);
    float _901 = -_877;
    float _903 = fma(_739, _863, _901);
    float _905 = _819 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _907 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _909 = isnan(_703);
    bool _911 = _907 || _909;
    bool _913 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _915 = _911 || _913;
    float _917 = float(_915);
    float _919 = _897 + _899;
    float _921 = fma(_859, _903, _883);
    float _923 = _895 * _861;
    float _925 = -_917;
    float _927 = _925 + 1.0;
    float _929 = _905 + _921;
    bool _931 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _933 = isnan(_703);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _939 = _935 || _937;
    float _941 = float(_939);
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _945 = _703 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _951 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _953 = _919 + _951;
    float _955 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _957 = _929 + _955;
    float _959 = _941 * _927;
    float _961 = -_941;
    float _963 = _961 + 1.0;
    float _965 = _953 * _953;
    bool _967 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _969 = isnan(_703);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _975 = _971 || _973;
    float _977 = float(_975);
    float _979 = 1.0 / _949;
    bool _981 = _703 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _983 = isnan(_703);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    float _993 = fma(_957, _957, _965);
    float _995 = fma(_891, _945, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _997 = _977 * _963;
    float _999 = -_977;
    float _1001 = _999 + 1.0;
    float _1003 = _857 * _741;
    float _1005 = _739 * _869;
    float _1007 = sqrt(_993);
    float _1009 = _991 * _1001;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1013 = _703 + _1011;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1015;
    float _1019 = -_991;
    float _1021 = _1019 + 1.0;
    float _1023 = _995 * _1009;
    float _1025 = -_787;
    int _1027 = _845 ? as_type<int>(_1025) : as_type<int>(_787);
    float _1029 = fma(_855, _863, _1003);
    float _1031 = -_1005;
    float _1033 = fma(_743, _865, _1031);
    float _1035 = _1017 * _979;
    float _1037 = fma(_923, _1013, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1041 = _703 + _1039;
    float _1043 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1023);
    float _1045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1047 = fma(_859, _1033, _1029);
    float _1049 = _823 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1051 = _1007 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1053 = fma(_1035, _1041, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1055 = fma(_1037, _997, _1043);
    bool _1057 = !_737;
    float _1059 = _1057 ? _787 : as_type<float>(_817);
    float _1061 = _1049 + _1047;
    bool _1063 = !_805;
    float _1065 = _1063 ? _787 : as_type<float>(_1027);
    float _1067 = fma(_1053, _959, _1055);
    float _1069 = -_841;
    int _1071 = _825 ? as_type<int>(_1069) : as_type<int>(_841);
    float _1073 = -_841;
    int _1075 = _821 ? as_type<int>(_1073) : as_type<int>(_841);
    float _1077 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1067);
    bool _1079 = !_799;
    float _1081 = _1079 ? _841 : as_type<float>(_1071);
    bool _1083 = !_811;
    float _1085 = _1083 ? _841 : as_type<float>(_1075);
    float _1087 = _1049;
    float _1089 = _929;
    float _1091 = _919;
    if (!_1051)
    {
        _1087 = _1061;
    }
    float _1093 = _1087;
    bool _1095 = !_1051;
    float _1097 = _1093;
    if (!_1095)
    {
        float _1099 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1101 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1103 = _1007 + _1101;
        float _1105 = _1061 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1107 = rsqrt(_993);
        float _1109 = _1103 * _1099;
        float _1111 = _1109 * 0.15915493667125701904296875;
        float _1113 = _1111 * 6.283185482025146484375;
        float _1115 = cos(_1113);
        float _1117 = _1111 * 6.283185482025146484375;
        float _1119 = sin(_1117);
        float _1121 = _1115 + (-1.0);
        float _1123 = _1121 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1125 = fma(_1119, _1105, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1127 = fma(_1061, _1115, _1123);
        float _1129 = _1107 * _1125;
        float _1131 = fma(_957, _1129, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1133 = fma(_953, _1129, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1097 = _1127;
        _1089 = _1131;
        _1091 = _1133;
    }
    float _1135 = _1097;
    float _1137 = _1089;
    float _1139 = _1091;
    float _1141 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1143 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1145 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1147 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1149 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1141);
    float _1151 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1143);
    float _1153 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1145);
    float _1155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1157 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1149);
    float _1159 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1151);
    float _1161 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1153);
    float _1163 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1147);
    float _1165 = _1157 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1167 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1169 = _1161 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1171 = _1059 + 0.5;
    float _1173 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1175 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1177 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1179 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1181 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1173);
    float _1183 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1175);
    float _1185 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1177);
    float _1187 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1163);
    float _1189 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1179);
    float _1191 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1181);
    float _1193 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1195 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1183);
    float _1197 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1185);
    float _1199 = -_1085;
    float _1201 = _1199 + 0.5;
    float _1203 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1189);
    float _1205 = -_1081;
    float _1207 = _1205 + 0.5;
    float _1209 = _1187 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1213 = _1193 * _1045;
    float _1215 = _1065 + 0.5;
    float _1217 = _1201 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1219 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1221 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1203);
    float _1223 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1195);
    float _1225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1227 = _1219 * _1155;
    float _1229 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1191);
    float _1231 = _1215 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1235 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1197);
    float _1237 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1241 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1249 = _1235 + _1221;
    float _1251 = _1217 * _1211;
    float _1253 = _1237 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1255 = _1239 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1257 = _1077 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1259 = _1231 * _1225;
    float _1261 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1263 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1265 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1267 = _1249 * 0.5;
    out.m_44.x = _1253;
    out.m_44.y = _1241;
    out.m_44.z = _1255;
    out.m_46.x = _1213;
    out.m_46.y = _1227;
    out.m_46.z = _1259;
    out.m_46.w = _1251;
    out.m_48.x = _1261;
    out.m_48.y = _1263;
    out.m_48.z = _1265;
    out.m_48.w = _1257;
    out.gl_Position.x = _1229;
    out.gl_Position.y = _1223;
    out.gl_Position.z = _1235;
    out.gl_Position.w = _1221;
    out.m_50.z = _1267;
    out.m_50.w = _1221;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

