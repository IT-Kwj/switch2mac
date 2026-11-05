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
    float4 m_52 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_54 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_50 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_48 [[attribute(1)]];
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_44 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1251 = false;
    bool _399 = false;
    bool _289 = false;
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
    int _91 = _89;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1586 = as_type<float>(_89);
        out.gl_Position.z = _1586;
    }
    if (!_77)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _93 = in.m_37.w;
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
        out.m_35.x = 0.0;
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
        float _1656 = as_type<float>(_127);
        out.gl_Position.z = _1656;
    }
    if (_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = as_type<float>(int(gl_VertexIndex));
    float _131 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _133 = in.m_42.w;
    bool _135 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _137 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _139 = _135 || _137;
    bool _141 = isnan(1.0);
    bool _143 = _139 || _141;
    float _145 = in.m_37.x;
    float _147 = in.m_37.y;
    float _149 = in.m_37.z;
    float _151 = in.m_32.x;
    float _153 = in.m_32.y;
    float _155 = in.m_32.z;
    float _157 = 0.0;
    float _159 = _131;
    if (!_143)
    {
        float _161 = _131 * _131;
        float _163 = _161 * 0.5;
        _157 = _163;
    }
    float _165 = _157;
    float _167 = _165;
    if (!_143)
    {
        float _169 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _167 = _169;
    }
    float _171 = _167;
    int _173 = as_type<int>(_129) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_129) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_143;
    float _191 = _171;
    if (!_189)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _131 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _131);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _221;
    }
    float _223 = _191;
    bool _225 = !_143;
    if (!_225)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = 1.0 / _233;
        float _237 = _131 * _229;
        float _239 = exp2(_237);
        float _241 = -_239;
        float _243 = _241 + 1.0;
        float _245 = _243 * _235;
        _159 = _245;
    }
    float _247 = _159;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _251 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _253 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _255 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _257 = fma(_247, _145, _251);
    float _259 = fma(_247, _147, _253);
    float _261 = fma(_247, _149, _255);
    float _263 = fma(_257, _133, _151);
    float _265 = fma(_259, _133, _153);
    float _267 = fma(_261, _133, _155);
    bool _269 = !_249;
    float _287;
    if (!_269)
    {
        float _271 = in.m_44.x;
        float _273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _275 = _271 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _279 = _277 * _273;
        float _281 = floor(_279);
        float _283 = -_281;
        float _285 = _279 + _283;
        _287 = _285;
        _289 = true;
    }
    else
    {
        float _291 = float(_73);
        float _293 = 1.0 / _291;
        float _295 = _107 * _293;
        _287 = _295;
    }
    _289 = false;
    float _297 = _287;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = _297 + _299;
    float _303 = in.m_42.x;
    float _305 = in.m_42.y;
    bool _307 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _309 = isnan(_297);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _319;
    bool _323 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _325 = 1.0 / _321;
    float _327 = -_317;
    float _329 = _327 + 1.0;
    float _331 = _301 * _325;
    bool _333 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _335 = isnan(_297);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _349;
    float _353 = _343 * _329;
    float _355 = fma(_347, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _357 = fma(_351, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _359 = -_343;
    float _361 = _359 + 1.0;
    float _363 = _355 * _353;
    float _365 = _357 * _353;
    float _367 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].x, _363);
    float _369 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].y, _365);
    float _371 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[144].x, _367);
    float _373 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[144].y, _369);
    float _375 = _371 * _303;
    float _377 = _373 * _305;
    bool _379 = !_323;
    float _397;
    if (!_379)
    {
        float _381 = in.m_44.x;
        float _383 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _385 = _381 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _387 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _389 = _387 * _383;
        float _391 = floor(_389);
        float _393 = -_391;
        float _395 = _389 + _393;
        _397 = _395;
        _399 = true;
    }
    else
    {
        float _401 = float(_73);
        float _403 = 1.0 / _401;
        float _405 = _107 * _403;
        _397 = _405;
    }
    _399 = false;
    float _407 = _397;
    float _409 = _265 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _411 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _413 = log2(_411);
    float _415 = in.m_44.z;
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _419 = _417 != 0;
    float _421 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].x, _409);
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _425 = _423 != 0;
    float _427 = _265 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _429 = _265 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _431 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].z, _421);
    float _433 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].x, _427);
    float _435 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].x, _429);
    float _437 = in.m_44.x;
    float _439 = in.m_44.y;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _445 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].z, _435);
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _449 = _447 != 0;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _453 = _451 != 0;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _457 = _455 != 0;
    float _459 = 1.0 / _443;
    float _461 = _413 * _107;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _467 = _431 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _469 = _445 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _471 = 1.0 / _465;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _479 = _415 * 2.0;
    float _481 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].z, _433);
    float _483 = exp2(_461);
    float _485 = _473 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _487;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _493 = _475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _495 = _477 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _497 = _437 > 0.5;
    float _499 = _489 * _459;
    float _501 = floor(_479);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _507 = -_183;
    int _509 = _497 ? as_type<int>(_507) : as_type<int>(_183);
    out.m_46.x = _493;
    out.m_46.y = _485;
    out.m_46.z = _495;
    out.m_46.w = _491;
    bool _511 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _513 = isnan(_407);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _525 = 1.0 + _523;
    float _527 = _505 * _471;
    float _529 = -_483;
    float _531 = _529 + 1.0;
    bool _533 = !_419;
    float _535 = _533 ? _183 : as_type<float>(_509);
    float _537 = 1.0 / _525;
    bool _539 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _541 = isnan(0.0);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _547 = _543 || _545;
    float _549 = _481 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _551 = _535 + 0.5;
    bool _553 = _439 > 0.5;
    float _555 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _557 = _467 + _555;
    bool _559 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _561 = isnan(1.0);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _567 = _563 || _565;
    float _569 = _439 + _437;
    float _571 = _437 * 2.0;
    bool _573 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _575 = isnan(_407);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = -_521;
    float _587 = _585 + 1.0;
    float _589 = _569 + (-1.0);
    float _591 = _547 ? _531 : 0.0;
    float _593 = floor(_571);
    float _595 = _583 * _587;
    float _597 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _599 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _601 = isnan(_407);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = -_583;
    float _613 = _611 + 1.0;
    float _615 = -_187;
    int _617 = _553 ? as_type<int>(_615) : as_type<int>(_187);
    if (_567)
    {
        float _619 = _591 * _537;
        _109 = _619;
    }
    float _621 = _109;
    bool _623 = _501 > 0.0;
    float _625 = _609 * _613;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _629 = _407 + _627;
    bool _631 = _501 >= 0.0;
    bool _633 = isnan(_501);
    bool _635 = _631 || _633;
    bool _637 = isnan(0.0);
    bool _639 = _635 || _637;
    float _641 = _439 * 2.0;
    float _643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _645 = fma(_499, _629, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _647 = !_425;
    float _649 = _647 ? _187 : as_type<float>(_617);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _653 = _407 + _651;
    float _655 = -_609;
    float _657 = _655 + 1.0;
    float _659 = _645 * _625;
    bool _661 = _593 >= 0.0;
    bool _663 = isnan(_593);
    bool _665 = _661 || _663;
    bool _667 = isnan(0.0);
    bool _669 = _665 || _667;
    float _671 = -_649;
    float _673 = _671 + 0.5;
    float _675 = floor(_641);
    float _677 = fma(_527, _653, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _679 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[115].x, _659);
    float _681 = _551 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _683 = _673 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _685 = _593 > 0.0;
    float _687 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _689 = _549 + _687;
    float _691 = _557 * _557;
    float _693 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _695 = _639 ? 0 : 1;
    float _697 = _681 * _643;
    int _699 = _669 ? 0 : 1;
    float _701 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _703 = _469 + _701;
    int _705 = ~_695;
    int _707 = _705 + 1;
    int _709 = _707 + 1;
    float _711 = fma(_677, _595, _679);
    int _713 = _709;
    if (!_623)
    {
        int _715 = ~_695;
        int _717 = _715 + 1;
        _713 = _717;
    }
    int _719 = _713;
    bool _721 = _675 > 0.0;
    float _723 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[117].x, _711);
    bool _725 = _675 >= 0.0;
    bool _727 = isnan(_675);
    bool _729 = _725 || _727;
    bool _731 = isnan(0.0);
    bool _733 = _729 || _731;
    float _735 = _557 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _737 = ~_699;
    int _739 = _737 + 1;
    int _741 = _739 + 1;
    int _743 = _733 ? 0 : 1;
    float _745 = _683 * _693;
    float _747 = fma(_689, _689, _691);
    float _749 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[28].x, _735);
    int _751 = _741;
    if (!_685)
    {
        int _753 = ~_699;
        int _755 = _753 + 1;
        _751 = _755;
    }
    int _757 = _751;
    float _759 = fma(_703, _703, _747);
    float _761 = fma(_703, (*spvDescriptorSet0.vp_c8)._m0[28].z, _749);
    int _763 = ~_743;
    int _765 = _763 + 1;
    int _767 = _765 + 1;
    float _769 = in.m_48.x;
    float _771 = in.m_48.y;
    float _773 = in.m_48.z;
    float _775 = rsqrt(_759);
    bool _777 = _761 >= 0.0;
    out.m_50.x = _697;
    out.m_50.y = _745;
    int _779 = _767;
    if (!_721)
    {
        int _781 = ~_743;
        int _783 = _781 + 1;
        _779 = _783;
    }
    int _785 = _779;
    bool _787 = !_449;
    int _789 = _787 ? 0 : 1;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _793 = float(_719);
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _797 = !_453;
    int _799 = _797 ? 0 : 1;
    if (_777)
    {
        out.m_35.x = 0.0;
    }
    int _801 = abs(_789);
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _805 = abs(_799);
    float _807 = _557 * _775;
    float _809 = _791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _811 = _803 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _813 = float(_801);
    float _815 = _689 * _775;
    float _817 = -_807;
    float _819 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[18].w, _557);
    float _821 = float(_805);
    float _823 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _825 = float(_757);
    float _827 = -_815;
    float _829 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[18].w, _689);
    float _831 = _819 * _819;
    float _833 = _813 * _793;
    float _835 = 0.0;
    int _837 = as_type<int>(_833);
    if (_777)
    {
        _835 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _839 = _835;
    float _841 = _723 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _843 = _821 * _825;
    float _845 = fma(_829, _829, _831);
    float _847 = _833 * (-2.0);
    float _849 = _703 * _775;
    if (_777)
    {
        float _851 = _839 * 5.0;
        _837 = as_type<int>(_851);
    }
    int _853 = _837;
    float _855 = _437 + (-0.5);
    float _857 = fma(_847, _769, _769);
    float _859 = -_849;
    float _861 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[18].w, _703);
    out.m_52.x = _809;
    out.m_52.y = _823;
    out.m_52.z = _811;
    out.m_52.w = _841;
    float _863 = fma(_597, _847, _597);
    float _865 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[196].x, _857);
    float _867 = fma(_861, _861, _845);
    float _869 = _773;
    if (_777)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2817 = as_type<float>(_853);
        out.gl_Position.z = _2817;
    }
    bool _871 = !_457;
    int _873 = _871 ? 0 : 1;
    if (_777)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _875 = -_807;
    float _877 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[18].w, _467);
    float _879 = -_815;
    float _881 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[18].w, _549);
    float _883 = -_849;
    float _885 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[18].w, _469);
    int _887 = abs(_873);
    float _889 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _891 = _877 + _889;
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _895 = _881 + _893;
    float _897 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _899 = _885 + _897;
    float _901 = _439 + _415;
    float _903 = _891 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _905 = _439 + (-0.5);
    float _907 = float(_887);
    float _909 = _901 + (-1.0);
    float _911 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[28].x, _903);
    float _913 = float(_785);
    float _915 = _843 * (-2.0);
    float _917 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _919 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[28].z, _911);
    float _921 = _415 + _437;
    float _923 = _907 * _913;
    float _925 = fma(_917, _915, _917);
    float _927 = fma(_863, _621, _865);
    bool _929 = _919 >= 0.0;
    float _931 = fma(_915, _771, _771);
    float _933 = _921 + (-1.0);
    float _935 = _923 * (-2.0);
    float _937 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[196].y, _931);
    float _939 = _927 * 0.15915493667125701904296875;
    float _941 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _943 = fma(_935, _773, _773);
    float _945 = fma(_925, _621, _937);
    float _947 = _415 + (-0.5);
    float _949 = fma(_941, _935, _941);
    float _951 = sqrt(_867);
    float _953 = _945 * 0.15915493667125701904296875;
    if (_929)
    {
        _869 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _955 = _869;
    float _957 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[196].z, _943);
    int _959 = as_type<int>(_955);
    if (_929)
    {
        out.m_35.x = 0.0;
    }
    if (_929)
    {
        float _961 = _955 * 5.0;
        _959 = as_type<int>(_961);
    }
    int _963 = _959;
    float _965 = _939 * 6.283185482025146484375;
    float _967 = sin(_965);
    float _969 = fma(_949, _621, _957);
    if (_929)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2996 = as_type<float>(_963);
        out.gl_Position.z = _2996;
    }
    float _971 = _969 * 0.15915493667125701904296875;
    float _973 = _939 * 6.283185482025146484375;
    float _975 = cos(_973);
    float _977 = _953 * 6.283185482025146484375;
    float _979 = sin(_977);
    float _981 = _953 * 6.283185482025146484375;
    float _983 = cos(_981);
    if (_929)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _985 = _971 * 6.283185482025146484375;
    float _987 = cos(_985);
    float _989 = _775 * _951;
    float _991 = _377 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _993 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _995 = _375 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _997 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _999 = _989 * _991;
    float _1001 = _975 * _983;
    float _1003 = _971 * 6.283185482025146484375;
    float _1005 = sin(_1003);
    float _1007 = _989 * _995;
    float _1009 = _993 * _999;
    float _1011 = _967 * _979;
    float _1013 = _975 * _979;
    float _1015 = _997 * _1007;
    float _1017 = _989 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1019 = _1017 * 0.5;
    float _1021 = _987 * _1009;
    float _1023 = _979 * _987;
    float _1025 = _983 * _987;
    float _1027 = _967 * _983;
    float _1029 = _975 * _1021;
    float _1031 = fma(_1005, _1001, _1011);
    float _1033 = -_1009;
    float _1035 = _1005 * _1033;
    float _1037 = -_1027;
    float _1039 = fma(_1005, _1013, _1037);
    float _1041 = -_1013;
    float _1043 = fma(_1005, _1027, _1041);
    float _1045 = fma(_1031, _1015, _1029);
    float _1047 = _967 * _1021;
    float _1049 = fma(_1025, _1015, _1035);
    float _1051 = fma(_1005, _1011, _1001);
    float _1053 = fma(_1039, _1019, _1045);
    float _1055 = fma(_1043, _1015, _1047);
    float _1057 = fma(_1023, _1019, _1049);
    float _1059 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1061 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1063 = fma(_1051, _1019, _1055);
    float _1065 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1059);
    float _1067 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1061);
    float _1069 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1065);
    float _1071 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1067);
    float _1073 = _1069 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1075 = _1071 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1077 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1079 = _549 + _1073;
    float _1081 = _469 + _1075;
    float _1083 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1077);
    float _1085 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1087 = _1079 + _1085;
    float _1089 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1091 = _1081 + _1089;
    float _1093 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1083);
    float _1095 = _1087 * _1087;
    float _1097 = _1091 * _1091;
    float _1099 = _1093 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1101 = _1095 + _1097;
    float _1103 = _467 + _1099;
    float _1105 = sqrt(_1101);
    bool _1107 = _1105 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1109 = _1063;
    float _1111 = _1079;
    float _1113 = _1099;
    float _1115 = _1081;
    float _1117 = _1097;
    if (!_1107)
    {
        _1109 = _1079;
    }
    float _1119 = _1109;
    float _1121 = _1119;
    if (!_1107)
    {
        _1111 = _1081;
    }
    float _1123 = _1111;
    float _1125 = _1123;
    if (!_1107)
    {
        _1113 = _1095;
    }
    float _1127 = _1113;
    float _1129 = _1127;
    if (!_1107)
    {
        _1115 = _1103;
    }
    float _1131 = _1115;
    bool _1133 = !_1107;
    float _1135 = _1131;
    if (!_1133)
    {
        float _1137 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1139 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1141 = _1105 + _1139;
        float _1143 = rsqrt(_1101);
        float _1145 = _1141 * _1137;
        float _1147 = _1103 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1149 = _1145 * 0.15915493667125701904296875;
        float _1151 = _1149 * 6.283185482025146484375;
        float _1153 = sin(_1151);
        float _1155 = _1149 * 6.283185482025146484375;
        float _1157 = cos(_1155);
        float _1159 = fma(_1153, _1147, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1161 = _1143 * _1159;
        float _1163 = _1157 + (-1.0);
        float _1165 = fma(_1087, _1161, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1167 = fma(_1091, _1161, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1169 = _1163 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1173 = _1165 + _1171;
        float _1175 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1177 = _1167 + _1175;
        float _1179 = fma(_1103, _1157, _1169);
        float _1181 = _1173 * _1173;
        float _1183 = _1177 * _1177;
        _1135 = _1179;
        _1129 = _1181;
        _1117 = _1183;
        _1121 = _1165;
        _1125 = _1167;
    }
    float _1185 = _1135;
    float _1187 = _1129;
    float _1189 = _1117;
    float _1191 = _1121;
    float _1193 = _1125;
    float _1195 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1197 = _1185 + _1195;
    float _1199 = fma(_1197, _1197, _1187);
    float _1201 = _1199 + _1189;
    float _1203 = sqrt(_1201);
    bool _1205 = _1203 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1207 = isnan(_1203);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1213 = _1209 || _1211;
    float _1215 = _1187;
    if (!_1213)
    {
        _1215 = 1.0;
    }
    float _1217 = _1215;
    bool _1219 = !_1213;
    float _1221 = _1217;
    if (!_1219)
    {
        bool _1223 = _1203 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1225 = isnan(_1203);
        bool _1227 = _1223 || _1225;
        bool _1229 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1231 = _1227 || _1229;
        if (!_1231)
        {
            float _1233 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1235 = _1203 + _1233;
            float _1237 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1239 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1237;
            float _1241 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1243 = _1241 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1245 = 1.0 / _1239;
            float _1247 = _1235 * _1245;
            float _1249 = fma(_1247, _1243, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1221 = _1249;
            _1251 = true;
        }
        else
        {
            bool _1253 = _1203 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1255 = isnan(_1203);
            bool _1257 = _1253 || _1255;
            bool _1259 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1261 = _1257 || _1259;
            if (!_1261)
            {
                float _1263 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1265 = _1203 + _1263;
                float _1267 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1269 = _1267 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1271 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1273 = _1271 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1275 = 1.0 / _1269;
                float _1277 = _1265 * _1275;
                float _1279 = fma(_1277, _1273, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1221 = _1279;
                _1251 = true;
            }
            else
            {
                _1221 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1251 = false;
    float _1281 = _1221;
    float _1283 = _877 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1285 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1287 = _1191 + _1285;
    float _1289 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1291 = _1193 + _1289;
    float _1293 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1283);
    bool _1295 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1297 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan(0.5);
    bool _1303 = _1299 || _1301;
    float _1305 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1307 = _1185 + _1305;
    float _1309 = _877 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1311 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1293);
    float _1313 = fma(_1287, _1281, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1315 = fma(_1307, _1281, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1317 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1309);
    float _1319 = _1311 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1321 = -_815;
    float _1323 = fma(_1321, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1313);
    float _1325 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1317);
    float _1327 = 1.0 / _1319;
    float _1329 = fma(_1291, _1281, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _1331 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1333 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1335 = _1331 || _1333;
    bool _1337 = isnan(0.5);
    bool _1339 = _1335 || _1337;
    float _1341 = _1325 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1343 = -_807;
    float _1345 = fma(_1343, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1315);
    float _1347 = -_849;
    float _1349 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1329);
    float _1351 = _1341 + _1319;
    float _1353 = _1341;
    float _1355 = _1345;
    float _1357 = _1349;
    if (_1303)
    {
        _1353 = _1323;
    }
    float _1359 = _1353;
    float _1361 = _1359;
    if (!_1303)
    {
        float _1363 = _891 * _891;
        float _1365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1367 = -_469;
        float _1369 = _1367 + _1329;
        float _1371 = -_549;
        float _1373 = _1371 + _1313;
        float _1375 = fma(_895, _895, _1363);
        float _1377 = -_467;
        float _1379 = _1377 + _1315;
        float _1381 = fma(_899, _899, _1375);
        float _1383 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1385 = sqrt(_1381);
        float _1387 = 1.0 / _989;
        float _1389 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1391 = precise::min(_1385, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1393 = _1391 * _1365;
        float _1395 = _1393 * _1387;
        float _1397 = _1389 * _1395;
        float _1399 = _1369 * _1395;
        float _1401 = fma(_1373, _1397, _881);
        float _1403 = fma(_1379, _1397, _877);
        float _1405 = fma(_1389, _1399, _885);
        _1355 = _1403;
        _1361 = _1401;
        _1357 = _1405;
    }
    float _1407 = _1355;
    float _1409 = _1361;
    float _1411 = _1357;
    float _1413 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1415 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1417 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1419 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1421 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1413);
    float _1423 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1415);
    float _1425 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1417);
    float _1427 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1419);
    float _1429 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1421);
    float _1431 = _1351 * _1327;
    float _1433 = _1431 * 0.5;
    float _1435 = _1421;
    if (_1339)
    {
        _1435 = 1.0;
    }
    float _1437 = _1435;
    float _1439 = _1437;
    if (!_1339)
    {
        float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1443 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1441);
        float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1447 = _1445 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _1449 = 1.0 / _1443;
        float _1451 = 1.0 / _1447;
        float _1453 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1457 = fma(_1449, _1453, _1455);
        float _1459 = _1457 * _1451;
        float _1461 = precise::clamp(_1459, 0.0, 1.0);
        _1439 = _1461;
    }
    float _1463 = _1439;
    float _1465 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1423);
    float _1467 = _1429 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1469 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1425);
    float _1471 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1427);
    float _1473 = _1465 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1475 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1477 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1479 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1481 = _1469 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1483 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1475);
    float _1485 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1477);
    float _1487 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1489 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1479);
    float _1491 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1493 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1483);
    float _1495 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1485);
    float _1497 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1487);
    float _1499 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1489);
    float _1501 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1493);
    float _1503 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1495);
    bool _1505 = _1463 > 0.0;
    bool _1507 = isnan(_1463);
    bool _1509 = _1505 || _1507;
    bool _1511 = isnan(0.0);
    bool _1513 = _1509 || _1511;
    float _1515 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1497);
    float _1517 = _1463 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1519 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1499);
    float _1521 = _1501 + _1503;
    float _1523 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1515);
    float _1525 = _1517 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1527 = _1521 * 0.5;
    out.m_35.x = _1525;
    out.gl_Position.x = _1519;
    out.gl_Position.y = _1523;
    out.gl_Position.z = _1501;
    out.gl_Position.w = _1503;
    out.m_54.z = _1527;
    out.m_54.w = _1503;
    if (_1513)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _1529 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1529;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1251 = false;
    bool _399 = false;
    bool _289 = false;
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
    int _91 = _89;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1586 = as_type<float>(_89);
        out.gl_Position.z = _1586;
    }
    if (!_77)
    {
        return out;
    }
    float _93 = in.m_37.w;
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
        out.m_35.x = 0.0;
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
        float _1656 = as_type<float>(_127);
        out.gl_Position.z = _1656;
    }
    if (_119)
    {
        return out;
    }
    float _129 = as_type<float>(int(gl_VertexIndex));
    float _131 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _133 = in.m_42.w;
    bool _135 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _137 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _139 = _135 || _137;
    bool _141 = isnan(1.0);
    bool _143 = _139 || _141;
    float _145 = in.m_37.x;
    float _147 = in.m_37.y;
    float _149 = in.m_37.z;
    float _151 = in.m_32.x;
    float _153 = in.m_32.y;
    float _155 = in.m_32.z;
    float _157 = 0.0;
    float _159 = _131;
    if (!_143)
    {
        float _161 = _131 * _131;
        float _163 = _161 * 0.5;
        _157 = _163;
    }
    float _165 = _157;
    float _167 = _165;
    if (!_143)
    {
        float _169 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _167 = _169;
    }
    float _171 = _167;
    int _173 = as_type<int>(_129) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_129) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_143;
    float _191 = _171;
    if (!_189)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _131 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _131);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _221;
    }
    float _223 = _191;
    bool _225 = !_143;
    if (!_225)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = 1.0 / _233;
        float _237 = _131 * _229;
        float _239 = exp2(_237);
        float _241 = -_239;
        float _243 = _241 + 1.0;
        float _245 = _243 * _235;
        _159 = _245;
    }
    float _247 = _159;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _251 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _253 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _255 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _257 = fma(_247, _145, _251);
    float _259 = fma(_247, _147, _253);
    float _261 = fma(_247, _149, _255);
    float _263 = fma(_257, _133, _151);
    float _265 = fma(_259, _133, _153);
    float _267 = fma(_261, _133, _155);
    bool _269 = !_249;
    float _287;
    if (!_269)
    {
        float _271 = in.m_44.x;
        float _273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _275 = _271 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _279 = _277 * _273;
        float _281 = floor(_279);
        float _283 = -_281;
        float _285 = _279 + _283;
        _287 = _285;
        _289 = true;
    }
    else
    {
        float _291 = float(_73);
        float _293 = 1.0 / _291;
        float _295 = _107 * _293;
        _287 = _295;
    }
    _289 = false;
    float _297 = _287;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = _297 + _299;
    float _303 = in.m_42.x;
    float _305 = in.m_42.y;
    bool _307 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _309 = isnan(_297);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _319;
    bool _323 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _325 = 1.0 / _321;
    float _327 = -_317;
    float _329 = _327 + 1.0;
    float _331 = _301 * _325;
    bool _333 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _335 = isnan(_297);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _349;
    float _353 = _343 * _329;
    float _355 = fma(_347, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _357 = fma(_351, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _359 = -_343;
    float _361 = _359 + 1.0;
    float _363 = _355 * _353;
    float _365 = _357 * _353;
    float _367 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].x, _363);
    float _369 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].y, _365);
    float _371 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[144].x, _367);
    float _373 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[144].y, _369);
    float _375 = _371 * _303;
    float _377 = _373 * _305;
    bool _379 = !_323;
    float _397;
    if (!_379)
    {
        float _381 = in.m_44.x;
        float _383 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _385 = _381 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _387 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _389 = _387 * _383;
        float _391 = floor(_389);
        float _393 = -_391;
        float _395 = _389 + _393;
        _397 = _395;
        _399 = true;
    }
    else
    {
        float _401 = float(_73);
        float _403 = 1.0 / _401;
        float _405 = _107 * _403;
        _397 = _405;
    }
    _399 = false;
    float _407 = _397;
    float _409 = _265 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _411 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _413 = log2(_411);
    float _415 = in.m_44.z;
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _419 = _417 != 0;
    float _421 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].x, _409);
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _425 = _423 != 0;
    float _427 = _265 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _429 = _265 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _431 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].z, _421);
    float _433 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].x, _427);
    float _435 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].x, _429);
    float _437 = in.m_44.x;
    float _439 = in.m_44.y;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _445 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].z, _435);
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _449 = _447 != 0;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _453 = _451 != 0;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _457 = _455 != 0;
    float _459 = 1.0 / _443;
    float _461 = _413 * _107;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _467 = _431 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _469 = _445 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _471 = 1.0 / _465;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _479 = _415 * 2.0;
    float _481 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].z, _433);
    float _483 = exp2(_461);
    float _485 = _473 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _487;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _493 = _475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _495 = _477 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _497 = _437 > 0.5;
    float _499 = _489 * _459;
    float _501 = floor(_479);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _507 = -_183;
    int _509 = _497 ? as_type<int>(_507) : as_type<int>(_183);
    out.m_46.x = _493;
    out.m_46.y = _485;
    out.m_46.z = _495;
    out.m_46.w = _491;
    bool _511 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _513 = isnan(_407);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _525 = 1.0 + _523;
    float _527 = _505 * _471;
    float _529 = -_483;
    float _531 = _529 + 1.0;
    bool _533 = !_419;
    float _535 = _533 ? _183 : as_type<float>(_509);
    float _537 = 1.0 / _525;
    bool _539 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _541 = isnan(0.0);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _547 = _543 || _545;
    float _549 = _481 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _551 = _535 + 0.5;
    bool _553 = _439 > 0.5;
    float _555 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _557 = _467 + _555;
    bool _559 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _561 = isnan(1.0);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _567 = _563 || _565;
    float _569 = _439 + _437;
    float _571 = _437 * 2.0;
    bool _573 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _575 = isnan(_407);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = -_521;
    float _587 = _585 + 1.0;
    float _589 = _569 + (-1.0);
    float _591 = _547 ? _531 : 0.0;
    float _593 = floor(_571);
    float _595 = _583 * _587;
    float _597 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _599 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _601 = isnan(_407);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = -_583;
    float _613 = _611 + 1.0;
    float _615 = -_187;
    int _617 = _553 ? as_type<int>(_615) : as_type<int>(_187);
    if (_567)
    {
        float _619 = _591 * _537;
        _109 = _619;
    }
    float _621 = _109;
    bool _623 = _501 > 0.0;
    float _625 = _609 * _613;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _629 = _407 + _627;
    bool _631 = _501 >= 0.0;
    bool _633 = isnan(_501);
    bool _635 = _631 || _633;
    bool _637 = isnan(0.0);
    bool _639 = _635 || _637;
    float _641 = _439 * 2.0;
    float _643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _645 = fma(_499, _629, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _647 = !_425;
    float _649 = _647 ? _187 : as_type<float>(_617);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _653 = _407 + _651;
    float _655 = -_609;
    float _657 = _655 + 1.0;
    float _659 = _645 * _625;
    bool _661 = _593 >= 0.0;
    bool _663 = isnan(_593);
    bool _665 = _661 || _663;
    bool _667 = isnan(0.0);
    bool _669 = _665 || _667;
    float _671 = -_649;
    float _673 = _671 + 0.5;
    float _675 = floor(_641);
    float _677 = fma(_527, _653, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _679 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[115].x, _659);
    float _681 = _551 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _683 = _673 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _685 = _593 > 0.0;
    float _687 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _689 = _549 + _687;
    float _691 = _557 * _557;
    float _693 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _695 = _639 ? 0 : 1;
    float _697 = _681 * _643;
    int _699 = _669 ? 0 : 1;
    float _701 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _703 = _469 + _701;
    int _705 = ~_695;
    int _707 = _705 + 1;
    int _709 = _707 + 1;
    float _711 = fma(_677, _595, _679);
    int _713 = _709;
    if (!_623)
    {
        int _715 = ~_695;
        int _717 = _715 + 1;
        _713 = _717;
    }
    int _719 = _713;
    bool _721 = _675 > 0.0;
    float _723 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[117].x, _711);
    bool _725 = _675 >= 0.0;
    bool _727 = isnan(_675);
    bool _729 = _725 || _727;
    bool _731 = isnan(0.0);
    bool _733 = _729 || _731;
    float _735 = _557 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _737 = ~_699;
    int _739 = _737 + 1;
    int _741 = _739 + 1;
    int _743 = _733 ? 0 : 1;
    float _745 = _683 * _693;
    float _747 = fma(_689, _689, _691);
    float _749 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[28].x, _735);
    int _751 = _741;
    if (!_685)
    {
        int _753 = ~_699;
        int _755 = _753 + 1;
        _751 = _755;
    }
    int _757 = _751;
    float _759 = fma(_703, _703, _747);
    float _761 = fma(_703, (*spvDescriptorSet0.vp_c8)._m0[28].z, _749);
    int _763 = ~_743;
    int _765 = _763 + 1;
    int _767 = _765 + 1;
    float _769 = in.m_48.x;
    float _771 = in.m_48.y;
    float _773 = in.m_48.z;
    float _775 = rsqrt(_759);
    bool _777 = _761 >= 0.0;
    out.m_50.x = _697;
    out.m_50.y = _745;
    int _779 = _767;
    if (!_721)
    {
        int _781 = ~_743;
        int _783 = _781 + 1;
        _779 = _783;
    }
    int _785 = _779;
    bool _787 = !_449;
    int _789 = _787 ? 0 : 1;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _793 = float(_719);
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _797 = !_453;
    int _799 = _797 ? 0 : 1;
    if (_777)
    {
        out.m_35.x = 0.0;
    }
    int _801 = abs(_789);
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _805 = abs(_799);
    float _807 = _557 * _775;
    float _809 = _791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _811 = _803 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _813 = float(_801);
    float _815 = _689 * _775;
    float _817 = -_807;
    float _819 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[18].w, _557);
    float _821 = float(_805);
    float _823 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _825 = float(_757);
    float _827 = -_815;
    float _829 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[18].w, _689);
    float _831 = _819 * _819;
    float _833 = _813 * _793;
    float _835 = 0.0;
    int _837 = as_type<int>(_833);
    if (_777)
    {
        _835 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _839 = _835;
    float _841 = _723 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _843 = _821 * _825;
    float _845 = fma(_829, _829, _831);
    float _847 = _833 * (-2.0);
    float _849 = _703 * _775;
    if (_777)
    {
        float _851 = _839 * 5.0;
        _837 = as_type<int>(_851);
    }
    int _853 = _837;
    float _855 = _437 + (-0.5);
    float _857 = fma(_847, _769, _769);
    float _859 = -_849;
    float _861 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[18].w, _703);
    out.m_52.x = _809;
    out.m_52.y = _823;
    out.m_52.z = _811;
    out.m_52.w = _841;
    float _863 = fma(_597, _847, _597);
    float _865 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[196].x, _857);
    float _867 = fma(_861, _861, _845);
    float _869 = _773;
    if (_777)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2817 = as_type<float>(_853);
        out.gl_Position.z = _2817;
    }
    bool _871 = !_457;
    int _873 = _871 ? 0 : 1;
    if (_777)
    {
        return out;
    }
    float _875 = -_807;
    float _877 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[18].w, _467);
    float _879 = -_815;
    float _881 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[18].w, _549);
    float _883 = -_849;
    float _885 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[18].w, _469);
    int _887 = abs(_873);
    float _889 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _891 = _877 + _889;
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _895 = _881 + _893;
    float _897 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _899 = _885 + _897;
    float _901 = _439 + _415;
    float _903 = _891 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _905 = _439 + (-0.5);
    float _907 = float(_887);
    float _909 = _901 + (-1.0);
    float _911 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[28].x, _903);
    float _913 = float(_785);
    float _915 = _843 * (-2.0);
    float _917 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _919 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[28].z, _911);
    float _921 = _415 + _437;
    float _923 = _907 * _913;
    float _925 = fma(_917, _915, _917);
    float _927 = fma(_863, _621, _865);
    bool _929 = _919 >= 0.0;
    float _931 = fma(_915, _771, _771);
    float _933 = _921 + (-1.0);
    float _935 = _923 * (-2.0);
    float _937 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[196].y, _931);
    float _939 = _927 * 0.15915493667125701904296875;
    float _941 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _943 = fma(_935, _773, _773);
    float _945 = fma(_925, _621, _937);
    float _947 = _415 + (-0.5);
    float _949 = fma(_941, _935, _941);
    float _951 = sqrt(_867);
    float _953 = _945 * 0.15915493667125701904296875;
    if (_929)
    {
        _869 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _955 = _869;
    float _957 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[196].z, _943);
    int _959 = as_type<int>(_955);
    if (_929)
    {
        out.m_35.x = 0.0;
    }
    if (_929)
    {
        float _961 = _955 * 5.0;
        _959 = as_type<int>(_961);
    }
    int _963 = _959;
    float _965 = _939 * 6.283185482025146484375;
    float _967 = sin(_965);
    float _969 = fma(_949, _621, _957);
    if (_929)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2996 = as_type<float>(_963);
        out.gl_Position.z = _2996;
    }
    float _971 = _969 * 0.15915493667125701904296875;
    float _973 = _939 * 6.283185482025146484375;
    float _975 = cos(_973);
    float _977 = _953 * 6.283185482025146484375;
    float _979 = sin(_977);
    float _981 = _953 * 6.283185482025146484375;
    float _983 = cos(_981);
    if (_929)
    {
        return out;
    }
    float _985 = _971 * 6.283185482025146484375;
    float _987 = cos(_985);
    float _989 = _775 * _951;
    float _991 = _377 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _993 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _995 = _375 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _997 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _999 = _989 * _991;
    float _1001 = _975 * _983;
    float _1003 = _971 * 6.283185482025146484375;
    float _1005 = sin(_1003);
    float _1007 = _989 * _995;
    float _1009 = _993 * _999;
    float _1011 = _967 * _979;
    float _1013 = _975 * _979;
    float _1015 = _997 * _1007;
    float _1017 = _989 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1019 = _1017 * 0.5;
    float _1021 = _987 * _1009;
    float _1023 = _979 * _987;
    float _1025 = _983 * _987;
    float _1027 = _967 * _983;
    float _1029 = _975 * _1021;
    float _1031 = fma(_1005, _1001, _1011);
    float _1033 = -_1009;
    float _1035 = _1005 * _1033;
    float _1037 = -_1027;
    float _1039 = fma(_1005, _1013, _1037);
    float _1041 = -_1013;
    float _1043 = fma(_1005, _1027, _1041);
    float _1045 = fma(_1031, _1015, _1029);
    float _1047 = _967 * _1021;
    float _1049 = fma(_1025, _1015, _1035);
    float _1051 = fma(_1005, _1011, _1001);
    float _1053 = fma(_1039, _1019, _1045);
    float _1055 = fma(_1043, _1015, _1047);
    float _1057 = fma(_1023, _1019, _1049);
    float _1059 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1061 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1063 = fma(_1051, _1019, _1055);
    float _1065 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1059);
    float _1067 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1061);
    float _1069 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1065);
    float _1071 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1067);
    float _1073 = _1069 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1075 = _1071 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1077 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1079 = _549 + _1073;
    float _1081 = _469 + _1075;
    float _1083 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1077);
    float _1085 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1087 = _1079 + _1085;
    float _1089 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1091 = _1081 + _1089;
    float _1093 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1083);
    float _1095 = _1087 * _1087;
    float _1097 = _1091 * _1091;
    float _1099 = _1093 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1101 = _1095 + _1097;
    float _1103 = _467 + _1099;
    float _1105 = sqrt(_1101);
    bool _1107 = _1105 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1109 = _1063;
    float _1111 = _1079;
    float _1113 = _1099;
    float _1115 = _1081;
    float _1117 = _1097;
    if (!_1107)
    {
        _1109 = _1079;
    }
    float _1119 = _1109;
    float _1121 = _1119;
    if (!_1107)
    {
        _1111 = _1081;
    }
    float _1123 = _1111;
    float _1125 = _1123;
    if (!_1107)
    {
        _1113 = _1095;
    }
    float _1127 = _1113;
    float _1129 = _1127;
    if (!_1107)
    {
        _1115 = _1103;
    }
    float _1131 = _1115;
    bool _1133 = !_1107;
    float _1135 = _1131;
    if (!_1133)
    {
        float _1137 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1139 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1141 = _1105 + _1139;
        float _1143 = rsqrt(_1101);
        float _1145 = _1141 * _1137;
        float _1147 = _1103 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1149 = _1145 * 0.15915493667125701904296875;
        float _1151 = _1149 * 6.283185482025146484375;
        float _1153 = sin(_1151);
        float _1155 = _1149 * 6.283185482025146484375;
        float _1157 = cos(_1155);
        float _1159 = fma(_1153, _1147, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1161 = _1143 * _1159;
        float _1163 = _1157 + (-1.0);
        float _1165 = fma(_1087, _1161, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1167 = fma(_1091, _1161, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1169 = _1163 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1173 = _1165 + _1171;
        float _1175 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1177 = _1167 + _1175;
        float _1179 = fma(_1103, _1157, _1169);
        float _1181 = _1173 * _1173;
        float _1183 = _1177 * _1177;
        _1135 = _1179;
        _1129 = _1181;
        _1117 = _1183;
        _1121 = _1165;
        _1125 = _1167;
    }
    float _1185 = _1135;
    float _1187 = _1129;
    float _1189 = _1117;
    float _1191 = _1121;
    float _1193 = _1125;
    float _1195 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1197 = _1185 + _1195;
    float _1199 = fma(_1197, _1197, _1187);
    float _1201 = _1199 + _1189;
    float _1203 = sqrt(_1201);
    bool _1205 = _1203 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1207 = isnan(_1203);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1213 = _1209 || _1211;
    float _1215 = _1187;
    if (!_1213)
    {
        _1215 = 1.0;
    }
    float _1217 = _1215;
    bool _1219 = !_1213;
    float _1221 = _1217;
    if (!_1219)
    {
        bool _1223 = _1203 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1225 = isnan(_1203);
        bool _1227 = _1223 || _1225;
        bool _1229 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1231 = _1227 || _1229;
        if (!_1231)
        {
            float _1233 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1235 = _1203 + _1233;
            float _1237 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1239 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1237;
            float _1241 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1243 = _1241 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1245 = 1.0 / _1239;
            float _1247 = _1235 * _1245;
            float _1249 = fma(_1247, _1243, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1221 = _1249;
            _1251 = true;
        }
        else
        {
            bool _1253 = _1203 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1255 = isnan(_1203);
            bool _1257 = _1253 || _1255;
            bool _1259 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1261 = _1257 || _1259;
            if (!_1261)
            {
                float _1263 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1265 = _1203 + _1263;
                float _1267 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1269 = _1267 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1271 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1273 = _1271 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1275 = 1.0 / _1269;
                float _1277 = _1265 * _1275;
                float _1279 = fma(_1277, _1273, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1221 = _1279;
                _1251 = true;
            }
            else
            {
                _1221 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1251 = false;
    float _1281 = _1221;
    float _1283 = _877 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1285 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1287 = _1191 + _1285;
    float _1289 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1291 = _1193 + _1289;
    float _1293 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1283);
    bool _1295 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1297 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan(0.5);
    bool _1303 = _1299 || _1301;
    float _1305 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1307 = _1185 + _1305;
    float _1309 = _877 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1311 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1293);
    float _1313 = fma(_1287, _1281, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1315 = fma(_1307, _1281, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1317 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1309);
    float _1319 = _1311 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1321 = -_815;
    float _1323 = fma(_1321, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1313);
    float _1325 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1317);
    float _1327 = 1.0 / _1319;
    float _1329 = fma(_1291, _1281, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _1331 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1333 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1335 = _1331 || _1333;
    bool _1337 = isnan(0.5);
    bool _1339 = _1335 || _1337;
    float _1341 = _1325 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1343 = -_807;
    float _1345 = fma(_1343, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1315);
    float _1347 = -_849;
    float _1349 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1329);
    float _1351 = _1341 + _1319;
    float _1353 = _1341;
    float _1355 = _1345;
    float _1357 = _1349;
    if (_1303)
    {
        _1353 = _1323;
    }
    float _1359 = _1353;
    float _1361 = _1359;
    if (!_1303)
    {
        float _1363 = _891 * _891;
        float _1365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1367 = -_469;
        float _1369 = _1367 + _1329;
        float _1371 = -_549;
        float _1373 = _1371 + _1313;
        float _1375 = fma(_895, _895, _1363);
        float _1377 = -_467;
        float _1379 = _1377 + _1315;
        float _1381 = fma(_899, _899, _1375);
        float _1383 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1385 = sqrt(_1381);
        float _1387 = 1.0 / _989;
        float _1389 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1391 = precise::min(_1385, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1393 = _1391 * _1365;
        float _1395 = _1393 * _1387;
        float _1397 = _1389 * _1395;
        float _1399 = _1369 * _1395;
        float _1401 = fma(_1373, _1397, _881);
        float _1403 = fma(_1379, _1397, _877);
        float _1405 = fma(_1389, _1399, _885);
        _1355 = _1403;
        _1361 = _1401;
        _1357 = _1405;
    }
    float _1407 = _1355;
    float _1409 = _1361;
    float _1411 = _1357;
    float _1413 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1415 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1417 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1419 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1421 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1413);
    float _1423 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1415);
    float _1425 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1417);
    float _1427 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1419);
    float _1429 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1421);
    float _1431 = _1351 * _1327;
    float _1433 = _1431 * 0.5;
    float _1435 = _1421;
    if (_1339)
    {
        _1435 = 1.0;
    }
    float _1437 = _1435;
    float _1439 = _1437;
    if (!_1339)
    {
        float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1443 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1441);
        float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1447 = _1445 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _1449 = 1.0 / _1443;
        float _1451 = 1.0 / _1447;
        float _1453 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1457 = fma(_1449, _1453, _1455);
        float _1459 = _1457 * _1451;
        float _1461 = precise::clamp(_1459, 0.0, 1.0);
        _1439 = _1461;
    }
    float _1463 = _1439;
    float _1465 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1423);
    float _1467 = _1429 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1469 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1425);
    float _1471 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1427);
    float _1473 = _1465 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1475 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1477 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1479 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1481 = _1469 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1483 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1475);
    float _1485 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1477);
    float _1487 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1489 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1479);
    float _1491 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1493 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1483);
    float _1495 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1485);
    float _1497 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1487);
    float _1499 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1489);
    float _1501 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1493);
    float _1503 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1495);
    bool _1505 = _1463 > 0.0;
    bool _1507 = isnan(_1463);
    bool _1509 = _1505 || _1507;
    bool _1511 = isnan(0.0);
    bool _1513 = _1509 || _1511;
    float _1515 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1497);
    float _1517 = _1463 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1519 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1499);
    float _1521 = _1501 + _1503;
    float _1523 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1515);
    float _1525 = _1517 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1527 = _1521 * 0.5;
    out.m_35.x = _1525;
    out.gl_Position.x = _1519;
    out.gl_Position.y = _1523;
    out.gl_Position.z = _1501;
    out.gl_Position.w = _1503;
    out.m_54.z = _1527;
    out.m_54.w = _1503;
    if (_1513)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _1529 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1529;
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
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1251 = false;
    bool _399 = false;
    bool _289 = false;
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
    int _91 = _89;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1586 = as_type<float>(_89);
        out.gl_Position.z = _1586;
    }
    if (!_77)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _93 = in.m_37.w;
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
        out.m_35.x = 0.0;
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
        float _1656 = as_type<float>(_127);
        out.gl_Position.z = _1656;
    }
    if (_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = as_type<float>(int(gl_VertexIndex));
    float _131 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _133 = in.m_42.w;
    bool _135 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _137 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _139 = _135 || _137;
    bool _141 = isnan(1.0);
    bool _143 = _139 || _141;
    float _145 = in.m_37.x;
    float _147 = in.m_37.y;
    float _149 = in.m_37.z;
    float _151 = in.m_32.x;
    float _153 = in.m_32.y;
    float _155 = in.m_32.z;
    float _157 = 0.0;
    float _159 = _131;
    if (!_143)
    {
        float _161 = _131 * _131;
        float _163 = _161 * 0.5;
        _157 = _163;
    }
    float _165 = _157;
    float _167 = _165;
    if (!_143)
    {
        float _169 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _167 = _169;
    }
    float _171 = _167;
    int _173 = as_type<int>(_129) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_129) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_143;
    float _191 = _171;
    if (!_189)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _131 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _131);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _221;
    }
    float _223 = _191;
    bool _225 = !_143;
    if (!_225)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = 1.0 / _233;
        float _237 = _131 * _229;
        float _239 = exp2(_237);
        float _241 = -_239;
        float _243 = _241 + 1.0;
        float _245 = _243 * _235;
        _159 = _245;
    }
    float _247 = _159;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _251 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _253 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _255 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _257 = fma(_247, _145, _251);
    float _259 = fma(_247, _147, _253);
    float _261 = fma(_247, _149, _255);
    float _263 = fma(_257, _133, _151);
    float _265 = fma(_259, _133, _153);
    float _267 = fma(_261, _133, _155);
    bool _269 = !_249;
    float _287;
    if (!_269)
    {
        float _271 = in.m_44.x;
        float _273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _275 = _271 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _279 = _277 * _273;
        float _281 = floor(_279);
        float _283 = -_281;
        float _285 = _279 + _283;
        _287 = _285;
        _289 = true;
    }
    else
    {
        float _291 = float(_73);
        float _293 = 1.0 / _291;
        float _295 = _107 * _293;
        _287 = _295;
    }
    _289 = false;
    float _297 = _287;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = _297 + _299;
    float _303 = in.m_42.x;
    float _305 = in.m_42.y;
    bool _307 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _309 = isnan(_297);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _319;
    bool _323 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _325 = 1.0 / _321;
    float _327 = -_317;
    float _329 = _327 + 1.0;
    float _331 = _301 * _325;
    bool _333 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _335 = isnan(_297);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _349;
    float _353 = _343 * _329;
    float _355 = fma(_347, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _357 = fma(_351, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _359 = -_343;
    float _361 = _359 + 1.0;
    float _363 = _355 * _353;
    float _365 = _357 * _353;
    float _367 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].x, _363);
    float _369 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].y, _365);
    float _371 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[144].x, _367);
    float _373 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[144].y, _369);
    float _375 = _371 * _303;
    float _377 = _373 * _305;
    bool _379 = !_323;
    float _397;
    if (!_379)
    {
        float _381 = in.m_44.x;
        float _383 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _385 = _381 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _387 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _389 = _387 * _383;
        float _391 = floor(_389);
        float _393 = -_391;
        float _395 = _389 + _393;
        _397 = _395;
        _399 = true;
    }
    else
    {
        float _401 = float(_73);
        float _403 = 1.0 / _401;
        float _405 = _107 * _403;
        _397 = _405;
    }
    _399 = false;
    float _407 = _397;
    float _409 = _265 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _411 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _413 = log2(_411);
    float _415 = in.m_44.z;
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _419 = _417 != 0;
    float _421 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].x, _409);
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _425 = _423 != 0;
    float _427 = _265 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _429 = _265 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _431 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].z, _421);
    float _433 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].x, _427);
    float _435 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].x, _429);
    float _437 = in.m_44.x;
    float _439 = in.m_44.y;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _445 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].z, _435);
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _449 = _447 != 0;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _453 = _451 != 0;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _457 = _455 != 0;
    float _459 = 1.0 / _443;
    float _461 = _413 * _107;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _467 = _431 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _469 = _445 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _471 = 1.0 / _465;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _479 = _415 * 2.0;
    float _481 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].z, _433);
    float _483 = exp2(_461);
    float _485 = _473 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _487;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _493 = _475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _495 = _477 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _497 = _437 > 0.5;
    float _499 = _489 * _459;
    float _501 = floor(_479);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _507 = -_183;
    int _509 = _497 ? as_type<int>(_507) : as_type<int>(_183);
    out.m_46.x = _493;
    out.m_46.y = _485;
    out.m_46.z = _495;
    out.m_46.w = _491;
    bool _511 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _513 = isnan(_407);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _525 = 1.0 + _523;
    float _527 = _505 * _471;
    float _529 = -_483;
    float _531 = _529 + 1.0;
    bool _533 = !_419;
    float _535 = _533 ? _183 : as_type<float>(_509);
    float _537 = 1.0 / _525;
    bool _539 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _541 = isnan(0.0);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _547 = _543 || _545;
    float _549 = _481 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _551 = _535 + 0.5;
    bool _553 = _439 > 0.5;
    float _555 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _557 = _467 + _555;
    bool _559 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _561 = isnan(1.0);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _567 = _563 || _565;
    float _569 = _439 + _437;
    float _571 = _437 * 2.0;
    bool _573 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _575 = isnan(_407);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = -_521;
    float _587 = _585 + 1.0;
    float _589 = _569 + (-1.0);
    float _591 = _547 ? _531 : 0.0;
    float _593 = floor(_571);
    float _595 = _583 * _587;
    float _597 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _599 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _601 = isnan(_407);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = -_583;
    float _613 = _611 + 1.0;
    float _615 = -_187;
    int _617 = _553 ? as_type<int>(_615) : as_type<int>(_187);
    if (_567)
    {
        float _619 = _591 * _537;
        _109 = _619;
    }
    float _621 = _109;
    bool _623 = _501 > 0.0;
    float _625 = _609 * _613;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _629 = _407 + _627;
    bool _631 = _501 >= 0.0;
    bool _633 = isnan(_501);
    bool _635 = _631 || _633;
    bool _637 = isnan(0.0);
    bool _639 = _635 || _637;
    float _641 = _439 * 2.0;
    float _643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _645 = fma(_499, _629, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _647 = !_425;
    float _649 = _647 ? _187 : as_type<float>(_617);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _653 = _407 + _651;
    float _655 = -_609;
    float _657 = _655 + 1.0;
    float _659 = _645 * _625;
    bool _661 = _593 >= 0.0;
    bool _663 = isnan(_593);
    bool _665 = _661 || _663;
    bool _667 = isnan(0.0);
    bool _669 = _665 || _667;
    float _671 = -_649;
    float _673 = _671 + 0.5;
    float _675 = floor(_641);
    float _677 = fma(_527, _653, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _679 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[115].x, _659);
    float _681 = _551 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _683 = _673 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _685 = _593 > 0.0;
    float _687 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _689 = _549 + _687;
    float _691 = _557 * _557;
    float _693 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _695 = _639 ? 0 : 1;
    float _697 = _681 * _643;
    int _699 = _669 ? 0 : 1;
    float _701 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _703 = _469 + _701;
    int _705 = ~_695;
    int _707 = _705 + 1;
    int _709 = _707 + 1;
    float _711 = fma(_677, _595, _679);
    int _713 = _709;
    if (!_623)
    {
        int _715 = ~_695;
        int _717 = _715 + 1;
        _713 = _717;
    }
    int _719 = _713;
    bool _721 = _675 > 0.0;
    float _723 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[117].x, _711);
    bool _725 = _675 >= 0.0;
    bool _727 = isnan(_675);
    bool _729 = _725 || _727;
    bool _731 = isnan(0.0);
    bool _733 = _729 || _731;
    float _735 = _557 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _737 = ~_699;
    int _739 = _737 + 1;
    int _741 = _739 + 1;
    int _743 = _733 ? 0 : 1;
    float _745 = _683 * _693;
    float _747 = fma(_689, _689, _691);
    float _749 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[28].x, _735);
    int _751 = _741;
    if (!_685)
    {
        int _753 = ~_699;
        int _755 = _753 + 1;
        _751 = _755;
    }
    int _757 = _751;
    float _759 = fma(_703, _703, _747);
    float _761 = fma(_703, (*spvDescriptorSet0.vp_c8)._m0[28].z, _749);
    int _763 = ~_743;
    int _765 = _763 + 1;
    int _767 = _765 + 1;
    float _769 = in.m_48.x;
    float _771 = in.m_48.y;
    float _773 = in.m_48.z;
    float _775 = rsqrt(_759);
    bool _777 = _761 >= 0.0;
    out.m_50.x = _697;
    out.m_50.y = _745;
    int _779 = _767;
    if (!_721)
    {
        int _781 = ~_743;
        int _783 = _781 + 1;
        _779 = _783;
    }
    int _785 = _779;
    bool _787 = !_449;
    int _789 = _787 ? 0 : 1;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _793 = float(_719);
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _797 = !_453;
    int _799 = _797 ? 0 : 1;
    if (_777)
    {
        out.m_35.x = 0.0;
    }
    int _801 = abs(_789);
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _805 = abs(_799);
    float _807 = _557 * _775;
    float _809 = _791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _811 = _803 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _813 = float(_801);
    float _815 = _689 * _775;
    float _817 = -_807;
    float _819 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[18].w, _557);
    float _821 = float(_805);
    float _823 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _825 = float(_757);
    float _827 = -_815;
    float _829 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[18].w, _689);
    float _831 = _819 * _819;
    float _833 = _813 * _793;
    float _835 = 0.0;
    int _837 = as_type<int>(_833);
    if (_777)
    {
        _835 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _839 = _835;
    float _841 = _723 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _843 = _821 * _825;
    float _845 = fma(_829, _829, _831);
    float _847 = _833 * (-2.0);
    float _849 = _703 * _775;
    if (_777)
    {
        float _851 = _839 * 5.0;
        _837 = as_type<int>(_851);
    }
    int _853 = _837;
    float _855 = _437 + (-0.5);
    float _857 = fma(_847, _769, _769);
    float _859 = -_849;
    float _861 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[18].w, _703);
    out.m_52.x = _809;
    out.m_52.y = _823;
    out.m_52.z = _811;
    out.m_52.w = _841;
    float _863 = fma(_597, _847, _597);
    float _865 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[196].x, _857);
    float _867 = fma(_861, _861, _845);
    float _869 = _773;
    if (_777)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2817 = as_type<float>(_853);
        out.gl_Position.z = _2817;
    }
    bool _871 = !_457;
    int _873 = _871 ? 0 : 1;
    if (_777)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _875 = -_807;
    float _877 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[18].w, _467);
    float _879 = -_815;
    float _881 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[18].w, _549);
    float _883 = -_849;
    float _885 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[18].w, _469);
    int _887 = abs(_873);
    float _889 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _891 = _877 + _889;
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _895 = _881 + _893;
    float _897 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _899 = _885 + _897;
    float _901 = _439 + _415;
    float _903 = _891 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _905 = _439 + (-0.5);
    float _907 = float(_887);
    float _909 = _901 + (-1.0);
    float _911 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[28].x, _903);
    float _913 = float(_785);
    float _915 = _843 * (-2.0);
    float _917 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _919 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[28].z, _911);
    float _921 = _415 + _437;
    float _923 = _907 * _913;
    float _925 = fma(_917, _915, _917);
    float _927 = fma(_863, _621, _865);
    bool _929 = _919 >= 0.0;
    float _931 = fma(_915, _771, _771);
    float _933 = _921 + (-1.0);
    float _935 = _923 * (-2.0);
    float _937 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[196].y, _931);
    float _939 = _927 * 0.15915493667125701904296875;
    float _941 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _943 = fma(_935, _773, _773);
    float _945 = fma(_925, _621, _937);
    float _947 = _415 + (-0.5);
    float _949 = fma(_941, _935, _941);
    float _951 = sqrt(_867);
    float _953 = _945 * 0.15915493667125701904296875;
    if (_929)
    {
        _869 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _955 = _869;
    float _957 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[196].z, _943);
    int _959 = as_type<int>(_955);
    if (_929)
    {
        out.m_35.x = 0.0;
    }
    if (_929)
    {
        float _961 = _955 * 5.0;
        _959 = as_type<int>(_961);
    }
    int _963 = _959;
    float _965 = _939 * 6.283185482025146484375;
    float _967 = sin(_965);
    float _969 = fma(_949, _621, _957);
    if (_929)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2996 = as_type<float>(_963);
        out.gl_Position.z = _2996;
    }
    float _971 = _969 * 0.15915493667125701904296875;
    float _973 = _939 * 6.283185482025146484375;
    float _975 = cos(_973);
    float _977 = _953 * 6.283185482025146484375;
    float _979 = sin(_977);
    float _981 = _953 * 6.283185482025146484375;
    float _983 = cos(_981);
    if (_929)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _985 = _971 * 6.283185482025146484375;
    float _987 = cos(_985);
    float _989 = _775 * _951;
    float _991 = _377 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _993 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _995 = _375 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _997 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _999 = _989 * _991;
    float _1001 = _975 * _983;
    float _1003 = _971 * 6.283185482025146484375;
    float _1005 = sin(_1003);
    float _1007 = _989 * _995;
    float _1009 = _993 * _999;
    float _1011 = _967 * _979;
    float _1013 = _975 * _979;
    float _1015 = _997 * _1007;
    float _1017 = _989 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1019 = _1017 * 0.5;
    float _1021 = _987 * _1009;
    float _1023 = _979 * _987;
    float _1025 = _983 * _987;
    float _1027 = _967 * _983;
    float _1029 = _975 * _1021;
    float _1031 = fma(_1005, _1001, _1011);
    float _1033 = -_1009;
    float _1035 = _1005 * _1033;
    float _1037 = -_1027;
    float _1039 = fma(_1005, _1013, _1037);
    float _1041 = -_1013;
    float _1043 = fma(_1005, _1027, _1041);
    float _1045 = fma(_1031, _1015, _1029);
    float _1047 = _967 * _1021;
    float _1049 = fma(_1025, _1015, _1035);
    float _1051 = fma(_1005, _1011, _1001);
    float _1053 = fma(_1039, _1019, _1045);
    float _1055 = fma(_1043, _1015, _1047);
    float _1057 = fma(_1023, _1019, _1049);
    float _1059 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1061 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1063 = fma(_1051, _1019, _1055);
    float _1065 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1059);
    float _1067 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1061);
    float _1069 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1065);
    float _1071 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1067);
    float _1073 = _1069 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1075 = _1071 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1077 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1079 = _549 + _1073;
    float _1081 = _469 + _1075;
    float _1083 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1077);
    float _1085 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1087 = _1079 + _1085;
    float _1089 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1091 = _1081 + _1089;
    float _1093 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1083);
    float _1095 = _1087 * _1087;
    float _1097 = _1091 * _1091;
    float _1099 = _1093 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1101 = _1095 + _1097;
    float _1103 = _467 + _1099;
    float _1105 = sqrt(_1101);
    bool _1107 = _1105 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1109 = _1063;
    float _1111 = _1079;
    float _1113 = _1099;
    float _1115 = _1081;
    float _1117 = _1097;
    if (!_1107)
    {
        _1109 = _1079;
    }
    float _1119 = _1109;
    float _1121 = _1119;
    if (!_1107)
    {
        _1111 = _1081;
    }
    float _1123 = _1111;
    float _1125 = _1123;
    if (!_1107)
    {
        _1113 = _1095;
    }
    float _1127 = _1113;
    float _1129 = _1127;
    if (!_1107)
    {
        _1115 = _1103;
    }
    float _1131 = _1115;
    bool _1133 = !_1107;
    float _1135 = _1131;
    if (!_1133)
    {
        float _1137 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1139 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1141 = _1105 + _1139;
        float _1143 = rsqrt(_1101);
        float _1145 = _1141 * _1137;
        float _1147 = _1103 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1149 = _1145 * 0.15915493667125701904296875;
        float _1151 = _1149 * 6.283185482025146484375;
        float _1153 = sin(_1151);
        float _1155 = _1149 * 6.283185482025146484375;
        float _1157 = cos(_1155);
        float _1159 = fma(_1153, _1147, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1161 = _1143 * _1159;
        float _1163 = _1157 + (-1.0);
        float _1165 = fma(_1087, _1161, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1167 = fma(_1091, _1161, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1169 = _1163 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1173 = _1165 + _1171;
        float _1175 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1177 = _1167 + _1175;
        float _1179 = fma(_1103, _1157, _1169);
        float _1181 = _1173 * _1173;
        float _1183 = _1177 * _1177;
        _1135 = _1179;
        _1129 = _1181;
        _1117 = _1183;
        _1121 = _1165;
        _1125 = _1167;
    }
    float _1185 = _1135;
    float _1187 = _1129;
    float _1189 = _1117;
    float _1191 = _1121;
    float _1193 = _1125;
    float _1195 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1197 = _1185 + _1195;
    float _1199 = fma(_1197, _1197, _1187);
    float _1201 = _1199 + _1189;
    float _1203 = sqrt(_1201);
    bool _1205 = _1203 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1207 = isnan(_1203);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1213 = _1209 || _1211;
    float _1215 = _1187;
    if (!_1213)
    {
        _1215 = 1.0;
    }
    float _1217 = _1215;
    bool _1219 = !_1213;
    float _1221 = _1217;
    if (!_1219)
    {
        bool _1223 = _1203 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1225 = isnan(_1203);
        bool _1227 = _1223 || _1225;
        bool _1229 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1231 = _1227 || _1229;
        if (!_1231)
        {
            float _1233 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1235 = _1203 + _1233;
            float _1237 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1239 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1237;
            float _1241 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1243 = _1241 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1245 = 1.0 / _1239;
            float _1247 = _1235 * _1245;
            float _1249 = fma(_1247, _1243, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1221 = _1249;
            _1251 = true;
        }
        else
        {
            bool _1253 = _1203 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1255 = isnan(_1203);
            bool _1257 = _1253 || _1255;
            bool _1259 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1261 = _1257 || _1259;
            if (!_1261)
            {
                float _1263 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1265 = _1203 + _1263;
                float _1267 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1269 = _1267 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1271 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1273 = _1271 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1275 = 1.0 / _1269;
                float _1277 = _1265 * _1275;
                float _1279 = fma(_1277, _1273, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1221 = _1279;
                _1251 = true;
            }
            else
            {
                _1221 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1251 = false;
    float _1281 = _1221;
    float _1283 = _877 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1285 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1287 = _1191 + _1285;
    float _1289 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1291 = _1193 + _1289;
    float _1293 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1283);
    bool _1295 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1297 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan(0.5);
    bool _1303 = _1299 || _1301;
    float _1305 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1307 = _1185 + _1305;
    float _1309 = _877 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1311 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1293);
    float _1313 = fma(_1287, _1281, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1315 = fma(_1307, _1281, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1317 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1309);
    float _1319 = _1311 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1321 = -_815;
    float _1323 = fma(_1321, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1313);
    float _1325 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1317);
    float _1327 = 1.0 / _1319;
    float _1329 = fma(_1291, _1281, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _1331 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1333 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1335 = _1331 || _1333;
    bool _1337 = isnan(0.5);
    bool _1339 = _1335 || _1337;
    float _1341 = _1325 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1343 = -_807;
    float _1345 = fma(_1343, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1315);
    float _1347 = -_849;
    float _1349 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1329);
    float _1351 = _1341 + _1319;
    float _1353 = _1341;
    float _1355 = _1345;
    float _1357 = _1349;
    if (_1303)
    {
        _1353 = _1323;
    }
    float _1359 = _1353;
    float _1361 = _1359;
    if (!_1303)
    {
        float _1363 = _891 * _891;
        float _1365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1367 = -_469;
        float _1369 = _1367 + _1329;
        float _1371 = -_549;
        float _1373 = _1371 + _1313;
        float _1375 = fma(_895, _895, _1363);
        float _1377 = -_467;
        float _1379 = _1377 + _1315;
        float _1381 = fma(_899, _899, _1375);
        float _1383 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1385 = sqrt(_1381);
        float _1387 = 1.0 / _989;
        float _1389 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1391 = precise::min(_1385, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1393 = _1391 * _1365;
        float _1395 = _1393 * _1387;
        float _1397 = _1389 * _1395;
        float _1399 = _1369 * _1395;
        float _1401 = fma(_1373, _1397, _881);
        float _1403 = fma(_1379, _1397, _877);
        float _1405 = fma(_1389, _1399, _885);
        _1355 = _1403;
        _1361 = _1401;
        _1357 = _1405;
    }
    float _1407 = _1355;
    float _1409 = _1361;
    float _1411 = _1357;
    float _1413 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1415 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1417 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1419 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1421 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1413);
    float _1423 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1415);
    float _1425 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1417);
    float _1427 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1419);
    float _1429 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1421);
    float _1431 = _1351 * _1327;
    float _1433 = _1431 * 0.5;
    float _1435 = _1421;
    if (_1339)
    {
        _1435 = 1.0;
    }
    float _1437 = _1435;
    float _1439 = _1437;
    if (!_1339)
    {
        float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1443 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1441);
        float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1447 = _1445 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _1449 = 1.0 / _1443;
        float _1451 = 1.0 / _1447;
        float _1453 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1457 = fma(_1449, _1453, _1455);
        float _1459 = _1457 * _1451;
        float _1461 = precise::clamp(_1459, 0.0, 1.0);
        _1439 = _1461;
    }
    float _1463 = _1439;
    float _1465 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1423);
    float _1467 = _1429 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1469 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1425);
    float _1471 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1427);
    float _1473 = _1465 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1475 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1477 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1479 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1481 = _1469 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1483 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1475);
    float _1485 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1477);
    float _1487 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1489 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1479);
    float _1491 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1493 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1483);
    float _1495 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1485);
    float _1497 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1487);
    float _1499 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1489);
    float _1501 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1493);
    float _1503 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1495);
    bool _1505 = _1463 > 0.0;
    bool _1507 = isnan(_1463);
    bool _1509 = _1505 || _1507;
    bool _1511 = isnan(0.0);
    bool _1513 = _1509 || _1511;
    float _1515 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1497);
    float _1517 = _1463 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1519 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1499);
    float _1521 = _1501 + _1503;
    float _1523 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1515);
    float _1525 = _1517 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1527 = _1521 * 0.5;
    out.m_35.x = _1525;
    out.gl_Position.x = _1519;
    out.gl_Position.y = _1523;
    out.gl_Position.z = _1501;
    out.gl_Position.w = _1503;
    out.m_54.z = _1527;
    out.m_54.w = _1503;
    if (_1513)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _1529 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1529;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

