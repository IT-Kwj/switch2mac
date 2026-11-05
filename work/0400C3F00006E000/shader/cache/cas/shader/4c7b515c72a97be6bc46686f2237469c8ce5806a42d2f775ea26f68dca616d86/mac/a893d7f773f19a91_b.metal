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
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_54 [[user(locn0)]];
    float4 m_58 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_50 [[user(locn4)]];
    float4 m_56 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_52 [[attribute(4)]];
    float4 m_30 [[attribute(5)]];
    float4 m_35 [[attribute(6)]];
    float4 m_37 [[attribute(7)]];
    float4 m_42 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    bool _971 = false;
    bool _585 = false;
    bool _385 = false;
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
        float _2809 = as_type<float>(_93);
        out.gl_Position.z = _2809;
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
    float _113 = 0.0;
    float _115 = _111;
    if (_107)
    {
        float _117 = float(_77);
        _113 = _117;
    }
    float _119 = _113;
    bool _121 = _111 >= _119;
    bool _123 = !_107;
    bool _125 = _121 || _123;
    if (_125)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _87;
    if (_125)
    {
        out.m_33.x = 0.0;
    }
    if (_125)
    {
        float _129 = _127 * 5.0;
        _95 = as_type<int>(_129);
    }
    int _131 = _95;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2878 = as_type<float>(_131);
        out.gl_Position.z = _2878;
    }
    if (_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = in.m_37.x;
    float _135 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _137 = _111 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _139 = as_type<float>(int(gl_VertexIndex));
    float _141 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    float _153 = _137 * _135;
    float _155 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[20].x, _153);
    float _157 = in.m_35.x;
    float _159 = in.m_35.y;
    float _161 = in.m_35.z;
    float _163 = _155 * 6.283185482025146484375;
    float _165 = floor(_155);
    int _167 = as_type<int>(_139) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_139) & 2;
    bool _173 = _171 != 0;
    float _175 = _139;
    float _177 = 0.5;
    if (!_151)
    {
        float _179 = _141 * _141;
        float _181 = _179 * 0.5;
        _175 = _181;
    }
    float _183 = _175;
    float _185 = _163 * 0.15915493667125701904296875;
    int _187 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _189 = _187 != 0;
    bool _191 = !_169;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = _183;
    if (!_151)
    {
        float _197 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _197;
    }
    float _199 = _195;
    float _201 = _185 * 6.283185482025146484375;
    float _203 = cos(_201);
    bool _205 = !_173;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = -_165;
    float _211 = _155 + _209;
    float _213 = _165;
    float _215 = _199;
    if (!_151)
    {
        _213 = _141;
    }
    float _217 = _213;
    bool _219 = !_151;
    float _221 = _217;
    if (!_219)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = _141 * _225;
        float _235 = 1.0 / _229;
        float _237 = _231 * 0.693147182464599609375;
        float _239 = exp2(_233);
        float _241 = 1.0 / _237;
        float _243 = _239 + (-1.0);
        float _245 = -_243;
        float _247 = fma(_245, _241, _141);
        float _249 = _247 * _235;
        float _251 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _251;
    }
    float _253 = _215;
    bool _255 = !_151;
    if (!_255)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _141 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _221 = _275;
    }
    float _277 = _221;
    float _279 = in.m_42.w;
    float _281 = fma(_203, 0.5, 0.5);
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _285 = _283 != 0;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _289 = _287 != 0;
    float _291 = in.m_30.x;
    float _293 = in.m_30.y;
    float _295 = in.m_30.z;
    bool _297 = _211 < 0.5;
    float _299 = float(_297);
    float _301 = -_211;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _307 = !_189;
    int _309 = _307 ? 0 : 1;
    bool _311 = !_285;
    int _313 = _311 ? 0 : 1;
    float _315 = fma(_277, _157, _305);
    int _317 = abs(_309);
    float _319 = -_299;
    float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _323 = !_289;
    int _325 = _323 ? 0 : 1;
    float _327 = -_281;
    float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _331 = abs(_313);
    float _333 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _335 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _337 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _339 = abs(_325);
    float _341 = fma(_277, _159, _333);
    float _343 = float(_331);
    float _345 = fma(_277, _161, _337);
    float _347 = float(_317);
    float _349 = float(_339);
    float _351 = abs(_303);
    float _353 = _343 * _351;
    float _355 = fma(_315, _279, _291);
    float _357 = fma(_341, _279, _293);
    float _359 = fma(_345, _279, _295);
    float _361 = fma(_347, _329, _353);
    float _363 = abs(_321);
    float _365 = fma(_349, _363, _361);
    bool _367 = !_335;
    float _383;
    if (!_367)
    {
        float _369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _371 = _133 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _373 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _375 = _373 * _369;
        float _377 = floor(_375);
        float _379 = -_377;
        float _381 = _375 + _379;
        _383 = _381;
        _385 = true;
    }
    else
    {
        float _387 = float(_77);
        float _389 = 1.0 / _387;
        float _391 = _111 * _389;
        _383 = _391;
    }
    _385 = false;
    float _393 = _383;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _397 = _393 + _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _401 = _393 + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _411;
    float _415 = in.m_42.x;
    float _417 = in.m_42.y;
    float _419 = 1.0 / _409;
    bool _421 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _423 = 1.0 / _405;
    bool _425 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _427 = isnan(_393);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = 1.0 / _413;
    float _439 = _397 * _423;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _443 = _393 + _441;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _445;
    float _449 = _443 * _419;
    bool _451 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _453 = isnan(_393);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _463;
    float _467 = _401 * _437;
    float _469 = fma(_447, _439, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _471 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _473 = isnan(_393);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -_461;
    float _485 = _483 + 1.0;
    float _487 = fma(_465, _439, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _489 = -_435;
    float _491 = _489 + 1.0;
    float _493 = _435 * _485;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _499 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _501 = isnan(_393);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = _481 * _491;
    float _513 = -_481;
    float _515 = _513 + 1.0;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _521 = fma(_497, _449, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _523 = _509 * _515;
    float _525 = -_509;
    float _527 = _525 + 1.0;
    float _529 = fma(_519, _449, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _531 = _469 * _523;
    float _533 = _487 * _523;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _539;
    float _543 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[143].x, _531);
    float _545 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[143].y, _533);
    float _547 = fma(_537, _467, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _549 = fma(_541, _467, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _551 = fma(_529, _511, _543);
    float _553 = fma(_521, _511, _545);
    float _555 = fma(_547, _493, _551);
    float _557 = fma(_549, _493, _553);
    float _559 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[146].x, _555);
    float _561 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[146].y, _557);
    float _563 = _559 * _415;
    float _565 = _561 * _417;
    bool _567 = !_421;
    float _583;
    if (!_567)
    {
        float _569 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _571 = _133 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _573 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[11].x, _111);
        float _575 = _573 * _569;
        float _577 = floor(_575);
        float _579 = -_577;
        float _581 = _575 + _579;
        _583 = _581;
        _585 = true;
    }
    else
    {
        float _587 = float(_77);
        float _589 = 1.0 / _587;
        float _591 = _111 * _589;
        _583 = _591;
    }
    _585 = false;
    float _593 = _583;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _597 = _593 + _595;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _599;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _607;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _615;
    float _619 = 1.0 / _605;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _625 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _627 = isnan(_593);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = 1.0 / _613;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _641 = _593 + _639;
    bool _643 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _645 = isnan(_593);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    bool _655 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _657 = isnan(_593);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = 1.0 / _623;
    float _669 = _641 * _619;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _673 = _593 + _671;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _677 = _593 + _675;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _681 = _593 + _679;
    float _683 = 1.0 / _601;
    float _685 = _673 * _637;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _691;
    bool _695 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _697 = 1.0 / _617;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _701 = _593 + _699;
    float _703 = _677 * _667;
    bool _705 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _707 = isnan(_593);
    bool _709 = _705 || _707;
    bool _711 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _713 = _709 || _711;
    float _715 = float(_713);
    float _717 = 1.0 / _609;
    float _719 = _701 * _683;
    float _721 = -_635;
    float _723 = _721 + 1.0;
    float _725 = fma(_689, _719, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _727 = _715 * _723;
    float _729 = _681 * _697;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _731;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _735;
    float _739 = fma(_737, _719, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _741 = -_653;
    float _743 = _741 + 1.0;
    float _745 = _597 * _717;
    float _747 = -_715;
    float _749 = _747 + 1.0;
    float _751 = fma(_733, _719, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _753 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _755 = isnan(_593);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = _653 * _749;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _773 = _771 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _775 = -_763;
    float _777 = _775 + 1.0;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _781 = _779 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _783 = _763 * _743;
    bool _785 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _787 = isnan(_593);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _793 = _789 || _791;
    float _795 = float(_793);
    float _797 = fma(_769, _669, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    bool _799 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _801 = isnan(_593);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _807 = _803 || _805;
    float _809 = float(_807);
    float _811 = _665 * _777;
    float _813 = -_665;
    float _815 = _813 + 1.0;
    float _817 = fma(_773, _669, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _819 = fma(_781, _669, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _821 = -_809;
    float _823 = _821 + 1.0;
    float _825 = _809 * _815;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _827;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _831;
    float _835 = _795 * _823;
    float _837 = -_795;
    float _839 = _837 + 1.0;
    float _841 = fma(_829, _745, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _843 = fma(_833, _745, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _845 = fma(_693, _745, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _847 = _739 * _835;
    float _849 = _725 * _835;
    float _851 = _751 * _835;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _865 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[107].y, _847);
    float _867 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[107].z, _849);
    float _869 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[107].x, _851);
    float _871 = fma(_855, _685, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _873 = fma(_859, _685, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _875 = fma(_863, _685, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _877 = fma(_817, _825, _865);
    float _879 = fma(_819, _825, _867);
    float _881 = fma(_797, _825, _869);
    float _883 = fma(_845, _811, _879);
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _885;
    float _889 = fma(_841, _811, _881);
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _891;
    float _895 = fma(_843, _811, _877);
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _897;
    float _901 = fma(_887, _729, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _903 = fma(_893, _729, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _905 = fma(_875, _783, _883);
    float _907 = fma(_899, _729, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _909 = fma(_871, _783, _889);
    float _911 = fma(_873, _783, _895);
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _925 = fma(_901, _765, _909);
    float _927 = fma(_915, _703, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _929 = fma(_919, _703, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _931 = fma(_903, _765, _911);
    float _933 = fma(_923, _703, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _935 = fma(_907, _765, _905);
    float _937 = fma(_927, _727, _925);
    float _939 = fma(_929, _727, _931);
    float _941 = fma(_933, _727, _935);
    float _943 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[113].x, _937);
    float _945 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[113].y, _939);
    float _947 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[113].z, _941);
    bool _949 = !_695;
    float _967;
    float _969;
    if (!_949)
    {
        float _951 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _953 = _133 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _955 = float(_77);
        float _957 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _959 = _957 * _951;
        float _961 = floor(_959);
        float _963 = -_961;
        float _965 = _959 + _963;
        _967 = _955;
        _969 = _965;
        _971 = true;
    }
    else
    {
        float _973 = float(_77);
        float _975 = 1.0 / _973;
        float _977 = _111 * _975;
        _967 = _973;
        _969 = _977;
    }
    _971 = false;
    float _979 = _967;
    float _981 = _969;
    float _983 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _985 = int(_983);
    float _987 = in.m_44.x;
    float _989 = in.m_44.y;
    float _991 = in.m_44.z;
    float _993 = in.m_44.w;
    float _995 = _133 * 2.0;
    float _997 = in.m_37.y;
    float _999 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1001 = int(_999);
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1011 = float(_985);
    float _1013 = 1.0 / _979;
    float _1015 = float(uint(_1001));
    float _1017 = 1.0 / _1011;
    int _1019 = ~_1001;
    int _1021 = _1019 + 1;
    float _1023 = _357 * _989;
    int _1025 = ~_1001;
    int _1027 = _1025 + 1;
    bool _1029 = _1001 == 0;
    float _1031 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1009);
    int _1033 = ~_1001;
    int _1035 = _1033 + 1;
    float _1037 = 1.0 / _1015;
    int _1039 = ~_1001;
    int _1041 = _1039 + 1;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1045 = _1017 * _111;
    float _1047 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1049 = log2(_1047);
    int _1051 = as_type<int>(_1037) + (-2);
    float _1053 = trunc(_1045);
    int _1055 = int(_1053);
    float _1057 = _1049 * _111;
    float _1059 = floor(_995);
    float _1061 = float(uint(_1055));
    float _1063 = exp2(_1057);
    float _1065 = as_type<float>(_1051) * _1061;
    float _1067 = 1.0 / _1007;
    float _1069 = trunc(_1065);
    float _1071 = precise::max(_1069, 0.0);
    uint _1074 = uint(_1071);
    int _1076 = _1021 * int(_1074);
    int _1078 = _1076 + _1055;
    float _1080 = float(uint(_1078));
    float _1082 = as_type<float>(_1051) * _1080;
    float _1084 = trunc(_1082);
    float _1086 = precise::max(_1084, 0.0);
    uint _1088 = uint(_1086);
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1092 = _1090 != 0;
    bool _1094 = !_1092;
    float _1096 = _1094 ? 7.345489978790283203125 : 1.0;
    float _1098 = float(_1055);
    float _1100 = _1096 * _133;
    int _1102 = int(_1074) + int(_1088);
    float _1104 = float(_1001);
    float _1106 = floor(_1100);
    int _1108 = _1027 * _1102;
    int _1110 = _1108 + _1055;
    bool _1112 = _1098 >= _1104;
    bool _1114 = isnan(_1098);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(_1104);
    bool _1120 = _1116 || _1118;
    float _1122 = float(_1120);
    bool _1124 = uint(_1110) >= uint(_1001);
    float _1126 = trunc(_1122);
    int _1128 = int(_1126);
    bool _1130 = !_1124;
    int _1132 = _1130 ? 0 : (-1);
    int _1134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1136 = _1134 != 0;
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1140 = _1138 != 0;
    int _1142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1144 = _1142 != 0;
    int _1146 = ~_1102;
    int _1148 = _1146 + _1132;
    int _1150 = _1148 + 1;
    float _1152 = -_1106;
    float _1154 = _1100 + _1152;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1158 = _1156 != 0;
    bool _1160 = _1059 > 0.0;
    int _1162 = _1001 * _1150;
    int _1164 = _1162 + _1055;
    bool _1166 = _1059 >= 0.0;
    bool _1168 = isnan(_1059);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan(0.0);
    bool _1174 = _1170 || _1172;
    bool _1176 = !_1029;
    int _1178 = _1176 ? _1164 : (-1);
    float _1180 = _1154 * _1104;
    float _1182 = _1104 * _111;
    int _1184 = ~_1128;
    int _1186 = _1184 + 1;
    int _1188 = _1186 + 1;
    bool _1190 = !_1140;
    int _1192 = _1190 ? 0 : 1;
    float _1194 = _1182 * _1013;
    float _1196 = trunc(_1180);
    int _1198 = int(_1196);
    int _1200 = _1178 * _1188;
    int _1202 = _1001 + (-1);
    int _1204 = abs(_1192);
    bool _1206 = !_1144;
    int _1208 = _1206 ? 0 : 1;
    int _1210 = _1128 * _1202;
    int _1212 = _1210 + _1200;
    float _1214 = trunc(_1194);
    int _1216 = int(_1214);
    bool _1218 = !_1136;
    int _1220 = _1218 ? 0 : 1;
    bool _1222 = !_1158;
    int _1224 = _1222 ? 0 : 1;
    int _1226 = _1212 * _1204;
    int _1228 = abs(_1220);
    int _1230 = abs(_1208);
    int _1232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1234 = _1232 != 0;
    int _1236 = abs(_1224);
    bool _1238 = !_1234;
    int _1240 = _1238 ? 0 : 1;
    int _1242 = _1198 * _1236;
    int _1244 = _1242 + _1055;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1248 = _1246 != 0;
    int _1250 = _1216 * _1228;
    int _1252 = _1250 + _1226;
    int _1254 = abs(_1240);
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1258 = _1256 != 0;
    int _1260 = _1244 * _1230;
    int _1262 = _1260 + _1252;
    int _1264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1266 = _1264 != 0;
    bool _1268 = _133 > 0.5;
    int _1270 = _1198 * _1254;
    int _1272 = _1270 + _1262;
    float _1274 = float(uint(_1244));
    float _1276 = in.m_46.x;
    float _1278 = in.m_46.y;
    float _1280 = in.m_46.z;
    float _1282 = in.m_46.w;
    float _1284 = float(uint(_1272));
    float _1286 = as_type<float>(_1051) * _1274;
    float _1288 = as_type<float>(_1051) * _1284;
    float _1290 = in.m_48.x;
    float _1292 = in.m_48.y;
    float _1294 = in.m_48.z;
    float _1296 = in.m_48.w;
    float _1298 = trunc(_1288);
    float _1300 = precise::max(_1298, 0.0);
    uint _1302 = uint(_1300);
    float _1304 = _357 * _1278;
    float _1306 = fma(_355, _1276, _1304);
    float _1308 = _997 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1310 = _1035 * int(_1302);
    int _1312 = _1310 + _1272;
    float _1314 = fma(_359, _1280, _1306);
    float _1316 = fma(_1308, -2.0, _1003);
    float _1318 = -_193;
    int _1320 = _1268 ? as_type<int>(_1318) : as_type<int>(_193);
    float _1322 = float(uint(_1312));
    float _1324 = _357 * _1292;
    float _1326 = fma(_355, _987, _1023);
    bool _1328 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1330 = isnan(0.0);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1336 = _1332 || _1334;
    float _1338 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1316);
    float _1340 = as_type<float>(_1051) * _1322;
    float _1342 = fma(_355, _1290, _1324);
    float _1344 = _133 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1346 = trunc(_1340);
    float _1348 = precise::max(_1346, 0.0);
    uint _1350 = uint(_1348);
    float _1352 = fma(_359, _991, _1326);
    float _1354 = -_1043;
    float _1356 = fma(_1344, 2.0, _1354);
    float _1358 = fma(_359, _1294, _1342);
    float _1360 = in.m_37.z;
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1364 = _1362 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1368 = _1366 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    int _1370 = _1174 ? 0 : 1;
    float _1372 = 1.0 / _1364;
    float _1374 = _1352 + _993;
    float _1376 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1376;
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1382 = _1380 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1384 = int(_1302) + int(_1350);
    float _1386 = _1358 + _1296;
    bool _1388 = !_1258;
    float _1390 = _1388 ? _193 : as_type<float>(_1320);
    float _1392 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1394 = _1392 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1396 = _997 > 0.5;
    int _1398 = _1041 * _1384;
    int _1400 = _1398 + _1272;
    float _1402 = -_1063;
    float _1404 = _1402 + 1.0;
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1408 = _1406 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1410 = -_207;
    int _1412 = _1396 ? as_type<int>(_1410) : as_type<int>(_207);
    float _1414 = 1.0 / _1394;
    bool _1416 = uint(_1400) >= uint(_1001);
    float _1418 = _1378 * _1067;
    bool _1420 = !_1266;
    float _1422 = _1420 ? _207 : as_type<float>(_1412);
    float _1424 = _1382 * _1372;
    float _1426 = _1336 ? _1404 : 0.0;
    float _1428 = _1360 * 2.0;
    bool _1430 = !_1416;
    int _1432 = _1430 ? 0 : (-1);
    float _1434 = 1.0 / _1408;
    int _1436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1438 = _1436 != 0;
    int _1440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1442 = _1440 != 0;
    int _1444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1446 = _1444 != 0;
    float _1448 = _1422 + (-0.5);
    float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1452 = _1450 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _1454 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1456 = isnan(1.0);
    bool _1458 = _1454 || _1456;
    bool _1460 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1462 = _1458 || _1460;
    float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _1464;
    float _1468 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1470 = 1.0 + _1468;
    float _1472 = 1.0 / _1452;
    float _1474 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1474;
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1480 = _1478 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _1484 = _1482 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    int _1486 = ~_1384;
    int _1488 = _1486 + _1432;
    int _1490 = _1488 + 1;
    float _1492 = _1480 * _1434;
    float _1494 = _133 + _997;
    float _1496 = 1.0 / _1368;
    float _1498 = _1476 * _1414;
    float _1500 = _1494 + (-1.0);
    int _1502 = _1001 * _1490;
    int _1504 = _1502 + _1272;
    bool _1506 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1508 = isnan(_981);
    bool _1510 = _1506 || _1508;
    bool _1512 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1514 = _1510 || _1512;
    float _1516 = float(_1514);
    float _1518 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1520 = _1466 * _1472;
    float _1522 = _997 * 2.0;
    float _1524 = 1.0 / _1470;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1528 = _997 + _1360;
    float _1530 = _997 + (-0.5);
    float _1532 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1526);
    float _1534 = _1484 * _1496;
    float _1536 = _1528 + (-1.0);
    float _1538 = floor(_1522);
    float _1540 = -_111;
    float _1542 = fma(_1540, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1356);
    float _1544 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1532);
    float _1546 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1031);
    int _1548 = ~_1370;
    int _1550 = _1548 + 1;
    int _1552 = _1550 + 1;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1556 = _981 + _1554;
    int _1558 = _1552;
    if (!_1160)
    {
        int _1560 = ~_1370;
        int _1562 = _1560 + 1;
        _1558 = _1562;
    }
    int _1564 = _1558;
    float _1566 = -_1544;
    float _1568 = _1566 + 1.0;
    float _1570 = floor(_1428);
    if (_1462)
    {
        float _1572 = _1426 * _1524;
        _115 = _1572;
    }
    float _1574 = _115;
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1578 = _981 + _1576;
    bool _1580 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _1582 = isnan(_981);
    bool _1584 = _1580 || _1582;
    bool _1586 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _1588 = _1584 || _1586;
    float _1590 = float(_1588);
    float _1592 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1594 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1596 = _981 + _1594;
    float _1598 = fma(_1418, _1578, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1600 = fma(_1498, _1556, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1602 = _1538 >= 0.0;
    bool _1604 = isnan(_1538);
    bool _1606 = _1602 || _1604;
    bool _1608 = isnan(0.0);
    bool _1610 = _1606 || _1608;
    float _1612 = -_1590;
    float _1614 = _1612 + 1.0;
    bool _1616 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _1618 = isnan(_981);
    bool _1620 = _1616 || _1618;
    bool _1622 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _1624 = _1620 || _1622;
    float _1626 = float(_1624);
    float _1628 = fma(_1492, _1596, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    int _1630 = _1610 ? 0 : 1;
    float _1632 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1634 = _981 + _1632;
    bool _1636 = _1538 > 0.0;
    float _1638 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1640 = _981 + _1638;
    bool _1642 = _1570 >= 0.0;
    bool _1644 = isnan(_1570);
    bool _1646 = _1642 || _1644;
    bool _1648 = isnan(0.0);
    bool _1650 = _1646 || _1648;
    float _1652 = _1626 * _1614;
    float _1654 = _1390 + 0.5;
    float _1656 = fma(_1424, _1640, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1658 = _1650 ? 0 : 1;
    float _1660 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1662 = _981 + _1660;
    bool _1664 = _1570 > 0.0;
    float _1666 = fma(_1534, _1634, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    bool _1668 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1670 = isnan(_981);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1676 = _1672 || _1674;
    float _1678 = float(_1676);
    float _1680 = fma(_1520, _1662, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _1682 = -_1626;
    float _1684 = _1682 + 1.0;
    bool _1686 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1688 = isnan(_981);
    bool _1690 = _1686 || _1688;
    bool _1692 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1694 = _1690 || _1692;
    float _1696 = float(_1694);
    float _1698 = -_1546;
    float _1700 = _1698 + 1.0;
    float _1702 = -_1678;
    float _1704 = _1702 + 1.0;
    float _1706 = _1678 * _1684;
    float _1708 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1542);
    bool _1710 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1712 = isnan(_981);
    bool _1714 = _1710 || _1712;
    bool _1716 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1718 = _1714 || _1716;
    float _1720 = float(_1718);
    float _1722 = _1696 * _1704;
    float _1724 = -_1696;
    float _1726 = _1724 + 1.0;
    bool _1728 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1730 = isnan(_981);
    bool _1732 = _1728 || _1730;
    bool _1734 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1736 = _1732 || _1734;
    float _1738 = float(_1736);
    float _1740 = _1314 + _1282;
    float _1742 = -_1720;
    float _1744 = _1742 + 1.0;
    float _1746 = _1720 * _1726;
    int _1748 = ~_1001;
    int _1750 = _1748 + 1;
    float _1752 = trunc(_1286);
    float _1754 = precise::max(_1752, 0.0);
    uint _1756 = uint(_1754);
    float _1758 = -_1738;
    float _1760 = _1758 + 1.0;
    float _1762 = -_1448;
    float _1764 = -_1338;
    float _1766 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1764);
    float _1768 = _1738 * _1744;
    float _1770 = _1516 * _1760;
    float _1772 = fma(_1422, _1700, _1766);
    int _1774 = ~_1658;
    int _1776 = _1774 + 1;
    int _1778 = _1776 + 1;
    float _1780 = _1598 * _1770;
    bool _1782 = !_1029;
    int _1784 = _1782 ? _1504 : (-1);
    float _1786 = -_1516;
    float _1788 = _1786 + 1.0;
    int _1790 = _1778;
    if (!_1664)
    {
        int _1792 = ~_1658;
        int _1794 = _1792 + 1;
        _1790 = _1794;
    }
    int _1796 = _1790;
    int _1798 = _1784 >> 31;
    float _1800 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1780);
    int _1802 = _1750 * int(_1756);
    int _1804 = _1802 + _1244;
    int _1806 = ~_1630;
    int _1808 = _1806 + 1;
    int _1810 = _1808 + 1;
    int _1812 = _1798 & 3;
    float _1814 = fma(_1656, _1768, _1800);
    float _1816 = float(uint(_1804));
    int _1818 = _1784 + _1812;
    bool _1820 = !_1442;
    int _1822 = _1820 ? 0 : 1;
    int _1824 = _1818 >> 2;
    int _1826 = abs(_1822);
    int _1828 = _1824 << 4;
    int _1830 = _1828 + 368;
    int _1832 = _1810;
    if (!_1636)
    {
        int _1834 = ~_1630;
        int _1836 = _1834 + 1;
        _1832 = _1836;
    }
    int _1838 = _1832;
    float _1840 = as_type<float>(_1051) * _1816;
    float _1842 = -_1568;
    float _1844 = fma(_1390, _1842, _1708);
    float _1846 = fma(_1600, _1746, _1814);
    uint _1848 = uint(int(uint(_1830) >> uint(2)));
    uint _1850 = uint(int(uint(int(_1848)) >> uint(2)));
    int _1852 = int(_1848) & 3;
    float _1854 = (*spvDescriptorSet0.vp_c9)._m0[int(_1850)][_1852];
    int _1856 = int(_1848) + 1;
    uint _1858 = uint(int(uint(_1856) >> uint(2)));
    int _1860 = _1856 & 3;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[int(_1858)][_1860];
    bool _1864 = !_1438;
    int _1866 = _1864 ? 0 : 1;
    float _1868 = trunc(_1840);
    float _1870 = precise::max(_1868, 0.0);
    uint _1872 = uint(_1870);
    float _1874 = float(_1826);
    out.m_50.x = _1844;
    out.m_50.y = _1772;
    int _1876 = abs(_1866);
    float _1878 = fma(_1628, _1722, _1846);
    float _1880 = float(_1564);
    int _1882 = _1830 + 8;
    uint _1884 = uint(int(uint(_1882) >> uint(2)));
    uint _1886 = uint(int(uint(int(_1884)) >> uint(2)));
    int _1888 = int(_1884) & 3;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[int(_1886)][_1888];
    int _1892 = int(_1884) + 1;
    uint _1894 = uint(int(uint(_1892) >> uint(2)));
    int _1896 = _1892 & 3;
    float _1898 = (*spvDescriptorSet0.vp_c9)._m0[int(_1894)][_1896];
    int _1900 = _1784 & 3;
    bool _1902 = _1900 != 0;
    float _1904 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1906 = _1374 + _1904;
    int _1908 = _1784 & 3;
    bool _1910 = _1908 != 0;
    float _1912 = _1874 * _1880;
    bool _1914 = uint(_1900) > 1u;
    float _1916 = in.m_52.x;
    float _1918 = in.m_52.y;
    float _1920 = in.m_52.z;
    int _1922 = _1910 ? 0 : 1;
    float _1924 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1926 = _1740 + _1924;
    bool _1928 = uint(_1900) >= 2u;
    float _1930 = fma(_1680, _1706, _1878);
    int _1932 = ~_1922;
    int _1934 = _1932 + 1;
    int _1936 = _1934 + 1;
    float _1938 = _1926 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1940 = int(_1756) + int(_1872);
    float _1942 = fma(_1666, _1652, _1930);
    int _1944 = ~_1001;
    int _1946 = _1944 + 1;
    float _1948 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1938);
    int _1950 = _1928 ? 0 : 1;
    int _1952 = _1936;
    if (!_1914)
    {
        int _1954 = ~_1922;
        int _1956 = _1954 + 1;
        _1952 = _1956;
    }
    int _1958 = _1952;
    float _1960 = _1912 * (-2.0);
    bool _1962 = _1900 != 3;
    int _1964 = _1946 * _1940;
    int _1966 = _1964 + _1244;
    int _1968 = abs(_1958);
    float _1970 = fma(_1592, _1960, _1592);
    float _1972 = float(_1796);
    int _1974 = ~_1950;
    int _1976 = _1974 + 1;
    int _1978 = _1976 + 1;
    int _1980 = ~_1968;
    int _1982 = _1980 + 1;
    int _1984 = _1982 + 1;
    float _1986 = fma(_1960, _1918, _1918);
    bool _1988 = !_1902;
    int _1990 = _1988 ? 0 : 1;
    bool _1992 = _1900 != 3;
    float _1994 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1986);
    int _1996 = _1978;
    if (_1962)
    {
        int _1998 = ~_1950;
        int _2000 = _1998 + 1;
        _1996 = _2000;
    }
    int _2002 = _1996;
    int _2004 = abs(_1990);
    float _2006 = fma(_1970, _1574, _1994);
    bool _2008 = uint(_1966) >= uint(_1001);
    int _2010 = _1984 * as_type<int>(_1862);
    bool _2012 = !_1992;
    int _2014 = _2012 ? 0 : (-1);
    float _2016 = float(_1876);
    int _2018 = abs(_2002);
    bool _2020 = !_1248;
    int _2022 = _2020 ? 0 : 1;
    float _2024 = _2016 * _1972;
    int _2026 = abs(_2014);
    float _2028 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2030 = _1386 + _2028;
    int _2032 = ~_2004;
    int _2034 = _2032 + 1;
    int _2036 = _2034 + 1;
    float _2038 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1948);
    int _2040 = abs(_2022);
    int _2042 = _2036 * as_type<int>(_1854);
    int _2044 = _2042 + _2010;
    int _2046 = ~_2018;
    int _2048 = _2046 + 1;
    int _2050 = _2048 + 1;
    float _2052 = _1926 * _1926;
    bool _2054 = !_2008;
    int _2056 = _2054 ? 0 : (-1);
    int _2058 = ~_2026;
    int _2060 = _2058 + 1;
    int _2062 = _2060 + 1;
    int _2064 = _2050 * as_type<int>(_1890);
    int _2066 = _2064 + _2044;
    int _2068 = ~_1940;
    int _2070 = _2068 + _2056;
    int _2072 = _2070 + 1;
    float _2074 = fma(_1906, _1906, _2052);
    bool _2076 = _2038 >= 0.0;
    int _2078 = _2062 * as_type<int>(_1898);
    int _2080 = _2078 + _2066;
    int _2082 = _1001 * _2072;
    int _2084 = _2082 + _1244;
    float _2086 = _945 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2088 = fma(_2030, _2030, _2074);
    int _2090 = ~_2040;
    int _2092 = _2090 + 1;
    int _2094 = _2092 + 1;
    float _2096 = _943 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2098 = !_1029;
    int _2100 = _2098 ? _2084 : (-1);
    float _2102 = _2086 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2104 = !_1446;
    int _2106 = _2104 ? 0 : 1;
    int _2108 = _2080 * _2094;
    float _2110 = rsqrt(_2088);
    float _2112 = fma(_1590, (*spvDescriptorSet0.vp_c9)._m0[121].x, _1942);
    float _2114 = _2074;
    if (_2076)
    {
        _2114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2116 = _2114;
    int _2118 = _2100 * _2040;
    int _2120 = _2118 + _2108;
    float _2122 = _947 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2124 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2126 = as_type<int>(_2116);
    if (_2076)
    {
        float _2128 = _2116 * 5.0;
        _2126 = as_type<int>(_2128);
    }
    int _2130 = _2126;
    float _2132 = _2122 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2134 = _2112 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2136 = float(_2120);
    if (_2076)
    {
        out.m_33.x = 0.0;
    }
    int _2138 = abs(_2106);
    float _2140 = _133 + (-0.5);
    float _2142 = float(_1838);
    if (_2076)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5874 = as_type<float>(_2130);
        out.gl_Position.z = _5874;
    }
    float _2144 = float(_2138);
    float _2146 = _1926 * _2110;
    float _2148 = _1906 * _2110;
    out.m_54.x = _2124;
    out.m_54.y = _2102;
    out.m_54.z = _2132;
    out.m_54.w = _2134;
    out.m_56.x = _2136;
    if (_2076)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2150 = -_2146;
    float _2152 = fma(_2150, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1740);
    float _2154 = _2030 * _2110;
    float _2156 = -_2148;
    float _2158 = fma(_2156, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1374);
    float _2160 = _2024 * (-2.0);
    float _2162 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2164 = _2152 + _2162;
    float _2166 = -_2154;
    float _2168 = fma(_2166, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1386);
    float _2170 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2172 = _2158 + _2170;
    float _2174 = _2006 * 0.15915493667125701904296875;
    float _2176 = _2164 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2178 = fma(_2160, _1916, _1916);
    float _2180 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2182 = _2168 + _2180;
    float _2184 = fma(_1518, _2160, _1518);
    float _2186 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2176);
    float _2188 = fma(_2140, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2178);
    float _2190 = _2144 * _2142;
    float _2192 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2186);
    float _2194 = fma(_2184, _1574, _2188);
    float _2196 = _133 + _1360;
    float _2198 = -_2146;
    float _2200 = fma(_2198, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1926);
    float _2202 = _1360 + (-0.5);
    bool _2204 = _2192 >= 0.0;
    float _2206 = _2194 * 0.15915493667125701904296875;
    float _2208 = _2196 + (-1.0);
    float _2210 = _2190 * (-2.0);
    float _2212 = -_2148;
    float _2214 = fma(_2212, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1906);
    float _2216 = _2200 * _2200;
    float _2218 = fma(_2208, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2220 = fma(_2210, _1920, _1920);
    float _2222 = -_2154;
    float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2030);
    float _2226 = fma(_2214, _2214, _2216);
    float _2228 = fma(_2218, _2210, _2218);
    float _2230 = fma(_2202, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2220);
    float _2232 = _2174 * 6.283185482025146484375;
    float _2234 = sin(_2232);
    float _2236 = _2202;
    int _2238 = as_type<int>(_2230);
    if (_2204)
    {
        _2236 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2240 = _2236;
    float _2242 = fma(_2224, _2224, _2226);
    float _2244 = fma(_2228, _1574, _2230);
    if (_2204)
    {
        out.m_33.x = 0.0;
    }
    if (_2204)
    {
        float _2246 = _2240 * 5.0;
        _2238 = as_type<int>(_2246);
    }
    int _2248 = _2238;
    float _2250 = _2244 * 0.15915493667125701904296875;
    float _2252 = _2174 * 6.283185482025146484375;
    float _2254 = cos(_2252);
    float _2256 = _365 * _565;
    if (_2204)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6086 = as_type<float>(_2248);
        out.gl_Position.z = _6086;
    }
    float _2258 = _2206 * 6.283185482025146484375;
    float _2260 = sin(_2258);
    float _2262 = _2206 * 6.283185482025146484375;
    float _2264 = cos(_2262);
    float _2266 = sqrt(_2242);
    float _2268 = _2250 * 6.283185482025146484375;
    float _2270 = sin(_2268);
    if (_2204)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2272 = _2250 * 6.283185482025146484375;
    float _2274 = cos(_2272);
    float _2276 = _2110 * _2266;
    float _2278 = _2256 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2280 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _2282 = _2260 * _2234;
    float _2284 = _2264 * _2254;
    float _2286 = _2276 * _2278;
    float _2288 = _365 * _563;
    float _2290 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _2292 = fma(_2270, _2284, _2282);
    float _2294 = _2280 * _2286;
    float _2296 = _2288 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2298 = fma(_2270, _2282, _2284);
    float _2300 = _2264 * _2234;
    float _2302 = _2260 * _2254;
    float _2304 = _2276 * _2296;
    float _2306 = _2274 * _2294;
    float _2308 = -_2294;
    float _2310 = _2270 * _2308;
    float _2312 = -_2300;
    float _2314 = fma(_2270, _2302, _2312);
    float _2316 = -_2302;
    float _2318 = fma(_2270, _2300, _2316);
    float _2320 = _2290 * _2304;
    float _2322 = _2264 * _2306;
    float _2324 = _2254 * _2274;
    float _2326 = _2260 * _2306;
    float _2328 = _2234 * _2274;
    float _2330 = fma(_2292, _2320, _2322);
    float _2332 = _2276 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2334 = _2332 * 0.5;
    float _2336 = fma(_2324, _2320, _2310);
    float _2338 = fma(_2314, _2320, _2326);
    float _2340 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2342 = fma(_2318, _2334, _2330);
    float _2344 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2346 = fma(_2328, _2334, _2336);
    float _2348 = fma(_2298, _2334, _2338);
    float _2350 = _2342 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2352 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2344);
    float _2354 = _2342 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2356 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2340);
    float _2358 = fma(_2346, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2350);
    float _2360 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2352);
    float _2362 = fma(_2346, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2354);
    float _2364 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2356);
    float _2366 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2358);
    float _2368 = _2360 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2370 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2362);
    bool _2372 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2374 = isnan(0.5);
    bool _2376 = _2372 || _2374;
    bool _2378 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2380 = _2376 || _2378;
    float _2382 = _2366 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2384 = 1.0 / _2368;
    float _2386 = _2370 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2388 = _2364 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2390 = _1386 + _2382;
    float _2392 = _1374 + _2386;
    float _2394 = _2388 + _2368;
    float _2396 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2398 = _2390 + _2396;
    bool _2400 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2402 = isnan(0.5);
    bool _2404 = _2400 || _2402;
    bool _2406 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2408 = _2404 || _2406;
    float _2410 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2412 = _2392 + _2410;
    float _2414 = _2342 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2416 = _2398 * _2398;
    float _2418 = _2298;
    float _2420 = _2310;
    float _2422 = _2416;
    float _2424 = _2414;
    float _2426 = _2342;
    if (!_2380)
    {
        _2418 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2428 = _2418;
    float _2430 = fma(_2346, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2414);
    float _2432 = fma(_2412, _2412, _2416);
    float _2434 = _2394 * _2384;
    float _2436 = _2434 * 0.5;
    if (!_2380)
    {
        float _2438 = -_2428;
        float _2440 = _2438 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2420 = _2440;
    }
    float _2442 = _2420;
    float _2444 = _2442;
    if (!_2380)
    {
        _2422 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2446 = _2422;
    float _2448 = sqrt(_2432);
    float _2450 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2452 = fma(_2436, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2450);
    float _2454 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2430);
    float _2456 = _2446;
    if (_2380)
    {
        _2424 = 1.0;
    }
    float _2458 = _2424;
    float _2460 = _2454 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2462 = 1.0 / _2452;
    float _2464 = _1740 + _2460;
    float _2466 = _2264;
    float _2468 = _2460;
    float _2470 = _2458;
    if (!_2380)
    {
        float _2472 = 1.0 / _2442;
        _2466 = _2472;
    }
    float _2474 = _2466;
    bool _2476 = _2448 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_2380)
    {
        float _2478 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2480 = -_2428;
        float _2482 = fma(_2462, _2478, _2480);
        _2426 = _2482;
    }
    float _2484 = _2426;
    float _2486 = _2484;
    if (!_2380)
    {
        float _2488 = -_2446;
        float _2490 = _2488 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2444 = _2490;
    }
    float _2492 = _2444;
    if (!_2380)
    {
        float _2494 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2496 = -_2446;
        float _2498 = fma(_2462, _2494, _2496);
        _177 = _2498;
    }
    float _2500 = _177;
    if (_2380)
    {
        _2456 = 1.0;
    }
    float _2502 = _2456;
    float _2504 = _2294;
    float _2506 = _2502;
    if (!_2380)
    {
        float _2508 = 1.0 / _2492;
        _2504 = _2508;
    }
    float _2510 = _2504;
    if (!_2476)
    {
        _2468 = _2390;
    }
    float _2512 = _2468;
    float _2514 = _2512;
    if (!_2380)
    {
        float _2516 = _2484 * _2474;
        float _2518 = precise::clamp(_2516, 0.0, 1.0);
        _2486 = _2518;
    }
    float _2520 = _2486;
    float _2522 = _2520;
    if (!_2380)
    {
        float _2524 = -_2520;
        float _2526 = _2524 + 1.0;
        _2506 = _2526;
    }
    float _2528 = _2506;
    if (!_2476)
    {
        _2522 = _2464;
    }
    float _2530 = _2522;
    float _2532 = _2510;
    float _2534 = _2530;
    if (!_2380)
    {
        float _2536 = _2500 * _2510;
        float _2538 = precise::clamp(_2536, 0.0, 1.0);
        _2470 = _2538;
    }
    float _2540 = _2470;
    float _2542 = _2540;
    if (!_2476)
    {
        _2532 = _2392;
    }
    float _2544 = _2532;
    bool _2546 = !_2476;
    float _2548 = _2544;
    if (!_2546)
    {
        float _2550 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2554 = _2448 + _2552;
        float _2556 = rsqrt(_2432);
        float _2558 = _2554 * _2550;
        float _2560 = _2464 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2562 = _2558 * 0.15915493667125701904296875;
        float _2564 = _2562 * 6.283185482025146484375;
        float _2566 = sin(_2564);
        float _2568 = _2562 * 6.283185482025146484375;
        float _2570 = cos(_2568);
        float _2572 = fma(_2566, _2560, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2574 = _2556 * _2572;
        float _2576 = _2570 + (-1.0);
        float _2578 = fma(_2412, _2574, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2580 = fma(_2398, _2574, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2582 = _2576 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2584 = fma(_2464, _2570, _2582);
        _2548 = _2578;
        _2534 = _2584;
        _2514 = _2580;
    }
    float _2586 = _2548;
    float _2588 = _2534;
    float _2590 = _2514;
    float _2592 = -_2148;
    float _2594 = fma(_2592, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2586);
    bool _2596 = _2540 > 0.0;
    bool _2598 = isnan(_2540);
    bool _2600 = _2596 || _2598;
    bool _2602 = isnan(0.0);
    bool _2604 = _2600 || _2602;
    float _2606 = _2540 * _2528;
    float _2608 = -_2146;
    float _2610 = fma(_2608, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2588);
    float _2612 = -_2154;
    float _2614 = fma(_2612, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2590);
    float _2616 = _2610;
    float _2618 = _2614;
    if (_2408)
    {
        _2542 = _2594;
    }
    float _2620 = _2542;
    float _2622 = _2620;
    if (!_2408)
    {
        float _2624 = _2164 * _2164;
        float _2626 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2628 = -_1386;
        float _2630 = _2628 + _2590;
        float _2632 = -_1374;
        float _2634 = _2632 + _2586;
        float _2636 = fma(_2172, _2172, _2624);
        float _2638 = fma(_2182, _2182, _2636);
        float _2640 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2642 = sqrt(_2638);
        float _2644 = 1.0 / _2276;
        float _2646 = _2640 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2648 = precise::min(_2642, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2650 = _2648 * _2626;
        float _2652 = _2650 * _2644;
        float _2654 = -_1740;
        float _2656 = _2654 + _2588;
        float _2658 = _2646 * _2652;
        float _2660 = _2630 * _2652;
        float _2662 = fma(_2634, _2658, _2158);
        float _2664 = fma(_2656, _2658, _2152);
        float _2666 = fma(_2646, _2660, _2168);
        _2616 = _2664;
        _2622 = _2662;
        _2618 = _2666;
    }
    float _2668 = _2616;
    float _2670 = _2622;
    float _2672 = _2618;
    float _2674 = _2668 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    bool _2676 = _2528 <= 0.0;
    bool _2678 = !_2604;
    bool _2680 = _2676 || _2678;
    float _2682 = _2668 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2684 = _2668 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2686 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2674);
    float _2688 = _2668 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2690 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2682);
    float _2692 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2684);
    float _2694 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2686);
    float _2696 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2688);
    float _2698 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2690);
    float _2700 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2692);
    float _2702 = _2694 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2704 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2696);
    float _2706 = _2698 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2708 = _2700 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2710 = _2702 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2712 = _2702 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2714 = _2702 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2716 = _2702 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2718 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2710);
    float _2720 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2712);
    float _2722 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2714);
    float _2724 = _2704 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2726 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2718);
    float _2728 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2720);
    float _2730 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2716);
    float _2732 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2722);
    float _2734 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2726);
    float _2736 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2728);
    float _2738 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2730);
    float _2740 = _2606 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2742 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2732);
    float _2744 = _2734 + _2736;
    float _2746 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2738);
    float _2748 = _2740 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2750 = _2744 * 0.5;
    out.m_33.x = _2748;
    out.gl_Position.x = _2742;
    out.gl_Position.y = _2746;
    out.gl_Position.z = _2734;
    out.gl_Position.w = _2736;
    out.m_58.z = _2750;
    out.m_58.w = _2736;
    if (!_2680)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2752 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_33.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2752;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    bool _971 = false;
    bool _585 = false;
    bool _385 = false;
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
        float _2809 = as_type<float>(_93);
        out.gl_Position.z = _2809;
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
    float _113 = 0.0;
    float _115 = _111;
    if (_107)
    {
        float _117 = float(_77);
        _113 = _117;
    }
    float _119 = _113;
    bool _121 = _111 >= _119;
    bool _123 = !_107;
    bool _125 = _121 || _123;
    if (_125)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _87;
    if (_125)
    {
        out.m_33.x = 0.0;
    }
    if (_125)
    {
        float _129 = _127 * 5.0;
        _95 = as_type<int>(_129);
    }
    int _131 = _95;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2878 = as_type<float>(_131);
        out.gl_Position.z = _2878;
    }
    if (_125)
    {
        return out;
    }
    float _133 = in.m_37.x;
    float _135 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _137 = _111 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _139 = as_type<float>(int(gl_VertexIndex));
    float _141 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    float _153 = _137 * _135;
    float _155 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[20].x, _153);
    float _157 = in.m_35.x;
    float _159 = in.m_35.y;
    float _161 = in.m_35.z;
    float _163 = _155 * 6.283185482025146484375;
    float _165 = floor(_155);
    int _167 = as_type<int>(_139) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_139) & 2;
    bool _173 = _171 != 0;
    float _175 = _139;
    float _177 = 0.5;
    if (!_151)
    {
        float _179 = _141 * _141;
        float _181 = _179 * 0.5;
        _175 = _181;
    }
    float _183 = _175;
    float _185 = _163 * 0.15915493667125701904296875;
    int _187 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _189 = _187 != 0;
    bool _191 = !_169;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = _183;
    if (!_151)
    {
        float _197 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _197;
    }
    float _199 = _195;
    float _201 = _185 * 6.283185482025146484375;
    float _203 = cos(_201);
    bool _205 = !_173;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = -_165;
    float _211 = _155 + _209;
    float _213 = _165;
    float _215 = _199;
    if (!_151)
    {
        _213 = _141;
    }
    float _217 = _213;
    bool _219 = !_151;
    float _221 = _217;
    if (!_219)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = _141 * _225;
        float _235 = 1.0 / _229;
        float _237 = _231 * 0.693147182464599609375;
        float _239 = exp2(_233);
        float _241 = 1.0 / _237;
        float _243 = _239 + (-1.0);
        float _245 = -_243;
        float _247 = fma(_245, _241, _141);
        float _249 = _247 * _235;
        float _251 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _251;
    }
    float _253 = _215;
    bool _255 = !_151;
    if (!_255)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _141 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _221 = _275;
    }
    float _277 = _221;
    float _279 = in.m_42.w;
    float _281 = fma(_203, 0.5, 0.5);
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _285 = _283 != 0;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _289 = _287 != 0;
    float _291 = in.m_30.x;
    float _293 = in.m_30.y;
    float _295 = in.m_30.z;
    bool _297 = _211 < 0.5;
    float _299 = float(_297);
    float _301 = -_211;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _307 = !_189;
    int _309 = _307 ? 0 : 1;
    bool _311 = !_285;
    int _313 = _311 ? 0 : 1;
    float _315 = fma(_277, _157, _305);
    int _317 = abs(_309);
    float _319 = -_299;
    float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _323 = !_289;
    int _325 = _323 ? 0 : 1;
    float _327 = -_281;
    float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _331 = abs(_313);
    float _333 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _335 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _337 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _339 = abs(_325);
    float _341 = fma(_277, _159, _333);
    float _343 = float(_331);
    float _345 = fma(_277, _161, _337);
    float _347 = float(_317);
    float _349 = float(_339);
    float _351 = abs(_303);
    float _353 = _343 * _351;
    float _355 = fma(_315, _279, _291);
    float _357 = fma(_341, _279, _293);
    float _359 = fma(_345, _279, _295);
    float _361 = fma(_347, _329, _353);
    float _363 = abs(_321);
    float _365 = fma(_349, _363, _361);
    bool _367 = !_335;
    float _383;
    if (!_367)
    {
        float _369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _371 = _133 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _373 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _375 = _373 * _369;
        float _377 = floor(_375);
        float _379 = -_377;
        float _381 = _375 + _379;
        _383 = _381;
        _385 = true;
    }
    else
    {
        float _387 = float(_77);
        float _389 = 1.0 / _387;
        float _391 = _111 * _389;
        _383 = _391;
    }
    _385 = false;
    float _393 = _383;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _397 = _393 + _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _401 = _393 + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _411;
    float _415 = in.m_42.x;
    float _417 = in.m_42.y;
    float _419 = 1.0 / _409;
    bool _421 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _423 = 1.0 / _405;
    bool _425 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _427 = isnan(_393);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = 1.0 / _413;
    float _439 = _397 * _423;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _443 = _393 + _441;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _445;
    float _449 = _443 * _419;
    bool _451 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _453 = isnan(_393);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _463;
    float _467 = _401 * _437;
    float _469 = fma(_447, _439, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _471 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _473 = isnan(_393);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -_461;
    float _485 = _483 + 1.0;
    float _487 = fma(_465, _439, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _489 = -_435;
    float _491 = _489 + 1.0;
    float _493 = _435 * _485;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _499 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _501 = isnan(_393);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = _481 * _491;
    float _513 = -_481;
    float _515 = _513 + 1.0;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _521 = fma(_497, _449, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _523 = _509 * _515;
    float _525 = -_509;
    float _527 = _525 + 1.0;
    float _529 = fma(_519, _449, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _531 = _469 * _523;
    float _533 = _487 * _523;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _539;
    float _543 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[143].x, _531);
    float _545 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[143].y, _533);
    float _547 = fma(_537, _467, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _549 = fma(_541, _467, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _551 = fma(_529, _511, _543);
    float _553 = fma(_521, _511, _545);
    float _555 = fma(_547, _493, _551);
    float _557 = fma(_549, _493, _553);
    float _559 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[146].x, _555);
    float _561 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[146].y, _557);
    float _563 = _559 * _415;
    float _565 = _561 * _417;
    bool _567 = !_421;
    float _583;
    if (!_567)
    {
        float _569 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _571 = _133 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _573 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[11].x, _111);
        float _575 = _573 * _569;
        float _577 = floor(_575);
        float _579 = -_577;
        float _581 = _575 + _579;
        _583 = _581;
        _585 = true;
    }
    else
    {
        float _587 = float(_77);
        float _589 = 1.0 / _587;
        float _591 = _111 * _589;
        _583 = _591;
    }
    _585 = false;
    float _593 = _583;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _597 = _593 + _595;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _599;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _607;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _615;
    float _619 = 1.0 / _605;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _625 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _627 = isnan(_593);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = 1.0 / _613;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _641 = _593 + _639;
    bool _643 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _645 = isnan(_593);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    bool _655 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _657 = isnan(_593);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = 1.0 / _623;
    float _669 = _641 * _619;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _673 = _593 + _671;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _677 = _593 + _675;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _681 = _593 + _679;
    float _683 = 1.0 / _601;
    float _685 = _673 * _637;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _691;
    bool _695 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _697 = 1.0 / _617;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _701 = _593 + _699;
    float _703 = _677 * _667;
    bool _705 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _707 = isnan(_593);
    bool _709 = _705 || _707;
    bool _711 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _713 = _709 || _711;
    float _715 = float(_713);
    float _717 = 1.0 / _609;
    float _719 = _701 * _683;
    float _721 = -_635;
    float _723 = _721 + 1.0;
    float _725 = fma(_689, _719, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _727 = _715 * _723;
    float _729 = _681 * _697;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _731;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _735;
    float _739 = fma(_737, _719, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _741 = -_653;
    float _743 = _741 + 1.0;
    float _745 = _597 * _717;
    float _747 = -_715;
    float _749 = _747 + 1.0;
    float _751 = fma(_733, _719, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _753 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _755 = isnan(_593);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = _653 * _749;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _773 = _771 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _775 = -_763;
    float _777 = _775 + 1.0;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _781 = _779 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _783 = _763 * _743;
    bool _785 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _787 = isnan(_593);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _793 = _789 || _791;
    float _795 = float(_793);
    float _797 = fma(_769, _669, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    bool _799 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _801 = isnan(_593);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _807 = _803 || _805;
    float _809 = float(_807);
    float _811 = _665 * _777;
    float _813 = -_665;
    float _815 = _813 + 1.0;
    float _817 = fma(_773, _669, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _819 = fma(_781, _669, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _821 = -_809;
    float _823 = _821 + 1.0;
    float _825 = _809 * _815;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _827;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _831;
    float _835 = _795 * _823;
    float _837 = -_795;
    float _839 = _837 + 1.0;
    float _841 = fma(_829, _745, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _843 = fma(_833, _745, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _845 = fma(_693, _745, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _847 = _739 * _835;
    float _849 = _725 * _835;
    float _851 = _751 * _835;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _865 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[107].y, _847);
    float _867 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[107].z, _849);
    float _869 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[107].x, _851);
    float _871 = fma(_855, _685, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _873 = fma(_859, _685, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _875 = fma(_863, _685, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _877 = fma(_817, _825, _865);
    float _879 = fma(_819, _825, _867);
    float _881 = fma(_797, _825, _869);
    float _883 = fma(_845, _811, _879);
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _885;
    float _889 = fma(_841, _811, _881);
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _891;
    float _895 = fma(_843, _811, _877);
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _897;
    float _901 = fma(_887, _729, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _903 = fma(_893, _729, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _905 = fma(_875, _783, _883);
    float _907 = fma(_899, _729, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _909 = fma(_871, _783, _889);
    float _911 = fma(_873, _783, _895);
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _925 = fma(_901, _765, _909);
    float _927 = fma(_915, _703, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _929 = fma(_919, _703, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _931 = fma(_903, _765, _911);
    float _933 = fma(_923, _703, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _935 = fma(_907, _765, _905);
    float _937 = fma(_927, _727, _925);
    float _939 = fma(_929, _727, _931);
    float _941 = fma(_933, _727, _935);
    float _943 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[113].x, _937);
    float _945 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[113].y, _939);
    float _947 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[113].z, _941);
    bool _949 = !_695;
    float _967;
    float _969;
    if (!_949)
    {
        float _951 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _953 = _133 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _955 = float(_77);
        float _957 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _959 = _957 * _951;
        float _961 = floor(_959);
        float _963 = -_961;
        float _965 = _959 + _963;
        _967 = _955;
        _969 = _965;
        _971 = true;
    }
    else
    {
        float _973 = float(_77);
        float _975 = 1.0 / _973;
        float _977 = _111 * _975;
        _967 = _973;
        _969 = _977;
    }
    _971 = false;
    float _979 = _967;
    float _981 = _969;
    float _983 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _985 = int(_983);
    float _987 = in.m_44.x;
    float _989 = in.m_44.y;
    float _991 = in.m_44.z;
    float _993 = in.m_44.w;
    float _995 = _133 * 2.0;
    float _997 = in.m_37.y;
    float _999 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1001 = int(_999);
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1011 = float(_985);
    float _1013 = 1.0 / _979;
    float _1015 = float(uint(_1001));
    float _1017 = 1.0 / _1011;
    int _1019 = ~_1001;
    int _1021 = _1019 + 1;
    float _1023 = _357 * _989;
    int _1025 = ~_1001;
    int _1027 = _1025 + 1;
    bool _1029 = _1001 == 0;
    float _1031 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1009);
    int _1033 = ~_1001;
    int _1035 = _1033 + 1;
    float _1037 = 1.0 / _1015;
    int _1039 = ~_1001;
    int _1041 = _1039 + 1;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1045 = _1017 * _111;
    float _1047 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1049 = log2(_1047);
    int _1051 = as_type<int>(_1037) + (-2);
    float _1053 = trunc(_1045);
    int _1055 = int(_1053);
    float _1057 = _1049 * _111;
    float _1059 = floor(_995);
    float _1061 = float(uint(_1055));
    float _1063 = exp2(_1057);
    float _1065 = as_type<float>(_1051) * _1061;
    float _1067 = 1.0 / _1007;
    float _1069 = trunc(_1065);
    float _1071 = precise::max(_1069, 0.0);
    uint _1074 = uint(_1071);
    int _1076 = _1021 * int(_1074);
    int _1078 = _1076 + _1055;
    float _1080 = float(uint(_1078));
    float _1082 = as_type<float>(_1051) * _1080;
    float _1084 = trunc(_1082);
    float _1086 = precise::max(_1084, 0.0);
    uint _1088 = uint(_1086);
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1092 = _1090 != 0;
    bool _1094 = !_1092;
    float _1096 = _1094 ? 7.345489978790283203125 : 1.0;
    float _1098 = float(_1055);
    float _1100 = _1096 * _133;
    int _1102 = int(_1074) + int(_1088);
    float _1104 = float(_1001);
    float _1106 = floor(_1100);
    int _1108 = _1027 * _1102;
    int _1110 = _1108 + _1055;
    bool _1112 = _1098 >= _1104;
    bool _1114 = isnan(_1098);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(_1104);
    bool _1120 = _1116 || _1118;
    float _1122 = float(_1120);
    bool _1124 = uint(_1110) >= uint(_1001);
    float _1126 = trunc(_1122);
    int _1128 = int(_1126);
    bool _1130 = !_1124;
    int _1132 = _1130 ? 0 : (-1);
    int _1134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1136 = _1134 != 0;
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1140 = _1138 != 0;
    int _1142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1144 = _1142 != 0;
    int _1146 = ~_1102;
    int _1148 = _1146 + _1132;
    int _1150 = _1148 + 1;
    float _1152 = -_1106;
    float _1154 = _1100 + _1152;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1158 = _1156 != 0;
    bool _1160 = _1059 > 0.0;
    int _1162 = _1001 * _1150;
    int _1164 = _1162 + _1055;
    bool _1166 = _1059 >= 0.0;
    bool _1168 = isnan(_1059);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan(0.0);
    bool _1174 = _1170 || _1172;
    bool _1176 = !_1029;
    int _1178 = _1176 ? _1164 : (-1);
    float _1180 = _1154 * _1104;
    float _1182 = _1104 * _111;
    int _1184 = ~_1128;
    int _1186 = _1184 + 1;
    int _1188 = _1186 + 1;
    bool _1190 = !_1140;
    int _1192 = _1190 ? 0 : 1;
    float _1194 = _1182 * _1013;
    float _1196 = trunc(_1180);
    int _1198 = int(_1196);
    int _1200 = _1178 * _1188;
    int _1202 = _1001 + (-1);
    int _1204 = abs(_1192);
    bool _1206 = !_1144;
    int _1208 = _1206 ? 0 : 1;
    int _1210 = _1128 * _1202;
    int _1212 = _1210 + _1200;
    float _1214 = trunc(_1194);
    int _1216 = int(_1214);
    bool _1218 = !_1136;
    int _1220 = _1218 ? 0 : 1;
    bool _1222 = !_1158;
    int _1224 = _1222 ? 0 : 1;
    int _1226 = _1212 * _1204;
    int _1228 = abs(_1220);
    int _1230 = abs(_1208);
    int _1232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1234 = _1232 != 0;
    int _1236 = abs(_1224);
    bool _1238 = !_1234;
    int _1240 = _1238 ? 0 : 1;
    int _1242 = _1198 * _1236;
    int _1244 = _1242 + _1055;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1248 = _1246 != 0;
    int _1250 = _1216 * _1228;
    int _1252 = _1250 + _1226;
    int _1254 = abs(_1240);
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1258 = _1256 != 0;
    int _1260 = _1244 * _1230;
    int _1262 = _1260 + _1252;
    int _1264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1266 = _1264 != 0;
    bool _1268 = _133 > 0.5;
    int _1270 = _1198 * _1254;
    int _1272 = _1270 + _1262;
    float _1274 = float(uint(_1244));
    float _1276 = in.m_46.x;
    float _1278 = in.m_46.y;
    float _1280 = in.m_46.z;
    float _1282 = in.m_46.w;
    float _1284 = float(uint(_1272));
    float _1286 = as_type<float>(_1051) * _1274;
    float _1288 = as_type<float>(_1051) * _1284;
    float _1290 = in.m_48.x;
    float _1292 = in.m_48.y;
    float _1294 = in.m_48.z;
    float _1296 = in.m_48.w;
    float _1298 = trunc(_1288);
    float _1300 = precise::max(_1298, 0.0);
    uint _1302 = uint(_1300);
    float _1304 = _357 * _1278;
    float _1306 = fma(_355, _1276, _1304);
    float _1308 = _997 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1310 = _1035 * int(_1302);
    int _1312 = _1310 + _1272;
    float _1314 = fma(_359, _1280, _1306);
    float _1316 = fma(_1308, -2.0, _1003);
    float _1318 = -_193;
    int _1320 = _1268 ? as_type<int>(_1318) : as_type<int>(_193);
    float _1322 = float(uint(_1312));
    float _1324 = _357 * _1292;
    float _1326 = fma(_355, _987, _1023);
    bool _1328 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1330 = isnan(0.0);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1336 = _1332 || _1334;
    float _1338 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1316);
    float _1340 = as_type<float>(_1051) * _1322;
    float _1342 = fma(_355, _1290, _1324);
    float _1344 = _133 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1346 = trunc(_1340);
    float _1348 = precise::max(_1346, 0.0);
    uint _1350 = uint(_1348);
    float _1352 = fma(_359, _991, _1326);
    float _1354 = -_1043;
    float _1356 = fma(_1344, 2.0, _1354);
    float _1358 = fma(_359, _1294, _1342);
    float _1360 = in.m_37.z;
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1364 = _1362 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1368 = _1366 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    int _1370 = _1174 ? 0 : 1;
    float _1372 = 1.0 / _1364;
    float _1374 = _1352 + _993;
    float _1376 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1376;
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1382 = _1380 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1384 = int(_1302) + int(_1350);
    float _1386 = _1358 + _1296;
    bool _1388 = !_1258;
    float _1390 = _1388 ? _193 : as_type<float>(_1320);
    float _1392 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1394 = _1392 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1396 = _997 > 0.5;
    int _1398 = _1041 * _1384;
    int _1400 = _1398 + _1272;
    float _1402 = -_1063;
    float _1404 = _1402 + 1.0;
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1408 = _1406 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1410 = -_207;
    int _1412 = _1396 ? as_type<int>(_1410) : as_type<int>(_207);
    float _1414 = 1.0 / _1394;
    bool _1416 = uint(_1400) >= uint(_1001);
    float _1418 = _1378 * _1067;
    bool _1420 = !_1266;
    float _1422 = _1420 ? _207 : as_type<float>(_1412);
    float _1424 = _1382 * _1372;
    float _1426 = _1336 ? _1404 : 0.0;
    float _1428 = _1360 * 2.0;
    bool _1430 = !_1416;
    int _1432 = _1430 ? 0 : (-1);
    float _1434 = 1.0 / _1408;
    int _1436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1438 = _1436 != 0;
    int _1440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1442 = _1440 != 0;
    int _1444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1446 = _1444 != 0;
    float _1448 = _1422 + (-0.5);
    float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1452 = _1450 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _1454 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1456 = isnan(1.0);
    bool _1458 = _1454 || _1456;
    bool _1460 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1462 = _1458 || _1460;
    float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _1464;
    float _1468 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1470 = 1.0 + _1468;
    float _1472 = 1.0 / _1452;
    float _1474 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1474;
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1480 = _1478 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _1484 = _1482 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    int _1486 = ~_1384;
    int _1488 = _1486 + _1432;
    int _1490 = _1488 + 1;
    float _1492 = _1480 * _1434;
    float _1494 = _133 + _997;
    float _1496 = 1.0 / _1368;
    float _1498 = _1476 * _1414;
    float _1500 = _1494 + (-1.0);
    int _1502 = _1001 * _1490;
    int _1504 = _1502 + _1272;
    bool _1506 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1508 = isnan(_981);
    bool _1510 = _1506 || _1508;
    bool _1512 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1514 = _1510 || _1512;
    float _1516 = float(_1514);
    float _1518 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1520 = _1466 * _1472;
    float _1522 = _997 * 2.0;
    float _1524 = 1.0 / _1470;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1528 = _997 + _1360;
    float _1530 = _997 + (-0.5);
    float _1532 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1526);
    float _1534 = _1484 * _1496;
    float _1536 = _1528 + (-1.0);
    float _1538 = floor(_1522);
    float _1540 = -_111;
    float _1542 = fma(_1540, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1356);
    float _1544 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1532);
    float _1546 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1031);
    int _1548 = ~_1370;
    int _1550 = _1548 + 1;
    int _1552 = _1550 + 1;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1556 = _981 + _1554;
    int _1558 = _1552;
    if (!_1160)
    {
        int _1560 = ~_1370;
        int _1562 = _1560 + 1;
        _1558 = _1562;
    }
    int _1564 = _1558;
    float _1566 = -_1544;
    float _1568 = _1566 + 1.0;
    float _1570 = floor(_1428);
    if (_1462)
    {
        float _1572 = _1426 * _1524;
        _115 = _1572;
    }
    float _1574 = _115;
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1578 = _981 + _1576;
    bool _1580 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _1582 = isnan(_981);
    bool _1584 = _1580 || _1582;
    bool _1586 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _1588 = _1584 || _1586;
    float _1590 = float(_1588);
    float _1592 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1594 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1596 = _981 + _1594;
    float _1598 = fma(_1418, _1578, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1600 = fma(_1498, _1556, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1602 = _1538 >= 0.0;
    bool _1604 = isnan(_1538);
    bool _1606 = _1602 || _1604;
    bool _1608 = isnan(0.0);
    bool _1610 = _1606 || _1608;
    float _1612 = -_1590;
    float _1614 = _1612 + 1.0;
    bool _1616 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _1618 = isnan(_981);
    bool _1620 = _1616 || _1618;
    bool _1622 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _1624 = _1620 || _1622;
    float _1626 = float(_1624);
    float _1628 = fma(_1492, _1596, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    int _1630 = _1610 ? 0 : 1;
    float _1632 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1634 = _981 + _1632;
    bool _1636 = _1538 > 0.0;
    float _1638 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1640 = _981 + _1638;
    bool _1642 = _1570 >= 0.0;
    bool _1644 = isnan(_1570);
    bool _1646 = _1642 || _1644;
    bool _1648 = isnan(0.0);
    bool _1650 = _1646 || _1648;
    float _1652 = _1626 * _1614;
    float _1654 = _1390 + 0.5;
    float _1656 = fma(_1424, _1640, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1658 = _1650 ? 0 : 1;
    float _1660 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1662 = _981 + _1660;
    bool _1664 = _1570 > 0.0;
    float _1666 = fma(_1534, _1634, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    bool _1668 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1670 = isnan(_981);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1676 = _1672 || _1674;
    float _1678 = float(_1676);
    float _1680 = fma(_1520, _1662, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _1682 = -_1626;
    float _1684 = _1682 + 1.0;
    bool _1686 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1688 = isnan(_981);
    bool _1690 = _1686 || _1688;
    bool _1692 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1694 = _1690 || _1692;
    float _1696 = float(_1694);
    float _1698 = -_1546;
    float _1700 = _1698 + 1.0;
    float _1702 = -_1678;
    float _1704 = _1702 + 1.0;
    float _1706 = _1678 * _1684;
    float _1708 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1542);
    bool _1710 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1712 = isnan(_981);
    bool _1714 = _1710 || _1712;
    bool _1716 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1718 = _1714 || _1716;
    float _1720 = float(_1718);
    float _1722 = _1696 * _1704;
    float _1724 = -_1696;
    float _1726 = _1724 + 1.0;
    bool _1728 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1730 = isnan(_981);
    bool _1732 = _1728 || _1730;
    bool _1734 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1736 = _1732 || _1734;
    float _1738 = float(_1736);
    float _1740 = _1314 + _1282;
    float _1742 = -_1720;
    float _1744 = _1742 + 1.0;
    float _1746 = _1720 * _1726;
    int _1748 = ~_1001;
    int _1750 = _1748 + 1;
    float _1752 = trunc(_1286);
    float _1754 = precise::max(_1752, 0.0);
    uint _1756 = uint(_1754);
    float _1758 = -_1738;
    float _1760 = _1758 + 1.0;
    float _1762 = -_1448;
    float _1764 = -_1338;
    float _1766 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1764);
    float _1768 = _1738 * _1744;
    float _1770 = _1516 * _1760;
    float _1772 = fma(_1422, _1700, _1766);
    int _1774 = ~_1658;
    int _1776 = _1774 + 1;
    int _1778 = _1776 + 1;
    float _1780 = _1598 * _1770;
    bool _1782 = !_1029;
    int _1784 = _1782 ? _1504 : (-1);
    float _1786 = -_1516;
    float _1788 = _1786 + 1.0;
    int _1790 = _1778;
    if (!_1664)
    {
        int _1792 = ~_1658;
        int _1794 = _1792 + 1;
        _1790 = _1794;
    }
    int _1796 = _1790;
    int _1798 = _1784 >> 31;
    float _1800 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1780);
    int _1802 = _1750 * int(_1756);
    int _1804 = _1802 + _1244;
    int _1806 = ~_1630;
    int _1808 = _1806 + 1;
    int _1810 = _1808 + 1;
    int _1812 = _1798 & 3;
    float _1814 = fma(_1656, _1768, _1800);
    float _1816 = float(uint(_1804));
    int _1818 = _1784 + _1812;
    bool _1820 = !_1442;
    int _1822 = _1820 ? 0 : 1;
    int _1824 = _1818 >> 2;
    int _1826 = abs(_1822);
    int _1828 = _1824 << 4;
    int _1830 = _1828 + 368;
    int _1832 = _1810;
    if (!_1636)
    {
        int _1834 = ~_1630;
        int _1836 = _1834 + 1;
        _1832 = _1836;
    }
    int _1838 = _1832;
    float _1840 = as_type<float>(_1051) * _1816;
    float _1842 = -_1568;
    float _1844 = fma(_1390, _1842, _1708);
    float _1846 = fma(_1600, _1746, _1814);
    uint _1848 = uint(int(uint(_1830) >> uint(2)));
    uint _1850 = uint(int(uint(int(_1848)) >> uint(2)));
    int _1852 = int(_1848) & 3;
    float _1854 = (*spvDescriptorSet0.vp_c9)._m0[int(_1850)][_1852];
    int _1856 = int(_1848) + 1;
    uint _1858 = uint(int(uint(_1856) >> uint(2)));
    int _1860 = _1856 & 3;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[int(_1858)][_1860];
    bool _1864 = !_1438;
    int _1866 = _1864 ? 0 : 1;
    float _1868 = trunc(_1840);
    float _1870 = precise::max(_1868, 0.0);
    uint _1872 = uint(_1870);
    float _1874 = float(_1826);
    out.m_50.x = _1844;
    out.m_50.y = _1772;
    int _1876 = abs(_1866);
    float _1878 = fma(_1628, _1722, _1846);
    float _1880 = float(_1564);
    int _1882 = _1830 + 8;
    uint _1884 = uint(int(uint(_1882) >> uint(2)));
    uint _1886 = uint(int(uint(int(_1884)) >> uint(2)));
    int _1888 = int(_1884) & 3;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[int(_1886)][_1888];
    int _1892 = int(_1884) + 1;
    uint _1894 = uint(int(uint(_1892) >> uint(2)));
    int _1896 = _1892 & 3;
    float _1898 = (*spvDescriptorSet0.vp_c9)._m0[int(_1894)][_1896];
    int _1900 = _1784 & 3;
    bool _1902 = _1900 != 0;
    float _1904 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1906 = _1374 + _1904;
    int _1908 = _1784 & 3;
    bool _1910 = _1908 != 0;
    float _1912 = _1874 * _1880;
    bool _1914 = uint(_1900) > 1u;
    float _1916 = in.m_52.x;
    float _1918 = in.m_52.y;
    float _1920 = in.m_52.z;
    int _1922 = _1910 ? 0 : 1;
    float _1924 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1926 = _1740 + _1924;
    bool _1928 = uint(_1900) >= 2u;
    float _1930 = fma(_1680, _1706, _1878);
    int _1932 = ~_1922;
    int _1934 = _1932 + 1;
    int _1936 = _1934 + 1;
    float _1938 = _1926 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1940 = int(_1756) + int(_1872);
    float _1942 = fma(_1666, _1652, _1930);
    int _1944 = ~_1001;
    int _1946 = _1944 + 1;
    float _1948 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1938);
    int _1950 = _1928 ? 0 : 1;
    int _1952 = _1936;
    if (!_1914)
    {
        int _1954 = ~_1922;
        int _1956 = _1954 + 1;
        _1952 = _1956;
    }
    int _1958 = _1952;
    float _1960 = _1912 * (-2.0);
    bool _1962 = _1900 != 3;
    int _1964 = _1946 * _1940;
    int _1966 = _1964 + _1244;
    int _1968 = abs(_1958);
    float _1970 = fma(_1592, _1960, _1592);
    float _1972 = float(_1796);
    int _1974 = ~_1950;
    int _1976 = _1974 + 1;
    int _1978 = _1976 + 1;
    int _1980 = ~_1968;
    int _1982 = _1980 + 1;
    int _1984 = _1982 + 1;
    float _1986 = fma(_1960, _1918, _1918);
    bool _1988 = !_1902;
    int _1990 = _1988 ? 0 : 1;
    bool _1992 = _1900 != 3;
    float _1994 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1986);
    int _1996 = _1978;
    if (_1962)
    {
        int _1998 = ~_1950;
        int _2000 = _1998 + 1;
        _1996 = _2000;
    }
    int _2002 = _1996;
    int _2004 = abs(_1990);
    float _2006 = fma(_1970, _1574, _1994);
    bool _2008 = uint(_1966) >= uint(_1001);
    int _2010 = _1984 * as_type<int>(_1862);
    bool _2012 = !_1992;
    int _2014 = _2012 ? 0 : (-1);
    float _2016 = float(_1876);
    int _2018 = abs(_2002);
    bool _2020 = !_1248;
    int _2022 = _2020 ? 0 : 1;
    float _2024 = _2016 * _1972;
    int _2026 = abs(_2014);
    float _2028 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2030 = _1386 + _2028;
    int _2032 = ~_2004;
    int _2034 = _2032 + 1;
    int _2036 = _2034 + 1;
    float _2038 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1948);
    int _2040 = abs(_2022);
    int _2042 = _2036 * as_type<int>(_1854);
    int _2044 = _2042 + _2010;
    int _2046 = ~_2018;
    int _2048 = _2046 + 1;
    int _2050 = _2048 + 1;
    float _2052 = _1926 * _1926;
    bool _2054 = !_2008;
    int _2056 = _2054 ? 0 : (-1);
    int _2058 = ~_2026;
    int _2060 = _2058 + 1;
    int _2062 = _2060 + 1;
    int _2064 = _2050 * as_type<int>(_1890);
    int _2066 = _2064 + _2044;
    int _2068 = ~_1940;
    int _2070 = _2068 + _2056;
    int _2072 = _2070 + 1;
    float _2074 = fma(_1906, _1906, _2052);
    bool _2076 = _2038 >= 0.0;
    int _2078 = _2062 * as_type<int>(_1898);
    int _2080 = _2078 + _2066;
    int _2082 = _1001 * _2072;
    int _2084 = _2082 + _1244;
    float _2086 = _945 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2088 = fma(_2030, _2030, _2074);
    int _2090 = ~_2040;
    int _2092 = _2090 + 1;
    int _2094 = _2092 + 1;
    float _2096 = _943 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2098 = !_1029;
    int _2100 = _2098 ? _2084 : (-1);
    float _2102 = _2086 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2104 = !_1446;
    int _2106 = _2104 ? 0 : 1;
    int _2108 = _2080 * _2094;
    float _2110 = rsqrt(_2088);
    float _2112 = fma(_1590, (*spvDescriptorSet0.vp_c9)._m0[121].x, _1942);
    float _2114 = _2074;
    if (_2076)
    {
        _2114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2116 = _2114;
    int _2118 = _2100 * _2040;
    int _2120 = _2118 + _2108;
    float _2122 = _947 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2124 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2126 = as_type<int>(_2116);
    if (_2076)
    {
        float _2128 = _2116 * 5.0;
        _2126 = as_type<int>(_2128);
    }
    int _2130 = _2126;
    float _2132 = _2122 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2134 = _2112 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2136 = float(_2120);
    if (_2076)
    {
        out.m_33.x = 0.0;
    }
    int _2138 = abs(_2106);
    float _2140 = _133 + (-0.5);
    float _2142 = float(_1838);
    if (_2076)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5874 = as_type<float>(_2130);
        out.gl_Position.z = _5874;
    }
    float _2144 = float(_2138);
    float _2146 = _1926 * _2110;
    float _2148 = _1906 * _2110;
    out.m_54.x = _2124;
    out.m_54.y = _2102;
    out.m_54.z = _2132;
    out.m_54.w = _2134;
    out.m_56.x = _2136;
    if (_2076)
    {
        return out;
    }
    float _2150 = -_2146;
    float _2152 = fma(_2150, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1740);
    float _2154 = _2030 * _2110;
    float _2156 = -_2148;
    float _2158 = fma(_2156, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1374);
    float _2160 = _2024 * (-2.0);
    float _2162 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2164 = _2152 + _2162;
    float _2166 = -_2154;
    float _2168 = fma(_2166, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1386);
    float _2170 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2172 = _2158 + _2170;
    float _2174 = _2006 * 0.15915493667125701904296875;
    float _2176 = _2164 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2178 = fma(_2160, _1916, _1916);
    float _2180 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2182 = _2168 + _2180;
    float _2184 = fma(_1518, _2160, _1518);
    float _2186 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2176);
    float _2188 = fma(_2140, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2178);
    float _2190 = _2144 * _2142;
    float _2192 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2186);
    float _2194 = fma(_2184, _1574, _2188);
    float _2196 = _133 + _1360;
    float _2198 = -_2146;
    float _2200 = fma(_2198, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1926);
    float _2202 = _1360 + (-0.5);
    bool _2204 = _2192 >= 0.0;
    float _2206 = _2194 * 0.15915493667125701904296875;
    float _2208 = _2196 + (-1.0);
    float _2210 = _2190 * (-2.0);
    float _2212 = -_2148;
    float _2214 = fma(_2212, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1906);
    float _2216 = _2200 * _2200;
    float _2218 = fma(_2208, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2220 = fma(_2210, _1920, _1920);
    float _2222 = -_2154;
    float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2030);
    float _2226 = fma(_2214, _2214, _2216);
    float _2228 = fma(_2218, _2210, _2218);
    float _2230 = fma(_2202, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2220);
    float _2232 = _2174 * 6.283185482025146484375;
    float _2234 = sin(_2232);
    float _2236 = _2202;
    int _2238 = as_type<int>(_2230);
    if (_2204)
    {
        _2236 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2240 = _2236;
    float _2242 = fma(_2224, _2224, _2226);
    float _2244 = fma(_2228, _1574, _2230);
    if (_2204)
    {
        out.m_33.x = 0.0;
    }
    if (_2204)
    {
        float _2246 = _2240 * 5.0;
        _2238 = as_type<int>(_2246);
    }
    int _2248 = _2238;
    float _2250 = _2244 * 0.15915493667125701904296875;
    float _2252 = _2174 * 6.283185482025146484375;
    float _2254 = cos(_2252);
    float _2256 = _365 * _565;
    if (_2204)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6086 = as_type<float>(_2248);
        out.gl_Position.z = _6086;
    }
    float _2258 = _2206 * 6.283185482025146484375;
    float _2260 = sin(_2258);
    float _2262 = _2206 * 6.283185482025146484375;
    float _2264 = cos(_2262);
    float _2266 = sqrt(_2242);
    float _2268 = _2250 * 6.283185482025146484375;
    float _2270 = sin(_2268);
    if (_2204)
    {
        return out;
    }
    float _2272 = _2250 * 6.283185482025146484375;
    float _2274 = cos(_2272);
    float _2276 = _2110 * _2266;
    float _2278 = _2256 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2280 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _2282 = _2260 * _2234;
    float _2284 = _2264 * _2254;
    float _2286 = _2276 * _2278;
    float _2288 = _365 * _563;
    float _2290 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _2292 = fma(_2270, _2284, _2282);
    float _2294 = _2280 * _2286;
    float _2296 = _2288 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2298 = fma(_2270, _2282, _2284);
    float _2300 = _2264 * _2234;
    float _2302 = _2260 * _2254;
    float _2304 = _2276 * _2296;
    float _2306 = _2274 * _2294;
    float _2308 = -_2294;
    float _2310 = _2270 * _2308;
    float _2312 = -_2300;
    float _2314 = fma(_2270, _2302, _2312);
    float _2316 = -_2302;
    float _2318 = fma(_2270, _2300, _2316);
    float _2320 = _2290 * _2304;
    float _2322 = _2264 * _2306;
    float _2324 = _2254 * _2274;
    float _2326 = _2260 * _2306;
    float _2328 = _2234 * _2274;
    float _2330 = fma(_2292, _2320, _2322);
    float _2332 = _2276 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2334 = _2332 * 0.5;
    float _2336 = fma(_2324, _2320, _2310);
    float _2338 = fma(_2314, _2320, _2326);
    float _2340 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2342 = fma(_2318, _2334, _2330);
    float _2344 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2346 = fma(_2328, _2334, _2336);
    float _2348 = fma(_2298, _2334, _2338);
    float _2350 = _2342 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2352 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2344);
    float _2354 = _2342 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2356 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2340);
    float _2358 = fma(_2346, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2350);
    float _2360 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2352);
    float _2362 = fma(_2346, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2354);
    float _2364 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2356);
    float _2366 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2358);
    float _2368 = _2360 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2370 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2362);
    bool _2372 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2374 = isnan(0.5);
    bool _2376 = _2372 || _2374;
    bool _2378 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2380 = _2376 || _2378;
    float _2382 = _2366 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2384 = 1.0 / _2368;
    float _2386 = _2370 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2388 = _2364 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2390 = _1386 + _2382;
    float _2392 = _1374 + _2386;
    float _2394 = _2388 + _2368;
    float _2396 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2398 = _2390 + _2396;
    bool _2400 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2402 = isnan(0.5);
    bool _2404 = _2400 || _2402;
    bool _2406 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2408 = _2404 || _2406;
    float _2410 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2412 = _2392 + _2410;
    float _2414 = _2342 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2416 = _2398 * _2398;
    float _2418 = _2298;
    float _2420 = _2310;
    float _2422 = _2416;
    float _2424 = _2414;
    float _2426 = _2342;
    if (!_2380)
    {
        _2418 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2428 = _2418;
    float _2430 = fma(_2346, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2414);
    float _2432 = fma(_2412, _2412, _2416);
    float _2434 = _2394 * _2384;
    float _2436 = _2434 * 0.5;
    if (!_2380)
    {
        float _2438 = -_2428;
        float _2440 = _2438 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2420 = _2440;
    }
    float _2442 = _2420;
    float _2444 = _2442;
    if (!_2380)
    {
        _2422 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2446 = _2422;
    float _2448 = sqrt(_2432);
    float _2450 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2452 = fma(_2436, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2450);
    float _2454 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2430);
    float _2456 = _2446;
    if (_2380)
    {
        _2424 = 1.0;
    }
    float _2458 = _2424;
    float _2460 = _2454 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2462 = 1.0 / _2452;
    float _2464 = _1740 + _2460;
    float _2466 = _2264;
    float _2468 = _2460;
    float _2470 = _2458;
    if (!_2380)
    {
        float _2472 = 1.0 / _2442;
        _2466 = _2472;
    }
    float _2474 = _2466;
    bool _2476 = _2448 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_2380)
    {
        float _2478 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2480 = -_2428;
        float _2482 = fma(_2462, _2478, _2480);
        _2426 = _2482;
    }
    float _2484 = _2426;
    float _2486 = _2484;
    if (!_2380)
    {
        float _2488 = -_2446;
        float _2490 = _2488 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2444 = _2490;
    }
    float _2492 = _2444;
    if (!_2380)
    {
        float _2494 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2496 = -_2446;
        float _2498 = fma(_2462, _2494, _2496);
        _177 = _2498;
    }
    float _2500 = _177;
    if (_2380)
    {
        _2456 = 1.0;
    }
    float _2502 = _2456;
    float _2504 = _2294;
    float _2506 = _2502;
    if (!_2380)
    {
        float _2508 = 1.0 / _2492;
        _2504 = _2508;
    }
    float _2510 = _2504;
    if (!_2476)
    {
        _2468 = _2390;
    }
    float _2512 = _2468;
    float _2514 = _2512;
    if (!_2380)
    {
        float _2516 = _2484 * _2474;
        float _2518 = precise::clamp(_2516, 0.0, 1.0);
        _2486 = _2518;
    }
    float _2520 = _2486;
    float _2522 = _2520;
    if (!_2380)
    {
        float _2524 = -_2520;
        float _2526 = _2524 + 1.0;
        _2506 = _2526;
    }
    float _2528 = _2506;
    if (!_2476)
    {
        _2522 = _2464;
    }
    float _2530 = _2522;
    float _2532 = _2510;
    float _2534 = _2530;
    if (!_2380)
    {
        float _2536 = _2500 * _2510;
        float _2538 = precise::clamp(_2536, 0.0, 1.0);
        _2470 = _2538;
    }
    float _2540 = _2470;
    float _2542 = _2540;
    if (!_2476)
    {
        _2532 = _2392;
    }
    float _2544 = _2532;
    bool _2546 = !_2476;
    float _2548 = _2544;
    if (!_2546)
    {
        float _2550 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2554 = _2448 + _2552;
        float _2556 = rsqrt(_2432);
        float _2558 = _2554 * _2550;
        float _2560 = _2464 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2562 = _2558 * 0.15915493667125701904296875;
        float _2564 = _2562 * 6.283185482025146484375;
        float _2566 = sin(_2564);
        float _2568 = _2562 * 6.283185482025146484375;
        float _2570 = cos(_2568);
        float _2572 = fma(_2566, _2560, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2574 = _2556 * _2572;
        float _2576 = _2570 + (-1.0);
        float _2578 = fma(_2412, _2574, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2580 = fma(_2398, _2574, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2582 = _2576 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2584 = fma(_2464, _2570, _2582);
        _2548 = _2578;
        _2534 = _2584;
        _2514 = _2580;
    }
    float _2586 = _2548;
    float _2588 = _2534;
    float _2590 = _2514;
    float _2592 = -_2148;
    float _2594 = fma(_2592, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2586);
    bool _2596 = _2540 > 0.0;
    bool _2598 = isnan(_2540);
    bool _2600 = _2596 || _2598;
    bool _2602 = isnan(0.0);
    bool _2604 = _2600 || _2602;
    float _2606 = _2540 * _2528;
    float _2608 = -_2146;
    float _2610 = fma(_2608, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2588);
    float _2612 = -_2154;
    float _2614 = fma(_2612, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2590);
    float _2616 = _2610;
    float _2618 = _2614;
    if (_2408)
    {
        _2542 = _2594;
    }
    float _2620 = _2542;
    float _2622 = _2620;
    if (!_2408)
    {
        float _2624 = _2164 * _2164;
        float _2626 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2628 = -_1386;
        float _2630 = _2628 + _2590;
        float _2632 = -_1374;
        float _2634 = _2632 + _2586;
        float _2636 = fma(_2172, _2172, _2624);
        float _2638 = fma(_2182, _2182, _2636);
        float _2640 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2642 = sqrt(_2638);
        float _2644 = 1.0 / _2276;
        float _2646 = _2640 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2648 = precise::min(_2642, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2650 = _2648 * _2626;
        float _2652 = _2650 * _2644;
        float _2654 = -_1740;
        float _2656 = _2654 + _2588;
        float _2658 = _2646 * _2652;
        float _2660 = _2630 * _2652;
        float _2662 = fma(_2634, _2658, _2158);
        float _2664 = fma(_2656, _2658, _2152);
        float _2666 = fma(_2646, _2660, _2168);
        _2616 = _2664;
        _2622 = _2662;
        _2618 = _2666;
    }
    float _2668 = _2616;
    float _2670 = _2622;
    float _2672 = _2618;
    float _2674 = _2668 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    bool _2676 = _2528 <= 0.0;
    bool _2678 = !_2604;
    bool _2680 = _2676 || _2678;
    float _2682 = _2668 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2684 = _2668 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2686 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2674);
    float _2688 = _2668 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2690 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2682);
    float _2692 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2684);
    float _2694 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2686);
    float _2696 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2688);
    float _2698 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2690);
    float _2700 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2692);
    float _2702 = _2694 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2704 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2696);
    float _2706 = _2698 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2708 = _2700 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2710 = _2702 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2712 = _2702 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2714 = _2702 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2716 = _2702 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2718 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2710);
    float _2720 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2712);
    float _2722 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2714);
    float _2724 = _2704 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2726 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2718);
    float _2728 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2720);
    float _2730 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2716);
    float _2732 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2722);
    float _2734 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2726);
    float _2736 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2728);
    float _2738 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2730);
    float _2740 = _2606 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2742 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2732);
    float _2744 = _2734 + _2736;
    float _2746 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2738);
    float _2748 = _2740 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2750 = _2744 * 0.5;
    out.m_33.x = _2748;
    out.gl_Position.x = _2742;
    out.gl_Position.y = _2746;
    out.gl_Position.z = _2734;
    out.gl_Position.w = _2736;
    out.m_58.z = _2750;
    out.m_58.w = _2736;
    if (!_2680)
    {
        return out;
    }
    float _2752 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_33.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2752;
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
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    bool _971 = false;
    bool _585 = false;
    bool _385 = false;
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
        float _2809 = as_type<float>(_93);
        out.gl_Position.z = _2809;
    }
    if (!_81)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _97 = in.m_35.w;
    bool _99 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _107 = _103 || _105;
    float _109 = -_97;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _113 = 0.0;
    float _115 = _111;
    if (_107)
    {
        float _117 = float(_77);
        _113 = _117;
    }
    float _119 = _113;
    bool _121 = _111 >= _119;
    bool _123 = !_107;
    bool _125 = _121 || _123;
    if (_125)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _87;
    if (_125)
    {
        out.m_33.x = 0.0;
    }
    if (_125)
    {
        float _129 = _127 * 5.0;
        _95 = as_type<int>(_129);
    }
    int _131 = _95;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2878 = as_type<float>(_131);
        out.gl_Position.z = _2878;
    }
    if (_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_37.x;
    float _135 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _137 = _111 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _139 = as_type<float>(int(gl_VertexIndex));
    float _141 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    float _153 = _137 * _135;
    float _155 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[20].x, _153);
    float _157 = in.m_35.x;
    float _159 = in.m_35.y;
    float _161 = in.m_35.z;
    float _163 = _155 * 6.283185482025146484375;
    float _165 = floor(_155);
    int _167 = as_type<int>(_139) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_139) & 2;
    bool _173 = _171 != 0;
    float _175 = _139;
    float _177 = 0.5;
    if (!_151)
    {
        float _179 = _141 * _141;
        float _181 = _179 * 0.5;
        _175 = _181;
    }
    float _183 = _175;
    float _185 = _163 * 0.15915493667125701904296875;
    int _187 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _189 = _187 != 0;
    bool _191 = !_169;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = _183;
    if (!_151)
    {
        float _197 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _197;
    }
    float _199 = _195;
    float _201 = _185 * 6.283185482025146484375;
    float _203 = cos(_201);
    bool _205 = !_173;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = -_165;
    float _211 = _155 + _209;
    float _213 = _165;
    float _215 = _199;
    if (!_151)
    {
        _213 = _141;
    }
    float _217 = _213;
    bool _219 = !_151;
    float _221 = _217;
    if (!_219)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = _141 * _225;
        float _235 = 1.0 / _229;
        float _237 = _231 * 0.693147182464599609375;
        float _239 = exp2(_233);
        float _241 = 1.0 / _237;
        float _243 = _239 + (-1.0);
        float _245 = -_243;
        float _247 = fma(_245, _241, _141);
        float _249 = _247 * _235;
        float _251 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _251;
    }
    float _253 = _215;
    bool _255 = !_151;
    if (!_255)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _141 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _221 = _275;
    }
    float _277 = _221;
    float _279 = in.m_42.w;
    float _281 = fma(_203, 0.5, 0.5);
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _285 = _283 != 0;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _289 = _287 != 0;
    float _291 = in.m_30.x;
    float _293 = in.m_30.y;
    float _295 = in.m_30.z;
    bool _297 = _211 < 0.5;
    float _299 = float(_297);
    float _301 = -_211;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _307 = !_189;
    int _309 = _307 ? 0 : 1;
    bool _311 = !_285;
    int _313 = _311 ? 0 : 1;
    float _315 = fma(_277, _157, _305);
    int _317 = abs(_309);
    float _319 = -_299;
    float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _323 = !_289;
    int _325 = _323 ? 0 : 1;
    float _327 = -_281;
    float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _331 = abs(_313);
    float _333 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _335 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _337 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _339 = abs(_325);
    float _341 = fma(_277, _159, _333);
    float _343 = float(_331);
    float _345 = fma(_277, _161, _337);
    float _347 = float(_317);
    float _349 = float(_339);
    float _351 = abs(_303);
    float _353 = _343 * _351;
    float _355 = fma(_315, _279, _291);
    float _357 = fma(_341, _279, _293);
    float _359 = fma(_345, _279, _295);
    float _361 = fma(_347, _329, _353);
    float _363 = abs(_321);
    float _365 = fma(_349, _363, _361);
    bool _367 = !_335;
    float _383;
    if (!_367)
    {
        float _369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _371 = _133 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _373 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _375 = _373 * _369;
        float _377 = floor(_375);
        float _379 = -_377;
        float _381 = _375 + _379;
        _383 = _381;
        _385 = true;
    }
    else
    {
        float _387 = float(_77);
        float _389 = 1.0 / _387;
        float _391 = _111 * _389;
        _383 = _391;
    }
    _385 = false;
    float _393 = _383;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _397 = _393 + _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _401 = _393 + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _411;
    float _415 = in.m_42.x;
    float _417 = in.m_42.y;
    float _419 = 1.0 / _409;
    bool _421 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _423 = 1.0 / _405;
    bool _425 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _427 = isnan(_393);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = 1.0 / _413;
    float _439 = _397 * _423;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _443 = _393 + _441;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _445;
    float _449 = _443 * _419;
    bool _451 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _453 = isnan(_393);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _463;
    float _467 = _401 * _437;
    float _469 = fma(_447, _439, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _471 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _473 = isnan(_393);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -_461;
    float _485 = _483 + 1.0;
    float _487 = fma(_465, _439, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _489 = -_435;
    float _491 = _489 + 1.0;
    float _493 = _435 * _485;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _499 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _501 = isnan(_393);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = _481 * _491;
    float _513 = -_481;
    float _515 = _513 + 1.0;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _521 = fma(_497, _449, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _523 = _509 * _515;
    float _525 = -_509;
    float _527 = _525 + 1.0;
    float _529 = fma(_519, _449, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _531 = _469 * _523;
    float _533 = _487 * _523;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _539;
    float _543 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[143].x, _531);
    float _545 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[143].y, _533);
    float _547 = fma(_537, _467, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _549 = fma(_541, _467, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _551 = fma(_529, _511, _543);
    float _553 = fma(_521, _511, _545);
    float _555 = fma(_547, _493, _551);
    float _557 = fma(_549, _493, _553);
    float _559 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[146].x, _555);
    float _561 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[146].y, _557);
    float _563 = _559 * _415;
    float _565 = _561 * _417;
    bool _567 = !_421;
    float _583;
    if (!_567)
    {
        float _569 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _571 = _133 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _573 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[11].x, _111);
        float _575 = _573 * _569;
        float _577 = floor(_575);
        float _579 = -_577;
        float _581 = _575 + _579;
        _583 = _581;
        _585 = true;
    }
    else
    {
        float _587 = float(_77);
        float _589 = 1.0 / _587;
        float _591 = _111 * _589;
        _583 = _591;
    }
    _585 = false;
    float _593 = _583;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _597 = _593 + _595;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _599;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _607;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _615;
    float _619 = 1.0 / _605;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _625 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _627 = isnan(_593);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = 1.0 / _613;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _641 = _593 + _639;
    bool _643 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _645 = isnan(_593);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    bool _655 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _657 = isnan(_593);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = 1.0 / _623;
    float _669 = _641 * _619;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _673 = _593 + _671;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _677 = _593 + _675;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _681 = _593 + _679;
    float _683 = 1.0 / _601;
    float _685 = _673 * _637;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _691;
    bool _695 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _697 = 1.0 / _617;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _701 = _593 + _699;
    float _703 = _677 * _667;
    bool _705 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _707 = isnan(_593);
    bool _709 = _705 || _707;
    bool _711 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _713 = _709 || _711;
    float _715 = float(_713);
    float _717 = 1.0 / _609;
    float _719 = _701 * _683;
    float _721 = -_635;
    float _723 = _721 + 1.0;
    float _725 = fma(_689, _719, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _727 = _715 * _723;
    float _729 = _681 * _697;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _731;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _735;
    float _739 = fma(_737, _719, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _741 = -_653;
    float _743 = _741 + 1.0;
    float _745 = _597 * _717;
    float _747 = -_715;
    float _749 = _747 + 1.0;
    float _751 = fma(_733, _719, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _753 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _755 = isnan(_593);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = _653 * _749;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _773 = _771 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _775 = -_763;
    float _777 = _775 + 1.0;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _781 = _779 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _783 = _763 * _743;
    bool _785 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _787 = isnan(_593);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _793 = _789 || _791;
    float _795 = float(_793);
    float _797 = fma(_769, _669, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    bool _799 = _593 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _801 = isnan(_593);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _807 = _803 || _805;
    float _809 = float(_807);
    float _811 = _665 * _777;
    float _813 = -_665;
    float _815 = _813 + 1.0;
    float _817 = fma(_773, _669, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _819 = fma(_781, _669, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _821 = -_809;
    float _823 = _821 + 1.0;
    float _825 = _809 * _815;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _827;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _831;
    float _835 = _795 * _823;
    float _837 = -_795;
    float _839 = _837 + 1.0;
    float _841 = fma(_829, _745, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _843 = fma(_833, _745, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _845 = fma(_693, _745, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _847 = _739 * _835;
    float _849 = _725 * _835;
    float _851 = _751 * _835;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _865 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[107].y, _847);
    float _867 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[107].z, _849);
    float _869 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[107].x, _851);
    float _871 = fma(_855, _685, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _873 = fma(_859, _685, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _875 = fma(_863, _685, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _877 = fma(_817, _825, _865);
    float _879 = fma(_819, _825, _867);
    float _881 = fma(_797, _825, _869);
    float _883 = fma(_845, _811, _879);
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _885;
    float _889 = fma(_841, _811, _881);
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _891;
    float _895 = fma(_843, _811, _877);
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _897;
    float _901 = fma(_887, _729, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _903 = fma(_893, _729, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _905 = fma(_875, _783, _883);
    float _907 = fma(_899, _729, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _909 = fma(_871, _783, _889);
    float _911 = fma(_873, _783, _895);
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _925 = fma(_901, _765, _909);
    float _927 = fma(_915, _703, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _929 = fma(_919, _703, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _931 = fma(_903, _765, _911);
    float _933 = fma(_923, _703, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _935 = fma(_907, _765, _905);
    float _937 = fma(_927, _727, _925);
    float _939 = fma(_929, _727, _931);
    float _941 = fma(_933, _727, _935);
    float _943 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[113].x, _937);
    float _945 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[113].y, _939);
    float _947 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[113].z, _941);
    bool _949 = !_695;
    float _967;
    float _969;
    if (!_949)
    {
        float _951 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _953 = _133 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _955 = float(_77);
        float _957 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _959 = _957 * _951;
        float _961 = floor(_959);
        float _963 = -_961;
        float _965 = _959 + _963;
        _967 = _955;
        _969 = _965;
        _971 = true;
    }
    else
    {
        float _973 = float(_77);
        float _975 = 1.0 / _973;
        float _977 = _111 * _975;
        _967 = _973;
        _969 = _977;
    }
    _971 = false;
    float _979 = _967;
    float _981 = _969;
    float _983 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _985 = int(_983);
    float _987 = in.m_44.x;
    float _989 = in.m_44.y;
    float _991 = in.m_44.z;
    float _993 = in.m_44.w;
    float _995 = _133 * 2.0;
    float _997 = in.m_37.y;
    float _999 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1001 = int(_999);
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1011 = float(_985);
    float _1013 = 1.0 / _979;
    float _1015 = float(uint(_1001));
    float _1017 = 1.0 / _1011;
    int _1019 = ~_1001;
    int _1021 = _1019 + 1;
    float _1023 = _357 * _989;
    int _1025 = ~_1001;
    int _1027 = _1025 + 1;
    bool _1029 = _1001 == 0;
    float _1031 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1009);
    int _1033 = ~_1001;
    int _1035 = _1033 + 1;
    float _1037 = 1.0 / _1015;
    int _1039 = ~_1001;
    int _1041 = _1039 + 1;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1045 = _1017 * _111;
    float _1047 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1049 = log2(_1047);
    int _1051 = as_type<int>(_1037) + (-2);
    float _1053 = trunc(_1045);
    int _1055 = int(_1053);
    float _1057 = _1049 * _111;
    float _1059 = floor(_995);
    float _1061 = float(uint(_1055));
    float _1063 = exp2(_1057);
    float _1065 = as_type<float>(_1051) * _1061;
    float _1067 = 1.0 / _1007;
    float _1069 = trunc(_1065);
    float _1071 = precise::max(_1069, 0.0);
    uint _1074 = uint(_1071);
    int _1076 = _1021 * int(_1074);
    int _1078 = _1076 + _1055;
    float _1080 = float(uint(_1078));
    float _1082 = as_type<float>(_1051) * _1080;
    float _1084 = trunc(_1082);
    float _1086 = precise::max(_1084, 0.0);
    uint _1088 = uint(_1086);
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1092 = _1090 != 0;
    bool _1094 = !_1092;
    float _1096 = _1094 ? 7.345489978790283203125 : 1.0;
    float _1098 = float(_1055);
    float _1100 = _1096 * _133;
    int _1102 = int(_1074) + int(_1088);
    float _1104 = float(_1001);
    float _1106 = floor(_1100);
    int _1108 = _1027 * _1102;
    int _1110 = _1108 + _1055;
    bool _1112 = _1098 >= _1104;
    bool _1114 = isnan(_1098);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(_1104);
    bool _1120 = _1116 || _1118;
    float _1122 = float(_1120);
    bool _1124 = uint(_1110) >= uint(_1001);
    float _1126 = trunc(_1122);
    int _1128 = int(_1126);
    bool _1130 = !_1124;
    int _1132 = _1130 ? 0 : (-1);
    int _1134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1136 = _1134 != 0;
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1140 = _1138 != 0;
    int _1142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1144 = _1142 != 0;
    int _1146 = ~_1102;
    int _1148 = _1146 + _1132;
    int _1150 = _1148 + 1;
    float _1152 = -_1106;
    float _1154 = _1100 + _1152;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1158 = _1156 != 0;
    bool _1160 = _1059 > 0.0;
    int _1162 = _1001 * _1150;
    int _1164 = _1162 + _1055;
    bool _1166 = _1059 >= 0.0;
    bool _1168 = isnan(_1059);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan(0.0);
    bool _1174 = _1170 || _1172;
    bool _1176 = !_1029;
    int _1178 = _1176 ? _1164 : (-1);
    float _1180 = _1154 * _1104;
    float _1182 = _1104 * _111;
    int _1184 = ~_1128;
    int _1186 = _1184 + 1;
    int _1188 = _1186 + 1;
    bool _1190 = !_1140;
    int _1192 = _1190 ? 0 : 1;
    float _1194 = _1182 * _1013;
    float _1196 = trunc(_1180);
    int _1198 = int(_1196);
    int _1200 = _1178 * _1188;
    int _1202 = _1001 + (-1);
    int _1204 = abs(_1192);
    bool _1206 = !_1144;
    int _1208 = _1206 ? 0 : 1;
    int _1210 = _1128 * _1202;
    int _1212 = _1210 + _1200;
    float _1214 = trunc(_1194);
    int _1216 = int(_1214);
    bool _1218 = !_1136;
    int _1220 = _1218 ? 0 : 1;
    bool _1222 = !_1158;
    int _1224 = _1222 ? 0 : 1;
    int _1226 = _1212 * _1204;
    int _1228 = abs(_1220);
    int _1230 = abs(_1208);
    int _1232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1234 = _1232 != 0;
    int _1236 = abs(_1224);
    bool _1238 = !_1234;
    int _1240 = _1238 ? 0 : 1;
    int _1242 = _1198 * _1236;
    int _1244 = _1242 + _1055;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1248 = _1246 != 0;
    int _1250 = _1216 * _1228;
    int _1252 = _1250 + _1226;
    int _1254 = abs(_1240);
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1258 = _1256 != 0;
    int _1260 = _1244 * _1230;
    int _1262 = _1260 + _1252;
    int _1264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1266 = _1264 != 0;
    bool _1268 = _133 > 0.5;
    int _1270 = _1198 * _1254;
    int _1272 = _1270 + _1262;
    float _1274 = float(uint(_1244));
    float _1276 = in.m_46.x;
    float _1278 = in.m_46.y;
    float _1280 = in.m_46.z;
    float _1282 = in.m_46.w;
    float _1284 = float(uint(_1272));
    float _1286 = as_type<float>(_1051) * _1274;
    float _1288 = as_type<float>(_1051) * _1284;
    float _1290 = in.m_48.x;
    float _1292 = in.m_48.y;
    float _1294 = in.m_48.z;
    float _1296 = in.m_48.w;
    float _1298 = trunc(_1288);
    float _1300 = precise::max(_1298, 0.0);
    uint _1302 = uint(_1300);
    float _1304 = _357 * _1278;
    float _1306 = fma(_355, _1276, _1304);
    float _1308 = _997 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1310 = _1035 * int(_1302);
    int _1312 = _1310 + _1272;
    float _1314 = fma(_359, _1280, _1306);
    float _1316 = fma(_1308, -2.0, _1003);
    float _1318 = -_193;
    int _1320 = _1268 ? as_type<int>(_1318) : as_type<int>(_193);
    float _1322 = float(uint(_1312));
    float _1324 = _357 * _1292;
    float _1326 = fma(_355, _987, _1023);
    bool _1328 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1330 = isnan(0.0);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1336 = _1332 || _1334;
    float _1338 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1316);
    float _1340 = as_type<float>(_1051) * _1322;
    float _1342 = fma(_355, _1290, _1324);
    float _1344 = _133 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1346 = trunc(_1340);
    float _1348 = precise::max(_1346, 0.0);
    uint _1350 = uint(_1348);
    float _1352 = fma(_359, _991, _1326);
    float _1354 = -_1043;
    float _1356 = fma(_1344, 2.0, _1354);
    float _1358 = fma(_359, _1294, _1342);
    float _1360 = in.m_37.z;
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1364 = _1362 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1368 = _1366 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    int _1370 = _1174 ? 0 : 1;
    float _1372 = 1.0 / _1364;
    float _1374 = _1352 + _993;
    float _1376 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1376;
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1382 = _1380 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1384 = int(_1302) + int(_1350);
    float _1386 = _1358 + _1296;
    bool _1388 = !_1258;
    float _1390 = _1388 ? _193 : as_type<float>(_1320);
    float _1392 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1394 = _1392 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1396 = _997 > 0.5;
    int _1398 = _1041 * _1384;
    int _1400 = _1398 + _1272;
    float _1402 = -_1063;
    float _1404 = _1402 + 1.0;
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1408 = _1406 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1410 = -_207;
    int _1412 = _1396 ? as_type<int>(_1410) : as_type<int>(_207);
    float _1414 = 1.0 / _1394;
    bool _1416 = uint(_1400) >= uint(_1001);
    float _1418 = _1378 * _1067;
    bool _1420 = !_1266;
    float _1422 = _1420 ? _207 : as_type<float>(_1412);
    float _1424 = _1382 * _1372;
    float _1426 = _1336 ? _1404 : 0.0;
    float _1428 = _1360 * 2.0;
    bool _1430 = !_1416;
    int _1432 = _1430 ? 0 : (-1);
    float _1434 = 1.0 / _1408;
    int _1436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1438 = _1436 != 0;
    int _1440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1442 = _1440 != 0;
    int _1444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1446 = _1444 != 0;
    float _1448 = _1422 + (-0.5);
    float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1452 = _1450 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _1454 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1456 = isnan(1.0);
    bool _1458 = _1454 || _1456;
    bool _1460 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1462 = _1458 || _1460;
    float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _1464;
    float _1468 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1470 = 1.0 + _1468;
    float _1472 = 1.0 / _1452;
    float _1474 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1474;
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1480 = _1478 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _1484 = _1482 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    int _1486 = ~_1384;
    int _1488 = _1486 + _1432;
    int _1490 = _1488 + 1;
    float _1492 = _1480 * _1434;
    float _1494 = _133 + _997;
    float _1496 = 1.0 / _1368;
    float _1498 = _1476 * _1414;
    float _1500 = _1494 + (-1.0);
    int _1502 = _1001 * _1490;
    int _1504 = _1502 + _1272;
    bool _1506 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1508 = isnan(_981);
    bool _1510 = _1506 || _1508;
    bool _1512 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1514 = _1510 || _1512;
    float _1516 = float(_1514);
    float _1518 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1520 = _1466 * _1472;
    float _1522 = _997 * 2.0;
    float _1524 = 1.0 / _1470;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1528 = _997 + _1360;
    float _1530 = _997 + (-0.5);
    float _1532 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1526);
    float _1534 = _1484 * _1496;
    float _1536 = _1528 + (-1.0);
    float _1538 = floor(_1522);
    float _1540 = -_111;
    float _1542 = fma(_1540, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1356);
    float _1544 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1532);
    float _1546 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1031);
    int _1548 = ~_1370;
    int _1550 = _1548 + 1;
    int _1552 = _1550 + 1;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1556 = _981 + _1554;
    int _1558 = _1552;
    if (!_1160)
    {
        int _1560 = ~_1370;
        int _1562 = _1560 + 1;
        _1558 = _1562;
    }
    int _1564 = _1558;
    float _1566 = -_1544;
    float _1568 = _1566 + 1.0;
    float _1570 = floor(_1428);
    if (_1462)
    {
        float _1572 = _1426 * _1524;
        _115 = _1572;
    }
    float _1574 = _115;
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1578 = _981 + _1576;
    bool _1580 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _1582 = isnan(_981);
    bool _1584 = _1580 || _1582;
    bool _1586 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _1588 = _1584 || _1586;
    float _1590 = float(_1588);
    float _1592 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1594 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1596 = _981 + _1594;
    float _1598 = fma(_1418, _1578, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1600 = fma(_1498, _1556, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1602 = _1538 >= 0.0;
    bool _1604 = isnan(_1538);
    bool _1606 = _1602 || _1604;
    bool _1608 = isnan(0.0);
    bool _1610 = _1606 || _1608;
    float _1612 = -_1590;
    float _1614 = _1612 + 1.0;
    bool _1616 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _1618 = isnan(_981);
    bool _1620 = _1616 || _1618;
    bool _1622 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _1624 = _1620 || _1622;
    float _1626 = float(_1624);
    float _1628 = fma(_1492, _1596, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    int _1630 = _1610 ? 0 : 1;
    float _1632 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1634 = _981 + _1632;
    bool _1636 = _1538 > 0.0;
    float _1638 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1640 = _981 + _1638;
    bool _1642 = _1570 >= 0.0;
    bool _1644 = isnan(_1570);
    bool _1646 = _1642 || _1644;
    bool _1648 = isnan(0.0);
    bool _1650 = _1646 || _1648;
    float _1652 = _1626 * _1614;
    float _1654 = _1390 + 0.5;
    float _1656 = fma(_1424, _1640, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1658 = _1650 ? 0 : 1;
    float _1660 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1662 = _981 + _1660;
    bool _1664 = _1570 > 0.0;
    float _1666 = fma(_1534, _1634, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    bool _1668 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1670 = isnan(_981);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1676 = _1672 || _1674;
    float _1678 = float(_1676);
    float _1680 = fma(_1520, _1662, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _1682 = -_1626;
    float _1684 = _1682 + 1.0;
    bool _1686 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1688 = isnan(_981);
    bool _1690 = _1686 || _1688;
    bool _1692 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1694 = _1690 || _1692;
    float _1696 = float(_1694);
    float _1698 = -_1546;
    float _1700 = _1698 + 1.0;
    float _1702 = -_1678;
    float _1704 = _1702 + 1.0;
    float _1706 = _1678 * _1684;
    float _1708 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1542);
    bool _1710 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1712 = isnan(_981);
    bool _1714 = _1710 || _1712;
    bool _1716 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1718 = _1714 || _1716;
    float _1720 = float(_1718);
    float _1722 = _1696 * _1704;
    float _1724 = -_1696;
    float _1726 = _1724 + 1.0;
    bool _1728 = _981 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1730 = isnan(_981);
    bool _1732 = _1728 || _1730;
    bool _1734 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1736 = _1732 || _1734;
    float _1738 = float(_1736);
    float _1740 = _1314 + _1282;
    float _1742 = -_1720;
    float _1744 = _1742 + 1.0;
    float _1746 = _1720 * _1726;
    int _1748 = ~_1001;
    int _1750 = _1748 + 1;
    float _1752 = trunc(_1286);
    float _1754 = precise::max(_1752, 0.0);
    uint _1756 = uint(_1754);
    float _1758 = -_1738;
    float _1760 = _1758 + 1.0;
    float _1762 = -_1448;
    float _1764 = -_1338;
    float _1766 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1764);
    float _1768 = _1738 * _1744;
    float _1770 = _1516 * _1760;
    float _1772 = fma(_1422, _1700, _1766);
    int _1774 = ~_1658;
    int _1776 = _1774 + 1;
    int _1778 = _1776 + 1;
    float _1780 = _1598 * _1770;
    bool _1782 = !_1029;
    int _1784 = _1782 ? _1504 : (-1);
    float _1786 = -_1516;
    float _1788 = _1786 + 1.0;
    int _1790 = _1778;
    if (!_1664)
    {
        int _1792 = ~_1658;
        int _1794 = _1792 + 1;
        _1790 = _1794;
    }
    int _1796 = _1790;
    int _1798 = _1784 >> 31;
    float _1800 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1780);
    int _1802 = _1750 * int(_1756);
    int _1804 = _1802 + _1244;
    int _1806 = ~_1630;
    int _1808 = _1806 + 1;
    int _1810 = _1808 + 1;
    int _1812 = _1798 & 3;
    float _1814 = fma(_1656, _1768, _1800);
    float _1816 = float(uint(_1804));
    int _1818 = _1784 + _1812;
    bool _1820 = !_1442;
    int _1822 = _1820 ? 0 : 1;
    int _1824 = _1818 >> 2;
    int _1826 = abs(_1822);
    int _1828 = _1824 << 4;
    int _1830 = _1828 + 368;
    int _1832 = _1810;
    if (!_1636)
    {
        int _1834 = ~_1630;
        int _1836 = _1834 + 1;
        _1832 = _1836;
    }
    int _1838 = _1832;
    float _1840 = as_type<float>(_1051) * _1816;
    float _1842 = -_1568;
    float _1844 = fma(_1390, _1842, _1708);
    float _1846 = fma(_1600, _1746, _1814);
    uint _1848 = uint(int(uint(_1830) >> uint(2)));
    uint _1850 = uint(int(uint(int(_1848)) >> uint(2)));
    int _1852 = int(_1848) & 3;
    float _1854 = (*spvDescriptorSet0.vp_c9)._m0[int(_1850)][_1852];
    int _1856 = int(_1848) + 1;
    uint _1858 = uint(int(uint(_1856) >> uint(2)));
    int _1860 = _1856 & 3;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[int(_1858)][_1860];
    bool _1864 = !_1438;
    int _1866 = _1864 ? 0 : 1;
    float _1868 = trunc(_1840);
    float _1870 = precise::max(_1868, 0.0);
    uint _1872 = uint(_1870);
    float _1874 = float(_1826);
    out.m_50.x = _1844;
    out.m_50.y = _1772;
    int _1876 = abs(_1866);
    float _1878 = fma(_1628, _1722, _1846);
    float _1880 = float(_1564);
    int _1882 = _1830 + 8;
    uint _1884 = uint(int(uint(_1882) >> uint(2)));
    uint _1886 = uint(int(uint(int(_1884)) >> uint(2)));
    int _1888 = int(_1884) & 3;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[int(_1886)][_1888];
    int _1892 = int(_1884) + 1;
    uint _1894 = uint(int(uint(_1892) >> uint(2)));
    int _1896 = _1892 & 3;
    float _1898 = (*spvDescriptorSet0.vp_c9)._m0[int(_1894)][_1896];
    int _1900 = _1784 & 3;
    bool _1902 = _1900 != 0;
    float _1904 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1906 = _1374 + _1904;
    int _1908 = _1784 & 3;
    bool _1910 = _1908 != 0;
    float _1912 = _1874 * _1880;
    bool _1914 = uint(_1900) > 1u;
    float _1916 = in.m_52.x;
    float _1918 = in.m_52.y;
    float _1920 = in.m_52.z;
    int _1922 = _1910 ? 0 : 1;
    float _1924 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1926 = _1740 + _1924;
    bool _1928 = uint(_1900) >= 2u;
    float _1930 = fma(_1680, _1706, _1878);
    int _1932 = ~_1922;
    int _1934 = _1932 + 1;
    int _1936 = _1934 + 1;
    float _1938 = _1926 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1940 = int(_1756) + int(_1872);
    float _1942 = fma(_1666, _1652, _1930);
    int _1944 = ~_1001;
    int _1946 = _1944 + 1;
    float _1948 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1938);
    int _1950 = _1928 ? 0 : 1;
    int _1952 = _1936;
    if (!_1914)
    {
        int _1954 = ~_1922;
        int _1956 = _1954 + 1;
        _1952 = _1956;
    }
    int _1958 = _1952;
    float _1960 = _1912 * (-2.0);
    bool _1962 = _1900 != 3;
    int _1964 = _1946 * _1940;
    int _1966 = _1964 + _1244;
    int _1968 = abs(_1958);
    float _1970 = fma(_1592, _1960, _1592);
    float _1972 = float(_1796);
    int _1974 = ~_1950;
    int _1976 = _1974 + 1;
    int _1978 = _1976 + 1;
    int _1980 = ~_1968;
    int _1982 = _1980 + 1;
    int _1984 = _1982 + 1;
    float _1986 = fma(_1960, _1918, _1918);
    bool _1988 = !_1902;
    int _1990 = _1988 ? 0 : 1;
    bool _1992 = _1900 != 3;
    float _1994 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1986);
    int _1996 = _1978;
    if (_1962)
    {
        int _1998 = ~_1950;
        int _2000 = _1998 + 1;
        _1996 = _2000;
    }
    int _2002 = _1996;
    int _2004 = abs(_1990);
    float _2006 = fma(_1970, _1574, _1994);
    bool _2008 = uint(_1966) >= uint(_1001);
    int _2010 = _1984 * as_type<int>(_1862);
    bool _2012 = !_1992;
    int _2014 = _2012 ? 0 : (-1);
    float _2016 = float(_1876);
    int _2018 = abs(_2002);
    bool _2020 = !_1248;
    int _2022 = _2020 ? 0 : 1;
    float _2024 = _2016 * _1972;
    int _2026 = abs(_2014);
    float _2028 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2030 = _1386 + _2028;
    int _2032 = ~_2004;
    int _2034 = _2032 + 1;
    int _2036 = _2034 + 1;
    float _2038 = fma(_2030, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1948);
    int _2040 = abs(_2022);
    int _2042 = _2036 * as_type<int>(_1854);
    int _2044 = _2042 + _2010;
    int _2046 = ~_2018;
    int _2048 = _2046 + 1;
    int _2050 = _2048 + 1;
    float _2052 = _1926 * _1926;
    bool _2054 = !_2008;
    int _2056 = _2054 ? 0 : (-1);
    int _2058 = ~_2026;
    int _2060 = _2058 + 1;
    int _2062 = _2060 + 1;
    int _2064 = _2050 * as_type<int>(_1890);
    int _2066 = _2064 + _2044;
    int _2068 = ~_1940;
    int _2070 = _2068 + _2056;
    int _2072 = _2070 + 1;
    float _2074 = fma(_1906, _1906, _2052);
    bool _2076 = _2038 >= 0.0;
    int _2078 = _2062 * as_type<int>(_1898);
    int _2080 = _2078 + _2066;
    int _2082 = _1001 * _2072;
    int _2084 = _2082 + _1244;
    float _2086 = _945 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2088 = fma(_2030, _2030, _2074);
    int _2090 = ~_2040;
    int _2092 = _2090 + 1;
    int _2094 = _2092 + 1;
    float _2096 = _943 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2098 = !_1029;
    int _2100 = _2098 ? _2084 : (-1);
    float _2102 = _2086 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2104 = !_1446;
    int _2106 = _2104 ? 0 : 1;
    int _2108 = _2080 * _2094;
    float _2110 = rsqrt(_2088);
    float _2112 = fma(_1590, (*spvDescriptorSet0.vp_c9)._m0[121].x, _1942);
    float _2114 = _2074;
    if (_2076)
    {
        _2114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2116 = _2114;
    int _2118 = _2100 * _2040;
    int _2120 = _2118 + _2108;
    float _2122 = _947 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2124 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2126 = as_type<int>(_2116);
    if (_2076)
    {
        float _2128 = _2116 * 5.0;
        _2126 = as_type<int>(_2128);
    }
    int _2130 = _2126;
    float _2132 = _2122 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2134 = _2112 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2136 = float(_2120);
    if (_2076)
    {
        out.m_33.x = 0.0;
    }
    int _2138 = abs(_2106);
    float _2140 = _133 + (-0.5);
    float _2142 = float(_1838);
    if (_2076)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5874 = as_type<float>(_2130);
        out.gl_Position.z = _5874;
    }
    float _2144 = float(_2138);
    float _2146 = _1926 * _2110;
    float _2148 = _1906 * _2110;
    out.m_54.x = _2124;
    out.m_54.y = _2102;
    out.m_54.z = _2132;
    out.m_54.w = _2134;
    out.m_56.x = _2136;
    if (_2076)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2150 = -_2146;
    float _2152 = fma(_2150, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1740);
    float _2154 = _2030 * _2110;
    float _2156 = -_2148;
    float _2158 = fma(_2156, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1374);
    float _2160 = _2024 * (-2.0);
    float _2162 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2164 = _2152 + _2162;
    float _2166 = -_2154;
    float _2168 = fma(_2166, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1386);
    float _2170 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2172 = _2158 + _2170;
    float _2174 = _2006 * 0.15915493667125701904296875;
    float _2176 = _2164 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2178 = fma(_2160, _1916, _1916);
    float _2180 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2182 = _2168 + _2180;
    float _2184 = fma(_1518, _2160, _1518);
    float _2186 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2176);
    float _2188 = fma(_2140, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2178);
    float _2190 = _2144 * _2142;
    float _2192 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2186);
    float _2194 = fma(_2184, _1574, _2188);
    float _2196 = _133 + _1360;
    float _2198 = -_2146;
    float _2200 = fma(_2198, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1926);
    float _2202 = _1360 + (-0.5);
    bool _2204 = _2192 >= 0.0;
    float _2206 = _2194 * 0.15915493667125701904296875;
    float _2208 = _2196 + (-1.0);
    float _2210 = _2190 * (-2.0);
    float _2212 = -_2148;
    float _2214 = fma(_2212, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1906);
    float _2216 = _2200 * _2200;
    float _2218 = fma(_2208, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2220 = fma(_2210, _1920, _1920);
    float _2222 = -_2154;
    float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2030);
    float _2226 = fma(_2214, _2214, _2216);
    float _2228 = fma(_2218, _2210, _2218);
    float _2230 = fma(_2202, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2220);
    float _2232 = _2174 * 6.283185482025146484375;
    float _2234 = sin(_2232);
    float _2236 = _2202;
    int _2238 = as_type<int>(_2230);
    if (_2204)
    {
        _2236 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2240 = _2236;
    float _2242 = fma(_2224, _2224, _2226);
    float _2244 = fma(_2228, _1574, _2230);
    if (_2204)
    {
        out.m_33.x = 0.0;
    }
    if (_2204)
    {
        float _2246 = _2240 * 5.0;
        _2238 = as_type<int>(_2246);
    }
    int _2248 = _2238;
    float _2250 = _2244 * 0.15915493667125701904296875;
    float _2252 = _2174 * 6.283185482025146484375;
    float _2254 = cos(_2252);
    float _2256 = _365 * _565;
    if (_2204)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6086 = as_type<float>(_2248);
        out.gl_Position.z = _6086;
    }
    float _2258 = _2206 * 6.283185482025146484375;
    float _2260 = sin(_2258);
    float _2262 = _2206 * 6.283185482025146484375;
    float _2264 = cos(_2262);
    float _2266 = sqrt(_2242);
    float _2268 = _2250 * 6.283185482025146484375;
    float _2270 = sin(_2268);
    if (_2204)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2272 = _2250 * 6.283185482025146484375;
    float _2274 = cos(_2272);
    float _2276 = _2110 * _2266;
    float _2278 = _2256 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2280 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _2282 = _2260 * _2234;
    float _2284 = _2264 * _2254;
    float _2286 = _2276 * _2278;
    float _2288 = _365 * _563;
    float _2290 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _2292 = fma(_2270, _2284, _2282);
    float _2294 = _2280 * _2286;
    float _2296 = _2288 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2298 = fma(_2270, _2282, _2284);
    float _2300 = _2264 * _2234;
    float _2302 = _2260 * _2254;
    float _2304 = _2276 * _2296;
    float _2306 = _2274 * _2294;
    float _2308 = -_2294;
    float _2310 = _2270 * _2308;
    float _2312 = -_2300;
    float _2314 = fma(_2270, _2302, _2312);
    float _2316 = -_2302;
    float _2318 = fma(_2270, _2300, _2316);
    float _2320 = _2290 * _2304;
    float _2322 = _2264 * _2306;
    float _2324 = _2254 * _2274;
    float _2326 = _2260 * _2306;
    float _2328 = _2234 * _2274;
    float _2330 = fma(_2292, _2320, _2322);
    float _2332 = _2276 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2334 = _2332 * 0.5;
    float _2336 = fma(_2324, _2320, _2310);
    float _2338 = fma(_2314, _2320, _2326);
    float _2340 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2342 = fma(_2318, _2334, _2330);
    float _2344 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2346 = fma(_2328, _2334, _2336);
    float _2348 = fma(_2298, _2334, _2338);
    float _2350 = _2342 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2352 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2344);
    float _2354 = _2342 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2356 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2340);
    float _2358 = fma(_2346, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2350);
    float _2360 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2352);
    float _2362 = fma(_2346, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2354);
    float _2364 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2356);
    float _2366 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2358);
    float _2368 = _2360 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2370 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2362);
    bool _2372 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2374 = isnan(0.5);
    bool _2376 = _2372 || _2374;
    bool _2378 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2380 = _2376 || _2378;
    float _2382 = _2366 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2384 = 1.0 / _2368;
    float _2386 = _2370 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2388 = _2364 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2390 = _1386 + _2382;
    float _2392 = _1374 + _2386;
    float _2394 = _2388 + _2368;
    float _2396 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2398 = _2390 + _2396;
    bool _2400 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2402 = isnan(0.5);
    bool _2404 = _2400 || _2402;
    bool _2406 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2408 = _2404 || _2406;
    float _2410 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2412 = _2392 + _2410;
    float _2414 = _2342 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2416 = _2398 * _2398;
    float _2418 = _2298;
    float _2420 = _2310;
    float _2422 = _2416;
    float _2424 = _2414;
    float _2426 = _2342;
    if (!_2380)
    {
        _2418 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2428 = _2418;
    float _2430 = fma(_2346, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2414);
    float _2432 = fma(_2412, _2412, _2416);
    float _2434 = _2394 * _2384;
    float _2436 = _2434 * 0.5;
    if (!_2380)
    {
        float _2438 = -_2428;
        float _2440 = _2438 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2420 = _2440;
    }
    float _2442 = _2420;
    float _2444 = _2442;
    if (!_2380)
    {
        _2422 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2446 = _2422;
    float _2448 = sqrt(_2432);
    float _2450 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2452 = fma(_2436, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2450);
    float _2454 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2430);
    float _2456 = _2446;
    if (_2380)
    {
        _2424 = 1.0;
    }
    float _2458 = _2424;
    float _2460 = _2454 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2462 = 1.0 / _2452;
    float _2464 = _1740 + _2460;
    float _2466 = _2264;
    float _2468 = _2460;
    float _2470 = _2458;
    if (!_2380)
    {
        float _2472 = 1.0 / _2442;
        _2466 = _2472;
    }
    float _2474 = _2466;
    bool _2476 = _2448 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_2380)
    {
        float _2478 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2480 = -_2428;
        float _2482 = fma(_2462, _2478, _2480);
        _2426 = _2482;
    }
    float _2484 = _2426;
    float _2486 = _2484;
    if (!_2380)
    {
        float _2488 = -_2446;
        float _2490 = _2488 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2444 = _2490;
    }
    float _2492 = _2444;
    if (!_2380)
    {
        float _2494 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2496 = -_2446;
        float _2498 = fma(_2462, _2494, _2496);
        _177 = _2498;
    }
    float _2500 = _177;
    if (_2380)
    {
        _2456 = 1.0;
    }
    float _2502 = _2456;
    float _2504 = _2294;
    float _2506 = _2502;
    if (!_2380)
    {
        float _2508 = 1.0 / _2492;
        _2504 = _2508;
    }
    float _2510 = _2504;
    if (!_2476)
    {
        _2468 = _2390;
    }
    float _2512 = _2468;
    float _2514 = _2512;
    if (!_2380)
    {
        float _2516 = _2484 * _2474;
        float _2518 = precise::clamp(_2516, 0.0, 1.0);
        _2486 = _2518;
    }
    float _2520 = _2486;
    float _2522 = _2520;
    if (!_2380)
    {
        float _2524 = -_2520;
        float _2526 = _2524 + 1.0;
        _2506 = _2526;
    }
    float _2528 = _2506;
    if (!_2476)
    {
        _2522 = _2464;
    }
    float _2530 = _2522;
    float _2532 = _2510;
    float _2534 = _2530;
    if (!_2380)
    {
        float _2536 = _2500 * _2510;
        float _2538 = precise::clamp(_2536, 0.0, 1.0);
        _2470 = _2538;
    }
    float _2540 = _2470;
    float _2542 = _2540;
    if (!_2476)
    {
        _2532 = _2392;
    }
    float _2544 = _2532;
    bool _2546 = !_2476;
    float _2548 = _2544;
    if (!_2546)
    {
        float _2550 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2554 = _2448 + _2552;
        float _2556 = rsqrt(_2432);
        float _2558 = _2554 * _2550;
        float _2560 = _2464 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2562 = _2558 * 0.15915493667125701904296875;
        float _2564 = _2562 * 6.283185482025146484375;
        float _2566 = sin(_2564);
        float _2568 = _2562 * 6.283185482025146484375;
        float _2570 = cos(_2568);
        float _2572 = fma(_2566, _2560, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2574 = _2556 * _2572;
        float _2576 = _2570 + (-1.0);
        float _2578 = fma(_2412, _2574, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2580 = fma(_2398, _2574, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2582 = _2576 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2584 = fma(_2464, _2570, _2582);
        _2548 = _2578;
        _2534 = _2584;
        _2514 = _2580;
    }
    float _2586 = _2548;
    float _2588 = _2534;
    float _2590 = _2514;
    float _2592 = -_2148;
    float _2594 = fma(_2592, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2586);
    bool _2596 = _2540 > 0.0;
    bool _2598 = isnan(_2540);
    bool _2600 = _2596 || _2598;
    bool _2602 = isnan(0.0);
    bool _2604 = _2600 || _2602;
    float _2606 = _2540 * _2528;
    float _2608 = -_2146;
    float _2610 = fma(_2608, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2588);
    float _2612 = -_2154;
    float _2614 = fma(_2612, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2590);
    float _2616 = _2610;
    float _2618 = _2614;
    if (_2408)
    {
        _2542 = _2594;
    }
    float _2620 = _2542;
    float _2622 = _2620;
    if (!_2408)
    {
        float _2624 = _2164 * _2164;
        float _2626 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2628 = -_1386;
        float _2630 = _2628 + _2590;
        float _2632 = -_1374;
        float _2634 = _2632 + _2586;
        float _2636 = fma(_2172, _2172, _2624);
        float _2638 = fma(_2182, _2182, _2636);
        float _2640 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2642 = sqrt(_2638);
        float _2644 = 1.0 / _2276;
        float _2646 = _2640 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2648 = precise::min(_2642, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2650 = _2648 * _2626;
        float _2652 = _2650 * _2644;
        float _2654 = -_1740;
        float _2656 = _2654 + _2588;
        float _2658 = _2646 * _2652;
        float _2660 = _2630 * _2652;
        float _2662 = fma(_2634, _2658, _2158);
        float _2664 = fma(_2656, _2658, _2152);
        float _2666 = fma(_2646, _2660, _2168);
        _2616 = _2664;
        _2622 = _2662;
        _2618 = _2666;
    }
    float _2668 = _2616;
    float _2670 = _2622;
    float _2672 = _2618;
    float _2674 = _2668 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    bool _2676 = _2528 <= 0.0;
    bool _2678 = !_2604;
    bool _2680 = _2676 || _2678;
    float _2682 = _2668 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2684 = _2668 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2686 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2674);
    float _2688 = _2668 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2690 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2682);
    float _2692 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2684);
    float _2694 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2686);
    float _2696 = fma(_2670, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2688);
    float _2698 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2690);
    float _2700 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2692);
    float _2702 = _2694 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2704 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2696);
    float _2706 = _2698 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2708 = _2700 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2710 = _2702 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2712 = _2702 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2714 = _2702 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2716 = _2702 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2718 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2710);
    float _2720 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2712);
    float _2722 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2714);
    float _2724 = _2704 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2726 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2718);
    float _2728 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2720);
    float _2730 = fma(_2706, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2716);
    float _2732 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2722);
    float _2734 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2726);
    float _2736 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2728);
    float _2738 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2730);
    float _2740 = _2606 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2742 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2732);
    float _2744 = _2734 + _2736;
    float _2746 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2738);
    float _2748 = _2740 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2750 = _2744 * 0.5;
    out.m_33.x = _2748;
    out.gl_Position.x = _2742;
    out.gl_Position.y = _2746;
    out.gl_Position.z = _2734;
    out.gl_Position.w = _2736;
    out.m_58.z = _2750;
    out.m_58.w = _2736;
    if (!_2680)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2752 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_33.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2752;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

