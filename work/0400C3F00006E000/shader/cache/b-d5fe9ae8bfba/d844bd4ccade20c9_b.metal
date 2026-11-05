#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_72 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_104 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_80 [[user(locn5)]];
    float4 m_96 [[user(locn6)]];
    float4 m_78 [[user(locn7)]];
    float4 m_86 [[user(locn8)]];
    float4 m_76 [[user(locn9)]];
    float4 m_84 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 m_92 [[user(locn12)]];
    float4 m_88 [[user(locn13)]];
    float4 m_102 [[user(locn14)]];
    float4 m_98 [[user(locn15)]];
    float4 m_100 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_94 [[attribute(0)]];
    float4 m_62 [[attribute(1)]];
    float4 m_64 [[attribute(2)]];
    float4 m_66 [[attribute(3)]];
    float4 m_82 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_50 [[attribute(7)]];
    float4 m_68 [[attribute(8)]];
    float4 m_70 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4903 = false;
    bool _4042 = false;
    bool _561 = false;
    bool _455 = false;
    bool _263 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_48.w;
    float _120 = in.m_50.w;
    float _122 = trunc(_118);
    int _125 = int(_122);
    float _127 = -_120;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _129;
    bool _133 = _125 >= 1;
    float _135 = 0.0;
    float _137 = _120;
    float _139 = _129;
    if (!_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _135;
    if (!_133)
    {
        out.m_55.x = 0.0;
    }
    int _143 = 0;
    if (!_133)
    {
        float _145 = _141 * 5.0;
        _143 = as_type<int>(_145);
    }
    int _147 = _143;
    int _149 = _147;
    if (!_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5213 = as_type<float>(_147);
        out.gl_Position.z = _5213;
    }
    if (!_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _151 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _153 = isnan(_120);
    bool _155 = _151 || _153;
    bool _157 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _159 = _155 || _157;
    float _161 = float(_125);
    bool _163 = _129 >= _161;
    bool _165 = !_159;
    bool _167 = _163 || _165;
    float _169 = 1.0 / _161;
    if (_167)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _137;
    if (_167)
    {
        out.m_55.x = 0.0;
    }
    float _173 = _129 * _169;
    float _175 = _173;
    if (_167)
    {
        float _177 = _171 * 5.0;
        _149 = as_type<int>(_177);
    }
    int _179 = _149;
    out.m_53.x = _173;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5276 = as_type<float>(_179);
        out.gl_Position.z = _5276;
    }
    if (_167)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _181 = as_type<float>(int(gl_VertexIndex));
    float _183 = in.m_60.x;
    float _185 = in.m_60.y;
    float _187 = in.m_60.z;
    float _189 = in.m_62.x;
    float _191 = in.m_62.y;
    float _193 = in.m_62.z;
    float _195 = in.m_64.x;
    float _197 = in.m_64.y;
    float _199 = in.m_64.z;
    float _201 = in.m_66.x;
    float _203 = in.m_66.y;
    float _205 = in.m_66.z;
    int _207 = as_type<int>(_181) & 1;
    bool _209 = _207 != 0;
    int _211 = as_type<int>(_181) & 2;
    bool _213 = _211 != 0;
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _217 = !_209;
    float _219 = _217 ? (-0.5) : 0.5;
    bool _221 = !_213;
    float _223 = _221 ? (-0.5) : 0.5;
    float _225 = _185 * _191;
    float _227 = _185 * _197;
    float _229 = fma(_183, _189, _225);
    float _231 = _185 * _203;
    float _233 = fma(_183, _195, _227);
    float _235 = fma(_187, _193, _229);
    float _237 = fma(_183, _201, _231);
    float _239 = fma(_187, _199, _233);
    float _241 = fma(_187, _205, _237);
    bool _243 = !_215;
    float _261;
    if (!_243)
    {
        float _245 = in.m_68.x;
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _249 = _245 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _253 = _251 * _247;
        float _255 = floor(_253);
        float _257 = -_255;
        float _259 = _253 + _257;
        _261 = _259;
        _263 = true;
    }
    else
    {
        _261 = _173;
    }
    _263 = false;
    float _265 = _261;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = _265 + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = _265 + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _277 = _265 + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _281 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _283 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _287;
    bool _291 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _293 = isnan(_265);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = 1.0 / _285;
    bool _305 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _307 = 1.0 / _281;
    float _309 = 1.0 / _289;
    float _311 = _277 * _303;
    bool _313 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _315 = isnan(_265);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = _269 * _307;
    bool _327 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _329 = isnan(_265);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -_301;
    float _341 = _339 + 1.0;
    float _343 = _337 * _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _349 = _273 * _309;
    bool _351 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _353 = isnan(_265);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -_337;
    float _365 = _363 + 1.0;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _371;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _379 = _361 * _365;
    float _381 = -_361;
    float _383 = _381 + 1.0;
    float _385 = fma(_369, _325, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _387 = fma(_373, _325, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _389 = _323 * _383;
    float _391 = -_323;
    float _393 = _391 + 1.0;
    float _395 = fma(_347, _311, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _397 = _385 * _389;
    float _399 = _387 * _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _401;
    float _405 = fma(_377, _311, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _407;
    float _411 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[143].x, _397);
    float _413 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _415 = fma(_403, _349, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _417 = fma(_409, _349, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _419 = fma(_395, _379, _411);
    float _421 = fma(_405, _379, _413);
    float _423 = fma(_415, _343, _419);
    float _425 = fma(_417, _343, _421);
    float _427 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[146].x, _423);
    float _429 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[146].y, _425);
    bool _431 = !_305;
    int _433 = as_type<int>(_349);
    float _435 = _311;
    float _453;
    if (!_431)
    {
        float _437 = in.m_68.x;
        float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _441 = _437 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _445 = _443 * _439;
        float _447 = floor(_445);
        float _449 = -_447;
        float _451 = _445 + _449;
        _453 = _451;
        _455 = true;
    }
    else
    {
        _453 = _173;
    }
    _455 = false;
    float _457 = _453;
    bool _459 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _461 = isnan(_457);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _475 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _477 = isnan(_457);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _487;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _493 = _457 + _491;
    float _495 = -_469;
    float _497 = _495 + 1.0;
    bool _499 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _501 = 1.0 / _473;
    float _503 = _485 * _497;
    float _505 = -_485;
    float _507 = _505 + 1.0;
    float _509 = _489 * _501;
    float _511 = fma(_509, _493, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _515 = _511 * _503;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _519 = _513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _521 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[115].x, _515);
    float _523 = _517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _525 = in.m_70.x;
    float _527 = in.m_70.y;
    float _529 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[116].x, _521);
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _533 = _529 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _535 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _523;
    out.m_72.y = _519;
    out.m_72.z = _535;
    out.m_72.w = _533;
    float _537 = _429 * _527;
    float _539 = _427 * _525;
    bool _541 = !_499;
    float _559;
    if (!_541)
    {
        float _543 = in.m_68.x;
        float _545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _547 = _543 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _549 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _551 = _549 * _545;
        float _553 = floor(_551);
        float _555 = -_553;
        float _557 = _551 + _555;
        _559 = _557;
        _561 = true;
    }
    else
    {
        _559 = _173;
    }
    _561 = false;
    float _563 = _559;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _567 = _563 + _565;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _573 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _575 = isnan(_563);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _589 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _591 = isnan(_563);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _601;
    bool _605 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _607 = isnan(_563);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _613 = _609 || _611;
    float _615 = float(_613);
    float _617 = 1.0 / _571;
    float _619 = -_583;
    float _621 = _619 + 1.0;
    bool _623 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _625 = _599 * _621;
    float _627 = -_599;
    float _629 = _627 + 1.0;
    float _631 = 1.0 / _587;
    float _633 = _603 * _617;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _639 = fma(_633, _567, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _641 = _637 * _631;
    float _643 = _639 * _625;
    float _645 = -_615;
    float _647 = _645 + 1.0;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _651 = _563 + _649;
    float _653 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[131].x, _643);
    float _655 = _583 * _647;
    float _657 = fma(_641, _651, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _661 = fma(_657, _655, _653);
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _667 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[133].x, _661);
    float _671 = _663 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _669 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_74.x = _667;
    out.m_74.y = _673;
    out.m_74.z = _671;
    out.m_74.w = _675;
    bool _677 = !_623;
    float _679 = _675;
    if (!_677)
    {
        float _681 = in.m_68.x;
        float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _685 = _681 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[14].x, _129);
        float _689 = _687 * _683;
        float _691 = floor(_689);
        float _693 = -_691;
        float _695 = _689 + _693;
        _175 = _695;
    }
    float _697 = _175;
    float _699 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _701 = int(_699);
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _705 = _703 != 0;
    float _707 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _709 = int(_707);
    float _711 = float(_701);
    float _713 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _715 = int(_713);
    if (_705)
    {
        _679 = 1.0;
    }
    float _717 = _679;
    float _719 = 0.0;
    float _721 = _717;
    if (_705)
    {
        _719 = 1.0;
    }
    float _723 = _719;
    float _725 = _723;
    if (_705)
    {
        _433 = 0;
    }
    int _727 = _433;
    float _729 = float(_709);
    float _731 = 1.0 / _711;
    float _733 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _735 = int(_733);
    float _737 = float(uint(_715));
    float _739 = 1.0 / _729;
    float _741 = _731 * _129;
    float _743 = 1.0 / _737;
    float _745 = float(uint(_735));
    int _747 = ~_735;
    int _749 = _747 + 1;
    float _751 = trunc(_741);
    int _753 = int(_751);
    float _755 = _739 * _129;
    float _757 = _739;
    float _759 = _711;
    int _761 = _727;
    if (_705)
    {
        float _763 = in.m_68.x;
        float _765 = in.m_68.y;
        _757 = _763;
        _759 = _765;
    }
    float _767 = _757;
    float _769 = _759;
    float _771 = 1.0 / _745;
    int _773 = as_type<int>(_743) + (-2);
    float _775 = trunc(_755);
    int _777 = int(_775);
    float _779 = float(uint(_753));
    float _781 = as_type<float>(_773) * _779;
    float _783 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _785 = int(_783);
    int _787 = as_type<int>(_771) + (-2);
    float _789 = _771;
    float _791 = _767;
    float _793 = _769;
    if (_705)
    {
        _435 = _767;
    }
    float _795 = _435;
    float _797 = _795;
    if (_705)
    {
        _789 = _769;
    }
    float _799 = _789;
    float _801 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _803 = int(_801);
    float _805 = float(uint(_777));
    float _807 = as_type<float>(_787) * _805;
    float _809 = trunc(_781);
    float _811 = precise::max(_809, 0.0);
    uint _814 = uint(_811);
    float _816 = float(uint(_785));
    float _818 = float(_803);
    float _820 = 1.0 / _816;
    float _822 = 1.0 / _818;
    int _824 = as_type<int>(_816);
    float _826 = _818;
    float _828 = _807;
    float _830 = _799;
    if (_705)
    {
        _824 = 0;
    }
    int _832 = _824;
    float _834 = trunc(_807);
    float _836 = precise::max(_834, 0.0);
    uint _838 = uint(_836);
    int _840 = _832;
    if (_705)
    {
        _826 = _795;
    }
    float _842 = _826;
    float _844 = _842;
    if (_705)
    {
        _828 = _795;
    }
    float _846 = _828;
    float _848 = _846;
    if (!_705)
    {
        float _850 = in.m_68.x;
        float _852 = in.m_68.y;
        float _854 = in.m_68.z;
        float _856 = _850 * 3.1415927410125732421875;
        float _858 = _856 * 0.15915493667125701904296875;
        float _860 = _852 * 3.1415927410125732421875;
        float _862 = _860 * 0.15915493667125701904296875;
        float _864 = _858 * 6.283185482025146484375;
        float _866 = sin(_864);
        float _868 = _862 * 6.283185482025146484375;
        float _870 = sin(_868);
        _725 = 5.839270114898681640625;
        _844 = _854;
        _721 = 7.345489978790283203125;
        _791 = _850;
        _797 = _852;
        _793 = _852;
        _848 = _866;
        _830 = _870;
        _761 = 1;
        _840 = 2;
    }
    float _872 = _725;
    float _874 = _844;
    float _876 = _721;
    float _878 = _791;
    float _880 = _797;
    float _882 = _793;
    float _884 = _848;
    float _886 = _830;
    int _888 = _761;
    int _890 = _840;
    int _892 = _749 * int(_838);
    int _894 = _892 + _777;
    int _896 = ~_715;
    int _898 = _896 + 1;
    float _900 = in.m_68.z;
    float _902 = in.m_68.w;
    float _904 = _822 * _129;
    float _906 = _872 * _874;
    float _908 = float(uint(_894));
    int _910 = _898 * int(_814);
    int _912 = _910 + _753;
    float _914 = _876 * _878;
    float _916 = floor(_906);
    float _918 = _876 * _880;
    float _920 = as_type<float>(_787) * _908;
    float _922 = float(uint(_912));
    float _924 = _878 * 2.0;
    float _926 = float(_735);
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _930 = _697 + _928;
    float _932 = float(_777);
    float _934 = trunc(_920);
    float _936 = precise::max(_934, 0.0);
    uint _938 = uint(_936);
    float _940 = as_type<float>(_773) * _922;
    bool _942 = _932 >= _926;
    bool _944 = isnan(_932);
    bool _946 = _942 || _944;
    bool _948 = isnan(_926);
    bool _950 = _946 || _948;
    float _952 = float(_950);
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _956 = _954 != 0;
    float _958 = trunc(_904);
    int _960 = int(_958);
    bool _962 = _882 > 0.5;
    float _964 = -_916;
    float _966 = _906 + _964;
    bool _968 = _902 > 0.5;
    bool _970 = _900 > 0.5;
    int _972 = as_type<int>(_820) + (-2);
    float _974 = floor(_914);
    int _976 = int(_838) + int(_938);
    int _978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _980 = _978 != 0;
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _984 = _982 != 0;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _988 = _986 != 0;
    int _990 = ~_715;
    int _992 = _990 + 1;
    int _994 = ~_735;
    int _996 = _994 + 1;
    float _998 = trunc(_940);
    float _1000 = precise::max(_998, 0.0);
    uint _1002 = uint(_1000);
    float _1004 = float(uint(_960));
    float _1006 = float(_753);
    float _1008 = as_type<float>(_972) * _1004;
    float _1010 = -_219;
    int _1012 = _962 ? as_type<int>(_1010) : as_type<int>(_219);
    float _1014 = trunc(_952);
    int _1016 = int(_1014);
    float _1018 = -_974;
    float _1020 = _914 + _1018;
    float _1022 = float(_715);
    int _1024 = _996 * _976;
    int _1026 = _1024 + _777;
    int _1028 = int(_968);
    int _1030 = _970 ? 2 : 0;
    int _1032 = _1028 | _1030;
    int _1034 = _956 ? 4 : 0;
    int _1036 = _1032 | _1034;
    int _1038 = _980 ? 8 : 0;
    int _1040 = _1036 | _1038;
    int _1042 = _984 ? 16 : 0;
    int _1044 = _1040 | _1042;
    int _1046 = _988 ? 32 : 0;
    int _1048 = _1044 | _1046;
    int _1050 = _962 ? 64 : 0;
    int _1052 = _1048 | _1050;
    int _1054 = _1052 & 64;
    bool _1056 = !_984;
    float _1058 = _1056 ? _219 : as_type<float>(_1012);
    int _1060 = int(_814) + int(_1002);
    float _1062 = trunc(_1008);
    float _1064 = precise::max(_1062, 0.0);
    uint _1066 = uint(_1064);
    float _1068 = -_223;
    int _1070 = _970 ? as_type<int>(_1068) : as_type<int>(_223);
    bool _1072 = _1006 >= _1022;
    bool _1074 = isnan(_1006);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan(_1022);
    bool _1080 = _1076 || _1078;
    float _1082 = float(_1080);
    float _1084 = _1020 * _926;
    bool _1086 = !_988;
    float _1088 = _1086 ? _223 : as_type<float>(_1070);
    float _1090 = floor(_918);
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1094 = _1092 != 0;
    int _1096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1098 = _1096 != 0;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1102 = _1100 != 0;
    bool _1104 = !_956;
    int _1106 = _1104 ? 0 : 1;
    int _1108 = _992 * _1060;
    int _1110 = _1108 + _753;
    bool _1112 = uint(_1026) >= uint(_735);
    bool _1114 = !_1098;
    int _1116 = _1114 ? 0 : 1;
    float _1118 = trunc(_1084);
    int _1120 = int(_1118);
    bool _1122 = !_1094;
    int _1124 = _1122 ? 0 : 1;
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1128 = _1126 != 0;
    bool _1130 = uint(_1110) >= uint(_715);
    float _1132 = _966 * _1022;
    bool _1134 = !_1102;
    int _1136 = _1134 ? 0 : 1;
    float _1138 = trunc(_1082);
    int _1140 = int(_1138);
    bool _1142 = !_1128;
    int _1144 = _1142 ? 0 : 1;
    float _1146 = -_1090;
    float _1148 = _918 + _1146;
    bool _1150 = !_1130;
    int _1152 = _1150 ? 0 : (-1);
    bool _1154 = !_1112;
    int _1156 = _1154 ? 0 : (-1);
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1160 = _1158 != 0;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1164 = _1162 != 0;
    int _1166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1168 = _1166 != 0;
    float _1170 = trunc(_1132);
    int _1172 = int(_1170);
    int _1174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1176 = _1174 != 0;
    int _1178 = ~_785;
    int _1180 = _1178 + 1;
    int _1182 = ~_1060;
    int _1184 = _1182 + _1152;
    int _1186 = _1184 + 1;
    bool _1188 = !_1176;
    int _1190 = _1188 ? 0 : 1;
    int _1192 = _1180 * int(_1066);
    int _1194 = _1192 + _960;
    int _1196 = abs(_1106);
    float _1198 = floor(_924);
    int _1200 = ~_976;
    int _1202 = _1200 + _1156;
    int _1204 = _1202 + 1;
    int _1206 = _715 * _1186;
    int _1208 = _1206 + _753;
    int _1210 = abs(_1190);
    int _1212 = _1120 * _1196;
    int _1214 = _1212 + _777;
    float _1216 = float(uint(_1194));
    int _1218 = _735 * _1204;
    int _1220 = _1218 + _777;
    float _1222 = _169 * _129;
    bool _1224 = _735 == 0;
    bool _1226 = !_1164;
    int _1228 = _1226 ? 0 : 1;
    float _1230 = _926 * _1222;
    bool _1232 = _1054 != 0;
    float _1234 = as_type<float>(_972) * _1216;
    bool _1236 = !_1160;
    int _1238 = _1236 ? 0 : 1;
    float _1240 = _1022 * _1222;
    int _1242 = ~_1016;
    int _1244 = _1242 + 1;
    int _1246 = _1244 + 1;
    float _1248 = trunc(_1230);
    int _1250 = int(_1248);
    bool _1252 = !_1224;
    int _1254 = _1252 ? _1220 : (-1);
    int _1256 = _1172 * _1210;
    int _1258 = _1256 + _753;
    bool _1260 = _715 == 0;
    float _1262 = _884 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    int _1264 = ~_1140;
    int _1266 = _1264 + 1;
    int _1268 = _1266 + 1;
    int _1270 = _1254 * _1246;
    bool _1272 = !_1260;
    int _1274 = _1272 ? _1208 : (-1);
    float _1276 = trunc(_1234);
    float _1278 = precise::max(_1276, 0.0);
    uint _1280 = uint(_1278);
    int _1282 = _735 + (-1);
    int _1284 = _715 + (-1);
    int _1286 = _1274 * _1268;
    int _1288 = abs(_1116);
    int _1290 = _1016 * _1282;
    int _1292 = _1290 + _1270;
    int _1294 = abs(_1136);
    int _1296 = _1140 * _1284;
    int _1298 = _1296 + _1286;
    int _1300 = abs(_1144);
    int _1302 = _1292 * _1288;
    int _1304 = abs(_1124);
    float _1306 = trunc(_1240);
    int _1308 = int(_1306);
    int _1310 = abs(_1228);
    float _1312 = _882 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1314 = ~_785;
    int _1316 = _1314 + 1;
    int _1318 = _1250 * _1304;
    int _1320 = _1318 + _1302;
    int _1322 = _1214 * _1294;
    int _1324 = _1322 + _1320;
    int _1326 = int(_1066) + int(_1280);
    int _1328 = _1120 * _1300;
    int _1330 = _1328 + _1324;
    bool _1332 = !_1168;
    int _1334 = _1332 ? 0 : 1;
    int _1336 = _1298 * _1310;
    int _1338 = abs(_1238);
    int _1340 = _1316 * _1326;
    int _1342 = _1340 + _960;
    float _1344 = float(uint(_1330));
    float _1346 = -_223;
    int _1348 = _968 ? as_type<int>(_1346) : as_type<int>(_223);
    int _1350 = _1308 * _1338;
    int _1352 = _1350 + _1336;
    float _1354 = -_219;
    int _1356 = _970 ? as_type<int>(_1354) : as_type<int>(_219);
    float _1358 = float(_785);
    float _1360 = float(_960);
    int _1362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1364 = _1362 != 0;
    float _1366 = _1358 * _1222;
    int _1368 = abs(_1334);
    float _1370 = as_type<float>(_787) * _1344;
    bool _1372 = uint(_1342) >= uint(_785);
    int _1374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1376 = _1374 != 0;
    int _1378 = _1258 * _1368;
    int _1380 = _1378 + _1352;
    bool _1382 = _1360 >= _1358;
    bool _1384 = isnan(_1360);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan(_1358);
    bool _1390 = _1386 || _1388;
    float _1392 = float(_1390);
    float _1394 = trunc(_1366);
    int _1396 = int(_1394);
    bool _1398 = !_1364;
    int _1400 = _1398 ? 0 : 1;
    bool _1402 = !_980;
    float _1404 = _1402 ? _223 : as_type<float>(_1348);
    bool _1406 = !_1376;
    int _1408 = _1406 ? 0 : 1;
    int _1410 = abs(_1400);
    float _1412 = trunc(_1370);
    float _1414 = precise::max(_1412, 0.0);
    uint _1416 = uint(_1414);
    bool _1418 = !_1372;
    int _1420 = _1418 ? 0 : (-1);
    float _1422 = _1148 * _1358;
    int _1424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1426 = _1424 != 0;
    int _1428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1430 = _1428 != 0;
    int _1432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1434 = _1432 != 0;
    int _1436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1438 = _1436 != 0;
    int _1440 = ~_1326;
    int _1442 = _1440 + _1420;
    int _1444 = _1442 + 1;
    float _1446 = trunc(_1392);
    int _1448 = int(_1446);
    int _1450 = ~_735;
    int _1452 = _1450 + 1;
    int _1454 = _1172 * _1410;
    int _1456 = _1454 + _1380;
    bool _1458 = !_1426;
    int _1460 = _1458 ? 0 : 1;
    int _1462 = _785 * _1444;
    int _1464 = _1462 + _960;
    bool _1466 = _785 == 0;
    float _1468 = float(uint(_1456));
    int _1470 = _1452 * int(_1416);
    int _1472 = _1470 + _1330;
    bool _1474 = !_1430;
    int _1476 = _1474 ? 0 : 1;
    float _1478 = trunc(_1422);
    int _1480 = int(_1478);
    int _1482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1484 = _1482 != 0;
    float _1486 = as_type<float>(_773) * _1468;
    bool _1488 = !_1466;
    int _1490 = _1488 ? _1464 : (-1);
    float _1492 = float(uint(_1472));
    int _1494 = ~_1448;
    int _1496 = _1494 + 1;
    int _1498 = _1496 + 1;
    float _1500 = trunc(_1486);
    float _1502 = precise::max(_1500, 0.0);
    uint _1504 = uint(_1502);
    int _1506 = abs(_1476);
    float _1508 = as_type<float>(_787) * _1492;
    int _1510 = abs(_1460);
    int _1512 = _1490 * _1498;
    int _1514 = _785 + (-1);
    float _1516 = _1468;
    float _1518 = as_type<float>(_888);
    float _1520 = as_type<float>(_890);
    if (_1484)
    {
        float _1522 = in.m_68.w;
        _1516 = _1522;
    }
    float _1524 = _1516;
    int _1526 = abs(_1408);
    float _1528 = trunc(_1508);
    float _1530 = precise::max(_1528, 0.0);
    uint _1532 = uint(_1530);
    bool _1534 = _735 == 0;
    int _1536 = _1448 * _1514;
    int _1538 = _1536 + _1512;
    int _1540 = _1538 * _1506;
    int _1542 = ~_715;
    int _1544 = _1542 + 1;
    float _1546 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1548 = log2(_1546);
    float _1550 = 0.0;
    float _1552 = as_type<float>(_1526);
    if (!_1484)
    {
        _1550 = _219;
    }
    float _1554 = _1550;
    int _1556 = _1396 * _1510;
    int _1558 = _1556 + _1540;
    int _1560 = _1480 * _1526;
    int _1562 = _1560 + _960;
    bool _1564 = !_1434;
    int _1566 = _1564 ? 0 : 1;
    int _1568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1570 = _1568 != 0;
    int _1572 = _1544 * int(_1504);
    int _1574 = _1572 + _1456;
    int _1576 = int(_1416) + int(_1532);
    int _1578 = abs(_1566);
    float _1580 = float(uint(_1574));
    float _1582 = _1554;
    if (_1484)
    {
        float _1584 = _1524 * 3.1415927410125732421875;
        _1552 = _1584;
    }
    float _1586 = _1552;
    int _1588 = ~_735;
    int _1590 = _1588 + 1;
    bool _1592 = !_1438;
    int _1594 = _1592 ? 0 : 1;
    float _1596 = as_type<float>(_773) * _1580;
    int _1598 = _1590 * _1576;
    int _1600 = _1598 + _1330;
    float _1602 = _1586;
    if (_1484)
    {
        float _1604 = _1586 * 0.15915493667125701904296875;
        _1602 = _1604;
    }
    float _1606 = _1602;
    int _1608 = abs(_1594);
    float _1610 = trunc(_1596);
    float _1612 = precise::max(_1610, 0.0);
    uint _1614 = uint(_1612);
    int _1616 = _1562 * _1578;
    int _1618 = _1616 + _1558;
    bool _1620 = uint(_1600) >= uint(_735);
    float _1622 = as_type<float>(_1396);
    if (_1570)
    {
        float _1624 = in.m_68.x;
        _1622 = _1624;
    }
    float _1626 = _1622;
    float _1628 = float(uint(_1214));
    int _1630 = _1480 * _1608;
    int _1632 = _1630 + _1618;
    bool _1634 = !_1620;
    int _1636 = _1634 ? 0 : (-1);
    float _1638 = _1606;
    if (_1484)
    {
        float _1640 = _1606 * 6.283185482025146484375;
        float _1642 = sin(_1640);
        _1638 = _1642;
    }
    float _1644 = _1638;
    float _1646 = as_type<float>(_787) * _1628;
    int _1648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1650 = _1648 != 0;
    int _1652 = ~_1576;
    int _1654 = _1652 + _1636;
    int _1656 = _1654 + 1;
    bool _1658 = !_1650;
    float _1660 = _1658 ? _219 : as_type<float>(_1356);
    float _1662 = trunc(_1646);
    float _1664 = precise::max(_1662, 0.0);
    uint _1666 = uint(_1664);
    float _1668 = float(uint(_1632));
    int _1670 = _735 * _1656;
    int _1672 = _1670 + _1330;
    int _1674 = int(_1504) + int(_1614);
    float _1676 = float(uint(_1258));
    float _1678 = as_type<float>(_972) * _1668;
    bool _1680 = !_1534;
    int _1682 = _1680 ? _1672 : (-1);
    bool _1684 = _1650;
    float _1686 = _1668;
    if (_1484)
    {
        bool _1688 = _1644 > 0.5;
        _1684 = _1688;
    }
    bool _1690 = _1684;
    float _1692 = trunc(_1678);
    float _1694 = precise::max(_1692, 0.0);
    uint _1696 = uint(_1694);
    int _1698 = ~_735;
    int _1700 = _1698 + 1;
    if (_1570)
    {
        float _1702 = _1626 * 3.1415927410125732421875;
        _1686 = _1702;
    }
    float _1704 = _1686;
    float _1706 = _1704;
    if (_1484)
    {
        float _1708 = -_219;
        float _1710 = _1690 ? _1708 : _219;
        _1582 = _1710;
    }
    float _1712 = _1582;
    float _1714 = as_type<float>(_773) * _1676;
    int _1716 = _1682 & 3;
    bool _1718 = _1716 != 0;
    int _1720 = _1700 * int(_1666);
    int _1722 = _1720 + _1214;
    int _1724 = _1682 & 3;
    bool _1726 = _1724 != 0;
    if (_1570)
    {
        float _1728 = _1704 * 0.15915493667125701904296875;
        _1706 = _1728;
    }
    float _1730 = _1706;
    int _1732 = ~_785;
    int _1734 = _1732 + 1;
    float _1736 = trunc(_1714);
    float _1738 = precise::max(_1736, 0.0);
    uint _1740 = uint(_1738);
    int _1742 = _1718 ? 0 : 1;
    bool _1744 = uint(_1724) > 1u;
    float _1746 = float(uint(_1722));
    float _1748 = _1730;
    if (_1570)
    {
        float _1750 = _1730 * 6.283185482025146484375;
        float _1752 = sin(_1750);
        _1748 = _1752;
    }
    float _1754 = _1748;
    int _1756 = ~_715;
    int _1758 = _1756 + 1;
    float _1760 = as_type<float>(_787) * _1746;
    float _1762 = -_223;
    int _1764 = _1232 ? as_type<int>(_1762) : as_type<int>(_223);
    int _1766 = _1734 * int(_1696);
    int _1768 = _1766 + _1632;
    int _1770 = ~_1742;
    int _1772 = _1770 + 1;
    int _1774 = _1772 + 1;
    int _1776 = _1758 * _1674;
    int _1778 = _1776 + _1456;
    bool _1780 = uint(_1724) >= 2u;
    float _1782 = trunc(_1760);
    float _1784 = precise::max(_1782, 0.0);
    uint _1786 = uint(_1784);
    float _1788 = float(uint(_1768));
    int _1790 = _1774;
    if (!_1744)
    {
        int _1792 = ~_1742;
        int _1794 = _1792 + 1;
        _1790 = _1794;
    }
    int _1796 = _1790;
    bool _1798 = uint(_1778) >= uint(_715);
    float _1800 = as_type<float>(_972) * _1788;
    int _1802 = _1780 ? 0 : 1;
    bool _1804 = _1724 != 3;
    bool _1806 = !_1798;
    int _1808 = _1806 ? 0 : (-1);
    float _1810 = trunc(_1800);
    float _1812 = precise::max(_1810, 0.0);
    uint _1814 = uint(_1812);
    int _1816 = ~_715;
    int _1818 = _1816 + 1;
    int _1820 = ~_1674;
    int _1822 = _1820 + _1808;
    int _1824 = _1822 + 1;
    int _1826 = ~_1802;
    int _1828 = _1826 + 1;
    int _1830 = _1828 + 1;
    int _1832 = _1818 * int(_1740);
    int _1834 = _1832 + _1258;
    int _1836 = _715 * _1824;
    int _1838 = _1836 + _1456;
    float _1840 = 0.0;
    int _1842 = _1830;
    bool _1844 = _1804;
    if (!_1570)
    {
        _1840 = _223;
    }
    float _1846 = _1840;
    float _1848 = _1846;
    if (_1804)
    {
        int _1850 = ~_1802;
        int _1852 = _1850 + 1;
        _1842 = _1852;
    }
    int _1854 = _1842;
    if (_1570)
    {
        bool _1856 = _1754 > 0.5;
        _1844 = _1856;
    }
    bool _1858 = _1844;
    float _1860 = float(uint(_1834));
    bool _1862 = !_1260;
    int _1864 = _1862 ? _1838 : (-1);
    int _1866 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1868 = _1866 != 0;
    float _1870 = as_type<float>(_773) * _1860;
    if (_1570)
    {
        float _1872 = -_223;
        float _1874 = _1858 ? _1872 : _223;
        _1848 = _1874;
    }
    float _1876 = _1848;
    int _1878 = _1864 & 3;
    bool _1880 = _1878 != 0;
    bool _1882 = !_1868;
    float _1884 = _1882 ? _223 : as_type<float>(_1764);
    float _1886 = trunc(_1870);
    float _1888 = precise::max(_1886, 0.0);
    uint _1890 = uint(_1888);
    int _1892 = int(_1696) + int(_1814);
    int _1894 = ~_785;
    int _1896 = _1894 + 1;
    int _1898 = _1864 & 3;
    bool _1900 = _1898 != 0;
    bool _1902 = uint(_1878) > 1u;
    int _1904 = _1896 * _1892;
    int _1906 = _1904 + _1632;
    int _1908 = int(_1666) + int(_1786);
    int _1910 = ~_735;
    int _1912 = _1910 + 1;
    int _1914 = _1900 ? 0 : 1;
    int _1916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1918 = _1916 != 0;
    int _1920 = _1912 * _1908;
    int _1922 = _1920 + _1214;
    float _1924 = float(uint(_1562));
    bool _1926 = !_1918;
    int _1928 = _1926 ? 0 : 1;
    bool _1930 = uint(_1906) >= uint(_785);
    float _1932 = as_type<float>(_972) * _1924;
    int _1934 = ~_1914;
    int _1936 = _1934 + 1;
    int _1938 = _1936 + 1;
    int _1940 = _1938;
    if (!_1902)
    {
        int _1942 = ~_1914;
        int _1944 = _1942 + 1;
        _1940 = _1944;
    }
    int _1946 = _1940;
    bool _1948 = uint(_1922) >= uint(_735);
    bool _1950 = !_1930;
    int _1952 = _1950 ? 0 : (-1);
    float _1954 = trunc(_1932);
    float _1956 = precise::max(_1954, 0.0);
    uint _1958 = uint(_1956);
    bool _1960 = _1878 != 3;
    int _1962 = ~_715;
    int _1964 = _1962 + 1;
    bool _1966 = !_1948;
    int _1968 = _1966 ? 0 : (-1);
    bool _1970 = uint(_1878) >= 2u;
    int _1972 = int(_1740) + int(_1890);
    int _1974 = ~_1892;
    int _1976 = _1974 + _1952;
    int _1978 = _1976 + 1;
    int _1980 = _1970 ? 0 : 1;
    int _1982 = _785 * _1978;
    int _1984 = _1982 + _1632;
    int _1986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1988 = _1986 != 0;
    int _1990 = _1964 * _1972;
    int _1992 = _1990 + _1258;
    int _1994 = ~_785;
    int _1996 = _1994 + 1;
    int _1998 = ~_1980;
    int _2000 = _1998 + 1;
    int _2002 = _2000 + 1;
    int _2004 = _2002;
    float _2006 = as_type<float>(_1964);
    if (_1960)
    {
        int _2008 = ~_1980;
        int _2010 = _2008 + 1;
        _2004 = _2010;
    }
    int _2012 = _2004;
    int _2014 = _1996 * int(_1958);
    int _2016 = _2014 + _1562;
    int _2018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2020 = _2018 != 0;
    bool _2022 = !_1988;
    int _2024 = _2022 ? 0 : 1;
    bool _2026 = uint(_1992) >= uint(_715);
    bool _2028 = !_1466;
    int _2030 = _2028 ? _1984 : (-1);
    bool _2032 = !_2020;
    int _2034 = _2032 ? 0 : 1;
    bool _2036 = !_2026;
    int _2038 = _2036 ? 0 : (-1);
    int _2040 = _2030 & 3;
    bool _2042 = _2040 != 0;
    int _2044 = _2030 & 3;
    bool _2046 = _2044 != 0;
    float _2048 = float(uint(_2016));
    int _2050 = _2042 ? 0 : 1;
    bool _2052 = uint(_2044) > 1u;
    float _2054 = as_type<float>(_972) * _2048;
    int _2056 = ~_2050;
    int _2058 = _2056 + 1;
    int _2060 = _2058 + 1;
    float _2062 = trunc(_2054);
    float _2064 = precise::max(_2062, 0.0);
    uint _2066 = uint(_2064);
    float _2068 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2070 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2072 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2068);
    int _2074 = _2060;
    float _2076 = _2054;
    if (!_2052)
    {
        int _2078 = ~_2050;
        int _2080 = _2078 + 1;
        _2074 = _2080;
    }
    int _2082 = _2074;
    float _2084 = -_2070;
    float _2086 = fma(_1262, 2.0, _2084);
    bool _2088 = uint(_2044) >= 2u;
    float _2090 = _886 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _2092 = ~_785;
    int _2094 = _2092 + 1;
    float _2096 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2098 = _2088 ? 0 : 1;
    float _2100 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2102 = _2044 != 3;
    float _2104 = fma(_1312, -2.0, _2096);
    int _2106 = int(_1958) + int(_2066);
    float _2108 = -_129;
    float _2110 = fma(_2108, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2086);
    float _2112 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2072);
    int _2114 = ~_2098;
    int _2116 = _2114 + 1;
    int _2118 = _2116 + 1;
    int _2120 = _2094 * _2106;
    int _2122 = _2120 + _1562;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2126 = _2118;
    float _2128 = as_type<float>(_2122);
    if (_2102)
    {
        int _2130 = ~_2098;
        int _2132 = _2130 + 1;
        _2126 = _2132;
    }
    int _2134 = _2126;
    float _2136 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _2138 = uint(_2122) >= uint(_785);
    float _2140 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2124);
    float _2142 = _1548 * _129;
    float _2144 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2146 = !_2138;
    int _2148 = _2146 ? 0 : (-1);
    float _2150 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2140);
    bool _2152 = _878 > 0.5;
    float _2154 = exp2(_2142);
    float _2156 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2158 = -_219;
    int _2160 = _2152 ? as_type<int>(_2158) : as_type<int>(_219);
    float _2162 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2164 = _697 + _2162;
    bool _2166 = _888 != 1;
    float _2168 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2170 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2172 = -_2154;
    float _2174 = _2172 + 1.0;
    float _2176 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    if (!_2166)
    {
        _2006 = _882;
    }
    float _2178 = _2006;
    float _2180 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2182 = _2180 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2184 = 0.0;
    float _2186 = _2178;
    if (!_2166)
    {
        _2184 = _882;
    }
    float _2188 = _2184;
    float _2190 = fma(_2090, -2.0, _2176);
    float _2192 = _2188;
    if (!_2166)
    {
        _2076 = _900;
    }
    float _2194 = _2076;
    float _2196 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2104);
    float _2198 = _2194;
    if (!_2166)
    {
        _2128 = _900;
    }
    float _2200 = _2128;
    float _2202 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2190);
    float _2204 = _2200;
    if (_2166)
    {
        _2186 = _878;
    }
    float _2206 = _2186;
    float _2208 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2210 = _2208 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    if (_2166)
    {
        _2192 = _878;
    }
    float _2212 = _2192;
    float _2214 = 1.0 / _2182;
    if (_2166)
    {
        _2198 = _882;
    }
    float _2216 = _2198;
    float _2218 = _2206 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2166)
    {
        _2204 = _882;
    }
    float _2220 = _2204;
    bool _2222 = _890 != 2;
    float _2224 = -_2100;
    float _2226 = fma(_2218, 2.0, _2224);
    float _2228 = _2216 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2230 = fma(_2220, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2136);
    float _2232 = -_129;
    float _2234 = fma(_2232, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2226);
    float _2236 = fma(_2228, -2.0, _2144);
    float _2238 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2230);
    float _2240 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2242 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2236);
    float _2244 = 1.0 / _2210;
    if (_2222)
    {
        _1518 = _878;
    }
    float _2246 = _1518;
    float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2250 = _2248 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2252 = _2246;
    if (_2222)
    {
        _1520 = _882;
    }
    float _2254 = _1520;
    float _2256 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2258 = _2256 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2260 = _2254;
    if (!_2222)
    {
        _2252 = _900;
    }
    float _2262 = _2252;
    float _2264 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2266 = _697 + _2264;
    if (!_2222)
    {
        _2260 = _878;
    }
    float _2268 = _2260;
    float _2270 = 1.0 / _2250;
    int _2272 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2274 = _2272 != 0;
    float _2276 = _2262 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2278 = _878 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2280 = _2268 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2282 = !_2274;
    float _2284 = _2282 ? _219 : as_type<float>(_2160);
    float _2286 = in.m_48.x;
    float _2288 = in.m_48.y;
    float _2290 = in.m_48.z;
    bool _2292 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2294 = isnan(0.0);
    bool _2296 = _2292 || _2294;
    bool _2298 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2300 = _2296 || _2298;
    float _2302 = -_2156;
    float _2304 = fma(_2276, 2.0, _2302);
    float _2306 = fma(_2280, -2.0, _2240);
    float _2308 = -_2168;
    float _2310 = fma(_2278, 2.0, _2308);
    float _2312 = _2300 ? _2174 : 0.0;
    float _2314 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2306);
    bool _2316 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2318 = isnan(1.0);
    bool _2320 = _2316 || _2318;
    bool _2322 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2324 = _2320 || _2322;
    float _2326 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2328 = 1.0 + _2326;
    float _2330 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2332 = -_129;
    float _2334 = fma(_2332, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2310);
    float _2336 = 1.0 / _2328;
    float _2338 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2342 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2330);
    float _2344 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2346 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2338);
    float _2348 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2340);
    float _2350 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2170);
    float _2352 = fma(_2212, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2344);
    float _2354 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2346);
    float _2356 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2342);
    float _2358 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2350);
    float _2360 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2348);
    float _2362 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2352);
    float _2364 = -_129;
    float _2366 = fma(_2364, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2304);
    float _2368 = _191 * _2288;
    if (_2324)
    {
        float _2370 = _2312 * _2336;
        _139 = _2370;
    }
    float _2372 = _139;
    float _2374 = _882 * 2.0;
    bool _2376 = _1198 >= 0.0;
    bool _2378 = isnan(_1198);
    bool _2380 = _2376 || _2378;
    bool _2382 = isnan(0.0);
    bool _2384 = _2380 || _2382;
    float _2386 = _197 * _2288;
    float _2388 = _203 * _2288;
    float _2390 = floor(_2374);
    int _2392 = _2384 ? 0 : 1;
    float _2394 = fma(_195, _2286, _2386);
    bool _2396 = _1198 > 0.0;
    float _2398 = fma(_201, _2286, _2388);
    float _2400 = fma(_189, _2286, _2368);
    float _2402 = fma(_199, _2290, _2394);
    int _2404 = ~_2392;
    int _2406 = _2404 + 1;
    int _2408 = _2406 + 1;
    float _2410 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2412 = _2410 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2414 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2416 = _2414 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2418 = 1.0 / _2258;
    float _2420 = fma(_205, _2290, _2398);
    float _2422 = fma(_193, _2290, _2400);
    int _2424 = _2408;
    if (!_2396)
    {
        int _2426 = ~_2392;
        int _2428 = _2426 + 1;
        _2424 = _2428;
    }
    int _2430 = _2424;
    float _2432 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2434 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2432;
    bool _2436 = _2390 >= 0.0;
    bool _2438 = isnan(_2390);
    bool _2440 = _2436 || _2438;
    bool _2442 = isnan(0.0);
    bool _2444 = _2440 || _2442;
    float _2446 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2448 = _2446 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2450 = 1.0 / _2412;
    int _2452 = _2444 ? 0 : 1;
    float _2454 = _2434 * _2214;
    bool _2456 = _2390 > 0.0;
    float _2458 = _900 * 2.0;
    float _2460 = _2448 * _2244;
    int _2462 = ~_1972;
    int _2464 = _2462 + _2038;
    int _2466 = _2464 + 1;
    float _2468 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2470 = _2468 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2472 = 1.0 / _2416;
    float _2474 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2476 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2474;
    float _2478 = _2470 * _2270;
    int _2480 = _715 * _2466;
    int _2482 = _2480 + _1258;
    float _2484 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2486 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2484;
    float _2488 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2490 = _2488 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2492 = floor(_2458);
    float _2494 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2496 = _2494 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2498 = _2486 * _2418;
    float _2500 = _2490 * _2450;
    bool _2502 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2504 = isnan(_697);
    bool _2506 = _2502 || _2504;
    bool _2508 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2510 = _2506 || _2508;
    float _2512 = float(_2510);
    float _2514 = fma(_2478, _2266, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _2516 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2518 = isnan(_697);
    bool _2520 = _2516 || _2518;
    bool _2522 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2524 = _2520 || _2522;
    float _2526 = float(_2524);
    float _2528 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2530 = _697 + _2528;
    float _2532 = _2476 * _2472;
    int _2534 = ~_2452;
    int _2536 = _2534 + 1;
    int _2538 = _2536 + 1;
    float _2540 = 1.0 / _2496;
    bool _2542 = !_1260;
    int _2544 = _2542 ? _2482 : (-1);
    float _2546 = -_2512;
    float _2548 = _2546 + 1.0;
    bool _2550 = !_1880;
    int _2552 = _2550 ? 0 : 1;
    float _2554 = in.m_64.w;
    int _2556 = _2538;
    if (!_2456)
    {
        int _2558 = ~_2452;
        int _2560 = _2558 + 1;
        _2556 = _2560;
    }
    int _2562 = _2556;
    float _2564 = -_2526;
    float _2566 = _2564 + 1.0;
    int _2568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2570 = _2568 != 0;
    int _2572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2574 = _2572 != 0;
    int _2576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2578 = _2576 != 0;
    float _2580 = _2526 * _2548;
    bool _2582 = _2492 >= 0.0;
    bool _2584 = isnan(_2492);
    bool _2586 = _2582 || _2584;
    bool _2588 = isnan(0.0);
    bool _2590 = _2586 || _2588;
    float _2592 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2594 = _697 + _2592;
    bool _2596 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2598 = isnan(_697);
    bool _2600 = _2596 || _2598;
    bool _2602 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2604 = _2600 || _2602;
    float _2606 = float(_2604);
    float _2608 = fma(_2498, _2530, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2610 = _1864 >> 31;
    float _2612 = fma(_2454, _2594, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _2614 = _2590 ? 0 : 1;
    float _2616 = _2606 * _2566;
    bool _2618 = _2492 > 0.0;
    float _2620 = -_2606;
    float _2622 = _2620 + 1.0;
    bool _2624 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2626 = isnan(_697);
    bool _2628 = _2624 || _2626;
    bool _2630 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2632 = _2628 || _2630;
    float _2634 = float(_2632);
    float _2636 = fma(_2460, _2164, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _2638 = _2610 & 3;
    float _2640 = fma(_2532, _930, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _2642 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2644 = isnan(_697);
    bool _2646 = _2642 || _2644;
    bool _2648 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2650 = _2646 || _2648;
    float _2652 = float(_2650);
    float _2654 = -_2634;
    float _2656 = _2654 + 1.0;
    int _2658 = _1864 + _2638;
    float _2660 = _2634 * _2622;
    bool _2662 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2664 = isnan(_697);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2670 = _2666 || _2668;
    float _2672 = float(_2670);
    float _2674 = -_2652;
    float _2676 = _2674 + 1.0;
    float _2678 = _2652 * _2656;
    int _2680 = _2658 >> 2;
    float _2682 = _2402 + _2554;
    float _2684 = _2672 * _2676;
    bool _2686 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2688 = isnan(_697);
    bool _2690 = _2686 || _2688;
    bool _2692 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2694 = _2690 || _2692;
    float _2696 = float(_2694);
    float _2698 = -_2672;
    float _2700 = _2698 + 1.0;
    int _2702 = _2680 << 4;
    int _2704 = _2702 + 656;
    float _2706 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2708 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2706;
    bool _2710 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2712 = isnan(_697);
    bool _2714 = _2710 || _2712;
    bool _2716 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2718 = _2714 || _2716;
    float _2720 = float(_2718);
    float _2722 = _2696 * _2700;
    float _2724 = -_2696;
    float _2726 = _2724 + 1.0;
    float _2728 = _2708 * _2540;
    uint _2730 = uint(int(uint(_2704) >> uint(2)));
    uint _2732 = uint(int(uint(int(_2730)) >> uint(2)));
    int _2734 = int(_2730) & 3;
    float _2736 = (*spvDescriptorSet0.vp_c9)._m0[int(_2732)][_2734];
    int _2738 = int(_2730) + 1;
    uint _2740 = uint(int(uint(_2738) >> uint(2)));
    int _2742 = _2738 & 3;
    float _2744 = (*spvDescriptorSet0.vp_c9)._m0[int(_2740)][_2742];
    float _2746 = in.m_62.w;
    float _2748 = _2720 * _2726;
    float _2750 = -_2720;
    float _2752 = _2750 + 1.0;
    float _2754 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2756 = _2682 + _2754;
    float _2758 = in.m_66.w;
    float _2760 = _2612 * _2748;
    float _2762 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2764 = _697 + _2762;
    float _2766 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2768 = _697 + _2766;
    int _2770 = abs(_2012);
    float _2772 = fma(_2752, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2760);
    int _2774 = abs(_2024);
    int _2776 = _2704 + 8;
    uint _2778 = uint(int(uint(_2776) >> uint(2)));
    uint _2780 = uint(int(uint(int(_2778)) >> uint(2)));
    int _2782 = int(_2778) & 3;
    float _2784 = (*spvDescriptorSet0.vp_c9)._m0[int(_2780)][_2782];
    int _2786 = int(_2778) + 1;
    uint _2788 = uint(int(uint(_2786) >> uint(2)));
    int _2790 = _2786 & 3;
    float _2792 = (*spvDescriptorSet0.vp_c9)._m0[int(_2788)][_2790];
    float _2794 = fma(_2728, _2768, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2796 = fma(_2636, _2722, _2772);
    int _2798 = ~_2614;
    int _2800 = _2798 + 1;
    int _2802 = _2800 + 1;
    float _2804 = _882 + _900;
    int _2806 = _2802;
    if (!_2618)
    {
        int _2808 = ~_2614;
        int _2810 = _2808 + 1;
        _2806 = _2810;
    }
    int _2812 = _2806;
    float _2814 = _882 + _878;
    float _2816 = fma(_2500, _2764, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _2818 = !_2570;
    int _2820 = _2818 ? 0 : 1;
    float _2822 = -_2360;
    float _2824 = _2822 + 1.0;
    float _2826 = _2814 + (-1.0);
    float _2828 = float(_2812);
    float _2830 = _2422 + _2746;
    float _2832 = fma(_2640, _2684, _2796);
    float _2834 = _878 + _900;
    int _2836 = abs(_1946);
    float _2838 = _2420 + _2758;
    float _2840 = _878 + (-0.5);
    float _2842 = fma(_2514, _2678, _2832);
    float _2844 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2846 = _2830 + _2844;
    float _2848 = _2756 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2850 = _882 + (-0.5);
    float _2852 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2854 = int(_2852);
    float _2856 = fma(_2846, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2848);
    float _2858 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2860 = _2838 + _2858;
    int _2862 = abs(_2552);
    float _2864 = fma(_2608, _2660, _2842);
    int _2866 = ~_2836;
    int _2868 = _2866 + 1;
    int _2870 = _2868 + 1;
    float _2872 = fma(_2860, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2856);
    float _2874 = fma(_2816, _2616, _2864);
    bool _2876 = !_1726;
    int _2878 = _2876 ? 0 : 1;
    bool _2880 = _1878 != 3;
    float _2882 = fma(_2826, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2884 = ~_2862;
    int _2886 = _2884 + 1;
    int _2888 = _2886 + 1;
    int _2890 = _2870 * as_type<int>(_2744);
    bool _2892 = !_2880;
    int _2894 = _2892 ? 0 : (-1);
    float _2896 = _1876 + (-0.5);
    bool _2898 = _2872 >= 0.0;
    int _2900 = _2888 * as_type<int>(_2736);
    int _2902 = _2900 + _2890;
    float _2904 = _1712 + 0.5;
    int _2906 = abs(_2894);
    float _2908 = fma(_2794, _2580, _2874);
    int _2910 = ~_2770;
    int _2912 = _2910 + 1;
    int _2914 = _2912 + 1;
    float _2916 = float(uint(_2854));
    float _2918 = fma(_2512, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2908);
    int _2920 = ~_2906;
    int _2922 = _2920 + 1;
    int _2924 = _2922 + 1;
    int _2926 = _2914 * as_type<int>(_2784);
    int _2928 = _2926 + _2902;
    int _2930 = ~_2774;
    int _2932 = _2930 + 1;
    int _2934 = _2932 + 1;
    float _2936 = fma(_2904, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2110);
    float _2938 = 1.0 / _2916;
    int _2940 = _2924 * as_type<int>(_2792);
    int _2942 = _2940 + _2928;
    float _2944 = -_2896;
    float _2946 = -_2202;
    float _2948 = fma(_2944, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2946);
    float _2950 = -_2150;
    float _2952 = _2950 + 1.0;
    float _2954 = _2284 + 0.5;
    int _2956 = _2942 * _2934;
    float _2958 = -_2112;
    float _2960 = _2958 + 1.0;
    float _2962 = _1884 + (-0.5);
    float _2964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2966 = _2544 * _2774;
    int _2968 = _2966 + _2956;
    float _2970 = -_2960;
    float _2972 = fma(_2970, _1712, _2936);
    float _2974 = _2960;
    if (_2898)
    {
        _2974 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2976 = _2974;
    float _2978 = fma(_2952, _1876, _2948);
    float _2980 = fma(_2954, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2334);
    float _2982 = float(uint(_2968));
    float _2984 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2986 = as_type<int>(_2938) + (-2);
    int _2988 = as_type<int>(_2938);
    if (_2898)
    {
        float _2990 = _2976 * 5.0;
        _2988 = as_type<int>(_2990);
    }
    int _2992 = _2988;
    float _2994 = -_2962;
    float _2996 = -_2196;
    float _2998 = fma(_2994, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2996);
    float _3000 = _1404 + (-0.5);
    out.m_76.x = _2972;
    out.m_76.y = _2978;
    float _3002 = as_type<float>(_2986) * _2982;
    int _3004 = ~_2854;
    int _3006 = _3004 + 1;
    float _3008 = _2964 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3010 = _1660 + 0.5;
    if (_2898)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9386 = as_type<float>(_2992);
        out.gl_Position.z = _9386;
    }
    int _3012 = abs(_2820);
    float _3014 = trunc(_3002);
    float _3016 = precise::max(_3014, 0.0);
    uint _3018 = uint(_3016);
    float _3020 = fma(_3008, _3010, _2234);
    int _3022 = ~_2106;
    int _3024 = _3022 + _2148;
    int _3026 = _3024 + 1;
    out.m_78.x = _2918;
    float _3028 = _2984 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3030 = abs(_2854);
    int _3032 = _2030 >> 31;
    float _3034 = -_3028;
    float _3036 = -_2242;
    float _3038 = fma(_3034, _3000, _3036);
    float _3040 = _2756 * _2756;
    int _3042 = _1682 >> 31;
    int _3044 = _785 * _3026;
    int _3046 = _3044 + _1562;
    float _3048 = float(uint(_3030));
    if (_2898)
    {
        out.m_55.x = 0.0;
    }
    int _3050 = _3042 & 3;
    float _3052 = fma(_2846, _2846, _3040);
    int _3054 = _3032 & 3;
    float _3056 = 1.0 / _3048;
    int _3058 = _2030 + _3054;
    float _3060 = _539 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _3062 = _1682 + _3050;
    float _3064 = fma(_2860, _2860, _3052);
    float _3066 = -_2356;
    float _3068 = _3066 + 1.0;
    int _3070 = _3006 * int(_3018);
    int _3072 = _3070 + _2968;
    int _3074 = _3058 >> 2;
    float _3076 = -_2354;
    float _3078 = _3076 + 1.0;
    int _3080 = _3062 >> 2;
    float _3082 = -_3068;
    float _3084 = fma(_2284, _3082, _2980);
    int _3086 = _3074 << 4;
    int _3088 = _3086 + 800;
    float _3090 = -_2362;
    float _3092 = _3090 + 1.0;
    float _3094 = float(uint(_3072));
    float _3096 = fma(_1884, _3078, _2998);
    int _3098 = abs(_2968);
    float _3100 = -_3092;
    float _3102 = fma(_1660, _3100, _3020);
    int _3104 = _3080 << 4;
    int _3106 = _3104 + 368;
    float _3108 = as_type<float>(_2986) * _3094;
    int _3110 = as_type<int>(_3056) + (-2);
    float _3112 = -_2238;
    float _3114 = _3112 + 1.0;
    uint _3116 = uint(int(uint(_3088) >> uint(2)));
    uint _3118 = uint(int(uint(int(_3116)) >> uint(2)));
    int _3120 = int(_3116) & 3;
    float _3122 = (*spvDescriptorSet0.vp_c9)._m0[int(_3118)][_3120];
    int _3124 = int(_3116) + 1;
    uint _3126 = uint(int(uint(_3124) >> uint(2)));
    int _3128 = _3124 & 3;
    float _3130 = (*spvDescriptorSet0.vp_c9)._m0[int(_3126)][_3128];
    float _3132 = float(uint(_3098));
    float _3134 = rsqrt(_3064);
    float _3136 = fma(_1404, _3114, _3038);
    float _3138 = _3060 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3140 = as_type<float>(_3110) * _3132;
    int _3142 = ~_3030;
    int _3144 = _3142 + 1;
    uint _3146 = uint(int(uint(_3106) >> uint(2)));
    uint _3148 = uint(int(uint(int(_3146)) >> uint(2)));
    int _3150 = int(_3146) & 3;
    float _3152 = (*spvDescriptorSet0.vp_c9)._m0[int(_3148)][_3150];
    int _3154 = int(_3146) + 1;
    uint _3156 = uint(int(uint(_3154) >> uint(2)));
    int _3158 = _3154 & 3;
    float _3160 = (*spvDescriptorSet0.vp_c9)._m0[int(_3156)][_3158];
    float _3162 = float(_3012);
    float _3164 = trunc(_3140);
    float _3166 = precise::max(_3164, 0.0);
    uint _3168 = uint(_3166);
    out.m_80.x = _3084;
    out.m_80.y = _3096;
    out.m_80.z = _3102;
    out.m_80.w = _3136;
    int _3170 = ~_1908;
    int _3172 = _3170 + _1968;
    int _3174 = _3172 + 1;
    float _3176 = _3162 * _2828;
    int _3178 = abs(_1796);
    int _3180 = _3106 + 8;
    uint _3182 = uint(int(uint(_3180) >> uint(2)));
    uint _3184 = uint(int(uint(int(_3182)) >> uint(2)));
    int _3186 = int(_3182) & 3;
    float _3188 = (*spvDescriptorSet0.vp_c9)._m0[int(_3184)][_3186];
    int _3190 = int(_3182) + 1;
    uint _3192 = uint(int(uint(_3190) >> uint(2)));
    int _3194 = _3190 & 3;
    float _3196 = (*spvDescriptorSet0.vp_c9)._m0[int(_3192)][_3194];
    int _3198 = abs(_2082);
    float _3200 = trunc(_3108);
    float _3202 = precise::max(_3200, 0.0);
    uint _3204 = uint(_3202);
    int _3206 = _735 * _3174;
    int _3208 = _3206 + _1214;
    int _3210 = abs(_2878);
    float _3212 = _3138 * _3134;
    int _3214 = ~_3198;
    int _3216 = _3214 + 1;
    int _3218 = _3216 + 1;
    int _3220 = abs(_1928);
    int _3222 = _3088 + 8;
    uint _3224 = uint(int(uint(_3222) >> uint(2)));
    uint _3226 = uint(int(uint(int(_3224)) >> uint(2)));
    int _3228 = int(_3224) & 3;
    float _3230 = (*spvDescriptorSet0.vp_c9)._m0[int(_3226)][_3228];
    int _3232 = int(_3224) + 1;
    uint _3234 = uint(int(uint(_3232) >> uint(2)));
    int _3236 = _3232 & 3;
    float _3238 = (*spvDescriptorSet0.vp_c9)._m0[int(_3234)][_3236];
    int _3240 = _3144 * int(_3168);
    int _3242 = _3240 + _3098;
    float _3244 = _2756 * _3212;
    int _3246 = ~_2854;
    int _3248 = _3246 + 1;
    float _3250 = _2846 * _3212;
    float _3252 = float(uint(_3242));
    float _3254 = -_3244;
    float _3256 = _2756 + _3254;
    bool _3258 = !_2046;
    int _3260 = _3258 ? 0 : 1;
    float _3262 = -_3250;
    float _3264 = _2846 + _3262;
    int _3266 = int(_3018) + int(_3204);
    float _3268 = as_type<float>(_3110) * _3252;
    int _3270 = ~_3178;
    int _3272 = _3270 + 1;
    int _3274 = _3272 + 1;
    float _3276 = _3256 * _3256;
    bool _3278 = _1724 != 3;
    float _3280 = trunc(_3268);
    float _3282 = precise::max(_3280, 0.0);
    uint _3284 = uint(_3282);
    int _3286 = _3248 * _3266;
    int _3288 = _3286 + _2968;
    bool _3290 = _735 == 0;
    float _3292 = _1088 + (-0.5);
    bool _3294 = !_1466;
    int _3296 = _3294 ? _3046 : (-1);
    float _3298 = _2860 * _3212;
    bool _3300 = !_3290;
    int _3302 = _3300 ? _3208 : (-1);
    float _3304 = fma(_3264, _3264, _3276);
    int _3306 = _3218 * as_type<int>(_3130);
    int _3308 = abs(_3260);
    float _3310 = -_3298;
    float _3312 = _2860 + _3310;
    int _3314 = ~_3308;
    int _3316 = _3314 + 1;
    int _3318 = _3316 + 1;
    int _3320 = ~_3210;
    int _3322 = _3320 + 1;
    int _3324 = _3322 + 1;
    int _3326 = _3274 * as_type<int>(_3160);
    bool _3328 = !_3278;
    int _3330 = _3328 ? 0 : (-1);
    int _3332 = _3318 * as_type<int>(_3122);
    int _3334 = _3332 + _3306;
    bool _3336 = uint(_3288) >= uint(_2854);
    int _3338 = _3324 * as_type<int>(_3152);
    int _3340 = _3338 + _3326;
    int _3342 = ~_3030;
    int _3344 = _3342 + 1;
    int _3346 = int(_3168) + int(_3284);
    bool _3348 = !_3336;
    int _3350 = _3348 ? 0 : (-1);
    int _3352 = abs(_2134);
    int _3354 = _3344 * _3346;
    int _3356 = _3354 + _3098;
    bool _3358 = _2044 != 3;
    int _3360 = ~_3266;
    int _3362 = _3360 + _3350;
    int _3364 = _3362 + 1;
    int _3366 = ~_3352;
    int _3368 = _3366 + 1;
    int _3370 = _3368 + 1;
    int _3372 = abs(_1854);
    bool _3374 = !_3358;
    int _3376 = _3374 ? 0 : (-1);
    int _3378 = _3370 * as_type<int>(_3230);
    int _3380 = _3378 + _3334;
    bool _3382 = uint(_3356) >= uint(_3030);
    int _3384 = _2854 * _3364;
    int _3386 = _3384 + _2968;
    int _3388 = abs(_3330);
    int _3390 = ~_3372;
    int _3392 = _3390 + 1;
    int _3394 = _3392 + 1;
    int _3396 = _2968 ^ _2854;
    int _3398 = abs(_3376);
    int _3400 = _3394 * as_type<int>(_3188);
    int _3402 = _3400 + _3340;
    float _3404 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3406 = !_3382;
    int _3408 = _3406 ? 0 : (-1);
    int _3410 = ~_3388;
    int _3412 = _3410 + 1;
    int _3414 = _3412 + 1;
    uint _3416 = uint(int(uint(_3396) >> uint(31)));
    bool _3418 = _2854 == 0;
    int _3420 = _3414 * as_type<int>(_3196);
    int _3422 = _3420 + _3402;
    int _3424 = ~_3408;
    int _3426 = _3346 + _3424;
    int _3428 = _3426 + 1;
    int _3430 = ~int(_3416);
    int _3432 = _3430 + 1;
    float _3434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3436 = abs(_2034);
    int _3438 = ~_3398;
    int _3440 = _3438 + 1;
    int _3442 = _3440 + 1;
    bool _3444 = !_3418;
    int _3446 = _3444 ? _3386 : (-1);
    int _3448 = _3442 * as_type<int>(_3238);
    int _3450 = _3448 + _3380;
    int _3452 = _3428 ^ _3432;
    int _3454 = ~_3220;
    int _3456 = _3454 + 1;
    int _3458 = _3456 + 1;
    float _3460 = in.m_82.x;
    float _3462 = in.m_82.y;
    float _3464 = in.m_82.z;
    bool _3466 = _2854 == 0;
    int _3468 = ~_3432;
    int _3470 = _3468 + _3452;
    int _3472 = _3470 + 1;
    int _3474 = _3422 * _3458;
    float _3476 = float(_3446);
    float _3478 = _3404 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3480 = ~_3436;
    int _3482 = _3480 + 1;
    int _3484 = _3482 + 1;
    int _3486 = _3302 * _3220;
    int _3488 = _3486 + _3474;
    bool _3490 = !_3466;
    int _3492 = _3490 ? _3472 : (-1);
    float _3494 = fma(_3478, _3476, _2366);
    float _3496 = _1058 + 0.5;
    int _3498 = _3450 * _3484;
    float _3500 = float(_3492);
    float _3502 = _3434 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3504 = fma(_3478, _3496, _3494);
    int _3506 = _3296 * _3436;
    int _3508 = _3506 + _3498;
    float _3510 = -_2314;
    float _3512 = fma(_3502, _3500, _3510);
    float _3514 = -_2824;
    float _3516 = fma(_1058, _3514, _3504);
    float _3518 = -_2358;
    float _3520 = _3518 + 1.0;
    float _3522 = _3176 * (-2.0);
    float _3524 = -_3502;
    float _3526 = fma(_3524, _3292, _3512);
    float _3528 = float(_3488);
    float _3530 = float(_3508);
    float _3532 = fma(_1088, _3520, _3526);
    float _3534 = fma(_3522, _3460, _3460);
    bool _3536 = !_2574;
    int _3538 = _3536 ? 0 : 1;
    out.m_84.x = _3528;
    float _3540 = fma(_2882, _3522, _2882);
    bool _3542 = !_2578;
    int _3544 = _3542 ? 0 : 1;
    out.m_84.w = _3530;
    int _3546 = abs(_3538);
    out.m_86.x = _3516;
    out.m_86.y = _3532;
    float _3548 = _3464;
    if (_2898)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3550 = -_3244;
    float _3552 = _2682 + _3550;
    float _3554 = float(_2430);
    float _3556 = -_3250;
    float _3558 = _2830 + _3556;
    float _3560 = float(_3546);
    float _3562 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3564 = _3552 + _3562;
    float _3566 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3568 = _3558 + _3566;
    float _3570 = _2804 + (-1.0);
    float _3572 = _3564 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3574 = -_3298;
    float _3576 = _2838 + _3574;
    float _3578 = _3560 * _3554;
    int _3580 = abs(_3544);
    float _3582 = fma(_3568, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3572);
    float _3584 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3586 = _3576 + _3584;
    float _3588 = float(_2562);
    float _3590 = fma(_3570, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3592 = float(_3580);
    float _3594 = fma(_3586, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3582);
    float _3596 = _3578 * (-2.0);
    float _3598 = fma(_3312, _3312, _3304);
    float _3600 = _3592 * _3588;
    float _3602 = fma(_3596, _3462, _3462);
    bool _3604 = _3594 >= 0.0;
    float _3606 = fma(_3590, _3596, _3590);
    float _3608 = _900 + (-0.5);
    float _3610 = fma(_2850, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3602);
    float _3612 = _3600 * (-2.0);
    float _3614 = _2834 + (-1.0);
    float _3616 = fma(_2840, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3534);
    float _3618 = fma(_3606, _2372, _3610);
    float _3620 = fma(_3612, _3464, _3464);
    float _3622 = fma(_3614, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3624 = sqrt(_3598);
    float _3626 = _3618 * 0.15915493667125701904296875;
    float _3628 = fma(_3608, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3620);
    if (_3604)
    {
        _3548 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3630 = _3548;
    float _3632 = fma(_3540, _2372, _3616);
    float _3634 = fma(_3622, _3612, _3622);
    int _3636 = as_type<int>(_3630);
    if (_3604)
    {
        out.m_55.x = 0.0;
    }
    float _3638 = _3626 * 6.283185482025146484375;
    float _3640 = sin(_3638);
    if (_3604)
    {
        float _3642 = _3630 * 5.0;
        _3636 = as_type<int>(_3642);
    }
    int _3644 = _3636;
    float _3646 = _3632 * 0.15915493667125701904296875;
    float _3648 = fma(_3634, _2372, _3628);
    if (_3604)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10310 = as_type<float>(_3644);
        out.gl_Position.z = _10310;
    }
    float _3650 = _3626 * 6.283185482025146484375;
    float _3652 = cos(_3650);
    float _3654 = _3646 * 6.283185482025146484375;
    float _3656 = sin(_3654);
    float _3658 = _3646 * 6.283185482025146484375;
    float _3660 = cos(_3658);
    float _3662 = _3648 * 0.15915493667125701904296875;
    if (_3604)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3664 = _3662 * 6.283185482025146484375;
    float _3666 = cos(_3664);
    float _3668 = _3134 * _3624;
    float _3670 = _537 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3672 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _223);
    float _3674 = _3660 * _3652;
    float _3676 = _3060 * _3668;
    float _3678 = _3668 * _3670;
    float _3680 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _219);
    float _3682 = _3662 * 6.283185482025146484375;
    float _3684 = sin(_3682);
    float _3686 = _3660 * _3640;
    float _3688 = _3672 * _3678;
    float _3690 = _3656 * _3640;
    float _3692 = _3656 * _3652;
    float _3694 = _3680 * _3676;
    float _3696 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3698 = _3660 * _3666;
    float _3700 = _3652 * _3666;
    float _3702 = _3656 * _3666;
    float _3704 = _3640 * _3666;
    float _3706 = _3698 * _3688;
    float _3708 = _3668 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3710 = _3708 * 0.5;
    float _3712 = fma(_3684, _3674, _3690);
    float _3714 = -_3692;
    float _3716 = fma(_3684, _3686, _3714);
    float _3718 = -_3688;
    float _3720 = _3684 * _3718;
    float _3722 = -_3686;
    float _3724 = fma(_3684, _3692, _3722);
    float _3726 = fma(_3712, _3694, _3706);
    float _3728 = _3702 * _3688;
    float _3730 = fma(_3700, _3694, _3720);
    float _3732 = fma(_3684, _3690, _3674);
    float _3734 = fma(_3716, _3710, _3726);
    float _3736 = fma(_3724, _3694, _3728);
    float _3738 = fma(_3704, _3710, _3730);
    float _3740 = _3734 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3742 = _3734 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3744 = fma(_3732, _3710, _3736);
    float _3746 = _3734 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3748 = fma(_3738, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3740);
    float _3750 = fma(_3738, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3742);
    float _3752 = _3712 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3754 = _3712 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3756 = fma(_3744, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3748);
    float _3758 = fma(_3744, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3750);
    float _3760 = fma(_3738, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3746);
    float _3762 = fma(_3700, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3754);
    float _3764 = _3756 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3766 = _3758 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3768 = fma(_3744, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3760);
    float _3770 = fma(_3696, _3696, 1.0);
    float _3772 = _2830 + _3764;
    float _3774 = _2838 + _3766;
    float _3776 = _3712 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3778 = fma(_3700, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3752);
    float _3780 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3782 = _3772 + _3780;
    float _3784 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3786 = _3774 + _3784;
    float _3788 = fma(_3700, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3776);
    float _3790 = _3698 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3792 = _3782 * _3782;
    float _3794 = _3786 * _3786;
    float _3796 = _3698 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3798 = _3698 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3800 = _3768 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3802 = _3792 + _3794;
    float _3804 = -_3684;
    float _3806 = fma(_3804, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3790);
    float _3808 = -_3684;
    float _3810 = fma(_3808, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3796);
    float _3812 = -_3684;
    float _3814 = fma(_3812, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3798);
    float _3816 = sqrt(_3802);
    float _3818 = _3716 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3820 = _3716 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3822 = _3716 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3824 = _2682 + _3800;
    float _3826 = fma(_3704, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3818);
    float _3828 = fma(_3704, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3820);
    float _3830 = fma(_3704, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3822);
    float _3832 = rsqrt(_3770);
    bool _3834 = _3816 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3836 = _3704;
    float _3838 = _3790;
    float _3840 = _3820;
    float _3842 = _3770;
    float _3844 = _3818;
    if (!_3834)
    {
        _3836 = _3794;
    }
    float _3846 = _3836;
    float _3848 = _3846;
    if (!_3834)
    {
        _3838 = _3792;
    }
    float _3850 = _3838;
    float _3852 = _3850;
    if (!_3834)
    {
        _3840 = _3772;
    }
    float _3854 = _3840;
    float _3856 = _3854;
    if (!_3834)
    {
        _3842 = _3774;
    }
    float _3858 = _3842;
    float _3860 = _3858;
    if (!_3834)
    {
        _3844 = _3824;
    }
    float _3862 = _3844;
    bool _3864 = !_3834;
    float _3866 = _3862;
    if (!_3864)
    {
        float _3868 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3870 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3872 = _3816 + _3870;
        float _3874 = rsqrt(_3802);
        float _3876 = _3872 * _3868;
        float _3878 = _3824 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3880 = _3876 * 0.15915493667125701904296875;
        float _3882 = _3880 * 6.283185482025146484375;
        float _3884 = sin(_3882);
        float _3886 = _3880 * 6.283185482025146484375;
        float _3888 = cos(_3886);
        float _3890 = fma(_3884, _3878, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3892 = _3874 * _3890;
        float _3894 = _3888 + (-1.0);
        float _3896 = fma(_3782, _3892, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3898 = fma(_3786, _3892, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3900 = _3894 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3902 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3904 = _3896 + _3902;
        float _3906 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3908 = _3898 + _3906;
        float _3910 = fma(_3824, _3888, _3900);
        float _3912 = _3904 * _3904;
        float _3914 = _3908 * _3908;
        _3866 = _3910;
        _3852 = _3912;
        _3848 = _3914;
        _3856 = _3896;
        _3860 = _3898;
    }
    float _3916 = _3866;
    float _3918 = _3852;
    float _3920 = _3848;
    float _3922 = _3856;
    float _3924 = _3860;
    float _3926 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3928 = _3916 + _3926;
    float _3930 = fma(_3702, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3806);
    float _3932 = fma(_3702, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3810);
    float _3934 = fma(_3702, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3814);
    float _3936 = fma(_3928, _3928, _3918);
    float _3938 = fma(_3732, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3828);
    float _3940 = fma(_3732, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3826);
    float _3942 = fma(_3732, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3830);
    float _3944 = _3936 + _3920;
    float _3946 = fma(_3724, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3788);
    float _3948 = _3696 * _3832;
    float _3950 = fma(_3724, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3778);
    float _3952 = _219 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3954 = _3696 * _3930;
    float _3956 = _3696 * _3932;
    float _3958 = fma(_3724, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3762);
    float _3960 = _3696 * _3934;
    float _3962 = -_3940;
    float _3964 = _3948 * _3962;
    float _3966 = -_3938;
    float _3968 = _3948 * _3966;
    float _3970 = -_3942;
    float _3972 = _3948 * _3970;
    float _3974 = sqrt(_3944);
    float _3976 = fma(_3952, _3946, _3954);
    float _3978 = fma(_3952, _3950, _3956);
    float _3980 = fma(_3952, _3958, _3960);
    float _3982 = fma(_3832, _3930, _3964);
    float _3984 = fma(_3832, _3932, _3968);
    float _3986 = fma(_3832, _3934, _3972);
    float _3988 = _3940 + _3976;
    float _3990 = _3938 + _3978;
    float _3992 = _3942 + _3980;
    out.m_88.x = _3946;
    out.m_88.y = _3950;
    out.m_88.z = _3958;
    out.m_90.x = _3982;
    out.m_90.y = _3984;
    out.m_90.z = _3986;
    bool _3994 = _3974 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3996 = isnan(_3974);
    bool _3998 = _3994 || _3996;
    bool _4000 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4002 = _3998 || _4000;
    out.m_92.x = _3988;
    out.m_92.y = _3990;
    out.m_92.z = _3992;
    float _4004 = _3978;
    float _4006 = _3958;
    if (!_4002)
    {
        _4004 = 1.0;
    }
    float _4008 = _4004;
    bool _4010 = !_4002;
    float _4012 = _4008;
    if (!_4010)
    {
        bool _4014 = _3974 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4016 = isnan(_3974);
        bool _4018 = _4014 || _4016;
        bool _4020 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4022 = _4018 || _4020;
        if (!_4022)
        {
            float _4024 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4026 = _3974 + _4024;
            float _4028 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4030 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4028;
            float _4032 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4034 = _4032 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4036 = 1.0 / _4030;
            float _4038 = _4026 * _4036;
            float _4040 = fma(_4038, _4034, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4012 = _4040;
            _4042 = true;
        }
        else
        {
            bool _4044 = _3974 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4046 = isnan(_3974);
            bool _4048 = _4044 || _4046;
            bool _4050 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4052 = _4048 || _4050;
            if (!_4052)
            {
                float _4054 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4056 = _3974 + _4054;
                float _4058 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4060 = _4058 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4062 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4064 = _4062 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4066 = 1.0 / _4060;
                float _4068 = _4056 * _4066;
                float _4070 = fma(_4068, _4064, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4012 = _4070;
                _4042 = true;
            }
            else
            {
                _4012 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4042 = false;
    float _4072 = _4012;
    float _4074 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4076 = _3916 + _4074;
    float _4078 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4080 = _3922 + _4078;
    float _4082 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4084 = _3924 + _4082;
    float _4086 = fma(_4076, _4072, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4088 = fma(_4080, _4072, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4090 = -_2682;
    float _4092 = _4090 + _4086;
    float _4094 = fma(_4084, _4072, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4096 = -_2830;
    float _4098 = _4096 + _4088;
    float _4100 = _4092 * _4092;
    float _4102 = -_2838;
    float _4104 = _4102 + _4094;
    float _4106 = fma(_4098, _4098, _4100);
    float _4108 = fma(_4104, _4104, _4106);
    float _4110 = sqrt(_4108);
    bool _4112 = _4110 > 0.0;
    float _4114 = _4110;
    float _4116 = _4076;
    float _4118 = _4084;
    float _4120 = _4092;
    float _4122 = _4094;
    if (!_4112)
    {
        _4114 = _4088;
    }
    float _4124 = _4114;
    float _4126 = _4124;
    if (!_4112)
    {
        _4116 = _4086;
    }
    float _4128 = _4116;
    float _4130 = _4128;
    float _4132 = _4128;
    if (!_4112)
    {
        _4118 = _4094;
    }
    float _4134 = _4118;
    bool _4136 = !_4112;
    float _4138 = _4134;
    if (!_4136)
    {
        float _4140 = _239 * _239;
        float _4142 = fma(_235, _235, _4140);
        float _4144 = fma(_241, _241, _4142);
        float _4146 = rsqrt(_4108);
        float _4148 = sqrt(_4144);
        float _4150 = _4098 * _4146;
        float _4152 = _4092 * _4146;
        float _4154 = _4104 * _4146;
        bool _4156 = _4148 > 0.0;
        float _4158 = _4146;
        float _4160 = _4148;
        _4006 = _4152;
        if (!_4156)
        {
            _4158 = _4088;
        }
        float _4162 = _4158;
        _4126 = _4162;
        if (!_4156)
        {
            _4130 = _4086;
        }
        float _4164 = _4130;
        _4132 = _4164;
        if (!_4156)
        {
            _4160 = _4094;
        }
        float _4166 = _4160;
        bool _4168 = !_4156;
        _4138 = _4166;
        if (!_4168)
        {
            float _4170 = rsqrt(_4144);
            float _4172 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4174 = _239 * _4170;
            float _4176 = _235 * _4170;
            float _4178 = _241 * _4170;
            float _4180 = _4152 * _4174;
            float _4182 = fma(_4150, _4176, _4180);
            float _4184 = _4172 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4186 = fma(_4154, _4178, _4182);
            float _4188 = _4186 * _4184;
            float _4190 = fma(_235, _4188, _4088);
            float _4192 = fma(_239, _4188, _4086);
            float _4194 = fma(_241, _4188, _4094);
            _4132 = _4192;
            _4126 = _4190;
            _4138 = _4194;
            _4120 = _4188;
        }
    }
    float _4196 = _4132;
    float _4198 = _4126;
    float _4200 = _4138;
    float _4202 = _4120;
    float _4204 = _4006;
    float _4206 = -_3244;
    float _4208 = _4206 + _4196;
    float _4210 = -_3250;
    float _4212 = _4210 + _4198;
    float _4214 = -_3298;
    float _4216 = _4214 + _4200;
    float _4218 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4220 = _4208 + _4218;
    float _4222 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4224 = _4212 + _4222;
    float _4226 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4228 = _4216 + _4226;
    float _4230 = _4220 * _4220;
    float _4232 = fma(_3558, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4234 = fma(_4224, _4224, _4230);
    float _4236 = floor(_4232);
    float _4238 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4240 = fma(_4228, _4228, _4234);
    float _4242 = rsqrt(_4240);
    float _4244 = sqrt(_4240);
    float _4246 = _4242 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4248 = _4224 * _4246;
    float _4250 = _4228 * _4246;
    float _4252 = _4248 * _4248;
    float _4254 = _4250 * _4250;
    float _4256 = _4252 + _4254;
    float _4258 = sqrt(_4256);
    bool _4260 = _4258 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4262 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4264 = _4258 + _4262;
    float _4266 = _4228;
    float _4268 = _4256;
    float _4270 = _4264;
    float _4272 = _4220;
    float _4274 = _4204;
    if (_4260)
    {
        float _4276 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4266 = _4276;
    }
    float _4278 = _4266;
    if (_4260)
    {
        float _4280 = rsqrt(_4256);
        _4268 = _4280;
    }
    float _4282 = _4268;
    float _4284 = _4282;
    if (_4260)
    {
        float _4286 = _4264 * _4278;
        _4270 = _4286;
    }
    float _4288 = _4270;
    if (_4260)
    {
        float _4290 = _4288 * 0.15915493667125701904296875;
        _4122 = _4290;
    }
    float _4292 = _4122;
    float _4294 = _4278;
    float _4296 = _4292;
    if (_4260)
    {
        float _4298 = _4292 * 6.283185482025146484375;
        float _4300 = sin(_4298);
        _4294 = _4300;
    }
    float _4302 = _4294;
    float _4304 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4306 = precise::max(0.0, _4304);
    float _4308 = _4202;
    float _4310 = _4306;
    if (_4260)
    {
        float _4312 = _4292 * 6.283185482025146484375;
        float _4314 = cos(_4312);
        _4308 = _4314;
    }
    float _4316 = _4308;
    float _4318 = -_4246;
    float _4320 = -_4306;
    float _4322 = fma(_4220, _4318, _4320);
    if (!_4260)
    {
        _4272 = _4248;
    }
    float _4324 = _4272;
    float _4326 = _4324;
    if (_4260)
    {
        float _4328 = _4322 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4310 = _4328;
    }
    float _4330 = _4310;
    float _4332 = _4302;
    float _4334 = _4330;
    if (_4260)
    {
        float _4336 = fma(_4302, _4330, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4332 = _4336;
    }
    float _4338 = _4332;
    float _4340 = _4338;
    float _4342 = _4316;
    if (_4260)
    {
        float _4344 = _4316 + (-1.0);
        _4334 = _4344;
    }
    float _4346 = _4334;
    float _4348 = _4346;
    if (_4260)
    {
        float _4350 = _4282 * _4338;
        _4274 = _4350;
    }
    float _4352 = _4274;
    if (!_4260)
    {
        _4340 = _4322;
    }
    float _4354 = _4340;
    float _4356 = _4354;
    if (_4260)
    {
        float _4358 = _4346 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4296 = _4358;
    }
    float _4360 = _4296;
    if (_4260)
    {
        float _4362 = _4248 * _4352;
        _4326 = _4362;
    }
    float _4364 = _4326;
    if (!_4260)
    {
        _4348 = _4250;
    }
    float _4366 = _4348;
    float _4368 = _4366;
    if (_4260)
    {
        float _4370 = _4250 * _4352;
        _4368 = _4370;
    }
    float _4372 = _4368;
    if (!_4260)
    {
        _4284 = _4252;
    }
    float _4374 = _4284;
    float _4376 = _4374;
    if (_4260)
    {
        float _4378 = fma(_4322, _4316, _4360);
        _4356 = _4378;
    }
    float _4380 = _4356;
    if (_4260)
    {
        float _4382 = _4364 * _4364;
        _4376 = _4382;
    }
    float _4384 = _4376;
    if (!_4260)
    {
        _4342 = _4254;
    }
    float _4386 = _4342;
    float _4388 = _4386;
    if (_4260)
    {
        float _4390 = _4372 * _4372;
        _4388 = _4390;
    }
    float _4392 = _4388;
    float _4394 = fma(_4380, _4380, _4384);
    float _4396 = _4208 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4398 = _4208 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4400 = _4394 + _4392;
    float _4402 = _4208 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4404 = fma(_3576, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4406 = fma(_4212, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4396);
    float _4408 = fma(_4212, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4398);
    float _4410 = fma(_4212, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4402);
    float _4412 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4414 = fma(_4244, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4412);
    float _4416 = precise::clamp(_4414, 0.0, 1.0);
    float _4418 = rsqrt(_4400);
    float _4420 = fma(_4216, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4406);
    float _4422 = fma(_4216, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4410);
    float _4424 = -_4416;
    float _4426 = _4424 + 1.0;
    float _4428 = _4208 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4430 = _4420 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4432 = _4422 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4434 = fma(_4216, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4408);
    float _4436 = fma(_4212, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4428);
    float _4438 = abs(_4426);
    float _4440 = log2(_4438);
    float _4442 = _4430 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4444 = _4434 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4446 = fma(_4216, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4436);
    float _4448 = fma(_4432, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4442);
    float _4450 = _4444 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4452 = _4418 * _4364;
    float _4454 = _4418 * _4380;
    float _4456 = _4418 * _4372;
    float _4458 = -_4450;
    float _4460 = fma(_4458, _4238, 1.0);
    float _4462 = _4452 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4464 = _4446 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4466 = fma(_4444, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4448);
    float _4468 = -_4236;
    float _4470 = _4232 + _4468;
    float _4472 = -_4462;
    float _4474 = fma(_4454, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4472);
    float _4476 = _4440 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4478 = fma(_4464, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4466);
    float _4480 = log2(_4460);
    float _4482 = -_4456;
    float _4484 = fma(_4482, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4474);
    float _4486 = _4430 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4488 = _4430 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4490 = fma(_4484, -0.5, 0.5);
    float _4492 = fma(_4484, 0.5, 0.5);
    float _4494 = fma(_4432, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4486);
    float _4496 = exp2(_4476);
    float _4498 = fma(_4432, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4488);
    float _4500 = _4454 + 1.0;
    float _4502 = fma(_4444, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4494);
    float _4504 = fma(_4492, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4506 = fma(_4444, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4498);
    float _4508 = 1.0 / _4478;
    float _4510 = fma(_4492, _4504, -0.212114393711090087890625);
    float _4512 = _4480 * 0.693147182464599609375;
    float _4514 = fma(_4492, _4510, 1.570728778839111328125);
    float _4516 = _4512 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4518 = sqrt(_4490);
    float _4520 = -_4454;
    float _4522 = fma(_4496, _4500, _4520);
    float _4524 = fma(_4464, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4502);
    float _4526 = fma(_4464, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4506);
    float _4528 = fma(_4522, 0.5, 0.5);
    float _4530 = floor(_4404);
    float _4532 = _4524 * _4508;
    float _4534 = _4526 * _4508;
    float _4536 = fma(_4532, 0.5, 0.5);
    float _4538 = fma(_4534, -0.5, 0.5);
    float _4540 = _4518 * 0.636619746685028076171875;
    float _4542 = -_4514;
    float _4544 = fma(_4540, _4542, 1.0);
    float _4546 = -_4530;
    float _4548 = _4404 + _4546;
    float2 _11820 = float2(_4470, _4548);
    float _4550 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11820, float2(0.0), isnan(_11820)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11820, float2(0.0), isnan(_11820)), level(0.0)).x;
    float3 _11831 = float3(_4536, _4538, _4516);
    float _4552 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11831, float3(0.0), isnan(_11831)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11831, float3(0.0), isnan(_11831)), level(0.0)).x;
    float3 _11842 = float3(_4536, _4538, _4516);
    float4 _4555 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11842, float3(0.0), isnan(_11842)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11842, float3(0.0), isnan(_11842)), level(0.0)).xyzw;
    float _4557 = _4555.x;
    float _4559 = _4555.y;
    float _4561 = _4555.z;
    float _4563 = _4555.w;
    float2 _11858 = float2(_4544, _4528);
    float3 _4567 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11858, float2(0.0), isnan(_11858)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11858, float2(0.0), isnan(_11858)), level(0.0)).xyz;
    float _4569 = _4567.x;
    float _4571 = _4567.y;
    float _4573 = _4567.z;
    float _4575 = _3552 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4577 = _3552 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4579 = _4430 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4581 = fma(_3558, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4575);
    float _4583 = fma(_3558, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4577);
    float _4585 = fma(_4432, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4579);
    float _4587 = fma(_3576, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4581);
    float _4589 = fma(_3576, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4583);
    float _4591 = _4587 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4593 = _4589 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4595 = in.m_94.x;
    float _4597 = 1.0 / _4591;
    float _4599 = _4593 + _4591;
    float _4601 = fma(_4444, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4585);
    float _4603 = _4524 + _4478;
    float _4605 = _4603 * 0.5;
    float _4607 = _4599 * _4597;
    float _4609 = _4607 * 0.5;
    float _4611 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4613 = fma(_4609, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4611);
    float _4615 = 1.0 / _4613;
    float _4617 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4619 = _4615 * _4617;
    float _4621 = abs(_4619);
    float _4623 = log2(_4621);
    bool _4625 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4627 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4629 = _4625 || _4627;
    bool _4631 = isnan(0.5);
    bool _4633 = _4629 || _4631;
    bool _4635 = _4619 <= 8000.0;
    bool _4637 = isnan(_4619);
    bool _4639 = _4635 || _4637;
    bool _4641 = isnan(8000.0);
    bool _4643 = _4639 || _4641;
    float _4645 = float(_4643);
    float _4647 = _4623 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4649 = exp2(_4647);
    float _4651 = fma(_4649, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4653 = precise::clamp(_4651, 0.0, 1.0);
    float _4655 = fma(_4464, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4601);
    float _4657 = fma(_4653, -2.0, 3.0);
    float _4659 = _4653 * _4653;
    float _4661 = _4440 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4663 = _4655 + _4478;
    float _4665 = _4659 * _4657;
    float _4667 = exp2(_4661);
    float _4669 = _4663 * 0.5;
    float _4671 = -_4665;
    float _4673 = _4671 + 1.0;
    float _4675 = fma(_4673, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4665);
    float _4677 = _4645 * _4675;
    float _4679 = _4478 * 0.5;
    float _4681 = _4645;
    float _4683 = _4478;
    float _4685 = _4655;
    float _4687 = _4526;
    float _4689 = _4524;
    if (_4633)
    {
        _4681 = 1.0;
    }
    float _4691 = _4681;
    float _4693 = fma(_4526, -0.5, _4679);
    float _4695 = _4691;
    float _4697 = _4559;
    if (!_4633)
    {
        float _4699 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4701 = _4699 * 0.15915493667125701904296875;
        float _4703 = _4701 * 6.283185482025146484375;
        float _4705 = cos(_4703);
        float _4707 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4709 = _4707 * 0.15915493667125701904296875;
        float _4711 = _4701 * 6.283185482025146484375;
        float _4713 = sin(_4711);
        float _4715 = 1.0 / _4705;
        float _4717 = _4709 * 6.283185482025146484375;
        float _4719 = cos(_4717);
        float _4721 = _4713 * _4715;
        float _4723 = _4709 * 6.283185482025146484375;
        float _4725 = sin(_4723);
        float _4727 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4729 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4727;
        float _4731 = _4719 * _4721;
        float _4733 = 1.0 / _4729;
        float _4735 = 1.0 / _4731;
        float _4737 = _4725 * _4735;
        float _4739 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4741 = fma(_4619, _4737, _4739);
        float _4743 = _4741 * _4733;
        float _4745 = precise::clamp(_4743, 0.0, 1.0);
        _4695 = _4745;
    }
    float _4747 = _4695;
    float _4749 = _4677 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4751 = -_4667;
    float _4753 = _4751 + 1.0;
    float _4755 = -_4550;
    float _4757 = _4755 + 1.0;
    out.m_96.x = _4605;
    out.m_96.y = _4693;
    out.m_96.z = _4669;
    out.m_96.w = _4478;
    float _4759 = _4753 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4761 = _4757 * _4749;
    float _4763 = precise::clamp(_4761, 0.0, 1.0);
    bool _4765 = _4244 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4767 = isnan(_4244);
    bool _4769 = _4765 || _4767;
    bool _4771 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4773 = _4769 || _4771;
    float _4775 = _4759 * _4552;
    float _4777 = -_4763;
    float _4779 = fma(_4777, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4781 = -_4759;
    float _4783 = _4781 + 1.0;
    out.gl_Position.x = _4524;
    out.gl_Position.y = _4526;
    out.gl_Position.z = _4655;
    out.gl_Position.w = _4478;
    float _4785 = _4563 * _4775;
    float _4787 = _4779 * _4595;
    float _4789 = _4573 * _4775;
    float _4791 = fma(_4569, _4785, _4557);
    float _4793 = fma(_4571, _4785, _4559);
    float _4795 = _4787 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4797 = _4563 * _4783;
    float _4799 = fma(_4563, _4789, _4561);
    float _4801 = _4747 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4803 = _4775;
    if (!_4773)
    {
        _4697 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4805 = _4697;
    out.m_98.x = _4795;
    float _4807 = _4805;
    float _4809 = _4805;
    if (!_4773)
    {
        _4803 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4811 = _4803;
    float _4813 = _4811;
    float _4815 = _4811;
    if (!_4773)
    {
        _4683 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4817 = _4683;
    out.m_100.x = _4791;
    out.m_100.y = _4793;
    out.m_100.z = _4799;
    out.m_100.w = _4797;
    float _4819 = _4817;
    float _4821 = _4817;
    if (!_4773)
    {
        _4685 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4823 = _4685;
    float _4825 = _4823;
    float _4827 = _4823;
    if (!_4773)
    {
        _4687 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4829 = _4687;
    float _4831 = _4829;
    float _4833 = _4829;
    if (!_4773)
    {
        _4689 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4835 = _4689;
    bool _4837 = !_4773;
    float _4839 = _4835;
    float _4841 = _4835;
    if (!_4837)
    {
        bool _4843 = _4244 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4845 = isnan(_4244);
        bool _4847 = _4843 || _4845;
        bool _4849 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4851 = _4847 || _4849;
        if (!_4851)
        {
            float _4853 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4855 = _4244 + _4853;
            float _4857 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4859 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4857;
            float _4861 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4863 = _4861 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4865 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4867 = _4865 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4869 = 1.0 / _4859;
            float _4871 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4873 = _4871 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4875 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4877 = _4875 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4879 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4881 = _4879 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4883 = _4855 * _4869;
            float _4885 = precise::clamp(_4883, 0.0, 1.0);
            float _4887 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4889 = _4887 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4891 = fma(_4885, _4863, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4893 = fma(_4885, _4867, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4895 = fma(_4885, _4889, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4897 = fma(_4885, _4873, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4899 = fma(_4885, _4877, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4901 = fma(_4885, _4881, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4833 = _4891;
            _4815 = _4899;
            _4827 = _4893;
            _4809 = _4897;
            _4841 = _4895;
            _4821 = _4901;
            _4903 = true;
        }
        else
        {
            bool _4905 = _4244 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4907 = isnan(_4244);
            bool _4909 = _4905 || _4907;
            bool _4911 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4913 = _4909 || _4911;
            if (!_4913)
            {
                _4807 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4915 = _4807;
            _4809 = _4915;
            if (!_4913)
            {
                _4813 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4917 = _4813;
            _4815 = _4917;
            if (!_4913)
            {
                _4819 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4919 = _4819;
            _4821 = _4919;
            if (!_4913)
            {
                _4825 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4921 = _4825;
            _4827 = _4921;
            if (!_4913)
            {
                _4831 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4923 = _4831;
            _4833 = _4923;
            if (!_4913)
            {
                _4839 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4925 = _4839;
            bool _4927 = !_4913;
            _4841 = _4925;
            if (!_4927)
            {
                bool _4929 = _4244 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4931 = isnan(_4244);
                bool _4933 = _4929 || _4931;
                bool _4935 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4937 = _4933 || _4935;
                if (!_4937)
                {
                    float _4939 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4941 = _4244 + _4939;
                    float _4943 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4945 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4943;
                    float _4947 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4949 = _4947 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4951 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4953 = _4951 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4955 = 1.0 / _4945;
                    float _4957 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4959 = _4957 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4961 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4963 = _4961 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4965 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4967 = _4965 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4969 = _4941 * _4955;
                    float _4971 = precise::clamp(_4969, 0.0, 1.0);
                    float _4973 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4975 = _4973 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4977 = fma(_4971, _4949, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4979 = fma(_4971, _4953, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4981 = fma(_4971, _4975, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4983 = fma(_4971, _4959, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4985 = fma(_4971, _4963, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4987 = fma(_4971, _4967, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4833 = _4977;
                    _4815 = _4985;
                    _4827 = _4979;
                    _4809 = _4983;
                    _4841 = _4981;
                    _4821 = _4987;
                    _4903 = true;
                }
                else
                {
                    _4833 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4815 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4827 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4809 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4841 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4821 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4903 = false;
    float _4989 = _4833;
    float _4991 = _4815;
    float _4993 = _4827;
    float _4995 = _4809;
    float _4997 = _4841;
    float _4999 = _4821;
    float _5001 = fma(_3990, -0.5, 0.5);
    float _5003 = precise::clamp(_5001, 0.0, 1.0);
    float _5005 = -_4989;
    float _5007 = _4991 + _5005;
    float _5009 = _4801 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5011 = -_4993;
    float _5013 = _4995 + _5011;
    float _5015 = fma(_5003, _5007, _4989);
    out.m_102.x = 0.0;
    float _5017 = -_4997;
    float _5019 = _4999 + _5017;
    float _5021 = fma(_5003, _5013, _4993);
    float _5023 = _5015 * 0.586610972881317138671875;
    out.m_55.x = _5009;
    bool _5025 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5027 = fma(_5003, _5019, _4997);
    float _5029 = fma(_5021, 0.298911988735198974609375, _5023);
    bool _5031 = _4747 > 0.0;
    bool _5033 = isnan(_4747);
    bool _5035 = _5031 || _5033;
    bool _5037 = isnan(0.0);
    bool _5039 = _5035 || _5037;
    float _5041 = fma(_5027, 0.114477999508380889892578125, _5029);
    float _5043 = -_5041;
    float _5045 = _5021 + _5043;
    float _5047 = -_5041;
    float _5049 = _5015 + _5047;
    float _5051 = -_5041;
    float _5053 = _5027 + _5051;
    float _5055 = fma(_5045, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5041);
    float _5057 = fma(_5049, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5041);
    float _5059 = fma(_5053, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5041);
    bool _5061 = !_5025;
    if (!_5061)
    {
        float _5063 = -_4208;
        float _5065 = _5063 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5067 = -_4212;
        float _5069 = _5067 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5071 = -_4216;
        float _5073 = _5071 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5075 = _5065 * _5065;
        float _5077 = fma(_5069, _5069, _5075);
        float _5079 = fma(_5073, _5073, _5077);
        float _5081 = sqrt(_5079);
        float _5083 = rsqrt(_5079);
        float _5085 = -_5081;
        float _5087 = _5085 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5089 = _5087 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5091 = precise::clamp(_5089, 0.0, 1.0);
        float _5093 = _5069 * _5083;
        float _5095 = _5065 * _5083;
        float _5097 = abs(_5091);
        float _5099 = log2(_5097);
        float _5101 = _5073 * _5083;
        float _5103 = _5093 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5105 = _3990 * _5095;
        float _5107 = -_5095;
        float _5109 = -_5103;
        float _5111 = fma(_5107, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5109);
        float _5113 = fma(_3988, _5093, _5105);
        float _5115 = -_5101;
        float _5117 = fma(_5115, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5111);
        float _5119 = fma(_3992, _5101, _5113);
        float _5121 = precise::clamp(_5119, 0.0, 1.0);
        float _5123 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5125 = _5117 + _5123;
        float _5127 = _5099 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5129 = _5125 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5131 = precise::clamp(_5129, 0.0, 1.0);
        float _5133 = exp2(_5127);
        float _5135 = _5133 * _5131;
        float _5137 = _5121 * _5135;
        float _5139 = _5137 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5141 = _5137 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5143 = _5137 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_102.x = _5139;
        out.m_102.y = _5141;
        out.m_102.z = _5143;
    }
    out.m_104.x = _5055;
    out.m_104.y = _5057;
    out.m_104.z = _5059;
    if (_5039)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_55.x = 0.0;
    float _5145 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5145;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4903 = false;
    bool _4042 = false;
    bool _561 = false;
    bool _455 = false;
    bool _263 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_48.w;
    float _120 = in.m_50.w;
    float _122 = trunc(_118);
    int _125 = int(_122);
    float _127 = -_120;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _129;
    bool _133 = _125 >= 1;
    float _135 = 0.0;
    float _137 = _120;
    float _139 = _129;
    if (!_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _135;
    if (!_133)
    {
        out.m_55.x = 0.0;
    }
    int _143 = 0;
    if (!_133)
    {
        float _145 = _141 * 5.0;
        _143 = as_type<int>(_145);
    }
    int _147 = _143;
    int _149 = _147;
    if (!_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5213 = as_type<float>(_147);
        out.gl_Position.z = _5213;
    }
    if (!_133)
    {
        return out;
    }
    bool _151 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _153 = isnan(_120);
    bool _155 = _151 || _153;
    bool _157 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _159 = _155 || _157;
    float _161 = float(_125);
    bool _163 = _129 >= _161;
    bool _165 = !_159;
    bool _167 = _163 || _165;
    float _169 = 1.0 / _161;
    if (_167)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _137;
    if (_167)
    {
        out.m_55.x = 0.0;
    }
    float _173 = _129 * _169;
    float _175 = _173;
    if (_167)
    {
        float _177 = _171 * 5.0;
        _149 = as_type<int>(_177);
    }
    int _179 = _149;
    out.m_53.x = _173;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5276 = as_type<float>(_179);
        out.gl_Position.z = _5276;
    }
    if (_167)
    {
        return out;
    }
    float _181 = as_type<float>(int(gl_VertexIndex));
    float _183 = in.m_60.x;
    float _185 = in.m_60.y;
    float _187 = in.m_60.z;
    float _189 = in.m_62.x;
    float _191 = in.m_62.y;
    float _193 = in.m_62.z;
    float _195 = in.m_64.x;
    float _197 = in.m_64.y;
    float _199 = in.m_64.z;
    float _201 = in.m_66.x;
    float _203 = in.m_66.y;
    float _205 = in.m_66.z;
    int _207 = as_type<int>(_181) & 1;
    bool _209 = _207 != 0;
    int _211 = as_type<int>(_181) & 2;
    bool _213 = _211 != 0;
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _217 = !_209;
    float _219 = _217 ? (-0.5) : 0.5;
    bool _221 = !_213;
    float _223 = _221 ? (-0.5) : 0.5;
    float _225 = _185 * _191;
    float _227 = _185 * _197;
    float _229 = fma(_183, _189, _225);
    float _231 = _185 * _203;
    float _233 = fma(_183, _195, _227);
    float _235 = fma(_187, _193, _229);
    float _237 = fma(_183, _201, _231);
    float _239 = fma(_187, _199, _233);
    float _241 = fma(_187, _205, _237);
    bool _243 = !_215;
    float _261;
    if (!_243)
    {
        float _245 = in.m_68.x;
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _249 = _245 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _253 = _251 * _247;
        float _255 = floor(_253);
        float _257 = -_255;
        float _259 = _253 + _257;
        _261 = _259;
        _263 = true;
    }
    else
    {
        _261 = _173;
    }
    _263 = false;
    float _265 = _261;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = _265 + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = _265 + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _277 = _265 + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _281 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _283 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _287;
    bool _291 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _293 = isnan(_265);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = 1.0 / _285;
    bool _305 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _307 = 1.0 / _281;
    float _309 = 1.0 / _289;
    float _311 = _277 * _303;
    bool _313 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _315 = isnan(_265);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = _269 * _307;
    bool _327 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _329 = isnan(_265);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -_301;
    float _341 = _339 + 1.0;
    float _343 = _337 * _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _349 = _273 * _309;
    bool _351 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _353 = isnan(_265);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -_337;
    float _365 = _363 + 1.0;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _371;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _379 = _361 * _365;
    float _381 = -_361;
    float _383 = _381 + 1.0;
    float _385 = fma(_369, _325, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _387 = fma(_373, _325, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _389 = _323 * _383;
    float _391 = -_323;
    float _393 = _391 + 1.0;
    float _395 = fma(_347, _311, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _397 = _385 * _389;
    float _399 = _387 * _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _401;
    float _405 = fma(_377, _311, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _407;
    float _411 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[143].x, _397);
    float _413 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _415 = fma(_403, _349, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _417 = fma(_409, _349, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _419 = fma(_395, _379, _411);
    float _421 = fma(_405, _379, _413);
    float _423 = fma(_415, _343, _419);
    float _425 = fma(_417, _343, _421);
    float _427 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[146].x, _423);
    float _429 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[146].y, _425);
    bool _431 = !_305;
    int _433 = as_type<int>(_349);
    float _435 = _311;
    float _453;
    if (!_431)
    {
        float _437 = in.m_68.x;
        float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _441 = _437 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _445 = _443 * _439;
        float _447 = floor(_445);
        float _449 = -_447;
        float _451 = _445 + _449;
        _453 = _451;
        _455 = true;
    }
    else
    {
        _453 = _173;
    }
    _455 = false;
    float _457 = _453;
    bool _459 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _461 = isnan(_457);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _475 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _477 = isnan(_457);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _487;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _493 = _457 + _491;
    float _495 = -_469;
    float _497 = _495 + 1.0;
    bool _499 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _501 = 1.0 / _473;
    float _503 = _485 * _497;
    float _505 = -_485;
    float _507 = _505 + 1.0;
    float _509 = _489 * _501;
    float _511 = fma(_509, _493, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _515 = _511 * _503;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _519 = _513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _521 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[115].x, _515);
    float _523 = _517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _525 = in.m_70.x;
    float _527 = in.m_70.y;
    float _529 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[116].x, _521);
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _533 = _529 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _535 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _523;
    out.m_72.y = _519;
    out.m_72.z = _535;
    out.m_72.w = _533;
    float _537 = _429 * _527;
    float _539 = _427 * _525;
    bool _541 = !_499;
    float _559;
    if (!_541)
    {
        float _543 = in.m_68.x;
        float _545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _547 = _543 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _549 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _551 = _549 * _545;
        float _553 = floor(_551);
        float _555 = -_553;
        float _557 = _551 + _555;
        _559 = _557;
        _561 = true;
    }
    else
    {
        _559 = _173;
    }
    _561 = false;
    float _563 = _559;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _567 = _563 + _565;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _573 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _575 = isnan(_563);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _589 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _591 = isnan(_563);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _601;
    bool _605 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _607 = isnan(_563);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _613 = _609 || _611;
    float _615 = float(_613);
    float _617 = 1.0 / _571;
    float _619 = -_583;
    float _621 = _619 + 1.0;
    bool _623 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _625 = _599 * _621;
    float _627 = -_599;
    float _629 = _627 + 1.0;
    float _631 = 1.0 / _587;
    float _633 = _603 * _617;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _639 = fma(_633, _567, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _641 = _637 * _631;
    float _643 = _639 * _625;
    float _645 = -_615;
    float _647 = _645 + 1.0;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _651 = _563 + _649;
    float _653 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[131].x, _643);
    float _655 = _583 * _647;
    float _657 = fma(_641, _651, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _661 = fma(_657, _655, _653);
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _667 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[133].x, _661);
    float _671 = _663 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _669 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_74.x = _667;
    out.m_74.y = _673;
    out.m_74.z = _671;
    out.m_74.w = _675;
    bool _677 = !_623;
    float _679 = _675;
    if (!_677)
    {
        float _681 = in.m_68.x;
        float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _685 = _681 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[14].x, _129);
        float _689 = _687 * _683;
        float _691 = floor(_689);
        float _693 = -_691;
        float _695 = _689 + _693;
        _175 = _695;
    }
    float _697 = _175;
    float _699 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _701 = int(_699);
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _705 = _703 != 0;
    float _707 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _709 = int(_707);
    float _711 = float(_701);
    float _713 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _715 = int(_713);
    if (_705)
    {
        _679 = 1.0;
    }
    float _717 = _679;
    float _719 = 0.0;
    float _721 = _717;
    if (_705)
    {
        _719 = 1.0;
    }
    float _723 = _719;
    float _725 = _723;
    if (_705)
    {
        _433 = 0;
    }
    int _727 = _433;
    float _729 = float(_709);
    float _731 = 1.0 / _711;
    float _733 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _735 = int(_733);
    float _737 = float(uint(_715));
    float _739 = 1.0 / _729;
    float _741 = _731 * _129;
    float _743 = 1.0 / _737;
    float _745 = float(uint(_735));
    int _747 = ~_735;
    int _749 = _747 + 1;
    float _751 = trunc(_741);
    int _753 = int(_751);
    float _755 = _739 * _129;
    float _757 = _739;
    float _759 = _711;
    int _761 = _727;
    if (_705)
    {
        float _763 = in.m_68.x;
        float _765 = in.m_68.y;
        _757 = _763;
        _759 = _765;
    }
    float _767 = _757;
    float _769 = _759;
    float _771 = 1.0 / _745;
    int _773 = as_type<int>(_743) + (-2);
    float _775 = trunc(_755);
    int _777 = int(_775);
    float _779 = float(uint(_753));
    float _781 = as_type<float>(_773) * _779;
    float _783 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _785 = int(_783);
    int _787 = as_type<int>(_771) + (-2);
    float _789 = _771;
    float _791 = _767;
    float _793 = _769;
    if (_705)
    {
        _435 = _767;
    }
    float _795 = _435;
    float _797 = _795;
    if (_705)
    {
        _789 = _769;
    }
    float _799 = _789;
    float _801 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _803 = int(_801);
    float _805 = float(uint(_777));
    float _807 = as_type<float>(_787) * _805;
    float _809 = trunc(_781);
    float _811 = precise::max(_809, 0.0);
    uint _814 = uint(_811);
    float _816 = float(uint(_785));
    float _818 = float(_803);
    float _820 = 1.0 / _816;
    float _822 = 1.0 / _818;
    int _824 = as_type<int>(_816);
    float _826 = _818;
    float _828 = _807;
    float _830 = _799;
    if (_705)
    {
        _824 = 0;
    }
    int _832 = _824;
    float _834 = trunc(_807);
    float _836 = precise::max(_834, 0.0);
    uint _838 = uint(_836);
    int _840 = _832;
    if (_705)
    {
        _826 = _795;
    }
    float _842 = _826;
    float _844 = _842;
    if (_705)
    {
        _828 = _795;
    }
    float _846 = _828;
    float _848 = _846;
    if (!_705)
    {
        float _850 = in.m_68.x;
        float _852 = in.m_68.y;
        float _854 = in.m_68.z;
        float _856 = _850 * 3.1415927410125732421875;
        float _858 = _856 * 0.15915493667125701904296875;
        float _860 = _852 * 3.1415927410125732421875;
        float _862 = _860 * 0.15915493667125701904296875;
        float _864 = _858 * 6.283185482025146484375;
        float _866 = sin(_864);
        float _868 = _862 * 6.283185482025146484375;
        float _870 = sin(_868);
        _725 = 5.839270114898681640625;
        _844 = _854;
        _721 = 7.345489978790283203125;
        _791 = _850;
        _797 = _852;
        _793 = _852;
        _848 = _866;
        _830 = _870;
        _761 = 1;
        _840 = 2;
    }
    float _872 = _725;
    float _874 = _844;
    float _876 = _721;
    float _878 = _791;
    float _880 = _797;
    float _882 = _793;
    float _884 = _848;
    float _886 = _830;
    int _888 = _761;
    int _890 = _840;
    int _892 = _749 * int(_838);
    int _894 = _892 + _777;
    int _896 = ~_715;
    int _898 = _896 + 1;
    float _900 = in.m_68.z;
    float _902 = in.m_68.w;
    float _904 = _822 * _129;
    float _906 = _872 * _874;
    float _908 = float(uint(_894));
    int _910 = _898 * int(_814);
    int _912 = _910 + _753;
    float _914 = _876 * _878;
    float _916 = floor(_906);
    float _918 = _876 * _880;
    float _920 = as_type<float>(_787) * _908;
    float _922 = float(uint(_912));
    float _924 = _878 * 2.0;
    float _926 = float(_735);
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _930 = _697 + _928;
    float _932 = float(_777);
    float _934 = trunc(_920);
    float _936 = precise::max(_934, 0.0);
    uint _938 = uint(_936);
    float _940 = as_type<float>(_773) * _922;
    bool _942 = _932 >= _926;
    bool _944 = isnan(_932);
    bool _946 = _942 || _944;
    bool _948 = isnan(_926);
    bool _950 = _946 || _948;
    float _952 = float(_950);
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _956 = _954 != 0;
    float _958 = trunc(_904);
    int _960 = int(_958);
    bool _962 = _882 > 0.5;
    float _964 = -_916;
    float _966 = _906 + _964;
    bool _968 = _902 > 0.5;
    bool _970 = _900 > 0.5;
    int _972 = as_type<int>(_820) + (-2);
    float _974 = floor(_914);
    int _976 = int(_838) + int(_938);
    int _978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _980 = _978 != 0;
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _984 = _982 != 0;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _988 = _986 != 0;
    int _990 = ~_715;
    int _992 = _990 + 1;
    int _994 = ~_735;
    int _996 = _994 + 1;
    float _998 = trunc(_940);
    float _1000 = precise::max(_998, 0.0);
    uint _1002 = uint(_1000);
    float _1004 = float(uint(_960));
    float _1006 = float(_753);
    float _1008 = as_type<float>(_972) * _1004;
    float _1010 = -_219;
    int _1012 = _962 ? as_type<int>(_1010) : as_type<int>(_219);
    float _1014 = trunc(_952);
    int _1016 = int(_1014);
    float _1018 = -_974;
    float _1020 = _914 + _1018;
    float _1022 = float(_715);
    int _1024 = _996 * _976;
    int _1026 = _1024 + _777;
    int _1028 = int(_968);
    int _1030 = _970 ? 2 : 0;
    int _1032 = _1028 | _1030;
    int _1034 = _956 ? 4 : 0;
    int _1036 = _1032 | _1034;
    int _1038 = _980 ? 8 : 0;
    int _1040 = _1036 | _1038;
    int _1042 = _984 ? 16 : 0;
    int _1044 = _1040 | _1042;
    int _1046 = _988 ? 32 : 0;
    int _1048 = _1044 | _1046;
    int _1050 = _962 ? 64 : 0;
    int _1052 = _1048 | _1050;
    int _1054 = _1052 & 64;
    bool _1056 = !_984;
    float _1058 = _1056 ? _219 : as_type<float>(_1012);
    int _1060 = int(_814) + int(_1002);
    float _1062 = trunc(_1008);
    float _1064 = precise::max(_1062, 0.0);
    uint _1066 = uint(_1064);
    float _1068 = -_223;
    int _1070 = _970 ? as_type<int>(_1068) : as_type<int>(_223);
    bool _1072 = _1006 >= _1022;
    bool _1074 = isnan(_1006);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan(_1022);
    bool _1080 = _1076 || _1078;
    float _1082 = float(_1080);
    float _1084 = _1020 * _926;
    bool _1086 = !_988;
    float _1088 = _1086 ? _223 : as_type<float>(_1070);
    float _1090 = floor(_918);
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1094 = _1092 != 0;
    int _1096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1098 = _1096 != 0;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1102 = _1100 != 0;
    bool _1104 = !_956;
    int _1106 = _1104 ? 0 : 1;
    int _1108 = _992 * _1060;
    int _1110 = _1108 + _753;
    bool _1112 = uint(_1026) >= uint(_735);
    bool _1114 = !_1098;
    int _1116 = _1114 ? 0 : 1;
    float _1118 = trunc(_1084);
    int _1120 = int(_1118);
    bool _1122 = !_1094;
    int _1124 = _1122 ? 0 : 1;
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1128 = _1126 != 0;
    bool _1130 = uint(_1110) >= uint(_715);
    float _1132 = _966 * _1022;
    bool _1134 = !_1102;
    int _1136 = _1134 ? 0 : 1;
    float _1138 = trunc(_1082);
    int _1140 = int(_1138);
    bool _1142 = !_1128;
    int _1144 = _1142 ? 0 : 1;
    float _1146 = -_1090;
    float _1148 = _918 + _1146;
    bool _1150 = !_1130;
    int _1152 = _1150 ? 0 : (-1);
    bool _1154 = !_1112;
    int _1156 = _1154 ? 0 : (-1);
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1160 = _1158 != 0;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1164 = _1162 != 0;
    int _1166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1168 = _1166 != 0;
    float _1170 = trunc(_1132);
    int _1172 = int(_1170);
    int _1174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1176 = _1174 != 0;
    int _1178 = ~_785;
    int _1180 = _1178 + 1;
    int _1182 = ~_1060;
    int _1184 = _1182 + _1152;
    int _1186 = _1184 + 1;
    bool _1188 = !_1176;
    int _1190 = _1188 ? 0 : 1;
    int _1192 = _1180 * int(_1066);
    int _1194 = _1192 + _960;
    int _1196 = abs(_1106);
    float _1198 = floor(_924);
    int _1200 = ~_976;
    int _1202 = _1200 + _1156;
    int _1204 = _1202 + 1;
    int _1206 = _715 * _1186;
    int _1208 = _1206 + _753;
    int _1210 = abs(_1190);
    int _1212 = _1120 * _1196;
    int _1214 = _1212 + _777;
    float _1216 = float(uint(_1194));
    int _1218 = _735 * _1204;
    int _1220 = _1218 + _777;
    float _1222 = _169 * _129;
    bool _1224 = _735 == 0;
    bool _1226 = !_1164;
    int _1228 = _1226 ? 0 : 1;
    float _1230 = _926 * _1222;
    bool _1232 = _1054 != 0;
    float _1234 = as_type<float>(_972) * _1216;
    bool _1236 = !_1160;
    int _1238 = _1236 ? 0 : 1;
    float _1240 = _1022 * _1222;
    int _1242 = ~_1016;
    int _1244 = _1242 + 1;
    int _1246 = _1244 + 1;
    float _1248 = trunc(_1230);
    int _1250 = int(_1248);
    bool _1252 = !_1224;
    int _1254 = _1252 ? _1220 : (-1);
    int _1256 = _1172 * _1210;
    int _1258 = _1256 + _753;
    bool _1260 = _715 == 0;
    float _1262 = _884 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    int _1264 = ~_1140;
    int _1266 = _1264 + 1;
    int _1268 = _1266 + 1;
    int _1270 = _1254 * _1246;
    bool _1272 = !_1260;
    int _1274 = _1272 ? _1208 : (-1);
    float _1276 = trunc(_1234);
    float _1278 = precise::max(_1276, 0.0);
    uint _1280 = uint(_1278);
    int _1282 = _735 + (-1);
    int _1284 = _715 + (-1);
    int _1286 = _1274 * _1268;
    int _1288 = abs(_1116);
    int _1290 = _1016 * _1282;
    int _1292 = _1290 + _1270;
    int _1294 = abs(_1136);
    int _1296 = _1140 * _1284;
    int _1298 = _1296 + _1286;
    int _1300 = abs(_1144);
    int _1302 = _1292 * _1288;
    int _1304 = abs(_1124);
    float _1306 = trunc(_1240);
    int _1308 = int(_1306);
    int _1310 = abs(_1228);
    float _1312 = _882 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1314 = ~_785;
    int _1316 = _1314 + 1;
    int _1318 = _1250 * _1304;
    int _1320 = _1318 + _1302;
    int _1322 = _1214 * _1294;
    int _1324 = _1322 + _1320;
    int _1326 = int(_1066) + int(_1280);
    int _1328 = _1120 * _1300;
    int _1330 = _1328 + _1324;
    bool _1332 = !_1168;
    int _1334 = _1332 ? 0 : 1;
    int _1336 = _1298 * _1310;
    int _1338 = abs(_1238);
    int _1340 = _1316 * _1326;
    int _1342 = _1340 + _960;
    float _1344 = float(uint(_1330));
    float _1346 = -_223;
    int _1348 = _968 ? as_type<int>(_1346) : as_type<int>(_223);
    int _1350 = _1308 * _1338;
    int _1352 = _1350 + _1336;
    float _1354 = -_219;
    int _1356 = _970 ? as_type<int>(_1354) : as_type<int>(_219);
    float _1358 = float(_785);
    float _1360 = float(_960);
    int _1362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1364 = _1362 != 0;
    float _1366 = _1358 * _1222;
    int _1368 = abs(_1334);
    float _1370 = as_type<float>(_787) * _1344;
    bool _1372 = uint(_1342) >= uint(_785);
    int _1374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1376 = _1374 != 0;
    int _1378 = _1258 * _1368;
    int _1380 = _1378 + _1352;
    bool _1382 = _1360 >= _1358;
    bool _1384 = isnan(_1360);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan(_1358);
    bool _1390 = _1386 || _1388;
    float _1392 = float(_1390);
    float _1394 = trunc(_1366);
    int _1396 = int(_1394);
    bool _1398 = !_1364;
    int _1400 = _1398 ? 0 : 1;
    bool _1402 = !_980;
    float _1404 = _1402 ? _223 : as_type<float>(_1348);
    bool _1406 = !_1376;
    int _1408 = _1406 ? 0 : 1;
    int _1410 = abs(_1400);
    float _1412 = trunc(_1370);
    float _1414 = precise::max(_1412, 0.0);
    uint _1416 = uint(_1414);
    bool _1418 = !_1372;
    int _1420 = _1418 ? 0 : (-1);
    float _1422 = _1148 * _1358;
    int _1424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1426 = _1424 != 0;
    int _1428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1430 = _1428 != 0;
    int _1432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1434 = _1432 != 0;
    int _1436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1438 = _1436 != 0;
    int _1440 = ~_1326;
    int _1442 = _1440 + _1420;
    int _1444 = _1442 + 1;
    float _1446 = trunc(_1392);
    int _1448 = int(_1446);
    int _1450 = ~_735;
    int _1452 = _1450 + 1;
    int _1454 = _1172 * _1410;
    int _1456 = _1454 + _1380;
    bool _1458 = !_1426;
    int _1460 = _1458 ? 0 : 1;
    int _1462 = _785 * _1444;
    int _1464 = _1462 + _960;
    bool _1466 = _785 == 0;
    float _1468 = float(uint(_1456));
    int _1470 = _1452 * int(_1416);
    int _1472 = _1470 + _1330;
    bool _1474 = !_1430;
    int _1476 = _1474 ? 0 : 1;
    float _1478 = trunc(_1422);
    int _1480 = int(_1478);
    int _1482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1484 = _1482 != 0;
    float _1486 = as_type<float>(_773) * _1468;
    bool _1488 = !_1466;
    int _1490 = _1488 ? _1464 : (-1);
    float _1492 = float(uint(_1472));
    int _1494 = ~_1448;
    int _1496 = _1494 + 1;
    int _1498 = _1496 + 1;
    float _1500 = trunc(_1486);
    float _1502 = precise::max(_1500, 0.0);
    uint _1504 = uint(_1502);
    int _1506 = abs(_1476);
    float _1508 = as_type<float>(_787) * _1492;
    int _1510 = abs(_1460);
    int _1512 = _1490 * _1498;
    int _1514 = _785 + (-1);
    float _1516 = _1468;
    float _1518 = as_type<float>(_888);
    float _1520 = as_type<float>(_890);
    if (_1484)
    {
        float _1522 = in.m_68.w;
        _1516 = _1522;
    }
    float _1524 = _1516;
    int _1526 = abs(_1408);
    float _1528 = trunc(_1508);
    float _1530 = precise::max(_1528, 0.0);
    uint _1532 = uint(_1530);
    bool _1534 = _735 == 0;
    int _1536 = _1448 * _1514;
    int _1538 = _1536 + _1512;
    int _1540 = _1538 * _1506;
    int _1542 = ~_715;
    int _1544 = _1542 + 1;
    float _1546 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1548 = log2(_1546);
    float _1550 = 0.0;
    float _1552 = as_type<float>(_1526);
    if (!_1484)
    {
        _1550 = _219;
    }
    float _1554 = _1550;
    int _1556 = _1396 * _1510;
    int _1558 = _1556 + _1540;
    int _1560 = _1480 * _1526;
    int _1562 = _1560 + _960;
    bool _1564 = !_1434;
    int _1566 = _1564 ? 0 : 1;
    int _1568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1570 = _1568 != 0;
    int _1572 = _1544 * int(_1504);
    int _1574 = _1572 + _1456;
    int _1576 = int(_1416) + int(_1532);
    int _1578 = abs(_1566);
    float _1580 = float(uint(_1574));
    float _1582 = _1554;
    if (_1484)
    {
        float _1584 = _1524 * 3.1415927410125732421875;
        _1552 = _1584;
    }
    float _1586 = _1552;
    int _1588 = ~_735;
    int _1590 = _1588 + 1;
    bool _1592 = !_1438;
    int _1594 = _1592 ? 0 : 1;
    float _1596 = as_type<float>(_773) * _1580;
    int _1598 = _1590 * _1576;
    int _1600 = _1598 + _1330;
    float _1602 = _1586;
    if (_1484)
    {
        float _1604 = _1586 * 0.15915493667125701904296875;
        _1602 = _1604;
    }
    float _1606 = _1602;
    int _1608 = abs(_1594);
    float _1610 = trunc(_1596);
    float _1612 = precise::max(_1610, 0.0);
    uint _1614 = uint(_1612);
    int _1616 = _1562 * _1578;
    int _1618 = _1616 + _1558;
    bool _1620 = uint(_1600) >= uint(_735);
    float _1622 = as_type<float>(_1396);
    if (_1570)
    {
        float _1624 = in.m_68.x;
        _1622 = _1624;
    }
    float _1626 = _1622;
    float _1628 = float(uint(_1214));
    int _1630 = _1480 * _1608;
    int _1632 = _1630 + _1618;
    bool _1634 = !_1620;
    int _1636 = _1634 ? 0 : (-1);
    float _1638 = _1606;
    if (_1484)
    {
        float _1640 = _1606 * 6.283185482025146484375;
        float _1642 = sin(_1640);
        _1638 = _1642;
    }
    float _1644 = _1638;
    float _1646 = as_type<float>(_787) * _1628;
    int _1648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1650 = _1648 != 0;
    int _1652 = ~_1576;
    int _1654 = _1652 + _1636;
    int _1656 = _1654 + 1;
    bool _1658 = !_1650;
    float _1660 = _1658 ? _219 : as_type<float>(_1356);
    float _1662 = trunc(_1646);
    float _1664 = precise::max(_1662, 0.0);
    uint _1666 = uint(_1664);
    float _1668 = float(uint(_1632));
    int _1670 = _735 * _1656;
    int _1672 = _1670 + _1330;
    int _1674 = int(_1504) + int(_1614);
    float _1676 = float(uint(_1258));
    float _1678 = as_type<float>(_972) * _1668;
    bool _1680 = !_1534;
    int _1682 = _1680 ? _1672 : (-1);
    bool _1684 = _1650;
    float _1686 = _1668;
    if (_1484)
    {
        bool _1688 = _1644 > 0.5;
        _1684 = _1688;
    }
    bool _1690 = _1684;
    float _1692 = trunc(_1678);
    float _1694 = precise::max(_1692, 0.0);
    uint _1696 = uint(_1694);
    int _1698 = ~_735;
    int _1700 = _1698 + 1;
    if (_1570)
    {
        float _1702 = _1626 * 3.1415927410125732421875;
        _1686 = _1702;
    }
    float _1704 = _1686;
    float _1706 = _1704;
    if (_1484)
    {
        float _1708 = -_219;
        float _1710 = _1690 ? _1708 : _219;
        _1582 = _1710;
    }
    float _1712 = _1582;
    float _1714 = as_type<float>(_773) * _1676;
    int _1716 = _1682 & 3;
    bool _1718 = _1716 != 0;
    int _1720 = _1700 * int(_1666);
    int _1722 = _1720 + _1214;
    int _1724 = _1682 & 3;
    bool _1726 = _1724 != 0;
    if (_1570)
    {
        float _1728 = _1704 * 0.15915493667125701904296875;
        _1706 = _1728;
    }
    float _1730 = _1706;
    int _1732 = ~_785;
    int _1734 = _1732 + 1;
    float _1736 = trunc(_1714);
    float _1738 = precise::max(_1736, 0.0);
    uint _1740 = uint(_1738);
    int _1742 = _1718 ? 0 : 1;
    bool _1744 = uint(_1724) > 1u;
    float _1746 = float(uint(_1722));
    float _1748 = _1730;
    if (_1570)
    {
        float _1750 = _1730 * 6.283185482025146484375;
        float _1752 = sin(_1750);
        _1748 = _1752;
    }
    float _1754 = _1748;
    int _1756 = ~_715;
    int _1758 = _1756 + 1;
    float _1760 = as_type<float>(_787) * _1746;
    float _1762 = -_223;
    int _1764 = _1232 ? as_type<int>(_1762) : as_type<int>(_223);
    int _1766 = _1734 * int(_1696);
    int _1768 = _1766 + _1632;
    int _1770 = ~_1742;
    int _1772 = _1770 + 1;
    int _1774 = _1772 + 1;
    int _1776 = _1758 * _1674;
    int _1778 = _1776 + _1456;
    bool _1780 = uint(_1724) >= 2u;
    float _1782 = trunc(_1760);
    float _1784 = precise::max(_1782, 0.0);
    uint _1786 = uint(_1784);
    float _1788 = float(uint(_1768));
    int _1790 = _1774;
    if (!_1744)
    {
        int _1792 = ~_1742;
        int _1794 = _1792 + 1;
        _1790 = _1794;
    }
    int _1796 = _1790;
    bool _1798 = uint(_1778) >= uint(_715);
    float _1800 = as_type<float>(_972) * _1788;
    int _1802 = _1780 ? 0 : 1;
    bool _1804 = _1724 != 3;
    bool _1806 = !_1798;
    int _1808 = _1806 ? 0 : (-1);
    float _1810 = trunc(_1800);
    float _1812 = precise::max(_1810, 0.0);
    uint _1814 = uint(_1812);
    int _1816 = ~_715;
    int _1818 = _1816 + 1;
    int _1820 = ~_1674;
    int _1822 = _1820 + _1808;
    int _1824 = _1822 + 1;
    int _1826 = ~_1802;
    int _1828 = _1826 + 1;
    int _1830 = _1828 + 1;
    int _1832 = _1818 * int(_1740);
    int _1834 = _1832 + _1258;
    int _1836 = _715 * _1824;
    int _1838 = _1836 + _1456;
    float _1840 = 0.0;
    int _1842 = _1830;
    bool _1844 = _1804;
    if (!_1570)
    {
        _1840 = _223;
    }
    float _1846 = _1840;
    float _1848 = _1846;
    if (_1804)
    {
        int _1850 = ~_1802;
        int _1852 = _1850 + 1;
        _1842 = _1852;
    }
    int _1854 = _1842;
    if (_1570)
    {
        bool _1856 = _1754 > 0.5;
        _1844 = _1856;
    }
    bool _1858 = _1844;
    float _1860 = float(uint(_1834));
    bool _1862 = !_1260;
    int _1864 = _1862 ? _1838 : (-1);
    int _1866 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1868 = _1866 != 0;
    float _1870 = as_type<float>(_773) * _1860;
    if (_1570)
    {
        float _1872 = -_223;
        float _1874 = _1858 ? _1872 : _223;
        _1848 = _1874;
    }
    float _1876 = _1848;
    int _1878 = _1864 & 3;
    bool _1880 = _1878 != 0;
    bool _1882 = !_1868;
    float _1884 = _1882 ? _223 : as_type<float>(_1764);
    float _1886 = trunc(_1870);
    float _1888 = precise::max(_1886, 0.0);
    uint _1890 = uint(_1888);
    int _1892 = int(_1696) + int(_1814);
    int _1894 = ~_785;
    int _1896 = _1894 + 1;
    int _1898 = _1864 & 3;
    bool _1900 = _1898 != 0;
    bool _1902 = uint(_1878) > 1u;
    int _1904 = _1896 * _1892;
    int _1906 = _1904 + _1632;
    int _1908 = int(_1666) + int(_1786);
    int _1910 = ~_735;
    int _1912 = _1910 + 1;
    int _1914 = _1900 ? 0 : 1;
    int _1916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1918 = _1916 != 0;
    int _1920 = _1912 * _1908;
    int _1922 = _1920 + _1214;
    float _1924 = float(uint(_1562));
    bool _1926 = !_1918;
    int _1928 = _1926 ? 0 : 1;
    bool _1930 = uint(_1906) >= uint(_785);
    float _1932 = as_type<float>(_972) * _1924;
    int _1934 = ~_1914;
    int _1936 = _1934 + 1;
    int _1938 = _1936 + 1;
    int _1940 = _1938;
    if (!_1902)
    {
        int _1942 = ~_1914;
        int _1944 = _1942 + 1;
        _1940 = _1944;
    }
    int _1946 = _1940;
    bool _1948 = uint(_1922) >= uint(_735);
    bool _1950 = !_1930;
    int _1952 = _1950 ? 0 : (-1);
    float _1954 = trunc(_1932);
    float _1956 = precise::max(_1954, 0.0);
    uint _1958 = uint(_1956);
    bool _1960 = _1878 != 3;
    int _1962 = ~_715;
    int _1964 = _1962 + 1;
    bool _1966 = !_1948;
    int _1968 = _1966 ? 0 : (-1);
    bool _1970 = uint(_1878) >= 2u;
    int _1972 = int(_1740) + int(_1890);
    int _1974 = ~_1892;
    int _1976 = _1974 + _1952;
    int _1978 = _1976 + 1;
    int _1980 = _1970 ? 0 : 1;
    int _1982 = _785 * _1978;
    int _1984 = _1982 + _1632;
    int _1986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1988 = _1986 != 0;
    int _1990 = _1964 * _1972;
    int _1992 = _1990 + _1258;
    int _1994 = ~_785;
    int _1996 = _1994 + 1;
    int _1998 = ~_1980;
    int _2000 = _1998 + 1;
    int _2002 = _2000 + 1;
    int _2004 = _2002;
    float _2006 = as_type<float>(_1964);
    if (_1960)
    {
        int _2008 = ~_1980;
        int _2010 = _2008 + 1;
        _2004 = _2010;
    }
    int _2012 = _2004;
    int _2014 = _1996 * int(_1958);
    int _2016 = _2014 + _1562;
    int _2018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2020 = _2018 != 0;
    bool _2022 = !_1988;
    int _2024 = _2022 ? 0 : 1;
    bool _2026 = uint(_1992) >= uint(_715);
    bool _2028 = !_1466;
    int _2030 = _2028 ? _1984 : (-1);
    bool _2032 = !_2020;
    int _2034 = _2032 ? 0 : 1;
    bool _2036 = !_2026;
    int _2038 = _2036 ? 0 : (-1);
    int _2040 = _2030 & 3;
    bool _2042 = _2040 != 0;
    int _2044 = _2030 & 3;
    bool _2046 = _2044 != 0;
    float _2048 = float(uint(_2016));
    int _2050 = _2042 ? 0 : 1;
    bool _2052 = uint(_2044) > 1u;
    float _2054 = as_type<float>(_972) * _2048;
    int _2056 = ~_2050;
    int _2058 = _2056 + 1;
    int _2060 = _2058 + 1;
    float _2062 = trunc(_2054);
    float _2064 = precise::max(_2062, 0.0);
    uint _2066 = uint(_2064);
    float _2068 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2070 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2072 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2068);
    int _2074 = _2060;
    float _2076 = _2054;
    if (!_2052)
    {
        int _2078 = ~_2050;
        int _2080 = _2078 + 1;
        _2074 = _2080;
    }
    int _2082 = _2074;
    float _2084 = -_2070;
    float _2086 = fma(_1262, 2.0, _2084);
    bool _2088 = uint(_2044) >= 2u;
    float _2090 = _886 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _2092 = ~_785;
    int _2094 = _2092 + 1;
    float _2096 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2098 = _2088 ? 0 : 1;
    float _2100 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2102 = _2044 != 3;
    float _2104 = fma(_1312, -2.0, _2096);
    int _2106 = int(_1958) + int(_2066);
    float _2108 = -_129;
    float _2110 = fma(_2108, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2086);
    float _2112 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2072);
    int _2114 = ~_2098;
    int _2116 = _2114 + 1;
    int _2118 = _2116 + 1;
    int _2120 = _2094 * _2106;
    int _2122 = _2120 + _1562;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2126 = _2118;
    float _2128 = as_type<float>(_2122);
    if (_2102)
    {
        int _2130 = ~_2098;
        int _2132 = _2130 + 1;
        _2126 = _2132;
    }
    int _2134 = _2126;
    float _2136 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _2138 = uint(_2122) >= uint(_785);
    float _2140 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2124);
    float _2142 = _1548 * _129;
    float _2144 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2146 = !_2138;
    int _2148 = _2146 ? 0 : (-1);
    float _2150 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2140);
    bool _2152 = _878 > 0.5;
    float _2154 = exp2(_2142);
    float _2156 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2158 = -_219;
    int _2160 = _2152 ? as_type<int>(_2158) : as_type<int>(_219);
    float _2162 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2164 = _697 + _2162;
    bool _2166 = _888 != 1;
    float _2168 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2170 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2172 = -_2154;
    float _2174 = _2172 + 1.0;
    float _2176 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    if (!_2166)
    {
        _2006 = _882;
    }
    float _2178 = _2006;
    float _2180 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2182 = _2180 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2184 = 0.0;
    float _2186 = _2178;
    if (!_2166)
    {
        _2184 = _882;
    }
    float _2188 = _2184;
    float _2190 = fma(_2090, -2.0, _2176);
    float _2192 = _2188;
    if (!_2166)
    {
        _2076 = _900;
    }
    float _2194 = _2076;
    float _2196 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2104);
    float _2198 = _2194;
    if (!_2166)
    {
        _2128 = _900;
    }
    float _2200 = _2128;
    float _2202 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2190);
    float _2204 = _2200;
    if (_2166)
    {
        _2186 = _878;
    }
    float _2206 = _2186;
    float _2208 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2210 = _2208 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    if (_2166)
    {
        _2192 = _878;
    }
    float _2212 = _2192;
    float _2214 = 1.0 / _2182;
    if (_2166)
    {
        _2198 = _882;
    }
    float _2216 = _2198;
    float _2218 = _2206 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2166)
    {
        _2204 = _882;
    }
    float _2220 = _2204;
    bool _2222 = _890 != 2;
    float _2224 = -_2100;
    float _2226 = fma(_2218, 2.0, _2224);
    float _2228 = _2216 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2230 = fma(_2220, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2136);
    float _2232 = -_129;
    float _2234 = fma(_2232, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2226);
    float _2236 = fma(_2228, -2.0, _2144);
    float _2238 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2230);
    float _2240 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2242 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2236);
    float _2244 = 1.0 / _2210;
    if (_2222)
    {
        _1518 = _878;
    }
    float _2246 = _1518;
    float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2250 = _2248 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2252 = _2246;
    if (_2222)
    {
        _1520 = _882;
    }
    float _2254 = _1520;
    float _2256 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2258 = _2256 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2260 = _2254;
    if (!_2222)
    {
        _2252 = _900;
    }
    float _2262 = _2252;
    float _2264 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2266 = _697 + _2264;
    if (!_2222)
    {
        _2260 = _878;
    }
    float _2268 = _2260;
    float _2270 = 1.0 / _2250;
    int _2272 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2274 = _2272 != 0;
    float _2276 = _2262 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2278 = _878 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2280 = _2268 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2282 = !_2274;
    float _2284 = _2282 ? _219 : as_type<float>(_2160);
    float _2286 = in.m_48.x;
    float _2288 = in.m_48.y;
    float _2290 = in.m_48.z;
    bool _2292 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2294 = isnan(0.0);
    bool _2296 = _2292 || _2294;
    bool _2298 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2300 = _2296 || _2298;
    float _2302 = -_2156;
    float _2304 = fma(_2276, 2.0, _2302);
    float _2306 = fma(_2280, -2.0, _2240);
    float _2308 = -_2168;
    float _2310 = fma(_2278, 2.0, _2308);
    float _2312 = _2300 ? _2174 : 0.0;
    float _2314 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2306);
    bool _2316 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2318 = isnan(1.0);
    bool _2320 = _2316 || _2318;
    bool _2322 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2324 = _2320 || _2322;
    float _2326 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2328 = 1.0 + _2326;
    float _2330 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2332 = -_129;
    float _2334 = fma(_2332, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2310);
    float _2336 = 1.0 / _2328;
    float _2338 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2342 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2330);
    float _2344 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2346 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2338);
    float _2348 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2340);
    float _2350 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2170);
    float _2352 = fma(_2212, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2344);
    float _2354 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2346);
    float _2356 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2342);
    float _2358 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2350);
    float _2360 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2348);
    float _2362 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2352);
    float _2364 = -_129;
    float _2366 = fma(_2364, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2304);
    float _2368 = _191 * _2288;
    if (_2324)
    {
        float _2370 = _2312 * _2336;
        _139 = _2370;
    }
    float _2372 = _139;
    float _2374 = _882 * 2.0;
    bool _2376 = _1198 >= 0.0;
    bool _2378 = isnan(_1198);
    bool _2380 = _2376 || _2378;
    bool _2382 = isnan(0.0);
    bool _2384 = _2380 || _2382;
    float _2386 = _197 * _2288;
    float _2388 = _203 * _2288;
    float _2390 = floor(_2374);
    int _2392 = _2384 ? 0 : 1;
    float _2394 = fma(_195, _2286, _2386);
    bool _2396 = _1198 > 0.0;
    float _2398 = fma(_201, _2286, _2388);
    float _2400 = fma(_189, _2286, _2368);
    float _2402 = fma(_199, _2290, _2394);
    int _2404 = ~_2392;
    int _2406 = _2404 + 1;
    int _2408 = _2406 + 1;
    float _2410 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2412 = _2410 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2414 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2416 = _2414 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2418 = 1.0 / _2258;
    float _2420 = fma(_205, _2290, _2398);
    float _2422 = fma(_193, _2290, _2400);
    int _2424 = _2408;
    if (!_2396)
    {
        int _2426 = ~_2392;
        int _2428 = _2426 + 1;
        _2424 = _2428;
    }
    int _2430 = _2424;
    float _2432 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2434 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2432;
    bool _2436 = _2390 >= 0.0;
    bool _2438 = isnan(_2390);
    bool _2440 = _2436 || _2438;
    bool _2442 = isnan(0.0);
    bool _2444 = _2440 || _2442;
    float _2446 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2448 = _2446 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2450 = 1.0 / _2412;
    int _2452 = _2444 ? 0 : 1;
    float _2454 = _2434 * _2214;
    bool _2456 = _2390 > 0.0;
    float _2458 = _900 * 2.0;
    float _2460 = _2448 * _2244;
    int _2462 = ~_1972;
    int _2464 = _2462 + _2038;
    int _2466 = _2464 + 1;
    float _2468 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2470 = _2468 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2472 = 1.0 / _2416;
    float _2474 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2476 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2474;
    float _2478 = _2470 * _2270;
    int _2480 = _715 * _2466;
    int _2482 = _2480 + _1258;
    float _2484 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2486 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2484;
    float _2488 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2490 = _2488 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2492 = floor(_2458);
    float _2494 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2496 = _2494 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2498 = _2486 * _2418;
    float _2500 = _2490 * _2450;
    bool _2502 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2504 = isnan(_697);
    bool _2506 = _2502 || _2504;
    bool _2508 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2510 = _2506 || _2508;
    float _2512 = float(_2510);
    float _2514 = fma(_2478, _2266, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _2516 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2518 = isnan(_697);
    bool _2520 = _2516 || _2518;
    bool _2522 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2524 = _2520 || _2522;
    float _2526 = float(_2524);
    float _2528 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2530 = _697 + _2528;
    float _2532 = _2476 * _2472;
    int _2534 = ~_2452;
    int _2536 = _2534 + 1;
    int _2538 = _2536 + 1;
    float _2540 = 1.0 / _2496;
    bool _2542 = !_1260;
    int _2544 = _2542 ? _2482 : (-1);
    float _2546 = -_2512;
    float _2548 = _2546 + 1.0;
    bool _2550 = !_1880;
    int _2552 = _2550 ? 0 : 1;
    float _2554 = in.m_64.w;
    int _2556 = _2538;
    if (!_2456)
    {
        int _2558 = ~_2452;
        int _2560 = _2558 + 1;
        _2556 = _2560;
    }
    int _2562 = _2556;
    float _2564 = -_2526;
    float _2566 = _2564 + 1.0;
    int _2568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2570 = _2568 != 0;
    int _2572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2574 = _2572 != 0;
    int _2576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2578 = _2576 != 0;
    float _2580 = _2526 * _2548;
    bool _2582 = _2492 >= 0.0;
    bool _2584 = isnan(_2492);
    bool _2586 = _2582 || _2584;
    bool _2588 = isnan(0.0);
    bool _2590 = _2586 || _2588;
    float _2592 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2594 = _697 + _2592;
    bool _2596 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2598 = isnan(_697);
    bool _2600 = _2596 || _2598;
    bool _2602 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2604 = _2600 || _2602;
    float _2606 = float(_2604);
    float _2608 = fma(_2498, _2530, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2610 = _1864 >> 31;
    float _2612 = fma(_2454, _2594, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _2614 = _2590 ? 0 : 1;
    float _2616 = _2606 * _2566;
    bool _2618 = _2492 > 0.0;
    float _2620 = -_2606;
    float _2622 = _2620 + 1.0;
    bool _2624 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2626 = isnan(_697);
    bool _2628 = _2624 || _2626;
    bool _2630 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2632 = _2628 || _2630;
    float _2634 = float(_2632);
    float _2636 = fma(_2460, _2164, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _2638 = _2610 & 3;
    float _2640 = fma(_2532, _930, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _2642 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2644 = isnan(_697);
    bool _2646 = _2642 || _2644;
    bool _2648 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2650 = _2646 || _2648;
    float _2652 = float(_2650);
    float _2654 = -_2634;
    float _2656 = _2654 + 1.0;
    int _2658 = _1864 + _2638;
    float _2660 = _2634 * _2622;
    bool _2662 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2664 = isnan(_697);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2670 = _2666 || _2668;
    float _2672 = float(_2670);
    float _2674 = -_2652;
    float _2676 = _2674 + 1.0;
    float _2678 = _2652 * _2656;
    int _2680 = _2658 >> 2;
    float _2682 = _2402 + _2554;
    float _2684 = _2672 * _2676;
    bool _2686 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2688 = isnan(_697);
    bool _2690 = _2686 || _2688;
    bool _2692 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2694 = _2690 || _2692;
    float _2696 = float(_2694);
    float _2698 = -_2672;
    float _2700 = _2698 + 1.0;
    int _2702 = _2680 << 4;
    int _2704 = _2702 + 656;
    float _2706 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2708 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2706;
    bool _2710 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2712 = isnan(_697);
    bool _2714 = _2710 || _2712;
    bool _2716 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2718 = _2714 || _2716;
    float _2720 = float(_2718);
    float _2722 = _2696 * _2700;
    float _2724 = -_2696;
    float _2726 = _2724 + 1.0;
    float _2728 = _2708 * _2540;
    uint _2730 = uint(int(uint(_2704) >> uint(2)));
    uint _2732 = uint(int(uint(int(_2730)) >> uint(2)));
    int _2734 = int(_2730) & 3;
    float _2736 = (*spvDescriptorSet0.vp_c9)._m0[int(_2732)][_2734];
    int _2738 = int(_2730) + 1;
    uint _2740 = uint(int(uint(_2738) >> uint(2)));
    int _2742 = _2738 & 3;
    float _2744 = (*spvDescriptorSet0.vp_c9)._m0[int(_2740)][_2742];
    float _2746 = in.m_62.w;
    float _2748 = _2720 * _2726;
    float _2750 = -_2720;
    float _2752 = _2750 + 1.0;
    float _2754 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2756 = _2682 + _2754;
    float _2758 = in.m_66.w;
    float _2760 = _2612 * _2748;
    float _2762 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2764 = _697 + _2762;
    float _2766 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2768 = _697 + _2766;
    int _2770 = abs(_2012);
    float _2772 = fma(_2752, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2760);
    int _2774 = abs(_2024);
    int _2776 = _2704 + 8;
    uint _2778 = uint(int(uint(_2776) >> uint(2)));
    uint _2780 = uint(int(uint(int(_2778)) >> uint(2)));
    int _2782 = int(_2778) & 3;
    float _2784 = (*spvDescriptorSet0.vp_c9)._m0[int(_2780)][_2782];
    int _2786 = int(_2778) + 1;
    uint _2788 = uint(int(uint(_2786) >> uint(2)));
    int _2790 = _2786 & 3;
    float _2792 = (*spvDescriptorSet0.vp_c9)._m0[int(_2788)][_2790];
    float _2794 = fma(_2728, _2768, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2796 = fma(_2636, _2722, _2772);
    int _2798 = ~_2614;
    int _2800 = _2798 + 1;
    int _2802 = _2800 + 1;
    float _2804 = _882 + _900;
    int _2806 = _2802;
    if (!_2618)
    {
        int _2808 = ~_2614;
        int _2810 = _2808 + 1;
        _2806 = _2810;
    }
    int _2812 = _2806;
    float _2814 = _882 + _878;
    float _2816 = fma(_2500, _2764, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _2818 = !_2570;
    int _2820 = _2818 ? 0 : 1;
    float _2822 = -_2360;
    float _2824 = _2822 + 1.0;
    float _2826 = _2814 + (-1.0);
    float _2828 = float(_2812);
    float _2830 = _2422 + _2746;
    float _2832 = fma(_2640, _2684, _2796);
    float _2834 = _878 + _900;
    int _2836 = abs(_1946);
    float _2838 = _2420 + _2758;
    float _2840 = _878 + (-0.5);
    float _2842 = fma(_2514, _2678, _2832);
    float _2844 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2846 = _2830 + _2844;
    float _2848 = _2756 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2850 = _882 + (-0.5);
    float _2852 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2854 = int(_2852);
    float _2856 = fma(_2846, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2848);
    float _2858 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2860 = _2838 + _2858;
    int _2862 = abs(_2552);
    float _2864 = fma(_2608, _2660, _2842);
    int _2866 = ~_2836;
    int _2868 = _2866 + 1;
    int _2870 = _2868 + 1;
    float _2872 = fma(_2860, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2856);
    float _2874 = fma(_2816, _2616, _2864);
    bool _2876 = !_1726;
    int _2878 = _2876 ? 0 : 1;
    bool _2880 = _1878 != 3;
    float _2882 = fma(_2826, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2884 = ~_2862;
    int _2886 = _2884 + 1;
    int _2888 = _2886 + 1;
    int _2890 = _2870 * as_type<int>(_2744);
    bool _2892 = !_2880;
    int _2894 = _2892 ? 0 : (-1);
    float _2896 = _1876 + (-0.5);
    bool _2898 = _2872 >= 0.0;
    int _2900 = _2888 * as_type<int>(_2736);
    int _2902 = _2900 + _2890;
    float _2904 = _1712 + 0.5;
    int _2906 = abs(_2894);
    float _2908 = fma(_2794, _2580, _2874);
    int _2910 = ~_2770;
    int _2912 = _2910 + 1;
    int _2914 = _2912 + 1;
    float _2916 = float(uint(_2854));
    float _2918 = fma(_2512, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2908);
    int _2920 = ~_2906;
    int _2922 = _2920 + 1;
    int _2924 = _2922 + 1;
    int _2926 = _2914 * as_type<int>(_2784);
    int _2928 = _2926 + _2902;
    int _2930 = ~_2774;
    int _2932 = _2930 + 1;
    int _2934 = _2932 + 1;
    float _2936 = fma(_2904, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2110);
    float _2938 = 1.0 / _2916;
    int _2940 = _2924 * as_type<int>(_2792);
    int _2942 = _2940 + _2928;
    float _2944 = -_2896;
    float _2946 = -_2202;
    float _2948 = fma(_2944, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2946);
    float _2950 = -_2150;
    float _2952 = _2950 + 1.0;
    float _2954 = _2284 + 0.5;
    int _2956 = _2942 * _2934;
    float _2958 = -_2112;
    float _2960 = _2958 + 1.0;
    float _2962 = _1884 + (-0.5);
    float _2964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2966 = _2544 * _2774;
    int _2968 = _2966 + _2956;
    float _2970 = -_2960;
    float _2972 = fma(_2970, _1712, _2936);
    float _2974 = _2960;
    if (_2898)
    {
        _2974 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2976 = _2974;
    float _2978 = fma(_2952, _1876, _2948);
    float _2980 = fma(_2954, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2334);
    float _2982 = float(uint(_2968));
    float _2984 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2986 = as_type<int>(_2938) + (-2);
    int _2988 = as_type<int>(_2938);
    if (_2898)
    {
        float _2990 = _2976 * 5.0;
        _2988 = as_type<int>(_2990);
    }
    int _2992 = _2988;
    float _2994 = -_2962;
    float _2996 = -_2196;
    float _2998 = fma(_2994, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2996);
    float _3000 = _1404 + (-0.5);
    out.m_76.x = _2972;
    out.m_76.y = _2978;
    float _3002 = as_type<float>(_2986) * _2982;
    int _3004 = ~_2854;
    int _3006 = _3004 + 1;
    float _3008 = _2964 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3010 = _1660 + 0.5;
    if (_2898)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9386 = as_type<float>(_2992);
        out.gl_Position.z = _9386;
    }
    int _3012 = abs(_2820);
    float _3014 = trunc(_3002);
    float _3016 = precise::max(_3014, 0.0);
    uint _3018 = uint(_3016);
    float _3020 = fma(_3008, _3010, _2234);
    int _3022 = ~_2106;
    int _3024 = _3022 + _2148;
    int _3026 = _3024 + 1;
    out.m_78.x = _2918;
    float _3028 = _2984 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3030 = abs(_2854);
    int _3032 = _2030 >> 31;
    float _3034 = -_3028;
    float _3036 = -_2242;
    float _3038 = fma(_3034, _3000, _3036);
    float _3040 = _2756 * _2756;
    int _3042 = _1682 >> 31;
    int _3044 = _785 * _3026;
    int _3046 = _3044 + _1562;
    float _3048 = float(uint(_3030));
    if (_2898)
    {
        out.m_55.x = 0.0;
    }
    int _3050 = _3042 & 3;
    float _3052 = fma(_2846, _2846, _3040);
    int _3054 = _3032 & 3;
    float _3056 = 1.0 / _3048;
    int _3058 = _2030 + _3054;
    float _3060 = _539 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _3062 = _1682 + _3050;
    float _3064 = fma(_2860, _2860, _3052);
    float _3066 = -_2356;
    float _3068 = _3066 + 1.0;
    int _3070 = _3006 * int(_3018);
    int _3072 = _3070 + _2968;
    int _3074 = _3058 >> 2;
    float _3076 = -_2354;
    float _3078 = _3076 + 1.0;
    int _3080 = _3062 >> 2;
    float _3082 = -_3068;
    float _3084 = fma(_2284, _3082, _2980);
    int _3086 = _3074 << 4;
    int _3088 = _3086 + 800;
    float _3090 = -_2362;
    float _3092 = _3090 + 1.0;
    float _3094 = float(uint(_3072));
    float _3096 = fma(_1884, _3078, _2998);
    int _3098 = abs(_2968);
    float _3100 = -_3092;
    float _3102 = fma(_1660, _3100, _3020);
    int _3104 = _3080 << 4;
    int _3106 = _3104 + 368;
    float _3108 = as_type<float>(_2986) * _3094;
    int _3110 = as_type<int>(_3056) + (-2);
    float _3112 = -_2238;
    float _3114 = _3112 + 1.0;
    uint _3116 = uint(int(uint(_3088) >> uint(2)));
    uint _3118 = uint(int(uint(int(_3116)) >> uint(2)));
    int _3120 = int(_3116) & 3;
    float _3122 = (*spvDescriptorSet0.vp_c9)._m0[int(_3118)][_3120];
    int _3124 = int(_3116) + 1;
    uint _3126 = uint(int(uint(_3124) >> uint(2)));
    int _3128 = _3124 & 3;
    float _3130 = (*spvDescriptorSet0.vp_c9)._m0[int(_3126)][_3128];
    float _3132 = float(uint(_3098));
    float _3134 = rsqrt(_3064);
    float _3136 = fma(_1404, _3114, _3038);
    float _3138 = _3060 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3140 = as_type<float>(_3110) * _3132;
    int _3142 = ~_3030;
    int _3144 = _3142 + 1;
    uint _3146 = uint(int(uint(_3106) >> uint(2)));
    uint _3148 = uint(int(uint(int(_3146)) >> uint(2)));
    int _3150 = int(_3146) & 3;
    float _3152 = (*spvDescriptorSet0.vp_c9)._m0[int(_3148)][_3150];
    int _3154 = int(_3146) + 1;
    uint _3156 = uint(int(uint(_3154) >> uint(2)));
    int _3158 = _3154 & 3;
    float _3160 = (*spvDescriptorSet0.vp_c9)._m0[int(_3156)][_3158];
    float _3162 = float(_3012);
    float _3164 = trunc(_3140);
    float _3166 = precise::max(_3164, 0.0);
    uint _3168 = uint(_3166);
    out.m_80.x = _3084;
    out.m_80.y = _3096;
    out.m_80.z = _3102;
    out.m_80.w = _3136;
    int _3170 = ~_1908;
    int _3172 = _3170 + _1968;
    int _3174 = _3172 + 1;
    float _3176 = _3162 * _2828;
    int _3178 = abs(_1796);
    int _3180 = _3106 + 8;
    uint _3182 = uint(int(uint(_3180) >> uint(2)));
    uint _3184 = uint(int(uint(int(_3182)) >> uint(2)));
    int _3186 = int(_3182) & 3;
    float _3188 = (*spvDescriptorSet0.vp_c9)._m0[int(_3184)][_3186];
    int _3190 = int(_3182) + 1;
    uint _3192 = uint(int(uint(_3190) >> uint(2)));
    int _3194 = _3190 & 3;
    float _3196 = (*spvDescriptorSet0.vp_c9)._m0[int(_3192)][_3194];
    int _3198 = abs(_2082);
    float _3200 = trunc(_3108);
    float _3202 = precise::max(_3200, 0.0);
    uint _3204 = uint(_3202);
    int _3206 = _735 * _3174;
    int _3208 = _3206 + _1214;
    int _3210 = abs(_2878);
    float _3212 = _3138 * _3134;
    int _3214 = ~_3198;
    int _3216 = _3214 + 1;
    int _3218 = _3216 + 1;
    int _3220 = abs(_1928);
    int _3222 = _3088 + 8;
    uint _3224 = uint(int(uint(_3222) >> uint(2)));
    uint _3226 = uint(int(uint(int(_3224)) >> uint(2)));
    int _3228 = int(_3224) & 3;
    float _3230 = (*spvDescriptorSet0.vp_c9)._m0[int(_3226)][_3228];
    int _3232 = int(_3224) + 1;
    uint _3234 = uint(int(uint(_3232) >> uint(2)));
    int _3236 = _3232 & 3;
    float _3238 = (*spvDescriptorSet0.vp_c9)._m0[int(_3234)][_3236];
    int _3240 = _3144 * int(_3168);
    int _3242 = _3240 + _3098;
    float _3244 = _2756 * _3212;
    int _3246 = ~_2854;
    int _3248 = _3246 + 1;
    float _3250 = _2846 * _3212;
    float _3252 = float(uint(_3242));
    float _3254 = -_3244;
    float _3256 = _2756 + _3254;
    bool _3258 = !_2046;
    int _3260 = _3258 ? 0 : 1;
    float _3262 = -_3250;
    float _3264 = _2846 + _3262;
    int _3266 = int(_3018) + int(_3204);
    float _3268 = as_type<float>(_3110) * _3252;
    int _3270 = ~_3178;
    int _3272 = _3270 + 1;
    int _3274 = _3272 + 1;
    float _3276 = _3256 * _3256;
    bool _3278 = _1724 != 3;
    float _3280 = trunc(_3268);
    float _3282 = precise::max(_3280, 0.0);
    uint _3284 = uint(_3282);
    int _3286 = _3248 * _3266;
    int _3288 = _3286 + _2968;
    bool _3290 = _735 == 0;
    float _3292 = _1088 + (-0.5);
    bool _3294 = !_1466;
    int _3296 = _3294 ? _3046 : (-1);
    float _3298 = _2860 * _3212;
    bool _3300 = !_3290;
    int _3302 = _3300 ? _3208 : (-1);
    float _3304 = fma(_3264, _3264, _3276);
    int _3306 = _3218 * as_type<int>(_3130);
    int _3308 = abs(_3260);
    float _3310 = -_3298;
    float _3312 = _2860 + _3310;
    int _3314 = ~_3308;
    int _3316 = _3314 + 1;
    int _3318 = _3316 + 1;
    int _3320 = ~_3210;
    int _3322 = _3320 + 1;
    int _3324 = _3322 + 1;
    int _3326 = _3274 * as_type<int>(_3160);
    bool _3328 = !_3278;
    int _3330 = _3328 ? 0 : (-1);
    int _3332 = _3318 * as_type<int>(_3122);
    int _3334 = _3332 + _3306;
    bool _3336 = uint(_3288) >= uint(_2854);
    int _3338 = _3324 * as_type<int>(_3152);
    int _3340 = _3338 + _3326;
    int _3342 = ~_3030;
    int _3344 = _3342 + 1;
    int _3346 = int(_3168) + int(_3284);
    bool _3348 = !_3336;
    int _3350 = _3348 ? 0 : (-1);
    int _3352 = abs(_2134);
    int _3354 = _3344 * _3346;
    int _3356 = _3354 + _3098;
    bool _3358 = _2044 != 3;
    int _3360 = ~_3266;
    int _3362 = _3360 + _3350;
    int _3364 = _3362 + 1;
    int _3366 = ~_3352;
    int _3368 = _3366 + 1;
    int _3370 = _3368 + 1;
    int _3372 = abs(_1854);
    bool _3374 = !_3358;
    int _3376 = _3374 ? 0 : (-1);
    int _3378 = _3370 * as_type<int>(_3230);
    int _3380 = _3378 + _3334;
    bool _3382 = uint(_3356) >= uint(_3030);
    int _3384 = _2854 * _3364;
    int _3386 = _3384 + _2968;
    int _3388 = abs(_3330);
    int _3390 = ~_3372;
    int _3392 = _3390 + 1;
    int _3394 = _3392 + 1;
    int _3396 = _2968 ^ _2854;
    int _3398 = abs(_3376);
    int _3400 = _3394 * as_type<int>(_3188);
    int _3402 = _3400 + _3340;
    float _3404 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3406 = !_3382;
    int _3408 = _3406 ? 0 : (-1);
    int _3410 = ~_3388;
    int _3412 = _3410 + 1;
    int _3414 = _3412 + 1;
    uint _3416 = uint(int(uint(_3396) >> uint(31)));
    bool _3418 = _2854 == 0;
    int _3420 = _3414 * as_type<int>(_3196);
    int _3422 = _3420 + _3402;
    int _3424 = ~_3408;
    int _3426 = _3346 + _3424;
    int _3428 = _3426 + 1;
    int _3430 = ~int(_3416);
    int _3432 = _3430 + 1;
    float _3434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3436 = abs(_2034);
    int _3438 = ~_3398;
    int _3440 = _3438 + 1;
    int _3442 = _3440 + 1;
    bool _3444 = !_3418;
    int _3446 = _3444 ? _3386 : (-1);
    int _3448 = _3442 * as_type<int>(_3238);
    int _3450 = _3448 + _3380;
    int _3452 = _3428 ^ _3432;
    int _3454 = ~_3220;
    int _3456 = _3454 + 1;
    int _3458 = _3456 + 1;
    float _3460 = in.m_82.x;
    float _3462 = in.m_82.y;
    float _3464 = in.m_82.z;
    bool _3466 = _2854 == 0;
    int _3468 = ~_3432;
    int _3470 = _3468 + _3452;
    int _3472 = _3470 + 1;
    int _3474 = _3422 * _3458;
    float _3476 = float(_3446);
    float _3478 = _3404 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3480 = ~_3436;
    int _3482 = _3480 + 1;
    int _3484 = _3482 + 1;
    int _3486 = _3302 * _3220;
    int _3488 = _3486 + _3474;
    bool _3490 = !_3466;
    int _3492 = _3490 ? _3472 : (-1);
    float _3494 = fma(_3478, _3476, _2366);
    float _3496 = _1058 + 0.5;
    int _3498 = _3450 * _3484;
    float _3500 = float(_3492);
    float _3502 = _3434 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3504 = fma(_3478, _3496, _3494);
    int _3506 = _3296 * _3436;
    int _3508 = _3506 + _3498;
    float _3510 = -_2314;
    float _3512 = fma(_3502, _3500, _3510);
    float _3514 = -_2824;
    float _3516 = fma(_1058, _3514, _3504);
    float _3518 = -_2358;
    float _3520 = _3518 + 1.0;
    float _3522 = _3176 * (-2.0);
    float _3524 = -_3502;
    float _3526 = fma(_3524, _3292, _3512);
    float _3528 = float(_3488);
    float _3530 = float(_3508);
    float _3532 = fma(_1088, _3520, _3526);
    float _3534 = fma(_3522, _3460, _3460);
    bool _3536 = !_2574;
    int _3538 = _3536 ? 0 : 1;
    out.m_84.x = _3528;
    float _3540 = fma(_2882, _3522, _2882);
    bool _3542 = !_2578;
    int _3544 = _3542 ? 0 : 1;
    out.m_84.w = _3530;
    int _3546 = abs(_3538);
    out.m_86.x = _3516;
    out.m_86.y = _3532;
    float _3548 = _3464;
    if (_2898)
    {
        return out;
    }
    float _3550 = -_3244;
    float _3552 = _2682 + _3550;
    float _3554 = float(_2430);
    float _3556 = -_3250;
    float _3558 = _2830 + _3556;
    float _3560 = float(_3546);
    float _3562 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3564 = _3552 + _3562;
    float _3566 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3568 = _3558 + _3566;
    float _3570 = _2804 + (-1.0);
    float _3572 = _3564 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3574 = -_3298;
    float _3576 = _2838 + _3574;
    float _3578 = _3560 * _3554;
    int _3580 = abs(_3544);
    float _3582 = fma(_3568, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3572);
    float _3584 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3586 = _3576 + _3584;
    float _3588 = float(_2562);
    float _3590 = fma(_3570, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3592 = float(_3580);
    float _3594 = fma(_3586, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3582);
    float _3596 = _3578 * (-2.0);
    float _3598 = fma(_3312, _3312, _3304);
    float _3600 = _3592 * _3588;
    float _3602 = fma(_3596, _3462, _3462);
    bool _3604 = _3594 >= 0.0;
    float _3606 = fma(_3590, _3596, _3590);
    float _3608 = _900 + (-0.5);
    float _3610 = fma(_2850, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3602);
    float _3612 = _3600 * (-2.0);
    float _3614 = _2834 + (-1.0);
    float _3616 = fma(_2840, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3534);
    float _3618 = fma(_3606, _2372, _3610);
    float _3620 = fma(_3612, _3464, _3464);
    float _3622 = fma(_3614, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3624 = sqrt(_3598);
    float _3626 = _3618 * 0.15915493667125701904296875;
    float _3628 = fma(_3608, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3620);
    if (_3604)
    {
        _3548 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3630 = _3548;
    float _3632 = fma(_3540, _2372, _3616);
    float _3634 = fma(_3622, _3612, _3622);
    int _3636 = as_type<int>(_3630);
    if (_3604)
    {
        out.m_55.x = 0.0;
    }
    float _3638 = _3626 * 6.283185482025146484375;
    float _3640 = sin(_3638);
    if (_3604)
    {
        float _3642 = _3630 * 5.0;
        _3636 = as_type<int>(_3642);
    }
    int _3644 = _3636;
    float _3646 = _3632 * 0.15915493667125701904296875;
    float _3648 = fma(_3634, _2372, _3628);
    if (_3604)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10310 = as_type<float>(_3644);
        out.gl_Position.z = _10310;
    }
    float _3650 = _3626 * 6.283185482025146484375;
    float _3652 = cos(_3650);
    float _3654 = _3646 * 6.283185482025146484375;
    float _3656 = sin(_3654);
    float _3658 = _3646 * 6.283185482025146484375;
    float _3660 = cos(_3658);
    float _3662 = _3648 * 0.15915493667125701904296875;
    if (_3604)
    {
        return out;
    }
    float _3664 = _3662 * 6.283185482025146484375;
    float _3666 = cos(_3664);
    float _3668 = _3134 * _3624;
    float _3670 = _537 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3672 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _223);
    float _3674 = _3660 * _3652;
    float _3676 = _3060 * _3668;
    float _3678 = _3668 * _3670;
    float _3680 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _219);
    float _3682 = _3662 * 6.283185482025146484375;
    float _3684 = sin(_3682);
    float _3686 = _3660 * _3640;
    float _3688 = _3672 * _3678;
    float _3690 = _3656 * _3640;
    float _3692 = _3656 * _3652;
    float _3694 = _3680 * _3676;
    float _3696 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3698 = _3660 * _3666;
    float _3700 = _3652 * _3666;
    float _3702 = _3656 * _3666;
    float _3704 = _3640 * _3666;
    float _3706 = _3698 * _3688;
    float _3708 = _3668 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3710 = _3708 * 0.5;
    float _3712 = fma(_3684, _3674, _3690);
    float _3714 = -_3692;
    float _3716 = fma(_3684, _3686, _3714);
    float _3718 = -_3688;
    float _3720 = _3684 * _3718;
    float _3722 = -_3686;
    float _3724 = fma(_3684, _3692, _3722);
    float _3726 = fma(_3712, _3694, _3706);
    float _3728 = _3702 * _3688;
    float _3730 = fma(_3700, _3694, _3720);
    float _3732 = fma(_3684, _3690, _3674);
    float _3734 = fma(_3716, _3710, _3726);
    float _3736 = fma(_3724, _3694, _3728);
    float _3738 = fma(_3704, _3710, _3730);
    float _3740 = _3734 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3742 = _3734 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3744 = fma(_3732, _3710, _3736);
    float _3746 = _3734 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3748 = fma(_3738, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3740);
    float _3750 = fma(_3738, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3742);
    float _3752 = _3712 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3754 = _3712 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3756 = fma(_3744, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3748);
    float _3758 = fma(_3744, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3750);
    float _3760 = fma(_3738, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3746);
    float _3762 = fma(_3700, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3754);
    float _3764 = _3756 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3766 = _3758 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3768 = fma(_3744, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3760);
    float _3770 = fma(_3696, _3696, 1.0);
    float _3772 = _2830 + _3764;
    float _3774 = _2838 + _3766;
    float _3776 = _3712 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3778 = fma(_3700, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3752);
    float _3780 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3782 = _3772 + _3780;
    float _3784 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3786 = _3774 + _3784;
    float _3788 = fma(_3700, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3776);
    float _3790 = _3698 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3792 = _3782 * _3782;
    float _3794 = _3786 * _3786;
    float _3796 = _3698 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3798 = _3698 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3800 = _3768 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3802 = _3792 + _3794;
    float _3804 = -_3684;
    float _3806 = fma(_3804, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3790);
    float _3808 = -_3684;
    float _3810 = fma(_3808, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3796);
    float _3812 = -_3684;
    float _3814 = fma(_3812, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3798);
    float _3816 = sqrt(_3802);
    float _3818 = _3716 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3820 = _3716 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3822 = _3716 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3824 = _2682 + _3800;
    float _3826 = fma(_3704, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3818);
    float _3828 = fma(_3704, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3820);
    float _3830 = fma(_3704, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3822);
    float _3832 = rsqrt(_3770);
    bool _3834 = _3816 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3836 = _3704;
    float _3838 = _3790;
    float _3840 = _3820;
    float _3842 = _3770;
    float _3844 = _3818;
    if (!_3834)
    {
        _3836 = _3794;
    }
    float _3846 = _3836;
    float _3848 = _3846;
    if (!_3834)
    {
        _3838 = _3792;
    }
    float _3850 = _3838;
    float _3852 = _3850;
    if (!_3834)
    {
        _3840 = _3772;
    }
    float _3854 = _3840;
    float _3856 = _3854;
    if (!_3834)
    {
        _3842 = _3774;
    }
    float _3858 = _3842;
    float _3860 = _3858;
    if (!_3834)
    {
        _3844 = _3824;
    }
    float _3862 = _3844;
    bool _3864 = !_3834;
    float _3866 = _3862;
    if (!_3864)
    {
        float _3868 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3870 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3872 = _3816 + _3870;
        float _3874 = rsqrt(_3802);
        float _3876 = _3872 * _3868;
        float _3878 = _3824 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3880 = _3876 * 0.15915493667125701904296875;
        float _3882 = _3880 * 6.283185482025146484375;
        float _3884 = sin(_3882);
        float _3886 = _3880 * 6.283185482025146484375;
        float _3888 = cos(_3886);
        float _3890 = fma(_3884, _3878, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3892 = _3874 * _3890;
        float _3894 = _3888 + (-1.0);
        float _3896 = fma(_3782, _3892, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3898 = fma(_3786, _3892, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3900 = _3894 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3902 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3904 = _3896 + _3902;
        float _3906 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3908 = _3898 + _3906;
        float _3910 = fma(_3824, _3888, _3900);
        float _3912 = _3904 * _3904;
        float _3914 = _3908 * _3908;
        _3866 = _3910;
        _3852 = _3912;
        _3848 = _3914;
        _3856 = _3896;
        _3860 = _3898;
    }
    float _3916 = _3866;
    float _3918 = _3852;
    float _3920 = _3848;
    float _3922 = _3856;
    float _3924 = _3860;
    float _3926 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3928 = _3916 + _3926;
    float _3930 = fma(_3702, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3806);
    float _3932 = fma(_3702, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3810);
    float _3934 = fma(_3702, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3814);
    float _3936 = fma(_3928, _3928, _3918);
    float _3938 = fma(_3732, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3828);
    float _3940 = fma(_3732, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3826);
    float _3942 = fma(_3732, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3830);
    float _3944 = _3936 + _3920;
    float _3946 = fma(_3724, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3788);
    float _3948 = _3696 * _3832;
    float _3950 = fma(_3724, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3778);
    float _3952 = _219 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3954 = _3696 * _3930;
    float _3956 = _3696 * _3932;
    float _3958 = fma(_3724, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3762);
    float _3960 = _3696 * _3934;
    float _3962 = -_3940;
    float _3964 = _3948 * _3962;
    float _3966 = -_3938;
    float _3968 = _3948 * _3966;
    float _3970 = -_3942;
    float _3972 = _3948 * _3970;
    float _3974 = sqrt(_3944);
    float _3976 = fma(_3952, _3946, _3954);
    float _3978 = fma(_3952, _3950, _3956);
    float _3980 = fma(_3952, _3958, _3960);
    float _3982 = fma(_3832, _3930, _3964);
    float _3984 = fma(_3832, _3932, _3968);
    float _3986 = fma(_3832, _3934, _3972);
    float _3988 = _3940 + _3976;
    float _3990 = _3938 + _3978;
    float _3992 = _3942 + _3980;
    out.m_88.x = _3946;
    out.m_88.y = _3950;
    out.m_88.z = _3958;
    out.m_90.x = _3982;
    out.m_90.y = _3984;
    out.m_90.z = _3986;
    bool _3994 = _3974 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3996 = isnan(_3974);
    bool _3998 = _3994 || _3996;
    bool _4000 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4002 = _3998 || _4000;
    out.m_92.x = _3988;
    out.m_92.y = _3990;
    out.m_92.z = _3992;
    float _4004 = _3978;
    float _4006 = _3958;
    if (!_4002)
    {
        _4004 = 1.0;
    }
    float _4008 = _4004;
    bool _4010 = !_4002;
    float _4012 = _4008;
    if (!_4010)
    {
        bool _4014 = _3974 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4016 = isnan(_3974);
        bool _4018 = _4014 || _4016;
        bool _4020 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4022 = _4018 || _4020;
        if (!_4022)
        {
            float _4024 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4026 = _3974 + _4024;
            float _4028 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4030 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4028;
            float _4032 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4034 = _4032 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4036 = 1.0 / _4030;
            float _4038 = _4026 * _4036;
            float _4040 = fma(_4038, _4034, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4012 = _4040;
            _4042 = true;
        }
        else
        {
            bool _4044 = _3974 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4046 = isnan(_3974);
            bool _4048 = _4044 || _4046;
            bool _4050 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4052 = _4048 || _4050;
            if (!_4052)
            {
                float _4054 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4056 = _3974 + _4054;
                float _4058 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4060 = _4058 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4062 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4064 = _4062 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4066 = 1.0 / _4060;
                float _4068 = _4056 * _4066;
                float _4070 = fma(_4068, _4064, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4012 = _4070;
                _4042 = true;
            }
            else
            {
                _4012 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4042 = false;
    float _4072 = _4012;
    float _4074 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4076 = _3916 + _4074;
    float _4078 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4080 = _3922 + _4078;
    float _4082 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4084 = _3924 + _4082;
    float _4086 = fma(_4076, _4072, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4088 = fma(_4080, _4072, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4090 = -_2682;
    float _4092 = _4090 + _4086;
    float _4094 = fma(_4084, _4072, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4096 = -_2830;
    float _4098 = _4096 + _4088;
    float _4100 = _4092 * _4092;
    float _4102 = -_2838;
    float _4104 = _4102 + _4094;
    float _4106 = fma(_4098, _4098, _4100);
    float _4108 = fma(_4104, _4104, _4106);
    float _4110 = sqrt(_4108);
    bool _4112 = _4110 > 0.0;
    float _4114 = _4110;
    float _4116 = _4076;
    float _4118 = _4084;
    float _4120 = _4092;
    float _4122 = _4094;
    if (!_4112)
    {
        _4114 = _4088;
    }
    float _4124 = _4114;
    float _4126 = _4124;
    if (!_4112)
    {
        _4116 = _4086;
    }
    float _4128 = _4116;
    float _4130 = _4128;
    float _4132 = _4128;
    if (!_4112)
    {
        _4118 = _4094;
    }
    float _4134 = _4118;
    bool _4136 = !_4112;
    float _4138 = _4134;
    if (!_4136)
    {
        float _4140 = _239 * _239;
        float _4142 = fma(_235, _235, _4140);
        float _4144 = fma(_241, _241, _4142);
        float _4146 = rsqrt(_4108);
        float _4148 = sqrt(_4144);
        float _4150 = _4098 * _4146;
        float _4152 = _4092 * _4146;
        float _4154 = _4104 * _4146;
        bool _4156 = _4148 > 0.0;
        float _4158 = _4146;
        float _4160 = _4148;
        _4006 = _4152;
        if (!_4156)
        {
            _4158 = _4088;
        }
        float _4162 = _4158;
        _4126 = _4162;
        if (!_4156)
        {
            _4130 = _4086;
        }
        float _4164 = _4130;
        _4132 = _4164;
        if (!_4156)
        {
            _4160 = _4094;
        }
        float _4166 = _4160;
        bool _4168 = !_4156;
        _4138 = _4166;
        if (!_4168)
        {
            float _4170 = rsqrt(_4144);
            float _4172 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4174 = _239 * _4170;
            float _4176 = _235 * _4170;
            float _4178 = _241 * _4170;
            float _4180 = _4152 * _4174;
            float _4182 = fma(_4150, _4176, _4180);
            float _4184 = _4172 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4186 = fma(_4154, _4178, _4182);
            float _4188 = _4186 * _4184;
            float _4190 = fma(_235, _4188, _4088);
            float _4192 = fma(_239, _4188, _4086);
            float _4194 = fma(_241, _4188, _4094);
            _4132 = _4192;
            _4126 = _4190;
            _4138 = _4194;
            _4120 = _4188;
        }
    }
    float _4196 = _4132;
    float _4198 = _4126;
    float _4200 = _4138;
    float _4202 = _4120;
    float _4204 = _4006;
    float _4206 = -_3244;
    float _4208 = _4206 + _4196;
    float _4210 = -_3250;
    float _4212 = _4210 + _4198;
    float _4214 = -_3298;
    float _4216 = _4214 + _4200;
    float _4218 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4220 = _4208 + _4218;
    float _4222 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4224 = _4212 + _4222;
    float _4226 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4228 = _4216 + _4226;
    float _4230 = _4220 * _4220;
    float _4232 = fma(_3558, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4234 = fma(_4224, _4224, _4230);
    float _4236 = floor(_4232);
    float _4238 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4240 = fma(_4228, _4228, _4234);
    float _4242 = rsqrt(_4240);
    float _4244 = sqrt(_4240);
    float _4246 = _4242 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4248 = _4224 * _4246;
    float _4250 = _4228 * _4246;
    float _4252 = _4248 * _4248;
    float _4254 = _4250 * _4250;
    float _4256 = _4252 + _4254;
    float _4258 = sqrt(_4256);
    bool _4260 = _4258 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4262 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4264 = _4258 + _4262;
    float _4266 = _4228;
    float _4268 = _4256;
    float _4270 = _4264;
    float _4272 = _4220;
    float _4274 = _4204;
    if (_4260)
    {
        float _4276 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4266 = _4276;
    }
    float _4278 = _4266;
    if (_4260)
    {
        float _4280 = rsqrt(_4256);
        _4268 = _4280;
    }
    float _4282 = _4268;
    float _4284 = _4282;
    if (_4260)
    {
        float _4286 = _4264 * _4278;
        _4270 = _4286;
    }
    float _4288 = _4270;
    if (_4260)
    {
        float _4290 = _4288 * 0.15915493667125701904296875;
        _4122 = _4290;
    }
    float _4292 = _4122;
    float _4294 = _4278;
    float _4296 = _4292;
    if (_4260)
    {
        float _4298 = _4292 * 6.283185482025146484375;
        float _4300 = sin(_4298);
        _4294 = _4300;
    }
    float _4302 = _4294;
    float _4304 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4306 = precise::max(0.0, _4304);
    float _4308 = _4202;
    float _4310 = _4306;
    if (_4260)
    {
        float _4312 = _4292 * 6.283185482025146484375;
        float _4314 = cos(_4312);
        _4308 = _4314;
    }
    float _4316 = _4308;
    float _4318 = -_4246;
    float _4320 = -_4306;
    float _4322 = fma(_4220, _4318, _4320);
    if (!_4260)
    {
        _4272 = _4248;
    }
    float _4324 = _4272;
    float _4326 = _4324;
    if (_4260)
    {
        float _4328 = _4322 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4310 = _4328;
    }
    float _4330 = _4310;
    float _4332 = _4302;
    float _4334 = _4330;
    if (_4260)
    {
        float _4336 = fma(_4302, _4330, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4332 = _4336;
    }
    float _4338 = _4332;
    float _4340 = _4338;
    float _4342 = _4316;
    if (_4260)
    {
        float _4344 = _4316 + (-1.0);
        _4334 = _4344;
    }
    float _4346 = _4334;
    float _4348 = _4346;
    if (_4260)
    {
        float _4350 = _4282 * _4338;
        _4274 = _4350;
    }
    float _4352 = _4274;
    if (!_4260)
    {
        _4340 = _4322;
    }
    float _4354 = _4340;
    float _4356 = _4354;
    if (_4260)
    {
        float _4358 = _4346 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4296 = _4358;
    }
    float _4360 = _4296;
    if (_4260)
    {
        float _4362 = _4248 * _4352;
        _4326 = _4362;
    }
    float _4364 = _4326;
    if (!_4260)
    {
        _4348 = _4250;
    }
    float _4366 = _4348;
    float _4368 = _4366;
    if (_4260)
    {
        float _4370 = _4250 * _4352;
        _4368 = _4370;
    }
    float _4372 = _4368;
    if (!_4260)
    {
        _4284 = _4252;
    }
    float _4374 = _4284;
    float _4376 = _4374;
    if (_4260)
    {
        float _4378 = fma(_4322, _4316, _4360);
        _4356 = _4378;
    }
    float _4380 = _4356;
    if (_4260)
    {
        float _4382 = _4364 * _4364;
        _4376 = _4382;
    }
    float _4384 = _4376;
    if (!_4260)
    {
        _4342 = _4254;
    }
    float _4386 = _4342;
    float _4388 = _4386;
    if (_4260)
    {
        float _4390 = _4372 * _4372;
        _4388 = _4390;
    }
    float _4392 = _4388;
    float _4394 = fma(_4380, _4380, _4384);
    float _4396 = _4208 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4398 = _4208 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4400 = _4394 + _4392;
    float _4402 = _4208 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4404 = fma(_3576, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4406 = fma(_4212, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4396);
    float _4408 = fma(_4212, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4398);
    float _4410 = fma(_4212, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4402);
    float _4412 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4414 = fma(_4244, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4412);
    float _4416 = precise::clamp(_4414, 0.0, 1.0);
    float _4418 = rsqrt(_4400);
    float _4420 = fma(_4216, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4406);
    float _4422 = fma(_4216, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4410);
    float _4424 = -_4416;
    float _4426 = _4424 + 1.0;
    float _4428 = _4208 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4430 = _4420 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4432 = _4422 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4434 = fma(_4216, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4408);
    float _4436 = fma(_4212, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4428);
    float _4438 = abs(_4426);
    float _4440 = log2(_4438);
    float _4442 = _4430 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4444 = _4434 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4446 = fma(_4216, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4436);
    float _4448 = fma(_4432, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4442);
    float _4450 = _4444 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4452 = _4418 * _4364;
    float _4454 = _4418 * _4380;
    float _4456 = _4418 * _4372;
    float _4458 = -_4450;
    float _4460 = fma(_4458, _4238, 1.0);
    float _4462 = _4452 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4464 = _4446 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4466 = fma(_4444, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4448);
    float _4468 = -_4236;
    float _4470 = _4232 + _4468;
    float _4472 = -_4462;
    float _4474 = fma(_4454, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4472);
    float _4476 = _4440 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4478 = fma(_4464, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4466);
    float _4480 = log2(_4460);
    float _4482 = -_4456;
    float _4484 = fma(_4482, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4474);
    float _4486 = _4430 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4488 = _4430 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4490 = fma(_4484, -0.5, 0.5);
    float _4492 = fma(_4484, 0.5, 0.5);
    float _4494 = fma(_4432, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4486);
    float _4496 = exp2(_4476);
    float _4498 = fma(_4432, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4488);
    float _4500 = _4454 + 1.0;
    float _4502 = fma(_4444, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4494);
    float _4504 = fma(_4492, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4506 = fma(_4444, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4498);
    float _4508 = 1.0 / _4478;
    float _4510 = fma(_4492, _4504, -0.212114393711090087890625);
    float _4512 = _4480 * 0.693147182464599609375;
    float _4514 = fma(_4492, _4510, 1.570728778839111328125);
    float _4516 = _4512 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4518 = sqrt(_4490);
    float _4520 = -_4454;
    float _4522 = fma(_4496, _4500, _4520);
    float _4524 = fma(_4464, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4502);
    float _4526 = fma(_4464, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4506);
    float _4528 = fma(_4522, 0.5, 0.5);
    float _4530 = floor(_4404);
    float _4532 = _4524 * _4508;
    float _4534 = _4526 * _4508;
    float _4536 = fma(_4532, 0.5, 0.5);
    float _4538 = fma(_4534, -0.5, 0.5);
    float _4540 = _4518 * 0.636619746685028076171875;
    float _4542 = -_4514;
    float _4544 = fma(_4540, _4542, 1.0);
    float _4546 = -_4530;
    float _4548 = _4404 + _4546;
    float2 _11820 = float2(_4470, _4548);
    float _4550 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11820, float2(0.0), isnan(_11820)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11820, float2(0.0), isnan(_11820)), level(0.0)).x;
    float3 _11831 = float3(_4536, _4538, _4516);
    float _4552 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11831, float3(0.0), isnan(_11831)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11831, float3(0.0), isnan(_11831)), level(0.0)).x;
    float3 _11842 = float3(_4536, _4538, _4516);
    float4 _4555 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11842, float3(0.0), isnan(_11842)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11842, float3(0.0), isnan(_11842)), level(0.0)).xyzw;
    float _4557 = _4555.x;
    float _4559 = _4555.y;
    float _4561 = _4555.z;
    float _4563 = _4555.w;
    float2 _11858 = float2(_4544, _4528);
    float3 _4567 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11858, float2(0.0), isnan(_11858)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11858, float2(0.0), isnan(_11858)), level(0.0)).xyz;
    float _4569 = _4567.x;
    float _4571 = _4567.y;
    float _4573 = _4567.z;
    float _4575 = _3552 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4577 = _3552 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4579 = _4430 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4581 = fma(_3558, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4575);
    float _4583 = fma(_3558, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4577);
    float _4585 = fma(_4432, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4579);
    float _4587 = fma(_3576, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4581);
    float _4589 = fma(_3576, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4583);
    float _4591 = _4587 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4593 = _4589 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4595 = in.m_94.x;
    float _4597 = 1.0 / _4591;
    float _4599 = _4593 + _4591;
    float _4601 = fma(_4444, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4585);
    float _4603 = _4524 + _4478;
    float _4605 = _4603 * 0.5;
    float _4607 = _4599 * _4597;
    float _4609 = _4607 * 0.5;
    float _4611 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4613 = fma(_4609, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4611);
    float _4615 = 1.0 / _4613;
    float _4617 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4619 = _4615 * _4617;
    float _4621 = abs(_4619);
    float _4623 = log2(_4621);
    bool _4625 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4627 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4629 = _4625 || _4627;
    bool _4631 = isnan(0.5);
    bool _4633 = _4629 || _4631;
    bool _4635 = _4619 <= 8000.0;
    bool _4637 = isnan(_4619);
    bool _4639 = _4635 || _4637;
    bool _4641 = isnan(8000.0);
    bool _4643 = _4639 || _4641;
    float _4645 = float(_4643);
    float _4647 = _4623 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4649 = exp2(_4647);
    float _4651 = fma(_4649, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4653 = precise::clamp(_4651, 0.0, 1.0);
    float _4655 = fma(_4464, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4601);
    float _4657 = fma(_4653, -2.0, 3.0);
    float _4659 = _4653 * _4653;
    float _4661 = _4440 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4663 = _4655 + _4478;
    float _4665 = _4659 * _4657;
    float _4667 = exp2(_4661);
    float _4669 = _4663 * 0.5;
    float _4671 = -_4665;
    float _4673 = _4671 + 1.0;
    float _4675 = fma(_4673, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4665);
    float _4677 = _4645 * _4675;
    float _4679 = _4478 * 0.5;
    float _4681 = _4645;
    float _4683 = _4478;
    float _4685 = _4655;
    float _4687 = _4526;
    float _4689 = _4524;
    if (_4633)
    {
        _4681 = 1.0;
    }
    float _4691 = _4681;
    float _4693 = fma(_4526, -0.5, _4679);
    float _4695 = _4691;
    float _4697 = _4559;
    if (!_4633)
    {
        float _4699 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4701 = _4699 * 0.15915493667125701904296875;
        float _4703 = _4701 * 6.283185482025146484375;
        float _4705 = cos(_4703);
        float _4707 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4709 = _4707 * 0.15915493667125701904296875;
        float _4711 = _4701 * 6.283185482025146484375;
        float _4713 = sin(_4711);
        float _4715 = 1.0 / _4705;
        float _4717 = _4709 * 6.283185482025146484375;
        float _4719 = cos(_4717);
        float _4721 = _4713 * _4715;
        float _4723 = _4709 * 6.283185482025146484375;
        float _4725 = sin(_4723);
        float _4727 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4729 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4727;
        float _4731 = _4719 * _4721;
        float _4733 = 1.0 / _4729;
        float _4735 = 1.0 / _4731;
        float _4737 = _4725 * _4735;
        float _4739 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4741 = fma(_4619, _4737, _4739);
        float _4743 = _4741 * _4733;
        float _4745 = precise::clamp(_4743, 0.0, 1.0);
        _4695 = _4745;
    }
    float _4747 = _4695;
    float _4749 = _4677 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4751 = -_4667;
    float _4753 = _4751 + 1.0;
    float _4755 = -_4550;
    float _4757 = _4755 + 1.0;
    out.m_96.x = _4605;
    out.m_96.y = _4693;
    out.m_96.z = _4669;
    out.m_96.w = _4478;
    float _4759 = _4753 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4761 = _4757 * _4749;
    float _4763 = precise::clamp(_4761, 0.0, 1.0);
    bool _4765 = _4244 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4767 = isnan(_4244);
    bool _4769 = _4765 || _4767;
    bool _4771 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4773 = _4769 || _4771;
    float _4775 = _4759 * _4552;
    float _4777 = -_4763;
    float _4779 = fma(_4777, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4781 = -_4759;
    float _4783 = _4781 + 1.0;
    out.gl_Position.x = _4524;
    out.gl_Position.y = _4526;
    out.gl_Position.z = _4655;
    out.gl_Position.w = _4478;
    float _4785 = _4563 * _4775;
    float _4787 = _4779 * _4595;
    float _4789 = _4573 * _4775;
    float _4791 = fma(_4569, _4785, _4557);
    float _4793 = fma(_4571, _4785, _4559);
    float _4795 = _4787 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4797 = _4563 * _4783;
    float _4799 = fma(_4563, _4789, _4561);
    float _4801 = _4747 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4803 = _4775;
    if (!_4773)
    {
        _4697 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4805 = _4697;
    out.m_98.x = _4795;
    float _4807 = _4805;
    float _4809 = _4805;
    if (!_4773)
    {
        _4803 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4811 = _4803;
    float _4813 = _4811;
    float _4815 = _4811;
    if (!_4773)
    {
        _4683 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4817 = _4683;
    out.m_100.x = _4791;
    out.m_100.y = _4793;
    out.m_100.z = _4799;
    out.m_100.w = _4797;
    float _4819 = _4817;
    float _4821 = _4817;
    if (!_4773)
    {
        _4685 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4823 = _4685;
    float _4825 = _4823;
    float _4827 = _4823;
    if (!_4773)
    {
        _4687 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4829 = _4687;
    float _4831 = _4829;
    float _4833 = _4829;
    if (!_4773)
    {
        _4689 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4835 = _4689;
    bool _4837 = !_4773;
    float _4839 = _4835;
    float _4841 = _4835;
    if (!_4837)
    {
        bool _4843 = _4244 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4845 = isnan(_4244);
        bool _4847 = _4843 || _4845;
        bool _4849 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4851 = _4847 || _4849;
        if (!_4851)
        {
            float _4853 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4855 = _4244 + _4853;
            float _4857 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4859 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4857;
            float _4861 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4863 = _4861 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4865 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4867 = _4865 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4869 = 1.0 / _4859;
            float _4871 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4873 = _4871 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4875 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4877 = _4875 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4879 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4881 = _4879 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4883 = _4855 * _4869;
            float _4885 = precise::clamp(_4883, 0.0, 1.0);
            float _4887 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4889 = _4887 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4891 = fma(_4885, _4863, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4893 = fma(_4885, _4867, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4895 = fma(_4885, _4889, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4897 = fma(_4885, _4873, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4899 = fma(_4885, _4877, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4901 = fma(_4885, _4881, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4833 = _4891;
            _4815 = _4899;
            _4827 = _4893;
            _4809 = _4897;
            _4841 = _4895;
            _4821 = _4901;
            _4903 = true;
        }
        else
        {
            bool _4905 = _4244 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4907 = isnan(_4244);
            bool _4909 = _4905 || _4907;
            bool _4911 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4913 = _4909 || _4911;
            if (!_4913)
            {
                _4807 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4915 = _4807;
            _4809 = _4915;
            if (!_4913)
            {
                _4813 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4917 = _4813;
            _4815 = _4917;
            if (!_4913)
            {
                _4819 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4919 = _4819;
            _4821 = _4919;
            if (!_4913)
            {
                _4825 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4921 = _4825;
            _4827 = _4921;
            if (!_4913)
            {
                _4831 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4923 = _4831;
            _4833 = _4923;
            if (!_4913)
            {
                _4839 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4925 = _4839;
            bool _4927 = !_4913;
            _4841 = _4925;
            if (!_4927)
            {
                bool _4929 = _4244 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4931 = isnan(_4244);
                bool _4933 = _4929 || _4931;
                bool _4935 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4937 = _4933 || _4935;
                if (!_4937)
                {
                    float _4939 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4941 = _4244 + _4939;
                    float _4943 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4945 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4943;
                    float _4947 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4949 = _4947 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4951 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4953 = _4951 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4955 = 1.0 / _4945;
                    float _4957 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4959 = _4957 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4961 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4963 = _4961 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4965 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4967 = _4965 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4969 = _4941 * _4955;
                    float _4971 = precise::clamp(_4969, 0.0, 1.0);
                    float _4973 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4975 = _4973 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4977 = fma(_4971, _4949, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4979 = fma(_4971, _4953, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4981 = fma(_4971, _4975, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4983 = fma(_4971, _4959, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4985 = fma(_4971, _4963, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4987 = fma(_4971, _4967, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4833 = _4977;
                    _4815 = _4985;
                    _4827 = _4979;
                    _4809 = _4983;
                    _4841 = _4981;
                    _4821 = _4987;
                    _4903 = true;
                }
                else
                {
                    _4833 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4815 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4827 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4809 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4841 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4821 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4903 = false;
    float _4989 = _4833;
    float _4991 = _4815;
    float _4993 = _4827;
    float _4995 = _4809;
    float _4997 = _4841;
    float _4999 = _4821;
    float _5001 = fma(_3990, -0.5, 0.5);
    float _5003 = precise::clamp(_5001, 0.0, 1.0);
    float _5005 = -_4989;
    float _5007 = _4991 + _5005;
    float _5009 = _4801 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5011 = -_4993;
    float _5013 = _4995 + _5011;
    float _5015 = fma(_5003, _5007, _4989);
    out.m_102.x = 0.0;
    float _5017 = -_4997;
    float _5019 = _4999 + _5017;
    float _5021 = fma(_5003, _5013, _4993);
    float _5023 = _5015 * 0.586610972881317138671875;
    out.m_55.x = _5009;
    bool _5025 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5027 = fma(_5003, _5019, _4997);
    float _5029 = fma(_5021, 0.298911988735198974609375, _5023);
    bool _5031 = _4747 > 0.0;
    bool _5033 = isnan(_4747);
    bool _5035 = _5031 || _5033;
    bool _5037 = isnan(0.0);
    bool _5039 = _5035 || _5037;
    float _5041 = fma(_5027, 0.114477999508380889892578125, _5029);
    float _5043 = -_5041;
    float _5045 = _5021 + _5043;
    float _5047 = -_5041;
    float _5049 = _5015 + _5047;
    float _5051 = -_5041;
    float _5053 = _5027 + _5051;
    float _5055 = fma(_5045, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5041);
    float _5057 = fma(_5049, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5041);
    float _5059 = fma(_5053, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5041);
    bool _5061 = !_5025;
    if (!_5061)
    {
        float _5063 = -_4208;
        float _5065 = _5063 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5067 = -_4212;
        float _5069 = _5067 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5071 = -_4216;
        float _5073 = _5071 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5075 = _5065 * _5065;
        float _5077 = fma(_5069, _5069, _5075);
        float _5079 = fma(_5073, _5073, _5077);
        float _5081 = sqrt(_5079);
        float _5083 = rsqrt(_5079);
        float _5085 = -_5081;
        float _5087 = _5085 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5089 = _5087 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5091 = precise::clamp(_5089, 0.0, 1.0);
        float _5093 = _5069 * _5083;
        float _5095 = _5065 * _5083;
        float _5097 = abs(_5091);
        float _5099 = log2(_5097);
        float _5101 = _5073 * _5083;
        float _5103 = _5093 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5105 = _3990 * _5095;
        float _5107 = -_5095;
        float _5109 = -_5103;
        float _5111 = fma(_5107, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5109);
        float _5113 = fma(_3988, _5093, _5105);
        float _5115 = -_5101;
        float _5117 = fma(_5115, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5111);
        float _5119 = fma(_3992, _5101, _5113);
        float _5121 = precise::clamp(_5119, 0.0, 1.0);
        float _5123 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5125 = _5117 + _5123;
        float _5127 = _5099 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5129 = _5125 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5131 = precise::clamp(_5129, 0.0, 1.0);
        float _5133 = exp2(_5127);
        float _5135 = _5133 * _5131;
        float _5137 = _5121 * _5135;
        float _5139 = _5137 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5141 = _5137 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5143 = _5137 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_102.x = _5139;
        out.m_102.y = _5141;
        out.m_102.z = _5143;
    }
    out.m_104.x = _5055;
    out.m_104.y = _5057;
    out.m_104.z = _5059;
    if (_5039)
    {
        return out;
    }
    out.m_55.x = 0.0;
    float _5145 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5145;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4903 = false;
    bool _4042 = false;
    bool _561 = false;
    bool _455 = false;
    bool _263 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_48.w;
    float _120 = in.m_50.w;
    float _122 = trunc(_118);
    int _125 = int(_122);
    float _127 = -_120;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _129;
    bool _133 = _125 >= 1;
    float _135 = 0.0;
    float _137 = _120;
    float _139 = _129;
    if (!_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _135;
    if (!_133)
    {
        out.m_55.x = 0.0;
    }
    int _143 = 0;
    if (!_133)
    {
        float _145 = _141 * 5.0;
        _143 = as_type<int>(_145);
    }
    int _147 = _143;
    int _149 = _147;
    if (!_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5213 = as_type<float>(_147);
        out.gl_Position.z = _5213;
    }
    if (!_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _151 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _153 = isnan(_120);
    bool _155 = _151 || _153;
    bool _157 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _159 = _155 || _157;
    float _161 = float(_125);
    bool _163 = _129 >= _161;
    bool _165 = !_159;
    bool _167 = _163 || _165;
    float _169 = 1.0 / _161;
    if (_167)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _137;
    if (_167)
    {
        out.m_55.x = 0.0;
    }
    float _173 = _129 * _169;
    float _175 = _173;
    if (_167)
    {
        float _177 = _171 * 5.0;
        _149 = as_type<int>(_177);
    }
    int _179 = _149;
    out.m_53.x = _173;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5276 = as_type<float>(_179);
        out.gl_Position.z = _5276;
    }
    if (_167)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _181 = as_type<float>(int(gl_VertexIndex));
    float _183 = in.m_60.x;
    float _185 = in.m_60.y;
    float _187 = in.m_60.z;
    float _189 = in.m_62.x;
    float _191 = in.m_62.y;
    float _193 = in.m_62.z;
    float _195 = in.m_64.x;
    float _197 = in.m_64.y;
    float _199 = in.m_64.z;
    float _201 = in.m_66.x;
    float _203 = in.m_66.y;
    float _205 = in.m_66.z;
    int _207 = as_type<int>(_181) & 1;
    bool _209 = _207 != 0;
    int _211 = as_type<int>(_181) & 2;
    bool _213 = _211 != 0;
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _217 = !_209;
    float _219 = _217 ? (-0.5) : 0.5;
    bool _221 = !_213;
    float _223 = _221 ? (-0.5) : 0.5;
    float _225 = _185 * _191;
    float _227 = _185 * _197;
    float _229 = fma(_183, _189, _225);
    float _231 = _185 * _203;
    float _233 = fma(_183, _195, _227);
    float _235 = fma(_187, _193, _229);
    float _237 = fma(_183, _201, _231);
    float _239 = fma(_187, _199, _233);
    float _241 = fma(_187, _205, _237);
    bool _243 = !_215;
    float _261;
    if (!_243)
    {
        float _245 = in.m_68.x;
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _249 = _245 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _253 = _251 * _247;
        float _255 = floor(_253);
        float _257 = -_255;
        float _259 = _253 + _257;
        _261 = _259;
        _263 = true;
    }
    else
    {
        _261 = _173;
    }
    _263 = false;
    float _265 = _261;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = _265 + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = _265 + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _277 = _265 + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _281 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _283 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _287;
    bool _291 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _293 = isnan(_265);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = 1.0 / _285;
    bool _305 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _307 = 1.0 / _281;
    float _309 = 1.0 / _289;
    float _311 = _277 * _303;
    bool _313 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _315 = isnan(_265);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = _269 * _307;
    bool _327 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _329 = isnan(_265);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -_301;
    float _341 = _339 + 1.0;
    float _343 = _337 * _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _349 = _273 * _309;
    bool _351 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _353 = isnan(_265);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -_337;
    float _365 = _363 + 1.0;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _371;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _379 = _361 * _365;
    float _381 = -_361;
    float _383 = _381 + 1.0;
    float _385 = fma(_369, _325, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _387 = fma(_373, _325, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _389 = _323 * _383;
    float _391 = -_323;
    float _393 = _391 + 1.0;
    float _395 = fma(_347, _311, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _397 = _385 * _389;
    float _399 = _387 * _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _401;
    float _405 = fma(_377, _311, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _407;
    float _411 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[143].x, _397);
    float _413 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _415 = fma(_403, _349, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _417 = fma(_409, _349, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _419 = fma(_395, _379, _411);
    float _421 = fma(_405, _379, _413);
    float _423 = fma(_415, _343, _419);
    float _425 = fma(_417, _343, _421);
    float _427 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[146].x, _423);
    float _429 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[146].y, _425);
    bool _431 = !_305;
    int _433 = as_type<int>(_349);
    float _435 = _311;
    float _453;
    if (!_431)
    {
        float _437 = in.m_68.x;
        float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _441 = _437 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _445 = _443 * _439;
        float _447 = floor(_445);
        float _449 = -_447;
        float _451 = _445 + _449;
        _453 = _451;
        _455 = true;
    }
    else
    {
        _453 = _173;
    }
    _455 = false;
    float _457 = _453;
    bool _459 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _461 = isnan(_457);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _475 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _477 = isnan(_457);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _487;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _493 = _457 + _491;
    float _495 = -_469;
    float _497 = _495 + 1.0;
    bool _499 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _501 = 1.0 / _473;
    float _503 = _485 * _497;
    float _505 = -_485;
    float _507 = _505 + 1.0;
    float _509 = _489 * _501;
    float _511 = fma(_509, _493, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _515 = _511 * _503;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _519 = _513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _521 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[115].x, _515);
    float _523 = _517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _525 = in.m_70.x;
    float _527 = in.m_70.y;
    float _529 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[116].x, _521);
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _533 = _529 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _535 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _523;
    out.m_72.y = _519;
    out.m_72.z = _535;
    out.m_72.w = _533;
    float _537 = _429 * _527;
    float _539 = _427 * _525;
    bool _541 = !_499;
    float _559;
    if (!_541)
    {
        float _543 = in.m_68.x;
        float _545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _547 = _543 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _549 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _551 = _549 * _545;
        float _553 = floor(_551);
        float _555 = -_553;
        float _557 = _551 + _555;
        _559 = _557;
        _561 = true;
    }
    else
    {
        _559 = _173;
    }
    _561 = false;
    float _563 = _559;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _567 = _563 + _565;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _573 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _575 = isnan(_563);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _589 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _591 = isnan(_563);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _601;
    bool _605 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _607 = isnan(_563);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _613 = _609 || _611;
    float _615 = float(_613);
    float _617 = 1.0 / _571;
    float _619 = -_583;
    float _621 = _619 + 1.0;
    bool _623 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _625 = _599 * _621;
    float _627 = -_599;
    float _629 = _627 + 1.0;
    float _631 = 1.0 / _587;
    float _633 = _603 * _617;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _639 = fma(_633, _567, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _641 = _637 * _631;
    float _643 = _639 * _625;
    float _645 = -_615;
    float _647 = _645 + 1.0;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _651 = _563 + _649;
    float _653 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[131].x, _643);
    float _655 = _583 * _647;
    float _657 = fma(_641, _651, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _661 = fma(_657, _655, _653);
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _667 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[133].x, _661);
    float _671 = _663 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _669 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_74.x = _667;
    out.m_74.y = _673;
    out.m_74.z = _671;
    out.m_74.w = _675;
    bool _677 = !_623;
    float _679 = _675;
    if (!_677)
    {
        float _681 = in.m_68.x;
        float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _685 = _681 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[14].x, _129);
        float _689 = _687 * _683;
        float _691 = floor(_689);
        float _693 = -_691;
        float _695 = _689 + _693;
        _175 = _695;
    }
    float _697 = _175;
    float _699 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _701 = int(_699);
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _705 = _703 != 0;
    float _707 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _709 = int(_707);
    float _711 = float(_701);
    float _713 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _715 = int(_713);
    if (_705)
    {
        _679 = 1.0;
    }
    float _717 = _679;
    float _719 = 0.0;
    float _721 = _717;
    if (_705)
    {
        _719 = 1.0;
    }
    float _723 = _719;
    float _725 = _723;
    if (_705)
    {
        _433 = 0;
    }
    int _727 = _433;
    float _729 = float(_709);
    float _731 = 1.0 / _711;
    float _733 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _735 = int(_733);
    float _737 = float(uint(_715));
    float _739 = 1.0 / _729;
    float _741 = _731 * _129;
    float _743 = 1.0 / _737;
    float _745 = float(uint(_735));
    int _747 = ~_735;
    int _749 = _747 + 1;
    float _751 = trunc(_741);
    int _753 = int(_751);
    float _755 = _739 * _129;
    float _757 = _739;
    float _759 = _711;
    int _761 = _727;
    if (_705)
    {
        float _763 = in.m_68.x;
        float _765 = in.m_68.y;
        _757 = _763;
        _759 = _765;
    }
    float _767 = _757;
    float _769 = _759;
    float _771 = 1.0 / _745;
    int _773 = as_type<int>(_743) + (-2);
    float _775 = trunc(_755);
    int _777 = int(_775);
    float _779 = float(uint(_753));
    float _781 = as_type<float>(_773) * _779;
    float _783 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _785 = int(_783);
    int _787 = as_type<int>(_771) + (-2);
    float _789 = _771;
    float _791 = _767;
    float _793 = _769;
    if (_705)
    {
        _435 = _767;
    }
    float _795 = _435;
    float _797 = _795;
    if (_705)
    {
        _789 = _769;
    }
    float _799 = _789;
    float _801 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _803 = int(_801);
    float _805 = float(uint(_777));
    float _807 = as_type<float>(_787) * _805;
    float _809 = trunc(_781);
    float _811 = precise::max(_809, 0.0);
    uint _814 = uint(_811);
    float _816 = float(uint(_785));
    float _818 = float(_803);
    float _820 = 1.0 / _816;
    float _822 = 1.0 / _818;
    int _824 = as_type<int>(_816);
    float _826 = _818;
    float _828 = _807;
    float _830 = _799;
    if (_705)
    {
        _824 = 0;
    }
    int _832 = _824;
    float _834 = trunc(_807);
    float _836 = precise::max(_834, 0.0);
    uint _838 = uint(_836);
    int _840 = _832;
    if (_705)
    {
        _826 = _795;
    }
    float _842 = _826;
    float _844 = _842;
    if (_705)
    {
        _828 = _795;
    }
    float _846 = _828;
    float _848 = _846;
    if (!_705)
    {
        float _850 = in.m_68.x;
        float _852 = in.m_68.y;
        float _854 = in.m_68.z;
        float _856 = _850 * 3.1415927410125732421875;
        float _858 = _856 * 0.15915493667125701904296875;
        float _860 = _852 * 3.1415927410125732421875;
        float _862 = _860 * 0.15915493667125701904296875;
        float _864 = _858 * 6.283185482025146484375;
        float _866 = sin(_864);
        float _868 = _862 * 6.283185482025146484375;
        float _870 = sin(_868);
        _725 = 5.839270114898681640625;
        _844 = _854;
        _721 = 7.345489978790283203125;
        _791 = _850;
        _797 = _852;
        _793 = _852;
        _848 = _866;
        _830 = _870;
        _761 = 1;
        _840 = 2;
    }
    float _872 = _725;
    float _874 = _844;
    float _876 = _721;
    float _878 = _791;
    float _880 = _797;
    float _882 = _793;
    float _884 = _848;
    float _886 = _830;
    int _888 = _761;
    int _890 = _840;
    int _892 = _749 * int(_838);
    int _894 = _892 + _777;
    int _896 = ~_715;
    int _898 = _896 + 1;
    float _900 = in.m_68.z;
    float _902 = in.m_68.w;
    float _904 = _822 * _129;
    float _906 = _872 * _874;
    float _908 = float(uint(_894));
    int _910 = _898 * int(_814);
    int _912 = _910 + _753;
    float _914 = _876 * _878;
    float _916 = floor(_906);
    float _918 = _876 * _880;
    float _920 = as_type<float>(_787) * _908;
    float _922 = float(uint(_912));
    float _924 = _878 * 2.0;
    float _926 = float(_735);
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _930 = _697 + _928;
    float _932 = float(_777);
    float _934 = trunc(_920);
    float _936 = precise::max(_934, 0.0);
    uint _938 = uint(_936);
    float _940 = as_type<float>(_773) * _922;
    bool _942 = _932 >= _926;
    bool _944 = isnan(_932);
    bool _946 = _942 || _944;
    bool _948 = isnan(_926);
    bool _950 = _946 || _948;
    float _952 = float(_950);
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _956 = _954 != 0;
    float _958 = trunc(_904);
    int _960 = int(_958);
    bool _962 = _882 > 0.5;
    float _964 = -_916;
    float _966 = _906 + _964;
    bool _968 = _902 > 0.5;
    bool _970 = _900 > 0.5;
    int _972 = as_type<int>(_820) + (-2);
    float _974 = floor(_914);
    int _976 = int(_838) + int(_938);
    int _978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _980 = _978 != 0;
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _984 = _982 != 0;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _988 = _986 != 0;
    int _990 = ~_715;
    int _992 = _990 + 1;
    int _994 = ~_735;
    int _996 = _994 + 1;
    float _998 = trunc(_940);
    float _1000 = precise::max(_998, 0.0);
    uint _1002 = uint(_1000);
    float _1004 = float(uint(_960));
    float _1006 = float(_753);
    float _1008 = as_type<float>(_972) * _1004;
    float _1010 = -_219;
    int _1012 = _962 ? as_type<int>(_1010) : as_type<int>(_219);
    float _1014 = trunc(_952);
    int _1016 = int(_1014);
    float _1018 = -_974;
    float _1020 = _914 + _1018;
    float _1022 = float(_715);
    int _1024 = _996 * _976;
    int _1026 = _1024 + _777;
    int _1028 = int(_968);
    int _1030 = _970 ? 2 : 0;
    int _1032 = _1028 | _1030;
    int _1034 = _956 ? 4 : 0;
    int _1036 = _1032 | _1034;
    int _1038 = _980 ? 8 : 0;
    int _1040 = _1036 | _1038;
    int _1042 = _984 ? 16 : 0;
    int _1044 = _1040 | _1042;
    int _1046 = _988 ? 32 : 0;
    int _1048 = _1044 | _1046;
    int _1050 = _962 ? 64 : 0;
    int _1052 = _1048 | _1050;
    int _1054 = _1052 & 64;
    bool _1056 = !_984;
    float _1058 = _1056 ? _219 : as_type<float>(_1012);
    int _1060 = int(_814) + int(_1002);
    float _1062 = trunc(_1008);
    float _1064 = precise::max(_1062, 0.0);
    uint _1066 = uint(_1064);
    float _1068 = -_223;
    int _1070 = _970 ? as_type<int>(_1068) : as_type<int>(_223);
    bool _1072 = _1006 >= _1022;
    bool _1074 = isnan(_1006);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan(_1022);
    bool _1080 = _1076 || _1078;
    float _1082 = float(_1080);
    float _1084 = _1020 * _926;
    bool _1086 = !_988;
    float _1088 = _1086 ? _223 : as_type<float>(_1070);
    float _1090 = floor(_918);
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1094 = _1092 != 0;
    int _1096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1098 = _1096 != 0;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1102 = _1100 != 0;
    bool _1104 = !_956;
    int _1106 = _1104 ? 0 : 1;
    int _1108 = _992 * _1060;
    int _1110 = _1108 + _753;
    bool _1112 = uint(_1026) >= uint(_735);
    bool _1114 = !_1098;
    int _1116 = _1114 ? 0 : 1;
    float _1118 = trunc(_1084);
    int _1120 = int(_1118);
    bool _1122 = !_1094;
    int _1124 = _1122 ? 0 : 1;
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1128 = _1126 != 0;
    bool _1130 = uint(_1110) >= uint(_715);
    float _1132 = _966 * _1022;
    bool _1134 = !_1102;
    int _1136 = _1134 ? 0 : 1;
    float _1138 = trunc(_1082);
    int _1140 = int(_1138);
    bool _1142 = !_1128;
    int _1144 = _1142 ? 0 : 1;
    float _1146 = -_1090;
    float _1148 = _918 + _1146;
    bool _1150 = !_1130;
    int _1152 = _1150 ? 0 : (-1);
    bool _1154 = !_1112;
    int _1156 = _1154 ? 0 : (-1);
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1160 = _1158 != 0;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1164 = _1162 != 0;
    int _1166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1168 = _1166 != 0;
    float _1170 = trunc(_1132);
    int _1172 = int(_1170);
    int _1174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1176 = _1174 != 0;
    int _1178 = ~_785;
    int _1180 = _1178 + 1;
    int _1182 = ~_1060;
    int _1184 = _1182 + _1152;
    int _1186 = _1184 + 1;
    bool _1188 = !_1176;
    int _1190 = _1188 ? 0 : 1;
    int _1192 = _1180 * int(_1066);
    int _1194 = _1192 + _960;
    int _1196 = abs(_1106);
    float _1198 = floor(_924);
    int _1200 = ~_976;
    int _1202 = _1200 + _1156;
    int _1204 = _1202 + 1;
    int _1206 = _715 * _1186;
    int _1208 = _1206 + _753;
    int _1210 = abs(_1190);
    int _1212 = _1120 * _1196;
    int _1214 = _1212 + _777;
    float _1216 = float(uint(_1194));
    int _1218 = _735 * _1204;
    int _1220 = _1218 + _777;
    float _1222 = _169 * _129;
    bool _1224 = _735 == 0;
    bool _1226 = !_1164;
    int _1228 = _1226 ? 0 : 1;
    float _1230 = _926 * _1222;
    bool _1232 = _1054 != 0;
    float _1234 = as_type<float>(_972) * _1216;
    bool _1236 = !_1160;
    int _1238 = _1236 ? 0 : 1;
    float _1240 = _1022 * _1222;
    int _1242 = ~_1016;
    int _1244 = _1242 + 1;
    int _1246 = _1244 + 1;
    float _1248 = trunc(_1230);
    int _1250 = int(_1248);
    bool _1252 = !_1224;
    int _1254 = _1252 ? _1220 : (-1);
    int _1256 = _1172 * _1210;
    int _1258 = _1256 + _753;
    bool _1260 = _715 == 0;
    float _1262 = _884 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    int _1264 = ~_1140;
    int _1266 = _1264 + 1;
    int _1268 = _1266 + 1;
    int _1270 = _1254 * _1246;
    bool _1272 = !_1260;
    int _1274 = _1272 ? _1208 : (-1);
    float _1276 = trunc(_1234);
    float _1278 = precise::max(_1276, 0.0);
    uint _1280 = uint(_1278);
    int _1282 = _735 + (-1);
    int _1284 = _715 + (-1);
    int _1286 = _1274 * _1268;
    int _1288 = abs(_1116);
    int _1290 = _1016 * _1282;
    int _1292 = _1290 + _1270;
    int _1294 = abs(_1136);
    int _1296 = _1140 * _1284;
    int _1298 = _1296 + _1286;
    int _1300 = abs(_1144);
    int _1302 = _1292 * _1288;
    int _1304 = abs(_1124);
    float _1306 = trunc(_1240);
    int _1308 = int(_1306);
    int _1310 = abs(_1228);
    float _1312 = _882 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1314 = ~_785;
    int _1316 = _1314 + 1;
    int _1318 = _1250 * _1304;
    int _1320 = _1318 + _1302;
    int _1322 = _1214 * _1294;
    int _1324 = _1322 + _1320;
    int _1326 = int(_1066) + int(_1280);
    int _1328 = _1120 * _1300;
    int _1330 = _1328 + _1324;
    bool _1332 = !_1168;
    int _1334 = _1332 ? 0 : 1;
    int _1336 = _1298 * _1310;
    int _1338 = abs(_1238);
    int _1340 = _1316 * _1326;
    int _1342 = _1340 + _960;
    float _1344 = float(uint(_1330));
    float _1346 = -_223;
    int _1348 = _968 ? as_type<int>(_1346) : as_type<int>(_223);
    int _1350 = _1308 * _1338;
    int _1352 = _1350 + _1336;
    float _1354 = -_219;
    int _1356 = _970 ? as_type<int>(_1354) : as_type<int>(_219);
    float _1358 = float(_785);
    float _1360 = float(_960);
    int _1362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1364 = _1362 != 0;
    float _1366 = _1358 * _1222;
    int _1368 = abs(_1334);
    float _1370 = as_type<float>(_787) * _1344;
    bool _1372 = uint(_1342) >= uint(_785);
    int _1374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1376 = _1374 != 0;
    int _1378 = _1258 * _1368;
    int _1380 = _1378 + _1352;
    bool _1382 = _1360 >= _1358;
    bool _1384 = isnan(_1360);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan(_1358);
    bool _1390 = _1386 || _1388;
    float _1392 = float(_1390);
    float _1394 = trunc(_1366);
    int _1396 = int(_1394);
    bool _1398 = !_1364;
    int _1400 = _1398 ? 0 : 1;
    bool _1402 = !_980;
    float _1404 = _1402 ? _223 : as_type<float>(_1348);
    bool _1406 = !_1376;
    int _1408 = _1406 ? 0 : 1;
    int _1410 = abs(_1400);
    float _1412 = trunc(_1370);
    float _1414 = precise::max(_1412, 0.0);
    uint _1416 = uint(_1414);
    bool _1418 = !_1372;
    int _1420 = _1418 ? 0 : (-1);
    float _1422 = _1148 * _1358;
    int _1424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1426 = _1424 != 0;
    int _1428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1430 = _1428 != 0;
    int _1432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1434 = _1432 != 0;
    int _1436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1438 = _1436 != 0;
    int _1440 = ~_1326;
    int _1442 = _1440 + _1420;
    int _1444 = _1442 + 1;
    float _1446 = trunc(_1392);
    int _1448 = int(_1446);
    int _1450 = ~_735;
    int _1452 = _1450 + 1;
    int _1454 = _1172 * _1410;
    int _1456 = _1454 + _1380;
    bool _1458 = !_1426;
    int _1460 = _1458 ? 0 : 1;
    int _1462 = _785 * _1444;
    int _1464 = _1462 + _960;
    bool _1466 = _785 == 0;
    float _1468 = float(uint(_1456));
    int _1470 = _1452 * int(_1416);
    int _1472 = _1470 + _1330;
    bool _1474 = !_1430;
    int _1476 = _1474 ? 0 : 1;
    float _1478 = trunc(_1422);
    int _1480 = int(_1478);
    int _1482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1484 = _1482 != 0;
    float _1486 = as_type<float>(_773) * _1468;
    bool _1488 = !_1466;
    int _1490 = _1488 ? _1464 : (-1);
    float _1492 = float(uint(_1472));
    int _1494 = ~_1448;
    int _1496 = _1494 + 1;
    int _1498 = _1496 + 1;
    float _1500 = trunc(_1486);
    float _1502 = precise::max(_1500, 0.0);
    uint _1504 = uint(_1502);
    int _1506 = abs(_1476);
    float _1508 = as_type<float>(_787) * _1492;
    int _1510 = abs(_1460);
    int _1512 = _1490 * _1498;
    int _1514 = _785 + (-1);
    float _1516 = _1468;
    float _1518 = as_type<float>(_888);
    float _1520 = as_type<float>(_890);
    if (_1484)
    {
        float _1522 = in.m_68.w;
        _1516 = _1522;
    }
    float _1524 = _1516;
    int _1526 = abs(_1408);
    float _1528 = trunc(_1508);
    float _1530 = precise::max(_1528, 0.0);
    uint _1532 = uint(_1530);
    bool _1534 = _735 == 0;
    int _1536 = _1448 * _1514;
    int _1538 = _1536 + _1512;
    int _1540 = _1538 * _1506;
    int _1542 = ~_715;
    int _1544 = _1542 + 1;
    float _1546 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1548 = log2(_1546);
    float _1550 = 0.0;
    float _1552 = as_type<float>(_1526);
    if (!_1484)
    {
        _1550 = _219;
    }
    float _1554 = _1550;
    int _1556 = _1396 * _1510;
    int _1558 = _1556 + _1540;
    int _1560 = _1480 * _1526;
    int _1562 = _1560 + _960;
    bool _1564 = !_1434;
    int _1566 = _1564 ? 0 : 1;
    int _1568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1570 = _1568 != 0;
    int _1572 = _1544 * int(_1504);
    int _1574 = _1572 + _1456;
    int _1576 = int(_1416) + int(_1532);
    int _1578 = abs(_1566);
    float _1580 = float(uint(_1574));
    float _1582 = _1554;
    if (_1484)
    {
        float _1584 = _1524 * 3.1415927410125732421875;
        _1552 = _1584;
    }
    float _1586 = _1552;
    int _1588 = ~_735;
    int _1590 = _1588 + 1;
    bool _1592 = !_1438;
    int _1594 = _1592 ? 0 : 1;
    float _1596 = as_type<float>(_773) * _1580;
    int _1598 = _1590 * _1576;
    int _1600 = _1598 + _1330;
    float _1602 = _1586;
    if (_1484)
    {
        float _1604 = _1586 * 0.15915493667125701904296875;
        _1602 = _1604;
    }
    float _1606 = _1602;
    int _1608 = abs(_1594);
    float _1610 = trunc(_1596);
    float _1612 = precise::max(_1610, 0.0);
    uint _1614 = uint(_1612);
    int _1616 = _1562 * _1578;
    int _1618 = _1616 + _1558;
    bool _1620 = uint(_1600) >= uint(_735);
    float _1622 = as_type<float>(_1396);
    if (_1570)
    {
        float _1624 = in.m_68.x;
        _1622 = _1624;
    }
    float _1626 = _1622;
    float _1628 = float(uint(_1214));
    int _1630 = _1480 * _1608;
    int _1632 = _1630 + _1618;
    bool _1634 = !_1620;
    int _1636 = _1634 ? 0 : (-1);
    float _1638 = _1606;
    if (_1484)
    {
        float _1640 = _1606 * 6.283185482025146484375;
        float _1642 = sin(_1640);
        _1638 = _1642;
    }
    float _1644 = _1638;
    float _1646 = as_type<float>(_787) * _1628;
    int _1648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1650 = _1648 != 0;
    int _1652 = ~_1576;
    int _1654 = _1652 + _1636;
    int _1656 = _1654 + 1;
    bool _1658 = !_1650;
    float _1660 = _1658 ? _219 : as_type<float>(_1356);
    float _1662 = trunc(_1646);
    float _1664 = precise::max(_1662, 0.0);
    uint _1666 = uint(_1664);
    float _1668 = float(uint(_1632));
    int _1670 = _735 * _1656;
    int _1672 = _1670 + _1330;
    int _1674 = int(_1504) + int(_1614);
    float _1676 = float(uint(_1258));
    float _1678 = as_type<float>(_972) * _1668;
    bool _1680 = !_1534;
    int _1682 = _1680 ? _1672 : (-1);
    bool _1684 = _1650;
    float _1686 = _1668;
    if (_1484)
    {
        bool _1688 = _1644 > 0.5;
        _1684 = _1688;
    }
    bool _1690 = _1684;
    float _1692 = trunc(_1678);
    float _1694 = precise::max(_1692, 0.0);
    uint _1696 = uint(_1694);
    int _1698 = ~_735;
    int _1700 = _1698 + 1;
    if (_1570)
    {
        float _1702 = _1626 * 3.1415927410125732421875;
        _1686 = _1702;
    }
    float _1704 = _1686;
    float _1706 = _1704;
    if (_1484)
    {
        float _1708 = -_219;
        float _1710 = _1690 ? _1708 : _219;
        _1582 = _1710;
    }
    float _1712 = _1582;
    float _1714 = as_type<float>(_773) * _1676;
    int _1716 = _1682 & 3;
    bool _1718 = _1716 != 0;
    int _1720 = _1700 * int(_1666);
    int _1722 = _1720 + _1214;
    int _1724 = _1682 & 3;
    bool _1726 = _1724 != 0;
    if (_1570)
    {
        float _1728 = _1704 * 0.15915493667125701904296875;
        _1706 = _1728;
    }
    float _1730 = _1706;
    int _1732 = ~_785;
    int _1734 = _1732 + 1;
    float _1736 = trunc(_1714);
    float _1738 = precise::max(_1736, 0.0);
    uint _1740 = uint(_1738);
    int _1742 = _1718 ? 0 : 1;
    bool _1744 = uint(_1724) > 1u;
    float _1746 = float(uint(_1722));
    float _1748 = _1730;
    if (_1570)
    {
        float _1750 = _1730 * 6.283185482025146484375;
        float _1752 = sin(_1750);
        _1748 = _1752;
    }
    float _1754 = _1748;
    int _1756 = ~_715;
    int _1758 = _1756 + 1;
    float _1760 = as_type<float>(_787) * _1746;
    float _1762 = -_223;
    int _1764 = _1232 ? as_type<int>(_1762) : as_type<int>(_223);
    int _1766 = _1734 * int(_1696);
    int _1768 = _1766 + _1632;
    int _1770 = ~_1742;
    int _1772 = _1770 + 1;
    int _1774 = _1772 + 1;
    int _1776 = _1758 * _1674;
    int _1778 = _1776 + _1456;
    bool _1780 = uint(_1724) >= 2u;
    float _1782 = trunc(_1760);
    float _1784 = precise::max(_1782, 0.0);
    uint _1786 = uint(_1784);
    float _1788 = float(uint(_1768));
    int _1790 = _1774;
    if (!_1744)
    {
        int _1792 = ~_1742;
        int _1794 = _1792 + 1;
        _1790 = _1794;
    }
    int _1796 = _1790;
    bool _1798 = uint(_1778) >= uint(_715);
    float _1800 = as_type<float>(_972) * _1788;
    int _1802 = _1780 ? 0 : 1;
    bool _1804 = _1724 != 3;
    bool _1806 = !_1798;
    int _1808 = _1806 ? 0 : (-1);
    float _1810 = trunc(_1800);
    float _1812 = precise::max(_1810, 0.0);
    uint _1814 = uint(_1812);
    int _1816 = ~_715;
    int _1818 = _1816 + 1;
    int _1820 = ~_1674;
    int _1822 = _1820 + _1808;
    int _1824 = _1822 + 1;
    int _1826 = ~_1802;
    int _1828 = _1826 + 1;
    int _1830 = _1828 + 1;
    int _1832 = _1818 * int(_1740);
    int _1834 = _1832 + _1258;
    int _1836 = _715 * _1824;
    int _1838 = _1836 + _1456;
    float _1840 = 0.0;
    int _1842 = _1830;
    bool _1844 = _1804;
    if (!_1570)
    {
        _1840 = _223;
    }
    float _1846 = _1840;
    float _1848 = _1846;
    if (_1804)
    {
        int _1850 = ~_1802;
        int _1852 = _1850 + 1;
        _1842 = _1852;
    }
    int _1854 = _1842;
    if (_1570)
    {
        bool _1856 = _1754 > 0.5;
        _1844 = _1856;
    }
    bool _1858 = _1844;
    float _1860 = float(uint(_1834));
    bool _1862 = !_1260;
    int _1864 = _1862 ? _1838 : (-1);
    int _1866 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1868 = _1866 != 0;
    float _1870 = as_type<float>(_773) * _1860;
    if (_1570)
    {
        float _1872 = -_223;
        float _1874 = _1858 ? _1872 : _223;
        _1848 = _1874;
    }
    float _1876 = _1848;
    int _1878 = _1864 & 3;
    bool _1880 = _1878 != 0;
    bool _1882 = !_1868;
    float _1884 = _1882 ? _223 : as_type<float>(_1764);
    float _1886 = trunc(_1870);
    float _1888 = precise::max(_1886, 0.0);
    uint _1890 = uint(_1888);
    int _1892 = int(_1696) + int(_1814);
    int _1894 = ~_785;
    int _1896 = _1894 + 1;
    int _1898 = _1864 & 3;
    bool _1900 = _1898 != 0;
    bool _1902 = uint(_1878) > 1u;
    int _1904 = _1896 * _1892;
    int _1906 = _1904 + _1632;
    int _1908 = int(_1666) + int(_1786);
    int _1910 = ~_735;
    int _1912 = _1910 + 1;
    int _1914 = _1900 ? 0 : 1;
    int _1916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1918 = _1916 != 0;
    int _1920 = _1912 * _1908;
    int _1922 = _1920 + _1214;
    float _1924 = float(uint(_1562));
    bool _1926 = !_1918;
    int _1928 = _1926 ? 0 : 1;
    bool _1930 = uint(_1906) >= uint(_785);
    float _1932 = as_type<float>(_972) * _1924;
    int _1934 = ~_1914;
    int _1936 = _1934 + 1;
    int _1938 = _1936 + 1;
    int _1940 = _1938;
    if (!_1902)
    {
        int _1942 = ~_1914;
        int _1944 = _1942 + 1;
        _1940 = _1944;
    }
    int _1946 = _1940;
    bool _1948 = uint(_1922) >= uint(_735);
    bool _1950 = !_1930;
    int _1952 = _1950 ? 0 : (-1);
    float _1954 = trunc(_1932);
    float _1956 = precise::max(_1954, 0.0);
    uint _1958 = uint(_1956);
    bool _1960 = _1878 != 3;
    int _1962 = ~_715;
    int _1964 = _1962 + 1;
    bool _1966 = !_1948;
    int _1968 = _1966 ? 0 : (-1);
    bool _1970 = uint(_1878) >= 2u;
    int _1972 = int(_1740) + int(_1890);
    int _1974 = ~_1892;
    int _1976 = _1974 + _1952;
    int _1978 = _1976 + 1;
    int _1980 = _1970 ? 0 : 1;
    int _1982 = _785 * _1978;
    int _1984 = _1982 + _1632;
    int _1986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1988 = _1986 != 0;
    int _1990 = _1964 * _1972;
    int _1992 = _1990 + _1258;
    int _1994 = ~_785;
    int _1996 = _1994 + 1;
    int _1998 = ~_1980;
    int _2000 = _1998 + 1;
    int _2002 = _2000 + 1;
    int _2004 = _2002;
    float _2006 = as_type<float>(_1964);
    if (_1960)
    {
        int _2008 = ~_1980;
        int _2010 = _2008 + 1;
        _2004 = _2010;
    }
    int _2012 = _2004;
    int _2014 = _1996 * int(_1958);
    int _2016 = _2014 + _1562;
    int _2018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2020 = _2018 != 0;
    bool _2022 = !_1988;
    int _2024 = _2022 ? 0 : 1;
    bool _2026 = uint(_1992) >= uint(_715);
    bool _2028 = !_1466;
    int _2030 = _2028 ? _1984 : (-1);
    bool _2032 = !_2020;
    int _2034 = _2032 ? 0 : 1;
    bool _2036 = !_2026;
    int _2038 = _2036 ? 0 : (-1);
    int _2040 = _2030 & 3;
    bool _2042 = _2040 != 0;
    int _2044 = _2030 & 3;
    bool _2046 = _2044 != 0;
    float _2048 = float(uint(_2016));
    int _2050 = _2042 ? 0 : 1;
    bool _2052 = uint(_2044) > 1u;
    float _2054 = as_type<float>(_972) * _2048;
    int _2056 = ~_2050;
    int _2058 = _2056 + 1;
    int _2060 = _2058 + 1;
    float _2062 = trunc(_2054);
    float _2064 = precise::max(_2062, 0.0);
    uint _2066 = uint(_2064);
    float _2068 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2070 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2072 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2068);
    int _2074 = _2060;
    float _2076 = _2054;
    if (!_2052)
    {
        int _2078 = ~_2050;
        int _2080 = _2078 + 1;
        _2074 = _2080;
    }
    int _2082 = _2074;
    float _2084 = -_2070;
    float _2086 = fma(_1262, 2.0, _2084);
    bool _2088 = uint(_2044) >= 2u;
    float _2090 = _886 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _2092 = ~_785;
    int _2094 = _2092 + 1;
    float _2096 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2098 = _2088 ? 0 : 1;
    float _2100 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2102 = _2044 != 3;
    float _2104 = fma(_1312, -2.0, _2096);
    int _2106 = int(_1958) + int(_2066);
    float _2108 = -_129;
    float _2110 = fma(_2108, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2086);
    float _2112 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2072);
    int _2114 = ~_2098;
    int _2116 = _2114 + 1;
    int _2118 = _2116 + 1;
    int _2120 = _2094 * _2106;
    int _2122 = _2120 + _1562;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2126 = _2118;
    float _2128 = as_type<float>(_2122);
    if (_2102)
    {
        int _2130 = ~_2098;
        int _2132 = _2130 + 1;
        _2126 = _2132;
    }
    int _2134 = _2126;
    float _2136 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _2138 = uint(_2122) >= uint(_785);
    float _2140 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2124);
    float _2142 = _1548 * _129;
    float _2144 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2146 = !_2138;
    int _2148 = _2146 ? 0 : (-1);
    float _2150 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2140);
    bool _2152 = _878 > 0.5;
    float _2154 = exp2(_2142);
    float _2156 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2158 = -_219;
    int _2160 = _2152 ? as_type<int>(_2158) : as_type<int>(_219);
    float _2162 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2164 = _697 + _2162;
    bool _2166 = _888 != 1;
    float _2168 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2170 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2172 = -_2154;
    float _2174 = _2172 + 1.0;
    float _2176 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    if (!_2166)
    {
        _2006 = _882;
    }
    float _2178 = _2006;
    float _2180 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2182 = _2180 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2184 = 0.0;
    float _2186 = _2178;
    if (!_2166)
    {
        _2184 = _882;
    }
    float _2188 = _2184;
    float _2190 = fma(_2090, -2.0, _2176);
    float _2192 = _2188;
    if (!_2166)
    {
        _2076 = _900;
    }
    float _2194 = _2076;
    float _2196 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2104);
    float _2198 = _2194;
    if (!_2166)
    {
        _2128 = _900;
    }
    float _2200 = _2128;
    float _2202 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2190);
    float _2204 = _2200;
    if (_2166)
    {
        _2186 = _878;
    }
    float _2206 = _2186;
    float _2208 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2210 = _2208 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    if (_2166)
    {
        _2192 = _878;
    }
    float _2212 = _2192;
    float _2214 = 1.0 / _2182;
    if (_2166)
    {
        _2198 = _882;
    }
    float _2216 = _2198;
    float _2218 = _2206 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2166)
    {
        _2204 = _882;
    }
    float _2220 = _2204;
    bool _2222 = _890 != 2;
    float _2224 = -_2100;
    float _2226 = fma(_2218, 2.0, _2224);
    float _2228 = _2216 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2230 = fma(_2220, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2136);
    float _2232 = -_129;
    float _2234 = fma(_2232, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2226);
    float _2236 = fma(_2228, -2.0, _2144);
    float _2238 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2230);
    float _2240 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2242 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2236);
    float _2244 = 1.0 / _2210;
    if (_2222)
    {
        _1518 = _878;
    }
    float _2246 = _1518;
    float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2250 = _2248 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2252 = _2246;
    if (_2222)
    {
        _1520 = _882;
    }
    float _2254 = _1520;
    float _2256 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2258 = _2256 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2260 = _2254;
    if (!_2222)
    {
        _2252 = _900;
    }
    float _2262 = _2252;
    float _2264 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2266 = _697 + _2264;
    if (!_2222)
    {
        _2260 = _878;
    }
    float _2268 = _2260;
    float _2270 = 1.0 / _2250;
    int _2272 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2274 = _2272 != 0;
    float _2276 = _2262 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2278 = _878 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2280 = _2268 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2282 = !_2274;
    float _2284 = _2282 ? _219 : as_type<float>(_2160);
    float _2286 = in.m_48.x;
    float _2288 = in.m_48.y;
    float _2290 = in.m_48.z;
    bool _2292 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2294 = isnan(0.0);
    bool _2296 = _2292 || _2294;
    bool _2298 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2300 = _2296 || _2298;
    float _2302 = -_2156;
    float _2304 = fma(_2276, 2.0, _2302);
    float _2306 = fma(_2280, -2.0, _2240);
    float _2308 = -_2168;
    float _2310 = fma(_2278, 2.0, _2308);
    float _2312 = _2300 ? _2174 : 0.0;
    float _2314 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2306);
    bool _2316 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2318 = isnan(1.0);
    bool _2320 = _2316 || _2318;
    bool _2322 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2324 = _2320 || _2322;
    float _2326 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2328 = 1.0 + _2326;
    float _2330 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2332 = -_129;
    float _2334 = fma(_2332, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2310);
    float _2336 = 1.0 / _2328;
    float _2338 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2342 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2330);
    float _2344 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2346 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2338);
    float _2348 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2340);
    float _2350 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2170);
    float _2352 = fma(_2212, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2344);
    float _2354 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2346);
    float _2356 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2342);
    float _2358 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2350);
    float _2360 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2348);
    float _2362 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2352);
    float _2364 = -_129;
    float _2366 = fma(_2364, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2304);
    float _2368 = _191 * _2288;
    if (_2324)
    {
        float _2370 = _2312 * _2336;
        _139 = _2370;
    }
    float _2372 = _139;
    float _2374 = _882 * 2.0;
    bool _2376 = _1198 >= 0.0;
    bool _2378 = isnan(_1198);
    bool _2380 = _2376 || _2378;
    bool _2382 = isnan(0.0);
    bool _2384 = _2380 || _2382;
    float _2386 = _197 * _2288;
    float _2388 = _203 * _2288;
    float _2390 = floor(_2374);
    int _2392 = _2384 ? 0 : 1;
    float _2394 = fma(_195, _2286, _2386);
    bool _2396 = _1198 > 0.0;
    float _2398 = fma(_201, _2286, _2388);
    float _2400 = fma(_189, _2286, _2368);
    float _2402 = fma(_199, _2290, _2394);
    int _2404 = ~_2392;
    int _2406 = _2404 + 1;
    int _2408 = _2406 + 1;
    float _2410 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2412 = _2410 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2414 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2416 = _2414 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2418 = 1.0 / _2258;
    float _2420 = fma(_205, _2290, _2398);
    float _2422 = fma(_193, _2290, _2400);
    int _2424 = _2408;
    if (!_2396)
    {
        int _2426 = ~_2392;
        int _2428 = _2426 + 1;
        _2424 = _2428;
    }
    int _2430 = _2424;
    float _2432 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2434 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2432;
    bool _2436 = _2390 >= 0.0;
    bool _2438 = isnan(_2390);
    bool _2440 = _2436 || _2438;
    bool _2442 = isnan(0.0);
    bool _2444 = _2440 || _2442;
    float _2446 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2448 = _2446 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2450 = 1.0 / _2412;
    int _2452 = _2444 ? 0 : 1;
    float _2454 = _2434 * _2214;
    bool _2456 = _2390 > 0.0;
    float _2458 = _900 * 2.0;
    float _2460 = _2448 * _2244;
    int _2462 = ~_1972;
    int _2464 = _2462 + _2038;
    int _2466 = _2464 + 1;
    float _2468 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2470 = _2468 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2472 = 1.0 / _2416;
    float _2474 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2476 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2474;
    float _2478 = _2470 * _2270;
    int _2480 = _715 * _2466;
    int _2482 = _2480 + _1258;
    float _2484 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2486 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2484;
    float _2488 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2490 = _2488 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2492 = floor(_2458);
    float _2494 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2496 = _2494 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2498 = _2486 * _2418;
    float _2500 = _2490 * _2450;
    bool _2502 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2504 = isnan(_697);
    bool _2506 = _2502 || _2504;
    bool _2508 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2510 = _2506 || _2508;
    float _2512 = float(_2510);
    float _2514 = fma(_2478, _2266, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _2516 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2518 = isnan(_697);
    bool _2520 = _2516 || _2518;
    bool _2522 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2524 = _2520 || _2522;
    float _2526 = float(_2524);
    float _2528 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2530 = _697 + _2528;
    float _2532 = _2476 * _2472;
    int _2534 = ~_2452;
    int _2536 = _2534 + 1;
    int _2538 = _2536 + 1;
    float _2540 = 1.0 / _2496;
    bool _2542 = !_1260;
    int _2544 = _2542 ? _2482 : (-1);
    float _2546 = -_2512;
    float _2548 = _2546 + 1.0;
    bool _2550 = !_1880;
    int _2552 = _2550 ? 0 : 1;
    float _2554 = in.m_64.w;
    int _2556 = _2538;
    if (!_2456)
    {
        int _2558 = ~_2452;
        int _2560 = _2558 + 1;
        _2556 = _2560;
    }
    int _2562 = _2556;
    float _2564 = -_2526;
    float _2566 = _2564 + 1.0;
    int _2568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2570 = _2568 != 0;
    int _2572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2574 = _2572 != 0;
    int _2576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2578 = _2576 != 0;
    float _2580 = _2526 * _2548;
    bool _2582 = _2492 >= 0.0;
    bool _2584 = isnan(_2492);
    bool _2586 = _2582 || _2584;
    bool _2588 = isnan(0.0);
    bool _2590 = _2586 || _2588;
    float _2592 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2594 = _697 + _2592;
    bool _2596 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2598 = isnan(_697);
    bool _2600 = _2596 || _2598;
    bool _2602 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2604 = _2600 || _2602;
    float _2606 = float(_2604);
    float _2608 = fma(_2498, _2530, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2610 = _1864 >> 31;
    float _2612 = fma(_2454, _2594, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _2614 = _2590 ? 0 : 1;
    float _2616 = _2606 * _2566;
    bool _2618 = _2492 > 0.0;
    float _2620 = -_2606;
    float _2622 = _2620 + 1.0;
    bool _2624 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2626 = isnan(_697);
    bool _2628 = _2624 || _2626;
    bool _2630 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2632 = _2628 || _2630;
    float _2634 = float(_2632);
    float _2636 = fma(_2460, _2164, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _2638 = _2610 & 3;
    float _2640 = fma(_2532, _930, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _2642 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2644 = isnan(_697);
    bool _2646 = _2642 || _2644;
    bool _2648 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2650 = _2646 || _2648;
    float _2652 = float(_2650);
    float _2654 = -_2634;
    float _2656 = _2654 + 1.0;
    int _2658 = _1864 + _2638;
    float _2660 = _2634 * _2622;
    bool _2662 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2664 = isnan(_697);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2670 = _2666 || _2668;
    float _2672 = float(_2670);
    float _2674 = -_2652;
    float _2676 = _2674 + 1.0;
    float _2678 = _2652 * _2656;
    int _2680 = _2658 >> 2;
    float _2682 = _2402 + _2554;
    float _2684 = _2672 * _2676;
    bool _2686 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2688 = isnan(_697);
    bool _2690 = _2686 || _2688;
    bool _2692 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2694 = _2690 || _2692;
    float _2696 = float(_2694);
    float _2698 = -_2672;
    float _2700 = _2698 + 1.0;
    int _2702 = _2680 << 4;
    int _2704 = _2702 + 656;
    float _2706 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2708 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2706;
    bool _2710 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2712 = isnan(_697);
    bool _2714 = _2710 || _2712;
    bool _2716 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2718 = _2714 || _2716;
    float _2720 = float(_2718);
    float _2722 = _2696 * _2700;
    float _2724 = -_2696;
    float _2726 = _2724 + 1.0;
    float _2728 = _2708 * _2540;
    uint _2730 = uint(int(uint(_2704) >> uint(2)));
    uint _2732 = uint(int(uint(int(_2730)) >> uint(2)));
    int _2734 = int(_2730) & 3;
    float _2736 = (*spvDescriptorSet0.vp_c9)._m0[int(_2732)][_2734];
    int _2738 = int(_2730) + 1;
    uint _2740 = uint(int(uint(_2738) >> uint(2)));
    int _2742 = _2738 & 3;
    float _2744 = (*spvDescriptorSet0.vp_c9)._m0[int(_2740)][_2742];
    float _2746 = in.m_62.w;
    float _2748 = _2720 * _2726;
    float _2750 = -_2720;
    float _2752 = _2750 + 1.0;
    float _2754 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2756 = _2682 + _2754;
    float _2758 = in.m_66.w;
    float _2760 = _2612 * _2748;
    float _2762 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2764 = _697 + _2762;
    float _2766 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2768 = _697 + _2766;
    int _2770 = abs(_2012);
    float _2772 = fma(_2752, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2760);
    int _2774 = abs(_2024);
    int _2776 = _2704 + 8;
    uint _2778 = uint(int(uint(_2776) >> uint(2)));
    uint _2780 = uint(int(uint(int(_2778)) >> uint(2)));
    int _2782 = int(_2778) & 3;
    float _2784 = (*spvDescriptorSet0.vp_c9)._m0[int(_2780)][_2782];
    int _2786 = int(_2778) + 1;
    uint _2788 = uint(int(uint(_2786) >> uint(2)));
    int _2790 = _2786 & 3;
    float _2792 = (*spvDescriptorSet0.vp_c9)._m0[int(_2788)][_2790];
    float _2794 = fma(_2728, _2768, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2796 = fma(_2636, _2722, _2772);
    int _2798 = ~_2614;
    int _2800 = _2798 + 1;
    int _2802 = _2800 + 1;
    float _2804 = _882 + _900;
    int _2806 = _2802;
    if (!_2618)
    {
        int _2808 = ~_2614;
        int _2810 = _2808 + 1;
        _2806 = _2810;
    }
    int _2812 = _2806;
    float _2814 = _882 + _878;
    float _2816 = fma(_2500, _2764, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _2818 = !_2570;
    int _2820 = _2818 ? 0 : 1;
    float _2822 = -_2360;
    float _2824 = _2822 + 1.0;
    float _2826 = _2814 + (-1.0);
    float _2828 = float(_2812);
    float _2830 = _2422 + _2746;
    float _2832 = fma(_2640, _2684, _2796);
    float _2834 = _878 + _900;
    int _2836 = abs(_1946);
    float _2838 = _2420 + _2758;
    float _2840 = _878 + (-0.5);
    float _2842 = fma(_2514, _2678, _2832);
    float _2844 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2846 = _2830 + _2844;
    float _2848 = _2756 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2850 = _882 + (-0.5);
    float _2852 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2854 = int(_2852);
    float _2856 = fma(_2846, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2848);
    float _2858 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2860 = _2838 + _2858;
    int _2862 = abs(_2552);
    float _2864 = fma(_2608, _2660, _2842);
    int _2866 = ~_2836;
    int _2868 = _2866 + 1;
    int _2870 = _2868 + 1;
    float _2872 = fma(_2860, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2856);
    float _2874 = fma(_2816, _2616, _2864);
    bool _2876 = !_1726;
    int _2878 = _2876 ? 0 : 1;
    bool _2880 = _1878 != 3;
    float _2882 = fma(_2826, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2884 = ~_2862;
    int _2886 = _2884 + 1;
    int _2888 = _2886 + 1;
    int _2890 = _2870 * as_type<int>(_2744);
    bool _2892 = !_2880;
    int _2894 = _2892 ? 0 : (-1);
    float _2896 = _1876 + (-0.5);
    bool _2898 = _2872 >= 0.0;
    int _2900 = _2888 * as_type<int>(_2736);
    int _2902 = _2900 + _2890;
    float _2904 = _1712 + 0.5;
    int _2906 = abs(_2894);
    float _2908 = fma(_2794, _2580, _2874);
    int _2910 = ~_2770;
    int _2912 = _2910 + 1;
    int _2914 = _2912 + 1;
    float _2916 = float(uint(_2854));
    float _2918 = fma(_2512, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2908);
    int _2920 = ~_2906;
    int _2922 = _2920 + 1;
    int _2924 = _2922 + 1;
    int _2926 = _2914 * as_type<int>(_2784);
    int _2928 = _2926 + _2902;
    int _2930 = ~_2774;
    int _2932 = _2930 + 1;
    int _2934 = _2932 + 1;
    float _2936 = fma(_2904, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2110);
    float _2938 = 1.0 / _2916;
    int _2940 = _2924 * as_type<int>(_2792);
    int _2942 = _2940 + _2928;
    float _2944 = -_2896;
    float _2946 = -_2202;
    float _2948 = fma(_2944, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2946);
    float _2950 = -_2150;
    float _2952 = _2950 + 1.0;
    float _2954 = _2284 + 0.5;
    int _2956 = _2942 * _2934;
    float _2958 = -_2112;
    float _2960 = _2958 + 1.0;
    float _2962 = _1884 + (-0.5);
    float _2964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2966 = _2544 * _2774;
    int _2968 = _2966 + _2956;
    float _2970 = -_2960;
    float _2972 = fma(_2970, _1712, _2936);
    float _2974 = _2960;
    if (_2898)
    {
        _2974 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2976 = _2974;
    float _2978 = fma(_2952, _1876, _2948);
    float _2980 = fma(_2954, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2334);
    float _2982 = float(uint(_2968));
    float _2984 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2986 = as_type<int>(_2938) + (-2);
    int _2988 = as_type<int>(_2938);
    if (_2898)
    {
        float _2990 = _2976 * 5.0;
        _2988 = as_type<int>(_2990);
    }
    int _2992 = _2988;
    float _2994 = -_2962;
    float _2996 = -_2196;
    float _2998 = fma(_2994, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2996);
    float _3000 = _1404 + (-0.5);
    out.m_76.x = _2972;
    out.m_76.y = _2978;
    float _3002 = as_type<float>(_2986) * _2982;
    int _3004 = ~_2854;
    int _3006 = _3004 + 1;
    float _3008 = _2964 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3010 = _1660 + 0.5;
    if (_2898)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9386 = as_type<float>(_2992);
        out.gl_Position.z = _9386;
    }
    int _3012 = abs(_2820);
    float _3014 = trunc(_3002);
    float _3016 = precise::max(_3014, 0.0);
    uint _3018 = uint(_3016);
    float _3020 = fma(_3008, _3010, _2234);
    int _3022 = ~_2106;
    int _3024 = _3022 + _2148;
    int _3026 = _3024 + 1;
    out.m_78.x = _2918;
    float _3028 = _2984 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3030 = abs(_2854);
    int _3032 = _2030 >> 31;
    float _3034 = -_3028;
    float _3036 = -_2242;
    float _3038 = fma(_3034, _3000, _3036);
    float _3040 = _2756 * _2756;
    int _3042 = _1682 >> 31;
    int _3044 = _785 * _3026;
    int _3046 = _3044 + _1562;
    float _3048 = float(uint(_3030));
    if (_2898)
    {
        out.m_55.x = 0.0;
    }
    int _3050 = _3042 & 3;
    float _3052 = fma(_2846, _2846, _3040);
    int _3054 = _3032 & 3;
    float _3056 = 1.0 / _3048;
    int _3058 = _2030 + _3054;
    float _3060 = _539 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _3062 = _1682 + _3050;
    float _3064 = fma(_2860, _2860, _3052);
    float _3066 = -_2356;
    float _3068 = _3066 + 1.0;
    int _3070 = _3006 * int(_3018);
    int _3072 = _3070 + _2968;
    int _3074 = _3058 >> 2;
    float _3076 = -_2354;
    float _3078 = _3076 + 1.0;
    int _3080 = _3062 >> 2;
    float _3082 = -_3068;
    float _3084 = fma(_2284, _3082, _2980);
    int _3086 = _3074 << 4;
    int _3088 = _3086 + 800;
    float _3090 = -_2362;
    float _3092 = _3090 + 1.0;
    float _3094 = float(uint(_3072));
    float _3096 = fma(_1884, _3078, _2998);
    int _3098 = abs(_2968);
    float _3100 = -_3092;
    float _3102 = fma(_1660, _3100, _3020);
    int _3104 = _3080 << 4;
    int _3106 = _3104 + 368;
    float _3108 = as_type<float>(_2986) * _3094;
    int _3110 = as_type<int>(_3056) + (-2);
    float _3112 = -_2238;
    float _3114 = _3112 + 1.0;
    uint _3116 = uint(int(uint(_3088) >> uint(2)));
    uint _3118 = uint(int(uint(int(_3116)) >> uint(2)));
    int _3120 = int(_3116) & 3;
    float _3122 = (*spvDescriptorSet0.vp_c9)._m0[int(_3118)][_3120];
    int _3124 = int(_3116) + 1;
    uint _3126 = uint(int(uint(_3124) >> uint(2)));
    int _3128 = _3124 & 3;
    float _3130 = (*spvDescriptorSet0.vp_c9)._m0[int(_3126)][_3128];
    float _3132 = float(uint(_3098));
    float _3134 = rsqrt(_3064);
    float _3136 = fma(_1404, _3114, _3038);
    float _3138 = _3060 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3140 = as_type<float>(_3110) * _3132;
    int _3142 = ~_3030;
    int _3144 = _3142 + 1;
    uint _3146 = uint(int(uint(_3106) >> uint(2)));
    uint _3148 = uint(int(uint(int(_3146)) >> uint(2)));
    int _3150 = int(_3146) & 3;
    float _3152 = (*spvDescriptorSet0.vp_c9)._m0[int(_3148)][_3150];
    int _3154 = int(_3146) + 1;
    uint _3156 = uint(int(uint(_3154) >> uint(2)));
    int _3158 = _3154 & 3;
    float _3160 = (*spvDescriptorSet0.vp_c9)._m0[int(_3156)][_3158];
    float _3162 = float(_3012);
    float _3164 = trunc(_3140);
    float _3166 = precise::max(_3164, 0.0);
    uint _3168 = uint(_3166);
    out.m_80.x = _3084;
    out.m_80.y = _3096;
    out.m_80.z = _3102;
    out.m_80.w = _3136;
    int _3170 = ~_1908;
    int _3172 = _3170 + _1968;
    int _3174 = _3172 + 1;
    float _3176 = _3162 * _2828;
    int _3178 = abs(_1796);
    int _3180 = _3106 + 8;
    uint _3182 = uint(int(uint(_3180) >> uint(2)));
    uint _3184 = uint(int(uint(int(_3182)) >> uint(2)));
    int _3186 = int(_3182) & 3;
    float _3188 = (*spvDescriptorSet0.vp_c9)._m0[int(_3184)][_3186];
    int _3190 = int(_3182) + 1;
    uint _3192 = uint(int(uint(_3190) >> uint(2)));
    int _3194 = _3190 & 3;
    float _3196 = (*spvDescriptorSet0.vp_c9)._m0[int(_3192)][_3194];
    int _3198 = abs(_2082);
    float _3200 = trunc(_3108);
    float _3202 = precise::max(_3200, 0.0);
    uint _3204 = uint(_3202);
    int _3206 = _735 * _3174;
    int _3208 = _3206 + _1214;
    int _3210 = abs(_2878);
    float _3212 = _3138 * _3134;
    int _3214 = ~_3198;
    int _3216 = _3214 + 1;
    int _3218 = _3216 + 1;
    int _3220 = abs(_1928);
    int _3222 = _3088 + 8;
    uint _3224 = uint(int(uint(_3222) >> uint(2)));
    uint _3226 = uint(int(uint(int(_3224)) >> uint(2)));
    int _3228 = int(_3224) & 3;
    float _3230 = (*spvDescriptorSet0.vp_c9)._m0[int(_3226)][_3228];
    int _3232 = int(_3224) + 1;
    uint _3234 = uint(int(uint(_3232) >> uint(2)));
    int _3236 = _3232 & 3;
    float _3238 = (*spvDescriptorSet0.vp_c9)._m0[int(_3234)][_3236];
    int _3240 = _3144 * int(_3168);
    int _3242 = _3240 + _3098;
    float _3244 = _2756 * _3212;
    int _3246 = ~_2854;
    int _3248 = _3246 + 1;
    float _3250 = _2846 * _3212;
    float _3252 = float(uint(_3242));
    float _3254 = -_3244;
    float _3256 = _2756 + _3254;
    bool _3258 = !_2046;
    int _3260 = _3258 ? 0 : 1;
    float _3262 = -_3250;
    float _3264 = _2846 + _3262;
    int _3266 = int(_3018) + int(_3204);
    float _3268 = as_type<float>(_3110) * _3252;
    int _3270 = ~_3178;
    int _3272 = _3270 + 1;
    int _3274 = _3272 + 1;
    float _3276 = _3256 * _3256;
    bool _3278 = _1724 != 3;
    float _3280 = trunc(_3268);
    float _3282 = precise::max(_3280, 0.0);
    uint _3284 = uint(_3282);
    int _3286 = _3248 * _3266;
    int _3288 = _3286 + _2968;
    bool _3290 = _735 == 0;
    float _3292 = _1088 + (-0.5);
    bool _3294 = !_1466;
    int _3296 = _3294 ? _3046 : (-1);
    float _3298 = _2860 * _3212;
    bool _3300 = !_3290;
    int _3302 = _3300 ? _3208 : (-1);
    float _3304 = fma(_3264, _3264, _3276);
    int _3306 = _3218 * as_type<int>(_3130);
    int _3308 = abs(_3260);
    float _3310 = -_3298;
    float _3312 = _2860 + _3310;
    int _3314 = ~_3308;
    int _3316 = _3314 + 1;
    int _3318 = _3316 + 1;
    int _3320 = ~_3210;
    int _3322 = _3320 + 1;
    int _3324 = _3322 + 1;
    int _3326 = _3274 * as_type<int>(_3160);
    bool _3328 = !_3278;
    int _3330 = _3328 ? 0 : (-1);
    int _3332 = _3318 * as_type<int>(_3122);
    int _3334 = _3332 + _3306;
    bool _3336 = uint(_3288) >= uint(_2854);
    int _3338 = _3324 * as_type<int>(_3152);
    int _3340 = _3338 + _3326;
    int _3342 = ~_3030;
    int _3344 = _3342 + 1;
    int _3346 = int(_3168) + int(_3284);
    bool _3348 = !_3336;
    int _3350 = _3348 ? 0 : (-1);
    int _3352 = abs(_2134);
    int _3354 = _3344 * _3346;
    int _3356 = _3354 + _3098;
    bool _3358 = _2044 != 3;
    int _3360 = ~_3266;
    int _3362 = _3360 + _3350;
    int _3364 = _3362 + 1;
    int _3366 = ~_3352;
    int _3368 = _3366 + 1;
    int _3370 = _3368 + 1;
    int _3372 = abs(_1854);
    bool _3374 = !_3358;
    int _3376 = _3374 ? 0 : (-1);
    int _3378 = _3370 * as_type<int>(_3230);
    int _3380 = _3378 + _3334;
    bool _3382 = uint(_3356) >= uint(_3030);
    int _3384 = _2854 * _3364;
    int _3386 = _3384 + _2968;
    int _3388 = abs(_3330);
    int _3390 = ~_3372;
    int _3392 = _3390 + 1;
    int _3394 = _3392 + 1;
    int _3396 = _2968 ^ _2854;
    int _3398 = abs(_3376);
    int _3400 = _3394 * as_type<int>(_3188);
    int _3402 = _3400 + _3340;
    float _3404 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3406 = !_3382;
    int _3408 = _3406 ? 0 : (-1);
    int _3410 = ~_3388;
    int _3412 = _3410 + 1;
    int _3414 = _3412 + 1;
    uint _3416 = uint(int(uint(_3396) >> uint(31)));
    bool _3418 = _2854 == 0;
    int _3420 = _3414 * as_type<int>(_3196);
    int _3422 = _3420 + _3402;
    int _3424 = ~_3408;
    int _3426 = _3346 + _3424;
    int _3428 = _3426 + 1;
    int _3430 = ~int(_3416);
    int _3432 = _3430 + 1;
    float _3434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3436 = abs(_2034);
    int _3438 = ~_3398;
    int _3440 = _3438 + 1;
    int _3442 = _3440 + 1;
    bool _3444 = !_3418;
    int _3446 = _3444 ? _3386 : (-1);
    int _3448 = _3442 * as_type<int>(_3238);
    int _3450 = _3448 + _3380;
    int _3452 = _3428 ^ _3432;
    int _3454 = ~_3220;
    int _3456 = _3454 + 1;
    int _3458 = _3456 + 1;
    float _3460 = in.m_82.x;
    float _3462 = in.m_82.y;
    float _3464 = in.m_82.z;
    bool _3466 = _2854 == 0;
    int _3468 = ~_3432;
    int _3470 = _3468 + _3452;
    int _3472 = _3470 + 1;
    int _3474 = _3422 * _3458;
    float _3476 = float(_3446);
    float _3478 = _3404 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3480 = ~_3436;
    int _3482 = _3480 + 1;
    int _3484 = _3482 + 1;
    int _3486 = _3302 * _3220;
    int _3488 = _3486 + _3474;
    bool _3490 = !_3466;
    int _3492 = _3490 ? _3472 : (-1);
    float _3494 = fma(_3478, _3476, _2366);
    float _3496 = _1058 + 0.5;
    int _3498 = _3450 * _3484;
    float _3500 = float(_3492);
    float _3502 = _3434 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3504 = fma(_3478, _3496, _3494);
    int _3506 = _3296 * _3436;
    int _3508 = _3506 + _3498;
    float _3510 = -_2314;
    float _3512 = fma(_3502, _3500, _3510);
    float _3514 = -_2824;
    float _3516 = fma(_1058, _3514, _3504);
    float _3518 = -_2358;
    float _3520 = _3518 + 1.0;
    float _3522 = _3176 * (-2.0);
    float _3524 = -_3502;
    float _3526 = fma(_3524, _3292, _3512);
    float _3528 = float(_3488);
    float _3530 = float(_3508);
    float _3532 = fma(_1088, _3520, _3526);
    float _3534 = fma(_3522, _3460, _3460);
    bool _3536 = !_2574;
    int _3538 = _3536 ? 0 : 1;
    out.m_84.x = _3528;
    float _3540 = fma(_2882, _3522, _2882);
    bool _3542 = !_2578;
    int _3544 = _3542 ? 0 : 1;
    out.m_84.w = _3530;
    int _3546 = abs(_3538);
    out.m_86.x = _3516;
    out.m_86.y = _3532;
    float _3548 = _3464;
    if (_2898)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3550 = -_3244;
    float _3552 = _2682 + _3550;
    float _3554 = float(_2430);
    float _3556 = -_3250;
    float _3558 = _2830 + _3556;
    float _3560 = float(_3546);
    float _3562 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3564 = _3552 + _3562;
    float _3566 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3568 = _3558 + _3566;
    float _3570 = _2804 + (-1.0);
    float _3572 = _3564 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3574 = -_3298;
    float _3576 = _2838 + _3574;
    float _3578 = _3560 * _3554;
    int _3580 = abs(_3544);
    float _3582 = fma(_3568, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3572);
    float _3584 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3586 = _3576 + _3584;
    float _3588 = float(_2562);
    float _3590 = fma(_3570, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3592 = float(_3580);
    float _3594 = fma(_3586, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3582);
    float _3596 = _3578 * (-2.0);
    float _3598 = fma(_3312, _3312, _3304);
    float _3600 = _3592 * _3588;
    float _3602 = fma(_3596, _3462, _3462);
    bool _3604 = _3594 >= 0.0;
    float _3606 = fma(_3590, _3596, _3590);
    float _3608 = _900 + (-0.5);
    float _3610 = fma(_2850, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3602);
    float _3612 = _3600 * (-2.0);
    float _3614 = _2834 + (-1.0);
    float _3616 = fma(_2840, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3534);
    float _3618 = fma(_3606, _2372, _3610);
    float _3620 = fma(_3612, _3464, _3464);
    float _3622 = fma(_3614, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3624 = sqrt(_3598);
    float _3626 = _3618 * 0.15915493667125701904296875;
    float _3628 = fma(_3608, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3620);
    if (_3604)
    {
        _3548 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3630 = _3548;
    float _3632 = fma(_3540, _2372, _3616);
    float _3634 = fma(_3622, _3612, _3622);
    int _3636 = as_type<int>(_3630);
    if (_3604)
    {
        out.m_55.x = 0.0;
    }
    float _3638 = _3626 * 6.283185482025146484375;
    float _3640 = sin(_3638);
    if (_3604)
    {
        float _3642 = _3630 * 5.0;
        _3636 = as_type<int>(_3642);
    }
    int _3644 = _3636;
    float _3646 = _3632 * 0.15915493667125701904296875;
    float _3648 = fma(_3634, _2372, _3628);
    if (_3604)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10310 = as_type<float>(_3644);
        out.gl_Position.z = _10310;
    }
    float _3650 = _3626 * 6.283185482025146484375;
    float _3652 = cos(_3650);
    float _3654 = _3646 * 6.283185482025146484375;
    float _3656 = sin(_3654);
    float _3658 = _3646 * 6.283185482025146484375;
    float _3660 = cos(_3658);
    float _3662 = _3648 * 0.15915493667125701904296875;
    if (_3604)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3664 = _3662 * 6.283185482025146484375;
    float _3666 = cos(_3664);
    float _3668 = _3134 * _3624;
    float _3670 = _537 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3672 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _223);
    float _3674 = _3660 * _3652;
    float _3676 = _3060 * _3668;
    float _3678 = _3668 * _3670;
    float _3680 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _219);
    float _3682 = _3662 * 6.283185482025146484375;
    float _3684 = sin(_3682);
    float _3686 = _3660 * _3640;
    float _3688 = _3672 * _3678;
    float _3690 = _3656 * _3640;
    float _3692 = _3656 * _3652;
    float _3694 = _3680 * _3676;
    float _3696 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3698 = _3660 * _3666;
    float _3700 = _3652 * _3666;
    float _3702 = _3656 * _3666;
    float _3704 = _3640 * _3666;
    float _3706 = _3698 * _3688;
    float _3708 = _3668 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3710 = _3708 * 0.5;
    float _3712 = fma(_3684, _3674, _3690);
    float _3714 = -_3692;
    float _3716 = fma(_3684, _3686, _3714);
    float _3718 = -_3688;
    float _3720 = _3684 * _3718;
    float _3722 = -_3686;
    float _3724 = fma(_3684, _3692, _3722);
    float _3726 = fma(_3712, _3694, _3706);
    float _3728 = _3702 * _3688;
    float _3730 = fma(_3700, _3694, _3720);
    float _3732 = fma(_3684, _3690, _3674);
    float _3734 = fma(_3716, _3710, _3726);
    float _3736 = fma(_3724, _3694, _3728);
    float _3738 = fma(_3704, _3710, _3730);
    float _3740 = _3734 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3742 = _3734 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3744 = fma(_3732, _3710, _3736);
    float _3746 = _3734 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3748 = fma(_3738, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3740);
    float _3750 = fma(_3738, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3742);
    float _3752 = _3712 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3754 = _3712 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3756 = fma(_3744, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3748);
    float _3758 = fma(_3744, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3750);
    float _3760 = fma(_3738, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3746);
    float _3762 = fma(_3700, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3754);
    float _3764 = _3756 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3766 = _3758 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3768 = fma(_3744, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3760);
    float _3770 = fma(_3696, _3696, 1.0);
    float _3772 = _2830 + _3764;
    float _3774 = _2838 + _3766;
    float _3776 = _3712 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3778 = fma(_3700, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3752);
    float _3780 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3782 = _3772 + _3780;
    float _3784 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3786 = _3774 + _3784;
    float _3788 = fma(_3700, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3776);
    float _3790 = _3698 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3792 = _3782 * _3782;
    float _3794 = _3786 * _3786;
    float _3796 = _3698 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3798 = _3698 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3800 = _3768 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3802 = _3792 + _3794;
    float _3804 = -_3684;
    float _3806 = fma(_3804, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3790);
    float _3808 = -_3684;
    float _3810 = fma(_3808, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3796);
    float _3812 = -_3684;
    float _3814 = fma(_3812, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3798);
    float _3816 = sqrt(_3802);
    float _3818 = _3716 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3820 = _3716 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3822 = _3716 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3824 = _2682 + _3800;
    float _3826 = fma(_3704, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3818);
    float _3828 = fma(_3704, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3820);
    float _3830 = fma(_3704, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3822);
    float _3832 = rsqrt(_3770);
    bool _3834 = _3816 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3836 = _3704;
    float _3838 = _3790;
    float _3840 = _3820;
    float _3842 = _3770;
    float _3844 = _3818;
    if (!_3834)
    {
        _3836 = _3794;
    }
    float _3846 = _3836;
    float _3848 = _3846;
    if (!_3834)
    {
        _3838 = _3792;
    }
    float _3850 = _3838;
    float _3852 = _3850;
    if (!_3834)
    {
        _3840 = _3772;
    }
    float _3854 = _3840;
    float _3856 = _3854;
    if (!_3834)
    {
        _3842 = _3774;
    }
    float _3858 = _3842;
    float _3860 = _3858;
    if (!_3834)
    {
        _3844 = _3824;
    }
    float _3862 = _3844;
    bool _3864 = !_3834;
    float _3866 = _3862;
    if (!_3864)
    {
        float _3868 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3870 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3872 = _3816 + _3870;
        float _3874 = rsqrt(_3802);
        float _3876 = _3872 * _3868;
        float _3878 = _3824 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3880 = _3876 * 0.15915493667125701904296875;
        float _3882 = _3880 * 6.283185482025146484375;
        float _3884 = sin(_3882);
        float _3886 = _3880 * 6.283185482025146484375;
        float _3888 = cos(_3886);
        float _3890 = fma(_3884, _3878, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3892 = _3874 * _3890;
        float _3894 = _3888 + (-1.0);
        float _3896 = fma(_3782, _3892, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3898 = fma(_3786, _3892, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3900 = _3894 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3902 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3904 = _3896 + _3902;
        float _3906 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3908 = _3898 + _3906;
        float _3910 = fma(_3824, _3888, _3900);
        float _3912 = _3904 * _3904;
        float _3914 = _3908 * _3908;
        _3866 = _3910;
        _3852 = _3912;
        _3848 = _3914;
        _3856 = _3896;
        _3860 = _3898;
    }
    float _3916 = _3866;
    float _3918 = _3852;
    float _3920 = _3848;
    float _3922 = _3856;
    float _3924 = _3860;
    float _3926 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3928 = _3916 + _3926;
    float _3930 = fma(_3702, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3806);
    float _3932 = fma(_3702, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3810);
    float _3934 = fma(_3702, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3814);
    float _3936 = fma(_3928, _3928, _3918);
    float _3938 = fma(_3732, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3828);
    float _3940 = fma(_3732, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3826);
    float _3942 = fma(_3732, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3830);
    float _3944 = _3936 + _3920;
    float _3946 = fma(_3724, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3788);
    float _3948 = _3696 * _3832;
    float _3950 = fma(_3724, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3778);
    float _3952 = _219 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3954 = _3696 * _3930;
    float _3956 = _3696 * _3932;
    float _3958 = fma(_3724, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3762);
    float _3960 = _3696 * _3934;
    float _3962 = -_3940;
    float _3964 = _3948 * _3962;
    float _3966 = -_3938;
    float _3968 = _3948 * _3966;
    float _3970 = -_3942;
    float _3972 = _3948 * _3970;
    float _3974 = sqrt(_3944);
    float _3976 = fma(_3952, _3946, _3954);
    float _3978 = fma(_3952, _3950, _3956);
    float _3980 = fma(_3952, _3958, _3960);
    float _3982 = fma(_3832, _3930, _3964);
    float _3984 = fma(_3832, _3932, _3968);
    float _3986 = fma(_3832, _3934, _3972);
    float _3988 = _3940 + _3976;
    float _3990 = _3938 + _3978;
    float _3992 = _3942 + _3980;
    out.m_88.x = _3946;
    out.m_88.y = _3950;
    out.m_88.z = _3958;
    out.m_90.x = _3982;
    out.m_90.y = _3984;
    out.m_90.z = _3986;
    bool _3994 = _3974 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3996 = isnan(_3974);
    bool _3998 = _3994 || _3996;
    bool _4000 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4002 = _3998 || _4000;
    out.m_92.x = _3988;
    out.m_92.y = _3990;
    out.m_92.z = _3992;
    float _4004 = _3978;
    float _4006 = _3958;
    if (!_4002)
    {
        _4004 = 1.0;
    }
    float _4008 = _4004;
    bool _4010 = !_4002;
    float _4012 = _4008;
    if (!_4010)
    {
        bool _4014 = _3974 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4016 = isnan(_3974);
        bool _4018 = _4014 || _4016;
        bool _4020 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4022 = _4018 || _4020;
        if (!_4022)
        {
            float _4024 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4026 = _3974 + _4024;
            float _4028 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4030 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4028;
            float _4032 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4034 = _4032 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4036 = 1.0 / _4030;
            float _4038 = _4026 * _4036;
            float _4040 = fma(_4038, _4034, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4012 = _4040;
            _4042 = true;
        }
        else
        {
            bool _4044 = _3974 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4046 = isnan(_3974);
            bool _4048 = _4044 || _4046;
            bool _4050 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4052 = _4048 || _4050;
            if (!_4052)
            {
                float _4054 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4056 = _3974 + _4054;
                float _4058 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4060 = _4058 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4062 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4064 = _4062 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4066 = 1.0 / _4060;
                float _4068 = _4056 * _4066;
                float _4070 = fma(_4068, _4064, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4012 = _4070;
                _4042 = true;
            }
            else
            {
                _4012 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4042 = false;
    float _4072 = _4012;
    float _4074 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4076 = _3916 + _4074;
    float _4078 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4080 = _3922 + _4078;
    float _4082 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4084 = _3924 + _4082;
    float _4086 = fma(_4076, _4072, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4088 = fma(_4080, _4072, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4090 = -_2682;
    float _4092 = _4090 + _4086;
    float _4094 = fma(_4084, _4072, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4096 = -_2830;
    float _4098 = _4096 + _4088;
    float _4100 = _4092 * _4092;
    float _4102 = -_2838;
    float _4104 = _4102 + _4094;
    float _4106 = fma(_4098, _4098, _4100);
    float _4108 = fma(_4104, _4104, _4106);
    float _4110 = sqrt(_4108);
    bool _4112 = _4110 > 0.0;
    float _4114 = _4110;
    float _4116 = _4076;
    float _4118 = _4084;
    float _4120 = _4092;
    float _4122 = _4094;
    if (!_4112)
    {
        _4114 = _4088;
    }
    float _4124 = _4114;
    float _4126 = _4124;
    if (!_4112)
    {
        _4116 = _4086;
    }
    float _4128 = _4116;
    float _4130 = _4128;
    float _4132 = _4128;
    if (!_4112)
    {
        _4118 = _4094;
    }
    float _4134 = _4118;
    bool _4136 = !_4112;
    float _4138 = _4134;
    if (!_4136)
    {
        float _4140 = _239 * _239;
        float _4142 = fma(_235, _235, _4140);
        float _4144 = fma(_241, _241, _4142);
        float _4146 = rsqrt(_4108);
        float _4148 = sqrt(_4144);
        float _4150 = _4098 * _4146;
        float _4152 = _4092 * _4146;
        float _4154 = _4104 * _4146;
        bool _4156 = _4148 > 0.0;
        float _4158 = _4146;
        float _4160 = _4148;
        _4006 = _4152;
        if (!_4156)
        {
            _4158 = _4088;
        }
        float _4162 = _4158;
        _4126 = _4162;
        if (!_4156)
        {
            _4130 = _4086;
        }
        float _4164 = _4130;
        _4132 = _4164;
        if (!_4156)
        {
            _4160 = _4094;
        }
        float _4166 = _4160;
        bool _4168 = !_4156;
        _4138 = _4166;
        if (!_4168)
        {
            float _4170 = rsqrt(_4144);
            float _4172 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4174 = _239 * _4170;
            float _4176 = _235 * _4170;
            float _4178 = _241 * _4170;
            float _4180 = _4152 * _4174;
            float _4182 = fma(_4150, _4176, _4180);
            float _4184 = _4172 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4186 = fma(_4154, _4178, _4182);
            float _4188 = _4186 * _4184;
            float _4190 = fma(_235, _4188, _4088);
            float _4192 = fma(_239, _4188, _4086);
            float _4194 = fma(_241, _4188, _4094);
            _4132 = _4192;
            _4126 = _4190;
            _4138 = _4194;
            _4120 = _4188;
        }
    }
    float _4196 = _4132;
    float _4198 = _4126;
    float _4200 = _4138;
    float _4202 = _4120;
    float _4204 = _4006;
    float _4206 = -_3244;
    float _4208 = _4206 + _4196;
    float _4210 = -_3250;
    float _4212 = _4210 + _4198;
    float _4214 = -_3298;
    float _4216 = _4214 + _4200;
    float _4218 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4220 = _4208 + _4218;
    float _4222 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4224 = _4212 + _4222;
    float _4226 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4228 = _4216 + _4226;
    float _4230 = _4220 * _4220;
    float _4232 = fma(_3558, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4234 = fma(_4224, _4224, _4230);
    float _4236 = floor(_4232);
    float _4238 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4240 = fma(_4228, _4228, _4234);
    float _4242 = rsqrt(_4240);
    float _4244 = sqrt(_4240);
    float _4246 = _4242 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4248 = _4224 * _4246;
    float _4250 = _4228 * _4246;
    float _4252 = _4248 * _4248;
    float _4254 = _4250 * _4250;
    float _4256 = _4252 + _4254;
    float _4258 = sqrt(_4256);
    bool _4260 = _4258 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4262 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4264 = _4258 + _4262;
    float _4266 = _4228;
    float _4268 = _4256;
    float _4270 = _4264;
    float _4272 = _4220;
    float _4274 = _4204;
    if (_4260)
    {
        float _4276 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4266 = _4276;
    }
    float _4278 = _4266;
    if (_4260)
    {
        float _4280 = rsqrt(_4256);
        _4268 = _4280;
    }
    float _4282 = _4268;
    float _4284 = _4282;
    if (_4260)
    {
        float _4286 = _4264 * _4278;
        _4270 = _4286;
    }
    float _4288 = _4270;
    if (_4260)
    {
        float _4290 = _4288 * 0.15915493667125701904296875;
        _4122 = _4290;
    }
    float _4292 = _4122;
    float _4294 = _4278;
    float _4296 = _4292;
    if (_4260)
    {
        float _4298 = _4292 * 6.283185482025146484375;
        float _4300 = sin(_4298);
        _4294 = _4300;
    }
    float _4302 = _4294;
    float _4304 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4306 = precise::max(0.0, _4304);
    float _4308 = _4202;
    float _4310 = _4306;
    if (_4260)
    {
        float _4312 = _4292 * 6.283185482025146484375;
        float _4314 = cos(_4312);
        _4308 = _4314;
    }
    float _4316 = _4308;
    float _4318 = -_4246;
    float _4320 = -_4306;
    float _4322 = fma(_4220, _4318, _4320);
    if (!_4260)
    {
        _4272 = _4248;
    }
    float _4324 = _4272;
    float _4326 = _4324;
    if (_4260)
    {
        float _4328 = _4322 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4310 = _4328;
    }
    float _4330 = _4310;
    float _4332 = _4302;
    float _4334 = _4330;
    if (_4260)
    {
        float _4336 = fma(_4302, _4330, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4332 = _4336;
    }
    float _4338 = _4332;
    float _4340 = _4338;
    float _4342 = _4316;
    if (_4260)
    {
        float _4344 = _4316 + (-1.0);
        _4334 = _4344;
    }
    float _4346 = _4334;
    float _4348 = _4346;
    if (_4260)
    {
        float _4350 = _4282 * _4338;
        _4274 = _4350;
    }
    float _4352 = _4274;
    if (!_4260)
    {
        _4340 = _4322;
    }
    float _4354 = _4340;
    float _4356 = _4354;
    if (_4260)
    {
        float _4358 = _4346 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4296 = _4358;
    }
    float _4360 = _4296;
    if (_4260)
    {
        float _4362 = _4248 * _4352;
        _4326 = _4362;
    }
    float _4364 = _4326;
    if (!_4260)
    {
        _4348 = _4250;
    }
    float _4366 = _4348;
    float _4368 = _4366;
    if (_4260)
    {
        float _4370 = _4250 * _4352;
        _4368 = _4370;
    }
    float _4372 = _4368;
    if (!_4260)
    {
        _4284 = _4252;
    }
    float _4374 = _4284;
    float _4376 = _4374;
    if (_4260)
    {
        float _4378 = fma(_4322, _4316, _4360);
        _4356 = _4378;
    }
    float _4380 = _4356;
    if (_4260)
    {
        float _4382 = _4364 * _4364;
        _4376 = _4382;
    }
    float _4384 = _4376;
    if (!_4260)
    {
        _4342 = _4254;
    }
    float _4386 = _4342;
    float _4388 = _4386;
    if (_4260)
    {
        float _4390 = _4372 * _4372;
        _4388 = _4390;
    }
    float _4392 = _4388;
    float _4394 = fma(_4380, _4380, _4384);
    float _4396 = _4208 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4398 = _4208 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4400 = _4394 + _4392;
    float _4402 = _4208 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4404 = fma(_3576, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4406 = fma(_4212, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4396);
    float _4408 = fma(_4212, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4398);
    float _4410 = fma(_4212, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4402);
    float _4412 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4414 = fma(_4244, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4412);
    float _4416 = precise::clamp(_4414, 0.0, 1.0);
    float _4418 = rsqrt(_4400);
    float _4420 = fma(_4216, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4406);
    float _4422 = fma(_4216, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4410);
    float _4424 = -_4416;
    float _4426 = _4424 + 1.0;
    float _4428 = _4208 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4430 = _4420 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4432 = _4422 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4434 = fma(_4216, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4408);
    float _4436 = fma(_4212, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4428);
    float _4438 = abs(_4426);
    float _4440 = log2(_4438);
    float _4442 = _4430 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4444 = _4434 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4446 = fma(_4216, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4436);
    float _4448 = fma(_4432, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4442);
    float _4450 = _4444 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4452 = _4418 * _4364;
    float _4454 = _4418 * _4380;
    float _4456 = _4418 * _4372;
    float _4458 = -_4450;
    float _4460 = fma(_4458, _4238, 1.0);
    float _4462 = _4452 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4464 = _4446 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4466 = fma(_4444, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4448);
    float _4468 = -_4236;
    float _4470 = _4232 + _4468;
    float _4472 = -_4462;
    float _4474 = fma(_4454, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4472);
    float _4476 = _4440 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4478 = fma(_4464, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4466);
    float _4480 = log2(_4460);
    float _4482 = -_4456;
    float _4484 = fma(_4482, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4474);
    float _4486 = _4430 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4488 = _4430 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4490 = fma(_4484, -0.5, 0.5);
    float _4492 = fma(_4484, 0.5, 0.5);
    float _4494 = fma(_4432, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4486);
    float _4496 = exp2(_4476);
    float _4498 = fma(_4432, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4488);
    float _4500 = _4454 + 1.0;
    float _4502 = fma(_4444, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4494);
    float _4504 = fma(_4492, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4506 = fma(_4444, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4498);
    float _4508 = 1.0 / _4478;
    float _4510 = fma(_4492, _4504, -0.212114393711090087890625);
    float _4512 = _4480 * 0.693147182464599609375;
    float _4514 = fma(_4492, _4510, 1.570728778839111328125);
    float _4516 = _4512 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4518 = sqrt(_4490);
    float _4520 = -_4454;
    float _4522 = fma(_4496, _4500, _4520);
    float _4524 = fma(_4464, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4502);
    float _4526 = fma(_4464, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4506);
    float _4528 = fma(_4522, 0.5, 0.5);
    float _4530 = floor(_4404);
    float _4532 = _4524 * _4508;
    float _4534 = _4526 * _4508;
    float _4536 = fma(_4532, 0.5, 0.5);
    float _4538 = fma(_4534, -0.5, 0.5);
    float _4540 = _4518 * 0.636619746685028076171875;
    float _4542 = -_4514;
    float _4544 = fma(_4540, _4542, 1.0);
    float _4546 = -_4530;
    float _4548 = _4404 + _4546;
    float2 _11820 = float2(_4470, _4548);
    float _4550 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11820, float2(0.0), isnan(_11820)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11820, float2(0.0), isnan(_11820)), level(0.0)).x;
    float3 _11831 = float3(_4536, _4538, _4516);
    float _4552 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11831, float3(0.0), isnan(_11831)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11831, float3(0.0), isnan(_11831)), level(0.0)).x;
    float3 _11842 = float3(_4536, _4538, _4516);
    float4 _4555 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11842, float3(0.0), isnan(_11842)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11842, float3(0.0), isnan(_11842)), level(0.0)).xyzw;
    float _4557 = _4555.x;
    float _4559 = _4555.y;
    float _4561 = _4555.z;
    float _4563 = _4555.w;
    float2 _11858 = float2(_4544, _4528);
    float3 _4567 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11858, float2(0.0), isnan(_11858)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11858, float2(0.0), isnan(_11858)), level(0.0)).xyz;
    float _4569 = _4567.x;
    float _4571 = _4567.y;
    float _4573 = _4567.z;
    float _4575 = _3552 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4577 = _3552 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4579 = _4430 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4581 = fma(_3558, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4575);
    float _4583 = fma(_3558, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4577);
    float _4585 = fma(_4432, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4579);
    float _4587 = fma(_3576, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4581);
    float _4589 = fma(_3576, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4583);
    float _4591 = _4587 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4593 = _4589 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4595 = in.m_94.x;
    float _4597 = 1.0 / _4591;
    float _4599 = _4593 + _4591;
    float _4601 = fma(_4444, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4585);
    float _4603 = _4524 + _4478;
    float _4605 = _4603 * 0.5;
    float _4607 = _4599 * _4597;
    float _4609 = _4607 * 0.5;
    float _4611 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4613 = fma(_4609, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4611);
    float _4615 = 1.0 / _4613;
    float _4617 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4619 = _4615 * _4617;
    float _4621 = abs(_4619);
    float _4623 = log2(_4621);
    bool _4625 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4627 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4629 = _4625 || _4627;
    bool _4631 = isnan(0.5);
    bool _4633 = _4629 || _4631;
    bool _4635 = _4619 <= 8000.0;
    bool _4637 = isnan(_4619);
    bool _4639 = _4635 || _4637;
    bool _4641 = isnan(8000.0);
    bool _4643 = _4639 || _4641;
    float _4645 = float(_4643);
    float _4647 = _4623 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4649 = exp2(_4647);
    float _4651 = fma(_4649, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4653 = precise::clamp(_4651, 0.0, 1.0);
    float _4655 = fma(_4464, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4601);
    float _4657 = fma(_4653, -2.0, 3.0);
    float _4659 = _4653 * _4653;
    float _4661 = _4440 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4663 = _4655 + _4478;
    float _4665 = _4659 * _4657;
    float _4667 = exp2(_4661);
    float _4669 = _4663 * 0.5;
    float _4671 = -_4665;
    float _4673 = _4671 + 1.0;
    float _4675 = fma(_4673, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4665);
    float _4677 = _4645 * _4675;
    float _4679 = _4478 * 0.5;
    float _4681 = _4645;
    float _4683 = _4478;
    float _4685 = _4655;
    float _4687 = _4526;
    float _4689 = _4524;
    if (_4633)
    {
        _4681 = 1.0;
    }
    float _4691 = _4681;
    float _4693 = fma(_4526, -0.5, _4679);
    float _4695 = _4691;
    float _4697 = _4559;
    if (!_4633)
    {
        float _4699 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4701 = _4699 * 0.15915493667125701904296875;
        float _4703 = _4701 * 6.283185482025146484375;
        float _4705 = cos(_4703);
        float _4707 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4709 = _4707 * 0.15915493667125701904296875;
        float _4711 = _4701 * 6.283185482025146484375;
        float _4713 = sin(_4711);
        float _4715 = 1.0 / _4705;
        float _4717 = _4709 * 6.283185482025146484375;
        float _4719 = cos(_4717);
        float _4721 = _4713 * _4715;
        float _4723 = _4709 * 6.283185482025146484375;
        float _4725 = sin(_4723);
        float _4727 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4729 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4727;
        float _4731 = _4719 * _4721;
        float _4733 = 1.0 / _4729;
        float _4735 = 1.0 / _4731;
        float _4737 = _4725 * _4735;
        float _4739 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4741 = fma(_4619, _4737, _4739);
        float _4743 = _4741 * _4733;
        float _4745 = precise::clamp(_4743, 0.0, 1.0);
        _4695 = _4745;
    }
    float _4747 = _4695;
    float _4749 = _4677 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4751 = -_4667;
    float _4753 = _4751 + 1.0;
    float _4755 = -_4550;
    float _4757 = _4755 + 1.0;
    out.m_96.x = _4605;
    out.m_96.y = _4693;
    out.m_96.z = _4669;
    out.m_96.w = _4478;
    float _4759 = _4753 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4761 = _4757 * _4749;
    float _4763 = precise::clamp(_4761, 0.0, 1.0);
    bool _4765 = _4244 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4767 = isnan(_4244);
    bool _4769 = _4765 || _4767;
    bool _4771 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4773 = _4769 || _4771;
    float _4775 = _4759 * _4552;
    float _4777 = -_4763;
    float _4779 = fma(_4777, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4781 = -_4759;
    float _4783 = _4781 + 1.0;
    out.gl_Position.x = _4524;
    out.gl_Position.y = _4526;
    out.gl_Position.z = _4655;
    out.gl_Position.w = _4478;
    float _4785 = _4563 * _4775;
    float _4787 = _4779 * _4595;
    float _4789 = _4573 * _4775;
    float _4791 = fma(_4569, _4785, _4557);
    float _4793 = fma(_4571, _4785, _4559);
    float _4795 = _4787 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4797 = _4563 * _4783;
    float _4799 = fma(_4563, _4789, _4561);
    float _4801 = _4747 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4803 = _4775;
    if (!_4773)
    {
        _4697 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4805 = _4697;
    out.m_98.x = _4795;
    float _4807 = _4805;
    float _4809 = _4805;
    if (!_4773)
    {
        _4803 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4811 = _4803;
    float _4813 = _4811;
    float _4815 = _4811;
    if (!_4773)
    {
        _4683 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4817 = _4683;
    out.m_100.x = _4791;
    out.m_100.y = _4793;
    out.m_100.z = _4799;
    out.m_100.w = _4797;
    float _4819 = _4817;
    float _4821 = _4817;
    if (!_4773)
    {
        _4685 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4823 = _4685;
    float _4825 = _4823;
    float _4827 = _4823;
    if (!_4773)
    {
        _4687 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4829 = _4687;
    float _4831 = _4829;
    float _4833 = _4829;
    if (!_4773)
    {
        _4689 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4835 = _4689;
    bool _4837 = !_4773;
    float _4839 = _4835;
    float _4841 = _4835;
    if (!_4837)
    {
        bool _4843 = _4244 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4845 = isnan(_4244);
        bool _4847 = _4843 || _4845;
        bool _4849 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4851 = _4847 || _4849;
        if (!_4851)
        {
            float _4853 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4855 = _4244 + _4853;
            float _4857 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4859 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4857;
            float _4861 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4863 = _4861 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4865 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4867 = _4865 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4869 = 1.0 / _4859;
            float _4871 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4873 = _4871 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4875 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4877 = _4875 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4879 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4881 = _4879 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4883 = _4855 * _4869;
            float _4885 = precise::clamp(_4883, 0.0, 1.0);
            float _4887 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4889 = _4887 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4891 = fma(_4885, _4863, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4893 = fma(_4885, _4867, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4895 = fma(_4885, _4889, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4897 = fma(_4885, _4873, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4899 = fma(_4885, _4877, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4901 = fma(_4885, _4881, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4833 = _4891;
            _4815 = _4899;
            _4827 = _4893;
            _4809 = _4897;
            _4841 = _4895;
            _4821 = _4901;
            _4903 = true;
        }
        else
        {
            bool _4905 = _4244 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4907 = isnan(_4244);
            bool _4909 = _4905 || _4907;
            bool _4911 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4913 = _4909 || _4911;
            if (!_4913)
            {
                _4807 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4915 = _4807;
            _4809 = _4915;
            if (!_4913)
            {
                _4813 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4917 = _4813;
            _4815 = _4917;
            if (!_4913)
            {
                _4819 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4919 = _4819;
            _4821 = _4919;
            if (!_4913)
            {
                _4825 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4921 = _4825;
            _4827 = _4921;
            if (!_4913)
            {
                _4831 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4923 = _4831;
            _4833 = _4923;
            if (!_4913)
            {
                _4839 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4925 = _4839;
            bool _4927 = !_4913;
            _4841 = _4925;
            if (!_4927)
            {
                bool _4929 = _4244 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4931 = isnan(_4244);
                bool _4933 = _4929 || _4931;
                bool _4935 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4937 = _4933 || _4935;
                if (!_4937)
                {
                    float _4939 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4941 = _4244 + _4939;
                    float _4943 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4945 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4943;
                    float _4947 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4949 = _4947 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4951 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4953 = _4951 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4955 = 1.0 / _4945;
                    float _4957 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4959 = _4957 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4961 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4963 = _4961 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4965 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4967 = _4965 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4969 = _4941 * _4955;
                    float _4971 = precise::clamp(_4969, 0.0, 1.0);
                    float _4973 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4975 = _4973 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4977 = fma(_4971, _4949, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4979 = fma(_4971, _4953, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4981 = fma(_4971, _4975, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4983 = fma(_4971, _4959, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4985 = fma(_4971, _4963, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4987 = fma(_4971, _4967, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4833 = _4977;
                    _4815 = _4985;
                    _4827 = _4979;
                    _4809 = _4983;
                    _4841 = _4981;
                    _4821 = _4987;
                    _4903 = true;
                }
                else
                {
                    _4833 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4815 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4827 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4809 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4841 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4821 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4903 = false;
    float _4989 = _4833;
    float _4991 = _4815;
    float _4993 = _4827;
    float _4995 = _4809;
    float _4997 = _4841;
    float _4999 = _4821;
    float _5001 = fma(_3990, -0.5, 0.5);
    float _5003 = precise::clamp(_5001, 0.0, 1.0);
    float _5005 = -_4989;
    float _5007 = _4991 + _5005;
    float _5009 = _4801 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5011 = -_4993;
    float _5013 = _4995 + _5011;
    float _5015 = fma(_5003, _5007, _4989);
    out.m_102.x = 0.0;
    float _5017 = -_4997;
    float _5019 = _4999 + _5017;
    float _5021 = fma(_5003, _5013, _4993);
    float _5023 = _5015 * 0.586610972881317138671875;
    out.m_55.x = _5009;
    bool _5025 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5027 = fma(_5003, _5019, _4997);
    float _5029 = fma(_5021, 0.298911988735198974609375, _5023);
    bool _5031 = _4747 > 0.0;
    bool _5033 = isnan(_4747);
    bool _5035 = _5031 || _5033;
    bool _5037 = isnan(0.0);
    bool _5039 = _5035 || _5037;
    float _5041 = fma(_5027, 0.114477999508380889892578125, _5029);
    float _5043 = -_5041;
    float _5045 = _5021 + _5043;
    float _5047 = -_5041;
    float _5049 = _5015 + _5047;
    float _5051 = -_5041;
    float _5053 = _5027 + _5051;
    float _5055 = fma(_5045, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5041);
    float _5057 = fma(_5049, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5041);
    float _5059 = fma(_5053, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5041);
    bool _5061 = !_5025;
    if (!_5061)
    {
        float _5063 = -_4208;
        float _5065 = _5063 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5067 = -_4212;
        float _5069 = _5067 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5071 = -_4216;
        float _5073 = _5071 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5075 = _5065 * _5065;
        float _5077 = fma(_5069, _5069, _5075);
        float _5079 = fma(_5073, _5073, _5077);
        float _5081 = sqrt(_5079);
        float _5083 = rsqrt(_5079);
        float _5085 = -_5081;
        float _5087 = _5085 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5089 = _5087 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5091 = precise::clamp(_5089, 0.0, 1.0);
        float _5093 = _5069 * _5083;
        float _5095 = _5065 * _5083;
        float _5097 = abs(_5091);
        float _5099 = log2(_5097);
        float _5101 = _5073 * _5083;
        float _5103 = _5093 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5105 = _3990 * _5095;
        float _5107 = -_5095;
        float _5109 = -_5103;
        float _5111 = fma(_5107, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5109);
        float _5113 = fma(_3988, _5093, _5105);
        float _5115 = -_5101;
        float _5117 = fma(_5115, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5111);
        float _5119 = fma(_3992, _5101, _5113);
        float _5121 = precise::clamp(_5119, 0.0, 1.0);
        float _5123 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5125 = _5117 + _5123;
        float _5127 = _5099 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5129 = _5125 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5131 = precise::clamp(_5129, 0.0, 1.0);
        float _5133 = exp2(_5127);
        float _5135 = _5133 * _5131;
        float _5137 = _5121 * _5135;
        float _5139 = _5137 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5141 = _5137 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5143 = _5137 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_102.x = _5139;
        out.m_102.y = _5141;
        out.m_102.z = _5143;
    }
    out.m_104.x = _5055;
    out.m_104.y = _5057;
    out.m_104.z = _5059;
    if (_5039)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_55.x = 0.0;
    float _5145 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5145;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

