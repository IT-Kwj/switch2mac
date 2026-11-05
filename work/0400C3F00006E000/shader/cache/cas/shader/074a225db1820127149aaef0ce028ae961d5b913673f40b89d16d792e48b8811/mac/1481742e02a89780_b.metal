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
    float4 m_46 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_48 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_44 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1287 = false;
    bool _625 = false;
    bool _285 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_32.w;
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
        out.m_35.x = 0.0;
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
        float _1474 = as_type<float>(_87);
        out.gl_Position.z = _1474;
    }
    if (!_75)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _91 = in.m_37.w;
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
        out.m_35.x = 0.0;
    }
    if (_115)
    {
        float _121 = _119 * 5.0;
        _89 = as_type<int>(_121);
    }
    int _123 = _89;
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1543 = as_type<float>(_123);
        out.gl_Position.z = _1543;
    }
    if (_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = as_type<float>(int(gl_VertexIndex));
    float _127 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _129 = in.m_42.w;
    bool _131 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _133 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _135 = _131 || _133;
    bool _137 = isnan(1.0);
    bool _139 = _135 || _137;
    float _141 = in.m_37.x;
    float _143 = in.m_37.y;
    float _145 = in.m_37.z;
    float _147 = in.m_32.x;
    float _149 = in.m_32.y;
    float _151 = in.m_32.z;
    int _153 = as_type<int>(_125) & 1;
    bool _155 = _153 != 0;
    int _157 = as_type<int>(_125) & 2;
    bool _159 = _157 != 0;
    float _161 = _125;
    float _163 = _127;
    if (!_139)
    {
        float _165 = _127 * _127;
        float _167 = _165 * 0.5;
        _161 = _167;
    }
    float _169 = _161;
    bool _171 = !_155;
    float _173 = _171 ? (-0.5) : 0.5;
    float _175 = _169;
    if (!_139)
    {
        float _177 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    bool _181 = !_159;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_139;
    float _187 = _179;
    if (!_185)
    {
        float _189 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _191 = log2(_189);
        float _193 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _195 = _193 + 1.0;
        float _197 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = _127 * _191;
        float _201 = 1.0 / _195;
        float _203 = _197 * 0.693147182464599609375;
        float _205 = exp2(_199);
        float _207 = 1.0 / _203;
        float _209 = _205 + (-1.0);
        float _211 = -_209;
        float _213 = fma(_211, _207, _127);
        float _215 = _213 * _201;
        float _217 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _217;
    }
    float _219 = _187;
    bool _221 = !_139;
    if (!_221)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = 1.0 / _229;
        float _233 = _127 * _225;
        float _235 = exp2(_233);
        float _237 = -_235;
        float _239 = _237 + 1.0;
        float _241 = _239 * _231;
        _163 = _241;
    }
    float _243 = _163;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _247 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _249 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _251 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _253 = fma(_243, _141, _247);
    float _255 = fma(_243, _143, _249);
    float _257 = fma(_243, _145, _251);
    float _259 = fma(_253, _129, _147);
    float _261 = fma(_255, _129, _149);
    float _263 = fma(_257, _129, _151);
    bool _265 = !_245;
    float _283;
    if (!_265)
    {
        float _267 = in.m_44.x;
        float _269 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _271 = _267 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _275 = _273 * _269;
        float _277 = floor(_275);
        float _279 = -_277;
        float _281 = _275 + _279;
        _283 = _281;
        _285 = true;
    }
    else
    {
        float _287 = float(_71);
        float _289 = 1.0 / _287;
        float _291 = _105 * _289;
        _283 = _291;
    }
    _285 = false;
    float _293 = _283;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = _293 + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _315;
    float _319 = 1.0 / _305;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _325 = 1.0 / _309;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _329 = _293 + _327;
    bool _331 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _333 = 1.0 / _301;
    float _335 = _329 * _319;
    bool _337 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _339 = isnan(_293);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    bool _349 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _351 = isnan(_293);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = 1.0 / _323;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _365 = _293 + _363;
    float _367 = _297 * _325;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _371 = _293 + _369;
    float _373 = -_359;
    float _375 = _373 + 1.0;
    float _377 = 1.0 / _313;
    float _379 = _365 * _333;
    float _381 = -_347;
    float _383 = _381 + 1.0;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _387 = _293 + _385;
    float _389 = 1.0 / _317;
    bool _391 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _393 = isnan(_293);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = _371 * _361;
    bool _405 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _407 = isnan(_293);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = _401 * _383;
    float _419 = -_401;
    float _421 = _419 + 1.0;
    float _423 = _387 * _377;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _427 = _293 + _425;
    bool _429 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _431 = isnan(_293);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = _415 * _421;
    float _443 = -_415;
    float _445 = _443 + 1.0;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _447;
    float _451 = _439 * _375;
    float _453 = _427 * _389;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _455;
    float _459 = _359 * _445;
    bool _461 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _463 = isnan(_293);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = fma(_449, _379, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _475 = fma(_457, _379, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _477 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _479 = isnan(_293);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = -_439;
    float _491 = _489 + 1.0;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _497 = -_471;
    float _499 = _497 + 1.0;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _501;
    float _505 = _471 * _491;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _507;
    float _511 = _487 * _499;
    float _513 = fma(_503, _367, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _519 = fma(_509, _367, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _521 = _475 * _511;
    float _523 = _473 * _511;
    float _525 = -_487;
    float _527 = _525 + 1.0;
    float _529 = fma(_495, _335, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _531 = fma(_517, _335, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _533 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[143].x, _523);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _543 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[143].y, _521);
    float _545 = fma(_529, _505, _533);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _547;
    float _551 = fma(_537, _423, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _553 = fma(_541, _423, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _555;
    float _559 = in.m_42.x;
    float _561 = in.m_42.y;
    float _563 = fma(_531, _505, _543);
    float _565 = fma(_549, _453, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _567 = fma(_557, _453, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _569 = fma(_513, _451, _545);
    float _571 = fma(_519, _451, _563);
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _581 = fma(_551, _459, _569);
    float _583 = fma(_553, _459, _571);
    float _585 = fma(_575, _403, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _587 = fma(_579, _403, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _589 = fma(_565, _441, _581);
    float _591 = fma(_567, _441, _583);
    float _593 = fma(_585, _417, _589);
    float _595 = fma(_587, _417, _591);
    float _597 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[149].x, _593);
    float _599 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[149].y, _595);
    float _601 = _597 * _559;
    float _603 = _599 * _561;
    bool _605 = !_331;
    float _623;
    if (!_605)
    {
        float _607 = in.m_44.x;
        float _609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _611 = _607 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _613 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _615 = _613 * _609;
        float _617 = floor(_615);
        float _619 = -_617;
        float _621 = _615 + _619;
        _623 = _621;
        _625 = true;
    }
    else
    {
        float _627 = float(_71);
        float _629 = 1.0 / _627;
        float _631 = _105 * _629;
        _623 = _631;
    }
    _625 = false;
    float _633 = _623;
    float _635 = in.m_44.x;
    float _637 = in.m_44.y;
    float _639 = in.m_44.z;
    float _641 = in.m_44.w;
    float _643 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _645 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _651 = _649 != 0;
    float _653 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _643);
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _657 = _655 != 0;
    float _659 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _645);
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _663 = _661 != 0;
    float _665 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _653);
    int _667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _669 = _667 != 0;
    float _671 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _659);
    float _673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _679 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _681 = _641 > 0.5;
    float _683 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _687 = _635 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _689 = _639 > 0.5;
    float _691 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _683);
    float _693 = -_685;
    float _695 = fma(_687, 2.0, _693);
    float _697 = 1.0 / _677;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _703 = _637 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _707 = _635 > 0.5;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _711 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _691);
    float _713 = 1.0 / _701;
    float _715 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[78].z, _705);
    float _717 = fma(_703, -2.0, _709);
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _721 = -_105;
    float _723 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[76].x, _695);
    float _725 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[78].w, _719);
    float _727 = -_173;
    int _729 = _707 ? as_type<int>(_727) : as_type<int>(_173);
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _733 = _731 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _735;
    bool _739 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _741 = isnan(_633);
    bool _743 = _739 || _741;
    bool _745 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _747 = _743 || _745;
    float _749 = float(_747);
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _753 = _751 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _755 = _733 * _697;
    bool _757 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _759 = isnan(_633);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _717);
    bool _771 = _637 > 0.5;
    float _773 = _737 * _713;
    float _775 = -_749;
    float _777 = _775 + 1.0;
    bool _779 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _781 = isnan(_633);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    float _791 = -_767;
    float _793 = _791 + 1.0;
    float _795 = 1.0 / _753;
    float _797 = _767 * _777;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _801 = _633 + _799;
    float _803 = _789 * _793;
    float _805 = -_789;
    float _807 = _805 + 1.0;
    bool _809 = !_651;
    float _811 = _809 ? _173 : as_type<float>(_729);
    float _813 = fma(_773, _801, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _815 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _715);
    float _817 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _725);
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _819;
    bool _823 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _825 = isnan(_633);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _837 = _633 + _835;
    float _839 = _665 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _843 = _633 + _841;
    float _845 = _671 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _847 = _833 * _807;
    float _849 = -_833;
    float _851 = _849 + 1.0;
    float _853 = fma(_755, _837, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _855 = _821 * _795;
    float _857 = _813 * _847;
    float _859 = _673 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _861 = _811 + 0.5;
    float _863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _865 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[115].x, _857);
    float _867 = fma(_855, _843, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _869 = fma(_859, _861, _723);
    float _871 = _711 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _873 = fma(_853, _803, _865);
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _877 = _839 + _875;
    float _879 = -_173;
    int _881 = _689 ? as_type<int>(_879) : as_type<int>(_173);
    float _883 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _885 = _871 + _883;
    float _887 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _889 = _845 + _887;
    float _891 = -_183;
    int _893 = _771 ? as_type<int>(_891) : as_type<int>(_183);
    float _895 = fma(_867, _797, _873);
    float _897 = _885 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _899 = !_657;
    float _901 = _899 ? _173 : as_type<float>(_881);
    float _903 = _601 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _905 = !_663;
    float _907 = _905 ? _183 : as_type<float>(_893);
    float _909 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[28].x, _897);
    float _911 = -_183;
    int _913 = _681 ? as_type<int>(_911) : as_type<int>(_183);
    float _915 = _901 + 0.5;
    float _917 = _885 * _885;
    float _919 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[28].z, _909);
    bool _921 = !_669;
    float _923 = _921 ? _183 : as_type<float>(_913);
    float _925 = _863 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _927 = _907 + (-0.5);
    float _929 = _903 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _931 = -_923;
    float _933 = _931 + 0.5;
    bool _935 = _919 >= 0.0;
    float _937 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[118].x, _895);
    float _939 = -_815;
    float _941 = _939 + 1.0;
    float _943 = _915 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _945 = _933 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _947 = fma(_877, _877, _917);
    float _949 = -_925;
    float _951 = -_769;
    float _953 = fma(_949, _927, _951);
    float _955 = -_817;
    float _957 = _955 + 1.0;
    float _959 = _945 * _647;
    float _961 = fma(_889, _889, _947);
    float _963 = fma(_907, _957, _953);
    float _965 = -_941;
    float _967 = fma(_811, _965, _869);
    float _969 = rsqrt(_961);
    float _971 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    if (_935)
    {
        _977 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _979 = _977;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _987 = _943 * _679;
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _991 = _975 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _993 = _971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _995 = _985 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _997 = _973 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _999 = _981 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1001 = _983 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1003 = _937 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1005 = as_type<int>(_979);
    float _1007 = _997;
    if (_935)
    {
        float _1009 = _979 * 5.0;
        _1005 = as_type<int>(_1009);
    }
    int _1011 = _1005;
    float _1013 = _929 * _969;
    out.m_46.x = _993;
    out.m_46.y = _995;
    out.m_46.z = _997;
    out.m_46.w = _989;
    float _1015 = _877 * _1013;
    out.m_48.x = _967;
    out.m_48.y = _963;
    out.m_48.z = _987;
    out.m_48.w = _959;
    float _1017 = _885 * _1013;
    out.m_50.x = _991;
    out.m_50.y = _999;
    out.m_50.z = _1001;
    out.m_50.w = _1003;
    if (_935)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3036 = as_type<float>(_1011);
        out.gl_Position.z = _3036;
    }
    if (_935)
    {
        out.m_35.x = 0.0;
    }
    if (_935)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1019 = -_1017;
    float _1021 = _871 + _1019;
    float _1023 = _889 * _1013;
    float _1025 = -_1015;
    float _1027 = _839 + _1025;
    float _1029 = -_1017;
    float _1031 = _885 + _1029;
    float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1035 = _1021 + _1033;
    float _1037 = -_1023;
    float _1039 = _845 + _1037;
    float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1043 = _1027 + _1041;
    float _1045 = -_1015;
    float _1047 = _877 + _1045;
    float _1049 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1051 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1053 = _1039 + _1051;
    float _1055 = _1031 * _1031;
    float _1057 = -_1023;
    float _1059 = _889 + _1057;
    float _1061 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1049);
    float _1063 = fma(_1047, _1047, _1055);
    float _1065 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1061);
    float _1067 = fma(_1059, _1059, _1063);
    bool _1069 = _1065 >= 0.0;
    float _1071 = sqrt(_1067);
    if (_1069)
    {
        _1007 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1073 = _1007;
    int _1075 = as_type<int>(_1073);
    if (_1069)
    {
        out.m_35.x = 0.0;
    }
    if (_1069)
    {
        float _1077 = _1073 * 5.0;
        _1075 = as_type<int>(_1077);
    }
    int _1079 = _1075;
    float _1081 = _969 * _1071;
    if (_1069)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3154 = as_type<float>(_1079);
        out.gl_Position.z = _3154;
    }
    if (_1069)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1083 = _603 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1085 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1087 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    float _1089 = _903 * _1081;
    float _1091 = _1081 * _1083;
    float _1093 = _1081 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1095 = _1093 * 0.5;
    float _1097 = _1087 * _1089;
    float _1099 = _1085 * _1091;
    float _1101 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1103 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1105 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1101);
    float _1107 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1103);
    float _1109 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1105);
    float _1111 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1107);
    float _1113 = _1109 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1115 = _1111 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1117 = _839 + _1113;
    float _1119 = _845 + _1115;
    float _1121 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1123 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1125 = _1117 + _1123;
    float _1127 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1129 = _1119 + _1127;
    float _1131 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1121);
    float _1133 = _1125 * _1125;
    float _1135 = _1129 * _1129;
    float _1137 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1131);
    float _1139 = _1133 + _1135;
    float _1141 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1143 = sqrt(_1139);
    float _1145 = _871 + _1141;
    bool _1147 = _1143 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1149 = _1095;
    float _1151 = _1099;
    float _1153 = _1121;
    float _1155 = _1135;
    float _1157 = _1117;
    if (!_1147)
    {
        _1149 = _1133;
    }
    float _1159 = _1149;
    float _1161 = _1159;
    if (!_1147)
    {
        _1151 = _1119;
    }
    float _1163 = _1151;
    float _1165 = _1163;
    if (!_1147)
    {
        _1153 = _1145;
    }
    float _1167 = _1153;
    bool _1169 = !_1147;
    float _1171 = _1167;
    if (!_1169)
    {
        float _1173 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1175 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1177 = _1143 + _1175;
        float _1179 = _1145 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1181 = rsqrt(_1139);
        float _1183 = _1177 * _1173;
        float _1185 = _1183 * 0.15915493667125701904296875;
        float _1187 = _1185 * 6.283185482025146484375;
        float _1189 = sin(_1187);
        float _1191 = _1185 * 6.283185482025146484375;
        float _1193 = cos(_1191);
        float _1195 = fma(_1189, _1179, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1197 = _1181 * _1195;
        float _1199 = _1193 + (-1.0);
        float _1201 = fma(_1125, _1197, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1203 = fma(_1129, _1197, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1205 = _1199 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1207 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1209 = _1201 + _1207;
        float _1211 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1213 = _1203 + _1211;
        float _1215 = fma(_1145, _1193, _1205);
        float _1217 = _1209 * _1209;
        float _1219 = _1213 * _1213;
        _1171 = _1215;
        _1161 = _1217;
        _1155 = _1219;
        _1157 = _1201;
        _1165 = _1203;
    }
    float _1221 = _1171;
    float _1223 = _1161;
    float _1225 = _1155;
    float _1227 = _1157;
    float _1229 = _1165;
    float _1231 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1233 = _1221 + _1231;
    float _1235 = fma(_1233, _1233, _1223);
    float _1237 = _1235 + _1225;
    float _1239 = sqrt(_1237);
    bool _1241 = _1239 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1243 = isnan(_1239);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1249 = _1245 || _1247;
    float _1251 = _1223;
    if (!_1249)
    {
        _1251 = 1.0;
    }
    float _1253 = _1251;
    bool _1255 = !_1249;
    float _1257 = _1253;
    if (!_1255)
    {
        bool _1259 = _1239 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1261 = isnan(_1239);
        bool _1263 = _1259 || _1261;
        bool _1265 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1267 = _1263 || _1265;
        if (!_1267)
        {
            float _1269 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1271 = _1239 + _1269;
            float _1273 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1275 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1273;
            float _1277 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1279 = _1277 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1281 = 1.0 / _1275;
            float _1283 = _1271 * _1281;
            float _1285 = fma(_1283, _1279, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1257 = _1285;
            _1287 = true;
        }
        else
        {
            bool _1289 = _1239 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1291 = isnan(_1239);
            bool _1293 = _1289 || _1291;
            bool _1295 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1297 = _1293 || _1295;
            if (!_1297)
            {
                float _1299 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1301 = _1239 + _1299;
                float _1303 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1305 = _1303 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1307 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1309 = _1307 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1311 = 1.0 / _1305;
                float _1313 = _1301 * _1311;
                float _1315 = fma(_1313, _1309, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1257 = _1315;
                _1287 = true;
            }
            else
            {
                _1257 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1287 = false;
    float _1317 = _1257;
    float _1319 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1321 = _1221 + _1319;
    float _1323 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1325 = _1227 + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1329 = _1229 + _1327;
    float _1331 = fma(_1321, _1317, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1333 = fma(_1325, _1317, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1335 = fma(_1329, _1317, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1337 = -_1017;
    float _1339 = _1337 + _1331;
    float _1341 = -_1015;
    float _1343 = _1341 + _1333;
    float _1345 = -_1023;
    float _1347 = _1345 + _1335;
    float _1349 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1351 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1353 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1355 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1357 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1349);
    float _1359 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1351);
    float _1361 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1353);
    float _1363 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1355);
    float _1365 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1357);
    float _1367 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1359);
    float _1369 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1361);
    float _1371 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1363);
    float _1373 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1375 = _1367 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1377 = _1369 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1379 = _1371 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1381 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1383 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1385 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1387 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1389 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1381);
    float _1391 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1383);
    float _1393 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1385);
    float _1395 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1387);
    float _1397 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1389);
    float _1399 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1391);
    float _1401 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1393);
    float _1403 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1395);
    float _1405 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1397);
    float _1407 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1399);
    float _1409 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1401);
    float _1411 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1403);
    float _1413 = _1405 + _1407;
    float _1415 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1417 = _1413 * 0.5;
    out.m_35.x = _1415;
    out.gl_Position.x = _1409;
    out.gl_Position.y = _1411;
    out.gl_Position.z = _1405;
    out.gl_Position.w = _1407;
    out.m_52.z = _1417;
    out.m_52.w = _1407;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1287 = false;
    bool _625 = false;
    bool _285 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_32.w;
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
        out.m_35.x = 0.0;
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
        float _1474 = as_type<float>(_87);
        out.gl_Position.z = _1474;
    }
    if (!_75)
    {
        return out;
    }
    float _91 = in.m_37.w;
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
        out.m_35.x = 0.0;
    }
    if (_115)
    {
        float _121 = _119 * 5.0;
        _89 = as_type<int>(_121);
    }
    int _123 = _89;
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1543 = as_type<float>(_123);
        out.gl_Position.z = _1543;
    }
    if (_115)
    {
        return out;
    }
    float _125 = as_type<float>(int(gl_VertexIndex));
    float _127 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _129 = in.m_42.w;
    bool _131 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _133 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _135 = _131 || _133;
    bool _137 = isnan(1.0);
    bool _139 = _135 || _137;
    float _141 = in.m_37.x;
    float _143 = in.m_37.y;
    float _145 = in.m_37.z;
    float _147 = in.m_32.x;
    float _149 = in.m_32.y;
    float _151 = in.m_32.z;
    int _153 = as_type<int>(_125) & 1;
    bool _155 = _153 != 0;
    int _157 = as_type<int>(_125) & 2;
    bool _159 = _157 != 0;
    float _161 = _125;
    float _163 = _127;
    if (!_139)
    {
        float _165 = _127 * _127;
        float _167 = _165 * 0.5;
        _161 = _167;
    }
    float _169 = _161;
    bool _171 = !_155;
    float _173 = _171 ? (-0.5) : 0.5;
    float _175 = _169;
    if (!_139)
    {
        float _177 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    bool _181 = !_159;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_139;
    float _187 = _179;
    if (!_185)
    {
        float _189 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _191 = log2(_189);
        float _193 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _195 = _193 + 1.0;
        float _197 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = _127 * _191;
        float _201 = 1.0 / _195;
        float _203 = _197 * 0.693147182464599609375;
        float _205 = exp2(_199);
        float _207 = 1.0 / _203;
        float _209 = _205 + (-1.0);
        float _211 = -_209;
        float _213 = fma(_211, _207, _127);
        float _215 = _213 * _201;
        float _217 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _217;
    }
    float _219 = _187;
    bool _221 = !_139;
    if (!_221)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = 1.0 / _229;
        float _233 = _127 * _225;
        float _235 = exp2(_233);
        float _237 = -_235;
        float _239 = _237 + 1.0;
        float _241 = _239 * _231;
        _163 = _241;
    }
    float _243 = _163;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _247 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _249 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _251 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _253 = fma(_243, _141, _247);
    float _255 = fma(_243, _143, _249);
    float _257 = fma(_243, _145, _251);
    float _259 = fma(_253, _129, _147);
    float _261 = fma(_255, _129, _149);
    float _263 = fma(_257, _129, _151);
    bool _265 = !_245;
    float _283;
    if (!_265)
    {
        float _267 = in.m_44.x;
        float _269 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _271 = _267 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _275 = _273 * _269;
        float _277 = floor(_275);
        float _279 = -_277;
        float _281 = _275 + _279;
        _283 = _281;
        _285 = true;
    }
    else
    {
        float _287 = float(_71);
        float _289 = 1.0 / _287;
        float _291 = _105 * _289;
        _283 = _291;
    }
    _285 = false;
    float _293 = _283;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = _293 + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _315;
    float _319 = 1.0 / _305;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _325 = 1.0 / _309;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _329 = _293 + _327;
    bool _331 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _333 = 1.0 / _301;
    float _335 = _329 * _319;
    bool _337 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _339 = isnan(_293);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    bool _349 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _351 = isnan(_293);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = 1.0 / _323;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _365 = _293 + _363;
    float _367 = _297 * _325;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _371 = _293 + _369;
    float _373 = -_359;
    float _375 = _373 + 1.0;
    float _377 = 1.0 / _313;
    float _379 = _365 * _333;
    float _381 = -_347;
    float _383 = _381 + 1.0;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _387 = _293 + _385;
    float _389 = 1.0 / _317;
    bool _391 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _393 = isnan(_293);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = _371 * _361;
    bool _405 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _407 = isnan(_293);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = _401 * _383;
    float _419 = -_401;
    float _421 = _419 + 1.0;
    float _423 = _387 * _377;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _427 = _293 + _425;
    bool _429 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _431 = isnan(_293);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = _415 * _421;
    float _443 = -_415;
    float _445 = _443 + 1.0;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _447;
    float _451 = _439 * _375;
    float _453 = _427 * _389;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _455;
    float _459 = _359 * _445;
    bool _461 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _463 = isnan(_293);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = fma(_449, _379, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _475 = fma(_457, _379, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _477 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _479 = isnan(_293);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = -_439;
    float _491 = _489 + 1.0;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _497 = -_471;
    float _499 = _497 + 1.0;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _501;
    float _505 = _471 * _491;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _507;
    float _511 = _487 * _499;
    float _513 = fma(_503, _367, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _519 = fma(_509, _367, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _521 = _475 * _511;
    float _523 = _473 * _511;
    float _525 = -_487;
    float _527 = _525 + 1.0;
    float _529 = fma(_495, _335, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _531 = fma(_517, _335, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _533 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[143].x, _523);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _543 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[143].y, _521);
    float _545 = fma(_529, _505, _533);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _547;
    float _551 = fma(_537, _423, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _553 = fma(_541, _423, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _555;
    float _559 = in.m_42.x;
    float _561 = in.m_42.y;
    float _563 = fma(_531, _505, _543);
    float _565 = fma(_549, _453, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _567 = fma(_557, _453, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _569 = fma(_513, _451, _545);
    float _571 = fma(_519, _451, _563);
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _581 = fma(_551, _459, _569);
    float _583 = fma(_553, _459, _571);
    float _585 = fma(_575, _403, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _587 = fma(_579, _403, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _589 = fma(_565, _441, _581);
    float _591 = fma(_567, _441, _583);
    float _593 = fma(_585, _417, _589);
    float _595 = fma(_587, _417, _591);
    float _597 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[149].x, _593);
    float _599 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[149].y, _595);
    float _601 = _597 * _559;
    float _603 = _599 * _561;
    bool _605 = !_331;
    float _623;
    if (!_605)
    {
        float _607 = in.m_44.x;
        float _609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _611 = _607 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _613 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _615 = _613 * _609;
        float _617 = floor(_615);
        float _619 = -_617;
        float _621 = _615 + _619;
        _623 = _621;
        _625 = true;
    }
    else
    {
        float _627 = float(_71);
        float _629 = 1.0 / _627;
        float _631 = _105 * _629;
        _623 = _631;
    }
    _625 = false;
    float _633 = _623;
    float _635 = in.m_44.x;
    float _637 = in.m_44.y;
    float _639 = in.m_44.z;
    float _641 = in.m_44.w;
    float _643 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _645 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _651 = _649 != 0;
    float _653 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _643);
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _657 = _655 != 0;
    float _659 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _645);
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _663 = _661 != 0;
    float _665 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _653);
    int _667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _669 = _667 != 0;
    float _671 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _659);
    float _673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _679 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _681 = _641 > 0.5;
    float _683 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _687 = _635 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _689 = _639 > 0.5;
    float _691 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _683);
    float _693 = -_685;
    float _695 = fma(_687, 2.0, _693);
    float _697 = 1.0 / _677;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _703 = _637 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _707 = _635 > 0.5;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _711 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _691);
    float _713 = 1.0 / _701;
    float _715 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[78].z, _705);
    float _717 = fma(_703, -2.0, _709);
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _721 = -_105;
    float _723 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[76].x, _695);
    float _725 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[78].w, _719);
    float _727 = -_173;
    int _729 = _707 ? as_type<int>(_727) : as_type<int>(_173);
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _733 = _731 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _735;
    bool _739 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _741 = isnan(_633);
    bool _743 = _739 || _741;
    bool _745 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _747 = _743 || _745;
    float _749 = float(_747);
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _753 = _751 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _755 = _733 * _697;
    bool _757 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _759 = isnan(_633);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _717);
    bool _771 = _637 > 0.5;
    float _773 = _737 * _713;
    float _775 = -_749;
    float _777 = _775 + 1.0;
    bool _779 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _781 = isnan(_633);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    float _791 = -_767;
    float _793 = _791 + 1.0;
    float _795 = 1.0 / _753;
    float _797 = _767 * _777;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _801 = _633 + _799;
    float _803 = _789 * _793;
    float _805 = -_789;
    float _807 = _805 + 1.0;
    bool _809 = !_651;
    float _811 = _809 ? _173 : as_type<float>(_729);
    float _813 = fma(_773, _801, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _815 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _715);
    float _817 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _725);
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _819;
    bool _823 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _825 = isnan(_633);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _837 = _633 + _835;
    float _839 = _665 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _843 = _633 + _841;
    float _845 = _671 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _847 = _833 * _807;
    float _849 = -_833;
    float _851 = _849 + 1.0;
    float _853 = fma(_755, _837, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _855 = _821 * _795;
    float _857 = _813 * _847;
    float _859 = _673 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _861 = _811 + 0.5;
    float _863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _865 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[115].x, _857);
    float _867 = fma(_855, _843, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _869 = fma(_859, _861, _723);
    float _871 = _711 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _873 = fma(_853, _803, _865);
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _877 = _839 + _875;
    float _879 = -_173;
    int _881 = _689 ? as_type<int>(_879) : as_type<int>(_173);
    float _883 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _885 = _871 + _883;
    float _887 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _889 = _845 + _887;
    float _891 = -_183;
    int _893 = _771 ? as_type<int>(_891) : as_type<int>(_183);
    float _895 = fma(_867, _797, _873);
    float _897 = _885 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _899 = !_657;
    float _901 = _899 ? _173 : as_type<float>(_881);
    float _903 = _601 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _905 = !_663;
    float _907 = _905 ? _183 : as_type<float>(_893);
    float _909 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[28].x, _897);
    float _911 = -_183;
    int _913 = _681 ? as_type<int>(_911) : as_type<int>(_183);
    float _915 = _901 + 0.5;
    float _917 = _885 * _885;
    float _919 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[28].z, _909);
    bool _921 = !_669;
    float _923 = _921 ? _183 : as_type<float>(_913);
    float _925 = _863 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _927 = _907 + (-0.5);
    float _929 = _903 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _931 = -_923;
    float _933 = _931 + 0.5;
    bool _935 = _919 >= 0.0;
    float _937 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[118].x, _895);
    float _939 = -_815;
    float _941 = _939 + 1.0;
    float _943 = _915 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _945 = _933 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _947 = fma(_877, _877, _917);
    float _949 = -_925;
    float _951 = -_769;
    float _953 = fma(_949, _927, _951);
    float _955 = -_817;
    float _957 = _955 + 1.0;
    float _959 = _945 * _647;
    float _961 = fma(_889, _889, _947);
    float _963 = fma(_907, _957, _953);
    float _965 = -_941;
    float _967 = fma(_811, _965, _869);
    float _969 = rsqrt(_961);
    float _971 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    if (_935)
    {
        _977 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _979 = _977;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _987 = _943 * _679;
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _991 = _975 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _993 = _971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _995 = _985 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _997 = _973 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _999 = _981 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1001 = _983 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1003 = _937 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1005 = as_type<int>(_979);
    float _1007 = _997;
    if (_935)
    {
        float _1009 = _979 * 5.0;
        _1005 = as_type<int>(_1009);
    }
    int _1011 = _1005;
    float _1013 = _929 * _969;
    out.m_46.x = _993;
    out.m_46.y = _995;
    out.m_46.z = _997;
    out.m_46.w = _989;
    float _1015 = _877 * _1013;
    out.m_48.x = _967;
    out.m_48.y = _963;
    out.m_48.z = _987;
    out.m_48.w = _959;
    float _1017 = _885 * _1013;
    out.m_50.x = _991;
    out.m_50.y = _999;
    out.m_50.z = _1001;
    out.m_50.w = _1003;
    if (_935)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3036 = as_type<float>(_1011);
        out.gl_Position.z = _3036;
    }
    if (_935)
    {
        out.m_35.x = 0.0;
    }
    if (_935)
    {
        return out;
    }
    float _1019 = -_1017;
    float _1021 = _871 + _1019;
    float _1023 = _889 * _1013;
    float _1025 = -_1015;
    float _1027 = _839 + _1025;
    float _1029 = -_1017;
    float _1031 = _885 + _1029;
    float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1035 = _1021 + _1033;
    float _1037 = -_1023;
    float _1039 = _845 + _1037;
    float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1043 = _1027 + _1041;
    float _1045 = -_1015;
    float _1047 = _877 + _1045;
    float _1049 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1051 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1053 = _1039 + _1051;
    float _1055 = _1031 * _1031;
    float _1057 = -_1023;
    float _1059 = _889 + _1057;
    float _1061 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1049);
    float _1063 = fma(_1047, _1047, _1055);
    float _1065 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1061);
    float _1067 = fma(_1059, _1059, _1063);
    bool _1069 = _1065 >= 0.0;
    float _1071 = sqrt(_1067);
    if (_1069)
    {
        _1007 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1073 = _1007;
    int _1075 = as_type<int>(_1073);
    if (_1069)
    {
        out.m_35.x = 0.0;
    }
    if (_1069)
    {
        float _1077 = _1073 * 5.0;
        _1075 = as_type<int>(_1077);
    }
    int _1079 = _1075;
    float _1081 = _969 * _1071;
    if (_1069)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3154 = as_type<float>(_1079);
        out.gl_Position.z = _3154;
    }
    if (_1069)
    {
        return out;
    }
    float _1083 = _603 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1085 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1087 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    float _1089 = _903 * _1081;
    float _1091 = _1081 * _1083;
    float _1093 = _1081 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1095 = _1093 * 0.5;
    float _1097 = _1087 * _1089;
    float _1099 = _1085 * _1091;
    float _1101 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1103 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1105 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1101);
    float _1107 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1103);
    float _1109 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1105);
    float _1111 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1107);
    float _1113 = _1109 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1115 = _1111 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1117 = _839 + _1113;
    float _1119 = _845 + _1115;
    float _1121 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1123 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1125 = _1117 + _1123;
    float _1127 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1129 = _1119 + _1127;
    float _1131 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1121);
    float _1133 = _1125 * _1125;
    float _1135 = _1129 * _1129;
    float _1137 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1131);
    float _1139 = _1133 + _1135;
    float _1141 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1143 = sqrt(_1139);
    float _1145 = _871 + _1141;
    bool _1147 = _1143 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1149 = _1095;
    float _1151 = _1099;
    float _1153 = _1121;
    float _1155 = _1135;
    float _1157 = _1117;
    if (!_1147)
    {
        _1149 = _1133;
    }
    float _1159 = _1149;
    float _1161 = _1159;
    if (!_1147)
    {
        _1151 = _1119;
    }
    float _1163 = _1151;
    float _1165 = _1163;
    if (!_1147)
    {
        _1153 = _1145;
    }
    float _1167 = _1153;
    bool _1169 = !_1147;
    float _1171 = _1167;
    if (!_1169)
    {
        float _1173 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1175 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1177 = _1143 + _1175;
        float _1179 = _1145 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1181 = rsqrt(_1139);
        float _1183 = _1177 * _1173;
        float _1185 = _1183 * 0.15915493667125701904296875;
        float _1187 = _1185 * 6.283185482025146484375;
        float _1189 = sin(_1187);
        float _1191 = _1185 * 6.283185482025146484375;
        float _1193 = cos(_1191);
        float _1195 = fma(_1189, _1179, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1197 = _1181 * _1195;
        float _1199 = _1193 + (-1.0);
        float _1201 = fma(_1125, _1197, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1203 = fma(_1129, _1197, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1205 = _1199 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1207 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1209 = _1201 + _1207;
        float _1211 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1213 = _1203 + _1211;
        float _1215 = fma(_1145, _1193, _1205);
        float _1217 = _1209 * _1209;
        float _1219 = _1213 * _1213;
        _1171 = _1215;
        _1161 = _1217;
        _1155 = _1219;
        _1157 = _1201;
        _1165 = _1203;
    }
    float _1221 = _1171;
    float _1223 = _1161;
    float _1225 = _1155;
    float _1227 = _1157;
    float _1229 = _1165;
    float _1231 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1233 = _1221 + _1231;
    float _1235 = fma(_1233, _1233, _1223);
    float _1237 = _1235 + _1225;
    float _1239 = sqrt(_1237);
    bool _1241 = _1239 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1243 = isnan(_1239);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1249 = _1245 || _1247;
    float _1251 = _1223;
    if (!_1249)
    {
        _1251 = 1.0;
    }
    float _1253 = _1251;
    bool _1255 = !_1249;
    float _1257 = _1253;
    if (!_1255)
    {
        bool _1259 = _1239 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1261 = isnan(_1239);
        bool _1263 = _1259 || _1261;
        bool _1265 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1267 = _1263 || _1265;
        if (!_1267)
        {
            float _1269 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1271 = _1239 + _1269;
            float _1273 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1275 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1273;
            float _1277 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1279 = _1277 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1281 = 1.0 / _1275;
            float _1283 = _1271 * _1281;
            float _1285 = fma(_1283, _1279, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1257 = _1285;
            _1287 = true;
        }
        else
        {
            bool _1289 = _1239 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1291 = isnan(_1239);
            bool _1293 = _1289 || _1291;
            bool _1295 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1297 = _1293 || _1295;
            if (!_1297)
            {
                float _1299 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1301 = _1239 + _1299;
                float _1303 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1305 = _1303 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1307 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1309 = _1307 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1311 = 1.0 / _1305;
                float _1313 = _1301 * _1311;
                float _1315 = fma(_1313, _1309, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1257 = _1315;
                _1287 = true;
            }
            else
            {
                _1257 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1287 = false;
    float _1317 = _1257;
    float _1319 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1321 = _1221 + _1319;
    float _1323 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1325 = _1227 + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1329 = _1229 + _1327;
    float _1331 = fma(_1321, _1317, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1333 = fma(_1325, _1317, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1335 = fma(_1329, _1317, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1337 = -_1017;
    float _1339 = _1337 + _1331;
    float _1341 = -_1015;
    float _1343 = _1341 + _1333;
    float _1345 = -_1023;
    float _1347 = _1345 + _1335;
    float _1349 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1351 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1353 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1355 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1357 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1349);
    float _1359 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1351);
    float _1361 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1353);
    float _1363 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1355);
    float _1365 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1357);
    float _1367 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1359);
    float _1369 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1361);
    float _1371 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1363);
    float _1373 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1375 = _1367 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1377 = _1369 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1379 = _1371 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1381 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1383 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1385 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1387 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1389 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1381);
    float _1391 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1383);
    float _1393 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1385);
    float _1395 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1387);
    float _1397 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1389);
    float _1399 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1391);
    float _1401 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1393);
    float _1403 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1395);
    float _1405 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1397);
    float _1407 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1399);
    float _1409 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1401);
    float _1411 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1403);
    float _1413 = _1405 + _1407;
    float _1415 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1417 = _1413 * 0.5;
    out.m_35.x = _1415;
    out.gl_Position.x = _1409;
    out.gl_Position.y = _1411;
    out.gl_Position.z = _1405;
    out.gl_Position.w = _1407;
    out.m_52.z = _1417;
    out.m_52.w = _1407;
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
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1287 = false;
    bool _625 = false;
    bool _285 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_32.w;
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
        out.m_35.x = 0.0;
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
        float _1474 = as_type<float>(_87);
        out.gl_Position.z = _1474;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _91 = in.m_37.w;
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
        out.m_35.x = 0.0;
    }
    if (_115)
    {
        float _121 = _119 * 5.0;
        _89 = as_type<int>(_121);
    }
    int _123 = _89;
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1543 = as_type<float>(_123);
        out.gl_Position.z = _1543;
    }
    if (_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = as_type<float>(int(gl_VertexIndex));
    float _127 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _129 = in.m_42.w;
    bool _131 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _133 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _135 = _131 || _133;
    bool _137 = isnan(1.0);
    bool _139 = _135 || _137;
    float _141 = in.m_37.x;
    float _143 = in.m_37.y;
    float _145 = in.m_37.z;
    float _147 = in.m_32.x;
    float _149 = in.m_32.y;
    float _151 = in.m_32.z;
    int _153 = as_type<int>(_125) & 1;
    bool _155 = _153 != 0;
    int _157 = as_type<int>(_125) & 2;
    bool _159 = _157 != 0;
    float _161 = _125;
    float _163 = _127;
    if (!_139)
    {
        float _165 = _127 * _127;
        float _167 = _165 * 0.5;
        _161 = _167;
    }
    float _169 = _161;
    bool _171 = !_155;
    float _173 = _171 ? (-0.5) : 0.5;
    float _175 = _169;
    if (!_139)
    {
        float _177 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    bool _181 = !_159;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_139;
    float _187 = _179;
    if (!_185)
    {
        float _189 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _191 = log2(_189);
        float _193 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _195 = _193 + 1.0;
        float _197 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = _127 * _191;
        float _201 = 1.0 / _195;
        float _203 = _197 * 0.693147182464599609375;
        float _205 = exp2(_199);
        float _207 = 1.0 / _203;
        float _209 = _205 + (-1.0);
        float _211 = -_209;
        float _213 = fma(_211, _207, _127);
        float _215 = _213 * _201;
        float _217 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _217;
    }
    float _219 = _187;
    bool _221 = !_139;
    if (!_221)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = 1.0 / _229;
        float _233 = _127 * _225;
        float _235 = exp2(_233);
        float _237 = -_235;
        float _239 = _237 + 1.0;
        float _241 = _239 * _231;
        _163 = _241;
    }
    float _243 = _163;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _247 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _249 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _251 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _253 = fma(_243, _141, _247);
    float _255 = fma(_243, _143, _249);
    float _257 = fma(_243, _145, _251);
    float _259 = fma(_253, _129, _147);
    float _261 = fma(_255, _129, _149);
    float _263 = fma(_257, _129, _151);
    bool _265 = !_245;
    float _283;
    if (!_265)
    {
        float _267 = in.m_44.x;
        float _269 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _271 = _267 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _275 = _273 * _269;
        float _277 = floor(_275);
        float _279 = -_277;
        float _281 = _275 + _279;
        _283 = _281;
        _285 = true;
    }
    else
    {
        float _287 = float(_71);
        float _289 = 1.0 / _287;
        float _291 = _105 * _289;
        _283 = _291;
    }
    _285 = false;
    float _293 = _283;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = _293 + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _315;
    float _319 = 1.0 / _305;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _325 = 1.0 / _309;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _329 = _293 + _327;
    bool _331 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _333 = 1.0 / _301;
    float _335 = _329 * _319;
    bool _337 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _339 = isnan(_293);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    bool _349 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _351 = isnan(_293);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = 1.0 / _323;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _365 = _293 + _363;
    float _367 = _297 * _325;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _371 = _293 + _369;
    float _373 = -_359;
    float _375 = _373 + 1.0;
    float _377 = 1.0 / _313;
    float _379 = _365 * _333;
    float _381 = -_347;
    float _383 = _381 + 1.0;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _387 = _293 + _385;
    float _389 = 1.0 / _317;
    bool _391 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _393 = isnan(_293);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = _371 * _361;
    bool _405 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _407 = isnan(_293);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = _401 * _383;
    float _419 = -_401;
    float _421 = _419 + 1.0;
    float _423 = _387 * _377;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _427 = _293 + _425;
    bool _429 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _431 = isnan(_293);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = _415 * _421;
    float _443 = -_415;
    float _445 = _443 + 1.0;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _447;
    float _451 = _439 * _375;
    float _453 = _427 * _389;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _455;
    float _459 = _359 * _445;
    bool _461 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _463 = isnan(_293);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = fma(_449, _379, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _475 = fma(_457, _379, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _477 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _479 = isnan(_293);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = -_439;
    float _491 = _489 + 1.0;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _497 = -_471;
    float _499 = _497 + 1.0;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _501;
    float _505 = _471 * _491;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _507;
    float _511 = _487 * _499;
    float _513 = fma(_503, _367, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _519 = fma(_509, _367, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _521 = _475 * _511;
    float _523 = _473 * _511;
    float _525 = -_487;
    float _527 = _525 + 1.0;
    float _529 = fma(_495, _335, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _531 = fma(_517, _335, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _533 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[143].x, _523);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _543 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[143].y, _521);
    float _545 = fma(_529, _505, _533);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _547;
    float _551 = fma(_537, _423, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _553 = fma(_541, _423, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _555;
    float _559 = in.m_42.x;
    float _561 = in.m_42.y;
    float _563 = fma(_531, _505, _543);
    float _565 = fma(_549, _453, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _567 = fma(_557, _453, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _569 = fma(_513, _451, _545);
    float _571 = fma(_519, _451, _563);
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _581 = fma(_551, _459, _569);
    float _583 = fma(_553, _459, _571);
    float _585 = fma(_575, _403, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _587 = fma(_579, _403, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _589 = fma(_565, _441, _581);
    float _591 = fma(_567, _441, _583);
    float _593 = fma(_585, _417, _589);
    float _595 = fma(_587, _417, _591);
    float _597 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[149].x, _593);
    float _599 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[149].y, _595);
    float _601 = _597 * _559;
    float _603 = _599 * _561;
    bool _605 = !_331;
    float _623;
    if (!_605)
    {
        float _607 = in.m_44.x;
        float _609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _611 = _607 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _613 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _615 = _613 * _609;
        float _617 = floor(_615);
        float _619 = -_617;
        float _621 = _615 + _619;
        _623 = _621;
        _625 = true;
    }
    else
    {
        float _627 = float(_71);
        float _629 = 1.0 / _627;
        float _631 = _105 * _629;
        _623 = _631;
    }
    _625 = false;
    float _633 = _623;
    float _635 = in.m_44.x;
    float _637 = in.m_44.y;
    float _639 = in.m_44.z;
    float _641 = in.m_44.w;
    float _643 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _645 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _651 = _649 != 0;
    float _653 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _643);
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _657 = _655 != 0;
    float _659 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _645);
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _663 = _661 != 0;
    float _665 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _653);
    int _667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _669 = _667 != 0;
    float _671 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _659);
    float _673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _679 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _681 = _641 > 0.5;
    float _683 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _687 = _635 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _689 = _639 > 0.5;
    float _691 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _683);
    float _693 = -_685;
    float _695 = fma(_687, 2.0, _693);
    float _697 = 1.0 / _677;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _703 = _637 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _707 = _635 > 0.5;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _711 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _691);
    float _713 = 1.0 / _701;
    float _715 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[78].z, _705);
    float _717 = fma(_703, -2.0, _709);
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _721 = -_105;
    float _723 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[76].x, _695);
    float _725 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[78].w, _719);
    float _727 = -_173;
    int _729 = _707 ? as_type<int>(_727) : as_type<int>(_173);
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _733 = _731 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _735;
    bool _739 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _741 = isnan(_633);
    bool _743 = _739 || _741;
    bool _745 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _747 = _743 || _745;
    float _749 = float(_747);
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _753 = _751 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _755 = _733 * _697;
    bool _757 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _759 = isnan(_633);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _717);
    bool _771 = _637 > 0.5;
    float _773 = _737 * _713;
    float _775 = -_749;
    float _777 = _775 + 1.0;
    bool _779 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _781 = isnan(_633);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    float _791 = -_767;
    float _793 = _791 + 1.0;
    float _795 = 1.0 / _753;
    float _797 = _767 * _777;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _801 = _633 + _799;
    float _803 = _789 * _793;
    float _805 = -_789;
    float _807 = _805 + 1.0;
    bool _809 = !_651;
    float _811 = _809 ? _173 : as_type<float>(_729);
    float _813 = fma(_773, _801, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _815 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _715);
    float _817 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _725);
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _819;
    bool _823 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _825 = isnan(_633);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _837 = _633 + _835;
    float _839 = _665 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _843 = _633 + _841;
    float _845 = _671 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _847 = _833 * _807;
    float _849 = -_833;
    float _851 = _849 + 1.0;
    float _853 = fma(_755, _837, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _855 = _821 * _795;
    float _857 = _813 * _847;
    float _859 = _673 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _861 = _811 + 0.5;
    float _863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _865 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[115].x, _857);
    float _867 = fma(_855, _843, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _869 = fma(_859, _861, _723);
    float _871 = _711 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _873 = fma(_853, _803, _865);
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _877 = _839 + _875;
    float _879 = -_173;
    int _881 = _689 ? as_type<int>(_879) : as_type<int>(_173);
    float _883 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _885 = _871 + _883;
    float _887 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _889 = _845 + _887;
    float _891 = -_183;
    int _893 = _771 ? as_type<int>(_891) : as_type<int>(_183);
    float _895 = fma(_867, _797, _873);
    float _897 = _885 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _899 = !_657;
    float _901 = _899 ? _173 : as_type<float>(_881);
    float _903 = _601 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _905 = !_663;
    float _907 = _905 ? _183 : as_type<float>(_893);
    float _909 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[28].x, _897);
    float _911 = -_183;
    int _913 = _681 ? as_type<int>(_911) : as_type<int>(_183);
    float _915 = _901 + 0.5;
    float _917 = _885 * _885;
    float _919 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[28].z, _909);
    bool _921 = !_669;
    float _923 = _921 ? _183 : as_type<float>(_913);
    float _925 = _863 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _927 = _907 + (-0.5);
    float _929 = _903 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _931 = -_923;
    float _933 = _931 + 0.5;
    bool _935 = _919 >= 0.0;
    float _937 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[118].x, _895);
    float _939 = -_815;
    float _941 = _939 + 1.0;
    float _943 = _915 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _945 = _933 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _947 = fma(_877, _877, _917);
    float _949 = -_925;
    float _951 = -_769;
    float _953 = fma(_949, _927, _951);
    float _955 = -_817;
    float _957 = _955 + 1.0;
    float _959 = _945 * _647;
    float _961 = fma(_889, _889, _947);
    float _963 = fma(_907, _957, _953);
    float _965 = -_941;
    float _967 = fma(_811, _965, _869);
    float _969 = rsqrt(_961);
    float _971 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    if (_935)
    {
        _977 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _979 = _977;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _987 = _943 * _679;
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _991 = _975 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _993 = _971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _995 = _985 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _997 = _973 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _999 = _981 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1001 = _983 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1003 = _937 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1005 = as_type<int>(_979);
    float _1007 = _997;
    if (_935)
    {
        float _1009 = _979 * 5.0;
        _1005 = as_type<int>(_1009);
    }
    int _1011 = _1005;
    float _1013 = _929 * _969;
    out.m_46.x = _993;
    out.m_46.y = _995;
    out.m_46.z = _997;
    out.m_46.w = _989;
    float _1015 = _877 * _1013;
    out.m_48.x = _967;
    out.m_48.y = _963;
    out.m_48.z = _987;
    out.m_48.w = _959;
    float _1017 = _885 * _1013;
    out.m_50.x = _991;
    out.m_50.y = _999;
    out.m_50.z = _1001;
    out.m_50.w = _1003;
    if (_935)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3036 = as_type<float>(_1011);
        out.gl_Position.z = _3036;
    }
    if (_935)
    {
        out.m_35.x = 0.0;
    }
    if (_935)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1019 = -_1017;
    float _1021 = _871 + _1019;
    float _1023 = _889 * _1013;
    float _1025 = -_1015;
    float _1027 = _839 + _1025;
    float _1029 = -_1017;
    float _1031 = _885 + _1029;
    float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1035 = _1021 + _1033;
    float _1037 = -_1023;
    float _1039 = _845 + _1037;
    float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1043 = _1027 + _1041;
    float _1045 = -_1015;
    float _1047 = _877 + _1045;
    float _1049 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1051 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1053 = _1039 + _1051;
    float _1055 = _1031 * _1031;
    float _1057 = -_1023;
    float _1059 = _889 + _1057;
    float _1061 = fma(_1043, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1049);
    float _1063 = fma(_1047, _1047, _1055);
    float _1065 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1061);
    float _1067 = fma(_1059, _1059, _1063);
    bool _1069 = _1065 >= 0.0;
    float _1071 = sqrt(_1067);
    if (_1069)
    {
        _1007 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1073 = _1007;
    int _1075 = as_type<int>(_1073);
    if (_1069)
    {
        out.m_35.x = 0.0;
    }
    if (_1069)
    {
        float _1077 = _1073 * 5.0;
        _1075 = as_type<int>(_1077);
    }
    int _1079 = _1075;
    float _1081 = _969 * _1071;
    if (_1069)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3154 = as_type<float>(_1079);
        out.gl_Position.z = _3154;
    }
    if (_1069)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1083 = _603 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1085 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1087 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    float _1089 = _903 * _1081;
    float _1091 = _1081 * _1083;
    float _1093 = _1081 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1095 = _1093 * 0.5;
    float _1097 = _1087 * _1089;
    float _1099 = _1085 * _1091;
    float _1101 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1103 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1105 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1101);
    float _1107 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1103);
    float _1109 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1105);
    float _1111 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1107);
    float _1113 = _1109 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1115 = _1111 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1117 = _839 + _1113;
    float _1119 = _845 + _1115;
    float _1121 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1123 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1125 = _1117 + _1123;
    float _1127 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1129 = _1119 + _1127;
    float _1131 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1121);
    float _1133 = _1125 * _1125;
    float _1135 = _1129 * _1129;
    float _1137 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1131);
    float _1139 = _1133 + _1135;
    float _1141 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1143 = sqrt(_1139);
    float _1145 = _871 + _1141;
    bool _1147 = _1143 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1149 = _1095;
    float _1151 = _1099;
    float _1153 = _1121;
    float _1155 = _1135;
    float _1157 = _1117;
    if (!_1147)
    {
        _1149 = _1133;
    }
    float _1159 = _1149;
    float _1161 = _1159;
    if (!_1147)
    {
        _1151 = _1119;
    }
    float _1163 = _1151;
    float _1165 = _1163;
    if (!_1147)
    {
        _1153 = _1145;
    }
    float _1167 = _1153;
    bool _1169 = !_1147;
    float _1171 = _1167;
    if (!_1169)
    {
        float _1173 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1175 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1177 = _1143 + _1175;
        float _1179 = _1145 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1181 = rsqrt(_1139);
        float _1183 = _1177 * _1173;
        float _1185 = _1183 * 0.15915493667125701904296875;
        float _1187 = _1185 * 6.283185482025146484375;
        float _1189 = sin(_1187);
        float _1191 = _1185 * 6.283185482025146484375;
        float _1193 = cos(_1191);
        float _1195 = fma(_1189, _1179, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1197 = _1181 * _1195;
        float _1199 = _1193 + (-1.0);
        float _1201 = fma(_1125, _1197, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1203 = fma(_1129, _1197, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1205 = _1199 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1207 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1209 = _1201 + _1207;
        float _1211 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1213 = _1203 + _1211;
        float _1215 = fma(_1145, _1193, _1205);
        float _1217 = _1209 * _1209;
        float _1219 = _1213 * _1213;
        _1171 = _1215;
        _1161 = _1217;
        _1155 = _1219;
        _1157 = _1201;
        _1165 = _1203;
    }
    float _1221 = _1171;
    float _1223 = _1161;
    float _1225 = _1155;
    float _1227 = _1157;
    float _1229 = _1165;
    float _1231 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1233 = _1221 + _1231;
    float _1235 = fma(_1233, _1233, _1223);
    float _1237 = _1235 + _1225;
    float _1239 = sqrt(_1237);
    bool _1241 = _1239 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1243 = isnan(_1239);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1249 = _1245 || _1247;
    float _1251 = _1223;
    if (!_1249)
    {
        _1251 = 1.0;
    }
    float _1253 = _1251;
    bool _1255 = !_1249;
    float _1257 = _1253;
    if (!_1255)
    {
        bool _1259 = _1239 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1261 = isnan(_1239);
        bool _1263 = _1259 || _1261;
        bool _1265 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1267 = _1263 || _1265;
        if (!_1267)
        {
            float _1269 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1271 = _1239 + _1269;
            float _1273 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1275 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1273;
            float _1277 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1279 = _1277 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1281 = 1.0 / _1275;
            float _1283 = _1271 * _1281;
            float _1285 = fma(_1283, _1279, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1257 = _1285;
            _1287 = true;
        }
        else
        {
            bool _1289 = _1239 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1291 = isnan(_1239);
            bool _1293 = _1289 || _1291;
            bool _1295 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1297 = _1293 || _1295;
            if (!_1297)
            {
                float _1299 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1301 = _1239 + _1299;
                float _1303 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1305 = _1303 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1307 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1309 = _1307 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1311 = 1.0 / _1305;
                float _1313 = _1301 * _1311;
                float _1315 = fma(_1313, _1309, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1257 = _1315;
                _1287 = true;
            }
            else
            {
                _1257 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1287 = false;
    float _1317 = _1257;
    float _1319 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1321 = _1221 + _1319;
    float _1323 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1325 = _1227 + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1329 = _1229 + _1327;
    float _1331 = fma(_1321, _1317, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1333 = fma(_1325, _1317, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1335 = fma(_1329, _1317, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1337 = -_1017;
    float _1339 = _1337 + _1331;
    float _1341 = -_1015;
    float _1343 = _1341 + _1333;
    float _1345 = -_1023;
    float _1347 = _1345 + _1335;
    float _1349 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1351 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1353 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1355 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1357 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1349);
    float _1359 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1351);
    float _1361 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1353);
    float _1363 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1355);
    float _1365 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1357);
    float _1367 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1359);
    float _1369 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1361);
    float _1371 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1363);
    float _1373 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1375 = _1367 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1377 = _1369 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1379 = _1371 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1381 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1383 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1385 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1387 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1389 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1381);
    float _1391 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1383);
    float _1393 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1385);
    float _1395 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1387);
    float _1397 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1389);
    float _1399 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1391);
    float _1401 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1393);
    float _1403 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1395);
    float _1405 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1397);
    float _1407 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1399);
    float _1409 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1401);
    float _1411 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1403);
    float _1413 = _1405 + _1407;
    float _1415 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1417 = _1413 * 0.5;
    out.m_35.x = _1415;
    out.gl_Position.x = _1409;
    out.gl_Position.y = _1411;
    out.gl_Position.z = _1405;
    out.gl_Position.w = _1407;
    out.m_52.z = _1417;
    out.m_52.w = _1407;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

