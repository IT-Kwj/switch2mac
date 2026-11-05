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
    float4 m_37 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _287 = false;
    bool _139 = false;
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
        float _788 = as_type<float>(_79);
        out.gl_Position.z = _788;
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
        out.m_31.x = 0.0;
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
        float _857 = as_type<float>(_115);
        out.gl_Position.z = _857;
    }
    if (_107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _117 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _119 = !_117;
    float _137;
    if (!_119)
    {
        float _121 = in.m_35.x;
        float _123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _125 = _121 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _127 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _129 = _127 * _123;
        float _131 = floor(_129);
        float _133 = -_131;
        float _135 = _129 + _133;
        _137 = _135;
        _139 = true;
    }
    else
    {
        float _141 = float(_63);
        float _143 = 1.0 / _141;
        float _145 = _97 * _143;
        _137 = _145;
    }
    _139 = false;
    float _147 = _137;
    float _149 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _151 = _147 + _149;
    bool _153 = _147 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _155 = isnan(_147);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _161 = _157 || _159;
    float _163 = float(_161);
    float _165 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _167 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _165;
    float _169 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _171 = _169 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _173 = -_163;
    float _175 = _173 + 1.0;
    float _177 = 1.0 / _167;
    bool _179 = _147 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _181 = isnan(_147);
    bool _183 = _179 || _181;
    bool _185 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _187 = _183 || _185;
    float _189 = float(_187);
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _193 = 1.0 / _171;
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _197 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _195;
    float _199 = _151 * _177;
    bool _201 = _147 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _203 = isnan(_147);
    bool _205 = _201 || _203;
    bool _207 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _209 = _205 || _207;
    float _211 = float(_209);
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _215 = _147 + _213;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _219 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _217;
    float _221 = fma(_197, _199, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _223 = _211 * _175;
    float _225 = -_211;
    float _227 = _225 + 1.0;
    float _229 = fma(_219, _199, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _231 = _215 * _193;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _235 = _233 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _237 = _189 * _227;
    float _239 = -_189;
    float _241 = _239 + 1.0;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _245 = _243 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _247 = fma(_235, _231, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _249 = _229 * _237;
    float _251 = _221 * _237;
    float _253 = fma(_245, _231, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _255 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[143].x, _249);
    float _257 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[143].y, _251);
    float _259 = fma(_247, _223, _255);
    float _261 = fma(_253, _223, _257);
    float _263 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[145].x, _259);
    float _265 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[145].y, _261);
    bool _267 = !_191;
    float _285;
    if (!_267)
    {
        float _269 = in.m_35.x;
        float _271 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _273 = _269 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[11].x, _97);
        float _277 = _275 * _271;
        float _279 = floor(_277);
        float _281 = -_279;
        float _283 = _277 + _281;
        _285 = _283;
        _287 = true;
    }
    else
    {
        float _289 = float(_63);
        float _291 = 1.0 / _289;
        float _293 = _97 * _291;
        _285 = _293;
    }
    _287 = false;
    float _295 = _285;
    float _297 = in.m_37.x;
    float _299 = in.m_37.y;
    float _301 = in.m_28.x;
    float _303 = in.m_28.y;
    float _305 = in.m_28.z;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _315 = as_type<float>(int(gl_VertexIndex));
    float _317 = 1.0 / _309;
    float _319 = 1.0 / _313;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _321;
    float _325 = _265 * _299;
    float _327 = _263 * _297;
    bool _329 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _331 = isnan(_295);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = _303 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _343 = _303 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _345 = _303 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _347 = _327 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _349 = as_type<int>(_315) & 1;
    bool _351 = _349 != 0;
    int _353 = as_type<int>(_315) & 2;
    bool _355 = _353 != 0;
    float _357 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[4].x, _341);
    float _359 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[6].x, _345);
    float _361 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[5].x, _343);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _365 = _295 + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _369 = _295 + _367;
    float _371 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[5].z, _361);
    float _373 = _365 * _319;
    float _375 = _369 * _317;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _381;
    float _385 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[4].z, _357);
    float _387 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[6].z, _359);
    float _389 = fma(_379, _375, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _391 = fma(_383, _375, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _393 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _395 = isnan(_295);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = fma(_323, _375, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    bool _411 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _413 = isnan(_295);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _427 = -_403;
    float _429 = _427 + 1.0;
    bool _431 = !_351;
    float _433 = _431 ? (-0.5) : 0.5;
    float _435 = _325 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _437 = _371 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _439 = _421 * _429;
    float _441 = -_421;
    float _443 = _441 + 1.0;
    float _445 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _433);
    bool _447 = !_355;
    float _449 = _447 ? (-0.5) : 0.5;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _455 = _339 * _443;
    float _457 = _347 * _445;
    float _459 = -_339;
    float _461 = _459 + 1.0;
    float _463 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _449);
    float _465 = _391 * _455;
    float _467 = _389 * _455;
    float _469 = _405 * _455;
    float _471 = _435 * _463;
    float _473 = _385 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _475 = _437 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _477 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[107].x, _465);
    float _479 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[107].y, _467);
    float _481 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[107].z, _469);
    float _483 = _471 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _485 = _387 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _487 = fma(_473, (*spvDescriptorSet0.vp_c8)._m0[11].x, _475);
    float _489 = fma(_425, _373, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _491 = fma(_457, (*spvDescriptorSet0.vp_c8)._m0[24].x, _483);
    float _493 = fma(_453, _373, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _495 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[11].z, _487);
    float _497 = _471 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _499 = _437 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _501 = _471 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _503 = _495 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _505 = fma(_489, _439, _477);
    float _507 = fma(_457, (*spvDescriptorSet0.vp_c8)._m0[25].x, _497);
    float _509 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _511 = fma(_493, _439, _481);
    float _513 = fma(_473, (*spvDescriptorSet0.vp_c8)._m0[10].x, _499);
    float _515 = 1.0 / _503;
    float _517 = fma(_409, _373, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _519 = fma(_509, (*spvDescriptorSet0.vp_c8)._m0[25].z, _507);
    float _521 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[10].z, _513);
    float _523 = fma(_457, (*spvDescriptorSet0.vp_c8)._m0[26].x, _501);
    float _525 = fma(_517, _439, _479);
    float _527 = fma(_509, (*spvDescriptorSet0.vp_c8)._m0[24].z, _491);
    float _529 = _519 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _531 = _521 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _533 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _535 = isnan(0.5);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _541 = _537 || _539;
    float _543 = fma(_509, (*spvDescriptorSet0.vp_c8)._m0[26].z, _523);
    float _545 = _437 + _529;
    float _547 = _527 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _549 = _531 + _503;
    float _551 = _543 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _553 = _545 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _555 = _473 + _547;
    float _557 = _549 * _515;
    float _559 = _557 * 0.5;
    float _561 = _545 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _563 = _545 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _565 = _545 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _567 = _485 + _551;
    float _569 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[1].x, _553);
    float _571 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[109].x, _505);
    float _573 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[109].y, _525);
    float _575 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[0].x, _561);
    float _577 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[2].x, _563);
    float _579 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[3].x, _565);
    float _581 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[109].z, _511);
    float _583 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[1].z, _569);
    float _585 = _555;
    if (_541)
    {
        _585 = 1.0;
    }
    float _587 = _585;
    float _589 = _587;
    if (!_541)
    {
        float _591 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _593 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _595 = _591 * 0.15915493667125701904296875;
        float _597 = _593 * 0.15915493667125701904296875;
        float _599 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _601 = fma(_559, (*spvDescriptorSet0.vp_c8)._m0[30].w, _599);
        float _603 = _595 * 6.283185482025146484375;
        float _605 = cos(_603);
        float _607 = _595 * 6.283185482025146484375;
        float _609 = sin(_607);
        float _611 = 1.0 / _605;
        float _613 = _597 * 6.283185482025146484375;
        float _615 = cos(_613);
        float _617 = _609 * _611;
        float _619 = _597 * 6.283185482025146484375;
        float _621 = sin(_619);
        float _623 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _625 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _623;
        float _627 = _615 * _617;
        float _629 = 1.0 / _601;
        float _631 = 1.0 / _627;
        float _633 = 1.0 / _625;
        float _635 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _637 = _629 * _635;
        float _639 = _621 * _631;
        float _641 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _643 = fma(_639, _637, _641);
        float _645 = _643 * _633;
        float _647 = precise::clamp(_645, 0.0, 1.0);
        float _649 = -_647;
        float _651 = _649 + 1.0;
        _589 = _651;
    }
    float _653 = _589;
    float _655 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[0].z, _575);
    float _657 = _583 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _659 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[2].z, _577);
    float _661 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[3].z, _579);
    float _663 = _655 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _665 = _657 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _667 = _657 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _669 = _657 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _671 = _657 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _673 = _659 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _675 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[5].x, _665);
    float _677 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[4].x, _667);
    float _679 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[6].x, _669);
    float _681 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[7].x, _671);
    float _683 = _661 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _685 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[5].z, _675);
    float _687 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[4].z, _677);
    float _689 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[6].z, _679);
    float _691 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[7].z, _681);
    float _693 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[5].w, _685);
    float _695 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[4].w, _687);
    float _697 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[6].w, _689);
    float _699 = _581 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _701 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[7].w, _691);
    bool _703 = _653 > 0.0;
    bool _705 = isnan(_653);
    bool _707 = _703 || _705;
    bool _709 = isnan(0.0);
    bool _711 = _707 || _709;
    float _713 = _571 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _715 = _573 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _717 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _719 = _697 + _701;
    float _721 = _713 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _723 = _715 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _725 = _653 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _729 = _719 * 0.5;
    out.m_31.x = _725;
    out.m_42.x = _721;
    out.m_42.y = _723;
    out.m_42.z = _717;
    out.m_42.w = _727;
    out.gl_Position.x = _695;
    out.gl_Position.y = _693;
    out.gl_Position.z = _697;
    out.gl_Position.w = _701;
    out.m_44.z = _729;
    out.m_44.w = _701;
    if (_711)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_31.x = 0.0;
    float _731 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _731;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _287 = false;
    bool _139 = false;
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
        float _788 = as_type<float>(_79);
        out.gl_Position.z = _788;
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
        out.m_31.x = 0.0;
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
        float _857 = as_type<float>(_115);
        out.gl_Position.z = _857;
    }
    if (_107)
    {
        return out;
    }
    bool _117 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _119 = !_117;
    float _137;
    if (!_119)
    {
        float _121 = in.m_35.x;
        float _123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _125 = _121 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _127 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _129 = _127 * _123;
        float _131 = floor(_129);
        float _133 = -_131;
        float _135 = _129 + _133;
        _137 = _135;
        _139 = true;
    }
    else
    {
        float _141 = float(_63);
        float _143 = 1.0 / _141;
        float _145 = _97 * _143;
        _137 = _145;
    }
    _139 = false;
    float _147 = _137;
    float _149 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _151 = _147 + _149;
    bool _153 = _147 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _155 = isnan(_147);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _161 = _157 || _159;
    float _163 = float(_161);
    float _165 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _167 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _165;
    float _169 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _171 = _169 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _173 = -_163;
    float _175 = _173 + 1.0;
    float _177 = 1.0 / _167;
    bool _179 = _147 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _181 = isnan(_147);
    bool _183 = _179 || _181;
    bool _185 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _187 = _183 || _185;
    float _189 = float(_187);
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _193 = 1.0 / _171;
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _197 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _195;
    float _199 = _151 * _177;
    bool _201 = _147 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _203 = isnan(_147);
    bool _205 = _201 || _203;
    bool _207 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _209 = _205 || _207;
    float _211 = float(_209);
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _215 = _147 + _213;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _219 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _217;
    float _221 = fma(_197, _199, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _223 = _211 * _175;
    float _225 = -_211;
    float _227 = _225 + 1.0;
    float _229 = fma(_219, _199, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _231 = _215 * _193;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _235 = _233 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _237 = _189 * _227;
    float _239 = -_189;
    float _241 = _239 + 1.0;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _245 = _243 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _247 = fma(_235, _231, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _249 = _229 * _237;
    float _251 = _221 * _237;
    float _253 = fma(_245, _231, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _255 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[143].x, _249);
    float _257 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[143].y, _251);
    float _259 = fma(_247, _223, _255);
    float _261 = fma(_253, _223, _257);
    float _263 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[145].x, _259);
    float _265 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[145].y, _261);
    bool _267 = !_191;
    float _285;
    if (!_267)
    {
        float _269 = in.m_35.x;
        float _271 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _273 = _269 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[11].x, _97);
        float _277 = _275 * _271;
        float _279 = floor(_277);
        float _281 = -_279;
        float _283 = _277 + _281;
        _285 = _283;
        _287 = true;
    }
    else
    {
        float _289 = float(_63);
        float _291 = 1.0 / _289;
        float _293 = _97 * _291;
        _285 = _293;
    }
    _287 = false;
    float _295 = _285;
    float _297 = in.m_37.x;
    float _299 = in.m_37.y;
    float _301 = in.m_28.x;
    float _303 = in.m_28.y;
    float _305 = in.m_28.z;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _315 = as_type<float>(int(gl_VertexIndex));
    float _317 = 1.0 / _309;
    float _319 = 1.0 / _313;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _321;
    float _325 = _265 * _299;
    float _327 = _263 * _297;
    bool _329 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _331 = isnan(_295);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = _303 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _343 = _303 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _345 = _303 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _347 = _327 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _349 = as_type<int>(_315) & 1;
    bool _351 = _349 != 0;
    int _353 = as_type<int>(_315) & 2;
    bool _355 = _353 != 0;
    float _357 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[4].x, _341);
    float _359 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[6].x, _345);
    float _361 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[5].x, _343);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _365 = _295 + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _369 = _295 + _367;
    float _371 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[5].z, _361);
    float _373 = _365 * _319;
    float _375 = _369 * _317;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _381;
    float _385 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[4].z, _357);
    float _387 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[6].z, _359);
    float _389 = fma(_379, _375, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _391 = fma(_383, _375, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _393 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _395 = isnan(_295);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = fma(_323, _375, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    bool _411 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _413 = isnan(_295);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _427 = -_403;
    float _429 = _427 + 1.0;
    bool _431 = !_351;
    float _433 = _431 ? (-0.5) : 0.5;
    float _435 = _325 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _437 = _371 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _439 = _421 * _429;
    float _441 = -_421;
    float _443 = _441 + 1.0;
    float _445 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _433);
    bool _447 = !_355;
    float _449 = _447 ? (-0.5) : 0.5;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _455 = _339 * _443;
    float _457 = _347 * _445;
    float _459 = -_339;
    float _461 = _459 + 1.0;
    float _463 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _449);
    float _465 = _391 * _455;
    float _467 = _389 * _455;
    float _469 = _405 * _455;
    float _471 = _435 * _463;
    float _473 = _385 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _475 = _437 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _477 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[107].x, _465);
    float _479 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[107].y, _467);
    float _481 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[107].z, _469);
    float _483 = _471 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _485 = _387 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _487 = fma(_473, (*spvDescriptorSet0.vp_c8)._m0[11].x, _475);
    float _489 = fma(_425, _373, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _491 = fma(_457, (*spvDescriptorSet0.vp_c8)._m0[24].x, _483);
    float _493 = fma(_453, _373, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _495 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[11].z, _487);
    float _497 = _471 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _499 = _437 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _501 = _471 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _503 = _495 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _505 = fma(_489, _439, _477);
    float _507 = fma(_457, (*spvDescriptorSet0.vp_c8)._m0[25].x, _497);
    float _509 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _511 = fma(_493, _439, _481);
    float _513 = fma(_473, (*spvDescriptorSet0.vp_c8)._m0[10].x, _499);
    float _515 = 1.0 / _503;
    float _517 = fma(_409, _373, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _519 = fma(_509, (*spvDescriptorSet0.vp_c8)._m0[25].z, _507);
    float _521 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[10].z, _513);
    float _523 = fma(_457, (*spvDescriptorSet0.vp_c8)._m0[26].x, _501);
    float _525 = fma(_517, _439, _479);
    float _527 = fma(_509, (*spvDescriptorSet0.vp_c8)._m0[24].z, _491);
    float _529 = _519 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _531 = _521 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _533 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _535 = isnan(0.5);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _541 = _537 || _539;
    float _543 = fma(_509, (*spvDescriptorSet0.vp_c8)._m0[26].z, _523);
    float _545 = _437 + _529;
    float _547 = _527 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _549 = _531 + _503;
    float _551 = _543 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _553 = _545 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _555 = _473 + _547;
    float _557 = _549 * _515;
    float _559 = _557 * 0.5;
    float _561 = _545 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _563 = _545 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _565 = _545 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _567 = _485 + _551;
    float _569 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[1].x, _553);
    float _571 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[109].x, _505);
    float _573 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[109].y, _525);
    float _575 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[0].x, _561);
    float _577 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[2].x, _563);
    float _579 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[3].x, _565);
    float _581 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[109].z, _511);
    float _583 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[1].z, _569);
    float _585 = _555;
    if (_541)
    {
        _585 = 1.0;
    }
    float _587 = _585;
    float _589 = _587;
    if (!_541)
    {
        float _591 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _593 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _595 = _591 * 0.15915493667125701904296875;
        float _597 = _593 * 0.15915493667125701904296875;
        float _599 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _601 = fma(_559, (*spvDescriptorSet0.vp_c8)._m0[30].w, _599);
        float _603 = _595 * 6.283185482025146484375;
        float _605 = cos(_603);
        float _607 = _595 * 6.283185482025146484375;
        float _609 = sin(_607);
        float _611 = 1.0 / _605;
        float _613 = _597 * 6.283185482025146484375;
        float _615 = cos(_613);
        float _617 = _609 * _611;
        float _619 = _597 * 6.283185482025146484375;
        float _621 = sin(_619);
        float _623 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _625 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _623;
        float _627 = _615 * _617;
        float _629 = 1.0 / _601;
        float _631 = 1.0 / _627;
        float _633 = 1.0 / _625;
        float _635 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _637 = _629 * _635;
        float _639 = _621 * _631;
        float _641 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _643 = fma(_639, _637, _641);
        float _645 = _643 * _633;
        float _647 = precise::clamp(_645, 0.0, 1.0);
        float _649 = -_647;
        float _651 = _649 + 1.0;
        _589 = _651;
    }
    float _653 = _589;
    float _655 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[0].z, _575);
    float _657 = _583 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _659 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[2].z, _577);
    float _661 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[3].z, _579);
    float _663 = _655 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _665 = _657 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _667 = _657 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _669 = _657 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _671 = _657 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _673 = _659 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _675 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[5].x, _665);
    float _677 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[4].x, _667);
    float _679 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[6].x, _669);
    float _681 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[7].x, _671);
    float _683 = _661 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _685 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[5].z, _675);
    float _687 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[4].z, _677);
    float _689 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[6].z, _679);
    float _691 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[7].z, _681);
    float _693 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[5].w, _685);
    float _695 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[4].w, _687);
    float _697 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[6].w, _689);
    float _699 = _581 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _701 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[7].w, _691);
    bool _703 = _653 > 0.0;
    bool _705 = isnan(_653);
    bool _707 = _703 || _705;
    bool _709 = isnan(0.0);
    bool _711 = _707 || _709;
    float _713 = _571 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _715 = _573 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _717 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _719 = _697 + _701;
    float _721 = _713 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _723 = _715 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _725 = _653 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _729 = _719 * 0.5;
    out.m_31.x = _725;
    out.m_42.x = _721;
    out.m_42.y = _723;
    out.m_42.z = _717;
    out.m_42.w = _727;
    out.gl_Position.x = _695;
    out.gl_Position.y = _693;
    out.gl_Position.z = _697;
    out.gl_Position.w = _701;
    out.m_44.z = _729;
    out.m_44.w = _701;
    if (_711)
    {
        return out;
    }
    out.m_31.x = 0.0;
    float _731 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _731;
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
    bool _287 = false;
    bool _139 = false;
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
        float _788 = as_type<float>(_79);
        out.gl_Position.z = _788;
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
        out.m_31.x = 0.0;
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
        float _857 = as_type<float>(_115);
        out.gl_Position.z = _857;
    }
    if (_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _117 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _119 = !_117;
    float _137;
    if (!_119)
    {
        float _121 = in.m_35.x;
        float _123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _125 = _121 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _127 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _129 = _127 * _123;
        float _131 = floor(_129);
        float _133 = -_131;
        float _135 = _129 + _133;
        _137 = _135;
        _139 = true;
    }
    else
    {
        float _141 = float(_63);
        float _143 = 1.0 / _141;
        float _145 = _97 * _143;
        _137 = _145;
    }
    _139 = false;
    float _147 = _137;
    float _149 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _151 = _147 + _149;
    bool _153 = _147 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _155 = isnan(_147);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _161 = _157 || _159;
    float _163 = float(_161);
    float _165 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _167 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _165;
    float _169 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _171 = _169 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _173 = -_163;
    float _175 = _173 + 1.0;
    float _177 = 1.0 / _167;
    bool _179 = _147 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _181 = isnan(_147);
    bool _183 = _179 || _181;
    bool _185 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _187 = _183 || _185;
    float _189 = float(_187);
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _193 = 1.0 / _171;
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _197 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _195;
    float _199 = _151 * _177;
    bool _201 = _147 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _203 = isnan(_147);
    bool _205 = _201 || _203;
    bool _207 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _209 = _205 || _207;
    float _211 = float(_209);
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _215 = _147 + _213;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _219 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _217;
    float _221 = fma(_197, _199, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _223 = _211 * _175;
    float _225 = -_211;
    float _227 = _225 + 1.0;
    float _229 = fma(_219, _199, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _231 = _215 * _193;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _235 = _233 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _237 = _189 * _227;
    float _239 = -_189;
    float _241 = _239 + 1.0;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _245 = _243 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _247 = fma(_235, _231, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _249 = _229 * _237;
    float _251 = _221 * _237;
    float _253 = fma(_245, _231, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _255 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[143].x, _249);
    float _257 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[143].y, _251);
    float _259 = fma(_247, _223, _255);
    float _261 = fma(_253, _223, _257);
    float _263 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[145].x, _259);
    float _265 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[145].y, _261);
    bool _267 = !_191;
    float _285;
    if (!_267)
    {
        float _269 = in.m_35.x;
        float _271 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _273 = _269 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[11].x, _97);
        float _277 = _275 * _271;
        float _279 = floor(_277);
        float _281 = -_279;
        float _283 = _277 + _281;
        _285 = _283;
        _287 = true;
    }
    else
    {
        float _289 = float(_63);
        float _291 = 1.0 / _289;
        float _293 = _97 * _291;
        _285 = _293;
    }
    _287 = false;
    float _295 = _285;
    float _297 = in.m_37.x;
    float _299 = in.m_37.y;
    float _301 = in.m_28.x;
    float _303 = in.m_28.y;
    float _305 = in.m_28.z;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _315 = as_type<float>(int(gl_VertexIndex));
    float _317 = 1.0 / _309;
    float _319 = 1.0 / _313;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _321;
    float _325 = _265 * _299;
    float _327 = _263 * _297;
    bool _329 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _331 = isnan(_295);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = _303 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _343 = _303 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _345 = _303 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _347 = _327 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _349 = as_type<int>(_315) & 1;
    bool _351 = _349 != 0;
    int _353 = as_type<int>(_315) & 2;
    bool _355 = _353 != 0;
    float _357 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[4].x, _341);
    float _359 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[6].x, _345);
    float _361 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[5].x, _343);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _365 = _295 + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _369 = _295 + _367;
    float _371 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[5].z, _361);
    float _373 = _365 * _319;
    float _375 = _369 * _317;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _381;
    float _385 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[4].z, _357);
    float _387 = fma(_305, (*spvDescriptorSet0.vp_c10)._m0[6].z, _359);
    float _389 = fma(_379, _375, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _391 = fma(_383, _375, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _393 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _395 = isnan(_295);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = fma(_323, _375, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    bool _411 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _413 = isnan(_295);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _427 = -_403;
    float _429 = _427 + 1.0;
    bool _431 = !_351;
    float _433 = _431 ? (-0.5) : 0.5;
    float _435 = _325 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _437 = _371 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _439 = _421 * _429;
    float _441 = -_421;
    float _443 = _441 + 1.0;
    float _445 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _433);
    bool _447 = !_355;
    float _449 = _447 ? (-0.5) : 0.5;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _455 = _339 * _443;
    float _457 = _347 * _445;
    float _459 = -_339;
    float _461 = _459 + 1.0;
    float _463 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _449);
    float _465 = _391 * _455;
    float _467 = _389 * _455;
    float _469 = _405 * _455;
    float _471 = _435 * _463;
    float _473 = _385 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _475 = _437 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _477 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[107].x, _465);
    float _479 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[107].y, _467);
    float _481 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[107].z, _469);
    float _483 = _471 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _485 = _387 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _487 = fma(_473, (*spvDescriptorSet0.vp_c8)._m0[11].x, _475);
    float _489 = fma(_425, _373, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _491 = fma(_457, (*spvDescriptorSet0.vp_c8)._m0[24].x, _483);
    float _493 = fma(_453, _373, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _495 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[11].z, _487);
    float _497 = _471 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _499 = _437 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _501 = _471 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _503 = _495 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _505 = fma(_489, _439, _477);
    float _507 = fma(_457, (*spvDescriptorSet0.vp_c8)._m0[25].x, _497);
    float _509 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _511 = fma(_493, _439, _481);
    float _513 = fma(_473, (*spvDescriptorSet0.vp_c8)._m0[10].x, _499);
    float _515 = 1.0 / _503;
    float _517 = fma(_409, _373, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _519 = fma(_509, (*spvDescriptorSet0.vp_c8)._m0[25].z, _507);
    float _521 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[10].z, _513);
    float _523 = fma(_457, (*spvDescriptorSet0.vp_c8)._m0[26].x, _501);
    float _525 = fma(_517, _439, _479);
    float _527 = fma(_509, (*spvDescriptorSet0.vp_c8)._m0[24].z, _491);
    float _529 = _519 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _531 = _521 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _533 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _535 = isnan(0.5);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _541 = _537 || _539;
    float _543 = fma(_509, (*spvDescriptorSet0.vp_c8)._m0[26].z, _523);
    float _545 = _437 + _529;
    float _547 = _527 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _549 = _531 + _503;
    float _551 = _543 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _553 = _545 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _555 = _473 + _547;
    float _557 = _549 * _515;
    float _559 = _557 * 0.5;
    float _561 = _545 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _563 = _545 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _565 = _545 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _567 = _485 + _551;
    float _569 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[1].x, _553);
    float _571 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[109].x, _505);
    float _573 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[109].y, _525);
    float _575 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[0].x, _561);
    float _577 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[2].x, _563);
    float _579 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[3].x, _565);
    float _581 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[109].z, _511);
    float _583 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[1].z, _569);
    float _585 = _555;
    if (_541)
    {
        _585 = 1.0;
    }
    float _587 = _585;
    float _589 = _587;
    if (!_541)
    {
        float _591 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _593 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _595 = _591 * 0.15915493667125701904296875;
        float _597 = _593 * 0.15915493667125701904296875;
        float _599 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _601 = fma(_559, (*spvDescriptorSet0.vp_c8)._m0[30].w, _599);
        float _603 = _595 * 6.283185482025146484375;
        float _605 = cos(_603);
        float _607 = _595 * 6.283185482025146484375;
        float _609 = sin(_607);
        float _611 = 1.0 / _605;
        float _613 = _597 * 6.283185482025146484375;
        float _615 = cos(_613);
        float _617 = _609 * _611;
        float _619 = _597 * 6.283185482025146484375;
        float _621 = sin(_619);
        float _623 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _625 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _623;
        float _627 = _615 * _617;
        float _629 = 1.0 / _601;
        float _631 = 1.0 / _627;
        float _633 = 1.0 / _625;
        float _635 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _637 = _629 * _635;
        float _639 = _621 * _631;
        float _641 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _643 = fma(_639, _637, _641);
        float _645 = _643 * _633;
        float _647 = precise::clamp(_645, 0.0, 1.0);
        float _649 = -_647;
        float _651 = _649 + 1.0;
        _589 = _651;
    }
    float _653 = _589;
    float _655 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[0].z, _575);
    float _657 = _583 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _659 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[2].z, _577);
    float _661 = fma(_567, (*spvDescriptorSet0.vp_c8)._m0[3].z, _579);
    float _663 = _655 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _665 = _657 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _667 = _657 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _669 = _657 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _671 = _657 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _673 = _659 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _675 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[5].x, _665);
    float _677 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[4].x, _667);
    float _679 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[6].x, _669);
    float _681 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[7].x, _671);
    float _683 = _661 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _685 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[5].z, _675);
    float _687 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[4].z, _677);
    float _689 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[6].z, _679);
    float _691 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[7].z, _681);
    float _693 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[5].w, _685);
    float _695 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[4].w, _687);
    float _697 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[6].w, _689);
    float _699 = _581 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _701 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[7].w, _691);
    bool _703 = _653 > 0.0;
    bool _705 = isnan(_653);
    bool _707 = _703 || _705;
    bool _709 = isnan(0.0);
    bool _711 = _707 || _709;
    float _713 = _571 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _715 = _573 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _717 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _719 = _697 + _701;
    float _721 = _713 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _723 = _715 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _725 = _653 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _729 = _719 * 0.5;
    out.m_31.x = _725;
    out.m_42.x = _721;
    out.m_42.y = _723;
    out.m_42.z = _717;
    out.m_42.w = _727;
    out.gl_Position.x = _695;
    out.gl_Position.y = _693;
    out.gl_Position.z = _697;
    out.gl_Position.w = _701;
    out.m_44.z = _729;
    out.m_44.w = _701;
    if (_711)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_31.x = 0.0;
    float _731 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _731;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

