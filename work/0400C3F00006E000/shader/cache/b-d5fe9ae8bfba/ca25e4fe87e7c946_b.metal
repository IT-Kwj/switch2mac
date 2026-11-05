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
    float4 m_52 [[user(locn1)]];
    float4 m_54 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_46 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_39 [[attribute(4)]];
    float4 m_48 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1495 = false;
    bool _893 = false;
    bool _791 = false;
    bool _401 = false;
    bool _255 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_32.w;
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
        out.m_35.x = 0.0;
    }
    int _85 = 0;
    if (!_77)
    {
        float _87 = _81 * 5.0;
        _85 = as_type<int>(_87);
    }
    int _89 = _85;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1955 = as_type<float>(_89);
        out.gl_Position.z = _1955;
    }
    if (!_77)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _91 = in.m_37.w;
    float _93 = in.m_39.z;
    bool _95 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_91);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_91;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_41.z = _93;
    float _109 = 0.0;
    if (_103)
    {
        float _111 = float(_73);
        _109 = _111;
    }
    float _113 = _109;
    bool _115 = _107 >= _113;
    bool _117 = !_103;
    bool _119 = _115 || _117;
    if (_119)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _83;
    if (_119)
    {
        out.m_35.x = 0.0;
    }
    int _123 = 0;
    if (_119)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2027 = as_type<float>(_127);
        out.gl_Position.z = _2027;
    }
    if (_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_39.x;
    float _131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _133 = _107 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = _133 * _131;
    float _139 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[20].x, _137);
    int _141 = as_type<int>(_135) & 1;
    bool _143 = _141 != 0;
    int _145 = as_type<int>(_135) & 2;
    bool _147 = _145 != 0;
    float _149 = _139 * 6.283185482025146484375;
    float _151 = floor(_139);
    float _153 = _149 * 0.15915493667125701904296875;
    bool _155 = !_147;
    int _157 = _155 ? (-1090519040) : 1056964608;
    int _159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _161 = _159 != 0;
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _165 = _163 != 0;
    float _167 = _153 * 6.283185482025146484375;
    float _169 = cos(_167);
    bool _171 = !_143;
    int _173 = _171 ? (-1090519040) : 1056964608;
    int _175 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _177 = _175 != 0;
    bool _179 = !_161;
    int _181 = _179 ? 0 : 1;
    out.m_46.x = as_type<float>(_173);
    out.m_46.y = as_type<float>(_157);
    bool _183 = !_177;
    int _185 = _183 ? 0 : 1;
    float _187 = -_151;
    float _189 = _139 + _187;
    int _191 = abs(_181);
    int _193 = abs(_185);
    float _195 = -_189;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _199 = !_165;
    int _201 = _199 ? 0 : 1;
    float _203 = fma(_169, 0.5, 0.5);
    float _205 = float(_191);
    bool _207 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _209 = abs(_201);
    float _211 = abs(_197);
    float _213 = _205 * _211;
    bool _215 = _189 < 0.5;
    float _217 = float(_215);
    float _219 = -_203;
    float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _223 = float(_193);
    float _225 = -_217;
    float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _229 = float(_209);
    float _231 = fma(_223, _221, _213);
    float _233 = abs(_227);
    float _235 = fma(_229, _233, _231);
    bool _237 = !_207;
    float _253;
    if (!_237)
    {
        float _239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _241 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _245 = _243 * _239;
        float _247 = floor(_245);
        float _249 = -_247;
        float _251 = _245 + _249;
        _253 = _251;
        _255 = true;
    }
    else
    {
        float _257 = float(_73);
        float _259 = 1.0 / _257;
        float _261 = _107 * _259;
        _253 = _261;
    }
    _255 = false;
    float _263 = _253;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = _263 + _265;
    bool _269 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _271 = isnan(_263);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    bool _281 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _283 = isnan(_263);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = -_279;
    float _303 = _301 + 1.0;
    float _305 = 1.0 / _295;
    bool _307 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _309 = isnan(_263);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = _291 * _303;
    float _321 = -_291;
    float _323 = _321 + 1.0;
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _327 = _317 * _323;
    float _329 = 1.0 / _299;
    float _331 = -_317;
    float _333 = _331 + 1.0;
    float _335 = _267 * _305;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _339 = _263 + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _345;
    float _349 = fma(_343, _335, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _351 = fma(_347, _335, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _353 = _339 * _329;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _359 = _349 * _327;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _365 = _351 * _327;
    float _367 = fma(_357, _353, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _369 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].x, _359);
    float _371 = fma(_363, _353, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _373 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].y, _365);
    float _375 = fma(_367, _319, _369);
    float _377 = fma(_371, _319, _373);
    float _379 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[145].x, _375);
    float _381 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[145].y, _377);
    bool _383 = !_325;
    float _399;
    if (!_383)
    {
        float _385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _387 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _389 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[11].x, _107);
        float _391 = _389 * _385;
        float _393 = floor(_391);
        float _395 = -_393;
        float _397 = _391 + _395;
        _399 = _397;
        _401 = true;
    }
    else
    {
        float _403 = float(_73);
        float _405 = 1.0 / _403;
        float _407 = _107 * _405;
        _399 = _407;
    }
    _401 = false;
    float _409 = _399;
    float _411 = in.m_48.x;
    float _413 = in.m_48.y;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _423;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _431 = 1.0 / _417;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _433;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _441 = 1.0 / _425;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _445 = _409 + _443;
    bool _447 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _449 = isnan(_409);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    bool _459 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _461 = isnan(_409);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    bool _471 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _473 = isnan(_409);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = 1.0 / _421;
    float _485 = _445 * _431;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _489 = _409 + _487;
    float _491 = _381 * _413;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _495 = _409 + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _497;
    float _501 = -_469;
    float _503 = _501 + 1.0;
    bool _505 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _507 = isnan(_409);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _513 = _509 || _511;
    float _515 = float(_513);
    float _517 = 1.0 / _439;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _521 = _409 + _519;
    float _523 = _489 * _441;
    bool _525 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _527 = isnan(_409);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = -_457;
    float _539 = _537 + 1.0;
    float _541 = fma(_499, _485, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _543 = _379 * _411;
    float _545 = 1.0 / _429;
    float _547 = _521 * _483;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _551 = _409 + _549;
    float _553 = -_535;
    float _555 = _553 + 1.0;
    float _557 = _457 * _555;
    float _559 = 1.0 / _435;
    float _561 = _551 * _517;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _563;
    bool _567 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _569 = fma(_565, _485, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _571 = _469 * _539;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _579 = _409 + _577;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _589 = fma(_575, _547, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _591 = _579 * _545;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _593;
    float _597 = -_481;
    float _599 = _597 + 1.0;
    float _601 = _495 * _559;
    float _603 = fma(_583, _547, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _605 = fma(_595, _485, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _607 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _609 = isnan(_409);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _615 = _611 || _613;
    float _617 = float(_615);
    float _619 = _481 * _503;
    bool _621 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _623 = isnan(_409);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = fma(_587, _547, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _635;
    float _639 = _617 * _599;
    float _641 = -_617;
    float _643 = _641 + 1.0;
    float _645 = -_631;
    float _647 = _645 + 1.0;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _649;
    float _653 = _631 * _643;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _655;
    float _659 = _515 * _647;
    float _661 = fma(_651, _601, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _663 = -_515;
    float _665 = _663 + 1.0;
    float _667 = fma(_657, _601, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _669 = _541 * _659;
    float _671 = fma(_637, _601, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _673 = _569 * _659;
    float _675 = _605 * _659;
    float _677 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[107].z, _669);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _681 = _679 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _683 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[107].x, _673);
    float _685 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[107].y, _675);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _691 = fma(_633, _653, _677);
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _697 = fma(_603, _653, _683);
    float _699 = fma(_589, _653, _685);
    float _701 = fma(_681, _561, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _703 = fma(_689, _561, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _705 = fma(_695, _561, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _707 = fma(_667, _639, _697);
    float _709 = fma(_661, _639, _699);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _711;
    float _715 = fma(_671, _639, _691);
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _717;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _721;
    float _725 = fma(_713, _523, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _727 = fma(_701, _619, _707);
    float _729 = fma(_703, _619, _709);
    float _731 = fma(_705, _619, _715);
    float _733 = fma(_719, _523, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _743 = fma(_723, _523, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _749 = fma(_725, _571, _727);
    float _751 = fma(_737, _591, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _753 = fma(_741, _591, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _755 = fma(_747, _591, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _757 = fma(_733, _571, _729);
    float _759 = fma(_743, _571, _731);
    float _761 = fma(_751, _557, _749);
    float _763 = fma(_753, _557, _757);
    float _765 = fma(_755, _557, _759);
    float _767 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[113].x, _761);
    float _769 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[113].y, _763);
    float _771 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[113].z, _765);
    bool _773 = !_567;
    float _789;
    if (!_773)
    {
        float _775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _777 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _779 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _781 = _779 * _775;
        float _783 = floor(_781);
        float _785 = -_783;
        float _787 = _781 + _785;
        _789 = _787;
        _791 = true;
    }
    else
    {
        float _793 = float(_73);
        float _795 = 1.0 / _793;
        float _797 = _107 * _795;
        _789 = _797;
    }
    _791 = false;
    float _799 = _789;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _803 = _799 + _801;
    bool _805 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _807 = isnan(_799);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _813 = _809 || _811;
    float _815 = float(_813);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _819 = _817 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _821 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _823 = isnan(_799);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _833;
    float _837 = _767 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _839 = -_815;
    float _841 = _839 + 1.0;
    bool _843 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _845 = 1.0 / _819;
    float _847 = _831 * _841;
    float _849 = -_831;
    float _851 = _849 + 1.0;
    float _853 = _835 * _845;
    float _855 = _771 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _857 = fma(_853, _803, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _859 = _857 * _847;
    float _861 = _769 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _863 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[115].x, _859);
    float _865 = _837 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _867 = _861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _869 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[116].x, _863);
    float _871 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _873 = _869 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_50.x = _865;
    out.m_50.y = _867;
    out.m_50.z = _871;
    out.m_50.w = _873;
    bool _875 = !_843;
    float _891;
    if (!_875)
    {
        float _877 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _879 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _881 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[11].z, _107);
        float _883 = _881 * _877;
        float _885 = floor(_883);
        float _887 = -_885;
        float _889 = _883 + _887;
        _891 = _889;
        _893 = true;
    }
    else
    {
        float _895 = float(_73);
        float _897 = 1.0 / _895;
        float _899 = _107 * _897;
        _891 = _899;
    }
    _893 = false;
    float _901 = _891;
    float _903 = in.m_32.x;
    float _905 = in.m_32.y;
    float _907 = in.m_32.z;
    float _909 = _235 * _543;
    float _911 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_173));
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _913;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _921;
    float _925 = _909 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _927 = 1.0 / _915;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _931 = _929 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _933 = _235 * _491;
    float _935 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_157));
    float _937 = _925 * _911;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _941 = _901 + _939;
    float _943 = _933 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _945 = 1.0 / _923;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _951 = _943 * _935;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _955 = _901 + _953;
    float _957 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _959 = _905 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _961 = _905 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _963 = 1.0 / _919;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _965;
    float _969 = fma(_903, (*spvDescriptorSet0.vp_c10)._m0[5].x, _959);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _973 = _901 + _971;
    float _975 = fma(_903, (*spvDescriptorSet0.vp_c10)._m0[6].x, _961);
    float _977 = _955 * _927;
    float _979 = _951 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _981 = _951 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _983 = 1.0 / _967;
    float _985 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[24].x, _979);
    float _987 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[26].x, _981);
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _989;
    float _993 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[24].z, _985);
    float _995 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[26].z, _987);
    float _997 = 1.0 / _931;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1001 = _901 + _999;
    float _1003 = _973 * _963;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1007 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1005;
    float _1009 = _1001 * _945;
    float _1011 = fma(_907, (*spvDescriptorSet0.vp_c10)._m0[5].z, _969);
    float _1013 = 1.0 / _949;
    float _1015 = _905 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1017;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1021;
    float _1025 = _941 * _983;
    float _1027 = fma(_903, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1015);
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1031 = _901 + _1029;
    float _1033 = fma(_1019, _1009, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1035 = fma(_1023, _1009, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1037;
    float _1041 = _1031 * _997;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1045 = _901 + _1043;
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1049 = _1047 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1051 = fma(_1039, _1009, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1053 = fma(_907, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1027);
    float _1055 = fma(_907, (*spvDescriptorSet0.vp_c10)._m0[6].z, _975);
    float _1057 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1059 = _1057 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1061 = _1045 * _1013;
    float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1063;
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1067;
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1071;
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1077 = _1075 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1081 = _1079 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1085 = _1083 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    bool _1087 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1089 = isnan(_901);
    bool _1091 = _1087 || _1089;
    bool _1093 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1095 = _1091 || _1093;
    float _1097 = float(_1095);
    float _1099 = fma(_1065, _977, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    bool _1101 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1103 = isnan(_901);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1109 = _1105 || _1107;
    float _1111 = float(_1109);
    float _1113 = fma(_1069, _977, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1115 = fma(_1073, _977, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1117 = fma(_1077, _1003, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1119 = fma(_1081, _1003, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1121 = fma(_1085, _1003, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1125 = _1123 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1127 = -_1097;
    float _1129 = _1127 + 1.0;
    bool _1131 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1133 = isnan(_901);
    bool _1135 = _1131 || _1133;
    bool _1137 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1139 = _1135 || _1137;
    float _1141 = float(_1139);
    float _1143 = -_1111;
    float _1145 = _1143 + 1.0;
    float _1147 = fma(_1125, _1041, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1149 = fma(_1049, _1041, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1151 = fma(_1059, _1041, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1153 = _1111 * _1129;
    bool _1155 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1157 = isnan(_901);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1163 = _1159 || _1161;
    float _1165 = float(_1163);
    float _1167 = _1141 * _1145;
    float _1169 = -_1141;
    float _1171 = _1169 + 1.0;
    float _1173 = _1053 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1175 = _1055 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1177 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1179 = isnan(_901);
    bool _1181 = _1177 || _1179;
    bool _1183 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1185 = _1181 || _1183;
    float _1187 = float(_1185);
    float _1189 = _1165 * _1171;
    float _1191 = _993 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1193 = _995 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1195 = -_1165;
    float _1197 = _1195 + 1.0;
    float _1199 = -_1187;
    float _1201 = _1199 + 1.0;
    float _1203 = _1173 + _1191;
    float _1205 = _1175 + _1193;
    float _1207 = _1187 * _1197;
    float _1209 = fma(_991, _1025, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1211 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1213 = _1203 + _1211;
    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1217 = _1205 + _1215;
    bool _1219 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1221 = isnan(_901);
    bool _1223 = _1219 || _1221;
    bool _1225 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1227 = _1223 || _1225;
    float _1229 = float(_1227);
    float _1231 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1231;
    float _1235 = _1213 * _1213;
    float _1237 = _1217 * _1217;
    float _1239 = fma(_1007, _1025, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    bool _1241 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1243 = isnan(_901);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1249 = _1245 || _1247;
    float _1251 = float(_1249);
    float _1253 = fma(_1233, _1025, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1255 = _1235 + _1237;
    float _1257 = _1229 * _1201;
    float _1259 = -_1229;
    float _1261 = _1259 + 1.0;
    float _1263 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1265 = _1263 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1267 = sqrt(_1255);
    float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1271 = _1269 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1275 = _1273 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1277 = fma(_1265, _1061, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1279 = _1251 * _1261;
    float _1281 = fma(_1271, _1061, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1283 = fma(_1275, _1061, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1285 = _951 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1287 = -_1251;
    float _1289 = _1287 + 1.0;
    float _1291 = _1033 * _1279;
    float _1293 = _1051 * _1279;
    float _1295 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1285);
    float _1297 = _1035 * _1279;
    float _1299 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1291);
    float _1301 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1293);
    float _1303 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1295);
    bool _1305 = _1267 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1307 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1297);
    float _1309 = _1011 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1311 = _1303 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1313 = fma(_1147, _1257, _1299);
    float _1315 = fma(_1149, _1257, _1301);
    float _1317 = fma(_1151, _1257, _1307);
    float _1319 = _1309 + _1311;
    float _1321 = fma(_1099, _1207, _1313);
    float _1323 = fma(_1113, _1207, _1315);
    float _1325 = fma(_1115, _1207, _1317);
    float _1327 = fma(_1117, _1189, _1321);
    float _1329 = fma(_1119, _1189, _1323);
    float _1331 = fma(_1121, _1189, _1325);
    float _1333 = _937;
    float _1335 = _1235;
    float _1337 = _1237;
    float _1339 = _1203;
    float _1341 = _1205;
    if (!_1305)
    {
        _1333 = _1319;
    }
    float _1343 = _1333;
    bool _1345 = !_1305;
    float _1347 = _1343;
    if (!_1345)
    {
        float _1349 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1351 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1353 = _1267 + _1351;
        float _1355 = _1319 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1357 = rsqrt(_1255);
        float _1359 = _1353 * _1349;
        float _1361 = _1359 * 0.15915493667125701904296875;
        float _1363 = _1361 * 6.283185482025146484375;
        float _1365 = sin(_1363);
        float _1367 = _1361 * 6.283185482025146484375;
        float _1369 = cos(_1367);
        float _1371 = fma(_1365, _1355, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1373 = _1357 * _1371;
        float _1375 = fma(_1213, _1373, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1377 = _1369 + (-1.0);
        float _1379 = fma(_1217, _1373, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1381 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1383 = _1375 + _1381;
        float _1385 = _1377 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1387 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1389 = _1379 + _1387;
        float _1391 = _1383 * _1383;
        float _1393 = fma(_1319, _1369, _1385);
        float _1395 = _1389 * _1389;
        _1347 = _1393;
        _1335 = _1391;
        _1337 = _1395;
        _1339 = _1375;
        _1341 = _1379;
    }
    float _1397 = _1347;
    float _1399 = _1335;
    float _1401 = _1337;
    float _1403 = _1339;
    float _1405 = _1341;
    float _1407 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1409 = _1397 + _1407;
    float _1411 = fma(_1209, _1167, _1327);
    float _1413 = fma(_1239, _1167, _1329);
    float _1415 = fma(_1253, _1167, _1331);
    float _1417 = fma(_1409, _1409, _1399);
    float _1419 = fma(_1277, _1153, _1411);
    float _1421 = fma(_1281, _1153, _1413);
    float _1423 = fma(_1283, _1153, _1415);
    float _1425 = _1417 + _1401;
    float _1427 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1419);
    float _1429 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1421);
    float _1431 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1423);
    float _1433 = _1427 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1435 = sqrt(_1425);
    float _1437 = _1429 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1439 = _1431 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1441 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1443 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1445 = _1437 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1447 = _1439 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_52.x = _1443;
    out.m_52.y = _1445;
    out.m_52.z = _1447;
    out.m_52.w = _1441;
    bool _1449 = _1435 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1451 = isnan(_1435);
    bool _1453 = _1449 || _1451;
    bool _1455 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1457 = _1453 || _1455;
    float _1459 = _1433;
    if (!_1457)
    {
        _1459 = 1.0;
    }
    float _1461 = _1459;
    bool _1463 = !_1457;
    float _1465 = _1461;
    if (!_1463)
    {
        bool _1467 = _1435 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1469 = isnan(_1435);
        bool _1471 = _1467 || _1469;
        bool _1473 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1475 = _1471 || _1473;
        if (!_1475)
        {
            float _1477 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1479 = _1435 + _1477;
            float _1481 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1483 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1481;
            float _1485 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1487 = _1485 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1489 = 1.0 / _1483;
            float _1491 = _1479 * _1489;
            float _1493 = fma(_1491, _1487, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1465 = _1493;
            _1495 = true;
        }
        else
        {
            bool _1497 = _1435 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1499 = isnan(_1435);
            bool _1501 = _1497 || _1499;
            bool _1503 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1505 = _1501 || _1503;
            if (!_1505)
            {
                float _1507 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1509 = _1435 + _1507;
                float _1511 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1513 = _1511 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1515 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1517 = _1515 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1519 = 1.0 / _1513;
                float _1521 = _1509 * _1519;
                float _1523 = fma(_1521, _1517, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1465 = _1523;
                _1495 = true;
            }
            else
            {
                _1465 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1495 = false;
    float _1525 = _1465;
    float _1527 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1529 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1531 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1533 = _1403 + _1531;
    bool _1535 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1537 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1539 = _1535 || _1537;
    bool _1541 = isnan(0.5);
    bool _1543 = _1539 || _1541;
    float _1545 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1547 = _1397 + _1545;
    float _1549 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1551 = _1405 + _1549;
    float _1553 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1527);
    float _1555 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1529);
    float _1557 = fma(_1533, _1525, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1559 = fma(_1547, _1525, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1561 = fma(_1551, _1525, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1563 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1553);
    float _1565 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1555);
    float _1567 = _1563 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1569 = _1553;
    float _1571 = _1547;
    float _1573 = _1563;
    if (_1543)
    {
        _1569 = _1557;
    }
    float _1575 = _1569;
    float _1577 = _1565 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1579 = _1575;
    if (_1543)
    {
        _1571 = _1559;
    }
    float _1581 = _1571;
    float _1583 = _1581;
    if (_1543)
    {
        _1573 = _1561;
    }
    float _1585 = _1573;
    float _1587 = _1585;
    if (!_1543)
    {
        float _1589 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1591 = _1309 + _1589;
        float _1593 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1595 = _1173 + _1593;
        float _1597 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1599 = _1591 * _1591;
        float _1601 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1603 = _1175 + _1601;
        float _1605 = fma(_1595, _1595, _1599);
        float _1607 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1609 = fma(_1603, _1603, _1605);
        float _1611 = sqrt(_1609);
        float _1613 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1615 = precise::min(_1611, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1617 = _1615 * _1607;
        float _1619 = -_1173;
        float _1621 = _1619 + _1557;
        float _1623 = -_1309;
        float _1625 = _1623 + _1559;
        float _1627 = -_1175;
        float _1629 = _1627 + _1561;
        float _1631 = _1613 * _1617;
        float _1633 = fma(_1621, _1631, _1173);
        float _1635 = fma(_1625, _1631, _1309);
        float _1637 = fma(_1629, _1631, _1175);
        _1583 = _1635;
        _1579 = _1633;
        _1587 = _1637;
    }
    float _1639 = _1583;
    float _1641 = _1579;
    float _1643 = _1587;
    float _1645 = 1.0 / _1577;
    float _1647 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1649 = _1567 + _1577;
    float _1651 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1653 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1655 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1647);
    float _1657 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1659 = _1649 * 0.5;
    float _1661 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1651);
    float _1663 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1653);
    float _1665 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1655);
    float _1667 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1657);
    float _1669 = _1659 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1671 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1661);
    float _1673 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1663);
    float _1675 = _1665 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1677 = -(*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1679 = fma(_1669, _1645, _1677);
    float _1681 = _1671 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1683 = _1673 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1685 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1687 = _1659 + _1679;
    float _1689 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1667);
    float _1691 = _1683 + (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1693 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1685);
    float _1695 = _1687 * _1645;
    float _1697 = _1689 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1699 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1693);
    float _1701 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1703 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1701);
    float _1705 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1707 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1699);
    bool _1709 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1711 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1713 = _1709 || _1711;
    bool _1715 = isnan(0.5);
    bool _1717 = _1713 || _1715;
    float _1719 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1721 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1705);
    float _1723 = 1.0 / _1707;
    float _1725 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1719);
    float _1727 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1721);
    float _1729 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1731 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1727);
    float _1733 = 1.0 / _1703;
    float _1735 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1729);
    float _1737 = _1719;
    float _1739 = _1681;
    if (_1717)
    {
        _1737 = 1.0;
    }
    float _1741 = _1737;
    float _1743 = _1741;
    if (_1717)
    {
        _1739 = 1.0;
    }
    float _1745 = _1739;
    float _1747 = _1731 * _1723;
    float _1749 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1693);
    float _1751 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1753 = _1733 * _1751;
    float _1755 = _1745;
    if (!_1717)
    {
        float _1757 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1759 = _1757 * 0.15915493667125701904296875;
        float _1761 = _1759 * 6.283185482025146484375;
        float _1763 = cos(_1761);
        float _1765 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1767 = _1765 * 0.15915493667125701904296875;
        float _1769 = _1759 * 6.283185482025146484375;
        float _1771 = sin(_1769);
        float _1773 = 1.0 / _1763;
        float _1775 = _1767 * 6.283185482025146484375;
        float _1777 = cos(_1775);
        float _1779 = _1771 * _1773;
        float _1781 = _1767 * 6.283185482025146484375;
        float _1783 = sin(_1781);
        float _1785 = _1777 * _1779;
        float _1787 = 1.0 / _1785;
        float _1789 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1791 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1789;
        float _1793 = 1.0 / _1791;
        float _1795 = _1783 * _1787;
        float _1797 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1799 = fma(_1753, _1795, _1797);
        float _1801 = _1799 * _1793;
        float _1803 = precise::clamp(_1801, 0.0, 1.0);
        _1743 = _1803;
    }
    float _1805 = _1743;
    if (!_1717)
    {
        float _1807 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1809 = _1807 * 0.15915493667125701904296875;
        float _1811 = _1809 * 6.283185482025146484375;
        float _1813 = cos(_1811);
        float _1815 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1817 = _1815 * 0.15915493667125701904296875;
        float _1819 = _1809 * 6.283185482025146484375;
        float _1821 = sin(_1819);
        float _1823 = 1.0 / _1813;
        float _1825 = _1817 * 6.283185482025146484375;
        float _1827 = cos(_1825);
        float _1829 = _1821 * _1823;
        float _1831 = _1817 * 6.283185482025146484375;
        float _1833 = sin(_1831);
        float _1835 = _1827 * _1829;
        float _1837 = 1.0 / _1835;
        float _1839 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1841 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1839;
        float _1843 = 1.0 / _1841;
        float _1845 = _1833 * _1837;
        float _1847 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1849 = fma(_1753, _1845, _1847);
        float _1851 = _1849 * _1843;
        float _1853 = precise::clamp(_1851, 0.0, 1.0);
        float _1855 = -_1853;
        float _1857 = _1855 + 1.0;
        _1755 = _1857;
    }
    float _1859 = _1755;
    float _1861 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1735);
    bool _1863 = _1805 > 0.0;
    bool _1865 = isnan(_1805);
    bool _1867 = _1863 || _1865;
    bool _1869 = isnan(0.0);
    bool _1871 = _1867 || _1869;
    float _1873 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1749);
    float _1875 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1725);
    float _1877 = _1805 * _1859;
    bool _1879 = _1859 <= 0.0;
    bool _1881 = !_1871;
    bool _1883 = _1879 || _1881;
    float _1885 = _1873 * _1747;
    float _1887 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1861);
    float _1889 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1875);
    float _1891 = _1877 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1893 = _1873 + _1885;
    float _1895 = _1893 * 0.5;
    float _1897 = _1891 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1887;
    out.gl_Position.y = _1889;
    out.gl_Position.z = _1885;
    out.gl_Position.w = _1873;
    out.m_54.z = _1895;
    out.m_54.w = _1873;
    out.m_35.x = _1897;
    if (!_1883)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _1899 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1899;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1495 = false;
    bool _893 = false;
    bool _791 = false;
    bool _401 = false;
    bool _255 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_32.w;
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
        out.m_35.x = 0.0;
    }
    int _85 = 0;
    if (!_77)
    {
        float _87 = _81 * 5.0;
        _85 = as_type<int>(_87);
    }
    int _89 = _85;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1955 = as_type<float>(_89);
        out.gl_Position.z = _1955;
    }
    if (!_77)
    {
        return out;
    }
    float _91 = in.m_37.w;
    float _93 = in.m_39.z;
    bool _95 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_91);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_91;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_41.z = _93;
    float _109 = 0.0;
    if (_103)
    {
        float _111 = float(_73);
        _109 = _111;
    }
    float _113 = _109;
    bool _115 = _107 >= _113;
    bool _117 = !_103;
    bool _119 = _115 || _117;
    if (_119)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _83;
    if (_119)
    {
        out.m_35.x = 0.0;
    }
    int _123 = 0;
    if (_119)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2027 = as_type<float>(_127);
        out.gl_Position.z = _2027;
    }
    if (_119)
    {
        return out;
    }
    float _129 = in.m_39.x;
    float _131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _133 = _107 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = _133 * _131;
    float _139 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[20].x, _137);
    int _141 = as_type<int>(_135) & 1;
    bool _143 = _141 != 0;
    int _145 = as_type<int>(_135) & 2;
    bool _147 = _145 != 0;
    float _149 = _139 * 6.283185482025146484375;
    float _151 = floor(_139);
    float _153 = _149 * 0.15915493667125701904296875;
    bool _155 = !_147;
    int _157 = _155 ? (-1090519040) : 1056964608;
    int _159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _161 = _159 != 0;
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _165 = _163 != 0;
    float _167 = _153 * 6.283185482025146484375;
    float _169 = cos(_167);
    bool _171 = !_143;
    int _173 = _171 ? (-1090519040) : 1056964608;
    int _175 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _177 = _175 != 0;
    bool _179 = !_161;
    int _181 = _179 ? 0 : 1;
    out.m_46.x = as_type<float>(_173);
    out.m_46.y = as_type<float>(_157);
    bool _183 = !_177;
    int _185 = _183 ? 0 : 1;
    float _187 = -_151;
    float _189 = _139 + _187;
    int _191 = abs(_181);
    int _193 = abs(_185);
    float _195 = -_189;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _199 = !_165;
    int _201 = _199 ? 0 : 1;
    float _203 = fma(_169, 0.5, 0.5);
    float _205 = float(_191);
    bool _207 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _209 = abs(_201);
    float _211 = abs(_197);
    float _213 = _205 * _211;
    bool _215 = _189 < 0.5;
    float _217 = float(_215);
    float _219 = -_203;
    float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _223 = float(_193);
    float _225 = -_217;
    float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _229 = float(_209);
    float _231 = fma(_223, _221, _213);
    float _233 = abs(_227);
    float _235 = fma(_229, _233, _231);
    bool _237 = !_207;
    float _253;
    if (!_237)
    {
        float _239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _241 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _245 = _243 * _239;
        float _247 = floor(_245);
        float _249 = -_247;
        float _251 = _245 + _249;
        _253 = _251;
        _255 = true;
    }
    else
    {
        float _257 = float(_73);
        float _259 = 1.0 / _257;
        float _261 = _107 * _259;
        _253 = _261;
    }
    _255 = false;
    float _263 = _253;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = _263 + _265;
    bool _269 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _271 = isnan(_263);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    bool _281 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _283 = isnan(_263);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = -_279;
    float _303 = _301 + 1.0;
    float _305 = 1.0 / _295;
    bool _307 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _309 = isnan(_263);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = _291 * _303;
    float _321 = -_291;
    float _323 = _321 + 1.0;
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _327 = _317 * _323;
    float _329 = 1.0 / _299;
    float _331 = -_317;
    float _333 = _331 + 1.0;
    float _335 = _267 * _305;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _339 = _263 + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _345;
    float _349 = fma(_343, _335, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _351 = fma(_347, _335, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _353 = _339 * _329;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _359 = _349 * _327;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _365 = _351 * _327;
    float _367 = fma(_357, _353, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _369 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].x, _359);
    float _371 = fma(_363, _353, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _373 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].y, _365);
    float _375 = fma(_367, _319, _369);
    float _377 = fma(_371, _319, _373);
    float _379 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[145].x, _375);
    float _381 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[145].y, _377);
    bool _383 = !_325;
    float _399;
    if (!_383)
    {
        float _385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _387 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _389 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[11].x, _107);
        float _391 = _389 * _385;
        float _393 = floor(_391);
        float _395 = -_393;
        float _397 = _391 + _395;
        _399 = _397;
        _401 = true;
    }
    else
    {
        float _403 = float(_73);
        float _405 = 1.0 / _403;
        float _407 = _107 * _405;
        _399 = _407;
    }
    _401 = false;
    float _409 = _399;
    float _411 = in.m_48.x;
    float _413 = in.m_48.y;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _423;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _431 = 1.0 / _417;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _433;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _441 = 1.0 / _425;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _445 = _409 + _443;
    bool _447 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _449 = isnan(_409);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    bool _459 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _461 = isnan(_409);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    bool _471 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _473 = isnan(_409);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = 1.0 / _421;
    float _485 = _445 * _431;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _489 = _409 + _487;
    float _491 = _381 * _413;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _495 = _409 + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _497;
    float _501 = -_469;
    float _503 = _501 + 1.0;
    bool _505 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _507 = isnan(_409);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _513 = _509 || _511;
    float _515 = float(_513);
    float _517 = 1.0 / _439;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _521 = _409 + _519;
    float _523 = _489 * _441;
    bool _525 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _527 = isnan(_409);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = -_457;
    float _539 = _537 + 1.0;
    float _541 = fma(_499, _485, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _543 = _379 * _411;
    float _545 = 1.0 / _429;
    float _547 = _521 * _483;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _551 = _409 + _549;
    float _553 = -_535;
    float _555 = _553 + 1.0;
    float _557 = _457 * _555;
    float _559 = 1.0 / _435;
    float _561 = _551 * _517;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _563;
    bool _567 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _569 = fma(_565, _485, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _571 = _469 * _539;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _579 = _409 + _577;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _589 = fma(_575, _547, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _591 = _579 * _545;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _593;
    float _597 = -_481;
    float _599 = _597 + 1.0;
    float _601 = _495 * _559;
    float _603 = fma(_583, _547, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _605 = fma(_595, _485, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _607 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _609 = isnan(_409);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _615 = _611 || _613;
    float _617 = float(_615);
    float _619 = _481 * _503;
    bool _621 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _623 = isnan(_409);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = fma(_587, _547, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _635;
    float _639 = _617 * _599;
    float _641 = -_617;
    float _643 = _641 + 1.0;
    float _645 = -_631;
    float _647 = _645 + 1.0;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _649;
    float _653 = _631 * _643;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _655;
    float _659 = _515 * _647;
    float _661 = fma(_651, _601, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _663 = -_515;
    float _665 = _663 + 1.0;
    float _667 = fma(_657, _601, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _669 = _541 * _659;
    float _671 = fma(_637, _601, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _673 = _569 * _659;
    float _675 = _605 * _659;
    float _677 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[107].z, _669);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _681 = _679 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _683 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[107].x, _673);
    float _685 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[107].y, _675);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _691 = fma(_633, _653, _677);
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _697 = fma(_603, _653, _683);
    float _699 = fma(_589, _653, _685);
    float _701 = fma(_681, _561, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _703 = fma(_689, _561, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _705 = fma(_695, _561, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _707 = fma(_667, _639, _697);
    float _709 = fma(_661, _639, _699);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _711;
    float _715 = fma(_671, _639, _691);
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _717;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _721;
    float _725 = fma(_713, _523, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _727 = fma(_701, _619, _707);
    float _729 = fma(_703, _619, _709);
    float _731 = fma(_705, _619, _715);
    float _733 = fma(_719, _523, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _743 = fma(_723, _523, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _749 = fma(_725, _571, _727);
    float _751 = fma(_737, _591, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _753 = fma(_741, _591, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _755 = fma(_747, _591, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _757 = fma(_733, _571, _729);
    float _759 = fma(_743, _571, _731);
    float _761 = fma(_751, _557, _749);
    float _763 = fma(_753, _557, _757);
    float _765 = fma(_755, _557, _759);
    float _767 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[113].x, _761);
    float _769 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[113].y, _763);
    float _771 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[113].z, _765);
    bool _773 = !_567;
    float _789;
    if (!_773)
    {
        float _775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _777 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _779 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _781 = _779 * _775;
        float _783 = floor(_781);
        float _785 = -_783;
        float _787 = _781 + _785;
        _789 = _787;
        _791 = true;
    }
    else
    {
        float _793 = float(_73);
        float _795 = 1.0 / _793;
        float _797 = _107 * _795;
        _789 = _797;
    }
    _791 = false;
    float _799 = _789;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _803 = _799 + _801;
    bool _805 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _807 = isnan(_799);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _813 = _809 || _811;
    float _815 = float(_813);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _819 = _817 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _821 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _823 = isnan(_799);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _833;
    float _837 = _767 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _839 = -_815;
    float _841 = _839 + 1.0;
    bool _843 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _845 = 1.0 / _819;
    float _847 = _831 * _841;
    float _849 = -_831;
    float _851 = _849 + 1.0;
    float _853 = _835 * _845;
    float _855 = _771 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _857 = fma(_853, _803, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _859 = _857 * _847;
    float _861 = _769 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _863 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[115].x, _859);
    float _865 = _837 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _867 = _861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _869 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[116].x, _863);
    float _871 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _873 = _869 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_50.x = _865;
    out.m_50.y = _867;
    out.m_50.z = _871;
    out.m_50.w = _873;
    bool _875 = !_843;
    float _891;
    if (!_875)
    {
        float _877 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _879 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _881 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[11].z, _107);
        float _883 = _881 * _877;
        float _885 = floor(_883);
        float _887 = -_885;
        float _889 = _883 + _887;
        _891 = _889;
        _893 = true;
    }
    else
    {
        float _895 = float(_73);
        float _897 = 1.0 / _895;
        float _899 = _107 * _897;
        _891 = _899;
    }
    _893 = false;
    float _901 = _891;
    float _903 = in.m_32.x;
    float _905 = in.m_32.y;
    float _907 = in.m_32.z;
    float _909 = _235 * _543;
    float _911 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_173));
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _913;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _921;
    float _925 = _909 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _927 = 1.0 / _915;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _931 = _929 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _933 = _235 * _491;
    float _935 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_157));
    float _937 = _925 * _911;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _941 = _901 + _939;
    float _943 = _933 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _945 = 1.0 / _923;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _951 = _943 * _935;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _955 = _901 + _953;
    float _957 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _959 = _905 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _961 = _905 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _963 = 1.0 / _919;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _965;
    float _969 = fma(_903, (*spvDescriptorSet0.vp_c10)._m0[5].x, _959);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _973 = _901 + _971;
    float _975 = fma(_903, (*spvDescriptorSet0.vp_c10)._m0[6].x, _961);
    float _977 = _955 * _927;
    float _979 = _951 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _981 = _951 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _983 = 1.0 / _967;
    float _985 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[24].x, _979);
    float _987 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[26].x, _981);
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _989;
    float _993 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[24].z, _985);
    float _995 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[26].z, _987);
    float _997 = 1.0 / _931;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1001 = _901 + _999;
    float _1003 = _973 * _963;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1007 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1005;
    float _1009 = _1001 * _945;
    float _1011 = fma(_907, (*spvDescriptorSet0.vp_c10)._m0[5].z, _969);
    float _1013 = 1.0 / _949;
    float _1015 = _905 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1017;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1021;
    float _1025 = _941 * _983;
    float _1027 = fma(_903, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1015);
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1031 = _901 + _1029;
    float _1033 = fma(_1019, _1009, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1035 = fma(_1023, _1009, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1037;
    float _1041 = _1031 * _997;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1045 = _901 + _1043;
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1049 = _1047 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1051 = fma(_1039, _1009, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1053 = fma(_907, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1027);
    float _1055 = fma(_907, (*spvDescriptorSet0.vp_c10)._m0[6].z, _975);
    float _1057 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1059 = _1057 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1061 = _1045 * _1013;
    float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1063;
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1067;
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1071;
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1077 = _1075 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1081 = _1079 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1085 = _1083 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    bool _1087 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1089 = isnan(_901);
    bool _1091 = _1087 || _1089;
    bool _1093 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1095 = _1091 || _1093;
    float _1097 = float(_1095);
    float _1099 = fma(_1065, _977, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    bool _1101 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1103 = isnan(_901);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1109 = _1105 || _1107;
    float _1111 = float(_1109);
    float _1113 = fma(_1069, _977, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1115 = fma(_1073, _977, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1117 = fma(_1077, _1003, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1119 = fma(_1081, _1003, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1121 = fma(_1085, _1003, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1125 = _1123 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1127 = -_1097;
    float _1129 = _1127 + 1.0;
    bool _1131 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1133 = isnan(_901);
    bool _1135 = _1131 || _1133;
    bool _1137 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1139 = _1135 || _1137;
    float _1141 = float(_1139);
    float _1143 = -_1111;
    float _1145 = _1143 + 1.0;
    float _1147 = fma(_1125, _1041, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1149 = fma(_1049, _1041, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1151 = fma(_1059, _1041, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1153 = _1111 * _1129;
    bool _1155 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1157 = isnan(_901);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1163 = _1159 || _1161;
    float _1165 = float(_1163);
    float _1167 = _1141 * _1145;
    float _1169 = -_1141;
    float _1171 = _1169 + 1.0;
    float _1173 = _1053 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1175 = _1055 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1177 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1179 = isnan(_901);
    bool _1181 = _1177 || _1179;
    bool _1183 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1185 = _1181 || _1183;
    float _1187 = float(_1185);
    float _1189 = _1165 * _1171;
    float _1191 = _993 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1193 = _995 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1195 = -_1165;
    float _1197 = _1195 + 1.0;
    float _1199 = -_1187;
    float _1201 = _1199 + 1.0;
    float _1203 = _1173 + _1191;
    float _1205 = _1175 + _1193;
    float _1207 = _1187 * _1197;
    float _1209 = fma(_991, _1025, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1211 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1213 = _1203 + _1211;
    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1217 = _1205 + _1215;
    bool _1219 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1221 = isnan(_901);
    bool _1223 = _1219 || _1221;
    bool _1225 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1227 = _1223 || _1225;
    float _1229 = float(_1227);
    float _1231 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1231;
    float _1235 = _1213 * _1213;
    float _1237 = _1217 * _1217;
    float _1239 = fma(_1007, _1025, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    bool _1241 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1243 = isnan(_901);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1249 = _1245 || _1247;
    float _1251 = float(_1249);
    float _1253 = fma(_1233, _1025, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1255 = _1235 + _1237;
    float _1257 = _1229 * _1201;
    float _1259 = -_1229;
    float _1261 = _1259 + 1.0;
    float _1263 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1265 = _1263 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1267 = sqrt(_1255);
    float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1271 = _1269 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1275 = _1273 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1277 = fma(_1265, _1061, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1279 = _1251 * _1261;
    float _1281 = fma(_1271, _1061, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1283 = fma(_1275, _1061, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1285 = _951 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1287 = -_1251;
    float _1289 = _1287 + 1.0;
    float _1291 = _1033 * _1279;
    float _1293 = _1051 * _1279;
    float _1295 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1285);
    float _1297 = _1035 * _1279;
    float _1299 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1291);
    float _1301 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1293);
    float _1303 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1295);
    bool _1305 = _1267 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1307 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1297);
    float _1309 = _1011 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1311 = _1303 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1313 = fma(_1147, _1257, _1299);
    float _1315 = fma(_1149, _1257, _1301);
    float _1317 = fma(_1151, _1257, _1307);
    float _1319 = _1309 + _1311;
    float _1321 = fma(_1099, _1207, _1313);
    float _1323 = fma(_1113, _1207, _1315);
    float _1325 = fma(_1115, _1207, _1317);
    float _1327 = fma(_1117, _1189, _1321);
    float _1329 = fma(_1119, _1189, _1323);
    float _1331 = fma(_1121, _1189, _1325);
    float _1333 = _937;
    float _1335 = _1235;
    float _1337 = _1237;
    float _1339 = _1203;
    float _1341 = _1205;
    if (!_1305)
    {
        _1333 = _1319;
    }
    float _1343 = _1333;
    bool _1345 = !_1305;
    float _1347 = _1343;
    if (!_1345)
    {
        float _1349 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1351 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1353 = _1267 + _1351;
        float _1355 = _1319 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1357 = rsqrt(_1255);
        float _1359 = _1353 * _1349;
        float _1361 = _1359 * 0.15915493667125701904296875;
        float _1363 = _1361 * 6.283185482025146484375;
        float _1365 = sin(_1363);
        float _1367 = _1361 * 6.283185482025146484375;
        float _1369 = cos(_1367);
        float _1371 = fma(_1365, _1355, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1373 = _1357 * _1371;
        float _1375 = fma(_1213, _1373, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1377 = _1369 + (-1.0);
        float _1379 = fma(_1217, _1373, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1381 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1383 = _1375 + _1381;
        float _1385 = _1377 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1387 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1389 = _1379 + _1387;
        float _1391 = _1383 * _1383;
        float _1393 = fma(_1319, _1369, _1385);
        float _1395 = _1389 * _1389;
        _1347 = _1393;
        _1335 = _1391;
        _1337 = _1395;
        _1339 = _1375;
        _1341 = _1379;
    }
    float _1397 = _1347;
    float _1399 = _1335;
    float _1401 = _1337;
    float _1403 = _1339;
    float _1405 = _1341;
    float _1407 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1409 = _1397 + _1407;
    float _1411 = fma(_1209, _1167, _1327);
    float _1413 = fma(_1239, _1167, _1329);
    float _1415 = fma(_1253, _1167, _1331);
    float _1417 = fma(_1409, _1409, _1399);
    float _1419 = fma(_1277, _1153, _1411);
    float _1421 = fma(_1281, _1153, _1413);
    float _1423 = fma(_1283, _1153, _1415);
    float _1425 = _1417 + _1401;
    float _1427 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1419);
    float _1429 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1421);
    float _1431 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1423);
    float _1433 = _1427 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1435 = sqrt(_1425);
    float _1437 = _1429 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1439 = _1431 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1441 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1443 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1445 = _1437 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1447 = _1439 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_52.x = _1443;
    out.m_52.y = _1445;
    out.m_52.z = _1447;
    out.m_52.w = _1441;
    bool _1449 = _1435 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1451 = isnan(_1435);
    bool _1453 = _1449 || _1451;
    bool _1455 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1457 = _1453 || _1455;
    float _1459 = _1433;
    if (!_1457)
    {
        _1459 = 1.0;
    }
    float _1461 = _1459;
    bool _1463 = !_1457;
    float _1465 = _1461;
    if (!_1463)
    {
        bool _1467 = _1435 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1469 = isnan(_1435);
        bool _1471 = _1467 || _1469;
        bool _1473 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1475 = _1471 || _1473;
        if (!_1475)
        {
            float _1477 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1479 = _1435 + _1477;
            float _1481 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1483 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1481;
            float _1485 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1487 = _1485 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1489 = 1.0 / _1483;
            float _1491 = _1479 * _1489;
            float _1493 = fma(_1491, _1487, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1465 = _1493;
            _1495 = true;
        }
        else
        {
            bool _1497 = _1435 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1499 = isnan(_1435);
            bool _1501 = _1497 || _1499;
            bool _1503 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1505 = _1501 || _1503;
            if (!_1505)
            {
                float _1507 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1509 = _1435 + _1507;
                float _1511 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1513 = _1511 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1515 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1517 = _1515 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1519 = 1.0 / _1513;
                float _1521 = _1509 * _1519;
                float _1523 = fma(_1521, _1517, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1465 = _1523;
                _1495 = true;
            }
            else
            {
                _1465 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1495 = false;
    float _1525 = _1465;
    float _1527 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1529 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1531 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1533 = _1403 + _1531;
    bool _1535 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1537 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1539 = _1535 || _1537;
    bool _1541 = isnan(0.5);
    bool _1543 = _1539 || _1541;
    float _1545 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1547 = _1397 + _1545;
    float _1549 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1551 = _1405 + _1549;
    float _1553 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1527);
    float _1555 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1529);
    float _1557 = fma(_1533, _1525, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1559 = fma(_1547, _1525, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1561 = fma(_1551, _1525, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1563 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1553);
    float _1565 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1555);
    float _1567 = _1563 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1569 = _1553;
    float _1571 = _1547;
    float _1573 = _1563;
    if (_1543)
    {
        _1569 = _1557;
    }
    float _1575 = _1569;
    float _1577 = _1565 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1579 = _1575;
    if (_1543)
    {
        _1571 = _1559;
    }
    float _1581 = _1571;
    float _1583 = _1581;
    if (_1543)
    {
        _1573 = _1561;
    }
    float _1585 = _1573;
    float _1587 = _1585;
    if (!_1543)
    {
        float _1589 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1591 = _1309 + _1589;
        float _1593 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1595 = _1173 + _1593;
        float _1597 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1599 = _1591 * _1591;
        float _1601 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1603 = _1175 + _1601;
        float _1605 = fma(_1595, _1595, _1599);
        float _1607 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1609 = fma(_1603, _1603, _1605);
        float _1611 = sqrt(_1609);
        float _1613 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1615 = precise::min(_1611, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1617 = _1615 * _1607;
        float _1619 = -_1173;
        float _1621 = _1619 + _1557;
        float _1623 = -_1309;
        float _1625 = _1623 + _1559;
        float _1627 = -_1175;
        float _1629 = _1627 + _1561;
        float _1631 = _1613 * _1617;
        float _1633 = fma(_1621, _1631, _1173);
        float _1635 = fma(_1625, _1631, _1309);
        float _1637 = fma(_1629, _1631, _1175);
        _1583 = _1635;
        _1579 = _1633;
        _1587 = _1637;
    }
    float _1639 = _1583;
    float _1641 = _1579;
    float _1643 = _1587;
    float _1645 = 1.0 / _1577;
    float _1647 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1649 = _1567 + _1577;
    float _1651 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1653 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1655 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1647);
    float _1657 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1659 = _1649 * 0.5;
    float _1661 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1651);
    float _1663 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1653);
    float _1665 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1655);
    float _1667 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1657);
    float _1669 = _1659 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1671 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1661);
    float _1673 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1663);
    float _1675 = _1665 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1677 = -(*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1679 = fma(_1669, _1645, _1677);
    float _1681 = _1671 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1683 = _1673 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1685 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1687 = _1659 + _1679;
    float _1689 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1667);
    float _1691 = _1683 + (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1693 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1685);
    float _1695 = _1687 * _1645;
    float _1697 = _1689 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1699 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1693);
    float _1701 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1703 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1701);
    float _1705 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1707 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1699);
    bool _1709 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1711 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1713 = _1709 || _1711;
    bool _1715 = isnan(0.5);
    bool _1717 = _1713 || _1715;
    float _1719 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1721 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1705);
    float _1723 = 1.0 / _1707;
    float _1725 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1719);
    float _1727 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1721);
    float _1729 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1731 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1727);
    float _1733 = 1.0 / _1703;
    float _1735 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1729);
    float _1737 = _1719;
    float _1739 = _1681;
    if (_1717)
    {
        _1737 = 1.0;
    }
    float _1741 = _1737;
    float _1743 = _1741;
    if (_1717)
    {
        _1739 = 1.0;
    }
    float _1745 = _1739;
    float _1747 = _1731 * _1723;
    float _1749 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1693);
    float _1751 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1753 = _1733 * _1751;
    float _1755 = _1745;
    if (!_1717)
    {
        float _1757 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1759 = _1757 * 0.15915493667125701904296875;
        float _1761 = _1759 * 6.283185482025146484375;
        float _1763 = cos(_1761);
        float _1765 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1767 = _1765 * 0.15915493667125701904296875;
        float _1769 = _1759 * 6.283185482025146484375;
        float _1771 = sin(_1769);
        float _1773 = 1.0 / _1763;
        float _1775 = _1767 * 6.283185482025146484375;
        float _1777 = cos(_1775);
        float _1779 = _1771 * _1773;
        float _1781 = _1767 * 6.283185482025146484375;
        float _1783 = sin(_1781);
        float _1785 = _1777 * _1779;
        float _1787 = 1.0 / _1785;
        float _1789 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1791 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1789;
        float _1793 = 1.0 / _1791;
        float _1795 = _1783 * _1787;
        float _1797 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1799 = fma(_1753, _1795, _1797);
        float _1801 = _1799 * _1793;
        float _1803 = precise::clamp(_1801, 0.0, 1.0);
        _1743 = _1803;
    }
    float _1805 = _1743;
    if (!_1717)
    {
        float _1807 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1809 = _1807 * 0.15915493667125701904296875;
        float _1811 = _1809 * 6.283185482025146484375;
        float _1813 = cos(_1811);
        float _1815 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1817 = _1815 * 0.15915493667125701904296875;
        float _1819 = _1809 * 6.283185482025146484375;
        float _1821 = sin(_1819);
        float _1823 = 1.0 / _1813;
        float _1825 = _1817 * 6.283185482025146484375;
        float _1827 = cos(_1825);
        float _1829 = _1821 * _1823;
        float _1831 = _1817 * 6.283185482025146484375;
        float _1833 = sin(_1831);
        float _1835 = _1827 * _1829;
        float _1837 = 1.0 / _1835;
        float _1839 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1841 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1839;
        float _1843 = 1.0 / _1841;
        float _1845 = _1833 * _1837;
        float _1847 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1849 = fma(_1753, _1845, _1847);
        float _1851 = _1849 * _1843;
        float _1853 = precise::clamp(_1851, 0.0, 1.0);
        float _1855 = -_1853;
        float _1857 = _1855 + 1.0;
        _1755 = _1857;
    }
    float _1859 = _1755;
    float _1861 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1735);
    bool _1863 = _1805 > 0.0;
    bool _1865 = isnan(_1805);
    bool _1867 = _1863 || _1865;
    bool _1869 = isnan(0.0);
    bool _1871 = _1867 || _1869;
    float _1873 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1749);
    float _1875 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1725);
    float _1877 = _1805 * _1859;
    bool _1879 = _1859 <= 0.0;
    bool _1881 = !_1871;
    bool _1883 = _1879 || _1881;
    float _1885 = _1873 * _1747;
    float _1887 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1861);
    float _1889 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1875);
    float _1891 = _1877 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1893 = _1873 + _1885;
    float _1895 = _1893 * 0.5;
    float _1897 = _1891 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1887;
    out.gl_Position.y = _1889;
    out.gl_Position.z = _1885;
    out.gl_Position.w = _1873;
    out.m_54.z = _1895;
    out.m_54.w = _1873;
    out.m_35.x = _1897;
    if (!_1883)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _1899 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1899;
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
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1495 = false;
    bool _893 = false;
    bool _791 = false;
    bool _401 = false;
    bool _255 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_32.w;
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
        out.m_35.x = 0.0;
    }
    int _85 = 0;
    if (!_77)
    {
        float _87 = _81 * 5.0;
        _85 = as_type<int>(_87);
    }
    int _89 = _85;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1955 = as_type<float>(_89);
        out.gl_Position.z = _1955;
    }
    if (!_77)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _91 = in.m_37.w;
    float _93 = in.m_39.z;
    bool _95 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_91);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_91;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_41.z = _93;
    float _109 = 0.0;
    if (_103)
    {
        float _111 = float(_73);
        _109 = _111;
    }
    float _113 = _109;
    bool _115 = _107 >= _113;
    bool _117 = !_103;
    bool _119 = _115 || _117;
    if (_119)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _83;
    if (_119)
    {
        out.m_35.x = 0.0;
    }
    int _123 = 0;
    if (_119)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2027 = as_type<float>(_127);
        out.gl_Position.z = _2027;
    }
    if (_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_39.x;
    float _131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _133 = _107 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = _133 * _131;
    float _139 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[20].x, _137);
    int _141 = as_type<int>(_135) & 1;
    bool _143 = _141 != 0;
    int _145 = as_type<int>(_135) & 2;
    bool _147 = _145 != 0;
    float _149 = _139 * 6.283185482025146484375;
    float _151 = floor(_139);
    float _153 = _149 * 0.15915493667125701904296875;
    bool _155 = !_147;
    int _157 = _155 ? (-1090519040) : 1056964608;
    int _159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _161 = _159 != 0;
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _165 = _163 != 0;
    float _167 = _153 * 6.283185482025146484375;
    float _169 = cos(_167);
    bool _171 = !_143;
    int _173 = _171 ? (-1090519040) : 1056964608;
    int _175 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _177 = _175 != 0;
    bool _179 = !_161;
    int _181 = _179 ? 0 : 1;
    out.m_46.x = as_type<float>(_173);
    out.m_46.y = as_type<float>(_157);
    bool _183 = !_177;
    int _185 = _183 ? 0 : 1;
    float _187 = -_151;
    float _189 = _139 + _187;
    int _191 = abs(_181);
    int _193 = abs(_185);
    float _195 = -_189;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _199 = !_165;
    int _201 = _199 ? 0 : 1;
    float _203 = fma(_169, 0.5, 0.5);
    float _205 = float(_191);
    bool _207 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _209 = abs(_201);
    float _211 = abs(_197);
    float _213 = _205 * _211;
    bool _215 = _189 < 0.5;
    float _217 = float(_215);
    float _219 = -_203;
    float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _223 = float(_193);
    float _225 = -_217;
    float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _229 = float(_209);
    float _231 = fma(_223, _221, _213);
    float _233 = abs(_227);
    float _235 = fma(_229, _233, _231);
    bool _237 = !_207;
    float _253;
    if (!_237)
    {
        float _239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _241 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _245 = _243 * _239;
        float _247 = floor(_245);
        float _249 = -_247;
        float _251 = _245 + _249;
        _253 = _251;
        _255 = true;
    }
    else
    {
        float _257 = float(_73);
        float _259 = 1.0 / _257;
        float _261 = _107 * _259;
        _253 = _261;
    }
    _255 = false;
    float _263 = _253;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = _263 + _265;
    bool _269 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _271 = isnan(_263);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    bool _281 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _283 = isnan(_263);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = -_279;
    float _303 = _301 + 1.0;
    float _305 = 1.0 / _295;
    bool _307 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _309 = isnan(_263);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = _291 * _303;
    float _321 = -_291;
    float _323 = _321 + 1.0;
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _327 = _317 * _323;
    float _329 = 1.0 / _299;
    float _331 = -_317;
    float _333 = _331 + 1.0;
    float _335 = _267 * _305;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _339 = _263 + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _345;
    float _349 = fma(_343, _335, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _351 = fma(_347, _335, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _353 = _339 * _329;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _359 = _349 * _327;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _365 = _351 * _327;
    float _367 = fma(_357, _353, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _369 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].x, _359);
    float _371 = fma(_363, _353, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _373 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].y, _365);
    float _375 = fma(_367, _319, _369);
    float _377 = fma(_371, _319, _373);
    float _379 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[145].x, _375);
    float _381 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[145].y, _377);
    bool _383 = !_325;
    float _399;
    if (!_383)
    {
        float _385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _387 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _389 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[11].x, _107);
        float _391 = _389 * _385;
        float _393 = floor(_391);
        float _395 = -_393;
        float _397 = _391 + _395;
        _399 = _397;
        _401 = true;
    }
    else
    {
        float _403 = float(_73);
        float _405 = 1.0 / _403;
        float _407 = _107 * _405;
        _399 = _407;
    }
    _401 = false;
    float _409 = _399;
    float _411 = in.m_48.x;
    float _413 = in.m_48.y;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _423;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _431 = 1.0 / _417;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _433;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _441 = 1.0 / _425;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _445 = _409 + _443;
    bool _447 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _449 = isnan(_409);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    bool _459 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _461 = isnan(_409);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    bool _471 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _473 = isnan(_409);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = 1.0 / _421;
    float _485 = _445 * _431;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _489 = _409 + _487;
    float _491 = _381 * _413;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _495 = _409 + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _497;
    float _501 = -_469;
    float _503 = _501 + 1.0;
    bool _505 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _507 = isnan(_409);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _513 = _509 || _511;
    float _515 = float(_513);
    float _517 = 1.0 / _439;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _521 = _409 + _519;
    float _523 = _489 * _441;
    bool _525 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _527 = isnan(_409);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = -_457;
    float _539 = _537 + 1.0;
    float _541 = fma(_499, _485, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _543 = _379 * _411;
    float _545 = 1.0 / _429;
    float _547 = _521 * _483;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _551 = _409 + _549;
    float _553 = -_535;
    float _555 = _553 + 1.0;
    float _557 = _457 * _555;
    float _559 = 1.0 / _435;
    float _561 = _551 * _517;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _563;
    bool _567 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _569 = fma(_565, _485, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _571 = _469 * _539;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _579 = _409 + _577;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _589 = fma(_575, _547, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _591 = _579 * _545;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _593;
    float _597 = -_481;
    float _599 = _597 + 1.0;
    float _601 = _495 * _559;
    float _603 = fma(_583, _547, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _605 = fma(_595, _485, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _607 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _609 = isnan(_409);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _615 = _611 || _613;
    float _617 = float(_615);
    float _619 = _481 * _503;
    bool _621 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _623 = isnan(_409);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = fma(_587, _547, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _635;
    float _639 = _617 * _599;
    float _641 = -_617;
    float _643 = _641 + 1.0;
    float _645 = -_631;
    float _647 = _645 + 1.0;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _649;
    float _653 = _631 * _643;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _655;
    float _659 = _515 * _647;
    float _661 = fma(_651, _601, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _663 = -_515;
    float _665 = _663 + 1.0;
    float _667 = fma(_657, _601, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _669 = _541 * _659;
    float _671 = fma(_637, _601, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _673 = _569 * _659;
    float _675 = _605 * _659;
    float _677 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[107].z, _669);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _681 = _679 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _683 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[107].x, _673);
    float _685 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[107].y, _675);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _691 = fma(_633, _653, _677);
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _697 = fma(_603, _653, _683);
    float _699 = fma(_589, _653, _685);
    float _701 = fma(_681, _561, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _703 = fma(_689, _561, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _705 = fma(_695, _561, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _707 = fma(_667, _639, _697);
    float _709 = fma(_661, _639, _699);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _711;
    float _715 = fma(_671, _639, _691);
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _717;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _721;
    float _725 = fma(_713, _523, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _727 = fma(_701, _619, _707);
    float _729 = fma(_703, _619, _709);
    float _731 = fma(_705, _619, _715);
    float _733 = fma(_719, _523, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _743 = fma(_723, _523, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _749 = fma(_725, _571, _727);
    float _751 = fma(_737, _591, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _753 = fma(_741, _591, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _755 = fma(_747, _591, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _757 = fma(_733, _571, _729);
    float _759 = fma(_743, _571, _731);
    float _761 = fma(_751, _557, _749);
    float _763 = fma(_753, _557, _757);
    float _765 = fma(_755, _557, _759);
    float _767 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[113].x, _761);
    float _769 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[113].y, _763);
    float _771 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[113].z, _765);
    bool _773 = !_567;
    float _789;
    if (!_773)
    {
        float _775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _777 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _779 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _781 = _779 * _775;
        float _783 = floor(_781);
        float _785 = -_783;
        float _787 = _781 + _785;
        _789 = _787;
        _791 = true;
    }
    else
    {
        float _793 = float(_73);
        float _795 = 1.0 / _793;
        float _797 = _107 * _795;
        _789 = _797;
    }
    _791 = false;
    float _799 = _789;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _803 = _799 + _801;
    bool _805 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _807 = isnan(_799);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _813 = _809 || _811;
    float _815 = float(_813);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _819 = _817 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _821 = _799 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _823 = isnan(_799);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _833;
    float _837 = _767 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _839 = -_815;
    float _841 = _839 + 1.0;
    bool _843 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _845 = 1.0 / _819;
    float _847 = _831 * _841;
    float _849 = -_831;
    float _851 = _849 + 1.0;
    float _853 = _835 * _845;
    float _855 = _771 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _857 = fma(_853, _803, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _859 = _857 * _847;
    float _861 = _769 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _863 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[115].x, _859);
    float _865 = _837 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _867 = _861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _869 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[116].x, _863);
    float _871 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _873 = _869 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_50.x = _865;
    out.m_50.y = _867;
    out.m_50.z = _871;
    out.m_50.w = _873;
    bool _875 = !_843;
    float _891;
    if (!_875)
    {
        float _877 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _879 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _881 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[11].z, _107);
        float _883 = _881 * _877;
        float _885 = floor(_883);
        float _887 = -_885;
        float _889 = _883 + _887;
        _891 = _889;
        _893 = true;
    }
    else
    {
        float _895 = float(_73);
        float _897 = 1.0 / _895;
        float _899 = _107 * _897;
        _891 = _899;
    }
    _893 = false;
    float _901 = _891;
    float _903 = in.m_32.x;
    float _905 = in.m_32.y;
    float _907 = in.m_32.z;
    float _909 = _235 * _543;
    float _911 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_173));
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _913;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _921;
    float _925 = _909 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _927 = 1.0 / _915;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _931 = _929 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _933 = _235 * _491;
    float _935 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_157));
    float _937 = _925 * _911;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _941 = _901 + _939;
    float _943 = _933 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _945 = 1.0 / _923;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _951 = _943 * _935;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _955 = _901 + _953;
    float _957 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _959 = _905 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _961 = _905 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _963 = 1.0 / _919;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _965;
    float _969 = fma(_903, (*spvDescriptorSet0.vp_c10)._m0[5].x, _959);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _973 = _901 + _971;
    float _975 = fma(_903, (*spvDescriptorSet0.vp_c10)._m0[6].x, _961);
    float _977 = _955 * _927;
    float _979 = _951 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _981 = _951 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _983 = 1.0 / _967;
    float _985 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[24].x, _979);
    float _987 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[26].x, _981);
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _989;
    float _993 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[24].z, _985);
    float _995 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[26].z, _987);
    float _997 = 1.0 / _931;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1001 = _901 + _999;
    float _1003 = _973 * _963;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1007 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1005;
    float _1009 = _1001 * _945;
    float _1011 = fma(_907, (*spvDescriptorSet0.vp_c10)._m0[5].z, _969);
    float _1013 = 1.0 / _949;
    float _1015 = _905 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1017;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1021;
    float _1025 = _941 * _983;
    float _1027 = fma(_903, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1015);
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1031 = _901 + _1029;
    float _1033 = fma(_1019, _1009, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1035 = fma(_1023, _1009, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1037;
    float _1041 = _1031 * _997;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1045 = _901 + _1043;
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1049 = _1047 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1051 = fma(_1039, _1009, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1053 = fma(_907, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1027);
    float _1055 = fma(_907, (*spvDescriptorSet0.vp_c10)._m0[6].z, _975);
    float _1057 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1059 = _1057 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1061 = _1045 * _1013;
    float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1063;
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1067;
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1071;
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1077 = _1075 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1081 = _1079 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1085 = _1083 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    bool _1087 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1089 = isnan(_901);
    bool _1091 = _1087 || _1089;
    bool _1093 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1095 = _1091 || _1093;
    float _1097 = float(_1095);
    float _1099 = fma(_1065, _977, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    bool _1101 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1103 = isnan(_901);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1109 = _1105 || _1107;
    float _1111 = float(_1109);
    float _1113 = fma(_1069, _977, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1115 = fma(_1073, _977, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1117 = fma(_1077, _1003, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1119 = fma(_1081, _1003, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1121 = fma(_1085, _1003, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1125 = _1123 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1127 = -_1097;
    float _1129 = _1127 + 1.0;
    bool _1131 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1133 = isnan(_901);
    bool _1135 = _1131 || _1133;
    bool _1137 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1139 = _1135 || _1137;
    float _1141 = float(_1139);
    float _1143 = -_1111;
    float _1145 = _1143 + 1.0;
    float _1147 = fma(_1125, _1041, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1149 = fma(_1049, _1041, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1151 = fma(_1059, _1041, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1153 = _1111 * _1129;
    bool _1155 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1157 = isnan(_901);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1163 = _1159 || _1161;
    float _1165 = float(_1163);
    float _1167 = _1141 * _1145;
    float _1169 = -_1141;
    float _1171 = _1169 + 1.0;
    float _1173 = _1053 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1175 = _1055 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1177 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1179 = isnan(_901);
    bool _1181 = _1177 || _1179;
    bool _1183 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1185 = _1181 || _1183;
    float _1187 = float(_1185);
    float _1189 = _1165 * _1171;
    float _1191 = _993 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1193 = _995 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1195 = -_1165;
    float _1197 = _1195 + 1.0;
    float _1199 = -_1187;
    float _1201 = _1199 + 1.0;
    float _1203 = _1173 + _1191;
    float _1205 = _1175 + _1193;
    float _1207 = _1187 * _1197;
    float _1209 = fma(_991, _1025, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1211 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1213 = _1203 + _1211;
    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1217 = _1205 + _1215;
    bool _1219 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1221 = isnan(_901);
    bool _1223 = _1219 || _1221;
    bool _1225 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1227 = _1223 || _1225;
    float _1229 = float(_1227);
    float _1231 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1231;
    float _1235 = _1213 * _1213;
    float _1237 = _1217 * _1217;
    float _1239 = fma(_1007, _1025, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    bool _1241 = _901 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1243 = isnan(_901);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1249 = _1245 || _1247;
    float _1251 = float(_1249);
    float _1253 = fma(_1233, _1025, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1255 = _1235 + _1237;
    float _1257 = _1229 * _1201;
    float _1259 = -_1229;
    float _1261 = _1259 + 1.0;
    float _1263 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1265 = _1263 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1267 = sqrt(_1255);
    float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1271 = _1269 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1275 = _1273 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1277 = fma(_1265, _1061, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1279 = _1251 * _1261;
    float _1281 = fma(_1271, _1061, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1283 = fma(_1275, _1061, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1285 = _951 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1287 = -_1251;
    float _1289 = _1287 + 1.0;
    float _1291 = _1033 * _1279;
    float _1293 = _1051 * _1279;
    float _1295 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1285);
    float _1297 = _1035 * _1279;
    float _1299 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1291);
    float _1301 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1293);
    float _1303 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1295);
    bool _1305 = _1267 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1307 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1297);
    float _1309 = _1011 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1311 = _1303 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1313 = fma(_1147, _1257, _1299);
    float _1315 = fma(_1149, _1257, _1301);
    float _1317 = fma(_1151, _1257, _1307);
    float _1319 = _1309 + _1311;
    float _1321 = fma(_1099, _1207, _1313);
    float _1323 = fma(_1113, _1207, _1315);
    float _1325 = fma(_1115, _1207, _1317);
    float _1327 = fma(_1117, _1189, _1321);
    float _1329 = fma(_1119, _1189, _1323);
    float _1331 = fma(_1121, _1189, _1325);
    float _1333 = _937;
    float _1335 = _1235;
    float _1337 = _1237;
    float _1339 = _1203;
    float _1341 = _1205;
    if (!_1305)
    {
        _1333 = _1319;
    }
    float _1343 = _1333;
    bool _1345 = !_1305;
    float _1347 = _1343;
    if (!_1345)
    {
        float _1349 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1351 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1353 = _1267 + _1351;
        float _1355 = _1319 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1357 = rsqrt(_1255);
        float _1359 = _1353 * _1349;
        float _1361 = _1359 * 0.15915493667125701904296875;
        float _1363 = _1361 * 6.283185482025146484375;
        float _1365 = sin(_1363);
        float _1367 = _1361 * 6.283185482025146484375;
        float _1369 = cos(_1367);
        float _1371 = fma(_1365, _1355, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1373 = _1357 * _1371;
        float _1375 = fma(_1213, _1373, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1377 = _1369 + (-1.0);
        float _1379 = fma(_1217, _1373, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1381 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1383 = _1375 + _1381;
        float _1385 = _1377 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1387 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1389 = _1379 + _1387;
        float _1391 = _1383 * _1383;
        float _1393 = fma(_1319, _1369, _1385);
        float _1395 = _1389 * _1389;
        _1347 = _1393;
        _1335 = _1391;
        _1337 = _1395;
        _1339 = _1375;
        _1341 = _1379;
    }
    float _1397 = _1347;
    float _1399 = _1335;
    float _1401 = _1337;
    float _1403 = _1339;
    float _1405 = _1341;
    float _1407 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1409 = _1397 + _1407;
    float _1411 = fma(_1209, _1167, _1327);
    float _1413 = fma(_1239, _1167, _1329);
    float _1415 = fma(_1253, _1167, _1331);
    float _1417 = fma(_1409, _1409, _1399);
    float _1419 = fma(_1277, _1153, _1411);
    float _1421 = fma(_1281, _1153, _1413);
    float _1423 = fma(_1283, _1153, _1415);
    float _1425 = _1417 + _1401;
    float _1427 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1419);
    float _1429 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1421);
    float _1431 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1423);
    float _1433 = _1427 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1435 = sqrt(_1425);
    float _1437 = _1429 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1439 = _1431 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1441 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1443 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1445 = _1437 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1447 = _1439 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_52.x = _1443;
    out.m_52.y = _1445;
    out.m_52.z = _1447;
    out.m_52.w = _1441;
    bool _1449 = _1435 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1451 = isnan(_1435);
    bool _1453 = _1449 || _1451;
    bool _1455 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1457 = _1453 || _1455;
    float _1459 = _1433;
    if (!_1457)
    {
        _1459 = 1.0;
    }
    float _1461 = _1459;
    bool _1463 = !_1457;
    float _1465 = _1461;
    if (!_1463)
    {
        bool _1467 = _1435 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1469 = isnan(_1435);
        bool _1471 = _1467 || _1469;
        bool _1473 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1475 = _1471 || _1473;
        if (!_1475)
        {
            float _1477 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1479 = _1435 + _1477;
            float _1481 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1483 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1481;
            float _1485 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1487 = _1485 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1489 = 1.0 / _1483;
            float _1491 = _1479 * _1489;
            float _1493 = fma(_1491, _1487, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1465 = _1493;
            _1495 = true;
        }
        else
        {
            bool _1497 = _1435 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1499 = isnan(_1435);
            bool _1501 = _1497 || _1499;
            bool _1503 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1505 = _1501 || _1503;
            if (!_1505)
            {
                float _1507 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1509 = _1435 + _1507;
                float _1511 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1513 = _1511 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1515 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1517 = _1515 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1519 = 1.0 / _1513;
                float _1521 = _1509 * _1519;
                float _1523 = fma(_1521, _1517, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1465 = _1523;
                _1495 = true;
            }
            else
            {
                _1465 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1495 = false;
    float _1525 = _1465;
    float _1527 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1529 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1531 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1533 = _1403 + _1531;
    bool _1535 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1537 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1539 = _1535 || _1537;
    bool _1541 = isnan(0.5);
    bool _1543 = _1539 || _1541;
    float _1545 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1547 = _1397 + _1545;
    float _1549 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1551 = _1405 + _1549;
    float _1553 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1527);
    float _1555 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1529);
    float _1557 = fma(_1533, _1525, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1559 = fma(_1547, _1525, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1561 = fma(_1551, _1525, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1563 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1553);
    float _1565 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1555);
    float _1567 = _1563 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1569 = _1553;
    float _1571 = _1547;
    float _1573 = _1563;
    if (_1543)
    {
        _1569 = _1557;
    }
    float _1575 = _1569;
    float _1577 = _1565 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1579 = _1575;
    if (_1543)
    {
        _1571 = _1559;
    }
    float _1581 = _1571;
    float _1583 = _1581;
    if (_1543)
    {
        _1573 = _1561;
    }
    float _1585 = _1573;
    float _1587 = _1585;
    if (!_1543)
    {
        float _1589 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1591 = _1309 + _1589;
        float _1593 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1595 = _1173 + _1593;
        float _1597 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1599 = _1591 * _1591;
        float _1601 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1603 = _1175 + _1601;
        float _1605 = fma(_1595, _1595, _1599);
        float _1607 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1609 = fma(_1603, _1603, _1605);
        float _1611 = sqrt(_1609);
        float _1613 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1615 = precise::min(_1611, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1617 = _1615 * _1607;
        float _1619 = -_1173;
        float _1621 = _1619 + _1557;
        float _1623 = -_1309;
        float _1625 = _1623 + _1559;
        float _1627 = -_1175;
        float _1629 = _1627 + _1561;
        float _1631 = _1613 * _1617;
        float _1633 = fma(_1621, _1631, _1173);
        float _1635 = fma(_1625, _1631, _1309);
        float _1637 = fma(_1629, _1631, _1175);
        _1583 = _1635;
        _1579 = _1633;
        _1587 = _1637;
    }
    float _1639 = _1583;
    float _1641 = _1579;
    float _1643 = _1587;
    float _1645 = 1.0 / _1577;
    float _1647 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1649 = _1567 + _1577;
    float _1651 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1653 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1655 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1647);
    float _1657 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1659 = _1649 * 0.5;
    float _1661 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1651);
    float _1663 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1653);
    float _1665 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1655);
    float _1667 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1657);
    float _1669 = _1659 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1671 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1661);
    float _1673 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1663);
    float _1675 = _1665 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1677 = -(*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1679 = fma(_1669, _1645, _1677);
    float _1681 = _1671 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1683 = _1673 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1685 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1687 = _1659 + _1679;
    float _1689 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1667);
    float _1691 = _1683 + (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1693 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1685);
    float _1695 = _1687 * _1645;
    float _1697 = _1689 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1699 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1693);
    float _1701 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1703 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1701);
    float _1705 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1707 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1699);
    bool _1709 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1711 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1713 = _1709 || _1711;
    bool _1715 = isnan(0.5);
    bool _1717 = _1713 || _1715;
    float _1719 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1721 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1705);
    float _1723 = 1.0 / _1707;
    float _1725 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1719);
    float _1727 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1721);
    float _1729 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1731 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1727);
    float _1733 = 1.0 / _1703;
    float _1735 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1729);
    float _1737 = _1719;
    float _1739 = _1681;
    if (_1717)
    {
        _1737 = 1.0;
    }
    float _1741 = _1737;
    float _1743 = _1741;
    if (_1717)
    {
        _1739 = 1.0;
    }
    float _1745 = _1739;
    float _1747 = _1731 * _1723;
    float _1749 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1693);
    float _1751 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1753 = _1733 * _1751;
    float _1755 = _1745;
    if (!_1717)
    {
        float _1757 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1759 = _1757 * 0.15915493667125701904296875;
        float _1761 = _1759 * 6.283185482025146484375;
        float _1763 = cos(_1761);
        float _1765 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1767 = _1765 * 0.15915493667125701904296875;
        float _1769 = _1759 * 6.283185482025146484375;
        float _1771 = sin(_1769);
        float _1773 = 1.0 / _1763;
        float _1775 = _1767 * 6.283185482025146484375;
        float _1777 = cos(_1775);
        float _1779 = _1771 * _1773;
        float _1781 = _1767 * 6.283185482025146484375;
        float _1783 = sin(_1781);
        float _1785 = _1777 * _1779;
        float _1787 = 1.0 / _1785;
        float _1789 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1791 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1789;
        float _1793 = 1.0 / _1791;
        float _1795 = _1783 * _1787;
        float _1797 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1799 = fma(_1753, _1795, _1797);
        float _1801 = _1799 * _1793;
        float _1803 = precise::clamp(_1801, 0.0, 1.0);
        _1743 = _1803;
    }
    float _1805 = _1743;
    if (!_1717)
    {
        float _1807 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1809 = _1807 * 0.15915493667125701904296875;
        float _1811 = _1809 * 6.283185482025146484375;
        float _1813 = cos(_1811);
        float _1815 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1817 = _1815 * 0.15915493667125701904296875;
        float _1819 = _1809 * 6.283185482025146484375;
        float _1821 = sin(_1819);
        float _1823 = 1.0 / _1813;
        float _1825 = _1817 * 6.283185482025146484375;
        float _1827 = cos(_1825);
        float _1829 = _1821 * _1823;
        float _1831 = _1817 * 6.283185482025146484375;
        float _1833 = sin(_1831);
        float _1835 = _1827 * _1829;
        float _1837 = 1.0 / _1835;
        float _1839 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1841 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1839;
        float _1843 = 1.0 / _1841;
        float _1845 = _1833 * _1837;
        float _1847 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1849 = fma(_1753, _1845, _1847);
        float _1851 = _1849 * _1843;
        float _1853 = precise::clamp(_1851, 0.0, 1.0);
        float _1855 = -_1853;
        float _1857 = _1855 + 1.0;
        _1755 = _1857;
    }
    float _1859 = _1755;
    float _1861 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1735);
    bool _1863 = _1805 > 0.0;
    bool _1865 = isnan(_1805);
    bool _1867 = _1863 || _1865;
    bool _1869 = isnan(0.0);
    bool _1871 = _1867 || _1869;
    float _1873 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1749);
    float _1875 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1725);
    float _1877 = _1805 * _1859;
    bool _1879 = _1859 <= 0.0;
    bool _1881 = !_1871;
    bool _1883 = _1879 || _1881;
    float _1885 = _1873 * _1747;
    float _1887 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1861);
    float _1889 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1875);
    float _1891 = _1877 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1893 = _1873 + _1885;
    float _1895 = _1893 * 0.5;
    float _1897 = _1891 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1887;
    out.gl_Position.y = _1889;
    out.gl_Position.z = _1885;
    out.gl_Position.w = _1873;
    out.m_54.z = _1895;
    out.m_54.w = _1873;
    out.m_35.x = _1897;
    if (!_1883)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _1899 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1899;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

