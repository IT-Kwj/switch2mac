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
    float4 m_48 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
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
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _971 = false;
    bool _443 = false;
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
        float _1152 = as_type<float>(_87);
        out.gl_Position.z = _1152;
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
        float _1221 = as_type<float>(_123);
        out.gl_Position.z = _1221;
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
    float _153 = 0.0;
    float _155 = _127;
    if (!_139)
    {
        float _157 = _127 * _127;
        float _159 = _157 * 0.5;
        _153 = _159;
    }
    float _161 = _153;
    float _163 = _161;
    if (!_139)
    {
        float _165 = _161 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _163 = _165;
    }
    float _167 = _163;
    int _169 = as_type<int>(_125) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_125) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_139;
    float _187 = _167;
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
        _155 = _241;
    }
    float _243 = _155;
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
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = _293 + _295;
    bool _299 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _301 = isnan(_293);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _293 + _311;
    bool _315 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _317 = isnan(_293);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = -_309;
    float _337 = _335 + 1.0;
    float _339 = 1.0 / _333;
    bool _341 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _343 = isnan(_293);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = _325 * _337;
    float _355 = -_325;
    float _357 = _355 + 1.0;
    bool _359 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _361 = _351 * _357;
    float _363 = 1.0 / _329;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = -_351;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _377 = _313 * _339;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _383 = fma(_375, _377, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _385 = fma(_381, _377, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _387 = _297 * _363;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _389;
    float _393 = in.m_42.x;
    float _395 = in.m_42.y;
    float _397 = fma(_367, _387, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _399 = fma(_391, _387, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _401 = _397 * _361;
    float _403 = _399 * _361;
    float _405 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _403);
    float _407 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _401);
    float _409 = fma(_385, _353, _405);
    float _411 = fma(_383, _353, _407);
    float _413 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[145].x, _409);
    float _415 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[145].y, _411);
    float _417 = _413 * _393;
    float _419 = _415 * _395;
    bool _421 = !_359;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _441;
    if (!_421)
    {
        float _425 = in.m_44.x;
        float _427 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _429 = _425 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _431 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _433 = _431 * _427;
        float _435 = floor(_433);
        float _437 = -_435;
        float _439 = _433 + _437;
        _441 = _439;
        _443 = true;
    }
    else
    {
        float _445 = float(_71);
        float _447 = 1.0 / _445;
        float _449 = _105 * _447;
        _441 = _449;
    }
    _443 = false;
    float _451 = _441;
    float _453 = in.m_44.x;
    float _455 = in.m_44.y;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _459 = _451 + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _465 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _467;
    float _471 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _477 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _465);
    float _479 = 1.0 / _463;
    float _481 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _471);
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _485 = _483 != 0;
    float _487 = 1.0 / _475;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _491 = _489 != 0;
    bool _493 = _455 > 0.5;
    float _495 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _497 = _469 * _479;
    bool _499 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _501 = isnan(_451);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _515 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _495);
    float _517 = fma(_497, _459, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _519 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _521 = isnan(_451);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _533 = _453 > 0.5;
    float _535 = _513 * _487;
    bool _537 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _539 = isnan(_451);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _545 = _541 || _543;
    float _547 = float(_545);
    float _549 = -_529;
    float _551 = _549 + 1.0;
    float _553 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _515);
    float _555 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _481);
    float _557 = _509 * _551;
    float _559 = -_509;
    float _561 = _559 + 1.0;
    float _563 = _553 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _565 = -_547;
    float _567 = _565 + 1.0;
    float _569 = _517 * _557;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _573 = _451 + _571;
    float _575 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _477);
    float _577 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _579 = _563 + _577;
    float _581 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[115].x, _569);
    float _583 = _555 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _585 = _575 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _587 = _529 * _567;
    float _589 = -_183;
    int _591 = _493 ? as_type<int>(_589) : as_type<int>(_183);
    float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _595 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _597 = _585 + _595;
    float _599 = fma(_535, _573, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _601 = !_485;
    float _603 = _601 ? _183 : as_type<float>(_591);
    float _605 = _597 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _607 = -_179;
    int _609 = _533 ? as_type<int>(_607) : as_type<int>(_179);
    float _611 = fma(_599, _587, _581);
    float _613 = -_603;
    float _615 = _613 + 0.5;
    float _617 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[28].x, _605);
    float _619 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _621 = _583 + _619;
    bool _623 = !_491;
    float _625 = _623 ? _179 : as_type<float>(_609);
    float _627 = _615 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _629 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[117].x, _611);
    float _631 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[28].z, _617);
    float _633 = _627 * _593;
    float _635 = _625 + 0.5;
    float _637 = _629 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _639 = _631 >= 0.0;
    float _641 = _635 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _651 = _641 * _531;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _655 = _631;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _659 = _477;
    if (_639)
    {
        _655 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _661 = _655;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _665 = _643 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = _645 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _671 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _663 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _677 = as_type<int>(_661);
    int _679 = as_type<int>(_675);
    if (_639)
    {
        float _681 = _661 * 5.0;
        _677 = as_type<int>(_681);
    }
    int _683 = _677;
    out.m_46.x = _651;
    out.m_46.y = _633;
    int _685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _687 = _685 != 0;
    out.m_48.x = _669;
    out.m_48.y = _671;
    out.m_48.z = _673;
    out.m_50.x = _665;
    out.m_50.y = _667;
    out.m_50.z = _675;
    out.m_50.w = _637;
    if (_639)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2150 = as_type<float>(_683);
        out.gl_Position.z = _2150;
    }
    if (!_687)
    {
        _657 = 0.0;
        _659 = 0.0;
    }
    float _689 = _657;
    float _691 = _659;
    float _693 = _689;
    float _695 = _691;
    if (!_687)
    {
        _423 = 0.0;
    }
    float _697 = _423;
    bool _699 = !_687;
    float _701 = _697;
    if (!_699)
    {
        float _703 = -_585;
        float _705 = _703 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _707 = -_563;
        float _709 = _707 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _711 = -_583;
        float _713 = _711 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _715 = _705 * _705;
        float _717 = fma(_709, _709, _715);
        float _719 = fma(_713, _713, _717);
        float _721 = rsqrt(_719);
        float _723 = _721 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _725 = _709 * _723;
        float _727 = _705 * _723;
        float _729 = _713 * _723;
        _693 = _727;
        _695 = _725;
        _701 = _729;
    }
    float _731 = _693;
    float _733 = _695;
    float _735 = _701;
    if (_639)
    {
        out.m_35.x = 0.0;
    }
    if (_639)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _737 = _585 + _731;
    float _739 = _563 + _733;
    float _741 = _583 + _735;
    float _743 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _745 = _737 + _743;
    float _747 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _749 = _739 + _747;
    float _751 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _753 = _741 + _751;
    float _755 = _745 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _757 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[28].x, _755);
    float _759 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[28].z, _757);
    bool _761 = _759 >= 0.0;
    float _763 = _749;
    if (_761)
    {
        _763 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _765 = _763;
    if (_761)
    {
        out.m_35.x = 0.0;
    }
    if (_761)
    {
        float _767 = _765 * 5.0;
        _679 = as_type<int>(_767);
    }
    int _769 = _679;
    if (_761)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2298 = as_type<float>(_769);
        out.gl_Position.z = _2298;
    }
    if (_761)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _771 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _773 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _775 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _777 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _779 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _781 = _773 * _771;
    float _783 = _775 * _777;
    float _785 = _781 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _787 = _781 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _789 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[24].x, _785);
    float _791 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[26].x, _787);
    float _793 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[24].z, _789);
    float _795 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[26].z, _791);
    float _797 = _793 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _799 = _795 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _801 = _563 + _797;
    float _803 = _583 + _799;
    float _805 = _781 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _807 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _809 = _801 + _807;
    float _811 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _813 = _803 + _811;
    float _815 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[25].x, _805);
    float _817 = _809 * _809;
    float _819 = _813 * _813;
    float _821 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[25].z, _815);
    float _823 = _817 + _819;
    float _825 = _821 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _827 = sqrt(_823);
    float _829 = _585 + _825;
    bool _831 = _827 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _833 = _805;
    float _835 = _779;
    float _837 = _803;
    float _839 = _817;
    float _841 = _819;
    if (!_831)
    {
        _833 = _803;
    }
    float _843 = _833;
    float _845 = _843;
    if (!_831)
    {
        _835 = _801;
    }
    float _847 = _835;
    float _849 = _847;
    if (!_831)
    {
        _837 = _829;
    }
    float _851 = _837;
    bool _853 = !_831;
    float _855 = _851;
    if (!_853)
    {
        float _857 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _859 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _861 = _827 + _859;
        float _863 = _829 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _865 = rsqrt(_823);
        float _867 = _861 * _857;
        float _869 = _867 * 0.15915493667125701904296875;
        float _871 = _869 * 6.283185482025146484375;
        float _873 = sin(_871);
        float _875 = _869 * 6.283185482025146484375;
        float _877 = cos(_875);
        float _879 = fma(_873, _863, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _881 = _865 * _879;
        float _883 = _877 + (-1.0);
        float _885 = fma(_809, _881, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _887 = fma(_813, _881, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _889 = _883 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _891 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _893 = _885 + _891;
        float _895 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _897 = _887 + _895;
        float _899 = fma(_829, _877, _889);
        float _901 = _893 * _893;
        float _903 = _897 * _897;
        _855 = _899;
        _839 = _901;
        _841 = _903;
        _849 = _885;
        _845 = _887;
    }
    float _905 = _855;
    float _907 = _839;
    float _909 = _841;
    float _911 = _849;
    float _913 = _845;
    float _915 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _917 = _905 + _915;
    float _919 = fma(_917, _917, _907);
    float _921 = _919 + _909;
    float _923 = sqrt(_921);
    bool _925 = _923 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _927 = isnan(_923);
    bool _929 = _925 || _927;
    bool _931 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _933 = _929 || _931;
    float _935 = _907;
    if (!_933)
    {
        _935 = 1.0;
    }
    float _937 = _935;
    bool _939 = !_933;
    float _941 = _937;
    if (!_939)
    {
        bool _943 = _923 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _945 = isnan(_923);
        bool _947 = _943 || _945;
        bool _949 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _951 = _947 || _949;
        if (!_951)
        {
            float _953 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _955 = _923 + _953;
            float _957 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _959 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _957;
            float _961 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _963 = _961 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _965 = 1.0 / _959;
            float _967 = _955 * _965;
            float _969 = fma(_967, _963, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _941 = _969;
            _971 = true;
        }
        else
        {
            bool _973 = _923 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _975 = isnan(_923);
            bool _977 = _973 || _975;
            bool _979 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _981 = _977 || _979;
            if (!_981)
            {
                float _983 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _985 = _923 + _983;
                float _987 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _989 = _987 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _991 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _993 = _991 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _995 = 1.0 / _989;
                float _997 = _985 * _995;
                float _999 = fma(_997, _993, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _941 = _999;
                _971 = true;
            }
            else
            {
                _941 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _971 = false;
    float _1001 = _941;
    float _1003 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1005 = _905 + _1003;
    float _1007 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1009 = _911 + _1007;
    float _1011 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1013 = _913 + _1011;
    float _1015 = fma(_1005, _1001, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1017 = fma(_1009, _1001, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1019 = fma(_1013, _1001, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1021 = _1015 + _731;
    float _1023 = _1017 + _733;
    float _1025 = _1019 + _735;
    float _1027 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1029 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1031 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1033 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1035 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1027);
    float _1037 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1029);
    float _1039 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1031);
    float _1041 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1033);
    float _1043 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1035);
    float _1045 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1037);
    float _1047 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1039);
    float _1049 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1041);
    float _1051 = _1043 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1053 = _1045 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1055 = _1047 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1057 = _1049 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1059 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1061 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1063 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1065 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1067 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1059);
    float _1069 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1061);
    float _1071 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1063);
    float _1073 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1065);
    float _1075 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1067);
    float _1077 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1069);
    float _1079 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1071);
    float _1081 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1073);
    float _1083 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1075);
    float _1085 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1077);
    float _1087 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1079);
    float _1089 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1081);
    float _1091 = _1083 + _1085;
    float _1093 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1095 = _1091 * 0.5;
    out.m_35.x = _1093;
    out.gl_Position.x = _1087;
    out.gl_Position.y = _1089;
    out.gl_Position.z = _1083;
    out.gl_Position.w = _1085;
    out.m_52.z = _1095;
    out.m_52.w = _1085;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _971 = false;
    bool _443 = false;
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
        float _1152 = as_type<float>(_87);
        out.gl_Position.z = _1152;
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
        float _1221 = as_type<float>(_123);
        out.gl_Position.z = _1221;
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
    float _153 = 0.0;
    float _155 = _127;
    if (!_139)
    {
        float _157 = _127 * _127;
        float _159 = _157 * 0.5;
        _153 = _159;
    }
    float _161 = _153;
    float _163 = _161;
    if (!_139)
    {
        float _165 = _161 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _163 = _165;
    }
    float _167 = _163;
    int _169 = as_type<int>(_125) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_125) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_139;
    float _187 = _167;
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
        _155 = _241;
    }
    float _243 = _155;
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
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = _293 + _295;
    bool _299 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _301 = isnan(_293);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _293 + _311;
    bool _315 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _317 = isnan(_293);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = -_309;
    float _337 = _335 + 1.0;
    float _339 = 1.0 / _333;
    bool _341 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _343 = isnan(_293);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = _325 * _337;
    float _355 = -_325;
    float _357 = _355 + 1.0;
    bool _359 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _361 = _351 * _357;
    float _363 = 1.0 / _329;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = -_351;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _377 = _313 * _339;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _383 = fma(_375, _377, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _385 = fma(_381, _377, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _387 = _297 * _363;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _389;
    float _393 = in.m_42.x;
    float _395 = in.m_42.y;
    float _397 = fma(_367, _387, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _399 = fma(_391, _387, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _401 = _397 * _361;
    float _403 = _399 * _361;
    float _405 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _403);
    float _407 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _401);
    float _409 = fma(_385, _353, _405);
    float _411 = fma(_383, _353, _407);
    float _413 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[145].x, _409);
    float _415 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[145].y, _411);
    float _417 = _413 * _393;
    float _419 = _415 * _395;
    bool _421 = !_359;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _441;
    if (!_421)
    {
        float _425 = in.m_44.x;
        float _427 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _429 = _425 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _431 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _433 = _431 * _427;
        float _435 = floor(_433);
        float _437 = -_435;
        float _439 = _433 + _437;
        _441 = _439;
        _443 = true;
    }
    else
    {
        float _445 = float(_71);
        float _447 = 1.0 / _445;
        float _449 = _105 * _447;
        _441 = _449;
    }
    _443 = false;
    float _451 = _441;
    float _453 = in.m_44.x;
    float _455 = in.m_44.y;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _459 = _451 + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _465 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _467;
    float _471 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _477 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _465);
    float _479 = 1.0 / _463;
    float _481 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _471);
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _485 = _483 != 0;
    float _487 = 1.0 / _475;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _491 = _489 != 0;
    bool _493 = _455 > 0.5;
    float _495 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _497 = _469 * _479;
    bool _499 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _501 = isnan(_451);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _515 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _495);
    float _517 = fma(_497, _459, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _519 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _521 = isnan(_451);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _533 = _453 > 0.5;
    float _535 = _513 * _487;
    bool _537 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _539 = isnan(_451);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _545 = _541 || _543;
    float _547 = float(_545);
    float _549 = -_529;
    float _551 = _549 + 1.0;
    float _553 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _515);
    float _555 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _481);
    float _557 = _509 * _551;
    float _559 = -_509;
    float _561 = _559 + 1.0;
    float _563 = _553 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _565 = -_547;
    float _567 = _565 + 1.0;
    float _569 = _517 * _557;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _573 = _451 + _571;
    float _575 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _477);
    float _577 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _579 = _563 + _577;
    float _581 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[115].x, _569);
    float _583 = _555 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _585 = _575 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _587 = _529 * _567;
    float _589 = -_183;
    int _591 = _493 ? as_type<int>(_589) : as_type<int>(_183);
    float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _595 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _597 = _585 + _595;
    float _599 = fma(_535, _573, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _601 = !_485;
    float _603 = _601 ? _183 : as_type<float>(_591);
    float _605 = _597 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _607 = -_179;
    int _609 = _533 ? as_type<int>(_607) : as_type<int>(_179);
    float _611 = fma(_599, _587, _581);
    float _613 = -_603;
    float _615 = _613 + 0.5;
    float _617 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[28].x, _605);
    float _619 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _621 = _583 + _619;
    bool _623 = !_491;
    float _625 = _623 ? _179 : as_type<float>(_609);
    float _627 = _615 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _629 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[117].x, _611);
    float _631 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[28].z, _617);
    float _633 = _627 * _593;
    float _635 = _625 + 0.5;
    float _637 = _629 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _639 = _631 >= 0.0;
    float _641 = _635 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _651 = _641 * _531;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _655 = _631;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _659 = _477;
    if (_639)
    {
        _655 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _661 = _655;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _665 = _643 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = _645 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _671 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _663 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _677 = as_type<int>(_661);
    int _679 = as_type<int>(_675);
    if (_639)
    {
        float _681 = _661 * 5.0;
        _677 = as_type<int>(_681);
    }
    int _683 = _677;
    out.m_46.x = _651;
    out.m_46.y = _633;
    int _685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _687 = _685 != 0;
    out.m_48.x = _669;
    out.m_48.y = _671;
    out.m_48.z = _673;
    out.m_50.x = _665;
    out.m_50.y = _667;
    out.m_50.z = _675;
    out.m_50.w = _637;
    if (_639)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2150 = as_type<float>(_683);
        out.gl_Position.z = _2150;
    }
    if (!_687)
    {
        _657 = 0.0;
        _659 = 0.0;
    }
    float _689 = _657;
    float _691 = _659;
    float _693 = _689;
    float _695 = _691;
    if (!_687)
    {
        _423 = 0.0;
    }
    float _697 = _423;
    bool _699 = !_687;
    float _701 = _697;
    if (!_699)
    {
        float _703 = -_585;
        float _705 = _703 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _707 = -_563;
        float _709 = _707 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _711 = -_583;
        float _713 = _711 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _715 = _705 * _705;
        float _717 = fma(_709, _709, _715);
        float _719 = fma(_713, _713, _717);
        float _721 = rsqrt(_719);
        float _723 = _721 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _725 = _709 * _723;
        float _727 = _705 * _723;
        float _729 = _713 * _723;
        _693 = _727;
        _695 = _725;
        _701 = _729;
    }
    float _731 = _693;
    float _733 = _695;
    float _735 = _701;
    if (_639)
    {
        out.m_35.x = 0.0;
    }
    if (_639)
    {
        return out;
    }
    float _737 = _585 + _731;
    float _739 = _563 + _733;
    float _741 = _583 + _735;
    float _743 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _745 = _737 + _743;
    float _747 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _749 = _739 + _747;
    float _751 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _753 = _741 + _751;
    float _755 = _745 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _757 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[28].x, _755);
    float _759 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[28].z, _757);
    bool _761 = _759 >= 0.0;
    float _763 = _749;
    if (_761)
    {
        _763 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _765 = _763;
    if (_761)
    {
        out.m_35.x = 0.0;
    }
    if (_761)
    {
        float _767 = _765 * 5.0;
        _679 = as_type<int>(_767);
    }
    int _769 = _679;
    if (_761)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2298 = as_type<float>(_769);
        out.gl_Position.z = _2298;
    }
    if (_761)
    {
        return out;
    }
    float _771 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _773 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _775 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _777 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _779 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _781 = _773 * _771;
    float _783 = _775 * _777;
    float _785 = _781 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _787 = _781 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _789 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[24].x, _785);
    float _791 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[26].x, _787);
    float _793 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[24].z, _789);
    float _795 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[26].z, _791);
    float _797 = _793 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _799 = _795 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _801 = _563 + _797;
    float _803 = _583 + _799;
    float _805 = _781 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _807 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _809 = _801 + _807;
    float _811 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _813 = _803 + _811;
    float _815 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[25].x, _805);
    float _817 = _809 * _809;
    float _819 = _813 * _813;
    float _821 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[25].z, _815);
    float _823 = _817 + _819;
    float _825 = _821 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _827 = sqrt(_823);
    float _829 = _585 + _825;
    bool _831 = _827 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _833 = _805;
    float _835 = _779;
    float _837 = _803;
    float _839 = _817;
    float _841 = _819;
    if (!_831)
    {
        _833 = _803;
    }
    float _843 = _833;
    float _845 = _843;
    if (!_831)
    {
        _835 = _801;
    }
    float _847 = _835;
    float _849 = _847;
    if (!_831)
    {
        _837 = _829;
    }
    float _851 = _837;
    bool _853 = !_831;
    float _855 = _851;
    if (!_853)
    {
        float _857 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _859 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _861 = _827 + _859;
        float _863 = _829 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _865 = rsqrt(_823);
        float _867 = _861 * _857;
        float _869 = _867 * 0.15915493667125701904296875;
        float _871 = _869 * 6.283185482025146484375;
        float _873 = sin(_871);
        float _875 = _869 * 6.283185482025146484375;
        float _877 = cos(_875);
        float _879 = fma(_873, _863, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _881 = _865 * _879;
        float _883 = _877 + (-1.0);
        float _885 = fma(_809, _881, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _887 = fma(_813, _881, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _889 = _883 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _891 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _893 = _885 + _891;
        float _895 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _897 = _887 + _895;
        float _899 = fma(_829, _877, _889);
        float _901 = _893 * _893;
        float _903 = _897 * _897;
        _855 = _899;
        _839 = _901;
        _841 = _903;
        _849 = _885;
        _845 = _887;
    }
    float _905 = _855;
    float _907 = _839;
    float _909 = _841;
    float _911 = _849;
    float _913 = _845;
    float _915 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _917 = _905 + _915;
    float _919 = fma(_917, _917, _907);
    float _921 = _919 + _909;
    float _923 = sqrt(_921);
    bool _925 = _923 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _927 = isnan(_923);
    bool _929 = _925 || _927;
    bool _931 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _933 = _929 || _931;
    float _935 = _907;
    if (!_933)
    {
        _935 = 1.0;
    }
    float _937 = _935;
    bool _939 = !_933;
    float _941 = _937;
    if (!_939)
    {
        bool _943 = _923 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _945 = isnan(_923);
        bool _947 = _943 || _945;
        bool _949 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _951 = _947 || _949;
        if (!_951)
        {
            float _953 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _955 = _923 + _953;
            float _957 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _959 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _957;
            float _961 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _963 = _961 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _965 = 1.0 / _959;
            float _967 = _955 * _965;
            float _969 = fma(_967, _963, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _941 = _969;
            _971 = true;
        }
        else
        {
            bool _973 = _923 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _975 = isnan(_923);
            bool _977 = _973 || _975;
            bool _979 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _981 = _977 || _979;
            if (!_981)
            {
                float _983 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _985 = _923 + _983;
                float _987 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _989 = _987 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _991 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _993 = _991 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _995 = 1.0 / _989;
                float _997 = _985 * _995;
                float _999 = fma(_997, _993, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _941 = _999;
                _971 = true;
            }
            else
            {
                _941 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _971 = false;
    float _1001 = _941;
    float _1003 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1005 = _905 + _1003;
    float _1007 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1009 = _911 + _1007;
    float _1011 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1013 = _913 + _1011;
    float _1015 = fma(_1005, _1001, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1017 = fma(_1009, _1001, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1019 = fma(_1013, _1001, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1021 = _1015 + _731;
    float _1023 = _1017 + _733;
    float _1025 = _1019 + _735;
    float _1027 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1029 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1031 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1033 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1035 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1027);
    float _1037 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1029);
    float _1039 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1031);
    float _1041 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1033);
    float _1043 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1035);
    float _1045 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1037);
    float _1047 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1039);
    float _1049 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1041);
    float _1051 = _1043 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1053 = _1045 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1055 = _1047 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1057 = _1049 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1059 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1061 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1063 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1065 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1067 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1059);
    float _1069 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1061);
    float _1071 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1063);
    float _1073 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1065);
    float _1075 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1067);
    float _1077 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1069);
    float _1079 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1071);
    float _1081 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1073);
    float _1083 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1075);
    float _1085 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1077);
    float _1087 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1079);
    float _1089 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1081);
    float _1091 = _1083 + _1085;
    float _1093 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1095 = _1091 * 0.5;
    out.m_35.x = _1093;
    out.gl_Position.x = _1087;
    out.gl_Position.y = _1089;
    out.gl_Position.z = _1083;
    out.gl_Position.w = _1085;
    out.m_52.z = _1095;
    out.m_52.w = _1085;
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
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _971 = false;
    bool _443 = false;
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
        float _1152 = as_type<float>(_87);
        out.gl_Position.z = _1152;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1221 = as_type<float>(_123);
        out.gl_Position.z = _1221;
    }
    if (_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _153 = 0.0;
    float _155 = _127;
    if (!_139)
    {
        float _157 = _127 * _127;
        float _159 = _157 * 0.5;
        _153 = _159;
    }
    float _161 = _153;
    float _163 = _161;
    if (!_139)
    {
        float _165 = _161 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _163 = _165;
    }
    float _167 = _163;
    int _169 = as_type<int>(_125) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_125) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_139;
    float _187 = _167;
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
        _155 = _241;
    }
    float _243 = _155;
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
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = _293 + _295;
    bool _299 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _301 = isnan(_293);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _293 + _311;
    bool _315 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _317 = isnan(_293);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = -_309;
    float _337 = _335 + 1.0;
    float _339 = 1.0 / _333;
    bool _341 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _343 = isnan(_293);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = _325 * _337;
    float _355 = -_325;
    float _357 = _355 + 1.0;
    bool _359 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _361 = _351 * _357;
    float _363 = 1.0 / _329;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = -_351;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _377 = _313 * _339;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _383 = fma(_375, _377, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _385 = fma(_381, _377, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _387 = _297 * _363;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _389;
    float _393 = in.m_42.x;
    float _395 = in.m_42.y;
    float _397 = fma(_367, _387, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _399 = fma(_391, _387, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _401 = _397 * _361;
    float _403 = _399 * _361;
    float _405 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _403);
    float _407 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _401);
    float _409 = fma(_385, _353, _405);
    float _411 = fma(_383, _353, _407);
    float _413 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[145].x, _409);
    float _415 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[145].y, _411);
    float _417 = _413 * _393;
    float _419 = _415 * _395;
    bool _421 = !_359;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _441;
    if (!_421)
    {
        float _425 = in.m_44.x;
        float _427 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _429 = _425 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _431 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _433 = _431 * _427;
        float _435 = floor(_433);
        float _437 = -_435;
        float _439 = _433 + _437;
        _441 = _439;
        _443 = true;
    }
    else
    {
        float _445 = float(_71);
        float _447 = 1.0 / _445;
        float _449 = _105 * _447;
        _441 = _449;
    }
    _443 = false;
    float _451 = _441;
    float _453 = in.m_44.x;
    float _455 = in.m_44.y;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _459 = _451 + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _465 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _467;
    float _471 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _477 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _465);
    float _479 = 1.0 / _463;
    float _481 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _471);
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _485 = _483 != 0;
    float _487 = 1.0 / _475;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _491 = _489 != 0;
    bool _493 = _455 > 0.5;
    float _495 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _497 = _469 * _479;
    bool _499 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _501 = isnan(_451);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _515 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _495);
    float _517 = fma(_497, _459, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _519 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _521 = isnan(_451);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _533 = _453 > 0.5;
    float _535 = _513 * _487;
    bool _537 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _539 = isnan(_451);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _545 = _541 || _543;
    float _547 = float(_545);
    float _549 = -_529;
    float _551 = _549 + 1.0;
    float _553 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _515);
    float _555 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _481);
    float _557 = _509 * _551;
    float _559 = -_509;
    float _561 = _559 + 1.0;
    float _563 = _553 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _565 = -_547;
    float _567 = _565 + 1.0;
    float _569 = _517 * _557;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _573 = _451 + _571;
    float _575 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _477);
    float _577 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _579 = _563 + _577;
    float _581 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[115].x, _569);
    float _583 = _555 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _585 = _575 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _587 = _529 * _567;
    float _589 = -_183;
    int _591 = _493 ? as_type<int>(_589) : as_type<int>(_183);
    float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _595 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _597 = _585 + _595;
    float _599 = fma(_535, _573, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _601 = !_485;
    float _603 = _601 ? _183 : as_type<float>(_591);
    float _605 = _597 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _607 = -_179;
    int _609 = _533 ? as_type<int>(_607) : as_type<int>(_179);
    float _611 = fma(_599, _587, _581);
    float _613 = -_603;
    float _615 = _613 + 0.5;
    float _617 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[28].x, _605);
    float _619 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _621 = _583 + _619;
    bool _623 = !_491;
    float _625 = _623 ? _179 : as_type<float>(_609);
    float _627 = _615 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _629 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[117].x, _611);
    float _631 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[28].z, _617);
    float _633 = _627 * _593;
    float _635 = _625 + 0.5;
    float _637 = _629 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _639 = _631 >= 0.0;
    float _641 = _635 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _651 = _641 * _531;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _655 = _631;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _659 = _477;
    if (_639)
    {
        _655 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _661 = _655;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _665 = _643 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = _645 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = _649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _671 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _663 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _677 = as_type<int>(_661);
    int _679 = as_type<int>(_675);
    if (_639)
    {
        float _681 = _661 * 5.0;
        _677 = as_type<int>(_681);
    }
    int _683 = _677;
    out.m_46.x = _651;
    out.m_46.y = _633;
    int _685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _687 = _685 != 0;
    out.m_48.x = _669;
    out.m_48.y = _671;
    out.m_48.z = _673;
    out.m_50.x = _665;
    out.m_50.y = _667;
    out.m_50.z = _675;
    out.m_50.w = _637;
    if (_639)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2150 = as_type<float>(_683);
        out.gl_Position.z = _2150;
    }
    if (!_687)
    {
        _657 = 0.0;
        _659 = 0.0;
    }
    float _689 = _657;
    float _691 = _659;
    float _693 = _689;
    float _695 = _691;
    if (!_687)
    {
        _423 = 0.0;
    }
    float _697 = _423;
    bool _699 = !_687;
    float _701 = _697;
    if (!_699)
    {
        float _703 = -_585;
        float _705 = _703 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _707 = -_563;
        float _709 = _707 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _711 = -_583;
        float _713 = _711 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _715 = _705 * _705;
        float _717 = fma(_709, _709, _715);
        float _719 = fma(_713, _713, _717);
        float _721 = rsqrt(_719);
        float _723 = _721 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _725 = _709 * _723;
        float _727 = _705 * _723;
        float _729 = _713 * _723;
        _693 = _727;
        _695 = _725;
        _701 = _729;
    }
    float _731 = _693;
    float _733 = _695;
    float _735 = _701;
    if (_639)
    {
        out.m_35.x = 0.0;
    }
    if (_639)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _737 = _585 + _731;
    float _739 = _563 + _733;
    float _741 = _583 + _735;
    float _743 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _745 = _737 + _743;
    float _747 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _749 = _739 + _747;
    float _751 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _753 = _741 + _751;
    float _755 = _745 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _757 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[28].x, _755);
    float _759 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[28].z, _757);
    bool _761 = _759 >= 0.0;
    float _763 = _749;
    if (_761)
    {
        _763 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _765 = _763;
    if (_761)
    {
        out.m_35.x = 0.0;
    }
    if (_761)
    {
        float _767 = _765 * 5.0;
        _679 = as_type<int>(_767);
    }
    int _769 = _679;
    if (_761)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2298 = as_type<float>(_769);
        out.gl_Position.z = _2298;
    }
    if (_761)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _771 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _773 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _775 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _777 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _779 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _781 = _773 * _771;
    float _783 = _775 * _777;
    float _785 = _781 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _787 = _781 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _789 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[24].x, _785);
    float _791 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[26].x, _787);
    float _793 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[24].z, _789);
    float _795 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[26].z, _791);
    float _797 = _793 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _799 = _795 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _801 = _563 + _797;
    float _803 = _583 + _799;
    float _805 = _781 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _807 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _809 = _801 + _807;
    float _811 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _813 = _803 + _811;
    float _815 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[25].x, _805);
    float _817 = _809 * _809;
    float _819 = _813 * _813;
    float _821 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[25].z, _815);
    float _823 = _817 + _819;
    float _825 = _821 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _827 = sqrt(_823);
    float _829 = _585 + _825;
    bool _831 = _827 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _833 = _805;
    float _835 = _779;
    float _837 = _803;
    float _839 = _817;
    float _841 = _819;
    if (!_831)
    {
        _833 = _803;
    }
    float _843 = _833;
    float _845 = _843;
    if (!_831)
    {
        _835 = _801;
    }
    float _847 = _835;
    float _849 = _847;
    if (!_831)
    {
        _837 = _829;
    }
    float _851 = _837;
    bool _853 = !_831;
    float _855 = _851;
    if (!_853)
    {
        float _857 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _859 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _861 = _827 + _859;
        float _863 = _829 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _865 = rsqrt(_823);
        float _867 = _861 * _857;
        float _869 = _867 * 0.15915493667125701904296875;
        float _871 = _869 * 6.283185482025146484375;
        float _873 = sin(_871);
        float _875 = _869 * 6.283185482025146484375;
        float _877 = cos(_875);
        float _879 = fma(_873, _863, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _881 = _865 * _879;
        float _883 = _877 + (-1.0);
        float _885 = fma(_809, _881, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _887 = fma(_813, _881, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _889 = _883 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _891 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _893 = _885 + _891;
        float _895 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _897 = _887 + _895;
        float _899 = fma(_829, _877, _889);
        float _901 = _893 * _893;
        float _903 = _897 * _897;
        _855 = _899;
        _839 = _901;
        _841 = _903;
        _849 = _885;
        _845 = _887;
    }
    float _905 = _855;
    float _907 = _839;
    float _909 = _841;
    float _911 = _849;
    float _913 = _845;
    float _915 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _917 = _905 + _915;
    float _919 = fma(_917, _917, _907);
    float _921 = _919 + _909;
    float _923 = sqrt(_921);
    bool _925 = _923 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _927 = isnan(_923);
    bool _929 = _925 || _927;
    bool _931 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _933 = _929 || _931;
    float _935 = _907;
    if (!_933)
    {
        _935 = 1.0;
    }
    float _937 = _935;
    bool _939 = !_933;
    float _941 = _937;
    if (!_939)
    {
        bool _943 = _923 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _945 = isnan(_923);
        bool _947 = _943 || _945;
        bool _949 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _951 = _947 || _949;
        if (!_951)
        {
            float _953 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _955 = _923 + _953;
            float _957 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _959 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _957;
            float _961 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _963 = _961 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _965 = 1.0 / _959;
            float _967 = _955 * _965;
            float _969 = fma(_967, _963, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _941 = _969;
            _971 = true;
        }
        else
        {
            bool _973 = _923 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _975 = isnan(_923);
            bool _977 = _973 || _975;
            bool _979 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _981 = _977 || _979;
            if (!_981)
            {
                float _983 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _985 = _923 + _983;
                float _987 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _989 = _987 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _991 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _993 = _991 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _995 = 1.0 / _989;
                float _997 = _985 * _995;
                float _999 = fma(_997, _993, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _941 = _999;
                _971 = true;
            }
            else
            {
                _941 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _971 = false;
    float _1001 = _941;
    float _1003 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1005 = _905 + _1003;
    float _1007 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1009 = _911 + _1007;
    float _1011 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1013 = _913 + _1011;
    float _1015 = fma(_1005, _1001, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1017 = fma(_1009, _1001, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1019 = fma(_1013, _1001, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1021 = _1015 + _731;
    float _1023 = _1017 + _733;
    float _1025 = _1019 + _735;
    float _1027 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1029 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1031 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1033 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1035 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1027);
    float _1037 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1029);
    float _1039 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1031);
    float _1041 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1033);
    float _1043 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1035);
    float _1045 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1037);
    float _1047 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1039);
    float _1049 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1041);
    float _1051 = _1043 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1053 = _1045 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1055 = _1047 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1057 = _1049 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1059 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1061 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1063 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1065 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1067 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1059);
    float _1069 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1061);
    float _1071 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1063);
    float _1073 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1065);
    float _1075 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1067);
    float _1077 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1069);
    float _1079 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1071);
    float _1081 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1073);
    float _1083 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1075);
    float _1085 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1077);
    float _1087 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1079);
    float _1089 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1081);
    float _1091 = _1083 + _1085;
    float _1093 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1095 = _1091 * 0.5;
    out.m_35.x = _1093;
    out.gl_Position.x = _1087;
    out.gl_Position.y = _1089;
    out.gl_Position.z = _1083;
    out.gl_Position.w = _1085;
    out.m_52.z = _1095;
    out.m_52.w = _1085;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

