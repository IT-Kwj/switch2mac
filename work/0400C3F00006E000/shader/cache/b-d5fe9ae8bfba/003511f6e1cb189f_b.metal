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
    float4 m_37 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_42 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_33 [[attribute(4)]];
    float4 m_35 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    bool _609 = false;
    bool _345 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_26.w;
    float _60 = trunc(_58);
    int _63 = int(_60);
    bool _67 = _63 >= 1;
    float _69 = 0.0;
    if (!_67)
    {
        _69 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _71 = _69;
    float _73 = _71;
    if (!_67)
    {
        out.m_29.x = 0.0;
    }
    int _75 = 0;
    if (!_67)
    {
        float _77 = _71 * 5.0;
        _75 = as_type<int>(_77);
    }
    int _79 = _75;
    int _81 = _79;
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1081 = as_type<float>(_79);
        out.gl_Position.z = _1081;
    }
    if (!_67)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _83 = in.m_31.w;
    bool _85 = _83 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _87 = isnan(_83);
    bool _89 = _85 || _87;
    bool _91 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _93 = _89 || _91;
    float _95 = -_83;
    float _97 = _95 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_93)
    {
        float _99 = float(_63);
        _73 = _99;
    }
    float _101 = _73;
    bool _103 = _97 >= _101;
    bool _105 = !_93;
    bool _107 = _103 || _105;
    float _109 = _101;
    if (_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    if (_107)
    {
        out.m_29.x = 0.0;
    }
    if (_107)
    {
        float _113 = _111 * 5.0;
        _81 = as_type<int>(_113);
    }
    int _115 = _81;
    if (_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1150 = as_type<float>(_115);
        out.gl_Position.z = _1150;
    }
    if (_107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _117 = in.m_33.x;
    float _119 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _121 = _97 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _123 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _125 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _127 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _129 = _125 || _127;
    bool _131 = isnan(1.0);
    bool _133 = _129 || _131;
    int _135 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _137 = _135 != 0;
    float _139 = _121 * _119;
    float _141 = 0.0;
    float _143 = _123;
    if (!_133)
    {
        float _145 = _123 * _123;
        float _147 = _145 * 0.5;
        _141 = _147;
    }
    float _149 = _141;
    float _151 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[20].x, _139);
    float _153 = _149;
    if (!_133)
    {
        float _155 = _149 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _153 = _155;
    }
    float _157 = _153;
    float _159 = in.m_31.x;
    float _161 = in.m_31.y;
    float _163 = in.m_31.z;
    float _165 = _151 * 6.283185482025146484375;
    float _167 = floor(_151);
    float _169 = _165 * 0.15915493667125701904296875;
    float _171 = _169 * 6.283185482025146484375;
    float _173 = cos(_171);
    float _175 = -_167;
    float _177 = _151 + _175;
    bool _179 = !_133;
    float _181 = _157;
    if (!_179)
    {
        float _183 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _185 = log2(_183);
        float _187 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _189 = _187 + 1.0;
        float _191 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = _123 * _185;
        float _195 = 1.0 / _189;
        float _197 = _191 * 0.693147182464599609375;
        float _199 = exp2(_193);
        float _201 = 1.0 / _197;
        float _203 = _199 + (-1.0);
        float _205 = -_203;
        float _207 = fma(_205, _201, _123);
        float _209 = _207 * _195;
        float _211 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _211;
    }
    float _213 = _181;
    bool _215 = !_133;
    if (!_215)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = 1.0 / _223;
        float _227 = _123 * _219;
        float _229 = exp2(_227);
        float _231 = -_229;
        float _233 = _231 + 1.0;
        float _235 = _233 * _225;
        _143 = _235;
    }
    float _237 = _143;
    int _239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _241 = _239 != 0;
    int _243 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _245 = _243 != 0;
    float _247 = in.m_35.w;
    float _249 = in.m_26.x;
    float _251 = in.m_26.y;
    float _253 = in.m_26.z;
    bool _255 = _177 < 0.5;
    float _257 = float(_255);
    float _259 = -_177;
    float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _263 = !_241;
    int _265 = _263 ? 0 : 1;
    float _267 = fma(_173, 0.5, 0.5);
    float _269 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = -_257;
    float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _275 = !_137;
    int _277 = _275 ? 0 : 1;
    float _279 = -_267;
    float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _283 = abs(_265);
    float _285 = fma(_237, _159, _269);
    bool _287 = !_245;
    int _289 = _287 ? 0 : 1;
    float _291 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _293 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _295 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _297 = abs(_277);
    float _299 = fma(_237, _161, _291);
    int _301 = abs(_289);
    float _303 = fma(_237, _163, _295);
    float _305 = float(_283);
    float _307 = float(_297);
    float _309 = abs(_261);
    float _311 = _305 * _309;
    float _313 = fma(_299, _247, _251);
    float _315 = fma(_285, _247, _249);
    float _317 = float(_301);
    float _319 = fma(_307, _281, _311);
    float _321 = fma(_303, _247, _253);
    float _323 = abs(_273);
    float _325 = fma(_317, _323, _319);
    bool _327 = !_293;
    float _343;
    if (!_327)
    {
        float _329 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _331 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _335 = _333 * _329;
        float _337 = floor(_335);
        float _339 = -_337;
        float _341 = _335 + _339;
        _343 = _341;
        _345 = true;
    }
    else
    {
        float _347 = float(_63);
        float _349 = 1.0 / _347;
        float _351 = _97 * _349;
        _343 = _351;
    }
    _345 = false;
    float _353 = _343;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _371 = 1.0 / _357;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _377 = _373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _379 = 1.0 / _361;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _383 = _353 + _381;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _389 = _375 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _391 = _385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _393 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _395 = 1.0 / _365;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _399 = _353 + _397;
    float _401 = _383 * _371;
    bool _403 = _353 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _405 = isnan(_353);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    out.m_37.x = _377;
    out.m_37.y = _389;
    out.m_37.z = _391;
    out.m_37.w = _387;
    float _415 = 1.0 / _369;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _419 = _353 + _417;
    float _421 = _399 * _379;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _425 = _353 + _423;
    float _427 = _419 * _395;
    bool _429 = _353 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _431 = isnan(_353);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = -_413;
    float _443 = _441 + 1.0;
    bool _445 = _353 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _447 = isnan(_353);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = _439 * _443;
    float _459 = -_439;
    float _461 = _459 + 1.0;
    float _463 = _425 * _415;
    bool _465 = _353 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _467 = isnan(_353);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    bool _477 = _353 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _479 = isnan(_353);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = -_475;
    float _491 = _489 + 1.0;
    float _493 = _475 * _461;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _507 = _455 * _491;
    float _509 = -_455;
    float _511 = _509 + 1.0;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _513;
    float _517 = fma(_501, _421, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _519 = fma(_505, _421, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _521 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _523 = fma(_497, _401, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _525 = _487 * _511;
    float _527 = fma(_515, _401, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _529 = -_487;
    float _531 = _529 + 1.0;
    float _533 = _523 * _525;
    float _535 = _521 * _117;
    float _537 = _527 * _525;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _539;
    float _543 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[143].x, _533);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _545;
    float _549 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[143].y, _537);
    float _551 = trunc(_535);
    int _553 = int(_551);
    float _555 = fma(_517, _507, _543);
    float _557 = fma(_541, _427, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _559 = fma(_547, _427, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _569 = fma(_519, _507, _549);
    float _571 = fma(_557, _493, _555);
    float _573 = fma(_563, _463, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _575 = fma(_567, _463, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _577 = fma(_559, _493, _569);
    float _579 = fma(_573, _457, _571);
    float _581 = fma(_575, _457, _577);
    float _583 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[147].x, _579);
    float _585 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[147].y, _581);
    int _587 = _553 << 4;
    int _589 = _587 + 1968;
    bool _591 = !_393;
    float _607;
    if (!_591)
    {
        float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _595 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _597 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[11].w, _97);
        float _599 = _597 * _593;
        float _601 = floor(_599);
        float _603 = -_601;
        float _605 = _599 + _603;
        _607 = _605;
        _609 = true;
    }
    else
    {
        float _611 = float(_63);
        float _613 = 1.0 / _611;
        float _615 = _97 * _613;
        _607 = _615;
    }
    _609 = false;
    float _617 = _607;
    float _619 = as_type<float>(int(gl_VertexIndex));
    float _621 = _313 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _623 = in.m_33.w;
    float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _627 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[5].x, _621);
    float _629 = in.m_35.x;
    float _631 = in.m_35.y;
    float _633 = in.m_33.z;
    float _635 = in.m_33.y;
    int _637 = as_type<int>(_619) & 1;
    bool _639 = _637 != 0;
    int _641 = as_type<int>(_619) & 2;
    bool _643 = _641 != 0;
    bool _645 = _117 > 0.5;
    int _647 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _649 = _647 != 0;
    bool _651 = !_639;
    float _653 = _651 ? (-0.5) : 0.5;
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _657 = _655 != 0;
    float _659 = _585 * _631;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _663 = _661 != 0;
    float _665 = _583 * _629;
    int _667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _669 = _667 != 0;
    float _671 = -_653;
    int _673 = _645 ? as_type<int>(_671) : as_type<int>(_653);
    float _675 = _325 * _665;
    bool _677 = _623 > 0.5;
    float _679 = _313 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _681 = _313 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _683 = _675 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _685 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[4].x, _679);
    float _687 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[6].x, _681);
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _691 = _117 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _693 = _633 > 0.5;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _701 = _635 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _703 = 1.0 / _697;
    float _705 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[78].z, _689);
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _709 = -_699;
    float _711 = fma(_691, 2.0, _709);
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _715 = fma(_701, -2.0, _707);
    float _717 = _325 * _659;
    float _719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _721;
    bool _725 = !_649;
    float _727 = _725 ? _653 : as_type<float>(_673);
    float _729 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[4].z, _685);
    bool _731 = _635 > 0.5;
    float _733 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[78].w, _713);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _737 = _617 + _735;
    float _739 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[5].z, _627);
    float _741 = _723 * _703;
    float _743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _745 = -_97;
    float _747 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[76].x, _711);
    float _749 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[76].y, _715);
    float _751 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _653);
    float _753 = fma(_741, _737, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _755 = !_643;
    float _757 = _755 ? (-0.5) : 0.5;
    float _759 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[6].z, _687);
    float _761 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[77].z, _705);
    float _763 = _683 * _751;
    bool _765 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _767 = isnan(_617);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[77].w, _733);
    float _779 = -_653;
    int _781 = _693 ? as_type<int>(_779) : as_type<int>(_653);
    float _783 = _719 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _785 = -_757;
    int _787 = _731 ? as_type<int>(_785) : as_type<int>(_757);
    float _789 = -_775;
    float _791 = _789 + 1.0;
    float _793 = -_757;
    int _795 = _677 ? as_type<int>(_793) : as_type<int>(_757);
    float _797 = _717 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _799 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _801 = isnan(_617);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _807 = _803 || _805;
    float _809 = float(_807);
    float _811 = _743 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _813 = !_663;
    float _815 = _813 ? _653 : as_type<float>(_781);
    float _817 = _739 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _819 = !_657;
    float _821 = _819 ? _757 : as_type<float>(_787);
    float _823 = _729 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _825 = !_669;
    float _827 = _825 ? _757 : as_type<float>(_795);
    float _829 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _757);
    float _831 = _809 * _791;
    float _833 = _727 + 0.5;
    float _835 = _821 + (-0.5);
    float _837 = _797 * _829;
    float _839 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _841 = fma(_783, _833, _747);
    float _843 = -_811;
    float _845 = -_749;
    float _847 = fma(_843, _835, _845);
    float _849 = _837 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _851 = _837 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _853 = _837 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _855 = _753 * _831;
    float _857 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[24].x, _849);
    float _859 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[25].x, _851);
    float _861 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[26].x, _853);
    uint _864 = uint(int(uint(_589) >> uint(2)));
    uint _866 = uint(int(uint(int(_864)) >> uint(2)));
    int _868 = int(_864) & 3;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[int(_866)][_868];
    int _872 = int(_864) + 1;
    uint _874 = uint(int(uint(_872) >> uint(2)));
    int _876 = _872 & 3;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[int(_874)][_876];
    float _880 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[24].z, _857);
    float _882 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[25].z, _859);
    float _884 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[26].z, _861);
    float _886 = -_809;
    float _888 = _886 + 1.0;
    float _890 = _880 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _892 = _882 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _894 = _884 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _896 = _589 + 8;
    uint _898 = uint(int(uint(_896) >> uint(2)));
    uint _900 = uint(int(uint(int(_898)) >> uint(2)));
    int _902 = int(_898) & 3;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[int(_900)][_902];
    float _906 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[131].x, _855);
    float _908 = _817 + _892;
    float _910 = _823 + _890;
    float _912 = _759 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _914 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[132].x, _906);
    float _916 = _908 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _918 = _908 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _920 = _912 + _894;
    float _922 = _908 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _924 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[1].x, _916);
    float _926 = _908 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _928 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[0].x, _918);
    float _930 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[2].x, _922);
    float _932 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[1].z, _924);
    float _934 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[3].x, _926);
    float _936 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _938 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[0].z, _928);
    float _940 = _932 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _942 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[2].z, _930);
    float _944 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[3].z, _934);
    float _946 = _938 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _948 = _940 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _950 = _940 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _952 = _940 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _954 = _940 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _956 = _815 + 0.5;
    float _958 = _942 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _960 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[4].x, _948);
    float _962 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[5].x, _950);
    float _964 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[6].x, _952);
    float _966 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[7].x, _954);
    float _968 = -_827;
    float _970 = _968 + 0.5;
    float _972 = -_761;
    float _974 = _972 + 1.0;
    float _976 = -_777;
    float _978 = _976 + 1.0;
    float _980 = _956 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _982 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[4].z, _960);
    float _984 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[5].z, _962);
    float _986 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[6].z, _964);
    float _988 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[7].z, _966);
    float _990 = _870 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _992 = _878 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _994 = _970 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _996 = _944 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _998 = -_974;
    float _1000 = fma(_727, _998, _841);
    float _1002 = fma(_821, _978, _847);
    float _1004 = _980 * _936;
    float _1006 = _994 * _625;
    float _1008 = _904 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1010 = _990 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1012 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1014 = _1008 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1016 = _914 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1018 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[4].w, _982);
    float _1020 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[5].w, _984);
    float _1022 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[6].w, _986);
    float _1024 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[7].w, _988);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_42.x = _1000;
    out.m_42.y = _1002;
    out.m_42.z = _1004;
    out.m_42.w = _1006;
    out.m_44.x = _1010;
    out.m_44.y = _1012;
    out.m_44.z = _1014;
    out.m_44.w = _1016;
    out.gl_Position.x = _1018;
    out.gl_Position.y = _1020;
    out.gl_Position.z = _1022;
    out.gl_Position.w = _1024;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    bool _609 = false;
    bool _345 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_26.w;
    float _60 = trunc(_58);
    int _63 = int(_60);
    bool _67 = _63 >= 1;
    float _69 = 0.0;
    if (!_67)
    {
        _69 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _71 = _69;
    float _73 = _71;
    if (!_67)
    {
        out.m_29.x = 0.0;
    }
    int _75 = 0;
    if (!_67)
    {
        float _77 = _71 * 5.0;
        _75 = as_type<int>(_77);
    }
    int _79 = _75;
    int _81 = _79;
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1081 = as_type<float>(_79);
        out.gl_Position.z = _1081;
    }
    if (!_67)
    {
        return out;
    }
    float _83 = in.m_31.w;
    bool _85 = _83 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _87 = isnan(_83);
    bool _89 = _85 || _87;
    bool _91 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _93 = _89 || _91;
    float _95 = -_83;
    float _97 = _95 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_93)
    {
        float _99 = float(_63);
        _73 = _99;
    }
    float _101 = _73;
    bool _103 = _97 >= _101;
    bool _105 = !_93;
    bool _107 = _103 || _105;
    float _109 = _101;
    if (_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    if (_107)
    {
        out.m_29.x = 0.0;
    }
    if (_107)
    {
        float _113 = _111 * 5.0;
        _81 = as_type<int>(_113);
    }
    int _115 = _81;
    if (_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1150 = as_type<float>(_115);
        out.gl_Position.z = _1150;
    }
    if (_107)
    {
        return out;
    }
    float _117 = in.m_33.x;
    float _119 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _121 = _97 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _123 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _125 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _127 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _129 = _125 || _127;
    bool _131 = isnan(1.0);
    bool _133 = _129 || _131;
    int _135 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _137 = _135 != 0;
    float _139 = _121 * _119;
    float _141 = 0.0;
    float _143 = _123;
    if (!_133)
    {
        float _145 = _123 * _123;
        float _147 = _145 * 0.5;
        _141 = _147;
    }
    float _149 = _141;
    float _151 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[20].x, _139);
    float _153 = _149;
    if (!_133)
    {
        float _155 = _149 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _153 = _155;
    }
    float _157 = _153;
    float _159 = in.m_31.x;
    float _161 = in.m_31.y;
    float _163 = in.m_31.z;
    float _165 = _151 * 6.283185482025146484375;
    float _167 = floor(_151);
    float _169 = _165 * 0.15915493667125701904296875;
    float _171 = _169 * 6.283185482025146484375;
    float _173 = cos(_171);
    float _175 = -_167;
    float _177 = _151 + _175;
    bool _179 = !_133;
    float _181 = _157;
    if (!_179)
    {
        float _183 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _185 = log2(_183);
        float _187 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _189 = _187 + 1.0;
        float _191 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = _123 * _185;
        float _195 = 1.0 / _189;
        float _197 = _191 * 0.693147182464599609375;
        float _199 = exp2(_193);
        float _201 = 1.0 / _197;
        float _203 = _199 + (-1.0);
        float _205 = -_203;
        float _207 = fma(_205, _201, _123);
        float _209 = _207 * _195;
        float _211 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _211;
    }
    float _213 = _181;
    bool _215 = !_133;
    if (!_215)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = 1.0 / _223;
        float _227 = _123 * _219;
        float _229 = exp2(_227);
        float _231 = -_229;
        float _233 = _231 + 1.0;
        float _235 = _233 * _225;
        _143 = _235;
    }
    float _237 = _143;
    int _239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _241 = _239 != 0;
    int _243 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _245 = _243 != 0;
    float _247 = in.m_35.w;
    float _249 = in.m_26.x;
    float _251 = in.m_26.y;
    float _253 = in.m_26.z;
    bool _255 = _177 < 0.5;
    float _257 = float(_255);
    float _259 = -_177;
    float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _263 = !_241;
    int _265 = _263 ? 0 : 1;
    float _267 = fma(_173, 0.5, 0.5);
    float _269 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = -_257;
    float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _275 = !_137;
    int _277 = _275 ? 0 : 1;
    float _279 = -_267;
    float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _283 = abs(_265);
    float _285 = fma(_237, _159, _269);
    bool _287 = !_245;
    int _289 = _287 ? 0 : 1;
    float _291 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _293 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _295 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _297 = abs(_277);
    float _299 = fma(_237, _161, _291);
    int _301 = abs(_289);
    float _303 = fma(_237, _163, _295);
    float _305 = float(_283);
    float _307 = float(_297);
    float _309 = abs(_261);
    float _311 = _305 * _309;
    float _313 = fma(_299, _247, _251);
    float _315 = fma(_285, _247, _249);
    float _317 = float(_301);
    float _319 = fma(_307, _281, _311);
    float _321 = fma(_303, _247, _253);
    float _323 = abs(_273);
    float _325 = fma(_317, _323, _319);
    bool _327 = !_293;
    float _343;
    if (!_327)
    {
        float _329 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _331 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _335 = _333 * _329;
        float _337 = floor(_335);
        float _339 = -_337;
        float _341 = _335 + _339;
        _343 = _341;
        _345 = true;
    }
    else
    {
        float _347 = float(_63);
        float _349 = 1.0 / _347;
        float _351 = _97 * _349;
        _343 = _351;
    }
    _345 = false;
    float _353 = _343;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _371 = 1.0 / _357;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _377 = _373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _379 = 1.0 / _361;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _383 = _353 + _381;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _389 = _375 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _391 = _385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _393 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _395 = 1.0 / _365;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _399 = _353 + _397;
    float _401 = _383 * _371;
    bool _403 = _353 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _405 = isnan(_353);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    out.m_37.x = _377;
    out.m_37.y = _389;
    out.m_37.z = _391;
    out.m_37.w = _387;
    float _415 = 1.0 / _369;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _419 = _353 + _417;
    float _421 = _399 * _379;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _425 = _353 + _423;
    float _427 = _419 * _395;
    bool _429 = _353 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _431 = isnan(_353);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = -_413;
    float _443 = _441 + 1.0;
    bool _445 = _353 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _447 = isnan(_353);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = _439 * _443;
    float _459 = -_439;
    float _461 = _459 + 1.0;
    float _463 = _425 * _415;
    bool _465 = _353 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _467 = isnan(_353);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    bool _477 = _353 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _479 = isnan(_353);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = -_475;
    float _491 = _489 + 1.0;
    float _493 = _475 * _461;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _507 = _455 * _491;
    float _509 = -_455;
    float _511 = _509 + 1.0;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _513;
    float _517 = fma(_501, _421, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _519 = fma(_505, _421, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _521 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _523 = fma(_497, _401, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _525 = _487 * _511;
    float _527 = fma(_515, _401, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _529 = -_487;
    float _531 = _529 + 1.0;
    float _533 = _523 * _525;
    float _535 = _521 * _117;
    float _537 = _527 * _525;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _539;
    float _543 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[143].x, _533);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _545;
    float _549 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[143].y, _537);
    float _551 = trunc(_535);
    int _553 = int(_551);
    float _555 = fma(_517, _507, _543);
    float _557 = fma(_541, _427, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _559 = fma(_547, _427, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _569 = fma(_519, _507, _549);
    float _571 = fma(_557, _493, _555);
    float _573 = fma(_563, _463, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _575 = fma(_567, _463, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _577 = fma(_559, _493, _569);
    float _579 = fma(_573, _457, _571);
    float _581 = fma(_575, _457, _577);
    float _583 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[147].x, _579);
    float _585 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[147].y, _581);
    int _587 = _553 << 4;
    int _589 = _587 + 1968;
    bool _591 = !_393;
    float _607;
    if (!_591)
    {
        float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _595 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _597 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[11].w, _97);
        float _599 = _597 * _593;
        float _601 = floor(_599);
        float _603 = -_601;
        float _605 = _599 + _603;
        _607 = _605;
        _609 = true;
    }
    else
    {
        float _611 = float(_63);
        float _613 = 1.0 / _611;
        float _615 = _97 * _613;
        _607 = _615;
    }
    _609 = false;
    float _617 = _607;
    float _619 = as_type<float>(int(gl_VertexIndex));
    float _621 = _313 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _623 = in.m_33.w;
    float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _627 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[5].x, _621);
    float _629 = in.m_35.x;
    float _631 = in.m_35.y;
    float _633 = in.m_33.z;
    float _635 = in.m_33.y;
    int _637 = as_type<int>(_619) & 1;
    bool _639 = _637 != 0;
    int _641 = as_type<int>(_619) & 2;
    bool _643 = _641 != 0;
    bool _645 = _117 > 0.5;
    int _647 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _649 = _647 != 0;
    bool _651 = !_639;
    float _653 = _651 ? (-0.5) : 0.5;
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _657 = _655 != 0;
    float _659 = _585 * _631;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _663 = _661 != 0;
    float _665 = _583 * _629;
    int _667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _669 = _667 != 0;
    float _671 = -_653;
    int _673 = _645 ? as_type<int>(_671) : as_type<int>(_653);
    float _675 = _325 * _665;
    bool _677 = _623 > 0.5;
    float _679 = _313 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _681 = _313 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _683 = _675 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _685 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[4].x, _679);
    float _687 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[6].x, _681);
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _691 = _117 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _693 = _633 > 0.5;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _701 = _635 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _703 = 1.0 / _697;
    float _705 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[78].z, _689);
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _709 = -_699;
    float _711 = fma(_691, 2.0, _709);
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _715 = fma(_701, -2.0, _707);
    float _717 = _325 * _659;
    float _719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _721;
    bool _725 = !_649;
    float _727 = _725 ? _653 : as_type<float>(_673);
    float _729 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[4].z, _685);
    bool _731 = _635 > 0.5;
    float _733 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[78].w, _713);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _737 = _617 + _735;
    float _739 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[5].z, _627);
    float _741 = _723 * _703;
    float _743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _745 = -_97;
    float _747 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[76].x, _711);
    float _749 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[76].y, _715);
    float _751 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _653);
    float _753 = fma(_741, _737, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _755 = !_643;
    float _757 = _755 ? (-0.5) : 0.5;
    float _759 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[6].z, _687);
    float _761 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[77].z, _705);
    float _763 = _683 * _751;
    bool _765 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _767 = isnan(_617);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[77].w, _733);
    float _779 = -_653;
    int _781 = _693 ? as_type<int>(_779) : as_type<int>(_653);
    float _783 = _719 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _785 = -_757;
    int _787 = _731 ? as_type<int>(_785) : as_type<int>(_757);
    float _789 = -_775;
    float _791 = _789 + 1.0;
    float _793 = -_757;
    int _795 = _677 ? as_type<int>(_793) : as_type<int>(_757);
    float _797 = _717 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _799 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _801 = isnan(_617);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _807 = _803 || _805;
    float _809 = float(_807);
    float _811 = _743 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _813 = !_663;
    float _815 = _813 ? _653 : as_type<float>(_781);
    float _817 = _739 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _819 = !_657;
    float _821 = _819 ? _757 : as_type<float>(_787);
    float _823 = _729 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _825 = !_669;
    float _827 = _825 ? _757 : as_type<float>(_795);
    float _829 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _757);
    float _831 = _809 * _791;
    float _833 = _727 + 0.5;
    float _835 = _821 + (-0.5);
    float _837 = _797 * _829;
    float _839 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _841 = fma(_783, _833, _747);
    float _843 = -_811;
    float _845 = -_749;
    float _847 = fma(_843, _835, _845);
    float _849 = _837 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _851 = _837 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _853 = _837 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _855 = _753 * _831;
    float _857 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[24].x, _849);
    float _859 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[25].x, _851);
    float _861 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[26].x, _853);
    uint _864 = uint(int(uint(_589) >> uint(2)));
    uint _866 = uint(int(uint(int(_864)) >> uint(2)));
    int _868 = int(_864) & 3;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[int(_866)][_868];
    int _872 = int(_864) + 1;
    uint _874 = uint(int(uint(_872) >> uint(2)));
    int _876 = _872 & 3;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[int(_874)][_876];
    float _880 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[24].z, _857);
    float _882 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[25].z, _859);
    float _884 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[26].z, _861);
    float _886 = -_809;
    float _888 = _886 + 1.0;
    float _890 = _880 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _892 = _882 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _894 = _884 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _896 = _589 + 8;
    uint _898 = uint(int(uint(_896) >> uint(2)));
    uint _900 = uint(int(uint(int(_898)) >> uint(2)));
    int _902 = int(_898) & 3;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[int(_900)][_902];
    float _906 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[131].x, _855);
    float _908 = _817 + _892;
    float _910 = _823 + _890;
    float _912 = _759 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _914 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[132].x, _906);
    float _916 = _908 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _918 = _908 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _920 = _912 + _894;
    float _922 = _908 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _924 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[1].x, _916);
    float _926 = _908 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _928 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[0].x, _918);
    float _930 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[2].x, _922);
    float _932 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[1].z, _924);
    float _934 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[3].x, _926);
    float _936 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _938 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[0].z, _928);
    float _940 = _932 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _942 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[2].z, _930);
    float _944 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[3].z, _934);
    float _946 = _938 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _948 = _940 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _950 = _940 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _952 = _940 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _954 = _940 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _956 = _815 + 0.5;
    float _958 = _942 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _960 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[4].x, _948);
    float _962 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[5].x, _950);
    float _964 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[6].x, _952);
    float _966 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[7].x, _954);
    float _968 = -_827;
    float _970 = _968 + 0.5;
    float _972 = -_761;
    float _974 = _972 + 1.0;
    float _976 = -_777;
    float _978 = _976 + 1.0;
    float _980 = _956 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _982 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[4].z, _960);
    float _984 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[5].z, _962);
    float _986 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[6].z, _964);
    float _988 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[7].z, _966);
    float _990 = _870 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _992 = _878 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _994 = _970 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _996 = _944 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _998 = -_974;
    float _1000 = fma(_727, _998, _841);
    float _1002 = fma(_821, _978, _847);
    float _1004 = _980 * _936;
    float _1006 = _994 * _625;
    float _1008 = _904 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1010 = _990 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1012 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1014 = _1008 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1016 = _914 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1018 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[4].w, _982);
    float _1020 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[5].w, _984);
    float _1022 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[6].w, _986);
    float _1024 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[7].w, _988);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_42.x = _1000;
    out.m_42.y = _1002;
    out.m_42.z = _1004;
    out.m_42.w = _1006;
    out.m_44.x = _1010;
    out.m_44.y = _1012;
    out.m_44.z = _1014;
    out.m_44.w = _1016;
    out.gl_Position.x = _1018;
    out.gl_Position.y = _1020;
    out.gl_Position.z = _1022;
    out.gl_Position.w = _1024;
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
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    bool _609 = false;
    bool _345 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_26.w;
    float _60 = trunc(_58);
    int _63 = int(_60);
    bool _67 = _63 >= 1;
    float _69 = 0.0;
    if (!_67)
    {
        _69 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _71 = _69;
    float _73 = _71;
    if (!_67)
    {
        out.m_29.x = 0.0;
    }
    int _75 = 0;
    if (!_67)
    {
        float _77 = _71 * 5.0;
        _75 = as_type<int>(_77);
    }
    int _79 = _75;
    int _81 = _79;
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1081 = as_type<float>(_79);
        out.gl_Position.z = _1081;
    }
    if (!_67)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _83 = in.m_31.w;
    bool _85 = _83 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _87 = isnan(_83);
    bool _89 = _85 || _87;
    bool _91 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _93 = _89 || _91;
    float _95 = -_83;
    float _97 = _95 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_93)
    {
        float _99 = float(_63);
        _73 = _99;
    }
    float _101 = _73;
    bool _103 = _97 >= _101;
    bool _105 = !_93;
    bool _107 = _103 || _105;
    float _109 = _101;
    if (_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    if (_107)
    {
        out.m_29.x = 0.0;
    }
    if (_107)
    {
        float _113 = _111 * 5.0;
        _81 = as_type<int>(_113);
    }
    int _115 = _81;
    if (_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1150 = as_type<float>(_115);
        out.gl_Position.z = _1150;
    }
    if (_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _117 = in.m_33.x;
    float _119 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _121 = _97 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _123 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _125 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _127 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _129 = _125 || _127;
    bool _131 = isnan(1.0);
    bool _133 = _129 || _131;
    int _135 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _137 = _135 != 0;
    float _139 = _121 * _119;
    float _141 = 0.0;
    float _143 = _123;
    if (!_133)
    {
        float _145 = _123 * _123;
        float _147 = _145 * 0.5;
        _141 = _147;
    }
    float _149 = _141;
    float _151 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[20].x, _139);
    float _153 = _149;
    if (!_133)
    {
        float _155 = _149 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _153 = _155;
    }
    float _157 = _153;
    float _159 = in.m_31.x;
    float _161 = in.m_31.y;
    float _163 = in.m_31.z;
    float _165 = _151 * 6.283185482025146484375;
    float _167 = floor(_151);
    float _169 = _165 * 0.15915493667125701904296875;
    float _171 = _169 * 6.283185482025146484375;
    float _173 = cos(_171);
    float _175 = -_167;
    float _177 = _151 + _175;
    bool _179 = !_133;
    float _181 = _157;
    if (!_179)
    {
        float _183 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _185 = log2(_183);
        float _187 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _189 = _187 + 1.0;
        float _191 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = _123 * _185;
        float _195 = 1.0 / _189;
        float _197 = _191 * 0.693147182464599609375;
        float _199 = exp2(_193);
        float _201 = 1.0 / _197;
        float _203 = _199 + (-1.0);
        float _205 = -_203;
        float _207 = fma(_205, _201, _123);
        float _209 = _207 * _195;
        float _211 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _211;
    }
    float _213 = _181;
    bool _215 = !_133;
    if (!_215)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = 1.0 / _223;
        float _227 = _123 * _219;
        float _229 = exp2(_227);
        float _231 = -_229;
        float _233 = _231 + 1.0;
        float _235 = _233 * _225;
        _143 = _235;
    }
    float _237 = _143;
    int _239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _241 = _239 != 0;
    int _243 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _245 = _243 != 0;
    float _247 = in.m_35.w;
    float _249 = in.m_26.x;
    float _251 = in.m_26.y;
    float _253 = in.m_26.z;
    bool _255 = _177 < 0.5;
    float _257 = float(_255);
    float _259 = -_177;
    float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _263 = !_241;
    int _265 = _263 ? 0 : 1;
    float _267 = fma(_173, 0.5, 0.5);
    float _269 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = -_257;
    float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _275 = !_137;
    int _277 = _275 ? 0 : 1;
    float _279 = -_267;
    float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _283 = abs(_265);
    float _285 = fma(_237, _159, _269);
    bool _287 = !_245;
    int _289 = _287 ? 0 : 1;
    float _291 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _293 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _295 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _297 = abs(_277);
    float _299 = fma(_237, _161, _291);
    int _301 = abs(_289);
    float _303 = fma(_237, _163, _295);
    float _305 = float(_283);
    float _307 = float(_297);
    float _309 = abs(_261);
    float _311 = _305 * _309;
    float _313 = fma(_299, _247, _251);
    float _315 = fma(_285, _247, _249);
    float _317 = float(_301);
    float _319 = fma(_307, _281, _311);
    float _321 = fma(_303, _247, _253);
    float _323 = abs(_273);
    float _325 = fma(_317, _323, _319);
    bool _327 = !_293;
    float _343;
    if (!_327)
    {
        float _329 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _331 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _335 = _333 * _329;
        float _337 = floor(_335);
        float _339 = -_337;
        float _341 = _335 + _339;
        _343 = _341;
        _345 = true;
    }
    else
    {
        float _347 = float(_63);
        float _349 = 1.0 / _347;
        float _351 = _97 * _349;
        _343 = _351;
    }
    _345 = false;
    float _353 = _343;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _371 = 1.0 / _357;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _377 = _373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _379 = 1.0 / _361;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _383 = _353 + _381;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _389 = _375 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _391 = _385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _393 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _395 = 1.0 / _365;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _399 = _353 + _397;
    float _401 = _383 * _371;
    bool _403 = _353 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _405 = isnan(_353);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    out.m_37.x = _377;
    out.m_37.y = _389;
    out.m_37.z = _391;
    out.m_37.w = _387;
    float _415 = 1.0 / _369;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _419 = _353 + _417;
    float _421 = _399 * _379;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _425 = _353 + _423;
    float _427 = _419 * _395;
    bool _429 = _353 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _431 = isnan(_353);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = -_413;
    float _443 = _441 + 1.0;
    bool _445 = _353 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _447 = isnan(_353);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = _439 * _443;
    float _459 = -_439;
    float _461 = _459 + 1.0;
    float _463 = _425 * _415;
    bool _465 = _353 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _467 = isnan(_353);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    bool _477 = _353 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _479 = isnan(_353);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = -_475;
    float _491 = _489 + 1.0;
    float _493 = _475 * _461;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _507 = _455 * _491;
    float _509 = -_455;
    float _511 = _509 + 1.0;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _513;
    float _517 = fma(_501, _421, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _519 = fma(_505, _421, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _521 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _523 = fma(_497, _401, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _525 = _487 * _511;
    float _527 = fma(_515, _401, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _529 = -_487;
    float _531 = _529 + 1.0;
    float _533 = _523 * _525;
    float _535 = _521 * _117;
    float _537 = _527 * _525;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _539;
    float _543 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[143].x, _533);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _545;
    float _549 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[143].y, _537);
    float _551 = trunc(_535);
    int _553 = int(_551);
    float _555 = fma(_517, _507, _543);
    float _557 = fma(_541, _427, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _559 = fma(_547, _427, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _569 = fma(_519, _507, _549);
    float _571 = fma(_557, _493, _555);
    float _573 = fma(_563, _463, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _575 = fma(_567, _463, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _577 = fma(_559, _493, _569);
    float _579 = fma(_573, _457, _571);
    float _581 = fma(_575, _457, _577);
    float _583 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[147].x, _579);
    float _585 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[147].y, _581);
    int _587 = _553 << 4;
    int _589 = _587 + 1968;
    bool _591 = !_393;
    float _607;
    if (!_591)
    {
        float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _595 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _597 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[11].w, _97);
        float _599 = _597 * _593;
        float _601 = floor(_599);
        float _603 = -_601;
        float _605 = _599 + _603;
        _607 = _605;
        _609 = true;
    }
    else
    {
        float _611 = float(_63);
        float _613 = 1.0 / _611;
        float _615 = _97 * _613;
        _607 = _615;
    }
    _609 = false;
    float _617 = _607;
    float _619 = as_type<float>(int(gl_VertexIndex));
    float _621 = _313 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _623 = in.m_33.w;
    float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _627 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[5].x, _621);
    float _629 = in.m_35.x;
    float _631 = in.m_35.y;
    float _633 = in.m_33.z;
    float _635 = in.m_33.y;
    int _637 = as_type<int>(_619) & 1;
    bool _639 = _637 != 0;
    int _641 = as_type<int>(_619) & 2;
    bool _643 = _641 != 0;
    bool _645 = _117 > 0.5;
    int _647 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _649 = _647 != 0;
    bool _651 = !_639;
    float _653 = _651 ? (-0.5) : 0.5;
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _657 = _655 != 0;
    float _659 = _585 * _631;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _663 = _661 != 0;
    float _665 = _583 * _629;
    int _667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _669 = _667 != 0;
    float _671 = -_653;
    int _673 = _645 ? as_type<int>(_671) : as_type<int>(_653);
    float _675 = _325 * _665;
    bool _677 = _623 > 0.5;
    float _679 = _313 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _681 = _313 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _683 = _675 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _685 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[4].x, _679);
    float _687 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[6].x, _681);
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _691 = _117 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _693 = _633 > 0.5;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _701 = _635 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _703 = 1.0 / _697;
    float _705 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[78].z, _689);
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _709 = -_699;
    float _711 = fma(_691, 2.0, _709);
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _715 = fma(_701, -2.0, _707);
    float _717 = _325 * _659;
    float _719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _721;
    bool _725 = !_649;
    float _727 = _725 ? _653 : as_type<float>(_673);
    float _729 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[4].z, _685);
    bool _731 = _635 > 0.5;
    float _733 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[78].w, _713);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _737 = _617 + _735;
    float _739 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[5].z, _627);
    float _741 = _723 * _703;
    float _743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _745 = -_97;
    float _747 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[76].x, _711);
    float _749 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[76].y, _715);
    float _751 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _653);
    float _753 = fma(_741, _737, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _755 = !_643;
    float _757 = _755 ? (-0.5) : 0.5;
    float _759 = fma(_321, (*spvDescriptorSet0.vp_c10)._m0[6].z, _687);
    float _761 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[77].z, _705);
    float _763 = _683 * _751;
    bool _765 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _767 = isnan(_617);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[77].w, _733);
    float _779 = -_653;
    int _781 = _693 ? as_type<int>(_779) : as_type<int>(_653);
    float _783 = _719 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _785 = -_757;
    int _787 = _731 ? as_type<int>(_785) : as_type<int>(_757);
    float _789 = -_775;
    float _791 = _789 + 1.0;
    float _793 = -_757;
    int _795 = _677 ? as_type<int>(_793) : as_type<int>(_757);
    float _797 = _717 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _799 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _801 = isnan(_617);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _807 = _803 || _805;
    float _809 = float(_807);
    float _811 = _743 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _813 = !_663;
    float _815 = _813 ? _653 : as_type<float>(_781);
    float _817 = _739 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _819 = !_657;
    float _821 = _819 ? _757 : as_type<float>(_787);
    float _823 = _729 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _825 = !_669;
    float _827 = _825 ? _757 : as_type<float>(_795);
    float _829 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _757);
    float _831 = _809 * _791;
    float _833 = _727 + 0.5;
    float _835 = _821 + (-0.5);
    float _837 = _797 * _829;
    float _839 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _841 = fma(_783, _833, _747);
    float _843 = -_811;
    float _845 = -_749;
    float _847 = fma(_843, _835, _845);
    float _849 = _837 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _851 = _837 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _853 = _837 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _855 = _753 * _831;
    float _857 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[24].x, _849);
    float _859 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[25].x, _851);
    float _861 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[26].x, _853);
    uint _864 = uint(int(uint(_589) >> uint(2)));
    uint _866 = uint(int(uint(int(_864)) >> uint(2)));
    int _868 = int(_864) & 3;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[int(_866)][_868];
    int _872 = int(_864) + 1;
    uint _874 = uint(int(uint(_872) >> uint(2)));
    int _876 = _872 & 3;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[int(_874)][_876];
    float _880 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[24].z, _857);
    float _882 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[25].z, _859);
    float _884 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[26].z, _861);
    float _886 = -_809;
    float _888 = _886 + 1.0;
    float _890 = _880 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _892 = _882 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _894 = _884 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _896 = _589 + 8;
    uint _898 = uint(int(uint(_896) >> uint(2)));
    uint _900 = uint(int(uint(int(_898)) >> uint(2)));
    int _902 = int(_898) & 3;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[int(_900)][_902];
    float _906 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[131].x, _855);
    float _908 = _817 + _892;
    float _910 = _823 + _890;
    float _912 = _759 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _914 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[132].x, _906);
    float _916 = _908 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _918 = _908 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _920 = _912 + _894;
    float _922 = _908 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _924 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[1].x, _916);
    float _926 = _908 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _928 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[0].x, _918);
    float _930 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[2].x, _922);
    float _932 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[1].z, _924);
    float _934 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[3].x, _926);
    float _936 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _938 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[0].z, _928);
    float _940 = _932 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _942 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[2].z, _930);
    float _944 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[3].z, _934);
    float _946 = _938 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _948 = _940 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _950 = _940 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _952 = _940 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _954 = _940 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _956 = _815 + 0.5;
    float _958 = _942 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _960 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[4].x, _948);
    float _962 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[5].x, _950);
    float _964 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[6].x, _952);
    float _966 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[7].x, _954);
    float _968 = -_827;
    float _970 = _968 + 0.5;
    float _972 = -_761;
    float _974 = _972 + 1.0;
    float _976 = -_777;
    float _978 = _976 + 1.0;
    float _980 = _956 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _982 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[4].z, _960);
    float _984 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[5].z, _962);
    float _986 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[6].z, _964);
    float _988 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[7].z, _966);
    float _990 = _870 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _992 = _878 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _994 = _970 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _996 = _944 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _998 = -_974;
    float _1000 = fma(_727, _998, _841);
    float _1002 = fma(_821, _978, _847);
    float _1004 = _980 * _936;
    float _1006 = _994 * _625;
    float _1008 = _904 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1010 = _990 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1012 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1014 = _1008 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1016 = _914 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1018 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[4].w, _982);
    float _1020 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[5].w, _984);
    float _1022 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[6].w, _986);
    float _1024 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[7].w, _988);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_42.x = _1000;
    out.m_42.y = _1002;
    out.m_42.z = _1004;
    out.m_42.w = _1006;
    out.m_44.x = _1010;
    out.m_44.y = _1012;
    out.m_44.z = _1014;
    out.m_44.w = _1016;
    out.gl_Position.x = _1018;
    out.gl_Position.y = _1020;
    out.gl_Position.z = _1022;
    out.gl_Position.w = _1024;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

