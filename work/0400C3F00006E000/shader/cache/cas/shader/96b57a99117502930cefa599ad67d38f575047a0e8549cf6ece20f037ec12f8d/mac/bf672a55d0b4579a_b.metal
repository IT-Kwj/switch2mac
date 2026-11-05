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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
};

struct main0_out
{
    float4 m_56 [[user(locn0)]];
    float4 m_54 [[user(locn1)]];
    float4 m_58 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_52 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_41 [[attribute(1)]];
    float4 m_39 [[attribute(2)]];
    float4 m_43 [[attribute(3)]];
    float4 m_32 [[attribute(5)]];
    float4 m_37 [[attribute(6)]];
    float4 m_47 [[attribute(7)]];
    float4 m_45 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1994 = false;
    bool _1167 = false;
    bool _991 = false;
    bool _751 = false;
    bool _589 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_32.w;
    float _74 = trunc(_72);
    int _77 = int(_74);
    bool _81 = _77 >= 1;
    float _83 = 0.0;
    if (!_81)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _85 = _83;
    float _87 = _85;
    if (!_81)
    {
        out.m_35.x = 0.0;
    }
    int _89 = 0;
    if (!_81)
    {
        float _91 = _85 * 5.0;
        _89 = as_type<int>(_91);
    }
    int _93 = _89;
    int _95 = _93;
    if (!_81)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2379 = as_type<float>(_93);
        out.gl_Position.z = _2379;
    }
    if (!_81)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _97 = in.m_37.w;
    bool _99 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _107 = _103 || _105;
    float _109 = -_97;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_107)
    {
        float _113 = float(_77);
        _87 = _113;
    }
    float _115 = _87;
    bool _117 = _111 >= _115;
    bool _119 = !_107;
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
        _95 = as_type<int>(_127);
    }
    int _129 = _95;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2448 = as_type<float>(_129);
        out.gl_Position.z = _2448;
    }
    if (_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = in.m_39.y;
    float _133 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _135 = in.m_41.y;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = in.m_43.y;
    float _149 = in.m_39.z;
    float _151 = in.m_41.z;
    float _153 = 0.0;
    float _155 = _133;
    if (!_145)
    {
        float _157 = _133 * _133;
        float _159 = _157 * 0.5;
        _153 = _159;
    }
    float _161 = _153;
    float _163 = 0.0;
    float _165 = _161;
    if (!_145)
    {
        float _167 = _111 * _111;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = in.m_43.z;
    if (!_145)
    {
        float _175 = _161 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _165 = _175;
    }
    float _177 = _165;
    float _179 = _131 * _131;
    float _181 = in.m_37.x;
    float _183 = in.m_37.y;
    float _185 = in.m_37.z;
    float _187 = fma(_135, _135, _179);
    float _189 = fma(_147, _147, _187);
    float _191 = sqrt(_189);
    bool _193 = _191 > 0.0;
    float _195 = _149 * _149;
    float _197 = fma(_151, _151, _195);
    bool _199 = !_145;
    float _201 = _187;
    float _203 = _177;
    float _205 = _197;
    if (!_199)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _133 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _133);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _225;
        _203 = _235;
    }
    float _237 = _201;
    float _239 = _203;
    bool _241 = !_145;
    float _243 = _237;
    float _245 = 0.0;
    if (!_241)
    {
        float _247 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = log2(_247);
        float _251 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _253 = _251 + 1.0;
        float _255 = 1.0 / _253;
        float _257 = _133 * _249;
        float _259 = exp2(_257);
        float _261 = -_259;
        float _263 = _261 + 1.0;
        float _265 = _263 * _255;
        _243 = _253;
        _155 = _265;
        _245 = _255;
    }
    float _267 = _243;
    float _269 = _155;
    float _271 = _245;
    float _273 = fma(_173, _173, _197);
    float _275 = _267;
    float _277 = _269;
    float _279 = _271;
    if (!_145)
    {
        _275 = _111;
    }
    float _281 = _275;
    float _283 = _281;
    if (!_145)
    {
        float _285 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _285;
    }
    float _287 = _205;
    bool _289 = !_145;
    float _291 = _287;
    float _293 = 0.0;
    if (!_289)
    {
        float _295 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _297 = log2(_295);
        float _299 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _301 = _299 + 1.0;
        float _303 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = _111 * _297;
        float _307 = 1.0 / _301;
        float _309 = _303 * 0.693147182464599609375;
        float _311 = exp2(_305);
        float _313 = 1.0 / _309;
        float _315 = _311 + (-1.0);
        float _317 = -_315;
        float _319 = fma(_317, _313, _111);
        float _321 = _319 * _307;
        float _323 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _291 = _323;
        _293 = _307;
    }
    float _325 = _291;
    float _327 = _293;
    bool _329 = !_145;
    float _331 = _327;
    if (!_329)
    {
        float _333 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _335 = log2(_333);
        float _337 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _339 = _337 + 1.0;
        float _341 = 1.0 / _339;
        float _343 = _111 * _335;
        float _345 = exp2(_343);
        float _347 = -_345;
        float _349 = _347 + 1.0;
        float _351 = _349 * _341;
        _283 = _351;
    }
    float _353 = _283;
    float _355 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _357 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _359 = sqrt(_273);
    float _361 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _363 = fma(_269, _183, _355);
    float _365 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _367 = fma(_353, _183, _357);
    float _369 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _371 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _373 = fma(_269, _181, _361);
    float _375 = fma(_353, _181, _365);
    float _377 = -_367;
    float _379 = _363 + _377;
    float _381 = fma(_353, _185, _369);
    float _383 = fma(_269, _185, _371);
    float _385 = -_375;
    float _387 = _373 + _385;
    float _389 = _379 * _379;
    float _391 = in.m_41.x;
    float _393 = -_381;
    float _395 = _383 + _393;
    bool _397 = _359 > 0.0;
    float _399 = fma(_387, _387, _389);
    float _401 = in.m_39.x;
    float _403 = 0.0;
    float _405 = _359;
    float _407 = _367;
    float _409 = _395;
    if (_193)
    {
        float _411 = rsqrt(_189);
        _403 = _411;
    }
    float _413 = _403;
    if (!_193)
    {
        _331 = 0.0;
    }
    float _415 = _331;
    float _417 = fma(_395, _395, _399);
    float _419 = in.m_43.x;
    float _421 = _415;
    if (!_193)
    {
        _405 = 0.0;
    }
    float _423 = _405;
    float _425 = _379 * _147;
    float _427 = _423;
    if (!_193)
    {
        _277 = 0.0;
    }
    float _429 = _277;
    float _431 = in.m_45.w;
    float _433 = sqrt(_417);
    float _435 = _429;
    if (!_397)
    {
        _279 = 0.0;
    }
    float _437 = _279;
    float _439 = in.m_32.x;
    float _441 = in.m_32.y;
    float _443 = in.m_32.z;
    float _445 = _437;
    if (!_397)
    {
        _407 = 0.0;
    }
    float _447 = _407;
    float _449 = 0.0;
    float _451 = _447;
    if (_397)
    {
        float _453 = rsqrt(_273);
        _449 = _453;
    }
    float _455 = _449;
    if (_193)
    {
        float _457 = _413 * _135;
        _421 = _457;
    }
    float _459 = _421;
    float _461 = _459;
    if (_193)
    {
        float _463 = _413 * _131;
        _427 = _463;
    }
    float _465 = _427;
    float _467 = _465;
    if (_193)
    {
        float _469 = _413 * _147;
        _435 = _469;
    }
    float _471 = _435;
    float _473 = _379 * _135;
    bool _475 = _433 >= 9.9999999747524270787835121154785e-07;
    bool _477 = isnan(_433);
    bool _479 = _475 || _477;
    bool _481 = isnan(9.9999999747524270787835121154785e-07);
    bool _483 = _479 || _481;
    float _485 = _379 * _131;
    float _487 = fma(_387, _391, _473);
    float _489 = fma(_387, _419, _425);
    float _491 = _433;
    float _493 = _489;
    float _495 = _471;
    if (!_397)
    {
        _491 = 0.0;
    }
    float _497 = _491;
    float _499 = fma(_387, _401, _485);
    float _501 = fma(_395, _151, _487);
    float _503 = fma(_395, _173, _489);
    float _505 = _455;
    float _507 = _497;
    float _509 = _501;
    if (_397)
    {
        float _511 = _455 * 0.001000000047497451305389404296875;
        _505 = _511;
    }
    float _513 = _505;
    float _515 = fma(_373, _431, _439);
    if (_397)
    {
        float _517 = _151 * _513;
        _445 = _517;
    }
    float _519 = _445;
    if (_397)
    {
        float _521 = _149 * _513;
        _507 = _521;
    }
    float _523 = _507;
    if (_397)
    {
        float _525 = _173 * _513;
        _451 = _525;
    }
    float _527 = _451;
    float _529 = fma(_395, _149, _499);
    if (_483)
    {
        _409 = _501;
    }
    float _531 = _409;
    float _533 = fma(_363, _431, _441);
    float _535 = fma(_383, _431, _443);
    float _537 = _531;
    float _539 = _531;
    if (_483)
    {
        _509 = _503;
    }
    float _541 = _509;
    float _543 = _541;
    if (_483)
    {
        _493 = _529;
    }
    float _545 = _493;
    float _547 = _545;
    float _549 = _545;
    if (!_483)
    {
        bool _551 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _553 = !_551;
        if (!_553)
        {
            float _555 = _131 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _557 = _135 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _559 = _147 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _561 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[16].x, _555);
            float _563 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[16].x, _557);
            float _565 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[16].x, _559);
            float _567 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[16].z, _561);
            float _569 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[16].z, _563);
            float _571 = fma(_173, (*spvDescriptorSet0.vp_c9)._m0[16].z, _565);
            float _573 = _567 * _567;
            float _575 = fma(_569, _569, _573);
            float _577 = fma(_571, _571, _575);
            float _579 = rsqrt(_577);
            float _581 = _579 * 9.9999999747524270787835121154785e-07;
            float _583 = _569 * _581;
            float _585 = _567 * _581;
            float _587 = _571 * _581;
            _549 = _585;
            _539 = _583;
            _543 = _587;
            _589 = true;
        }
        else
        {
            float _591 = _183 * _183;
            float _593 = fma(_181, _181, _591);
            float _595 = fma(_185, _185, _593);
            float _597 = sqrt(_595);
            bool _599 = _597 >= 9.9999999747524270787835121154785e-07;
            bool _601 = isnan(_597);
            bool _603 = _599 || _601;
            bool _605 = isnan(9.9999999747524270787835121154785e-07);
            bool _607 = _603 || _605;
            float _609 = _597;
            if (!_607)
            {
                float _611 = _441 * _441;
                float _613 = fma(_439, _439, _611);
                float _615 = fma(_443, _443, _613);
                float _617 = sqrt(_615);
                bool _619 = _617 >= 9.9999999747524270787835121154785e-07;
                bool _621 = isnan(_617);
                bool _623 = _619 || _621;
                bool _625 = isnan(9.9999999747524270787835121154785e-07);
                bool _627 = _623 || _625;
                float _629 = _189;
                if (!_627)
                {
                    float _631 = rsqrt(_189);
                    _629 = _631;
                }
                float _633 = _629;
                if (!_627)
                {
                    float _635 = _633 * 9.9999999747524270787835121154785e-07;
                    _609 = _635;
                }
                float _637 = _609;
                float _639 = _637;
                if (!_627)
                {
                    float _641 = _135 * _637;
                    _537 = _641;
                }
                float _643 = _537;
                _539 = _643;
                if (!_627)
                {
                    float _645 = _131 * _637;
                    _547 = _645;
                }
                float _647 = _547;
                _549 = _647;
                if (!_627)
                {
                    float _649 = _147 * _637;
                    _639 = _649;
                }
                float _651 = _639;
                bool _653 = !_627;
                _543 = _651;
                _589 = _653;
                if (!_589)
                {
                    float _655 = _131 * _441;
                    float _657 = _135 * _441;
                    float _659 = _147 * _441;
                    float _661 = fma(_439, _401, _655);
                    float _663 = fma(_439, _391, _657);
                    float _665 = fma(_439, _419, _659);
                    float _667 = fma(_149, _443, _661);
                    float _669 = fma(_151, _443, _663);
                    float _671 = fma(_173, _443, _665);
                    float _673 = _667 * _667;
                    float _675 = fma(_669, _669, _673);
                    float _677 = fma(_671, _671, _675);
                    float _679 = rsqrt(_677);
                    float _681 = _679 * 9.9999999747524270787835121154785e-07;
                    float _683 = _669 * _681;
                    float _685 = _667 * _681;
                    float _687 = _671 * _681;
                    _549 = _685;
                    _539 = _683;
                    _543 = _687;
                    _589 = true;
                }
            }
            else
            {
                float _689 = _131 * _183;
                float _691 = _135 * _183;
                float _693 = _147 * _183;
                float _695 = fma(_181, _401, _689);
                float _697 = fma(_181, _391, _691);
                float _699 = fma(_181, _419, _693);
                float _701 = fma(_149, _185, _695);
                float _703 = fma(_151, _185, _697);
                float _705 = fma(_173, _185, _699);
                float _707 = _701 * _701;
                float _709 = fma(_703, _703, _707);
                float _711 = fma(_705, _705, _709);
                float _713 = rsqrt(_711);
                float _715 = _713 * 9.9999999747524270787835121154785e-07;
                float _717 = _703 * _715;
                float _719 = _701 * _715;
                float _721 = _705 * _715;
                _549 = _719;
                _539 = _717;
                _543 = _721;
            }
        }
    }
    _589 = false;
    float _723 = _549;
    float _725 = _539;
    float _727 = _543;
    bool _729 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _731 = !_729;
    float _749;
    if (!_731)
    {
        float _733 = in.m_47.x;
        float _735 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _737 = _733 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _739 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _741 = _739 * _735;
        float _743 = floor(_741);
        float _745 = -_743;
        float _747 = _741 + _745;
        _749 = _747;
        _751 = true;
    }
    else
    {
        float _753 = float(_77);
        float _755 = 1.0 / _753;
        float _757 = _111 * _755;
        _749 = _757;
    }
    _751 = false;
    float _759 = _749;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _763 = _759 + _761;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _767 = _759 + _765;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _771 = _759 + _769;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _773;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _789 = 1.0 / _775;
    bool _791 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _793 = 1.0 / _779;
    float _795 = 1.0 / _787;
    float _797 = _763 * _789;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _801 = _759 + _799;
    bool _803 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _805 = isnan(_759);
    bool _807 = _803 || _805;
    bool _809 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _811 = _807 || _809;
    float _813 = float(_811);
    float _815 = 1.0 / _783;
    float _817 = _767 * _793;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _819;
    float _823 = fma(_821, _797, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _825 = _801 * _795;
    bool _827 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _829 = isnan(_759);
    bool _831 = _827 || _829;
    bool _833 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _835 = _831 || _833;
    float _837 = float(_835);
    float _839 = -_813;
    float _841 = _839 + 1.0;
    float _843 = -_837;
    float _845 = _843 + 1.0;
    float _847 = _837 * _841;
    float _849 = _771 * _815;
    bool _851 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _853 = isnan(_759);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _859 = _855 || _857;
    float _861 = float(_859);
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _863;
    bool _867 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _869 = isnan(_759);
    bool _871 = _867 || _869;
    bool _873 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _875 = _871 || _873;
    float _877 = float(_875);
    float _879 = fma(_865, _797, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _881 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _883 = isnan(_759);
    bool _885 = _881 || _883;
    bool _887 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _889 = _885 || _887;
    float _891 = float(_889);
    float _893 = _861 * _845;
    float _895 = -_861;
    float _897 = _895 + 1.0;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _901 = _899 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _905 = _903 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _907 = _891 * _897;
    float _909 = -_891;
    float _911 = _909 + 1.0;
    float _913 = -_877;
    float _915 = _913 + 1.0;
    float _917 = fma(_905, _817, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _919 = fma(_901, _817, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _921 = _877 * _911;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _923;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _927;
    float _931 = _823 * _921;
    float _933 = _879 * _921;
    float _935 = fma(_925, _849, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _937 = fma(_929, _849, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _939 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[143].x, _931);
    float _941 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[143].y, _933);
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _951 = fma(_917, _907, _939);
    float _953 = fma(_919, _907, _941);
    float _955 = fma(_945, _825, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _957 = fma(_949, _825, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _959 = fma(_935, _893, _951);
    float _961 = fma(_937, _893, _953);
    float _963 = fma(_955, _847, _959);
    float _965 = fma(_957, _847, _961);
    float _967 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[147].x, _963);
    float _969 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[147].y, _965);
    bool _971 = !_791;
    float _989;
    if (!_971)
    {
        float _973 = in.m_47.x;
        float _975 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _977 = _973 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _979 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[11].x, _111);
        float _981 = _979 * _975;
        float _983 = floor(_981);
        float _985 = -_983;
        float _987 = _981 + _985;
        _989 = _987;
        _991 = true;
    }
    else
    {
        float _993 = float(_77);
        float _995 = 1.0 / _993;
        float _997 = _111 * _995;
        _989 = _997;
    }
    _991 = false;
    float _999 = _989;
    float _1001 = in.m_45.x;
    float _1003 = in.m_45.y;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1007 = _999 + _1005;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1011 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1009;
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1017 = 1.0 / _1011;
    bool _1019 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _1021 = 1.0 / _1015;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1025 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1023;
    float _1027 = _1007 * _1017;
    bool _1029 = _999 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1031 = isnan(_999);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1037 = _1033 || _1035;
    float _1039 = float(_1037);
    float _1041 = _969 * _1003;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1045 = _999 + _1043;
    bool _1047 = _999 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1049 = isnan(_999);
    bool _1051 = _1047 || _1049;
    bool _1053 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1055 = _1051 || _1053;
    float _1057 = float(_1055);
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1059;
    bool _1063 = _999 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1065 = isnan(_999);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1071 = _1067 || _1069;
    float _1073 = float(_1071);
    float _1075 = -_1039;
    float _1077 = _1075 + 1.0;
    float _1079 = fma(_1025, _1027, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1081 = fma(_1061, _1027, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1083 = _1045 * _1021;
    float _1085 = _1073 * _1077;
    float _1087 = -_1073;
    float _1089 = _1087 + 1.0;
    float _1091 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1091;
    float _1095 = _1057 * _1089;
    float _1097 = fma(_1093, _1027, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1099 = -_1057;
    float _1101 = _1099 + 1.0;
    float _1103 = _1079 * _1095;
    float _1105 = _1097 * _1095;
    float _1107 = _1081 * _1095;
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1111 = _1109 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1115 = _1113 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1121 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1105);
    float _1123 = fma(_1111, _1083, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1125 = fma(_1115, _1083, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1127 = fma(_1119, _1083, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1129 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1103);
    float _1131 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1107);
    float _1133 = fma(_1123, _1085, _1121);
    float _1135 = _967 * _1001;
    float _1137 = fma(_1125, _1085, _1129);
    float _1139 = fma(_1127, _1085, _1131);
    float _1141 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1133);
    float _1143 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1137);
    float _1145 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1139);
    bool _1147 = !_1019;
    float _1165;
    if (!_1147)
    {
        float _1149 = in.m_47.x;
        float _1151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1153 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1155 = fma(_1153, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _1157 = _1155 * _1151;
        float _1159 = floor(_1157);
        float _1161 = -_1159;
        float _1163 = _1157 + _1161;
        _1165 = _1163;
        _1167 = true;
    }
    else
    {
        float _1169 = float(_77);
        float _1171 = 1.0 / _1169;
        float _1173 = _111 * _1171;
        _1165 = _1173;
    }
    _1167 = false;
    float _1175 = _1165;
    float _1177 = _723 * _723;
    float _1179 = in.m_39.w;
    float _1181 = _533 * _131;
    float _1183 = fma(_725, _725, _1177);
    float _1185 = in.m_41.w;
    float _1187 = _533 * _135;
    float _1189 = fma(_515, _401, _1181);
    float _1191 = fma(_727, _727, _1183);
    float _1193 = in.m_43.w;
    float _1195 = _533 * _147;
    float _1197 = fma(_515, _391, _1187);
    float _1199 = rsqrt(_1191);
    float _1201 = fma(_535, _149, _1189);
    float _1203 = fma(_515, _419, _1195);
    float _1205 = fma(_535, _151, _1197);
    float _1207 = as_type<float>(int(gl_VertexIndex));
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1211 = in.m_47.z;
    float _1213 = in.m_47.w;
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1217 = in.m_47.x;
    float _1219 = _1201 + _1179;
    float _1221 = _1199 * _723;
    float _1223 = _1199 * _725;
    float _1225 = _1205 + _1185;
    float _1227 = _1199 * _727;
    float _1229 = _1221 * _465;
    float _1231 = _1135 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1233 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1235 = _1225 + _1233;
    float _1237 = fma(_1223, _459, _1229);
    float _1239 = fma(_535, _173, _1203);
    float _1241 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1243 = _1219 + _1241;
    float _1245 = fma(_1227, _471, _1237);
    float _1247 = _1239 + _1193;
    float _1249 = _1243 * _1243;
    float _1251 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1253 = _1247 + _1251;
    float _1255 = fma(_1235, _1235, _1249);
    float _1257 = abs(_1245);
    bool _1259 = _1257 > 0.99989998340606689453125;
    float _1261 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1265 = _1263 != 0;
    float _1267 = fma(_1253, _1253, _1255);
    int _1269 = as_type<int>(_1207) & 1;
    bool _1271 = _1269 != 0;
    int _1273 = as_type<int>(_1207) & 2;
    bool _1275 = _1273 != 0;
    bool _1277 = _1211 > 0.5;
    float _1279 = rsqrt(_1267);
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1283 = _1281 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    if (_1259)
    {
        float _1285 = _465 + _523;
        _467 = _1285;
    }
    float _1287 = _467;
    if (_1259)
    {
        float _1289 = _459 + _519;
        _461 = _1289;
    }
    float _1291 = _461;
    float _1293 = 1.0 / _1283;
    bool _1295 = _1213 > 0.5;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1299 = _1297 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1301 = !_1271;
    float _1303 = _1301 ? (-0.5) : 0.5;
    if (_1259)
    {
        float _1305 = _471 + _527;
        _495 = _1305;
    }
    float _1307 = _495;
    bool _1309 = _1217 > 0.5;
    float _1311 = _1261 * _1279;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1315 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1313;
    float _1317 = 1.0 / _1299;
    bool _1319 = !_1275;
    float _1321 = _1319 ? (-0.5) : 0.5;
    float _1323 = _1243 * _1311;
    float _1325 = _1235 * _1311;
    float _1327 = -_1303;
    int _1329 = _1309 ? as_type<int>(_1327) : as_type<int>(_1303);
    float _1331 = -_1323;
    float _1333 = _1243 + _1331;
    float _1335 = -_1325;
    float _1337 = _1235 + _1335;
    float _1339 = _1315 * _1293;
    float _1341 = _1253 * _1311;
    float _1343 = _1333 * _1333;
    float _1345 = in.m_47.y;
    float _1347 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1349 = _1347 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1351 = -_1291;
    float _1353 = _1227 * _1351;
    float _1355 = fma(_1337, _1337, _1343);
    float _1357 = -_1341;
    float _1359 = _1253 + _1357;
    int _1361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1363 = _1361 != 0;
    float _1365 = 1.0 / _1349;
    int _1367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1369 = _1367 != 0;
    float _1371 = -_1307;
    float _1373 = -_1353;
    float _1375 = fma(_1223, _1371, _1373);
    int _1377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1379 = _1377 != 0;
    float _1381 = fma(_1359, _1359, _1355);
    int _1383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1385 = _1383 != 0;
    float _1387 = -_1307;
    float _1389 = _1221 * _1387;
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1393 = _1391 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1395 = sqrt(_1381);
    float _1397 = _1375 * _1375;
    float _1399 = -_1287;
    float _1401 = -_1389;
    float _1403 = fma(_1227, _1399, _1401);
    float _1405 = -_1287;
    float _1407 = _1223 * _1405;
    float _1409 = _1393 * _1317;
    float _1411 = fma(_1403, _1403, _1397);
    float _1413 = -_1291;
    float _1415 = -_1407;
    float _1417 = fma(_1221, _1413, _1415);
    float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1419;
    float _1423 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1425 = _1175 + _1423;
    float _1427 = fma(_1417, _1417, _1411);
    float _1429 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1431 = _1175 + _1429;
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1435 = _1433 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1437 = _1421 * _1365;
    float _1439 = rsqrt(_1427);
    float _1441 = fma(_1339, _1425, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1443 = _1421;
    float _1445 = _1435;
    if (!_1265)
    {
        _1443 = _1345;
    }
    float _1447 = _1443;
    float _1449 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1451 = _1175 + _1449;
    float _1453 = _1279 * _1395;
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1457 = _1455 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1459 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1461 = fma(_1409, _1451, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1463 = 1.0 / _1435;
    float _1465 = fma(_1437, _1431, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1467 = _1303 * _1231;
    bool _1469 = !_1379;
    float _1471 = _1469 ? _1303 : as_type<float>(_1329);
    float _1473 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1303);
    float _1475 = _1231 * _1453;
    float _1477 = _1459 * _1217;
    bool _1479 = _1175 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1481 = isnan(_1175);
    bool _1483 = _1479 || _1481;
    bool _1485 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1487 = _1483 || _1485;
    float _1489 = float(_1487);
    float _1491 = _1403 * _1439;
    float _1493 = _1447;
    float _1495 = _1467;
    float _1497 = _1465;
    if (!_1265)
    {
        _1445 = _1447;
    }
    float _1499 = _1445;
    float _1501 = _1475 * _1473;
    float _1503 = _1499;
    if (_1265)
    {
        _1493 = _1345;
    }
    float _1505 = _1493;
    float _1507 = _1041 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1509 = _1175 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1511 = isnan(_1175);
    bool _1513 = _1509 || _1511;
    bool _1515 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1517 = _1513 || _1515;
    float _1519 = float(_1517);
    float _1521 = _1375 * _1439;
    if (_1265)
    {
        _1503 = _1217;
    }
    float _1523 = _1503;
    float _1525 = _1417 * _1439;
    bool _1527 = _1175 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1529 = isnan(_1175);
    bool _1531 = _1527 || _1529;
    bool _1533 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1535 = _1531 || _1533;
    float _1537 = float(_1535);
    float _1539 = -_1519;
    float _1541 = _1539 + 1.0;
    float _1543 = _1395;
    if (!_1265)
    {
        float _1545 = in.m_47.z;
        _1543 = _1545;
    }
    float _1547 = _1543;
    float _1549 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1321);
    float _1551 = _1507 * _1453;
    float _1553 = _1489 * _1541;
    float _1555 = -_1489;
    float _1557 = _1555 + 1.0;
    bool _1559 = _1175 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1561 = isnan(_1175);
    bool _1563 = _1559 || _1561;
    bool _1565 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1567 = _1563 || _1565;
    float _1569 = float(_1567);
    float _1571 = -_1537;
    float _1573 = _1571 + 1.0;
    float _1575 = _1551 * _1549;
    float _1577 = _1537 * _1557;
    bool _1579 = _1175 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1581 = isnan(_1175);
    bool _1583 = _1579 || _1581;
    bool _1585 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1587 = _1583 || _1585;
    float _1589 = float(_1587);
    float _1591 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1593 = _1175 + _1591;
    float _1595 = _1569 * _1573;
    float _1597 = trunc(_1477);
    int _1599 = int(_1597);
    float _1601 = _1457 * _1463;
    float _1603 = _1221 * _1525;
    float _1605 = _1575 * _1223;
    float _1607 = _1223 * _1521;
    float _1609 = _1575 * _1227;
    float _1611 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1613 = _1611 * 0.5;
    float _1615 = -_1603;
    float _1617 = fma(_1227, _1521, _1615);
    float _1619 = fma(_1501, _1491, _1605);
    float _1621 = -_1607;
    float _1623 = fma(_1221, _1491, _1621);
    float _1625 = fma(_1501, _1525, _1609);
    float _1627 = -_1569;
    float _1629 = _1627 + 1.0;
    float _1631 = fma(_1613, _1617, _1619);
    float _1633 = _1619;
    float _1635 = _1547;
    if (!_1265)
    {
        _1633 = _1547;
    }
    float _1637 = _1633;
    float _1639 = fma(_1613, _1623, _1625);
    float _1641 = _1589 * _1629;
    int _1643 = _1599 << 4;
    int _1645 = _1643 + 1968;
    float _1647 = _1225 + _1631;
    float _1649 = _1247 + _1639;
    float _1651 = _1637;
    float _1653 = _1649;
    float _1655 = _1647;
    if (_1265)
    {
        _1651 = _1505;
    }
    float _1657 = _1651;
    float _1659 = fma(_1601, _1593, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    if (_1265)
    {
        _1635 = _1505;
    }
    float _1661 = _1635;
    float _1663 = _1441 * _1641;
    bool _1665 = _1505 > 0.5;
    uint _1668 = uint(int(uint(_1645) >> uint(2)));
    uint _1670 = uint(int(uint(int(_1668)) >> uint(2)));
    int _1672 = int(_1668) & 3;
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[int(_1670)][_1672];
    int _1676 = int(_1668) + 1;
    uint _1678 = uint(int(uint(_1676) >> uint(2)));
    int _1680 = _1676 & 3;
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[int(_1678)][_1680];
    float _1684 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1686 = _1647 + _1684;
    float _1688 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1690 = _1649 + _1688;
    float _1692 = -_1589;
    float _1694 = _1692 + 1.0;
    float _1696 = fma(_1523, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1209);
    float _1698 = _1686 * _1686;
    float _1700 = _1690 * _1690;
    float _1702 = _1575 * _1221;
    int _1704 = _1645 + 8;
    uint _1706 = uint(int(uint(_1704) >> uint(2)));
    uint _1708 = uint(int(uint(int(_1706)) >> uint(2)));
    int _1710 = int(_1706) & 3;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[int(_1708)][_1710];
    float _1714 = _1523 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1716 = _1698 + _1700;
    float _1718 = _1227 * _1491;
    float _1720 = -_1321;
    int _1722 = _1295 ? as_type<int>(_1720) : as_type<int>(_1321);
    float _1724 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1663);
    float _1726 = sqrt(_1716);
    float _1728 = -_1718;
    float _1730 = fma(_1223, _1525, _1728);
    float _1732 = -_1215;
    float _1734 = fma(_1714, 2.0, _1732);
    float _1736 = fma(_1501, _1521, _1702);
    bool _1738 = !_1369;
    float _1740 = _1738 ? _1321 : as_type<float>(_1722);
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1744 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1748 = fma(_1613, _1730, _1736);
    float _1750 = _1657 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1752 = fma(_1461, _1595, _1724);
    float _1754 = fma(_1661, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1742);
    float _1756 = _1219 + _1748;
    float _1758 = fma(_1750, -2.0, _1744);
    float _1760 = -_1321;
    int _1762 = _1665 ? as_type<int>(_1760) : as_type<int>(_1321);
    float _1764 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1766 = _1726 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1768 = fma(_1465, _1577, _1752);
    float _1770 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1696);
    float _1772 = -_111;
    float _1774 = fma(_1772, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1734);
    float _1776 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1754);
    bool _1778 = !_1385;
    float _1780 = _1778 ? _1321 : as_type<float>(_1762);
    float _1782 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1758);
    float _1784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1786 = fma(_1659, _1553, _1768);
    float _1788 = _1698;
    float _1790 = _1700;
    if (_1363)
    {
        float _1792 = -_1467;
        float _1794 = _1277 ? _1792 : _1467;
        _1495 = _1794;
    }
    float _1796 = _1495;
    if (!_1766)
    {
        _1497 = _1756;
    }
    float _1798 = _1497;
    bool _1800 = !_1766;
    float _1802 = _1798;
    if (!_1800)
    {
        float _1804 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1806 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1808 = _1726 + _1806;
        float _1810 = _1756 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1812 = rsqrt(_1716);
        float _1814 = _1808 * _1804;
        float _1816 = _1814 * 0.15915493667125701904296875;
        float _1818 = _1816 * 6.283185482025146484375;
        float _1820 = sin(_1818);
        float _1822 = _1816 * 6.283185482025146484375;
        float _1824 = cos(_1822);
        float _1826 = fma(_1820, _1810, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1828 = _1812 * _1826;
        float _1830 = fma(_1686, _1828, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1832 = _1824 + (-1.0);
        float _1834 = fma(_1690, _1828, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1836 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1838 = _1830 + _1836;
        float _1840 = _1832 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1842 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1844 = _1834 + _1842;
        float _1846 = _1838 * _1838;
        float _1848 = fma(_1756, _1824, _1840);
        float _1850 = _1844 * _1844;
        _1802 = _1848;
        _1788 = _1846;
        _1790 = _1850;
        _1653 = _1834;
        _1655 = _1830;
    }
    float _1852 = _1802;
    float _1854 = _1788;
    float _1856 = _1790;
    float _1858 = _1653;
    float _1860 = _1655;
    float _1862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1864 = _1764 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1866 = _1740 + (-0.5);
    float _1868 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1870 = _1852 + _1868;
    float _1872 = _1746 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1874 = _1796 + 0.5;
    float _1876 = -_1864;
    float _1878 = -_1782;
    float _1880 = fma(_1876, _1866, _1878);
    float _1882 = fma(_1519, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1786);
    float _1884 = _1674 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1886 = fma(_1870, _1870, _1854);
    float _1888 = _1471 + 0.5;
    float _1890 = -_1780;
    float _1892 = _1890 + 0.5;
    float _1894 = _1682 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1896 = fma(_1872, _1874, _1774);
    float _1898 = -_1770;
    float _1900 = _1898 + 1.0;
    float _1902 = -_1776;
    float _1904 = _1902 + 1.0;
    float _1906 = _1886 + _1856;
    float _1908 = _1892 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1910 = _1888 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1912 = -_1900;
    float _1914 = fma(_1912, _1796, _1896);
    float _1916 = fma(_1740, _1904, _1880);
    float _1918 = _1908 * _1862;
    float _1920 = _1141 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1922 = _1145 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1924 = sqrt(_1906);
    float _1926 = _1143 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1928 = _1712 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1930 = _1910 * _1784;
    float _1932 = _1894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1934 = _1920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1936 = _1926 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1940 = _1884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1942 = _1928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1944 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1946 = _1882 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_52.x = _1930;
    out.m_52.y = _1918;
    out.m_52.z = _1914;
    out.m_52.w = _1916;
    bool _1948 = _1924 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1950 = isnan(_1924);
    bool _1952 = _1948 || _1950;
    bool _1954 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1956 = _1952 || _1954;
    out.m_54.x = _1940;
    out.m_54.y = _1932;
    out.m_54.z = _1942;
    out.m_54.w = _1938;
    out.m_56.x = _1934;
    out.m_56.y = _1936;
    out.m_56.z = _1944;
    out.m_56.w = _1946;
    float _1958 = _1928;
    if (!_1956)
    {
        _1958 = 1.0;
    }
    float _1960 = _1958;
    bool _1962 = !_1956;
    float _1964 = _1960;
    if (!_1962)
    {
        bool _1966 = _1924 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1968 = isnan(_1924);
        bool _1970 = _1966 || _1968;
        bool _1972 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1974 = _1970 || _1972;
        if (!_1974)
        {
            float _1976 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1978 = _1924 + _1976;
            float _1980 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1982 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1980;
            float _1984 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1986 = _1984 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1988 = 1.0 / _1982;
            float _1990 = _1978 * _1988;
            float _1992 = fma(_1990, _1986, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1964 = _1992;
            _1994 = true;
        }
        else
        {
            bool _1996 = _1924 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1998 = isnan(_1924);
            bool _2000 = _1996 || _1998;
            bool _2002 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2004 = _2000 || _2002;
            if (!_2004)
            {
                float _2006 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2008 = _1924 + _2006;
                float _2010 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2012 = _2010 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2014 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2016 = _2014 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2018 = 1.0 / _2012;
                float _2020 = _2008 * _2018;
                float _2022 = fma(_2020, _2016, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1964 = _2022;
                _1994 = true;
            }
            else
            {
                _1964 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1994 = false;
    float _2024 = _1964;
    float _2026 = -_1323;
    float _2028 = _1219 + _2026;
    float _2030 = -_1325;
    float _2032 = _1225 + _2030;
    float _2034 = -_1341;
    float _2036 = _1247 + _2034;
    float _2038 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2040 = _1852 + _2038;
    float _2042 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2044 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2046 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2048 = _1858 + _2046;
    float _2050 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2042);
    float _2052 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2044);
    float _2054 = fma(_2040, _2024, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _2056 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2058 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2060 = _2056 || _2058;
    bool _2062 = isnan(0.5);
    bool _2064 = _2060 || _2062;
    float _2066 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2050);
    float _2068 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2052);
    float _2070 = -_1323;
    float _2072 = _2070 + _2054;
    float _2074 = _2066 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2076 = _2068 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2078 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2080 = _1860 + _2078;
    float _2082 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2084 = 1.0 / _2074;
    float _2086 = _2076 + _2074;
    float _2088 = fma(_2080, _2024, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2090 = fma(_2048, _2024, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2092 = -_1325;
    float _2094 = _2092 + _2088;
    float _2096 = -_1341;
    float _2098 = _2096 + _2090;
    float _2100 = _2086 * _2084;
    float _2102 = _2100 * 0.5;
    float _2104 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2106 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2108 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2106);
    float _2110 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2112 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2104);
    float _2114 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2116 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2082);
    float _2118 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2110);
    float _2120 = 1.0 / _2108;
    float _2122 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2112);
    float _2124 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2114);
    float _2126 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2118);
    float _2128 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2116);
    float _2130 = _2122 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2132 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2124);
    float _2134 = _2126 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2136 = _2124;
    if (_2064)
    {
        _2136 = 1.0;
    }
    float _2138 = _2136;
    float _2140 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2142 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2144 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2146 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2148 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2140);
    float _2150 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2142);
    float _2152 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2144);
    float _2154 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2146);
    float _2156 = _2140;
    float _2158 = _2138;
    if (_2064)
    {
        _2156 = 1.0;
    }
    float _2160 = _2156;
    float _2162 = _2128 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2164 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2166 = _2120 * _2164;
    float _2168 = _2160;
    if (!_2064)
    {
        float _2170 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2172 = _2170 * 0.15915493667125701904296875;
        float _2174 = _2172 * 6.283185482025146484375;
        float _2176 = cos(_2174);
        float _2178 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2180 = _2178 * 0.15915493667125701904296875;
        float _2182 = _2172 * 6.283185482025146484375;
        float _2184 = sin(_2182);
        float _2186 = 1.0 / _2176;
        float _2188 = _2180 * 6.283185482025146484375;
        float _2190 = cos(_2188);
        float _2192 = _2184 * _2186;
        float _2194 = _2180 * 6.283185482025146484375;
        float _2196 = sin(_2194);
        float _2198 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2200 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2198;
        float _2202 = _2190 * _2192;
        float _2204 = 1.0 / _2200;
        float _2206 = 1.0 / _2202;
        float _2208 = _2196 * _2206;
        float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2212 = fma(_2166, _2208, _2210);
        float _2214 = _2212 * _2204;
        float _2216 = precise::clamp(_2214, 0.0, 1.0);
        _2158 = _2216;
    }
    float _2218 = _2158;
    if (!_2064)
    {
        float _2220 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2222 = _2220 * 0.15915493667125701904296875;
        float _2224 = _2222 * 6.283185482025146484375;
        float _2226 = cos(_2224);
        float _2228 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2230 = _2228 * 0.15915493667125701904296875;
        float _2232 = _2222 * 6.283185482025146484375;
        float _2234 = sin(_2232);
        float _2236 = 1.0 / _2226;
        float _2238 = _2230 * 6.283185482025146484375;
        float _2240 = cos(_2238);
        float _2242 = _2234 * _2236;
        float _2244 = _2230 * 6.283185482025146484375;
        float _2246 = sin(_2244);
        float _2248 = _2240 * _2242;
        float _2250 = 1.0 / _2248;
        float _2252 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2254 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2252;
        float _2256 = 1.0 / _2254;
        float _2258 = _2246 * _2250;
        float _2260 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2262 = fma(_2166, _2258, _2260);
        float _2264 = _2262 * _2256;
        float _2266 = precise::clamp(_2264, 0.0, 1.0);
        float _2268 = -_2266;
        float _2270 = _2268 + 1.0;
        _2168 = _2270;
    }
    float _2272 = _2168;
    float _2274 = _2132 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2276 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2152);
    float _2278 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2148);
    float _2280 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2150);
    float _2282 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2154);
    float _2284 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2276);
    bool _2286 = _2218 > 0.0;
    bool _2288 = isnan(_2218);
    bool _2290 = _2286 || _2288;
    bool _2292 = isnan(0.0);
    bool _2294 = _2290 || _2292;
    float _2296 = _2218 * _2272;
    float _2298 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2282);
    float _2300 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2302 = _2284 + _2300;
    bool _2304 = _2272 <= 0.0;
    bool _2306 = !_2294;
    bool _2308 = _2304 || _2306;
    float _2310 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2278);
    float _2312 = _2296 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2314 = _2298 + _2302;
    float _2316 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2280);
    float _2318 = _2312 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2320 = _2314 * 0.5;
    out.gl_Position.x = _2310;
    out.gl_Position.y = _2316;
    out.gl_Position.z = _2302;
    out.gl_Position.w = _2298;
    out.m_58.z = _2320;
    out.m_58.w = _2298;
    out.m_35.x = _2318;
    if (!_2308)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _2322 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2322;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1994 = false;
    bool _1167 = false;
    bool _991 = false;
    bool _751 = false;
    bool _589 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_32.w;
    float _74 = trunc(_72);
    int _77 = int(_74);
    bool _81 = _77 >= 1;
    float _83 = 0.0;
    if (!_81)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _85 = _83;
    float _87 = _85;
    if (!_81)
    {
        out.m_35.x = 0.0;
    }
    int _89 = 0;
    if (!_81)
    {
        float _91 = _85 * 5.0;
        _89 = as_type<int>(_91);
    }
    int _93 = _89;
    int _95 = _93;
    if (!_81)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2379 = as_type<float>(_93);
        out.gl_Position.z = _2379;
    }
    if (!_81)
    {
        return out;
    }
    float _97 = in.m_37.w;
    bool _99 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _107 = _103 || _105;
    float _109 = -_97;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_107)
    {
        float _113 = float(_77);
        _87 = _113;
    }
    float _115 = _87;
    bool _117 = _111 >= _115;
    bool _119 = !_107;
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
        _95 = as_type<int>(_127);
    }
    int _129 = _95;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2448 = as_type<float>(_129);
        out.gl_Position.z = _2448;
    }
    if (_121)
    {
        return out;
    }
    float _131 = in.m_39.y;
    float _133 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _135 = in.m_41.y;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = in.m_43.y;
    float _149 = in.m_39.z;
    float _151 = in.m_41.z;
    float _153 = 0.0;
    float _155 = _133;
    if (!_145)
    {
        float _157 = _133 * _133;
        float _159 = _157 * 0.5;
        _153 = _159;
    }
    float _161 = _153;
    float _163 = 0.0;
    float _165 = _161;
    if (!_145)
    {
        float _167 = _111 * _111;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = in.m_43.z;
    if (!_145)
    {
        float _175 = _161 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _165 = _175;
    }
    float _177 = _165;
    float _179 = _131 * _131;
    float _181 = in.m_37.x;
    float _183 = in.m_37.y;
    float _185 = in.m_37.z;
    float _187 = fma(_135, _135, _179);
    float _189 = fma(_147, _147, _187);
    float _191 = sqrt(_189);
    bool _193 = _191 > 0.0;
    float _195 = _149 * _149;
    float _197 = fma(_151, _151, _195);
    bool _199 = !_145;
    float _201 = _187;
    float _203 = _177;
    float _205 = _197;
    if (!_199)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _133 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _133);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _225;
        _203 = _235;
    }
    float _237 = _201;
    float _239 = _203;
    bool _241 = !_145;
    float _243 = _237;
    float _245 = 0.0;
    if (!_241)
    {
        float _247 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = log2(_247);
        float _251 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _253 = _251 + 1.0;
        float _255 = 1.0 / _253;
        float _257 = _133 * _249;
        float _259 = exp2(_257);
        float _261 = -_259;
        float _263 = _261 + 1.0;
        float _265 = _263 * _255;
        _243 = _253;
        _155 = _265;
        _245 = _255;
    }
    float _267 = _243;
    float _269 = _155;
    float _271 = _245;
    float _273 = fma(_173, _173, _197);
    float _275 = _267;
    float _277 = _269;
    float _279 = _271;
    if (!_145)
    {
        _275 = _111;
    }
    float _281 = _275;
    float _283 = _281;
    if (!_145)
    {
        float _285 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _285;
    }
    float _287 = _205;
    bool _289 = !_145;
    float _291 = _287;
    float _293 = 0.0;
    if (!_289)
    {
        float _295 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _297 = log2(_295);
        float _299 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _301 = _299 + 1.0;
        float _303 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = _111 * _297;
        float _307 = 1.0 / _301;
        float _309 = _303 * 0.693147182464599609375;
        float _311 = exp2(_305);
        float _313 = 1.0 / _309;
        float _315 = _311 + (-1.0);
        float _317 = -_315;
        float _319 = fma(_317, _313, _111);
        float _321 = _319 * _307;
        float _323 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _291 = _323;
        _293 = _307;
    }
    float _325 = _291;
    float _327 = _293;
    bool _329 = !_145;
    float _331 = _327;
    if (!_329)
    {
        float _333 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _335 = log2(_333);
        float _337 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _339 = _337 + 1.0;
        float _341 = 1.0 / _339;
        float _343 = _111 * _335;
        float _345 = exp2(_343);
        float _347 = -_345;
        float _349 = _347 + 1.0;
        float _351 = _349 * _341;
        _283 = _351;
    }
    float _353 = _283;
    float _355 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _357 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _359 = sqrt(_273);
    float _361 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _363 = fma(_269, _183, _355);
    float _365 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _367 = fma(_353, _183, _357);
    float _369 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _371 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _373 = fma(_269, _181, _361);
    float _375 = fma(_353, _181, _365);
    float _377 = -_367;
    float _379 = _363 + _377;
    float _381 = fma(_353, _185, _369);
    float _383 = fma(_269, _185, _371);
    float _385 = -_375;
    float _387 = _373 + _385;
    float _389 = _379 * _379;
    float _391 = in.m_41.x;
    float _393 = -_381;
    float _395 = _383 + _393;
    bool _397 = _359 > 0.0;
    float _399 = fma(_387, _387, _389);
    float _401 = in.m_39.x;
    float _403 = 0.0;
    float _405 = _359;
    float _407 = _367;
    float _409 = _395;
    if (_193)
    {
        float _411 = rsqrt(_189);
        _403 = _411;
    }
    float _413 = _403;
    if (!_193)
    {
        _331 = 0.0;
    }
    float _415 = _331;
    float _417 = fma(_395, _395, _399);
    float _419 = in.m_43.x;
    float _421 = _415;
    if (!_193)
    {
        _405 = 0.0;
    }
    float _423 = _405;
    float _425 = _379 * _147;
    float _427 = _423;
    if (!_193)
    {
        _277 = 0.0;
    }
    float _429 = _277;
    float _431 = in.m_45.w;
    float _433 = sqrt(_417);
    float _435 = _429;
    if (!_397)
    {
        _279 = 0.0;
    }
    float _437 = _279;
    float _439 = in.m_32.x;
    float _441 = in.m_32.y;
    float _443 = in.m_32.z;
    float _445 = _437;
    if (!_397)
    {
        _407 = 0.0;
    }
    float _447 = _407;
    float _449 = 0.0;
    float _451 = _447;
    if (_397)
    {
        float _453 = rsqrt(_273);
        _449 = _453;
    }
    float _455 = _449;
    if (_193)
    {
        float _457 = _413 * _135;
        _421 = _457;
    }
    float _459 = _421;
    float _461 = _459;
    if (_193)
    {
        float _463 = _413 * _131;
        _427 = _463;
    }
    float _465 = _427;
    float _467 = _465;
    if (_193)
    {
        float _469 = _413 * _147;
        _435 = _469;
    }
    float _471 = _435;
    float _473 = _379 * _135;
    bool _475 = _433 >= 9.9999999747524270787835121154785e-07;
    bool _477 = isnan(_433);
    bool _479 = _475 || _477;
    bool _481 = isnan(9.9999999747524270787835121154785e-07);
    bool _483 = _479 || _481;
    float _485 = _379 * _131;
    float _487 = fma(_387, _391, _473);
    float _489 = fma(_387, _419, _425);
    float _491 = _433;
    float _493 = _489;
    float _495 = _471;
    if (!_397)
    {
        _491 = 0.0;
    }
    float _497 = _491;
    float _499 = fma(_387, _401, _485);
    float _501 = fma(_395, _151, _487);
    float _503 = fma(_395, _173, _489);
    float _505 = _455;
    float _507 = _497;
    float _509 = _501;
    if (_397)
    {
        float _511 = _455 * 0.001000000047497451305389404296875;
        _505 = _511;
    }
    float _513 = _505;
    float _515 = fma(_373, _431, _439);
    if (_397)
    {
        float _517 = _151 * _513;
        _445 = _517;
    }
    float _519 = _445;
    if (_397)
    {
        float _521 = _149 * _513;
        _507 = _521;
    }
    float _523 = _507;
    if (_397)
    {
        float _525 = _173 * _513;
        _451 = _525;
    }
    float _527 = _451;
    float _529 = fma(_395, _149, _499);
    if (_483)
    {
        _409 = _501;
    }
    float _531 = _409;
    float _533 = fma(_363, _431, _441);
    float _535 = fma(_383, _431, _443);
    float _537 = _531;
    float _539 = _531;
    if (_483)
    {
        _509 = _503;
    }
    float _541 = _509;
    float _543 = _541;
    if (_483)
    {
        _493 = _529;
    }
    float _545 = _493;
    float _547 = _545;
    float _549 = _545;
    if (!_483)
    {
        bool _551 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _553 = !_551;
        if (!_553)
        {
            float _555 = _131 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _557 = _135 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _559 = _147 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _561 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[16].x, _555);
            float _563 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[16].x, _557);
            float _565 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[16].x, _559);
            float _567 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[16].z, _561);
            float _569 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[16].z, _563);
            float _571 = fma(_173, (*spvDescriptorSet0.vp_c9)._m0[16].z, _565);
            float _573 = _567 * _567;
            float _575 = fma(_569, _569, _573);
            float _577 = fma(_571, _571, _575);
            float _579 = rsqrt(_577);
            float _581 = _579 * 9.9999999747524270787835121154785e-07;
            float _583 = _569 * _581;
            float _585 = _567 * _581;
            float _587 = _571 * _581;
            _549 = _585;
            _539 = _583;
            _543 = _587;
            _589 = true;
        }
        else
        {
            float _591 = _183 * _183;
            float _593 = fma(_181, _181, _591);
            float _595 = fma(_185, _185, _593);
            float _597 = sqrt(_595);
            bool _599 = _597 >= 9.9999999747524270787835121154785e-07;
            bool _601 = isnan(_597);
            bool _603 = _599 || _601;
            bool _605 = isnan(9.9999999747524270787835121154785e-07);
            bool _607 = _603 || _605;
            float _609 = _597;
            if (!_607)
            {
                float _611 = _441 * _441;
                float _613 = fma(_439, _439, _611);
                float _615 = fma(_443, _443, _613);
                float _617 = sqrt(_615);
                bool _619 = _617 >= 9.9999999747524270787835121154785e-07;
                bool _621 = isnan(_617);
                bool _623 = _619 || _621;
                bool _625 = isnan(9.9999999747524270787835121154785e-07);
                bool _627 = _623 || _625;
                float _629 = _189;
                if (!_627)
                {
                    float _631 = rsqrt(_189);
                    _629 = _631;
                }
                float _633 = _629;
                if (!_627)
                {
                    float _635 = _633 * 9.9999999747524270787835121154785e-07;
                    _609 = _635;
                }
                float _637 = _609;
                float _639 = _637;
                if (!_627)
                {
                    float _641 = _135 * _637;
                    _537 = _641;
                }
                float _643 = _537;
                _539 = _643;
                if (!_627)
                {
                    float _645 = _131 * _637;
                    _547 = _645;
                }
                float _647 = _547;
                _549 = _647;
                if (!_627)
                {
                    float _649 = _147 * _637;
                    _639 = _649;
                }
                float _651 = _639;
                bool _653 = !_627;
                _543 = _651;
                _589 = _653;
                if (!_589)
                {
                    float _655 = _131 * _441;
                    float _657 = _135 * _441;
                    float _659 = _147 * _441;
                    float _661 = fma(_439, _401, _655);
                    float _663 = fma(_439, _391, _657);
                    float _665 = fma(_439, _419, _659);
                    float _667 = fma(_149, _443, _661);
                    float _669 = fma(_151, _443, _663);
                    float _671 = fma(_173, _443, _665);
                    float _673 = _667 * _667;
                    float _675 = fma(_669, _669, _673);
                    float _677 = fma(_671, _671, _675);
                    float _679 = rsqrt(_677);
                    float _681 = _679 * 9.9999999747524270787835121154785e-07;
                    float _683 = _669 * _681;
                    float _685 = _667 * _681;
                    float _687 = _671 * _681;
                    _549 = _685;
                    _539 = _683;
                    _543 = _687;
                    _589 = true;
                }
            }
            else
            {
                float _689 = _131 * _183;
                float _691 = _135 * _183;
                float _693 = _147 * _183;
                float _695 = fma(_181, _401, _689);
                float _697 = fma(_181, _391, _691);
                float _699 = fma(_181, _419, _693);
                float _701 = fma(_149, _185, _695);
                float _703 = fma(_151, _185, _697);
                float _705 = fma(_173, _185, _699);
                float _707 = _701 * _701;
                float _709 = fma(_703, _703, _707);
                float _711 = fma(_705, _705, _709);
                float _713 = rsqrt(_711);
                float _715 = _713 * 9.9999999747524270787835121154785e-07;
                float _717 = _703 * _715;
                float _719 = _701 * _715;
                float _721 = _705 * _715;
                _549 = _719;
                _539 = _717;
                _543 = _721;
            }
        }
    }
    _589 = false;
    float _723 = _549;
    float _725 = _539;
    float _727 = _543;
    bool _729 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _731 = !_729;
    float _749;
    if (!_731)
    {
        float _733 = in.m_47.x;
        float _735 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _737 = _733 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _739 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _741 = _739 * _735;
        float _743 = floor(_741);
        float _745 = -_743;
        float _747 = _741 + _745;
        _749 = _747;
        _751 = true;
    }
    else
    {
        float _753 = float(_77);
        float _755 = 1.0 / _753;
        float _757 = _111 * _755;
        _749 = _757;
    }
    _751 = false;
    float _759 = _749;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _763 = _759 + _761;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _767 = _759 + _765;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _771 = _759 + _769;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _773;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _789 = 1.0 / _775;
    bool _791 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _793 = 1.0 / _779;
    float _795 = 1.0 / _787;
    float _797 = _763 * _789;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _801 = _759 + _799;
    bool _803 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _805 = isnan(_759);
    bool _807 = _803 || _805;
    bool _809 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _811 = _807 || _809;
    float _813 = float(_811);
    float _815 = 1.0 / _783;
    float _817 = _767 * _793;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _819;
    float _823 = fma(_821, _797, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _825 = _801 * _795;
    bool _827 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _829 = isnan(_759);
    bool _831 = _827 || _829;
    bool _833 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _835 = _831 || _833;
    float _837 = float(_835);
    float _839 = -_813;
    float _841 = _839 + 1.0;
    float _843 = -_837;
    float _845 = _843 + 1.0;
    float _847 = _837 * _841;
    float _849 = _771 * _815;
    bool _851 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _853 = isnan(_759);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _859 = _855 || _857;
    float _861 = float(_859);
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _863;
    bool _867 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _869 = isnan(_759);
    bool _871 = _867 || _869;
    bool _873 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _875 = _871 || _873;
    float _877 = float(_875);
    float _879 = fma(_865, _797, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _881 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _883 = isnan(_759);
    bool _885 = _881 || _883;
    bool _887 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _889 = _885 || _887;
    float _891 = float(_889);
    float _893 = _861 * _845;
    float _895 = -_861;
    float _897 = _895 + 1.0;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _901 = _899 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _905 = _903 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _907 = _891 * _897;
    float _909 = -_891;
    float _911 = _909 + 1.0;
    float _913 = -_877;
    float _915 = _913 + 1.0;
    float _917 = fma(_905, _817, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _919 = fma(_901, _817, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _921 = _877 * _911;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _923;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _927;
    float _931 = _823 * _921;
    float _933 = _879 * _921;
    float _935 = fma(_925, _849, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _937 = fma(_929, _849, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _939 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[143].x, _931);
    float _941 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[143].y, _933);
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _951 = fma(_917, _907, _939);
    float _953 = fma(_919, _907, _941);
    float _955 = fma(_945, _825, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _957 = fma(_949, _825, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _959 = fma(_935, _893, _951);
    float _961 = fma(_937, _893, _953);
    float _963 = fma(_955, _847, _959);
    float _965 = fma(_957, _847, _961);
    float _967 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[147].x, _963);
    float _969 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[147].y, _965);
    bool _971 = !_791;
    float _989;
    if (!_971)
    {
        float _973 = in.m_47.x;
        float _975 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _977 = _973 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _979 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[11].x, _111);
        float _981 = _979 * _975;
        float _983 = floor(_981);
        float _985 = -_983;
        float _987 = _981 + _985;
        _989 = _987;
        _991 = true;
    }
    else
    {
        float _993 = float(_77);
        float _995 = 1.0 / _993;
        float _997 = _111 * _995;
        _989 = _997;
    }
    _991 = false;
    float _999 = _989;
    float _1001 = in.m_45.x;
    float _1003 = in.m_45.y;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1007 = _999 + _1005;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1011 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1009;
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1017 = 1.0 / _1011;
    bool _1019 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _1021 = 1.0 / _1015;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1025 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1023;
    float _1027 = _1007 * _1017;
    bool _1029 = _999 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1031 = isnan(_999);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1037 = _1033 || _1035;
    float _1039 = float(_1037);
    float _1041 = _969 * _1003;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1045 = _999 + _1043;
    bool _1047 = _999 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1049 = isnan(_999);
    bool _1051 = _1047 || _1049;
    bool _1053 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1055 = _1051 || _1053;
    float _1057 = float(_1055);
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1059;
    bool _1063 = _999 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1065 = isnan(_999);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1071 = _1067 || _1069;
    float _1073 = float(_1071);
    float _1075 = -_1039;
    float _1077 = _1075 + 1.0;
    float _1079 = fma(_1025, _1027, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1081 = fma(_1061, _1027, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1083 = _1045 * _1021;
    float _1085 = _1073 * _1077;
    float _1087 = -_1073;
    float _1089 = _1087 + 1.0;
    float _1091 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1091;
    float _1095 = _1057 * _1089;
    float _1097 = fma(_1093, _1027, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1099 = -_1057;
    float _1101 = _1099 + 1.0;
    float _1103 = _1079 * _1095;
    float _1105 = _1097 * _1095;
    float _1107 = _1081 * _1095;
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1111 = _1109 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1115 = _1113 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1121 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1105);
    float _1123 = fma(_1111, _1083, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1125 = fma(_1115, _1083, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1127 = fma(_1119, _1083, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1129 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1103);
    float _1131 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1107);
    float _1133 = fma(_1123, _1085, _1121);
    float _1135 = _967 * _1001;
    float _1137 = fma(_1125, _1085, _1129);
    float _1139 = fma(_1127, _1085, _1131);
    float _1141 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1133);
    float _1143 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1137);
    float _1145 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1139);
    bool _1147 = !_1019;
    float _1165;
    if (!_1147)
    {
        float _1149 = in.m_47.x;
        float _1151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1153 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1155 = fma(_1153, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _1157 = _1155 * _1151;
        float _1159 = floor(_1157);
        float _1161 = -_1159;
        float _1163 = _1157 + _1161;
        _1165 = _1163;
        _1167 = true;
    }
    else
    {
        float _1169 = float(_77);
        float _1171 = 1.0 / _1169;
        float _1173 = _111 * _1171;
        _1165 = _1173;
    }
    _1167 = false;
    float _1175 = _1165;
    float _1177 = _723 * _723;
    float _1179 = in.m_39.w;
    float _1181 = _533 * _131;
    float _1183 = fma(_725, _725, _1177);
    float _1185 = in.m_41.w;
    float _1187 = _533 * _135;
    float _1189 = fma(_515, _401, _1181);
    float _1191 = fma(_727, _727, _1183);
    float _1193 = in.m_43.w;
    float _1195 = _533 * _147;
    float _1197 = fma(_515, _391, _1187);
    float _1199 = rsqrt(_1191);
    float _1201 = fma(_535, _149, _1189);
    float _1203 = fma(_515, _419, _1195);
    float _1205 = fma(_535, _151, _1197);
    float _1207 = as_type<float>(int(gl_VertexIndex));
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1211 = in.m_47.z;
    float _1213 = in.m_47.w;
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1217 = in.m_47.x;
    float _1219 = _1201 + _1179;
    float _1221 = _1199 * _723;
    float _1223 = _1199 * _725;
    float _1225 = _1205 + _1185;
    float _1227 = _1199 * _727;
    float _1229 = _1221 * _465;
    float _1231 = _1135 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1233 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1235 = _1225 + _1233;
    float _1237 = fma(_1223, _459, _1229);
    float _1239 = fma(_535, _173, _1203);
    float _1241 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1243 = _1219 + _1241;
    float _1245 = fma(_1227, _471, _1237);
    float _1247 = _1239 + _1193;
    float _1249 = _1243 * _1243;
    float _1251 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1253 = _1247 + _1251;
    float _1255 = fma(_1235, _1235, _1249);
    float _1257 = abs(_1245);
    bool _1259 = _1257 > 0.99989998340606689453125;
    float _1261 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1265 = _1263 != 0;
    float _1267 = fma(_1253, _1253, _1255);
    int _1269 = as_type<int>(_1207) & 1;
    bool _1271 = _1269 != 0;
    int _1273 = as_type<int>(_1207) & 2;
    bool _1275 = _1273 != 0;
    bool _1277 = _1211 > 0.5;
    float _1279 = rsqrt(_1267);
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1283 = _1281 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    if (_1259)
    {
        float _1285 = _465 + _523;
        _467 = _1285;
    }
    float _1287 = _467;
    if (_1259)
    {
        float _1289 = _459 + _519;
        _461 = _1289;
    }
    float _1291 = _461;
    float _1293 = 1.0 / _1283;
    bool _1295 = _1213 > 0.5;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1299 = _1297 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1301 = !_1271;
    float _1303 = _1301 ? (-0.5) : 0.5;
    if (_1259)
    {
        float _1305 = _471 + _527;
        _495 = _1305;
    }
    float _1307 = _495;
    bool _1309 = _1217 > 0.5;
    float _1311 = _1261 * _1279;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1315 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1313;
    float _1317 = 1.0 / _1299;
    bool _1319 = !_1275;
    float _1321 = _1319 ? (-0.5) : 0.5;
    float _1323 = _1243 * _1311;
    float _1325 = _1235 * _1311;
    float _1327 = -_1303;
    int _1329 = _1309 ? as_type<int>(_1327) : as_type<int>(_1303);
    float _1331 = -_1323;
    float _1333 = _1243 + _1331;
    float _1335 = -_1325;
    float _1337 = _1235 + _1335;
    float _1339 = _1315 * _1293;
    float _1341 = _1253 * _1311;
    float _1343 = _1333 * _1333;
    float _1345 = in.m_47.y;
    float _1347 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1349 = _1347 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1351 = -_1291;
    float _1353 = _1227 * _1351;
    float _1355 = fma(_1337, _1337, _1343);
    float _1357 = -_1341;
    float _1359 = _1253 + _1357;
    int _1361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1363 = _1361 != 0;
    float _1365 = 1.0 / _1349;
    int _1367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1369 = _1367 != 0;
    float _1371 = -_1307;
    float _1373 = -_1353;
    float _1375 = fma(_1223, _1371, _1373);
    int _1377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1379 = _1377 != 0;
    float _1381 = fma(_1359, _1359, _1355);
    int _1383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1385 = _1383 != 0;
    float _1387 = -_1307;
    float _1389 = _1221 * _1387;
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1393 = _1391 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1395 = sqrt(_1381);
    float _1397 = _1375 * _1375;
    float _1399 = -_1287;
    float _1401 = -_1389;
    float _1403 = fma(_1227, _1399, _1401);
    float _1405 = -_1287;
    float _1407 = _1223 * _1405;
    float _1409 = _1393 * _1317;
    float _1411 = fma(_1403, _1403, _1397);
    float _1413 = -_1291;
    float _1415 = -_1407;
    float _1417 = fma(_1221, _1413, _1415);
    float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1419;
    float _1423 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1425 = _1175 + _1423;
    float _1427 = fma(_1417, _1417, _1411);
    float _1429 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1431 = _1175 + _1429;
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1435 = _1433 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1437 = _1421 * _1365;
    float _1439 = rsqrt(_1427);
    float _1441 = fma(_1339, _1425, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1443 = _1421;
    float _1445 = _1435;
    if (!_1265)
    {
        _1443 = _1345;
    }
    float _1447 = _1443;
    float _1449 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1451 = _1175 + _1449;
    float _1453 = _1279 * _1395;
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1457 = _1455 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1459 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1461 = fma(_1409, _1451, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1463 = 1.0 / _1435;
    float _1465 = fma(_1437, _1431, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1467 = _1303 * _1231;
    bool _1469 = !_1379;
    float _1471 = _1469 ? _1303 : as_type<float>(_1329);
    float _1473 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1303);
    float _1475 = _1231 * _1453;
    float _1477 = _1459 * _1217;
    bool _1479 = _1175 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1481 = isnan(_1175);
    bool _1483 = _1479 || _1481;
    bool _1485 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1487 = _1483 || _1485;
    float _1489 = float(_1487);
    float _1491 = _1403 * _1439;
    float _1493 = _1447;
    float _1495 = _1467;
    float _1497 = _1465;
    if (!_1265)
    {
        _1445 = _1447;
    }
    float _1499 = _1445;
    float _1501 = _1475 * _1473;
    float _1503 = _1499;
    if (_1265)
    {
        _1493 = _1345;
    }
    float _1505 = _1493;
    float _1507 = _1041 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1509 = _1175 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1511 = isnan(_1175);
    bool _1513 = _1509 || _1511;
    bool _1515 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1517 = _1513 || _1515;
    float _1519 = float(_1517);
    float _1521 = _1375 * _1439;
    if (_1265)
    {
        _1503 = _1217;
    }
    float _1523 = _1503;
    float _1525 = _1417 * _1439;
    bool _1527 = _1175 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1529 = isnan(_1175);
    bool _1531 = _1527 || _1529;
    bool _1533 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1535 = _1531 || _1533;
    float _1537 = float(_1535);
    float _1539 = -_1519;
    float _1541 = _1539 + 1.0;
    float _1543 = _1395;
    if (!_1265)
    {
        float _1545 = in.m_47.z;
        _1543 = _1545;
    }
    float _1547 = _1543;
    float _1549 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1321);
    float _1551 = _1507 * _1453;
    float _1553 = _1489 * _1541;
    float _1555 = -_1489;
    float _1557 = _1555 + 1.0;
    bool _1559 = _1175 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1561 = isnan(_1175);
    bool _1563 = _1559 || _1561;
    bool _1565 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1567 = _1563 || _1565;
    float _1569 = float(_1567);
    float _1571 = -_1537;
    float _1573 = _1571 + 1.0;
    float _1575 = _1551 * _1549;
    float _1577 = _1537 * _1557;
    bool _1579 = _1175 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1581 = isnan(_1175);
    bool _1583 = _1579 || _1581;
    bool _1585 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1587 = _1583 || _1585;
    float _1589 = float(_1587);
    float _1591 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1593 = _1175 + _1591;
    float _1595 = _1569 * _1573;
    float _1597 = trunc(_1477);
    int _1599 = int(_1597);
    float _1601 = _1457 * _1463;
    float _1603 = _1221 * _1525;
    float _1605 = _1575 * _1223;
    float _1607 = _1223 * _1521;
    float _1609 = _1575 * _1227;
    float _1611 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1613 = _1611 * 0.5;
    float _1615 = -_1603;
    float _1617 = fma(_1227, _1521, _1615);
    float _1619 = fma(_1501, _1491, _1605);
    float _1621 = -_1607;
    float _1623 = fma(_1221, _1491, _1621);
    float _1625 = fma(_1501, _1525, _1609);
    float _1627 = -_1569;
    float _1629 = _1627 + 1.0;
    float _1631 = fma(_1613, _1617, _1619);
    float _1633 = _1619;
    float _1635 = _1547;
    if (!_1265)
    {
        _1633 = _1547;
    }
    float _1637 = _1633;
    float _1639 = fma(_1613, _1623, _1625);
    float _1641 = _1589 * _1629;
    int _1643 = _1599 << 4;
    int _1645 = _1643 + 1968;
    float _1647 = _1225 + _1631;
    float _1649 = _1247 + _1639;
    float _1651 = _1637;
    float _1653 = _1649;
    float _1655 = _1647;
    if (_1265)
    {
        _1651 = _1505;
    }
    float _1657 = _1651;
    float _1659 = fma(_1601, _1593, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    if (_1265)
    {
        _1635 = _1505;
    }
    float _1661 = _1635;
    float _1663 = _1441 * _1641;
    bool _1665 = _1505 > 0.5;
    uint _1668 = uint(int(uint(_1645) >> uint(2)));
    uint _1670 = uint(int(uint(int(_1668)) >> uint(2)));
    int _1672 = int(_1668) & 3;
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[int(_1670)][_1672];
    int _1676 = int(_1668) + 1;
    uint _1678 = uint(int(uint(_1676) >> uint(2)));
    int _1680 = _1676 & 3;
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[int(_1678)][_1680];
    float _1684 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1686 = _1647 + _1684;
    float _1688 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1690 = _1649 + _1688;
    float _1692 = -_1589;
    float _1694 = _1692 + 1.0;
    float _1696 = fma(_1523, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1209);
    float _1698 = _1686 * _1686;
    float _1700 = _1690 * _1690;
    float _1702 = _1575 * _1221;
    int _1704 = _1645 + 8;
    uint _1706 = uint(int(uint(_1704) >> uint(2)));
    uint _1708 = uint(int(uint(int(_1706)) >> uint(2)));
    int _1710 = int(_1706) & 3;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[int(_1708)][_1710];
    float _1714 = _1523 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1716 = _1698 + _1700;
    float _1718 = _1227 * _1491;
    float _1720 = -_1321;
    int _1722 = _1295 ? as_type<int>(_1720) : as_type<int>(_1321);
    float _1724 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1663);
    float _1726 = sqrt(_1716);
    float _1728 = -_1718;
    float _1730 = fma(_1223, _1525, _1728);
    float _1732 = -_1215;
    float _1734 = fma(_1714, 2.0, _1732);
    float _1736 = fma(_1501, _1521, _1702);
    bool _1738 = !_1369;
    float _1740 = _1738 ? _1321 : as_type<float>(_1722);
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1744 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1748 = fma(_1613, _1730, _1736);
    float _1750 = _1657 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1752 = fma(_1461, _1595, _1724);
    float _1754 = fma(_1661, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1742);
    float _1756 = _1219 + _1748;
    float _1758 = fma(_1750, -2.0, _1744);
    float _1760 = -_1321;
    int _1762 = _1665 ? as_type<int>(_1760) : as_type<int>(_1321);
    float _1764 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1766 = _1726 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1768 = fma(_1465, _1577, _1752);
    float _1770 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1696);
    float _1772 = -_111;
    float _1774 = fma(_1772, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1734);
    float _1776 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1754);
    bool _1778 = !_1385;
    float _1780 = _1778 ? _1321 : as_type<float>(_1762);
    float _1782 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1758);
    float _1784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1786 = fma(_1659, _1553, _1768);
    float _1788 = _1698;
    float _1790 = _1700;
    if (_1363)
    {
        float _1792 = -_1467;
        float _1794 = _1277 ? _1792 : _1467;
        _1495 = _1794;
    }
    float _1796 = _1495;
    if (!_1766)
    {
        _1497 = _1756;
    }
    float _1798 = _1497;
    bool _1800 = !_1766;
    float _1802 = _1798;
    if (!_1800)
    {
        float _1804 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1806 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1808 = _1726 + _1806;
        float _1810 = _1756 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1812 = rsqrt(_1716);
        float _1814 = _1808 * _1804;
        float _1816 = _1814 * 0.15915493667125701904296875;
        float _1818 = _1816 * 6.283185482025146484375;
        float _1820 = sin(_1818);
        float _1822 = _1816 * 6.283185482025146484375;
        float _1824 = cos(_1822);
        float _1826 = fma(_1820, _1810, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1828 = _1812 * _1826;
        float _1830 = fma(_1686, _1828, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1832 = _1824 + (-1.0);
        float _1834 = fma(_1690, _1828, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1836 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1838 = _1830 + _1836;
        float _1840 = _1832 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1842 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1844 = _1834 + _1842;
        float _1846 = _1838 * _1838;
        float _1848 = fma(_1756, _1824, _1840);
        float _1850 = _1844 * _1844;
        _1802 = _1848;
        _1788 = _1846;
        _1790 = _1850;
        _1653 = _1834;
        _1655 = _1830;
    }
    float _1852 = _1802;
    float _1854 = _1788;
    float _1856 = _1790;
    float _1858 = _1653;
    float _1860 = _1655;
    float _1862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1864 = _1764 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1866 = _1740 + (-0.5);
    float _1868 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1870 = _1852 + _1868;
    float _1872 = _1746 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1874 = _1796 + 0.5;
    float _1876 = -_1864;
    float _1878 = -_1782;
    float _1880 = fma(_1876, _1866, _1878);
    float _1882 = fma(_1519, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1786);
    float _1884 = _1674 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1886 = fma(_1870, _1870, _1854);
    float _1888 = _1471 + 0.5;
    float _1890 = -_1780;
    float _1892 = _1890 + 0.5;
    float _1894 = _1682 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1896 = fma(_1872, _1874, _1774);
    float _1898 = -_1770;
    float _1900 = _1898 + 1.0;
    float _1902 = -_1776;
    float _1904 = _1902 + 1.0;
    float _1906 = _1886 + _1856;
    float _1908 = _1892 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1910 = _1888 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1912 = -_1900;
    float _1914 = fma(_1912, _1796, _1896);
    float _1916 = fma(_1740, _1904, _1880);
    float _1918 = _1908 * _1862;
    float _1920 = _1141 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1922 = _1145 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1924 = sqrt(_1906);
    float _1926 = _1143 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1928 = _1712 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1930 = _1910 * _1784;
    float _1932 = _1894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1934 = _1920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1936 = _1926 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1940 = _1884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1942 = _1928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1944 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1946 = _1882 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_52.x = _1930;
    out.m_52.y = _1918;
    out.m_52.z = _1914;
    out.m_52.w = _1916;
    bool _1948 = _1924 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1950 = isnan(_1924);
    bool _1952 = _1948 || _1950;
    bool _1954 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1956 = _1952 || _1954;
    out.m_54.x = _1940;
    out.m_54.y = _1932;
    out.m_54.z = _1942;
    out.m_54.w = _1938;
    out.m_56.x = _1934;
    out.m_56.y = _1936;
    out.m_56.z = _1944;
    out.m_56.w = _1946;
    float _1958 = _1928;
    if (!_1956)
    {
        _1958 = 1.0;
    }
    float _1960 = _1958;
    bool _1962 = !_1956;
    float _1964 = _1960;
    if (!_1962)
    {
        bool _1966 = _1924 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1968 = isnan(_1924);
        bool _1970 = _1966 || _1968;
        bool _1972 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1974 = _1970 || _1972;
        if (!_1974)
        {
            float _1976 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1978 = _1924 + _1976;
            float _1980 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1982 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1980;
            float _1984 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1986 = _1984 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1988 = 1.0 / _1982;
            float _1990 = _1978 * _1988;
            float _1992 = fma(_1990, _1986, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1964 = _1992;
            _1994 = true;
        }
        else
        {
            bool _1996 = _1924 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1998 = isnan(_1924);
            bool _2000 = _1996 || _1998;
            bool _2002 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2004 = _2000 || _2002;
            if (!_2004)
            {
                float _2006 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2008 = _1924 + _2006;
                float _2010 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2012 = _2010 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2014 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2016 = _2014 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2018 = 1.0 / _2012;
                float _2020 = _2008 * _2018;
                float _2022 = fma(_2020, _2016, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1964 = _2022;
                _1994 = true;
            }
            else
            {
                _1964 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1994 = false;
    float _2024 = _1964;
    float _2026 = -_1323;
    float _2028 = _1219 + _2026;
    float _2030 = -_1325;
    float _2032 = _1225 + _2030;
    float _2034 = -_1341;
    float _2036 = _1247 + _2034;
    float _2038 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2040 = _1852 + _2038;
    float _2042 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2044 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2046 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2048 = _1858 + _2046;
    float _2050 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2042);
    float _2052 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2044);
    float _2054 = fma(_2040, _2024, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _2056 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2058 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2060 = _2056 || _2058;
    bool _2062 = isnan(0.5);
    bool _2064 = _2060 || _2062;
    float _2066 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2050);
    float _2068 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2052);
    float _2070 = -_1323;
    float _2072 = _2070 + _2054;
    float _2074 = _2066 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2076 = _2068 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2078 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2080 = _1860 + _2078;
    float _2082 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2084 = 1.0 / _2074;
    float _2086 = _2076 + _2074;
    float _2088 = fma(_2080, _2024, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2090 = fma(_2048, _2024, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2092 = -_1325;
    float _2094 = _2092 + _2088;
    float _2096 = -_1341;
    float _2098 = _2096 + _2090;
    float _2100 = _2086 * _2084;
    float _2102 = _2100 * 0.5;
    float _2104 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2106 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2108 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2106);
    float _2110 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2112 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2104);
    float _2114 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2116 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2082);
    float _2118 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2110);
    float _2120 = 1.0 / _2108;
    float _2122 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2112);
    float _2124 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2114);
    float _2126 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2118);
    float _2128 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2116);
    float _2130 = _2122 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2132 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2124);
    float _2134 = _2126 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2136 = _2124;
    if (_2064)
    {
        _2136 = 1.0;
    }
    float _2138 = _2136;
    float _2140 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2142 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2144 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2146 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2148 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2140);
    float _2150 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2142);
    float _2152 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2144);
    float _2154 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2146);
    float _2156 = _2140;
    float _2158 = _2138;
    if (_2064)
    {
        _2156 = 1.0;
    }
    float _2160 = _2156;
    float _2162 = _2128 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2164 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2166 = _2120 * _2164;
    float _2168 = _2160;
    if (!_2064)
    {
        float _2170 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2172 = _2170 * 0.15915493667125701904296875;
        float _2174 = _2172 * 6.283185482025146484375;
        float _2176 = cos(_2174);
        float _2178 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2180 = _2178 * 0.15915493667125701904296875;
        float _2182 = _2172 * 6.283185482025146484375;
        float _2184 = sin(_2182);
        float _2186 = 1.0 / _2176;
        float _2188 = _2180 * 6.283185482025146484375;
        float _2190 = cos(_2188);
        float _2192 = _2184 * _2186;
        float _2194 = _2180 * 6.283185482025146484375;
        float _2196 = sin(_2194);
        float _2198 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2200 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2198;
        float _2202 = _2190 * _2192;
        float _2204 = 1.0 / _2200;
        float _2206 = 1.0 / _2202;
        float _2208 = _2196 * _2206;
        float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2212 = fma(_2166, _2208, _2210);
        float _2214 = _2212 * _2204;
        float _2216 = precise::clamp(_2214, 0.0, 1.0);
        _2158 = _2216;
    }
    float _2218 = _2158;
    if (!_2064)
    {
        float _2220 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2222 = _2220 * 0.15915493667125701904296875;
        float _2224 = _2222 * 6.283185482025146484375;
        float _2226 = cos(_2224);
        float _2228 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2230 = _2228 * 0.15915493667125701904296875;
        float _2232 = _2222 * 6.283185482025146484375;
        float _2234 = sin(_2232);
        float _2236 = 1.0 / _2226;
        float _2238 = _2230 * 6.283185482025146484375;
        float _2240 = cos(_2238);
        float _2242 = _2234 * _2236;
        float _2244 = _2230 * 6.283185482025146484375;
        float _2246 = sin(_2244);
        float _2248 = _2240 * _2242;
        float _2250 = 1.0 / _2248;
        float _2252 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2254 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2252;
        float _2256 = 1.0 / _2254;
        float _2258 = _2246 * _2250;
        float _2260 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2262 = fma(_2166, _2258, _2260);
        float _2264 = _2262 * _2256;
        float _2266 = precise::clamp(_2264, 0.0, 1.0);
        float _2268 = -_2266;
        float _2270 = _2268 + 1.0;
        _2168 = _2270;
    }
    float _2272 = _2168;
    float _2274 = _2132 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2276 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2152);
    float _2278 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2148);
    float _2280 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2150);
    float _2282 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2154);
    float _2284 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2276);
    bool _2286 = _2218 > 0.0;
    bool _2288 = isnan(_2218);
    bool _2290 = _2286 || _2288;
    bool _2292 = isnan(0.0);
    bool _2294 = _2290 || _2292;
    float _2296 = _2218 * _2272;
    float _2298 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2282);
    float _2300 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2302 = _2284 + _2300;
    bool _2304 = _2272 <= 0.0;
    bool _2306 = !_2294;
    bool _2308 = _2304 || _2306;
    float _2310 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2278);
    float _2312 = _2296 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2314 = _2298 + _2302;
    float _2316 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2280);
    float _2318 = _2312 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2320 = _2314 * 0.5;
    out.gl_Position.x = _2310;
    out.gl_Position.y = _2316;
    out.gl_Position.z = _2302;
    out.gl_Position.w = _2298;
    out.m_58.z = _2320;
    out.m_58.w = _2298;
    out.m_35.x = _2318;
    if (!_2308)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _2322 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2322;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1994 = false;
    bool _1167 = false;
    bool _991 = false;
    bool _751 = false;
    bool _589 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_32.w;
    float _74 = trunc(_72);
    int _77 = int(_74);
    bool _81 = _77 >= 1;
    float _83 = 0.0;
    if (!_81)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _85 = _83;
    float _87 = _85;
    if (!_81)
    {
        out.m_35.x = 0.0;
    }
    int _89 = 0;
    if (!_81)
    {
        float _91 = _85 * 5.0;
        _89 = as_type<int>(_91);
    }
    int _93 = _89;
    int _95 = _93;
    if (!_81)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2379 = as_type<float>(_93);
        out.gl_Position.z = _2379;
    }
    if (!_81)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _97 = in.m_37.w;
    bool _99 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _107 = _103 || _105;
    float _109 = -_97;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_107)
    {
        float _113 = float(_77);
        _87 = _113;
    }
    float _115 = _87;
    bool _117 = _111 >= _115;
    bool _119 = !_107;
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
        _95 = as_type<int>(_127);
    }
    int _129 = _95;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2448 = as_type<float>(_129);
        out.gl_Position.z = _2448;
    }
    if (_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_39.y;
    float _133 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _135 = in.m_41.y;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = in.m_43.y;
    float _149 = in.m_39.z;
    float _151 = in.m_41.z;
    float _153 = 0.0;
    float _155 = _133;
    if (!_145)
    {
        float _157 = _133 * _133;
        float _159 = _157 * 0.5;
        _153 = _159;
    }
    float _161 = _153;
    float _163 = 0.0;
    float _165 = _161;
    if (!_145)
    {
        float _167 = _111 * _111;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = in.m_43.z;
    if (!_145)
    {
        float _175 = _161 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _165 = _175;
    }
    float _177 = _165;
    float _179 = _131 * _131;
    float _181 = in.m_37.x;
    float _183 = in.m_37.y;
    float _185 = in.m_37.z;
    float _187 = fma(_135, _135, _179);
    float _189 = fma(_147, _147, _187);
    float _191 = sqrt(_189);
    bool _193 = _191 > 0.0;
    float _195 = _149 * _149;
    float _197 = fma(_151, _151, _195);
    bool _199 = !_145;
    float _201 = _187;
    float _203 = _177;
    float _205 = _197;
    if (!_199)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _133 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _133);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _225;
        _203 = _235;
    }
    float _237 = _201;
    float _239 = _203;
    bool _241 = !_145;
    float _243 = _237;
    float _245 = 0.0;
    if (!_241)
    {
        float _247 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = log2(_247);
        float _251 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _253 = _251 + 1.0;
        float _255 = 1.0 / _253;
        float _257 = _133 * _249;
        float _259 = exp2(_257);
        float _261 = -_259;
        float _263 = _261 + 1.0;
        float _265 = _263 * _255;
        _243 = _253;
        _155 = _265;
        _245 = _255;
    }
    float _267 = _243;
    float _269 = _155;
    float _271 = _245;
    float _273 = fma(_173, _173, _197);
    float _275 = _267;
    float _277 = _269;
    float _279 = _271;
    if (!_145)
    {
        _275 = _111;
    }
    float _281 = _275;
    float _283 = _281;
    if (!_145)
    {
        float _285 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _285;
    }
    float _287 = _205;
    bool _289 = !_145;
    float _291 = _287;
    float _293 = 0.0;
    if (!_289)
    {
        float _295 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _297 = log2(_295);
        float _299 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _301 = _299 + 1.0;
        float _303 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = _111 * _297;
        float _307 = 1.0 / _301;
        float _309 = _303 * 0.693147182464599609375;
        float _311 = exp2(_305);
        float _313 = 1.0 / _309;
        float _315 = _311 + (-1.0);
        float _317 = -_315;
        float _319 = fma(_317, _313, _111);
        float _321 = _319 * _307;
        float _323 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _291 = _323;
        _293 = _307;
    }
    float _325 = _291;
    float _327 = _293;
    bool _329 = !_145;
    float _331 = _327;
    if (!_329)
    {
        float _333 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _335 = log2(_333);
        float _337 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _339 = _337 + 1.0;
        float _341 = 1.0 / _339;
        float _343 = _111 * _335;
        float _345 = exp2(_343);
        float _347 = -_345;
        float _349 = _347 + 1.0;
        float _351 = _349 * _341;
        _283 = _351;
    }
    float _353 = _283;
    float _355 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _357 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _359 = sqrt(_273);
    float _361 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _363 = fma(_269, _183, _355);
    float _365 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _367 = fma(_353, _183, _357);
    float _369 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _371 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _373 = fma(_269, _181, _361);
    float _375 = fma(_353, _181, _365);
    float _377 = -_367;
    float _379 = _363 + _377;
    float _381 = fma(_353, _185, _369);
    float _383 = fma(_269, _185, _371);
    float _385 = -_375;
    float _387 = _373 + _385;
    float _389 = _379 * _379;
    float _391 = in.m_41.x;
    float _393 = -_381;
    float _395 = _383 + _393;
    bool _397 = _359 > 0.0;
    float _399 = fma(_387, _387, _389);
    float _401 = in.m_39.x;
    float _403 = 0.0;
    float _405 = _359;
    float _407 = _367;
    float _409 = _395;
    if (_193)
    {
        float _411 = rsqrt(_189);
        _403 = _411;
    }
    float _413 = _403;
    if (!_193)
    {
        _331 = 0.0;
    }
    float _415 = _331;
    float _417 = fma(_395, _395, _399);
    float _419 = in.m_43.x;
    float _421 = _415;
    if (!_193)
    {
        _405 = 0.0;
    }
    float _423 = _405;
    float _425 = _379 * _147;
    float _427 = _423;
    if (!_193)
    {
        _277 = 0.0;
    }
    float _429 = _277;
    float _431 = in.m_45.w;
    float _433 = sqrt(_417);
    float _435 = _429;
    if (!_397)
    {
        _279 = 0.0;
    }
    float _437 = _279;
    float _439 = in.m_32.x;
    float _441 = in.m_32.y;
    float _443 = in.m_32.z;
    float _445 = _437;
    if (!_397)
    {
        _407 = 0.0;
    }
    float _447 = _407;
    float _449 = 0.0;
    float _451 = _447;
    if (_397)
    {
        float _453 = rsqrt(_273);
        _449 = _453;
    }
    float _455 = _449;
    if (_193)
    {
        float _457 = _413 * _135;
        _421 = _457;
    }
    float _459 = _421;
    float _461 = _459;
    if (_193)
    {
        float _463 = _413 * _131;
        _427 = _463;
    }
    float _465 = _427;
    float _467 = _465;
    if (_193)
    {
        float _469 = _413 * _147;
        _435 = _469;
    }
    float _471 = _435;
    float _473 = _379 * _135;
    bool _475 = _433 >= 9.9999999747524270787835121154785e-07;
    bool _477 = isnan(_433);
    bool _479 = _475 || _477;
    bool _481 = isnan(9.9999999747524270787835121154785e-07);
    bool _483 = _479 || _481;
    float _485 = _379 * _131;
    float _487 = fma(_387, _391, _473);
    float _489 = fma(_387, _419, _425);
    float _491 = _433;
    float _493 = _489;
    float _495 = _471;
    if (!_397)
    {
        _491 = 0.0;
    }
    float _497 = _491;
    float _499 = fma(_387, _401, _485);
    float _501 = fma(_395, _151, _487);
    float _503 = fma(_395, _173, _489);
    float _505 = _455;
    float _507 = _497;
    float _509 = _501;
    if (_397)
    {
        float _511 = _455 * 0.001000000047497451305389404296875;
        _505 = _511;
    }
    float _513 = _505;
    float _515 = fma(_373, _431, _439);
    if (_397)
    {
        float _517 = _151 * _513;
        _445 = _517;
    }
    float _519 = _445;
    if (_397)
    {
        float _521 = _149 * _513;
        _507 = _521;
    }
    float _523 = _507;
    if (_397)
    {
        float _525 = _173 * _513;
        _451 = _525;
    }
    float _527 = _451;
    float _529 = fma(_395, _149, _499);
    if (_483)
    {
        _409 = _501;
    }
    float _531 = _409;
    float _533 = fma(_363, _431, _441);
    float _535 = fma(_383, _431, _443);
    float _537 = _531;
    float _539 = _531;
    if (_483)
    {
        _509 = _503;
    }
    float _541 = _509;
    float _543 = _541;
    if (_483)
    {
        _493 = _529;
    }
    float _545 = _493;
    float _547 = _545;
    float _549 = _545;
    if (!_483)
    {
        bool _551 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _553 = !_551;
        if (!_553)
        {
            float _555 = _131 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _557 = _135 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _559 = _147 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _561 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[16].x, _555);
            float _563 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[16].x, _557);
            float _565 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[16].x, _559);
            float _567 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[16].z, _561);
            float _569 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[16].z, _563);
            float _571 = fma(_173, (*spvDescriptorSet0.vp_c9)._m0[16].z, _565);
            float _573 = _567 * _567;
            float _575 = fma(_569, _569, _573);
            float _577 = fma(_571, _571, _575);
            float _579 = rsqrt(_577);
            float _581 = _579 * 9.9999999747524270787835121154785e-07;
            float _583 = _569 * _581;
            float _585 = _567 * _581;
            float _587 = _571 * _581;
            _549 = _585;
            _539 = _583;
            _543 = _587;
            _589 = true;
        }
        else
        {
            float _591 = _183 * _183;
            float _593 = fma(_181, _181, _591);
            float _595 = fma(_185, _185, _593);
            float _597 = sqrt(_595);
            bool _599 = _597 >= 9.9999999747524270787835121154785e-07;
            bool _601 = isnan(_597);
            bool _603 = _599 || _601;
            bool _605 = isnan(9.9999999747524270787835121154785e-07);
            bool _607 = _603 || _605;
            float _609 = _597;
            if (!_607)
            {
                float _611 = _441 * _441;
                float _613 = fma(_439, _439, _611);
                float _615 = fma(_443, _443, _613);
                float _617 = sqrt(_615);
                bool _619 = _617 >= 9.9999999747524270787835121154785e-07;
                bool _621 = isnan(_617);
                bool _623 = _619 || _621;
                bool _625 = isnan(9.9999999747524270787835121154785e-07);
                bool _627 = _623 || _625;
                float _629 = _189;
                if (!_627)
                {
                    float _631 = rsqrt(_189);
                    _629 = _631;
                }
                float _633 = _629;
                if (!_627)
                {
                    float _635 = _633 * 9.9999999747524270787835121154785e-07;
                    _609 = _635;
                }
                float _637 = _609;
                float _639 = _637;
                if (!_627)
                {
                    float _641 = _135 * _637;
                    _537 = _641;
                }
                float _643 = _537;
                _539 = _643;
                if (!_627)
                {
                    float _645 = _131 * _637;
                    _547 = _645;
                }
                float _647 = _547;
                _549 = _647;
                if (!_627)
                {
                    float _649 = _147 * _637;
                    _639 = _649;
                }
                float _651 = _639;
                bool _653 = !_627;
                _543 = _651;
                _589 = _653;
                if (!_589)
                {
                    float _655 = _131 * _441;
                    float _657 = _135 * _441;
                    float _659 = _147 * _441;
                    float _661 = fma(_439, _401, _655);
                    float _663 = fma(_439, _391, _657);
                    float _665 = fma(_439, _419, _659);
                    float _667 = fma(_149, _443, _661);
                    float _669 = fma(_151, _443, _663);
                    float _671 = fma(_173, _443, _665);
                    float _673 = _667 * _667;
                    float _675 = fma(_669, _669, _673);
                    float _677 = fma(_671, _671, _675);
                    float _679 = rsqrt(_677);
                    float _681 = _679 * 9.9999999747524270787835121154785e-07;
                    float _683 = _669 * _681;
                    float _685 = _667 * _681;
                    float _687 = _671 * _681;
                    _549 = _685;
                    _539 = _683;
                    _543 = _687;
                    _589 = true;
                }
            }
            else
            {
                float _689 = _131 * _183;
                float _691 = _135 * _183;
                float _693 = _147 * _183;
                float _695 = fma(_181, _401, _689);
                float _697 = fma(_181, _391, _691);
                float _699 = fma(_181, _419, _693);
                float _701 = fma(_149, _185, _695);
                float _703 = fma(_151, _185, _697);
                float _705 = fma(_173, _185, _699);
                float _707 = _701 * _701;
                float _709 = fma(_703, _703, _707);
                float _711 = fma(_705, _705, _709);
                float _713 = rsqrt(_711);
                float _715 = _713 * 9.9999999747524270787835121154785e-07;
                float _717 = _703 * _715;
                float _719 = _701 * _715;
                float _721 = _705 * _715;
                _549 = _719;
                _539 = _717;
                _543 = _721;
            }
        }
    }
    _589 = false;
    float _723 = _549;
    float _725 = _539;
    float _727 = _543;
    bool _729 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _731 = !_729;
    float _749;
    if (!_731)
    {
        float _733 = in.m_47.x;
        float _735 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _737 = _733 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _739 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _741 = _739 * _735;
        float _743 = floor(_741);
        float _745 = -_743;
        float _747 = _741 + _745;
        _749 = _747;
        _751 = true;
    }
    else
    {
        float _753 = float(_77);
        float _755 = 1.0 / _753;
        float _757 = _111 * _755;
        _749 = _757;
    }
    _751 = false;
    float _759 = _749;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _763 = _759 + _761;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _767 = _759 + _765;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _771 = _759 + _769;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _773;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _789 = 1.0 / _775;
    bool _791 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _793 = 1.0 / _779;
    float _795 = 1.0 / _787;
    float _797 = _763 * _789;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _801 = _759 + _799;
    bool _803 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _805 = isnan(_759);
    bool _807 = _803 || _805;
    bool _809 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _811 = _807 || _809;
    float _813 = float(_811);
    float _815 = 1.0 / _783;
    float _817 = _767 * _793;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _819;
    float _823 = fma(_821, _797, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _825 = _801 * _795;
    bool _827 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _829 = isnan(_759);
    bool _831 = _827 || _829;
    bool _833 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _835 = _831 || _833;
    float _837 = float(_835);
    float _839 = -_813;
    float _841 = _839 + 1.0;
    float _843 = -_837;
    float _845 = _843 + 1.0;
    float _847 = _837 * _841;
    float _849 = _771 * _815;
    bool _851 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _853 = isnan(_759);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _859 = _855 || _857;
    float _861 = float(_859);
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _863;
    bool _867 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _869 = isnan(_759);
    bool _871 = _867 || _869;
    bool _873 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _875 = _871 || _873;
    float _877 = float(_875);
    float _879 = fma(_865, _797, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _881 = _759 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _883 = isnan(_759);
    bool _885 = _881 || _883;
    bool _887 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _889 = _885 || _887;
    float _891 = float(_889);
    float _893 = _861 * _845;
    float _895 = -_861;
    float _897 = _895 + 1.0;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _901 = _899 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _905 = _903 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _907 = _891 * _897;
    float _909 = -_891;
    float _911 = _909 + 1.0;
    float _913 = -_877;
    float _915 = _913 + 1.0;
    float _917 = fma(_905, _817, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _919 = fma(_901, _817, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _921 = _877 * _911;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _923;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _927;
    float _931 = _823 * _921;
    float _933 = _879 * _921;
    float _935 = fma(_925, _849, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _937 = fma(_929, _849, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _939 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[143].x, _931);
    float _941 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[143].y, _933);
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _951 = fma(_917, _907, _939);
    float _953 = fma(_919, _907, _941);
    float _955 = fma(_945, _825, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _957 = fma(_949, _825, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _959 = fma(_935, _893, _951);
    float _961 = fma(_937, _893, _953);
    float _963 = fma(_955, _847, _959);
    float _965 = fma(_957, _847, _961);
    float _967 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[147].x, _963);
    float _969 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[147].y, _965);
    bool _971 = !_791;
    float _989;
    if (!_971)
    {
        float _973 = in.m_47.x;
        float _975 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _977 = _973 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _979 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[11].x, _111);
        float _981 = _979 * _975;
        float _983 = floor(_981);
        float _985 = -_983;
        float _987 = _981 + _985;
        _989 = _987;
        _991 = true;
    }
    else
    {
        float _993 = float(_77);
        float _995 = 1.0 / _993;
        float _997 = _111 * _995;
        _989 = _997;
    }
    _991 = false;
    float _999 = _989;
    float _1001 = in.m_45.x;
    float _1003 = in.m_45.y;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1007 = _999 + _1005;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1011 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1009;
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1017 = 1.0 / _1011;
    bool _1019 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _1021 = 1.0 / _1015;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1025 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1023;
    float _1027 = _1007 * _1017;
    bool _1029 = _999 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1031 = isnan(_999);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1037 = _1033 || _1035;
    float _1039 = float(_1037);
    float _1041 = _969 * _1003;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1045 = _999 + _1043;
    bool _1047 = _999 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1049 = isnan(_999);
    bool _1051 = _1047 || _1049;
    bool _1053 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1055 = _1051 || _1053;
    float _1057 = float(_1055);
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1059;
    bool _1063 = _999 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1065 = isnan(_999);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1071 = _1067 || _1069;
    float _1073 = float(_1071);
    float _1075 = -_1039;
    float _1077 = _1075 + 1.0;
    float _1079 = fma(_1025, _1027, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1081 = fma(_1061, _1027, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1083 = _1045 * _1021;
    float _1085 = _1073 * _1077;
    float _1087 = -_1073;
    float _1089 = _1087 + 1.0;
    float _1091 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1091;
    float _1095 = _1057 * _1089;
    float _1097 = fma(_1093, _1027, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1099 = -_1057;
    float _1101 = _1099 + 1.0;
    float _1103 = _1079 * _1095;
    float _1105 = _1097 * _1095;
    float _1107 = _1081 * _1095;
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1111 = _1109 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1115 = _1113 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1121 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1105);
    float _1123 = fma(_1111, _1083, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1125 = fma(_1115, _1083, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1127 = fma(_1119, _1083, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1129 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1103);
    float _1131 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1107);
    float _1133 = fma(_1123, _1085, _1121);
    float _1135 = _967 * _1001;
    float _1137 = fma(_1125, _1085, _1129);
    float _1139 = fma(_1127, _1085, _1131);
    float _1141 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1133);
    float _1143 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1137);
    float _1145 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1139);
    bool _1147 = !_1019;
    float _1165;
    if (!_1147)
    {
        float _1149 = in.m_47.x;
        float _1151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1153 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1155 = fma(_1153, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _1157 = _1155 * _1151;
        float _1159 = floor(_1157);
        float _1161 = -_1159;
        float _1163 = _1157 + _1161;
        _1165 = _1163;
        _1167 = true;
    }
    else
    {
        float _1169 = float(_77);
        float _1171 = 1.0 / _1169;
        float _1173 = _111 * _1171;
        _1165 = _1173;
    }
    _1167 = false;
    float _1175 = _1165;
    float _1177 = _723 * _723;
    float _1179 = in.m_39.w;
    float _1181 = _533 * _131;
    float _1183 = fma(_725, _725, _1177);
    float _1185 = in.m_41.w;
    float _1187 = _533 * _135;
    float _1189 = fma(_515, _401, _1181);
    float _1191 = fma(_727, _727, _1183);
    float _1193 = in.m_43.w;
    float _1195 = _533 * _147;
    float _1197 = fma(_515, _391, _1187);
    float _1199 = rsqrt(_1191);
    float _1201 = fma(_535, _149, _1189);
    float _1203 = fma(_515, _419, _1195);
    float _1205 = fma(_535, _151, _1197);
    float _1207 = as_type<float>(int(gl_VertexIndex));
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1211 = in.m_47.z;
    float _1213 = in.m_47.w;
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1217 = in.m_47.x;
    float _1219 = _1201 + _1179;
    float _1221 = _1199 * _723;
    float _1223 = _1199 * _725;
    float _1225 = _1205 + _1185;
    float _1227 = _1199 * _727;
    float _1229 = _1221 * _465;
    float _1231 = _1135 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1233 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1235 = _1225 + _1233;
    float _1237 = fma(_1223, _459, _1229);
    float _1239 = fma(_535, _173, _1203);
    float _1241 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1243 = _1219 + _1241;
    float _1245 = fma(_1227, _471, _1237);
    float _1247 = _1239 + _1193;
    float _1249 = _1243 * _1243;
    float _1251 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1253 = _1247 + _1251;
    float _1255 = fma(_1235, _1235, _1249);
    float _1257 = abs(_1245);
    bool _1259 = _1257 > 0.99989998340606689453125;
    float _1261 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1265 = _1263 != 0;
    float _1267 = fma(_1253, _1253, _1255);
    int _1269 = as_type<int>(_1207) & 1;
    bool _1271 = _1269 != 0;
    int _1273 = as_type<int>(_1207) & 2;
    bool _1275 = _1273 != 0;
    bool _1277 = _1211 > 0.5;
    float _1279 = rsqrt(_1267);
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1283 = _1281 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    if (_1259)
    {
        float _1285 = _465 + _523;
        _467 = _1285;
    }
    float _1287 = _467;
    if (_1259)
    {
        float _1289 = _459 + _519;
        _461 = _1289;
    }
    float _1291 = _461;
    float _1293 = 1.0 / _1283;
    bool _1295 = _1213 > 0.5;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1299 = _1297 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1301 = !_1271;
    float _1303 = _1301 ? (-0.5) : 0.5;
    if (_1259)
    {
        float _1305 = _471 + _527;
        _495 = _1305;
    }
    float _1307 = _495;
    bool _1309 = _1217 > 0.5;
    float _1311 = _1261 * _1279;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1315 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1313;
    float _1317 = 1.0 / _1299;
    bool _1319 = !_1275;
    float _1321 = _1319 ? (-0.5) : 0.5;
    float _1323 = _1243 * _1311;
    float _1325 = _1235 * _1311;
    float _1327 = -_1303;
    int _1329 = _1309 ? as_type<int>(_1327) : as_type<int>(_1303);
    float _1331 = -_1323;
    float _1333 = _1243 + _1331;
    float _1335 = -_1325;
    float _1337 = _1235 + _1335;
    float _1339 = _1315 * _1293;
    float _1341 = _1253 * _1311;
    float _1343 = _1333 * _1333;
    float _1345 = in.m_47.y;
    float _1347 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1349 = _1347 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1351 = -_1291;
    float _1353 = _1227 * _1351;
    float _1355 = fma(_1337, _1337, _1343);
    float _1357 = -_1341;
    float _1359 = _1253 + _1357;
    int _1361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1363 = _1361 != 0;
    float _1365 = 1.0 / _1349;
    int _1367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1369 = _1367 != 0;
    float _1371 = -_1307;
    float _1373 = -_1353;
    float _1375 = fma(_1223, _1371, _1373);
    int _1377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1379 = _1377 != 0;
    float _1381 = fma(_1359, _1359, _1355);
    int _1383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1385 = _1383 != 0;
    float _1387 = -_1307;
    float _1389 = _1221 * _1387;
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1393 = _1391 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1395 = sqrt(_1381);
    float _1397 = _1375 * _1375;
    float _1399 = -_1287;
    float _1401 = -_1389;
    float _1403 = fma(_1227, _1399, _1401);
    float _1405 = -_1287;
    float _1407 = _1223 * _1405;
    float _1409 = _1393 * _1317;
    float _1411 = fma(_1403, _1403, _1397);
    float _1413 = -_1291;
    float _1415 = -_1407;
    float _1417 = fma(_1221, _1413, _1415);
    float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1419;
    float _1423 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1425 = _1175 + _1423;
    float _1427 = fma(_1417, _1417, _1411);
    float _1429 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1431 = _1175 + _1429;
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1435 = _1433 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1437 = _1421 * _1365;
    float _1439 = rsqrt(_1427);
    float _1441 = fma(_1339, _1425, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1443 = _1421;
    float _1445 = _1435;
    if (!_1265)
    {
        _1443 = _1345;
    }
    float _1447 = _1443;
    float _1449 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1451 = _1175 + _1449;
    float _1453 = _1279 * _1395;
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1457 = _1455 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1459 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1461 = fma(_1409, _1451, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1463 = 1.0 / _1435;
    float _1465 = fma(_1437, _1431, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1467 = _1303 * _1231;
    bool _1469 = !_1379;
    float _1471 = _1469 ? _1303 : as_type<float>(_1329);
    float _1473 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1303);
    float _1475 = _1231 * _1453;
    float _1477 = _1459 * _1217;
    bool _1479 = _1175 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1481 = isnan(_1175);
    bool _1483 = _1479 || _1481;
    bool _1485 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1487 = _1483 || _1485;
    float _1489 = float(_1487);
    float _1491 = _1403 * _1439;
    float _1493 = _1447;
    float _1495 = _1467;
    float _1497 = _1465;
    if (!_1265)
    {
        _1445 = _1447;
    }
    float _1499 = _1445;
    float _1501 = _1475 * _1473;
    float _1503 = _1499;
    if (_1265)
    {
        _1493 = _1345;
    }
    float _1505 = _1493;
    float _1507 = _1041 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1509 = _1175 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1511 = isnan(_1175);
    bool _1513 = _1509 || _1511;
    bool _1515 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1517 = _1513 || _1515;
    float _1519 = float(_1517);
    float _1521 = _1375 * _1439;
    if (_1265)
    {
        _1503 = _1217;
    }
    float _1523 = _1503;
    float _1525 = _1417 * _1439;
    bool _1527 = _1175 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1529 = isnan(_1175);
    bool _1531 = _1527 || _1529;
    bool _1533 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1535 = _1531 || _1533;
    float _1537 = float(_1535);
    float _1539 = -_1519;
    float _1541 = _1539 + 1.0;
    float _1543 = _1395;
    if (!_1265)
    {
        float _1545 = in.m_47.z;
        _1543 = _1545;
    }
    float _1547 = _1543;
    float _1549 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1321);
    float _1551 = _1507 * _1453;
    float _1553 = _1489 * _1541;
    float _1555 = -_1489;
    float _1557 = _1555 + 1.0;
    bool _1559 = _1175 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1561 = isnan(_1175);
    bool _1563 = _1559 || _1561;
    bool _1565 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1567 = _1563 || _1565;
    float _1569 = float(_1567);
    float _1571 = -_1537;
    float _1573 = _1571 + 1.0;
    float _1575 = _1551 * _1549;
    float _1577 = _1537 * _1557;
    bool _1579 = _1175 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1581 = isnan(_1175);
    bool _1583 = _1579 || _1581;
    bool _1585 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1587 = _1583 || _1585;
    float _1589 = float(_1587);
    float _1591 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1593 = _1175 + _1591;
    float _1595 = _1569 * _1573;
    float _1597 = trunc(_1477);
    int _1599 = int(_1597);
    float _1601 = _1457 * _1463;
    float _1603 = _1221 * _1525;
    float _1605 = _1575 * _1223;
    float _1607 = _1223 * _1521;
    float _1609 = _1575 * _1227;
    float _1611 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1613 = _1611 * 0.5;
    float _1615 = -_1603;
    float _1617 = fma(_1227, _1521, _1615);
    float _1619 = fma(_1501, _1491, _1605);
    float _1621 = -_1607;
    float _1623 = fma(_1221, _1491, _1621);
    float _1625 = fma(_1501, _1525, _1609);
    float _1627 = -_1569;
    float _1629 = _1627 + 1.0;
    float _1631 = fma(_1613, _1617, _1619);
    float _1633 = _1619;
    float _1635 = _1547;
    if (!_1265)
    {
        _1633 = _1547;
    }
    float _1637 = _1633;
    float _1639 = fma(_1613, _1623, _1625);
    float _1641 = _1589 * _1629;
    int _1643 = _1599 << 4;
    int _1645 = _1643 + 1968;
    float _1647 = _1225 + _1631;
    float _1649 = _1247 + _1639;
    float _1651 = _1637;
    float _1653 = _1649;
    float _1655 = _1647;
    if (_1265)
    {
        _1651 = _1505;
    }
    float _1657 = _1651;
    float _1659 = fma(_1601, _1593, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    if (_1265)
    {
        _1635 = _1505;
    }
    float _1661 = _1635;
    float _1663 = _1441 * _1641;
    bool _1665 = _1505 > 0.5;
    uint _1668 = uint(int(uint(_1645) >> uint(2)));
    uint _1670 = uint(int(uint(int(_1668)) >> uint(2)));
    int _1672 = int(_1668) & 3;
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[int(_1670)][_1672];
    int _1676 = int(_1668) + 1;
    uint _1678 = uint(int(uint(_1676) >> uint(2)));
    int _1680 = _1676 & 3;
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[int(_1678)][_1680];
    float _1684 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1686 = _1647 + _1684;
    float _1688 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1690 = _1649 + _1688;
    float _1692 = -_1589;
    float _1694 = _1692 + 1.0;
    float _1696 = fma(_1523, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1209);
    float _1698 = _1686 * _1686;
    float _1700 = _1690 * _1690;
    float _1702 = _1575 * _1221;
    int _1704 = _1645 + 8;
    uint _1706 = uint(int(uint(_1704) >> uint(2)));
    uint _1708 = uint(int(uint(int(_1706)) >> uint(2)));
    int _1710 = int(_1706) & 3;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[int(_1708)][_1710];
    float _1714 = _1523 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1716 = _1698 + _1700;
    float _1718 = _1227 * _1491;
    float _1720 = -_1321;
    int _1722 = _1295 ? as_type<int>(_1720) : as_type<int>(_1321);
    float _1724 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1663);
    float _1726 = sqrt(_1716);
    float _1728 = -_1718;
    float _1730 = fma(_1223, _1525, _1728);
    float _1732 = -_1215;
    float _1734 = fma(_1714, 2.0, _1732);
    float _1736 = fma(_1501, _1521, _1702);
    bool _1738 = !_1369;
    float _1740 = _1738 ? _1321 : as_type<float>(_1722);
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1744 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1748 = fma(_1613, _1730, _1736);
    float _1750 = _1657 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1752 = fma(_1461, _1595, _1724);
    float _1754 = fma(_1661, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1742);
    float _1756 = _1219 + _1748;
    float _1758 = fma(_1750, -2.0, _1744);
    float _1760 = -_1321;
    int _1762 = _1665 ? as_type<int>(_1760) : as_type<int>(_1321);
    float _1764 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1766 = _1726 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1768 = fma(_1465, _1577, _1752);
    float _1770 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1696);
    float _1772 = -_111;
    float _1774 = fma(_1772, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1734);
    float _1776 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1754);
    bool _1778 = !_1385;
    float _1780 = _1778 ? _1321 : as_type<float>(_1762);
    float _1782 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1758);
    float _1784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1786 = fma(_1659, _1553, _1768);
    float _1788 = _1698;
    float _1790 = _1700;
    if (_1363)
    {
        float _1792 = -_1467;
        float _1794 = _1277 ? _1792 : _1467;
        _1495 = _1794;
    }
    float _1796 = _1495;
    if (!_1766)
    {
        _1497 = _1756;
    }
    float _1798 = _1497;
    bool _1800 = !_1766;
    float _1802 = _1798;
    if (!_1800)
    {
        float _1804 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1806 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1808 = _1726 + _1806;
        float _1810 = _1756 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1812 = rsqrt(_1716);
        float _1814 = _1808 * _1804;
        float _1816 = _1814 * 0.15915493667125701904296875;
        float _1818 = _1816 * 6.283185482025146484375;
        float _1820 = sin(_1818);
        float _1822 = _1816 * 6.283185482025146484375;
        float _1824 = cos(_1822);
        float _1826 = fma(_1820, _1810, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1828 = _1812 * _1826;
        float _1830 = fma(_1686, _1828, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1832 = _1824 + (-1.0);
        float _1834 = fma(_1690, _1828, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1836 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1838 = _1830 + _1836;
        float _1840 = _1832 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1842 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1844 = _1834 + _1842;
        float _1846 = _1838 * _1838;
        float _1848 = fma(_1756, _1824, _1840);
        float _1850 = _1844 * _1844;
        _1802 = _1848;
        _1788 = _1846;
        _1790 = _1850;
        _1653 = _1834;
        _1655 = _1830;
    }
    float _1852 = _1802;
    float _1854 = _1788;
    float _1856 = _1790;
    float _1858 = _1653;
    float _1860 = _1655;
    float _1862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1864 = _1764 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1866 = _1740 + (-0.5);
    float _1868 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1870 = _1852 + _1868;
    float _1872 = _1746 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1874 = _1796 + 0.5;
    float _1876 = -_1864;
    float _1878 = -_1782;
    float _1880 = fma(_1876, _1866, _1878);
    float _1882 = fma(_1519, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1786);
    float _1884 = _1674 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1886 = fma(_1870, _1870, _1854);
    float _1888 = _1471 + 0.5;
    float _1890 = -_1780;
    float _1892 = _1890 + 0.5;
    float _1894 = _1682 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1896 = fma(_1872, _1874, _1774);
    float _1898 = -_1770;
    float _1900 = _1898 + 1.0;
    float _1902 = -_1776;
    float _1904 = _1902 + 1.0;
    float _1906 = _1886 + _1856;
    float _1908 = _1892 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1910 = _1888 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1912 = -_1900;
    float _1914 = fma(_1912, _1796, _1896);
    float _1916 = fma(_1740, _1904, _1880);
    float _1918 = _1908 * _1862;
    float _1920 = _1141 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1922 = _1145 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1924 = sqrt(_1906);
    float _1926 = _1143 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1928 = _1712 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1930 = _1910 * _1784;
    float _1932 = _1894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1934 = _1920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1936 = _1926 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1940 = _1884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1942 = _1928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1944 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1946 = _1882 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_52.x = _1930;
    out.m_52.y = _1918;
    out.m_52.z = _1914;
    out.m_52.w = _1916;
    bool _1948 = _1924 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1950 = isnan(_1924);
    bool _1952 = _1948 || _1950;
    bool _1954 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1956 = _1952 || _1954;
    out.m_54.x = _1940;
    out.m_54.y = _1932;
    out.m_54.z = _1942;
    out.m_54.w = _1938;
    out.m_56.x = _1934;
    out.m_56.y = _1936;
    out.m_56.z = _1944;
    out.m_56.w = _1946;
    float _1958 = _1928;
    if (!_1956)
    {
        _1958 = 1.0;
    }
    float _1960 = _1958;
    bool _1962 = !_1956;
    float _1964 = _1960;
    if (!_1962)
    {
        bool _1966 = _1924 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1968 = isnan(_1924);
        bool _1970 = _1966 || _1968;
        bool _1972 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1974 = _1970 || _1972;
        if (!_1974)
        {
            float _1976 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1978 = _1924 + _1976;
            float _1980 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1982 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1980;
            float _1984 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1986 = _1984 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1988 = 1.0 / _1982;
            float _1990 = _1978 * _1988;
            float _1992 = fma(_1990, _1986, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1964 = _1992;
            _1994 = true;
        }
        else
        {
            bool _1996 = _1924 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1998 = isnan(_1924);
            bool _2000 = _1996 || _1998;
            bool _2002 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2004 = _2000 || _2002;
            if (!_2004)
            {
                float _2006 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2008 = _1924 + _2006;
                float _2010 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2012 = _2010 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2014 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2016 = _2014 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2018 = 1.0 / _2012;
                float _2020 = _2008 * _2018;
                float _2022 = fma(_2020, _2016, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1964 = _2022;
                _1994 = true;
            }
            else
            {
                _1964 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1994 = false;
    float _2024 = _1964;
    float _2026 = -_1323;
    float _2028 = _1219 + _2026;
    float _2030 = -_1325;
    float _2032 = _1225 + _2030;
    float _2034 = -_1341;
    float _2036 = _1247 + _2034;
    float _2038 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2040 = _1852 + _2038;
    float _2042 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2044 = _2028 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2046 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2048 = _1858 + _2046;
    float _2050 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2042);
    float _2052 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2044);
    float _2054 = fma(_2040, _2024, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _2056 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2058 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2060 = _2056 || _2058;
    bool _2062 = isnan(0.5);
    bool _2064 = _2060 || _2062;
    float _2066 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2050);
    float _2068 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2052);
    float _2070 = -_1323;
    float _2072 = _2070 + _2054;
    float _2074 = _2066 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2076 = _2068 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2078 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2080 = _1860 + _2078;
    float _2082 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2084 = 1.0 / _2074;
    float _2086 = _2076 + _2074;
    float _2088 = fma(_2080, _2024, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2090 = fma(_2048, _2024, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2092 = -_1325;
    float _2094 = _2092 + _2088;
    float _2096 = -_1341;
    float _2098 = _2096 + _2090;
    float _2100 = _2086 * _2084;
    float _2102 = _2100 * 0.5;
    float _2104 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2106 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2108 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2106);
    float _2110 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2112 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2104);
    float _2114 = _2072 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2116 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2082);
    float _2118 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2110);
    float _2120 = 1.0 / _2108;
    float _2122 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2112);
    float _2124 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2114);
    float _2126 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2118);
    float _2128 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2116);
    float _2130 = _2122 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2132 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2124);
    float _2134 = _2126 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2136 = _2124;
    if (_2064)
    {
        _2136 = 1.0;
    }
    float _2138 = _2136;
    float _2140 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2142 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2144 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2146 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2148 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2140);
    float _2150 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2142);
    float _2152 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2144);
    float _2154 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2146);
    float _2156 = _2140;
    float _2158 = _2138;
    if (_2064)
    {
        _2156 = 1.0;
    }
    float _2160 = _2156;
    float _2162 = _2128 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2164 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2166 = _2120 * _2164;
    float _2168 = _2160;
    if (!_2064)
    {
        float _2170 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2172 = _2170 * 0.15915493667125701904296875;
        float _2174 = _2172 * 6.283185482025146484375;
        float _2176 = cos(_2174);
        float _2178 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2180 = _2178 * 0.15915493667125701904296875;
        float _2182 = _2172 * 6.283185482025146484375;
        float _2184 = sin(_2182);
        float _2186 = 1.0 / _2176;
        float _2188 = _2180 * 6.283185482025146484375;
        float _2190 = cos(_2188);
        float _2192 = _2184 * _2186;
        float _2194 = _2180 * 6.283185482025146484375;
        float _2196 = sin(_2194);
        float _2198 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2200 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2198;
        float _2202 = _2190 * _2192;
        float _2204 = 1.0 / _2200;
        float _2206 = 1.0 / _2202;
        float _2208 = _2196 * _2206;
        float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2212 = fma(_2166, _2208, _2210);
        float _2214 = _2212 * _2204;
        float _2216 = precise::clamp(_2214, 0.0, 1.0);
        _2158 = _2216;
    }
    float _2218 = _2158;
    if (!_2064)
    {
        float _2220 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2222 = _2220 * 0.15915493667125701904296875;
        float _2224 = _2222 * 6.283185482025146484375;
        float _2226 = cos(_2224);
        float _2228 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2230 = _2228 * 0.15915493667125701904296875;
        float _2232 = _2222 * 6.283185482025146484375;
        float _2234 = sin(_2232);
        float _2236 = 1.0 / _2226;
        float _2238 = _2230 * 6.283185482025146484375;
        float _2240 = cos(_2238);
        float _2242 = _2234 * _2236;
        float _2244 = _2230 * 6.283185482025146484375;
        float _2246 = sin(_2244);
        float _2248 = _2240 * _2242;
        float _2250 = 1.0 / _2248;
        float _2252 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2254 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2252;
        float _2256 = 1.0 / _2254;
        float _2258 = _2246 * _2250;
        float _2260 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2262 = fma(_2166, _2258, _2260);
        float _2264 = _2262 * _2256;
        float _2266 = precise::clamp(_2264, 0.0, 1.0);
        float _2268 = -_2266;
        float _2270 = _2268 + 1.0;
        _2168 = _2270;
    }
    float _2272 = _2168;
    float _2274 = _2132 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2276 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2152);
    float _2278 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2148);
    float _2280 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2150);
    float _2282 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2154);
    float _2284 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2276);
    bool _2286 = _2218 > 0.0;
    bool _2288 = isnan(_2218);
    bool _2290 = _2286 || _2288;
    bool _2292 = isnan(0.0);
    bool _2294 = _2290 || _2292;
    float _2296 = _2218 * _2272;
    float _2298 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2282);
    float _2300 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2302 = _2284 + _2300;
    bool _2304 = _2272 <= 0.0;
    bool _2306 = !_2294;
    bool _2308 = _2304 || _2306;
    float _2310 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2278);
    float _2312 = _2296 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2314 = _2298 + _2302;
    float _2316 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2280);
    float _2318 = _2312 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2320 = _2314 * 0.5;
    out.gl_Position.x = _2310;
    out.gl_Position.y = _2316;
    out.gl_Position.z = _2302;
    out.gl_Position.w = _2298;
    out.m_58.z = _2320;
    out.m_58.w = _2298;
    out.m_35.x = _2318;
    if (!_2308)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _2322 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2322;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

