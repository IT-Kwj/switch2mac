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
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _709 = as_type<float>(_79);
        out.gl_Position.z = _709;
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
    if (_91)
    {
        float _97 = float(_63);
        _73 = _97;
    }
    float _99 = _73;
    bool _101 = _95 >= _99;
    bool _103 = !_91;
    bool _105 = _101 || _103;
    float _107 = _99;
    if (_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    if (_105)
    {
        out.m_31.x = 0.0;
    }
    int _111 = 0;
    if (_105)
    {
        float _113 = _109 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    if (_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _778 = as_type<float>(_115);
        out.gl_Position.z = _778;
    }
    if (_105)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _117 = in.m_35.x;
    float _119 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _121 = _95 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _125 = _123 != 0;
    int _127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _129 = _127 != 0;
    int _131 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _133 = _131 != 0;
    float _135 = _121 * _119;
    float _137 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[20].x, _135);
    float _139 = _137 * 6.283185482025146484375;
    float _141 = floor(_137);
    float _143 = _139 * 0.15915493667125701904296875;
    bool _145 = !_125;
    int _147 = _145 ? 0 : 1;
    int _149 = abs(_147);
    float _151 = _143 * 6.283185482025146484375;
    float _153 = cos(_151);
    bool _155 = !_133;
    int _157 = _155 ? 0 : 1;
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _161 = abs(_157);
    float _163 = -_141;
    float _165 = _137 + _163;
    bool _167 = !_129;
    int _169 = _167 ? 0 : 1;
    int _171 = abs(_169);
    float _173 = -_165;
    float _175 = fma(_173, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _177 = float(_149);
    float _179 = fma(_153, 0.5, 0.5);
    bool _181 = _165 < 0.5;
    float _183 = float(_181);
    float _185 = abs(_175);
    float _187 = _177 * _185;
    float _189 = float(_161);
    float _191 = -_179;
    float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _195 = float(_171);
    float _197 = -_183;
    float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _201 = fma(_189, _193, _187);
    float _203 = abs(_199);
    float _205 = fma(_195, _203, _201);
    bool _207 = !_159;
    float _223;
    if (!_207)
    {
        float _209 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _211 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[12].x, _95);
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
        float _231 = _95 * _229;
        _223 = _231;
    }
    _225 = false;
    float _233 = _223;
    float _235 = as_type<float>(int(gl_VertexIndex));
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = _233 + _237;
    bool _241 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _243 = isnan(_233);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _255 = _233 + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _257;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _263 = _261 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _265 = -_251;
    float _267 = _265 + 1.0;
    float _269 = 1.0 / _259;
    bool _271 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _273 = isnan(_233);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    bool _283 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _285 = isnan(_233);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _295;
    float _299 = _281 * _267;
    float _301 = -_281;
    float _303 = _301 + 1.0;
    float _305 = 1.0 / _263;
    float _307 = _293 * _303;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _313 = -_293;
    float _315 = _313 + 1.0;
    int _317 = as_type<int>(_235) & 1;
    bool _319 = _317 != 0;
    int _321 = as_type<int>(_235) & 2;
    bool _323 = _321 != 0;
    float _325 = _239 * _269;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _327;
    float _331 = in.m_28.x;
    float _333 = in.m_28.y;
    float _335 = in.m_28.z;
    float _337 = _255 * _305;
    float _339 = fma(_297, _325, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _341 = fma(_329, _325, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _343 = in.m_40.x;
    float _345 = in.m_40.y;
    float _347 = _339 * _307;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _353 = _341 * _307;
    float _355 = fma(_311, _337, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _357 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[143].x, _347);
    float _359 = fma(_351, _337, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _361 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[143].y, _353);
    float _363 = fma(_355, _299, _357);
    float _365 = fma(_359, _299, _361);
    float _367 = _333 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _369 = _333 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _371 = _333 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _373 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[145].y, _365);
    float _375 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[5].x, _367);
    float _377 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[4].x, _369);
    float _379 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[6].x, _371);
    float _381 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[145].x, _363);
    float _383 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[5].z, _375);
    float _385 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[4].z, _377);
    float _387 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[6].z, _379);
    float _389 = _373 * _345;
    float _391 = _383 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _393 = _381 * _343;
    float _395 = _385 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _397 = !_323;
    float _399 = _397 ? (-0.5) : 0.5;
    float _401 = _391 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _403 = _205 * _389;
    float _405 = _387 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _407 = !_319;
    float _409 = _407 ? (-0.5) : 0.5;
    float _411 = fma(_395, (*spvDescriptorSet0.vp_c8)._m0[11].x, _401);
    float _413 = _205 * _393;
    float _415 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _399);
    float _417 = _403 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _419 = fma(_405, (*spvDescriptorSet0.vp_c8)._m0[11].z, _411);
    float _421 = _391 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _423 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _409);
    float _425 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _427 = _417 * _415;
    float _429 = _419 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _431 = fma(_395, (*spvDescriptorSet0.vp_c8)._m0[10].x, _421);
    float _433 = _425 * _423;
    float _435 = _427 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _437 = 1.0 / _429;
    bool _439 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _441 = isnan(0.5);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _447 = _443 || _445;
    float _449 = fma(_405, (*spvDescriptorSet0.vp_c8)._m0[10].z, _431);
    float _451 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _453 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[25].x, _435);
    float _455 = _427 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _457 = _427 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _459 = _449 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _461 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[25].z, _453);
    float _463 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[24].x, _455);
    float _465 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[26].x, _457);
    float _467 = _459 + _429;
    float _469 = _461 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _471 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[24].z, _463);
    float _473 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[26].z, _465);
    float _475 = _391 + _469;
    float _477 = _467 * _437;
    float _479 = _477 * 0.5;
    float _481 = _471 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _483 = _473 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _485 = _469;
    if (_447)
    {
        _485 = 1.0;
    }
    float _487 = _485;
    float _489 = _487;
    if (!_447)
    {
        float _491 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _493 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _495 = _491 * 0.15915493667125701904296875;
        float _497 = _493 * 0.15915493667125701904296875;
        float _499 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _501 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[30].w, _499);
        float _503 = _495 * 6.283185482025146484375;
        float _505 = cos(_503);
        float _507 = _495 * 6.283185482025146484375;
        float _509 = sin(_507);
        float _511 = 1.0 / _505;
        float _513 = _497 * 6.283185482025146484375;
        float _515 = cos(_513);
        float _517 = _509 * _511;
        float _519 = _497 * 6.283185482025146484375;
        float _521 = sin(_519);
        float _523 = _515 * _517;
        float _525 = 1.0 / _501;
        float _527 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _529 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _527;
        float _531 = 1.0 / _523;
        float _533 = 1.0 / _529;
        float _535 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _537 = _525 * _535;
        float _539 = _521 * _531;
        float _541 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _543 = fma(_539, _537, _541);
        float _545 = _543 * _533;
        float _547 = precise::clamp(_545, 0.0, 1.0);
        float _549 = -_547;
        float _551 = _549 + 1.0;
        _489 = _551;
    }
    float _553 = _489;
    float _555 = _395 + _481;
    float _557 = _475 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _559 = _405 + _483;
    float _561 = _475 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _563 = _475 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _565 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[1].x, _557);
    float _567 = _475 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _569 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[0].x, _561);
    float _571 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[2].x, _563);
    float _573 = fma(_559, (*spvDescriptorSet0.vp_c8)._m0[1].z, _565);
    float _575 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[3].x, _567);
    float _577 = fma(_559, (*spvDescriptorSet0.vp_c8)._m0[0].z, _569);
    float _579 = fma(_559, (*spvDescriptorSet0.vp_c8)._m0[2].z, _571);
    float _581 = _573 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _583 = fma(_559, (*spvDescriptorSet0.vp_c8)._m0[3].z, _575);
    float _585 = _577 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _587 = _579 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _589 = _581 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _591 = _581 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _593 = _581 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _595 = _581 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _597 = fma(_585, (*spvDescriptorSet0.vp_c8)._m0[5].x, _589);
    float _599 = fma(_585, (*spvDescriptorSet0.vp_c8)._m0[6].x, _591);
    float _601 = fma(_585, (*spvDescriptorSet0.vp_c8)._m0[4].x, _593);
    float _603 = fma(_585, (*spvDescriptorSet0.vp_c8)._m0[7].x, _595);
    float _605 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[5].z, _597);
    float _607 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[6].z, _599);
    float _609 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[4].z, _601);
    float _611 = _583 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _613 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[7].z, _603);
    float _615 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[4].w, _609);
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _619 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[5].w, _605);
    float _621 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[6].w, _607);
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _625 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[7].w, _613);
    bool _627 = _553 > 0.0;
    bool _629 = isnan(_553);
    bool _631 = _627 || _629;
    bool _633 = isnan(0.0);
    bool _635 = _631 || _633;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _639 = _623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _641 = _621 + _625;
    float _643 = _617 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _645 = _637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _649 = _553 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _651 = _641 * 0.5;
    out.m_42.x = _643;
    out.m_42.y = _639;
    out.m_42.z = _645;
    out.m_42.w = _647;
    out.m_31.x = _649;
    out.gl_Position.x = _615;
    out.gl_Position.y = _619;
    out.gl_Position.z = _621;
    out.gl_Position.w = _625;
    out.m_44.z = _651;
    out.m_44.w = _625;
    if (_635)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_31.x = 0.0;
    float _653 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _653;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
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
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _709 = as_type<float>(_79);
        out.gl_Position.z = _709;
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
    if (_91)
    {
        float _97 = float(_63);
        _73 = _97;
    }
    float _99 = _73;
    bool _101 = _95 >= _99;
    bool _103 = !_91;
    bool _105 = _101 || _103;
    float _107 = _99;
    if (_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    if (_105)
    {
        out.m_31.x = 0.0;
    }
    int _111 = 0;
    if (_105)
    {
        float _113 = _109 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    if (_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _778 = as_type<float>(_115);
        out.gl_Position.z = _778;
    }
    if (_105)
    {
        return out;
    }
    float _117 = in.m_35.x;
    float _119 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _121 = _95 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _125 = _123 != 0;
    int _127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _129 = _127 != 0;
    int _131 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _133 = _131 != 0;
    float _135 = _121 * _119;
    float _137 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[20].x, _135);
    float _139 = _137 * 6.283185482025146484375;
    float _141 = floor(_137);
    float _143 = _139 * 0.15915493667125701904296875;
    bool _145 = !_125;
    int _147 = _145 ? 0 : 1;
    int _149 = abs(_147);
    float _151 = _143 * 6.283185482025146484375;
    float _153 = cos(_151);
    bool _155 = !_133;
    int _157 = _155 ? 0 : 1;
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _161 = abs(_157);
    float _163 = -_141;
    float _165 = _137 + _163;
    bool _167 = !_129;
    int _169 = _167 ? 0 : 1;
    int _171 = abs(_169);
    float _173 = -_165;
    float _175 = fma(_173, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _177 = float(_149);
    float _179 = fma(_153, 0.5, 0.5);
    bool _181 = _165 < 0.5;
    float _183 = float(_181);
    float _185 = abs(_175);
    float _187 = _177 * _185;
    float _189 = float(_161);
    float _191 = -_179;
    float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _195 = float(_171);
    float _197 = -_183;
    float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _201 = fma(_189, _193, _187);
    float _203 = abs(_199);
    float _205 = fma(_195, _203, _201);
    bool _207 = !_159;
    float _223;
    if (!_207)
    {
        float _209 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _211 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[12].x, _95);
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
        float _231 = _95 * _229;
        _223 = _231;
    }
    _225 = false;
    float _233 = _223;
    float _235 = as_type<float>(int(gl_VertexIndex));
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = _233 + _237;
    bool _241 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _243 = isnan(_233);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _255 = _233 + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _257;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _263 = _261 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _265 = -_251;
    float _267 = _265 + 1.0;
    float _269 = 1.0 / _259;
    bool _271 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _273 = isnan(_233);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    bool _283 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _285 = isnan(_233);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _295;
    float _299 = _281 * _267;
    float _301 = -_281;
    float _303 = _301 + 1.0;
    float _305 = 1.0 / _263;
    float _307 = _293 * _303;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _313 = -_293;
    float _315 = _313 + 1.0;
    int _317 = as_type<int>(_235) & 1;
    bool _319 = _317 != 0;
    int _321 = as_type<int>(_235) & 2;
    bool _323 = _321 != 0;
    float _325 = _239 * _269;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _327;
    float _331 = in.m_28.x;
    float _333 = in.m_28.y;
    float _335 = in.m_28.z;
    float _337 = _255 * _305;
    float _339 = fma(_297, _325, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _341 = fma(_329, _325, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _343 = in.m_40.x;
    float _345 = in.m_40.y;
    float _347 = _339 * _307;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _353 = _341 * _307;
    float _355 = fma(_311, _337, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _357 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[143].x, _347);
    float _359 = fma(_351, _337, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _361 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[143].y, _353);
    float _363 = fma(_355, _299, _357);
    float _365 = fma(_359, _299, _361);
    float _367 = _333 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _369 = _333 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _371 = _333 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _373 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[145].y, _365);
    float _375 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[5].x, _367);
    float _377 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[4].x, _369);
    float _379 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[6].x, _371);
    float _381 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[145].x, _363);
    float _383 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[5].z, _375);
    float _385 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[4].z, _377);
    float _387 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[6].z, _379);
    float _389 = _373 * _345;
    float _391 = _383 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _393 = _381 * _343;
    float _395 = _385 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _397 = !_323;
    float _399 = _397 ? (-0.5) : 0.5;
    float _401 = _391 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _403 = _205 * _389;
    float _405 = _387 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _407 = !_319;
    float _409 = _407 ? (-0.5) : 0.5;
    float _411 = fma(_395, (*spvDescriptorSet0.vp_c8)._m0[11].x, _401);
    float _413 = _205 * _393;
    float _415 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _399);
    float _417 = _403 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _419 = fma(_405, (*spvDescriptorSet0.vp_c8)._m0[11].z, _411);
    float _421 = _391 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _423 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _409);
    float _425 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _427 = _417 * _415;
    float _429 = _419 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _431 = fma(_395, (*spvDescriptorSet0.vp_c8)._m0[10].x, _421);
    float _433 = _425 * _423;
    float _435 = _427 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _437 = 1.0 / _429;
    bool _439 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _441 = isnan(0.5);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _447 = _443 || _445;
    float _449 = fma(_405, (*spvDescriptorSet0.vp_c8)._m0[10].z, _431);
    float _451 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _453 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[25].x, _435);
    float _455 = _427 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _457 = _427 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _459 = _449 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _461 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[25].z, _453);
    float _463 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[24].x, _455);
    float _465 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[26].x, _457);
    float _467 = _459 + _429;
    float _469 = _461 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _471 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[24].z, _463);
    float _473 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[26].z, _465);
    float _475 = _391 + _469;
    float _477 = _467 * _437;
    float _479 = _477 * 0.5;
    float _481 = _471 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _483 = _473 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _485 = _469;
    if (_447)
    {
        _485 = 1.0;
    }
    float _487 = _485;
    float _489 = _487;
    if (!_447)
    {
        float _491 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _493 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _495 = _491 * 0.15915493667125701904296875;
        float _497 = _493 * 0.15915493667125701904296875;
        float _499 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _501 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[30].w, _499);
        float _503 = _495 * 6.283185482025146484375;
        float _505 = cos(_503);
        float _507 = _495 * 6.283185482025146484375;
        float _509 = sin(_507);
        float _511 = 1.0 / _505;
        float _513 = _497 * 6.283185482025146484375;
        float _515 = cos(_513);
        float _517 = _509 * _511;
        float _519 = _497 * 6.283185482025146484375;
        float _521 = sin(_519);
        float _523 = _515 * _517;
        float _525 = 1.0 / _501;
        float _527 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _529 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _527;
        float _531 = 1.0 / _523;
        float _533 = 1.0 / _529;
        float _535 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _537 = _525 * _535;
        float _539 = _521 * _531;
        float _541 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _543 = fma(_539, _537, _541);
        float _545 = _543 * _533;
        float _547 = precise::clamp(_545, 0.0, 1.0);
        float _549 = -_547;
        float _551 = _549 + 1.0;
        _489 = _551;
    }
    float _553 = _489;
    float _555 = _395 + _481;
    float _557 = _475 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _559 = _405 + _483;
    float _561 = _475 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _563 = _475 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _565 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[1].x, _557);
    float _567 = _475 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _569 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[0].x, _561);
    float _571 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[2].x, _563);
    float _573 = fma(_559, (*spvDescriptorSet0.vp_c8)._m0[1].z, _565);
    float _575 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[3].x, _567);
    float _577 = fma(_559, (*spvDescriptorSet0.vp_c8)._m0[0].z, _569);
    float _579 = fma(_559, (*spvDescriptorSet0.vp_c8)._m0[2].z, _571);
    float _581 = _573 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _583 = fma(_559, (*spvDescriptorSet0.vp_c8)._m0[3].z, _575);
    float _585 = _577 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _587 = _579 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _589 = _581 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _591 = _581 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _593 = _581 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _595 = _581 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _597 = fma(_585, (*spvDescriptorSet0.vp_c8)._m0[5].x, _589);
    float _599 = fma(_585, (*spvDescriptorSet0.vp_c8)._m0[6].x, _591);
    float _601 = fma(_585, (*spvDescriptorSet0.vp_c8)._m0[4].x, _593);
    float _603 = fma(_585, (*spvDescriptorSet0.vp_c8)._m0[7].x, _595);
    float _605 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[5].z, _597);
    float _607 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[6].z, _599);
    float _609 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[4].z, _601);
    float _611 = _583 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _613 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[7].z, _603);
    float _615 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[4].w, _609);
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _619 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[5].w, _605);
    float _621 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[6].w, _607);
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _625 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[7].w, _613);
    bool _627 = _553 > 0.0;
    bool _629 = isnan(_553);
    bool _631 = _627 || _629;
    bool _633 = isnan(0.0);
    bool _635 = _631 || _633;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _639 = _623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _641 = _621 + _625;
    float _643 = _617 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _645 = _637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _649 = _553 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _651 = _641 * 0.5;
    out.m_42.x = _643;
    out.m_42.y = _639;
    out.m_42.z = _645;
    out.m_42.w = _647;
    out.m_31.x = _649;
    out.gl_Position.x = _615;
    out.gl_Position.y = _619;
    out.gl_Position.z = _621;
    out.gl_Position.w = _625;
    out.m_44.z = _651;
    out.m_44.w = _625;
    if (_635)
    {
        return out;
    }
    out.m_31.x = 0.0;
    float _653 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _653;
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
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _709 = as_type<float>(_79);
        out.gl_Position.z = _709;
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
    if (_91)
    {
        float _97 = float(_63);
        _73 = _97;
    }
    float _99 = _73;
    bool _101 = _95 >= _99;
    bool _103 = !_91;
    bool _105 = _101 || _103;
    float _107 = _99;
    if (_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    if (_105)
    {
        out.m_31.x = 0.0;
    }
    int _111 = 0;
    if (_105)
    {
        float _113 = _109 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    if (_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _778 = as_type<float>(_115);
        out.gl_Position.z = _778;
    }
    if (_105)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _117 = in.m_35.x;
    float _119 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _121 = _95 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _125 = _123 != 0;
    int _127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _129 = _127 != 0;
    int _131 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _133 = _131 != 0;
    float _135 = _121 * _119;
    float _137 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[20].x, _135);
    float _139 = _137 * 6.283185482025146484375;
    float _141 = floor(_137);
    float _143 = _139 * 0.15915493667125701904296875;
    bool _145 = !_125;
    int _147 = _145 ? 0 : 1;
    int _149 = abs(_147);
    float _151 = _143 * 6.283185482025146484375;
    float _153 = cos(_151);
    bool _155 = !_133;
    int _157 = _155 ? 0 : 1;
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _161 = abs(_157);
    float _163 = -_141;
    float _165 = _137 + _163;
    bool _167 = !_129;
    int _169 = _167 ? 0 : 1;
    int _171 = abs(_169);
    float _173 = -_165;
    float _175 = fma(_173, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _177 = float(_149);
    float _179 = fma(_153, 0.5, 0.5);
    bool _181 = _165 < 0.5;
    float _183 = float(_181);
    float _185 = abs(_175);
    float _187 = _177 * _185;
    float _189 = float(_161);
    float _191 = -_179;
    float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _195 = float(_171);
    float _197 = -_183;
    float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _201 = fma(_189, _193, _187);
    float _203 = abs(_199);
    float _205 = fma(_195, _203, _201);
    bool _207 = !_159;
    float _223;
    if (!_207)
    {
        float _209 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _211 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[12].x, _95);
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
        float _231 = _95 * _229;
        _223 = _231;
    }
    _225 = false;
    float _233 = _223;
    float _235 = as_type<float>(int(gl_VertexIndex));
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = _233 + _237;
    bool _241 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _243 = isnan(_233);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _255 = _233 + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _257;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _263 = _261 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _265 = -_251;
    float _267 = _265 + 1.0;
    float _269 = 1.0 / _259;
    bool _271 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _273 = isnan(_233);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    bool _283 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _285 = isnan(_233);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _295;
    float _299 = _281 * _267;
    float _301 = -_281;
    float _303 = _301 + 1.0;
    float _305 = 1.0 / _263;
    float _307 = _293 * _303;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _313 = -_293;
    float _315 = _313 + 1.0;
    int _317 = as_type<int>(_235) & 1;
    bool _319 = _317 != 0;
    int _321 = as_type<int>(_235) & 2;
    bool _323 = _321 != 0;
    float _325 = _239 * _269;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _327;
    float _331 = in.m_28.x;
    float _333 = in.m_28.y;
    float _335 = in.m_28.z;
    float _337 = _255 * _305;
    float _339 = fma(_297, _325, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _341 = fma(_329, _325, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _343 = in.m_40.x;
    float _345 = in.m_40.y;
    float _347 = _339 * _307;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _353 = _341 * _307;
    float _355 = fma(_311, _337, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _357 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[143].x, _347);
    float _359 = fma(_351, _337, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _361 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[143].y, _353);
    float _363 = fma(_355, _299, _357);
    float _365 = fma(_359, _299, _361);
    float _367 = _333 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _369 = _333 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _371 = _333 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _373 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[145].y, _365);
    float _375 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[5].x, _367);
    float _377 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[4].x, _369);
    float _379 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[6].x, _371);
    float _381 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[145].x, _363);
    float _383 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[5].z, _375);
    float _385 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[4].z, _377);
    float _387 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[6].z, _379);
    float _389 = _373 * _345;
    float _391 = _383 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _393 = _381 * _343;
    float _395 = _385 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _397 = !_323;
    float _399 = _397 ? (-0.5) : 0.5;
    float _401 = _391 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _403 = _205 * _389;
    float _405 = _387 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _407 = !_319;
    float _409 = _407 ? (-0.5) : 0.5;
    float _411 = fma(_395, (*spvDescriptorSet0.vp_c8)._m0[11].x, _401);
    float _413 = _205 * _393;
    float _415 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _399);
    float _417 = _403 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _419 = fma(_405, (*spvDescriptorSet0.vp_c8)._m0[11].z, _411);
    float _421 = _391 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _423 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _409);
    float _425 = _413 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _427 = _417 * _415;
    float _429 = _419 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _431 = fma(_395, (*spvDescriptorSet0.vp_c8)._m0[10].x, _421);
    float _433 = _425 * _423;
    float _435 = _427 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _437 = 1.0 / _429;
    bool _439 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _441 = isnan(0.5);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _447 = _443 || _445;
    float _449 = fma(_405, (*spvDescriptorSet0.vp_c8)._m0[10].z, _431);
    float _451 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _453 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[25].x, _435);
    float _455 = _427 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _457 = _427 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _459 = _449 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _461 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[25].z, _453);
    float _463 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[24].x, _455);
    float _465 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[26].x, _457);
    float _467 = _459 + _429;
    float _469 = _461 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _471 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[24].z, _463);
    float _473 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[26].z, _465);
    float _475 = _391 + _469;
    float _477 = _467 * _437;
    float _479 = _477 * 0.5;
    float _481 = _471 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _483 = _473 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _485 = _469;
    if (_447)
    {
        _485 = 1.0;
    }
    float _487 = _485;
    float _489 = _487;
    if (!_447)
    {
        float _491 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _493 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _495 = _491 * 0.15915493667125701904296875;
        float _497 = _493 * 0.15915493667125701904296875;
        float _499 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _501 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[30].w, _499);
        float _503 = _495 * 6.283185482025146484375;
        float _505 = cos(_503);
        float _507 = _495 * 6.283185482025146484375;
        float _509 = sin(_507);
        float _511 = 1.0 / _505;
        float _513 = _497 * 6.283185482025146484375;
        float _515 = cos(_513);
        float _517 = _509 * _511;
        float _519 = _497 * 6.283185482025146484375;
        float _521 = sin(_519);
        float _523 = _515 * _517;
        float _525 = 1.0 / _501;
        float _527 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _529 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _527;
        float _531 = 1.0 / _523;
        float _533 = 1.0 / _529;
        float _535 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _537 = _525 * _535;
        float _539 = _521 * _531;
        float _541 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _543 = fma(_539, _537, _541);
        float _545 = _543 * _533;
        float _547 = precise::clamp(_545, 0.0, 1.0);
        float _549 = -_547;
        float _551 = _549 + 1.0;
        _489 = _551;
    }
    float _553 = _489;
    float _555 = _395 + _481;
    float _557 = _475 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _559 = _405 + _483;
    float _561 = _475 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _563 = _475 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _565 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[1].x, _557);
    float _567 = _475 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _569 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[0].x, _561);
    float _571 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[2].x, _563);
    float _573 = fma(_559, (*spvDescriptorSet0.vp_c8)._m0[1].z, _565);
    float _575 = fma(_555, (*spvDescriptorSet0.vp_c8)._m0[3].x, _567);
    float _577 = fma(_559, (*spvDescriptorSet0.vp_c8)._m0[0].z, _569);
    float _579 = fma(_559, (*spvDescriptorSet0.vp_c8)._m0[2].z, _571);
    float _581 = _573 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _583 = fma(_559, (*spvDescriptorSet0.vp_c8)._m0[3].z, _575);
    float _585 = _577 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _587 = _579 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _589 = _581 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _591 = _581 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _593 = _581 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _595 = _581 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _597 = fma(_585, (*spvDescriptorSet0.vp_c8)._m0[5].x, _589);
    float _599 = fma(_585, (*spvDescriptorSet0.vp_c8)._m0[6].x, _591);
    float _601 = fma(_585, (*spvDescriptorSet0.vp_c8)._m0[4].x, _593);
    float _603 = fma(_585, (*spvDescriptorSet0.vp_c8)._m0[7].x, _595);
    float _605 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[5].z, _597);
    float _607 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[6].z, _599);
    float _609 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[4].z, _601);
    float _611 = _583 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _613 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[7].z, _603);
    float _615 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[4].w, _609);
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _619 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[5].w, _605);
    float _621 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[6].w, _607);
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _625 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[7].w, _613);
    bool _627 = _553 > 0.0;
    bool _629 = isnan(_553);
    bool _631 = _627 || _629;
    bool _633 = isnan(0.0);
    bool _635 = _631 || _633;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _639 = _623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _641 = _621 + _625;
    float _643 = _617 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _645 = _637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _649 = _553 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _651 = _641 * 0.5;
    out.m_42.x = _643;
    out.m_42.y = _639;
    out.m_42.z = _645;
    out.m_42.w = _647;
    out.m_31.x = _649;
    out.gl_Position.x = _615;
    out.gl_Position.y = _619;
    out.gl_Position.z = _621;
    out.gl_Position.w = _625;
    out.m_44.z = _651;
    out.m_44.w = _625;
    if (_635)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_31.x = 0.0;
    float _653 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _653;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

