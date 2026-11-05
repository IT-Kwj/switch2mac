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
};

struct main0_out
{
    float4 m_44 [[user(locn0)]];
    float4 m_42 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_40 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_38 [[attribute(4)]];
    float4 m_36 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    bool _433 = false;
    bool _277 = false;
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
        float _966 = as_type<float>(_79);
        out.gl_Position.z = _966;
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
        float _1035 = as_type<float>(_115);
        out.gl_Position.z = _1035;
    }
    if (_107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _117 = as_type<float>(int(gl_VertexIndex));
    float _119 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _121 = in.m_36.w;
    bool _123 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _125 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _127 = _123 || _125;
    bool _129 = isnan(1.0);
    bool _131 = _127 || _129;
    float _133 = in.m_31.x;
    float _135 = in.m_31.y;
    float _137 = in.m_31.z;
    float _139 = in.m_26.x;
    float _141 = in.m_26.y;
    float _143 = in.m_26.z;
    float _145 = 0.0;
    float _147 = _119;
    if (!_131)
    {
        float _149 = _119 * _119;
        float _151 = _149 * 0.5;
        _145 = _151;
    }
    float _153 = _145;
    float _155 = _153;
    if (!_131)
    {
        float _157 = _153 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _155 = _157;
    }
    float _159 = _155;
    int _161 = as_type<int>(_117) & 1;
    bool _163 = _161 != 0;
    int _165 = as_type<int>(_117) & 2;
    bool _167 = _165 != 0;
    bool _169 = !_163;
    float _171 = _169 ? (-0.5) : 0.5;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_131;
    float _179 = _159;
    if (!_177)
    {
        float _181 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _183 = log2(_181);
        float _185 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _187 = _185 + 1.0;
        float _189 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _191 = _119 * _183;
        float _193 = 1.0 / _187;
        float _195 = _189 * 0.693147182464599609375;
        float _197 = exp2(_191);
        float _199 = 1.0 / _195;
        float _201 = _197 + (-1.0);
        float _203 = -_201;
        float _205 = fma(_203, _199, _119);
        float _207 = _205 * _193;
        float _209 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _209;
    }
    float _211 = _179;
    bool _213 = !_131;
    if (!_213)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = 1.0 / _221;
        float _225 = _119 * _217;
        float _227 = exp2(_225);
        float _229 = -_227;
        float _231 = _229 + 1.0;
        float _233 = _231 * _223;
        _147 = _233;
    }
    float _235 = _147;
    bool _237 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _239 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _241 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _243 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _245 = fma(_235, _133, _239);
    float _247 = fma(_235, _135, _241);
    float _249 = fma(_235, _137, _243);
    float _251 = fma(_245, _121, _139);
    float _253 = fma(_247, _121, _141);
    float _255 = fma(_249, _121, _143);
    bool _257 = !_237;
    float _275;
    if (!_257)
    {
        float _259 = in.m_38.x;
        float _261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _263 = _259 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _265 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _267 = _265 * _261;
        float _269 = floor(_267);
        float _271 = -_269;
        float _273 = _267 + _271;
        _275 = _273;
        _277 = true;
    }
    else
    {
        float _279 = float(_63);
        float _281 = 1.0 / _279;
        float _283 = _97 * _281;
        _275 = _283;
    }
    _277 = false;
    float _285 = _275;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = _285 + _287;
    bool _291 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _293 = isnan(_285);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _285 + _303;
    bool _307 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _309 = isnan(_285);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _327 = -_301;
    float _329 = _327 + 1.0;
    float _331 = 1.0 / _325;
    bool _333 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _335 = isnan(_285);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = _317 * _329;
    float _347 = -_317;
    float _349 = _347 + 1.0;
    bool _351 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _353 = _343 * _349;
    float _355 = 1.0 / _321;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _357;
    float _361 = -_343;
    float _363 = _361 + 1.0;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _369 = _305 * _331;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _375 = fma(_367, _369, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _377 = fma(_373, _369, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _379 = _289 * _355;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _381;
    float _385 = in.m_36.x;
    float _387 = in.m_36.y;
    float _389 = fma(_359, _379, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _391 = fma(_383, _379, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _393 = _389 * _353;
    float _395 = _391 * _353;
    float _397 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[143].x, _395);
    float _399 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[143].y, _393);
    float _401 = fma(_377, _345, _397);
    float _403 = fma(_375, _345, _399);
    float _405 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[145].x, _401);
    float _407 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[145].y, _403);
    float _409 = _405 * _385;
    float _411 = _407 * _387;
    bool _413 = !_351;
    float _431;
    if (!_413)
    {
        float _415 = in.m_38.x;
        float _417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _419 = _415 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _421 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[11].y, _97);
        float _423 = _421 * _417;
        float _425 = floor(_423);
        float _427 = -_425;
        float _429 = _423 + _427;
        _431 = _429;
        _433 = true;
    }
    else
    {
        float _435 = float(_63);
        float _437 = 1.0 / _435;
        float _439 = _97 * _437;
        _431 = _439;
    }
    _433 = false;
    float _441 = _431;
    float _443 = in.m_38.x;
    float _445 = in.m_38.y;
    float _447 = _253 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _451 = _449 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _453 = _253 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _455;
    float _459 = fma(_251, (*spvDescriptorSet0.vp_c10)._m0[5].x, _447);
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _465 = fma(_251, (*spvDescriptorSet0.vp_c10)._m0[6].x, _453);
    float _467 = 1.0 / _451;
    float _469 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[5].z, _459);
    float _471 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[6].z, _465);
    float _473 = 1.0 / _463;
    bool _475 = _443 > 0.5;
    float _477 = _457 * _467;
    float _479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _481 = _445 > 0.5;
    float _483 = _253 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _491 = _441 + _489;
    float _493 = fma(_251, (*spvDescriptorSet0.vp_c10)._m0[4].x, _483);
    int _495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _497 = _495 != 0;
    int _499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _501 = _499 != 0;
    float _503 = 1.0 / _487;
    bool _505 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _507 = isnan(_441);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _513 = _509 || _511;
    float _515 = float(_513);
    float _517 = fma(_477, _491, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _519 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _521 = isnan(_441);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = -_515;
    float _533 = _531 + 1.0;
    bool _535 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _537 = isnan(_441);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _543 = _539 || _541;
    float _545 = float(_543);
    float _547 = -_529;
    float _549 = _547 + 1.0;
    bool _551 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _553 = isnan(_441);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _563;
    float _567 = _529 * _533;
    float _569 = _545 * _549;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _575 = -_545;
    float _577 = _575 + 1.0;
    float _579 = -_561;
    float _581 = _579 + 1.0;
    float _583 = _565 * _503;
    float _585 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[4].z, _493);
    float _587 = _517 * _569;
    float _589 = _469 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _591 = _573 * _473;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _595 = _441 + _593;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _599 = _441 + _597;
    float _601 = _585 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _603 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _605 = _589 + _603;
    float _607 = fma(_591, _595, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _609 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[115].x, _587);
    float _611 = _515 * _581;
    float _613 = fma(_583, _599, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _615 = -_171;
    int _617 = _475 ? as_type<int>(_615) : as_type<int>(_171);
    float _619 = _471 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _621 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _623 = _601 + _621;
    float _625 = _605 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _627 = !_497;
    float _629 = _627 ? _171 : as_type<float>(_617);
    float _631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _633 = -_175;
    int _635 = _481 ? as_type<int>(_633) : as_type<int>(_175);
    float _637 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _639 = _619 + _637;
    float _641 = fma(_623, (*spvDescriptorSet0.vp_c8)._m0[28].x, _625);
    float _643 = fma(_607, _567, _609);
    bool _645 = !_501;
    float _647 = _645 ? _175 : as_type<float>(_635);
    float _649 = _629 + 0.5;
    float _651 = fma(_639, (*spvDescriptorSet0.vp_c8)._m0[28].z, _641);
    float _653 = fma(_613, _611, _643);
    float _655 = _605 * _605;
    float _657 = -_647;
    float _659 = _657 + 0.5;
    float _661 = _649 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _663 = _651 >= 0.0;
    float _665 = fma(_623, _623, _655);
    float _667 = _659 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _669 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[118].x, _653);
    float _671 = _661 * _631;
    float _673 = fma(_639, _639, _665);
    float _675 = _667 * _479;
    float _677 = rsqrt(_673);
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _687 = 0.0;
    int _689 = as_type<int>(_669);
    if (_663)
    {
        _687 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _691 = _687;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _697 = _669 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _699 = _683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = _685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _703 = _679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = _681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _707;
    if (_663)
    {
        float _713 = _691 * 5.0;
        _689 = as_type<int>(_713);
    }
    int _715 = _689;
    out.m_40.x = _671;
    out.m_40.y = _675;
    float _717 = _605 * _677;
    float _719 = _623 * _677;
    out.m_42.x = _703;
    out.m_42.y = _705;
    out.m_42.z = _707;
    out.m_44.x = _699;
    out.m_44.y = _701;
    out.m_44.z = _709;
    out.m_44.w = _697;
    if (_663)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2028 = as_type<float>(_715);
        out.gl_Position.z = _2028;
    }
    if (_663)
    {
        out.m_29.x = 0.0;
    }
    if (_663)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _721 = -_717;
    float _723 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[18].w, _589);
    float _725 = _639 * _677;
    float _727 = -_719;
    float _729 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[18].w, _601);
    float _731 = -_717;
    float _733 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[18].w, _605);
    float _735 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _737 = _723 + _735;
    float _739 = -_725;
    float _741 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[18].w, _619);
    float _743 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _745 = _729 + _743;
    float _747 = -_719;
    float _749 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[18].w, _623);
    float _751 = _737 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _753 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _755 = _741 + _753;
    float _757 = _733 * _733;
    float _759 = -_725;
    float _761 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _639);
    float _763 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[28].x, _751);
    float _765 = fma(_749, _749, _757);
    float _767 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[28].z, _763);
    float _769 = fma(_761, _761, _765);
    bool _771 = _767 >= 0.0;
    float _773 = sqrt(_769);
    if (_771)
    {
        _711 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _775 = _711;
    int _777 = as_type<int>(_775);
    if (_771)
    {
        out.m_29.x = 0.0;
    }
    if (_771)
    {
        float _779 = _775 * 5.0;
        _777 = as_type<int>(_779);
    }
    int _781 = _777;
    float _783 = _677 * _773;
    if (_771)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2159 = as_type<float>(_781);
        out.gl_Position.z = _2159;
    }
    if (_771)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _785 = _411 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _787 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _175);
    float _789 = _409 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _791 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _171);
    float _793 = _783 * _785;
    float _795 = _783 * _789;
    float _797 = _787 * _793;
    float _799 = _791 * _795;
    float _801 = _783 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _803 = _801 * 0.5;
    float _805 = _797 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _807 = _797 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _809 = _797 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _811 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[25].x, _805);
    float _813 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[24].x, _807);
    float _815 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[26].x, _809);
    float _817 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[25].z, _811);
    float _819 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[24].z, _813);
    float _821 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[26].z, _815);
    float _823 = _817 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _825 = _819 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _827 = _821 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _829 = _589 + _823;
    float _831 = _601 + _825;
    float _833 = _619 + _827;
    float _835 = -_717;
    float _837 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[18].w, _829);
    float _839 = -_719;
    float _841 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[18].w, _831);
    float _843 = -_725;
    float _845 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[18].w, _833);
    float _847 = _837 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _849 = _837 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _851 = _837 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _853 = _837 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _855 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[1].x, _847);
    float _857 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[0].x, _849);
    float _859 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[2].x, _851);
    float _861 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[3].x, _853);
    float _863 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[1].z, _855);
    float _865 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[0].z, _857);
    float _867 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[2].z, _859);
    float _869 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[3].z, _861);
    float _871 = _863 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _873 = _865 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _875 = _867 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _877 = _869 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _879 = _871 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _881 = _871 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _883 = _871 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _885 = _871 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _887 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[4].x, _879);
    float _889 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[5].x, _881);
    float _891 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[6].x, _883);
    float _893 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[7].x, _885);
    float _895 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[4].z, _887);
    float _897 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[5].z, _889);
    float _899 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[6].z, _891);
    float _901 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[7].z, _893);
    float _903 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[4].w, _895);
    float _905 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[5].w, _897);
    float _907 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[6].w, _899);
    float _909 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[7].w, _901);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _903;
    out.gl_Position.y = _905;
    out.gl_Position.z = _907;
    out.gl_Position.w = _909;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    bool _433 = false;
    bool _277 = false;
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
        float _966 = as_type<float>(_79);
        out.gl_Position.z = _966;
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
        float _1035 = as_type<float>(_115);
        out.gl_Position.z = _1035;
    }
    if (_107)
    {
        return out;
    }
    float _117 = as_type<float>(int(gl_VertexIndex));
    float _119 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _121 = in.m_36.w;
    bool _123 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _125 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _127 = _123 || _125;
    bool _129 = isnan(1.0);
    bool _131 = _127 || _129;
    float _133 = in.m_31.x;
    float _135 = in.m_31.y;
    float _137 = in.m_31.z;
    float _139 = in.m_26.x;
    float _141 = in.m_26.y;
    float _143 = in.m_26.z;
    float _145 = 0.0;
    float _147 = _119;
    if (!_131)
    {
        float _149 = _119 * _119;
        float _151 = _149 * 0.5;
        _145 = _151;
    }
    float _153 = _145;
    float _155 = _153;
    if (!_131)
    {
        float _157 = _153 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _155 = _157;
    }
    float _159 = _155;
    int _161 = as_type<int>(_117) & 1;
    bool _163 = _161 != 0;
    int _165 = as_type<int>(_117) & 2;
    bool _167 = _165 != 0;
    bool _169 = !_163;
    float _171 = _169 ? (-0.5) : 0.5;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_131;
    float _179 = _159;
    if (!_177)
    {
        float _181 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _183 = log2(_181);
        float _185 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _187 = _185 + 1.0;
        float _189 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _191 = _119 * _183;
        float _193 = 1.0 / _187;
        float _195 = _189 * 0.693147182464599609375;
        float _197 = exp2(_191);
        float _199 = 1.0 / _195;
        float _201 = _197 + (-1.0);
        float _203 = -_201;
        float _205 = fma(_203, _199, _119);
        float _207 = _205 * _193;
        float _209 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _209;
    }
    float _211 = _179;
    bool _213 = !_131;
    if (!_213)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = 1.0 / _221;
        float _225 = _119 * _217;
        float _227 = exp2(_225);
        float _229 = -_227;
        float _231 = _229 + 1.0;
        float _233 = _231 * _223;
        _147 = _233;
    }
    float _235 = _147;
    bool _237 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _239 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _241 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _243 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _245 = fma(_235, _133, _239);
    float _247 = fma(_235, _135, _241);
    float _249 = fma(_235, _137, _243);
    float _251 = fma(_245, _121, _139);
    float _253 = fma(_247, _121, _141);
    float _255 = fma(_249, _121, _143);
    bool _257 = !_237;
    float _275;
    if (!_257)
    {
        float _259 = in.m_38.x;
        float _261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _263 = _259 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _265 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _267 = _265 * _261;
        float _269 = floor(_267);
        float _271 = -_269;
        float _273 = _267 + _271;
        _275 = _273;
        _277 = true;
    }
    else
    {
        float _279 = float(_63);
        float _281 = 1.0 / _279;
        float _283 = _97 * _281;
        _275 = _283;
    }
    _277 = false;
    float _285 = _275;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = _285 + _287;
    bool _291 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _293 = isnan(_285);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _285 + _303;
    bool _307 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _309 = isnan(_285);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _327 = -_301;
    float _329 = _327 + 1.0;
    float _331 = 1.0 / _325;
    bool _333 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _335 = isnan(_285);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = _317 * _329;
    float _347 = -_317;
    float _349 = _347 + 1.0;
    bool _351 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _353 = _343 * _349;
    float _355 = 1.0 / _321;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _357;
    float _361 = -_343;
    float _363 = _361 + 1.0;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _369 = _305 * _331;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _375 = fma(_367, _369, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _377 = fma(_373, _369, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _379 = _289 * _355;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _381;
    float _385 = in.m_36.x;
    float _387 = in.m_36.y;
    float _389 = fma(_359, _379, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _391 = fma(_383, _379, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _393 = _389 * _353;
    float _395 = _391 * _353;
    float _397 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[143].x, _395);
    float _399 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[143].y, _393);
    float _401 = fma(_377, _345, _397);
    float _403 = fma(_375, _345, _399);
    float _405 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[145].x, _401);
    float _407 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[145].y, _403);
    float _409 = _405 * _385;
    float _411 = _407 * _387;
    bool _413 = !_351;
    float _431;
    if (!_413)
    {
        float _415 = in.m_38.x;
        float _417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _419 = _415 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _421 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[11].y, _97);
        float _423 = _421 * _417;
        float _425 = floor(_423);
        float _427 = -_425;
        float _429 = _423 + _427;
        _431 = _429;
        _433 = true;
    }
    else
    {
        float _435 = float(_63);
        float _437 = 1.0 / _435;
        float _439 = _97 * _437;
        _431 = _439;
    }
    _433 = false;
    float _441 = _431;
    float _443 = in.m_38.x;
    float _445 = in.m_38.y;
    float _447 = _253 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _451 = _449 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _453 = _253 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _455;
    float _459 = fma(_251, (*spvDescriptorSet0.vp_c10)._m0[5].x, _447);
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _465 = fma(_251, (*spvDescriptorSet0.vp_c10)._m0[6].x, _453);
    float _467 = 1.0 / _451;
    float _469 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[5].z, _459);
    float _471 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[6].z, _465);
    float _473 = 1.0 / _463;
    bool _475 = _443 > 0.5;
    float _477 = _457 * _467;
    float _479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _481 = _445 > 0.5;
    float _483 = _253 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _491 = _441 + _489;
    float _493 = fma(_251, (*spvDescriptorSet0.vp_c10)._m0[4].x, _483);
    int _495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _497 = _495 != 0;
    int _499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _501 = _499 != 0;
    float _503 = 1.0 / _487;
    bool _505 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _507 = isnan(_441);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _513 = _509 || _511;
    float _515 = float(_513);
    float _517 = fma(_477, _491, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _519 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _521 = isnan(_441);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = -_515;
    float _533 = _531 + 1.0;
    bool _535 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _537 = isnan(_441);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _543 = _539 || _541;
    float _545 = float(_543);
    float _547 = -_529;
    float _549 = _547 + 1.0;
    bool _551 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _553 = isnan(_441);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _563;
    float _567 = _529 * _533;
    float _569 = _545 * _549;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _575 = -_545;
    float _577 = _575 + 1.0;
    float _579 = -_561;
    float _581 = _579 + 1.0;
    float _583 = _565 * _503;
    float _585 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[4].z, _493);
    float _587 = _517 * _569;
    float _589 = _469 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _591 = _573 * _473;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _595 = _441 + _593;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _599 = _441 + _597;
    float _601 = _585 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _603 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _605 = _589 + _603;
    float _607 = fma(_591, _595, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _609 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[115].x, _587);
    float _611 = _515 * _581;
    float _613 = fma(_583, _599, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _615 = -_171;
    int _617 = _475 ? as_type<int>(_615) : as_type<int>(_171);
    float _619 = _471 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _621 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _623 = _601 + _621;
    float _625 = _605 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _627 = !_497;
    float _629 = _627 ? _171 : as_type<float>(_617);
    float _631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _633 = -_175;
    int _635 = _481 ? as_type<int>(_633) : as_type<int>(_175);
    float _637 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _639 = _619 + _637;
    float _641 = fma(_623, (*spvDescriptorSet0.vp_c8)._m0[28].x, _625);
    float _643 = fma(_607, _567, _609);
    bool _645 = !_501;
    float _647 = _645 ? _175 : as_type<float>(_635);
    float _649 = _629 + 0.5;
    float _651 = fma(_639, (*spvDescriptorSet0.vp_c8)._m0[28].z, _641);
    float _653 = fma(_613, _611, _643);
    float _655 = _605 * _605;
    float _657 = -_647;
    float _659 = _657 + 0.5;
    float _661 = _649 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _663 = _651 >= 0.0;
    float _665 = fma(_623, _623, _655);
    float _667 = _659 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _669 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[118].x, _653);
    float _671 = _661 * _631;
    float _673 = fma(_639, _639, _665);
    float _675 = _667 * _479;
    float _677 = rsqrt(_673);
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _687 = 0.0;
    int _689 = as_type<int>(_669);
    if (_663)
    {
        _687 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _691 = _687;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _697 = _669 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _699 = _683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = _685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _703 = _679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = _681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _707;
    if (_663)
    {
        float _713 = _691 * 5.0;
        _689 = as_type<int>(_713);
    }
    int _715 = _689;
    out.m_40.x = _671;
    out.m_40.y = _675;
    float _717 = _605 * _677;
    float _719 = _623 * _677;
    out.m_42.x = _703;
    out.m_42.y = _705;
    out.m_42.z = _707;
    out.m_44.x = _699;
    out.m_44.y = _701;
    out.m_44.z = _709;
    out.m_44.w = _697;
    if (_663)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2028 = as_type<float>(_715);
        out.gl_Position.z = _2028;
    }
    if (_663)
    {
        out.m_29.x = 0.0;
    }
    if (_663)
    {
        return out;
    }
    float _721 = -_717;
    float _723 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[18].w, _589);
    float _725 = _639 * _677;
    float _727 = -_719;
    float _729 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[18].w, _601);
    float _731 = -_717;
    float _733 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[18].w, _605);
    float _735 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _737 = _723 + _735;
    float _739 = -_725;
    float _741 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[18].w, _619);
    float _743 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _745 = _729 + _743;
    float _747 = -_719;
    float _749 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[18].w, _623);
    float _751 = _737 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _753 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _755 = _741 + _753;
    float _757 = _733 * _733;
    float _759 = -_725;
    float _761 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _639);
    float _763 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[28].x, _751);
    float _765 = fma(_749, _749, _757);
    float _767 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[28].z, _763);
    float _769 = fma(_761, _761, _765);
    bool _771 = _767 >= 0.0;
    float _773 = sqrt(_769);
    if (_771)
    {
        _711 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _775 = _711;
    int _777 = as_type<int>(_775);
    if (_771)
    {
        out.m_29.x = 0.0;
    }
    if (_771)
    {
        float _779 = _775 * 5.0;
        _777 = as_type<int>(_779);
    }
    int _781 = _777;
    float _783 = _677 * _773;
    if (_771)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2159 = as_type<float>(_781);
        out.gl_Position.z = _2159;
    }
    if (_771)
    {
        return out;
    }
    float _785 = _411 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _787 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _175);
    float _789 = _409 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _791 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _171);
    float _793 = _783 * _785;
    float _795 = _783 * _789;
    float _797 = _787 * _793;
    float _799 = _791 * _795;
    float _801 = _783 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _803 = _801 * 0.5;
    float _805 = _797 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _807 = _797 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _809 = _797 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _811 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[25].x, _805);
    float _813 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[24].x, _807);
    float _815 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[26].x, _809);
    float _817 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[25].z, _811);
    float _819 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[24].z, _813);
    float _821 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[26].z, _815);
    float _823 = _817 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _825 = _819 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _827 = _821 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _829 = _589 + _823;
    float _831 = _601 + _825;
    float _833 = _619 + _827;
    float _835 = -_717;
    float _837 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[18].w, _829);
    float _839 = -_719;
    float _841 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[18].w, _831);
    float _843 = -_725;
    float _845 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[18].w, _833);
    float _847 = _837 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _849 = _837 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _851 = _837 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _853 = _837 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _855 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[1].x, _847);
    float _857 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[0].x, _849);
    float _859 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[2].x, _851);
    float _861 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[3].x, _853);
    float _863 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[1].z, _855);
    float _865 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[0].z, _857);
    float _867 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[2].z, _859);
    float _869 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[3].z, _861);
    float _871 = _863 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _873 = _865 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _875 = _867 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _877 = _869 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _879 = _871 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _881 = _871 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _883 = _871 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _885 = _871 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _887 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[4].x, _879);
    float _889 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[5].x, _881);
    float _891 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[6].x, _883);
    float _893 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[7].x, _885);
    float _895 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[4].z, _887);
    float _897 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[5].z, _889);
    float _899 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[6].z, _891);
    float _901 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[7].z, _893);
    float _903 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[4].w, _895);
    float _905 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[5].w, _897);
    float _907 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[6].w, _899);
    float _909 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[7].w, _901);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _903;
    out.gl_Position.y = _905;
    out.gl_Position.z = _907;
    out.gl_Position.w = _909;
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
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    bool _433 = false;
    bool _277 = false;
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
        float _966 = as_type<float>(_79);
        out.gl_Position.z = _966;
    }
    if (!_67)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1035 = as_type<float>(_115);
        out.gl_Position.z = _1035;
    }
    if (_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _117 = as_type<float>(int(gl_VertexIndex));
    float _119 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _121 = in.m_36.w;
    bool _123 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _125 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _127 = _123 || _125;
    bool _129 = isnan(1.0);
    bool _131 = _127 || _129;
    float _133 = in.m_31.x;
    float _135 = in.m_31.y;
    float _137 = in.m_31.z;
    float _139 = in.m_26.x;
    float _141 = in.m_26.y;
    float _143 = in.m_26.z;
    float _145 = 0.0;
    float _147 = _119;
    if (!_131)
    {
        float _149 = _119 * _119;
        float _151 = _149 * 0.5;
        _145 = _151;
    }
    float _153 = _145;
    float _155 = _153;
    if (!_131)
    {
        float _157 = _153 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _155 = _157;
    }
    float _159 = _155;
    int _161 = as_type<int>(_117) & 1;
    bool _163 = _161 != 0;
    int _165 = as_type<int>(_117) & 2;
    bool _167 = _165 != 0;
    bool _169 = !_163;
    float _171 = _169 ? (-0.5) : 0.5;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_131;
    float _179 = _159;
    if (!_177)
    {
        float _181 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _183 = log2(_181);
        float _185 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _187 = _185 + 1.0;
        float _189 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _191 = _119 * _183;
        float _193 = 1.0 / _187;
        float _195 = _189 * 0.693147182464599609375;
        float _197 = exp2(_191);
        float _199 = 1.0 / _195;
        float _201 = _197 + (-1.0);
        float _203 = -_201;
        float _205 = fma(_203, _199, _119);
        float _207 = _205 * _193;
        float _209 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _209;
    }
    float _211 = _179;
    bool _213 = !_131;
    if (!_213)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = 1.0 / _221;
        float _225 = _119 * _217;
        float _227 = exp2(_225);
        float _229 = -_227;
        float _231 = _229 + 1.0;
        float _233 = _231 * _223;
        _147 = _233;
    }
    float _235 = _147;
    bool _237 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _239 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _241 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _243 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _245 = fma(_235, _133, _239);
    float _247 = fma(_235, _135, _241);
    float _249 = fma(_235, _137, _243);
    float _251 = fma(_245, _121, _139);
    float _253 = fma(_247, _121, _141);
    float _255 = fma(_249, _121, _143);
    bool _257 = !_237;
    float _275;
    if (!_257)
    {
        float _259 = in.m_38.x;
        float _261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _263 = _259 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _265 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _267 = _265 * _261;
        float _269 = floor(_267);
        float _271 = -_269;
        float _273 = _267 + _271;
        _275 = _273;
        _277 = true;
    }
    else
    {
        float _279 = float(_63);
        float _281 = 1.0 / _279;
        float _283 = _97 * _281;
        _275 = _283;
    }
    _277 = false;
    float _285 = _275;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = _285 + _287;
    bool _291 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _293 = isnan(_285);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _285 + _303;
    bool _307 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _309 = isnan(_285);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _327 = -_301;
    float _329 = _327 + 1.0;
    float _331 = 1.0 / _325;
    bool _333 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _335 = isnan(_285);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = _317 * _329;
    float _347 = -_317;
    float _349 = _347 + 1.0;
    bool _351 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _353 = _343 * _349;
    float _355 = 1.0 / _321;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _357;
    float _361 = -_343;
    float _363 = _361 + 1.0;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _369 = _305 * _331;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _375 = fma(_367, _369, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _377 = fma(_373, _369, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _379 = _289 * _355;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _381;
    float _385 = in.m_36.x;
    float _387 = in.m_36.y;
    float _389 = fma(_359, _379, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _391 = fma(_383, _379, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _393 = _389 * _353;
    float _395 = _391 * _353;
    float _397 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[143].x, _395);
    float _399 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[143].y, _393);
    float _401 = fma(_377, _345, _397);
    float _403 = fma(_375, _345, _399);
    float _405 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[145].x, _401);
    float _407 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[145].y, _403);
    float _409 = _405 * _385;
    float _411 = _407 * _387;
    bool _413 = !_351;
    float _431;
    if (!_413)
    {
        float _415 = in.m_38.x;
        float _417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _419 = _415 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _421 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[11].y, _97);
        float _423 = _421 * _417;
        float _425 = floor(_423);
        float _427 = -_425;
        float _429 = _423 + _427;
        _431 = _429;
        _433 = true;
    }
    else
    {
        float _435 = float(_63);
        float _437 = 1.0 / _435;
        float _439 = _97 * _437;
        _431 = _439;
    }
    _433 = false;
    float _441 = _431;
    float _443 = in.m_38.x;
    float _445 = in.m_38.y;
    float _447 = _253 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _451 = _449 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _453 = _253 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _455;
    float _459 = fma(_251, (*spvDescriptorSet0.vp_c10)._m0[5].x, _447);
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _465 = fma(_251, (*spvDescriptorSet0.vp_c10)._m0[6].x, _453);
    float _467 = 1.0 / _451;
    float _469 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[5].z, _459);
    float _471 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[6].z, _465);
    float _473 = 1.0 / _463;
    bool _475 = _443 > 0.5;
    float _477 = _457 * _467;
    float _479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _481 = _445 > 0.5;
    float _483 = _253 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _491 = _441 + _489;
    float _493 = fma(_251, (*spvDescriptorSet0.vp_c10)._m0[4].x, _483);
    int _495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _497 = _495 != 0;
    int _499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _501 = _499 != 0;
    float _503 = 1.0 / _487;
    bool _505 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _507 = isnan(_441);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _513 = _509 || _511;
    float _515 = float(_513);
    float _517 = fma(_477, _491, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _519 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _521 = isnan(_441);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = -_515;
    float _533 = _531 + 1.0;
    bool _535 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _537 = isnan(_441);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _543 = _539 || _541;
    float _545 = float(_543);
    float _547 = -_529;
    float _549 = _547 + 1.0;
    bool _551 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _553 = isnan(_441);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _563;
    float _567 = _529 * _533;
    float _569 = _545 * _549;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _575 = -_545;
    float _577 = _575 + 1.0;
    float _579 = -_561;
    float _581 = _579 + 1.0;
    float _583 = _565 * _503;
    float _585 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[4].z, _493);
    float _587 = _517 * _569;
    float _589 = _469 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _591 = _573 * _473;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _595 = _441 + _593;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _599 = _441 + _597;
    float _601 = _585 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _603 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _605 = _589 + _603;
    float _607 = fma(_591, _595, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _609 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[115].x, _587);
    float _611 = _515 * _581;
    float _613 = fma(_583, _599, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _615 = -_171;
    int _617 = _475 ? as_type<int>(_615) : as_type<int>(_171);
    float _619 = _471 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _621 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _623 = _601 + _621;
    float _625 = _605 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _627 = !_497;
    float _629 = _627 ? _171 : as_type<float>(_617);
    float _631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _633 = -_175;
    int _635 = _481 ? as_type<int>(_633) : as_type<int>(_175);
    float _637 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _639 = _619 + _637;
    float _641 = fma(_623, (*spvDescriptorSet0.vp_c8)._m0[28].x, _625);
    float _643 = fma(_607, _567, _609);
    bool _645 = !_501;
    float _647 = _645 ? _175 : as_type<float>(_635);
    float _649 = _629 + 0.5;
    float _651 = fma(_639, (*spvDescriptorSet0.vp_c8)._m0[28].z, _641);
    float _653 = fma(_613, _611, _643);
    float _655 = _605 * _605;
    float _657 = -_647;
    float _659 = _657 + 0.5;
    float _661 = _649 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _663 = _651 >= 0.0;
    float _665 = fma(_623, _623, _655);
    float _667 = _659 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _669 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[118].x, _653);
    float _671 = _661 * _631;
    float _673 = fma(_639, _639, _665);
    float _675 = _667 * _479;
    float _677 = rsqrt(_673);
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _687 = 0.0;
    int _689 = as_type<int>(_669);
    if (_663)
    {
        _687 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _691 = _687;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _697 = _669 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _699 = _683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = _685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _703 = _679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = _681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _707;
    if (_663)
    {
        float _713 = _691 * 5.0;
        _689 = as_type<int>(_713);
    }
    int _715 = _689;
    out.m_40.x = _671;
    out.m_40.y = _675;
    float _717 = _605 * _677;
    float _719 = _623 * _677;
    out.m_42.x = _703;
    out.m_42.y = _705;
    out.m_42.z = _707;
    out.m_44.x = _699;
    out.m_44.y = _701;
    out.m_44.z = _709;
    out.m_44.w = _697;
    if (_663)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2028 = as_type<float>(_715);
        out.gl_Position.z = _2028;
    }
    if (_663)
    {
        out.m_29.x = 0.0;
    }
    if (_663)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _721 = -_717;
    float _723 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[18].w, _589);
    float _725 = _639 * _677;
    float _727 = -_719;
    float _729 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[18].w, _601);
    float _731 = -_717;
    float _733 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[18].w, _605);
    float _735 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _737 = _723 + _735;
    float _739 = -_725;
    float _741 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[18].w, _619);
    float _743 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _745 = _729 + _743;
    float _747 = -_719;
    float _749 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[18].w, _623);
    float _751 = _737 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _753 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _755 = _741 + _753;
    float _757 = _733 * _733;
    float _759 = -_725;
    float _761 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _639);
    float _763 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[28].x, _751);
    float _765 = fma(_749, _749, _757);
    float _767 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[28].z, _763);
    float _769 = fma(_761, _761, _765);
    bool _771 = _767 >= 0.0;
    float _773 = sqrt(_769);
    if (_771)
    {
        _711 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _775 = _711;
    int _777 = as_type<int>(_775);
    if (_771)
    {
        out.m_29.x = 0.0;
    }
    if (_771)
    {
        float _779 = _775 * 5.0;
        _777 = as_type<int>(_779);
    }
    int _781 = _777;
    float _783 = _677 * _773;
    if (_771)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2159 = as_type<float>(_781);
        out.gl_Position.z = _2159;
    }
    if (_771)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _785 = _411 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _787 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _175);
    float _789 = _409 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _791 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _171);
    float _793 = _783 * _785;
    float _795 = _783 * _789;
    float _797 = _787 * _793;
    float _799 = _791 * _795;
    float _801 = _783 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _803 = _801 * 0.5;
    float _805 = _797 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _807 = _797 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _809 = _797 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _811 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[25].x, _805);
    float _813 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[24].x, _807);
    float _815 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[26].x, _809);
    float _817 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[25].z, _811);
    float _819 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[24].z, _813);
    float _821 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[26].z, _815);
    float _823 = _817 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _825 = _819 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _827 = _821 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _829 = _589 + _823;
    float _831 = _601 + _825;
    float _833 = _619 + _827;
    float _835 = -_717;
    float _837 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[18].w, _829);
    float _839 = -_719;
    float _841 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[18].w, _831);
    float _843 = -_725;
    float _845 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[18].w, _833);
    float _847 = _837 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _849 = _837 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _851 = _837 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _853 = _837 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _855 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[1].x, _847);
    float _857 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[0].x, _849);
    float _859 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[2].x, _851);
    float _861 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[3].x, _853);
    float _863 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[1].z, _855);
    float _865 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[0].z, _857);
    float _867 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[2].z, _859);
    float _869 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[3].z, _861);
    float _871 = _863 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _873 = _865 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _875 = _867 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _877 = _869 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _879 = _871 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _881 = _871 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _883 = _871 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _885 = _871 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _887 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[4].x, _879);
    float _889 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[5].x, _881);
    float _891 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[6].x, _883);
    float _893 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[7].x, _885);
    float _895 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[4].z, _887);
    float _897 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[5].z, _889);
    float _899 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[6].z, _891);
    float _901 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[7].z, _893);
    float _903 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[4].w, _895);
    float _905 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[5].w, _897);
    float _907 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[6].w, _899);
    float _909 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[7].w, _901);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _903;
    out.gl_Position.y = _905;
    out.gl_Position.z = _907;
    out.gl_Position.w = _909;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

