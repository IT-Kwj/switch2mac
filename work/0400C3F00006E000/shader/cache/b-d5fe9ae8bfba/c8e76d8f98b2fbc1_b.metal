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
};

struct main0_out
{
    float4 m_42 [[user(locn0)]];
    float4 m_31 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_28 [[attribute(2)]];
    float4 m_33 [[attribute(3)]];
    float4 m_35 [[attribute(4)]];
    float4 m_40 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _371 = false;
    bool _225 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_28.w;
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
        out.m_31.x = 0.0;
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
        float _1038 = as_type<float>(_79);
        out.gl_Position.z = _1038;
    }
    if (!_67)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _83 = in.m_33.w;
    bool _85 = _83 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _87 = isnan(_83);
    bool _89 = _85 || _87;
    bool _91 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _93 = _89 || _91;
    float _95 = -_83;
    float _97 = _95 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _99 = 0.0;
    if (_93)
    {
        float _101 = float(_63);
        _99 = _101;
    }
    float _103 = _99;
    bool _105 = _97 >= _103;
    bool _107 = !_93;
    bool _109 = _105 || _107;
    if (_109)
    {
        _73 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _73;
    if (_109)
    {
        out.m_31.x = 0.0;
    }
    if (_109)
    {
        float _113 = _111 * 5.0;
        _81 = as_type<int>(_113);
    }
    int _115 = _81;
    if (_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1106 = as_type<float>(_115);
        out.gl_Position.z = _1106;
    }
    if (_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _117 = in.m_35.x;
    float _119 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _121 = _97 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _125 = _123 != 0;
    int _127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _129 = _127 != 0;
    int _131 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _133 = _131 != 0;
    bool _135 = !_129;
    int _137 = _135 ? 0 : 1;
    float _139 = _121 * _119;
    int _141 = abs(_137);
    float _143 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[20].x, _139);
    float _145 = floor(_143);
    float _147 = _143 * 6.283185482025146484375;
    float _149 = _147 * 0.15915493667125701904296875;
    bool _151 = !_125;
    int _153 = _151 ? 0 : 1;
    int _155 = abs(_153);
    float _157 = _149 * 6.283185482025146484375;
    float _159 = cos(_157);
    float _161 = -_145;
    float _163 = _143 + _161;
    bool _165 = !_133;
    int _167 = _165 ? 0 : 1;
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _171 = -_163;
    float _173 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _175 = abs(_167);
    float _177 = float(_155);
    float _179 = fma(_159, 0.5, 0.5);
    float _181 = abs(_173);
    float _183 = _177 * _181;
    bool _185 = _163 < 0.5;
    float _187 = float(_185);
    float _189 = -_179;
    float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _193 = float(_175);
    float _195 = -_187;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _199 = float(_141);
    float _201 = fma(_193, _191, _183);
    float _203 = abs(_197);
    float _205 = fma(_199, _203, _201);
    bool _207 = !_169;
    float _223;
    if (!_207)
    {
        float _209 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _211 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _215 = _213 * _209;
        float _217 = floor(_215);
        float _219 = -_217;
        float _221 = _215 + _219;
        _223 = _221;
        _225 = true;
    }
    else
    {
        float _227 = float(_63);
        float _229 = 1.0 / _227;
        float _231 = _97 * _229;
        _223 = _231;
    }
    _225 = false;
    float _233 = _223;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = _233 + _235;
    bool _239 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _241 = isnan(_233);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    bool _251 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _253 = isnan(_233);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _269 = _267 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _271 = -_249;
    float _273 = _271 + 1.0;
    float _275 = 1.0 / _265;
    bool _277 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _279 = isnan(_233);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = _261 * _273;
    float _291 = -_261;
    float _293 = _291 + 1.0;
    bool _295 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _297 = _287 * _293;
    float _299 = 1.0 / _269;
    float _301 = -_287;
    float _303 = _301 + 1.0;
    float _305 = _237 * _275;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _309 = _233 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _315;
    float _319 = fma(_313, _305, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _321 = fma(_317, _305, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _323 = _309 * _299;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _329 = _319 * _297;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _335 = _321 * _297;
    float _337 = fma(_327, _323, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _339 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[143].x, _329);
    float _341 = fma(_333, _323, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _343 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[143].y, _335);
    float _345 = fma(_337, _289, _339);
    float _347 = fma(_341, _289, _343);
    float _349 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[145].x, _345);
    float _351 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[145].y, _347);
    bool _353 = !_295;
    float _369;
    if (!_353)
    {
        float _355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _357 = _117 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[11].x, _97);
        float _361 = _359 * _355;
        float _363 = floor(_361);
        float _365 = -_363;
        float _367 = _361 + _365;
        _369 = _367;
        _371 = true;
    }
    else
    {
        float _373 = float(_63);
        float _375 = 1.0 / _373;
        float _377 = _97 * _375;
        _369 = _377;
    }
    _371 = false;
    float _379 = _369;
    float _381 = as_type<float>(int(gl_VertexIndex));
    float _383 = in.m_28.x;
    float _385 = in.m_28.y;
    float _387 = in.m_28.z;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _397 = in.m_40.x;
    float _399 = in.m_40.y;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _401;
    float _405 = 1.0 / _391;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _411;
    bool _415 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _417 = isnan(_379);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    bool _427 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _429 = isnan(_379);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = 1.0 / _395;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _441;
    int _445 = as_type<int>(_381) & 1;
    bool _447 = _445 != 0;
    int _449 = as_type<int>(_381) & 2;
    bool _451 = _449 != 0;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _453;
    float _457 = 1.0 / _403;
    float _459 = _385 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _461 = _385 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _463 = !_447;
    float _465 = _463 ? (-0.5) : 0.5;
    float _467 = _349 * _397;
    float _469 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[5].x, _459);
    float _471 = 1.0 / _409;
    float _473 = _351 * _399;
    float _475 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[6].x, _461);
    float _477 = _205 * _467;
    float _479 = _205 * _473;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _483 = _379 + _481;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _487 = _379 + _485;
    float _489 = 1.0 / _413;
    float _491 = _385 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _493 = _483 * _457;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _497 = _379 + _495;
    float _499 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[4].x, _491);
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _503 = _379 + _501;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _507 = _379 + _505;
    float _509 = _497 * _471;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _511;
    float _515 = _503 * _405;
    float _517 = _507 * _439;
    float _519 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].z, _499);
    float _521 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].z, _469);
    float _523 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].z, _475);
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _537;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _545 = _487 * _489;
    float _547 = fma(_531, _509, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _549 = fma(_535, _509, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _551 = fma(_543, _509, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _553 = fma(_513, _493, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _555 = fma(_527, _493, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _557 = fma(_539, _493, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _559 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _561 = isnan(_379);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _571;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _575;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _579;
    bool _583 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _585 = isnan(_379);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _591 = _587 || _589;
    float _593 = float(_591);
    float _595 = fma(_573, _515, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _597 = fma(_577, _515, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _599 = fma(_581, _515, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _601 = -_569;
    float _603 = _601 + 1.0;
    bool _605 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _607 = isnan(_379);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _613 = _609 || _611;
    float _615 = float(_613);
    float _617 = -_593;
    float _619 = _617 + 1.0;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _625 = _593 * _603;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _631 = _615 * _619;
    float _633 = -_615;
    float _635 = _633 + 1.0;
    bool _637 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _639 = isnan(_379);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _653 = _477 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _655 = _425 * _635;
    float _657 = -_425;
    float _659 = _657 + 1.0;
    float _661 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _465);
    float _663 = fma(_623, _517, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _665 = fma(_629, _517, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _667 = fma(_651, _517, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _669 = -_647;
    float _671 = _669 + 1.0;
    float _673 = _647 * _659;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _675;
    float _679 = fma(_443, _545, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _681 = _653 * _661;
    float _683 = _437 * _671;
    float _685 = fma(_677, _545, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    bool _687 = !_451;
    float _689 = _687 ? (-0.5) : 0.5;
    float _691 = -_437;
    float _693 = _691 + 1.0;
    float _695 = _553 * _683;
    float _697 = _479 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _699 = _557 * _683;
    float _701 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _689);
    float _703 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[107].x, _695);
    float _705 = _521 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _707 = _519 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _709 = _697 * _701;
    float _711 = fma(_547, _673, _703);
    float _713 = _705 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _715 = _555 * _683;
    float _717 = _709 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _719 = _709 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _721 = _709 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _723 = _523 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _725 = fma(_707, (*spvDescriptorSet0.vp_c8)._m0[11].x, _713);
    float _727 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[107].y, _715);
    float _729 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[107].z, _699);
    float _731 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[24].x, _717);
    float _733 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[11].z, _725);
    float _735 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[25].x, _719);
    float _737 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[26].x, _721);
    float _739 = fma(_549, _673, _727);
    float _741 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _743 = fma(_551, _673, _729);
    float _745 = _705 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _747 = _733 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _749 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[24].z, _731);
    float _751 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[25].z, _735);
    float _753 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[26].z, _737);
    float _755 = fma(_597, _655, _739);
    float _757 = fma(_707, (*spvDescriptorSet0.vp_c8)._m0[10].x, _745);
    float _759 = 1.0 / _747;
    float _761 = fma(_595, _655, _711);
    float _763 = fma(_599, _655, _743);
    float _765 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[10].z, _757);
    float _767 = _751 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _769 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _771 = isnan(0.5);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _777 = _773 || _775;
    float _779 = _749 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _781 = _765 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _783 = _705 + _767;
    float _785 = fma(_455, _545, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _787 = fma(_663, _631, _761);
    float _789 = _781 + _747;
    float _791 = fma(_665, _631, _755);
    float _793 = fma(_667, _631, _763);
    float _795 = _753 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _797 = _707 + _779;
    float _799 = _789 * _759;
    float _801 = _799 * 0.5;
    float _803 = _783 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _805 = _723 + _795;
    float _807 = fma(_685, _625, _787);
    float _809 = fma(_679, _625, _791);
    float _811 = fma(_785, _625, _793);
    float _813 = _783 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _815 = _783 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _817 = _783 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _819 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[1].x, _803);
    float _821 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[112].x, _807);
    float _823 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[112].y, _809);
    float _825 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[112].z, _811);
    float _827 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[0].x, _813);
    float _829 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[2].x, _815);
    float _831 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[3].x, _817);
    float _833 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[1].z, _819);
    float _835 = _813;
    if (_777)
    {
        _835 = 1.0;
    }
    float _837 = _835;
    float _839 = _837;
    if (!_777)
    {
        float _841 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _843 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _845 = _841 * 0.15915493667125701904296875;
        float _847 = _843 * 0.15915493667125701904296875;
        float _849 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _851 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[30].w, _849);
        float _853 = _845 * 6.283185482025146484375;
        float _855 = cos(_853);
        float _857 = _845 * 6.283185482025146484375;
        float _859 = sin(_857);
        float _861 = 1.0 / _855;
        float _863 = _847 * 6.283185482025146484375;
        float _865 = cos(_863);
        float _867 = _859 * _861;
        float _869 = _847 * 6.283185482025146484375;
        float _871 = sin(_869);
        float _873 = _865 * _867;
        float _875 = 1.0 / _851;
        float _877 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _879 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _877;
        float _881 = 1.0 / _873;
        float _883 = 1.0 / _879;
        float _885 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _887 = _875 * _885;
        float _889 = _871 * _881;
        float _891 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _893 = fma(_889, _887, _891);
        float _895 = _893 * _883;
        float _897 = precise::clamp(_895, 0.0, 1.0);
        float _899 = -_897;
        float _901 = _899 + 1.0;
        _839 = _901;
    }
    float _903 = _839;
    float _905 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[0].z, _827);
    float _907 = _833 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _909 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[2].z, _829);
    float _911 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[3].z, _831);
    float _913 = _905 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _915 = _907 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _917 = _907 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _919 = _907 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _921 = _907 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _923 = _909 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _925 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[4].x, _915);
    float _927 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[5].x, _917);
    float _929 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[6].x, _919);
    float _931 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[7].x, _921);
    float _933 = _911 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _935 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[4].z, _925);
    float _937 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[5].z, _927);
    float _939 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[6].z, _929);
    float _941 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[7].z, _931);
    float _943 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[4].w, _935);
    float _945 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[5].w, _937);
    float _947 = _821 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _949 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[6].w, _939);
    float _951 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[7].w, _941);
    bool _953 = _903 > 0.0;
    bool _955 = isnan(_903);
    bool _957 = _953 || _955;
    bool _959 = isnan(0.0);
    bool _961 = _957 || _959;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _965 = _823 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _967 = _947 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _969 = _825 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _971 = _949 + _951;
    float _973 = _965 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _975 = _903 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _977 = _969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _979 = _971 * 0.5;
    out.gl_Position.x = _943;
    out.gl_Position.y = _945;
    out.gl_Position.z = _949;
    out.gl_Position.w = _951;
    out.m_42.x = _967;
    out.m_42.y = _973;
    out.m_42.z = _977;
    out.m_42.w = _963;
    out.m_31.x = _975;
    out.m_44.z = _979;
    out.m_44.w = _951;
    if (_961)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_31.x = 0.0;
    float _981 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _981;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _371 = false;
    bool _225 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_28.w;
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
        out.m_31.x = 0.0;
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
        float _1038 = as_type<float>(_79);
        out.gl_Position.z = _1038;
    }
    if (!_67)
    {
        return out;
    }
    float _83 = in.m_33.w;
    bool _85 = _83 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _87 = isnan(_83);
    bool _89 = _85 || _87;
    bool _91 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _93 = _89 || _91;
    float _95 = -_83;
    float _97 = _95 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _99 = 0.0;
    if (_93)
    {
        float _101 = float(_63);
        _99 = _101;
    }
    float _103 = _99;
    bool _105 = _97 >= _103;
    bool _107 = !_93;
    bool _109 = _105 || _107;
    if (_109)
    {
        _73 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _73;
    if (_109)
    {
        out.m_31.x = 0.0;
    }
    if (_109)
    {
        float _113 = _111 * 5.0;
        _81 = as_type<int>(_113);
    }
    int _115 = _81;
    if (_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1106 = as_type<float>(_115);
        out.gl_Position.z = _1106;
    }
    if (_109)
    {
        return out;
    }
    float _117 = in.m_35.x;
    float _119 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _121 = _97 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _125 = _123 != 0;
    int _127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _129 = _127 != 0;
    int _131 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _133 = _131 != 0;
    bool _135 = !_129;
    int _137 = _135 ? 0 : 1;
    float _139 = _121 * _119;
    int _141 = abs(_137);
    float _143 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[20].x, _139);
    float _145 = floor(_143);
    float _147 = _143 * 6.283185482025146484375;
    float _149 = _147 * 0.15915493667125701904296875;
    bool _151 = !_125;
    int _153 = _151 ? 0 : 1;
    int _155 = abs(_153);
    float _157 = _149 * 6.283185482025146484375;
    float _159 = cos(_157);
    float _161 = -_145;
    float _163 = _143 + _161;
    bool _165 = !_133;
    int _167 = _165 ? 0 : 1;
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _171 = -_163;
    float _173 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _175 = abs(_167);
    float _177 = float(_155);
    float _179 = fma(_159, 0.5, 0.5);
    float _181 = abs(_173);
    float _183 = _177 * _181;
    bool _185 = _163 < 0.5;
    float _187 = float(_185);
    float _189 = -_179;
    float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _193 = float(_175);
    float _195 = -_187;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _199 = float(_141);
    float _201 = fma(_193, _191, _183);
    float _203 = abs(_197);
    float _205 = fma(_199, _203, _201);
    bool _207 = !_169;
    float _223;
    if (!_207)
    {
        float _209 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _211 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _215 = _213 * _209;
        float _217 = floor(_215);
        float _219 = -_217;
        float _221 = _215 + _219;
        _223 = _221;
        _225 = true;
    }
    else
    {
        float _227 = float(_63);
        float _229 = 1.0 / _227;
        float _231 = _97 * _229;
        _223 = _231;
    }
    _225 = false;
    float _233 = _223;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = _233 + _235;
    bool _239 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _241 = isnan(_233);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    bool _251 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _253 = isnan(_233);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _269 = _267 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _271 = -_249;
    float _273 = _271 + 1.0;
    float _275 = 1.0 / _265;
    bool _277 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _279 = isnan(_233);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = _261 * _273;
    float _291 = -_261;
    float _293 = _291 + 1.0;
    bool _295 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _297 = _287 * _293;
    float _299 = 1.0 / _269;
    float _301 = -_287;
    float _303 = _301 + 1.0;
    float _305 = _237 * _275;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _309 = _233 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _315;
    float _319 = fma(_313, _305, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _321 = fma(_317, _305, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _323 = _309 * _299;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _329 = _319 * _297;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _335 = _321 * _297;
    float _337 = fma(_327, _323, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _339 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[143].x, _329);
    float _341 = fma(_333, _323, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _343 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[143].y, _335);
    float _345 = fma(_337, _289, _339);
    float _347 = fma(_341, _289, _343);
    float _349 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[145].x, _345);
    float _351 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[145].y, _347);
    bool _353 = !_295;
    float _369;
    if (!_353)
    {
        float _355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _357 = _117 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[11].x, _97);
        float _361 = _359 * _355;
        float _363 = floor(_361);
        float _365 = -_363;
        float _367 = _361 + _365;
        _369 = _367;
        _371 = true;
    }
    else
    {
        float _373 = float(_63);
        float _375 = 1.0 / _373;
        float _377 = _97 * _375;
        _369 = _377;
    }
    _371 = false;
    float _379 = _369;
    float _381 = as_type<float>(int(gl_VertexIndex));
    float _383 = in.m_28.x;
    float _385 = in.m_28.y;
    float _387 = in.m_28.z;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _397 = in.m_40.x;
    float _399 = in.m_40.y;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _401;
    float _405 = 1.0 / _391;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _411;
    bool _415 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _417 = isnan(_379);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    bool _427 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _429 = isnan(_379);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = 1.0 / _395;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _441;
    int _445 = as_type<int>(_381) & 1;
    bool _447 = _445 != 0;
    int _449 = as_type<int>(_381) & 2;
    bool _451 = _449 != 0;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _453;
    float _457 = 1.0 / _403;
    float _459 = _385 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _461 = _385 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _463 = !_447;
    float _465 = _463 ? (-0.5) : 0.5;
    float _467 = _349 * _397;
    float _469 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[5].x, _459);
    float _471 = 1.0 / _409;
    float _473 = _351 * _399;
    float _475 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[6].x, _461);
    float _477 = _205 * _467;
    float _479 = _205 * _473;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _483 = _379 + _481;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _487 = _379 + _485;
    float _489 = 1.0 / _413;
    float _491 = _385 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _493 = _483 * _457;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _497 = _379 + _495;
    float _499 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[4].x, _491);
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _503 = _379 + _501;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _507 = _379 + _505;
    float _509 = _497 * _471;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _511;
    float _515 = _503 * _405;
    float _517 = _507 * _439;
    float _519 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].z, _499);
    float _521 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].z, _469);
    float _523 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].z, _475);
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _537;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _545 = _487 * _489;
    float _547 = fma(_531, _509, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _549 = fma(_535, _509, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _551 = fma(_543, _509, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _553 = fma(_513, _493, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _555 = fma(_527, _493, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _557 = fma(_539, _493, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _559 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _561 = isnan(_379);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _571;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _575;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _579;
    bool _583 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _585 = isnan(_379);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _591 = _587 || _589;
    float _593 = float(_591);
    float _595 = fma(_573, _515, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _597 = fma(_577, _515, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _599 = fma(_581, _515, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _601 = -_569;
    float _603 = _601 + 1.0;
    bool _605 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _607 = isnan(_379);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _613 = _609 || _611;
    float _615 = float(_613);
    float _617 = -_593;
    float _619 = _617 + 1.0;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _625 = _593 * _603;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _631 = _615 * _619;
    float _633 = -_615;
    float _635 = _633 + 1.0;
    bool _637 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _639 = isnan(_379);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _653 = _477 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _655 = _425 * _635;
    float _657 = -_425;
    float _659 = _657 + 1.0;
    float _661 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _465);
    float _663 = fma(_623, _517, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _665 = fma(_629, _517, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _667 = fma(_651, _517, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _669 = -_647;
    float _671 = _669 + 1.0;
    float _673 = _647 * _659;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _675;
    float _679 = fma(_443, _545, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _681 = _653 * _661;
    float _683 = _437 * _671;
    float _685 = fma(_677, _545, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    bool _687 = !_451;
    float _689 = _687 ? (-0.5) : 0.5;
    float _691 = -_437;
    float _693 = _691 + 1.0;
    float _695 = _553 * _683;
    float _697 = _479 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _699 = _557 * _683;
    float _701 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _689);
    float _703 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[107].x, _695);
    float _705 = _521 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _707 = _519 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _709 = _697 * _701;
    float _711 = fma(_547, _673, _703);
    float _713 = _705 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _715 = _555 * _683;
    float _717 = _709 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _719 = _709 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _721 = _709 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _723 = _523 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _725 = fma(_707, (*spvDescriptorSet0.vp_c8)._m0[11].x, _713);
    float _727 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[107].y, _715);
    float _729 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[107].z, _699);
    float _731 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[24].x, _717);
    float _733 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[11].z, _725);
    float _735 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[25].x, _719);
    float _737 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[26].x, _721);
    float _739 = fma(_549, _673, _727);
    float _741 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _743 = fma(_551, _673, _729);
    float _745 = _705 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _747 = _733 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _749 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[24].z, _731);
    float _751 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[25].z, _735);
    float _753 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[26].z, _737);
    float _755 = fma(_597, _655, _739);
    float _757 = fma(_707, (*spvDescriptorSet0.vp_c8)._m0[10].x, _745);
    float _759 = 1.0 / _747;
    float _761 = fma(_595, _655, _711);
    float _763 = fma(_599, _655, _743);
    float _765 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[10].z, _757);
    float _767 = _751 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _769 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _771 = isnan(0.5);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _777 = _773 || _775;
    float _779 = _749 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _781 = _765 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _783 = _705 + _767;
    float _785 = fma(_455, _545, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _787 = fma(_663, _631, _761);
    float _789 = _781 + _747;
    float _791 = fma(_665, _631, _755);
    float _793 = fma(_667, _631, _763);
    float _795 = _753 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _797 = _707 + _779;
    float _799 = _789 * _759;
    float _801 = _799 * 0.5;
    float _803 = _783 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _805 = _723 + _795;
    float _807 = fma(_685, _625, _787);
    float _809 = fma(_679, _625, _791);
    float _811 = fma(_785, _625, _793);
    float _813 = _783 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _815 = _783 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _817 = _783 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _819 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[1].x, _803);
    float _821 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[112].x, _807);
    float _823 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[112].y, _809);
    float _825 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[112].z, _811);
    float _827 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[0].x, _813);
    float _829 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[2].x, _815);
    float _831 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[3].x, _817);
    float _833 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[1].z, _819);
    float _835 = _813;
    if (_777)
    {
        _835 = 1.0;
    }
    float _837 = _835;
    float _839 = _837;
    if (!_777)
    {
        float _841 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _843 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _845 = _841 * 0.15915493667125701904296875;
        float _847 = _843 * 0.15915493667125701904296875;
        float _849 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _851 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[30].w, _849);
        float _853 = _845 * 6.283185482025146484375;
        float _855 = cos(_853);
        float _857 = _845 * 6.283185482025146484375;
        float _859 = sin(_857);
        float _861 = 1.0 / _855;
        float _863 = _847 * 6.283185482025146484375;
        float _865 = cos(_863);
        float _867 = _859 * _861;
        float _869 = _847 * 6.283185482025146484375;
        float _871 = sin(_869);
        float _873 = _865 * _867;
        float _875 = 1.0 / _851;
        float _877 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _879 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _877;
        float _881 = 1.0 / _873;
        float _883 = 1.0 / _879;
        float _885 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _887 = _875 * _885;
        float _889 = _871 * _881;
        float _891 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _893 = fma(_889, _887, _891);
        float _895 = _893 * _883;
        float _897 = precise::clamp(_895, 0.0, 1.0);
        float _899 = -_897;
        float _901 = _899 + 1.0;
        _839 = _901;
    }
    float _903 = _839;
    float _905 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[0].z, _827);
    float _907 = _833 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _909 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[2].z, _829);
    float _911 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[3].z, _831);
    float _913 = _905 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _915 = _907 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _917 = _907 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _919 = _907 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _921 = _907 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _923 = _909 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _925 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[4].x, _915);
    float _927 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[5].x, _917);
    float _929 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[6].x, _919);
    float _931 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[7].x, _921);
    float _933 = _911 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _935 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[4].z, _925);
    float _937 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[5].z, _927);
    float _939 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[6].z, _929);
    float _941 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[7].z, _931);
    float _943 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[4].w, _935);
    float _945 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[5].w, _937);
    float _947 = _821 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _949 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[6].w, _939);
    float _951 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[7].w, _941);
    bool _953 = _903 > 0.0;
    bool _955 = isnan(_903);
    bool _957 = _953 || _955;
    bool _959 = isnan(0.0);
    bool _961 = _957 || _959;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _965 = _823 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _967 = _947 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _969 = _825 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _971 = _949 + _951;
    float _973 = _965 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _975 = _903 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _977 = _969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _979 = _971 * 0.5;
    out.gl_Position.x = _943;
    out.gl_Position.y = _945;
    out.gl_Position.z = _949;
    out.gl_Position.w = _951;
    out.m_42.x = _967;
    out.m_42.y = _973;
    out.m_42.z = _977;
    out.m_42.w = _963;
    out.m_31.x = _975;
    out.m_44.z = _979;
    out.m_44.w = _951;
    if (_961)
    {
        return out;
    }
    out.m_31.x = 0.0;
    float _981 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _981;
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
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _371 = false;
    bool _225 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_28.w;
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
        out.m_31.x = 0.0;
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
        float _1038 = as_type<float>(_79);
        out.gl_Position.z = _1038;
    }
    if (!_67)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _83 = in.m_33.w;
    bool _85 = _83 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _87 = isnan(_83);
    bool _89 = _85 || _87;
    bool _91 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _93 = _89 || _91;
    float _95 = -_83;
    float _97 = _95 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _99 = 0.0;
    if (_93)
    {
        float _101 = float(_63);
        _99 = _101;
    }
    float _103 = _99;
    bool _105 = _97 >= _103;
    bool _107 = !_93;
    bool _109 = _105 || _107;
    if (_109)
    {
        _73 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _73;
    if (_109)
    {
        out.m_31.x = 0.0;
    }
    if (_109)
    {
        float _113 = _111 * 5.0;
        _81 = as_type<int>(_113);
    }
    int _115 = _81;
    if (_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1106 = as_type<float>(_115);
        out.gl_Position.z = _1106;
    }
    if (_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _117 = in.m_35.x;
    float _119 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _121 = _97 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _125 = _123 != 0;
    int _127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _129 = _127 != 0;
    int _131 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _133 = _131 != 0;
    bool _135 = !_129;
    int _137 = _135 ? 0 : 1;
    float _139 = _121 * _119;
    int _141 = abs(_137);
    float _143 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[20].x, _139);
    float _145 = floor(_143);
    float _147 = _143 * 6.283185482025146484375;
    float _149 = _147 * 0.15915493667125701904296875;
    bool _151 = !_125;
    int _153 = _151 ? 0 : 1;
    int _155 = abs(_153);
    float _157 = _149 * 6.283185482025146484375;
    float _159 = cos(_157);
    float _161 = -_145;
    float _163 = _143 + _161;
    bool _165 = !_133;
    int _167 = _165 ? 0 : 1;
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _171 = -_163;
    float _173 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _175 = abs(_167);
    float _177 = float(_155);
    float _179 = fma(_159, 0.5, 0.5);
    float _181 = abs(_173);
    float _183 = _177 * _181;
    bool _185 = _163 < 0.5;
    float _187 = float(_185);
    float _189 = -_179;
    float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _193 = float(_175);
    float _195 = -_187;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _199 = float(_141);
    float _201 = fma(_193, _191, _183);
    float _203 = abs(_197);
    float _205 = fma(_199, _203, _201);
    bool _207 = !_169;
    float _223;
    if (!_207)
    {
        float _209 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _211 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _215 = _213 * _209;
        float _217 = floor(_215);
        float _219 = -_217;
        float _221 = _215 + _219;
        _223 = _221;
        _225 = true;
    }
    else
    {
        float _227 = float(_63);
        float _229 = 1.0 / _227;
        float _231 = _97 * _229;
        _223 = _231;
    }
    _225 = false;
    float _233 = _223;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = _233 + _235;
    bool _239 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _241 = isnan(_233);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    bool _251 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _253 = isnan(_233);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _269 = _267 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _271 = -_249;
    float _273 = _271 + 1.0;
    float _275 = 1.0 / _265;
    bool _277 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _279 = isnan(_233);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = _261 * _273;
    float _291 = -_261;
    float _293 = _291 + 1.0;
    bool _295 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _297 = _287 * _293;
    float _299 = 1.0 / _269;
    float _301 = -_287;
    float _303 = _301 + 1.0;
    float _305 = _237 * _275;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _309 = _233 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _315;
    float _319 = fma(_313, _305, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _321 = fma(_317, _305, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _323 = _309 * _299;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _329 = _319 * _297;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _335 = _321 * _297;
    float _337 = fma(_327, _323, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _339 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[143].x, _329);
    float _341 = fma(_333, _323, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _343 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[143].y, _335);
    float _345 = fma(_337, _289, _339);
    float _347 = fma(_341, _289, _343);
    float _349 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[145].x, _345);
    float _351 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[145].y, _347);
    bool _353 = !_295;
    float _369;
    if (!_353)
    {
        float _355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _357 = _117 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[11].x, _97);
        float _361 = _359 * _355;
        float _363 = floor(_361);
        float _365 = -_363;
        float _367 = _361 + _365;
        _369 = _367;
        _371 = true;
    }
    else
    {
        float _373 = float(_63);
        float _375 = 1.0 / _373;
        float _377 = _97 * _375;
        _369 = _377;
    }
    _371 = false;
    float _379 = _369;
    float _381 = as_type<float>(int(gl_VertexIndex));
    float _383 = in.m_28.x;
    float _385 = in.m_28.y;
    float _387 = in.m_28.z;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _397 = in.m_40.x;
    float _399 = in.m_40.y;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _401;
    float _405 = 1.0 / _391;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _411;
    bool _415 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _417 = isnan(_379);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    bool _427 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _429 = isnan(_379);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = 1.0 / _395;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _441;
    int _445 = as_type<int>(_381) & 1;
    bool _447 = _445 != 0;
    int _449 = as_type<int>(_381) & 2;
    bool _451 = _449 != 0;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _453;
    float _457 = 1.0 / _403;
    float _459 = _385 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _461 = _385 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _463 = !_447;
    float _465 = _463 ? (-0.5) : 0.5;
    float _467 = _349 * _397;
    float _469 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[5].x, _459);
    float _471 = 1.0 / _409;
    float _473 = _351 * _399;
    float _475 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[6].x, _461);
    float _477 = _205 * _467;
    float _479 = _205 * _473;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _483 = _379 + _481;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _487 = _379 + _485;
    float _489 = 1.0 / _413;
    float _491 = _385 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _493 = _483 * _457;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _497 = _379 + _495;
    float _499 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[4].x, _491);
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _503 = _379 + _501;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _507 = _379 + _505;
    float _509 = _497 * _471;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _511;
    float _515 = _503 * _405;
    float _517 = _507 * _439;
    float _519 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].z, _499);
    float _521 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].z, _469);
    float _523 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].z, _475);
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _537;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _545 = _487 * _489;
    float _547 = fma(_531, _509, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _549 = fma(_535, _509, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _551 = fma(_543, _509, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _553 = fma(_513, _493, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _555 = fma(_527, _493, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _557 = fma(_539, _493, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _559 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _561 = isnan(_379);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _571;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _575;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _579;
    bool _583 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _585 = isnan(_379);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _591 = _587 || _589;
    float _593 = float(_591);
    float _595 = fma(_573, _515, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _597 = fma(_577, _515, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _599 = fma(_581, _515, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _601 = -_569;
    float _603 = _601 + 1.0;
    bool _605 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _607 = isnan(_379);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _613 = _609 || _611;
    float _615 = float(_613);
    float _617 = -_593;
    float _619 = _617 + 1.0;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _625 = _593 * _603;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _631 = _615 * _619;
    float _633 = -_615;
    float _635 = _633 + 1.0;
    bool _637 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _639 = isnan(_379);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _653 = _477 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _655 = _425 * _635;
    float _657 = -_425;
    float _659 = _657 + 1.0;
    float _661 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _465);
    float _663 = fma(_623, _517, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _665 = fma(_629, _517, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _667 = fma(_651, _517, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _669 = -_647;
    float _671 = _669 + 1.0;
    float _673 = _647 * _659;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _675;
    float _679 = fma(_443, _545, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _681 = _653 * _661;
    float _683 = _437 * _671;
    float _685 = fma(_677, _545, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    bool _687 = !_451;
    float _689 = _687 ? (-0.5) : 0.5;
    float _691 = -_437;
    float _693 = _691 + 1.0;
    float _695 = _553 * _683;
    float _697 = _479 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _699 = _557 * _683;
    float _701 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _689);
    float _703 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[107].x, _695);
    float _705 = _521 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _707 = _519 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _709 = _697 * _701;
    float _711 = fma(_547, _673, _703);
    float _713 = _705 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _715 = _555 * _683;
    float _717 = _709 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _719 = _709 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _721 = _709 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _723 = _523 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _725 = fma(_707, (*spvDescriptorSet0.vp_c8)._m0[11].x, _713);
    float _727 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[107].y, _715);
    float _729 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[107].z, _699);
    float _731 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[24].x, _717);
    float _733 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[11].z, _725);
    float _735 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[25].x, _719);
    float _737 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[26].x, _721);
    float _739 = fma(_549, _673, _727);
    float _741 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _743 = fma(_551, _673, _729);
    float _745 = _705 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _747 = _733 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _749 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[24].z, _731);
    float _751 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[25].z, _735);
    float _753 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[26].z, _737);
    float _755 = fma(_597, _655, _739);
    float _757 = fma(_707, (*spvDescriptorSet0.vp_c8)._m0[10].x, _745);
    float _759 = 1.0 / _747;
    float _761 = fma(_595, _655, _711);
    float _763 = fma(_599, _655, _743);
    float _765 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[10].z, _757);
    float _767 = _751 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _769 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _771 = isnan(0.5);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _777 = _773 || _775;
    float _779 = _749 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _781 = _765 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _783 = _705 + _767;
    float _785 = fma(_455, _545, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _787 = fma(_663, _631, _761);
    float _789 = _781 + _747;
    float _791 = fma(_665, _631, _755);
    float _793 = fma(_667, _631, _763);
    float _795 = _753 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _797 = _707 + _779;
    float _799 = _789 * _759;
    float _801 = _799 * 0.5;
    float _803 = _783 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _805 = _723 + _795;
    float _807 = fma(_685, _625, _787);
    float _809 = fma(_679, _625, _791);
    float _811 = fma(_785, _625, _793);
    float _813 = _783 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _815 = _783 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _817 = _783 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _819 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[1].x, _803);
    float _821 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[112].x, _807);
    float _823 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[112].y, _809);
    float _825 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[112].z, _811);
    float _827 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[0].x, _813);
    float _829 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[2].x, _815);
    float _831 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[3].x, _817);
    float _833 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[1].z, _819);
    float _835 = _813;
    if (_777)
    {
        _835 = 1.0;
    }
    float _837 = _835;
    float _839 = _837;
    if (!_777)
    {
        float _841 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _843 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _845 = _841 * 0.15915493667125701904296875;
        float _847 = _843 * 0.15915493667125701904296875;
        float _849 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _851 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[30].w, _849);
        float _853 = _845 * 6.283185482025146484375;
        float _855 = cos(_853);
        float _857 = _845 * 6.283185482025146484375;
        float _859 = sin(_857);
        float _861 = 1.0 / _855;
        float _863 = _847 * 6.283185482025146484375;
        float _865 = cos(_863);
        float _867 = _859 * _861;
        float _869 = _847 * 6.283185482025146484375;
        float _871 = sin(_869);
        float _873 = _865 * _867;
        float _875 = 1.0 / _851;
        float _877 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _879 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _877;
        float _881 = 1.0 / _873;
        float _883 = 1.0 / _879;
        float _885 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _887 = _875 * _885;
        float _889 = _871 * _881;
        float _891 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _893 = fma(_889, _887, _891);
        float _895 = _893 * _883;
        float _897 = precise::clamp(_895, 0.0, 1.0);
        float _899 = -_897;
        float _901 = _899 + 1.0;
        _839 = _901;
    }
    float _903 = _839;
    float _905 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[0].z, _827);
    float _907 = _833 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _909 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[2].z, _829);
    float _911 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[3].z, _831);
    float _913 = _905 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _915 = _907 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _917 = _907 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _919 = _907 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _921 = _907 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _923 = _909 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _925 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[4].x, _915);
    float _927 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[5].x, _917);
    float _929 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[6].x, _919);
    float _931 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[7].x, _921);
    float _933 = _911 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _935 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[4].z, _925);
    float _937 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[5].z, _927);
    float _939 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[6].z, _929);
    float _941 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[7].z, _931);
    float _943 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[4].w, _935);
    float _945 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[5].w, _937);
    float _947 = _821 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _949 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[6].w, _939);
    float _951 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[7].w, _941);
    bool _953 = _903 > 0.0;
    bool _955 = isnan(_903);
    bool _957 = _953 || _955;
    bool _959 = isnan(0.0);
    bool _961 = _957 || _959;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _965 = _823 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _967 = _947 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _969 = _825 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _971 = _949 + _951;
    float _973 = _965 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _975 = _903 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _977 = _969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _979 = _971 * 0.5;
    out.gl_Position.x = _943;
    out.gl_Position.y = _945;
    out.gl_Position.z = _949;
    out.gl_Position.w = _951;
    out.m_42.x = _967;
    out.m_42.y = _973;
    out.m_42.z = _977;
    out.m_42.w = _963;
    out.m_31.x = _975;
    out.m_44.z = _979;
    out.m_44.w = _951;
    if (_961)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_31.x = 0.0;
    float _981 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _981;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

