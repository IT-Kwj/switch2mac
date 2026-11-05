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
    float4 m_47 [[user(locn0)]];
    float4 m_54 [[user(locn1)]];
    float4 m_58 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_52 [[user(locn4)]];
    float4 m_56 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_39 [[attribute(1)]];
    float4 m_37 [[attribute(2)]];
    float4 m_41 [[attribute(3)]];
    float4 m_30 [[attribute(5)]];
    float4 m_35 [[attribute(6)]];
    float4 m_45 [[attribute(7)]];
    float4 m_43 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1343 = false;
    bool _1201 = false;
    bool _917 = false;
    bool _815 = false;
    bool _655 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _2264 = as_type<float>(_93);
        out.gl_Position.z = _2264;
    }
    if (!_81)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _97 = in.m_35.w;
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
        out.m_33.x = 0.0;
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
        float _2333 = as_type<float>(_129);
        out.gl_Position.z = _2333;
    }
    if (_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = in.m_37.x;
    float _133 = in.m_37.y;
    float _135 = in.m_37.z;
    float _137 = in.m_39.x;
    float _139 = in.m_39.y;
    float _141 = in.m_39.z;
    float _143 = in.m_41.x;
    float _145 = in.m_41.y;
    float _147 = in.m_41.z;
    float _149 = _131 * _131;
    float _151 = _133 * _133;
    float _153 = fma(_137, _137, _149);
    float _155 = fma(_139, _139, _151);
    float _157 = fma(_143, _143, _153);
    float _159 = _135 * _135;
    float _161 = fma(_145, _145, _155);
    float _163 = sqrt(_157);
    float _165 = fma(_141, _141, _159);
    float _167 = fma(_147, _147, _165);
    float _169 = sqrt(_161);
    float _171 = sqrt(_167);
    bool _173 = _163 > 0.0;
    bool _175 = _169 > 0.0;
    bool _177 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _179 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _181 = _177 || _179;
    bool _183 = isnan(1.0);
    bool _185 = _181 || _183;
    float _187 = 0.0;
    float _189 = _167;
    if (_173)
    {
        float _191 = rsqrt(_157);
        _187 = _191;
    }
    float _193 = _187;
    bool _195 = _171 > 0.0;
    float _197 = 0.0;
    float _199 = 0.0;
    if (!_173)
    {
        _197 = 0.0;
        _199 = 0.0;
    }
    float _201 = _197;
    float _203 = _199;
    float _205 = in.m_35.x;
    float _207 = in.m_35.y;
    float _209 = in.m_35.z;
    float _211 = 0.0;
    float _213 = _201;
    float _215 = _203;
    if (!_173)
    {
        _211 = 0.0;
    }
    float _217 = _211;
    float _219 = 0.0;
    float _221 = 0.0;
    float _223 = _217;
    if (!_175)
    {
        _219 = 0.0;
        _221 = 0.0;
    }
    float _225 = _219;
    float _227 = _221;
    float _229 = 0.0;
    float _231 = _227;
    float _233 = _225;
    if (!_175)
    {
        _229 = 0.0;
    }
    float _235 = _229;
    float _237 = 0.0;
    float _239 = _235;
    if (_175)
    {
        float _241 = rsqrt(_161);
        _237 = _241;
    }
    float _243 = _237;
    float _245 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _247 = 0.0;
    float _249 = 0.0;
    float _251 = _245;
    if (!_195)
    {
        _247 = 0.0;
        _249 = 0.0;
    }
    float _253 = _247;
    float _255 = _249;
    float _257 = 0.0;
    float _259 = _253;
    float _261 = _255;
    if (!_195)
    {
        _257 = 0.0;
    }
    float _263 = _257;
    float _265 = 0.0;
    float _267 = _263;
    if (_195)
    {
        float _269 = rsqrt(_167);
        _265 = _269;
    }
    float _271 = _265;
    if (_173)
    {
        float _273 = _193 * _137;
        _223 = _273;
    }
    float _275 = _223;
    if (_173)
    {
        float _277 = _193 * _131;
        _213 = _277;
    }
    float _279 = _213;
    if (_173)
    {
        float _281 = _193 * _143;
        _215 = _281;
    }
    float _283 = _215;
    if (_175)
    {
        float _285 = _243 * _139;
        _231 = _285;
    }
    float _287 = _231;
    if (!_185)
    {
        float _289 = _245 * _245;
        float _291 = _289 * 0.5;
        _189 = _291;
    }
    float _293 = _189;
    float _295 = _293;
    if (_175)
    {
        float _297 = _243 * _133;
        _233 = _297;
    }
    float _299 = _233;
    if (_175)
    {
        float _301 = _243 * _145;
        _239 = _301;
    }
    float _303 = _239;
    if (!_185)
    {
        float _305 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _295 = _305;
    }
    float _307 = _295;
    float _309 = _307;
    if (_195)
    {
        float _311 = _271 * _141;
        _267 = _311;
    }
    float _313 = _267;
    if (_195)
    {
        float _315 = _271 * _135;
        _259 = _315;
    }
    float _317 = _259;
    if (_195)
    {
        float _319 = _271 * _147;
        _261 = _319;
    }
    float _321 = _261;
    bool _323 = !_185;
    float _325 = _209;
    if (!_323)
    {
        float _327 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _329 = log2(_327);
        float _331 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _333 = _331 + 1.0;
        float _335 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _337 = _245 * _329;
        float _339 = exp2(_337);
        float _341 = _335 * 0.693147182464599609375;
        float _343 = 1.0 / _341;
        float _345 = 1.0 / _333;
        float _347 = _339 + (-1.0);
        float _349 = -_347;
        float _351 = fma(_349, _343, _245);
        float _353 = _351 * _345;
        float _355 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _309 = _355;
    }
    float _357 = _309;
    float _359 = _357 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _361 = !_185;
    float _363 = _359;
    float _365 = _357;
    if (!_361)
    {
        float _367 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _369 = log2(_367);
        float _371 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _373 = _371 + 1.0;
        float _375 = 1.0 / _373;
        float _377 = _245 * _369;
        float _379 = exp2(_377);
        float _381 = -_379;
        float _383 = _381 + 1.0;
        float _385 = _383 * _375;
        _251 = _385;
    }
    float _387 = _251;
    float _389 = _357 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _391 = _359 * _279;
    float _393 = _359 * _299;
    float _395 = _359 * _317;
    if (!_185)
    {
        float _397 = _111 * _111;
        float _399 = _397 * 0.5;
        _363 = _399;
    }
    float _401 = _363;
    float _403 = fma(_389, _275, _391);
    float _405 = fma(_389, _287, _393);
    float _407 = fma(_389, _313, _395);
    float _409 = _357 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_185)
    {
        float _411 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _365 = _411;
    }
    float _413 = _365;
    bool _415 = !_185;
    float _417 = _413;
    if (!_415)
    {
        float _419 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _421 = log2(_419);
        float _423 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _425 = _423 + 1.0;
        float _427 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _429 = _111 * _421;
        float _431 = exp2(_429);
        float _433 = _427 * 0.693147182464599609375;
        float _435 = 1.0 / _433;
        float _437 = 1.0 / _425;
        float _439 = _431 + (-1.0);
        float _441 = -_439;
        float _443 = fma(_441, _435, _111);
        float _445 = _443 * _437;
        float _447 = _445 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _417 = _447;
    }
    float _449 = _417;
    float _451 = _449 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _453 = fma(_409, _283, _403);
    float _455 = fma(_409, _303, _405);
    float _457 = fma(_409, _321, _407);
    float _459 = _449 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _461 = _451 * _299;
    float _463 = _449 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _465 = _451 * _279;
    float _467 = _451 * _317;
    float _469 = fma(_459, _287, _461);
    float _471 = _449;
    if (!_185)
    {
        _471 = _111;
    }
    float _473 = _471;
    bool _475 = !_185;
    float _477 = _473;
    if (!_475)
    {
        float _479 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _481 = log2(_479);
        float _483 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _485 = _483 + 1.0;
        float _487 = 1.0 / _485;
        float _489 = _111 * _481;
        float _491 = exp2(_489);
        float _493 = -_491;
        float _495 = _493 + 1.0;
        float _497 = _495 * _487;
        _477 = _497;
    }
    float _499 = _477;
    float _501 = fma(_459, _275, _465);
    float _503 = fma(_463, _303, _469);
    float _505 = fma(_459, _313, _467);
    float _507 = fma(_387, _207, _455);
    float _509 = fma(_463, _283, _501);
    float _511 = fma(_499, _207, _503);
    float _513 = fma(_463, _321, _505);
    float _515 = fma(_387, _205, _453);
    float _517 = fma(_499, _205, _509);
    float _519 = -_511;
    float _521 = _507 + _519;
    float _523 = fma(_387, _209, _457);
    float _525 = fma(_499, _209, _513);
    float _527 = -_517;
    float _529 = _515 + _527;
    float _531 = _521 * _521;
    float _533 = in.m_43.w;
    float _535 = -_525;
    float _537 = _523 + _535;
    float _539 = _521 * _139;
    float _541 = fma(_529, _529, _531);
    float _543 = _521 * _133;
    float _545 = _521 * _145;
    float _547 = fma(_529, _137, _539);
    float _549 = fma(_537, _537, _541);
    float _551 = fma(_529, _131, _543);
    float _553 = in.m_30.x;
    float _555 = in.m_30.y;
    float _557 = in.m_30.z;
    float _559 = fma(_529, _143, _545);
    float _561 = fma(_537, _141, _547);
    float _563 = sqrt(_549);
    float _565 = fma(_537, _135, _551);
    float _567 = fma(_537, _147, _559);
    bool _569 = _563 >= 9.9999999747524270787835121154785e-07;
    bool _571 = isnan(_563);
    bool _573 = _569 || _571;
    bool _575 = isnan(9.9999999747524270787835121154785e-07);
    bool _577 = _573 || _575;
    float _579 = fma(_515, _533, _553);
    float _581 = fma(_507, _533, _555);
    float _583 = fma(_523, _533, _557);
    float _585 = _551;
    float _587 = _567;
    float _589 = _565;
    float _591 = _567;
    if (_577)
    {
        _585 = _561;
    }
    float _593 = _585;
    float _595 = _593;
    float _597 = _593;
    if (!_577)
    {
        bool _599 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _601 = !_599;
        if (!_601)
        {
            float _603 = _299 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _605 = _279 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _607 = _317 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _609 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[16].x, _603);
            float _611 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[16].x, _605);
            float _613 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[16].x, _607);
            float _615 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[16].z, _609);
            float _617 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[16].z, _611);
            float _619 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[16].z, _613);
            float _621 = _615 * _133;
            float _623 = _615 * _139;
            float _625 = _615 * _145;
            float _627 = fma(_617, _131, _621);
            float _629 = fma(_617, _137, _623);
            float _631 = fma(_617, _143, _625);
            float _633 = fma(_619, _135, _627);
            float _635 = fma(_619, _141, _629);
            float _637 = fma(_619, _147, _631);
            float _639 = _633 * _633;
            float _641 = fma(_635, _635, _639);
            float _643 = fma(_637, _637, _641);
            float _645 = rsqrt(_643);
            float _647 = _645 * 9.9999999747524270787835121154785e-07;
            float _649 = _635 * _647;
            float _651 = _633 * _647;
            float _653 = _637 * _647;
            _589 = _651;
            _597 = _649;
            _591 = _653;
            _655 = true;
        }
        else
        {
            float _657 = _207 * _207;
            float _659 = fma(_205, _205, _657);
            float _661 = fma(_209, _209, _659);
            float _663 = sqrt(_661);
            bool _665 = _663 >= 9.9999999747524270787835121154785e-07;
            bool _667 = isnan(_663);
            bool _669 = _665 || _667;
            bool _671 = isnan(9.9999999747524270787835121154785e-07);
            bool _673 = _669 || _671;
            if (!_673)
            {
                float _675 = _555 * _555;
                float _677 = fma(_553, _553, _675);
                float _679 = fma(_557, _557, _677);
                float _681 = sqrt(_679);
                bool _683 = _681 >= 9.9999999747524270787835121154785e-07;
                bool _685 = isnan(_681);
                bool _687 = _683 || _685;
                bool _689 = isnan(9.9999999747524270787835121154785e-07);
                bool _691 = _687 || _689;
                float _693 = _161;
                float _695 = _677;
                if (!_691)
                {
                    float _697 = rsqrt(_161);
                    _693 = _697;
                }
                float _699 = _693;
                if (!_691)
                {
                    float _701 = _699 * 9.9999999747524270787835121154785e-07;
                    _325 = _701;
                }
                float _703 = _325;
                if (!_691)
                {
                    float _705 = _139 * _703;
                    _595 = _705;
                }
                float _707 = _595;
                _597 = _707;
                if (!_691)
                {
                    float _709 = _133 * _703;
                    _695 = _709;
                }
                float _711 = _695;
                _589 = _711;
                if (!_691)
                {
                    float _713 = _145 * _703;
                    _587 = _713;
                }
                float _715 = _587;
                bool _717 = !_691;
                _591 = _715;
                _655 = _717;
                if (!_655)
                {
                    float _719 = _133 * _555;
                    float _721 = _139 * _555;
                    float _723 = _145 * _555;
                    float _725 = fma(_131, _553, _719);
                    float _727 = fma(_137, _553, _721);
                    float _729 = fma(_143, _553, _723);
                    float _731 = fma(_135, _557, _725);
                    float _733 = fma(_141, _557, _727);
                    float _735 = fma(_147, _557, _729);
                    float _737 = _731 * _731;
                    float _739 = fma(_733, _733, _737);
                    float _741 = fma(_735, _735, _739);
                    float _743 = rsqrt(_741);
                    float _745 = _743 * 9.9999999747524270787835121154785e-07;
                    float _747 = _733 * _745;
                    float _749 = _731 * _745;
                    float _751 = _735 * _745;
                    _589 = _749;
                    _597 = _747;
                    _591 = _751;
                    _655 = true;
                }
            }
            else
            {
                float _753 = _133 * _207;
                float _755 = _139 * _207;
                float _757 = _145 * _207;
                float _759 = fma(_131, _205, _753);
                float _761 = fma(_137, _205, _755);
                float _763 = fma(_143, _205, _757);
                float _765 = fma(_135, _209, _759);
                float _767 = fma(_141, _209, _761);
                float _769 = fma(_147, _209, _763);
                float _771 = _765 * _765;
                float _773 = fma(_767, _767, _771);
                float _775 = fma(_769, _769, _773);
                float _777 = rsqrt(_775);
                float _779 = _777 * 9.9999999747524270787835121154785e-07;
                float _781 = _767 * _779;
                float _783 = _765 * _779;
                float _785 = _769 * _779;
                _589 = _783;
                _597 = _781;
                _591 = _785;
            }
        }
    }
    _655 = false;
    float _787 = _589;
    float _789 = _597;
    float _791 = _591;
    bool _793 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _795 = !_793;
    float _813;
    if (!_795)
    {
        float _797 = in.m_45.x;
        float _799 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _801 = _797 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _803 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _805 = _803 * _799;
        float _807 = floor(_805);
        float _809 = -_807;
        float _811 = _805 + _809;
        _813 = _811;
        _815 = true;
    }
    else
    {
        float _817 = float(_77);
        float _819 = 1.0 / _817;
        float _821 = _111 * _819;
        _813 = _821;
    }
    _815 = false;
    float _823 = _813;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _827 = _823 + _825;
    bool _829 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _831 = isnan(_823);
    bool _833 = _829 || _831;
    bool _835 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _837 = _833 || _835;
    float _839 = float(_837);
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _841;
    float _845 = -_839;
    float _847 = _845 + 1.0;
    bool _849 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _851 = isnan(_823);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _857 = _853 || _855;
    float _859 = float(_857);
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _861;
    bool _865 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _867 = 1.0 / _843;
    float _869 = _859 * _847;
    float _871 = -_859;
    float _873 = _871 + 1.0;
    float _875 = _827 * _867;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _877;
    float _881 = fma(_863, _875, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _883 = fma(_879, _875, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _885 = _881 * _869;
    float _887 = _883 * _869;
    float _889 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[143].x, _885);
    float _891 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[143].y, _887);
    float _893 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[144].x, _889);
    float _895 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[144].y, _891);
    bool _897 = !_865;
    float _915;
    if (!_897)
    {
        float _899 = in.m_45.x;
        float _901 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _903 = _899 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _905 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[11].x, _111);
        float _907 = _905 * _901;
        float _909 = floor(_907);
        float _911 = -_909;
        float _913 = _907 + _911;
        _915 = _913;
        _917 = true;
    }
    else
    {
        float _919 = float(_77);
        float _921 = 1.0 / _919;
        float _923 = _111 * _921;
        _915 = _923;
    }
    _917 = false;
    float _925 = _915;
    float _927 = in.m_43.x;
    float _929 = in.m_43.y;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _933 = _925 + _931;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _935;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _943;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _951 = 1.0 / _937;
    bool _953 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _955 = isnan(_925);
    bool _957 = _953 || _955;
    bool _959 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _961 = _957 || _959;
    float _963 = float(_961);
    float _965 = 1.0 / _949;
    bool _967 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _969 = _895 * _929;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _973 = _925 + _971;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _977 = _925 + _975;
    float _979 = 1.0 / _941;
    float _981 = _933 * _951;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _983;
    float _987 = 1.0 / _945;
    float _989 = _973 * _979;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _993 = _925 + _991;
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _995;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _999;
    float _1003 = _993 * _965;
    bool _1005 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _1007 = isnan(_925);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _1013 = _1009 || _1011;
    float _1015 = float(_1013);
    float _1017 = _977 * _987;
    bool _1019 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1021 = isnan(_925);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1027 = _1023 || _1025;
    float _1029 = float(_1027);
    bool _1031 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _1033 = isnan(_925);
    bool _1035 = _1031 || _1033;
    bool _1037 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _1039 = _1035 || _1037;
    float _1041 = float(_1039);
    float _1043 = -_1015;
    float _1045 = _1043 + 1.0;
    float _1047 = fma(_985, _1017, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1049 = fma(_997, _1017, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1051 = fma(_1001, _1017, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1053 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1055 = isnan(_925);
    bool _1057 = _1053 || _1055;
    bool _1059 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1061 = _1057 || _1059;
    float _1063 = float(_1061);
    float _1065 = -_1029;
    float _1067 = _1065 + 1.0;
    float _1069 = _1041 * _1045;
    float _1071 = -_1041;
    float _1073 = _1071 + 1.0;
    float _1075 = _1063 * _1067;
    float _1077 = -_1063;
    float _1079 = _1077 + 1.0;
    float _1081 = _1029 * _1073;
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1085 = _1083 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1089 = _1087 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1091 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1093 = _1091 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1095 = _963 * _1079;
    float _1097 = fma(_1085, _1003, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1099 = fma(_1089, _1003, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1101 = fma(_1093, _1003, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1103 = _1049 * _1095;
    float _1105 = _1047 * _1095;
    float _1107 = _1051 * _1095;
    float _1109 = -_963;
    float _1111 = _1109 + 1.0;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _1113;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _1117;
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _1121;
    float _1125 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1105);
    float _1127 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1107);
    float _1129 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1103);
    float _1131 = fma(_1115, _981, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _1133 = fma(_1097, _1075, _1125);
    float _1135 = fma(_1101, _1075, _1127);
    float _1137 = fma(_1119, _981, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _1139 = fma(_1099, _1075, _1129);
    float _1141 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _1143 = _1141 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _1147 = _1145 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _1149 = fma(_1123, _981, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _1155 = fma(_1143, _989, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _1157 = fma(_1147, _989, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1159 = fma(_1131, _1081, _1133);
    float _1161 = fma(_1153, _989, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _1163 = fma(_1137, _1081, _1139);
    float _1165 = fma(_1149, _1081, _1135);
    float _1167 = fma(_1155, _1069, _1159);
    float _1169 = _893 * _927;
    float _1171 = fma(_1157, _1069, _1163);
    float _1173 = fma(_1161, _1069, _1165);
    float _1175 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[111].x, _1167);
    float _1177 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[111].y, _1171);
    float _1179 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[111].z, _1173);
    bool _1181 = !_967;
    float _1199;
    if (!_1181)
    {
        float _1183 = in.m_45.x;
        float _1185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1187 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1189 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _1191 = _1189 * _1185;
        float _1193 = floor(_1191);
        float _1195 = -_1193;
        float _1197 = _1191 + _1195;
        _1199 = _1197;
        _1201 = true;
    }
    else
    {
        float _1203 = float(_77);
        float _1205 = 1.0 / _1203;
        float _1207 = _111 * _1205;
        _1199 = _1207;
    }
    _1201 = false;
    float _1209 = _1199;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1213 = _1211 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1215 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1217 = isnan(_1209);
    bool _1219 = _1215 || _1217;
    bool _1221 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1223 = _1219 || _1221;
    float _1225 = float(_1223);
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1229 = _1227 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1231 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1233 = isnan(_1209);
    bool _1235 = _1231 || _1233;
    bool _1237 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1239 = _1235 || _1237;
    float _1241 = float(_1239);
    float _1243 = 1.0 / _1213;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1245;
    float _1249 = -_1225;
    float _1251 = _1249 + 1.0;
    bool _1253 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1255 = isnan(_1209);
    bool _1257 = _1253 || _1255;
    bool _1259 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1261 = _1257 || _1259;
    float _1263 = float(_1261);
    bool _1265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1267 = _1241 * _1251;
    float _1269 = -_1241;
    float _1271 = _1269 + 1.0;
    float _1273 = 1.0 / _1229;
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1277 = _1275 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1279 = _1175 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1281 = _1179 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1283 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1287 = _1247 * _1243;
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1291 = _1209 + _1289;
    float _1293 = -_1263;
    float _1295 = _1293 + 1.0;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1299 = _1209 + _1297;
    float _1301 = fma(_1287, _1291, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1303 = _1225 * _1295;
    float _1305 = _1277 * _1273;
    float _1307 = _1301 * _1267;
    float _1309 = fma(_1305, _1299, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1311 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1307);
    float _1313 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1315 = fma(_1309, _1303, _1311);
    float _1317 = _1313 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1319 = fma(_1263, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1315);
    float _1321 = _1319 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_47.x = _1283;
    out.m_47.y = _1317;
    out.m_47.z = _1285;
    out.m_47.w = _1321;
    bool _1323 = !_1265;
    float _1341;
    if (!_1323)
    {
        float _1325 = in.m_45.x;
        float _1327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1329 = _1325 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1331 = fma(_1329, (*spvDescriptorSet0.vp_c9)._m0[11].z, _111);
        float _1333 = _1331 * _1327;
        float _1335 = floor(_1333);
        float _1337 = -_1335;
        float _1339 = _1333 + _1337;
        _1341 = _1339;
        _1343 = true;
    }
    else
    {
        float _1345 = float(_77);
        float _1347 = 1.0 / _1345;
        float _1349 = _111 * _1347;
        _1341 = _1349;
    }
    _1343 = false;
    float _1351 = _1341;
    float _1353 = as_type<float>(int(gl_VertexIndex));
    float _1355 = _581 * _139;
    float _1357 = _581 * _133;
    float _1359 = in.m_45.z;
    float _1361 = fma(_579, _137, _1355);
    float _1363 = _581 * _145;
    float _1365 = in.m_45.x;
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    int _1371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1373 = _1371 != 0;
    float _1375 = fma(_579, _131, _1357);
    float _1377 = fma(_579, _143, _1363);
    float _1379 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1381 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1379;
    float _1383 = 1.0 / _1369;
    float _1385 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1385;
    float _1389 = in.m_45.w;
    float _1391 = fma(_583, _141, _1361);
    float _1393 = fma(_583, _147, _1377);
    float _1395 = in.m_41.w;
    int _1397 = as_type<int>(_1353) & 1;
    bool _1399 = _1397 != 0;
    int _1401 = as_type<int>(_1353) & 2;
    bool _1403 = _1401 != 0;
    float _1405 = 1.0 / _1387;
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1409 = _1407 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1411;
    bool _1415 = _1359 > 0.5;
    float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1419 = _1417 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1421 = !_1399;
    float _1423 = _1421 ? (-0.5) : 0.5;
    float _1425 = fma(_583, _135, _1375);
    int _1427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1429 = _1427 != 0;
    float _1431 = 1.0 / _1381;
    float _1433 = -_1423;
    int _1435 = _1415 ? as_type<int>(_1433) : as_type<int>(_1423);
    float _1437 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1439 = _1351 + _1437;
    float _1441 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1423);
    bool _1443 = !_1429;
    float _1445 = _1443 ? _1423 : as_type<float>(_1435);
    float _1447 = _969 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1449 = in.m_39.w;
    float _1451 = 1.0 / _1409;
    bool _1453 = _1365 > 0.5;
    float _1455 = in.m_37.w;
    bool _1457 = _1389 > 0.5;
    float _1459 = 1.0 / _1419;
    float _1461 = _1393 + _1395;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1463;
    float _1467 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1471 = _1351 + _1469;
    float _1473 = 1.0 / _1413;
    float _1475 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1477 = _1351 + _1475;
    float _1479 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1481 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1479;
    float _1483 = _1471 * _1431;
    float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1487 = _1351 + _1485;
    float _1489 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1491 = _1489 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1493 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1495 = _1493 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1497 = _1391 + _1449;
    float _1499 = _1487 * _1405;
    float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1503 = _1351 + _1501;
    float _1505 = _1439 * _1451;
    out.m_33.x = _1467;
    float _1507 = _1503 * _1383;
    float _1509 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1511 = _1509 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    int _1513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1515 = _1513 != 0;
    float _1517 = _1477 * _1459;
    int _1519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1521 = _1519 != 0;
    float _1523 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1525 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1523;
    int _1527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1529 = _1527 != 0;
    float _1531 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1533 = _1351 + _1531;
    float _1535 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1535;
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1541 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1539;
    float _1543 = fma(_1491, _1507, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1545 = fma(_1511, _1507, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1547 = fma(_1495, _1507, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1551 = _1549 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1555 = _1553 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1557 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1559 = _1557 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1561 = _787 * _787;
    float _1563 = _1425 + _1455;
    float _1565 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1567 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1565;
    float _1569 = _1533 * _1473;
    float _1571 = fma(_1551, _1505, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1573 = fma(_1555, _1505, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1575 = fma(_1559, _1505, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1577 = fma(_789, _789, _1561);
    float _1579 = fma(_1465, _1483, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1581 = fma(_1567, _1483, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1583 = fma(_1481, _1483, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1585;
    float _1589 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1591 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1589;
    float _1593 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1595 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1593;
    float _1597 = fma(_791, _791, _1577);
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1601 = _1599 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1603 = fma(_1587, _1569, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1605 = fma(_1591, _1569, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1607 = (*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1609 = _1579;
    float _1611 = _1563;
    if (!_1373)
    {
        float _1613 = in.m_45.y;
        _1607 = _1613;
    }
    float _1615 = _1607;
    float _1617 = fma(_1595, _1569, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1619 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1621 = _1619 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1623 = rsqrt(_1597);
    bool _1625 = _1351 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1627 = isnan(_1351);
    bool _1629 = _1625 || _1627;
    bool _1631 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1633 = _1629 || _1631;
    float _1635 = float(_1633);
    float _1637 = fma(_1601, _1517, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1639 = fma(_1525, _1499, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1641 = fma(_1537, _1499, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1643 = fma(_1541, _1499, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1645 = fma(_1621, _1517, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1647 = _1169 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1649 = _1351 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1651 = isnan(_1351);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    float _1661 = -_1635;
    float _1663 = _1661 + 1.0;
    float _1665 = -_1423;
    int _1667 = _1453 ? as_type<int>(_1665) : as_type<int>(_1423);
    float _1669 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1671 = _1669 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1673 = _1647 * _1441;
    float _1675 = _1659 * _1663;
    float _1677 = -_1659;
    float _1679 = _1677 + 1.0;
    bool _1681 = !_1521;
    float _1683 = _1681 ? _1423 : as_type<float>(_1667);
    float _1685 = fma(_1671, _1517, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    bool _1687 = _1351 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1689 = isnan(_1351);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1695 = _1691 || _1693;
    float _1697 = float(_1695);
    float _1699 = _1623 * _789;
    bool _1701 = _1351 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1703 = isnan(_1351);
    bool _1705 = _1701 || _1703;
    bool _1707 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1709 = _1705 || _1707;
    float _1711 = float(_1709);
    float _1713 = _1623 * _787;
    float _1715 = _1623 * _791;
    bool _1717 = _1351 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1719 = isnan(_1351);
    bool _1721 = _1717 || _1719;
    bool _1723 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1725 = _1721 || _1723;
    float _1727 = float(_1725);
    float _1729 = -_1697;
    float _1731 = _1729 + 1.0;
    float _1733 = -_1711;
    float _1735 = _1733 + 1.0;
    bool _1737 = _1351 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1739 = isnan(_1351);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1745 = _1741 || _1743;
    float _1747 = float(_1745);
    float _1749 = _1711 * _1679;
    bool _1751 = _1351 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1753 = isnan(_1351);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1759 = _1755 || _1757;
    float _1761 = float(_1759);
    float _1763 = _1727 * _1731;
    float _1765 = _1697 * _1735;
    float _1767 = -_1727;
    float _1769 = _1767 + 1.0;
    float _1771 = _1697;
    if (!_1373)
    {
        _1771 = _1615;
    }
    float _1773 = _1771;
    float _1775 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1777 = _1715 * _1775;
    float _1779 = -_1761;
    float _1781 = _1779 + 1.0;
    float _1783 = _1761 * _1769;
    float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1787 = _1713 * _1785;
    float _1789 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1791 = -_1777;
    float _1793 = fma(_1699, _1789, _1791);
    float _1795 = _1773;
    float _1797 = _1615;
    if (_1373)
    {
        float _1799 = in.m_45.x;
        float _1801 = in.m_45.y;
        _1795 = _1799;
        _1797 = _1801;
    }
    float _1803 = _1795;
    float _1805 = _1797;
    float _1807 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1809 = _1699 * _1807;
    float _1811 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1813 = -_1787;
    float _1815 = fma(_1715, _1811, _1813);
    float _1817 = _1793 * _1793;
    float _1819 = _1747 * _1781;
    float _1821 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1823 = -_1809;
    float _1825 = fma(_1713, _1821, _1823);
    bool _1827 = !_1403;
    float _1829 = _1827 ? (-0.5) : 0.5;
    float _1831 = fma(_1815, _1815, _1817);
    float _1833 = _1581 * _1819;
    float _1835 = _1583 * _1819;
    float _1837 = -_1747;
    float _1839 = _1837 + 1.0;
    float _1841 = fma(_1825, _1825, _1831);
    float _1843 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1829);
    float _1845 = fma(_1839, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1835);
    float _1847 = _1447 * _1843;
    float _1849 = rsqrt(_1841);
    float _1851 = _1579 * _1819;
    float _1853 = _1819;
    if (!_1373)
    {
        _1609 = _1359;
    }
    float _1855 = _1609;
    float _1857 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1859 = _1855;
    if (!_1373)
    {
        _1853 = _1359;
    }
    float _1861 = _1853;
    float _1863 = _1803 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1865 = _1861;
    if (_1373)
    {
        _1859 = _1805;
    }
    float _1867 = _1859;
    if (_1373)
    {
        _1865 = _1805;
    }
    float _1869 = _1865;
    bool _1871 = _1805 > 0.5;
    float _1873 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1875 = fma(_1869, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1857);
    float _1877 = _1825 * _1849;
    float _1879 = fma(_1803, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1873);
    float _1881 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1883 = fma(_1839, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1851);
    float _1885 = _1793 * _1849;
    float _1887 = fma(_1839, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1833);
    float _1889 = -_1881;
    float _1891 = fma(_1863, 2.0, _1889);
    float _1893 = _1815 * _1849;
    float _1895 = _1699 * _1885;
    float _1897 = fma(_1543, _1783, _1883);
    float _1899 = _1847 * _1713;
    float _1901 = _1847 * _1699;
    float _1903 = -_1895;
    float _1905 = fma(_1713, _1893, _1903);
    float _1907 = _1713 * _1877;
    float _1909 = _1847 * _1715;
    float _1911 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1913 = fma(_1673, _1893, _1901);
    float _1915 = -_1907;
    float _1917 = fma(_1715, _1885, _1915);
    float _1919 = fma(_1673, _1877, _1909);
    float _1921 = fma(_1545, _1783, _1887);
    float _1923 = fma(_1911, _1917, _1913);
    float _1925 = fma(_1911, _1905, _1919);
    float _1927 = fma(_1547, _1783, _1845);
    float _1929 = _1867 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1931 = _1497 + _1923;
    float _1933 = _1461 + _1925;
    float _1935 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1937 = -_1829;
    int _1939 = _1457 ? as_type<int>(_1937) : as_type<int>(_1829);
    float _1941 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1943 = _1931 + _1941;
    float _1945 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1947 = _1933 + _1945;
    float _1949 = -_1829;
    int _1951 = _1871 ? as_type<int>(_1949) : as_type<int>(_1829);
    float _1953 = fma(_1929, -2.0, _1935);
    bool _1955 = !_1515;
    float _1957 = _1955 ? _1829 : as_type<float>(_1939);
    float _1959 = _1947 * _1947;
    bool _1961 = !_1529;
    float _1963 = _1961 ? _1829 : as_type<float>(_1951);
    float _1965 = fma(_1641, _1763, _1921);
    float _1967 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1969 = fma(_1943, _1943, _1959);
    float _1971 = fma(_1639, _1763, _1897);
    float _1973 = fma(_1573, _1765, _1965);
    float _1975 = _1715 * _1893;
    float _1977 = fma(_1643, _1763, _1927);
    float _1979 = fma(_1571, _1765, _1971);
    float _1981 = fma(_1673, _1885, _1899);
    float _1983 = sqrt(_1969);
    float _1985 = -_1975;
    float _1987 = fma(_1699, _1877, _1985);
    float _1989 = fma(_1575, _1765, _1977);
    float _1991 = fma(_1603, _1749, _1979);
    float _1993 = fma(_1605, _1749, _1973);
    float _1995 = fma(_1911, _1987, _1981);
    float _1997 = fma(_1617, _1749, _1989);
    float _1999 = -_111;
    float _2001 = fma(_1999, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1891);
    float _2003 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2005 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1879);
    float _2007 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1875);
    float _2009 = fma(_1637, _1675, _1991);
    float _2011 = fma(_1645, _1675, _1993);
    float _2013 = _1563 + _1995;
    float _2015 = _1967 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2017 = _1445 + 0.5;
    bool _2019 = _1983 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2021 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1953);
    float _2023 = _1957 + (-0.5);
    float _2025 = fma(_1685, _1675, _1997);
    float _2027 = fma(_1635, (*spvDescriptorSet0.vp_c9)._m0[129].x, _2009);
    float _2029 = fma(_1635, (*spvDescriptorSet0.vp_c9)._m0[129].y, _2011);
    float _2031 = fma(_2015, _2017, _2001);
    float _2033 = fma(_1635, (*spvDescriptorSet0.vp_c9)._m0[129].z, _2025);
    float _2035 = _2003 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2037 = -_2035;
    float _2039 = -_2021;
    float _2041 = fma(_2037, _2023, _2039);
    float _2043 = _1931;
    float _2045 = _1933;
    if (!_2019)
    {
        _1611 = _2013;
    }
    float _2047 = _1611;
    bool _2049 = !_2019;
    float _2051 = _2047;
    if (!_2049)
    {
        float _2053 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2055 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2057 = _1983 + _2055;
        float _2059 = _2013 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2061 = rsqrt(_1969);
        float _2063 = _2057 * _2053;
        float _2065 = _2063 * 0.15915493667125701904296875;
        float _2067 = _2065 * 6.283185482025146484375;
        float _2069 = cos(_2067);
        float _2071 = _2065 * 6.283185482025146484375;
        float _2073 = sin(_2071);
        float _2075 = _2069 + (-1.0);
        float _2077 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2079 = fma(_2073, _2059, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2081 = fma(_2013, _2069, _2077);
        float _2083 = _2061 * _2079;
        float _2085 = fma(_1943, _2083, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2087 = fma(_1947, _2083, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2051 = _2081;
        _2043 = _2085;
        _2045 = _2087;
    }
    float _2089 = _2051;
    float _2091 = _2043;
    float _2093 = _2045;
    float _2095 = _2089 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2097 = _2089 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2099 = _2089 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2101 = _2089 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2103 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2095);
    float _2105 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2097);
    float _2107 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2099);
    float _2109 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2101);
    float _2111 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2103);
    float _2113 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2105);
    float _2115 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2107);
    float _2117 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2119 = _2111 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2121 = _2113 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2123 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2109);
    float _2125 = _2115 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2127 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2129 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2131 = -_2007;
    float _2133 = _2131 + 1.0;
    float _2135 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2137 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2127);
    float _2139 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2129);
    float _2141 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2143 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2145 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2137);
    float _2147 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2139);
    float _2149 = _2123 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2151 = fma(_1957, _2133, _2041);
    float _2153 = _2029 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2155 = _1683 + 0.5;
    float _2157 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2141);
    float _2159 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2143);
    float _2161 = -_1963;
    float _2163 = _2161 + 0.5;
    float _2165 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2145);
    float _2167 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2147);
    float _2169 = -_2005;
    float _2171 = _2169 + 1.0;
    float _2173 = _2027 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2175 = _2153 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2177 = _2155 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2179 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2157);
    float _2181 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2159);
    float _2183 = _2163 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2185 = _2033 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2187 = _2165 + _2167;
    float _2189 = -_2171;
    float _2191 = fma(_1445, _2189, _2031);
    float _2193 = _2173 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2195 = _2177 * _2117;
    float _2197 = _2183 * _2135;
    float _2199 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2179);
    float _2201 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2181);
    float _2203 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2205 = _2185 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2207 = _2187 * 0.5;
    out.m_52.x = _2195;
    out.m_52.y = _2197;
    out.m_52.z = _2191;
    out.m_52.w = _2151;
    out.m_54.x = _2193;
    out.m_54.y = _2175;
    out.m_54.z = _2205;
    out.m_54.w = _2203;
    out.m_56.y = _2089;
    out.gl_Position.x = _2199;
    out.gl_Position.y = _2201;
    out.gl_Position.z = _2165;
    out.gl_Position.w = _2167;
    out.m_58.z = _2207;
    out.m_58.w = _2167;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1343 = false;
    bool _1201 = false;
    bool _917 = false;
    bool _815 = false;
    bool _655 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _2264 = as_type<float>(_93);
        out.gl_Position.z = _2264;
    }
    if (!_81)
    {
        return out;
    }
    float _97 = in.m_35.w;
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
        out.m_33.x = 0.0;
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
        float _2333 = as_type<float>(_129);
        out.gl_Position.z = _2333;
    }
    if (_121)
    {
        return out;
    }
    float _131 = in.m_37.x;
    float _133 = in.m_37.y;
    float _135 = in.m_37.z;
    float _137 = in.m_39.x;
    float _139 = in.m_39.y;
    float _141 = in.m_39.z;
    float _143 = in.m_41.x;
    float _145 = in.m_41.y;
    float _147 = in.m_41.z;
    float _149 = _131 * _131;
    float _151 = _133 * _133;
    float _153 = fma(_137, _137, _149);
    float _155 = fma(_139, _139, _151);
    float _157 = fma(_143, _143, _153);
    float _159 = _135 * _135;
    float _161 = fma(_145, _145, _155);
    float _163 = sqrt(_157);
    float _165 = fma(_141, _141, _159);
    float _167 = fma(_147, _147, _165);
    float _169 = sqrt(_161);
    float _171 = sqrt(_167);
    bool _173 = _163 > 0.0;
    bool _175 = _169 > 0.0;
    bool _177 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _179 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _181 = _177 || _179;
    bool _183 = isnan(1.0);
    bool _185 = _181 || _183;
    float _187 = 0.0;
    float _189 = _167;
    if (_173)
    {
        float _191 = rsqrt(_157);
        _187 = _191;
    }
    float _193 = _187;
    bool _195 = _171 > 0.0;
    float _197 = 0.0;
    float _199 = 0.0;
    if (!_173)
    {
        _197 = 0.0;
        _199 = 0.0;
    }
    float _201 = _197;
    float _203 = _199;
    float _205 = in.m_35.x;
    float _207 = in.m_35.y;
    float _209 = in.m_35.z;
    float _211 = 0.0;
    float _213 = _201;
    float _215 = _203;
    if (!_173)
    {
        _211 = 0.0;
    }
    float _217 = _211;
    float _219 = 0.0;
    float _221 = 0.0;
    float _223 = _217;
    if (!_175)
    {
        _219 = 0.0;
        _221 = 0.0;
    }
    float _225 = _219;
    float _227 = _221;
    float _229 = 0.0;
    float _231 = _227;
    float _233 = _225;
    if (!_175)
    {
        _229 = 0.0;
    }
    float _235 = _229;
    float _237 = 0.0;
    float _239 = _235;
    if (_175)
    {
        float _241 = rsqrt(_161);
        _237 = _241;
    }
    float _243 = _237;
    float _245 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _247 = 0.0;
    float _249 = 0.0;
    float _251 = _245;
    if (!_195)
    {
        _247 = 0.0;
        _249 = 0.0;
    }
    float _253 = _247;
    float _255 = _249;
    float _257 = 0.0;
    float _259 = _253;
    float _261 = _255;
    if (!_195)
    {
        _257 = 0.0;
    }
    float _263 = _257;
    float _265 = 0.0;
    float _267 = _263;
    if (_195)
    {
        float _269 = rsqrt(_167);
        _265 = _269;
    }
    float _271 = _265;
    if (_173)
    {
        float _273 = _193 * _137;
        _223 = _273;
    }
    float _275 = _223;
    if (_173)
    {
        float _277 = _193 * _131;
        _213 = _277;
    }
    float _279 = _213;
    if (_173)
    {
        float _281 = _193 * _143;
        _215 = _281;
    }
    float _283 = _215;
    if (_175)
    {
        float _285 = _243 * _139;
        _231 = _285;
    }
    float _287 = _231;
    if (!_185)
    {
        float _289 = _245 * _245;
        float _291 = _289 * 0.5;
        _189 = _291;
    }
    float _293 = _189;
    float _295 = _293;
    if (_175)
    {
        float _297 = _243 * _133;
        _233 = _297;
    }
    float _299 = _233;
    if (_175)
    {
        float _301 = _243 * _145;
        _239 = _301;
    }
    float _303 = _239;
    if (!_185)
    {
        float _305 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _295 = _305;
    }
    float _307 = _295;
    float _309 = _307;
    if (_195)
    {
        float _311 = _271 * _141;
        _267 = _311;
    }
    float _313 = _267;
    if (_195)
    {
        float _315 = _271 * _135;
        _259 = _315;
    }
    float _317 = _259;
    if (_195)
    {
        float _319 = _271 * _147;
        _261 = _319;
    }
    float _321 = _261;
    bool _323 = !_185;
    float _325 = _209;
    if (!_323)
    {
        float _327 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _329 = log2(_327);
        float _331 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _333 = _331 + 1.0;
        float _335 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _337 = _245 * _329;
        float _339 = exp2(_337);
        float _341 = _335 * 0.693147182464599609375;
        float _343 = 1.0 / _341;
        float _345 = 1.0 / _333;
        float _347 = _339 + (-1.0);
        float _349 = -_347;
        float _351 = fma(_349, _343, _245);
        float _353 = _351 * _345;
        float _355 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _309 = _355;
    }
    float _357 = _309;
    float _359 = _357 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _361 = !_185;
    float _363 = _359;
    float _365 = _357;
    if (!_361)
    {
        float _367 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _369 = log2(_367);
        float _371 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _373 = _371 + 1.0;
        float _375 = 1.0 / _373;
        float _377 = _245 * _369;
        float _379 = exp2(_377);
        float _381 = -_379;
        float _383 = _381 + 1.0;
        float _385 = _383 * _375;
        _251 = _385;
    }
    float _387 = _251;
    float _389 = _357 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _391 = _359 * _279;
    float _393 = _359 * _299;
    float _395 = _359 * _317;
    if (!_185)
    {
        float _397 = _111 * _111;
        float _399 = _397 * 0.5;
        _363 = _399;
    }
    float _401 = _363;
    float _403 = fma(_389, _275, _391);
    float _405 = fma(_389, _287, _393);
    float _407 = fma(_389, _313, _395);
    float _409 = _357 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_185)
    {
        float _411 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _365 = _411;
    }
    float _413 = _365;
    bool _415 = !_185;
    float _417 = _413;
    if (!_415)
    {
        float _419 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _421 = log2(_419);
        float _423 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _425 = _423 + 1.0;
        float _427 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _429 = _111 * _421;
        float _431 = exp2(_429);
        float _433 = _427 * 0.693147182464599609375;
        float _435 = 1.0 / _433;
        float _437 = 1.0 / _425;
        float _439 = _431 + (-1.0);
        float _441 = -_439;
        float _443 = fma(_441, _435, _111);
        float _445 = _443 * _437;
        float _447 = _445 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _417 = _447;
    }
    float _449 = _417;
    float _451 = _449 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _453 = fma(_409, _283, _403);
    float _455 = fma(_409, _303, _405);
    float _457 = fma(_409, _321, _407);
    float _459 = _449 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _461 = _451 * _299;
    float _463 = _449 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _465 = _451 * _279;
    float _467 = _451 * _317;
    float _469 = fma(_459, _287, _461);
    float _471 = _449;
    if (!_185)
    {
        _471 = _111;
    }
    float _473 = _471;
    bool _475 = !_185;
    float _477 = _473;
    if (!_475)
    {
        float _479 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _481 = log2(_479);
        float _483 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _485 = _483 + 1.0;
        float _487 = 1.0 / _485;
        float _489 = _111 * _481;
        float _491 = exp2(_489);
        float _493 = -_491;
        float _495 = _493 + 1.0;
        float _497 = _495 * _487;
        _477 = _497;
    }
    float _499 = _477;
    float _501 = fma(_459, _275, _465);
    float _503 = fma(_463, _303, _469);
    float _505 = fma(_459, _313, _467);
    float _507 = fma(_387, _207, _455);
    float _509 = fma(_463, _283, _501);
    float _511 = fma(_499, _207, _503);
    float _513 = fma(_463, _321, _505);
    float _515 = fma(_387, _205, _453);
    float _517 = fma(_499, _205, _509);
    float _519 = -_511;
    float _521 = _507 + _519;
    float _523 = fma(_387, _209, _457);
    float _525 = fma(_499, _209, _513);
    float _527 = -_517;
    float _529 = _515 + _527;
    float _531 = _521 * _521;
    float _533 = in.m_43.w;
    float _535 = -_525;
    float _537 = _523 + _535;
    float _539 = _521 * _139;
    float _541 = fma(_529, _529, _531);
    float _543 = _521 * _133;
    float _545 = _521 * _145;
    float _547 = fma(_529, _137, _539);
    float _549 = fma(_537, _537, _541);
    float _551 = fma(_529, _131, _543);
    float _553 = in.m_30.x;
    float _555 = in.m_30.y;
    float _557 = in.m_30.z;
    float _559 = fma(_529, _143, _545);
    float _561 = fma(_537, _141, _547);
    float _563 = sqrt(_549);
    float _565 = fma(_537, _135, _551);
    float _567 = fma(_537, _147, _559);
    bool _569 = _563 >= 9.9999999747524270787835121154785e-07;
    bool _571 = isnan(_563);
    bool _573 = _569 || _571;
    bool _575 = isnan(9.9999999747524270787835121154785e-07);
    bool _577 = _573 || _575;
    float _579 = fma(_515, _533, _553);
    float _581 = fma(_507, _533, _555);
    float _583 = fma(_523, _533, _557);
    float _585 = _551;
    float _587 = _567;
    float _589 = _565;
    float _591 = _567;
    if (_577)
    {
        _585 = _561;
    }
    float _593 = _585;
    float _595 = _593;
    float _597 = _593;
    if (!_577)
    {
        bool _599 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _601 = !_599;
        if (!_601)
        {
            float _603 = _299 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _605 = _279 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _607 = _317 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _609 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[16].x, _603);
            float _611 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[16].x, _605);
            float _613 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[16].x, _607);
            float _615 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[16].z, _609);
            float _617 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[16].z, _611);
            float _619 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[16].z, _613);
            float _621 = _615 * _133;
            float _623 = _615 * _139;
            float _625 = _615 * _145;
            float _627 = fma(_617, _131, _621);
            float _629 = fma(_617, _137, _623);
            float _631 = fma(_617, _143, _625);
            float _633 = fma(_619, _135, _627);
            float _635 = fma(_619, _141, _629);
            float _637 = fma(_619, _147, _631);
            float _639 = _633 * _633;
            float _641 = fma(_635, _635, _639);
            float _643 = fma(_637, _637, _641);
            float _645 = rsqrt(_643);
            float _647 = _645 * 9.9999999747524270787835121154785e-07;
            float _649 = _635 * _647;
            float _651 = _633 * _647;
            float _653 = _637 * _647;
            _589 = _651;
            _597 = _649;
            _591 = _653;
            _655 = true;
        }
        else
        {
            float _657 = _207 * _207;
            float _659 = fma(_205, _205, _657);
            float _661 = fma(_209, _209, _659);
            float _663 = sqrt(_661);
            bool _665 = _663 >= 9.9999999747524270787835121154785e-07;
            bool _667 = isnan(_663);
            bool _669 = _665 || _667;
            bool _671 = isnan(9.9999999747524270787835121154785e-07);
            bool _673 = _669 || _671;
            if (!_673)
            {
                float _675 = _555 * _555;
                float _677 = fma(_553, _553, _675);
                float _679 = fma(_557, _557, _677);
                float _681 = sqrt(_679);
                bool _683 = _681 >= 9.9999999747524270787835121154785e-07;
                bool _685 = isnan(_681);
                bool _687 = _683 || _685;
                bool _689 = isnan(9.9999999747524270787835121154785e-07);
                bool _691 = _687 || _689;
                float _693 = _161;
                float _695 = _677;
                if (!_691)
                {
                    float _697 = rsqrt(_161);
                    _693 = _697;
                }
                float _699 = _693;
                if (!_691)
                {
                    float _701 = _699 * 9.9999999747524270787835121154785e-07;
                    _325 = _701;
                }
                float _703 = _325;
                if (!_691)
                {
                    float _705 = _139 * _703;
                    _595 = _705;
                }
                float _707 = _595;
                _597 = _707;
                if (!_691)
                {
                    float _709 = _133 * _703;
                    _695 = _709;
                }
                float _711 = _695;
                _589 = _711;
                if (!_691)
                {
                    float _713 = _145 * _703;
                    _587 = _713;
                }
                float _715 = _587;
                bool _717 = !_691;
                _591 = _715;
                _655 = _717;
                if (!_655)
                {
                    float _719 = _133 * _555;
                    float _721 = _139 * _555;
                    float _723 = _145 * _555;
                    float _725 = fma(_131, _553, _719);
                    float _727 = fma(_137, _553, _721);
                    float _729 = fma(_143, _553, _723);
                    float _731 = fma(_135, _557, _725);
                    float _733 = fma(_141, _557, _727);
                    float _735 = fma(_147, _557, _729);
                    float _737 = _731 * _731;
                    float _739 = fma(_733, _733, _737);
                    float _741 = fma(_735, _735, _739);
                    float _743 = rsqrt(_741);
                    float _745 = _743 * 9.9999999747524270787835121154785e-07;
                    float _747 = _733 * _745;
                    float _749 = _731 * _745;
                    float _751 = _735 * _745;
                    _589 = _749;
                    _597 = _747;
                    _591 = _751;
                    _655 = true;
                }
            }
            else
            {
                float _753 = _133 * _207;
                float _755 = _139 * _207;
                float _757 = _145 * _207;
                float _759 = fma(_131, _205, _753);
                float _761 = fma(_137, _205, _755);
                float _763 = fma(_143, _205, _757);
                float _765 = fma(_135, _209, _759);
                float _767 = fma(_141, _209, _761);
                float _769 = fma(_147, _209, _763);
                float _771 = _765 * _765;
                float _773 = fma(_767, _767, _771);
                float _775 = fma(_769, _769, _773);
                float _777 = rsqrt(_775);
                float _779 = _777 * 9.9999999747524270787835121154785e-07;
                float _781 = _767 * _779;
                float _783 = _765 * _779;
                float _785 = _769 * _779;
                _589 = _783;
                _597 = _781;
                _591 = _785;
            }
        }
    }
    _655 = false;
    float _787 = _589;
    float _789 = _597;
    float _791 = _591;
    bool _793 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _795 = !_793;
    float _813;
    if (!_795)
    {
        float _797 = in.m_45.x;
        float _799 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _801 = _797 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _803 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _805 = _803 * _799;
        float _807 = floor(_805);
        float _809 = -_807;
        float _811 = _805 + _809;
        _813 = _811;
        _815 = true;
    }
    else
    {
        float _817 = float(_77);
        float _819 = 1.0 / _817;
        float _821 = _111 * _819;
        _813 = _821;
    }
    _815 = false;
    float _823 = _813;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _827 = _823 + _825;
    bool _829 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _831 = isnan(_823);
    bool _833 = _829 || _831;
    bool _835 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _837 = _833 || _835;
    float _839 = float(_837);
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _841;
    float _845 = -_839;
    float _847 = _845 + 1.0;
    bool _849 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _851 = isnan(_823);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _857 = _853 || _855;
    float _859 = float(_857);
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _861;
    bool _865 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _867 = 1.0 / _843;
    float _869 = _859 * _847;
    float _871 = -_859;
    float _873 = _871 + 1.0;
    float _875 = _827 * _867;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _877;
    float _881 = fma(_863, _875, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _883 = fma(_879, _875, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _885 = _881 * _869;
    float _887 = _883 * _869;
    float _889 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[143].x, _885);
    float _891 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[143].y, _887);
    float _893 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[144].x, _889);
    float _895 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[144].y, _891);
    bool _897 = !_865;
    float _915;
    if (!_897)
    {
        float _899 = in.m_45.x;
        float _901 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _903 = _899 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _905 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[11].x, _111);
        float _907 = _905 * _901;
        float _909 = floor(_907);
        float _911 = -_909;
        float _913 = _907 + _911;
        _915 = _913;
        _917 = true;
    }
    else
    {
        float _919 = float(_77);
        float _921 = 1.0 / _919;
        float _923 = _111 * _921;
        _915 = _923;
    }
    _917 = false;
    float _925 = _915;
    float _927 = in.m_43.x;
    float _929 = in.m_43.y;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _933 = _925 + _931;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _935;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _943;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _951 = 1.0 / _937;
    bool _953 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _955 = isnan(_925);
    bool _957 = _953 || _955;
    bool _959 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _961 = _957 || _959;
    float _963 = float(_961);
    float _965 = 1.0 / _949;
    bool _967 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _969 = _895 * _929;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _973 = _925 + _971;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _977 = _925 + _975;
    float _979 = 1.0 / _941;
    float _981 = _933 * _951;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _983;
    float _987 = 1.0 / _945;
    float _989 = _973 * _979;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _993 = _925 + _991;
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _995;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _999;
    float _1003 = _993 * _965;
    bool _1005 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _1007 = isnan(_925);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _1013 = _1009 || _1011;
    float _1015 = float(_1013);
    float _1017 = _977 * _987;
    bool _1019 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1021 = isnan(_925);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1027 = _1023 || _1025;
    float _1029 = float(_1027);
    bool _1031 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _1033 = isnan(_925);
    bool _1035 = _1031 || _1033;
    bool _1037 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _1039 = _1035 || _1037;
    float _1041 = float(_1039);
    float _1043 = -_1015;
    float _1045 = _1043 + 1.0;
    float _1047 = fma(_985, _1017, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1049 = fma(_997, _1017, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1051 = fma(_1001, _1017, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1053 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1055 = isnan(_925);
    bool _1057 = _1053 || _1055;
    bool _1059 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1061 = _1057 || _1059;
    float _1063 = float(_1061);
    float _1065 = -_1029;
    float _1067 = _1065 + 1.0;
    float _1069 = _1041 * _1045;
    float _1071 = -_1041;
    float _1073 = _1071 + 1.0;
    float _1075 = _1063 * _1067;
    float _1077 = -_1063;
    float _1079 = _1077 + 1.0;
    float _1081 = _1029 * _1073;
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1085 = _1083 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1089 = _1087 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1091 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1093 = _1091 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1095 = _963 * _1079;
    float _1097 = fma(_1085, _1003, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1099 = fma(_1089, _1003, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1101 = fma(_1093, _1003, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1103 = _1049 * _1095;
    float _1105 = _1047 * _1095;
    float _1107 = _1051 * _1095;
    float _1109 = -_963;
    float _1111 = _1109 + 1.0;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _1113;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _1117;
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _1121;
    float _1125 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1105);
    float _1127 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1107);
    float _1129 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1103);
    float _1131 = fma(_1115, _981, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _1133 = fma(_1097, _1075, _1125);
    float _1135 = fma(_1101, _1075, _1127);
    float _1137 = fma(_1119, _981, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _1139 = fma(_1099, _1075, _1129);
    float _1141 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _1143 = _1141 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _1147 = _1145 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _1149 = fma(_1123, _981, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _1155 = fma(_1143, _989, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _1157 = fma(_1147, _989, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1159 = fma(_1131, _1081, _1133);
    float _1161 = fma(_1153, _989, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _1163 = fma(_1137, _1081, _1139);
    float _1165 = fma(_1149, _1081, _1135);
    float _1167 = fma(_1155, _1069, _1159);
    float _1169 = _893 * _927;
    float _1171 = fma(_1157, _1069, _1163);
    float _1173 = fma(_1161, _1069, _1165);
    float _1175 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[111].x, _1167);
    float _1177 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[111].y, _1171);
    float _1179 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[111].z, _1173);
    bool _1181 = !_967;
    float _1199;
    if (!_1181)
    {
        float _1183 = in.m_45.x;
        float _1185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1187 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1189 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _1191 = _1189 * _1185;
        float _1193 = floor(_1191);
        float _1195 = -_1193;
        float _1197 = _1191 + _1195;
        _1199 = _1197;
        _1201 = true;
    }
    else
    {
        float _1203 = float(_77);
        float _1205 = 1.0 / _1203;
        float _1207 = _111 * _1205;
        _1199 = _1207;
    }
    _1201 = false;
    float _1209 = _1199;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1213 = _1211 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1215 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1217 = isnan(_1209);
    bool _1219 = _1215 || _1217;
    bool _1221 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1223 = _1219 || _1221;
    float _1225 = float(_1223);
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1229 = _1227 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1231 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1233 = isnan(_1209);
    bool _1235 = _1231 || _1233;
    bool _1237 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1239 = _1235 || _1237;
    float _1241 = float(_1239);
    float _1243 = 1.0 / _1213;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1245;
    float _1249 = -_1225;
    float _1251 = _1249 + 1.0;
    bool _1253 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1255 = isnan(_1209);
    bool _1257 = _1253 || _1255;
    bool _1259 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1261 = _1257 || _1259;
    float _1263 = float(_1261);
    bool _1265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1267 = _1241 * _1251;
    float _1269 = -_1241;
    float _1271 = _1269 + 1.0;
    float _1273 = 1.0 / _1229;
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1277 = _1275 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1279 = _1175 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1281 = _1179 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1283 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1287 = _1247 * _1243;
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1291 = _1209 + _1289;
    float _1293 = -_1263;
    float _1295 = _1293 + 1.0;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1299 = _1209 + _1297;
    float _1301 = fma(_1287, _1291, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1303 = _1225 * _1295;
    float _1305 = _1277 * _1273;
    float _1307 = _1301 * _1267;
    float _1309 = fma(_1305, _1299, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1311 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1307);
    float _1313 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1315 = fma(_1309, _1303, _1311);
    float _1317 = _1313 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1319 = fma(_1263, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1315);
    float _1321 = _1319 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_47.x = _1283;
    out.m_47.y = _1317;
    out.m_47.z = _1285;
    out.m_47.w = _1321;
    bool _1323 = !_1265;
    float _1341;
    if (!_1323)
    {
        float _1325 = in.m_45.x;
        float _1327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1329 = _1325 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1331 = fma(_1329, (*spvDescriptorSet0.vp_c9)._m0[11].z, _111);
        float _1333 = _1331 * _1327;
        float _1335 = floor(_1333);
        float _1337 = -_1335;
        float _1339 = _1333 + _1337;
        _1341 = _1339;
        _1343 = true;
    }
    else
    {
        float _1345 = float(_77);
        float _1347 = 1.0 / _1345;
        float _1349 = _111 * _1347;
        _1341 = _1349;
    }
    _1343 = false;
    float _1351 = _1341;
    float _1353 = as_type<float>(int(gl_VertexIndex));
    float _1355 = _581 * _139;
    float _1357 = _581 * _133;
    float _1359 = in.m_45.z;
    float _1361 = fma(_579, _137, _1355);
    float _1363 = _581 * _145;
    float _1365 = in.m_45.x;
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    int _1371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1373 = _1371 != 0;
    float _1375 = fma(_579, _131, _1357);
    float _1377 = fma(_579, _143, _1363);
    float _1379 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1381 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1379;
    float _1383 = 1.0 / _1369;
    float _1385 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1385;
    float _1389 = in.m_45.w;
    float _1391 = fma(_583, _141, _1361);
    float _1393 = fma(_583, _147, _1377);
    float _1395 = in.m_41.w;
    int _1397 = as_type<int>(_1353) & 1;
    bool _1399 = _1397 != 0;
    int _1401 = as_type<int>(_1353) & 2;
    bool _1403 = _1401 != 0;
    float _1405 = 1.0 / _1387;
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1409 = _1407 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1411;
    bool _1415 = _1359 > 0.5;
    float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1419 = _1417 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1421 = !_1399;
    float _1423 = _1421 ? (-0.5) : 0.5;
    float _1425 = fma(_583, _135, _1375);
    int _1427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1429 = _1427 != 0;
    float _1431 = 1.0 / _1381;
    float _1433 = -_1423;
    int _1435 = _1415 ? as_type<int>(_1433) : as_type<int>(_1423);
    float _1437 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1439 = _1351 + _1437;
    float _1441 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1423);
    bool _1443 = !_1429;
    float _1445 = _1443 ? _1423 : as_type<float>(_1435);
    float _1447 = _969 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1449 = in.m_39.w;
    float _1451 = 1.0 / _1409;
    bool _1453 = _1365 > 0.5;
    float _1455 = in.m_37.w;
    bool _1457 = _1389 > 0.5;
    float _1459 = 1.0 / _1419;
    float _1461 = _1393 + _1395;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1463;
    float _1467 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1471 = _1351 + _1469;
    float _1473 = 1.0 / _1413;
    float _1475 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1477 = _1351 + _1475;
    float _1479 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1481 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1479;
    float _1483 = _1471 * _1431;
    float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1487 = _1351 + _1485;
    float _1489 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1491 = _1489 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1493 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1495 = _1493 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1497 = _1391 + _1449;
    float _1499 = _1487 * _1405;
    float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1503 = _1351 + _1501;
    float _1505 = _1439 * _1451;
    out.m_33.x = _1467;
    float _1507 = _1503 * _1383;
    float _1509 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1511 = _1509 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    int _1513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1515 = _1513 != 0;
    float _1517 = _1477 * _1459;
    int _1519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1521 = _1519 != 0;
    float _1523 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1525 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1523;
    int _1527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1529 = _1527 != 0;
    float _1531 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1533 = _1351 + _1531;
    float _1535 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1535;
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1541 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1539;
    float _1543 = fma(_1491, _1507, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1545 = fma(_1511, _1507, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1547 = fma(_1495, _1507, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1551 = _1549 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1555 = _1553 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1557 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1559 = _1557 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1561 = _787 * _787;
    float _1563 = _1425 + _1455;
    float _1565 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1567 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1565;
    float _1569 = _1533 * _1473;
    float _1571 = fma(_1551, _1505, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1573 = fma(_1555, _1505, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1575 = fma(_1559, _1505, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1577 = fma(_789, _789, _1561);
    float _1579 = fma(_1465, _1483, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1581 = fma(_1567, _1483, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1583 = fma(_1481, _1483, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1585;
    float _1589 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1591 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1589;
    float _1593 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1595 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1593;
    float _1597 = fma(_791, _791, _1577);
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1601 = _1599 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1603 = fma(_1587, _1569, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1605 = fma(_1591, _1569, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1607 = (*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1609 = _1579;
    float _1611 = _1563;
    if (!_1373)
    {
        float _1613 = in.m_45.y;
        _1607 = _1613;
    }
    float _1615 = _1607;
    float _1617 = fma(_1595, _1569, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1619 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1621 = _1619 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1623 = rsqrt(_1597);
    bool _1625 = _1351 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1627 = isnan(_1351);
    bool _1629 = _1625 || _1627;
    bool _1631 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1633 = _1629 || _1631;
    float _1635 = float(_1633);
    float _1637 = fma(_1601, _1517, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1639 = fma(_1525, _1499, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1641 = fma(_1537, _1499, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1643 = fma(_1541, _1499, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1645 = fma(_1621, _1517, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1647 = _1169 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1649 = _1351 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1651 = isnan(_1351);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    float _1661 = -_1635;
    float _1663 = _1661 + 1.0;
    float _1665 = -_1423;
    int _1667 = _1453 ? as_type<int>(_1665) : as_type<int>(_1423);
    float _1669 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1671 = _1669 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1673 = _1647 * _1441;
    float _1675 = _1659 * _1663;
    float _1677 = -_1659;
    float _1679 = _1677 + 1.0;
    bool _1681 = !_1521;
    float _1683 = _1681 ? _1423 : as_type<float>(_1667);
    float _1685 = fma(_1671, _1517, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    bool _1687 = _1351 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1689 = isnan(_1351);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1695 = _1691 || _1693;
    float _1697 = float(_1695);
    float _1699 = _1623 * _789;
    bool _1701 = _1351 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1703 = isnan(_1351);
    bool _1705 = _1701 || _1703;
    bool _1707 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1709 = _1705 || _1707;
    float _1711 = float(_1709);
    float _1713 = _1623 * _787;
    float _1715 = _1623 * _791;
    bool _1717 = _1351 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1719 = isnan(_1351);
    bool _1721 = _1717 || _1719;
    bool _1723 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1725 = _1721 || _1723;
    float _1727 = float(_1725);
    float _1729 = -_1697;
    float _1731 = _1729 + 1.0;
    float _1733 = -_1711;
    float _1735 = _1733 + 1.0;
    bool _1737 = _1351 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1739 = isnan(_1351);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1745 = _1741 || _1743;
    float _1747 = float(_1745);
    float _1749 = _1711 * _1679;
    bool _1751 = _1351 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1753 = isnan(_1351);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1759 = _1755 || _1757;
    float _1761 = float(_1759);
    float _1763 = _1727 * _1731;
    float _1765 = _1697 * _1735;
    float _1767 = -_1727;
    float _1769 = _1767 + 1.0;
    float _1771 = _1697;
    if (!_1373)
    {
        _1771 = _1615;
    }
    float _1773 = _1771;
    float _1775 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1777 = _1715 * _1775;
    float _1779 = -_1761;
    float _1781 = _1779 + 1.0;
    float _1783 = _1761 * _1769;
    float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1787 = _1713 * _1785;
    float _1789 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1791 = -_1777;
    float _1793 = fma(_1699, _1789, _1791);
    float _1795 = _1773;
    float _1797 = _1615;
    if (_1373)
    {
        float _1799 = in.m_45.x;
        float _1801 = in.m_45.y;
        _1795 = _1799;
        _1797 = _1801;
    }
    float _1803 = _1795;
    float _1805 = _1797;
    float _1807 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1809 = _1699 * _1807;
    float _1811 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1813 = -_1787;
    float _1815 = fma(_1715, _1811, _1813);
    float _1817 = _1793 * _1793;
    float _1819 = _1747 * _1781;
    float _1821 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1823 = -_1809;
    float _1825 = fma(_1713, _1821, _1823);
    bool _1827 = !_1403;
    float _1829 = _1827 ? (-0.5) : 0.5;
    float _1831 = fma(_1815, _1815, _1817);
    float _1833 = _1581 * _1819;
    float _1835 = _1583 * _1819;
    float _1837 = -_1747;
    float _1839 = _1837 + 1.0;
    float _1841 = fma(_1825, _1825, _1831);
    float _1843 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1829);
    float _1845 = fma(_1839, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1835);
    float _1847 = _1447 * _1843;
    float _1849 = rsqrt(_1841);
    float _1851 = _1579 * _1819;
    float _1853 = _1819;
    if (!_1373)
    {
        _1609 = _1359;
    }
    float _1855 = _1609;
    float _1857 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1859 = _1855;
    if (!_1373)
    {
        _1853 = _1359;
    }
    float _1861 = _1853;
    float _1863 = _1803 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1865 = _1861;
    if (_1373)
    {
        _1859 = _1805;
    }
    float _1867 = _1859;
    if (_1373)
    {
        _1865 = _1805;
    }
    float _1869 = _1865;
    bool _1871 = _1805 > 0.5;
    float _1873 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1875 = fma(_1869, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1857);
    float _1877 = _1825 * _1849;
    float _1879 = fma(_1803, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1873);
    float _1881 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1883 = fma(_1839, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1851);
    float _1885 = _1793 * _1849;
    float _1887 = fma(_1839, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1833);
    float _1889 = -_1881;
    float _1891 = fma(_1863, 2.0, _1889);
    float _1893 = _1815 * _1849;
    float _1895 = _1699 * _1885;
    float _1897 = fma(_1543, _1783, _1883);
    float _1899 = _1847 * _1713;
    float _1901 = _1847 * _1699;
    float _1903 = -_1895;
    float _1905 = fma(_1713, _1893, _1903);
    float _1907 = _1713 * _1877;
    float _1909 = _1847 * _1715;
    float _1911 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1913 = fma(_1673, _1893, _1901);
    float _1915 = -_1907;
    float _1917 = fma(_1715, _1885, _1915);
    float _1919 = fma(_1673, _1877, _1909);
    float _1921 = fma(_1545, _1783, _1887);
    float _1923 = fma(_1911, _1917, _1913);
    float _1925 = fma(_1911, _1905, _1919);
    float _1927 = fma(_1547, _1783, _1845);
    float _1929 = _1867 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1931 = _1497 + _1923;
    float _1933 = _1461 + _1925;
    float _1935 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1937 = -_1829;
    int _1939 = _1457 ? as_type<int>(_1937) : as_type<int>(_1829);
    float _1941 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1943 = _1931 + _1941;
    float _1945 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1947 = _1933 + _1945;
    float _1949 = -_1829;
    int _1951 = _1871 ? as_type<int>(_1949) : as_type<int>(_1829);
    float _1953 = fma(_1929, -2.0, _1935);
    bool _1955 = !_1515;
    float _1957 = _1955 ? _1829 : as_type<float>(_1939);
    float _1959 = _1947 * _1947;
    bool _1961 = !_1529;
    float _1963 = _1961 ? _1829 : as_type<float>(_1951);
    float _1965 = fma(_1641, _1763, _1921);
    float _1967 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1969 = fma(_1943, _1943, _1959);
    float _1971 = fma(_1639, _1763, _1897);
    float _1973 = fma(_1573, _1765, _1965);
    float _1975 = _1715 * _1893;
    float _1977 = fma(_1643, _1763, _1927);
    float _1979 = fma(_1571, _1765, _1971);
    float _1981 = fma(_1673, _1885, _1899);
    float _1983 = sqrt(_1969);
    float _1985 = -_1975;
    float _1987 = fma(_1699, _1877, _1985);
    float _1989 = fma(_1575, _1765, _1977);
    float _1991 = fma(_1603, _1749, _1979);
    float _1993 = fma(_1605, _1749, _1973);
    float _1995 = fma(_1911, _1987, _1981);
    float _1997 = fma(_1617, _1749, _1989);
    float _1999 = -_111;
    float _2001 = fma(_1999, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1891);
    float _2003 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2005 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1879);
    float _2007 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1875);
    float _2009 = fma(_1637, _1675, _1991);
    float _2011 = fma(_1645, _1675, _1993);
    float _2013 = _1563 + _1995;
    float _2015 = _1967 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2017 = _1445 + 0.5;
    bool _2019 = _1983 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2021 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1953);
    float _2023 = _1957 + (-0.5);
    float _2025 = fma(_1685, _1675, _1997);
    float _2027 = fma(_1635, (*spvDescriptorSet0.vp_c9)._m0[129].x, _2009);
    float _2029 = fma(_1635, (*spvDescriptorSet0.vp_c9)._m0[129].y, _2011);
    float _2031 = fma(_2015, _2017, _2001);
    float _2033 = fma(_1635, (*spvDescriptorSet0.vp_c9)._m0[129].z, _2025);
    float _2035 = _2003 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2037 = -_2035;
    float _2039 = -_2021;
    float _2041 = fma(_2037, _2023, _2039);
    float _2043 = _1931;
    float _2045 = _1933;
    if (!_2019)
    {
        _1611 = _2013;
    }
    float _2047 = _1611;
    bool _2049 = !_2019;
    float _2051 = _2047;
    if (!_2049)
    {
        float _2053 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2055 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2057 = _1983 + _2055;
        float _2059 = _2013 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2061 = rsqrt(_1969);
        float _2063 = _2057 * _2053;
        float _2065 = _2063 * 0.15915493667125701904296875;
        float _2067 = _2065 * 6.283185482025146484375;
        float _2069 = cos(_2067);
        float _2071 = _2065 * 6.283185482025146484375;
        float _2073 = sin(_2071);
        float _2075 = _2069 + (-1.0);
        float _2077 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2079 = fma(_2073, _2059, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2081 = fma(_2013, _2069, _2077);
        float _2083 = _2061 * _2079;
        float _2085 = fma(_1943, _2083, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2087 = fma(_1947, _2083, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2051 = _2081;
        _2043 = _2085;
        _2045 = _2087;
    }
    float _2089 = _2051;
    float _2091 = _2043;
    float _2093 = _2045;
    float _2095 = _2089 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2097 = _2089 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2099 = _2089 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2101 = _2089 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2103 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2095);
    float _2105 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2097);
    float _2107 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2099);
    float _2109 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2101);
    float _2111 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2103);
    float _2113 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2105);
    float _2115 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2107);
    float _2117 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2119 = _2111 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2121 = _2113 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2123 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2109);
    float _2125 = _2115 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2127 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2129 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2131 = -_2007;
    float _2133 = _2131 + 1.0;
    float _2135 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2137 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2127);
    float _2139 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2129);
    float _2141 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2143 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2145 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2137);
    float _2147 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2139);
    float _2149 = _2123 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2151 = fma(_1957, _2133, _2041);
    float _2153 = _2029 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2155 = _1683 + 0.5;
    float _2157 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2141);
    float _2159 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2143);
    float _2161 = -_1963;
    float _2163 = _2161 + 0.5;
    float _2165 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2145);
    float _2167 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2147);
    float _2169 = -_2005;
    float _2171 = _2169 + 1.0;
    float _2173 = _2027 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2175 = _2153 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2177 = _2155 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2179 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2157);
    float _2181 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2159);
    float _2183 = _2163 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2185 = _2033 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2187 = _2165 + _2167;
    float _2189 = -_2171;
    float _2191 = fma(_1445, _2189, _2031);
    float _2193 = _2173 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2195 = _2177 * _2117;
    float _2197 = _2183 * _2135;
    float _2199 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2179);
    float _2201 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2181);
    float _2203 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2205 = _2185 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2207 = _2187 * 0.5;
    out.m_52.x = _2195;
    out.m_52.y = _2197;
    out.m_52.z = _2191;
    out.m_52.w = _2151;
    out.m_54.x = _2193;
    out.m_54.y = _2175;
    out.m_54.z = _2205;
    out.m_54.w = _2203;
    out.m_56.y = _2089;
    out.gl_Position.x = _2199;
    out.gl_Position.y = _2201;
    out.gl_Position.z = _2165;
    out.gl_Position.w = _2167;
    out.m_58.z = _2207;
    out.m_58.w = _2167;
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
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1343 = false;
    bool _1201 = false;
    bool _917 = false;
    bool _815 = false;
    bool _655 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _2264 = as_type<float>(_93);
        out.gl_Position.z = _2264;
    }
    if (!_81)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _97 = in.m_35.w;
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
        out.m_33.x = 0.0;
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
        float _2333 = as_type<float>(_129);
        out.gl_Position.z = _2333;
    }
    if (_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_37.x;
    float _133 = in.m_37.y;
    float _135 = in.m_37.z;
    float _137 = in.m_39.x;
    float _139 = in.m_39.y;
    float _141 = in.m_39.z;
    float _143 = in.m_41.x;
    float _145 = in.m_41.y;
    float _147 = in.m_41.z;
    float _149 = _131 * _131;
    float _151 = _133 * _133;
    float _153 = fma(_137, _137, _149);
    float _155 = fma(_139, _139, _151);
    float _157 = fma(_143, _143, _153);
    float _159 = _135 * _135;
    float _161 = fma(_145, _145, _155);
    float _163 = sqrt(_157);
    float _165 = fma(_141, _141, _159);
    float _167 = fma(_147, _147, _165);
    float _169 = sqrt(_161);
    float _171 = sqrt(_167);
    bool _173 = _163 > 0.0;
    bool _175 = _169 > 0.0;
    bool _177 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _179 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _181 = _177 || _179;
    bool _183 = isnan(1.0);
    bool _185 = _181 || _183;
    float _187 = 0.0;
    float _189 = _167;
    if (_173)
    {
        float _191 = rsqrt(_157);
        _187 = _191;
    }
    float _193 = _187;
    bool _195 = _171 > 0.0;
    float _197 = 0.0;
    float _199 = 0.0;
    if (!_173)
    {
        _197 = 0.0;
        _199 = 0.0;
    }
    float _201 = _197;
    float _203 = _199;
    float _205 = in.m_35.x;
    float _207 = in.m_35.y;
    float _209 = in.m_35.z;
    float _211 = 0.0;
    float _213 = _201;
    float _215 = _203;
    if (!_173)
    {
        _211 = 0.0;
    }
    float _217 = _211;
    float _219 = 0.0;
    float _221 = 0.0;
    float _223 = _217;
    if (!_175)
    {
        _219 = 0.0;
        _221 = 0.0;
    }
    float _225 = _219;
    float _227 = _221;
    float _229 = 0.0;
    float _231 = _227;
    float _233 = _225;
    if (!_175)
    {
        _229 = 0.0;
    }
    float _235 = _229;
    float _237 = 0.0;
    float _239 = _235;
    if (_175)
    {
        float _241 = rsqrt(_161);
        _237 = _241;
    }
    float _243 = _237;
    float _245 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _247 = 0.0;
    float _249 = 0.0;
    float _251 = _245;
    if (!_195)
    {
        _247 = 0.0;
        _249 = 0.0;
    }
    float _253 = _247;
    float _255 = _249;
    float _257 = 0.0;
    float _259 = _253;
    float _261 = _255;
    if (!_195)
    {
        _257 = 0.0;
    }
    float _263 = _257;
    float _265 = 0.0;
    float _267 = _263;
    if (_195)
    {
        float _269 = rsqrt(_167);
        _265 = _269;
    }
    float _271 = _265;
    if (_173)
    {
        float _273 = _193 * _137;
        _223 = _273;
    }
    float _275 = _223;
    if (_173)
    {
        float _277 = _193 * _131;
        _213 = _277;
    }
    float _279 = _213;
    if (_173)
    {
        float _281 = _193 * _143;
        _215 = _281;
    }
    float _283 = _215;
    if (_175)
    {
        float _285 = _243 * _139;
        _231 = _285;
    }
    float _287 = _231;
    if (!_185)
    {
        float _289 = _245 * _245;
        float _291 = _289 * 0.5;
        _189 = _291;
    }
    float _293 = _189;
    float _295 = _293;
    if (_175)
    {
        float _297 = _243 * _133;
        _233 = _297;
    }
    float _299 = _233;
    if (_175)
    {
        float _301 = _243 * _145;
        _239 = _301;
    }
    float _303 = _239;
    if (!_185)
    {
        float _305 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _295 = _305;
    }
    float _307 = _295;
    float _309 = _307;
    if (_195)
    {
        float _311 = _271 * _141;
        _267 = _311;
    }
    float _313 = _267;
    if (_195)
    {
        float _315 = _271 * _135;
        _259 = _315;
    }
    float _317 = _259;
    if (_195)
    {
        float _319 = _271 * _147;
        _261 = _319;
    }
    float _321 = _261;
    bool _323 = !_185;
    float _325 = _209;
    if (!_323)
    {
        float _327 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _329 = log2(_327);
        float _331 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _333 = _331 + 1.0;
        float _335 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _337 = _245 * _329;
        float _339 = exp2(_337);
        float _341 = _335 * 0.693147182464599609375;
        float _343 = 1.0 / _341;
        float _345 = 1.0 / _333;
        float _347 = _339 + (-1.0);
        float _349 = -_347;
        float _351 = fma(_349, _343, _245);
        float _353 = _351 * _345;
        float _355 = _353 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _309 = _355;
    }
    float _357 = _309;
    float _359 = _357 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _361 = !_185;
    float _363 = _359;
    float _365 = _357;
    if (!_361)
    {
        float _367 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _369 = log2(_367);
        float _371 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _373 = _371 + 1.0;
        float _375 = 1.0 / _373;
        float _377 = _245 * _369;
        float _379 = exp2(_377);
        float _381 = -_379;
        float _383 = _381 + 1.0;
        float _385 = _383 * _375;
        _251 = _385;
    }
    float _387 = _251;
    float _389 = _357 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _391 = _359 * _279;
    float _393 = _359 * _299;
    float _395 = _359 * _317;
    if (!_185)
    {
        float _397 = _111 * _111;
        float _399 = _397 * 0.5;
        _363 = _399;
    }
    float _401 = _363;
    float _403 = fma(_389, _275, _391);
    float _405 = fma(_389, _287, _393);
    float _407 = fma(_389, _313, _395);
    float _409 = _357 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_185)
    {
        float _411 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _365 = _411;
    }
    float _413 = _365;
    bool _415 = !_185;
    float _417 = _413;
    if (!_415)
    {
        float _419 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _421 = log2(_419);
        float _423 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _425 = _423 + 1.0;
        float _427 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _429 = _111 * _421;
        float _431 = exp2(_429);
        float _433 = _427 * 0.693147182464599609375;
        float _435 = 1.0 / _433;
        float _437 = 1.0 / _425;
        float _439 = _431 + (-1.0);
        float _441 = -_439;
        float _443 = fma(_441, _435, _111);
        float _445 = _443 * _437;
        float _447 = _445 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _417 = _447;
    }
    float _449 = _417;
    float _451 = _449 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _453 = fma(_409, _283, _403);
    float _455 = fma(_409, _303, _405);
    float _457 = fma(_409, _321, _407);
    float _459 = _449 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _461 = _451 * _299;
    float _463 = _449 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _465 = _451 * _279;
    float _467 = _451 * _317;
    float _469 = fma(_459, _287, _461);
    float _471 = _449;
    if (!_185)
    {
        _471 = _111;
    }
    float _473 = _471;
    bool _475 = !_185;
    float _477 = _473;
    if (!_475)
    {
        float _479 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _481 = log2(_479);
        float _483 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _485 = _483 + 1.0;
        float _487 = 1.0 / _485;
        float _489 = _111 * _481;
        float _491 = exp2(_489);
        float _493 = -_491;
        float _495 = _493 + 1.0;
        float _497 = _495 * _487;
        _477 = _497;
    }
    float _499 = _477;
    float _501 = fma(_459, _275, _465);
    float _503 = fma(_463, _303, _469);
    float _505 = fma(_459, _313, _467);
    float _507 = fma(_387, _207, _455);
    float _509 = fma(_463, _283, _501);
    float _511 = fma(_499, _207, _503);
    float _513 = fma(_463, _321, _505);
    float _515 = fma(_387, _205, _453);
    float _517 = fma(_499, _205, _509);
    float _519 = -_511;
    float _521 = _507 + _519;
    float _523 = fma(_387, _209, _457);
    float _525 = fma(_499, _209, _513);
    float _527 = -_517;
    float _529 = _515 + _527;
    float _531 = _521 * _521;
    float _533 = in.m_43.w;
    float _535 = -_525;
    float _537 = _523 + _535;
    float _539 = _521 * _139;
    float _541 = fma(_529, _529, _531);
    float _543 = _521 * _133;
    float _545 = _521 * _145;
    float _547 = fma(_529, _137, _539);
    float _549 = fma(_537, _537, _541);
    float _551 = fma(_529, _131, _543);
    float _553 = in.m_30.x;
    float _555 = in.m_30.y;
    float _557 = in.m_30.z;
    float _559 = fma(_529, _143, _545);
    float _561 = fma(_537, _141, _547);
    float _563 = sqrt(_549);
    float _565 = fma(_537, _135, _551);
    float _567 = fma(_537, _147, _559);
    bool _569 = _563 >= 9.9999999747524270787835121154785e-07;
    bool _571 = isnan(_563);
    bool _573 = _569 || _571;
    bool _575 = isnan(9.9999999747524270787835121154785e-07);
    bool _577 = _573 || _575;
    float _579 = fma(_515, _533, _553);
    float _581 = fma(_507, _533, _555);
    float _583 = fma(_523, _533, _557);
    float _585 = _551;
    float _587 = _567;
    float _589 = _565;
    float _591 = _567;
    if (_577)
    {
        _585 = _561;
    }
    float _593 = _585;
    float _595 = _593;
    float _597 = _593;
    if (!_577)
    {
        bool _599 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _601 = !_599;
        if (!_601)
        {
            float _603 = _299 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _605 = _279 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _607 = _317 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _609 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[16].x, _603);
            float _611 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[16].x, _605);
            float _613 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[16].x, _607);
            float _615 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[16].z, _609);
            float _617 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[16].z, _611);
            float _619 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[16].z, _613);
            float _621 = _615 * _133;
            float _623 = _615 * _139;
            float _625 = _615 * _145;
            float _627 = fma(_617, _131, _621);
            float _629 = fma(_617, _137, _623);
            float _631 = fma(_617, _143, _625);
            float _633 = fma(_619, _135, _627);
            float _635 = fma(_619, _141, _629);
            float _637 = fma(_619, _147, _631);
            float _639 = _633 * _633;
            float _641 = fma(_635, _635, _639);
            float _643 = fma(_637, _637, _641);
            float _645 = rsqrt(_643);
            float _647 = _645 * 9.9999999747524270787835121154785e-07;
            float _649 = _635 * _647;
            float _651 = _633 * _647;
            float _653 = _637 * _647;
            _589 = _651;
            _597 = _649;
            _591 = _653;
            _655 = true;
        }
        else
        {
            float _657 = _207 * _207;
            float _659 = fma(_205, _205, _657);
            float _661 = fma(_209, _209, _659);
            float _663 = sqrt(_661);
            bool _665 = _663 >= 9.9999999747524270787835121154785e-07;
            bool _667 = isnan(_663);
            bool _669 = _665 || _667;
            bool _671 = isnan(9.9999999747524270787835121154785e-07);
            bool _673 = _669 || _671;
            if (!_673)
            {
                float _675 = _555 * _555;
                float _677 = fma(_553, _553, _675);
                float _679 = fma(_557, _557, _677);
                float _681 = sqrt(_679);
                bool _683 = _681 >= 9.9999999747524270787835121154785e-07;
                bool _685 = isnan(_681);
                bool _687 = _683 || _685;
                bool _689 = isnan(9.9999999747524270787835121154785e-07);
                bool _691 = _687 || _689;
                float _693 = _161;
                float _695 = _677;
                if (!_691)
                {
                    float _697 = rsqrt(_161);
                    _693 = _697;
                }
                float _699 = _693;
                if (!_691)
                {
                    float _701 = _699 * 9.9999999747524270787835121154785e-07;
                    _325 = _701;
                }
                float _703 = _325;
                if (!_691)
                {
                    float _705 = _139 * _703;
                    _595 = _705;
                }
                float _707 = _595;
                _597 = _707;
                if (!_691)
                {
                    float _709 = _133 * _703;
                    _695 = _709;
                }
                float _711 = _695;
                _589 = _711;
                if (!_691)
                {
                    float _713 = _145 * _703;
                    _587 = _713;
                }
                float _715 = _587;
                bool _717 = !_691;
                _591 = _715;
                _655 = _717;
                if (!_655)
                {
                    float _719 = _133 * _555;
                    float _721 = _139 * _555;
                    float _723 = _145 * _555;
                    float _725 = fma(_131, _553, _719);
                    float _727 = fma(_137, _553, _721);
                    float _729 = fma(_143, _553, _723);
                    float _731 = fma(_135, _557, _725);
                    float _733 = fma(_141, _557, _727);
                    float _735 = fma(_147, _557, _729);
                    float _737 = _731 * _731;
                    float _739 = fma(_733, _733, _737);
                    float _741 = fma(_735, _735, _739);
                    float _743 = rsqrt(_741);
                    float _745 = _743 * 9.9999999747524270787835121154785e-07;
                    float _747 = _733 * _745;
                    float _749 = _731 * _745;
                    float _751 = _735 * _745;
                    _589 = _749;
                    _597 = _747;
                    _591 = _751;
                    _655 = true;
                }
            }
            else
            {
                float _753 = _133 * _207;
                float _755 = _139 * _207;
                float _757 = _145 * _207;
                float _759 = fma(_131, _205, _753);
                float _761 = fma(_137, _205, _755);
                float _763 = fma(_143, _205, _757);
                float _765 = fma(_135, _209, _759);
                float _767 = fma(_141, _209, _761);
                float _769 = fma(_147, _209, _763);
                float _771 = _765 * _765;
                float _773 = fma(_767, _767, _771);
                float _775 = fma(_769, _769, _773);
                float _777 = rsqrt(_775);
                float _779 = _777 * 9.9999999747524270787835121154785e-07;
                float _781 = _767 * _779;
                float _783 = _765 * _779;
                float _785 = _769 * _779;
                _589 = _783;
                _597 = _781;
                _591 = _785;
            }
        }
    }
    _655 = false;
    float _787 = _589;
    float _789 = _597;
    float _791 = _591;
    bool _793 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _795 = !_793;
    float _813;
    if (!_795)
    {
        float _797 = in.m_45.x;
        float _799 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _801 = _797 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _803 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _805 = _803 * _799;
        float _807 = floor(_805);
        float _809 = -_807;
        float _811 = _805 + _809;
        _813 = _811;
        _815 = true;
    }
    else
    {
        float _817 = float(_77);
        float _819 = 1.0 / _817;
        float _821 = _111 * _819;
        _813 = _821;
    }
    _815 = false;
    float _823 = _813;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _827 = _823 + _825;
    bool _829 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _831 = isnan(_823);
    bool _833 = _829 || _831;
    bool _835 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _837 = _833 || _835;
    float _839 = float(_837);
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _841;
    float _845 = -_839;
    float _847 = _845 + 1.0;
    bool _849 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _851 = isnan(_823);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _857 = _853 || _855;
    float _859 = float(_857);
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _861;
    bool _865 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _867 = 1.0 / _843;
    float _869 = _859 * _847;
    float _871 = -_859;
    float _873 = _871 + 1.0;
    float _875 = _827 * _867;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _877;
    float _881 = fma(_863, _875, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _883 = fma(_879, _875, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _885 = _881 * _869;
    float _887 = _883 * _869;
    float _889 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[143].x, _885);
    float _891 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[143].y, _887);
    float _893 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[144].x, _889);
    float _895 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[144].y, _891);
    bool _897 = !_865;
    float _915;
    if (!_897)
    {
        float _899 = in.m_45.x;
        float _901 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _903 = _899 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _905 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[11].x, _111);
        float _907 = _905 * _901;
        float _909 = floor(_907);
        float _911 = -_909;
        float _913 = _907 + _911;
        _915 = _913;
        _917 = true;
    }
    else
    {
        float _919 = float(_77);
        float _921 = 1.0 / _919;
        float _923 = _111 * _921;
        _915 = _923;
    }
    _917 = false;
    float _925 = _915;
    float _927 = in.m_43.x;
    float _929 = in.m_43.y;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _933 = _925 + _931;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _935;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _943;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _951 = 1.0 / _937;
    bool _953 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _955 = isnan(_925);
    bool _957 = _953 || _955;
    bool _959 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _961 = _957 || _959;
    float _963 = float(_961);
    float _965 = 1.0 / _949;
    bool _967 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _969 = _895 * _929;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _973 = _925 + _971;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _977 = _925 + _975;
    float _979 = 1.0 / _941;
    float _981 = _933 * _951;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _983;
    float _987 = 1.0 / _945;
    float _989 = _973 * _979;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _993 = _925 + _991;
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _995;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _999;
    float _1003 = _993 * _965;
    bool _1005 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _1007 = isnan(_925);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _1013 = _1009 || _1011;
    float _1015 = float(_1013);
    float _1017 = _977 * _987;
    bool _1019 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1021 = isnan(_925);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1027 = _1023 || _1025;
    float _1029 = float(_1027);
    bool _1031 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _1033 = isnan(_925);
    bool _1035 = _1031 || _1033;
    bool _1037 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _1039 = _1035 || _1037;
    float _1041 = float(_1039);
    float _1043 = -_1015;
    float _1045 = _1043 + 1.0;
    float _1047 = fma(_985, _1017, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1049 = fma(_997, _1017, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1051 = fma(_1001, _1017, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1053 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1055 = isnan(_925);
    bool _1057 = _1053 || _1055;
    bool _1059 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1061 = _1057 || _1059;
    float _1063 = float(_1061);
    float _1065 = -_1029;
    float _1067 = _1065 + 1.0;
    float _1069 = _1041 * _1045;
    float _1071 = -_1041;
    float _1073 = _1071 + 1.0;
    float _1075 = _1063 * _1067;
    float _1077 = -_1063;
    float _1079 = _1077 + 1.0;
    float _1081 = _1029 * _1073;
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1085 = _1083 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1089 = _1087 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1091 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1093 = _1091 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1095 = _963 * _1079;
    float _1097 = fma(_1085, _1003, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1099 = fma(_1089, _1003, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1101 = fma(_1093, _1003, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1103 = _1049 * _1095;
    float _1105 = _1047 * _1095;
    float _1107 = _1051 * _1095;
    float _1109 = -_963;
    float _1111 = _1109 + 1.0;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _1113;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _1117;
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _1121;
    float _1125 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1105);
    float _1127 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1107);
    float _1129 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1103);
    float _1131 = fma(_1115, _981, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _1133 = fma(_1097, _1075, _1125);
    float _1135 = fma(_1101, _1075, _1127);
    float _1137 = fma(_1119, _981, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _1139 = fma(_1099, _1075, _1129);
    float _1141 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _1143 = _1141 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _1147 = _1145 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _1149 = fma(_1123, _981, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _1155 = fma(_1143, _989, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _1157 = fma(_1147, _989, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1159 = fma(_1131, _1081, _1133);
    float _1161 = fma(_1153, _989, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _1163 = fma(_1137, _1081, _1139);
    float _1165 = fma(_1149, _1081, _1135);
    float _1167 = fma(_1155, _1069, _1159);
    float _1169 = _893 * _927;
    float _1171 = fma(_1157, _1069, _1163);
    float _1173 = fma(_1161, _1069, _1165);
    float _1175 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[111].x, _1167);
    float _1177 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[111].y, _1171);
    float _1179 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[111].z, _1173);
    bool _1181 = !_967;
    float _1199;
    if (!_1181)
    {
        float _1183 = in.m_45.x;
        float _1185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1187 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1189 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _1191 = _1189 * _1185;
        float _1193 = floor(_1191);
        float _1195 = -_1193;
        float _1197 = _1191 + _1195;
        _1199 = _1197;
        _1201 = true;
    }
    else
    {
        float _1203 = float(_77);
        float _1205 = 1.0 / _1203;
        float _1207 = _111 * _1205;
        _1199 = _1207;
    }
    _1201 = false;
    float _1209 = _1199;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1213 = _1211 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1215 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1217 = isnan(_1209);
    bool _1219 = _1215 || _1217;
    bool _1221 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1223 = _1219 || _1221;
    float _1225 = float(_1223);
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1229 = _1227 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1231 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1233 = isnan(_1209);
    bool _1235 = _1231 || _1233;
    bool _1237 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1239 = _1235 || _1237;
    float _1241 = float(_1239);
    float _1243 = 1.0 / _1213;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1245;
    float _1249 = -_1225;
    float _1251 = _1249 + 1.0;
    bool _1253 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1255 = isnan(_1209);
    bool _1257 = _1253 || _1255;
    bool _1259 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1261 = _1257 || _1259;
    float _1263 = float(_1261);
    bool _1265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1267 = _1241 * _1251;
    float _1269 = -_1241;
    float _1271 = _1269 + 1.0;
    float _1273 = 1.0 / _1229;
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1277 = _1275 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1279 = _1175 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1281 = _1179 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1283 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1287 = _1247 * _1243;
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1291 = _1209 + _1289;
    float _1293 = -_1263;
    float _1295 = _1293 + 1.0;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1299 = _1209 + _1297;
    float _1301 = fma(_1287, _1291, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1303 = _1225 * _1295;
    float _1305 = _1277 * _1273;
    float _1307 = _1301 * _1267;
    float _1309 = fma(_1305, _1299, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1311 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1307);
    float _1313 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1315 = fma(_1309, _1303, _1311);
    float _1317 = _1313 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1319 = fma(_1263, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1315);
    float _1321 = _1319 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_47.x = _1283;
    out.m_47.y = _1317;
    out.m_47.z = _1285;
    out.m_47.w = _1321;
    bool _1323 = !_1265;
    float _1341;
    if (!_1323)
    {
        float _1325 = in.m_45.x;
        float _1327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1329 = _1325 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1331 = fma(_1329, (*spvDescriptorSet0.vp_c9)._m0[11].z, _111);
        float _1333 = _1331 * _1327;
        float _1335 = floor(_1333);
        float _1337 = -_1335;
        float _1339 = _1333 + _1337;
        _1341 = _1339;
        _1343 = true;
    }
    else
    {
        float _1345 = float(_77);
        float _1347 = 1.0 / _1345;
        float _1349 = _111 * _1347;
        _1341 = _1349;
    }
    _1343 = false;
    float _1351 = _1341;
    float _1353 = as_type<float>(int(gl_VertexIndex));
    float _1355 = _581 * _139;
    float _1357 = _581 * _133;
    float _1359 = in.m_45.z;
    float _1361 = fma(_579, _137, _1355);
    float _1363 = _581 * _145;
    float _1365 = in.m_45.x;
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    int _1371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1373 = _1371 != 0;
    float _1375 = fma(_579, _131, _1357);
    float _1377 = fma(_579, _143, _1363);
    float _1379 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1381 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1379;
    float _1383 = 1.0 / _1369;
    float _1385 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1385;
    float _1389 = in.m_45.w;
    float _1391 = fma(_583, _141, _1361);
    float _1393 = fma(_583, _147, _1377);
    float _1395 = in.m_41.w;
    int _1397 = as_type<int>(_1353) & 1;
    bool _1399 = _1397 != 0;
    int _1401 = as_type<int>(_1353) & 2;
    bool _1403 = _1401 != 0;
    float _1405 = 1.0 / _1387;
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1409 = _1407 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1411;
    bool _1415 = _1359 > 0.5;
    float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1419 = _1417 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1421 = !_1399;
    float _1423 = _1421 ? (-0.5) : 0.5;
    float _1425 = fma(_583, _135, _1375);
    int _1427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1429 = _1427 != 0;
    float _1431 = 1.0 / _1381;
    float _1433 = -_1423;
    int _1435 = _1415 ? as_type<int>(_1433) : as_type<int>(_1423);
    float _1437 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1439 = _1351 + _1437;
    float _1441 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1423);
    bool _1443 = !_1429;
    float _1445 = _1443 ? _1423 : as_type<float>(_1435);
    float _1447 = _969 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1449 = in.m_39.w;
    float _1451 = 1.0 / _1409;
    bool _1453 = _1365 > 0.5;
    float _1455 = in.m_37.w;
    bool _1457 = _1389 > 0.5;
    float _1459 = 1.0 / _1419;
    float _1461 = _1393 + _1395;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1463;
    float _1467 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1471 = _1351 + _1469;
    float _1473 = 1.0 / _1413;
    float _1475 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1477 = _1351 + _1475;
    float _1479 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1481 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1479;
    float _1483 = _1471 * _1431;
    float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1487 = _1351 + _1485;
    float _1489 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1491 = _1489 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1493 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1495 = _1493 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1497 = _1391 + _1449;
    float _1499 = _1487 * _1405;
    float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1503 = _1351 + _1501;
    float _1505 = _1439 * _1451;
    out.m_33.x = _1467;
    float _1507 = _1503 * _1383;
    float _1509 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1511 = _1509 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    int _1513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1515 = _1513 != 0;
    float _1517 = _1477 * _1459;
    int _1519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1521 = _1519 != 0;
    float _1523 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1525 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1523;
    int _1527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1529 = _1527 != 0;
    float _1531 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1533 = _1351 + _1531;
    float _1535 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1535;
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1541 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1539;
    float _1543 = fma(_1491, _1507, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1545 = fma(_1511, _1507, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1547 = fma(_1495, _1507, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1551 = _1549 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1555 = _1553 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1557 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1559 = _1557 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1561 = _787 * _787;
    float _1563 = _1425 + _1455;
    float _1565 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1567 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1565;
    float _1569 = _1533 * _1473;
    float _1571 = fma(_1551, _1505, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1573 = fma(_1555, _1505, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1575 = fma(_1559, _1505, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1577 = fma(_789, _789, _1561);
    float _1579 = fma(_1465, _1483, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1581 = fma(_1567, _1483, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1583 = fma(_1481, _1483, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1585;
    float _1589 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1591 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1589;
    float _1593 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1595 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1593;
    float _1597 = fma(_791, _791, _1577);
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1601 = _1599 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1603 = fma(_1587, _1569, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1605 = fma(_1591, _1569, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1607 = (*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1609 = _1579;
    float _1611 = _1563;
    if (!_1373)
    {
        float _1613 = in.m_45.y;
        _1607 = _1613;
    }
    float _1615 = _1607;
    float _1617 = fma(_1595, _1569, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1619 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1621 = _1619 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1623 = rsqrt(_1597);
    bool _1625 = _1351 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1627 = isnan(_1351);
    bool _1629 = _1625 || _1627;
    bool _1631 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1633 = _1629 || _1631;
    float _1635 = float(_1633);
    float _1637 = fma(_1601, _1517, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1639 = fma(_1525, _1499, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1641 = fma(_1537, _1499, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1643 = fma(_1541, _1499, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1645 = fma(_1621, _1517, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1647 = _1169 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1649 = _1351 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1651 = isnan(_1351);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    float _1661 = -_1635;
    float _1663 = _1661 + 1.0;
    float _1665 = -_1423;
    int _1667 = _1453 ? as_type<int>(_1665) : as_type<int>(_1423);
    float _1669 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1671 = _1669 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1673 = _1647 * _1441;
    float _1675 = _1659 * _1663;
    float _1677 = -_1659;
    float _1679 = _1677 + 1.0;
    bool _1681 = !_1521;
    float _1683 = _1681 ? _1423 : as_type<float>(_1667);
    float _1685 = fma(_1671, _1517, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    bool _1687 = _1351 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1689 = isnan(_1351);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1695 = _1691 || _1693;
    float _1697 = float(_1695);
    float _1699 = _1623 * _789;
    bool _1701 = _1351 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1703 = isnan(_1351);
    bool _1705 = _1701 || _1703;
    bool _1707 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1709 = _1705 || _1707;
    float _1711 = float(_1709);
    float _1713 = _1623 * _787;
    float _1715 = _1623 * _791;
    bool _1717 = _1351 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1719 = isnan(_1351);
    bool _1721 = _1717 || _1719;
    bool _1723 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1725 = _1721 || _1723;
    float _1727 = float(_1725);
    float _1729 = -_1697;
    float _1731 = _1729 + 1.0;
    float _1733 = -_1711;
    float _1735 = _1733 + 1.0;
    bool _1737 = _1351 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1739 = isnan(_1351);
    bool _1741 = _1737 || _1739;
    bool _1743 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1745 = _1741 || _1743;
    float _1747 = float(_1745);
    float _1749 = _1711 * _1679;
    bool _1751 = _1351 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1753 = isnan(_1351);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1759 = _1755 || _1757;
    float _1761 = float(_1759);
    float _1763 = _1727 * _1731;
    float _1765 = _1697 * _1735;
    float _1767 = -_1727;
    float _1769 = _1767 + 1.0;
    float _1771 = _1697;
    if (!_1373)
    {
        _1771 = _1615;
    }
    float _1773 = _1771;
    float _1775 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1777 = _1715 * _1775;
    float _1779 = -_1761;
    float _1781 = _1779 + 1.0;
    float _1783 = _1761 * _1769;
    float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1787 = _1713 * _1785;
    float _1789 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1791 = -_1777;
    float _1793 = fma(_1699, _1789, _1791);
    float _1795 = _1773;
    float _1797 = _1615;
    if (_1373)
    {
        float _1799 = in.m_45.x;
        float _1801 = in.m_45.y;
        _1795 = _1799;
        _1797 = _1801;
    }
    float _1803 = _1795;
    float _1805 = _1797;
    float _1807 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1809 = _1699 * _1807;
    float _1811 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1813 = -_1787;
    float _1815 = fma(_1715, _1811, _1813);
    float _1817 = _1793 * _1793;
    float _1819 = _1747 * _1781;
    float _1821 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1823 = -_1809;
    float _1825 = fma(_1713, _1821, _1823);
    bool _1827 = !_1403;
    float _1829 = _1827 ? (-0.5) : 0.5;
    float _1831 = fma(_1815, _1815, _1817);
    float _1833 = _1581 * _1819;
    float _1835 = _1583 * _1819;
    float _1837 = -_1747;
    float _1839 = _1837 + 1.0;
    float _1841 = fma(_1825, _1825, _1831);
    float _1843 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1829);
    float _1845 = fma(_1839, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1835);
    float _1847 = _1447 * _1843;
    float _1849 = rsqrt(_1841);
    float _1851 = _1579 * _1819;
    float _1853 = _1819;
    if (!_1373)
    {
        _1609 = _1359;
    }
    float _1855 = _1609;
    float _1857 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1859 = _1855;
    if (!_1373)
    {
        _1853 = _1359;
    }
    float _1861 = _1853;
    float _1863 = _1803 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1865 = _1861;
    if (_1373)
    {
        _1859 = _1805;
    }
    float _1867 = _1859;
    if (_1373)
    {
        _1865 = _1805;
    }
    float _1869 = _1865;
    bool _1871 = _1805 > 0.5;
    float _1873 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1875 = fma(_1869, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1857);
    float _1877 = _1825 * _1849;
    float _1879 = fma(_1803, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1873);
    float _1881 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1883 = fma(_1839, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1851);
    float _1885 = _1793 * _1849;
    float _1887 = fma(_1839, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1833);
    float _1889 = -_1881;
    float _1891 = fma(_1863, 2.0, _1889);
    float _1893 = _1815 * _1849;
    float _1895 = _1699 * _1885;
    float _1897 = fma(_1543, _1783, _1883);
    float _1899 = _1847 * _1713;
    float _1901 = _1847 * _1699;
    float _1903 = -_1895;
    float _1905 = fma(_1713, _1893, _1903);
    float _1907 = _1713 * _1877;
    float _1909 = _1847 * _1715;
    float _1911 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1913 = fma(_1673, _1893, _1901);
    float _1915 = -_1907;
    float _1917 = fma(_1715, _1885, _1915);
    float _1919 = fma(_1673, _1877, _1909);
    float _1921 = fma(_1545, _1783, _1887);
    float _1923 = fma(_1911, _1917, _1913);
    float _1925 = fma(_1911, _1905, _1919);
    float _1927 = fma(_1547, _1783, _1845);
    float _1929 = _1867 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1931 = _1497 + _1923;
    float _1933 = _1461 + _1925;
    float _1935 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1937 = -_1829;
    int _1939 = _1457 ? as_type<int>(_1937) : as_type<int>(_1829);
    float _1941 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1943 = _1931 + _1941;
    float _1945 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1947 = _1933 + _1945;
    float _1949 = -_1829;
    int _1951 = _1871 ? as_type<int>(_1949) : as_type<int>(_1829);
    float _1953 = fma(_1929, -2.0, _1935);
    bool _1955 = !_1515;
    float _1957 = _1955 ? _1829 : as_type<float>(_1939);
    float _1959 = _1947 * _1947;
    bool _1961 = !_1529;
    float _1963 = _1961 ? _1829 : as_type<float>(_1951);
    float _1965 = fma(_1641, _1763, _1921);
    float _1967 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1969 = fma(_1943, _1943, _1959);
    float _1971 = fma(_1639, _1763, _1897);
    float _1973 = fma(_1573, _1765, _1965);
    float _1975 = _1715 * _1893;
    float _1977 = fma(_1643, _1763, _1927);
    float _1979 = fma(_1571, _1765, _1971);
    float _1981 = fma(_1673, _1885, _1899);
    float _1983 = sqrt(_1969);
    float _1985 = -_1975;
    float _1987 = fma(_1699, _1877, _1985);
    float _1989 = fma(_1575, _1765, _1977);
    float _1991 = fma(_1603, _1749, _1979);
    float _1993 = fma(_1605, _1749, _1973);
    float _1995 = fma(_1911, _1987, _1981);
    float _1997 = fma(_1617, _1749, _1989);
    float _1999 = -_111;
    float _2001 = fma(_1999, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1891);
    float _2003 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2005 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1879);
    float _2007 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1875);
    float _2009 = fma(_1637, _1675, _1991);
    float _2011 = fma(_1645, _1675, _1993);
    float _2013 = _1563 + _1995;
    float _2015 = _1967 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2017 = _1445 + 0.5;
    bool _2019 = _1983 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2021 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1953);
    float _2023 = _1957 + (-0.5);
    float _2025 = fma(_1685, _1675, _1997);
    float _2027 = fma(_1635, (*spvDescriptorSet0.vp_c9)._m0[129].x, _2009);
    float _2029 = fma(_1635, (*spvDescriptorSet0.vp_c9)._m0[129].y, _2011);
    float _2031 = fma(_2015, _2017, _2001);
    float _2033 = fma(_1635, (*spvDescriptorSet0.vp_c9)._m0[129].z, _2025);
    float _2035 = _2003 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2037 = -_2035;
    float _2039 = -_2021;
    float _2041 = fma(_2037, _2023, _2039);
    float _2043 = _1931;
    float _2045 = _1933;
    if (!_2019)
    {
        _1611 = _2013;
    }
    float _2047 = _1611;
    bool _2049 = !_2019;
    float _2051 = _2047;
    if (!_2049)
    {
        float _2053 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2055 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2057 = _1983 + _2055;
        float _2059 = _2013 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2061 = rsqrt(_1969);
        float _2063 = _2057 * _2053;
        float _2065 = _2063 * 0.15915493667125701904296875;
        float _2067 = _2065 * 6.283185482025146484375;
        float _2069 = cos(_2067);
        float _2071 = _2065 * 6.283185482025146484375;
        float _2073 = sin(_2071);
        float _2075 = _2069 + (-1.0);
        float _2077 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2079 = fma(_2073, _2059, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2081 = fma(_2013, _2069, _2077);
        float _2083 = _2061 * _2079;
        float _2085 = fma(_1943, _2083, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2087 = fma(_1947, _2083, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2051 = _2081;
        _2043 = _2085;
        _2045 = _2087;
    }
    float _2089 = _2051;
    float _2091 = _2043;
    float _2093 = _2045;
    float _2095 = _2089 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2097 = _2089 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2099 = _2089 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2101 = _2089 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2103 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2095);
    float _2105 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2097);
    float _2107 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2099);
    float _2109 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2101);
    float _2111 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2103);
    float _2113 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2105);
    float _2115 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2107);
    float _2117 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2119 = _2111 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2121 = _2113 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2123 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2109);
    float _2125 = _2115 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2127 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2129 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2131 = -_2007;
    float _2133 = _2131 + 1.0;
    float _2135 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2137 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2127);
    float _2139 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2129);
    float _2141 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2143 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2145 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2137);
    float _2147 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2139);
    float _2149 = _2123 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2151 = fma(_1957, _2133, _2041);
    float _2153 = _2029 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2155 = _1683 + 0.5;
    float _2157 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2141);
    float _2159 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2143);
    float _2161 = -_1963;
    float _2163 = _2161 + 0.5;
    float _2165 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2145);
    float _2167 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2147);
    float _2169 = -_2005;
    float _2171 = _2169 + 1.0;
    float _2173 = _2027 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2175 = _2153 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2177 = _2155 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2179 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2157);
    float _2181 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2159);
    float _2183 = _2163 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2185 = _2033 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2187 = _2165 + _2167;
    float _2189 = -_2171;
    float _2191 = fma(_1445, _2189, _2031);
    float _2193 = _2173 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2195 = _2177 * _2117;
    float _2197 = _2183 * _2135;
    float _2199 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2179);
    float _2201 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2181);
    float _2203 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2205 = _2185 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2207 = _2187 * 0.5;
    out.m_52.x = _2195;
    out.m_52.y = _2197;
    out.m_52.z = _2191;
    out.m_52.w = _2151;
    out.m_54.x = _2193;
    out.m_54.y = _2175;
    out.m_54.z = _2205;
    out.m_54.w = _2203;
    out.m_56.y = _2089;
    out.gl_Position.x = _2199;
    out.gl_Position.y = _2201;
    out.gl_Position.z = _2165;
    out.gl_Position.w = _2167;
    out.m_58.z = _2207;
    out.m_58.w = _2167;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

