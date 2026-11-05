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
    float4 m_40 [[user(locn0)]];
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
    float4 m_38 [[attribute(4)]];
    float4 m_36 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    bool _941 = false;
    bool _773 = false;
    bool _593 = false;
    bool _479 = false;
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
        float _1424 = as_type<float>(_79);
        out.gl_Position.z = _1424;
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
        float _1493 = as_type<float>(_115);
        out.gl_Position.z = _1493;
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
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = _285 + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _303;
    bool _307 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _309 = isnan(_285);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = 1.0 / _297;
    float _321 = -_317;
    float _323 = _321 + 1.0;
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _327 = 1.0 / _301;
    float _329 = 1.0 / _305;
    float _331 = _289 * _319;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _335 = _285 + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _337;
    float _341 = _335 * _327;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _343;
    float _347 = fma(_339, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _353 = fma(_345, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _355 = _293 * _329;
    bool _357 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _359 = isnan(_285);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    bool _369 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _371 = isnan(_285);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = _367 * _323;
    bool _383 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _385 = isnan(_285);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = -_367;
    float _397 = _395 + 1.0;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _403 = -_379;
    float _405 = _403 + 1.0;
    float _407 = _379 * _397;
    float _409 = fma(_401, _341, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _411 = fma(_351, _341, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _413 = _393 * _405;
    float _415 = in.m_36.x;
    float _417 = in.m_36.y;
    float _419 = -_393;
    float _421 = _419 + 1.0;
    float _423 = _347 * _413;
    float _425 = _353 * _413;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _431;
    float _435 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[143].x, _423);
    float _437 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[143].y, _425);
    float _439 = fma(_429, _355, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _441 = fma(_433, _355, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _443 = fma(_409, _407, _435);
    float _445 = fma(_411, _407, _437);
    float _447 = fma(_439, _381, _443);
    float _449 = fma(_441, _381, _445);
    float _451 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[146].x, _447);
    float _453 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[146].y, _449);
    float _455 = _451 * _415;
    float _457 = _453 * _417;
    bool _459 = !_325;
    float _477;
    if (!_459)
    {
        float _461 = in.m_38.x;
        float _463 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _465 = _461 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _467 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[11].x, _97);
        float _469 = _467 * _463;
        float _471 = floor(_469);
        float _473 = -_471;
        float _475 = _469 + _473;
        _477 = _475;
        _479 = true;
    }
    else
    {
        float _481 = float(_63);
        float _483 = 1.0 / _481;
        float _485 = _97 * _483;
        _477 = _485;
    }
    _479 = false;
    float _487 = _477;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _491 = _487 + _489;
    bool _493 = _487 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _495 = isnan(_487);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _505;
    bool _509 = _487 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _511 = isnan(_487);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = -_503;
    float _523 = _521 + 1.0;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _525;
    float _529 = 1.0 / _507;
    bool _531 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _533 = _519 * _523;
    float _535 = -_519;
    float _537 = _535 + 1.0;
    float _539 = _491 * _529;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _541;
    float _545 = fma(_527, _539, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _547;
    float _551 = fma(_543, _539, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _553 = _545 * _533;
    float _555 = fma(_549, _539, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _557 = _551 * _533;
    float _559 = _555 * _533;
    float _561 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[107].x, _553);
    float _563 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[107].y, _559);
    float _565 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[107].z, _557);
    float _567 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[108].x, _561);
    float _569 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[108].y, _563);
    float _571 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[108].z, _565);
    bool _573 = !_531;
    float _591;
    if (!_573)
    {
        float _575 = in.m_38.x;
        float _577 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _579 = _575 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _581 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[11].y, _97);
        float _583 = _581 * _577;
        float _585 = floor(_583);
        float _587 = -_585;
        float _589 = _583 + _587;
        _591 = _589;
        _593 = true;
    }
    else
    {
        float _595 = float(_63);
        float _597 = 1.0 / _595;
        float _599 = _97 * _597;
        _591 = _599;
    }
    _593 = false;
    float _601 = _591;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _605 = _601 + _603;
    float _607 = _567 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _617 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _619 = isnan(_601);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _633 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _635 = isnan(_601);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = 1.0 / _611;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _647;
    float _651 = -_627;
    float _653 = _651 + 1.0;
    bool _655 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _657 = isnan(_601);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = _569 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _669 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _671 = 1.0 / _615;
    float _673 = 1.0 / _631;
    float _675 = _649 * _645;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _679 = _677 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _681 = _643 * _653;
    float _683 = -_643;
    float _685 = _683 + 1.0;
    float _687 = fma(_675, _605, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _689;
    float _693 = _665 * _685;
    float _695 = _679 * _671;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _699 = _601 + _697;
    bool _701 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _703 = isnan(_601);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = _687 * _693;
    float _715 = -_665;
    float _717 = _715 + 1.0;
    float _719 = fma(_695, _699, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _723 = _601 + _721;
    float _725 = _691 * _673;
    float _727 = -_711;
    float _729 = _727 + 1.0;
    float _731 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[115].x, _713);
    float _733 = _571 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _735 = fma(_725, _723, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _737 = _627 * _729;
    float _739 = fma(_719, _681, _731);
    float _741 = _607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _743 = _733 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _745 = fma(_735, _737, _739);
    float _747 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[118].x, _745);
    float _749 = _667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _751 = _747 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_40.x = _741;
    out.m_40.y = _749;
    out.m_40.z = _743;
    out.m_40.w = _751;
    bool _753 = !_669;
    float _771;
    if (!_753)
    {
        float _755 = in.m_38.x;
        float _757 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _759 = _755 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _761 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[11].z, _97);
        float _763 = _761 * _757;
        float _765 = floor(_763);
        float _767 = -_765;
        float _769 = _763 + _767;
        _771 = _769;
        _773 = true;
    }
    else
    {
        float _775 = float(_63);
        float _777 = 1.0 / _775;
        float _779 = _97 * _777;
        _771 = _779;
    }
    _773 = false;
    float _781 = _771;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _785 = _781 + _783;
    bool _787 = _781 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _789 = isnan(_781);
    bool _791 = _787 || _789;
    bool _793 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _795 = _791 || _793;
    float _797 = float(_795);
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _801 = _781 + _799;
    bool _803 = _781 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _805 = isnan(_781);
    bool _807 = _803 || _805;
    bool _809 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _811 = _807 || _809;
    float _813 = float(_811);
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _815;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _823 = _781 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _825 = isnan(_781);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = -_797;
    float _837 = _835 + 1.0;
    float _839 = 1.0 / _821;
    float _841 = _833 * _837;
    float _843 = -_833;
    float _845 = _843 + 1.0;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _847;
    bool _851 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _853 = 1.0 / _817;
    float _855 = _813 * _845;
    float _857 = -_813;
    float _859 = _857 + 1.0;
    float _861 = _801 * _839;
    float _863 = _785 * _853;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _865;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _869;
    float _873 = fma(_849, _863, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _875 = fma(_867, _863, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _877 = fma(_871, _863, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _879 = _873 * _855;
    float _881 = _875 * _855;
    float _883 = _877 * _855;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _887 = _885 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _891 = _889 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _897 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[123].x, _879);
    float _899 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[123].y, _881);
    float _901 = fma(_887, _861, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _903 = fma(_891, _861, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _905 = fma(_895, _861, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _907 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[123].z, _883);
    float _909 = fma(_901, _841, _897);
    float _911 = fma(_903, _841, _899);
    float _913 = fma(_905, _841, _907);
    float _915 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[125].x, _909);
    float _917 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[125].y, _911);
    float _919 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[125].z, _913);
    bool _921 = !_851;
    float _939;
    if (!_921)
    {
        float _923 = in.m_38.x;
        float _925 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _927 = _923 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _929 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[11].w, _97);
        float _931 = _929 * _925;
        float _933 = floor(_931);
        float _935 = -_933;
        float _937 = _931 + _935;
        _939 = _937;
        _941 = true;
    }
    else
    {
        float _943 = float(_63);
        float _945 = 1.0 / _943;
        float _947 = _97 * _945;
        _939 = _947;
    }
    _941 = false;
    float _949 = _939;
    float _951 = in.m_38.x;
    float _953 = in.m_38.y;
    float _955 = _253 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _961;
    int _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _967 = _965 != 0;
    float _969 = 1.0 / _959;
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _973 = _971 != 0;
    float _975 = _253 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _979 = _977 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _981 = fma(_251, (*spvDescriptorSet0.vp_c10)._m0[6].x, _955);
    float _983 = _915 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _985 = fma(_251, (*spvDescriptorSet0.vp_c10)._m0[4].x, _975);
    float _987 = _917 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _989 = 1.0 / _979;
    bool _991 = _949 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _993 = isnan(_949);
    bool _995 = _991 || _993;
    bool _997 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _999 = _995 || _997;
    float _1001 = float(_999);
    float _1003 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[6].z, _981);
    float _1005 = _963 * _969;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1009 = _949 + _1007;
    bool _1011 = _953 > 0.5;
    float _1013 = _253 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1019 = fma(_1005, _1009, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1021 = _949 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1023 = isnan(_949);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1029 = _1025 || _1027;
    float _1031 = float(_1029);
    float _1033 = fma(_251, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1013);
    bool _1035 = _951 > 0.5;
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1039 = _949 + _1037;
    bool _1041 = _949 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1043 = isnan(_949);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1049 = _1045 || _1047;
    float _1051 = float(_1049);
    float _1053 = -_1031;
    float _1055 = _1053 + 1.0;
    float _1057 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[4].z, _985);
    float _1059 = _1017 * _989;
    float _1061 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1063 = _1001 * _1055;
    float _1065 = -_1001;
    float _1067 = _1065 + 1.0;
    float _1069 = _1057 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1071 = -_1051;
    float _1073 = _1071 + 1.0;
    float _1075 = _1019 * _1063;
    float _1077 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1033);
    float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1081 = _1069 + _1079;
    float _1083 = _1031 * _1073;
    float _1085 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1075);
    float _1087 = _1077 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1089 = _1003 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1091 = fma(_1059, _1039, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1093 = -_171;
    int _1095 = _1035 ? as_type<int>(_1093) : as_type<int>(_171);
    float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1099 = _1087 + _1097;
    float _1101 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1103 = _1089 + _1101;
    float _1105 = fma(_1091, _1083, _1085);
    float _1107 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1109 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1111 = _1099 * _1099;
    bool _1113 = !_967;
    float _1115 = _1113 ? _171 : as_type<float>(_1095);
    float _1117 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1109);
    float _1119 = fma(_1081, _1081, _1111);
    float _1121 = -_175;
    int _1123 = _1011 ? as_type<int>(_1121) : as_type<int>(_175);
    float _1125 = _1115 + 0.5;
    float _1127 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1117);
    float _1129 = fma(_1103, _1103, _1119);
    bool _1131 = !_973;
    float _1133 = _1131 ? _175 : as_type<float>(_1123);
    float _1135 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1137 = fma(_1051, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1105);
    bool _1139 = _1127 >= 0.0;
    float _1141 = _987 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = -_1133;
    float _1145 = _1143 + 0.5;
    float _1147 = rsqrt(_1129);
    float _1149 = _1135 * _1107;
    float _1151 = _919 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1153 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1155 = _983 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1157 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1159 = _1153 * _1061;
    float _1161 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1163 = _1127;
    float _1165 = _1157;
    if (_1139)
    {
        _1163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1167 = _1163;
    int _1169 = as_type<int>(_1167);
    if (_1139)
    {
        out.m_29.x = 0.0;
    }
    if (_1139)
    {
        float _1171 = _1167 * 5.0;
        _1169 = as_type<int>(_1171);
    }
    int _1173 = _1169;
    out.m_42.x = _1149;
    out.m_42.y = _1159;
    float _1175 = _1099 * _1147;
    float _1177 = _1081 * _1147;
    out.m_44.x = _1155;
    out.m_44.y = _1141;
    out.m_44.z = _1157;
    out.m_44.w = _1161;
    if (_1139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3216 = as_type<float>(_1173);
        out.gl_Position.z = _3216;
    }
    if (_1139)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1179 = -_1175;
    float _1181 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1087);
    float _1183 = _1103 * _1147;
    float _1185 = -_1177;
    float _1187 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1069);
    float _1189 = -_1175;
    float _1191 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1099);
    float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1195 = _1181 + _1193;
    float _1197 = -_1183;
    float _1199 = fma(_1197, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1089);
    float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1203 = _1187 + _1201;
    float _1205 = -_1177;
    float _1207 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1081);
    float _1209 = _1195 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1211 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1213 = _1199 + _1211;
    float _1215 = -_1183;
    float _1217 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1103);
    float _1219 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1209);
    float _1221 = _1191 * _1191;
    float _1223 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1219);
    float _1225 = fma(_1207, _1207, _1221);
    bool _1227 = _1223 >= 0.0;
    float _1229 = fma(_1217, _1217, _1225);
    float _1231 = sqrt(_1229);
    if (_1227)
    {
        _1165 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1233 = _1165;
    int _1235 = as_type<int>(_1233);
    if (_1227)
    {
        out.m_29.x = 0.0;
    }
    if (_1227)
    {
        float _1237 = _1233 * 5.0;
        _1235 = as_type<int>(_1237);
    }
    int _1239 = _1235;
    if (_1227)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3340 = as_type<float>(_1239);
        out.gl_Position.z = _3340;
    }
    float _1241 = _1147 * _1231;
    if (_1227)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1243 = _457 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1245 = _455 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1247 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _175);
    float _1249 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _171);
    float _1251 = _1241 * _1243;
    float _1253 = _1241 * _1245;
    float _1255 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1257 = _1255 * 0.5;
    float _1259 = _1247 * _1251;
    float _1261 = _1249 * _1253;
    float _1263 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1265 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1267 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1269 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1263);
    float _1271 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1265);
    float _1273 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1267);
    float _1275 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1269);
    float _1277 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1271);
    float _1279 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1273);
    float _1281 = _1275 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1283 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1285 = _1279 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1287 = _1087 + _1281;
    float _1289 = _1069 + _1283;
    float _1291 = _1089 + _1285;
    float _1293 = -_1175;
    float _1295 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1287);
    float _1297 = -_1177;
    float _1299 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1289);
    float _1301 = -_1183;
    float _1303 = fma(_1301, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1291);
    float _1305 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1307 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1309 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1311 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1305);
    float _1313 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1315 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1307);
    float _1317 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1309);
    float _1319 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1311);
    float _1321 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1313);
    float _1323 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1315);
    float _1325 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1317);
    float _1327 = _1319 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1329 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1321);
    float _1331 = _1323 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1333 = _1325 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1335 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1337 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1339 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1341 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1343 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1335);
    float _1345 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1337);
    float _1347 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1339);
    float _1349 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1341);
    float _1351 = _1329 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1353 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1343);
    float _1355 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1345);
    float _1357 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1347);
    float _1359 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1349);
    float _1361 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1353);
    float _1363 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1355);
    float _1365 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1357);
    float _1367 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1359);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _1363;
    out.gl_Position.y = _1365;
    out.gl_Position.z = _1361;
    out.gl_Position.w = _1367;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    bool _941 = false;
    bool _773 = false;
    bool _593 = false;
    bool _479 = false;
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
        float _1424 = as_type<float>(_79);
        out.gl_Position.z = _1424;
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
        float _1493 = as_type<float>(_115);
        out.gl_Position.z = _1493;
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
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = _285 + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _303;
    bool _307 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _309 = isnan(_285);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = 1.0 / _297;
    float _321 = -_317;
    float _323 = _321 + 1.0;
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _327 = 1.0 / _301;
    float _329 = 1.0 / _305;
    float _331 = _289 * _319;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _335 = _285 + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _337;
    float _341 = _335 * _327;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _343;
    float _347 = fma(_339, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _353 = fma(_345, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _355 = _293 * _329;
    bool _357 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _359 = isnan(_285);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    bool _369 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _371 = isnan(_285);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = _367 * _323;
    bool _383 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _385 = isnan(_285);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = -_367;
    float _397 = _395 + 1.0;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _403 = -_379;
    float _405 = _403 + 1.0;
    float _407 = _379 * _397;
    float _409 = fma(_401, _341, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _411 = fma(_351, _341, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _413 = _393 * _405;
    float _415 = in.m_36.x;
    float _417 = in.m_36.y;
    float _419 = -_393;
    float _421 = _419 + 1.0;
    float _423 = _347 * _413;
    float _425 = _353 * _413;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _431;
    float _435 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[143].x, _423);
    float _437 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[143].y, _425);
    float _439 = fma(_429, _355, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _441 = fma(_433, _355, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _443 = fma(_409, _407, _435);
    float _445 = fma(_411, _407, _437);
    float _447 = fma(_439, _381, _443);
    float _449 = fma(_441, _381, _445);
    float _451 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[146].x, _447);
    float _453 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[146].y, _449);
    float _455 = _451 * _415;
    float _457 = _453 * _417;
    bool _459 = !_325;
    float _477;
    if (!_459)
    {
        float _461 = in.m_38.x;
        float _463 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _465 = _461 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _467 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[11].x, _97);
        float _469 = _467 * _463;
        float _471 = floor(_469);
        float _473 = -_471;
        float _475 = _469 + _473;
        _477 = _475;
        _479 = true;
    }
    else
    {
        float _481 = float(_63);
        float _483 = 1.0 / _481;
        float _485 = _97 * _483;
        _477 = _485;
    }
    _479 = false;
    float _487 = _477;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _491 = _487 + _489;
    bool _493 = _487 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _495 = isnan(_487);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _505;
    bool _509 = _487 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _511 = isnan(_487);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = -_503;
    float _523 = _521 + 1.0;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _525;
    float _529 = 1.0 / _507;
    bool _531 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _533 = _519 * _523;
    float _535 = -_519;
    float _537 = _535 + 1.0;
    float _539 = _491 * _529;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _541;
    float _545 = fma(_527, _539, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _547;
    float _551 = fma(_543, _539, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _553 = _545 * _533;
    float _555 = fma(_549, _539, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _557 = _551 * _533;
    float _559 = _555 * _533;
    float _561 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[107].x, _553);
    float _563 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[107].y, _559);
    float _565 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[107].z, _557);
    float _567 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[108].x, _561);
    float _569 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[108].y, _563);
    float _571 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[108].z, _565);
    bool _573 = !_531;
    float _591;
    if (!_573)
    {
        float _575 = in.m_38.x;
        float _577 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _579 = _575 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _581 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[11].y, _97);
        float _583 = _581 * _577;
        float _585 = floor(_583);
        float _587 = -_585;
        float _589 = _583 + _587;
        _591 = _589;
        _593 = true;
    }
    else
    {
        float _595 = float(_63);
        float _597 = 1.0 / _595;
        float _599 = _97 * _597;
        _591 = _599;
    }
    _593 = false;
    float _601 = _591;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _605 = _601 + _603;
    float _607 = _567 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _617 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _619 = isnan(_601);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _633 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _635 = isnan(_601);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = 1.0 / _611;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _647;
    float _651 = -_627;
    float _653 = _651 + 1.0;
    bool _655 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _657 = isnan(_601);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = _569 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _669 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _671 = 1.0 / _615;
    float _673 = 1.0 / _631;
    float _675 = _649 * _645;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _679 = _677 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _681 = _643 * _653;
    float _683 = -_643;
    float _685 = _683 + 1.0;
    float _687 = fma(_675, _605, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _689;
    float _693 = _665 * _685;
    float _695 = _679 * _671;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _699 = _601 + _697;
    bool _701 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _703 = isnan(_601);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = _687 * _693;
    float _715 = -_665;
    float _717 = _715 + 1.0;
    float _719 = fma(_695, _699, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _723 = _601 + _721;
    float _725 = _691 * _673;
    float _727 = -_711;
    float _729 = _727 + 1.0;
    float _731 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[115].x, _713);
    float _733 = _571 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _735 = fma(_725, _723, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _737 = _627 * _729;
    float _739 = fma(_719, _681, _731);
    float _741 = _607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _743 = _733 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _745 = fma(_735, _737, _739);
    float _747 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[118].x, _745);
    float _749 = _667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _751 = _747 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_40.x = _741;
    out.m_40.y = _749;
    out.m_40.z = _743;
    out.m_40.w = _751;
    bool _753 = !_669;
    float _771;
    if (!_753)
    {
        float _755 = in.m_38.x;
        float _757 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _759 = _755 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _761 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[11].z, _97);
        float _763 = _761 * _757;
        float _765 = floor(_763);
        float _767 = -_765;
        float _769 = _763 + _767;
        _771 = _769;
        _773 = true;
    }
    else
    {
        float _775 = float(_63);
        float _777 = 1.0 / _775;
        float _779 = _97 * _777;
        _771 = _779;
    }
    _773 = false;
    float _781 = _771;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _785 = _781 + _783;
    bool _787 = _781 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _789 = isnan(_781);
    bool _791 = _787 || _789;
    bool _793 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _795 = _791 || _793;
    float _797 = float(_795);
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _801 = _781 + _799;
    bool _803 = _781 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _805 = isnan(_781);
    bool _807 = _803 || _805;
    bool _809 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _811 = _807 || _809;
    float _813 = float(_811);
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _815;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _823 = _781 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _825 = isnan(_781);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = -_797;
    float _837 = _835 + 1.0;
    float _839 = 1.0 / _821;
    float _841 = _833 * _837;
    float _843 = -_833;
    float _845 = _843 + 1.0;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _847;
    bool _851 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _853 = 1.0 / _817;
    float _855 = _813 * _845;
    float _857 = -_813;
    float _859 = _857 + 1.0;
    float _861 = _801 * _839;
    float _863 = _785 * _853;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _865;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _869;
    float _873 = fma(_849, _863, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _875 = fma(_867, _863, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _877 = fma(_871, _863, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _879 = _873 * _855;
    float _881 = _875 * _855;
    float _883 = _877 * _855;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _887 = _885 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _891 = _889 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _897 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[123].x, _879);
    float _899 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[123].y, _881);
    float _901 = fma(_887, _861, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _903 = fma(_891, _861, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _905 = fma(_895, _861, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _907 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[123].z, _883);
    float _909 = fma(_901, _841, _897);
    float _911 = fma(_903, _841, _899);
    float _913 = fma(_905, _841, _907);
    float _915 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[125].x, _909);
    float _917 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[125].y, _911);
    float _919 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[125].z, _913);
    bool _921 = !_851;
    float _939;
    if (!_921)
    {
        float _923 = in.m_38.x;
        float _925 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _927 = _923 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _929 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[11].w, _97);
        float _931 = _929 * _925;
        float _933 = floor(_931);
        float _935 = -_933;
        float _937 = _931 + _935;
        _939 = _937;
        _941 = true;
    }
    else
    {
        float _943 = float(_63);
        float _945 = 1.0 / _943;
        float _947 = _97 * _945;
        _939 = _947;
    }
    _941 = false;
    float _949 = _939;
    float _951 = in.m_38.x;
    float _953 = in.m_38.y;
    float _955 = _253 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _961;
    int _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _967 = _965 != 0;
    float _969 = 1.0 / _959;
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _973 = _971 != 0;
    float _975 = _253 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _979 = _977 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _981 = fma(_251, (*spvDescriptorSet0.vp_c10)._m0[6].x, _955);
    float _983 = _915 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _985 = fma(_251, (*spvDescriptorSet0.vp_c10)._m0[4].x, _975);
    float _987 = _917 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _989 = 1.0 / _979;
    bool _991 = _949 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _993 = isnan(_949);
    bool _995 = _991 || _993;
    bool _997 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _999 = _995 || _997;
    float _1001 = float(_999);
    float _1003 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[6].z, _981);
    float _1005 = _963 * _969;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1009 = _949 + _1007;
    bool _1011 = _953 > 0.5;
    float _1013 = _253 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1019 = fma(_1005, _1009, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1021 = _949 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1023 = isnan(_949);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1029 = _1025 || _1027;
    float _1031 = float(_1029);
    float _1033 = fma(_251, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1013);
    bool _1035 = _951 > 0.5;
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1039 = _949 + _1037;
    bool _1041 = _949 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1043 = isnan(_949);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1049 = _1045 || _1047;
    float _1051 = float(_1049);
    float _1053 = -_1031;
    float _1055 = _1053 + 1.0;
    float _1057 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[4].z, _985);
    float _1059 = _1017 * _989;
    float _1061 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1063 = _1001 * _1055;
    float _1065 = -_1001;
    float _1067 = _1065 + 1.0;
    float _1069 = _1057 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1071 = -_1051;
    float _1073 = _1071 + 1.0;
    float _1075 = _1019 * _1063;
    float _1077 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1033);
    float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1081 = _1069 + _1079;
    float _1083 = _1031 * _1073;
    float _1085 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1075);
    float _1087 = _1077 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1089 = _1003 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1091 = fma(_1059, _1039, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1093 = -_171;
    int _1095 = _1035 ? as_type<int>(_1093) : as_type<int>(_171);
    float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1099 = _1087 + _1097;
    float _1101 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1103 = _1089 + _1101;
    float _1105 = fma(_1091, _1083, _1085);
    float _1107 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1109 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1111 = _1099 * _1099;
    bool _1113 = !_967;
    float _1115 = _1113 ? _171 : as_type<float>(_1095);
    float _1117 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1109);
    float _1119 = fma(_1081, _1081, _1111);
    float _1121 = -_175;
    int _1123 = _1011 ? as_type<int>(_1121) : as_type<int>(_175);
    float _1125 = _1115 + 0.5;
    float _1127 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1117);
    float _1129 = fma(_1103, _1103, _1119);
    bool _1131 = !_973;
    float _1133 = _1131 ? _175 : as_type<float>(_1123);
    float _1135 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1137 = fma(_1051, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1105);
    bool _1139 = _1127 >= 0.0;
    float _1141 = _987 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = -_1133;
    float _1145 = _1143 + 0.5;
    float _1147 = rsqrt(_1129);
    float _1149 = _1135 * _1107;
    float _1151 = _919 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1153 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1155 = _983 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1157 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1159 = _1153 * _1061;
    float _1161 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1163 = _1127;
    float _1165 = _1157;
    if (_1139)
    {
        _1163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1167 = _1163;
    int _1169 = as_type<int>(_1167);
    if (_1139)
    {
        out.m_29.x = 0.0;
    }
    if (_1139)
    {
        float _1171 = _1167 * 5.0;
        _1169 = as_type<int>(_1171);
    }
    int _1173 = _1169;
    out.m_42.x = _1149;
    out.m_42.y = _1159;
    float _1175 = _1099 * _1147;
    float _1177 = _1081 * _1147;
    out.m_44.x = _1155;
    out.m_44.y = _1141;
    out.m_44.z = _1157;
    out.m_44.w = _1161;
    if (_1139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3216 = as_type<float>(_1173);
        out.gl_Position.z = _3216;
    }
    if (_1139)
    {
        return out;
    }
    float _1179 = -_1175;
    float _1181 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1087);
    float _1183 = _1103 * _1147;
    float _1185 = -_1177;
    float _1187 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1069);
    float _1189 = -_1175;
    float _1191 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1099);
    float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1195 = _1181 + _1193;
    float _1197 = -_1183;
    float _1199 = fma(_1197, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1089);
    float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1203 = _1187 + _1201;
    float _1205 = -_1177;
    float _1207 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1081);
    float _1209 = _1195 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1211 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1213 = _1199 + _1211;
    float _1215 = -_1183;
    float _1217 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1103);
    float _1219 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1209);
    float _1221 = _1191 * _1191;
    float _1223 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1219);
    float _1225 = fma(_1207, _1207, _1221);
    bool _1227 = _1223 >= 0.0;
    float _1229 = fma(_1217, _1217, _1225);
    float _1231 = sqrt(_1229);
    if (_1227)
    {
        _1165 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1233 = _1165;
    int _1235 = as_type<int>(_1233);
    if (_1227)
    {
        out.m_29.x = 0.0;
    }
    if (_1227)
    {
        float _1237 = _1233 * 5.0;
        _1235 = as_type<int>(_1237);
    }
    int _1239 = _1235;
    if (_1227)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3340 = as_type<float>(_1239);
        out.gl_Position.z = _3340;
    }
    float _1241 = _1147 * _1231;
    if (_1227)
    {
        return out;
    }
    float _1243 = _457 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1245 = _455 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1247 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _175);
    float _1249 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _171);
    float _1251 = _1241 * _1243;
    float _1253 = _1241 * _1245;
    float _1255 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1257 = _1255 * 0.5;
    float _1259 = _1247 * _1251;
    float _1261 = _1249 * _1253;
    float _1263 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1265 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1267 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1269 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1263);
    float _1271 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1265);
    float _1273 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1267);
    float _1275 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1269);
    float _1277 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1271);
    float _1279 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1273);
    float _1281 = _1275 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1283 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1285 = _1279 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1287 = _1087 + _1281;
    float _1289 = _1069 + _1283;
    float _1291 = _1089 + _1285;
    float _1293 = -_1175;
    float _1295 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1287);
    float _1297 = -_1177;
    float _1299 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1289);
    float _1301 = -_1183;
    float _1303 = fma(_1301, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1291);
    float _1305 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1307 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1309 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1311 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1305);
    float _1313 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1315 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1307);
    float _1317 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1309);
    float _1319 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1311);
    float _1321 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1313);
    float _1323 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1315);
    float _1325 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1317);
    float _1327 = _1319 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1329 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1321);
    float _1331 = _1323 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1333 = _1325 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1335 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1337 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1339 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1341 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1343 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1335);
    float _1345 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1337);
    float _1347 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1339);
    float _1349 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1341);
    float _1351 = _1329 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1353 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1343);
    float _1355 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1345);
    float _1357 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1347);
    float _1359 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1349);
    float _1361 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1353);
    float _1363 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1355);
    float _1365 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1357);
    float _1367 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1359);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _1363;
    out.gl_Position.y = _1365;
    out.gl_Position.z = _1361;
    out.gl_Position.w = _1367;
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
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    bool _941 = false;
    bool _773 = false;
    bool _593 = false;
    bool _479 = false;
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
        float _1424 = as_type<float>(_79);
        out.gl_Position.z = _1424;
    }
    if (!_67)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1493 = as_type<float>(_115);
        out.gl_Position.z = _1493;
    }
    if (_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = _285 + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _303;
    bool _307 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _309 = isnan(_285);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = 1.0 / _297;
    float _321 = -_317;
    float _323 = _321 + 1.0;
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _327 = 1.0 / _301;
    float _329 = 1.0 / _305;
    float _331 = _289 * _319;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _335 = _285 + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _337;
    float _341 = _335 * _327;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _343;
    float _347 = fma(_339, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _353 = fma(_345, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _355 = _293 * _329;
    bool _357 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _359 = isnan(_285);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    bool _369 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _371 = isnan(_285);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = _367 * _323;
    bool _383 = _285 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _385 = isnan(_285);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = -_367;
    float _397 = _395 + 1.0;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _403 = -_379;
    float _405 = _403 + 1.0;
    float _407 = _379 * _397;
    float _409 = fma(_401, _341, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _411 = fma(_351, _341, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _413 = _393 * _405;
    float _415 = in.m_36.x;
    float _417 = in.m_36.y;
    float _419 = -_393;
    float _421 = _419 + 1.0;
    float _423 = _347 * _413;
    float _425 = _353 * _413;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _431;
    float _435 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[143].x, _423);
    float _437 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[143].y, _425);
    float _439 = fma(_429, _355, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _441 = fma(_433, _355, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _443 = fma(_409, _407, _435);
    float _445 = fma(_411, _407, _437);
    float _447 = fma(_439, _381, _443);
    float _449 = fma(_441, _381, _445);
    float _451 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[146].x, _447);
    float _453 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[146].y, _449);
    float _455 = _451 * _415;
    float _457 = _453 * _417;
    bool _459 = !_325;
    float _477;
    if (!_459)
    {
        float _461 = in.m_38.x;
        float _463 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _465 = _461 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _467 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[11].x, _97);
        float _469 = _467 * _463;
        float _471 = floor(_469);
        float _473 = -_471;
        float _475 = _469 + _473;
        _477 = _475;
        _479 = true;
    }
    else
    {
        float _481 = float(_63);
        float _483 = 1.0 / _481;
        float _485 = _97 * _483;
        _477 = _485;
    }
    _479 = false;
    float _487 = _477;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _491 = _487 + _489;
    bool _493 = _487 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _495 = isnan(_487);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _505;
    bool _509 = _487 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _511 = isnan(_487);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = -_503;
    float _523 = _521 + 1.0;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _525;
    float _529 = 1.0 / _507;
    bool _531 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _533 = _519 * _523;
    float _535 = -_519;
    float _537 = _535 + 1.0;
    float _539 = _491 * _529;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _541;
    float _545 = fma(_527, _539, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _547;
    float _551 = fma(_543, _539, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _553 = _545 * _533;
    float _555 = fma(_549, _539, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _557 = _551 * _533;
    float _559 = _555 * _533;
    float _561 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[107].x, _553);
    float _563 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[107].y, _559);
    float _565 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[107].z, _557);
    float _567 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[108].x, _561);
    float _569 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[108].y, _563);
    float _571 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[108].z, _565);
    bool _573 = !_531;
    float _591;
    if (!_573)
    {
        float _575 = in.m_38.x;
        float _577 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _579 = _575 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _581 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[11].y, _97);
        float _583 = _581 * _577;
        float _585 = floor(_583);
        float _587 = -_585;
        float _589 = _583 + _587;
        _591 = _589;
        _593 = true;
    }
    else
    {
        float _595 = float(_63);
        float _597 = 1.0 / _595;
        float _599 = _97 * _597;
        _591 = _599;
    }
    _593 = false;
    float _601 = _591;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _605 = _601 + _603;
    float _607 = _567 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _617 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _619 = isnan(_601);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _633 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _635 = isnan(_601);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = 1.0 / _611;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _647;
    float _651 = -_627;
    float _653 = _651 + 1.0;
    bool _655 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _657 = isnan(_601);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = _569 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _669 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _671 = 1.0 / _615;
    float _673 = 1.0 / _631;
    float _675 = _649 * _645;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _679 = _677 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _681 = _643 * _653;
    float _683 = -_643;
    float _685 = _683 + 1.0;
    float _687 = fma(_675, _605, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _689;
    float _693 = _665 * _685;
    float _695 = _679 * _671;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _699 = _601 + _697;
    bool _701 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _703 = isnan(_601);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = _687 * _693;
    float _715 = -_665;
    float _717 = _715 + 1.0;
    float _719 = fma(_695, _699, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _723 = _601 + _721;
    float _725 = _691 * _673;
    float _727 = -_711;
    float _729 = _727 + 1.0;
    float _731 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[115].x, _713);
    float _733 = _571 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _735 = fma(_725, _723, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _737 = _627 * _729;
    float _739 = fma(_719, _681, _731);
    float _741 = _607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _743 = _733 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _745 = fma(_735, _737, _739);
    float _747 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[118].x, _745);
    float _749 = _667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _751 = _747 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_40.x = _741;
    out.m_40.y = _749;
    out.m_40.z = _743;
    out.m_40.w = _751;
    bool _753 = !_669;
    float _771;
    if (!_753)
    {
        float _755 = in.m_38.x;
        float _757 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _759 = _755 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _761 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[11].z, _97);
        float _763 = _761 * _757;
        float _765 = floor(_763);
        float _767 = -_765;
        float _769 = _763 + _767;
        _771 = _769;
        _773 = true;
    }
    else
    {
        float _775 = float(_63);
        float _777 = 1.0 / _775;
        float _779 = _97 * _777;
        _771 = _779;
    }
    _773 = false;
    float _781 = _771;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _785 = _781 + _783;
    bool _787 = _781 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _789 = isnan(_781);
    bool _791 = _787 || _789;
    bool _793 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _795 = _791 || _793;
    float _797 = float(_795);
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _801 = _781 + _799;
    bool _803 = _781 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _805 = isnan(_781);
    bool _807 = _803 || _805;
    bool _809 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _811 = _807 || _809;
    float _813 = float(_811);
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _815;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _823 = _781 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _825 = isnan(_781);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = -_797;
    float _837 = _835 + 1.0;
    float _839 = 1.0 / _821;
    float _841 = _833 * _837;
    float _843 = -_833;
    float _845 = _843 + 1.0;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _847;
    bool _851 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _853 = 1.0 / _817;
    float _855 = _813 * _845;
    float _857 = -_813;
    float _859 = _857 + 1.0;
    float _861 = _801 * _839;
    float _863 = _785 * _853;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _865;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _869;
    float _873 = fma(_849, _863, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _875 = fma(_867, _863, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _877 = fma(_871, _863, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _879 = _873 * _855;
    float _881 = _875 * _855;
    float _883 = _877 * _855;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _887 = _885 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _891 = _889 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _897 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[123].x, _879);
    float _899 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[123].y, _881);
    float _901 = fma(_887, _861, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _903 = fma(_891, _861, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _905 = fma(_895, _861, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _907 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[123].z, _883);
    float _909 = fma(_901, _841, _897);
    float _911 = fma(_903, _841, _899);
    float _913 = fma(_905, _841, _907);
    float _915 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[125].x, _909);
    float _917 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[125].y, _911);
    float _919 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[125].z, _913);
    bool _921 = !_851;
    float _939;
    if (!_921)
    {
        float _923 = in.m_38.x;
        float _925 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _927 = _923 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _929 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[11].w, _97);
        float _931 = _929 * _925;
        float _933 = floor(_931);
        float _935 = -_933;
        float _937 = _931 + _935;
        _939 = _937;
        _941 = true;
    }
    else
    {
        float _943 = float(_63);
        float _945 = 1.0 / _943;
        float _947 = _97 * _945;
        _939 = _947;
    }
    _941 = false;
    float _949 = _939;
    float _951 = in.m_38.x;
    float _953 = in.m_38.y;
    float _955 = _253 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _961;
    int _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _967 = _965 != 0;
    float _969 = 1.0 / _959;
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _973 = _971 != 0;
    float _975 = _253 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _979 = _977 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _981 = fma(_251, (*spvDescriptorSet0.vp_c10)._m0[6].x, _955);
    float _983 = _915 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _985 = fma(_251, (*spvDescriptorSet0.vp_c10)._m0[4].x, _975);
    float _987 = _917 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _989 = 1.0 / _979;
    bool _991 = _949 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _993 = isnan(_949);
    bool _995 = _991 || _993;
    bool _997 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _999 = _995 || _997;
    float _1001 = float(_999);
    float _1003 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[6].z, _981);
    float _1005 = _963 * _969;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1009 = _949 + _1007;
    bool _1011 = _953 > 0.5;
    float _1013 = _253 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1019 = fma(_1005, _1009, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1021 = _949 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1023 = isnan(_949);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1029 = _1025 || _1027;
    float _1031 = float(_1029);
    float _1033 = fma(_251, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1013);
    bool _1035 = _951 > 0.5;
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1039 = _949 + _1037;
    bool _1041 = _949 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1043 = isnan(_949);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1049 = _1045 || _1047;
    float _1051 = float(_1049);
    float _1053 = -_1031;
    float _1055 = _1053 + 1.0;
    float _1057 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[4].z, _985);
    float _1059 = _1017 * _989;
    float _1061 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1063 = _1001 * _1055;
    float _1065 = -_1001;
    float _1067 = _1065 + 1.0;
    float _1069 = _1057 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1071 = -_1051;
    float _1073 = _1071 + 1.0;
    float _1075 = _1019 * _1063;
    float _1077 = fma(_255, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1033);
    float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1081 = _1069 + _1079;
    float _1083 = _1031 * _1073;
    float _1085 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1075);
    float _1087 = _1077 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1089 = _1003 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1091 = fma(_1059, _1039, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1093 = -_171;
    int _1095 = _1035 ? as_type<int>(_1093) : as_type<int>(_171);
    float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1099 = _1087 + _1097;
    float _1101 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1103 = _1089 + _1101;
    float _1105 = fma(_1091, _1083, _1085);
    float _1107 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1109 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1111 = _1099 * _1099;
    bool _1113 = !_967;
    float _1115 = _1113 ? _171 : as_type<float>(_1095);
    float _1117 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1109);
    float _1119 = fma(_1081, _1081, _1111);
    float _1121 = -_175;
    int _1123 = _1011 ? as_type<int>(_1121) : as_type<int>(_175);
    float _1125 = _1115 + 0.5;
    float _1127 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1117);
    float _1129 = fma(_1103, _1103, _1119);
    bool _1131 = !_973;
    float _1133 = _1131 ? _175 : as_type<float>(_1123);
    float _1135 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1137 = fma(_1051, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1105);
    bool _1139 = _1127 >= 0.0;
    float _1141 = _987 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = -_1133;
    float _1145 = _1143 + 0.5;
    float _1147 = rsqrt(_1129);
    float _1149 = _1135 * _1107;
    float _1151 = _919 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1153 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1155 = _983 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1157 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1159 = _1153 * _1061;
    float _1161 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1163 = _1127;
    float _1165 = _1157;
    if (_1139)
    {
        _1163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1167 = _1163;
    int _1169 = as_type<int>(_1167);
    if (_1139)
    {
        out.m_29.x = 0.0;
    }
    if (_1139)
    {
        float _1171 = _1167 * 5.0;
        _1169 = as_type<int>(_1171);
    }
    int _1173 = _1169;
    out.m_42.x = _1149;
    out.m_42.y = _1159;
    float _1175 = _1099 * _1147;
    float _1177 = _1081 * _1147;
    out.m_44.x = _1155;
    out.m_44.y = _1141;
    out.m_44.z = _1157;
    out.m_44.w = _1161;
    if (_1139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3216 = as_type<float>(_1173);
        out.gl_Position.z = _3216;
    }
    if (_1139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1179 = -_1175;
    float _1181 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1087);
    float _1183 = _1103 * _1147;
    float _1185 = -_1177;
    float _1187 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1069);
    float _1189 = -_1175;
    float _1191 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1099);
    float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1195 = _1181 + _1193;
    float _1197 = -_1183;
    float _1199 = fma(_1197, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1089);
    float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1203 = _1187 + _1201;
    float _1205 = -_1177;
    float _1207 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1081);
    float _1209 = _1195 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1211 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1213 = _1199 + _1211;
    float _1215 = -_1183;
    float _1217 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1103);
    float _1219 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1209);
    float _1221 = _1191 * _1191;
    float _1223 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1219);
    float _1225 = fma(_1207, _1207, _1221);
    bool _1227 = _1223 >= 0.0;
    float _1229 = fma(_1217, _1217, _1225);
    float _1231 = sqrt(_1229);
    if (_1227)
    {
        _1165 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1233 = _1165;
    int _1235 = as_type<int>(_1233);
    if (_1227)
    {
        out.m_29.x = 0.0;
    }
    if (_1227)
    {
        float _1237 = _1233 * 5.0;
        _1235 = as_type<int>(_1237);
    }
    int _1239 = _1235;
    if (_1227)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3340 = as_type<float>(_1239);
        out.gl_Position.z = _3340;
    }
    float _1241 = _1147 * _1231;
    if (_1227)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1243 = _457 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1245 = _455 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1247 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _175);
    float _1249 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _171);
    float _1251 = _1241 * _1243;
    float _1253 = _1241 * _1245;
    float _1255 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1257 = _1255 * 0.5;
    float _1259 = _1247 * _1251;
    float _1261 = _1249 * _1253;
    float _1263 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1265 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1267 = _1259 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1269 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1263);
    float _1271 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1265);
    float _1273 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1267);
    float _1275 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1269);
    float _1277 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1271);
    float _1279 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1273);
    float _1281 = _1275 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1283 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1285 = _1279 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1287 = _1087 + _1281;
    float _1289 = _1069 + _1283;
    float _1291 = _1089 + _1285;
    float _1293 = -_1175;
    float _1295 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1287);
    float _1297 = -_1177;
    float _1299 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1289);
    float _1301 = -_1183;
    float _1303 = fma(_1301, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1291);
    float _1305 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1307 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1309 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1311 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1305);
    float _1313 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1315 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1307);
    float _1317 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1309);
    float _1319 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1311);
    float _1321 = fma(_1299, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1313);
    float _1323 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1315);
    float _1325 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1317);
    float _1327 = _1319 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1329 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1321);
    float _1331 = _1323 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1333 = _1325 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1335 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1337 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1339 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1341 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1343 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1335);
    float _1345 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1337);
    float _1347 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1339);
    float _1349 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1341);
    float _1351 = _1329 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1353 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1343);
    float _1355 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1345);
    float _1357 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1347);
    float _1359 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1349);
    float _1361 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1353);
    float _1363 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1355);
    float _1365 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1357);
    float _1367 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1359);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _1363;
    out.gl_Position.y = _1365;
    out.gl_Position.z = _1361;
    out.gl_Position.w = _1367;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

