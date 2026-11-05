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
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_48 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 m_50 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_42 [[attribute(4)]];
    float4 m_40 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _727 = false;
    bool _617 = false;
    bool _467 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _1884 = as_type<float>(_87);
        out.gl_Position.z = _1884;
    }
    if (!_75)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _91 = in.m_35.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_101)
    {
        float _107 = float(_71);
        _81 = _107;
    }
    float _109 = _81;
    bool _111 = _105 >= _109;
    bool _113 = !_101;
    bool _115 = _111 || _113;
    float _117 = _109;
    if (_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    if (_115)
    {
        out.m_33.x = 0.0;
    }
    if (_115)
    {
        float _121 = _119 * 5.0;
        _89 = as_type<int>(_121);
    }
    int _123 = _89;
    float _125 = as_type<float>(_123);
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1955 = as_type<float>(_123);
        out.gl_Position.z = _1955;
    }
    if (_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = as_type<float>(int(gl_VertexIndex));
    float _129 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _131 = in.m_35.x;
    float _133 = in.m_35.y;
    float _135 = in.m_35.z;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = _129;
    if (!_145)
    {
        float _149 = _129 * _129;
        float _151 = _149 * 0.5;
        _125 = _151;
    }
    float _153 = _125;
    float _155 = 0.0;
    float _157 = _153;
    if (!_145)
    {
        float _159 = _105 * _105;
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
    int _169 = as_type<int>(_127) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_127) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_145;
    float _187 = _127;
    float _189 = _167;
    float _191 = 0.0;
    if (!_185)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _129 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _129);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _211;
        _189 = _221;
        _191 = _209;
    }
    float _223 = _187;
    float _225 = _189;
    float _227 = _191;
    bool _229 = !_145;
    float _231 = _223;
    float _233 = _227;
    if (!_229)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _129 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _231 = _247;
        _233 = _241;
        _147 = _253;
    }
    float _255 = _231;
    float _257 = _233;
    float _259 = _147;
    float _261 = _257;
    float _263 = _255;
    if (!_145)
    {
        _261 = _105;
    }
    float _265 = _261;
    float _267 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _269 = _265;
    if (!_145)
    {
        float _271 = _163 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _263 = _271;
    }
    float _273 = _263;
    bool _275 = !_145;
    float _277 = _273;
    if (!_275)
    {
        float _279 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _281 = log2(_279);
        float _283 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _285 = _283 + 1.0;
        float _287 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _289 = _105 * _281;
        float _291 = 1.0 / _285;
        float _293 = _287 * 0.693147182464599609375;
        float _295 = exp2(_289);
        float _297 = 1.0 / _293;
        float _299 = _295 + (-1.0);
        float _301 = -_299;
        float _303 = fma(_301, _297, _105);
        float _305 = _303 * _291;
        float _307 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _307;
    }
    float _309 = _277;
    bool _311 = !_145;
    if (!_311)
    {
        float _313 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _315 = log2(_313);
        float _317 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _319 = _317 + 1.0;
        float _321 = 1.0 / _319;
        float _323 = _105 * _315;
        float _325 = exp2(_323);
        float _327 = -_325;
        float _329 = _327 + 1.0;
        float _331 = _329 * _321;
        _269 = _331;
    }
    float _333 = _269;
    float _335 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _337 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = fma(_259, _133, _267);
    float _341 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _343 = fma(_333, _133, _335);
    float _345 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _347 = fma(_259, _131, _337);
    float _349 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _351 = fma(_333, _131, _341);
    float _353 = -_343;
    float _355 = _339 + _353;
    float _357 = fma(_259, _135, _345);
    float _359 = fma(_333, _135, _349);
    float _361 = -_351;
    float _363 = _347 + _361;
    float _365 = _355 * _355;
    float _367 = in.m_40.w;
    float _369 = -_359;
    float _371 = _357 + _369;
    float _373 = _355 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _375 = fma(_363, _363, _365);
    float _377 = in.m_30.x;
    float _379 = in.m_30.y;
    float _381 = in.m_30.z;
    float _383 = _355 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _385 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].x, _373);
    float _387 = fma(_371, _371, _375);
    float _389 = _355 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _391 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].x, _383);
    float _393 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].z, _385);
    float _395 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].x, _389);
    float _397 = sqrt(_387);
    float _399 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].z, _391);
    float _401 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].z, _395);
    float _403 = fma(_339, _367, _379);
    bool _405 = _397 >= 9.9999999747524270787835121154785e-07;
    bool _407 = isnan(_397);
    bool _409 = _405 || _407;
    bool _411 = isnan(9.9999999747524270787835121154785e-07);
    bool _413 = _409 || _411;
    float _415 = fma(_347, _367, _377);
    float _417 = fma(_357, _367, _381);
    float _419 = _339;
    float _421 = _393;
    float _423 = _399;
    if (_413)
    {
        _419 = _401;
    }
    float _425 = _419;
    float _427 = _425;
    if (!_413)
    {
        bool _429 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _431 = !_429;
        if (!_431)
        {
            float _433 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _435 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _437 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _439 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _433);
            float _441 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _435);
            float _443 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _437);
            float _445 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _439);
            float _447 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _441);
            float _449 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _443);
            float _451 = _445 * _445;
            float _453 = fma(_447, _447, _451);
            float _455 = fma(_449, _449, _453);
            float _457 = rsqrt(_455);
            float _459 = _457 * 9.9999999747524270787835121154785e-07;
            float _461 = _447 * _459;
            float _463 = _445 * _459;
            float _465 = _449 * _459;
            _421 = _463;
            _427 = _461;
            _423 = _465;
            _467 = true;
        }
        else
        {
            float _469 = _133 * _133;
            float _471 = fma(_131, _131, _469);
            float _473 = fma(_135, _135, _471);
            float _475 = sqrt(_473);
            bool _477 = _475 >= 9.9999999747524270787835121154785e-07;
            bool _479 = isnan(_475);
            bool _481 = _477 || _479;
            bool _483 = isnan(9.9999999747524270787835121154785e-07);
            bool _485 = _481 || _483;
            if (!_485)
            {
                float _487 = _379 * _379;
                float _489 = fma(_377, _377, _487);
                float _491 = fma(_381, _381, _489);
                float _493 = sqrt(_491);
                bool _495 = _493 >= 9.9999999747524270787835121154785e-07;
                bool _497 = isnan(_493);
                bool _499 = _495 || _497;
                bool _501 = isnan(9.9999999747524270787835121154785e-07);
                bool _503 = _499 || _501;
                if (!_503)
                {
                    float _505 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _507 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _505);
                    float _509 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _507);
                    float _511 = rsqrt(_509);
                    float _513 = _511 * 9.9999999747524270787835121154785e-07;
                    float _515 = _513 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _517 = _513 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _519 = _513 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _421 = _517;
                    _427 = _515;
                    _423 = _519;
                    _467 = true;
                }
                else
                {
                    float _521 = _379 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _523 = _379 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _525 = _379 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _527 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].x, _521);
                    float _529 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].x, _523);
                    float _531 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].x, _525);
                    float _533 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].z, _527);
                    float _535 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].z, _529);
                    float _537 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].z, _531);
                    float _539 = _533 * _533;
                    float _541 = fma(_535, _535, _539);
                    float _543 = fma(_537, _537, _541);
                    float _545 = rsqrt(_543);
                    float _547 = _545 * 9.9999999747524270787835121154785e-07;
                    float _549 = _535 * _547;
                    float _551 = _533 * _547;
                    float _553 = _537 * _547;
                    _421 = _551;
                    _427 = _549;
                    _423 = _553;
                    _467 = true;
                }
            }
            else
            {
                float _555 = _133 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _557 = _133 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _559 = _133 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _561 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[5].x, _555);
                float _563 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[4].x, _557);
                float _565 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[6].x, _559);
                float _567 = fma(_135, (*spvDescriptorSet0.vp_c10)._m0[5].z, _561);
                float _569 = fma(_135, (*spvDescriptorSet0.vp_c10)._m0[4].z, _563);
                float _571 = fma(_135, (*spvDescriptorSet0.vp_c10)._m0[6].z, _565);
                float _573 = _567 * _567;
                float _575 = fma(_569, _569, _573);
                float _577 = fma(_571, _571, _575);
                float _579 = rsqrt(_577);
                float _581 = _579 * 9.9999999747524270787835121154785e-07;
                float _583 = _569 * _581;
                float _585 = _567 * _581;
                float _587 = _571 * _581;
                _421 = _585;
                _427 = _583;
                _423 = _587;
            }
        }
    }
    _467 = false;
    float _589 = _421;
    float _591 = _427;
    float _593 = _423;
    bool _595 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _597 = !_595;
    float _615;
    if (!_597)
    {
        float _599 = in.m_42.x;
        float _601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _603 = _599 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _605 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _607 = _605 * _601;
        float _609 = floor(_607);
        float _611 = -_609;
        float _613 = _607 + _611;
        _615 = _613;
        _617 = true;
    }
    else
    {
        float _619 = float(_71);
        float _621 = 1.0 / _619;
        float _623 = _105 * _621;
        _615 = _623;
    }
    _617 = false;
    float _625 = _615;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _629 = _625 + _627;
    float _631 = in.m_40.x;
    float _633 = in.m_40.y;
    bool _635 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _637 = isnan(_625);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _647;
    bool _651 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _653 = isnan(_625);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = -_645;
    float _665 = _663 + 1.0;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _667;
    float _671 = 1.0 / _649;
    bool _673 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _675 = _661 * _665;
    float _677 = -_661;
    float _679 = _677 + 1.0;
    float _681 = _629 * _671;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _683;
    float _687 = fma(_669, _681, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _689 = fma(_685, _681, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _691 = _687 * _675;
    float _693 = _689 * _675;
    float _695 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[143].x, _691);
    float _697 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[143].y, _693);
    float _699 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[144].x, _695);
    float _701 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[144].y, _697);
    float _703 = _699 * _631;
    float _705 = _701 * _633;
    bool _707 = !_673;
    float _725;
    if (!_707)
    {
        float _709 = in.m_42.x;
        float _711 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _713 = _709 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _715 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _717 = _715 * _711;
        float _719 = floor(_717);
        float _721 = -_719;
        float _723 = _717 + _721;
        _725 = _723;
        _727 = true;
    }
    else
    {
        float _729 = float(_71);
        float _731 = 1.0 / _729;
        float _733 = _105 * _731;
        _725 = _733;
    }
    _727 = false;
    float _735 = _725;
    float _737 = in.m_42.x;
    float _739 = in.m_42.y;
    float _741 = in.m_42.z;
    float _743 = in.m_42.w;
    float _745 = _403 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _751 = _749 != 0;
    float _753 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].x, _745);
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _757 = _755 != 0;
    float _759 = _705 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _763 = _761 != 0;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _767 = _765 != 0;
    float _769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _777 = (*spvDescriptorSet0.vp_c10)._m0[9].x * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    bool _779 = _737 > 0.5;
    bool _781 = _743 > 0.5;
    float _783 = _403 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _785 = -_179;
    int _787 = _779 ? as_type<int>(_785) : as_type<int>(_179);
    float _789 = fma((*spvDescriptorSet0.vp_c10)._m0[8].x, (*spvDescriptorSet0.vp_c10)._m0[8].x, _777);
    float _791 = -_183;
    int _793 = _781 ? as_type<int>(_791) : as_type<int>(_183);
    float _795 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].x, _783);
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _799 = _797 != 0;
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _803 = _801 != 0;
    float _805 = _403 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _809 = _807 != 0;
    float _811 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    bool _813 = !_751;
    float _815 = _813 ? _179 : as_type<float>(_787);
    float _817 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].x, _805);
    bool _819 = _739 > 0.5;
    float _821 = _703 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _823 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _825 = _759 * _811;
    float _827 = -_183;
    int _829 = _819 ? as_type<int>(_827) : as_type<int>(_183);
    float _831 = _589 * _589;
    float _833 = -_179;
    int _835 = _819 ? as_type<int>(_833) : as_type<int>(_179);
    float _837 = _821 * _823;
    bool _839 = _741 > 0.5;
    float _841 = fma(_591, _591, _831);
    float _843 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].z, _795);
    float _845 = -_179;
    int _847 = _839 ? as_type<int>(_845) : as_type<int>(_179);
    float _849 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].z, _817);
    bool _851 = !_799;
    float _853 = _851 ? _179 : as_type<float>(_835);
    float _855 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].z, _753);
    bool _857 = !_767;
    float _859 = _857 ? _179 : as_type<float>(_847);
    float _861 = _737 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _863 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _865 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _867 = _863 || _865;
    bool _869 = isnan(0.5);
    bool _871 = _867 || _869;
    float _873 = _739 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _875 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _877 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _879 = _875 || _877;
    bool _881 = isnan(0.5);
    bool _883 = _879 || _881;
    float _885 = -_771;
    float _887 = fma(_861, 2.0, _885);
    float _889 = fma(_873, -2.0, _775);
    float _891 = _855 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _901 = 1.0 / _895;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _905 = _903 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _907 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _889);
    float _909 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _911 = _843 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _913 = 1.0 / _899;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _921 = fma(_593, _593, _841);
    float _923 = _915 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _925;
    float _929 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].z, _909);
    float _931 = 1.0 / _905;
    float _933 = _917 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _935 = _919 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _939 = _735 + _937;
    bool _941 = !_757;
    float _943 = _941 ? _183 : as_type<float>(_829);
    float _945 = _849 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    out.m_44.x = _923;
    out.m_44.y = _933;
    out.m_44.z = _935;
    float _947 = rsqrt(_921);
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _949;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _957 = _951 * _901;
    float _959 = _955 * _913;
    float _961 = _927 * _931;
    float _963 = fma(_957, _939, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _967 = !_763;
    float _969 = _967 ? _183 : as_type<float>(_793);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _973 = _735 + _971;
    float _975 = -_183;
    int _977 = _839 ? as_type<int>(_975) : as_type<int>(_183);
    float _979 = fma((*spvDescriptorSet0.vp_c10)._m0[10].x, (*spvDescriptorSet0.vp_c10)._m0[10].x, _789);
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _983 = _735 + _981;
    float _985 = _947 * _589;
    bool _987 = !_803;
    float _989 = _987 ? _183 : as_type<float>(_977);
    float _991 = -_105;
    float _993 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[76].x, _887);
    float _995 = fma(_959, _983, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _997 = fma(_961, _973, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _999 = _747 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1001 = _815 + 0.5;
    float _1003 = _947 * _591;
    float _1005 = _947 * _593;
    float _1007 = fma(_999, _1001, _993);
    bool _1009 = _735 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1011 = isnan(_735);
    bool _1013 = _1009 || _1011;
    bool _1015 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1017 = _1013 || _1015;
    float _1019 = float(_1017);
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1023 = _735 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1025 = isnan(_735);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1031 = _1027 || _1029;
    float _1033 = float(_1031);
    float _1035 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].z, _929);
    bool _1037 = _735 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1039 = isnan(_735);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1045 = _1041 || _1043;
    float _1047 = float(_1045);
    float _1049 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1021);
    bool _1051 = _735 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1053 = isnan(_735);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1059 = _1055 || _1057;
    float _1061 = float(_1059);
    float _1063 = -_1019;
    float _1065 = _1063 + 1.0;
    float _1067 = _1001;
    float _1069 = _931;
    float _1071 = _739;
    float _1073 = _741;
    if (!_809)
    {
        _1067 = _739;
    }
    float _1075 = _1067;
    float _1077 = -_1033;
    float _1079 = _1077 + 1.0;
    float _1081 = fma(_739, 2.0, -1.0);
    float _1083 = _1033 * _1065;
    float _1085 = _1075;
    if (!_809)
    {
        _1069 = _1075;
    }
    float _1087 = _1069;
    float _1089 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[88].w, _965);
    float _1091 = _1087;
    if (_809)
    {
        _1085 = _739;
    }
    float _1093 = _1085;
    float _1095 = _1061 * _1079;
    float _1097 = _1093;
    if (_809)
    {
        _1071 = _737;
    }
    float _1099 = _1071;
    float _1101 = -_1061;
    float _1103 = _1101 + 1.0;
    float _1105 = _1099;
    if (!_809)
    {
        _1105 = _741;
    }
    float _1107 = _1105;
    float _1109 = _769 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1111 = rsqrt(_1035);
    float _1113 = _943 + (-0.5);
    float _1115 = _1047 * _1103;
    float _1117 = _1107 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_809)
    {
        _1091 = _737;
    }
    float _1119 = _1091;
    float _1121 = -_1109;
    float _1123 = -_907;
    float _1125 = fma(_1121, _1113, _1123);
    float _1127 = _963 * _1115;
    float _1129 = -_1047;
    float _1131 = _1129 + 1.0;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1135 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[83].z;
    if (!_809)
    {
        _1137 = _741;
    }
    float _1139 = _1137;
    float _1141 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1133);
    float _1143 = _1119 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1145 = _1111 * _1081;
    float _1147 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1149 = _1005 * _1147;
    float _1151 = rsqrt(_979);
    float _1153 = _1139;
    if (_809)
    {
        _1153 = _1093;
    }
    float _1155 = _1153;
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1159 = -_1135;
    float _1161 = fma(_1143, 2.0, _1159);
    float _1163 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1165 = _985 * _1163;
    float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1169 = -_1149;
    float _1171 = fma(_1003, _1167, _1169);
    float _1173 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1175 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1127);
    float _1177 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1157);
    float _1179 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1181 = _1003 * _1179;
    float _1183 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1185 = -_1165;
    float _1187 = fma(_1005, _1183, _1185);
    float _1189 = _1171 * _1171;
    float _1191 = -_1173;
    float _1193 = fma(_1117, 2.0, _1191);
    float _1195 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1197 = -_1181;
    float _1199 = fma(_985, _1195, _1197);
    float _1201 = fma(_1187, _1187, _1189);
    float _1203 = fma(2.0, _737, -1.0);
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_809)
    {
        _1073 = _1093;
    }
    float _1207 = _1073;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1211 = fma(_1199, _1199, _1201);
    float _1213 = _1151 * _1203;
    float _1215 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1205);
    float _1217 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1209);
    if (!_809)
    {
        _1097 = _737;
    }
    float _1219 = _1097;
    float _1221 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1223 = _773 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1225 = fma(_995, _1095, _1175);
    float _1227 = _853 + 0.5;
    float _1229 = -_105;
    float _1231 = fma(_1229, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1193);
    float _1233 = fma(_997, _1083, _1225);
    float _1235 = rsqrt(_1211);
    float _1237 = fma(_1223, _1227, _1231);
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1241 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1243 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1245 = _859 + 0.5;
    float _1247 = -_105;
    float _1249 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1161);
    float _1251 = fma(_1241, -2.0, _1239);
    float _1253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1255 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1257 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1259 = _1145 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _1261 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1215);
    float _1263 = fma(_1255, _1245, _1249);
    float _1265 = fma(_1243, -2.0, _1257);
    float _1267 = _825 * _1003;
    float _1269 = _1171 * _1235;
    float _1271 = _1199 * _1235;
    float _1273 = _1187 * _1235;
    float _1275 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1277 = _1003 * _1269;
    float _1279 = _825 * _985;
    float _1281 = _969 + (-0.5);
    float _1283 = fma(_837, _1273, _1267);
    float _1285 = -_1277;
    float _1287 = fma(_985, _1273, _1285);
    float _1289 = _985 * _1271;
    float _1291 = _825 * _1005;
    float _1293 = _1253 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1295 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1251);
    float _1297 = -_1289;
    float _1299 = fma(_1005, _1269, _1297);
    float _1301 = fma(_837, _1271, _1291);
    float _1303 = -_1261;
    float _1305 = _1303 + 1.0;
    float _1307 = -_1293;
    float _1309 = -_1295;
    float _1311 = fma(_1307, _1281, _1309);
    float _1313 = _1005 * _1273;
    float _1315 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1049);
    float _1317 = fma(_1275, _1287, _1301);
    float _1319 = _1213 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1321 = _1259 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1323 = _1259 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1325 = fma(_1275, _1299, _1283);
    float _1327 = _891 + _1317;
    float _1329 = fma(_1319, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1321);
    float _1331 = fma(_1319, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1323);
    float _1333 = _911 + _1325;
    float _1335 = -_1315;
    float _1337 = _1335 + 1.0;
    float _1339 = fma(_1329, 0.5, _1327);
    float _1341 = -_1305;
    float _1343 = fma(_815, _1341, _1007);
    float _1345 = fma(_1331, 0.5, _1333);
    float _1347 = fma(_943, _1337, _1125);
    float _1349 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1351 = _1339 + _1349;
    float _1353 = _945 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1355 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1357 = _1345 + _1355;
    float _1359 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1141);
    float _1361 = _1351 * _1351;
    float _1363 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1353);
    float _1365 = _945 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1367 = -_1359;
    float _1369 = _1367 + 1.0;
    float _1371 = fma(_1357, _1357, _1361);
    float _1373 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1363);
    float _1375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1377 = -_1369;
    float _1379 = fma(_859, _1377, _1263);
    float _1381 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1365);
    float _1383 = _1373 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1385 = fma(_837, _1269, _1279);
    float _1387 = -_1313;
    float _1389 = fma(_1003, _1271, _1387);
    float _1391 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1381);
    float _1393 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1177);
    float _1395 = sqrt(_1371);
    float _1397 = _1259 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1399 = fma(_1275, _1389, _1385);
    float _1401 = _1391 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1403 = -_1393;
    float _1405 = _1403 + 1.0;
    float _1407 = fma(_1319, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1397);
    float _1409 = _945 + _1399;
    float _1411 = _1401 + _1383;
    float _1413 = 1.0 / _1383;
    float _1415 = fma(_969, _1405, _1311);
    float _1417 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1217);
    float _1419 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1089);
    float _1421 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1265);
    float _1423 = fma(_1407, 0.5, _1409);
    float _1425 = _1375 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1427 = _1395 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1429 = _989 + (-0.5);
    out.m_46.x = _1343;
    out.m_46.y = _1347;
    out.m_46.z = _1379;
    out.m_46.w = _1415;
    float _1431 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1233);
    float _1433 = _1411 * _1413;
    float _1435 = _1433 * 0.5;
    float _1437 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1439 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1437);
    float _1441 = -_1425;
    float _1443 = -_1421;
    float _1445 = fma(_1441, _1429, _1443);
    float _1447 = _1379;
    float _1449 = _1345;
    float _1451 = _1339;
    float _1453 = _1415;
    float _1455 = _1343;
    if (!_1427)
    {
        _1447 = _1423;
    }
    float _1457 = _1447;
    bool _1459 = !_1427;
    float _1461 = _1457;
    if (!_1459)
    {
        float _1463 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1465 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1467 = _1395 + _1465;
        float _1469 = rsqrt(_1371);
        float _1471 = _1467 * _1463;
        float _1473 = _1423 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1475 = _1471 * 0.15915493667125701904296875;
        float _1477 = _1475 * 6.283185482025146484375;
        float _1479 = cos(_1477);
        float _1481 = _1475 * 6.283185482025146484375;
        float _1483 = sin(_1481);
        float _1485 = _1479 + (-1.0);
        float _1487 = _1485 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1489 = fma(_1483, _1473, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1491 = fma(_1423, _1479, _1487);
        float _1493 = _1469 * _1489;
        float _1495 = fma(_1357, _1493, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1497 = fma(_1351, _1493, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1449 = _1495;
        _1451 = _1497;
        _1461 = _1491;
        _1453 = _1493;
        _1455 = _1483;
    }
    float _1499 = _1449;
    float _1501 = _1451;
    float _1503 = _1461;
    float _1505 = _1453;
    float _1507 = _1455;
    float _1509 = _1505;
    float _1511 = _1507;
    float _1513 = _1503;
    if (_871)
    {
        _1509 = _1499;
    }
    float _1515 = _1509;
    float _1517 = _1515;
    if (_871)
    {
        _1511 = _1501;
    }
    float _1519 = _1511;
    float _1521 = _1519;
    if (!_871)
    {
        float _1523 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1525 = _945 + _1523;
        float _1527 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1529 = _911 + _1527;
        float _1531 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1533 = -_891;
        float _1535 = _1533 + _1501;
        float _1537 = _1525 * _1525;
        float _1539 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1541 = _891 + _1539;
        float _1543 = fma(_1529, _1529, _1537);
        float _1545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
        float _1547 = fma(_1541, _1541, _1543);
        float _1549 = sqrt(_1547);
        float _1551 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1553 = precise::max(_1549, (*spvDescriptorSet0.vp_c9)._m0[199].y);
        float _1555 = _1553 * _1545;
        float _1557 = -_911;
        float _1559 = _1557 + _1499;
        float _1561 = _1551 * _1555;
        float _1563 = -_945;
        float _1565 = _1563 + _1503;
        float _1567 = fma(_1559, _1561, _911);
        float _1569 = fma(_1565, _1561, _945);
        float _1571 = fma(_1535, _1561, _891);
        _1513 = _1569;
        _1517 = _1567;
        _1521 = _1571;
    }
    float _1573 = _1513;
    float _1575 = _1517;
    float _1577 = _1521;
    float _1579 = 1.0 / _1439;
    float _1581 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1583 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1585 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1587 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1589 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1581);
    float _1591 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1583);
    float _1593 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1585);
    float _1595 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1587);
    float _1597 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1589);
    float _1599 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1591);
    float _1601 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1593);
    float _1603 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1595);
    float _1605 = _1583;
    float _1607 = _1595;
    if (_883)
    {
        _1605 = 1.0;
    }
    float _1609 = _1605;
    float _1611 = _1597 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1613 = _1609;
    if (_883)
    {
        _1607 = 1.0;
    }
    float _1615 = _1607;
    float _1617 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1619 = _1579 * _1617;
    float _1621 = _1615;
    if (!_883)
    {
        float _1623 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1625 = _1623 * 0.15915493667125701904296875;
        float _1627 = _1625 * 6.283185482025146484375;
        float _1629 = cos(_1627);
        float _1631 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1633 = _1631 * 0.15915493667125701904296875;
        float _1635 = _1625 * 6.283185482025146484375;
        float _1637 = sin(_1635);
        float _1639 = 1.0 / _1629;
        float _1641 = _1633 * 6.283185482025146484375;
        float _1643 = cos(_1641);
        float _1645 = _1637 * _1639;
        float _1647 = _1633 * 6.283185482025146484375;
        float _1649 = sin(_1647);
        float _1651 = _1643 * _1645;
        float _1653 = 1.0 / _1651;
        float _1655 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1657 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1655;
        float _1659 = 1.0 / _1657;
        float _1661 = _1649 * _1653;
        float _1663 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1665 = fma(_1619, _1661, _1663);
        float _1667 = _1665 * _1659;
        float _1669 = precise::clamp(_1667, 0.0, 1.0);
        _1613 = _1669;
    }
    float _1671 = _1613;
    if (!_883)
    {
        float _1673 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1675 = _1673 * 0.15915493667125701904296875;
        float _1677 = _1675 * 6.283185482025146484375;
        float _1679 = cos(_1677);
        float _1681 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1683 = _1681 * 0.15915493667125701904296875;
        float _1685 = _1675 * 6.283185482025146484375;
        float _1687 = sin(_1685);
        float _1689 = 1.0 / _1679;
        float _1691 = _1683 * 6.283185482025146484375;
        float _1693 = cos(_1691);
        float _1695 = _1687 * _1689;
        float _1697 = _1683 * 6.283185482025146484375;
        float _1699 = sin(_1697);
        float _1701 = _1693 * _1695;
        float _1703 = 1.0 / _1701;
        float _1705 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1707 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1705;
        float _1709 = 1.0 / _1707;
        float _1711 = _1699 * _1703;
        float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1715 = fma(_1619, _1711, _1713);
        float _1717 = _1715 * _1709;
        float _1719 = precise::clamp(_1717, 0.0, 1.0);
        float _1721 = -_1719;
        float _1723 = _1721 + 1.0;
        _1621 = _1723;
    }
    float _1725 = _1621;
    float _1727 = _1599 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1729 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1731 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1733 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1735 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1737 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1729);
    float _1739 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1731);
    float _1741 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1733);
    float _1743 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1735);
    float _1745 = _1601 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1747 = _1671 > 0.0;
    bool _1749 = isnan(_1671);
    bool _1751 = _1747 || _1749;
    bool _1753 = isnan(0.0);
    bool _1755 = _1751 || _1753;
    float _1757 = _1671 * _1725;
    float _1759 = -_1419;
    float _1761 = _1759 + 1.0;
    float _1763 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1737);
    float _1765 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1739);
    float _1767 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1741);
    float _1769 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1743);
    float _1771 = fma(_989, _1761, _1445);
    bool _1773 = _1725 <= 0.0;
    bool _1775 = !_1755;
    bool _1777 = _1773 || _1775;
    float _1779 = _1603 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1781 = -_1417;
    float _1783 = _1781 + 1.0;
    float _1785 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1787 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1763);
    float _1789 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1765);
    float _1791 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1767);
    float _1793 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1769);
    float _1795 = -_1783;
    float _1797 = fma(_853, _1795, _1237);
    float _1799 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1801 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1803 = _1757 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1805 = _1787 + _1793;
    float _1807 = _1791 + _1793;
    float _1809 = _1793 * 0.5;
    float _1811 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1813 = _1799 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1815 = _1801 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1817 = _1431 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1819 = _1803 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1821 = _1805 * 0.5;
    float _1823 = _1807 * 0.5;
    float _1825 = fma(_1789, -0.5, _1809);
    out.m_48.x = _1811;
    out.m_48.y = _1813;
    out.m_48.z = _1815;
    out.m_48.w = _1817;
    out.m_50.x = _1797;
    out.m_50.y = _1771;
    out.m_33.x = _1819;
    out.gl_Position.x = _1787;
    out.gl_Position.y = _1789;
    out.gl_Position.z = _1791;
    out.gl_Position.w = _1793;
    out.m_52.x = _1821;
    out.m_52.y = _1825;
    out.m_52.z = _1823;
    out.m_52.w = _1793;
    if (!_1777)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1827 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1827;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _727 = false;
    bool _617 = false;
    bool _467 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _1884 = as_type<float>(_87);
        out.gl_Position.z = _1884;
    }
    if (!_75)
    {
        return out;
    }
    float _91 = in.m_35.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_101)
    {
        float _107 = float(_71);
        _81 = _107;
    }
    float _109 = _81;
    bool _111 = _105 >= _109;
    bool _113 = !_101;
    bool _115 = _111 || _113;
    float _117 = _109;
    if (_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    if (_115)
    {
        out.m_33.x = 0.0;
    }
    if (_115)
    {
        float _121 = _119 * 5.0;
        _89 = as_type<int>(_121);
    }
    int _123 = _89;
    float _125 = as_type<float>(_123);
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1955 = as_type<float>(_123);
        out.gl_Position.z = _1955;
    }
    if (_115)
    {
        return out;
    }
    float _127 = as_type<float>(int(gl_VertexIndex));
    float _129 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _131 = in.m_35.x;
    float _133 = in.m_35.y;
    float _135 = in.m_35.z;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = _129;
    if (!_145)
    {
        float _149 = _129 * _129;
        float _151 = _149 * 0.5;
        _125 = _151;
    }
    float _153 = _125;
    float _155 = 0.0;
    float _157 = _153;
    if (!_145)
    {
        float _159 = _105 * _105;
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
    int _169 = as_type<int>(_127) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_127) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_145;
    float _187 = _127;
    float _189 = _167;
    float _191 = 0.0;
    if (!_185)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _129 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _129);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _211;
        _189 = _221;
        _191 = _209;
    }
    float _223 = _187;
    float _225 = _189;
    float _227 = _191;
    bool _229 = !_145;
    float _231 = _223;
    float _233 = _227;
    if (!_229)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _129 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _231 = _247;
        _233 = _241;
        _147 = _253;
    }
    float _255 = _231;
    float _257 = _233;
    float _259 = _147;
    float _261 = _257;
    float _263 = _255;
    if (!_145)
    {
        _261 = _105;
    }
    float _265 = _261;
    float _267 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _269 = _265;
    if (!_145)
    {
        float _271 = _163 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _263 = _271;
    }
    float _273 = _263;
    bool _275 = !_145;
    float _277 = _273;
    if (!_275)
    {
        float _279 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _281 = log2(_279);
        float _283 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _285 = _283 + 1.0;
        float _287 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _289 = _105 * _281;
        float _291 = 1.0 / _285;
        float _293 = _287 * 0.693147182464599609375;
        float _295 = exp2(_289);
        float _297 = 1.0 / _293;
        float _299 = _295 + (-1.0);
        float _301 = -_299;
        float _303 = fma(_301, _297, _105);
        float _305 = _303 * _291;
        float _307 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _307;
    }
    float _309 = _277;
    bool _311 = !_145;
    if (!_311)
    {
        float _313 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _315 = log2(_313);
        float _317 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _319 = _317 + 1.0;
        float _321 = 1.0 / _319;
        float _323 = _105 * _315;
        float _325 = exp2(_323);
        float _327 = -_325;
        float _329 = _327 + 1.0;
        float _331 = _329 * _321;
        _269 = _331;
    }
    float _333 = _269;
    float _335 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _337 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = fma(_259, _133, _267);
    float _341 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _343 = fma(_333, _133, _335);
    float _345 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _347 = fma(_259, _131, _337);
    float _349 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _351 = fma(_333, _131, _341);
    float _353 = -_343;
    float _355 = _339 + _353;
    float _357 = fma(_259, _135, _345);
    float _359 = fma(_333, _135, _349);
    float _361 = -_351;
    float _363 = _347 + _361;
    float _365 = _355 * _355;
    float _367 = in.m_40.w;
    float _369 = -_359;
    float _371 = _357 + _369;
    float _373 = _355 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _375 = fma(_363, _363, _365);
    float _377 = in.m_30.x;
    float _379 = in.m_30.y;
    float _381 = in.m_30.z;
    float _383 = _355 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _385 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].x, _373);
    float _387 = fma(_371, _371, _375);
    float _389 = _355 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _391 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].x, _383);
    float _393 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].z, _385);
    float _395 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].x, _389);
    float _397 = sqrt(_387);
    float _399 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].z, _391);
    float _401 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].z, _395);
    float _403 = fma(_339, _367, _379);
    bool _405 = _397 >= 9.9999999747524270787835121154785e-07;
    bool _407 = isnan(_397);
    bool _409 = _405 || _407;
    bool _411 = isnan(9.9999999747524270787835121154785e-07);
    bool _413 = _409 || _411;
    float _415 = fma(_347, _367, _377);
    float _417 = fma(_357, _367, _381);
    float _419 = _339;
    float _421 = _393;
    float _423 = _399;
    if (_413)
    {
        _419 = _401;
    }
    float _425 = _419;
    float _427 = _425;
    if (!_413)
    {
        bool _429 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _431 = !_429;
        if (!_431)
        {
            float _433 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _435 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _437 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _439 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _433);
            float _441 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _435);
            float _443 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _437);
            float _445 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _439);
            float _447 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _441);
            float _449 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _443);
            float _451 = _445 * _445;
            float _453 = fma(_447, _447, _451);
            float _455 = fma(_449, _449, _453);
            float _457 = rsqrt(_455);
            float _459 = _457 * 9.9999999747524270787835121154785e-07;
            float _461 = _447 * _459;
            float _463 = _445 * _459;
            float _465 = _449 * _459;
            _421 = _463;
            _427 = _461;
            _423 = _465;
            _467 = true;
        }
        else
        {
            float _469 = _133 * _133;
            float _471 = fma(_131, _131, _469);
            float _473 = fma(_135, _135, _471);
            float _475 = sqrt(_473);
            bool _477 = _475 >= 9.9999999747524270787835121154785e-07;
            bool _479 = isnan(_475);
            bool _481 = _477 || _479;
            bool _483 = isnan(9.9999999747524270787835121154785e-07);
            bool _485 = _481 || _483;
            if (!_485)
            {
                float _487 = _379 * _379;
                float _489 = fma(_377, _377, _487);
                float _491 = fma(_381, _381, _489);
                float _493 = sqrt(_491);
                bool _495 = _493 >= 9.9999999747524270787835121154785e-07;
                bool _497 = isnan(_493);
                bool _499 = _495 || _497;
                bool _501 = isnan(9.9999999747524270787835121154785e-07);
                bool _503 = _499 || _501;
                if (!_503)
                {
                    float _505 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _507 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _505);
                    float _509 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _507);
                    float _511 = rsqrt(_509);
                    float _513 = _511 * 9.9999999747524270787835121154785e-07;
                    float _515 = _513 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _517 = _513 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _519 = _513 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _421 = _517;
                    _427 = _515;
                    _423 = _519;
                    _467 = true;
                }
                else
                {
                    float _521 = _379 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _523 = _379 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _525 = _379 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _527 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].x, _521);
                    float _529 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].x, _523);
                    float _531 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].x, _525);
                    float _533 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].z, _527);
                    float _535 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].z, _529);
                    float _537 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].z, _531);
                    float _539 = _533 * _533;
                    float _541 = fma(_535, _535, _539);
                    float _543 = fma(_537, _537, _541);
                    float _545 = rsqrt(_543);
                    float _547 = _545 * 9.9999999747524270787835121154785e-07;
                    float _549 = _535 * _547;
                    float _551 = _533 * _547;
                    float _553 = _537 * _547;
                    _421 = _551;
                    _427 = _549;
                    _423 = _553;
                    _467 = true;
                }
            }
            else
            {
                float _555 = _133 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _557 = _133 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _559 = _133 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _561 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[5].x, _555);
                float _563 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[4].x, _557);
                float _565 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[6].x, _559);
                float _567 = fma(_135, (*spvDescriptorSet0.vp_c10)._m0[5].z, _561);
                float _569 = fma(_135, (*spvDescriptorSet0.vp_c10)._m0[4].z, _563);
                float _571 = fma(_135, (*spvDescriptorSet0.vp_c10)._m0[6].z, _565);
                float _573 = _567 * _567;
                float _575 = fma(_569, _569, _573);
                float _577 = fma(_571, _571, _575);
                float _579 = rsqrt(_577);
                float _581 = _579 * 9.9999999747524270787835121154785e-07;
                float _583 = _569 * _581;
                float _585 = _567 * _581;
                float _587 = _571 * _581;
                _421 = _585;
                _427 = _583;
                _423 = _587;
            }
        }
    }
    _467 = false;
    float _589 = _421;
    float _591 = _427;
    float _593 = _423;
    bool _595 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _597 = !_595;
    float _615;
    if (!_597)
    {
        float _599 = in.m_42.x;
        float _601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _603 = _599 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _605 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _607 = _605 * _601;
        float _609 = floor(_607);
        float _611 = -_609;
        float _613 = _607 + _611;
        _615 = _613;
        _617 = true;
    }
    else
    {
        float _619 = float(_71);
        float _621 = 1.0 / _619;
        float _623 = _105 * _621;
        _615 = _623;
    }
    _617 = false;
    float _625 = _615;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _629 = _625 + _627;
    float _631 = in.m_40.x;
    float _633 = in.m_40.y;
    bool _635 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _637 = isnan(_625);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _647;
    bool _651 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _653 = isnan(_625);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = -_645;
    float _665 = _663 + 1.0;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _667;
    float _671 = 1.0 / _649;
    bool _673 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _675 = _661 * _665;
    float _677 = -_661;
    float _679 = _677 + 1.0;
    float _681 = _629 * _671;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _683;
    float _687 = fma(_669, _681, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _689 = fma(_685, _681, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _691 = _687 * _675;
    float _693 = _689 * _675;
    float _695 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[143].x, _691);
    float _697 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[143].y, _693);
    float _699 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[144].x, _695);
    float _701 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[144].y, _697);
    float _703 = _699 * _631;
    float _705 = _701 * _633;
    bool _707 = !_673;
    float _725;
    if (!_707)
    {
        float _709 = in.m_42.x;
        float _711 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _713 = _709 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _715 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _717 = _715 * _711;
        float _719 = floor(_717);
        float _721 = -_719;
        float _723 = _717 + _721;
        _725 = _723;
        _727 = true;
    }
    else
    {
        float _729 = float(_71);
        float _731 = 1.0 / _729;
        float _733 = _105 * _731;
        _725 = _733;
    }
    _727 = false;
    float _735 = _725;
    float _737 = in.m_42.x;
    float _739 = in.m_42.y;
    float _741 = in.m_42.z;
    float _743 = in.m_42.w;
    float _745 = _403 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _751 = _749 != 0;
    float _753 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].x, _745);
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _757 = _755 != 0;
    float _759 = _705 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _763 = _761 != 0;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _767 = _765 != 0;
    float _769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _777 = (*spvDescriptorSet0.vp_c10)._m0[9].x * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    bool _779 = _737 > 0.5;
    bool _781 = _743 > 0.5;
    float _783 = _403 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _785 = -_179;
    int _787 = _779 ? as_type<int>(_785) : as_type<int>(_179);
    float _789 = fma((*spvDescriptorSet0.vp_c10)._m0[8].x, (*spvDescriptorSet0.vp_c10)._m0[8].x, _777);
    float _791 = -_183;
    int _793 = _781 ? as_type<int>(_791) : as_type<int>(_183);
    float _795 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].x, _783);
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _799 = _797 != 0;
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _803 = _801 != 0;
    float _805 = _403 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _809 = _807 != 0;
    float _811 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    bool _813 = !_751;
    float _815 = _813 ? _179 : as_type<float>(_787);
    float _817 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].x, _805);
    bool _819 = _739 > 0.5;
    float _821 = _703 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _823 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _825 = _759 * _811;
    float _827 = -_183;
    int _829 = _819 ? as_type<int>(_827) : as_type<int>(_183);
    float _831 = _589 * _589;
    float _833 = -_179;
    int _835 = _819 ? as_type<int>(_833) : as_type<int>(_179);
    float _837 = _821 * _823;
    bool _839 = _741 > 0.5;
    float _841 = fma(_591, _591, _831);
    float _843 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].z, _795);
    float _845 = -_179;
    int _847 = _839 ? as_type<int>(_845) : as_type<int>(_179);
    float _849 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].z, _817);
    bool _851 = !_799;
    float _853 = _851 ? _179 : as_type<float>(_835);
    float _855 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].z, _753);
    bool _857 = !_767;
    float _859 = _857 ? _179 : as_type<float>(_847);
    float _861 = _737 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _863 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _865 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _867 = _863 || _865;
    bool _869 = isnan(0.5);
    bool _871 = _867 || _869;
    float _873 = _739 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _875 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _877 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _879 = _875 || _877;
    bool _881 = isnan(0.5);
    bool _883 = _879 || _881;
    float _885 = -_771;
    float _887 = fma(_861, 2.0, _885);
    float _889 = fma(_873, -2.0, _775);
    float _891 = _855 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _901 = 1.0 / _895;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _905 = _903 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _907 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _889);
    float _909 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _911 = _843 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _913 = 1.0 / _899;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _921 = fma(_593, _593, _841);
    float _923 = _915 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _925;
    float _929 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].z, _909);
    float _931 = 1.0 / _905;
    float _933 = _917 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _935 = _919 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _939 = _735 + _937;
    bool _941 = !_757;
    float _943 = _941 ? _183 : as_type<float>(_829);
    float _945 = _849 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    out.m_44.x = _923;
    out.m_44.y = _933;
    out.m_44.z = _935;
    float _947 = rsqrt(_921);
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _949;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _957 = _951 * _901;
    float _959 = _955 * _913;
    float _961 = _927 * _931;
    float _963 = fma(_957, _939, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _967 = !_763;
    float _969 = _967 ? _183 : as_type<float>(_793);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _973 = _735 + _971;
    float _975 = -_183;
    int _977 = _839 ? as_type<int>(_975) : as_type<int>(_183);
    float _979 = fma((*spvDescriptorSet0.vp_c10)._m0[10].x, (*spvDescriptorSet0.vp_c10)._m0[10].x, _789);
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _983 = _735 + _981;
    float _985 = _947 * _589;
    bool _987 = !_803;
    float _989 = _987 ? _183 : as_type<float>(_977);
    float _991 = -_105;
    float _993 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[76].x, _887);
    float _995 = fma(_959, _983, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _997 = fma(_961, _973, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _999 = _747 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1001 = _815 + 0.5;
    float _1003 = _947 * _591;
    float _1005 = _947 * _593;
    float _1007 = fma(_999, _1001, _993);
    bool _1009 = _735 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1011 = isnan(_735);
    bool _1013 = _1009 || _1011;
    bool _1015 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1017 = _1013 || _1015;
    float _1019 = float(_1017);
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1023 = _735 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1025 = isnan(_735);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1031 = _1027 || _1029;
    float _1033 = float(_1031);
    float _1035 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].z, _929);
    bool _1037 = _735 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1039 = isnan(_735);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1045 = _1041 || _1043;
    float _1047 = float(_1045);
    float _1049 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1021);
    bool _1051 = _735 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1053 = isnan(_735);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1059 = _1055 || _1057;
    float _1061 = float(_1059);
    float _1063 = -_1019;
    float _1065 = _1063 + 1.0;
    float _1067 = _1001;
    float _1069 = _931;
    float _1071 = _739;
    float _1073 = _741;
    if (!_809)
    {
        _1067 = _739;
    }
    float _1075 = _1067;
    float _1077 = -_1033;
    float _1079 = _1077 + 1.0;
    float _1081 = fma(_739, 2.0, -1.0);
    float _1083 = _1033 * _1065;
    float _1085 = _1075;
    if (!_809)
    {
        _1069 = _1075;
    }
    float _1087 = _1069;
    float _1089 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[88].w, _965);
    float _1091 = _1087;
    if (_809)
    {
        _1085 = _739;
    }
    float _1093 = _1085;
    float _1095 = _1061 * _1079;
    float _1097 = _1093;
    if (_809)
    {
        _1071 = _737;
    }
    float _1099 = _1071;
    float _1101 = -_1061;
    float _1103 = _1101 + 1.0;
    float _1105 = _1099;
    if (!_809)
    {
        _1105 = _741;
    }
    float _1107 = _1105;
    float _1109 = _769 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1111 = rsqrt(_1035);
    float _1113 = _943 + (-0.5);
    float _1115 = _1047 * _1103;
    float _1117 = _1107 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_809)
    {
        _1091 = _737;
    }
    float _1119 = _1091;
    float _1121 = -_1109;
    float _1123 = -_907;
    float _1125 = fma(_1121, _1113, _1123);
    float _1127 = _963 * _1115;
    float _1129 = -_1047;
    float _1131 = _1129 + 1.0;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1135 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[83].z;
    if (!_809)
    {
        _1137 = _741;
    }
    float _1139 = _1137;
    float _1141 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1133);
    float _1143 = _1119 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1145 = _1111 * _1081;
    float _1147 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1149 = _1005 * _1147;
    float _1151 = rsqrt(_979);
    float _1153 = _1139;
    if (_809)
    {
        _1153 = _1093;
    }
    float _1155 = _1153;
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1159 = -_1135;
    float _1161 = fma(_1143, 2.0, _1159);
    float _1163 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1165 = _985 * _1163;
    float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1169 = -_1149;
    float _1171 = fma(_1003, _1167, _1169);
    float _1173 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1175 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1127);
    float _1177 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1157);
    float _1179 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1181 = _1003 * _1179;
    float _1183 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1185 = -_1165;
    float _1187 = fma(_1005, _1183, _1185);
    float _1189 = _1171 * _1171;
    float _1191 = -_1173;
    float _1193 = fma(_1117, 2.0, _1191);
    float _1195 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1197 = -_1181;
    float _1199 = fma(_985, _1195, _1197);
    float _1201 = fma(_1187, _1187, _1189);
    float _1203 = fma(2.0, _737, -1.0);
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_809)
    {
        _1073 = _1093;
    }
    float _1207 = _1073;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1211 = fma(_1199, _1199, _1201);
    float _1213 = _1151 * _1203;
    float _1215 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1205);
    float _1217 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1209);
    if (!_809)
    {
        _1097 = _737;
    }
    float _1219 = _1097;
    float _1221 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1223 = _773 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1225 = fma(_995, _1095, _1175);
    float _1227 = _853 + 0.5;
    float _1229 = -_105;
    float _1231 = fma(_1229, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1193);
    float _1233 = fma(_997, _1083, _1225);
    float _1235 = rsqrt(_1211);
    float _1237 = fma(_1223, _1227, _1231);
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1241 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1243 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1245 = _859 + 0.5;
    float _1247 = -_105;
    float _1249 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1161);
    float _1251 = fma(_1241, -2.0, _1239);
    float _1253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1255 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1257 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1259 = _1145 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _1261 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1215);
    float _1263 = fma(_1255, _1245, _1249);
    float _1265 = fma(_1243, -2.0, _1257);
    float _1267 = _825 * _1003;
    float _1269 = _1171 * _1235;
    float _1271 = _1199 * _1235;
    float _1273 = _1187 * _1235;
    float _1275 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1277 = _1003 * _1269;
    float _1279 = _825 * _985;
    float _1281 = _969 + (-0.5);
    float _1283 = fma(_837, _1273, _1267);
    float _1285 = -_1277;
    float _1287 = fma(_985, _1273, _1285);
    float _1289 = _985 * _1271;
    float _1291 = _825 * _1005;
    float _1293 = _1253 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1295 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1251);
    float _1297 = -_1289;
    float _1299 = fma(_1005, _1269, _1297);
    float _1301 = fma(_837, _1271, _1291);
    float _1303 = -_1261;
    float _1305 = _1303 + 1.0;
    float _1307 = -_1293;
    float _1309 = -_1295;
    float _1311 = fma(_1307, _1281, _1309);
    float _1313 = _1005 * _1273;
    float _1315 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1049);
    float _1317 = fma(_1275, _1287, _1301);
    float _1319 = _1213 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1321 = _1259 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1323 = _1259 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1325 = fma(_1275, _1299, _1283);
    float _1327 = _891 + _1317;
    float _1329 = fma(_1319, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1321);
    float _1331 = fma(_1319, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1323);
    float _1333 = _911 + _1325;
    float _1335 = -_1315;
    float _1337 = _1335 + 1.0;
    float _1339 = fma(_1329, 0.5, _1327);
    float _1341 = -_1305;
    float _1343 = fma(_815, _1341, _1007);
    float _1345 = fma(_1331, 0.5, _1333);
    float _1347 = fma(_943, _1337, _1125);
    float _1349 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1351 = _1339 + _1349;
    float _1353 = _945 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1355 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1357 = _1345 + _1355;
    float _1359 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1141);
    float _1361 = _1351 * _1351;
    float _1363 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1353);
    float _1365 = _945 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1367 = -_1359;
    float _1369 = _1367 + 1.0;
    float _1371 = fma(_1357, _1357, _1361);
    float _1373 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1363);
    float _1375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1377 = -_1369;
    float _1379 = fma(_859, _1377, _1263);
    float _1381 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1365);
    float _1383 = _1373 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1385 = fma(_837, _1269, _1279);
    float _1387 = -_1313;
    float _1389 = fma(_1003, _1271, _1387);
    float _1391 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1381);
    float _1393 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1177);
    float _1395 = sqrt(_1371);
    float _1397 = _1259 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1399 = fma(_1275, _1389, _1385);
    float _1401 = _1391 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1403 = -_1393;
    float _1405 = _1403 + 1.0;
    float _1407 = fma(_1319, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1397);
    float _1409 = _945 + _1399;
    float _1411 = _1401 + _1383;
    float _1413 = 1.0 / _1383;
    float _1415 = fma(_969, _1405, _1311);
    float _1417 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1217);
    float _1419 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1089);
    float _1421 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1265);
    float _1423 = fma(_1407, 0.5, _1409);
    float _1425 = _1375 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1427 = _1395 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1429 = _989 + (-0.5);
    out.m_46.x = _1343;
    out.m_46.y = _1347;
    out.m_46.z = _1379;
    out.m_46.w = _1415;
    float _1431 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1233);
    float _1433 = _1411 * _1413;
    float _1435 = _1433 * 0.5;
    float _1437 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1439 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1437);
    float _1441 = -_1425;
    float _1443 = -_1421;
    float _1445 = fma(_1441, _1429, _1443);
    float _1447 = _1379;
    float _1449 = _1345;
    float _1451 = _1339;
    float _1453 = _1415;
    float _1455 = _1343;
    if (!_1427)
    {
        _1447 = _1423;
    }
    float _1457 = _1447;
    bool _1459 = !_1427;
    float _1461 = _1457;
    if (!_1459)
    {
        float _1463 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1465 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1467 = _1395 + _1465;
        float _1469 = rsqrt(_1371);
        float _1471 = _1467 * _1463;
        float _1473 = _1423 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1475 = _1471 * 0.15915493667125701904296875;
        float _1477 = _1475 * 6.283185482025146484375;
        float _1479 = cos(_1477);
        float _1481 = _1475 * 6.283185482025146484375;
        float _1483 = sin(_1481);
        float _1485 = _1479 + (-1.0);
        float _1487 = _1485 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1489 = fma(_1483, _1473, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1491 = fma(_1423, _1479, _1487);
        float _1493 = _1469 * _1489;
        float _1495 = fma(_1357, _1493, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1497 = fma(_1351, _1493, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1449 = _1495;
        _1451 = _1497;
        _1461 = _1491;
        _1453 = _1493;
        _1455 = _1483;
    }
    float _1499 = _1449;
    float _1501 = _1451;
    float _1503 = _1461;
    float _1505 = _1453;
    float _1507 = _1455;
    float _1509 = _1505;
    float _1511 = _1507;
    float _1513 = _1503;
    if (_871)
    {
        _1509 = _1499;
    }
    float _1515 = _1509;
    float _1517 = _1515;
    if (_871)
    {
        _1511 = _1501;
    }
    float _1519 = _1511;
    float _1521 = _1519;
    if (!_871)
    {
        float _1523 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1525 = _945 + _1523;
        float _1527 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1529 = _911 + _1527;
        float _1531 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1533 = -_891;
        float _1535 = _1533 + _1501;
        float _1537 = _1525 * _1525;
        float _1539 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1541 = _891 + _1539;
        float _1543 = fma(_1529, _1529, _1537);
        float _1545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
        float _1547 = fma(_1541, _1541, _1543);
        float _1549 = sqrt(_1547);
        float _1551 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1553 = precise::max(_1549, (*spvDescriptorSet0.vp_c9)._m0[199].y);
        float _1555 = _1553 * _1545;
        float _1557 = -_911;
        float _1559 = _1557 + _1499;
        float _1561 = _1551 * _1555;
        float _1563 = -_945;
        float _1565 = _1563 + _1503;
        float _1567 = fma(_1559, _1561, _911);
        float _1569 = fma(_1565, _1561, _945);
        float _1571 = fma(_1535, _1561, _891);
        _1513 = _1569;
        _1517 = _1567;
        _1521 = _1571;
    }
    float _1573 = _1513;
    float _1575 = _1517;
    float _1577 = _1521;
    float _1579 = 1.0 / _1439;
    float _1581 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1583 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1585 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1587 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1589 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1581);
    float _1591 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1583);
    float _1593 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1585);
    float _1595 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1587);
    float _1597 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1589);
    float _1599 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1591);
    float _1601 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1593);
    float _1603 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1595);
    float _1605 = _1583;
    float _1607 = _1595;
    if (_883)
    {
        _1605 = 1.0;
    }
    float _1609 = _1605;
    float _1611 = _1597 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1613 = _1609;
    if (_883)
    {
        _1607 = 1.0;
    }
    float _1615 = _1607;
    float _1617 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1619 = _1579 * _1617;
    float _1621 = _1615;
    if (!_883)
    {
        float _1623 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1625 = _1623 * 0.15915493667125701904296875;
        float _1627 = _1625 * 6.283185482025146484375;
        float _1629 = cos(_1627);
        float _1631 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1633 = _1631 * 0.15915493667125701904296875;
        float _1635 = _1625 * 6.283185482025146484375;
        float _1637 = sin(_1635);
        float _1639 = 1.0 / _1629;
        float _1641 = _1633 * 6.283185482025146484375;
        float _1643 = cos(_1641);
        float _1645 = _1637 * _1639;
        float _1647 = _1633 * 6.283185482025146484375;
        float _1649 = sin(_1647);
        float _1651 = _1643 * _1645;
        float _1653 = 1.0 / _1651;
        float _1655 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1657 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1655;
        float _1659 = 1.0 / _1657;
        float _1661 = _1649 * _1653;
        float _1663 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1665 = fma(_1619, _1661, _1663);
        float _1667 = _1665 * _1659;
        float _1669 = precise::clamp(_1667, 0.0, 1.0);
        _1613 = _1669;
    }
    float _1671 = _1613;
    if (!_883)
    {
        float _1673 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1675 = _1673 * 0.15915493667125701904296875;
        float _1677 = _1675 * 6.283185482025146484375;
        float _1679 = cos(_1677);
        float _1681 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1683 = _1681 * 0.15915493667125701904296875;
        float _1685 = _1675 * 6.283185482025146484375;
        float _1687 = sin(_1685);
        float _1689 = 1.0 / _1679;
        float _1691 = _1683 * 6.283185482025146484375;
        float _1693 = cos(_1691);
        float _1695 = _1687 * _1689;
        float _1697 = _1683 * 6.283185482025146484375;
        float _1699 = sin(_1697);
        float _1701 = _1693 * _1695;
        float _1703 = 1.0 / _1701;
        float _1705 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1707 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1705;
        float _1709 = 1.0 / _1707;
        float _1711 = _1699 * _1703;
        float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1715 = fma(_1619, _1711, _1713);
        float _1717 = _1715 * _1709;
        float _1719 = precise::clamp(_1717, 0.0, 1.0);
        float _1721 = -_1719;
        float _1723 = _1721 + 1.0;
        _1621 = _1723;
    }
    float _1725 = _1621;
    float _1727 = _1599 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1729 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1731 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1733 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1735 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1737 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1729);
    float _1739 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1731);
    float _1741 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1733);
    float _1743 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1735);
    float _1745 = _1601 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1747 = _1671 > 0.0;
    bool _1749 = isnan(_1671);
    bool _1751 = _1747 || _1749;
    bool _1753 = isnan(0.0);
    bool _1755 = _1751 || _1753;
    float _1757 = _1671 * _1725;
    float _1759 = -_1419;
    float _1761 = _1759 + 1.0;
    float _1763 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1737);
    float _1765 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1739);
    float _1767 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1741);
    float _1769 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1743);
    float _1771 = fma(_989, _1761, _1445);
    bool _1773 = _1725 <= 0.0;
    bool _1775 = !_1755;
    bool _1777 = _1773 || _1775;
    float _1779 = _1603 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1781 = -_1417;
    float _1783 = _1781 + 1.0;
    float _1785 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1787 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1763);
    float _1789 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1765);
    float _1791 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1767);
    float _1793 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1769);
    float _1795 = -_1783;
    float _1797 = fma(_853, _1795, _1237);
    float _1799 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1801 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1803 = _1757 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1805 = _1787 + _1793;
    float _1807 = _1791 + _1793;
    float _1809 = _1793 * 0.5;
    float _1811 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1813 = _1799 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1815 = _1801 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1817 = _1431 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1819 = _1803 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1821 = _1805 * 0.5;
    float _1823 = _1807 * 0.5;
    float _1825 = fma(_1789, -0.5, _1809);
    out.m_48.x = _1811;
    out.m_48.y = _1813;
    out.m_48.z = _1815;
    out.m_48.w = _1817;
    out.m_50.x = _1797;
    out.m_50.y = _1771;
    out.m_33.x = _1819;
    out.gl_Position.x = _1787;
    out.gl_Position.y = _1789;
    out.gl_Position.z = _1791;
    out.gl_Position.w = _1793;
    out.m_52.x = _1821;
    out.m_52.y = _1825;
    out.m_52.z = _1823;
    out.m_52.w = _1793;
    if (!_1777)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1827 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1827;
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
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _727 = false;
    bool _617 = false;
    bool _467 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _1884 = as_type<float>(_87);
        out.gl_Position.z = _1884;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _91 = in.m_35.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_101)
    {
        float _107 = float(_71);
        _81 = _107;
    }
    float _109 = _81;
    bool _111 = _105 >= _109;
    bool _113 = !_101;
    bool _115 = _111 || _113;
    float _117 = _109;
    if (_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    if (_115)
    {
        out.m_33.x = 0.0;
    }
    if (_115)
    {
        float _121 = _119 * 5.0;
        _89 = as_type<int>(_121);
    }
    int _123 = _89;
    float _125 = as_type<float>(_123);
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1955 = as_type<float>(_123);
        out.gl_Position.z = _1955;
    }
    if (_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = as_type<float>(int(gl_VertexIndex));
    float _129 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _131 = in.m_35.x;
    float _133 = in.m_35.y;
    float _135 = in.m_35.z;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = _129;
    if (!_145)
    {
        float _149 = _129 * _129;
        float _151 = _149 * 0.5;
        _125 = _151;
    }
    float _153 = _125;
    float _155 = 0.0;
    float _157 = _153;
    if (!_145)
    {
        float _159 = _105 * _105;
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
    int _169 = as_type<int>(_127) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_127) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_145;
    float _187 = _127;
    float _189 = _167;
    float _191 = 0.0;
    if (!_185)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _129 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _129);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _211;
        _189 = _221;
        _191 = _209;
    }
    float _223 = _187;
    float _225 = _189;
    float _227 = _191;
    bool _229 = !_145;
    float _231 = _223;
    float _233 = _227;
    if (!_229)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _129 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _231 = _247;
        _233 = _241;
        _147 = _253;
    }
    float _255 = _231;
    float _257 = _233;
    float _259 = _147;
    float _261 = _257;
    float _263 = _255;
    if (!_145)
    {
        _261 = _105;
    }
    float _265 = _261;
    float _267 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _269 = _265;
    if (!_145)
    {
        float _271 = _163 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _263 = _271;
    }
    float _273 = _263;
    bool _275 = !_145;
    float _277 = _273;
    if (!_275)
    {
        float _279 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _281 = log2(_279);
        float _283 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _285 = _283 + 1.0;
        float _287 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _289 = _105 * _281;
        float _291 = 1.0 / _285;
        float _293 = _287 * 0.693147182464599609375;
        float _295 = exp2(_289);
        float _297 = 1.0 / _293;
        float _299 = _295 + (-1.0);
        float _301 = -_299;
        float _303 = fma(_301, _297, _105);
        float _305 = _303 * _291;
        float _307 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _307;
    }
    float _309 = _277;
    bool _311 = !_145;
    if (!_311)
    {
        float _313 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _315 = log2(_313);
        float _317 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _319 = _317 + 1.0;
        float _321 = 1.0 / _319;
        float _323 = _105 * _315;
        float _325 = exp2(_323);
        float _327 = -_325;
        float _329 = _327 + 1.0;
        float _331 = _329 * _321;
        _269 = _331;
    }
    float _333 = _269;
    float _335 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _337 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = fma(_259, _133, _267);
    float _341 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _343 = fma(_333, _133, _335);
    float _345 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _347 = fma(_259, _131, _337);
    float _349 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _351 = fma(_333, _131, _341);
    float _353 = -_343;
    float _355 = _339 + _353;
    float _357 = fma(_259, _135, _345);
    float _359 = fma(_333, _135, _349);
    float _361 = -_351;
    float _363 = _347 + _361;
    float _365 = _355 * _355;
    float _367 = in.m_40.w;
    float _369 = -_359;
    float _371 = _357 + _369;
    float _373 = _355 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _375 = fma(_363, _363, _365);
    float _377 = in.m_30.x;
    float _379 = in.m_30.y;
    float _381 = in.m_30.z;
    float _383 = _355 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _385 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].x, _373);
    float _387 = fma(_371, _371, _375);
    float _389 = _355 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _391 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].x, _383);
    float _393 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].z, _385);
    float _395 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].x, _389);
    float _397 = sqrt(_387);
    float _399 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].z, _391);
    float _401 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].z, _395);
    float _403 = fma(_339, _367, _379);
    bool _405 = _397 >= 9.9999999747524270787835121154785e-07;
    bool _407 = isnan(_397);
    bool _409 = _405 || _407;
    bool _411 = isnan(9.9999999747524270787835121154785e-07);
    bool _413 = _409 || _411;
    float _415 = fma(_347, _367, _377);
    float _417 = fma(_357, _367, _381);
    float _419 = _339;
    float _421 = _393;
    float _423 = _399;
    if (_413)
    {
        _419 = _401;
    }
    float _425 = _419;
    float _427 = _425;
    if (!_413)
    {
        bool _429 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _431 = !_429;
        if (!_431)
        {
            float _433 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _435 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _437 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _439 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _433);
            float _441 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _435);
            float _443 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _437);
            float _445 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _439);
            float _447 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _441);
            float _449 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _443);
            float _451 = _445 * _445;
            float _453 = fma(_447, _447, _451);
            float _455 = fma(_449, _449, _453);
            float _457 = rsqrt(_455);
            float _459 = _457 * 9.9999999747524270787835121154785e-07;
            float _461 = _447 * _459;
            float _463 = _445 * _459;
            float _465 = _449 * _459;
            _421 = _463;
            _427 = _461;
            _423 = _465;
            _467 = true;
        }
        else
        {
            float _469 = _133 * _133;
            float _471 = fma(_131, _131, _469);
            float _473 = fma(_135, _135, _471);
            float _475 = sqrt(_473);
            bool _477 = _475 >= 9.9999999747524270787835121154785e-07;
            bool _479 = isnan(_475);
            bool _481 = _477 || _479;
            bool _483 = isnan(9.9999999747524270787835121154785e-07);
            bool _485 = _481 || _483;
            if (!_485)
            {
                float _487 = _379 * _379;
                float _489 = fma(_377, _377, _487);
                float _491 = fma(_381, _381, _489);
                float _493 = sqrt(_491);
                bool _495 = _493 >= 9.9999999747524270787835121154785e-07;
                bool _497 = isnan(_493);
                bool _499 = _495 || _497;
                bool _501 = isnan(9.9999999747524270787835121154785e-07);
                bool _503 = _499 || _501;
                if (!_503)
                {
                    float _505 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _507 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _505);
                    float _509 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _507);
                    float _511 = rsqrt(_509);
                    float _513 = _511 * 9.9999999747524270787835121154785e-07;
                    float _515 = _513 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _517 = _513 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _519 = _513 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _421 = _517;
                    _427 = _515;
                    _423 = _519;
                    _467 = true;
                }
                else
                {
                    float _521 = _379 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _523 = _379 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _525 = _379 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _527 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].x, _521);
                    float _529 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].x, _523);
                    float _531 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].x, _525);
                    float _533 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].z, _527);
                    float _535 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].z, _529);
                    float _537 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].z, _531);
                    float _539 = _533 * _533;
                    float _541 = fma(_535, _535, _539);
                    float _543 = fma(_537, _537, _541);
                    float _545 = rsqrt(_543);
                    float _547 = _545 * 9.9999999747524270787835121154785e-07;
                    float _549 = _535 * _547;
                    float _551 = _533 * _547;
                    float _553 = _537 * _547;
                    _421 = _551;
                    _427 = _549;
                    _423 = _553;
                    _467 = true;
                }
            }
            else
            {
                float _555 = _133 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _557 = _133 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _559 = _133 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _561 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[5].x, _555);
                float _563 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[4].x, _557);
                float _565 = fma(_131, (*spvDescriptorSet0.vp_c10)._m0[6].x, _559);
                float _567 = fma(_135, (*spvDescriptorSet0.vp_c10)._m0[5].z, _561);
                float _569 = fma(_135, (*spvDescriptorSet0.vp_c10)._m0[4].z, _563);
                float _571 = fma(_135, (*spvDescriptorSet0.vp_c10)._m0[6].z, _565);
                float _573 = _567 * _567;
                float _575 = fma(_569, _569, _573);
                float _577 = fma(_571, _571, _575);
                float _579 = rsqrt(_577);
                float _581 = _579 * 9.9999999747524270787835121154785e-07;
                float _583 = _569 * _581;
                float _585 = _567 * _581;
                float _587 = _571 * _581;
                _421 = _585;
                _427 = _583;
                _423 = _587;
            }
        }
    }
    _467 = false;
    float _589 = _421;
    float _591 = _427;
    float _593 = _423;
    bool _595 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _597 = !_595;
    float _615;
    if (!_597)
    {
        float _599 = in.m_42.x;
        float _601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _603 = _599 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _605 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _607 = _605 * _601;
        float _609 = floor(_607);
        float _611 = -_609;
        float _613 = _607 + _611;
        _615 = _613;
        _617 = true;
    }
    else
    {
        float _619 = float(_71);
        float _621 = 1.0 / _619;
        float _623 = _105 * _621;
        _615 = _623;
    }
    _617 = false;
    float _625 = _615;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _629 = _625 + _627;
    float _631 = in.m_40.x;
    float _633 = in.m_40.y;
    bool _635 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _637 = isnan(_625);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _647;
    bool _651 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _653 = isnan(_625);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = -_645;
    float _665 = _663 + 1.0;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _667;
    float _671 = 1.0 / _649;
    bool _673 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _675 = _661 * _665;
    float _677 = -_661;
    float _679 = _677 + 1.0;
    float _681 = _629 * _671;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _683;
    float _687 = fma(_669, _681, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _689 = fma(_685, _681, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _691 = _687 * _675;
    float _693 = _689 * _675;
    float _695 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[143].x, _691);
    float _697 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[143].y, _693);
    float _699 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[144].x, _695);
    float _701 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[144].y, _697);
    float _703 = _699 * _631;
    float _705 = _701 * _633;
    bool _707 = !_673;
    float _725;
    if (!_707)
    {
        float _709 = in.m_42.x;
        float _711 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _713 = _709 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _715 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _717 = _715 * _711;
        float _719 = floor(_717);
        float _721 = -_719;
        float _723 = _717 + _721;
        _725 = _723;
        _727 = true;
    }
    else
    {
        float _729 = float(_71);
        float _731 = 1.0 / _729;
        float _733 = _105 * _731;
        _725 = _733;
    }
    _727 = false;
    float _735 = _725;
    float _737 = in.m_42.x;
    float _739 = in.m_42.y;
    float _741 = in.m_42.z;
    float _743 = in.m_42.w;
    float _745 = _403 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _751 = _749 != 0;
    float _753 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].x, _745);
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _757 = _755 != 0;
    float _759 = _705 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _763 = _761 != 0;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _767 = _765 != 0;
    float _769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _777 = (*spvDescriptorSet0.vp_c10)._m0[9].x * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    bool _779 = _737 > 0.5;
    bool _781 = _743 > 0.5;
    float _783 = _403 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _785 = -_179;
    int _787 = _779 ? as_type<int>(_785) : as_type<int>(_179);
    float _789 = fma((*spvDescriptorSet0.vp_c10)._m0[8].x, (*spvDescriptorSet0.vp_c10)._m0[8].x, _777);
    float _791 = -_183;
    int _793 = _781 ? as_type<int>(_791) : as_type<int>(_183);
    float _795 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].x, _783);
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _799 = _797 != 0;
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _803 = _801 != 0;
    float _805 = _403 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _809 = _807 != 0;
    float _811 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    bool _813 = !_751;
    float _815 = _813 ? _179 : as_type<float>(_787);
    float _817 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].x, _805);
    bool _819 = _739 > 0.5;
    float _821 = _703 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _823 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _825 = _759 * _811;
    float _827 = -_183;
    int _829 = _819 ? as_type<int>(_827) : as_type<int>(_183);
    float _831 = _589 * _589;
    float _833 = -_179;
    int _835 = _819 ? as_type<int>(_833) : as_type<int>(_179);
    float _837 = _821 * _823;
    bool _839 = _741 > 0.5;
    float _841 = fma(_591, _591, _831);
    float _843 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].z, _795);
    float _845 = -_179;
    int _847 = _839 ? as_type<int>(_845) : as_type<int>(_179);
    float _849 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].z, _817);
    bool _851 = !_799;
    float _853 = _851 ? _179 : as_type<float>(_835);
    float _855 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].z, _753);
    bool _857 = !_767;
    float _859 = _857 ? _179 : as_type<float>(_847);
    float _861 = _737 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _863 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _865 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _867 = _863 || _865;
    bool _869 = isnan(0.5);
    bool _871 = _867 || _869;
    float _873 = _739 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _875 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _877 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _879 = _875 || _877;
    bool _881 = isnan(0.5);
    bool _883 = _879 || _881;
    float _885 = -_771;
    float _887 = fma(_861, 2.0, _885);
    float _889 = fma(_873, -2.0, _775);
    float _891 = _855 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _901 = 1.0 / _895;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _905 = _903 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _907 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _889);
    float _909 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _911 = _843 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _913 = 1.0 / _899;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _921 = fma(_593, _593, _841);
    float _923 = _915 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _925;
    float _929 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].z, _909);
    float _931 = 1.0 / _905;
    float _933 = _917 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _935 = _919 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _939 = _735 + _937;
    bool _941 = !_757;
    float _943 = _941 ? _183 : as_type<float>(_829);
    float _945 = _849 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    out.m_44.x = _923;
    out.m_44.y = _933;
    out.m_44.z = _935;
    float _947 = rsqrt(_921);
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _949;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _957 = _951 * _901;
    float _959 = _955 * _913;
    float _961 = _927 * _931;
    float _963 = fma(_957, _939, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _967 = !_763;
    float _969 = _967 ? _183 : as_type<float>(_793);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _973 = _735 + _971;
    float _975 = -_183;
    int _977 = _839 ? as_type<int>(_975) : as_type<int>(_183);
    float _979 = fma((*spvDescriptorSet0.vp_c10)._m0[10].x, (*spvDescriptorSet0.vp_c10)._m0[10].x, _789);
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _983 = _735 + _981;
    float _985 = _947 * _589;
    bool _987 = !_803;
    float _989 = _987 ? _183 : as_type<float>(_977);
    float _991 = -_105;
    float _993 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[76].x, _887);
    float _995 = fma(_959, _983, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _997 = fma(_961, _973, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _999 = _747 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1001 = _815 + 0.5;
    float _1003 = _947 * _591;
    float _1005 = _947 * _593;
    float _1007 = fma(_999, _1001, _993);
    bool _1009 = _735 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1011 = isnan(_735);
    bool _1013 = _1009 || _1011;
    bool _1015 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1017 = _1013 || _1015;
    float _1019 = float(_1017);
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1023 = _735 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1025 = isnan(_735);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1031 = _1027 || _1029;
    float _1033 = float(_1031);
    float _1035 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].z, _929);
    bool _1037 = _735 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1039 = isnan(_735);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1045 = _1041 || _1043;
    float _1047 = float(_1045);
    float _1049 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1021);
    bool _1051 = _735 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1053 = isnan(_735);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1059 = _1055 || _1057;
    float _1061 = float(_1059);
    float _1063 = -_1019;
    float _1065 = _1063 + 1.0;
    float _1067 = _1001;
    float _1069 = _931;
    float _1071 = _739;
    float _1073 = _741;
    if (!_809)
    {
        _1067 = _739;
    }
    float _1075 = _1067;
    float _1077 = -_1033;
    float _1079 = _1077 + 1.0;
    float _1081 = fma(_739, 2.0, -1.0);
    float _1083 = _1033 * _1065;
    float _1085 = _1075;
    if (!_809)
    {
        _1069 = _1075;
    }
    float _1087 = _1069;
    float _1089 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[88].w, _965);
    float _1091 = _1087;
    if (_809)
    {
        _1085 = _739;
    }
    float _1093 = _1085;
    float _1095 = _1061 * _1079;
    float _1097 = _1093;
    if (_809)
    {
        _1071 = _737;
    }
    float _1099 = _1071;
    float _1101 = -_1061;
    float _1103 = _1101 + 1.0;
    float _1105 = _1099;
    if (!_809)
    {
        _1105 = _741;
    }
    float _1107 = _1105;
    float _1109 = _769 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1111 = rsqrt(_1035);
    float _1113 = _943 + (-0.5);
    float _1115 = _1047 * _1103;
    float _1117 = _1107 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_809)
    {
        _1091 = _737;
    }
    float _1119 = _1091;
    float _1121 = -_1109;
    float _1123 = -_907;
    float _1125 = fma(_1121, _1113, _1123);
    float _1127 = _963 * _1115;
    float _1129 = -_1047;
    float _1131 = _1129 + 1.0;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1135 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[83].z;
    if (!_809)
    {
        _1137 = _741;
    }
    float _1139 = _1137;
    float _1141 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1133);
    float _1143 = _1119 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1145 = _1111 * _1081;
    float _1147 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1149 = _1005 * _1147;
    float _1151 = rsqrt(_979);
    float _1153 = _1139;
    if (_809)
    {
        _1153 = _1093;
    }
    float _1155 = _1153;
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1159 = -_1135;
    float _1161 = fma(_1143, 2.0, _1159);
    float _1163 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1165 = _985 * _1163;
    float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1169 = -_1149;
    float _1171 = fma(_1003, _1167, _1169);
    float _1173 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1175 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1127);
    float _1177 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1157);
    float _1179 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1181 = _1003 * _1179;
    float _1183 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1185 = -_1165;
    float _1187 = fma(_1005, _1183, _1185);
    float _1189 = _1171 * _1171;
    float _1191 = -_1173;
    float _1193 = fma(_1117, 2.0, _1191);
    float _1195 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1197 = -_1181;
    float _1199 = fma(_985, _1195, _1197);
    float _1201 = fma(_1187, _1187, _1189);
    float _1203 = fma(2.0, _737, -1.0);
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_809)
    {
        _1073 = _1093;
    }
    float _1207 = _1073;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1211 = fma(_1199, _1199, _1201);
    float _1213 = _1151 * _1203;
    float _1215 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1205);
    float _1217 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1209);
    if (!_809)
    {
        _1097 = _737;
    }
    float _1219 = _1097;
    float _1221 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1223 = _773 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1225 = fma(_995, _1095, _1175);
    float _1227 = _853 + 0.5;
    float _1229 = -_105;
    float _1231 = fma(_1229, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1193);
    float _1233 = fma(_997, _1083, _1225);
    float _1235 = rsqrt(_1211);
    float _1237 = fma(_1223, _1227, _1231);
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1241 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1243 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1245 = _859 + 0.5;
    float _1247 = -_105;
    float _1249 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1161);
    float _1251 = fma(_1241, -2.0, _1239);
    float _1253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1255 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1257 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1259 = _1145 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _1261 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1215);
    float _1263 = fma(_1255, _1245, _1249);
    float _1265 = fma(_1243, -2.0, _1257);
    float _1267 = _825 * _1003;
    float _1269 = _1171 * _1235;
    float _1271 = _1199 * _1235;
    float _1273 = _1187 * _1235;
    float _1275 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1277 = _1003 * _1269;
    float _1279 = _825 * _985;
    float _1281 = _969 + (-0.5);
    float _1283 = fma(_837, _1273, _1267);
    float _1285 = -_1277;
    float _1287 = fma(_985, _1273, _1285);
    float _1289 = _985 * _1271;
    float _1291 = _825 * _1005;
    float _1293 = _1253 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1295 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1251);
    float _1297 = -_1289;
    float _1299 = fma(_1005, _1269, _1297);
    float _1301 = fma(_837, _1271, _1291);
    float _1303 = -_1261;
    float _1305 = _1303 + 1.0;
    float _1307 = -_1293;
    float _1309 = -_1295;
    float _1311 = fma(_1307, _1281, _1309);
    float _1313 = _1005 * _1273;
    float _1315 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1049);
    float _1317 = fma(_1275, _1287, _1301);
    float _1319 = _1213 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1321 = _1259 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1323 = _1259 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1325 = fma(_1275, _1299, _1283);
    float _1327 = _891 + _1317;
    float _1329 = fma(_1319, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1321);
    float _1331 = fma(_1319, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1323);
    float _1333 = _911 + _1325;
    float _1335 = -_1315;
    float _1337 = _1335 + 1.0;
    float _1339 = fma(_1329, 0.5, _1327);
    float _1341 = -_1305;
    float _1343 = fma(_815, _1341, _1007);
    float _1345 = fma(_1331, 0.5, _1333);
    float _1347 = fma(_943, _1337, _1125);
    float _1349 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1351 = _1339 + _1349;
    float _1353 = _945 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1355 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1357 = _1345 + _1355;
    float _1359 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1141);
    float _1361 = _1351 * _1351;
    float _1363 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1353);
    float _1365 = _945 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1367 = -_1359;
    float _1369 = _1367 + 1.0;
    float _1371 = fma(_1357, _1357, _1361);
    float _1373 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1363);
    float _1375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1377 = -_1369;
    float _1379 = fma(_859, _1377, _1263);
    float _1381 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1365);
    float _1383 = _1373 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1385 = fma(_837, _1269, _1279);
    float _1387 = -_1313;
    float _1389 = fma(_1003, _1271, _1387);
    float _1391 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1381);
    float _1393 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1177);
    float _1395 = sqrt(_1371);
    float _1397 = _1259 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1399 = fma(_1275, _1389, _1385);
    float _1401 = _1391 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1403 = -_1393;
    float _1405 = _1403 + 1.0;
    float _1407 = fma(_1319, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1397);
    float _1409 = _945 + _1399;
    float _1411 = _1401 + _1383;
    float _1413 = 1.0 / _1383;
    float _1415 = fma(_969, _1405, _1311);
    float _1417 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1217);
    float _1419 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1089);
    float _1421 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1265);
    float _1423 = fma(_1407, 0.5, _1409);
    float _1425 = _1375 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1427 = _1395 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1429 = _989 + (-0.5);
    out.m_46.x = _1343;
    out.m_46.y = _1347;
    out.m_46.z = _1379;
    out.m_46.w = _1415;
    float _1431 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1233);
    float _1433 = _1411 * _1413;
    float _1435 = _1433 * 0.5;
    float _1437 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1439 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1437);
    float _1441 = -_1425;
    float _1443 = -_1421;
    float _1445 = fma(_1441, _1429, _1443);
    float _1447 = _1379;
    float _1449 = _1345;
    float _1451 = _1339;
    float _1453 = _1415;
    float _1455 = _1343;
    if (!_1427)
    {
        _1447 = _1423;
    }
    float _1457 = _1447;
    bool _1459 = !_1427;
    float _1461 = _1457;
    if (!_1459)
    {
        float _1463 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1465 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1467 = _1395 + _1465;
        float _1469 = rsqrt(_1371);
        float _1471 = _1467 * _1463;
        float _1473 = _1423 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1475 = _1471 * 0.15915493667125701904296875;
        float _1477 = _1475 * 6.283185482025146484375;
        float _1479 = cos(_1477);
        float _1481 = _1475 * 6.283185482025146484375;
        float _1483 = sin(_1481);
        float _1485 = _1479 + (-1.0);
        float _1487 = _1485 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1489 = fma(_1483, _1473, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1491 = fma(_1423, _1479, _1487);
        float _1493 = _1469 * _1489;
        float _1495 = fma(_1357, _1493, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1497 = fma(_1351, _1493, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1449 = _1495;
        _1451 = _1497;
        _1461 = _1491;
        _1453 = _1493;
        _1455 = _1483;
    }
    float _1499 = _1449;
    float _1501 = _1451;
    float _1503 = _1461;
    float _1505 = _1453;
    float _1507 = _1455;
    float _1509 = _1505;
    float _1511 = _1507;
    float _1513 = _1503;
    if (_871)
    {
        _1509 = _1499;
    }
    float _1515 = _1509;
    float _1517 = _1515;
    if (_871)
    {
        _1511 = _1501;
    }
    float _1519 = _1511;
    float _1521 = _1519;
    if (!_871)
    {
        float _1523 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1525 = _945 + _1523;
        float _1527 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1529 = _911 + _1527;
        float _1531 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1533 = -_891;
        float _1535 = _1533 + _1501;
        float _1537 = _1525 * _1525;
        float _1539 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1541 = _891 + _1539;
        float _1543 = fma(_1529, _1529, _1537);
        float _1545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
        float _1547 = fma(_1541, _1541, _1543);
        float _1549 = sqrt(_1547);
        float _1551 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1553 = precise::max(_1549, (*spvDescriptorSet0.vp_c9)._m0[199].y);
        float _1555 = _1553 * _1545;
        float _1557 = -_911;
        float _1559 = _1557 + _1499;
        float _1561 = _1551 * _1555;
        float _1563 = -_945;
        float _1565 = _1563 + _1503;
        float _1567 = fma(_1559, _1561, _911);
        float _1569 = fma(_1565, _1561, _945);
        float _1571 = fma(_1535, _1561, _891);
        _1513 = _1569;
        _1517 = _1567;
        _1521 = _1571;
    }
    float _1573 = _1513;
    float _1575 = _1517;
    float _1577 = _1521;
    float _1579 = 1.0 / _1439;
    float _1581 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1583 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1585 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1587 = _1573 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1589 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1581);
    float _1591 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1583);
    float _1593 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1585);
    float _1595 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1587);
    float _1597 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1589);
    float _1599 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1591);
    float _1601 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1593);
    float _1603 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1595);
    float _1605 = _1583;
    float _1607 = _1595;
    if (_883)
    {
        _1605 = 1.0;
    }
    float _1609 = _1605;
    float _1611 = _1597 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1613 = _1609;
    if (_883)
    {
        _1607 = 1.0;
    }
    float _1615 = _1607;
    float _1617 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1619 = _1579 * _1617;
    float _1621 = _1615;
    if (!_883)
    {
        float _1623 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1625 = _1623 * 0.15915493667125701904296875;
        float _1627 = _1625 * 6.283185482025146484375;
        float _1629 = cos(_1627);
        float _1631 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1633 = _1631 * 0.15915493667125701904296875;
        float _1635 = _1625 * 6.283185482025146484375;
        float _1637 = sin(_1635);
        float _1639 = 1.0 / _1629;
        float _1641 = _1633 * 6.283185482025146484375;
        float _1643 = cos(_1641);
        float _1645 = _1637 * _1639;
        float _1647 = _1633 * 6.283185482025146484375;
        float _1649 = sin(_1647);
        float _1651 = _1643 * _1645;
        float _1653 = 1.0 / _1651;
        float _1655 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1657 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1655;
        float _1659 = 1.0 / _1657;
        float _1661 = _1649 * _1653;
        float _1663 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1665 = fma(_1619, _1661, _1663);
        float _1667 = _1665 * _1659;
        float _1669 = precise::clamp(_1667, 0.0, 1.0);
        _1613 = _1669;
    }
    float _1671 = _1613;
    if (!_883)
    {
        float _1673 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1675 = _1673 * 0.15915493667125701904296875;
        float _1677 = _1675 * 6.283185482025146484375;
        float _1679 = cos(_1677);
        float _1681 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1683 = _1681 * 0.15915493667125701904296875;
        float _1685 = _1675 * 6.283185482025146484375;
        float _1687 = sin(_1685);
        float _1689 = 1.0 / _1679;
        float _1691 = _1683 * 6.283185482025146484375;
        float _1693 = cos(_1691);
        float _1695 = _1687 * _1689;
        float _1697 = _1683 * 6.283185482025146484375;
        float _1699 = sin(_1697);
        float _1701 = _1693 * _1695;
        float _1703 = 1.0 / _1701;
        float _1705 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1707 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1705;
        float _1709 = 1.0 / _1707;
        float _1711 = _1699 * _1703;
        float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1715 = fma(_1619, _1711, _1713);
        float _1717 = _1715 * _1709;
        float _1719 = precise::clamp(_1717, 0.0, 1.0);
        float _1721 = -_1719;
        float _1723 = _1721 + 1.0;
        _1621 = _1723;
    }
    float _1725 = _1621;
    float _1727 = _1599 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1729 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1731 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1733 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1735 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1737 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1729);
    float _1739 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1731);
    float _1741 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1733);
    float _1743 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1735);
    float _1745 = _1601 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1747 = _1671 > 0.0;
    bool _1749 = isnan(_1671);
    bool _1751 = _1747 || _1749;
    bool _1753 = isnan(0.0);
    bool _1755 = _1751 || _1753;
    float _1757 = _1671 * _1725;
    float _1759 = -_1419;
    float _1761 = _1759 + 1.0;
    float _1763 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1737);
    float _1765 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1739);
    float _1767 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1741);
    float _1769 = fma(_1745, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1743);
    float _1771 = fma(_989, _1761, _1445);
    bool _1773 = _1725 <= 0.0;
    bool _1775 = !_1755;
    bool _1777 = _1773 || _1775;
    float _1779 = _1603 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1781 = -_1417;
    float _1783 = _1781 + 1.0;
    float _1785 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1787 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1763);
    float _1789 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1765);
    float _1791 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1767);
    float _1793 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1769);
    float _1795 = -_1783;
    float _1797 = fma(_853, _1795, _1237);
    float _1799 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1801 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1803 = _1757 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1805 = _1787 + _1793;
    float _1807 = _1791 + _1793;
    float _1809 = _1793 * 0.5;
    float _1811 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1813 = _1799 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1815 = _1801 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1817 = _1431 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1819 = _1803 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1821 = _1805 * 0.5;
    float _1823 = _1807 * 0.5;
    float _1825 = fma(_1789, -0.5, _1809);
    out.m_48.x = _1811;
    out.m_48.y = _1813;
    out.m_48.z = _1815;
    out.m_48.w = _1817;
    out.m_50.x = _1797;
    out.m_50.y = _1771;
    out.m_33.x = _1819;
    out.gl_Position.x = _1787;
    out.gl_Position.y = _1789;
    out.gl_Position.z = _1791;
    out.gl_Position.w = _1793;
    out.m_52.x = _1821;
    out.m_52.y = _1825;
    out.m_52.z = _1823;
    out.m_52.w = _1793;
    if (!_1777)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1827 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1827;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

