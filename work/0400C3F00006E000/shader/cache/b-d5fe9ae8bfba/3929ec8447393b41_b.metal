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
    bool _919 = false;
    bool _395 = false;
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
        float _1290 = as_type<float>(_87);
        out.gl_Position.z = _1290;
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
        float _1359 = as_type<float>(_123);
        out.gl_Position.z = _1359;
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
    float _299 = in.m_42.x;
    float _301 = in.m_42.y;
    bool _303 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _305 = isnan(_293);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _315;
    bool _319 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _321 = isnan(_293);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -_313;
    float _333 = _331 + 1.0;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _335;
    float _339 = 1.0 / _317;
    bool _341 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _343 = _329 * _333;
    float _345 = -_329;
    float _347 = _345 + 1.0;
    float _349 = _297 * _339;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _351;
    float _355 = fma(_337, _349, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _357 = fma(_353, _349, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _359 = _355 * _343;
    float _361 = _357 * _343;
    float _363 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[143].x, _359);
    float _365 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[143].y, _361);
    float _367 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[144].x, _363);
    float _369 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[144].y, _365);
    float _371 = _367 * _299;
    float _373 = _369 * _301;
    bool _375 = !_341;
    float _393;
    if (!_375)
    {
        float _377 = in.m_44.x;
        float _379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _381 = _377 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _383 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _385 = _383 * _379;
        float _387 = floor(_385);
        float _389 = -_387;
        float _391 = _385 + _389;
        _393 = _391;
        _395 = true;
    }
    else
    {
        float _397 = float(_71);
        float _399 = 1.0 / _397;
        float _401 = _105 * _399;
        _393 = _401;
    }
    _395 = false;
    float _403 = _393;
    float _405 = in.m_44.x;
    float _407 = in.m_44.y;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _411 = _403 + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _417 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _419;
    float _423 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _429 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _431 = 1.0 / _415;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _437 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _423);
    float _439 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _429);
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _443 = _441 != 0;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _447 = _445 != 0;
    float _449 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _437);
    bool _451 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _453 = isnan(_403);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _465 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _439);
    bool _467 = _405 > 0.5;
    float _469 = _421 * _431;
    bool _471 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _473 = isnan(_403);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = 1.0 / _427;
    bool _485 = _407 > 0.5;
    float _487 = fma(_469, _411, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _489 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _491 = isnan(_403);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _417);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _505 = _403 + _503;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _509 = -_499;
    float _511 = _509 + 1.0;
    float _513 = -_461;
    float _515 = _513 + 1.0;
    float _517 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _501);
    float _519 = _481 * _511;
    float _521 = -_481;
    float _523 = _521 + 1.0;
    float _525 = _499 * _515;
    float _527 = -_179;
    int _529 = _467 ? as_type<int>(_527) : as_type<int>(_179);
    float _531 = _435 * _483;
    float _533 = _487 * _519;
    float _535 = _517 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _537 = !_443;
    float _539 = _537 ? _179 : as_type<float>(_529);
    float _541 = fma(_531, _505, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _543 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[115].x, _533);
    float _545 = _449 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _547 = _465 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _549 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _551 = _535 + _549;
    float _553 = -_183;
    int _555 = _485 ? as_type<int>(_553) : as_type<int>(_183);
    float _557 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _559 = _545 + _557;
    float _561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _563 = _539 + 0.5;
    float _565 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _567 = _547 + _565;
    float _569 = _559 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _571 = !_447;
    float _573 = _571 ? _183 : as_type<float>(_555);
    float _575 = _563 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _577 = fma(_541, _525, _543);
    float _579 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[28].x, _569);
    float _581 = -_573;
    float _583 = _581 + 0.5;
    float _585 = _575 * _463;
    float _587 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[28].z, _579);
    float _589 = _559 * _559;
    float _591 = _583 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _593 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[117].x, _577);
    float _595 = fma(_551, _551, _589);
    bool _597 = _587 >= 0.0;
    float _599 = _591 * _561;
    float _601 = fma(_567, _567, _595);
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _607 = rsqrt(_601);
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _615 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _617 = _595;
    if (_597)
    {
        _617 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _619 = _617;
    float _621 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _623 = _605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _625 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _627 = _613 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _629 = _507 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _631 = _593 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _633 = as_type<int>(_619);
    if (_597)
    {
        float _635 = _619 * 5.0;
        _633 = as_type<int>(_635);
    }
    int _637 = _633;
    out.m_46.x = _585;
    out.m_46.y = _599;
    float _639 = _559 * _607;
    float _641 = _551 * _607;
    out.m_48.x = _623;
    out.m_48.y = _625;
    out.m_48.z = _627;
    out.m_50.x = _615;
    out.m_50.y = _621;
    out.m_50.z = _629;
    out.m_50.w = _631;
    float _643 = as_type<float>(_637);
    if (_597)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2220 = as_type<float>(_637);
        out.gl_Position.z = _2220;
    }
    if (_597)
    {
        out.m_35.x = 0.0;
    }
    if (_597)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _645 = -_639;
    float _647 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[18].w, _545);
    float _649 = _567 * _607;
    float _651 = -_641;
    float _653 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[18].w, _535);
    float _655 = -_639;
    float _657 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[18].w, _559);
    float _659 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _661 = _647 + _659;
    float _663 = -_649;
    float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[18].w, _547);
    float _667 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _669 = _653 + _667;
    float _671 = -_641;
    float _673 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[18].w, _551);
    float _675 = _661 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _677 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _679 = _665 + _677;
    float _681 = _657 * _657;
    float _683 = -_649;
    float _685 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[18].w, _567);
    float _687 = fma(_669, (*spvDescriptorSet0.vp_c8)._m0[28].x, _675);
    float _689 = fma(_673, _673, _681);
    float _691 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[28].z, _687);
    float _693 = fma(_685, _685, _689);
    bool _695 = _691 >= 0.0;
    float _697 = sqrt(_693);
    if (_695)
    {
        _643 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _699 = _643;
    int _701 = as_type<int>(_699);
    if (_695)
    {
        out.m_35.x = 0.0;
    }
    float _703 = _607 * _697;
    if (_695)
    {
        float _705 = _699 * 5.0;
        _701 = as_type<int>(_705);
    }
    int _707 = _701;
    if (_695)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2351 = as_type<float>(_707);
        out.gl_Position.z = _2351;
    }
    if (_695)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _709 = _373 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _711 = _371 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _713 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _715 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _717 = _703 * _709;
    float _719 = _703 * _711;
    float _721 = _703 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _723 = _721 * 0.5;
    float _725 = _713 * _717;
    float _727 = _715 * _719;
    float _729 = _725 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _731 = _725 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _733 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[24].x, _729);
    float _735 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[26].x, _731);
    float _737 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[24].z, _733);
    float _739 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[26].z, _735);
    float _741 = _737 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _743 = _739 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _745 = _535 + _741;
    float _747 = _547 + _743;
    float _749 = _725 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _751 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _753 = _745 + _751;
    float _755 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _757 = _747 + _755;
    float _759 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[25].x, _749);
    float _761 = _753 * _753;
    float _763 = _757 * _757;
    float _765 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[25].z, _759);
    float _767 = _761 + _763;
    float _769 = _765 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _771 = sqrt(_767);
    float _773 = _545 + _769;
    bool _775 = _771 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _777 = _723;
    float _779 = _769;
    float _781 = _725;
    float _783 = _749;
    float _785 = _763;
    if (!_775)
    {
        _777 = _761;
    }
    float _787 = _777;
    float _789 = _787;
    if (!_775)
    {
        _779 = _745;
    }
    float _791 = _779;
    float _793 = _791;
    if (!_775)
    {
        _781 = _747;
    }
    float _795 = _781;
    float _797 = _795;
    if (!_775)
    {
        _783 = _773;
    }
    float _799 = _783;
    bool _801 = !_775;
    float _803 = _799;
    if (!_801)
    {
        float _805 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _807 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _809 = _771 + _807;
        float _811 = _773 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _813 = rsqrt(_767);
        float _815 = _809 * _805;
        float _817 = _815 * 0.15915493667125701904296875;
        float _819 = _817 * 6.283185482025146484375;
        float _821 = sin(_819);
        float _823 = _817 * 6.283185482025146484375;
        float _825 = cos(_823);
        float _827 = fma(_821, _811, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _829 = _813 * _827;
        float _831 = _825 + (-1.0);
        float _833 = fma(_753, _829, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _835 = fma(_757, _829, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _837 = _831 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _839 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _841 = _833 + _839;
        float _843 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _845 = _835 + _843;
        float _847 = fma(_773, _825, _837);
        float _849 = _841 * _841;
        float _851 = _845 * _845;
        _803 = _847;
        _789 = _849;
        _785 = _851;
        _793 = _833;
        _797 = _835;
    }
    float _853 = _803;
    float _855 = _789;
    float _857 = _785;
    float _859 = _793;
    float _861 = _797;
    float _863 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _865 = _853 + _863;
    float _867 = fma(_865, _865, _855);
    float _869 = _867 + _857;
    float _871 = sqrt(_869);
    bool _873 = _871 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _875 = isnan(_871);
    bool _877 = _873 || _875;
    bool _879 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _881 = _877 || _879;
    float _883 = _855;
    if (!_881)
    {
        _883 = 1.0;
    }
    float _885 = _883;
    bool _887 = !_881;
    float _889 = _885;
    if (!_887)
    {
        bool _891 = _871 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _893 = isnan(_871);
        bool _895 = _891 || _893;
        bool _897 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _899 = _895 || _897;
        if (!_899)
        {
            float _901 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _903 = _871 + _901;
            float _905 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _907 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _905;
            float _909 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _911 = _909 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _913 = 1.0 / _907;
            float _915 = _903 * _913;
            float _917 = fma(_915, _911, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _889 = _917;
            _919 = true;
        }
        else
        {
            bool _921 = _871 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _923 = isnan(_871);
            bool _925 = _921 || _923;
            bool _927 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _929 = _925 || _927;
            if (!_929)
            {
                float _931 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _933 = _871 + _931;
                float _935 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _937 = _935 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _939 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _941 = _939 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _943 = 1.0 / _937;
                float _945 = _933 * _943;
                float _947 = fma(_945, _941, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _889 = _947;
                _919 = true;
            }
            else
            {
                _889 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _919 = false;
    float _949 = _889;
    float _951 = _647 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _953 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _955 = _859 + _953;
    float _957 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _959 = _861 + _957;
    float _961 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[11].x, _951);
    bool _963 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _965 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _967 = _963 || _965;
    bool _969 = isnan(0.5);
    bool _971 = _967 || _969;
    float _973 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _975 = _853 + _973;
    float _977 = _647 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _979 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[11].z, _961);
    float _981 = fma(_955, _949, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _983 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[10].x, _977);
    float _985 = _979 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _987 = -_641;
    float _989 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[18].w, _981);
    float _991 = fma(_975, _949, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _993 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[10].z, _983);
    float _995 = 1.0 / _985;
    float _997 = fma(_959, _949, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _999 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1001 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1003 = _999 || _1001;
    bool _1005 = isnan(0.5);
    bool _1007 = _1003 || _1005;
    float _1009 = _993 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1011 = -_639;
    float _1013 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[18].w, _991);
    float _1015 = -_649;
    float _1017 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[18].w, _997);
    float _1019 = _1009 + _985;
    float _1021 = _1009;
    float _1023 = _1013;
    float _1025 = _1017;
    if (_971)
    {
        _1021 = _989;
    }
    float _1027 = _1021;
    float _1029 = _1027;
    if (!_971)
    {
        float _1031 = _661 * _661;
        float _1033 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1035 = -_547;
        float _1037 = _1035 + _997;
        float _1039 = -_535;
        float _1041 = _1039 + _981;
        float _1043 = fma(_669, _669, _1031);
        float _1045 = -_545;
        float _1047 = _1045 + _991;
        float _1049 = fma(_679, _679, _1043);
        float _1051 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1053 = sqrt(_1049);
        float _1055 = 1.0 / _703;
        float _1057 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1059 = precise::min(_1053, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1061 = _1059 * _1033;
        float _1063 = _1061 * _1055;
        float _1065 = _1057 * _1063;
        float _1067 = _1037 * _1063;
        float _1069 = fma(_1047, _1065, _647);
        float _1071 = fma(_1041, _1065, _653);
        float _1073 = fma(_1057, _1067, _665);
        _1023 = _1069;
        _1029 = _1071;
        _1025 = _1073;
    }
    float _1075 = _1023;
    float _1077 = _1029;
    float _1079 = _1025;
    float _1081 = _1019 * _995;
    float _1083 = _1081 * 0.5;
    float _1085 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1087 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1089 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1091 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1093 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1085);
    float _1095 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1087);
    float _1097 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1089);
    float _1099 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1091);
    float _1101 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1093);
    float _1103 = _1093;
    if (_1007)
    {
        _1103 = 1.0;
    }
    float _1105 = _1103;
    float _1107 = _1105;
    if (!_1007)
    {
        float _1109 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1111 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1113 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1111);
        float _1115 = _1109 * 0.15915493667125701904296875;
        float _1117 = _1115 * 6.283185482025146484375;
        float _1119 = cos(_1117);
        float _1121 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1123 = _1121 * 0.15915493667125701904296875;
        float _1125 = _1115 * 6.283185482025146484375;
        float _1127 = sin(_1125);
        float _1129 = 1.0 / _1119;
        float _1131 = _1123 * 6.283185482025146484375;
        float _1133 = cos(_1131);
        float _1135 = _1127 * _1129;
        float _1137 = 1.0 / _1113;
        float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1141 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1139;
        float _1143 = _1133 * _1135;
        float _1145 = _1123 * 6.283185482025146484375;
        float _1147 = sin(_1145);
        float _1149 = 1.0 / _1143;
        float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1153 = _1137 * _1151;
        float _1155 = 1.0 / _1141;
        float _1157 = _1147 * _1149;
        float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1161 = fma(_1157, _1153, _1159);
        float _1163 = _1161 * _1155;
        float _1165 = precise::clamp(_1163, 0.0, 1.0);
        _1107 = _1165;
    }
    float _1167 = _1107;
    float _1169 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1095);
    float _1171 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1173 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1097);
    float _1175 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1099);
    float _1177 = _1169 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1179 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1181 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1183 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1185 = _1173 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1187 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1179);
    float _1189 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1181);
    float _1191 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1193 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1183);
    float _1195 = _1175 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1197 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1187);
    float _1199 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1189);
    float _1201 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1191);
    float _1203 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1193);
    float _1205 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1197);
    float _1207 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1199);
    bool _1209 = _1167 > 0.0;
    bool _1211 = isnan(_1167);
    bool _1213 = _1209 || _1211;
    bool _1215 = isnan(0.0);
    bool _1217 = _1213 || _1215;
    float _1219 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1201);
    float _1221 = _1167 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1223 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1203);
    float _1225 = _1205 + _1207;
    float _1227 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1219);
    float _1229 = _1221 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1231 = _1225 * 0.5;
    out.m_35.x = _1229;
    out.gl_Position.x = _1223;
    out.gl_Position.y = _1227;
    out.gl_Position.z = _1205;
    out.gl_Position.w = _1207;
    out.m_52.z = _1231;
    out.m_52.w = _1207;
    if (_1217)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _1233 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1233;
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
    bool _919 = false;
    bool _395 = false;
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
        float _1290 = as_type<float>(_87);
        out.gl_Position.z = _1290;
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
        float _1359 = as_type<float>(_123);
        out.gl_Position.z = _1359;
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
    float _299 = in.m_42.x;
    float _301 = in.m_42.y;
    bool _303 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _305 = isnan(_293);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _315;
    bool _319 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _321 = isnan(_293);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -_313;
    float _333 = _331 + 1.0;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _335;
    float _339 = 1.0 / _317;
    bool _341 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _343 = _329 * _333;
    float _345 = -_329;
    float _347 = _345 + 1.0;
    float _349 = _297 * _339;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _351;
    float _355 = fma(_337, _349, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _357 = fma(_353, _349, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _359 = _355 * _343;
    float _361 = _357 * _343;
    float _363 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[143].x, _359);
    float _365 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[143].y, _361);
    float _367 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[144].x, _363);
    float _369 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[144].y, _365);
    float _371 = _367 * _299;
    float _373 = _369 * _301;
    bool _375 = !_341;
    float _393;
    if (!_375)
    {
        float _377 = in.m_44.x;
        float _379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _381 = _377 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _383 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _385 = _383 * _379;
        float _387 = floor(_385);
        float _389 = -_387;
        float _391 = _385 + _389;
        _393 = _391;
        _395 = true;
    }
    else
    {
        float _397 = float(_71);
        float _399 = 1.0 / _397;
        float _401 = _105 * _399;
        _393 = _401;
    }
    _395 = false;
    float _403 = _393;
    float _405 = in.m_44.x;
    float _407 = in.m_44.y;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _411 = _403 + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _417 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _419;
    float _423 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _429 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _431 = 1.0 / _415;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _437 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _423);
    float _439 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _429);
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _443 = _441 != 0;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _447 = _445 != 0;
    float _449 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _437);
    bool _451 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _453 = isnan(_403);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _465 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _439);
    bool _467 = _405 > 0.5;
    float _469 = _421 * _431;
    bool _471 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _473 = isnan(_403);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = 1.0 / _427;
    bool _485 = _407 > 0.5;
    float _487 = fma(_469, _411, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _489 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _491 = isnan(_403);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _417);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _505 = _403 + _503;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _509 = -_499;
    float _511 = _509 + 1.0;
    float _513 = -_461;
    float _515 = _513 + 1.0;
    float _517 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _501);
    float _519 = _481 * _511;
    float _521 = -_481;
    float _523 = _521 + 1.0;
    float _525 = _499 * _515;
    float _527 = -_179;
    int _529 = _467 ? as_type<int>(_527) : as_type<int>(_179);
    float _531 = _435 * _483;
    float _533 = _487 * _519;
    float _535 = _517 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _537 = !_443;
    float _539 = _537 ? _179 : as_type<float>(_529);
    float _541 = fma(_531, _505, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _543 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[115].x, _533);
    float _545 = _449 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _547 = _465 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _549 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _551 = _535 + _549;
    float _553 = -_183;
    int _555 = _485 ? as_type<int>(_553) : as_type<int>(_183);
    float _557 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _559 = _545 + _557;
    float _561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _563 = _539 + 0.5;
    float _565 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _567 = _547 + _565;
    float _569 = _559 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _571 = !_447;
    float _573 = _571 ? _183 : as_type<float>(_555);
    float _575 = _563 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _577 = fma(_541, _525, _543);
    float _579 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[28].x, _569);
    float _581 = -_573;
    float _583 = _581 + 0.5;
    float _585 = _575 * _463;
    float _587 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[28].z, _579);
    float _589 = _559 * _559;
    float _591 = _583 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _593 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[117].x, _577);
    float _595 = fma(_551, _551, _589);
    bool _597 = _587 >= 0.0;
    float _599 = _591 * _561;
    float _601 = fma(_567, _567, _595);
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _607 = rsqrt(_601);
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _615 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _617 = _595;
    if (_597)
    {
        _617 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _619 = _617;
    float _621 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _623 = _605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _625 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _627 = _613 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _629 = _507 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _631 = _593 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _633 = as_type<int>(_619);
    if (_597)
    {
        float _635 = _619 * 5.0;
        _633 = as_type<int>(_635);
    }
    int _637 = _633;
    out.m_46.x = _585;
    out.m_46.y = _599;
    float _639 = _559 * _607;
    float _641 = _551 * _607;
    out.m_48.x = _623;
    out.m_48.y = _625;
    out.m_48.z = _627;
    out.m_50.x = _615;
    out.m_50.y = _621;
    out.m_50.z = _629;
    out.m_50.w = _631;
    float _643 = as_type<float>(_637);
    if (_597)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2220 = as_type<float>(_637);
        out.gl_Position.z = _2220;
    }
    if (_597)
    {
        out.m_35.x = 0.0;
    }
    if (_597)
    {
        return out;
    }
    float _645 = -_639;
    float _647 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[18].w, _545);
    float _649 = _567 * _607;
    float _651 = -_641;
    float _653 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[18].w, _535);
    float _655 = -_639;
    float _657 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[18].w, _559);
    float _659 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _661 = _647 + _659;
    float _663 = -_649;
    float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[18].w, _547);
    float _667 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _669 = _653 + _667;
    float _671 = -_641;
    float _673 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[18].w, _551);
    float _675 = _661 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _677 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _679 = _665 + _677;
    float _681 = _657 * _657;
    float _683 = -_649;
    float _685 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[18].w, _567);
    float _687 = fma(_669, (*spvDescriptorSet0.vp_c8)._m0[28].x, _675);
    float _689 = fma(_673, _673, _681);
    float _691 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[28].z, _687);
    float _693 = fma(_685, _685, _689);
    bool _695 = _691 >= 0.0;
    float _697 = sqrt(_693);
    if (_695)
    {
        _643 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _699 = _643;
    int _701 = as_type<int>(_699);
    if (_695)
    {
        out.m_35.x = 0.0;
    }
    float _703 = _607 * _697;
    if (_695)
    {
        float _705 = _699 * 5.0;
        _701 = as_type<int>(_705);
    }
    int _707 = _701;
    if (_695)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2351 = as_type<float>(_707);
        out.gl_Position.z = _2351;
    }
    if (_695)
    {
        return out;
    }
    float _709 = _373 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _711 = _371 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _713 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _715 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _717 = _703 * _709;
    float _719 = _703 * _711;
    float _721 = _703 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _723 = _721 * 0.5;
    float _725 = _713 * _717;
    float _727 = _715 * _719;
    float _729 = _725 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _731 = _725 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _733 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[24].x, _729);
    float _735 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[26].x, _731);
    float _737 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[24].z, _733);
    float _739 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[26].z, _735);
    float _741 = _737 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _743 = _739 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _745 = _535 + _741;
    float _747 = _547 + _743;
    float _749 = _725 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _751 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _753 = _745 + _751;
    float _755 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _757 = _747 + _755;
    float _759 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[25].x, _749);
    float _761 = _753 * _753;
    float _763 = _757 * _757;
    float _765 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[25].z, _759);
    float _767 = _761 + _763;
    float _769 = _765 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _771 = sqrt(_767);
    float _773 = _545 + _769;
    bool _775 = _771 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _777 = _723;
    float _779 = _769;
    float _781 = _725;
    float _783 = _749;
    float _785 = _763;
    if (!_775)
    {
        _777 = _761;
    }
    float _787 = _777;
    float _789 = _787;
    if (!_775)
    {
        _779 = _745;
    }
    float _791 = _779;
    float _793 = _791;
    if (!_775)
    {
        _781 = _747;
    }
    float _795 = _781;
    float _797 = _795;
    if (!_775)
    {
        _783 = _773;
    }
    float _799 = _783;
    bool _801 = !_775;
    float _803 = _799;
    if (!_801)
    {
        float _805 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _807 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _809 = _771 + _807;
        float _811 = _773 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _813 = rsqrt(_767);
        float _815 = _809 * _805;
        float _817 = _815 * 0.15915493667125701904296875;
        float _819 = _817 * 6.283185482025146484375;
        float _821 = sin(_819);
        float _823 = _817 * 6.283185482025146484375;
        float _825 = cos(_823);
        float _827 = fma(_821, _811, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _829 = _813 * _827;
        float _831 = _825 + (-1.0);
        float _833 = fma(_753, _829, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _835 = fma(_757, _829, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _837 = _831 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _839 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _841 = _833 + _839;
        float _843 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _845 = _835 + _843;
        float _847 = fma(_773, _825, _837);
        float _849 = _841 * _841;
        float _851 = _845 * _845;
        _803 = _847;
        _789 = _849;
        _785 = _851;
        _793 = _833;
        _797 = _835;
    }
    float _853 = _803;
    float _855 = _789;
    float _857 = _785;
    float _859 = _793;
    float _861 = _797;
    float _863 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _865 = _853 + _863;
    float _867 = fma(_865, _865, _855);
    float _869 = _867 + _857;
    float _871 = sqrt(_869);
    bool _873 = _871 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _875 = isnan(_871);
    bool _877 = _873 || _875;
    bool _879 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _881 = _877 || _879;
    float _883 = _855;
    if (!_881)
    {
        _883 = 1.0;
    }
    float _885 = _883;
    bool _887 = !_881;
    float _889 = _885;
    if (!_887)
    {
        bool _891 = _871 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _893 = isnan(_871);
        bool _895 = _891 || _893;
        bool _897 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _899 = _895 || _897;
        if (!_899)
        {
            float _901 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _903 = _871 + _901;
            float _905 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _907 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _905;
            float _909 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _911 = _909 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _913 = 1.0 / _907;
            float _915 = _903 * _913;
            float _917 = fma(_915, _911, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _889 = _917;
            _919 = true;
        }
        else
        {
            bool _921 = _871 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _923 = isnan(_871);
            bool _925 = _921 || _923;
            bool _927 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _929 = _925 || _927;
            if (!_929)
            {
                float _931 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _933 = _871 + _931;
                float _935 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _937 = _935 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _939 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _941 = _939 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _943 = 1.0 / _937;
                float _945 = _933 * _943;
                float _947 = fma(_945, _941, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _889 = _947;
                _919 = true;
            }
            else
            {
                _889 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _919 = false;
    float _949 = _889;
    float _951 = _647 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _953 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _955 = _859 + _953;
    float _957 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _959 = _861 + _957;
    float _961 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[11].x, _951);
    bool _963 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _965 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _967 = _963 || _965;
    bool _969 = isnan(0.5);
    bool _971 = _967 || _969;
    float _973 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _975 = _853 + _973;
    float _977 = _647 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _979 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[11].z, _961);
    float _981 = fma(_955, _949, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _983 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[10].x, _977);
    float _985 = _979 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _987 = -_641;
    float _989 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[18].w, _981);
    float _991 = fma(_975, _949, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _993 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[10].z, _983);
    float _995 = 1.0 / _985;
    float _997 = fma(_959, _949, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _999 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1001 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1003 = _999 || _1001;
    bool _1005 = isnan(0.5);
    bool _1007 = _1003 || _1005;
    float _1009 = _993 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1011 = -_639;
    float _1013 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[18].w, _991);
    float _1015 = -_649;
    float _1017 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[18].w, _997);
    float _1019 = _1009 + _985;
    float _1021 = _1009;
    float _1023 = _1013;
    float _1025 = _1017;
    if (_971)
    {
        _1021 = _989;
    }
    float _1027 = _1021;
    float _1029 = _1027;
    if (!_971)
    {
        float _1031 = _661 * _661;
        float _1033 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1035 = -_547;
        float _1037 = _1035 + _997;
        float _1039 = -_535;
        float _1041 = _1039 + _981;
        float _1043 = fma(_669, _669, _1031);
        float _1045 = -_545;
        float _1047 = _1045 + _991;
        float _1049 = fma(_679, _679, _1043);
        float _1051 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1053 = sqrt(_1049);
        float _1055 = 1.0 / _703;
        float _1057 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1059 = precise::min(_1053, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1061 = _1059 * _1033;
        float _1063 = _1061 * _1055;
        float _1065 = _1057 * _1063;
        float _1067 = _1037 * _1063;
        float _1069 = fma(_1047, _1065, _647);
        float _1071 = fma(_1041, _1065, _653);
        float _1073 = fma(_1057, _1067, _665);
        _1023 = _1069;
        _1029 = _1071;
        _1025 = _1073;
    }
    float _1075 = _1023;
    float _1077 = _1029;
    float _1079 = _1025;
    float _1081 = _1019 * _995;
    float _1083 = _1081 * 0.5;
    float _1085 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1087 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1089 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1091 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1093 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1085);
    float _1095 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1087);
    float _1097 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1089);
    float _1099 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1091);
    float _1101 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1093);
    float _1103 = _1093;
    if (_1007)
    {
        _1103 = 1.0;
    }
    float _1105 = _1103;
    float _1107 = _1105;
    if (!_1007)
    {
        float _1109 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1111 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1113 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1111);
        float _1115 = _1109 * 0.15915493667125701904296875;
        float _1117 = _1115 * 6.283185482025146484375;
        float _1119 = cos(_1117);
        float _1121 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1123 = _1121 * 0.15915493667125701904296875;
        float _1125 = _1115 * 6.283185482025146484375;
        float _1127 = sin(_1125);
        float _1129 = 1.0 / _1119;
        float _1131 = _1123 * 6.283185482025146484375;
        float _1133 = cos(_1131);
        float _1135 = _1127 * _1129;
        float _1137 = 1.0 / _1113;
        float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1141 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1139;
        float _1143 = _1133 * _1135;
        float _1145 = _1123 * 6.283185482025146484375;
        float _1147 = sin(_1145);
        float _1149 = 1.0 / _1143;
        float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1153 = _1137 * _1151;
        float _1155 = 1.0 / _1141;
        float _1157 = _1147 * _1149;
        float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1161 = fma(_1157, _1153, _1159);
        float _1163 = _1161 * _1155;
        float _1165 = precise::clamp(_1163, 0.0, 1.0);
        _1107 = _1165;
    }
    float _1167 = _1107;
    float _1169 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1095);
    float _1171 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1173 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1097);
    float _1175 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1099);
    float _1177 = _1169 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1179 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1181 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1183 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1185 = _1173 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1187 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1179);
    float _1189 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1181);
    float _1191 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1193 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1183);
    float _1195 = _1175 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1197 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1187);
    float _1199 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1189);
    float _1201 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1191);
    float _1203 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1193);
    float _1205 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1197);
    float _1207 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1199);
    bool _1209 = _1167 > 0.0;
    bool _1211 = isnan(_1167);
    bool _1213 = _1209 || _1211;
    bool _1215 = isnan(0.0);
    bool _1217 = _1213 || _1215;
    float _1219 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1201);
    float _1221 = _1167 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1223 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1203);
    float _1225 = _1205 + _1207;
    float _1227 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1219);
    float _1229 = _1221 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1231 = _1225 * 0.5;
    out.m_35.x = _1229;
    out.gl_Position.x = _1223;
    out.gl_Position.y = _1227;
    out.gl_Position.z = _1205;
    out.gl_Position.w = _1207;
    out.m_52.z = _1231;
    out.m_52.w = _1207;
    if (_1217)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _1233 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1233;
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
    bool _919 = false;
    bool _395 = false;
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
        float _1290 = as_type<float>(_87);
        out.gl_Position.z = _1290;
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
        float _1359 = as_type<float>(_123);
        out.gl_Position.z = _1359;
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
    float _299 = in.m_42.x;
    float _301 = in.m_42.y;
    bool _303 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _305 = isnan(_293);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _315;
    bool _319 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _321 = isnan(_293);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -_313;
    float _333 = _331 + 1.0;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _335;
    float _339 = 1.0 / _317;
    bool _341 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _343 = _329 * _333;
    float _345 = -_329;
    float _347 = _345 + 1.0;
    float _349 = _297 * _339;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _351;
    float _355 = fma(_337, _349, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _357 = fma(_353, _349, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _359 = _355 * _343;
    float _361 = _357 * _343;
    float _363 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[143].x, _359);
    float _365 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[143].y, _361);
    float _367 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[144].x, _363);
    float _369 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[144].y, _365);
    float _371 = _367 * _299;
    float _373 = _369 * _301;
    bool _375 = !_341;
    float _393;
    if (!_375)
    {
        float _377 = in.m_44.x;
        float _379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _381 = _377 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _383 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _385 = _383 * _379;
        float _387 = floor(_385);
        float _389 = -_387;
        float _391 = _385 + _389;
        _393 = _391;
        _395 = true;
    }
    else
    {
        float _397 = float(_71);
        float _399 = 1.0 / _397;
        float _401 = _105 * _399;
        _393 = _401;
    }
    _395 = false;
    float _403 = _393;
    float _405 = in.m_44.x;
    float _407 = in.m_44.y;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _411 = _403 + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _417 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _419;
    float _423 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _429 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _431 = 1.0 / _415;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _437 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _423);
    float _439 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _429);
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _443 = _441 != 0;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _447 = _445 != 0;
    float _449 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _437);
    bool _451 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _453 = isnan(_403);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _465 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _439);
    bool _467 = _405 > 0.5;
    float _469 = _421 * _431;
    bool _471 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _473 = isnan(_403);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = 1.0 / _427;
    bool _485 = _407 > 0.5;
    float _487 = fma(_469, _411, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _489 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _491 = isnan(_403);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _417);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _505 = _403 + _503;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _509 = -_499;
    float _511 = _509 + 1.0;
    float _513 = -_461;
    float _515 = _513 + 1.0;
    float _517 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _501);
    float _519 = _481 * _511;
    float _521 = -_481;
    float _523 = _521 + 1.0;
    float _525 = _499 * _515;
    float _527 = -_179;
    int _529 = _467 ? as_type<int>(_527) : as_type<int>(_179);
    float _531 = _435 * _483;
    float _533 = _487 * _519;
    float _535 = _517 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _537 = !_443;
    float _539 = _537 ? _179 : as_type<float>(_529);
    float _541 = fma(_531, _505, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _543 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[115].x, _533);
    float _545 = _449 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _547 = _465 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _549 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _551 = _535 + _549;
    float _553 = -_183;
    int _555 = _485 ? as_type<int>(_553) : as_type<int>(_183);
    float _557 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _559 = _545 + _557;
    float _561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _563 = _539 + 0.5;
    float _565 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _567 = _547 + _565;
    float _569 = _559 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _571 = !_447;
    float _573 = _571 ? _183 : as_type<float>(_555);
    float _575 = _563 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _577 = fma(_541, _525, _543);
    float _579 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[28].x, _569);
    float _581 = -_573;
    float _583 = _581 + 0.5;
    float _585 = _575 * _463;
    float _587 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[28].z, _579);
    float _589 = _559 * _559;
    float _591 = _583 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _593 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[117].x, _577);
    float _595 = fma(_551, _551, _589);
    bool _597 = _587 >= 0.0;
    float _599 = _591 * _561;
    float _601 = fma(_567, _567, _595);
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _607 = rsqrt(_601);
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _615 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _617 = _595;
    if (_597)
    {
        _617 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _619 = _617;
    float _621 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _623 = _605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _625 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _627 = _613 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _629 = _507 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _631 = _593 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _633 = as_type<int>(_619);
    if (_597)
    {
        float _635 = _619 * 5.0;
        _633 = as_type<int>(_635);
    }
    int _637 = _633;
    out.m_46.x = _585;
    out.m_46.y = _599;
    float _639 = _559 * _607;
    float _641 = _551 * _607;
    out.m_48.x = _623;
    out.m_48.y = _625;
    out.m_48.z = _627;
    out.m_50.x = _615;
    out.m_50.y = _621;
    out.m_50.z = _629;
    out.m_50.w = _631;
    float _643 = as_type<float>(_637);
    if (_597)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2220 = as_type<float>(_637);
        out.gl_Position.z = _2220;
    }
    if (_597)
    {
        out.m_35.x = 0.0;
    }
    if (_597)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _645 = -_639;
    float _647 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[18].w, _545);
    float _649 = _567 * _607;
    float _651 = -_641;
    float _653 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[18].w, _535);
    float _655 = -_639;
    float _657 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[18].w, _559);
    float _659 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _661 = _647 + _659;
    float _663 = -_649;
    float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[18].w, _547);
    float _667 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _669 = _653 + _667;
    float _671 = -_641;
    float _673 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[18].w, _551);
    float _675 = _661 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _677 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _679 = _665 + _677;
    float _681 = _657 * _657;
    float _683 = -_649;
    float _685 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[18].w, _567);
    float _687 = fma(_669, (*spvDescriptorSet0.vp_c8)._m0[28].x, _675);
    float _689 = fma(_673, _673, _681);
    float _691 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[28].z, _687);
    float _693 = fma(_685, _685, _689);
    bool _695 = _691 >= 0.0;
    float _697 = sqrt(_693);
    if (_695)
    {
        _643 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _699 = _643;
    int _701 = as_type<int>(_699);
    if (_695)
    {
        out.m_35.x = 0.0;
    }
    float _703 = _607 * _697;
    if (_695)
    {
        float _705 = _699 * 5.0;
        _701 = as_type<int>(_705);
    }
    int _707 = _701;
    if (_695)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2351 = as_type<float>(_707);
        out.gl_Position.z = _2351;
    }
    if (_695)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _709 = _373 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _711 = _371 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _713 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _715 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _717 = _703 * _709;
    float _719 = _703 * _711;
    float _721 = _703 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _723 = _721 * 0.5;
    float _725 = _713 * _717;
    float _727 = _715 * _719;
    float _729 = _725 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _731 = _725 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _733 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[24].x, _729);
    float _735 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[26].x, _731);
    float _737 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[24].z, _733);
    float _739 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[26].z, _735);
    float _741 = _737 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _743 = _739 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _745 = _535 + _741;
    float _747 = _547 + _743;
    float _749 = _725 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _751 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _753 = _745 + _751;
    float _755 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _757 = _747 + _755;
    float _759 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[25].x, _749);
    float _761 = _753 * _753;
    float _763 = _757 * _757;
    float _765 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[25].z, _759);
    float _767 = _761 + _763;
    float _769 = _765 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _771 = sqrt(_767);
    float _773 = _545 + _769;
    bool _775 = _771 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _777 = _723;
    float _779 = _769;
    float _781 = _725;
    float _783 = _749;
    float _785 = _763;
    if (!_775)
    {
        _777 = _761;
    }
    float _787 = _777;
    float _789 = _787;
    if (!_775)
    {
        _779 = _745;
    }
    float _791 = _779;
    float _793 = _791;
    if (!_775)
    {
        _781 = _747;
    }
    float _795 = _781;
    float _797 = _795;
    if (!_775)
    {
        _783 = _773;
    }
    float _799 = _783;
    bool _801 = !_775;
    float _803 = _799;
    if (!_801)
    {
        float _805 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _807 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _809 = _771 + _807;
        float _811 = _773 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _813 = rsqrt(_767);
        float _815 = _809 * _805;
        float _817 = _815 * 0.15915493667125701904296875;
        float _819 = _817 * 6.283185482025146484375;
        float _821 = sin(_819);
        float _823 = _817 * 6.283185482025146484375;
        float _825 = cos(_823);
        float _827 = fma(_821, _811, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _829 = _813 * _827;
        float _831 = _825 + (-1.0);
        float _833 = fma(_753, _829, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _835 = fma(_757, _829, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _837 = _831 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _839 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _841 = _833 + _839;
        float _843 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _845 = _835 + _843;
        float _847 = fma(_773, _825, _837);
        float _849 = _841 * _841;
        float _851 = _845 * _845;
        _803 = _847;
        _789 = _849;
        _785 = _851;
        _793 = _833;
        _797 = _835;
    }
    float _853 = _803;
    float _855 = _789;
    float _857 = _785;
    float _859 = _793;
    float _861 = _797;
    float _863 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _865 = _853 + _863;
    float _867 = fma(_865, _865, _855);
    float _869 = _867 + _857;
    float _871 = sqrt(_869);
    bool _873 = _871 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _875 = isnan(_871);
    bool _877 = _873 || _875;
    bool _879 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _881 = _877 || _879;
    float _883 = _855;
    if (!_881)
    {
        _883 = 1.0;
    }
    float _885 = _883;
    bool _887 = !_881;
    float _889 = _885;
    if (!_887)
    {
        bool _891 = _871 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _893 = isnan(_871);
        bool _895 = _891 || _893;
        bool _897 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _899 = _895 || _897;
        if (!_899)
        {
            float _901 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _903 = _871 + _901;
            float _905 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _907 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _905;
            float _909 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _911 = _909 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _913 = 1.0 / _907;
            float _915 = _903 * _913;
            float _917 = fma(_915, _911, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _889 = _917;
            _919 = true;
        }
        else
        {
            bool _921 = _871 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _923 = isnan(_871);
            bool _925 = _921 || _923;
            bool _927 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _929 = _925 || _927;
            if (!_929)
            {
                float _931 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _933 = _871 + _931;
                float _935 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _937 = _935 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _939 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _941 = _939 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _943 = 1.0 / _937;
                float _945 = _933 * _943;
                float _947 = fma(_945, _941, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _889 = _947;
                _919 = true;
            }
            else
            {
                _889 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _919 = false;
    float _949 = _889;
    float _951 = _647 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _953 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _955 = _859 + _953;
    float _957 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _959 = _861 + _957;
    float _961 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[11].x, _951);
    bool _963 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _965 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _967 = _963 || _965;
    bool _969 = isnan(0.5);
    bool _971 = _967 || _969;
    float _973 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _975 = _853 + _973;
    float _977 = _647 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _979 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[11].z, _961);
    float _981 = fma(_955, _949, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _983 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[10].x, _977);
    float _985 = _979 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _987 = -_641;
    float _989 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[18].w, _981);
    float _991 = fma(_975, _949, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _993 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[10].z, _983);
    float _995 = 1.0 / _985;
    float _997 = fma(_959, _949, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _999 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1001 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1003 = _999 || _1001;
    bool _1005 = isnan(0.5);
    bool _1007 = _1003 || _1005;
    float _1009 = _993 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1011 = -_639;
    float _1013 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[18].w, _991);
    float _1015 = -_649;
    float _1017 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[18].w, _997);
    float _1019 = _1009 + _985;
    float _1021 = _1009;
    float _1023 = _1013;
    float _1025 = _1017;
    if (_971)
    {
        _1021 = _989;
    }
    float _1027 = _1021;
    float _1029 = _1027;
    if (!_971)
    {
        float _1031 = _661 * _661;
        float _1033 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1035 = -_547;
        float _1037 = _1035 + _997;
        float _1039 = -_535;
        float _1041 = _1039 + _981;
        float _1043 = fma(_669, _669, _1031);
        float _1045 = -_545;
        float _1047 = _1045 + _991;
        float _1049 = fma(_679, _679, _1043);
        float _1051 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1053 = sqrt(_1049);
        float _1055 = 1.0 / _703;
        float _1057 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1059 = precise::min(_1053, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1061 = _1059 * _1033;
        float _1063 = _1061 * _1055;
        float _1065 = _1057 * _1063;
        float _1067 = _1037 * _1063;
        float _1069 = fma(_1047, _1065, _647);
        float _1071 = fma(_1041, _1065, _653);
        float _1073 = fma(_1057, _1067, _665);
        _1023 = _1069;
        _1029 = _1071;
        _1025 = _1073;
    }
    float _1075 = _1023;
    float _1077 = _1029;
    float _1079 = _1025;
    float _1081 = _1019 * _995;
    float _1083 = _1081 * 0.5;
    float _1085 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1087 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1089 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1091 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1093 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1085);
    float _1095 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1087);
    float _1097 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1089);
    float _1099 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1091);
    float _1101 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1093);
    float _1103 = _1093;
    if (_1007)
    {
        _1103 = 1.0;
    }
    float _1105 = _1103;
    float _1107 = _1105;
    if (!_1007)
    {
        float _1109 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1111 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1113 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1111);
        float _1115 = _1109 * 0.15915493667125701904296875;
        float _1117 = _1115 * 6.283185482025146484375;
        float _1119 = cos(_1117);
        float _1121 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1123 = _1121 * 0.15915493667125701904296875;
        float _1125 = _1115 * 6.283185482025146484375;
        float _1127 = sin(_1125);
        float _1129 = 1.0 / _1119;
        float _1131 = _1123 * 6.283185482025146484375;
        float _1133 = cos(_1131);
        float _1135 = _1127 * _1129;
        float _1137 = 1.0 / _1113;
        float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1141 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1139;
        float _1143 = _1133 * _1135;
        float _1145 = _1123 * 6.283185482025146484375;
        float _1147 = sin(_1145);
        float _1149 = 1.0 / _1143;
        float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1153 = _1137 * _1151;
        float _1155 = 1.0 / _1141;
        float _1157 = _1147 * _1149;
        float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1161 = fma(_1157, _1153, _1159);
        float _1163 = _1161 * _1155;
        float _1165 = precise::clamp(_1163, 0.0, 1.0);
        _1107 = _1165;
    }
    float _1167 = _1107;
    float _1169 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1095);
    float _1171 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1173 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1097);
    float _1175 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1099);
    float _1177 = _1169 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1179 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1181 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1183 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1185 = _1173 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1187 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1179);
    float _1189 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1181);
    float _1191 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1193 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1183);
    float _1195 = _1175 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1197 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1187);
    float _1199 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1189);
    float _1201 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1191);
    float _1203 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1193);
    float _1205 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1197);
    float _1207 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1199);
    bool _1209 = _1167 > 0.0;
    bool _1211 = isnan(_1167);
    bool _1213 = _1209 || _1211;
    bool _1215 = isnan(0.0);
    bool _1217 = _1213 || _1215;
    float _1219 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1201);
    float _1221 = _1167 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1223 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1203);
    float _1225 = _1205 + _1207;
    float _1227 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1219);
    float _1229 = _1221 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1231 = _1225 * 0.5;
    out.m_35.x = _1229;
    out.gl_Position.x = _1223;
    out.gl_Position.y = _1227;
    out.gl_Position.z = _1205;
    out.gl_Position.w = _1207;
    out.m_52.z = _1231;
    out.m_52.w = _1207;
    if (_1217)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _1233 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1233;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

