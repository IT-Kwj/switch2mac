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
    float4 m_44 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_48 [[user(locn4)]];
    float4 m_54 [[user(locn5)]];
    float4 m_50 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_37 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _375 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_30.w;
    float _70 = trunc(_68);
    int _73 = int(_70);
    bool _77 = _73 >= 1;
    float _79 = 0.0;
    if (!_77)
    {
        _79 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _79;
    float _83 = _81;
    if (!_77)
    {
        out.m_33.x = 0.0;
    }
    int _85 = 0;
    if (!_77)
    {
        float _87 = _81 * 5.0;
        _85 = as_type<int>(_87);
    }
    int _89 = _85;
    int _91 = _89;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1742 = as_type<float>(_89);
        out.gl_Position.z = _1742;
    }
    if (!_77)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _93 = in.m_35.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _109 = _107;
    if (_103)
    {
        float _111 = float(_73);
        _83 = _111;
    }
    float _113 = _83;
    bool _115 = _107 >= _113;
    bool _117 = !_103;
    bool _119 = _115 || _117;
    float _121 = _113;
    if (_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    if (_119)
    {
        out.m_33.x = 0.0;
    }
    if (_119)
    {
        float _125 = _123 * 5.0;
        _91 = as_type<int>(_125);
    }
    int _127 = _91;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1812 = as_type<float>(_127);
        out.gl_Position.z = _1812;
    }
    if (_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_37.x;
    float _131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _133 = _107 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _139 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _141 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _143 = _139 || _141;
    bool _145 = isnan(1.0);
    bool _147 = _143 || _145;
    float _149 = _133 * _131;
    float _151 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[20].x, _149);
    float _153 = in.m_35.x;
    float _155 = in.m_35.y;
    float _157 = in.m_35.z;
    float _159 = floor(_151);
    float _161 = _151 * 6.283185482025146484375;
    int _163 = as_type<int>(_135) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_135) & 2;
    bool _169 = _167 != 0;
    int _171 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _173 = _171 != 0;
    float _175 = _161 * 0.15915493667125701904296875;
    float _177 = _175 * 6.283185482025146484375;
    float _179 = cos(_177);
    bool _181 = !_165;
    float _183 = _181 ? (-0.5) : 0.5;
    float _185 = -_159;
    float _187 = _151 + _185;
    float _189 = _151;
    float _191 = _137;
    if (!_147)
    {
        float _193 = _137 * _137;
        float _195 = _193 * 0.5;
        _189 = _195;
    }
    float _197 = _189;
    bool _199 = !_169;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = _197;
    if (!_147)
    {
        float _205 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _205;
    }
    float _207 = _203;
    bool _209 = !_147;
    float _211 = _207;
    if (!_209)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = _137 * _215;
        float _225 = 1.0 / _219;
        float _227 = _221 * 0.693147182464599609375;
        float _229 = exp2(_223);
        float _231 = 1.0 / _227;
        float _233 = _229 + (-1.0);
        float _235 = -_233;
        float _237 = fma(_235, _231, _137);
        float _239 = _237 * _225;
        float _241 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _241;
    }
    float _243 = _211;
    bool _245 = !_147;
    if (!_245)
    {
        float _247 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = log2(_247);
        float _251 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _253 = _251 + 1.0;
        float _255 = 1.0 / _253;
        float _257 = _137 * _249;
        float _259 = exp2(_257);
        float _261 = -_259;
        float _263 = _261 + 1.0;
        float _265 = _263 * _255;
        _191 = _265;
    }
    float _267 = _191;
    float _269 = in.m_42.w;
    float _271 = fma(_179, 0.5, 0.5);
    int _273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _275 = _273 != 0;
    int _277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _279 = _277 != 0;
    float _281 = in.m_30.x;
    float _283 = in.m_30.y;
    float _285 = in.m_30.z;
    float _287 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _289 = _187 < 0.5;
    float _291 = float(_289);
    float _293 = -_187;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _297 = !_275;
    int _299 = _297 ? 0 : 1;
    float _301 = -_271;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _305 = !_173;
    int _307 = _305 ? 0 : 1;
    float _309 = -_291;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _313 = abs(_299);
    float _315 = fma(_267, _153, _287);
    bool _317 = !_279;
    int _319 = _317 ? 0 : 1;
    float _321 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _323 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _325 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _327 = abs(_307);
    float _329 = fma(_267, _155, _321);
    int _331 = abs(_319);
    float _333 = fma(_267, _157, _325);
    float _335 = float(_313);
    float _337 = float(_327);
    float _339 = abs(_295);
    float _341 = _335 * _339;
    float _343 = fma(_315, _269, _281);
    float _345 = fma(_329, _269, _283);
    float _347 = float(_331);
    float _349 = fma(_337, _303, _341);
    float _351 = fma(_333, _269, _285);
    float _353 = abs(_311);
    float _355 = fma(_347, _353, _349);
    bool _357 = !_323;
    float _373;
    if (!_357)
    {
        float _359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _361 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _363 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _365 = _363 * _359;
        float _367 = floor(_365);
        float _369 = -_367;
        float _371 = _365 + _369;
        _373 = _371;
        _375 = true;
    }
    else
    {
        float _377 = float(_73);
        float _379 = 1.0 / _377;
        float _381 = _107 * _379;
        _373 = _381;
    }
    _375 = false;
    float _383 = _373;
    float _385 = in.m_37.z;
    float _387 = in.m_37.w;
    float _389 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _391 = log2(_389);
    float _393 = _345 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _395 = _345 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _397 = _129 * 2.0;
    float _399 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].x, _393);
    float _401 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].x, _395);
    float _403 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[4].z, _399);
    float _405 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[6].z, _401);
    float _407 = floor(_397);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _413 = _403 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _415 = _405 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _417 = _391 * _107;
    float _419 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _421 = _413 + _419;
    float _423 = -_415;
    float _425 = _423 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _427 = exp2(_417);
    float _429 = _385 * 2.0;
    float _431 = abs(_421);
    float _433 = abs(_425);
    float _435 = precise::max(_431, _433);
    bool _437 = _435 >= 16.0;
    float _439 = _421 * 0.0625;
    float _441 = floor(_429);
    int _443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _445 = _443 != 0;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _449 = _447 != 0;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _453 = _451 != 0;
    bool _455 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _457 = isnan(0.0);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _463 = _459 || _461;
    float _465 = _437 ? _439 : _421;
    float _467 = -_427;
    float _469 = _467 + 1.0;
    float _471 = _425;
    bool _473 = _445;
    int _475 = _453 ? (-1) : 0;
    float _477 = _465;
    float _479 = _383;
    if (_437)
    {
        float _481 = _425 * 0.0625;
        _471 = _481;
    }
    float _483 = _471;
    float _485 = abs(_465);
    bool _487 = _485 != 0.0;
    bool _489 = isnan(_485);
    bool _491 = _487 || _489;
    bool _493 = isnan(0.0);
    bool _495 = _491 || _493;
    float _497 = _463 ? _469 : 0.0;
    bool _499 = _441 >= 0.0;
    bool _501 = isnan(_441);
    bool _503 = _499 || _501;
    bool _505 = isnan(0.0);
    bool _507 = _503 || _505;
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _511 = _509 != 0;
    bool _513 = !_449;
    int _515 = _513 ? 0 : 1;
    bool _517 = _441 > 0.0;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _523 = _507 ? 0 : 1;
    float _525 = 1.0 / _521;
    float _527 = abs(_483);
    bool _529 = _527 == 0.0;
    bool _531 = !_495;
    bool _533 = _529 && _531;
    int _535 = ~_523;
    int _537 = _535 + 1;
    int _539 = _537 + 1;
    float _541 = abs(_483);
    bool _543 = _541 == 0.0;
    int _545 = _539;
    if (!_517)
    {
        int _547 = ~_523;
        int _549 = _547 + 1;
        _545 = _549;
    }
    int _551 = _545;
    float _553 = _345 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _555 = _387 > 0.5;
    bool _557 = !_445;
    int _559 = _557 ? 0 : 1;
    float _561 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].x, _553);
    int _563 = as_type<int>(_553);
    if (_533)
    {
        bool _565 = as_type<int>(_483) >= 0;
        _473 = _565;
    }
    bool _567 = _473;
    bool _569 = !_453;
    int _571 = _569 ? 0 : 1;
    if (_533)
    {
        int _573 = _567 ? 0 : 1078530011;
        _563 = _573;
    }
    int _575 = _563;
    int _577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _579 = _577 != 0;
    int _581 = _575;
    if (_533)
    {
        int _583 = int(0x80000000) & as_type<int>(_465);
        int _585 = _575 | _583;
        _581 = _585;
    }
    int _587 = _581;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _591 = _589 != 0;
    bool _593 = !_495;
    bool _595 = _593 && _543;
    int _597 = _587;
    float _599 = as_type<float>(_587);
    if (!_595)
    {
        float _601 = abs(_465);
        bool _603 = _601 != as_type<float>(0x7f800000u /* inf */);
        bool _605 = isnan(_601);
        bool _607 = _603 || _605;
        bool _609 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _611 = _607 || _609;
        float _613 = abs(_483);
        bool _615 = _613 == as_type<float>(0x7f800000u /* inf */);
        bool _617 = !_611;
        bool _619 = _615 && _617;
        if (_619)
        {
            _597 = 1075235812;
        }
        int _621 = _597;
        int _623 = _621;
        if (_619)
        {
            bool _625 = as_type<int>(_483) >= 0;
            _475 = _625 ? (-1) : 0;
        }
        int _627 = _475;
        if (_619)
        {
            int _629 = ~_627;
            int _631 = (_629 != 0) ? _621 : 1061752795;
            _623 = _631;
        }
        int _633 = _623;
        float _635 = as_type<float>(_633);
        if (_619)
        {
            int _637 = int(0x80000000) & as_type<int>(_465);
            int _639 = _633 | _637;
            _635 = as_type<float>(_639);
        }
        float _641 = _635;
        float _643 = abs(_483);
        bool _645 = _643 == as_type<float>(0x7f800000u /* inf */);
        bool _647 = !_611;
        bool _649 = _647 && _645;
        _599 = _641;
        if (!_649)
        {
            float _651 = abs(_465);
            float _653 = abs(_483);
            float _655 = precise::max(_651, _653);
            float _657 = abs(_465);
            float _659 = abs(_483);
            float _661 = precise::min(_657, _659);
            float _663 = 1.0 / _655;
            float _665 = abs(_465);
            float _667 = abs(_483);
            bool _669 = _665 > _667;
            float _671 = _661 * _663;
            float _673 = abs(_465);
            float _675 = abs(_483);
            float _677 = _673 + _675;
            int _679 = as_type<int>(_465) & int(0x80000000);
            float _681 = _671 * _671;
            float _683 = _681 + 11.33538818359375;
            float _685 = fma(_681, _683, 28.84246826171875);
            float _687 = fma(_681, _685, 19.6966705322265625);
            float _689 = fma(_681, -0.82336294651031494140625, -5.674867153167724609375);
            float _691 = fma(_681, _689, -6.565555095672607421875);
            float _693 = 1.0 / _687;
            float _695 = _681 * _691;
            float _697 = _671 * _695;
            float _699 = fma(_697, _693, _671);
            float _701 = _699;
            _477 = as_type<float>(_679);
            _599 = _677;
            if (_669)
            {
                float _703 = -_699;
                float _705 = _703 + 1.57079637050628662109375;
                _701 = _705;
            }
            float _707 = _701;
            bool _709 = as_type<int>(_483) >= 0;
            int _711 = as_type<int>(_707);
            if (!_709)
            {
                float _713 = -_707;
                float _715 = _713 + 3.1415927410125732421875;
                _711 = as_type<int>(_715);
            }
            int _717 = _711;
            bool _719 = _677 > as_type<float>(0x7f800000u /* inf */);
            bool _721 = isnan(_677);
            bool _723 = _719 || _721;
            bool _725 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _727 = _723 || _725;
            if (!_727)
            {
                int _729 = _679 | _717;
                _599 = as_type<float>(_729);
            }
        }
    }
    float _731 = _477;
    float _733 = _599;
    float _735 = 1.0 / _411;
    float _737 = in.m_37.y;
    float _739 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[5].z, _561);
    bool _741 = _407 >= 0.0;
    bool _743 = isnan(_407);
    bool _745 = _741 || _743;
    bool _747 = isnan(0.0);
    bool _749 = _745 || _747;
    float _751 = _731;
    if (!_511)
    {
        float _753 = in.m_37.z;
        _751 = _753;
    }
    float _755 = _751;
    float _757 = _129 + _385;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _759;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _767 = _749 ? 0 : 1;
    float _769 = _757 + (-1.0);
    bool _771 = _407 > 0.0;
    float _773 = _761 * _525;
    bool _775 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _777 = isnan(_383);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _789 = _383 + _787;
    float _791 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _793 = float(_551);
    float _795 = _765 * _735;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _799 = _383 + _797;
    float _801 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _803 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _805 = isnan(_383);
    bool _807 = _803 || _805;
    bool _809 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _811 = _807 || _809;
    float _813 = float(_811);
    float _815 = -_785;
    float _817 = _815 + 1.0;
    float _819 = fma(_773, _799, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _821 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _823 = isnan(_383);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = fma(_795, _789, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _835 = _813 * _817;
    float _837 = -_813;
    float _839 = _837 + 1.0;
    float _841 = _813;
    float _843 = _789;
    float _845 = _791;
    if (!_511)
    {
        _841 = _737;
    }
    float _847 = _841;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _851 = _847;
    float _853 = _755;
    if (!_511)
    {
        _843 = _755;
    }
    float _855 = _843;
    float _857 = _831 * _839;
    float _859 = _855;
    if (!_511)
    {
        _479 = _847;
    }
    float _861 = _479;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _865 = _861;
    if (_511)
    {
        _851 = _737;
    }
    float _867 = _851;
    float _869 = _819 * _857;
    float _871 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _873 = ~_767;
    int _875 = _873 + 1;
    int _877 = _875 + 1;
    int _879 = _877;
    float _881 = _871;
    if (_511)
    {
        _853 = _867;
    }
    float _883 = _853;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_771)
    {
        int _887 = ~_767;
        int _889 = _887 + 1;
        _879 = _889;
    }
    int _891 = _879;
    float _893 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[83].w, _849);
    if (_511)
    {
        _865 = _129;
    }
    float _895 = _865;
    float _897 = _867 * 2.0;
    if (_511)
    {
        _859 = _867;
    }
    float _899 = _859;
    bool _901 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _903 = isnan(1.0);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _909 = _905 || _907;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _913 = 1.0 + _911;
    float _915 = _895 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _917 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[83].z, _885);
    float _919 = _739 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _921 = abs(_559);
    float _923 = 1.0 / _913;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _927 = -_863;
    float _929 = fma(_915, 2.0, _927);
    float _931 = _899 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _933 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _935 = _919 + _933;
    float _937 = float(_921);
    float _939 = _385 + _867;
    float _941 = _129 + _867;
    float _943 = floor(_897);
    float _945 = fma(_931, -2.0, _925);
    float _947 = _935 * _935;
    float _949 = _939 + (-1.0);
    float _951 = _937 * _793;
    float _953 = _941 + (-1.0);
    float _955 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[82].z, _917);
    float _957 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _959 = _415 + _957;
    float _961 = fma(_421, _421, _947);
    float _963 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _965 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _967 = -_107;
    float _969 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[81].x, _929);
    float _971 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[82].w, _893);
    float _973 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[81].y, _945);
    float _975 = fma(_959, _959, _961);
    if (_909)
    {
        float _977 = _497 * _923;
        _109 = _977;
    }
    float _979 = _109;
    int _981 = abs(_515);
    float _983 = _951 * (-2.0);
    bool _985 = _943 >= 0.0;
    bool _987 = isnan(_943);
    bool _989 = _985 || _987;
    bool _991 = isnan(0.0);
    bool _993 = _989 || _991;
    float _995 = rsqrt(_975);
    float _997 = float(_981);
    float _999 = fma(_965, _983, _965);
    int _1001 = _993 ? 0 : 1;
    float _1003 = -_955;
    float _1005 = _1003 + 1.0;
    bool _1007 = _129 > 0.5;
    float _1009 = _129 + (-0.5);
    float _1011 = float(_891);
    float _1013 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1015 = _943 > 0.0;
    float _1017 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    int _1019 = abs(_571);
    float _1021 = _997 * _1011;
    int _1023 = ~_1001;
    int _1025 = _1023 + 1;
    int _1027 = _1025 + 1;
    float _1029 = fma(_999, _979, _1017);
    float _1031 = float(_1019);
    float _1033 = _935 * _995;
    float _1035 = _1021 * (-2.0);
    float _1037 = _421 * _995;
    int _1039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1041 = _1039 != 0;
    float _1043 = -_1033;
    float _1045 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[18].w, _935);
    float _1047 = fma(_963, _1035, _963);
    float _1049 = -_1037;
    float _1051 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[18].w, _421);
    int _1053 = _1027;
    if (!_1015)
    {
        int _1055 = ~_1001;
        int _1057 = _1055 + 1;
        _1053 = _1057;
    }
    int _1059 = _1053;
    float _1061 = _1045 * _1045;
    bool _1063 = _385 > 0.5;
    float _1065 = -_1033;
    float _1067 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[18].w, _919);
    float _1069 = float(_1059);
    float _1071 = fma(_1051, _1051, _1061);
    float _1073 = _959 * _995;
    float _1075 = -_183;
    int _1077 = _1063 ? as_type<int>(_1075) : as_type<int>(_183);
    float _1079 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1081 = _1031 * _1069;
    float _1083 = -_1073;
    float _1085 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[18].w, _959);
    float _1087 = _867 + (-0.5);
    float _1089 = _1029 * 0.15915493667125701904296875;
    float _1091 = -_1037;
    float _1093 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[18].w, _413);
    float _1095 = fma(_1085, _1085, _1071);
    float _1097 = -_831;
    float _1099 = _1097 + 1.0;
    float _1101 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1103 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1105 = !_1041;
    float _1107 = _1105 ? _183 : as_type<float>(_1077);
    float _1109 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[115].x, _869);
    float _1111 = _1081 * (-2.0);
    float _1113 = fma(_1047, _979, _1101);
    bool _1115 = _867 > 0.5;
    float _1117 = fma(_833, _835, _1109);
    float _1119 = fma(_801, _1111, _801);
    float _1121 = -_733;
    float _1123 = _1113 + _1121;
    float _1125 = _385 + (-0.5);
    float _1127 = in.m_42.x;
    float _1129 = in.m_42.y;
    float _1131 = _1089 * 6.283185482025146484375;
    float _1133 = sin(_1131);
    float _1135 = -_1073;
    float _1137 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[18].w, _415);
    float _1139 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1103);
    float _1141 = _1123 * 0.15915493667125701904296875;
    float _1143 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1145 = -_201;
    int _1147 = _555 ? as_type<int>(_1145) : as_type<int>(_201);
    float _1149 = _1107 + 0.5;
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1153 = _1151 != 0;
    float _1155 = _1089 * 6.283185482025146484375;
    float _1157 = cos(_1155);
    float _1159 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1139);
    float _1161 = fma(_1143, _1149, _969);
    float _1163 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1165 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1117);
    float _1167 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1169 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _1171 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1163);
    float _1173 = sqrt(_1095);
    float _1175 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    bool _1177 = !_1153;
    float _1179 = _1177 ? _201 : as_type<float>(_1147);
    float _1181 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1171);
    float _1183 = fma(_1119, _979, _1175);
    float _1185 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1187 = _1179 + (-0.5);
    float _1189 = 1.0 / _1167;
    float _1191 = _1183 * 0.15915493667125701904296875;
    float _1193 = _1181 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1195 = -_1185;
    float _1197 = -_973;
    float _1199 = fma(_1195, _1187, _1197);
    float _1201 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1203 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _1205 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1207 = isnan(0.5);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1213 = _1209 || _1211;
    float _1215 = -_971;
    float _1217 = _1215 + 1.0;
    float _1219 = _1141 * 6.283185482025146484375;
    float _1221 = sin(_1219);
    float _1223 = _995 * _1173;
    float _1225 = _1201 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1227 = _1193 + _1167;
    float _1229 = _1203 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1231 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _1233 = _1223 * _1225;
    float _1235 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1237 = _1235 * 0.5;
    float _1239 = _1141 * 6.283185482025146484375;
    float _1241 = cos(_1239);
    float _1243 = _1227 * _1189;
    float _1245 = _1243 * 0.5;
    float _1247 = _1223 * _1229;
    float _1249 = _1233 * _1169;
    float _1251 = -_201;
    int _1253 = _1115 ? as_type<int>(_1251) : as_type<int>(_201);
    float _1255 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1257 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1255);
    float _1259 = _1247 * _1231;
    float _1261 = -_183;
    int _1263 = _1007 ? as_type<int>(_1261) : as_type<int>(_183);
    float _1265 = _1191 * 6.283185482025146484375;
    float _1267 = cos(_1265);
    float _1269 = _1157 * _1221;
    float _1271 = _1133 * _1221;
    bool _1273 = !_579;
    float _1275 = _1273 ? _183 : as_type<float>(_1263);
    float _1277 = _1165 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1279 = !_591;
    float _1281 = _1279 ? _201 : as_type<float>(_1253);
    float _1283 = _1191 * 6.283185482025146484375;
    float _1285 = sin(_1283);
    float _1287 = _1133 * _1241;
    float _1289 = _1157 * _1241;
    float _1291 = _1275 + 0.5;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1295 = _1133 * _1267;
    float _1297 = _1241 * _1267;
    float _1299 = _1221 * _1267;
    float _1301 = _1295 * _1249;
    float _1303 = 1.0 / _1257;
    float _1305 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1307 = _1157 * _1267;
    float _1309 = -_1269;
    float _1311 = fma(_1285, _1287, _1309);
    float _1313 = -_1249;
    float _1315 = _1285 * _1313;
    float _1317 = fma(_1285, _1271, _1289);
    float _1319 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1321 = fma(_1311, _1259, _1301);
    float _1323 = fma(_1297, _1259, _1315);
    float _1325 = fma(_1285, _1289, _1271);
    float _1327 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1329 = fma(_1317, _1237, _1321);
    float _1331 = fma(_1299, _1237, _1323);
    float _1333 = _1291 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1335 = _1321;
    float _1337 = _1161;
    if (!_1213)
    {
        _1335 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1339 = _1335;
    float _1341 = _415 + _1329;
    float _1343 = _413 + _1331;
    float _1345 = -_1005;
    float _1347 = fma(_1107, _1345, _1161);
    float _1349 = -_1281;
    float _1351 = _1349 + 0.5;
    float _1353 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1355 = _1341 + _1353;
    float _1357 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1359 = _1343 + _1357;
    float _1361 = _1333 * _791;
    float _1363 = _1355 * _1355;
    float _1365 = _1339;
    float _1367 = _1361;
    float _1369 = _1347;
    float _1371 = _1343;
    float _1373 = _1341;
    if (!_1213)
    {
        _845 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1375 = _845;
    float _1377 = _1375;
    if (!_1213)
    {
        float _1379 = -_1339;
        float _1381 = _1379 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1337 = _1381;
    }
    float _1383 = _1337;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1387 = fma(_1359, _1359, _1363);
    float _1389 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1391 = fma(_1179, _1217, _1199);
    float _1393 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1395 = sqrt(_1387);
    float _1397 = _1389 * _871;
    if (!_1213)
    {
        float _1399 = -_1375;
        float _1401 = _1399 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _881 = _1401;
    }
    float _1403 = _881;
    out.m_44.x = _1305;
    out.m_44.y = _1393;
    out.m_44.z = _1327;
    out.m_44.w = _1277;
    float _1405 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1407 = -_1287;
    float _1409 = fma(_1285, _1269, _1407);
    float _1411 = _1383;
    if (!_1213)
    {
        float _1413 = 1.0 / _1383;
        _1411 = _1413;
    }
    float _1415 = _1411;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1421 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1213)
    {
        float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1425 = -_1339;
        float _1427 = fma(_1303, _1423, _1425);
        _1365 = _1427;
    }
    float _1429 = _1365;
    float _1431 = _1417 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1433 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1435 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1437 = _1389;
    float _1439 = _1431;
    if (!_1213)
    {
        float _1441 = 1.0 / _1403;
        _1437 = _1441;
    }
    float _1443 = _1437;
    bool _1445 = _1395 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1447 = _1307 * _1249;
    if (!_1213)
    {
        float _1449 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1451 = -_1375;
        float _1453 = fma(_1303, _1449, _1451);
        _1377 = _1453;
    }
    float _1455 = _1377;
    out.m_46.x = _1421;
    out.m_46.y = _1431;
    out.m_46.z = _1433;
    float _1457 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1459 = fma(_1325, _1259, _1447);
    float _1461 = -_1435;
    float _1463 = _1285 * _1461;
    out.m_48.x = _1361;
    out.m_48.y = _1397;
    out.m_48.z = _1347;
    out.m_48.w = _1391;
    float _1465 = fma(_1409, _1237, _1459);
    float _1467 = fma(_1297, _1457, _1463);
    float _1469 = _919 + _1465;
    float _1471 = _1455;
    if (_1213)
    {
        _1439 = 1.0;
    }
    float _1473 = _1439;
    float _1475 = _1473;
    if (!_1213)
    {
        float _1477 = _1429 * _1415;
        float _1479 = precise::clamp(_1477, 0.0, 1.0);
        _1475 = _1479;
    }
    float _1481 = _1475;
    if (!_1213)
    {
        float _1483 = _1455 * _1443;
        float _1485 = precise::clamp(_1483, 0.0, 1.0);
        _1471 = _1485;
    }
    float _1487 = _1471;
    float _1489 = _1307 * _1435;
    float _1491 = _1295 * _1435;
    if (_1213)
    {
        _1367 = 1.0;
    }
    float _1493 = _1367;
    float _1495 = _1493;
    if (!_1213)
    {
        float _1497 = -_1487;
        float _1499 = _1497 + 1.0;
        _1495 = _1499;
    }
    float _1501 = _1495;
    bool _1503 = _1481 > 0.0;
    bool _1505 = isnan(_1481);
    bool _1507 = _1503 || _1505;
    bool _1509 = isnan(0.0);
    bool _1511 = _1507 || _1509;
    float _1513 = fma(_1325, _1457, _1489);
    float _1515 = fma(_1311, _1457, _1491);
    if (!_1445)
    {
        _1369 = _1469;
    }
    float _1517 = _1369;
    bool _1519 = !_1445;
    float _1521 = _1517;
    if (!_1519)
    {
        float _1523 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1525 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1527 = _1395 + _1525;
        float _1529 = _1469 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1531 = rsqrt(_1387);
        float _1533 = _1527 * _1523;
        float _1535 = _1533 * 0.15915493667125701904296875;
        float _1537 = _1535 * 6.283185482025146484375;
        float _1539 = sin(_1537);
        float _1541 = _1535 * 6.283185482025146484375;
        float _1543 = cos(_1541);
        float _1545 = fma(_1539, _1529, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1547 = _1531 * _1545;
        float _1549 = _1543 + (-1.0);
        float _1551 = fma(_1359, _1547, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1553 = fma(_1355, _1547, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1555 = _1549 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1557 = fma(_1469, _1543, _1555);
        _1521 = _1557;
        _1371 = _1551;
        _1373 = _1553;
    }
    float _1559 = _1521;
    float _1561 = _1371;
    float _1563 = _1373;
    float _1565 = -_1033;
    float _1567 = fma(_1565, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1559);
    float _1569 = _1481 * _1501;
    float _1571 = -_1037;
    float _1573 = fma(_1571, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1561);
    bool _1575 = _1501 <= 0.0;
    bool _1577 = !_1511;
    bool _1579 = _1575 || _1577;
    float _1581 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1583 = _1569 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1585 = -_1073;
    float _1587 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1563);
    float _1589 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1591 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1581);
    float _1593 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1595 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1597 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1589);
    float _1599 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1591);
    float _1601 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1593);
    float _1603 = _355 * _1583;
    float _1605 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1597);
    float _1607 = _1599 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1609 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1601);
    float _1611 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1595);
    float _1613 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1615 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1617 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1619 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1621 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1623 = _1609 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1625 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1615);
    float _1627 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1611);
    float _1629 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1617);
    float _1631 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1619);
    float _1633 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1621);
    float _1635 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1625);
    float _1637 = _1627 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1639 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1629);
    float _1641 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1631);
    float _1643 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1633);
    float _1645 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1635);
    float _1647 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1639);
    float _1649 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1641);
    float _1651 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1643);
    float _1653 = _1317 + _1515;
    float _1655 = _1299 + _1467;
    float _1657 = _1409 + _1513;
    float _1659 = _1647 + _1651;
    float _1661 = _1649 + _1651;
    float _1663 = _1651 * 0.5;
    float _1665 = _1603 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1667 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1669 = _1573 + _1667;
    float _1671 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1673 = _1567 + _1671;
    float _1675 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1677 = _1587 + _1675;
    float _1679 = _1659 * 0.5;
    float _1681 = _1661 * 0.5;
    float _1683 = fma(_1645, -0.5, _1663);
    out.m_50.x = _1655;
    out.m_50.y = _1657;
    out.m_50.z = _1653;
    out.m_33.x = _1665;
    out.m_52.x = _1669;
    out.m_52.y = _1673;
    out.m_52.z = _1677;
    out.gl_Position.x = _1647;
    out.gl_Position.y = _1645;
    out.gl_Position.z = _1649;
    out.gl_Position.w = _1651;
    out.m_54.x = _1679;
    out.m_54.y = _1683;
    out.m_54.z = _1681;
    out.m_54.w = _1651;
    if (!_1579)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1685 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1685;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _375 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_30.w;
    float _70 = trunc(_68);
    int _73 = int(_70);
    bool _77 = _73 >= 1;
    float _79 = 0.0;
    if (!_77)
    {
        _79 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _79;
    float _83 = _81;
    if (!_77)
    {
        out.m_33.x = 0.0;
    }
    int _85 = 0;
    if (!_77)
    {
        float _87 = _81 * 5.0;
        _85 = as_type<int>(_87);
    }
    int _89 = _85;
    int _91 = _89;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1742 = as_type<float>(_89);
        out.gl_Position.z = _1742;
    }
    if (!_77)
    {
        return out;
    }
    float _93 = in.m_35.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _109 = _107;
    if (_103)
    {
        float _111 = float(_73);
        _83 = _111;
    }
    float _113 = _83;
    bool _115 = _107 >= _113;
    bool _117 = !_103;
    bool _119 = _115 || _117;
    float _121 = _113;
    if (_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    if (_119)
    {
        out.m_33.x = 0.0;
    }
    if (_119)
    {
        float _125 = _123 * 5.0;
        _91 = as_type<int>(_125);
    }
    int _127 = _91;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1812 = as_type<float>(_127);
        out.gl_Position.z = _1812;
    }
    if (_119)
    {
        return out;
    }
    float _129 = in.m_37.x;
    float _131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _133 = _107 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _139 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _141 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _143 = _139 || _141;
    bool _145 = isnan(1.0);
    bool _147 = _143 || _145;
    float _149 = _133 * _131;
    float _151 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[20].x, _149);
    float _153 = in.m_35.x;
    float _155 = in.m_35.y;
    float _157 = in.m_35.z;
    float _159 = floor(_151);
    float _161 = _151 * 6.283185482025146484375;
    int _163 = as_type<int>(_135) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_135) & 2;
    bool _169 = _167 != 0;
    int _171 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _173 = _171 != 0;
    float _175 = _161 * 0.15915493667125701904296875;
    float _177 = _175 * 6.283185482025146484375;
    float _179 = cos(_177);
    bool _181 = !_165;
    float _183 = _181 ? (-0.5) : 0.5;
    float _185 = -_159;
    float _187 = _151 + _185;
    float _189 = _151;
    float _191 = _137;
    if (!_147)
    {
        float _193 = _137 * _137;
        float _195 = _193 * 0.5;
        _189 = _195;
    }
    float _197 = _189;
    bool _199 = !_169;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = _197;
    if (!_147)
    {
        float _205 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _205;
    }
    float _207 = _203;
    bool _209 = !_147;
    float _211 = _207;
    if (!_209)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = _137 * _215;
        float _225 = 1.0 / _219;
        float _227 = _221 * 0.693147182464599609375;
        float _229 = exp2(_223);
        float _231 = 1.0 / _227;
        float _233 = _229 + (-1.0);
        float _235 = -_233;
        float _237 = fma(_235, _231, _137);
        float _239 = _237 * _225;
        float _241 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _241;
    }
    float _243 = _211;
    bool _245 = !_147;
    if (!_245)
    {
        float _247 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = log2(_247);
        float _251 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _253 = _251 + 1.0;
        float _255 = 1.0 / _253;
        float _257 = _137 * _249;
        float _259 = exp2(_257);
        float _261 = -_259;
        float _263 = _261 + 1.0;
        float _265 = _263 * _255;
        _191 = _265;
    }
    float _267 = _191;
    float _269 = in.m_42.w;
    float _271 = fma(_179, 0.5, 0.5);
    int _273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _275 = _273 != 0;
    int _277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _279 = _277 != 0;
    float _281 = in.m_30.x;
    float _283 = in.m_30.y;
    float _285 = in.m_30.z;
    float _287 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _289 = _187 < 0.5;
    float _291 = float(_289);
    float _293 = -_187;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _297 = !_275;
    int _299 = _297 ? 0 : 1;
    float _301 = -_271;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _305 = !_173;
    int _307 = _305 ? 0 : 1;
    float _309 = -_291;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _313 = abs(_299);
    float _315 = fma(_267, _153, _287);
    bool _317 = !_279;
    int _319 = _317 ? 0 : 1;
    float _321 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _323 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _325 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _327 = abs(_307);
    float _329 = fma(_267, _155, _321);
    int _331 = abs(_319);
    float _333 = fma(_267, _157, _325);
    float _335 = float(_313);
    float _337 = float(_327);
    float _339 = abs(_295);
    float _341 = _335 * _339;
    float _343 = fma(_315, _269, _281);
    float _345 = fma(_329, _269, _283);
    float _347 = float(_331);
    float _349 = fma(_337, _303, _341);
    float _351 = fma(_333, _269, _285);
    float _353 = abs(_311);
    float _355 = fma(_347, _353, _349);
    bool _357 = !_323;
    float _373;
    if (!_357)
    {
        float _359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _361 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _363 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _365 = _363 * _359;
        float _367 = floor(_365);
        float _369 = -_367;
        float _371 = _365 + _369;
        _373 = _371;
        _375 = true;
    }
    else
    {
        float _377 = float(_73);
        float _379 = 1.0 / _377;
        float _381 = _107 * _379;
        _373 = _381;
    }
    _375 = false;
    float _383 = _373;
    float _385 = in.m_37.z;
    float _387 = in.m_37.w;
    float _389 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _391 = log2(_389);
    float _393 = _345 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _395 = _345 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _397 = _129 * 2.0;
    float _399 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].x, _393);
    float _401 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].x, _395);
    float _403 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[4].z, _399);
    float _405 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[6].z, _401);
    float _407 = floor(_397);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _413 = _403 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _415 = _405 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _417 = _391 * _107;
    float _419 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _421 = _413 + _419;
    float _423 = -_415;
    float _425 = _423 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _427 = exp2(_417);
    float _429 = _385 * 2.0;
    float _431 = abs(_421);
    float _433 = abs(_425);
    float _435 = precise::max(_431, _433);
    bool _437 = _435 >= 16.0;
    float _439 = _421 * 0.0625;
    float _441 = floor(_429);
    int _443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _445 = _443 != 0;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _449 = _447 != 0;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _453 = _451 != 0;
    bool _455 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _457 = isnan(0.0);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _463 = _459 || _461;
    float _465 = _437 ? _439 : _421;
    float _467 = -_427;
    float _469 = _467 + 1.0;
    float _471 = _425;
    bool _473 = _445;
    int _475 = _453 ? (-1) : 0;
    float _477 = _465;
    float _479 = _383;
    if (_437)
    {
        float _481 = _425 * 0.0625;
        _471 = _481;
    }
    float _483 = _471;
    float _485 = abs(_465);
    bool _487 = _485 != 0.0;
    bool _489 = isnan(_485);
    bool _491 = _487 || _489;
    bool _493 = isnan(0.0);
    bool _495 = _491 || _493;
    float _497 = _463 ? _469 : 0.0;
    bool _499 = _441 >= 0.0;
    bool _501 = isnan(_441);
    bool _503 = _499 || _501;
    bool _505 = isnan(0.0);
    bool _507 = _503 || _505;
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _511 = _509 != 0;
    bool _513 = !_449;
    int _515 = _513 ? 0 : 1;
    bool _517 = _441 > 0.0;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _523 = _507 ? 0 : 1;
    float _525 = 1.0 / _521;
    float _527 = abs(_483);
    bool _529 = _527 == 0.0;
    bool _531 = !_495;
    bool _533 = _529 && _531;
    int _535 = ~_523;
    int _537 = _535 + 1;
    int _539 = _537 + 1;
    float _541 = abs(_483);
    bool _543 = _541 == 0.0;
    int _545 = _539;
    if (!_517)
    {
        int _547 = ~_523;
        int _549 = _547 + 1;
        _545 = _549;
    }
    int _551 = _545;
    float _553 = _345 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _555 = _387 > 0.5;
    bool _557 = !_445;
    int _559 = _557 ? 0 : 1;
    float _561 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].x, _553);
    int _563 = as_type<int>(_553);
    if (_533)
    {
        bool _565 = as_type<int>(_483) >= 0;
        _473 = _565;
    }
    bool _567 = _473;
    bool _569 = !_453;
    int _571 = _569 ? 0 : 1;
    if (_533)
    {
        int _573 = _567 ? 0 : 1078530011;
        _563 = _573;
    }
    int _575 = _563;
    int _577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _579 = _577 != 0;
    int _581 = _575;
    if (_533)
    {
        int _583 = int(0x80000000) & as_type<int>(_465);
        int _585 = _575 | _583;
        _581 = _585;
    }
    int _587 = _581;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _591 = _589 != 0;
    bool _593 = !_495;
    bool _595 = _593 && _543;
    int _597 = _587;
    float _599 = as_type<float>(_587);
    if (!_595)
    {
        float _601 = abs(_465);
        bool _603 = _601 != as_type<float>(0x7f800000u /* inf */);
        bool _605 = isnan(_601);
        bool _607 = _603 || _605;
        bool _609 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _611 = _607 || _609;
        float _613 = abs(_483);
        bool _615 = _613 == as_type<float>(0x7f800000u /* inf */);
        bool _617 = !_611;
        bool _619 = _615 && _617;
        if (_619)
        {
            _597 = 1075235812;
        }
        int _621 = _597;
        int _623 = _621;
        if (_619)
        {
            bool _625 = as_type<int>(_483) >= 0;
            _475 = _625 ? (-1) : 0;
        }
        int _627 = _475;
        if (_619)
        {
            int _629 = ~_627;
            int _631 = (_629 != 0) ? _621 : 1061752795;
            _623 = _631;
        }
        int _633 = _623;
        float _635 = as_type<float>(_633);
        if (_619)
        {
            int _637 = int(0x80000000) & as_type<int>(_465);
            int _639 = _633 | _637;
            _635 = as_type<float>(_639);
        }
        float _641 = _635;
        float _643 = abs(_483);
        bool _645 = _643 == as_type<float>(0x7f800000u /* inf */);
        bool _647 = !_611;
        bool _649 = _647 && _645;
        _599 = _641;
        if (!_649)
        {
            float _651 = abs(_465);
            float _653 = abs(_483);
            float _655 = precise::max(_651, _653);
            float _657 = abs(_465);
            float _659 = abs(_483);
            float _661 = precise::min(_657, _659);
            float _663 = 1.0 / _655;
            float _665 = abs(_465);
            float _667 = abs(_483);
            bool _669 = _665 > _667;
            float _671 = _661 * _663;
            float _673 = abs(_465);
            float _675 = abs(_483);
            float _677 = _673 + _675;
            int _679 = as_type<int>(_465) & int(0x80000000);
            float _681 = _671 * _671;
            float _683 = _681 + 11.33538818359375;
            float _685 = fma(_681, _683, 28.84246826171875);
            float _687 = fma(_681, _685, 19.6966705322265625);
            float _689 = fma(_681, -0.82336294651031494140625, -5.674867153167724609375);
            float _691 = fma(_681, _689, -6.565555095672607421875);
            float _693 = 1.0 / _687;
            float _695 = _681 * _691;
            float _697 = _671 * _695;
            float _699 = fma(_697, _693, _671);
            float _701 = _699;
            _477 = as_type<float>(_679);
            _599 = _677;
            if (_669)
            {
                float _703 = -_699;
                float _705 = _703 + 1.57079637050628662109375;
                _701 = _705;
            }
            float _707 = _701;
            bool _709 = as_type<int>(_483) >= 0;
            int _711 = as_type<int>(_707);
            if (!_709)
            {
                float _713 = -_707;
                float _715 = _713 + 3.1415927410125732421875;
                _711 = as_type<int>(_715);
            }
            int _717 = _711;
            bool _719 = _677 > as_type<float>(0x7f800000u /* inf */);
            bool _721 = isnan(_677);
            bool _723 = _719 || _721;
            bool _725 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _727 = _723 || _725;
            if (!_727)
            {
                int _729 = _679 | _717;
                _599 = as_type<float>(_729);
            }
        }
    }
    float _731 = _477;
    float _733 = _599;
    float _735 = 1.0 / _411;
    float _737 = in.m_37.y;
    float _739 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[5].z, _561);
    bool _741 = _407 >= 0.0;
    bool _743 = isnan(_407);
    bool _745 = _741 || _743;
    bool _747 = isnan(0.0);
    bool _749 = _745 || _747;
    float _751 = _731;
    if (!_511)
    {
        float _753 = in.m_37.z;
        _751 = _753;
    }
    float _755 = _751;
    float _757 = _129 + _385;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _759;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _767 = _749 ? 0 : 1;
    float _769 = _757 + (-1.0);
    bool _771 = _407 > 0.0;
    float _773 = _761 * _525;
    bool _775 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _777 = isnan(_383);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _789 = _383 + _787;
    float _791 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _793 = float(_551);
    float _795 = _765 * _735;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _799 = _383 + _797;
    float _801 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _803 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _805 = isnan(_383);
    bool _807 = _803 || _805;
    bool _809 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _811 = _807 || _809;
    float _813 = float(_811);
    float _815 = -_785;
    float _817 = _815 + 1.0;
    float _819 = fma(_773, _799, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _821 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _823 = isnan(_383);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = fma(_795, _789, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _835 = _813 * _817;
    float _837 = -_813;
    float _839 = _837 + 1.0;
    float _841 = _813;
    float _843 = _789;
    float _845 = _791;
    if (!_511)
    {
        _841 = _737;
    }
    float _847 = _841;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _851 = _847;
    float _853 = _755;
    if (!_511)
    {
        _843 = _755;
    }
    float _855 = _843;
    float _857 = _831 * _839;
    float _859 = _855;
    if (!_511)
    {
        _479 = _847;
    }
    float _861 = _479;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _865 = _861;
    if (_511)
    {
        _851 = _737;
    }
    float _867 = _851;
    float _869 = _819 * _857;
    float _871 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _873 = ~_767;
    int _875 = _873 + 1;
    int _877 = _875 + 1;
    int _879 = _877;
    float _881 = _871;
    if (_511)
    {
        _853 = _867;
    }
    float _883 = _853;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_771)
    {
        int _887 = ~_767;
        int _889 = _887 + 1;
        _879 = _889;
    }
    int _891 = _879;
    float _893 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[83].w, _849);
    if (_511)
    {
        _865 = _129;
    }
    float _895 = _865;
    float _897 = _867 * 2.0;
    if (_511)
    {
        _859 = _867;
    }
    float _899 = _859;
    bool _901 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _903 = isnan(1.0);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _909 = _905 || _907;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _913 = 1.0 + _911;
    float _915 = _895 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _917 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[83].z, _885);
    float _919 = _739 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _921 = abs(_559);
    float _923 = 1.0 / _913;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _927 = -_863;
    float _929 = fma(_915, 2.0, _927);
    float _931 = _899 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _933 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _935 = _919 + _933;
    float _937 = float(_921);
    float _939 = _385 + _867;
    float _941 = _129 + _867;
    float _943 = floor(_897);
    float _945 = fma(_931, -2.0, _925);
    float _947 = _935 * _935;
    float _949 = _939 + (-1.0);
    float _951 = _937 * _793;
    float _953 = _941 + (-1.0);
    float _955 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[82].z, _917);
    float _957 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _959 = _415 + _957;
    float _961 = fma(_421, _421, _947);
    float _963 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _965 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _967 = -_107;
    float _969 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[81].x, _929);
    float _971 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[82].w, _893);
    float _973 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[81].y, _945);
    float _975 = fma(_959, _959, _961);
    if (_909)
    {
        float _977 = _497 * _923;
        _109 = _977;
    }
    float _979 = _109;
    int _981 = abs(_515);
    float _983 = _951 * (-2.0);
    bool _985 = _943 >= 0.0;
    bool _987 = isnan(_943);
    bool _989 = _985 || _987;
    bool _991 = isnan(0.0);
    bool _993 = _989 || _991;
    float _995 = rsqrt(_975);
    float _997 = float(_981);
    float _999 = fma(_965, _983, _965);
    int _1001 = _993 ? 0 : 1;
    float _1003 = -_955;
    float _1005 = _1003 + 1.0;
    bool _1007 = _129 > 0.5;
    float _1009 = _129 + (-0.5);
    float _1011 = float(_891);
    float _1013 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1015 = _943 > 0.0;
    float _1017 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    int _1019 = abs(_571);
    float _1021 = _997 * _1011;
    int _1023 = ~_1001;
    int _1025 = _1023 + 1;
    int _1027 = _1025 + 1;
    float _1029 = fma(_999, _979, _1017);
    float _1031 = float(_1019);
    float _1033 = _935 * _995;
    float _1035 = _1021 * (-2.0);
    float _1037 = _421 * _995;
    int _1039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1041 = _1039 != 0;
    float _1043 = -_1033;
    float _1045 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[18].w, _935);
    float _1047 = fma(_963, _1035, _963);
    float _1049 = -_1037;
    float _1051 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[18].w, _421);
    int _1053 = _1027;
    if (!_1015)
    {
        int _1055 = ~_1001;
        int _1057 = _1055 + 1;
        _1053 = _1057;
    }
    int _1059 = _1053;
    float _1061 = _1045 * _1045;
    bool _1063 = _385 > 0.5;
    float _1065 = -_1033;
    float _1067 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[18].w, _919);
    float _1069 = float(_1059);
    float _1071 = fma(_1051, _1051, _1061);
    float _1073 = _959 * _995;
    float _1075 = -_183;
    int _1077 = _1063 ? as_type<int>(_1075) : as_type<int>(_183);
    float _1079 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1081 = _1031 * _1069;
    float _1083 = -_1073;
    float _1085 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[18].w, _959);
    float _1087 = _867 + (-0.5);
    float _1089 = _1029 * 0.15915493667125701904296875;
    float _1091 = -_1037;
    float _1093 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[18].w, _413);
    float _1095 = fma(_1085, _1085, _1071);
    float _1097 = -_831;
    float _1099 = _1097 + 1.0;
    float _1101 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1103 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1105 = !_1041;
    float _1107 = _1105 ? _183 : as_type<float>(_1077);
    float _1109 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[115].x, _869);
    float _1111 = _1081 * (-2.0);
    float _1113 = fma(_1047, _979, _1101);
    bool _1115 = _867 > 0.5;
    float _1117 = fma(_833, _835, _1109);
    float _1119 = fma(_801, _1111, _801);
    float _1121 = -_733;
    float _1123 = _1113 + _1121;
    float _1125 = _385 + (-0.5);
    float _1127 = in.m_42.x;
    float _1129 = in.m_42.y;
    float _1131 = _1089 * 6.283185482025146484375;
    float _1133 = sin(_1131);
    float _1135 = -_1073;
    float _1137 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[18].w, _415);
    float _1139 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1103);
    float _1141 = _1123 * 0.15915493667125701904296875;
    float _1143 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1145 = -_201;
    int _1147 = _555 ? as_type<int>(_1145) : as_type<int>(_201);
    float _1149 = _1107 + 0.5;
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1153 = _1151 != 0;
    float _1155 = _1089 * 6.283185482025146484375;
    float _1157 = cos(_1155);
    float _1159 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1139);
    float _1161 = fma(_1143, _1149, _969);
    float _1163 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1165 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1117);
    float _1167 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1169 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _1171 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1163);
    float _1173 = sqrt(_1095);
    float _1175 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    bool _1177 = !_1153;
    float _1179 = _1177 ? _201 : as_type<float>(_1147);
    float _1181 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1171);
    float _1183 = fma(_1119, _979, _1175);
    float _1185 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1187 = _1179 + (-0.5);
    float _1189 = 1.0 / _1167;
    float _1191 = _1183 * 0.15915493667125701904296875;
    float _1193 = _1181 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1195 = -_1185;
    float _1197 = -_973;
    float _1199 = fma(_1195, _1187, _1197);
    float _1201 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1203 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _1205 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1207 = isnan(0.5);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1213 = _1209 || _1211;
    float _1215 = -_971;
    float _1217 = _1215 + 1.0;
    float _1219 = _1141 * 6.283185482025146484375;
    float _1221 = sin(_1219);
    float _1223 = _995 * _1173;
    float _1225 = _1201 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1227 = _1193 + _1167;
    float _1229 = _1203 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1231 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _1233 = _1223 * _1225;
    float _1235 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1237 = _1235 * 0.5;
    float _1239 = _1141 * 6.283185482025146484375;
    float _1241 = cos(_1239);
    float _1243 = _1227 * _1189;
    float _1245 = _1243 * 0.5;
    float _1247 = _1223 * _1229;
    float _1249 = _1233 * _1169;
    float _1251 = -_201;
    int _1253 = _1115 ? as_type<int>(_1251) : as_type<int>(_201);
    float _1255 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1257 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1255);
    float _1259 = _1247 * _1231;
    float _1261 = -_183;
    int _1263 = _1007 ? as_type<int>(_1261) : as_type<int>(_183);
    float _1265 = _1191 * 6.283185482025146484375;
    float _1267 = cos(_1265);
    float _1269 = _1157 * _1221;
    float _1271 = _1133 * _1221;
    bool _1273 = !_579;
    float _1275 = _1273 ? _183 : as_type<float>(_1263);
    float _1277 = _1165 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1279 = !_591;
    float _1281 = _1279 ? _201 : as_type<float>(_1253);
    float _1283 = _1191 * 6.283185482025146484375;
    float _1285 = sin(_1283);
    float _1287 = _1133 * _1241;
    float _1289 = _1157 * _1241;
    float _1291 = _1275 + 0.5;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1295 = _1133 * _1267;
    float _1297 = _1241 * _1267;
    float _1299 = _1221 * _1267;
    float _1301 = _1295 * _1249;
    float _1303 = 1.0 / _1257;
    float _1305 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1307 = _1157 * _1267;
    float _1309 = -_1269;
    float _1311 = fma(_1285, _1287, _1309);
    float _1313 = -_1249;
    float _1315 = _1285 * _1313;
    float _1317 = fma(_1285, _1271, _1289);
    float _1319 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1321 = fma(_1311, _1259, _1301);
    float _1323 = fma(_1297, _1259, _1315);
    float _1325 = fma(_1285, _1289, _1271);
    float _1327 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1329 = fma(_1317, _1237, _1321);
    float _1331 = fma(_1299, _1237, _1323);
    float _1333 = _1291 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1335 = _1321;
    float _1337 = _1161;
    if (!_1213)
    {
        _1335 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1339 = _1335;
    float _1341 = _415 + _1329;
    float _1343 = _413 + _1331;
    float _1345 = -_1005;
    float _1347 = fma(_1107, _1345, _1161);
    float _1349 = -_1281;
    float _1351 = _1349 + 0.5;
    float _1353 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1355 = _1341 + _1353;
    float _1357 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1359 = _1343 + _1357;
    float _1361 = _1333 * _791;
    float _1363 = _1355 * _1355;
    float _1365 = _1339;
    float _1367 = _1361;
    float _1369 = _1347;
    float _1371 = _1343;
    float _1373 = _1341;
    if (!_1213)
    {
        _845 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1375 = _845;
    float _1377 = _1375;
    if (!_1213)
    {
        float _1379 = -_1339;
        float _1381 = _1379 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1337 = _1381;
    }
    float _1383 = _1337;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1387 = fma(_1359, _1359, _1363);
    float _1389 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1391 = fma(_1179, _1217, _1199);
    float _1393 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1395 = sqrt(_1387);
    float _1397 = _1389 * _871;
    if (!_1213)
    {
        float _1399 = -_1375;
        float _1401 = _1399 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _881 = _1401;
    }
    float _1403 = _881;
    out.m_44.x = _1305;
    out.m_44.y = _1393;
    out.m_44.z = _1327;
    out.m_44.w = _1277;
    float _1405 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1407 = -_1287;
    float _1409 = fma(_1285, _1269, _1407);
    float _1411 = _1383;
    if (!_1213)
    {
        float _1413 = 1.0 / _1383;
        _1411 = _1413;
    }
    float _1415 = _1411;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1421 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1213)
    {
        float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1425 = -_1339;
        float _1427 = fma(_1303, _1423, _1425);
        _1365 = _1427;
    }
    float _1429 = _1365;
    float _1431 = _1417 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1433 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1435 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1437 = _1389;
    float _1439 = _1431;
    if (!_1213)
    {
        float _1441 = 1.0 / _1403;
        _1437 = _1441;
    }
    float _1443 = _1437;
    bool _1445 = _1395 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1447 = _1307 * _1249;
    if (!_1213)
    {
        float _1449 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1451 = -_1375;
        float _1453 = fma(_1303, _1449, _1451);
        _1377 = _1453;
    }
    float _1455 = _1377;
    out.m_46.x = _1421;
    out.m_46.y = _1431;
    out.m_46.z = _1433;
    float _1457 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1459 = fma(_1325, _1259, _1447);
    float _1461 = -_1435;
    float _1463 = _1285 * _1461;
    out.m_48.x = _1361;
    out.m_48.y = _1397;
    out.m_48.z = _1347;
    out.m_48.w = _1391;
    float _1465 = fma(_1409, _1237, _1459);
    float _1467 = fma(_1297, _1457, _1463);
    float _1469 = _919 + _1465;
    float _1471 = _1455;
    if (_1213)
    {
        _1439 = 1.0;
    }
    float _1473 = _1439;
    float _1475 = _1473;
    if (!_1213)
    {
        float _1477 = _1429 * _1415;
        float _1479 = precise::clamp(_1477, 0.0, 1.0);
        _1475 = _1479;
    }
    float _1481 = _1475;
    if (!_1213)
    {
        float _1483 = _1455 * _1443;
        float _1485 = precise::clamp(_1483, 0.0, 1.0);
        _1471 = _1485;
    }
    float _1487 = _1471;
    float _1489 = _1307 * _1435;
    float _1491 = _1295 * _1435;
    if (_1213)
    {
        _1367 = 1.0;
    }
    float _1493 = _1367;
    float _1495 = _1493;
    if (!_1213)
    {
        float _1497 = -_1487;
        float _1499 = _1497 + 1.0;
        _1495 = _1499;
    }
    float _1501 = _1495;
    bool _1503 = _1481 > 0.0;
    bool _1505 = isnan(_1481);
    bool _1507 = _1503 || _1505;
    bool _1509 = isnan(0.0);
    bool _1511 = _1507 || _1509;
    float _1513 = fma(_1325, _1457, _1489);
    float _1515 = fma(_1311, _1457, _1491);
    if (!_1445)
    {
        _1369 = _1469;
    }
    float _1517 = _1369;
    bool _1519 = !_1445;
    float _1521 = _1517;
    if (!_1519)
    {
        float _1523 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1525 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1527 = _1395 + _1525;
        float _1529 = _1469 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1531 = rsqrt(_1387);
        float _1533 = _1527 * _1523;
        float _1535 = _1533 * 0.15915493667125701904296875;
        float _1537 = _1535 * 6.283185482025146484375;
        float _1539 = sin(_1537);
        float _1541 = _1535 * 6.283185482025146484375;
        float _1543 = cos(_1541);
        float _1545 = fma(_1539, _1529, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1547 = _1531 * _1545;
        float _1549 = _1543 + (-1.0);
        float _1551 = fma(_1359, _1547, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1553 = fma(_1355, _1547, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1555 = _1549 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1557 = fma(_1469, _1543, _1555);
        _1521 = _1557;
        _1371 = _1551;
        _1373 = _1553;
    }
    float _1559 = _1521;
    float _1561 = _1371;
    float _1563 = _1373;
    float _1565 = -_1033;
    float _1567 = fma(_1565, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1559);
    float _1569 = _1481 * _1501;
    float _1571 = -_1037;
    float _1573 = fma(_1571, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1561);
    bool _1575 = _1501 <= 0.0;
    bool _1577 = !_1511;
    bool _1579 = _1575 || _1577;
    float _1581 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1583 = _1569 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1585 = -_1073;
    float _1587 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1563);
    float _1589 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1591 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1581);
    float _1593 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1595 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1597 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1589);
    float _1599 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1591);
    float _1601 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1593);
    float _1603 = _355 * _1583;
    float _1605 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1597);
    float _1607 = _1599 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1609 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1601);
    float _1611 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1595);
    float _1613 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1615 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1617 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1619 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1621 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1623 = _1609 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1625 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1615);
    float _1627 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1611);
    float _1629 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1617);
    float _1631 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1619);
    float _1633 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1621);
    float _1635 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1625);
    float _1637 = _1627 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1639 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1629);
    float _1641 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1631);
    float _1643 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1633);
    float _1645 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1635);
    float _1647 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1639);
    float _1649 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1641);
    float _1651 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1643);
    float _1653 = _1317 + _1515;
    float _1655 = _1299 + _1467;
    float _1657 = _1409 + _1513;
    float _1659 = _1647 + _1651;
    float _1661 = _1649 + _1651;
    float _1663 = _1651 * 0.5;
    float _1665 = _1603 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1667 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1669 = _1573 + _1667;
    float _1671 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1673 = _1567 + _1671;
    float _1675 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1677 = _1587 + _1675;
    float _1679 = _1659 * 0.5;
    float _1681 = _1661 * 0.5;
    float _1683 = fma(_1645, -0.5, _1663);
    out.m_50.x = _1655;
    out.m_50.y = _1657;
    out.m_50.z = _1653;
    out.m_33.x = _1665;
    out.m_52.x = _1669;
    out.m_52.y = _1673;
    out.m_52.z = _1677;
    out.gl_Position.x = _1647;
    out.gl_Position.y = _1645;
    out.gl_Position.z = _1649;
    out.gl_Position.w = _1651;
    out.m_54.x = _1679;
    out.m_54.y = _1683;
    out.m_54.z = _1681;
    out.m_54.w = _1651;
    if (!_1579)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1685 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1685;
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
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _375 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_30.w;
    float _70 = trunc(_68);
    int _73 = int(_70);
    bool _77 = _73 >= 1;
    float _79 = 0.0;
    if (!_77)
    {
        _79 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _79;
    float _83 = _81;
    if (!_77)
    {
        out.m_33.x = 0.0;
    }
    int _85 = 0;
    if (!_77)
    {
        float _87 = _81 * 5.0;
        _85 = as_type<int>(_87);
    }
    int _89 = _85;
    int _91 = _89;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1742 = as_type<float>(_89);
        out.gl_Position.z = _1742;
    }
    if (!_77)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _93 = in.m_35.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _109 = _107;
    if (_103)
    {
        float _111 = float(_73);
        _83 = _111;
    }
    float _113 = _83;
    bool _115 = _107 >= _113;
    bool _117 = !_103;
    bool _119 = _115 || _117;
    float _121 = _113;
    if (_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    if (_119)
    {
        out.m_33.x = 0.0;
    }
    if (_119)
    {
        float _125 = _123 * 5.0;
        _91 = as_type<int>(_125);
    }
    int _127 = _91;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1812 = as_type<float>(_127);
        out.gl_Position.z = _1812;
    }
    if (_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_37.x;
    float _131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _133 = _107 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _139 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _141 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _143 = _139 || _141;
    bool _145 = isnan(1.0);
    bool _147 = _143 || _145;
    float _149 = _133 * _131;
    float _151 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[20].x, _149);
    float _153 = in.m_35.x;
    float _155 = in.m_35.y;
    float _157 = in.m_35.z;
    float _159 = floor(_151);
    float _161 = _151 * 6.283185482025146484375;
    int _163 = as_type<int>(_135) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_135) & 2;
    bool _169 = _167 != 0;
    int _171 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _173 = _171 != 0;
    float _175 = _161 * 0.15915493667125701904296875;
    float _177 = _175 * 6.283185482025146484375;
    float _179 = cos(_177);
    bool _181 = !_165;
    float _183 = _181 ? (-0.5) : 0.5;
    float _185 = -_159;
    float _187 = _151 + _185;
    float _189 = _151;
    float _191 = _137;
    if (!_147)
    {
        float _193 = _137 * _137;
        float _195 = _193 * 0.5;
        _189 = _195;
    }
    float _197 = _189;
    bool _199 = !_169;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = _197;
    if (!_147)
    {
        float _205 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _205;
    }
    float _207 = _203;
    bool _209 = !_147;
    float _211 = _207;
    if (!_209)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = _137 * _215;
        float _225 = 1.0 / _219;
        float _227 = _221 * 0.693147182464599609375;
        float _229 = exp2(_223);
        float _231 = 1.0 / _227;
        float _233 = _229 + (-1.0);
        float _235 = -_233;
        float _237 = fma(_235, _231, _137);
        float _239 = _237 * _225;
        float _241 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _241;
    }
    float _243 = _211;
    bool _245 = !_147;
    if (!_245)
    {
        float _247 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = log2(_247);
        float _251 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _253 = _251 + 1.0;
        float _255 = 1.0 / _253;
        float _257 = _137 * _249;
        float _259 = exp2(_257);
        float _261 = -_259;
        float _263 = _261 + 1.0;
        float _265 = _263 * _255;
        _191 = _265;
    }
    float _267 = _191;
    float _269 = in.m_42.w;
    float _271 = fma(_179, 0.5, 0.5);
    int _273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _275 = _273 != 0;
    int _277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _279 = _277 != 0;
    float _281 = in.m_30.x;
    float _283 = in.m_30.y;
    float _285 = in.m_30.z;
    float _287 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _289 = _187 < 0.5;
    float _291 = float(_289);
    float _293 = -_187;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _297 = !_275;
    int _299 = _297 ? 0 : 1;
    float _301 = -_271;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _305 = !_173;
    int _307 = _305 ? 0 : 1;
    float _309 = -_291;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _313 = abs(_299);
    float _315 = fma(_267, _153, _287);
    bool _317 = !_279;
    int _319 = _317 ? 0 : 1;
    float _321 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _323 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _325 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _327 = abs(_307);
    float _329 = fma(_267, _155, _321);
    int _331 = abs(_319);
    float _333 = fma(_267, _157, _325);
    float _335 = float(_313);
    float _337 = float(_327);
    float _339 = abs(_295);
    float _341 = _335 * _339;
    float _343 = fma(_315, _269, _281);
    float _345 = fma(_329, _269, _283);
    float _347 = float(_331);
    float _349 = fma(_337, _303, _341);
    float _351 = fma(_333, _269, _285);
    float _353 = abs(_311);
    float _355 = fma(_347, _353, _349);
    bool _357 = !_323;
    float _373;
    if (!_357)
    {
        float _359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _361 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _363 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _365 = _363 * _359;
        float _367 = floor(_365);
        float _369 = -_367;
        float _371 = _365 + _369;
        _373 = _371;
        _375 = true;
    }
    else
    {
        float _377 = float(_73);
        float _379 = 1.0 / _377;
        float _381 = _107 * _379;
        _373 = _381;
    }
    _375 = false;
    float _383 = _373;
    float _385 = in.m_37.z;
    float _387 = in.m_37.w;
    float _389 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _391 = log2(_389);
    float _393 = _345 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _395 = _345 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _397 = _129 * 2.0;
    float _399 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].x, _393);
    float _401 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].x, _395);
    float _403 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[4].z, _399);
    float _405 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[6].z, _401);
    float _407 = floor(_397);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _413 = _403 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _415 = _405 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _417 = _391 * _107;
    float _419 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _421 = _413 + _419;
    float _423 = -_415;
    float _425 = _423 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _427 = exp2(_417);
    float _429 = _385 * 2.0;
    float _431 = abs(_421);
    float _433 = abs(_425);
    float _435 = precise::max(_431, _433);
    bool _437 = _435 >= 16.0;
    float _439 = _421 * 0.0625;
    float _441 = floor(_429);
    int _443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _445 = _443 != 0;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _449 = _447 != 0;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _453 = _451 != 0;
    bool _455 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _457 = isnan(0.0);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _463 = _459 || _461;
    float _465 = _437 ? _439 : _421;
    float _467 = -_427;
    float _469 = _467 + 1.0;
    float _471 = _425;
    bool _473 = _445;
    int _475 = _453 ? (-1) : 0;
    float _477 = _465;
    float _479 = _383;
    if (_437)
    {
        float _481 = _425 * 0.0625;
        _471 = _481;
    }
    float _483 = _471;
    float _485 = abs(_465);
    bool _487 = _485 != 0.0;
    bool _489 = isnan(_485);
    bool _491 = _487 || _489;
    bool _493 = isnan(0.0);
    bool _495 = _491 || _493;
    float _497 = _463 ? _469 : 0.0;
    bool _499 = _441 >= 0.0;
    bool _501 = isnan(_441);
    bool _503 = _499 || _501;
    bool _505 = isnan(0.0);
    bool _507 = _503 || _505;
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _511 = _509 != 0;
    bool _513 = !_449;
    int _515 = _513 ? 0 : 1;
    bool _517 = _441 > 0.0;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _523 = _507 ? 0 : 1;
    float _525 = 1.0 / _521;
    float _527 = abs(_483);
    bool _529 = _527 == 0.0;
    bool _531 = !_495;
    bool _533 = _529 && _531;
    int _535 = ~_523;
    int _537 = _535 + 1;
    int _539 = _537 + 1;
    float _541 = abs(_483);
    bool _543 = _541 == 0.0;
    int _545 = _539;
    if (!_517)
    {
        int _547 = ~_523;
        int _549 = _547 + 1;
        _545 = _549;
    }
    int _551 = _545;
    float _553 = _345 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _555 = _387 > 0.5;
    bool _557 = !_445;
    int _559 = _557 ? 0 : 1;
    float _561 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].x, _553);
    int _563 = as_type<int>(_553);
    if (_533)
    {
        bool _565 = as_type<int>(_483) >= 0;
        _473 = _565;
    }
    bool _567 = _473;
    bool _569 = !_453;
    int _571 = _569 ? 0 : 1;
    if (_533)
    {
        int _573 = _567 ? 0 : 1078530011;
        _563 = _573;
    }
    int _575 = _563;
    int _577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _579 = _577 != 0;
    int _581 = _575;
    if (_533)
    {
        int _583 = int(0x80000000) & as_type<int>(_465);
        int _585 = _575 | _583;
        _581 = _585;
    }
    int _587 = _581;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _591 = _589 != 0;
    bool _593 = !_495;
    bool _595 = _593 && _543;
    int _597 = _587;
    float _599 = as_type<float>(_587);
    if (!_595)
    {
        float _601 = abs(_465);
        bool _603 = _601 != as_type<float>(0x7f800000u /* inf */);
        bool _605 = isnan(_601);
        bool _607 = _603 || _605;
        bool _609 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _611 = _607 || _609;
        float _613 = abs(_483);
        bool _615 = _613 == as_type<float>(0x7f800000u /* inf */);
        bool _617 = !_611;
        bool _619 = _615 && _617;
        if (_619)
        {
            _597 = 1075235812;
        }
        int _621 = _597;
        int _623 = _621;
        if (_619)
        {
            bool _625 = as_type<int>(_483) >= 0;
            _475 = _625 ? (-1) : 0;
        }
        int _627 = _475;
        if (_619)
        {
            int _629 = ~_627;
            int _631 = (_629 != 0) ? _621 : 1061752795;
            _623 = _631;
        }
        int _633 = _623;
        float _635 = as_type<float>(_633);
        if (_619)
        {
            int _637 = int(0x80000000) & as_type<int>(_465);
            int _639 = _633 | _637;
            _635 = as_type<float>(_639);
        }
        float _641 = _635;
        float _643 = abs(_483);
        bool _645 = _643 == as_type<float>(0x7f800000u /* inf */);
        bool _647 = !_611;
        bool _649 = _647 && _645;
        _599 = _641;
        if (!_649)
        {
            float _651 = abs(_465);
            float _653 = abs(_483);
            float _655 = precise::max(_651, _653);
            float _657 = abs(_465);
            float _659 = abs(_483);
            float _661 = precise::min(_657, _659);
            float _663 = 1.0 / _655;
            float _665 = abs(_465);
            float _667 = abs(_483);
            bool _669 = _665 > _667;
            float _671 = _661 * _663;
            float _673 = abs(_465);
            float _675 = abs(_483);
            float _677 = _673 + _675;
            int _679 = as_type<int>(_465) & int(0x80000000);
            float _681 = _671 * _671;
            float _683 = _681 + 11.33538818359375;
            float _685 = fma(_681, _683, 28.84246826171875);
            float _687 = fma(_681, _685, 19.6966705322265625);
            float _689 = fma(_681, -0.82336294651031494140625, -5.674867153167724609375);
            float _691 = fma(_681, _689, -6.565555095672607421875);
            float _693 = 1.0 / _687;
            float _695 = _681 * _691;
            float _697 = _671 * _695;
            float _699 = fma(_697, _693, _671);
            float _701 = _699;
            _477 = as_type<float>(_679);
            _599 = _677;
            if (_669)
            {
                float _703 = -_699;
                float _705 = _703 + 1.57079637050628662109375;
                _701 = _705;
            }
            float _707 = _701;
            bool _709 = as_type<int>(_483) >= 0;
            int _711 = as_type<int>(_707);
            if (!_709)
            {
                float _713 = -_707;
                float _715 = _713 + 3.1415927410125732421875;
                _711 = as_type<int>(_715);
            }
            int _717 = _711;
            bool _719 = _677 > as_type<float>(0x7f800000u /* inf */);
            bool _721 = isnan(_677);
            bool _723 = _719 || _721;
            bool _725 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _727 = _723 || _725;
            if (!_727)
            {
                int _729 = _679 | _717;
                _599 = as_type<float>(_729);
            }
        }
    }
    float _731 = _477;
    float _733 = _599;
    float _735 = 1.0 / _411;
    float _737 = in.m_37.y;
    float _739 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[5].z, _561);
    bool _741 = _407 >= 0.0;
    bool _743 = isnan(_407);
    bool _745 = _741 || _743;
    bool _747 = isnan(0.0);
    bool _749 = _745 || _747;
    float _751 = _731;
    if (!_511)
    {
        float _753 = in.m_37.z;
        _751 = _753;
    }
    float _755 = _751;
    float _757 = _129 + _385;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _759;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _767 = _749 ? 0 : 1;
    float _769 = _757 + (-1.0);
    bool _771 = _407 > 0.0;
    float _773 = _761 * _525;
    bool _775 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _777 = isnan(_383);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _789 = _383 + _787;
    float _791 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _793 = float(_551);
    float _795 = _765 * _735;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _799 = _383 + _797;
    float _801 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _803 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _805 = isnan(_383);
    bool _807 = _803 || _805;
    bool _809 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _811 = _807 || _809;
    float _813 = float(_811);
    float _815 = -_785;
    float _817 = _815 + 1.0;
    float _819 = fma(_773, _799, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _821 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _823 = isnan(_383);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = fma(_795, _789, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _835 = _813 * _817;
    float _837 = -_813;
    float _839 = _837 + 1.0;
    float _841 = _813;
    float _843 = _789;
    float _845 = _791;
    if (!_511)
    {
        _841 = _737;
    }
    float _847 = _841;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _851 = _847;
    float _853 = _755;
    if (!_511)
    {
        _843 = _755;
    }
    float _855 = _843;
    float _857 = _831 * _839;
    float _859 = _855;
    if (!_511)
    {
        _479 = _847;
    }
    float _861 = _479;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _865 = _861;
    if (_511)
    {
        _851 = _737;
    }
    float _867 = _851;
    float _869 = _819 * _857;
    float _871 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _873 = ~_767;
    int _875 = _873 + 1;
    int _877 = _875 + 1;
    int _879 = _877;
    float _881 = _871;
    if (_511)
    {
        _853 = _867;
    }
    float _883 = _853;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_771)
    {
        int _887 = ~_767;
        int _889 = _887 + 1;
        _879 = _889;
    }
    int _891 = _879;
    float _893 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[83].w, _849);
    if (_511)
    {
        _865 = _129;
    }
    float _895 = _865;
    float _897 = _867 * 2.0;
    if (_511)
    {
        _859 = _867;
    }
    float _899 = _859;
    bool _901 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _903 = isnan(1.0);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _909 = _905 || _907;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _913 = 1.0 + _911;
    float _915 = _895 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _917 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[83].z, _885);
    float _919 = _739 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _921 = abs(_559);
    float _923 = 1.0 / _913;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _927 = -_863;
    float _929 = fma(_915, 2.0, _927);
    float _931 = _899 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _933 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _935 = _919 + _933;
    float _937 = float(_921);
    float _939 = _385 + _867;
    float _941 = _129 + _867;
    float _943 = floor(_897);
    float _945 = fma(_931, -2.0, _925);
    float _947 = _935 * _935;
    float _949 = _939 + (-1.0);
    float _951 = _937 * _793;
    float _953 = _941 + (-1.0);
    float _955 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[82].z, _917);
    float _957 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _959 = _415 + _957;
    float _961 = fma(_421, _421, _947);
    float _963 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _965 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _967 = -_107;
    float _969 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[81].x, _929);
    float _971 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[82].w, _893);
    float _973 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[81].y, _945);
    float _975 = fma(_959, _959, _961);
    if (_909)
    {
        float _977 = _497 * _923;
        _109 = _977;
    }
    float _979 = _109;
    int _981 = abs(_515);
    float _983 = _951 * (-2.0);
    bool _985 = _943 >= 0.0;
    bool _987 = isnan(_943);
    bool _989 = _985 || _987;
    bool _991 = isnan(0.0);
    bool _993 = _989 || _991;
    float _995 = rsqrt(_975);
    float _997 = float(_981);
    float _999 = fma(_965, _983, _965);
    int _1001 = _993 ? 0 : 1;
    float _1003 = -_955;
    float _1005 = _1003 + 1.0;
    bool _1007 = _129 > 0.5;
    float _1009 = _129 + (-0.5);
    float _1011 = float(_891);
    float _1013 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1015 = _943 > 0.0;
    float _1017 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    int _1019 = abs(_571);
    float _1021 = _997 * _1011;
    int _1023 = ~_1001;
    int _1025 = _1023 + 1;
    int _1027 = _1025 + 1;
    float _1029 = fma(_999, _979, _1017);
    float _1031 = float(_1019);
    float _1033 = _935 * _995;
    float _1035 = _1021 * (-2.0);
    float _1037 = _421 * _995;
    int _1039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1041 = _1039 != 0;
    float _1043 = -_1033;
    float _1045 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[18].w, _935);
    float _1047 = fma(_963, _1035, _963);
    float _1049 = -_1037;
    float _1051 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[18].w, _421);
    int _1053 = _1027;
    if (!_1015)
    {
        int _1055 = ~_1001;
        int _1057 = _1055 + 1;
        _1053 = _1057;
    }
    int _1059 = _1053;
    float _1061 = _1045 * _1045;
    bool _1063 = _385 > 0.5;
    float _1065 = -_1033;
    float _1067 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[18].w, _919);
    float _1069 = float(_1059);
    float _1071 = fma(_1051, _1051, _1061);
    float _1073 = _959 * _995;
    float _1075 = -_183;
    int _1077 = _1063 ? as_type<int>(_1075) : as_type<int>(_183);
    float _1079 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1081 = _1031 * _1069;
    float _1083 = -_1073;
    float _1085 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[18].w, _959);
    float _1087 = _867 + (-0.5);
    float _1089 = _1029 * 0.15915493667125701904296875;
    float _1091 = -_1037;
    float _1093 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[18].w, _413);
    float _1095 = fma(_1085, _1085, _1071);
    float _1097 = -_831;
    float _1099 = _1097 + 1.0;
    float _1101 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1103 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1105 = !_1041;
    float _1107 = _1105 ? _183 : as_type<float>(_1077);
    float _1109 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[115].x, _869);
    float _1111 = _1081 * (-2.0);
    float _1113 = fma(_1047, _979, _1101);
    bool _1115 = _867 > 0.5;
    float _1117 = fma(_833, _835, _1109);
    float _1119 = fma(_801, _1111, _801);
    float _1121 = -_733;
    float _1123 = _1113 + _1121;
    float _1125 = _385 + (-0.5);
    float _1127 = in.m_42.x;
    float _1129 = in.m_42.y;
    float _1131 = _1089 * 6.283185482025146484375;
    float _1133 = sin(_1131);
    float _1135 = -_1073;
    float _1137 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[18].w, _415);
    float _1139 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1103);
    float _1141 = _1123 * 0.15915493667125701904296875;
    float _1143 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1145 = -_201;
    int _1147 = _555 ? as_type<int>(_1145) : as_type<int>(_201);
    float _1149 = _1107 + 0.5;
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1153 = _1151 != 0;
    float _1155 = _1089 * 6.283185482025146484375;
    float _1157 = cos(_1155);
    float _1159 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1139);
    float _1161 = fma(_1143, _1149, _969);
    float _1163 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1165 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1117);
    float _1167 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1169 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _1171 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1163);
    float _1173 = sqrt(_1095);
    float _1175 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    bool _1177 = !_1153;
    float _1179 = _1177 ? _201 : as_type<float>(_1147);
    float _1181 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1171);
    float _1183 = fma(_1119, _979, _1175);
    float _1185 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1187 = _1179 + (-0.5);
    float _1189 = 1.0 / _1167;
    float _1191 = _1183 * 0.15915493667125701904296875;
    float _1193 = _1181 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1195 = -_1185;
    float _1197 = -_973;
    float _1199 = fma(_1195, _1187, _1197);
    float _1201 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1203 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _1205 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1207 = isnan(0.5);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1213 = _1209 || _1211;
    float _1215 = -_971;
    float _1217 = _1215 + 1.0;
    float _1219 = _1141 * 6.283185482025146484375;
    float _1221 = sin(_1219);
    float _1223 = _995 * _1173;
    float _1225 = _1201 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1227 = _1193 + _1167;
    float _1229 = _1203 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1231 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _1233 = _1223 * _1225;
    float _1235 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1237 = _1235 * 0.5;
    float _1239 = _1141 * 6.283185482025146484375;
    float _1241 = cos(_1239);
    float _1243 = _1227 * _1189;
    float _1245 = _1243 * 0.5;
    float _1247 = _1223 * _1229;
    float _1249 = _1233 * _1169;
    float _1251 = -_201;
    int _1253 = _1115 ? as_type<int>(_1251) : as_type<int>(_201);
    float _1255 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1257 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1255);
    float _1259 = _1247 * _1231;
    float _1261 = -_183;
    int _1263 = _1007 ? as_type<int>(_1261) : as_type<int>(_183);
    float _1265 = _1191 * 6.283185482025146484375;
    float _1267 = cos(_1265);
    float _1269 = _1157 * _1221;
    float _1271 = _1133 * _1221;
    bool _1273 = !_579;
    float _1275 = _1273 ? _183 : as_type<float>(_1263);
    float _1277 = _1165 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1279 = !_591;
    float _1281 = _1279 ? _201 : as_type<float>(_1253);
    float _1283 = _1191 * 6.283185482025146484375;
    float _1285 = sin(_1283);
    float _1287 = _1133 * _1241;
    float _1289 = _1157 * _1241;
    float _1291 = _1275 + 0.5;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1295 = _1133 * _1267;
    float _1297 = _1241 * _1267;
    float _1299 = _1221 * _1267;
    float _1301 = _1295 * _1249;
    float _1303 = 1.0 / _1257;
    float _1305 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1307 = _1157 * _1267;
    float _1309 = -_1269;
    float _1311 = fma(_1285, _1287, _1309);
    float _1313 = -_1249;
    float _1315 = _1285 * _1313;
    float _1317 = fma(_1285, _1271, _1289);
    float _1319 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1321 = fma(_1311, _1259, _1301);
    float _1323 = fma(_1297, _1259, _1315);
    float _1325 = fma(_1285, _1289, _1271);
    float _1327 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1329 = fma(_1317, _1237, _1321);
    float _1331 = fma(_1299, _1237, _1323);
    float _1333 = _1291 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1335 = _1321;
    float _1337 = _1161;
    if (!_1213)
    {
        _1335 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1339 = _1335;
    float _1341 = _415 + _1329;
    float _1343 = _413 + _1331;
    float _1345 = -_1005;
    float _1347 = fma(_1107, _1345, _1161);
    float _1349 = -_1281;
    float _1351 = _1349 + 0.5;
    float _1353 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1355 = _1341 + _1353;
    float _1357 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1359 = _1343 + _1357;
    float _1361 = _1333 * _791;
    float _1363 = _1355 * _1355;
    float _1365 = _1339;
    float _1367 = _1361;
    float _1369 = _1347;
    float _1371 = _1343;
    float _1373 = _1341;
    if (!_1213)
    {
        _845 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1375 = _845;
    float _1377 = _1375;
    if (!_1213)
    {
        float _1379 = -_1339;
        float _1381 = _1379 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1337 = _1381;
    }
    float _1383 = _1337;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1387 = fma(_1359, _1359, _1363);
    float _1389 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1391 = fma(_1179, _1217, _1199);
    float _1393 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1395 = sqrt(_1387);
    float _1397 = _1389 * _871;
    if (!_1213)
    {
        float _1399 = -_1375;
        float _1401 = _1399 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _881 = _1401;
    }
    float _1403 = _881;
    out.m_44.x = _1305;
    out.m_44.y = _1393;
    out.m_44.z = _1327;
    out.m_44.w = _1277;
    float _1405 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1407 = -_1287;
    float _1409 = fma(_1285, _1269, _1407);
    float _1411 = _1383;
    if (!_1213)
    {
        float _1413 = 1.0 / _1383;
        _1411 = _1413;
    }
    float _1415 = _1411;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1421 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1213)
    {
        float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1425 = -_1339;
        float _1427 = fma(_1303, _1423, _1425);
        _1365 = _1427;
    }
    float _1429 = _1365;
    float _1431 = _1417 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1433 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1435 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1437 = _1389;
    float _1439 = _1431;
    if (!_1213)
    {
        float _1441 = 1.0 / _1403;
        _1437 = _1441;
    }
    float _1443 = _1437;
    bool _1445 = _1395 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1447 = _1307 * _1249;
    if (!_1213)
    {
        float _1449 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1451 = -_1375;
        float _1453 = fma(_1303, _1449, _1451);
        _1377 = _1453;
    }
    float _1455 = _1377;
    out.m_46.x = _1421;
    out.m_46.y = _1431;
    out.m_46.z = _1433;
    float _1457 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1459 = fma(_1325, _1259, _1447);
    float _1461 = -_1435;
    float _1463 = _1285 * _1461;
    out.m_48.x = _1361;
    out.m_48.y = _1397;
    out.m_48.z = _1347;
    out.m_48.w = _1391;
    float _1465 = fma(_1409, _1237, _1459);
    float _1467 = fma(_1297, _1457, _1463);
    float _1469 = _919 + _1465;
    float _1471 = _1455;
    if (_1213)
    {
        _1439 = 1.0;
    }
    float _1473 = _1439;
    float _1475 = _1473;
    if (!_1213)
    {
        float _1477 = _1429 * _1415;
        float _1479 = precise::clamp(_1477, 0.0, 1.0);
        _1475 = _1479;
    }
    float _1481 = _1475;
    if (!_1213)
    {
        float _1483 = _1455 * _1443;
        float _1485 = precise::clamp(_1483, 0.0, 1.0);
        _1471 = _1485;
    }
    float _1487 = _1471;
    float _1489 = _1307 * _1435;
    float _1491 = _1295 * _1435;
    if (_1213)
    {
        _1367 = 1.0;
    }
    float _1493 = _1367;
    float _1495 = _1493;
    if (!_1213)
    {
        float _1497 = -_1487;
        float _1499 = _1497 + 1.0;
        _1495 = _1499;
    }
    float _1501 = _1495;
    bool _1503 = _1481 > 0.0;
    bool _1505 = isnan(_1481);
    bool _1507 = _1503 || _1505;
    bool _1509 = isnan(0.0);
    bool _1511 = _1507 || _1509;
    float _1513 = fma(_1325, _1457, _1489);
    float _1515 = fma(_1311, _1457, _1491);
    if (!_1445)
    {
        _1369 = _1469;
    }
    float _1517 = _1369;
    bool _1519 = !_1445;
    float _1521 = _1517;
    if (!_1519)
    {
        float _1523 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1525 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1527 = _1395 + _1525;
        float _1529 = _1469 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1531 = rsqrt(_1387);
        float _1533 = _1527 * _1523;
        float _1535 = _1533 * 0.15915493667125701904296875;
        float _1537 = _1535 * 6.283185482025146484375;
        float _1539 = sin(_1537);
        float _1541 = _1535 * 6.283185482025146484375;
        float _1543 = cos(_1541);
        float _1545 = fma(_1539, _1529, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1547 = _1531 * _1545;
        float _1549 = _1543 + (-1.0);
        float _1551 = fma(_1359, _1547, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1553 = fma(_1355, _1547, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1555 = _1549 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1557 = fma(_1469, _1543, _1555);
        _1521 = _1557;
        _1371 = _1551;
        _1373 = _1553;
    }
    float _1559 = _1521;
    float _1561 = _1371;
    float _1563 = _1373;
    float _1565 = -_1033;
    float _1567 = fma(_1565, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1559);
    float _1569 = _1481 * _1501;
    float _1571 = -_1037;
    float _1573 = fma(_1571, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1561);
    bool _1575 = _1501 <= 0.0;
    bool _1577 = !_1511;
    bool _1579 = _1575 || _1577;
    float _1581 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1583 = _1569 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1585 = -_1073;
    float _1587 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1563);
    float _1589 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1591 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1581);
    float _1593 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1595 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1597 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1589);
    float _1599 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1591);
    float _1601 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1593);
    float _1603 = _355 * _1583;
    float _1605 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1597);
    float _1607 = _1599 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1609 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1601);
    float _1611 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1595);
    float _1613 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1615 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1617 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1619 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1621 = _1607 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1623 = _1609 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1625 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1615);
    float _1627 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1611);
    float _1629 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1617);
    float _1631 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1619);
    float _1633 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1621);
    float _1635 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1625);
    float _1637 = _1627 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1639 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1629);
    float _1641 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1631);
    float _1643 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1633);
    float _1645 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1635);
    float _1647 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1639);
    float _1649 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1641);
    float _1651 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1643);
    float _1653 = _1317 + _1515;
    float _1655 = _1299 + _1467;
    float _1657 = _1409 + _1513;
    float _1659 = _1647 + _1651;
    float _1661 = _1649 + _1651;
    float _1663 = _1651 * 0.5;
    float _1665 = _1603 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1667 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1669 = _1573 + _1667;
    float _1671 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1673 = _1567 + _1671;
    float _1675 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1677 = _1587 + _1675;
    float _1679 = _1659 * 0.5;
    float _1681 = _1661 * 0.5;
    float _1683 = fma(_1645, -0.5, _1663);
    out.m_50.x = _1655;
    out.m_50.y = _1657;
    out.m_50.z = _1653;
    out.m_33.x = _1665;
    out.m_52.x = _1669;
    out.m_52.y = _1673;
    out.m_52.z = _1677;
    out.gl_Position.x = _1647;
    out.gl_Position.y = _1645;
    out.gl_Position.z = _1649;
    out.gl_Position.w = _1651;
    out.m_54.x = _1679;
    out.m_54.y = _1683;
    out.m_54.z = _1681;
    out.m_54.w = _1651;
    if (!_1579)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1685 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1685;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

