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
    bool _307 = false;
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
    if (!_67)
    {
        out.m_31.x = 0.0;
    }
    int _73 = 0;
    if (!_67)
    {
        float _75 = _71 * 5.0;
        _73 = as_type<int>(_75);
    }
    int _77 = _73;
    int _79 = _77;
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _831 = as_type<float>(_77);
        out.gl_Position.z = _831;
    }
    if (!_67)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _81 = in.m_33.w;
    bool _83 = _81 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _85 = isnan(_81);
    bool _87 = _83 || _85;
    bool _89 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _91 = _87 || _89;
    float _93 = -_81;
    float _95 = _93 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _97 = 0.0;
    if (_91)
    {
        float _99 = float(_63);
        _97 = _99;
    }
    float _101 = _97;
    bool _103 = _95 >= _101;
    bool _105 = !_91;
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
        _79 = as_type<int>(_113);
    }
    int _115 = _79;
    if (_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _900 = as_type<float>(_115);
        out.gl_Position.z = _900;
    }
    if (_107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _117 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    bool _119 = !_117;
    float _137;
    if (!_119)
    {
        float _121 = in.m_35.x;
        float _123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _125 = _121 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _127 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[11].x, _95);
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
        float _145 = _95 * _143;
        _137 = _145;
    }
    _139 = false;
    float _147 = _137;
    float _149 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _151 = _147 + _149;
    bool _153 = _147 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _155 = isnan(_147);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _161 = _157 || _159;
    float _163 = float(_161);
    float _165 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _167 = _147 + _165;
    bool _169 = _147 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _171 = isnan(_147);
    bool _173 = _169 || _171;
    bool _175 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _177 = _173 || _175;
    float _179 = float(_177);
    float _181 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _183 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _181;
    float _185 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _187 = _185 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _189 = _147 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _191 = isnan(_147);
    bool _193 = _189 || _191;
    bool _195 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _197 = _193 || _195;
    float _199 = float(_197);
    float _201 = -_163;
    float _203 = _201 + 1.0;
    float _205 = 1.0 / _187;
    float _207 = _199 * _203;
    float _209 = -_199;
    float _211 = _209 + 1.0;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _213;
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _219 = 1.0 / _183;
    float _221 = _179 * _211;
    float _223 = -_179;
    float _225 = _223 + 1.0;
    float _227 = _167 * _205;
    float _229 = _151 * _219;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _235;
    float _239 = fma(_215, _229, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _241 = fma(_233, _229, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _243 = fma(_237, _229, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _245 = _239 * _221;
    float _247 = _241 * _221;
    float _249 = _243 * _221;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _253 = _251 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _257 = _255 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _261 = _259 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _263 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[107].x, _245);
    float _265 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[107].y, _247);
    float _267 = fma(_253, _227, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _269 = fma(_257, _227, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _271 = fma(_261, _227, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _273 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[107].z, _249);
    float _275 = fma(_267, _207, _263);
    float _277 = fma(_269, _207, _265);
    float _279 = fma(_271, _207, _273);
    float _281 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[109].x, _275);
    float _283 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[109].y, _277);
    float _285 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[109].z, _279);
    bool _287 = !_217;
    float _305;
    if (!_287)
    {
        float _289 = in.m_35.x;
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _293 = _289 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[11].y, _95);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        float _309 = float(_63);
        float _311 = 1.0 / _309;
        float _313 = _95 * _311;
        _305 = _313;
    }
    _307 = false;
    float _315 = _305;
    float _317 = as_type<float>(int(gl_VertexIndex));
    float _319 = in.m_28.x;
    float _321 = in.m_28.y;
    float _323 = in.m_28.z;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _333 = in.m_40.x;
    float _335 = in.m_40.y;
    float _337 = 1.0 / _327;
    float _339 = 1.0 / _331;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _343 = _315 + _341;
    int _345 = as_type<int>(_317) & 1;
    bool _347 = _345 != 0;
    int _349 = as_type<int>(_317) & 2;
    bool _351 = _349 != 0;
    float _353 = _321 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _355 = _321 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _357 = _321 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _367 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[5].x, _355);
    float _369 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[4].x, _353);
    float _371 = _361 * _337;
    bool _373 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _375 = isnan(_315);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = _365 * _339;
    float _387 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[6].x, _357);
    bool _389 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _391 = isnan(_315);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _403 = _315 + _401;
    float _405 = -_383;
    float _407 = _405 + 1.0;
    float _409 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[5].z, _367);
    float _411 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[4].z, _369);
    float _413 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[6].z, _387);
    bool _415 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _417 = isnan(_315);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = _333 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _429 = _399 * _407;
    float _431 = fma(_371, _403, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _433 = -_399;
    float _435 = _433 + 1.0;
    float _437 = _409 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _439 = fma(_385, _343, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _441 = _427 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _443 = _425 * _435;
    float _445 = _411 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _447 = _437 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _449 = !_351;
    float _451 = _449 ? (-0.5) : 0.5;
    float _453 = _335 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _455 = _413 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _457 = fma(_445, (*spvDescriptorSet0.vp_c8)._m0[11].x, _447);
    bool _459 = !_347;
    float _461 = _459 ? (-0.5) : 0.5;
    float _463 = _431 * _443;
    float _465 = _453 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _467 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _451);
    float _469 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[11].z, _457);
    float _471 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _461);
    float _473 = -_425;
    float _475 = _473 + 1.0;
    float _477 = _465 * _467;
    float _479 = _437 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _481 = _469 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _483 = _441 * _471;
    float _485 = _477 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _487 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[115].x, _463);
    float _489 = fma(_445, (*spvDescriptorSet0.vp_c8)._m0[10].x, _479);
    float _491 = 1.0 / _481;
    float _493 = _477 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _495 = _477 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _497 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _499 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[25].x, _485);
    float _501 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[10].z, _489);
    float _503 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[24].x, _493);
    float _505 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[26].x, _495);
    float _507 = fma(_497, (*spvDescriptorSet0.vp_c8)._m0[25].z, _499);
    float _509 = _501 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _511 = fma(_497, (*spvDescriptorSet0.vp_c8)._m0[24].z, _503);
    float _513 = fma(_497, (*spvDescriptorSet0.vp_c8)._m0[26].z, _505);
    float _515 = _507 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _517 = _509 + _481;
    float _519 = fma(_439, _429, _487);
    float _521 = _511 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _523 = _437 + _515;
    float _525 = _517 * _491;
    float _527 = _525 * 0.5;
    float _529 = _513 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _531 = _445 + _521;
    float _533 = _523 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _535 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _537 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[30].w, _535);
    float _539 = _455 + _529;
    float _541 = _523 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _543 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[1].x, _533);
    bool _545 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _547 = isnan(0.5);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _553 = _549 || _551;
    float _555 = _523 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _557 = 1.0 / _537;
    float _559 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[0].x, _541);
    float _561 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[1].z, _543);
    float _563 = _523 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _565 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[2].x, _555);
    float _567 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[0].z, _559);
    float _569 = _561 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _571 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[117].x, _519);
    float _573 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[3].x, _563);
    float _575 = _567 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _577 = _569 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _579 = _569 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _581 = _569 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _583 = _569 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _585 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[2].z, _565);
    float _587 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[3].z, _573);
    float _589 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[4].x, _577);
    float _591 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[5].x, _579);
    float _593 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[6].x, _581);
    float _595 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[7].x, _583);
    float _597 = _575;
    float _599 = _577;
    if (_553)
    {
        _597 = 1.0;
    }
    float _601 = _597;
    float _603 = _585 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _605 = _601;
    if (_553)
    {
        _599 = 1.0;
    }
    float _607 = _599;
    float _609 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _611 = _557 * _609;
    float _613 = _607;
    if (!_553)
    {
        float _615 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _617 = _615 * 0.15915493667125701904296875;
        float _619 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _621 = _617 * 6.283185482025146484375;
        float _623 = cos(_621);
        float _625 = _619 * 0.15915493667125701904296875;
        float _627 = _617 * 6.283185482025146484375;
        float _629 = sin(_627);
        float _631 = 1.0 / _623;
        float _633 = _625 * 6.283185482025146484375;
        float _635 = cos(_633);
        float _637 = _629 * _631;
        float _639 = _625 * 6.283185482025146484375;
        float _641 = sin(_639);
        float _643 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _645 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _643;
        float _647 = _635 * _637;
        float _649 = 1.0 / _647;
        float _651 = 1.0 / _645;
        float _653 = _641 * _649;
        float _655 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _657 = fma(_611, _653, _655);
        float _659 = _657 * _651;
        float _661 = precise::clamp(_659, 0.0, 1.0);
        _605 = _661;
    }
    float _663 = _605;
    if (!_553)
    {
        float _665 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _667 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _669 = _665 * 0.15915493667125701904296875;
        float _671 = _667 * 0.15915493667125701904296875;
        float _673 = _669 * 6.283185482025146484375;
        float _675 = cos(_673);
        float _677 = _669 * 6.283185482025146484375;
        float _679 = sin(_677);
        float _681 = 1.0 / _675;
        float _683 = _671 * 6.283185482025146484375;
        float _685 = cos(_683);
        float _687 = _679 * _681;
        float _689 = _671 * 6.283185482025146484375;
        float _691 = sin(_689);
        float _693 = _685 * _687;
        float _695 = 1.0 / _693;
        float _697 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _699 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _697;
        float _701 = 1.0 / _699;
        float _703 = _691 * _695;
        float _705 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _707 = fma(_611, _703, _705);
        float _709 = _707 * _701;
        float _711 = precise::clamp(_709, 0.0, 1.0);
        float _713 = -_711;
        float _715 = _713 + 1.0;
        _613 = _715;
    }
    float _717 = _613;
    float _719 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[4].z, _589);
    float _721 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[5].z, _591);
    float _723 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[6].z, _593);
    float _725 = _587 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _727 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[7].z, _595);
    bool _729 = _663 > 0.0;
    bool _731 = isnan(_663);
    bool _733 = _729 || _731;
    bool _735 = isnan(0.0);
    bool _737 = _733 || _735;
    float _739 = _283 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _741 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[6].w, _723);
    float _743 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[7].w, _727);
    bool _745 = _717 <= 0.0;
    bool _747 = !_737;
    bool _749 = _745 || _747;
    float _751 = _285 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _753 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[4].w, _719);
    float _755 = _663 * _717;
    float _757 = _281 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _759 = _741 + _743;
    float _761 = _739 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _763 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _765 = _571 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _767 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[5].w, _721);
    float _769 = _757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _771 = _759 * 0.5;
    float _773 = _755 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_42.x = _769;
    out.m_42.y = _761;
    out.m_42.z = _763;
    out.m_42.w = _765;
    out.gl_Position.x = _753;
    out.gl_Position.y = _767;
    out.gl_Position.z = _741;
    out.gl_Position.w = _743;
    out.m_44.z = _771;
    out.m_44.w = _743;
    out.m_31.x = _773;
    if (!_749)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_31.x = 0.0;
    float _775 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _775;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _307 = false;
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
    if (!_67)
    {
        out.m_31.x = 0.0;
    }
    int _73 = 0;
    if (!_67)
    {
        float _75 = _71 * 5.0;
        _73 = as_type<int>(_75);
    }
    int _77 = _73;
    int _79 = _77;
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _831 = as_type<float>(_77);
        out.gl_Position.z = _831;
    }
    if (!_67)
    {
        return out;
    }
    float _81 = in.m_33.w;
    bool _83 = _81 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _85 = isnan(_81);
    bool _87 = _83 || _85;
    bool _89 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _91 = _87 || _89;
    float _93 = -_81;
    float _95 = _93 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _97 = 0.0;
    if (_91)
    {
        float _99 = float(_63);
        _97 = _99;
    }
    float _101 = _97;
    bool _103 = _95 >= _101;
    bool _105 = !_91;
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
        _79 = as_type<int>(_113);
    }
    int _115 = _79;
    if (_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _900 = as_type<float>(_115);
        out.gl_Position.z = _900;
    }
    if (_107)
    {
        return out;
    }
    bool _117 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    bool _119 = !_117;
    float _137;
    if (!_119)
    {
        float _121 = in.m_35.x;
        float _123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _125 = _121 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _127 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[11].x, _95);
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
        float _145 = _95 * _143;
        _137 = _145;
    }
    _139 = false;
    float _147 = _137;
    float _149 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _151 = _147 + _149;
    bool _153 = _147 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _155 = isnan(_147);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _161 = _157 || _159;
    float _163 = float(_161);
    float _165 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _167 = _147 + _165;
    bool _169 = _147 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _171 = isnan(_147);
    bool _173 = _169 || _171;
    bool _175 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _177 = _173 || _175;
    float _179 = float(_177);
    float _181 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _183 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _181;
    float _185 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _187 = _185 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _189 = _147 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _191 = isnan(_147);
    bool _193 = _189 || _191;
    bool _195 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _197 = _193 || _195;
    float _199 = float(_197);
    float _201 = -_163;
    float _203 = _201 + 1.0;
    float _205 = 1.0 / _187;
    float _207 = _199 * _203;
    float _209 = -_199;
    float _211 = _209 + 1.0;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _213;
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _219 = 1.0 / _183;
    float _221 = _179 * _211;
    float _223 = -_179;
    float _225 = _223 + 1.0;
    float _227 = _167 * _205;
    float _229 = _151 * _219;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _235;
    float _239 = fma(_215, _229, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _241 = fma(_233, _229, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _243 = fma(_237, _229, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _245 = _239 * _221;
    float _247 = _241 * _221;
    float _249 = _243 * _221;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _253 = _251 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _257 = _255 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _261 = _259 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _263 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[107].x, _245);
    float _265 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[107].y, _247);
    float _267 = fma(_253, _227, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _269 = fma(_257, _227, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _271 = fma(_261, _227, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _273 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[107].z, _249);
    float _275 = fma(_267, _207, _263);
    float _277 = fma(_269, _207, _265);
    float _279 = fma(_271, _207, _273);
    float _281 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[109].x, _275);
    float _283 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[109].y, _277);
    float _285 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[109].z, _279);
    bool _287 = !_217;
    float _305;
    if (!_287)
    {
        float _289 = in.m_35.x;
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _293 = _289 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[11].y, _95);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        float _309 = float(_63);
        float _311 = 1.0 / _309;
        float _313 = _95 * _311;
        _305 = _313;
    }
    _307 = false;
    float _315 = _305;
    float _317 = as_type<float>(int(gl_VertexIndex));
    float _319 = in.m_28.x;
    float _321 = in.m_28.y;
    float _323 = in.m_28.z;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _333 = in.m_40.x;
    float _335 = in.m_40.y;
    float _337 = 1.0 / _327;
    float _339 = 1.0 / _331;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _343 = _315 + _341;
    int _345 = as_type<int>(_317) & 1;
    bool _347 = _345 != 0;
    int _349 = as_type<int>(_317) & 2;
    bool _351 = _349 != 0;
    float _353 = _321 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _355 = _321 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _357 = _321 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _367 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[5].x, _355);
    float _369 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[4].x, _353);
    float _371 = _361 * _337;
    bool _373 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _375 = isnan(_315);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = _365 * _339;
    float _387 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[6].x, _357);
    bool _389 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _391 = isnan(_315);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _403 = _315 + _401;
    float _405 = -_383;
    float _407 = _405 + 1.0;
    float _409 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[5].z, _367);
    float _411 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[4].z, _369);
    float _413 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[6].z, _387);
    bool _415 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _417 = isnan(_315);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = _333 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _429 = _399 * _407;
    float _431 = fma(_371, _403, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _433 = -_399;
    float _435 = _433 + 1.0;
    float _437 = _409 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _439 = fma(_385, _343, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _441 = _427 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _443 = _425 * _435;
    float _445 = _411 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _447 = _437 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _449 = !_351;
    float _451 = _449 ? (-0.5) : 0.5;
    float _453 = _335 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _455 = _413 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _457 = fma(_445, (*spvDescriptorSet0.vp_c8)._m0[11].x, _447);
    bool _459 = !_347;
    float _461 = _459 ? (-0.5) : 0.5;
    float _463 = _431 * _443;
    float _465 = _453 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _467 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _451);
    float _469 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[11].z, _457);
    float _471 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _461);
    float _473 = -_425;
    float _475 = _473 + 1.0;
    float _477 = _465 * _467;
    float _479 = _437 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _481 = _469 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _483 = _441 * _471;
    float _485 = _477 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _487 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[115].x, _463);
    float _489 = fma(_445, (*spvDescriptorSet0.vp_c8)._m0[10].x, _479);
    float _491 = 1.0 / _481;
    float _493 = _477 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _495 = _477 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _497 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _499 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[25].x, _485);
    float _501 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[10].z, _489);
    float _503 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[24].x, _493);
    float _505 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[26].x, _495);
    float _507 = fma(_497, (*spvDescriptorSet0.vp_c8)._m0[25].z, _499);
    float _509 = _501 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _511 = fma(_497, (*spvDescriptorSet0.vp_c8)._m0[24].z, _503);
    float _513 = fma(_497, (*spvDescriptorSet0.vp_c8)._m0[26].z, _505);
    float _515 = _507 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _517 = _509 + _481;
    float _519 = fma(_439, _429, _487);
    float _521 = _511 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _523 = _437 + _515;
    float _525 = _517 * _491;
    float _527 = _525 * 0.5;
    float _529 = _513 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _531 = _445 + _521;
    float _533 = _523 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _535 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _537 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[30].w, _535);
    float _539 = _455 + _529;
    float _541 = _523 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _543 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[1].x, _533);
    bool _545 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _547 = isnan(0.5);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _553 = _549 || _551;
    float _555 = _523 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _557 = 1.0 / _537;
    float _559 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[0].x, _541);
    float _561 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[1].z, _543);
    float _563 = _523 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _565 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[2].x, _555);
    float _567 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[0].z, _559);
    float _569 = _561 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _571 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[117].x, _519);
    float _573 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[3].x, _563);
    float _575 = _567 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _577 = _569 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _579 = _569 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _581 = _569 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _583 = _569 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _585 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[2].z, _565);
    float _587 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[3].z, _573);
    float _589 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[4].x, _577);
    float _591 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[5].x, _579);
    float _593 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[6].x, _581);
    float _595 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[7].x, _583);
    float _597 = _575;
    float _599 = _577;
    if (_553)
    {
        _597 = 1.0;
    }
    float _601 = _597;
    float _603 = _585 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _605 = _601;
    if (_553)
    {
        _599 = 1.0;
    }
    float _607 = _599;
    float _609 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _611 = _557 * _609;
    float _613 = _607;
    if (!_553)
    {
        float _615 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _617 = _615 * 0.15915493667125701904296875;
        float _619 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _621 = _617 * 6.283185482025146484375;
        float _623 = cos(_621);
        float _625 = _619 * 0.15915493667125701904296875;
        float _627 = _617 * 6.283185482025146484375;
        float _629 = sin(_627);
        float _631 = 1.0 / _623;
        float _633 = _625 * 6.283185482025146484375;
        float _635 = cos(_633);
        float _637 = _629 * _631;
        float _639 = _625 * 6.283185482025146484375;
        float _641 = sin(_639);
        float _643 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _645 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _643;
        float _647 = _635 * _637;
        float _649 = 1.0 / _647;
        float _651 = 1.0 / _645;
        float _653 = _641 * _649;
        float _655 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _657 = fma(_611, _653, _655);
        float _659 = _657 * _651;
        float _661 = precise::clamp(_659, 0.0, 1.0);
        _605 = _661;
    }
    float _663 = _605;
    if (!_553)
    {
        float _665 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _667 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _669 = _665 * 0.15915493667125701904296875;
        float _671 = _667 * 0.15915493667125701904296875;
        float _673 = _669 * 6.283185482025146484375;
        float _675 = cos(_673);
        float _677 = _669 * 6.283185482025146484375;
        float _679 = sin(_677);
        float _681 = 1.0 / _675;
        float _683 = _671 * 6.283185482025146484375;
        float _685 = cos(_683);
        float _687 = _679 * _681;
        float _689 = _671 * 6.283185482025146484375;
        float _691 = sin(_689);
        float _693 = _685 * _687;
        float _695 = 1.0 / _693;
        float _697 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _699 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _697;
        float _701 = 1.0 / _699;
        float _703 = _691 * _695;
        float _705 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _707 = fma(_611, _703, _705);
        float _709 = _707 * _701;
        float _711 = precise::clamp(_709, 0.0, 1.0);
        float _713 = -_711;
        float _715 = _713 + 1.0;
        _613 = _715;
    }
    float _717 = _613;
    float _719 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[4].z, _589);
    float _721 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[5].z, _591);
    float _723 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[6].z, _593);
    float _725 = _587 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _727 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[7].z, _595);
    bool _729 = _663 > 0.0;
    bool _731 = isnan(_663);
    bool _733 = _729 || _731;
    bool _735 = isnan(0.0);
    bool _737 = _733 || _735;
    float _739 = _283 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _741 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[6].w, _723);
    float _743 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[7].w, _727);
    bool _745 = _717 <= 0.0;
    bool _747 = !_737;
    bool _749 = _745 || _747;
    float _751 = _285 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _753 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[4].w, _719);
    float _755 = _663 * _717;
    float _757 = _281 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _759 = _741 + _743;
    float _761 = _739 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _763 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _765 = _571 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _767 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[5].w, _721);
    float _769 = _757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _771 = _759 * 0.5;
    float _773 = _755 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_42.x = _769;
    out.m_42.y = _761;
    out.m_42.z = _763;
    out.m_42.w = _765;
    out.gl_Position.x = _753;
    out.gl_Position.y = _767;
    out.gl_Position.z = _741;
    out.gl_Position.w = _743;
    out.m_44.z = _771;
    out.m_44.w = _743;
    out.m_31.x = _773;
    if (!_749)
    {
        return out;
    }
    out.m_31.x = 0.0;
    float _775 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _775;
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
    bool _307 = false;
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
    if (!_67)
    {
        out.m_31.x = 0.0;
    }
    int _73 = 0;
    if (!_67)
    {
        float _75 = _71 * 5.0;
        _73 = as_type<int>(_75);
    }
    int _77 = _73;
    int _79 = _77;
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _831 = as_type<float>(_77);
        out.gl_Position.z = _831;
    }
    if (!_67)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _81 = in.m_33.w;
    bool _83 = _81 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _85 = isnan(_81);
    bool _87 = _83 || _85;
    bool _89 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _91 = _87 || _89;
    float _93 = -_81;
    float _95 = _93 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _97 = 0.0;
    if (_91)
    {
        float _99 = float(_63);
        _97 = _99;
    }
    float _101 = _97;
    bool _103 = _95 >= _101;
    bool _105 = !_91;
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
        _79 = as_type<int>(_113);
    }
    int _115 = _79;
    if (_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _900 = as_type<float>(_115);
        out.gl_Position.z = _900;
    }
    if (_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _117 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    bool _119 = !_117;
    float _137;
    if (!_119)
    {
        float _121 = in.m_35.x;
        float _123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _125 = _121 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _127 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[11].x, _95);
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
        float _145 = _95 * _143;
        _137 = _145;
    }
    _139 = false;
    float _147 = _137;
    float _149 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _151 = _147 + _149;
    bool _153 = _147 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _155 = isnan(_147);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _161 = _157 || _159;
    float _163 = float(_161);
    float _165 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _167 = _147 + _165;
    bool _169 = _147 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _171 = isnan(_147);
    bool _173 = _169 || _171;
    bool _175 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _177 = _173 || _175;
    float _179 = float(_177);
    float _181 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _183 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _181;
    float _185 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _187 = _185 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _189 = _147 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _191 = isnan(_147);
    bool _193 = _189 || _191;
    bool _195 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _197 = _193 || _195;
    float _199 = float(_197);
    float _201 = -_163;
    float _203 = _201 + 1.0;
    float _205 = 1.0 / _187;
    float _207 = _199 * _203;
    float _209 = -_199;
    float _211 = _209 + 1.0;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _213;
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _219 = 1.0 / _183;
    float _221 = _179 * _211;
    float _223 = -_179;
    float _225 = _223 + 1.0;
    float _227 = _167 * _205;
    float _229 = _151 * _219;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _235;
    float _239 = fma(_215, _229, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _241 = fma(_233, _229, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _243 = fma(_237, _229, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _245 = _239 * _221;
    float _247 = _241 * _221;
    float _249 = _243 * _221;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _253 = _251 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _257 = _255 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _261 = _259 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _263 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[107].x, _245);
    float _265 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[107].y, _247);
    float _267 = fma(_253, _227, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _269 = fma(_257, _227, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _271 = fma(_261, _227, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _273 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[107].z, _249);
    float _275 = fma(_267, _207, _263);
    float _277 = fma(_269, _207, _265);
    float _279 = fma(_271, _207, _273);
    float _281 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[109].x, _275);
    float _283 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[109].y, _277);
    float _285 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[109].z, _279);
    bool _287 = !_217;
    float _305;
    if (!_287)
    {
        float _289 = in.m_35.x;
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _293 = _289 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[11].y, _95);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        float _309 = float(_63);
        float _311 = 1.0 / _309;
        float _313 = _95 * _311;
        _305 = _313;
    }
    _307 = false;
    float _315 = _305;
    float _317 = as_type<float>(int(gl_VertexIndex));
    float _319 = in.m_28.x;
    float _321 = in.m_28.y;
    float _323 = in.m_28.z;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _333 = in.m_40.x;
    float _335 = in.m_40.y;
    float _337 = 1.0 / _327;
    float _339 = 1.0 / _331;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _343 = _315 + _341;
    int _345 = as_type<int>(_317) & 1;
    bool _347 = _345 != 0;
    int _349 = as_type<int>(_317) & 2;
    bool _351 = _349 != 0;
    float _353 = _321 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _355 = _321 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _357 = _321 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _367 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[5].x, _355);
    float _369 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[4].x, _353);
    float _371 = _361 * _337;
    bool _373 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _375 = isnan(_315);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = _365 * _339;
    float _387 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[6].x, _357);
    bool _389 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _391 = isnan(_315);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _403 = _315 + _401;
    float _405 = -_383;
    float _407 = _405 + 1.0;
    float _409 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[5].z, _367);
    float _411 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[4].z, _369);
    float _413 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[6].z, _387);
    bool _415 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _417 = isnan(_315);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = _333 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _429 = _399 * _407;
    float _431 = fma(_371, _403, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _433 = -_399;
    float _435 = _433 + 1.0;
    float _437 = _409 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _439 = fma(_385, _343, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _441 = _427 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _443 = _425 * _435;
    float _445 = _411 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _447 = _437 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _449 = !_351;
    float _451 = _449 ? (-0.5) : 0.5;
    float _453 = _335 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _455 = _413 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _457 = fma(_445, (*spvDescriptorSet0.vp_c8)._m0[11].x, _447);
    bool _459 = !_347;
    float _461 = _459 ? (-0.5) : 0.5;
    float _463 = _431 * _443;
    float _465 = _453 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _467 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _451);
    float _469 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[11].z, _457);
    float _471 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _461);
    float _473 = -_425;
    float _475 = _473 + 1.0;
    float _477 = _465 * _467;
    float _479 = _437 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _481 = _469 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _483 = _441 * _471;
    float _485 = _477 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _487 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[115].x, _463);
    float _489 = fma(_445, (*spvDescriptorSet0.vp_c8)._m0[10].x, _479);
    float _491 = 1.0 / _481;
    float _493 = _477 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _495 = _477 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _497 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _499 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[25].x, _485);
    float _501 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[10].z, _489);
    float _503 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[24].x, _493);
    float _505 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[26].x, _495);
    float _507 = fma(_497, (*spvDescriptorSet0.vp_c8)._m0[25].z, _499);
    float _509 = _501 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _511 = fma(_497, (*spvDescriptorSet0.vp_c8)._m0[24].z, _503);
    float _513 = fma(_497, (*spvDescriptorSet0.vp_c8)._m0[26].z, _505);
    float _515 = _507 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _517 = _509 + _481;
    float _519 = fma(_439, _429, _487);
    float _521 = _511 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _523 = _437 + _515;
    float _525 = _517 * _491;
    float _527 = _525 * 0.5;
    float _529 = _513 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _531 = _445 + _521;
    float _533 = _523 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _535 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _537 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[30].w, _535);
    float _539 = _455 + _529;
    float _541 = _523 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _543 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[1].x, _533);
    bool _545 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _547 = isnan(0.5);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _553 = _549 || _551;
    float _555 = _523 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _557 = 1.0 / _537;
    float _559 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[0].x, _541);
    float _561 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[1].z, _543);
    float _563 = _523 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _565 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[2].x, _555);
    float _567 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[0].z, _559);
    float _569 = _561 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _571 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[117].x, _519);
    float _573 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[3].x, _563);
    float _575 = _567 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _577 = _569 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _579 = _569 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _581 = _569 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _583 = _569 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _585 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[2].z, _565);
    float _587 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[3].z, _573);
    float _589 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[4].x, _577);
    float _591 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[5].x, _579);
    float _593 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[6].x, _581);
    float _595 = fma(_575, (*spvDescriptorSet0.vp_c8)._m0[7].x, _583);
    float _597 = _575;
    float _599 = _577;
    if (_553)
    {
        _597 = 1.0;
    }
    float _601 = _597;
    float _603 = _585 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _605 = _601;
    if (_553)
    {
        _599 = 1.0;
    }
    float _607 = _599;
    float _609 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _611 = _557 * _609;
    float _613 = _607;
    if (!_553)
    {
        float _615 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _617 = _615 * 0.15915493667125701904296875;
        float _619 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _621 = _617 * 6.283185482025146484375;
        float _623 = cos(_621);
        float _625 = _619 * 0.15915493667125701904296875;
        float _627 = _617 * 6.283185482025146484375;
        float _629 = sin(_627);
        float _631 = 1.0 / _623;
        float _633 = _625 * 6.283185482025146484375;
        float _635 = cos(_633);
        float _637 = _629 * _631;
        float _639 = _625 * 6.283185482025146484375;
        float _641 = sin(_639);
        float _643 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _645 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _643;
        float _647 = _635 * _637;
        float _649 = 1.0 / _647;
        float _651 = 1.0 / _645;
        float _653 = _641 * _649;
        float _655 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _657 = fma(_611, _653, _655);
        float _659 = _657 * _651;
        float _661 = precise::clamp(_659, 0.0, 1.0);
        _605 = _661;
    }
    float _663 = _605;
    if (!_553)
    {
        float _665 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _667 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _669 = _665 * 0.15915493667125701904296875;
        float _671 = _667 * 0.15915493667125701904296875;
        float _673 = _669 * 6.283185482025146484375;
        float _675 = cos(_673);
        float _677 = _669 * 6.283185482025146484375;
        float _679 = sin(_677);
        float _681 = 1.0 / _675;
        float _683 = _671 * 6.283185482025146484375;
        float _685 = cos(_683);
        float _687 = _679 * _681;
        float _689 = _671 * 6.283185482025146484375;
        float _691 = sin(_689);
        float _693 = _685 * _687;
        float _695 = 1.0 / _693;
        float _697 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _699 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _697;
        float _701 = 1.0 / _699;
        float _703 = _691 * _695;
        float _705 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _707 = fma(_611, _703, _705);
        float _709 = _707 * _701;
        float _711 = precise::clamp(_709, 0.0, 1.0);
        float _713 = -_711;
        float _715 = _713 + 1.0;
        _613 = _715;
    }
    float _717 = _613;
    float _719 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[4].z, _589);
    float _721 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[5].z, _591);
    float _723 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[6].z, _593);
    float _725 = _587 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _727 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[7].z, _595);
    bool _729 = _663 > 0.0;
    bool _731 = isnan(_663);
    bool _733 = _729 || _731;
    bool _735 = isnan(0.0);
    bool _737 = _733 || _735;
    float _739 = _283 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _741 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[6].w, _723);
    float _743 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[7].w, _727);
    bool _745 = _717 <= 0.0;
    bool _747 = !_737;
    bool _749 = _745 || _747;
    float _751 = _285 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _753 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[4].w, _719);
    float _755 = _663 * _717;
    float _757 = _281 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _759 = _741 + _743;
    float _761 = _739 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _763 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _765 = _571 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _767 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[5].w, _721);
    float _769 = _757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _771 = _759 * 0.5;
    float _773 = _755 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_42.x = _769;
    out.m_42.y = _761;
    out.m_42.z = _763;
    out.m_42.w = _765;
    out.gl_Position.x = _753;
    out.gl_Position.y = _767;
    out.gl_Position.z = _741;
    out.gl_Position.w = _743;
    out.m_44.z = _771;
    out.m_44.w = _743;
    out.m_31.x = _773;
    if (!_749)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_31.x = 0.0;
    float _775 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _775;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

