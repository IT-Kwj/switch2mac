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
};

struct main0_out
{
    float4 m_52 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_48 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_35 [[attribute(1)]];
    float4 m_33 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_46 [[attribute(4)]];
    float4 m_26 [[attribute(5)]];
    float4 m_31 [[attribute(6)]];
    float4 m_41 [[attribute(7)]];
    float4 m_39 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _809 = false;
    bool _649 = false;
    bool _487 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_26.w;
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
        out.m_29.x = 0.0;
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
        float _1711 = as_type<float>(_87);
        out.gl_Position.z = _1711;
    }
    if (!_75)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _91 = in.m_31.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _107 = _105;
    if (_101)
    {
        float _109 = float(_71);
        _81 = _109;
    }
    float _111 = _81;
    bool _113 = _105 >= _111;
    bool _115 = !_101;
    bool _117 = _113 || _115;
    float _119 = _111;
    if (_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (_117)
    {
        out.m_29.x = 0.0;
    }
    if (_117)
    {
        float _125 = _121 * 5.0;
        _89 = as_type<int>(_125);
    }
    int _127 = _89;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1782 = as_type<float>(_127);
        out.gl_Position.z = _1782;
    }
    if (_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_31.x;
    float _131 = in.m_31.y;
    float _133 = in.m_31.z;
    float _135 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = 0.0;
    float _149 = _135;
    if (!_145)
    {
        float _151 = _135 * _135;
        float _153 = _151 * 0.5;
        _147 = _153;
    }
    float _155 = _147;
    float _157 = 0.0;
    float _159 = _155;
    if (!_145)
    {
        float _161 = _105 * _105;
        float _163 = _161 * 0.5;
        _157 = _163;
    }
    float _165 = _157;
    if (!_145)
    {
        float _167 = _155 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _159 = _167;
    }
    float _169 = _159;
    bool _171 = !_145;
    float _173 = _169;
    float _175 = 0.0;
    if (!_171)
    {
        float _177 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _179 = log2(_177);
        float _181 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _183 = _181 + 1.0;
        float _185 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _187 = _135 * _179;
        float _189 = 1.0 / _183;
        float _191 = _185 * 0.693147182464599609375;
        float _193 = exp2(_187);
        float _195 = 1.0 / _191;
        float _197 = _193 + (-1.0);
        float _199 = -_197;
        float _201 = fma(_199, _195, _135);
        float _203 = _201 * _189;
        float _205 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _123 = _191;
        _173 = _205;
        _175 = _193;
    }
    float _207 = _123;
    float _209 = _173;
    float _211 = _175;
    bool _213 = !_145;
    float _215 = _207;
    float _217 = _211;
    if (!_213)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = 1.0 / _225;
        float _229 = _135 * _221;
        float _231 = exp2(_229);
        float _233 = -_231;
        float _235 = _233 + 1.0;
        float _237 = _235 * _227;
        _215 = _231;
        _217 = _225;
        _149 = _237;
    }
    float _239 = _215;
    float _241 = _217;
    float _243 = _149;
    float _245 = _241;
    float _247 = _239;
    if (!_145)
    {
        _245 = _105;
    }
    float _249 = _245;
    float _251 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _253 = _249;
    if (!_145)
    {
        float _255 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _247 = _255;
    }
    float _257 = _247;
    bool _259 = !_145;
    float _261 = _257;
    if (!_259)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _273 = _105 * _265;
        float _275 = 1.0 / _269;
        float _277 = _271 * 0.693147182464599609375;
        float _279 = exp2(_273);
        float _281 = 1.0 / _277;
        float _283 = _279 + (-1.0);
        float _285 = -_283;
        float _287 = fma(_285, _281, _105);
        float _289 = _287 * _275;
        float _291 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _261 = _291;
    }
    float _293 = _261;
    bool _295 = !_145;
    if (!_295)
    {
        float _297 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = log2(_297);
        float _301 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _303 = _301 + 1.0;
        float _305 = 1.0 / _303;
        float _307 = _105 * _299;
        float _309 = exp2(_307);
        float _311 = -_309;
        float _313 = _311 + 1.0;
        float _315 = _313 * _305;
        _253 = _315;
    }
    float _317 = _253;
    float _319 = fma(_243, _129, _251);
    float _321 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _323 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _325 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _327 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _329 = fma(_243, _131, _321);
    float _331 = fma(_317, _131, _323);
    float _333 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _335 = fma(_243, _133, _325);
    float _337 = fma(_317, _129, _327);
    float _339 = -_331;
    float _341 = _329 + _339;
    float _343 = fma(_317, _133, _333);
    float _345 = in.m_33.y;
    float _347 = -_337;
    float _349 = _319 + _347;
    float _351 = _341 * _341;
    float _353 = -_343;
    float _355 = _335 + _353;
    float _357 = in.m_35.y;
    float _359 = fma(_349, _349, _351);
    float _361 = in.m_37.y;
    float _363 = fma(_355, _355, _359);
    float _365 = in.m_33.x;
    float _367 = in.m_35.x;
    float _369 = sqrt(_363);
    float _371 = in.m_37.x;
    float _373 = in.m_33.z;
    float _375 = _341 * _345;
    float _377 = in.m_35.z;
    float _379 = _341 * _357;
    float _381 = in.m_37.z;
    bool _383 = _369 >= 9.9999999747524270787835121154785e-07;
    bool _385 = isnan(_369);
    bool _387 = _383 || _385;
    bool _389 = isnan(9.9999999747524270787835121154785e-07);
    bool _391 = _387 || _389;
    float _393 = _341 * _361;
    float _395 = _345 * _345;
    float _397 = in.m_39.w;
    float _399 = fma(_349, _365, _375);
    float _401 = fma(_357, _357, _395);
    float _403 = in.m_26.x;
    float _405 = in.m_26.y;
    float _407 = in.m_26.z;
    float _409 = fma(_349, _367, _379);
    float _411 = fma(_361, _361, _401);
    float _413 = fma(_349, _371, _393);
    float _415 = fma(_355, _373, _399);
    float _417 = fma(_355, _377, _409);
    float _419 = fma(_355, _381, _413);
    float _421 = _413;
    float _423 = _399;
    float _425 = _415;
    if (_391)
    {
        _421 = _415;
    }
    float _427 = _421;
    float _429 = _427;
    float _431 = _427;
    if (_391)
    {
        _423 = _417;
    }
    float _433 = _423;
    float _435 = _433;
    float _437 = _433;
    if (_391)
    {
        _425 = _419;
    }
    float _439 = _425;
    float _441 = fma(_319, _397, _403);
    float _443 = fma(_329, _397, _405);
    float _445 = fma(_335, _397, _407);
    float _447 = _439;
    if (!_391)
    {
        bool _449 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _451 = !_449;
        if (!_451)
        {
            float _453 = _345 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _455 = _357 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _457 = _361 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _459 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[16].x, _453);
            float _461 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[16].x, _455);
            float _463 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[16].x, _457);
            float _465 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[16].z, _459);
            float _467 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[16].z, _461);
            float _469 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[16].z, _463);
            float _471 = _465 * _465;
            float _473 = fma(_467, _467, _471);
            float _475 = fma(_469, _469, _473);
            float _477 = rsqrt(_475);
            float _479 = _477 * 9.9999999747524270787835121154785e-07;
            float _481 = _467 * _479;
            float _483 = _465 * _479;
            float _485 = _469 * _479;
            _431 = _483;
            _437 = _481;
            _447 = _485;
            _487 = true;
        }
        else
        {
            float _489 = _131 * _131;
            float _491 = fma(_129, _129, _489);
            float _493 = fma(_133, _133, _491);
            float _495 = sqrt(_493);
            bool _497 = _495 >= 9.9999999747524270787835121154785e-07;
            bool _499 = isnan(_495);
            bool _501 = _497 || _499;
            bool _503 = isnan(9.9999999747524270787835121154785e-07);
            bool _505 = _501 || _503;
            float _507 = _495;
            if (!_505)
            {
                float _509 = _405 * _405;
                float _511 = fma(_403, _403, _509);
                float _513 = fma(_407, _407, _511);
                float _515 = sqrt(_513);
                bool _517 = _515 >= 9.9999999747524270787835121154785e-07;
                bool _519 = isnan(_515);
                bool _521 = _517 || _519;
                bool _523 = isnan(9.9999999747524270787835121154785e-07);
                bool _525 = _521 || _523;
                float _527 = _411;
                if (!_525)
                {
                    float _529 = rsqrt(_411);
                    _527 = _529;
                }
                float _531 = _527;
                if (!_525)
                {
                    float _533 = _531 * 9.9999999747524270787835121154785e-07;
                    _507 = _533;
                }
                float _535 = _507;
                float _537 = _535;
                if (!_525)
                {
                    float _539 = _357 * _535;
                    _435 = _539;
                }
                float _541 = _435;
                _437 = _541;
                if (!_525)
                {
                    float _543 = _345 * _535;
                    _429 = _543;
                }
                float _545 = _429;
                _431 = _545;
                if (!_525)
                {
                    float _547 = _361 * _535;
                    _537 = _547;
                }
                float _549 = _537;
                bool _551 = !_525;
                _447 = _549;
                _487 = _551;
                if (!_487)
                {
                    float _553 = _345 * _405;
                    float _555 = _357 * _405;
                    float _557 = _361 * _405;
                    float _559 = fma(_403, _365, _553);
                    float _561 = fma(_403, _367, _555);
                    float _563 = fma(_403, _371, _557);
                    float _565 = fma(_407, _373, _559);
                    float _567 = fma(_407, _377, _561);
                    float _569 = fma(_407, _381, _563);
                    float _571 = _565 * _565;
                    float _573 = fma(_567, _567, _571);
                    float _575 = fma(_569, _569, _573);
                    float _577 = rsqrt(_575);
                    float _579 = _577 * 9.9999999747524270787835121154785e-07;
                    float _581 = _567 * _579;
                    float _583 = _565 * _579;
                    float _585 = _569 * _579;
                    _431 = _583;
                    _437 = _581;
                    _447 = _585;
                    _487 = true;
                }
            }
            else
            {
                float _587 = _345 * _131;
                float _589 = _357 * _131;
                float _591 = _361 * _131;
                float _593 = fma(_129, _365, _587);
                float _595 = fma(_129, _367, _589);
                float _597 = fma(_129, _371, _591);
                float _599 = fma(_133, _373, _593);
                float _601 = fma(_133, _377, _595);
                float _603 = fma(_133, _381, _597);
                float _605 = _599 * _599;
                float _607 = fma(_601, _601, _605);
                float _609 = fma(_603, _603, _607);
                float _611 = rsqrt(_609);
                float _613 = _611 * 9.9999999747524270787835121154785e-07;
                float _615 = _601 * _613;
                float _617 = _599 * _613;
                float _619 = _603 * _613;
                _431 = _617;
                _437 = _615;
                _447 = _619;
            }
        }
    }
    _487 = false;
    float _621 = _431;
    float _623 = _437;
    float _625 = _447;
    bool _627 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _629 = !_627;
    float _647;
    if (!_629)
    {
        float _631 = in.m_41.x;
        float _633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _635 = _631 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _637 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _639 = _637 * _633;
        float _641 = floor(_639);
        float _643 = -_641;
        float _645 = _639 + _643;
        _647 = _645;
        _649 = true;
    }
    else
    {
        float _651 = float(_71);
        float _653 = 1.0 / _651;
        float _655 = _105 * _653;
        _647 = _655;
    }
    _649 = false;
    float _657 = _647;
    float _659 = in.m_41.x;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _663 = _657 + _661;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _667 = _657 + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _669;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _677 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _679 = 1.0 / _675;
    bool _681 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _683 = 1.0 / _671;
    float _685 = _677 * _659;
    float _687 = _663 * _679;
    bool _689 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _691 = isnan(_657);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    bool _701 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _703 = isnan(_657);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = -_699;
    float _715 = _713 + 1.0;
    float _717 = _667 * _683;
    bool _719 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _721 = isnan(_657);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _731;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _735;
    float _739 = _729 * _715;
    float _741 = -_729;
    float _743 = _741 + 1.0;
    float _745 = fma(_733, _717, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _747 = fma(_737, _717, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _749 = _711 * _743;
    float _751 = trunc(_685);
    int _753 = int(_751);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _759 = -_711;
    float _761 = _759 + 1.0;
    float _763 = _745 * _749;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _769 = _747 * _749;
    float _771 = fma(_757, _687, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _773 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[143].x, _763);
    float _775 = fma(_767, _687, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _777 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[143].y, _769);
    float _779 = fma(_771, _739, _773);
    float _781 = fma(_775, _739, _777);
    float _783 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[145].x, _779);
    int _785 = _753 << 4;
    int _787 = _785 + 1712;
    float _789 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[145].y, _781);
    bool _791 = !_681;
    float _807;
    if (!_791)
    {
        float _793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _795 = _659 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _797 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _799 = _797 * _793;
        float _801 = floor(_799);
        float _803 = -_801;
        float _805 = _799 + _803;
        _807 = _805;
        _809 = true;
    }
    else
    {
        float _811 = float(_71);
        float _813 = 1.0 / _811;
        float _815 = _105 * _813;
        _807 = _815;
    }
    _809 = false;
    float _817 = _807;
    float _819 = in.m_41.z;
    float _821 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _823 = log2(_821);
    float _825 = _443 * _357;
    float _827 = as_type<float>(int(gl_VertexIndex));
    float _829 = _443 * _345;
    float _831 = _443 * _361;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _835 = 1.0 + _833;
    float _837 = fma(_441, _367, _825);
    float _839 = _659 * 2.0;
    float _841 = fma(_441, _365, _829);
    float _843 = fma(_441, _371, _831);
    float _845 = 1.0 / _835;
    float _847 = in.m_41.y;
    float _849 = fma(_445, _373, _841);
    float _851 = _823 * _105;
    float _853 = in.m_35.w;
    float _855 = floor(_839);
    float _857 = _819 * 2.0;
    float _859 = exp2(_851);
    int _861 = as_type<int>(_827) & 1;
    bool _863 = _861 != 0;
    int _865 = as_type<int>(_827) & 2;
    bool _867 = _865 != 0;
    bool _869 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _871 = isnan(1.0);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _877 = _873 || _875;
    bool _879 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _881 = isnan(0.0);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _887 = _883 || _885;
    float _889 = floor(_857);
    float _891 = in.m_39.x;
    float _893 = in.m_39.y;
    float _895 = -_859;
    float _897 = _895 + 1.0;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _901 = _899 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _903 = _887 ? _897 : 0.0;
    float _905 = 1.0 / _901;
    bool _907 = _889 > 0.0;
    bool _909 = _889 >= 0.0;
    bool _911 = isnan(_889);
    bool _913 = _909 || _911;
    bool _915 = isnan(0.0);
    bool _917 = _913 || _915;
    if (_877)
    {
        float _919 = _903 * _845;
        _107 = _919;
    }
    float _921 = _107;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _925 = _923 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _927 = _917 ? 0 : 1;
    float _929 = fma(_445, _377, _837);
    bool _931 = _855 >= 0.0;
    bool _933 = isnan(_855);
    bool _935 = _931 || _933;
    bool _937 = isnan(0.0);
    bool _939 = _935 || _937;
    float _941 = 1.0 / _925;
    int _943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _945 = _943 != 0;
    float _947 = fma(_445, _381, _843);
    int _949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _951 = _949 != 0;
    float _953 = _847 * 2.0;
    float _955 = _659 + _847;
    int _957 = ~_927;
    int _959 = _957 + 1;
    int _961 = _959 + 1;
    float _963 = _929 + _853;
    int _965 = _961;
    if (!_907)
    {
        int _967 = ~_927;
        int _969 = _967 + 1;
        _965 = _969;
    }
    int _971 = _965;
    float _973 = _789 * _893;
    int _975 = _939 ? 0 : 1;
    float _977 = _955 + (-1.0);
    int _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _981 = _979 != 0;
    int _983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _985 = _983 != 0;
    int _987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _989 = _987 != 0;
    float _991 = _783 * _891;
    float _993 = _847 + _819;
    float _995 = floor(_953);
    bool _997 = !_985;
    int _999 = _997 ? 0 : 1;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1001;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1009 = _993 + (-1.0);
    bool _1011 = _855 > 0.0;
    float _1013 = _621 * _621;
    float _1015 = _1003 * _905;
    float _1017 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1019 = _1007 * _941;
    float _1021 = fma(_623, _623, _1013);
    float _1023 = in.m_46.x;
    float _1025 = in.m_46.y;
    float _1027 = in.m_46.z;
    int _1029 = abs(_999);
    float _1031 = fma(_625, _625, _1021);
    int _1033 = ~_975;
    int _1035 = _1033 + 1;
    int _1037 = _1035 + 1;
    float _1039 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1041 = float(_1029);
    float _1043 = rsqrt(_1031);
    int _1045 = _1037;
    if (!_1011)
    {
        int _1047 = ~_975;
        int _1049 = _1047 + 1;
        _1045 = _1049;
    }
    int _1051 = _1045;
    float _1053 = _659 + _819;
    bool _1055 = !_981;
    int _1057 = _1055 ? 0 : 1;
    float _1059 = in.m_37.w;
    float _1061 = float(_1051);
    float _1063 = _1053 + (-1.0);
    int _1065 = abs(_1057);
    float _1067 = _973 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1069 = _995 > 0.0;
    float _1071 = _1041 * _1061;
    bool _1073 = _995 >= 0.0;
    bool _1075 = isnan(_995);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan(0.0);
    bool _1081 = _1077 || _1079;
    float _1083 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1085 = float(_1065);
    float _1087 = _1071 * (-2.0);
    float _1089 = float(_971);
    float _1091 = _1043 * _625;
    int _1093 = _1081 ? 0 : 1;
    float _1095 = fma(_1087, _1025, _1025);
    bool _1097 = _847 > 0.5;
    float _1099 = fma(_1017, _1087, _1017);
    float _1101 = _847 + (-0.5);
    float _1103 = _1085 * _1089;
    float _1105 = _1043 * _623;
    float _1107 = _1043 * _621;
    float _1109 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1111 = _1091 * _1109;
    float _1113 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1095);
    int _1115 = ~_1093;
    int _1117 = _1115 + 1;
    int _1119 = _1117 + 1;
    float _1121 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1123 = _1107 * _1121;
    float _1125 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1127 = -_1111;
    float _1129 = fma(_1105, _1125, _1127);
    int _1131 = _1119;
    if (!_1069)
    {
        int _1133 = ~_1093;
        int _1135 = _1133 + 1;
        _1131 = _1135;
    }
    int _1137 = _1131;
    float _1139 = fma(_1099, _921, _1113);
    float _1141 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1143 = _1105 * _1141;
    float _1145 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1147 = -_1123;
    float _1149 = fma(_1091, _1145, _1147);
    float _1151 = _1129 * _1129;
    float _1153 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1155 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1157 = -_1143;
    float _1159 = fma(_1107, _1155, _1157);
    bool _1161 = !_989;
    int _1163 = _1161 ? 0 : 1;
    float _1165 = fma(_1149, _1149, _1151);
    bool _1167 = _659 > 0.5;
    float _1169 = _1153 * _659;
    float _1171 = _659 + (-0.5);
    float _1173 = fma(_1159, _1159, _1165);
    float _1175 = _1103 * (-2.0);
    int _1177 = abs(_1163);
    float _1179 = _1139 * 0.15915493667125701904296875;
    float _1181 = float(_1137);
    float _1183 = fma(_1175, _1023, _1023);
    float _1185 = float(_1177);
    float _1187 = fma(_1039, _1175, _1039);
    float _1189 = in.m_33.w;
    float _1191 = fma(_1171, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1183);
    bool _1193 = _817 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1195 = isnan(_817);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1201 = _1197 || _1199;
    float _1203 = float(_1201);
    float _1205 = _1185 * _1181;
    bool _1207 = _817 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1209 = isnan(_817);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1215 = _1211 || _1213;
    float _1217 = float(_1215);
    float _1219 = fma(_1187, _921, _1191);
    float _1221 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1223 = _817 + _1221;
    float _1225 = _1205 * (-2.0);
    float _1227 = -_1203;
    float _1229 = _1227 + 1.0;
    bool _1231 = _817 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1233 = isnan(_817);
    bool _1235 = _1231 || _1233;
    bool _1237 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1239 = _1235 || _1237;
    float _1241 = float(_1239);
    float _1243 = _1219 * 0.15915493667125701904296875;
    float _1245 = fma(_1225, _1027, _1027);
    float _1247 = _1217 * _1229;
    float _1249 = -_1217;
    float _1251 = _1249 + 1.0;
    float _1253 = _819 + (-0.5);
    float _1255 = fma(_1015, _1223, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1257 = fma(_1083, _1225, _1083);
    float _1259 = _1241 * _1251;
    float _1261 = fma(_1253, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1245);
    float _1263 = -_1241;
    float _1265 = _1263 + 1.0;
    float _1267 = _1255 * _1259;
    float _1269 = fma(_1257, _921, _1261);
    bool _1271 = !_863;
    float _1273 = _1271 ? (-0.5) : 0.5;
    float _1275 = _947 + _1059;
    float _1277 = fma(_1265, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1267);
    float _1279 = _1269 * 0.15915493667125701904296875;
    float _1281 = -_1273;
    int _1283 = _1167 ? as_type<int>(_1281) : as_type<int>(_1273);
    float _1285 = rsqrt(_1173);
    float _1287 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1289 = _817 + _1287;
    float _1291 = _991 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1293 = !_945;
    float _1295 = _1293 ? _1273 : as_type<float>(_1283);
    float _1297 = _849 + _1189;
    float _1299 = fma(_1019, _1289, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1301 = !_867;
    float _1303 = _1301 ? (-0.5) : 0.5;
    float _1305 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1273);
    float _1307 = _1179 * 6.283185482025146484375;
    float _1309 = sin(_1307);
    float _1311 = _1295 + 0.5;
    float _1313 = -_1303;
    int _1315 = _1097 ? as_type<int>(_1313) : as_type<int>(_1303);
    float _1317 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1303);
    float _1319 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1321 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1323 = !_951;
    float _1325 = _1323 ? _1303 : as_type<float>(_1315);
    float _1327 = _1291 * _1305;
    float _1329 = _1179 * 6.283185482025146484375;
    float _1331 = cos(_1329);
    float _1333 = _1067 * _1317;
    float _1335 = fma(_1299, _1247, _1277);
    float _1337 = _1149 * _1285;
    float _1339 = _1129 * _1285;
    float _1341 = _1159 * _1285;
    float _1343 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1335);
    float _1345 = -_1325;
    float _1347 = _1345 + 0.5;
    float _1349 = _1243 * 6.283185482025146484375;
    float _1351 = sin(_1349);
    float _1353 = _1347 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1355 = _1243 * 6.283185482025146484375;
    float _1357 = cos(_1355);
    float _1359 = _1279 * 6.283185482025146484375;
    float _1361 = cos(_1359);
    float _1363 = _1351 * _1309;
    float _1365 = _1351 * _1331;
    float _1367 = _1279 * 6.283185482025146484375;
    float _1369 = sin(_1367);
    float _1371 = _1357 * _1331;
    float _1373 = _1357 * _1309;
    float _1375 = _1357 * _1361;
    float _1377 = _1351 * _1361;
    float _1379 = _1331 * _1361;
    float _1381 = _1309 * _1361;
    float _1383 = trunc(_1169);
    int _1385 = int(_1383);
    float _1387 = _1375 * _1091;
    float _1389 = _1375 * _1105;
    float _1391 = _1375 * _1107;
    float _1393 = fma(_1369, _1371, _1363);
    float _1395 = fma(_1369, _1363, _1371);
    float _1397 = -_1373;
    float _1399 = fma(_1369, _1365, _1397);
    float _1401 = -_1365;
    float _1403 = fma(_1369, _1373, _1401);
    float _1405 = _1107 * _1341;
    float _1407 = _1105 * _1339;
    float _1409 = -_1369;
    float _1411 = fma(_1409, _1341, _1387);
    float _1413 = -_1369;
    float _1415 = fma(_1413, _1337, _1389);
    float _1417 = _1393 * _1105;
    float _1419 = _1393 * _1107;
    float _1421 = _1393 * _1091;
    float _1423 = _1091 * _1337;
    float _1425 = -_1369;
    float _1427 = fma(_1425, _1339, _1391);
    float _1429 = _1403 * _1105;
    float _1431 = -_1405;
    float _1433 = fma(_1091, _1339, _1431);
    float _1435 = -_1407;
    float _1437 = fma(_1107, _1337, _1435);
    float _1439 = _1403 * _1107;
    float _1441 = _1403 * _1091;
    float _1443 = fma(_1379, _1337, _1417);
    float _1445 = fma(_1379, _1339, _1419);
    float _1447 = fma(_1379, _1341, _1421);
    float _1449 = -_1423;
    float _1451 = fma(_1105, _1341, _1449);
    float _1453 = fma(_1381, _1337, _1429);
    float _1455 = fma(_1377, _1433, _1415);
    float _1457 = fma(_1377, _1437, _1411);
    float _1459 = fma(_1381, _1341, _1441);
    float _1461 = fma(_1399, _1433, _1443);
    float _1463 = fma(_1399, _1451, _1445);
    float _1465 = fma(_1377, _1451, _1427);
    float _1467 = fma(_1399, _1437, _1447);
    float _1469 = _1333 * _1455;
    int _1471 = _1385 << 4;
    int _1473 = _1471 + 1968;
    float _1475 = fma(_1381, _1339, _1439);
    float _1477 = _1333 * _1457;
    float _1479 = fma(_1395, _1433, _1453);
    float _1481 = _1333 * _1465;
    float _1483 = fma(_1327, _1461, _1469);
    int _1485 = _1473 + 8;
    uint _1488 = uint(int(uint(_1485) >> uint(2)));
    uint _1490 = uint(int(uint(int(_1488)) >> uint(2)));
    int _1492 = int(_1488) & 3;
    float _1494 = (*spvDescriptorSet0.vp_c9)._m0[int(_1490)][_1492];
    float _1496 = fma(_1395, _1451, _1475);
    float _1498 = fma(_1395, _1437, _1459);
    float _1500 = fma(_1327, _1467, _1477);
    float _1502 = fma(_1327, _1463, _1481);
    float _1504 = fma(_1319, _1479, _1483);
    float _1506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1508 = fma(_1319, _1498, _1500);
    uint _1510 = uint(int(uint(_1473) >> uint(2)));
    uint _1512 = uint(int(uint(int(_1510)) >> uint(2)));
    int _1514 = int(_1510) & 3;
    float _1516 = (*spvDescriptorSet0.vp_c9)._m0[int(_1512)][_1514];
    int _1518 = int(_1510) + 1;
    uint _1520 = uint(int(uint(_1518) >> uint(2)));
    int _1522 = _1518 & 3;
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[int(_1520)][_1522];
    float _1526 = fma(_1319, _1496, _1502);
    float _1528 = _963 + _1504;
    float _1530 = _1275 + _1508;
    float _1532 = _1297 + _1526;
    float _1534 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _1536 = uint(int(uint(_787) >> uint(2)));
    uint _1538 = uint(int(uint(int(_1536)) >> uint(2)));
    int _1540 = int(_1536) & 3;
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[int(_1538)][_1540];
    int _1544 = int(_1536) + 1;
    uint _1546 = uint(int(uint(_1544) >> uint(2)));
    int _1548 = _1544 & 3;
    float _1550 = (*spvDescriptorSet0.vp_c9)._m0[int(_1546)][_1548];
    float _1552 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1554 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1556 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1558 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1560 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1552);
    float _1562 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1554);
    float _1564 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1556);
    int _1566 = _787 + 8;
    uint _1568 = uint(int(uint(_1566) >> uint(2)));
    uint _1570 = uint(int(uint(int(_1568)) >> uint(2)));
    int _1572 = int(_1568) & 3;
    float _1574 = (*spvDescriptorSet0.vp_c9)._m0[int(_1570)][_1572];
    float _1576 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1560);
    float _1578 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1562);
    float _1580 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1558);
    float _1582 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1564);
    float _1584 = _1576 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1586 = _1578 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1588 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1580);
    float _1590 = _1582 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1592 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1594 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1596 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1598 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1600 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1592);
    float _1602 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1594);
    float _1604 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1596);
    float _1606 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1598);
    float _1608 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1600);
    float _1610 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1602);
    float _1612 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1604);
    float _1614 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1606);
    float _1616 = _1588 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1618 = _1321 * _1506;
    float _1620 = _1353 * _1534;
    float _1622 = _1494 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1624 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1608);
    float _1626 = _1622 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1628 = _1343 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1630 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1610);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1632 = _1516 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1634 = _1524 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_48.x = _1618;
    out.m_48.y = _1620;
    float _1636 = _1632 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1638 = _1634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1640 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1612);
    float _1642 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1614);
    float _1644 = _1542 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1646 = _1550 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_50.x = _1636;
    out.m_50.y = _1638;
    out.m_50.z = _1626;
    float _1648 = _1644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1624;
    out.gl_Position.y = _1630;
    out.gl_Position.z = _1640;
    out.gl_Position.w = _1642;
    float _1650 = _1574 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1652 = _1646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1654 = _1650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_52.x = _1648;
    out.m_52.y = _1652;
    out.m_52.z = _1654;
    out.m_52.w = _1628;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _809 = false;
    bool _649 = false;
    bool _487 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_26.w;
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
        out.m_29.x = 0.0;
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
        float _1711 = as_type<float>(_87);
        out.gl_Position.z = _1711;
    }
    if (!_75)
    {
        return out;
    }
    float _91 = in.m_31.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _107 = _105;
    if (_101)
    {
        float _109 = float(_71);
        _81 = _109;
    }
    float _111 = _81;
    bool _113 = _105 >= _111;
    bool _115 = !_101;
    bool _117 = _113 || _115;
    float _119 = _111;
    if (_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (_117)
    {
        out.m_29.x = 0.0;
    }
    if (_117)
    {
        float _125 = _121 * 5.0;
        _89 = as_type<int>(_125);
    }
    int _127 = _89;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1782 = as_type<float>(_127);
        out.gl_Position.z = _1782;
    }
    if (_117)
    {
        return out;
    }
    float _129 = in.m_31.x;
    float _131 = in.m_31.y;
    float _133 = in.m_31.z;
    float _135 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = 0.0;
    float _149 = _135;
    if (!_145)
    {
        float _151 = _135 * _135;
        float _153 = _151 * 0.5;
        _147 = _153;
    }
    float _155 = _147;
    float _157 = 0.0;
    float _159 = _155;
    if (!_145)
    {
        float _161 = _105 * _105;
        float _163 = _161 * 0.5;
        _157 = _163;
    }
    float _165 = _157;
    if (!_145)
    {
        float _167 = _155 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _159 = _167;
    }
    float _169 = _159;
    bool _171 = !_145;
    float _173 = _169;
    float _175 = 0.0;
    if (!_171)
    {
        float _177 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _179 = log2(_177);
        float _181 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _183 = _181 + 1.0;
        float _185 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _187 = _135 * _179;
        float _189 = 1.0 / _183;
        float _191 = _185 * 0.693147182464599609375;
        float _193 = exp2(_187);
        float _195 = 1.0 / _191;
        float _197 = _193 + (-1.0);
        float _199 = -_197;
        float _201 = fma(_199, _195, _135);
        float _203 = _201 * _189;
        float _205 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _123 = _191;
        _173 = _205;
        _175 = _193;
    }
    float _207 = _123;
    float _209 = _173;
    float _211 = _175;
    bool _213 = !_145;
    float _215 = _207;
    float _217 = _211;
    if (!_213)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = 1.0 / _225;
        float _229 = _135 * _221;
        float _231 = exp2(_229);
        float _233 = -_231;
        float _235 = _233 + 1.0;
        float _237 = _235 * _227;
        _215 = _231;
        _217 = _225;
        _149 = _237;
    }
    float _239 = _215;
    float _241 = _217;
    float _243 = _149;
    float _245 = _241;
    float _247 = _239;
    if (!_145)
    {
        _245 = _105;
    }
    float _249 = _245;
    float _251 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _253 = _249;
    if (!_145)
    {
        float _255 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _247 = _255;
    }
    float _257 = _247;
    bool _259 = !_145;
    float _261 = _257;
    if (!_259)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _273 = _105 * _265;
        float _275 = 1.0 / _269;
        float _277 = _271 * 0.693147182464599609375;
        float _279 = exp2(_273);
        float _281 = 1.0 / _277;
        float _283 = _279 + (-1.0);
        float _285 = -_283;
        float _287 = fma(_285, _281, _105);
        float _289 = _287 * _275;
        float _291 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _261 = _291;
    }
    float _293 = _261;
    bool _295 = !_145;
    if (!_295)
    {
        float _297 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = log2(_297);
        float _301 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _303 = _301 + 1.0;
        float _305 = 1.0 / _303;
        float _307 = _105 * _299;
        float _309 = exp2(_307);
        float _311 = -_309;
        float _313 = _311 + 1.0;
        float _315 = _313 * _305;
        _253 = _315;
    }
    float _317 = _253;
    float _319 = fma(_243, _129, _251);
    float _321 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _323 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _325 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _327 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _329 = fma(_243, _131, _321);
    float _331 = fma(_317, _131, _323);
    float _333 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _335 = fma(_243, _133, _325);
    float _337 = fma(_317, _129, _327);
    float _339 = -_331;
    float _341 = _329 + _339;
    float _343 = fma(_317, _133, _333);
    float _345 = in.m_33.y;
    float _347 = -_337;
    float _349 = _319 + _347;
    float _351 = _341 * _341;
    float _353 = -_343;
    float _355 = _335 + _353;
    float _357 = in.m_35.y;
    float _359 = fma(_349, _349, _351);
    float _361 = in.m_37.y;
    float _363 = fma(_355, _355, _359);
    float _365 = in.m_33.x;
    float _367 = in.m_35.x;
    float _369 = sqrt(_363);
    float _371 = in.m_37.x;
    float _373 = in.m_33.z;
    float _375 = _341 * _345;
    float _377 = in.m_35.z;
    float _379 = _341 * _357;
    float _381 = in.m_37.z;
    bool _383 = _369 >= 9.9999999747524270787835121154785e-07;
    bool _385 = isnan(_369);
    bool _387 = _383 || _385;
    bool _389 = isnan(9.9999999747524270787835121154785e-07);
    bool _391 = _387 || _389;
    float _393 = _341 * _361;
    float _395 = _345 * _345;
    float _397 = in.m_39.w;
    float _399 = fma(_349, _365, _375);
    float _401 = fma(_357, _357, _395);
    float _403 = in.m_26.x;
    float _405 = in.m_26.y;
    float _407 = in.m_26.z;
    float _409 = fma(_349, _367, _379);
    float _411 = fma(_361, _361, _401);
    float _413 = fma(_349, _371, _393);
    float _415 = fma(_355, _373, _399);
    float _417 = fma(_355, _377, _409);
    float _419 = fma(_355, _381, _413);
    float _421 = _413;
    float _423 = _399;
    float _425 = _415;
    if (_391)
    {
        _421 = _415;
    }
    float _427 = _421;
    float _429 = _427;
    float _431 = _427;
    if (_391)
    {
        _423 = _417;
    }
    float _433 = _423;
    float _435 = _433;
    float _437 = _433;
    if (_391)
    {
        _425 = _419;
    }
    float _439 = _425;
    float _441 = fma(_319, _397, _403);
    float _443 = fma(_329, _397, _405);
    float _445 = fma(_335, _397, _407);
    float _447 = _439;
    if (!_391)
    {
        bool _449 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _451 = !_449;
        if (!_451)
        {
            float _453 = _345 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _455 = _357 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _457 = _361 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _459 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[16].x, _453);
            float _461 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[16].x, _455);
            float _463 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[16].x, _457);
            float _465 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[16].z, _459);
            float _467 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[16].z, _461);
            float _469 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[16].z, _463);
            float _471 = _465 * _465;
            float _473 = fma(_467, _467, _471);
            float _475 = fma(_469, _469, _473);
            float _477 = rsqrt(_475);
            float _479 = _477 * 9.9999999747524270787835121154785e-07;
            float _481 = _467 * _479;
            float _483 = _465 * _479;
            float _485 = _469 * _479;
            _431 = _483;
            _437 = _481;
            _447 = _485;
            _487 = true;
        }
        else
        {
            float _489 = _131 * _131;
            float _491 = fma(_129, _129, _489);
            float _493 = fma(_133, _133, _491);
            float _495 = sqrt(_493);
            bool _497 = _495 >= 9.9999999747524270787835121154785e-07;
            bool _499 = isnan(_495);
            bool _501 = _497 || _499;
            bool _503 = isnan(9.9999999747524270787835121154785e-07);
            bool _505 = _501 || _503;
            float _507 = _495;
            if (!_505)
            {
                float _509 = _405 * _405;
                float _511 = fma(_403, _403, _509);
                float _513 = fma(_407, _407, _511);
                float _515 = sqrt(_513);
                bool _517 = _515 >= 9.9999999747524270787835121154785e-07;
                bool _519 = isnan(_515);
                bool _521 = _517 || _519;
                bool _523 = isnan(9.9999999747524270787835121154785e-07);
                bool _525 = _521 || _523;
                float _527 = _411;
                if (!_525)
                {
                    float _529 = rsqrt(_411);
                    _527 = _529;
                }
                float _531 = _527;
                if (!_525)
                {
                    float _533 = _531 * 9.9999999747524270787835121154785e-07;
                    _507 = _533;
                }
                float _535 = _507;
                float _537 = _535;
                if (!_525)
                {
                    float _539 = _357 * _535;
                    _435 = _539;
                }
                float _541 = _435;
                _437 = _541;
                if (!_525)
                {
                    float _543 = _345 * _535;
                    _429 = _543;
                }
                float _545 = _429;
                _431 = _545;
                if (!_525)
                {
                    float _547 = _361 * _535;
                    _537 = _547;
                }
                float _549 = _537;
                bool _551 = !_525;
                _447 = _549;
                _487 = _551;
                if (!_487)
                {
                    float _553 = _345 * _405;
                    float _555 = _357 * _405;
                    float _557 = _361 * _405;
                    float _559 = fma(_403, _365, _553);
                    float _561 = fma(_403, _367, _555);
                    float _563 = fma(_403, _371, _557);
                    float _565 = fma(_407, _373, _559);
                    float _567 = fma(_407, _377, _561);
                    float _569 = fma(_407, _381, _563);
                    float _571 = _565 * _565;
                    float _573 = fma(_567, _567, _571);
                    float _575 = fma(_569, _569, _573);
                    float _577 = rsqrt(_575);
                    float _579 = _577 * 9.9999999747524270787835121154785e-07;
                    float _581 = _567 * _579;
                    float _583 = _565 * _579;
                    float _585 = _569 * _579;
                    _431 = _583;
                    _437 = _581;
                    _447 = _585;
                    _487 = true;
                }
            }
            else
            {
                float _587 = _345 * _131;
                float _589 = _357 * _131;
                float _591 = _361 * _131;
                float _593 = fma(_129, _365, _587);
                float _595 = fma(_129, _367, _589);
                float _597 = fma(_129, _371, _591);
                float _599 = fma(_133, _373, _593);
                float _601 = fma(_133, _377, _595);
                float _603 = fma(_133, _381, _597);
                float _605 = _599 * _599;
                float _607 = fma(_601, _601, _605);
                float _609 = fma(_603, _603, _607);
                float _611 = rsqrt(_609);
                float _613 = _611 * 9.9999999747524270787835121154785e-07;
                float _615 = _601 * _613;
                float _617 = _599 * _613;
                float _619 = _603 * _613;
                _431 = _617;
                _437 = _615;
                _447 = _619;
            }
        }
    }
    _487 = false;
    float _621 = _431;
    float _623 = _437;
    float _625 = _447;
    bool _627 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _629 = !_627;
    float _647;
    if (!_629)
    {
        float _631 = in.m_41.x;
        float _633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _635 = _631 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _637 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _639 = _637 * _633;
        float _641 = floor(_639);
        float _643 = -_641;
        float _645 = _639 + _643;
        _647 = _645;
        _649 = true;
    }
    else
    {
        float _651 = float(_71);
        float _653 = 1.0 / _651;
        float _655 = _105 * _653;
        _647 = _655;
    }
    _649 = false;
    float _657 = _647;
    float _659 = in.m_41.x;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _663 = _657 + _661;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _667 = _657 + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _669;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _677 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _679 = 1.0 / _675;
    bool _681 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _683 = 1.0 / _671;
    float _685 = _677 * _659;
    float _687 = _663 * _679;
    bool _689 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _691 = isnan(_657);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    bool _701 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _703 = isnan(_657);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = -_699;
    float _715 = _713 + 1.0;
    float _717 = _667 * _683;
    bool _719 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _721 = isnan(_657);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _731;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _735;
    float _739 = _729 * _715;
    float _741 = -_729;
    float _743 = _741 + 1.0;
    float _745 = fma(_733, _717, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _747 = fma(_737, _717, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _749 = _711 * _743;
    float _751 = trunc(_685);
    int _753 = int(_751);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _759 = -_711;
    float _761 = _759 + 1.0;
    float _763 = _745 * _749;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _769 = _747 * _749;
    float _771 = fma(_757, _687, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _773 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[143].x, _763);
    float _775 = fma(_767, _687, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _777 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[143].y, _769);
    float _779 = fma(_771, _739, _773);
    float _781 = fma(_775, _739, _777);
    float _783 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[145].x, _779);
    int _785 = _753 << 4;
    int _787 = _785 + 1712;
    float _789 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[145].y, _781);
    bool _791 = !_681;
    float _807;
    if (!_791)
    {
        float _793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _795 = _659 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _797 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _799 = _797 * _793;
        float _801 = floor(_799);
        float _803 = -_801;
        float _805 = _799 + _803;
        _807 = _805;
        _809 = true;
    }
    else
    {
        float _811 = float(_71);
        float _813 = 1.0 / _811;
        float _815 = _105 * _813;
        _807 = _815;
    }
    _809 = false;
    float _817 = _807;
    float _819 = in.m_41.z;
    float _821 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _823 = log2(_821);
    float _825 = _443 * _357;
    float _827 = as_type<float>(int(gl_VertexIndex));
    float _829 = _443 * _345;
    float _831 = _443 * _361;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _835 = 1.0 + _833;
    float _837 = fma(_441, _367, _825);
    float _839 = _659 * 2.0;
    float _841 = fma(_441, _365, _829);
    float _843 = fma(_441, _371, _831);
    float _845 = 1.0 / _835;
    float _847 = in.m_41.y;
    float _849 = fma(_445, _373, _841);
    float _851 = _823 * _105;
    float _853 = in.m_35.w;
    float _855 = floor(_839);
    float _857 = _819 * 2.0;
    float _859 = exp2(_851);
    int _861 = as_type<int>(_827) & 1;
    bool _863 = _861 != 0;
    int _865 = as_type<int>(_827) & 2;
    bool _867 = _865 != 0;
    bool _869 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _871 = isnan(1.0);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _877 = _873 || _875;
    bool _879 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _881 = isnan(0.0);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _887 = _883 || _885;
    float _889 = floor(_857);
    float _891 = in.m_39.x;
    float _893 = in.m_39.y;
    float _895 = -_859;
    float _897 = _895 + 1.0;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _901 = _899 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _903 = _887 ? _897 : 0.0;
    float _905 = 1.0 / _901;
    bool _907 = _889 > 0.0;
    bool _909 = _889 >= 0.0;
    bool _911 = isnan(_889);
    bool _913 = _909 || _911;
    bool _915 = isnan(0.0);
    bool _917 = _913 || _915;
    if (_877)
    {
        float _919 = _903 * _845;
        _107 = _919;
    }
    float _921 = _107;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _925 = _923 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _927 = _917 ? 0 : 1;
    float _929 = fma(_445, _377, _837);
    bool _931 = _855 >= 0.0;
    bool _933 = isnan(_855);
    bool _935 = _931 || _933;
    bool _937 = isnan(0.0);
    bool _939 = _935 || _937;
    float _941 = 1.0 / _925;
    int _943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _945 = _943 != 0;
    float _947 = fma(_445, _381, _843);
    int _949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _951 = _949 != 0;
    float _953 = _847 * 2.0;
    float _955 = _659 + _847;
    int _957 = ~_927;
    int _959 = _957 + 1;
    int _961 = _959 + 1;
    float _963 = _929 + _853;
    int _965 = _961;
    if (!_907)
    {
        int _967 = ~_927;
        int _969 = _967 + 1;
        _965 = _969;
    }
    int _971 = _965;
    float _973 = _789 * _893;
    int _975 = _939 ? 0 : 1;
    float _977 = _955 + (-1.0);
    int _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _981 = _979 != 0;
    int _983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _985 = _983 != 0;
    int _987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _989 = _987 != 0;
    float _991 = _783 * _891;
    float _993 = _847 + _819;
    float _995 = floor(_953);
    bool _997 = !_985;
    int _999 = _997 ? 0 : 1;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1001;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1009 = _993 + (-1.0);
    bool _1011 = _855 > 0.0;
    float _1013 = _621 * _621;
    float _1015 = _1003 * _905;
    float _1017 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1019 = _1007 * _941;
    float _1021 = fma(_623, _623, _1013);
    float _1023 = in.m_46.x;
    float _1025 = in.m_46.y;
    float _1027 = in.m_46.z;
    int _1029 = abs(_999);
    float _1031 = fma(_625, _625, _1021);
    int _1033 = ~_975;
    int _1035 = _1033 + 1;
    int _1037 = _1035 + 1;
    float _1039 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1041 = float(_1029);
    float _1043 = rsqrt(_1031);
    int _1045 = _1037;
    if (!_1011)
    {
        int _1047 = ~_975;
        int _1049 = _1047 + 1;
        _1045 = _1049;
    }
    int _1051 = _1045;
    float _1053 = _659 + _819;
    bool _1055 = !_981;
    int _1057 = _1055 ? 0 : 1;
    float _1059 = in.m_37.w;
    float _1061 = float(_1051);
    float _1063 = _1053 + (-1.0);
    int _1065 = abs(_1057);
    float _1067 = _973 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1069 = _995 > 0.0;
    float _1071 = _1041 * _1061;
    bool _1073 = _995 >= 0.0;
    bool _1075 = isnan(_995);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan(0.0);
    bool _1081 = _1077 || _1079;
    float _1083 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1085 = float(_1065);
    float _1087 = _1071 * (-2.0);
    float _1089 = float(_971);
    float _1091 = _1043 * _625;
    int _1093 = _1081 ? 0 : 1;
    float _1095 = fma(_1087, _1025, _1025);
    bool _1097 = _847 > 0.5;
    float _1099 = fma(_1017, _1087, _1017);
    float _1101 = _847 + (-0.5);
    float _1103 = _1085 * _1089;
    float _1105 = _1043 * _623;
    float _1107 = _1043 * _621;
    float _1109 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1111 = _1091 * _1109;
    float _1113 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1095);
    int _1115 = ~_1093;
    int _1117 = _1115 + 1;
    int _1119 = _1117 + 1;
    float _1121 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1123 = _1107 * _1121;
    float _1125 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1127 = -_1111;
    float _1129 = fma(_1105, _1125, _1127);
    int _1131 = _1119;
    if (!_1069)
    {
        int _1133 = ~_1093;
        int _1135 = _1133 + 1;
        _1131 = _1135;
    }
    int _1137 = _1131;
    float _1139 = fma(_1099, _921, _1113);
    float _1141 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1143 = _1105 * _1141;
    float _1145 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1147 = -_1123;
    float _1149 = fma(_1091, _1145, _1147);
    float _1151 = _1129 * _1129;
    float _1153 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1155 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1157 = -_1143;
    float _1159 = fma(_1107, _1155, _1157);
    bool _1161 = !_989;
    int _1163 = _1161 ? 0 : 1;
    float _1165 = fma(_1149, _1149, _1151);
    bool _1167 = _659 > 0.5;
    float _1169 = _1153 * _659;
    float _1171 = _659 + (-0.5);
    float _1173 = fma(_1159, _1159, _1165);
    float _1175 = _1103 * (-2.0);
    int _1177 = abs(_1163);
    float _1179 = _1139 * 0.15915493667125701904296875;
    float _1181 = float(_1137);
    float _1183 = fma(_1175, _1023, _1023);
    float _1185 = float(_1177);
    float _1187 = fma(_1039, _1175, _1039);
    float _1189 = in.m_33.w;
    float _1191 = fma(_1171, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1183);
    bool _1193 = _817 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1195 = isnan(_817);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1201 = _1197 || _1199;
    float _1203 = float(_1201);
    float _1205 = _1185 * _1181;
    bool _1207 = _817 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1209 = isnan(_817);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1215 = _1211 || _1213;
    float _1217 = float(_1215);
    float _1219 = fma(_1187, _921, _1191);
    float _1221 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1223 = _817 + _1221;
    float _1225 = _1205 * (-2.0);
    float _1227 = -_1203;
    float _1229 = _1227 + 1.0;
    bool _1231 = _817 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1233 = isnan(_817);
    bool _1235 = _1231 || _1233;
    bool _1237 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1239 = _1235 || _1237;
    float _1241 = float(_1239);
    float _1243 = _1219 * 0.15915493667125701904296875;
    float _1245 = fma(_1225, _1027, _1027);
    float _1247 = _1217 * _1229;
    float _1249 = -_1217;
    float _1251 = _1249 + 1.0;
    float _1253 = _819 + (-0.5);
    float _1255 = fma(_1015, _1223, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1257 = fma(_1083, _1225, _1083);
    float _1259 = _1241 * _1251;
    float _1261 = fma(_1253, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1245);
    float _1263 = -_1241;
    float _1265 = _1263 + 1.0;
    float _1267 = _1255 * _1259;
    float _1269 = fma(_1257, _921, _1261);
    bool _1271 = !_863;
    float _1273 = _1271 ? (-0.5) : 0.5;
    float _1275 = _947 + _1059;
    float _1277 = fma(_1265, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1267);
    float _1279 = _1269 * 0.15915493667125701904296875;
    float _1281 = -_1273;
    int _1283 = _1167 ? as_type<int>(_1281) : as_type<int>(_1273);
    float _1285 = rsqrt(_1173);
    float _1287 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1289 = _817 + _1287;
    float _1291 = _991 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1293 = !_945;
    float _1295 = _1293 ? _1273 : as_type<float>(_1283);
    float _1297 = _849 + _1189;
    float _1299 = fma(_1019, _1289, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1301 = !_867;
    float _1303 = _1301 ? (-0.5) : 0.5;
    float _1305 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1273);
    float _1307 = _1179 * 6.283185482025146484375;
    float _1309 = sin(_1307);
    float _1311 = _1295 + 0.5;
    float _1313 = -_1303;
    int _1315 = _1097 ? as_type<int>(_1313) : as_type<int>(_1303);
    float _1317 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1303);
    float _1319 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1321 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1323 = !_951;
    float _1325 = _1323 ? _1303 : as_type<float>(_1315);
    float _1327 = _1291 * _1305;
    float _1329 = _1179 * 6.283185482025146484375;
    float _1331 = cos(_1329);
    float _1333 = _1067 * _1317;
    float _1335 = fma(_1299, _1247, _1277);
    float _1337 = _1149 * _1285;
    float _1339 = _1129 * _1285;
    float _1341 = _1159 * _1285;
    float _1343 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1335);
    float _1345 = -_1325;
    float _1347 = _1345 + 0.5;
    float _1349 = _1243 * 6.283185482025146484375;
    float _1351 = sin(_1349);
    float _1353 = _1347 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1355 = _1243 * 6.283185482025146484375;
    float _1357 = cos(_1355);
    float _1359 = _1279 * 6.283185482025146484375;
    float _1361 = cos(_1359);
    float _1363 = _1351 * _1309;
    float _1365 = _1351 * _1331;
    float _1367 = _1279 * 6.283185482025146484375;
    float _1369 = sin(_1367);
    float _1371 = _1357 * _1331;
    float _1373 = _1357 * _1309;
    float _1375 = _1357 * _1361;
    float _1377 = _1351 * _1361;
    float _1379 = _1331 * _1361;
    float _1381 = _1309 * _1361;
    float _1383 = trunc(_1169);
    int _1385 = int(_1383);
    float _1387 = _1375 * _1091;
    float _1389 = _1375 * _1105;
    float _1391 = _1375 * _1107;
    float _1393 = fma(_1369, _1371, _1363);
    float _1395 = fma(_1369, _1363, _1371);
    float _1397 = -_1373;
    float _1399 = fma(_1369, _1365, _1397);
    float _1401 = -_1365;
    float _1403 = fma(_1369, _1373, _1401);
    float _1405 = _1107 * _1341;
    float _1407 = _1105 * _1339;
    float _1409 = -_1369;
    float _1411 = fma(_1409, _1341, _1387);
    float _1413 = -_1369;
    float _1415 = fma(_1413, _1337, _1389);
    float _1417 = _1393 * _1105;
    float _1419 = _1393 * _1107;
    float _1421 = _1393 * _1091;
    float _1423 = _1091 * _1337;
    float _1425 = -_1369;
    float _1427 = fma(_1425, _1339, _1391);
    float _1429 = _1403 * _1105;
    float _1431 = -_1405;
    float _1433 = fma(_1091, _1339, _1431);
    float _1435 = -_1407;
    float _1437 = fma(_1107, _1337, _1435);
    float _1439 = _1403 * _1107;
    float _1441 = _1403 * _1091;
    float _1443 = fma(_1379, _1337, _1417);
    float _1445 = fma(_1379, _1339, _1419);
    float _1447 = fma(_1379, _1341, _1421);
    float _1449 = -_1423;
    float _1451 = fma(_1105, _1341, _1449);
    float _1453 = fma(_1381, _1337, _1429);
    float _1455 = fma(_1377, _1433, _1415);
    float _1457 = fma(_1377, _1437, _1411);
    float _1459 = fma(_1381, _1341, _1441);
    float _1461 = fma(_1399, _1433, _1443);
    float _1463 = fma(_1399, _1451, _1445);
    float _1465 = fma(_1377, _1451, _1427);
    float _1467 = fma(_1399, _1437, _1447);
    float _1469 = _1333 * _1455;
    int _1471 = _1385 << 4;
    int _1473 = _1471 + 1968;
    float _1475 = fma(_1381, _1339, _1439);
    float _1477 = _1333 * _1457;
    float _1479 = fma(_1395, _1433, _1453);
    float _1481 = _1333 * _1465;
    float _1483 = fma(_1327, _1461, _1469);
    int _1485 = _1473 + 8;
    uint _1488 = uint(int(uint(_1485) >> uint(2)));
    uint _1490 = uint(int(uint(int(_1488)) >> uint(2)));
    int _1492 = int(_1488) & 3;
    float _1494 = (*spvDescriptorSet0.vp_c9)._m0[int(_1490)][_1492];
    float _1496 = fma(_1395, _1451, _1475);
    float _1498 = fma(_1395, _1437, _1459);
    float _1500 = fma(_1327, _1467, _1477);
    float _1502 = fma(_1327, _1463, _1481);
    float _1504 = fma(_1319, _1479, _1483);
    float _1506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1508 = fma(_1319, _1498, _1500);
    uint _1510 = uint(int(uint(_1473) >> uint(2)));
    uint _1512 = uint(int(uint(int(_1510)) >> uint(2)));
    int _1514 = int(_1510) & 3;
    float _1516 = (*spvDescriptorSet0.vp_c9)._m0[int(_1512)][_1514];
    int _1518 = int(_1510) + 1;
    uint _1520 = uint(int(uint(_1518) >> uint(2)));
    int _1522 = _1518 & 3;
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[int(_1520)][_1522];
    float _1526 = fma(_1319, _1496, _1502);
    float _1528 = _963 + _1504;
    float _1530 = _1275 + _1508;
    float _1532 = _1297 + _1526;
    float _1534 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _1536 = uint(int(uint(_787) >> uint(2)));
    uint _1538 = uint(int(uint(int(_1536)) >> uint(2)));
    int _1540 = int(_1536) & 3;
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[int(_1538)][_1540];
    int _1544 = int(_1536) + 1;
    uint _1546 = uint(int(uint(_1544) >> uint(2)));
    int _1548 = _1544 & 3;
    float _1550 = (*spvDescriptorSet0.vp_c9)._m0[int(_1546)][_1548];
    float _1552 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1554 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1556 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1558 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1560 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1552);
    float _1562 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1554);
    float _1564 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1556);
    int _1566 = _787 + 8;
    uint _1568 = uint(int(uint(_1566) >> uint(2)));
    uint _1570 = uint(int(uint(int(_1568)) >> uint(2)));
    int _1572 = int(_1568) & 3;
    float _1574 = (*spvDescriptorSet0.vp_c9)._m0[int(_1570)][_1572];
    float _1576 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1560);
    float _1578 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1562);
    float _1580 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1558);
    float _1582 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1564);
    float _1584 = _1576 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1586 = _1578 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1588 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1580);
    float _1590 = _1582 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1592 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1594 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1596 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1598 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1600 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1592);
    float _1602 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1594);
    float _1604 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1596);
    float _1606 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1598);
    float _1608 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1600);
    float _1610 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1602);
    float _1612 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1604);
    float _1614 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1606);
    float _1616 = _1588 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1618 = _1321 * _1506;
    float _1620 = _1353 * _1534;
    float _1622 = _1494 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1624 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1608);
    float _1626 = _1622 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1628 = _1343 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1630 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1610);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1632 = _1516 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1634 = _1524 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_48.x = _1618;
    out.m_48.y = _1620;
    float _1636 = _1632 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1638 = _1634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1640 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1612);
    float _1642 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1614);
    float _1644 = _1542 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1646 = _1550 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_50.x = _1636;
    out.m_50.y = _1638;
    out.m_50.z = _1626;
    float _1648 = _1644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1624;
    out.gl_Position.y = _1630;
    out.gl_Position.z = _1640;
    out.gl_Position.w = _1642;
    float _1650 = _1574 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1652 = _1646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1654 = _1650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_52.x = _1648;
    out.m_52.y = _1652;
    out.m_52.z = _1654;
    out.m_52.w = _1628;
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
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _809 = false;
    bool _649 = false;
    bool _487 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_26.w;
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
        out.m_29.x = 0.0;
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
        float _1711 = as_type<float>(_87);
        out.gl_Position.z = _1711;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _91 = in.m_31.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _107 = _105;
    if (_101)
    {
        float _109 = float(_71);
        _81 = _109;
    }
    float _111 = _81;
    bool _113 = _105 >= _111;
    bool _115 = !_101;
    bool _117 = _113 || _115;
    float _119 = _111;
    if (_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (_117)
    {
        out.m_29.x = 0.0;
    }
    if (_117)
    {
        float _125 = _121 * 5.0;
        _89 = as_type<int>(_125);
    }
    int _127 = _89;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1782 = as_type<float>(_127);
        out.gl_Position.z = _1782;
    }
    if (_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_31.x;
    float _131 = in.m_31.y;
    float _133 = in.m_31.z;
    float _135 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = 0.0;
    float _149 = _135;
    if (!_145)
    {
        float _151 = _135 * _135;
        float _153 = _151 * 0.5;
        _147 = _153;
    }
    float _155 = _147;
    float _157 = 0.0;
    float _159 = _155;
    if (!_145)
    {
        float _161 = _105 * _105;
        float _163 = _161 * 0.5;
        _157 = _163;
    }
    float _165 = _157;
    if (!_145)
    {
        float _167 = _155 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _159 = _167;
    }
    float _169 = _159;
    bool _171 = !_145;
    float _173 = _169;
    float _175 = 0.0;
    if (!_171)
    {
        float _177 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _179 = log2(_177);
        float _181 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _183 = _181 + 1.0;
        float _185 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _187 = _135 * _179;
        float _189 = 1.0 / _183;
        float _191 = _185 * 0.693147182464599609375;
        float _193 = exp2(_187);
        float _195 = 1.0 / _191;
        float _197 = _193 + (-1.0);
        float _199 = -_197;
        float _201 = fma(_199, _195, _135);
        float _203 = _201 * _189;
        float _205 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _123 = _191;
        _173 = _205;
        _175 = _193;
    }
    float _207 = _123;
    float _209 = _173;
    float _211 = _175;
    bool _213 = !_145;
    float _215 = _207;
    float _217 = _211;
    if (!_213)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = 1.0 / _225;
        float _229 = _135 * _221;
        float _231 = exp2(_229);
        float _233 = -_231;
        float _235 = _233 + 1.0;
        float _237 = _235 * _227;
        _215 = _231;
        _217 = _225;
        _149 = _237;
    }
    float _239 = _215;
    float _241 = _217;
    float _243 = _149;
    float _245 = _241;
    float _247 = _239;
    if (!_145)
    {
        _245 = _105;
    }
    float _249 = _245;
    float _251 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _253 = _249;
    if (!_145)
    {
        float _255 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _247 = _255;
    }
    float _257 = _247;
    bool _259 = !_145;
    float _261 = _257;
    if (!_259)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _273 = _105 * _265;
        float _275 = 1.0 / _269;
        float _277 = _271 * 0.693147182464599609375;
        float _279 = exp2(_273);
        float _281 = 1.0 / _277;
        float _283 = _279 + (-1.0);
        float _285 = -_283;
        float _287 = fma(_285, _281, _105);
        float _289 = _287 * _275;
        float _291 = _289 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _261 = _291;
    }
    float _293 = _261;
    bool _295 = !_145;
    if (!_295)
    {
        float _297 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = log2(_297);
        float _301 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _303 = _301 + 1.0;
        float _305 = 1.0 / _303;
        float _307 = _105 * _299;
        float _309 = exp2(_307);
        float _311 = -_309;
        float _313 = _311 + 1.0;
        float _315 = _313 * _305;
        _253 = _315;
    }
    float _317 = _253;
    float _319 = fma(_243, _129, _251);
    float _321 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _323 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _325 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _327 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _329 = fma(_243, _131, _321);
    float _331 = fma(_317, _131, _323);
    float _333 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _335 = fma(_243, _133, _325);
    float _337 = fma(_317, _129, _327);
    float _339 = -_331;
    float _341 = _329 + _339;
    float _343 = fma(_317, _133, _333);
    float _345 = in.m_33.y;
    float _347 = -_337;
    float _349 = _319 + _347;
    float _351 = _341 * _341;
    float _353 = -_343;
    float _355 = _335 + _353;
    float _357 = in.m_35.y;
    float _359 = fma(_349, _349, _351);
    float _361 = in.m_37.y;
    float _363 = fma(_355, _355, _359);
    float _365 = in.m_33.x;
    float _367 = in.m_35.x;
    float _369 = sqrt(_363);
    float _371 = in.m_37.x;
    float _373 = in.m_33.z;
    float _375 = _341 * _345;
    float _377 = in.m_35.z;
    float _379 = _341 * _357;
    float _381 = in.m_37.z;
    bool _383 = _369 >= 9.9999999747524270787835121154785e-07;
    bool _385 = isnan(_369);
    bool _387 = _383 || _385;
    bool _389 = isnan(9.9999999747524270787835121154785e-07);
    bool _391 = _387 || _389;
    float _393 = _341 * _361;
    float _395 = _345 * _345;
    float _397 = in.m_39.w;
    float _399 = fma(_349, _365, _375);
    float _401 = fma(_357, _357, _395);
    float _403 = in.m_26.x;
    float _405 = in.m_26.y;
    float _407 = in.m_26.z;
    float _409 = fma(_349, _367, _379);
    float _411 = fma(_361, _361, _401);
    float _413 = fma(_349, _371, _393);
    float _415 = fma(_355, _373, _399);
    float _417 = fma(_355, _377, _409);
    float _419 = fma(_355, _381, _413);
    float _421 = _413;
    float _423 = _399;
    float _425 = _415;
    if (_391)
    {
        _421 = _415;
    }
    float _427 = _421;
    float _429 = _427;
    float _431 = _427;
    if (_391)
    {
        _423 = _417;
    }
    float _433 = _423;
    float _435 = _433;
    float _437 = _433;
    if (_391)
    {
        _425 = _419;
    }
    float _439 = _425;
    float _441 = fma(_319, _397, _403);
    float _443 = fma(_329, _397, _405);
    float _445 = fma(_335, _397, _407);
    float _447 = _439;
    if (!_391)
    {
        bool _449 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _451 = !_449;
        if (!_451)
        {
            float _453 = _345 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _455 = _357 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _457 = _361 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _459 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[16].x, _453);
            float _461 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[16].x, _455);
            float _463 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[16].x, _457);
            float _465 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[16].z, _459);
            float _467 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[16].z, _461);
            float _469 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[16].z, _463);
            float _471 = _465 * _465;
            float _473 = fma(_467, _467, _471);
            float _475 = fma(_469, _469, _473);
            float _477 = rsqrt(_475);
            float _479 = _477 * 9.9999999747524270787835121154785e-07;
            float _481 = _467 * _479;
            float _483 = _465 * _479;
            float _485 = _469 * _479;
            _431 = _483;
            _437 = _481;
            _447 = _485;
            _487 = true;
        }
        else
        {
            float _489 = _131 * _131;
            float _491 = fma(_129, _129, _489);
            float _493 = fma(_133, _133, _491);
            float _495 = sqrt(_493);
            bool _497 = _495 >= 9.9999999747524270787835121154785e-07;
            bool _499 = isnan(_495);
            bool _501 = _497 || _499;
            bool _503 = isnan(9.9999999747524270787835121154785e-07);
            bool _505 = _501 || _503;
            float _507 = _495;
            if (!_505)
            {
                float _509 = _405 * _405;
                float _511 = fma(_403, _403, _509);
                float _513 = fma(_407, _407, _511);
                float _515 = sqrt(_513);
                bool _517 = _515 >= 9.9999999747524270787835121154785e-07;
                bool _519 = isnan(_515);
                bool _521 = _517 || _519;
                bool _523 = isnan(9.9999999747524270787835121154785e-07);
                bool _525 = _521 || _523;
                float _527 = _411;
                if (!_525)
                {
                    float _529 = rsqrt(_411);
                    _527 = _529;
                }
                float _531 = _527;
                if (!_525)
                {
                    float _533 = _531 * 9.9999999747524270787835121154785e-07;
                    _507 = _533;
                }
                float _535 = _507;
                float _537 = _535;
                if (!_525)
                {
                    float _539 = _357 * _535;
                    _435 = _539;
                }
                float _541 = _435;
                _437 = _541;
                if (!_525)
                {
                    float _543 = _345 * _535;
                    _429 = _543;
                }
                float _545 = _429;
                _431 = _545;
                if (!_525)
                {
                    float _547 = _361 * _535;
                    _537 = _547;
                }
                float _549 = _537;
                bool _551 = !_525;
                _447 = _549;
                _487 = _551;
                if (!_487)
                {
                    float _553 = _345 * _405;
                    float _555 = _357 * _405;
                    float _557 = _361 * _405;
                    float _559 = fma(_403, _365, _553);
                    float _561 = fma(_403, _367, _555);
                    float _563 = fma(_403, _371, _557);
                    float _565 = fma(_407, _373, _559);
                    float _567 = fma(_407, _377, _561);
                    float _569 = fma(_407, _381, _563);
                    float _571 = _565 * _565;
                    float _573 = fma(_567, _567, _571);
                    float _575 = fma(_569, _569, _573);
                    float _577 = rsqrt(_575);
                    float _579 = _577 * 9.9999999747524270787835121154785e-07;
                    float _581 = _567 * _579;
                    float _583 = _565 * _579;
                    float _585 = _569 * _579;
                    _431 = _583;
                    _437 = _581;
                    _447 = _585;
                    _487 = true;
                }
            }
            else
            {
                float _587 = _345 * _131;
                float _589 = _357 * _131;
                float _591 = _361 * _131;
                float _593 = fma(_129, _365, _587);
                float _595 = fma(_129, _367, _589);
                float _597 = fma(_129, _371, _591);
                float _599 = fma(_133, _373, _593);
                float _601 = fma(_133, _377, _595);
                float _603 = fma(_133, _381, _597);
                float _605 = _599 * _599;
                float _607 = fma(_601, _601, _605);
                float _609 = fma(_603, _603, _607);
                float _611 = rsqrt(_609);
                float _613 = _611 * 9.9999999747524270787835121154785e-07;
                float _615 = _601 * _613;
                float _617 = _599 * _613;
                float _619 = _603 * _613;
                _431 = _617;
                _437 = _615;
                _447 = _619;
            }
        }
    }
    _487 = false;
    float _621 = _431;
    float _623 = _437;
    float _625 = _447;
    bool _627 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _629 = !_627;
    float _647;
    if (!_629)
    {
        float _631 = in.m_41.x;
        float _633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _635 = _631 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _637 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _639 = _637 * _633;
        float _641 = floor(_639);
        float _643 = -_641;
        float _645 = _639 + _643;
        _647 = _645;
        _649 = true;
    }
    else
    {
        float _651 = float(_71);
        float _653 = 1.0 / _651;
        float _655 = _105 * _653;
        _647 = _655;
    }
    _649 = false;
    float _657 = _647;
    float _659 = in.m_41.x;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _663 = _657 + _661;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _667 = _657 + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _669;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _677 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _679 = 1.0 / _675;
    bool _681 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _683 = 1.0 / _671;
    float _685 = _677 * _659;
    float _687 = _663 * _679;
    bool _689 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _691 = isnan(_657);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    bool _701 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _703 = isnan(_657);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = -_699;
    float _715 = _713 + 1.0;
    float _717 = _667 * _683;
    bool _719 = _657 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _721 = isnan(_657);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _731;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _735;
    float _739 = _729 * _715;
    float _741 = -_729;
    float _743 = _741 + 1.0;
    float _745 = fma(_733, _717, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _747 = fma(_737, _717, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _749 = _711 * _743;
    float _751 = trunc(_685);
    int _753 = int(_751);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _759 = -_711;
    float _761 = _759 + 1.0;
    float _763 = _745 * _749;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _769 = _747 * _749;
    float _771 = fma(_757, _687, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _773 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[143].x, _763);
    float _775 = fma(_767, _687, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _777 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[143].y, _769);
    float _779 = fma(_771, _739, _773);
    float _781 = fma(_775, _739, _777);
    float _783 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[145].x, _779);
    int _785 = _753 << 4;
    int _787 = _785 + 1712;
    float _789 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[145].y, _781);
    bool _791 = !_681;
    float _807;
    if (!_791)
    {
        float _793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _795 = _659 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _797 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _799 = _797 * _793;
        float _801 = floor(_799);
        float _803 = -_801;
        float _805 = _799 + _803;
        _807 = _805;
        _809 = true;
    }
    else
    {
        float _811 = float(_71);
        float _813 = 1.0 / _811;
        float _815 = _105 * _813;
        _807 = _815;
    }
    _809 = false;
    float _817 = _807;
    float _819 = in.m_41.z;
    float _821 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _823 = log2(_821);
    float _825 = _443 * _357;
    float _827 = as_type<float>(int(gl_VertexIndex));
    float _829 = _443 * _345;
    float _831 = _443 * _361;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _835 = 1.0 + _833;
    float _837 = fma(_441, _367, _825);
    float _839 = _659 * 2.0;
    float _841 = fma(_441, _365, _829);
    float _843 = fma(_441, _371, _831);
    float _845 = 1.0 / _835;
    float _847 = in.m_41.y;
    float _849 = fma(_445, _373, _841);
    float _851 = _823 * _105;
    float _853 = in.m_35.w;
    float _855 = floor(_839);
    float _857 = _819 * 2.0;
    float _859 = exp2(_851);
    int _861 = as_type<int>(_827) & 1;
    bool _863 = _861 != 0;
    int _865 = as_type<int>(_827) & 2;
    bool _867 = _865 != 0;
    bool _869 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _871 = isnan(1.0);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _877 = _873 || _875;
    bool _879 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _881 = isnan(0.0);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _887 = _883 || _885;
    float _889 = floor(_857);
    float _891 = in.m_39.x;
    float _893 = in.m_39.y;
    float _895 = -_859;
    float _897 = _895 + 1.0;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _901 = _899 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _903 = _887 ? _897 : 0.0;
    float _905 = 1.0 / _901;
    bool _907 = _889 > 0.0;
    bool _909 = _889 >= 0.0;
    bool _911 = isnan(_889);
    bool _913 = _909 || _911;
    bool _915 = isnan(0.0);
    bool _917 = _913 || _915;
    if (_877)
    {
        float _919 = _903 * _845;
        _107 = _919;
    }
    float _921 = _107;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _925 = _923 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _927 = _917 ? 0 : 1;
    float _929 = fma(_445, _377, _837);
    bool _931 = _855 >= 0.0;
    bool _933 = isnan(_855);
    bool _935 = _931 || _933;
    bool _937 = isnan(0.0);
    bool _939 = _935 || _937;
    float _941 = 1.0 / _925;
    int _943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _945 = _943 != 0;
    float _947 = fma(_445, _381, _843);
    int _949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _951 = _949 != 0;
    float _953 = _847 * 2.0;
    float _955 = _659 + _847;
    int _957 = ~_927;
    int _959 = _957 + 1;
    int _961 = _959 + 1;
    float _963 = _929 + _853;
    int _965 = _961;
    if (!_907)
    {
        int _967 = ~_927;
        int _969 = _967 + 1;
        _965 = _969;
    }
    int _971 = _965;
    float _973 = _789 * _893;
    int _975 = _939 ? 0 : 1;
    float _977 = _955 + (-1.0);
    int _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _981 = _979 != 0;
    int _983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _985 = _983 != 0;
    int _987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _989 = _987 != 0;
    float _991 = _783 * _891;
    float _993 = _847 + _819;
    float _995 = floor(_953);
    bool _997 = !_985;
    int _999 = _997 ? 0 : 1;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1001;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1009 = _993 + (-1.0);
    bool _1011 = _855 > 0.0;
    float _1013 = _621 * _621;
    float _1015 = _1003 * _905;
    float _1017 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1019 = _1007 * _941;
    float _1021 = fma(_623, _623, _1013);
    float _1023 = in.m_46.x;
    float _1025 = in.m_46.y;
    float _1027 = in.m_46.z;
    int _1029 = abs(_999);
    float _1031 = fma(_625, _625, _1021);
    int _1033 = ~_975;
    int _1035 = _1033 + 1;
    int _1037 = _1035 + 1;
    float _1039 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1041 = float(_1029);
    float _1043 = rsqrt(_1031);
    int _1045 = _1037;
    if (!_1011)
    {
        int _1047 = ~_975;
        int _1049 = _1047 + 1;
        _1045 = _1049;
    }
    int _1051 = _1045;
    float _1053 = _659 + _819;
    bool _1055 = !_981;
    int _1057 = _1055 ? 0 : 1;
    float _1059 = in.m_37.w;
    float _1061 = float(_1051);
    float _1063 = _1053 + (-1.0);
    int _1065 = abs(_1057);
    float _1067 = _973 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1069 = _995 > 0.0;
    float _1071 = _1041 * _1061;
    bool _1073 = _995 >= 0.0;
    bool _1075 = isnan(_995);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan(0.0);
    bool _1081 = _1077 || _1079;
    float _1083 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1085 = float(_1065);
    float _1087 = _1071 * (-2.0);
    float _1089 = float(_971);
    float _1091 = _1043 * _625;
    int _1093 = _1081 ? 0 : 1;
    float _1095 = fma(_1087, _1025, _1025);
    bool _1097 = _847 > 0.5;
    float _1099 = fma(_1017, _1087, _1017);
    float _1101 = _847 + (-0.5);
    float _1103 = _1085 * _1089;
    float _1105 = _1043 * _623;
    float _1107 = _1043 * _621;
    float _1109 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1111 = _1091 * _1109;
    float _1113 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1095);
    int _1115 = ~_1093;
    int _1117 = _1115 + 1;
    int _1119 = _1117 + 1;
    float _1121 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1123 = _1107 * _1121;
    float _1125 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1127 = -_1111;
    float _1129 = fma(_1105, _1125, _1127);
    int _1131 = _1119;
    if (!_1069)
    {
        int _1133 = ~_1093;
        int _1135 = _1133 + 1;
        _1131 = _1135;
    }
    int _1137 = _1131;
    float _1139 = fma(_1099, _921, _1113);
    float _1141 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1143 = _1105 * _1141;
    float _1145 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1147 = -_1123;
    float _1149 = fma(_1091, _1145, _1147);
    float _1151 = _1129 * _1129;
    float _1153 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1155 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1157 = -_1143;
    float _1159 = fma(_1107, _1155, _1157);
    bool _1161 = !_989;
    int _1163 = _1161 ? 0 : 1;
    float _1165 = fma(_1149, _1149, _1151);
    bool _1167 = _659 > 0.5;
    float _1169 = _1153 * _659;
    float _1171 = _659 + (-0.5);
    float _1173 = fma(_1159, _1159, _1165);
    float _1175 = _1103 * (-2.0);
    int _1177 = abs(_1163);
    float _1179 = _1139 * 0.15915493667125701904296875;
    float _1181 = float(_1137);
    float _1183 = fma(_1175, _1023, _1023);
    float _1185 = float(_1177);
    float _1187 = fma(_1039, _1175, _1039);
    float _1189 = in.m_33.w;
    float _1191 = fma(_1171, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1183);
    bool _1193 = _817 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1195 = isnan(_817);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1201 = _1197 || _1199;
    float _1203 = float(_1201);
    float _1205 = _1185 * _1181;
    bool _1207 = _817 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1209 = isnan(_817);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1215 = _1211 || _1213;
    float _1217 = float(_1215);
    float _1219 = fma(_1187, _921, _1191);
    float _1221 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1223 = _817 + _1221;
    float _1225 = _1205 * (-2.0);
    float _1227 = -_1203;
    float _1229 = _1227 + 1.0;
    bool _1231 = _817 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1233 = isnan(_817);
    bool _1235 = _1231 || _1233;
    bool _1237 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1239 = _1235 || _1237;
    float _1241 = float(_1239);
    float _1243 = _1219 * 0.15915493667125701904296875;
    float _1245 = fma(_1225, _1027, _1027);
    float _1247 = _1217 * _1229;
    float _1249 = -_1217;
    float _1251 = _1249 + 1.0;
    float _1253 = _819 + (-0.5);
    float _1255 = fma(_1015, _1223, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1257 = fma(_1083, _1225, _1083);
    float _1259 = _1241 * _1251;
    float _1261 = fma(_1253, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1245);
    float _1263 = -_1241;
    float _1265 = _1263 + 1.0;
    float _1267 = _1255 * _1259;
    float _1269 = fma(_1257, _921, _1261);
    bool _1271 = !_863;
    float _1273 = _1271 ? (-0.5) : 0.5;
    float _1275 = _947 + _1059;
    float _1277 = fma(_1265, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1267);
    float _1279 = _1269 * 0.15915493667125701904296875;
    float _1281 = -_1273;
    int _1283 = _1167 ? as_type<int>(_1281) : as_type<int>(_1273);
    float _1285 = rsqrt(_1173);
    float _1287 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1289 = _817 + _1287;
    float _1291 = _991 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1293 = !_945;
    float _1295 = _1293 ? _1273 : as_type<float>(_1283);
    float _1297 = _849 + _1189;
    float _1299 = fma(_1019, _1289, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1301 = !_867;
    float _1303 = _1301 ? (-0.5) : 0.5;
    float _1305 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1273);
    float _1307 = _1179 * 6.283185482025146484375;
    float _1309 = sin(_1307);
    float _1311 = _1295 + 0.5;
    float _1313 = -_1303;
    int _1315 = _1097 ? as_type<int>(_1313) : as_type<int>(_1303);
    float _1317 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1303);
    float _1319 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1321 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1323 = !_951;
    float _1325 = _1323 ? _1303 : as_type<float>(_1315);
    float _1327 = _1291 * _1305;
    float _1329 = _1179 * 6.283185482025146484375;
    float _1331 = cos(_1329);
    float _1333 = _1067 * _1317;
    float _1335 = fma(_1299, _1247, _1277);
    float _1337 = _1149 * _1285;
    float _1339 = _1129 * _1285;
    float _1341 = _1159 * _1285;
    float _1343 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1335);
    float _1345 = -_1325;
    float _1347 = _1345 + 0.5;
    float _1349 = _1243 * 6.283185482025146484375;
    float _1351 = sin(_1349);
    float _1353 = _1347 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1355 = _1243 * 6.283185482025146484375;
    float _1357 = cos(_1355);
    float _1359 = _1279 * 6.283185482025146484375;
    float _1361 = cos(_1359);
    float _1363 = _1351 * _1309;
    float _1365 = _1351 * _1331;
    float _1367 = _1279 * 6.283185482025146484375;
    float _1369 = sin(_1367);
    float _1371 = _1357 * _1331;
    float _1373 = _1357 * _1309;
    float _1375 = _1357 * _1361;
    float _1377 = _1351 * _1361;
    float _1379 = _1331 * _1361;
    float _1381 = _1309 * _1361;
    float _1383 = trunc(_1169);
    int _1385 = int(_1383);
    float _1387 = _1375 * _1091;
    float _1389 = _1375 * _1105;
    float _1391 = _1375 * _1107;
    float _1393 = fma(_1369, _1371, _1363);
    float _1395 = fma(_1369, _1363, _1371);
    float _1397 = -_1373;
    float _1399 = fma(_1369, _1365, _1397);
    float _1401 = -_1365;
    float _1403 = fma(_1369, _1373, _1401);
    float _1405 = _1107 * _1341;
    float _1407 = _1105 * _1339;
    float _1409 = -_1369;
    float _1411 = fma(_1409, _1341, _1387);
    float _1413 = -_1369;
    float _1415 = fma(_1413, _1337, _1389);
    float _1417 = _1393 * _1105;
    float _1419 = _1393 * _1107;
    float _1421 = _1393 * _1091;
    float _1423 = _1091 * _1337;
    float _1425 = -_1369;
    float _1427 = fma(_1425, _1339, _1391);
    float _1429 = _1403 * _1105;
    float _1431 = -_1405;
    float _1433 = fma(_1091, _1339, _1431);
    float _1435 = -_1407;
    float _1437 = fma(_1107, _1337, _1435);
    float _1439 = _1403 * _1107;
    float _1441 = _1403 * _1091;
    float _1443 = fma(_1379, _1337, _1417);
    float _1445 = fma(_1379, _1339, _1419);
    float _1447 = fma(_1379, _1341, _1421);
    float _1449 = -_1423;
    float _1451 = fma(_1105, _1341, _1449);
    float _1453 = fma(_1381, _1337, _1429);
    float _1455 = fma(_1377, _1433, _1415);
    float _1457 = fma(_1377, _1437, _1411);
    float _1459 = fma(_1381, _1341, _1441);
    float _1461 = fma(_1399, _1433, _1443);
    float _1463 = fma(_1399, _1451, _1445);
    float _1465 = fma(_1377, _1451, _1427);
    float _1467 = fma(_1399, _1437, _1447);
    float _1469 = _1333 * _1455;
    int _1471 = _1385 << 4;
    int _1473 = _1471 + 1968;
    float _1475 = fma(_1381, _1339, _1439);
    float _1477 = _1333 * _1457;
    float _1479 = fma(_1395, _1433, _1453);
    float _1481 = _1333 * _1465;
    float _1483 = fma(_1327, _1461, _1469);
    int _1485 = _1473 + 8;
    uint _1488 = uint(int(uint(_1485) >> uint(2)));
    uint _1490 = uint(int(uint(int(_1488)) >> uint(2)));
    int _1492 = int(_1488) & 3;
    float _1494 = (*spvDescriptorSet0.vp_c9)._m0[int(_1490)][_1492];
    float _1496 = fma(_1395, _1451, _1475);
    float _1498 = fma(_1395, _1437, _1459);
    float _1500 = fma(_1327, _1467, _1477);
    float _1502 = fma(_1327, _1463, _1481);
    float _1504 = fma(_1319, _1479, _1483);
    float _1506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1508 = fma(_1319, _1498, _1500);
    uint _1510 = uint(int(uint(_1473) >> uint(2)));
    uint _1512 = uint(int(uint(int(_1510)) >> uint(2)));
    int _1514 = int(_1510) & 3;
    float _1516 = (*spvDescriptorSet0.vp_c9)._m0[int(_1512)][_1514];
    int _1518 = int(_1510) + 1;
    uint _1520 = uint(int(uint(_1518) >> uint(2)));
    int _1522 = _1518 & 3;
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[int(_1520)][_1522];
    float _1526 = fma(_1319, _1496, _1502);
    float _1528 = _963 + _1504;
    float _1530 = _1275 + _1508;
    float _1532 = _1297 + _1526;
    float _1534 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _1536 = uint(int(uint(_787) >> uint(2)));
    uint _1538 = uint(int(uint(int(_1536)) >> uint(2)));
    int _1540 = int(_1536) & 3;
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[int(_1538)][_1540];
    int _1544 = int(_1536) + 1;
    uint _1546 = uint(int(uint(_1544) >> uint(2)));
    int _1548 = _1544 & 3;
    float _1550 = (*spvDescriptorSet0.vp_c9)._m0[int(_1546)][_1548];
    float _1552 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1554 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1556 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1558 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1560 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1552);
    float _1562 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1554);
    float _1564 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1556);
    int _1566 = _787 + 8;
    uint _1568 = uint(int(uint(_1566) >> uint(2)));
    uint _1570 = uint(int(uint(int(_1568)) >> uint(2)));
    int _1572 = int(_1568) & 3;
    float _1574 = (*spvDescriptorSet0.vp_c9)._m0[int(_1570)][_1572];
    float _1576 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1560);
    float _1578 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1562);
    float _1580 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1558);
    float _1582 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1564);
    float _1584 = _1576 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1586 = _1578 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1588 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1580);
    float _1590 = _1582 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1592 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1594 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1596 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1598 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1600 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1592);
    float _1602 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1594);
    float _1604 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1596);
    float _1606 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1598);
    float _1608 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1600);
    float _1610 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1602);
    float _1612 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1604);
    float _1614 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1606);
    float _1616 = _1588 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1618 = _1321 * _1506;
    float _1620 = _1353 * _1534;
    float _1622 = _1494 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1624 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1608);
    float _1626 = _1622 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1628 = _1343 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1630 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1610);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1632 = _1516 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1634 = _1524 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_48.x = _1618;
    out.m_48.y = _1620;
    float _1636 = _1632 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1638 = _1634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1640 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1612);
    float _1642 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1614);
    float _1644 = _1542 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1646 = _1550 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_50.x = _1636;
    out.m_50.y = _1638;
    out.m_50.z = _1626;
    float _1648 = _1644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1624;
    out.gl_Position.y = _1630;
    out.gl_Position.z = _1640;
    out.gl_Position.w = _1642;
    float _1650 = _1574 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1652 = _1646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1654 = _1650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_52.x = _1648;
    out.m_52.y = _1652;
    out.m_52.z = _1654;
    out.m_52.w = _1628;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

