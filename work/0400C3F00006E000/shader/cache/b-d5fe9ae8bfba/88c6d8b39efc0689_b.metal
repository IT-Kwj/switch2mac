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
    constant _16* vp_c10 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_35 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_54 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
    float4 m_52 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_32 [[attribute(3)]];
    float4 m_46 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_30.w;
    float _70 = in.m_32.w;
    float _72 = trunc(_68);
    int _75 = int(_72);
    float _77 = -_70;
    float _79 = _77 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _79;
    bool _83 = _75 >= 1;
    float _85 = 0.0;
    float _87 = as_type<float>(_75);
    if (!_83)
    {
        _85 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _89 = _85;
    if (!_83)
    {
        out.m_37.x = 0.0;
    }
    int _91 = 0;
    if (!_83)
    {
        float _93 = _89 * 5.0;
        _91 = as_type<int>(_93);
    }
    int _95 = _91;
    int _97 = _95;
    if (!_83)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _968 = as_type<float>(_95);
        out.gl_Position.z = _968;
    }
    if (!_83)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _99 = _70 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _101 = isnan(_70);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _107 = _103 || _105;
    float _109 = float(_75);
    bool _111 = _79 >= _109;
    bool _113 = !_107;
    bool _115 = _111 || _113;
    if (_115)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _87;
    if (_115)
    {
        out.m_37.x = 0.0;
    }
    if (_115)
    {
        float _119 = _117 * 5.0;
        _97 = as_type<int>(_119);
    }
    int _121 = _97;
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1023 = as_type<float>(_121);
        out.gl_Position.z = _1023;
    }
    if (_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = as_type<float>(int(gl_VertexIndex));
    float _125 = 1.0 / _109;
    float _127 = in.m_42.w;
    float _129 = _79 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _131 = in.m_30.x;
    float _133 = in.m_30.y;
    float _135 = in.m_30.z;
    int _137 = as_type<int>(_123) & 1;
    bool _139 = _137 != 0;
    int _141 = as_type<int>(_123) & 2;
    bool _143 = _141 != 0;
    float _145 = in.m_32.x;
    float _147 = in.m_32.y;
    float _149 = in.m_32.z;
    bool _151 = !_139;
    int _153 = _151 ? (-1090519040) : 1056964608;
    bool _155 = !_143;
    int _157 = _155 ? (-1090519040) : 1056964608;
    bool _159 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _163 = _159 || _161;
    bool _165 = isnan(1.0);
    bool _167 = _163 || _165;
    out.m_44.x = as_type<float>(_153);
    out.m_44.y = as_type<float>(_157);
    float _169 = 0.0;
    float _171 = _129;
    if (!_167)
    {
        float _173 = _129 * _129;
        float _175 = _173 * 0.5;
        _169 = _175;
    }
    float _177 = _169;
    float _179 = _177;
    if (!_167)
    {
        float _181 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _181;
    }
    float _183 = _179;
    bool _185 = !_167;
    float _187 = _183;
    if (!_185)
    {
        float _189 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _191 = log2(_189);
        float _193 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _195 = _193 + 1.0;
        float _197 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = _129 * _191;
        float _201 = 1.0 / _195;
        float _203 = _197 * 0.693147182464599609375;
        float _205 = exp2(_199);
        float _207 = 1.0 / _203;
        float _209 = _205 + (-1.0);
        float _211 = -_209;
        float _213 = fma(_211, _207, _129);
        float _215 = _213 * _201;
        float _217 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _217;
    }
    float _219 = _187;
    bool _221 = !_167;
    if (!_221)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = 1.0 / _229;
        float _233 = _129 * _225;
        float _235 = exp2(_233);
        float _237 = -_235;
        float _239 = _237 + 1.0;
        float _241 = _239 * _231;
        _171 = _241;
    }
    float _243 = _171;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _247 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _249 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _251 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _253 = fma(_243, _145, _247);
    float _255 = fma(_243, _147, _249);
    float _257 = fma(_243, _149, _251);
    float _259 = _79 * _125;
    float _261 = fma(_253, _127, _131);
    float _263 = fma(_255, _127, _133);
    float _265 = fma(_257, _127, _135);
    bool _267 = !_245;
    float _269 = _259;
    if (!_267)
    {
        float _271 = in.m_46.x;
        float _273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _275 = _271 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[11].z, _79);
        float _279 = _277 * _273;
        float _281 = floor(_279);
        float _283 = -_281;
        float _285 = _279 + _283;
        _269 = _285;
    }
    float _287 = _269;
    float _289 = in.m_42.x;
    float _291 = in.m_42.y;
    float _293 = _263 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _311 = 1.0 / _297;
    float _313 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].x, _293);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _317 = _287 + _315;
    float _319 = _263 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _321;
    float _325 = _263 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _329 = _287 + _327;
    float _331 = 1.0 / _301;
    float _333 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].x, _319);
    float _335 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[4].z, _313);
    float _337 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[5].z, _333);
    bool _339 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _341 = isnan(_287);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _353 = 1.0 / _305;
    float _355 = _291 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _357 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].x, _325);
    float _359 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_157));
    float _361 = _355 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _363 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[6].z, _357);
    bool _365 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _367 = isnan(_287);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = 1.0 / _309;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _381 = _287 + _379;
    float _383 = _317 * _331;
    float _385 = _289 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _389 = _287 + _387;
    float _391 = _381 * _311;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _395 = _287 + _393;
    float _397 = _385 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _399 = 1.0 / _323;
    float _401 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_153));
    float _403 = _389 * _353;
    float _405 = _361 * _359;
    float _407 = _397 * _401;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _409;
    float _413 = _395 * _377;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    bool _427 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _429 = isnan(_287);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _439;
    float _443 = fma(_417, _391, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _445 = _329 * _399;
    float _447 = fma(_421, _391, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _449 = fma(_441, _391, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _459 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _461 = isnan(_287);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _471;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _479;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _487 = fma(_425, _413, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _489 = fma(_477, _413, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _491 = -_469;
    float _493 = _491 + 1.0;
    float _495 = fma(_485, _413, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    bool _497 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _499 = isnan(_287);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = fma(_473, _403, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _511 = fma(_411, _403, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _513 = fma(_481, _403, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _519 = _507 * _493;
    float _521 = -_507;
    float _523 = _521 + 1.0;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _525;
    float _529 = -_437;
    float _531 = _529 + 1.0;
    float _533 = _405 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _535 = _375 * _523;
    bool _537 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _539 = isnan(_287);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _545 = _541 || _543;
    float _547 = float(_545);
    float _549 = fma(_517, _383, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _551 = fma(_453, _383, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _553 = fma(_457, _383, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _555 = -_375;
    float _557 = _555 + 1.0;
    float _559 = -_349;
    float _561 = _559 + 1.0;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _563;
    float _567 = fma(_527, _445, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _569 = _349 * _531;
    float _571 = _405 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _573 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[10].x, _533);
    bool _575 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _577 = isnan(0.5);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _583 = _579 || _581;
    float _585 = _437 * _557;
    float _587 = _547 * _561;
    float _589 = fma(_565, _445, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _591 = _335 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _593 = _363 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _595 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[8].x, _571);
    float _597 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[10].z, _573);
    float _599 = _443 * _587;
    float _601 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[8].z, _595);
    float _603 = _593 + _597;
    float _605 = _449 * _587;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _607;
    float _611 = _447 * _587;
    float _613 = _405 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _615 = _591 + _601;
    float _617 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _619 = _603 + _617;
    float _621 = fma(_609, _445, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _623 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[9].x, _613);
    float _625 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _627 = _615 + _625;
    float _629 = _619 * _619;
    float _631 = _337 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _633 = -_547;
    float _635 = _633 + 1.0;
    float _637 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[9].z, _623);
    float _639 = fma(_627, _627, _629);
    float _641 = _631 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _643 = _631 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _645 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[123].x, _599);
    float _647 = sqrt(_639);
    float _649 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[11].x, _641);
    float _651 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[123].y, _605);
    float _653 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[123].z, _611);
    out.m_48.x = _591;
    out.m_48.y = _631;
    out.m_48.z = _593;
    float _655 = fma(_593, (*spvDescriptorSet0.vp_c8)._m0[11].z, _649);
    float _657 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[10].x, _643);
    float _659 = fma(_549, _569, _645);
    float _661 = fma(_551, _569, _651);
    float _663 = _655 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _665 = fma(_553, _569, _653);
    float _667 = fma(_593, (*spvDescriptorSet0.vp_c8)._m0[10].z, _657);
    float _669 = fma(_509, _585, _659);
    float _671 = fma(_511, _585, _661);
    float _673 = fma(_513, _585, _665);
    float _675 = _667 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _677 = 1.0 / _663;
    bool _679 = _647 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _681 = fma(_489, _535, _669);
    float _683 = fma(_487, _535, _671);
    float _685 = fma(_495, _535, _673);
    float _687 = _631 + _637;
    float _689 = _675 + _663;
    float _691 = fma(_567, _519, _681);
    float _693 = fma(_589, _519, _683);
    float _695 = fma(_621, _519, _685);
    float _697 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[128].x, _691);
    float _699 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[128].y, _693);
    float _701 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[128].z, _695);
    float _703 = _593;
    float _705 = _631;
    float _707 = _619;
    if (!_679)
    {
        _703 = _603;
    }
    float _709 = _703;
    float _711 = _689 * _677;
    float _713 = _711 * 0.5;
    float _715 = _677;
    float _717 = _709;
    if (!_679)
    {
        _715 = _615;
    }
    float _719 = _715;
    float _721 = _719;
    if (!_679)
    {
        _705 = _687;
    }
    float _723 = _705;
    bool _725 = !_679;
    float _727 = _723;
    if (!_725)
    {
        float _729 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _731 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _733 = _647 + _731;
        float _735 = _687 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _737 = rsqrt(_639);
        float _739 = _733 * _729;
        float _741 = _739 * 0.15915493667125701904296875;
        float _743 = _741 * 6.283185482025146484375;
        float _745 = cos(_743);
        float _747 = _741 * 6.283185482025146484375;
        float _749 = sin(_747);
        float _751 = _745 + (-1.0);
        float _753 = _751 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _755 = fma(_749, _735, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _757 = fma(_687, _745, _753);
        float _759 = _737 * _755;
        float _761 = fma(_627, _759, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _763 = fma(_619, _759, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _727 = _757;
        _721 = _761;
        _717 = _763;
    }
    float _765 = _727;
    float _767 = _721;
    float _769 = _717;
    float _771 = _765 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_583)
    {
        _707 = 1.0;
    }
    float _773 = _707;
    float _775 = _773;
    if (!_583)
    {
        float _777 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _779 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[30].w, _777);
        float _781 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _785 = 1.0 / _779;
        float _787 = 1.0 / _783;
        float _789 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _791 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _793 = fma(_785, _789, _791);
        float _795 = _793 * _787;
        float _797 = precise::clamp(_795, 0.0, 1.0);
        _775 = _797;
    }
    float _799 = _775;
    float _801 = _765 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _803 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[1].x, _771);
    float _805 = _765 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _807 = _765 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _809 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[0].x, _801);
    float _811 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[1].z, _803);
    float _813 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[2].x, _805);
    float _815 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[3].x, _807);
    float _817 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[0].z, _809);
    float _819 = _811 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _821 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[2].z, _813);
    float _823 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[3].z, _815);
    float _825 = _817 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _827 = _819 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _829 = _819 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _831 = _819 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _833 = _819 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _835 = _821 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _837 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[5].x, _827);
    float _839 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[4].x, _829);
    float _841 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[6].x, _831);
    float _843 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[7].x, _833);
    float _845 = _823 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _847 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[5].z, _837);
    float _849 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[4].z, _839);
    float _851 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[6].z, _841);
    float _853 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[7].z, _843);
    float _855 = _701 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _857 = _799 > 0.0;
    bool _859 = isnan(_799);
    bool _861 = _857 || _859;
    bool _863 = isnan(0.0);
    bool _865 = _861 || _863;
    float _867 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[5].w, _847);
    float _869 = _799 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _871 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[4].w, _849);
    float _873 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[6].w, _851);
    float _875 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[7].w, _853);
    float _877 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _879 = _869 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _881 = _697 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _883 = _699 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _885 = _871 + _875;
    float _887 = _873 + _875;
    float _889 = _875 * 0.5;
    float _891 = _881 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _895 = _885 * 0.5;
    float _897 = _887 * 0.5;
    float _899 = fma(_867, -0.5, _889);
    out.m_50.x = _891;
    out.m_50.y = _893;
    out.m_50.z = _877;
    out.m_52.x = _767;
    out.m_52.y = _765;
    out.m_52.z = _769;
    out.m_37.x = _879;
    out.gl_Position.x = _871;
    out.gl_Position.y = _867;
    out.gl_Position.z = _873;
    out.gl_Position.w = _875;
    out.m_54.x = _895;
    out.m_54.y = _899;
    out.m_54.z = _897;
    out.m_54.w = _875;
    if (_865)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_37.x = 0.0;
    float _901 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _901;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_30.w;
    float _70 = in.m_32.w;
    float _72 = trunc(_68);
    int _75 = int(_72);
    float _77 = -_70;
    float _79 = _77 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _79;
    bool _83 = _75 >= 1;
    float _85 = 0.0;
    float _87 = as_type<float>(_75);
    if (!_83)
    {
        _85 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _89 = _85;
    if (!_83)
    {
        out.m_37.x = 0.0;
    }
    int _91 = 0;
    if (!_83)
    {
        float _93 = _89 * 5.0;
        _91 = as_type<int>(_93);
    }
    int _95 = _91;
    int _97 = _95;
    if (!_83)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _968 = as_type<float>(_95);
        out.gl_Position.z = _968;
    }
    if (!_83)
    {
        return out;
    }
    bool _99 = _70 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _101 = isnan(_70);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _107 = _103 || _105;
    float _109 = float(_75);
    bool _111 = _79 >= _109;
    bool _113 = !_107;
    bool _115 = _111 || _113;
    if (_115)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _87;
    if (_115)
    {
        out.m_37.x = 0.0;
    }
    if (_115)
    {
        float _119 = _117 * 5.0;
        _97 = as_type<int>(_119);
    }
    int _121 = _97;
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1023 = as_type<float>(_121);
        out.gl_Position.z = _1023;
    }
    if (_115)
    {
        return out;
    }
    float _123 = as_type<float>(int(gl_VertexIndex));
    float _125 = 1.0 / _109;
    float _127 = in.m_42.w;
    float _129 = _79 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _131 = in.m_30.x;
    float _133 = in.m_30.y;
    float _135 = in.m_30.z;
    int _137 = as_type<int>(_123) & 1;
    bool _139 = _137 != 0;
    int _141 = as_type<int>(_123) & 2;
    bool _143 = _141 != 0;
    float _145 = in.m_32.x;
    float _147 = in.m_32.y;
    float _149 = in.m_32.z;
    bool _151 = !_139;
    int _153 = _151 ? (-1090519040) : 1056964608;
    bool _155 = !_143;
    int _157 = _155 ? (-1090519040) : 1056964608;
    bool _159 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _163 = _159 || _161;
    bool _165 = isnan(1.0);
    bool _167 = _163 || _165;
    out.m_44.x = as_type<float>(_153);
    out.m_44.y = as_type<float>(_157);
    float _169 = 0.0;
    float _171 = _129;
    if (!_167)
    {
        float _173 = _129 * _129;
        float _175 = _173 * 0.5;
        _169 = _175;
    }
    float _177 = _169;
    float _179 = _177;
    if (!_167)
    {
        float _181 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _181;
    }
    float _183 = _179;
    bool _185 = !_167;
    float _187 = _183;
    if (!_185)
    {
        float _189 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _191 = log2(_189);
        float _193 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _195 = _193 + 1.0;
        float _197 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = _129 * _191;
        float _201 = 1.0 / _195;
        float _203 = _197 * 0.693147182464599609375;
        float _205 = exp2(_199);
        float _207 = 1.0 / _203;
        float _209 = _205 + (-1.0);
        float _211 = -_209;
        float _213 = fma(_211, _207, _129);
        float _215 = _213 * _201;
        float _217 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _217;
    }
    float _219 = _187;
    bool _221 = !_167;
    if (!_221)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = 1.0 / _229;
        float _233 = _129 * _225;
        float _235 = exp2(_233);
        float _237 = -_235;
        float _239 = _237 + 1.0;
        float _241 = _239 * _231;
        _171 = _241;
    }
    float _243 = _171;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _247 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _249 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _251 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _253 = fma(_243, _145, _247);
    float _255 = fma(_243, _147, _249);
    float _257 = fma(_243, _149, _251);
    float _259 = _79 * _125;
    float _261 = fma(_253, _127, _131);
    float _263 = fma(_255, _127, _133);
    float _265 = fma(_257, _127, _135);
    bool _267 = !_245;
    float _269 = _259;
    if (!_267)
    {
        float _271 = in.m_46.x;
        float _273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _275 = _271 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[11].z, _79);
        float _279 = _277 * _273;
        float _281 = floor(_279);
        float _283 = -_281;
        float _285 = _279 + _283;
        _269 = _285;
    }
    float _287 = _269;
    float _289 = in.m_42.x;
    float _291 = in.m_42.y;
    float _293 = _263 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _311 = 1.0 / _297;
    float _313 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].x, _293);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _317 = _287 + _315;
    float _319 = _263 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _321;
    float _325 = _263 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _329 = _287 + _327;
    float _331 = 1.0 / _301;
    float _333 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].x, _319);
    float _335 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[4].z, _313);
    float _337 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[5].z, _333);
    bool _339 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _341 = isnan(_287);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _353 = 1.0 / _305;
    float _355 = _291 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _357 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].x, _325);
    float _359 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_157));
    float _361 = _355 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _363 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[6].z, _357);
    bool _365 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _367 = isnan(_287);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = 1.0 / _309;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _381 = _287 + _379;
    float _383 = _317 * _331;
    float _385 = _289 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _389 = _287 + _387;
    float _391 = _381 * _311;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _395 = _287 + _393;
    float _397 = _385 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _399 = 1.0 / _323;
    float _401 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_153));
    float _403 = _389 * _353;
    float _405 = _361 * _359;
    float _407 = _397 * _401;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _409;
    float _413 = _395 * _377;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    bool _427 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _429 = isnan(_287);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _439;
    float _443 = fma(_417, _391, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _445 = _329 * _399;
    float _447 = fma(_421, _391, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _449 = fma(_441, _391, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _459 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _461 = isnan(_287);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _471;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _479;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _487 = fma(_425, _413, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _489 = fma(_477, _413, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _491 = -_469;
    float _493 = _491 + 1.0;
    float _495 = fma(_485, _413, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    bool _497 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _499 = isnan(_287);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = fma(_473, _403, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _511 = fma(_411, _403, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _513 = fma(_481, _403, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _519 = _507 * _493;
    float _521 = -_507;
    float _523 = _521 + 1.0;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _525;
    float _529 = -_437;
    float _531 = _529 + 1.0;
    float _533 = _405 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _535 = _375 * _523;
    bool _537 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _539 = isnan(_287);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _545 = _541 || _543;
    float _547 = float(_545);
    float _549 = fma(_517, _383, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _551 = fma(_453, _383, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _553 = fma(_457, _383, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _555 = -_375;
    float _557 = _555 + 1.0;
    float _559 = -_349;
    float _561 = _559 + 1.0;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _563;
    float _567 = fma(_527, _445, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _569 = _349 * _531;
    float _571 = _405 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _573 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[10].x, _533);
    bool _575 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _577 = isnan(0.5);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _583 = _579 || _581;
    float _585 = _437 * _557;
    float _587 = _547 * _561;
    float _589 = fma(_565, _445, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _591 = _335 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _593 = _363 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _595 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[8].x, _571);
    float _597 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[10].z, _573);
    float _599 = _443 * _587;
    float _601 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[8].z, _595);
    float _603 = _593 + _597;
    float _605 = _449 * _587;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _607;
    float _611 = _447 * _587;
    float _613 = _405 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _615 = _591 + _601;
    float _617 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _619 = _603 + _617;
    float _621 = fma(_609, _445, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _623 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[9].x, _613);
    float _625 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _627 = _615 + _625;
    float _629 = _619 * _619;
    float _631 = _337 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _633 = -_547;
    float _635 = _633 + 1.0;
    float _637 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[9].z, _623);
    float _639 = fma(_627, _627, _629);
    float _641 = _631 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _643 = _631 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _645 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[123].x, _599);
    float _647 = sqrt(_639);
    float _649 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[11].x, _641);
    float _651 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[123].y, _605);
    float _653 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[123].z, _611);
    out.m_48.x = _591;
    out.m_48.y = _631;
    out.m_48.z = _593;
    float _655 = fma(_593, (*spvDescriptorSet0.vp_c8)._m0[11].z, _649);
    float _657 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[10].x, _643);
    float _659 = fma(_549, _569, _645);
    float _661 = fma(_551, _569, _651);
    float _663 = _655 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _665 = fma(_553, _569, _653);
    float _667 = fma(_593, (*spvDescriptorSet0.vp_c8)._m0[10].z, _657);
    float _669 = fma(_509, _585, _659);
    float _671 = fma(_511, _585, _661);
    float _673 = fma(_513, _585, _665);
    float _675 = _667 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _677 = 1.0 / _663;
    bool _679 = _647 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _681 = fma(_489, _535, _669);
    float _683 = fma(_487, _535, _671);
    float _685 = fma(_495, _535, _673);
    float _687 = _631 + _637;
    float _689 = _675 + _663;
    float _691 = fma(_567, _519, _681);
    float _693 = fma(_589, _519, _683);
    float _695 = fma(_621, _519, _685);
    float _697 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[128].x, _691);
    float _699 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[128].y, _693);
    float _701 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[128].z, _695);
    float _703 = _593;
    float _705 = _631;
    float _707 = _619;
    if (!_679)
    {
        _703 = _603;
    }
    float _709 = _703;
    float _711 = _689 * _677;
    float _713 = _711 * 0.5;
    float _715 = _677;
    float _717 = _709;
    if (!_679)
    {
        _715 = _615;
    }
    float _719 = _715;
    float _721 = _719;
    if (!_679)
    {
        _705 = _687;
    }
    float _723 = _705;
    bool _725 = !_679;
    float _727 = _723;
    if (!_725)
    {
        float _729 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _731 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _733 = _647 + _731;
        float _735 = _687 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _737 = rsqrt(_639);
        float _739 = _733 * _729;
        float _741 = _739 * 0.15915493667125701904296875;
        float _743 = _741 * 6.283185482025146484375;
        float _745 = cos(_743);
        float _747 = _741 * 6.283185482025146484375;
        float _749 = sin(_747);
        float _751 = _745 + (-1.0);
        float _753 = _751 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _755 = fma(_749, _735, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _757 = fma(_687, _745, _753);
        float _759 = _737 * _755;
        float _761 = fma(_627, _759, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _763 = fma(_619, _759, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _727 = _757;
        _721 = _761;
        _717 = _763;
    }
    float _765 = _727;
    float _767 = _721;
    float _769 = _717;
    float _771 = _765 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_583)
    {
        _707 = 1.0;
    }
    float _773 = _707;
    float _775 = _773;
    if (!_583)
    {
        float _777 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _779 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[30].w, _777);
        float _781 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _785 = 1.0 / _779;
        float _787 = 1.0 / _783;
        float _789 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _791 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _793 = fma(_785, _789, _791);
        float _795 = _793 * _787;
        float _797 = precise::clamp(_795, 0.0, 1.0);
        _775 = _797;
    }
    float _799 = _775;
    float _801 = _765 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _803 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[1].x, _771);
    float _805 = _765 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _807 = _765 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _809 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[0].x, _801);
    float _811 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[1].z, _803);
    float _813 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[2].x, _805);
    float _815 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[3].x, _807);
    float _817 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[0].z, _809);
    float _819 = _811 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _821 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[2].z, _813);
    float _823 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[3].z, _815);
    float _825 = _817 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _827 = _819 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _829 = _819 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _831 = _819 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _833 = _819 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _835 = _821 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _837 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[5].x, _827);
    float _839 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[4].x, _829);
    float _841 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[6].x, _831);
    float _843 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[7].x, _833);
    float _845 = _823 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _847 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[5].z, _837);
    float _849 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[4].z, _839);
    float _851 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[6].z, _841);
    float _853 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[7].z, _843);
    float _855 = _701 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _857 = _799 > 0.0;
    bool _859 = isnan(_799);
    bool _861 = _857 || _859;
    bool _863 = isnan(0.0);
    bool _865 = _861 || _863;
    float _867 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[5].w, _847);
    float _869 = _799 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _871 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[4].w, _849);
    float _873 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[6].w, _851);
    float _875 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[7].w, _853);
    float _877 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _879 = _869 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _881 = _697 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _883 = _699 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _885 = _871 + _875;
    float _887 = _873 + _875;
    float _889 = _875 * 0.5;
    float _891 = _881 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _895 = _885 * 0.5;
    float _897 = _887 * 0.5;
    float _899 = fma(_867, -0.5, _889);
    out.m_50.x = _891;
    out.m_50.y = _893;
    out.m_50.z = _877;
    out.m_52.x = _767;
    out.m_52.y = _765;
    out.m_52.z = _769;
    out.m_37.x = _879;
    out.gl_Position.x = _871;
    out.gl_Position.y = _867;
    out.gl_Position.z = _873;
    out.gl_Position.w = _875;
    out.m_54.x = _895;
    out.m_54.y = _899;
    out.m_54.z = _897;
    out.m_54.w = _875;
    if (_865)
    {
        return out;
    }
    out.m_37.x = 0.0;
    float _901 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _901;
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
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_30.w;
    float _70 = in.m_32.w;
    float _72 = trunc(_68);
    int _75 = int(_72);
    float _77 = -_70;
    float _79 = _77 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _79;
    bool _83 = _75 >= 1;
    float _85 = 0.0;
    float _87 = as_type<float>(_75);
    if (!_83)
    {
        _85 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _89 = _85;
    if (!_83)
    {
        out.m_37.x = 0.0;
    }
    int _91 = 0;
    if (!_83)
    {
        float _93 = _89 * 5.0;
        _91 = as_type<int>(_93);
    }
    int _95 = _91;
    int _97 = _95;
    if (!_83)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _968 = as_type<float>(_95);
        out.gl_Position.z = _968;
    }
    if (!_83)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _99 = _70 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _101 = isnan(_70);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _107 = _103 || _105;
    float _109 = float(_75);
    bool _111 = _79 >= _109;
    bool _113 = !_107;
    bool _115 = _111 || _113;
    if (_115)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _87;
    if (_115)
    {
        out.m_37.x = 0.0;
    }
    if (_115)
    {
        float _119 = _117 * 5.0;
        _97 = as_type<int>(_119);
    }
    int _121 = _97;
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1023 = as_type<float>(_121);
        out.gl_Position.z = _1023;
    }
    if (_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = as_type<float>(int(gl_VertexIndex));
    float _125 = 1.0 / _109;
    float _127 = in.m_42.w;
    float _129 = _79 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _131 = in.m_30.x;
    float _133 = in.m_30.y;
    float _135 = in.m_30.z;
    int _137 = as_type<int>(_123) & 1;
    bool _139 = _137 != 0;
    int _141 = as_type<int>(_123) & 2;
    bool _143 = _141 != 0;
    float _145 = in.m_32.x;
    float _147 = in.m_32.y;
    float _149 = in.m_32.z;
    bool _151 = !_139;
    int _153 = _151 ? (-1090519040) : 1056964608;
    bool _155 = !_143;
    int _157 = _155 ? (-1090519040) : 1056964608;
    bool _159 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _163 = _159 || _161;
    bool _165 = isnan(1.0);
    bool _167 = _163 || _165;
    out.m_44.x = as_type<float>(_153);
    out.m_44.y = as_type<float>(_157);
    float _169 = 0.0;
    float _171 = _129;
    if (!_167)
    {
        float _173 = _129 * _129;
        float _175 = _173 * 0.5;
        _169 = _175;
    }
    float _177 = _169;
    float _179 = _177;
    if (!_167)
    {
        float _181 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _181;
    }
    float _183 = _179;
    bool _185 = !_167;
    float _187 = _183;
    if (!_185)
    {
        float _189 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _191 = log2(_189);
        float _193 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _195 = _193 + 1.0;
        float _197 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = _129 * _191;
        float _201 = 1.0 / _195;
        float _203 = _197 * 0.693147182464599609375;
        float _205 = exp2(_199);
        float _207 = 1.0 / _203;
        float _209 = _205 + (-1.0);
        float _211 = -_209;
        float _213 = fma(_211, _207, _129);
        float _215 = _213 * _201;
        float _217 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _217;
    }
    float _219 = _187;
    bool _221 = !_167;
    if (!_221)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = 1.0 / _229;
        float _233 = _129 * _225;
        float _235 = exp2(_233);
        float _237 = -_235;
        float _239 = _237 + 1.0;
        float _241 = _239 * _231;
        _171 = _241;
    }
    float _243 = _171;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _247 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _249 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _251 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _253 = fma(_243, _145, _247);
    float _255 = fma(_243, _147, _249);
    float _257 = fma(_243, _149, _251);
    float _259 = _79 * _125;
    float _261 = fma(_253, _127, _131);
    float _263 = fma(_255, _127, _133);
    float _265 = fma(_257, _127, _135);
    bool _267 = !_245;
    float _269 = _259;
    if (!_267)
    {
        float _271 = in.m_46.x;
        float _273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _275 = _271 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[11].z, _79);
        float _279 = _277 * _273;
        float _281 = floor(_279);
        float _283 = -_281;
        float _285 = _279 + _283;
        _269 = _285;
    }
    float _287 = _269;
    float _289 = in.m_42.x;
    float _291 = in.m_42.y;
    float _293 = _263 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _311 = 1.0 / _297;
    float _313 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].x, _293);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _317 = _287 + _315;
    float _319 = _263 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _321;
    float _325 = _263 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _329 = _287 + _327;
    float _331 = 1.0 / _301;
    float _333 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].x, _319);
    float _335 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[4].z, _313);
    float _337 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[5].z, _333);
    bool _339 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _341 = isnan(_287);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _353 = 1.0 / _305;
    float _355 = _291 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _357 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].x, _325);
    float _359 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_157));
    float _361 = _355 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _363 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[6].z, _357);
    bool _365 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _367 = isnan(_287);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = 1.0 / _309;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _381 = _287 + _379;
    float _383 = _317 * _331;
    float _385 = _289 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _389 = _287 + _387;
    float _391 = _381 * _311;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _395 = _287 + _393;
    float _397 = _385 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _399 = 1.0 / _323;
    float _401 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_153));
    float _403 = _389 * _353;
    float _405 = _361 * _359;
    float _407 = _397 * _401;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _409;
    float _413 = _395 * _377;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    bool _427 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _429 = isnan(_287);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _439;
    float _443 = fma(_417, _391, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _445 = _329 * _399;
    float _447 = fma(_421, _391, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _449 = fma(_441, _391, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _459 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _461 = isnan(_287);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _471;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _479;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _487 = fma(_425, _413, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _489 = fma(_477, _413, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _491 = -_469;
    float _493 = _491 + 1.0;
    float _495 = fma(_485, _413, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    bool _497 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _499 = isnan(_287);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = fma(_473, _403, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _511 = fma(_411, _403, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _513 = fma(_481, _403, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _519 = _507 * _493;
    float _521 = -_507;
    float _523 = _521 + 1.0;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _525;
    float _529 = -_437;
    float _531 = _529 + 1.0;
    float _533 = _405 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _535 = _375 * _523;
    bool _537 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _539 = isnan(_287);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _545 = _541 || _543;
    float _547 = float(_545);
    float _549 = fma(_517, _383, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _551 = fma(_453, _383, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _553 = fma(_457, _383, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _555 = -_375;
    float _557 = _555 + 1.0;
    float _559 = -_349;
    float _561 = _559 + 1.0;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _563;
    float _567 = fma(_527, _445, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _569 = _349 * _531;
    float _571 = _405 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _573 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[10].x, _533);
    bool _575 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _577 = isnan(0.5);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _583 = _579 || _581;
    float _585 = _437 * _557;
    float _587 = _547 * _561;
    float _589 = fma(_565, _445, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _591 = _335 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _593 = _363 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _595 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[8].x, _571);
    float _597 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[10].z, _573);
    float _599 = _443 * _587;
    float _601 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[8].z, _595);
    float _603 = _593 + _597;
    float _605 = _449 * _587;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _607;
    float _611 = _447 * _587;
    float _613 = _405 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _615 = _591 + _601;
    float _617 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _619 = _603 + _617;
    float _621 = fma(_609, _445, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _623 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[9].x, _613);
    float _625 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _627 = _615 + _625;
    float _629 = _619 * _619;
    float _631 = _337 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _633 = -_547;
    float _635 = _633 + 1.0;
    float _637 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[9].z, _623);
    float _639 = fma(_627, _627, _629);
    float _641 = _631 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _643 = _631 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _645 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[123].x, _599);
    float _647 = sqrt(_639);
    float _649 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[11].x, _641);
    float _651 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[123].y, _605);
    float _653 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[123].z, _611);
    out.m_48.x = _591;
    out.m_48.y = _631;
    out.m_48.z = _593;
    float _655 = fma(_593, (*spvDescriptorSet0.vp_c8)._m0[11].z, _649);
    float _657 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[10].x, _643);
    float _659 = fma(_549, _569, _645);
    float _661 = fma(_551, _569, _651);
    float _663 = _655 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _665 = fma(_553, _569, _653);
    float _667 = fma(_593, (*spvDescriptorSet0.vp_c8)._m0[10].z, _657);
    float _669 = fma(_509, _585, _659);
    float _671 = fma(_511, _585, _661);
    float _673 = fma(_513, _585, _665);
    float _675 = _667 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _677 = 1.0 / _663;
    bool _679 = _647 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _681 = fma(_489, _535, _669);
    float _683 = fma(_487, _535, _671);
    float _685 = fma(_495, _535, _673);
    float _687 = _631 + _637;
    float _689 = _675 + _663;
    float _691 = fma(_567, _519, _681);
    float _693 = fma(_589, _519, _683);
    float _695 = fma(_621, _519, _685);
    float _697 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[128].x, _691);
    float _699 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[128].y, _693);
    float _701 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[128].z, _695);
    float _703 = _593;
    float _705 = _631;
    float _707 = _619;
    if (!_679)
    {
        _703 = _603;
    }
    float _709 = _703;
    float _711 = _689 * _677;
    float _713 = _711 * 0.5;
    float _715 = _677;
    float _717 = _709;
    if (!_679)
    {
        _715 = _615;
    }
    float _719 = _715;
    float _721 = _719;
    if (!_679)
    {
        _705 = _687;
    }
    float _723 = _705;
    bool _725 = !_679;
    float _727 = _723;
    if (!_725)
    {
        float _729 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _731 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _733 = _647 + _731;
        float _735 = _687 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _737 = rsqrt(_639);
        float _739 = _733 * _729;
        float _741 = _739 * 0.15915493667125701904296875;
        float _743 = _741 * 6.283185482025146484375;
        float _745 = cos(_743);
        float _747 = _741 * 6.283185482025146484375;
        float _749 = sin(_747);
        float _751 = _745 + (-1.0);
        float _753 = _751 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _755 = fma(_749, _735, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _757 = fma(_687, _745, _753);
        float _759 = _737 * _755;
        float _761 = fma(_627, _759, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _763 = fma(_619, _759, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _727 = _757;
        _721 = _761;
        _717 = _763;
    }
    float _765 = _727;
    float _767 = _721;
    float _769 = _717;
    float _771 = _765 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_583)
    {
        _707 = 1.0;
    }
    float _773 = _707;
    float _775 = _773;
    if (!_583)
    {
        float _777 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _779 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[30].w, _777);
        float _781 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _785 = 1.0 / _779;
        float _787 = 1.0 / _783;
        float _789 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _791 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _793 = fma(_785, _789, _791);
        float _795 = _793 * _787;
        float _797 = precise::clamp(_795, 0.0, 1.0);
        _775 = _797;
    }
    float _799 = _775;
    float _801 = _765 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _803 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[1].x, _771);
    float _805 = _765 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _807 = _765 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _809 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[0].x, _801);
    float _811 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[1].z, _803);
    float _813 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[2].x, _805);
    float _815 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[3].x, _807);
    float _817 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[0].z, _809);
    float _819 = _811 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _821 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[2].z, _813);
    float _823 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[3].z, _815);
    float _825 = _817 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _827 = _819 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _829 = _819 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _831 = _819 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _833 = _819 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _835 = _821 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _837 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[5].x, _827);
    float _839 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[4].x, _829);
    float _841 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[6].x, _831);
    float _843 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[7].x, _833);
    float _845 = _823 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _847 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[5].z, _837);
    float _849 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[4].z, _839);
    float _851 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[6].z, _841);
    float _853 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[7].z, _843);
    float _855 = _701 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _857 = _799 > 0.0;
    bool _859 = isnan(_799);
    bool _861 = _857 || _859;
    bool _863 = isnan(0.0);
    bool _865 = _861 || _863;
    float _867 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[5].w, _847);
    float _869 = _799 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _871 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[4].w, _849);
    float _873 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[6].w, _851);
    float _875 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[7].w, _853);
    float _877 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _879 = _869 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _881 = _697 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _883 = _699 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _885 = _871 + _875;
    float _887 = _873 + _875;
    float _889 = _875 * 0.5;
    float _891 = _881 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _895 = _885 * 0.5;
    float _897 = _887 * 0.5;
    float _899 = fma(_867, -0.5, _889);
    out.m_50.x = _891;
    out.m_50.y = _893;
    out.m_50.z = _877;
    out.m_52.x = _767;
    out.m_52.y = _765;
    out.m_52.z = _769;
    out.m_37.x = _879;
    out.gl_Position.x = _871;
    out.gl_Position.y = _867;
    out.gl_Position.z = _873;
    out.gl_Position.w = _875;
    out.m_54.x = _895;
    out.m_54.y = _899;
    out.m_54.z = _897;
    out.m_54.w = _875;
    if (_865)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_37.x = 0.0;
    float _901 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _901;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

