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
    float4 m_108 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_86 [[user(locn5)]];
    float4 m_100 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_90 [[user(locn9)]];
    float4 m_80 [[user(locn10)]];
    float4 m_88 [[user(locn11)]];
    float4 m_94 [[user(locn12)]];
    float4 m_96 [[user(locn13)]];
    float4 m_98 [[user(locn14)]];
    float4 m_92 [[user(locn15)]];
    float4 m_106 [[user(locn16)]];
    float4 m_102 [[user(locn17)]];
    float4 m_104 [[user(locn18)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_78 [[attribute(0)]];
    float4 m_64 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_66 [[attribute(3)]];
    float4 m_84 [[attribute(4)]];
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
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5321 = false;
    bool _4394 = false;
    bool _737 = false;
    bool _563 = false;
    bool _457 = false;
    bool _269 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _122 = in.m_48.w;
    float _124 = in.m_50.w;
    float _126 = trunc(_122);
    int _129 = int(_126);
    float _131 = -_124;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _133;
    bool _137 = _129 >= 1;
    float _139 = 0.0;
    float _141 = _124;
    float _143 = _133;
    if (!_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _139;
    if (!_137)
    {
        out.m_55.x = 0.0;
    }
    int _147 = 0;
    if (!_137)
    {
        float _149 = _145 * 5.0;
        _147 = as_type<int>(_149);
    }
    int _151 = _147;
    int _153 = _151;
    if (!_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5631 = as_type<float>(_151);
        out.gl_Position.z = _5631;
    }
    if (!_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _155 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _157 = isnan(_124);
    bool _159 = _155 || _157;
    bool _161 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _163 = _159 || _161;
    float _165 = float(_129);
    bool _167 = _133 >= _165;
    bool _169 = !_163;
    bool _171 = _167 || _169;
    float _173 = 1.0 / _165;
    if (_171)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _141;
    if (_171)
    {
        out.m_55.x = 0.0;
    }
    float _177 = _133 * _173;
    float _179 = _177;
    if (_171)
    {
        float _181 = _175 * 5.0;
        _153 = as_type<int>(_181);
    }
    int _183 = _153;
    out.m_53.x = _177;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5694 = as_type<float>(_183);
        out.gl_Position.z = _5694;
    }
    if (_171)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _185 = as_type<float>(int(gl_VertexIndex));
    float _187 = in.m_60.x;
    float _189 = in.m_60.y;
    float _191 = in.m_60.z;
    float _193 = in.m_62.x;
    float _195 = in.m_62.y;
    float _197 = in.m_62.z;
    float _199 = in.m_64.x;
    float _201 = in.m_64.y;
    float _203 = in.m_64.z;
    float _205 = in.m_66.x;
    float _207 = in.m_66.y;
    float _209 = in.m_66.z;
    int _211 = as_type<int>(_185) & 1;
    bool _213 = _211 != 0;
    int _215 = as_type<int>(_185) & 2;
    bool _217 = _215 != 0;
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _221 = !_217;
    float _223 = _221 ? (-0.5) : 0.5;
    float _225 = _189 * _195;
    float _227 = _189 * _201;
    float _229 = fma(_187, _193, _225);
    float _231 = _189 * _207;
    float _233 = fma(_187, _199, _227);
    float _235 = fma(_191, _197, _229);
    bool _237 = !_213;
    float _239 = _237 ? (-0.5) : 0.5;
    float _241 = fma(_187, _205, _231);
    float _243 = fma(_191, _203, _233);
    float _245 = fma(_191, _209, _241);
    bool _247 = !_219;
    float _249 = _243;
    float _267;
    if (!_247)
    {
        float _251 = in.m_68.x;
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _255 = _251 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _259 = _257 * _253;
        float _261 = floor(_259);
        float _263 = -_261;
        float _265 = _259 + _263;
        _267 = _265;
        _269 = true;
    }
    else
    {
        _267 = _177;
    }
    _269 = false;
    float _271 = _267;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = _271 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = _271 + _277;
    bool _281 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _283 = isnan(_271);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _271 + _305;
    float _309 = 1.0 / _299;
    bool _311 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _313 = 1.0 / _295;
    float _315 = 1.0 / _303;
    float _317 = _307 * _309;
    bool _319 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _321 = isnan(_271);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = _275 * _313;
    bool _333 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _335 = isnan(_271);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -_291;
    float _347 = _345 + 1.0;
    float _349 = _343 * _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _355 = _279 * _315;
    bool _357 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _359 = isnan(_271);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -_343;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _385 = _367 * _371;
    float _387 = -_367;
    float _389 = _387 + 1.0;
    float _391 = fma(_375, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _393 = fma(_379, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _395 = fma(_353, _317, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _397 = _329 * _389;
    float _399 = fma(_383, _317, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _401 = -_329;
    float _403 = _401 + 1.0;
    float _405 = _391 * _397;
    float _407 = _393 * _397;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _413;
    float _417 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[143].x, _405);
    float _419 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[143].y, _407);
    float _421 = fma(_411, _355, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _423 = fma(_415, _355, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _425 = fma(_395, _385, _417);
    float _427 = fma(_399, _385, _419);
    float _429 = fma(_421, _349, _425);
    float _431 = fma(_423, _349, _427);
    float _433 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[146].x, _429);
    float _435 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[146].y, _431);
    bool _437 = !_311;
    float _455;
    if (!_437)
    {
        float _439 = in.m_68.x;
        float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _443 = _439 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _445 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _447 = _445 * _441;
        float _449 = floor(_447);
        float _451 = -_449;
        float _453 = _447 + _451;
        _455 = _453;
        _457 = true;
    }
    else
    {
        _455 = _177;
    }
    _457 = false;
    float _459 = _455;
    float _461 = in.m_70.x;
    float _463 = in.m_70.y;
    bool _465 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _467 = isnan(_459);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _481 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _483 = isnan(_459);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _499 = _459 + _497;
    float _501 = -_475;
    float _503 = _501 + 1.0;
    bool _505 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _507 = 1.0 / _479;
    float _509 = _491 * _503;
    float _511 = -_491;
    float _513 = _511 + 1.0;
    float _515 = _435 * _463;
    float _517 = _495 * _507;
    float _519 = fma(_517, _499, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _523 = _519 * _509;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _527 = _521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _529 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[115].x, _523);
    float _531 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _533 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[116].x, _529);
    float _535 = _433 * _461;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _539 = _533 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _541 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _531;
    out.m_72.y = _527;
    out.m_72.z = _541;
    out.m_72.w = _539;
    bool _543 = !_505;
    float _561;
    if (!_543)
    {
        float _545 = in.m_68.x;
        float _547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _549 = _545 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _551 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[11].w, _133);
        float _553 = _551 * _547;
        float _555 = floor(_553);
        float _557 = -_555;
        float _559 = _553 + _557;
        _561 = _559;
        _563 = true;
    }
    else
    {
        _561 = _177;
    }
    _563 = false;
    float _565 = _561;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _569 = _565 + _567;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _579 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _581 = isnan(_565);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _595 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _597 = isnan(_565);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = 1.0 / _573;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _609;
    float _613 = -_589;
    float _615 = _613 + 1.0;
    bool _617 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _619 = isnan(_565);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    bool _629 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _631 = 1.0 / _577;
    float _633 = 1.0 / _593;
    float _635 = _611 * _607;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _641 = _605 * _615;
    float _643 = -_605;
    float _645 = _643 + 1.0;
    float _647 = fma(_635, _569, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _649 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _651 = isnan(_565);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = _627 * _645;
    float _663 = _639 * _631;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _667 = _565 + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _669;
    float _673 = _647 * _661;
    float _675 = -_627;
    float _677 = _675 + 1.0;
    float _679 = fma(_663, _667, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _681 = -_659;
    float _683 = _681 + 1.0;
    float _685 = _671 * _633;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _689 = _565 + _687;
    float _691 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[131].x, _673);
    float _693 = _589 * _683;
    float _695 = fma(_685, _689, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _697 = fma(_679, _641, _691);
    float _699 = fma(_695, _693, _697);
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _707 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[134].x, _699);
    float _709 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _705 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = _707 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_74.x = _709;
    out.m_74.y = _713;
    out.m_74.z = _711;
    out.m_74.w = _715;
    bool _717 = !_629;
    float _735;
    if (!_717)
    {
        float _719 = in.m_68.x;
        float _721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _723 = _719 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _725 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[14].x, _133);
        float _727 = _725 * _721;
        float _729 = floor(_727);
        float _731 = -_729;
        float _733 = _727 + _731;
        _735 = _733;
        _737 = true;
    }
    else
    {
        _735 = _177;
    }
    _737 = false;
    float _739 = _735;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _743 = _739 + _741;
    bool _745 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _747 = isnan(_739);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    bool _757 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _759 = isnan(_739);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _771 = _769 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _773 = -_755;
    float _775 = _773 + 1.0;
    float _777 = -_767;
    float _779 = _777 + 1.0;
    bool _781 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _783 = isnan(_739);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _789 = _785 || _787;
    float _791 = float(_789);
    float _793 = 1.0 / _771;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _795;
    float _799 = _767 * _775;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _805 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _807 = isnan(_739);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _813 = _809 || _811;
    float _815 = float(_813);
    float _817 = _791 * _779;
    float _819 = -_791;
    float _821 = _819 + 1.0;
    bool _823 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _825 = isnan(_739);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = 1.0 / _803;
    float _837 = _815 * _821;
    float _839 = -_815;
    float _841 = _839 + 1.0;
    bool _843 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _845 = isnan(_739);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = -_833;
    float _857 = _855 + 1.0;
    float _859 = _833 * _841;
    float _861 = _797 * _793;
    bool _863 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _865 = isnan(_739);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = fma(_861, _743, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _879 = _877 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _883 = _881 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _885 = _853 * _857;
    float _887 = -_853;
    float _889 = _887 + 1.0;
    float _891 = 1.0 / _883;
    bool _893 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _895 = _873 * _889;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _901 = -_873;
    float _903 = _901 + 1.0;
    float _905 = _875 * _895;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _909 = _739 + _907;
    float _911 = 1.0 / _879;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _921 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[159].x, _905);
    float _923 = _915 * _835;
    float _925 = 1.0 / _899;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _927;
    float _931 = fma(_923, _909, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _939 = _937 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _941 = _929 * _891;
    float _943 = fma(_931, _885, _921);
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _947 = _739 + _945;
    float _949 = 1.0 / _919;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _953 = _739 + _951;
    float _955 = _939 * _911;
    float _957 = fma(_941, _953, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _959;
    float _963 = fma(_955, _947, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _965 = 1.0 / _935;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _969 = _967 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _971 = _961 * _925;
    float _973 = fma(_957, _859, _943);
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _977 = _739 + _975;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _981 = _739 + _979;
    float _983 = _969 * _949;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _985;
    bool _989 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _991 = isnan(_739);
    bool _993 = _989 || _991;
    bool _995 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _997 = _993 || _995;
    float _999 = float(_997);
    float _1001 = fma(_971, _977, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1003 = fma(_963, _837, _973);
    float _1005 = fma(_983, _981, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1009 = _739 + _1007;
    float _1011 = -_999;
    float _1013 = _1011 + 1.0;
    float _1015 = _987 * _965;
    float _1017 = fma(_1001, _817, _1003);
    float _1019 = _755 * _1013;
    float _1021 = fma(_1015, _1009, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1023 = fma(_1005, _799, _1017);
    float _1025 = fma(_1021, _1019, _1023);
    float _1027 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1025);
    out.m_76.x = _1027;
    bool _1029 = !_893;
    float _1031 = _925;
    float _1033 = _973;
    if (!_1029)
    {
        float _1035 = in.m_68.x;
        float _1037 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1039 = _1035 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1041 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[14].y, _133);
        float _1043 = _1041 * _1037;
        float _1045 = floor(_1043);
        float _1047 = -_1045;
        float _1049 = _1043 + _1047;
        _179 = _1049;
    }
    float _1051 = _179;
    float _1053 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1055 = int(_1053);
    int _1057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1059 = _1057 != 0;
    float _1061 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1063 = int(_1061);
    float _1065 = float(_1055);
    float _1067 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1069 = int(_1067);
    if (_1059)
    {
        _1031 = 1.0;
    }
    float _1071 = _1031;
    float _1073 = _1071;
    if (_1059)
    {
        _1033 = 1.0;
    }
    float _1075 = _1033;
    int _1077 = 0;
    float _1079 = _1075;
    if (_1059)
    {
        _1077 = 0;
    }
    int _1081 = _1077;
    float _1083 = float(_1063);
    float _1085 = 1.0 / _1065;
    float _1087 = 1.0 / _1083;
    float _1089 = float(uint(_1069));
    int _1091 = ~_1069;
    int _1093 = _1091 + 1;
    float _1095 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1097 = int(_1095);
    float _1099 = _1085 * _133;
    float _1101 = _1085;
    float _1103 = _1083;
    int _1105 = _1081;
    if (_1059)
    {
        float _1107 = in.m_68.x;
        float _1109 = in.m_68.y;
        _1101 = _1107;
        _1103 = _1109;
    }
    float _1111 = _1101;
    float _1113 = _1103;
    float _1115 = _1087 * _133;
    float _1117 = 1.0 / _1089;
    float _1119 = float(uint(_1097));
    float _1121 = trunc(_1099);
    int _1123 = int(_1121);
    float _1125 = 1.0 / _1119;
    int _1127 = as_type<int>(_1117) + (-2);
    float _1129 = 0.0;
    float _1131 = _1111;
    float _1133 = _1113;
    if (_1059)
    {
        _1129 = _1113;
    }
    float _1135 = _1129;
    float _1137 = trunc(_1115);
    int _1139 = int(_1137);
    float _1141 = float(uint(_1123));
    float _1143 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1145 = int(_1143);
    int _1147 = as_type<int>(_1125) + (-2);
    float _1149 = as_type<float>(_1127) * _1141;
    int _1151 = as_type<int>(_1141);
    float _1153 = _1135;
    if (_1059)
    {
        _1151 = 0;
    }
    int _1155 = _1151;
    float _1157 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1159 = int(_1157);
    float _1161 = float(uint(_1139));
    float _1163 = as_type<float>(_1147) * _1161;
    float _1165 = _1161;
    int _1167 = _1155;
    if (_1059)
    {
        _1165 = _1111;
    }
    float _1169 = _1165;
    float _1171 = trunc(_1149);
    float _1173 = precise::max(_1171, 0.0);
    uint _1176 = uint(_1173);
    float _1178 = float(uint(_1145));
    float _1180 = 0.0;
    float _1182 = _1169;
    if (_1059)
    {
        _1180 = _1169;
    }
    float _1184 = _1180;
    float _1186 = 1.0 / _1178;
    float _1188 = float(_1159);
    float _1190 = trunc(_1163);
    float _1192 = precise::max(_1190, 0.0);
    uint _1194 = uint(_1192);
    float _1196 = 1.0 / _1188;
    float _1198 = _1188;
    float _1200 = _1184;
    if (_1059)
    {
        _1198 = _1169;
    }
    float _1202 = _1198;
    float _1204 = _1202;
    if (!_1059)
    {
        float _1206 = in.m_68.x;
        float _1208 = in.m_68.y;
        float _1210 = in.m_68.z;
        float _1212 = _1206 * 3.1415927410125732421875;
        float _1214 = _1212 * 0.15915493667125701904296875;
        float _1216 = _1208 * 3.1415927410125732421875;
        float _1218 = _1216 * 0.15915493667125701904296875;
        float _1220 = _1214 * 6.283185482025146484375;
        float _1222 = sin(_1220);
        float _1224 = _1218 * 6.283185482025146484375;
        float _1226 = sin(_1224);
        _1079 = 5.839270114898681640625;
        _1204 = _1210;
        _1073 = 7.345489978790283203125;
        _1182 = _1208;
        _1131 = _1206;
        _1133 = _1208;
        _1167 = 1;
        _1105 = 2;
        _1200 = _1222;
        _1153 = _1226;
    }
    float _1228 = _1079;
    float _1230 = _1204;
    float _1232 = _1073;
    float _1234 = _1182;
    float _1236 = _1131;
    float _1238 = _1133;
    int _1240 = _1167;
    int _1242 = _1105;
    float _1244 = _1200;
    float _1246 = _1153;
    float _1248 = _1228 * _1230;
    float _1250 = _1196 * _133;
    float _1252 = in.m_68.z;
    float _1254 = in.m_68.w;
    int _1256 = ~_1097;
    int _1258 = _1256 + 1;
    float _1260 = floor(_1248);
    int _1262 = _1093 * int(_1176);
    int _1264 = _1262 + _1123;
    float _1266 = _1232 * _1234;
    float _1268 = _1232 * _1236;
    int _1270 = _1258 * int(_1194);
    int _1272 = _1270 + _1139;
    float _1274 = float(_1123);
    float _1276 = in.m_78.y;
    float _1278 = float(uint(_1264));
    float _1280 = trunc(_1250);
    int _1282 = int(_1280);
    float _1284 = float(uint(_1272));
    bool _1286 = _1238 > 0.5;
    float _1288 = as_type<float>(_1127) * _1278;
    float _1290 = float(_1069);
    float _1292 = -_1260;
    float _1294 = _1248 + _1292;
    float _1296 = as_type<float>(_1147) * _1284;
    float _1298 = floor(_1268);
    int _1300 = as_type<int>(_1186) + (-2);
    bool _1302 = _1274 >= _1290;
    bool _1304 = isnan(_1274);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan(_1290);
    bool _1310 = _1306 || _1308;
    float _1312 = float(_1310);
    bool _1314 = _1254 > 0.5;
    float _1316 = float(uint(_1282));
    float _1318 = trunc(_1288);
    float _1320 = precise::max(_1318, 0.0);
    uint _1322 = uint(_1320);
    bool _1324 = _1252 > 0.5;
    float _1326 = as_type<float>(_1300) * _1316;
    int _1328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1330 = _1328 != 0;
    int _1332 = ~_1097;
    int _1334 = _1332 + 1;
    float _1336 = trunc(_1296);
    float _1338 = precise::max(_1336, 0.0);
    uint _1340 = uint(_1338);
    float _1342 = -_1298;
    float _1344 = _1268 + _1342;
    int _1346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1348 = _1346 != 0;
    int _1350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1352 = _1350 != 0;
    int _1354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1356 = _1354 != 0;
    float _1358 = -_239;
    int _1360 = _1286 ? as_type<int>(_1358) : as_type<int>(_239);
    float _1362 = float(_1097);
    float _1364 = trunc(_1326);
    float _1366 = precise::max(_1364, 0.0);
    uint _1368 = uint(_1366);
    int _1370 = int(_1176) + int(_1322);
    int _1372 = ~_1069;
    int _1374 = _1372 + 1;
    int _1376 = int(_1314);
    int _1378 = _1324 ? 2 : 0;
    int _1380 = _1376 | _1378;
    int _1382 = _1330 ? 4 : 0;
    int _1384 = _1380 | _1382;
    int _1386 = _1348 ? 8 : 0;
    int _1388 = _1384 | _1386;
    int _1390 = _1352 ? 16 : 0;
    int _1392 = _1388 | _1390;
    int _1394 = _1356 ? 32 : 0;
    int _1396 = _1392 | _1394;
    int _1398 = _1286 ? 64 : 0;
    int _1400 = _1396 | _1398;
    int _1402 = _1400 & 64;
    float _1404 = float(_1139);
    float _1406 = trunc(_1312);
    int _1408 = int(_1406);
    int _1410 = int(_1194) + int(_1340);
    int _1412 = _1374 * _1370;
    int _1414 = _1412 + _1123;
    bool _1416 = !_1352;
    float _1418 = _1416 ? _239 : as_type<float>(_1360);
    bool _1420 = _1404 >= _1362;
    bool _1422 = isnan(_1404);
    bool _1424 = _1420 || _1422;
    bool _1426 = isnan(_1362);
    bool _1428 = _1424 || _1426;
    float _1430 = float(_1428);
    int _1432 = _1334 * _1410;
    int _1434 = _1432 + _1139;
    int _1436 = ~_1145;
    int _1438 = _1436 + 1;
    float _1440 = floor(_1266);
    float _1442 = -_223;
    int _1444 = _1324 ? as_type<int>(_1442) : as_type<int>(_223);
    float _1446 = _1344 * _1290;
    bool _1448 = !_1330;
    int _1450 = _1448 ? 0 : 1;
    int _1452 = _1438 * int(_1368);
    int _1454 = _1452 + _1282;
    bool _1456 = !_1356;
    float _1458 = _1456 ? _223 : as_type<float>(_1444);
    float _1460 = _1294 * _1362;
    int _1462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1464 = _1462 != 0;
    int _1466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1468 = _1466 != 0;
    int _1470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1472 = _1470 != 0;
    float _1474 = trunc(_1446);
    int _1476 = int(_1474);
    bool _1478 = uint(_1414) >= uint(_1069);
    int _1480 = abs(_1450);
    bool _1482 = !_1468;
    int _1484 = _1482 ? 0 : 1;
    bool _1486 = !_1464;
    int _1488 = _1486 ? 0 : 1;
    float _1490 = -_1440;
    float _1492 = _1266 + _1490;
    int _1494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1496 = _1494 != 0;
    float _1498 = trunc(_1430);
    int _1500 = int(_1498);
    bool _1502 = uint(_1434) >= uint(_1097);
    bool _1504 = !_1472;
    int _1506 = _1504 ? 0 : 1;
    bool _1508 = !_1496;
    int _1510 = _1508 ? 0 : 1;
    int _1512 = _1476 * _1480;
    int _1514 = _1512 + _1123;
    bool _1516 = !_1502;
    int _1518 = _1516 ? 0 : (-1);
    float _1520 = trunc(_1460);
    int _1522 = int(_1520);
    int _1524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1526 = _1524 != 0;
    int _1528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1530 = _1528 != 0;
    int _1532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1534 = _1532 != 0;
    float _1536 = float(uint(_1454));
    bool _1538 = !_1478;
    int _1540 = _1538 ? 0 : (-1);
    bool _1542 = !_1530;
    int _1544 = _1542 ? 0 : 1;
    bool _1546 = _1402 != 0;
    float _1548 = as_type<float>(_1300) * _1536;
    int _1550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1552 = _1550 != 0;
    int _1554 = ~_1370;
    int _1556 = _1554 + _1540;
    int _1558 = _1556 + 1;
    bool _1560 = !_1552;
    int _1562 = _1560 ? 0 : 1;
    float _1564 = trunc(_1548);
    float _1566 = precise::max(_1564, 0.0);
    uint _1568 = uint(_1566);
    int _1570 = ~_1410;
    int _1572 = _1570 + _1518;
    int _1574 = _1572 + 1;
    int _1576 = _1069 * _1558;
    int _1578 = _1576 + _1123;
    int _1580 = abs(_1562);
    float _1582 = _173 * _133;
    bool _1584 = _1069 == 0;
    int _1586 = _1097 * _1574;
    int _1588 = _1586 + _1139;
    bool _1590 = !_1526;
    int _1592 = _1590 ? 0 : 1;
    float _1594 = _1290 * _1582;
    bool _1596 = _1097 == 0;
    int _1598 = _1522 * _1580;
    int _1600 = _1598 + _1139;
    int _1602 = ~_1408;
    int _1604 = _1602 + 1;
    int _1606 = _1604 + 1;
    float _1608 = _1362 * _1582;
    bool _1610 = !_1584;
    int _1612 = _1610 ? _1578 : (-1);
    float _1614 = trunc(_1594);
    int _1616 = int(_1614);
    int _1618 = ~_1500;
    int _1620 = _1618 + 1;
    int _1622 = _1620 + 1;
    bool _1624 = !_1596;
    int _1626 = _1624 ? _1588 : (-1);
    int _1628 = _1612 * _1606;
    int _1630 = int(_1368) + int(_1568);
    int _1632 = abs(_1484);
    int _1634 = _1626 * _1622;
    int _1636 = _1069 + (-1);
    float _1638 = trunc(_1608);
    int _1640 = int(_1638);
    int _1642 = _1097 + (-1);
    int _1644 = abs(_1544);
    int _1646 = _1408 * _1636;
    int _1648 = _1646 + _1628;
    int _1650 = abs(_1488);
    int _1652 = _1500 * _1642;
    int _1654 = _1652 + _1634;
    int _1656 = _1648 * _1632;
    int _1658 = abs(_1506);
    int _1660 = _1654 * _1644;
    int _1662 = abs(_1510);
    int _1664 = _1616 * _1650;
    int _1666 = _1664 + _1656;
    int _1668 = ~_1145;
    int _1670 = _1668 + 1;
    int _1672 = _1514 * _1658;
    int _1674 = _1672 + _1666;
    int _1676 = abs(_1592);
    int _1678 = _1670 * _1630;
    int _1680 = _1678 + _1282;
    float _1682 = -_223;
    int _1684 = _1314 ? as_type<int>(_1682) : as_type<int>(_223);
    int _1686 = _1476 * _1662;
    int _1688 = _1686 + _1674;
    float _1690 = -_239;
    float _1692 = _1324 ? _1690 : _239;
    bool _1694 = uint(_1680) >= uint(_1145);
    int _1696 = _1640 * _1676;
    int _1698 = _1696 + _1660;
    float _1700 = float(uint(_1688));
    int _1702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1704 = _1702 != 0;
    bool _1706 = !_1534;
    int _1708 = _1706 ? 0 : 1;
    float _1710 = as_type<float>(_1127) * _1700;
    bool _1712 = !_1704;
    int _1714 = _1712 ? 0 : 1;
    float _1716 = float(_1145);
    float _1718 = trunc(_1710);
    float _1720 = precise::max(_1718, 0.0);
    uint _1722 = uint(_1720);
    int _1724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1726 = _1724 != 0;
    float _1728 = float(_1282);
    float _1730 = _1716 * _1582;
    int _1732 = abs(_1708);
    int _1734 = abs(_1714);
    float _1736 = _1492 * _1716;
    bool _1738 = !_1694;
    int _1740 = _1738 ? 0 : (-1);
    float _1742 = trunc(_1730);
    int _1744 = int(_1742);
    bool _1746 = !_1726;
    int _1748 = _1746 ? 0 : 1;
    bool _1750 = !_1348;
    float _1752 = _1750 ? _223 : as_type<float>(_1684);
    bool _1754 = _1728 >= _1716;
    bool _1756 = isnan(_1728);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan(_1716);
    bool _1762 = _1758 || _1760;
    float _1764 = float(_1762);
    int _1766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1768 = _1766 != 0;
    int _1770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1772 = _1770 != 0;
    int _1774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1776 = _1774 != 0;
    int _1778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1780 = _1778 != 0;
    float _1782 = trunc(_1736);
    int _1784 = int(_1782);
    int _1786 = ~_1630;
    int _1788 = _1786 + _1740;
    int _1790 = _1788 + 1;
    int _1792 = _1600 * _1732;
    int _1794 = _1792 + _1698;
    int _1796 = ~_1069;
    int _1798 = _1796 + 1;
    int _1800 = _1145 * _1790;
    int _1802 = _1800 + _1282;
    bool _1804 = !_1772;
    int _1806 = _1804 ? 0 : 1;
    float _1808 = trunc(_1764);
    int _1810 = int(_1808);
    int _1812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1814 = _1812 != 0;
    int _1816 = _1522 * _1734;
    int _1818 = _1816 + _1794;
    bool _1820 = !_1768;
    int _1822 = _1820 ? 0 : 1;
    float _1824 = float(uint(_1818));
    int _1826 = _1798 * int(_1722);
    int _1828 = _1826 + _1688;
    bool _1830 = _1145 == 0;
    int _1832 = abs(_1806);
    float _1834 = as_type<float>(_1147) * _1824;
    float _1836 = float(uint(_1828));
    float _1838 = _1710;
    float _1840 = _1692;
    if (_1814)
    {
        float _1842 = in.m_68.w;
        _1838 = _1842;
    }
    float _1844 = _1838;
    bool _1846 = !_1830;
    int _1848 = _1846 ? _1802 : (-1);
    float _1850 = trunc(_1834);
    float _1852 = precise::max(_1850, 0.0);
    uint _1854 = uint(_1852);
    int _1856 = ~_1810;
    int _1858 = _1856 + 1;
    int _1860 = _1858 + 1;
    float _1862 = as_type<float>(_1127) * _1836;
    int _1864 = abs(_1748);
    int _1866 = abs(_1822);
    int _1868 = _1848 * _1860;
    int _1870 = _1145 + (-1);
    float _1872 = trunc(_1862);
    float _1874 = precise::max(_1872, 0.0);
    uint _1876 = uint(_1874);
    int _1878 = ~_1069;
    int _1880 = _1878 + 1;
    int _1882 = _1810 * _1870;
    int _1884 = _1882 + _1868;
    int _1886 = ~_1097;
    int _1888 = _1886 + 1;
    int _1890 = _1784 * _1864;
    int _1892 = _1890 + _1282;
    int _1894 = _1884 * _1832;
    bool _1896 = !_1776;
    int _1898 = _1896 ? 0 : 1;
    int _1900 = _1888 * int(_1854);
    int _1902 = _1900 + _1818;
    int _1904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1906 = _1904 != 0;
    int _1908 = _1744 * _1866;
    int _1910 = _1908 + _1894;
    bool _1912 = _1069 == 0;
    float _1914 = as_type<float>(_1864);
    float _1916 = as_type<float>(_1866);
    float _1918 = as_type<float>(_1854);
    if (_1814)
    {
        float _1920 = _1844 * 3.1415927410125732421875;
        _1914 = _1920;
    }
    float _1922 = _1914;
    float _1924 = float(uint(_1902));
    int _1926 = int(_1722) + int(_1876);
    if (_1814)
    {
        float _1928 = _1922 * 0.15915493667125701904296875;
        _1916 = _1928;
    }
    float _1930 = _1916;
    bool _1932 = !_1780;
    int _1934 = _1932 ? 0 : 1;
    float _1936 = as_type<float>(_1147) * _1924;
    int _1938 = abs(_1898);
    int _1940 = _1880 * _1926;
    int _1942 = _1940 + _1688;
    int _1944 = abs(_1934);
    float _1946 = as_type<float>(_1744);
    if (_1906)
    {
        float _1948 = in.m_68.x;
        _1946 = _1948;
    }
    float _1950 = _1946;
    float _1952 = trunc(_1936);
    float _1954 = precise::max(_1952, 0.0);
    uint _1956 = uint(_1954);
    int _1958 = _1892 * _1938;
    int _1960 = _1958 + _1910;
    bool _1962 = uint(_1942) >= uint(_1069);
    float _1964 = float(uint(_1514));
    float _1966 = as_type<float>(_1898);
    if (_1814)
    {
        float _1968 = _1930 * 6.283185482025146484375;
        float _1970 = sin(_1968);
        _1966 = _1970;
    }
    float _1972 = _1966;
    bool _1974 = !_1962;
    int _1976 = _1974 ? 0 : (-1);
    float _1978 = as_type<float>(_1127) * _1964;
    int _1980 = _1784 * _1944;
    int _1982 = _1980 + _1960;
    int _1984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1986 = _1984 != 0;
    int _1988 = ~_1926;
    int _1990 = _1988 + _1976;
    int _1992 = _1990 + 1;
    float _1994 = trunc(_1978);
    float _1996 = precise::max(_1994, 0.0);
    uint _1998 = uint(_1996);
    float _2000 = float(uint(_1982));
    int _2002 = _1069 * _1992;
    int _2004 = _2002 + _1688;
    int _2006 = int(_1854) + int(_1956);
    float _2008 = as_type<float>(_1300) * _2000;
    bool _2010 = !_1986;
    float _2012 = _2010 ? _239 : _1692;
    bool _2014 = _1986;
    if (_1906)
    {
        float _2016 = _1950 * 3.1415927410125732421875;
        _1840 = _2016;
    }
    float _2018 = _1840;
    float _2020 = _2018;
    if (_1814)
    {
        bool _2022 = _1972 > 0.5;
        _2014 = _2022;
    }
    bool _2024 = _2014;
    float _2026 = trunc(_2008);
    float _2028 = precise::max(_2026, 0.0);
    uint _2030 = uint(_2028);
    bool _2032 = !_1912;
    int _2034 = _2032 ? _2004 : (-1);
    if (_1906)
    {
        float _2036 = _2018 * 0.15915493667125701904296875;
        _2020 = _2036;
    }
    float _2038 = _2020;
    int _2040 = ~_1069;
    int _2042 = _2040 + 1;
    float _2044 = _2038;
    if (!_1814)
    {
        _1918 = _239;
    }
    float _2046 = _1918;
    float _2048 = _2046;
    if (_1814)
    {
        float _2050 = -_239;
        float _2052 = _2024 ? _2050 : _239;
        _2048 = _2052;
    }
    float _2054 = _2048;
    int _2056 = _2042 * int(_1998);
    int _2058 = _2056 + _1514;
    float _2060 = float(uint(_1600));
    int _2062 = as_type<int>(_2054);
    if (_1906)
    {
        float _2064 = _2038 * 6.283185482025146484375;
        float _2066 = sin(_2064);
        _2044 = _2066;
    }
    float _2068 = _2044;
    int _2070 = _2034 & 3;
    bool _2072 = _2070 != 0;
    float _2074 = _2054 + 0.5;
    int _2076 = _2034 & 3;
    bool _2078 = _2076 != 0;
    float _2080 = as_type<float>(_1147) * _2060;
    int _2082 = _2072 ? 0 : 1;
    int _2084 = ~_1145;
    int _2086 = _2084 + 1;
    bool _2088 = uint(_2076) > 1u;
    float _2090 = trunc(_2080);
    float _2092 = precise::max(_2090, 0.0);
    uint _2094 = uint(_2092);
    float _2096 = float(uint(_2058));
    int _2098 = ~_1097;
    int _2100 = _2098 + 1;
    float _2102 = as_type<float>(_1127) * _2096;
    int _2104 = ~_2082;
    int _2106 = _2104 + 1;
    int _2108 = _2106 + 1;
    int _2110 = _2086 * int(_2030);
    int _2112 = _2110 + _1982;
    float _2114 = -_223;
    int _2116 = _1546 ? as_type<int>(_2114) : as_type<int>(_223);
    int _2118 = _2100 * _2006;
    int _2120 = _2118 + _1818;
    bool _2122 = uint(_2076) >= 2u;
    float _2124 = trunc(_2102);
    float _2126 = precise::max(_2124, 0.0);
    uint _2128 = uint(_2126);
    int _2130 = _2108;
    if (!_2088)
    {
        int _2132 = ~_2082;
        int _2134 = _2132 + 1;
        _2130 = _2134;
    }
    int _2136 = _2130;
    float _2138 = float(uint(_2112));
    bool _2140 = uint(_2120) >= uint(_1097);
    int _2142 = ~_1097;
    int _2144 = _2142 + 1;
    float _2146 = as_type<float>(_1300) * _2138;
    int _2148 = _2122 ? 0 : 1;
    bool _2150 = _2076 != 3;
    int _2152 = _2144 * int(_2094);
    int _2154 = _2152 + _1600;
    bool _2156 = !_2140;
    int _2158 = _2156 ? 0 : (-1);
    float _2160 = trunc(_2146);
    float _2162 = precise::max(_2160, 0.0);
    uint _2164 = uint(_2162);
    int _2166 = ~_2148;
    int _2168 = _2166 + 1;
    int _2170 = _2168 + 1;
    int _2172 = ~_2006;
    int _2174 = _2172 + _2158;
    int _2176 = _2174 + 1;
    float _2178 = float(uint(_2154));
    int _2180 = _1097 * _2176;
    int _2182 = _2180 + _1818;
    float _2184 = 0.0;
    int _2186 = _2170;
    bool _2188 = _2150;
    if (!_1906)
    {
        _2184 = _223;
    }
    float _2190 = _2184;
    float _2192 = as_type<float>(_1147) * _2178;
    float _2194 = _2190;
    if (_2150)
    {
        int _2196 = ~_2148;
        int _2198 = _2196 + 1;
        _2186 = _2198;
    }
    int _2200 = _2186;
    if (_1906)
    {
        bool _2202 = _2068 > 0.5;
        _2188 = _2202;
    }
    bool _2204 = _2188;
    float _2206 = trunc(_2192);
    float _2208 = precise::max(_2206, 0.0);
    uint _2210 = uint(_2208);
    bool _2212 = !_1596;
    int _2214 = _2212 ? _2182 : (-1);
    int _2216 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2218 = _2216 != 0;
    if (_1906)
    {
        float _2220 = -_223;
        float _2222 = _2204 ? _2220 : _223;
        _2194 = _2222;
    }
    float _2224 = _2194;
    int _2226 = _2214 & 3;
    bool _2228 = _2226 != 0;
    bool _2230 = !_2218;
    float _2232 = _2230 ? _223 : as_type<float>(_2116);
    int _2234 = int(_2030) + int(_2164);
    int _2236 = ~_1145;
    int _2238 = _2236 + 1;
    int _2240 = _2214 & 3;
    bool _2242 = _2240 != 0;
    bool _2244 = uint(_2226) > 1u;
    int _2246 = _2238 * _2234;
    int _2248 = _2246 + _1982;
    int _2250 = int(_1998) + int(_2128);
    int _2252 = ~_1069;
    int _2254 = _2252 + 1;
    int _2256 = _2242 ? 0 : 1;
    int _2258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2260 = _2258 != 0;
    int _2262 = _2254 * _2250;
    int _2264 = _2262 + _1514;
    float _2266 = float(uint(_1892));
    bool _2268 = !_2260;
    int _2270 = _2268 ? 0 : 1;
    bool _2272 = uint(_2248) >= uint(_1145);
    float _2274 = as_type<float>(_1300) * _2266;
    int _2276 = ~_2256;
    int _2278 = _2276 + 1;
    int _2280 = _2278 + 1;
    int _2282 = _2280;
    if (!_2244)
    {
        int _2284 = ~_2256;
        int _2286 = _2284 + 1;
        _2282 = _2286;
    }
    int _2288 = _2282;
    float _2290 = trunc(_2274);
    float _2292 = precise::max(_2290, 0.0);
    uint _2294 = uint(_2292);
    bool _2296 = uint(_2264) >= uint(_1069);
    bool _2298 = !_2272;
    int _2300 = _2298 ? 0 : (-1);
    bool _2302 = _2226 != 3;
    bool _2304 = !_2296;
    int _2306 = _2304 ? 0 : (-1);
    bool _2308 = uint(_2226) >= 2u;
    int _2310 = ~_2234;
    int _2312 = _2310 + _2300;
    int _2314 = _2312 + 1;
    int _2316 = ~_1097;
    int _2318 = _2316 + 1;
    int _2320 = int(_2094) + int(_2210);
    int _2322 = _1145 * _2314;
    int _2324 = _2322 + _1982;
    int _2326 = _2308 ? 0 : 1;
    int _2328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2330 = _2328 != 0;
    int _2332 = _2318 * _2320;
    int _2334 = _2332 + _1600;
    int _2336 = ~_1145;
    int _2338 = _2336 + 1;
    int _2340 = ~_2326;
    int _2342 = _2340 + 1;
    int _2344 = _2342 + 1;
    int _2346 = _2344;
    if (_2302)
    {
        int _2348 = ~_2326;
        int _2350 = _2348 + 1;
        _2346 = _2350;
    }
    int _2352 = _2346;
    int _2354 = _2338 * int(_2294);
    int _2356 = _2354 + _1892;
    int _2358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2360 = _2358 != 0;
    bool _2362 = !_2330;
    int _2364 = _2362 ? 0 : 1;
    bool _2366 = uint(_2334) >= uint(_1097);
    bool _2368 = !_1830;
    int _2370 = _2368 ? _2324 : (-1);
    bool _2372 = !_2360;
    int _2374 = _2372 ? 0 : 1;
    bool _2376 = !_2366;
    int _2378 = _2376 ? 0 : (-1);
    int _2380 = _2370 & 3;
    bool _2382 = _2380 != 0;
    int _2384 = _2370 & 3;
    bool _2386 = _2384 != 0;
    float _2388 = float(uint(_2356));
    int _2390 = _2382 ? 0 : 1;
    bool _2392 = uint(_2384) > 1u;
    float _2394 = as_type<float>(_1300) * _2388;
    int _2396 = ~_2390;
    int _2398 = _2396 + 1;
    int _2400 = _2398 + 1;
    int _2402 = ~_1145;
    int _2404 = _2402 + 1;
    float _2406 = trunc(_2394);
    float _2408 = precise::max(_2406, 0.0);
    uint _2410 = uint(_2408);
    float _2412 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    int _2414 = _2400;
    float _2416 = as_type<float>(_2404);
    float _2418 = as_type<float>(_2294);
    if (!_2392)
    {
        int _2420 = ~_2390;
        int _2422 = _2420 + 1;
        _2414 = _2422;
    }
    int _2424 = _2414;
    float _2426 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _2428 = uint(_2384) >= 2u;
    float _2430 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2432 = _2428 ? 0 : 1;
    bool _2434 = _2384 != 3;
    float _2436 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2438 = int(_2294) + int(_2410);
    int _2440 = ~_2432;
    int _2442 = _2440 + 1;
    int _2444 = _2442 + 1;
    int _2446 = _2404 * _2438;
    int _2448 = _2446 + _1892;
    float _2450 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2452 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2454 = _2444;
    if (_2434)
    {
        int _2456 = ~_2432;
        int _2458 = _2456 + 1;
        _2454 = _2458;
    }
    int _2460 = _2454;
    float _2462 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2464 = _2462 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2466 = uint(_2448) >= uint(_1145);
    float _2468 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2470 = _2468 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2472 = !_2466;
    int _2474 = _2472 ? 0 : (-1);
    float _2476 = 1.0 / _2464;
    bool _2478 = _1236 > 0.5;
    float _2480 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2482 = _2480 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    int _2484 = ~_2320;
    int _2486 = _2484 + _2378;
    int _2488 = _2486 + 1;
    float _2490 = -_239;
    int _2492 = _2478 ? as_type<int>(_2490) : as_type<int>(_239);
    bool _2494 = _1240 != 1;
    float _2496 = 1.0 / _2470;
    float _2498 = in.m_48.x;
    float _2500 = in.m_48.y;
    float _2502 = in.m_48.z;
    int _2504 = _1097 * _2488;
    int _2506 = _2504 + _1600;
    bool _2508 = _1051 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2510 = isnan(_1051);
    bool _2512 = _2508 || _2510;
    bool _2514 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2516 = _2512 || _2514;
    float _2518 = float(_2516);
    bool _2520 = !_2078;
    int _2522 = _2520 ? 0 : 1;
    float _2524 = 1.0 / _2482;
    float _2526 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2528 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2526;
    float _2530 = -_2518;
    float _2532 = _2530 + 1.0;
    bool _2534 = _1051 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2536 = isnan(_1051);
    bool _2538 = _2534 || _2536;
    bool _2540 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2542 = _2538 || _2540;
    float _2544 = float(_2542);
    float _2546 = 0.0;
    if (!_2494)
    {
        _2546 = _1238;
    }
    float _2548 = _2546;
    float _2550 = 0.0;
    float _2552 = _2548;
    if (!_2494)
    {
        _2550 = _1238;
    }
    float _2554 = _2550;
    float _2556 = _2554;
    if (!_2494)
    {
        _2416 = _1252;
    }
    float _2558 = _2416;
    float _2560 = 0.0;
    float _2562 = _2558;
    if (!_2494)
    {
        _2560 = _1252;
    }
    float _2564 = _2560;
    float _2566 = _2564;
    if (_2494)
    {
        _2552 = _1236;
    }
    float _2568 = _2552;
    if (_2494)
    {
        _2556 = _1236;
    }
    float _2570 = _2556;
    if (_2494)
    {
        _2562 = _1238;
    }
    float _2572 = _2562;
    float _2574 = _201 * _2500;
    if (_2494)
    {
        _2566 = _1238;
    }
    float _2576 = _2566;
    float _2578 = _207 * _2500;
    bool _2580 = _1242 != 2;
    float _2582 = fma(_199, _2498, _2574);
    float _2584 = _1236 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2586 = fma(_205, _2498, _2578);
    float _2588 = fma(_203, _2502, _2582);
    float _2590 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2592 = fma(_209, _2502, _2586);
    float _2594 = _2568 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2596 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2598 = log2(_2596);
    float _2600 = -_2590;
    float _2602 = fma(_2584, 2.0, _2600);
    float _2604 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2606 = 0.0;
    if (_2580)
    {
        _2606 = _1236;
    }
    float _2608 = _2606;
    float _2610 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2612 = _2608;
    if (_2580)
    {
        _2418 = _1238;
    }
    float _2614 = _2418;
    float _2616 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2618 = _2614;
    if (!_2580)
    {
        _2612 = _1252;
    }
    float _2620 = _2612;
    float _2622 = fma(_2610, -2.0, _2426);
    if (!_2580)
    {
        _2618 = _1236;
    }
    float _2624 = _2618;
    float _2626 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2616);
    int _2628 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2630 = _2628 != 0;
    float _2632 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2634 = -_2430;
    float _2636 = fma(_2594, 2.0, _2634);
    float _2638 = -_2604;
    float _2640 = fma(_2632, 2.0, _2638);
    float _2642 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    bool _2644 = !_2630;
    float _2646 = _2644 ? _239 : as_type<float>(_2492);
    float _2648 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2650 = _2648 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2652 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2654 = isnan(0.0);
    bool _2656 = _2652 || _2654;
    bool _2658 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2660 = _2656 || _2658;
    float _2662 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2642);
    float _2664 = _1246 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2666 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2668 = _2624 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2670 = fma(_2664, -2.0, _2412);
    float _2672 = _2500 + _1276;
    float _2674 = fma(_2668, -2.0, _2452);
    float _2676 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2678 = -_133;
    float _2680 = fma(_2678, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2602);
    float _2682 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2684 = _1238 * 2.0;
    float _2686 = fma(_2570, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2676);
    float _2688 = fma(_2576, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2666);
    float _2690 = _2598 * _133;
    float _2692 = 1.0 / _2650;
    float _2694 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2682);
    float _2696 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2698 = _2696 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2700 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2626);
    float _2702 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2704 = _2702 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2706 = _2620 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2708 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2622);
    float _2710 = exp2(_2690);
    float _2712 = _2572 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2714 = -_2450;
    float _2716 = fma(_2706, 2.0, _2714);
    float _2718 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2720 = fma(_2712, -2.0, _2436);
    float _2722 = -_133;
    float _2724 = fma(_2722, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2640);
    float _2726 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2728 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2718);
    float _2730 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2694);
    float _2732 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2734 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2726);
    float _2736 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2728);
    float _2738 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2670);
    float _2740 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2732);
    float _2742 = -_2710;
    float _2744 = _2742 + 1.0;
    float _2746 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2662);
    float _2748 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2734);
    float _2750 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2740);
    float _2752 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2686);
    float _2754 = _2660 ? _2744 : 0.0;
    float _2756 = _1236 * 2.0;
    bool _2758 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2760 = isnan(1.0);
    bool _2762 = _2758 || _2760;
    bool _2764 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2766 = _2762 || _2764;
    float _2768 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2770 = 1.0 + _2768;
    float _2772 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2688);
    float _2774 = floor(_2756);
    float _2776 = -_133;
    float _2778 = fma(_2776, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2636);
    float _2780 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2720);
    float _2782 = -_133;
    float _2784 = fma(_2782, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2716);
    float _2786 = fma(_2074, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2724);
    float _2788 = -_2700;
    float _2790 = _2788 + 1.0;
    float _2792 = 1.0 / _2770;
    float _2794 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2674);
    float _2796 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2798 = _1051 + _2796;
    bool _2800 = _1051 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2802 = isnan(_1051);
    bool _2804 = _2800 || _2802;
    bool _2806 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2808 = _2804 || _2806;
    float _2810 = float(_2808);
    float _2812 = -_2790;
    float _2814 = fma(_2812, _2054, _2786);
    bool _2816 = _1051 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2818 = isnan(_1051);
    bool _2820 = _2816 || _2818;
    bool _2822 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2824 = _2820 || _2822;
    float _2826 = float(_2824);
    float _2828 = -_2746;
    float _2830 = _2828 + 1.0;
    float _2832 = 1.0 / _2698;
    float _2834 = _2646 + 0.5;
    int _2836 = abs(_2352);
    float _2838 = -_2772;
    float _2840 = _2838 + 1.0;
    float _2842 = -_2752;
    float _2844 = _2842 + 1.0;
    int _2846 = ~_2250;
    int _2848 = _2846 + _2306;
    int _2850 = _2848 + 1;
    float _2852 = -_2750;
    float _2854 = _2852 + 1.0;
    int _2856 = ~_2438;
    int _2858 = _2856 + _2474;
    int _2860 = _2858 + 1;
    if (_2766)
    {
        float _2862 = _2754 * _2792;
        _143 = _2862;
    }
    float _2864 = _143;
    bool _2866 = _2774 >= 0.0;
    bool _2868 = isnan(_2774);
    bool _2870 = _2866 || _2868;
    bool _2872 = isnan(0.0);
    bool _2874 = _2870 || _2872;
    float _2876 = floor(_2684);
    float _2878 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2880 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2878;
    int _2882 = _1069 * _2850;
    int _2884 = _2882 + _1514;
    int _2886 = _2874 ? 0 : 1;
    int _2888 = _1145 * _2860;
    int _2890 = _2888 + _1892;
    bool _2892 = _2774 > 0.0;
    float _2894 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2896 = _2894 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2898 = _2880 * _2832;
    float _2900 = 1.0 / _2704;
    int _2902 = ~_2886;
    int _2904 = _2902 + 1;
    int _2906 = _2904 + 1;
    float _2908 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2910 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2908;
    float _2912 = _2896 * _2692;
    int _2914 = abs(_2374);
    float _2916 = -_2748;
    float _2918 = _2916 + 1.0;
    float _2920 = -_2736;
    float _2922 = _2920 + 1.0;
    float _2924 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2926 = _2906;
    if (!_2892)
    {
        int _2928 = ~_2886;
        int _2930 = _2928 + 1;
        _2926 = _2930;
    }
    int _2932 = _2926;
    float _2934 = _1252 * 2.0;
    bool _2936 = _2876 >= 0.0;
    bool _2938 = isnan(_2876);
    bool _2940 = _2936 || _2938;
    bool _2942 = isnan(0.0);
    bool _2944 = _2940 || _2942;
    float _2946 = _2910 * _2900;
    float _2948 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2950 = _2948 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    int _2952 = _2944 ? 0 : 1;
    float _2954 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2956 = _2954 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    bool _2958 = _2876 > 0.0;
    float _2960 = 1.0 / _2950;
    bool _2962 = _1051 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2964 = isnan(_1051);
    bool _2966 = _2962 || _2964;
    bool _2968 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2970 = _2966 || _2968;
    float _2972 = float(_2970);
    float _2974 = _2956 * _2476;
    float _2976 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2978 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2976;
    float _2980 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2982 = _2980 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2984 = _2924 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2986 = -_2972;
    float _2988 = _2986 + 1.0;
    float _2990 = _2978 * _2524;
    float _2992 = _2982 * _2496;
    bool _2994 = _1051 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2996 = isnan(_1051);
    bool _2998 = _2994 || _2996;
    bool _3000 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3002 = _2998 || _3000;
    float _3004 = float(_3002);
    float _3006 = floor(_2934);
    int _3008 = ~_2952;
    int _3010 = _3008 + 1;
    int _3012 = _3010 + 1;
    float _3014 = fma(_2974, _2798, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    int _3016 = _3012;
    if (!_2958)
    {
        int _3018 = ~_2952;
        int _3020 = _3018 + 1;
        _3016 = _3020;
    }
    int _3022 = _3016;
    float _3024 = -_3004;
    float _3026 = _3024 + 1.0;
    bool _3028 = !_1596;
    int _3030 = _3028 ? _2506 : (-1);
    float _3032 = _2528 * _2960;
    int _3034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3036 = _3034 != 0;
    int _3038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3040 = _3038 != 0;
    int _3042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3044 = _3042 != 0;
    float _3046 = _2972 * _3026;
    bool _3048 = _1051 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3050 = isnan(_1051);
    bool _3052 = _3048 || _3050;
    bool _3054 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3056 = _3052 || _3054;
    float _3058 = float(_3056);
    float _3060 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3062 = _1051 + _3060;
    bool _3064 = !_3036;
    int _3066 = _3064 ? 0 : 1;
    float _3068 = -_3058;
    float _3070 = _3068 + 1.0;
    float _3072 = _3058 * _2988;
    bool _3074 = _3006 >= 0.0;
    bool _3076 = isnan(_3006);
    bool _3078 = _3074 || _3076;
    bool _3080 = isnan(0.0);
    bool _3082 = _3078 || _3080;
    float _3084 = fma(_2898, _3062, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3086 = _2518 * _3070;
    bool _3088 = _1051 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3090 = isnan(_1051);
    bool _3092 = _3088 || _3090;
    bool _3094 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3096 = _3092 || _3094;
    float _3098 = float(_3096);
    float _3100 = in.m_64.w;
    int _3102 = _3082 ? 0 : 1;
    bool _3104 = _3006 > 0.0;
    float _3106 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3108 = _1051 + _3106;
    float _3110 = _3098 * _2532;
    float _3112 = -_3098;
    float _3114 = _3112 + 1.0;
    float _3116 = in.m_66.w;
    float _3118 = fma(_2912, _3108, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3120 = -_2544;
    float _3122 = _3120 + 1.0;
    float _3124 = _2544 * _3114;
    float _3126 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3128 = _1051 + _3126;
    float _3130 = -_2810;
    float _3132 = _3130 + 1.0;
    float _3134 = _2810 * _3122;
    float _3136 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3138 = _1051 + _3136;
    float _3140 = fma(_2946, _3128, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3142 = _2826 * _3132;
    float _3144 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3146 = _1051 + _3144;
    float _3148 = -_2826;
    float _3150 = _3148 + 1.0;
    float _3152 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3154 = _1051 + _3152;
    float _3156 = _3084 * _3142;
    float _3158 = fma(_3032, _3146, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3160 = fma(_2990, _3138, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3162 = fma(_2992, _3154, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3164 = _2588 + _3100;
    int _3166 = _2214 >> 31;
    float _3168 = fma(_3150, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3156);
    bool _3170 = !_2228;
    int _3172 = _3170 ? 0 : 1;
    int _3174 = _3166 & 3;
    float _3176 = fma(_3118, _3134, _3168);
    float _3178 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3180 = _2672 + _3178;
    float _3182 = _2592 + _3116;
    int _3184 = _2214 + _3174;
    float _3186 = fma(_3140, _3124, _3176);
    float _3188 = _3180 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3190 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3192 = _3164 + _3190;
    int _3194 = _3184 >> 2;
    float _3196 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3198 = _3182 + _3196;
    float _3200 = _1238 + _1236;
    float _3202 = fma(_3192, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3188);
    int _3204 = _3194 << 4;
    int _3206 = _3204 + 656;
    float _3208 = _1236 + _1252;
    float _3210 = _1236 + (-0.5);
    float _3212 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3202);
    bool _3214 = _2226 != 3;
    uint _3216 = uint(int(uint(_3206) >> uint(2)));
    uint _3218 = uint(int(uint(int(_3216)) >> uint(2)));
    int _3220 = int(_3216) & 3;
    float _3222 = (*spvDescriptorSet0.vp_c9)._m0[int(_3218)][_3220];
    int _3224 = int(_3216) + 1;
    uint _3226 = uint(int(uint(_3224) >> uint(2)));
    int _3228 = _3224 & 3;
    float _3230 = (*spvDescriptorSet0.vp_c9)._m0[int(_3226)][_3228];
    int _3232 = ~_3102;
    int _3234 = _3232 + 1;
    int _3236 = _3234 + 1;
    float _3238 = _1238 + _1252;
    bool _3240 = !_3214;
    int _3242 = _3240 ? 0 : (-1);
    bool _3244 = _3212 >= 0.0;
    float _3246 = fma(_3014, _3110, _3186);
    float _3248 = _3200 + (-1.0);
    int _3250 = _3236;
    float _3252 = _3072;
    float _3254 = _3164;
    if (!_3104)
    {
        int _3256 = ~_3102;
        int _3258 = _3256 + 1;
        _3250 = _3258;
    }
    int _3260 = _3250;
    int _3262 = _3206 + 8;
    uint _3264 = uint(int(uint(_3262) >> uint(2)));
    uint _3266 = uint(int(uint(int(_3264)) >> uint(2)));
    int _3268 = int(_3264) & 3;
    float _3270 = (*spvDescriptorSet0.vp_c9)._m0[int(_3266)][_3268];
    int _3272 = int(_3264) + 1;
    uint _3274 = uint(int(uint(_3272) >> uint(2)));
    int _3276 = _3272 & 3;
    float _3278 = (*spvDescriptorSet0.vp_c9)._m0[int(_3274)][_3276];
    float _3280 = fma(_3160, _3086, _3246);
    float _3282 = _1238 + (-0.5);
    float _3284 = _2224 + (-0.5);
    float _3286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3288 = fma(_3162, _3072, _3280);
    int _3290 = abs(_3172);
    float _3292 = -_3284;
    float _3294 = -_2738;
    float _3296 = fma(_3292, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3294);
    int _3298 = abs(_3242);
    if (_3244)
    {
        _3252 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3300 = _3252;
    float _3302 = fma(_2830, _2224, _3296);
    float _3304 = fma(_2834, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2680);
    float _3306 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3308 = int(_3306);
    int _3310 = abs(_3066);
    if (_3244)
    {
        float _3312 = _3300 * 5.0;
        _2062 = as_type<int>(_3312);
    }
    int _3314 = _2062;
    float _3316 = _2232 + (-0.5);
    out.m_80.x = _2814;
    out.m_80.y = _3302;
    bool _3318 = _1069 == 0;
    float _3320 = -_3316;
    float _3322 = -_2708;
    float _3324 = fma(_3320, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3322);
    int _3326 = abs(_2288);
    float _3328 = fma(_3158, _3046, _3288);
    float _3330 = _3180 * _3180;
    if (_3244)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10278 = as_type<float>(_3314);
        out.gl_Position.z = _10278;
    }
    float _3332 = _3286 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3334 = _2012 + 0.5;
    float _3336 = fma(_3004, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3328);
    bool _3338 = !_3318;
    int _3340 = _3338 ? _2884 : (-1);
    if (_3244)
    {
        out.m_55.x = 0.0;
    }
    float _3342 = fma(_3332, _3334, _2778);
    int _3344 = ~_3308;
    int _3346 = _3344 + 1;
    int _3348 = ~_3308;
    int _3350 = _3348 + 1;
    out.m_82.x = _3336;
    float _3352 = fma(_3192, _3192, _3330);
    float _3354 = fma(_3198, _3198, _3352);
    int _3356 = ~_3326;
    int _3358 = _3356 + 1;
    int _3360 = _3358 + 1;
    float _3362 = fma(_3248, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _3364 = ~_3290;
    int _3366 = _3364 + 1;
    int _3368 = _3366 + 1;
    int _3370 = _3360 * as_type<int>(_3230);
    int _3372 = abs(_2364);
    float _3374 = rsqrt(_3354);
    int _3376 = ~_2836;
    int _3378 = _3376 + 1;
    int _3380 = _3378 + 1;
    int _3382 = _3368 * as_type<int>(_3222);
    int _3384 = _3382 + _3370;
    float _3386 = float(uint(_3308));
    float _3388 = _535 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _3390 = _3380 * as_type<int>(_3270);
    int _3392 = _3390 + _3384;
    int _3394 = abs(_3308);
    float _3396 = _3388 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3398 = ~_3298;
    int _3400 = _3398 + 1;
    int _3402 = _3400 + 1;
    float _3404 = 1.0 / _3386;
    int _3406 = ~_3372;
    int _3408 = _3406 + 1;
    int _3410 = _3408 + 1;
    float _3412 = _1752 + (-0.5);
    float _3414 = float(uint(_3394));
    int _3416 = _3402 * as_type<int>(_3278);
    int _3418 = _3416 + _3392;
    float _3420 = _3396 * _3374;
    float _3422 = -_2984;
    float _3424 = -_2780;
    float _3426 = fma(_3422, _3412, _3424);
    int _3428 = _3418 * _3410;
    float _3430 = 1.0 / _3414;
    int _3432 = _2370 >> 31;
    float _3434 = _3180 * _3420;
    int _3436 = _3030 * _3372;
    int _3438 = _3436 + _3428;
    int _3440 = _2034 >> 31;
    float _3442 = _3192 * _3420;
    float _3444 = -_3434;
    float _3446 = _3180 + _3444;
    int _3448 = as_type<int>(_3404) + (-2);
    float _3450 = fma(_1752, _2840, _3426);
    float _3452 = float(uint(_3438));
    float _3454 = _3446 * _3446;
    int _3456 = _3440 & 3;
    float _3458 = -_3442;
    float _3460 = _3192 + _3458;
    int _3462 = ~_3394;
    int _3464 = _3462 + 1;
    float _3466 = as_type<float>(_3448) * _3452;
    int _3468 = _3432 & 3;
    float _3470 = fma(_3460, _3460, _3454);
    int _3472 = _2034 + _3456;
    int _3474 = _2370 + _3468;
    float _3476 = trunc(_3466);
    float _3478 = precise::max(_3476, 0.0);
    uint _3480 = uint(_3478);
    float _3482 = float(_3260);
    float _3484 = in.m_84.x;
    float _3486 = in.m_84.y;
    float _3488 = in.m_84.z;
    int _3490 = abs(_3438);
    int _3492 = _3474 >> 2;
    int _3494 = _3472 >> 2;
    int _3496 = as_type<int>(_3430) + (-2);
    float _3498 = float(uint(_3490));
    float _3500 = float(_3310);
    int _3502 = _3346 * int(_3480);
    int _3504 = _3502 + _3438;
    int _3506 = _3494 << 4;
    int _3508 = _3506 + 368;
    float _3510 = as_type<float>(_3496) * _3498;
    int _3512 = _3492 << 4;
    int _3514 = _3512 + 800;
    float _3516 = float(uint(_3504));
    uint _3518 = uint(int(uint(_3508) >> uint(2)));
    uint _3520 = uint(int(uint(int(_3518)) >> uint(2)));
    int _3522 = int(_3518) & 3;
    float _3524 = (*spvDescriptorSet0.vp_c9)._m0[int(_3520)][_3522];
    int _3526 = int(_3518) + 1;
    uint _3528 = uint(int(uint(_3526) >> uint(2)));
    int _3530 = _3526 & 3;
    float _3532 = (*spvDescriptorSet0.vp_c9)._m0[int(_3528)][_3530];
    float _3534 = _3500 * _3482;
    float _3536 = -_2730;
    float _3538 = _3536 + 1.0;
    float _3540 = _3198 * _3420;
    float _3542 = trunc(_3510);
    float _3544 = precise::max(_3542, 0.0);
    uint _3546 = uint(_3544);
    float _3548 = as_type<float>(_3448) * _3516;
    float _3550 = fma(_2232, _3538, _3324);
    float _3552 = -_2844;
    float _3554 = fma(_2012, _3552, _3342);
    uint _3556 = uint(int(uint(_3514) >> uint(2)));
    uint _3558 = uint(int(uint(int(_3556)) >> uint(2)));
    int _3560 = int(_3556) & 3;
    float _3562 = (*spvDescriptorSet0.vp_c9)._m0[int(_3558)][_3560];
    int _3564 = int(_3556) + 1;
    uint _3566 = uint(int(uint(_3564) >> uint(2)));
    int _3568 = _3564 & 3;
    float _3570 = (*spvDescriptorSet0.vp_c9)._m0[int(_3566)][_3568];
    float _3572 = -_3540;
    float _3574 = _3198 + _3572;
    float _3576 = _3534 * (-2.0);
    float _3578 = -_2854;
    float _3580 = fma(_2646, _3578, _3304);
    float _3582 = trunc(_3548);
    float _3584 = precise::max(_3582, 0.0);
    uint _3586 = uint(_3584);
    float _3588 = fma(_3574, _3574, _3470);
    float _3590 = fma(_3576, _3484, _3484);
    float _3592 = fma(_3362, _3576, _3362);
    int _3594 = _3508 + 8;
    uint _3596 = uint(int(uint(_3594) >> uint(2)));
    uint _3598 = uint(int(uint(int(_3596)) >> uint(2)));
    int _3600 = int(_3596) & 3;
    float _3602 = (*spvDescriptorSet0.vp_c9)._m0[int(_3598)][_3600];
    int _3604 = int(_3596) + 1;
    uint _3606 = uint(int(uint(_3604) >> uint(2)));
    int _3608 = _3604 & 3;
    float _3610 = (*spvDescriptorSet0.vp_c9)._m0[int(_3606)][_3608];
    out.m_86.x = _3580;
    out.m_86.y = _3550;
    out.m_86.z = _3554;
    out.m_86.w = _3450;
    float _3612 = fma(_3210, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3590);
    int _3614 = abs(_2136);
    int _3616 = _3464 * int(_3546);
    int _3618 = _3616 + _3490;
    float _3620 = fma(_3592, _2864, _3612);
    int _3622 = ~_3614;
    int _3624 = _3622 + 1;
    int _3626 = _3624 + 1;
    float _3628 = float(uint(_3618));
    int _3630 = _3514 + 8;
    uint _3632 = uint(int(uint(_3630) >> uint(2)));
    uint _3634 = uint(int(uint(int(_3632)) >> uint(2)));
    int _3636 = int(_3632) & 3;
    float _3638 = (*spvDescriptorSet0.vp_c9)._m0[int(_3634)][_3636];
    int _3640 = int(_3632) + 1;
    uint _3642 = uint(int(uint(_3640) >> uint(2)));
    int _3644 = _3640 & 3;
    float _3646 = (*spvDescriptorSet0.vp_c9)._m0[int(_3642)][_3644];
    int _3648 = int(_3480) + int(_3586);
    float _3650 = as_type<float>(_3496) * _3628;
    int _3652 = abs(_2424);
    bool _3654 = !_2386;
    int _3656 = _3654 ? 0 : 1;
    int _3658 = _3350 * _3648;
    int _3660 = _3658 + _3438;
    int _3662 = ~_3652;
    int _3664 = _3662 + 1;
    int _3666 = _3664 + 1;
    float _3668 = trunc(_3650);
    float _3670 = precise::max(_3668, 0.0);
    uint _3672 = uint(_3670);
    bool _3674 = _2076 != 3;
    int _3676 = abs(_2522);
    int _3678 = abs(_3656);
    int _3680 = ~_3676;
    int _3682 = _3680 + 1;
    int _3684 = _3682 + 1;
    int _3686 = ~_3678;
    int _3688 = _3686 + 1;
    int _3690 = _3688 + 1;
    int _3692 = _3626 * as_type<int>(_3532);
    bool _3694 = !_3674;
    int _3696 = _3694 ? 0 : (-1);
    bool _3698 = uint(_3660) >= uint(_3308);
    int _3700 = _3684 * as_type<int>(_3524);
    int _3702 = _3700 + _3692;
    int _3704 = int(_3546) + int(_3672);
    float _3706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3708 = !_3698;
    int _3710 = _3708 ? 0 : (-1);
    int _3712 = _3666 * as_type<int>(_3570);
    int _3714 = ~_3394;
    int _3716 = _3714 + 1;
    bool _3718 = _2384 != 3;
    int _3720 = _3690 * as_type<int>(_3562);
    int _3722 = _3720 + _3712;
    int _3724 = ~_3648;
    int _3726 = _3724 + _3710;
    int _3728 = _3726 + 1;
    int _3730 = _3716 * _3704;
    int _3732 = _3730 + _3490;
    int _3734 = abs(_2200);
    float _3736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3738 = !_3718;
    int _3740 = _3738 ? 0 : (-1);
    int _3742 = _3308 * _3728;
    int _3744 = _3742 + _3438;
    bool _3746 = uint(_3732) >= uint(_3394);
    int _3748 = ~_3734;
    int _3750 = _3748 + 1;
    int _3752 = _3750 + 1;
    bool _3754 = !_3746;
    int _3756 = _3754 ? 0 : (-1);
    bool _3758 = _3308 == 0;
    int _3760 = _3752 * as_type<int>(_3602);
    int _3762 = _3760 + _3702;
    int _3764 = abs(_2460);
    bool _3766 = !_3758;
    int _3768 = _3766 ? _3744 : (-1);
    bool _3770 = _3308 == 0;
    int _3772 = _3438 ^ _3308;
    int _3774 = abs(_3696);
    uint _3776 = uint(int(uint(_3772) >> uint(31)));
    int _3778 = ~_3764;
    int _3780 = _3778 + 1;
    int _3782 = _3780 + 1;
    int _3784 = abs(_3740);
    int _3786 = ~_3756;
    int _3788 = _3704 + _3786;
    int _3790 = _3788 + 1;
    int _3792 = _3782 * as_type<int>(_3638);
    int _3794 = _3792 + _3722;
    int _3796 = ~_3774;
    int _3798 = _3796 + 1;
    int _3800 = _3798 + 1;
    int _3802 = ~int(_3776);
    int _3804 = _3802 + 1;
    int _3806 = ~_3784;
    int _3808 = _3806 + 1;
    int _3810 = _3808 + 1;
    int _3812 = _3800 * as_type<int>(_3610);
    int _3814 = _3812 + _3762;
    int _3816 = _3790 ^ _3804;
    int _3818 = abs(_2270);
    int _3820 = _3810 * as_type<int>(_3646);
    int _3822 = _3820 + _3794;
    int _3824 = ~_2914;
    int _3826 = _3824 + 1;
    int _3828 = _3826 + 1;
    int _3830 = ~_3804;
    int _3832 = _3830 + _3816;
    int _3834 = _3832 + 1;
    int _3836 = ~_3818;
    int _3838 = _3836 + 1;
    int _3840 = _3838 + 1;
    int _3842 = _3822 * _3828;
    bool _3844 = !_3770;
    int _3846 = _3844 ? _3834 : (-1);
    float _3848 = float(_3768);
    int _3850 = _3814 * _3840;
    float _3852 = float(_3846);
    float _3854 = _3736 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3856 = _3706 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3858 = _3340 * _3818;
    int _3860 = _3858 + _3850;
    bool _3862 = !_1830;
    int _3864 = _3862 ? _2890 : (-1);
    float _3866 = -_2794;
    float _3868 = fma(_3854, _3852, _3866);
    bool _3870 = !_3040;
    int _3872 = _3870 ? 0 : 1;
    float _3874 = fma(_3856, _3848, _2784);
    float _3876 = _1418 + 0.5;
    float _3878 = _1458 + (-0.5);
    int _3880 = abs(_3872);
    int _3882 = _3864 * _2914;
    int _3884 = _3882 + _3842;
    float _3886 = fma(_3856, _3876, _3874);
    float _3888 = -_3854;
    float _3890 = fma(_3888, _3878, _3868);
    float _3892 = -_2918;
    float _3894 = fma(_1418, _3892, _3886);
    float _3896 = float(_3860);
    float _3898 = fma(_1458, _2922, _3890);
    float _3900 = float(_3884);
    float _3902 = float(_2932);
    out.m_88.x = _3896;
    float _3904 = float(_3880);
    out.m_88.w = _3900;
    bool _3906 = !_3044;
    int _3908 = _3906 ? 0 : 1;
    float _3910 = _3904 * _3902;
    out.m_90.x = _3894;
    out.m_90.y = _3898;
    float _3912 = _3488;
    if (_3244)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3914 = -_3434;
    float _3916 = _2672 + _3914;
    float _3918 = -_3442;
    float _3920 = _3164 + _3918;
    float _3922 = -_3540;
    float _3924 = _3182 + _3922;
    float _3926 = float(_3022);
    float _3928 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3930 = _3916 + _3928;
    float _3932 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3934 = _3920 + _3932;
    float _3936 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3938 = _3924 + _3936;
    int _3940 = abs(_3908);
    float _3942 = _3930 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3944 = _3238 + (-1.0);
    float _3946 = _3910 * (-2.0);
    float _3948 = _3208 + (-1.0);
    float _3950 = fma(_3934, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3942);
    float _3952 = float(_3940);
    float _3954 = fma(_3944, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3956 = fma(_3946, _3486, _3486);
    float _3958 = fma(_3938, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3950);
    float _3960 = _3620 * 0.15915493667125701904296875;
    float _3962 = _3952 * _3926;
    float _3964 = fma(_3954, _3946, _3954);
    float _3966 = fma(_3282, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3956);
    bool _3968 = _3958 >= 0.0;
    float _3970 = _3962 * (-2.0);
    float _3972 = fma(_3964, _2864, _3966);
    float _3974 = sqrt(_3588);
    float _3976 = fma(_3970, _3488, _3488);
    float _3978 = _1252 + (-0.5);
    float _3980 = _3972 * 0.15915493667125701904296875;
    float _3982 = fma(_3948, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3984 = fma(_3978, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3976);
    float _3986 = _3960 * 6.283185482025146484375;
    float _3988 = sin(_3986);
    float _3990 = _3920;
    if (_3968)
    {
        _3912 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3992 = _3912;
    float _3994 = fma(_3982, _3970, _3982);
    int _3996 = as_type<int>(_3992);
    if (_3968)
    {
        out.m_55.x = 0.0;
    }
    if (_3968)
    {
        float _3998 = _3992 * 5.0;
        _3996 = as_type<int>(_3998);
    }
    int _4000 = _3996;
    float _4002 = fma(_3994, _2864, _3984);
    float _4004 = _3960 * 6.283185482025146484375;
    float _4006 = cos(_4004);
    if (_3968)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _11259 = as_type<float>(_4000);
        out.gl_Position.z = _11259;
    }
    float _4008 = _4002 * 0.15915493667125701904296875;
    float _4010 = _3980 * 6.283185482025146484375;
    float _4012 = sin(_4010);
    float _4014 = _3980 * 6.283185482025146484375;
    float _4016 = cos(_4014);
    if (_3968)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4018 = _4008 * 6.283185482025146484375;
    float _4020 = cos(_4018);
    float _4022 = _3374 * _3974;
    float _4024 = _515 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _4026 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _223);
    float _4028 = _4006 * _4016;
    float _4030 = _3388 * _4022;
    float _4032 = _4022 * _4024;
    float _4034 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _239);
    float _4036 = _4008 * 6.283185482025146484375;
    float _4038 = sin(_4036);
    float _4040 = _4006 * _4012;
    float _4042 = _4026 * _4032;
    float _4044 = _3988 * _4012;
    float _4046 = _3988 * _4016;
    float _4048 = _4034 * _4030;
    float _4050 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4052 = _4006 * _4020;
    float _4054 = _4016 * _4020;
    float _4056 = _3988 * _4020;
    float _4058 = _4012 * _4020;
    float _4060 = _4052 * _4042;
    float _4062 = _4022 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _4064 = _4062 * 0.5;
    float _4066 = fma(_4038, _4028, _4044);
    float _4068 = -_4042;
    float _4070 = _4038 * _4068;
    float _4072 = -_4046;
    float _4074 = fma(_4038, _4040, _4072);
    float _4076 = -_4040;
    float _4078 = fma(_4038, _4046, _4076);
    float _4080 = fma(_4066, _4048, _4060);
    float _4082 = _4056 * _4042;
    float _4084 = fma(_4054, _4048, _4070);
    float _4086 = fma(_4038, _4044, _4028);
    float _4088 = fma(_4074, _4064, _4080);
    float _4090 = fma(_4078, _4048, _4082);
    float _4092 = fma(_4058, _4064, _4084);
    float _4094 = _4088 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4096 = _4088 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4098 = fma(_4086, _4064, _4090);
    float _4100 = _4088 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4102 = fma(_4092, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4094);
    float _4104 = fma(_4092, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4096);
    float _4106 = fma(_4092, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4100);
    float _4108 = fma(_4098, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4102);
    float _4110 = fma(_4098, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4104);
    float _4112 = fma(_4098, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4106);
    float _4114 = _4108 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _4116 = _4110 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _4118 = _4066 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4120 = _4112 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _4122 = _3164 + _4114;
    float _4124 = _3182 + _4116;
    float _4126 = _4066 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4128 = _4066 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4130 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4132 = _4122 + _4130;
    float _4134 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4136 = _4124 + _4134;
    float _4138 = fma(_4054, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4126);
    float _4140 = fma(_4050, _4050, 1.0);
    float _4142 = _4132 * _4132;
    float _4144 = _4136 * _4136;
    float _4146 = fma(_4054, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4118);
    float _4148 = fma(_4054, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4128);
    float _4150 = rsqrt(_4140);
    float _4152 = _4142 + _4144;
    float _4154 = _4052 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4156 = _4052 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4158 = _4052 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4160 = _2672 + _4120;
    float _4162 = -_4038;
    float _4164 = fma(_4162, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4154);
    float _4166 = -_4038;
    float _4168 = fma(_4166, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4156);
    float _4170 = sqrt(_4152);
    float _4172 = _4074 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4174 = _4074 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4176 = _4074 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4178 = -_4038;
    float _4180 = fma(_4178, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4158);
    float _4182 = fma(_4058, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4172);
    float _4184 = fma(_4058, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4174);
    float _4186 = fma(_4058, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4176);
    bool _4188 = _4170 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4190 = _4174;
    float _4192 = _4172;
    float _4194 = _4158;
    float _4196 = _4058;
    float _4198 = _4176;
    if (!_4188)
    {
        _4190 = _4144;
    }
    float _4200 = _4190;
    float _4202 = _4200;
    if (!_4188)
    {
        _4192 = _4142;
    }
    float _4204 = _4192;
    float _4206 = _4204;
    if (!_4188)
    {
        _4194 = _4122;
    }
    float _4208 = _4194;
    float _4210 = _4208;
    if (!_4188)
    {
        _4196 = _4124;
    }
    float _4212 = _4196;
    float _4214 = _4212;
    if (!_4188)
    {
        _4198 = _4160;
    }
    float _4216 = _4198;
    bool _4218 = !_4188;
    float _4220 = _4216;
    if (!_4218)
    {
        float _4222 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4224 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4226 = _4170 + _4224;
        float _4228 = rsqrt(_4152);
        float _4230 = _4226 * _4222;
        float _4232 = _4160 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4234 = _4230 * 0.15915493667125701904296875;
        float _4236 = _4234 * 6.283185482025146484375;
        float _4238 = sin(_4236);
        float _4240 = _4234 * 6.283185482025146484375;
        float _4242 = cos(_4240);
        float _4244 = fma(_4238, _4232, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4246 = _4228 * _4244;
        float _4248 = _4242 + (-1.0);
        float _4250 = fma(_4132, _4246, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4252 = fma(_4136, _4246, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4254 = _4248 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4256 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4258 = _4250 + _4256;
        float _4260 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4262 = _4252 + _4260;
        float _4264 = fma(_4160, _4242, _4254);
        float _4266 = _4258 * _4258;
        float _4268 = _4262 * _4262;
        _4220 = _4264;
        _4206 = _4266;
        _4202 = _4268;
        _4210 = _4250;
        _4214 = _4252;
    }
    float _4270 = _4220;
    float _4272 = _4206;
    float _4274 = _4202;
    float _4276 = _4210;
    float _4278 = _4214;
    float _4280 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4282 = _4270 + _4280;
    float _4284 = fma(_4056, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4164);
    float _4286 = fma(_4056, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4168);
    float _4288 = fma(_4056, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4180);
    float _4290 = fma(_4282, _4282, _4272);
    float _4292 = fma(_4086, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4182);
    float _4294 = fma(_4086, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4184);
    float _4296 = fma(_4086, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4186);
    float _4298 = _4290 + _4274;
    float _4300 = _4050 * _4150;
    float _4302 = fma(_4078, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4138);
    float _4304 = _239 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4306 = _4050 * _4284;
    float _4308 = fma(_4078, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4146);
    float _4310 = _4050 * _4286;
    float _4312 = fma(_4078, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4148);
    float _4314 = _4050 * _4288;
    float _4316 = -_4292;
    float _4318 = _4300 * _4316;
    float _4320 = -_4294;
    float _4322 = _4300 * _4320;
    float _4324 = -_4296;
    float _4326 = _4300 * _4324;
    float _4328 = fma(_4304, _4302, _4306);
    float _4330 = sqrt(_4298);
    float _4332 = fma(_4304, _4308, _4310);
    float _4334 = fma(_4304, _4312, _4314);
    float _4336 = fma(_4150, _4284, _4318);
    float _4338 = fma(_4150, _4286, _4322);
    float _4340 = _4294 + _4332;
    float _4342 = fma(_4150, _4288, _4326);
    float _4344 = _4292 + _4328;
    float _4346 = _4296 + _4334;
    out.m_92.x = _4302;
    out.m_92.y = _4308;
    out.m_92.z = _4312;
    out.m_94.x = _4336;
    out.m_94.y = _4338;
    out.m_94.z = _4342;
    bool _4348 = _4330 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4350 = isnan(_4330);
    bool _4352 = _4348 || _4350;
    bool _4354 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4356 = _4352 || _4354;
    out.m_96.x = _4344;
    out.m_96.y = _4340;
    out.m_96.z = _4346;
    float _4358 = _4304;
    if (!_4356)
    {
        _4358 = 1.0;
    }
    float _4360 = _4358;
    bool _4362 = !_4356;
    float _4364 = _4360;
    if (!_4362)
    {
        bool _4366 = _4330 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4368 = isnan(_4330);
        bool _4370 = _4366 || _4368;
        bool _4372 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4374 = _4370 || _4372;
        if (!_4374)
        {
            float _4376 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4378 = _4330 + _4376;
            float _4380 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4382 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4380;
            float _4384 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4386 = _4384 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4388 = 1.0 / _4382;
            float _4390 = _4378 * _4388;
            float _4392 = fma(_4390, _4386, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4364 = _4392;
            _4394 = true;
        }
        else
        {
            bool _4396 = _4330 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4398 = isnan(_4330);
            bool _4400 = _4396 || _4398;
            bool _4402 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4404 = _4400 || _4402;
            if (!_4404)
            {
                float _4406 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4408 = _4330 + _4406;
                float _4410 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4412 = _4410 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4414 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4416 = _4414 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4418 = 1.0 / _4412;
                float _4420 = _4408 * _4418;
                float _4422 = fma(_4420, _4416, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4364 = _4422;
                _4394 = true;
            }
            else
            {
                _4364 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4394 = false;
    float _4424 = _4364;
    float _4426 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4428 = _4270 + _4426;
    float _4430 = _3916 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4432 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4434 = _4276 + _4432;
    float _4436 = fma(_4428, _4424, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4438 = fma(_3920, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4430);
    float _4440 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4442 = _4278 + _4440;
    float _4444 = fma(_4434, _4424, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4446 = -_2672;
    float _4448 = _4446 + _4436;
    float _4450 = fma(_3924, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4438);
    float _4452 = fma(_4442, _4424, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4454 = -_3164;
    float _4456 = _4454 + _4444;
    float _4458 = _4448 * _4448;
    float _4460 = _4450 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4462 = _3916 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4464 = -_3182;
    float _4466 = _4464 + _4452;
    float _4468 = fma(_4456, _4456, _4458);
    float _4470 = 1.0 / _4460;
    float _4472 = fma(_3920, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4462);
    float _4474 = fma(_4466, _4466, _4468);
    float _4476 = fma(_3924, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4472);
    float _4478 = sqrt(_4474);
    float _4480 = _4476 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4482 = _4480 + _4460;
    float _4484 = _4482 * _4470;
    float _4486 = _4484 * 0.5;
    bool _4488 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4490 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4492 = _4488 || _4490;
    bool _4494 = isnan(0.5);
    bool _4496 = _4492 || _4494;
    float _4498 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4500 = fma(_4486, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4498);
    bool _4502 = _4478 > 0.0;
    float _4504 = 1.0 / _4500;
    bool _4506 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4508 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4510 = _4506 || _4508;
    bool _4512 = isnan(0.5);
    bool _4514 = _4510 || _4512;
    float _4516 = _4450;
    float _4518 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _4520 = _4470;
    float _4522 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4524 = _4444;
    if (!_4502)
    {
        _4516 = _4444;
    }
    float _4526 = _4516;
    float _4528 = _4526;
    float _4530 = _4526;
    if (!_4502)
    {
        _4518 = _4436;
    }
    float _4532 = _4518;
    float _4534 = _4532;
    float _4536 = _4532;
    if (!_4502)
    {
        _4520 = _4452;
    }
    float _4538 = _4520;
    bool _4540 = !_4502;
    float _4542 = _4538;
    float _4544 = _4538;
    if (!_4540)
    {
        float _4546 = _235 * _235;
        float _4548 = fma(_243, _243, _4546);
        float _4550 = fma(_245, _245, _4548);
        float _4552 = rsqrt(_4474);
        float _4554 = sqrt(_4550);
        float _4556 = _4456 * _4552;
        float _4558 = _4448 * _4552;
        float _4560 = _4466 * _4552;
        bool _4562 = _4554 > 0.0;
        _4522 = _4552;
        if (!_4562)
        {
            _4528 = _4444;
        }
        float _4564 = _4528;
        _4530 = _4564;
        if (!_4562)
        {
            _4534 = _4436;
        }
        float _4566 = _4534;
        _4536 = _4566;
        if (!_4562)
        {
            _4542 = _4452;
        }
        float _4568 = _4542;
        bool _4570 = !_4562;
        _4544 = _4568;
        if (!_4570)
        {
            float _4572 = rsqrt(_4550);
            float _4574 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4576 = _235 * _4572;
            float _4578 = _243 * _4572;
            float _4580 = _4558 * _4576;
            float _4582 = _245 * _4572;
            float _4584 = fma(_4556, _4578, _4580);
            float _4586 = _4574 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4588 = fma(_4560, _4582, _4584);
            float _4590 = _4588 * _4586;
            float _4592 = fma(_243, _4590, _4444);
            float _4594 = fma(_235, _4590, _4436);
            float _4596 = fma(_245, _4590, _4452);
            _4530 = _4592;
            _4536 = _4594;
            _4544 = _4596;
            _4522 = _4578;
        }
    }
    float _4598 = _4530;
    float _4600 = _4536;
    float _4602 = _4544;
    float _4604 = _4522;
    float _4606 = -_3442;
    float _4608 = _4606 + _4598;
    float _4610 = -_3434;
    float _4612 = _4610 + _4600;
    float _4614 = -_3540;
    float _4616 = _4614 + _4602;
    float _4618 = _4604;
    float _4620 = _4612;
    float _4622 = _4608;
    float _4624 = _4616;
    if (_4496)
    {
        _4618 = 1.0;
    }
    float _4626 = _4618;
    float _4628 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4630 = _4504 * _4628;
    float _4632 = _4626;
    if (!_4514)
    {
        float _4634 = _3930 * _3930;
        float _4636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4638 = -_3182;
        float _4640 = _4638 + _4602;
        float _4642 = fma(_3934, _3934, _4634);
        float _4644 = fma(_3938, _3938, _4642);
        float _4646 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4648 = sqrt(_4644);
        float _4650 = 1.0 / _4022;
        float _4652 = _4646 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4654 = precise::min(_4648, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4656 = _4654 * _4636;
        float _4658 = _4656 * _4650;
        float _4660 = -_2672;
        float _4662 = _4660 + _4600;
        float _4664 = -_3164;
        float _4666 = _4664 + _4598;
        float _4668 = _4652 * _4658;
        float _4670 = _4640 * _4658;
        float _4672 = fma(_4662, _4668, _3916);
        float _4674 = fma(_4666, _4668, _3920);
        float _4676 = fma(_4652, _4670, _3924);
        _4620 = _4672;
        _4622 = _4674;
        _4624 = _4676;
        _249 = _4636;
    }
    float _4678 = _4620;
    float _4680 = _4622;
    float _4682 = _4624;
    float _4684 = _249;
    float _4686 = _4684;
    if (!_4496)
    {
        float _4688 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4690 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4692 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4690;
        float _4694 = _4688 * 0.15915493667125701904296875;
        float _4696 = _4694 * 6.283185482025146484375;
        float _4698 = cos(_4696);
        float _4700 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4702 = _4700 * 0.15915493667125701904296875;
        float _4704 = _4694 * 6.283185482025146484375;
        float _4706 = sin(_4704);
        float _4708 = 1.0 / _4698;
        float _4710 = _4702 * 6.283185482025146484375;
        float _4712 = cos(_4710);
        float _4714 = _4706 * _4708;
        float _4716 = _4702 * 6.283185482025146484375;
        float _4718 = sin(_4716);
        float _4720 = _4712 * _4714;
        float _4722 = 1.0 / _4692;
        float _4724 = 1.0 / _4720;
        float _4726 = _4718 * _4724;
        float _4728 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4730 = fma(_4630, _4726, _4728);
        float _4732 = _4730 * _4722;
        float _4734 = precise::clamp(_4732, 0.0, 1.0);
        _3254 = _4702;
        _4632 = _4734;
    }
    float _4736 = _3254;
    float _4738 = _4632;
    float _4740 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4742 = _4678 + _4740;
    float _4744 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4746 = _4680 + _4744;
    float _4748 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4750 = _4682 + _4748;
    float _4752 = _4742 * _4742;
    float _4754 = fma(_4746, _4746, _4752);
    float _4756 = fma(_3920, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4758 = fma(_4750, _4750, _4754);
    float _4760 = rsqrt(_4758);
    float _4762 = sqrt(_4758);
    float _4764 = _4760 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4766 = _4746 * _4764;
    float _4768 = _4750 * _4764;
    float _4770 = _4766 * _4766;
    float _4772 = _4768 * _4768;
    float _4774 = _4770 + _4772;
    float _4776 = sqrt(_4774);
    bool _4778 = _4776 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4780 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4782 = _4776 + _4780;
    float _4784 = _4750;
    float _4786 = _4774;
    float _4788 = _4782;
    float _4790 = _4742;
    if (_4778)
    {
        float _4792 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4784 = _4792;
    }
    float _4794 = _4784;
    if (_4778)
    {
        float _4796 = rsqrt(_4774);
        _4786 = _4796;
    }
    float _4798 = _4786;
    if (_4778)
    {
        float _4800 = _4782 * _4794;
        _4788 = _4800;
    }
    float _4802 = _4788;
    if (_4778)
    {
        float _4804 = _4802 * 0.15915493667125701904296875;
        _4686 = _4804;
    }
    float _4806 = _4686;
    float _4808 = _4736;
    if (_4778)
    {
        float _4810 = _4806 * 6.283185482025146484375;
        float _4812 = sin(_4810);
        _4808 = _4812;
    }
    float _4814 = _4808;
    float _4816 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4818 = precise::max(0.0, _4816);
    float _4820 = _4760;
    float _4822 = _4818;
    float _4824 = _4816;
    if (_4778)
    {
        float _4826 = _4806 * 6.283185482025146484375;
        float _4828 = cos(_4826);
        _4820 = _4828;
    }
    float _4830 = _4820;
    float _4832 = -_4764;
    float _4834 = -_4818;
    float _4836 = fma(_4742, _4832, _4834);
    if (!_4778)
    {
        _4790 = _4770;
    }
    float _4838 = _4790;
    float _4840 = _4838;
    if (_4778)
    {
        float _4842 = _4836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4822 = _4842;
    }
    float _4844 = _4822;
    float _4846 = _4844;
    if (!_4778)
    {
        _3990 = _4836;
    }
    float _4848 = _3990;
    float _4850 = _4814;
    float _4852 = _4848;
    if (_4778)
    {
        float _4854 = fma(_4814, _4844, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4850 = _4854;
    }
    float _4856 = _4850;
    float _4858 = _4856;
    if (!_4778)
    {
        _4846 = _4766;
    }
    float _4860 = _4846;
    float _4862 = _4860;
    float _4864 = _4830;
    if (_4778)
    {
        float _4866 = _4830 + (-1.0);
        _4824 = _4866;
    }
    float _4868 = _4824;
    float _4870 = _4868;
    if (_4778)
    {
        float _4872 = _4798 * _4856;
        _4524 = _4872;
    }
    float _4874 = _4524;
    float _4876 = _4678 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_4778)
    {
        float _4878 = _4868 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4858 = _4878;
    }
    float _4880 = _4858;
    if (_4778)
    {
        float _4882 = _4766 * _4874;
        _4862 = _4882;
    }
    float _4884 = _4862;
    if (!_4778)
    {
        _4870 = _4768;
    }
    float _4886 = _4870;
    float _4888 = _4886;
    if (_4778)
    {
        float _4890 = _4768 * _4874;
        _4888 = _4890;
    }
    float _4892 = _4888;
    if (_4778)
    {
        float _4894 = fma(_4836, _4830, _4880);
        _4852 = _4894;
    }
    float _4896 = _4852;
    if (_4778)
    {
        float _4898 = _4884 * _4884;
        _4840 = _4898;
    }
    float _4900 = _4840;
    if (!_4778)
    {
        _4864 = _4772;
    }
    float _4902 = _4864;
    float _4904 = _4902;
    if (_4778)
    {
        float _4906 = _4892 * _4892;
        _4904 = _4906;
    }
    float _4908 = _4904;
    float _4910 = fma(_4680, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4876);
    float _4912 = fma(_4896, _4896, _4900);
    float _4914 = floor(_4756);
    float _4916 = _4912 + _4908;
    float _4918 = fma(_4682, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4910);
    float _4920 = fma(_3924, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4922 = _4678 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4924 = _4918 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4926 = rsqrt(_4916);
    float _4928 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4930 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4932 = fma(_4762, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4930);
    float _4934 = precise::clamp(_4932, 0.0, 1.0);
    float _4936 = _4924 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4938 = fma(_4680, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4922);
    float _4940 = -_4934;
    float _4942 = _4940 + 1.0;
    float _4944 = -_4936;
    float _4946 = fma(_4944, _4928, 1.0);
    float _4948 = _4678 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4950 = _4678 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4952 = fma(_4682, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4938);
    float _4954 = floor(_4920);
    float _4956 = fma(_4680, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4948);
    float _4958 = fma(_4680, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4950);
    float _4960 = _4952 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4962 = fma(_4682, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4956);
    float _4964 = _4926 * _4884;
    float _4966 = _4926 * _4896;
    float _4968 = abs(_4942);
    float _4970 = log2(_4968);
    float _4972 = _4962 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4974 = _4926 * _4892;
    float _4976 = _4964 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4978 = fma(_4682, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4958);
    float _4980 = _4972 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4982 = -_4976;
    float _4984 = fma(_4966, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4982);
    float _4986 = _4978 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4988 = fma(_4960, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4980);
    float _4990 = log2(_4946);
    float _4992 = -_4974;
    float _4994 = fma(_4992, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4984);
    float _4996 = -_4914;
    float _4998 = _4756 + _4996;
    float _5000 = fma(_4924, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4988);
    float _5002 = _4972 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _5004 = fma(_4994, -0.5, 0.5);
    float _5006 = _4970 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5008 = fma(_4986, (*spvDescriptorSet0.vp_c8)._m0[7].w, _5000);
    float _5010 = _4972 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _5012 = fma(_4994, 0.5, 0.5);
    float _5014 = exp2(_5006);
    float _5016 = fma(_4960, (*spvDescriptorSet0.vp_c8)._m0[5].x, _5002);
    float _5018 = fma(_4960, (*spvDescriptorSet0.vp_c8)._m0[4].x, _5010);
    float _5020 = fma(_5012, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5022 = fma(_4924, (*spvDescriptorSet0.vp_c8)._m0[5].z, _5016);
    float _5024 = fma(_4924, (*spvDescriptorSet0.vp_c8)._m0[4].z, _5018);
    float _5026 = fma(_5012, _5020, -0.212114393711090087890625);
    float _5028 = 1.0 / _5008;
    float _5030 = fma(_4986, (*spvDescriptorSet0.vp_c8)._m0[5].w, _5022);
    float _5032 = fma(_4986, (*spvDescriptorSet0.vp_c8)._m0[4].w, _5024);
    float _5034 = -_4954;
    float _5036 = _4920 + _5034;
    float _5038 = _4966 + 1.0;
    float _5040 = fma(_5012, _5026, 1.570728778839111328125);
    float _5042 = _4990 * 0.693147182464599609375;
    float _5044 = sqrt(_5004);
    float _5046 = -_4966;
    float _5048 = fma(_5014, _5038, _5046);
    float _5050 = _5042 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _5052 = fma(_5048, 0.5, 0.5);
    float _5054 = _5032 * _5028;
    float _5056 = _5030 * _5028;
    float2 _13002 = float2(_4998, _5036);
    float _5058 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_13002, float2(0.0), isnan(_13002)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_13002, float2(0.0), isnan(_13002)), level(0.0)).x;
    float _5060 = fma(_5054, 0.5, 0.5);
    float _5062 = fma(_5056, -0.5, 0.5);
    float _5064 = _5044 * 0.636619746685028076171875;
    float3 _13020 = float3(_5060, _5062, _5050);
    float _5066 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_13020, float3(0.0), isnan(_13020)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_13020, float3(0.0), isnan(_13020)), level(0.0)).x;
    float3 _13031 = float3(_5060, _5062, _5050);
    float4 _5069 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_13031, float3(0.0), isnan(_13031)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_13031, float3(0.0), isnan(_13031)), level(0.0)).xyzw;
    float _5071 = _5069.x;
    float _5073 = _5069.y;
    float _5075 = _5069.z;
    float _5077 = _5069.w;
    float _5079 = -_5040;
    float _5081 = fma(_5064, _5079, 1.0);
    float2 _13052 = float2(_5081, _5052);
    float3 _5085 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_13052, float2(0.0), isnan(_13052)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_13052, float2(0.0), isnan(_13052)), level(0.0)).xyz;
    float _5087 = _5085.x;
    float _5089 = _5085.y;
    float _5091 = _5085.z;
    float _5093 = abs(_4630);
    float _5095 = log2(_5093);
    float _5097 = _4972 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5099 = _4970 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_98.x = _4680;
    out.m_98.y = _4678;
    out.m_98.z = _4682;
    float _5101 = fma(_4960, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5097);
    bool _5103 = _4762 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5105 = isnan(_4762);
    bool _5107 = _5103 || _5105;
    bool _5109 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5111 = _5107 || _5109;
    bool _5113 = _4630 <= 8000.0;
    bool _5115 = isnan(_4630);
    bool _5117 = _5113 || _5115;
    bool _5119 = isnan(8000.0);
    bool _5121 = _5117 || _5119;
    float _5123 = float(_5121);
    float _5125 = fma(_4924, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5101);
    float _5127 = exp2(_5099);
    float _5129 = _5032 + _5008;
    float _5131 = fma(_4986, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5125);
    float _5133 = _5095 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5135 = in.m_78.x;
    float _5137 = _5129 * 0.5;
    out.gl_Position.x = _5032;
    out.gl_Position.y = _5030;
    out.gl_Position.z = _5131;
    out.gl_Position.w = _5008;
    float _5139 = exp2(_5133);
    float _5141 = -_5127;
    float _5143 = _5141 + 1.0;
    float _5145 = _5143 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5147 = -_5145;
    float _5149 = _5147 + 1.0;
    float _5151 = fma(_5139, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5153 = precise::clamp(_5151, 0.0, 1.0);
    float _5155 = _5131 + _5008;
    float _5157 = _5131;
    float _5159 = _5008;
    float _5161 = _5030;
    float _5163 = _5149;
    if (!_5111)
    {
        _5157 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5165 = _5157;
    float _5167 = fma(_5153, -2.0, 3.0);
    float _5169 = _5153 * _5153;
    float _5171 = _5155 * 0.5;
    float _5173 = _5169 * _5167;
    float _5175 = -_5173;
    float _5177 = _5175 + 1.0;
    float _5179 = fma(_5177, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5173);
    float _5181 = _5008 * 0.5;
    float _5183 = _5123 * _5179;
    float _5185 = fma(_5030, -0.5, _5181);
    float _5187 = _5165;
    float _5189 = _5165;
    if (!_5111)
    {
        _5159 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5191 = _5159;
    float _5193 = _5183 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5195 = _5191;
    float _5197 = _5191;
    if (!_5111)
    {
        _5161 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5199 = _5161;
    out.m_100.x = _5137;
    out.m_100.y = _5185;
    out.m_100.z = _5171;
    out.m_100.w = _5008;
    float _5201 = -_5058;
    float _5203 = _5201 + 1.0;
    float _5205 = _5203 * _5193;
    float _5207 = precise::clamp(_5205, 0.0, 1.0);
    float _5209 = _5145 * _5066;
    float _5211 = -_5207;
    float _5213 = fma(_5211, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5215 = _5077 * _5209;
    float _5217 = _5213 * _5135;
    float _5219 = _5091 * _5209;
    float _5221 = fma(_5087, _5215, _5071);
    float _5223 = fma(_5089, _5215, _5073);
    float _5225 = _5217 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5227 = _5077 * _5149;
    float _5229 = fma(_5077, _5219, _5075);
    float _5231 = _4738 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5233 = _5217;
    float _5235 = _5215;
    float _5237 = _5199;
    float _5239 = _5199;
    if (!_5111)
    {
        _5233 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5241 = _5233;
    out.m_102.x = _5225;
    float _5243 = _5241;
    float _5245 = _5241;
    if (!_5111)
    {
        _5163 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5247 = _5163;
    float _5249 = _5247;
    float _5251 = _5247;
    if (!_5111)
    {
        _5235 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5253 = _5235;
    out.m_104.x = _5221;
    out.m_104.y = _5223;
    out.m_104.z = _5229;
    out.m_104.w = _5227;
    bool _5255 = !_5111;
    float _5257 = _5253;
    float _5259 = _5253;
    if (!_5255)
    {
        bool _5261 = _4762 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5263 = isnan(_4762);
        bool _5265 = _5261 || _5263;
        bool _5267 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5269 = _5265 || _5267;
        if (!_5269)
        {
            float _5271 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5273 = _4762 + _5271;
            float _5275 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5277 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5275;
            float _5279 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5281 = _5279 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5283 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5285 = _5283 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5287 = 1.0 / _5277;
            float _5289 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5291 = _5289 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5293 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5295 = _5293 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5297 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5299 = _5297 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5301 = _5273 * _5287;
            float _5303 = precise::clamp(_5301, 0.0, 1.0);
            float _5305 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5307 = _5305 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5309 = fma(_5303, _5281, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5311 = fma(_5303, _5285, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5313 = fma(_5303, _5307, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5315 = fma(_5303, _5291, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5317 = fma(_5303, _5295, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5319 = fma(_5303, _5299, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5251 = _5309;
            _5197 = _5317;
            _5239 = _5311;
            _5245 = _5315;
            _5259 = _5313;
            _5189 = _5319;
            _5321 = true;
        }
        else
        {
            bool _5323 = _4762 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5325 = isnan(_4762);
            bool _5327 = _5323 || _5325;
            bool _5329 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5331 = _5327 || _5329;
            if (!_5331)
            {
                _5243 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5333 = _5243;
            _5245 = _5333;
            if (!_5331)
            {
                _5195 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5335 = _5195;
            _5197 = _5335;
            if (!_5331)
            {
                _5187 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5337 = _5187;
            _5189 = _5337;
            if (!_5331)
            {
                _5237 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5339 = _5237;
            _5239 = _5339;
            if (!_5331)
            {
                _5249 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5341 = _5249;
            _5251 = _5341;
            if (!_5331)
            {
                _5257 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5343 = _5257;
            bool _5345 = !_5331;
            _5259 = _5343;
            if (!_5345)
            {
                bool _5347 = _4762 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5349 = isnan(_4762);
                bool _5351 = _5347 || _5349;
                bool _5353 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5355 = _5351 || _5353;
                if (!_5355)
                {
                    float _5357 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5359 = _4762 + _5357;
                    float _5361 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5363 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5361;
                    float _5365 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5367 = _5365 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5369 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5371 = _5369 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5373 = 1.0 / _5363;
                    float _5375 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5377 = _5375 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5379 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5381 = _5379 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5383 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5385 = _5383 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5387 = _5359 * _5373;
                    float _5389 = precise::clamp(_5387, 0.0, 1.0);
                    float _5391 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5393 = _5391 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5395 = fma(_5389, _5367, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5397 = fma(_5389, _5371, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5399 = fma(_5389, _5393, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5401 = fma(_5389, _5377, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5403 = fma(_5389, _5381, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5405 = fma(_5389, _5385, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5251 = _5395;
                    _5197 = _5403;
                    _5239 = _5397;
                    _5245 = _5401;
                    _5259 = _5399;
                    _5189 = _5405;
                    _5321 = true;
                }
                else
                {
                    _5251 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5197 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5239 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5245 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5259 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5189 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5321 = false;
    float _5407 = _5251;
    float _5409 = _5197;
    float _5411 = _5239;
    float _5413 = _5245;
    float _5415 = _5259;
    float _5417 = _5189;
    float _5419 = _5231 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5421 = fma(_4340, -0.5, 0.5);
    float _5423 = precise::clamp(_5421, 0.0, 1.0);
    float _5425 = -_5407;
    float _5427 = _5409 + _5425;
    float _5429 = -_5411;
    float _5431 = _5413 + _5429;
    out.m_55.x = _5419;
    float _5433 = -_5415;
    float _5435 = _5417 + _5433;
    float _5437 = fma(_5423, _5427, _5407);
    float _5439 = fma(_5423, _5431, _5411);
    bool _5441 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5443 = _5437 * 0.586610972881317138671875;
    float _5445 = fma(_5423, _5435, _5415);
    out.m_106.x = 0.0;
    bool _5447 = _4738 > 0.0;
    bool _5449 = isnan(_4738);
    bool _5451 = _5447 || _5449;
    bool _5453 = isnan(0.0);
    bool _5455 = _5451 || _5453;
    float _5457 = fma(_5439, 0.298911988735198974609375, _5443);
    float _5459 = fma(_5445, 0.114477999508380889892578125, _5457);
    float _5461 = -_5459;
    float _5463 = _5439 + _5461;
    float _5465 = -_5459;
    float _5467 = _5437 + _5465;
    float _5469 = -_5459;
    float _5471 = _5445 + _5469;
    float _5473 = fma(_5463, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5459);
    float _5475 = fma(_5467, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5459);
    float _5477 = fma(_5471, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5459);
    bool _5479 = !_5441;
    if (!_5479)
    {
        float _5481 = -_4678;
        float _5483 = _5481 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5485 = -_4680;
        float _5487 = _5485 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5489 = -_4682;
        float _5491 = _5489 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5493 = _5483 * _5483;
        float _5495 = fma(_5487, _5487, _5493);
        float _5497 = fma(_5491, _5491, _5495);
        float _5499 = sqrt(_5497);
        float _5501 = rsqrt(_5497);
        float _5503 = -_5499;
        float _5505 = _5503 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5507 = _5505 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5509 = precise::clamp(_5507, 0.0, 1.0);
        float _5511 = _5487 * _5501;
        float _5513 = _5483 * _5501;
        float _5515 = abs(_5509);
        float _5517 = log2(_5515);
        float _5519 = _5491 * _5501;
        float _5521 = _5511 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5523 = _4340 * _5513;
        float _5525 = -_5513;
        float _5527 = -_5521;
        float _5529 = fma(_5525, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5527);
        float _5531 = fma(_4344, _5511, _5523);
        float _5533 = -_5519;
        float _5535 = fma(_5533, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5529);
        float _5537 = fma(_4346, _5519, _5531);
        float _5539 = precise::clamp(_5537, 0.0, 1.0);
        float _5541 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5543 = _5535 + _5541;
        float _5545 = _5517 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5547 = _5543 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5549 = precise::clamp(_5547, 0.0, 1.0);
        float _5551 = exp2(_5545);
        float _5553 = _5551 * _5549;
        float _5555 = _5539 * _5553;
        float _5557 = _5555 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5559 = _5555 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5561 = _5555 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_106.x = _5557;
        out.m_106.y = _5559;
        out.m_106.z = _5561;
    }
    out.m_108.x = _5473;
    out.m_108.y = _5475;
    out.m_108.z = _5477;
    if (_5455)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_55.x = 0.0;
    float _5563 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5563;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5321 = false;
    bool _4394 = false;
    bool _737 = false;
    bool _563 = false;
    bool _457 = false;
    bool _269 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _122 = in.m_48.w;
    float _124 = in.m_50.w;
    float _126 = trunc(_122);
    int _129 = int(_126);
    float _131 = -_124;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _133;
    bool _137 = _129 >= 1;
    float _139 = 0.0;
    float _141 = _124;
    float _143 = _133;
    if (!_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _139;
    if (!_137)
    {
        out.m_55.x = 0.0;
    }
    int _147 = 0;
    if (!_137)
    {
        float _149 = _145 * 5.0;
        _147 = as_type<int>(_149);
    }
    int _151 = _147;
    int _153 = _151;
    if (!_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5631 = as_type<float>(_151);
        out.gl_Position.z = _5631;
    }
    if (!_137)
    {
        return out;
    }
    bool _155 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _157 = isnan(_124);
    bool _159 = _155 || _157;
    bool _161 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _163 = _159 || _161;
    float _165 = float(_129);
    bool _167 = _133 >= _165;
    bool _169 = !_163;
    bool _171 = _167 || _169;
    float _173 = 1.0 / _165;
    if (_171)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _141;
    if (_171)
    {
        out.m_55.x = 0.0;
    }
    float _177 = _133 * _173;
    float _179 = _177;
    if (_171)
    {
        float _181 = _175 * 5.0;
        _153 = as_type<int>(_181);
    }
    int _183 = _153;
    out.m_53.x = _177;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5694 = as_type<float>(_183);
        out.gl_Position.z = _5694;
    }
    if (_171)
    {
        return out;
    }
    float _185 = as_type<float>(int(gl_VertexIndex));
    float _187 = in.m_60.x;
    float _189 = in.m_60.y;
    float _191 = in.m_60.z;
    float _193 = in.m_62.x;
    float _195 = in.m_62.y;
    float _197 = in.m_62.z;
    float _199 = in.m_64.x;
    float _201 = in.m_64.y;
    float _203 = in.m_64.z;
    float _205 = in.m_66.x;
    float _207 = in.m_66.y;
    float _209 = in.m_66.z;
    int _211 = as_type<int>(_185) & 1;
    bool _213 = _211 != 0;
    int _215 = as_type<int>(_185) & 2;
    bool _217 = _215 != 0;
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _221 = !_217;
    float _223 = _221 ? (-0.5) : 0.5;
    float _225 = _189 * _195;
    float _227 = _189 * _201;
    float _229 = fma(_187, _193, _225);
    float _231 = _189 * _207;
    float _233 = fma(_187, _199, _227);
    float _235 = fma(_191, _197, _229);
    bool _237 = !_213;
    float _239 = _237 ? (-0.5) : 0.5;
    float _241 = fma(_187, _205, _231);
    float _243 = fma(_191, _203, _233);
    float _245 = fma(_191, _209, _241);
    bool _247 = !_219;
    float _249 = _243;
    float _267;
    if (!_247)
    {
        float _251 = in.m_68.x;
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _255 = _251 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _259 = _257 * _253;
        float _261 = floor(_259);
        float _263 = -_261;
        float _265 = _259 + _263;
        _267 = _265;
        _269 = true;
    }
    else
    {
        _267 = _177;
    }
    _269 = false;
    float _271 = _267;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = _271 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = _271 + _277;
    bool _281 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _283 = isnan(_271);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _271 + _305;
    float _309 = 1.0 / _299;
    bool _311 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _313 = 1.0 / _295;
    float _315 = 1.0 / _303;
    float _317 = _307 * _309;
    bool _319 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _321 = isnan(_271);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = _275 * _313;
    bool _333 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _335 = isnan(_271);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -_291;
    float _347 = _345 + 1.0;
    float _349 = _343 * _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _355 = _279 * _315;
    bool _357 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _359 = isnan(_271);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -_343;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _385 = _367 * _371;
    float _387 = -_367;
    float _389 = _387 + 1.0;
    float _391 = fma(_375, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _393 = fma(_379, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _395 = fma(_353, _317, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _397 = _329 * _389;
    float _399 = fma(_383, _317, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _401 = -_329;
    float _403 = _401 + 1.0;
    float _405 = _391 * _397;
    float _407 = _393 * _397;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _413;
    float _417 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[143].x, _405);
    float _419 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[143].y, _407);
    float _421 = fma(_411, _355, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _423 = fma(_415, _355, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _425 = fma(_395, _385, _417);
    float _427 = fma(_399, _385, _419);
    float _429 = fma(_421, _349, _425);
    float _431 = fma(_423, _349, _427);
    float _433 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[146].x, _429);
    float _435 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[146].y, _431);
    bool _437 = !_311;
    float _455;
    if (!_437)
    {
        float _439 = in.m_68.x;
        float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _443 = _439 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _445 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _447 = _445 * _441;
        float _449 = floor(_447);
        float _451 = -_449;
        float _453 = _447 + _451;
        _455 = _453;
        _457 = true;
    }
    else
    {
        _455 = _177;
    }
    _457 = false;
    float _459 = _455;
    float _461 = in.m_70.x;
    float _463 = in.m_70.y;
    bool _465 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _467 = isnan(_459);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _481 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _483 = isnan(_459);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _499 = _459 + _497;
    float _501 = -_475;
    float _503 = _501 + 1.0;
    bool _505 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _507 = 1.0 / _479;
    float _509 = _491 * _503;
    float _511 = -_491;
    float _513 = _511 + 1.0;
    float _515 = _435 * _463;
    float _517 = _495 * _507;
    float _519 = fma(_517, _499, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _523 = _519 * _509;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _527 = _521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _529 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[115].x, _523);
    float _531 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _533 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[116].x, _529);
    float _535 = _433 * _461;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _539 = _533 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _541 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _531;
    out.m_72.y = _527;
    out.m_72.z = _541;
    out.m_72.w = _539;
    bool _543 = !_505;
    float _561;
    if (!_543)
    {
        float _545 = in.m_68.x;
        float _547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _549 = _545 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _551 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[11].w, _133);
        float _553 = _551 * _547;
        float _555 = floor(_553);
        float _557 = -_555;
        float _559 = _553 + _557;
        _561 = _559;
        _563 = true;
    }
    else
    {
        _561 = _177;
    }
    _563 = false;
    float _565 = _561;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _569 = _565 + _567;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _579 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _581 = isnan(_565);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _595 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _597 = isnan(_565);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = 1.0 / _573;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _609;
    float _613 = -_589;
    float _615 = _613 + 1.0;
    bool _617 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _619 = isnan(_565);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    bool _629 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _631 = 1.0 / _577;
    float _633 = 1.0 / _593;
    float _635 = _611 * _607;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _641 = _605 * _615;
    float _643 = -_605;
    float _645 = _643 + 1.0;
    float _647 = fma(_635, _569, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _649 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _651 = isnan(_565);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = _627 * _645;
    float _663 = _639 * _631;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _667 = _565 + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _669;
    float _673 = _647 * _661;
    float _675 = -_627;
    float _677 = _675 + 1.0;
    float _679 = fma(_663, _667, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _681 = -_659;
    float _683 = _681 + 1.0;
    float _685 = _671 * _633;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _689 = _565 + _687;
    float _691 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[131].x, _673);
    float _693 = _589 * _683;
    float _695 = fma(_685, _689, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _697 = fma(_679, _641, _691);
    float _699 = fma(_695, _693, _697);
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _707 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[134].x, _699);
    float _709 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _705 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = _707 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_74.x = _709;
    out.m_74.y = _713;
    out.m_74.z = _711;
    out.m_74.w = _715;
    bool _717 = !_629;
    float _735;
    if (!_717)
    {
        float _719 = in.m_68.x;
        float _721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _723 = _719 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _725 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[14].x, _133);
        float _727 = _725 * _721;
        float _729 = floor(_727);
        float _731 = -_729;
        float _733 = _727 + _731;
        _735 = _733;
        _737 = true;
    }
    else
    {
        _735 = _177;
    }
    _737 = false;
    float _739 = _735;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _743 = _739 + _741;
    bool _745 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _747 = isnan(_739);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    bool _757 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _759 = isnan(_739);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _771 = _769 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _773 = -_755;
    float _775 = _773 + 1.0;
    float _777 = -_767;
    float _779 = _777 + 1.0;
    bool _781 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _783 = isnan(_739);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _789 = _785 || _787;
    float _791 = float(_789);
    float _793 = 1.0 / _771;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _795;
    float _799 = _767 * _775;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _805 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _807 = isnan(_739);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _813 = _809 || _811;
    float _815 = float(_813);
    float _817 = _791 * _779;
    float _819 = -_791;
    float _821 = _819 + 1.0;
    bool _823 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _825 = isnan(_739);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = 1.0 / _803;
    float _837 = _815 * _821;
    float _839 = -_815;
    float _841 = _839 + 1.0;
    bool _843 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _845 = isnan(_739);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = -_833;
    float _857 = _855 + 1.0;
    float _859 = _833 * _841;
    float _861 = _797 * _793;
    bool _863 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _865 = isnan(_739);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = fma(_861, _743, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _879 = _877 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _883 = _881 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _885 = _853 * _857;
    float _887 = -_853;
    float _889 = _887 + 1.0;
    float _891 = 1.0 / _883;
    bool _893 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _895 = _873 * _889;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _901 = -_873;
    float _903 = _901 + 1.0;
    float _905 = _875 * _895;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _909 = _739 + _907;
    float _911 = 1.0 / _879;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _921 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[159].x, _905);
    float _923 = _915 * _835;
    float _925 = 1.0 / _899;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _927;
    float _931 = fma(_923, _909, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _939 = _937 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _941 = _929 * _891;
    float _943 = fma(_931, _885, _921);
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _947 = _739 + _945;
    float _949 = 1.0 / _919;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _953 = _739 + _951;
    float _955 = _939 * _911;
    float _957 = fma(_941, _953, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _959;
    float _963 = fma(_955, _947, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _965 = 1.0 / _935;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _969 = _967 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _971 = _961 * _925;
    float _973 = fma(_957, _859, _943);
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _977 = _739 + _975;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _981 = _739 + _979;
    float _983 = _969 * _949;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _985;
    bool _989 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _991 = isnan(_739);
    bool _993 = _989 || _991;
    bool _995 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _997 = _993 || _995;
    float _999 = float(_997);
    float _1001 = fma(_971, _977, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1003 = fma(_963, _837, _973);
    float _1005 = fma(_983, _981, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1009 = _739 + _1007;
    float _1011 = -_999;
    float _1013 = _1011 + 1.0;
    float _1015 = _987 * _965;
    float _1017 = fma(_1001, _817, _1003);
    float _1019 = _755 * _1013;
    float _1021 = fma(_1015, _1009, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1023 = fma(_1005, _799, _1017);
    float _1025 = fma(_1021, _1019, _1023);
    float _1027 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1025);
    out.m_76.x = _1027;
    bool _1029 = !_893;
    float _1031 = _925;
    float _1033 = _973;
    if (!_1029)
    {
        float _1035 = in.m_68.x;
        float _1037 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1039 = _1035 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1041 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[14].y, _133);
        float _1043 = _1041 * _1037;
        float _1045 = floor(_1043);
        float _1047 = -_1045;
        float _1049 = _1043 + _1047;
        _179 = _1049;
    }
    float _1051 = _179;
    float _1053 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1055 = int(_1053);
    int _1057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1059 = _1057 != 0;
    float _1061 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1063 = int(_1061);
    float _1065 = float(_1055);
    float _1067 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1069 = int(_1067);
    if (_1059)
    {
        _1031 = 1.0;
    }
    float _1071 = _1031;
    float _1073 = _1071;
    if (_1059)
    {
        _1033 = 1.0;
    }
    float _1075 = _1033;
    int _1077 = 0;
    float _1079 = _1075;
    if (_1059)
    {
        _1077 = 0;
    }
    int _1081 = _1077;
    float _1083 = float(_1063);
    float _1085 = 1.0 / _1065;
    float _1087 = 1.0 / _1083;
    float _1089 = float(uint(_1069));
    int _1091 = ~_1069;
    int _1093 = _1091 + 1;
    float _1095 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1097 = int(_1095);
    float _1099 = _1085 * _133;
    float _1101 = _1085;
    float _1103 = _1083;
    int _1105 = _1081;
    if (_1059)
    {
        float _1107 = in.m_68.x;
        float _1109 = in.m_68.y;
        _1101 = _1107;
        _1103 = _1109;
    }
    float _1111 = _1101;
    float _1113 = _1103;
    float _1115 = _1087 * _133;
    float _1117 = 1.0 / _1089;
    float _1119 = float(uint(_1097));
    float _1121 = trunc(_1099);
    int _1123 = int(_1121);
    float _1125 = 1.0 / _1119;
    int _1127 = as_type<int>(_1117) + (-2);
    float _1129 = 0.0;
    float _1131 = _1111;
    float _1133 = _1113;
    if (_1059)
    {
        _1129 = _1113;
    }
    float _1135 = _1129;
    float _1137 = trunc(_1115);
    int _1139 = int(_1137);
    float _1141 = float(uint(_1123));
    float _1143 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1145 = int(_1143);
    int _1147 = as_type<int>(_1125) + (-2);
    float _1149 = as_type<float>(_1127) * _1141;
    int _1151 = as_type<int>(_1141);
    float _1153 = _1135;
    if (_1059)
    {
        _1151 = 0;
    }
    int _1155 = _1151;
    float _1157 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1159 = int(_1157);
    float _1161 = float(uint(_1139));
    float _1163 = as_type<float>(_1147) * _1161;
    float _1165 = _1161;
    int _1167 = _1155;
    if (_1059)
    {
        _1165 = _1111;
    }
    float _1169 = _1165;
    float _1171 = trunc(_1149);
    float _1173 = precise::max(_1171, 0.0);
    uint _1176 = uint(_1173);
    float _1178 = float(uint(_1145));
    float _1180 = 0.0;
    float _1182 = _1169;
    if (_1059)
    {
        _1180 = _1169;
    }
    float _1184 = _1180;
    float _1186 = 1.0 / _1178;
    float _1188 = float(_1159);
    float _1190 = trunc(_1163);
    float _1192 = precise::max(_1190, 0.0);
    uint _1194 = uint(_1192);
    float _1196 = 1.0 / _1188;
    float _1198 = _1188;
    float _1200 = _1184;
    if (_1059)
    {
        _1198 = _1169;
    }
    float _1202 = _1198;
    float _1204 = _1202;
    if (!_1059)
    {
        float _1206 = in.m_68.x;
        float _1208 = in.m_68.y;
        float _1210 = in.m_68.z;
        float _1212 = _1206 * 3.1415927410125732421875;
        float _1214 = _1212 * 0.15915493667125701904296875;
        float _1216 = _1208 * 3.1415927410125732421875;
        float _1218 = _1216 * 0.15915493667125701904296875;
        float _1220 = _1214 * 6.283185482025146484375;
        float _1222 = sin(_1220);
        float _1224 = _1218 * 6.283185482025146484375;
        float _1226 = sin(_1224);
        _1079 = 5.839270114898681640625;
        _1204 = _1210;
        _1073 = 7.345489978790283203125;
        _1182 = _1208;
        _1131 = _1206;
        _1133 = _1208;
        _1167 = 1;
        _1105 = 2;
        _1200 = _1222;
        _1153 = _1226;
    }
    float _1228 = _1079;
    float _1230 = _1204;
    float _1232 = _1073;
    float _1234 = _1182;
    float _1236 = _1131;
    float _1238 = _1133;
    int _1240 = _1167;
    int _1242 = _1105;
    float _1244 = _1200;
    float _1246 = _1153;
    float _1248 = _1228 * _1230;
    float _1250 = _1196 * _133;
    float _1252 = in.m_68.z;
    float _1254 = in.m_68.w;
    int _1256 = ~_1097;
    int _1258 = _1256 + 1;
    float _1260 = floor(_1248);
    int _1262 = _1093 * int(_1176);
    int _1264 = _1262 + _1123;
    float _1266 = _1232 * _1234;
    float _1268 = _1232 * _1236;
    int _1270 = _1258 * int(_1194);
    int _1272 = _1270 + _1139;
    float _1274 = float(_1123);
    float _1276 = in.m_78.y;
    float _1278 = float(uint(_1264));
    float _1280 = trunc(_1250);
    int _1282 = int(_1280);
    float _1284 = float(uint(_1272));
    bool _1286 = _1238 > 0.5;
    float _1288 = as_type<float>(_1127) * _1278;
    float _1290 = float(_1069);
    float _1292 = -_1260;
    float _1294 = _1248 + _1292;
    float _1296 = as_type<float>(_1147) * _1284;
    float _1298 = floor(_1268);
    int _1300 = as_type<int>(_1186) + (-2);
    bool _1302 = _1274 >= _1290;
    bool _1304 = isnan(_1274);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan(_1290);
    bool _1310 = _1306 || _1308;
    float _1312 = float(_1310);
    bool _1314 = _1254 > 0.5;
    float _1316 = float(uint(_1282));
    float _1318 = trunc(_1288);
    float _1320 = precise::max(_1318, 0.0);
    uint _1322 = uint(_1320);
    bool _1324 = _1252 > 0.5;
    float _1326 = as_type<float>(_1300) * _1316;
    int _1328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1330 = _1328 != 0;
    int _1332 = ~_1097;
    int _1334 = _1332 + 1;
    float _1336 = trunc(_1296);
    float _1338 = precise::max(_1336, 0.0);
    uint _1340 = uint(_1338);
    float _1342 = -_1298;
    float _1344 = _1268 + _1342;
    int _1346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1348 = _1346 != 0;
    int _1350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1352 = _1350 != 0;
    int _1354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1356 = _1354 != 0;
    float _1358 = -_239;
    int _1360 = _1286 ? as_type<int>(_1358) : as_type<int>(_239);
    float _1362 = float(_1097);
    float _1364 = trunc(_1326);
    float _1366 = precise::max(_1364, 0.0);
    uint _1368 = uint(_1366);
    int _1370 = int(_1176) + int(_1322);
    int _1372 = ~_1069;
    int _1374 = _1372 + 1;
    int _1376 = int(_1314);
    int _1378 = _1324 ? 2 : 0;
    int _1380 = _1376 | _1378;
    int _1382 = _1330 ? 4 : 0;
    int _1384 = _1380 | _1382;
    int _1386 = _1348 ? 8 : 0;
    int _1388 = _1384 | _1386;
    int _1390 = _1352 ? 16 : 0;
    int _1392 = _1388 | _1390;
    int _1394 = _1356 ? 32 : 0;
    int _1396 = _1392 | _1394;
    int _1398 = _1286 ? 64 : 0;
    int _1400 = _1396 | _1398;
    int _1402 = _1400 & 64;
    float _1404 = float(_1139);
    float _1406 = trunc(_1312);
    int _1408 = int(_1406);
    int _1410 = int(_1194) + int(_1340);
    int _1412 = _1374 * _1370;
    int _1414 = _1412 + _1123;
    bool _1416 = !_1352;
    float _1418 = _1416 ? _239 : as_type<float>(_1360);
    bool _1420 = _1404 >= _1362;
    bool _1422 = isnan(_1404);
    bool _1424 = _1420 || _1422;
    bool _1426 = isnan(_1362);
    bool _1428 = _1424 || _1426;
    float _1430 = float(_1428);
    int _1432 = _1334 * _1410;
    int _1434 = _1432 + _1139;
    int _1436 = ~_1145;
    int _1438 = _1436 + 1;
    float _1440 = floor(_1266);
    float _1442 = -_223;
    int _1444 = _1324 ? as_type<int>(_1442) : as_type<int>(_223);
    float _1446 = _1344 * _1290;
    bool _1448 = !_1330;
    int _1450 = _1448 ? 0 : 1;
    int _1452 = _1438 * int(_1368);
    int _1454 = _1452 + _1282;
    bool _1456 = !_1356;
    float _1458 = _1456 ? _223 : as_type<float>(_1444);
    float _1460 = _1294 * _1362;
    int _1462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1464 = _1462 != 0;
    int _1466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1468 = _1466 != 0;
    int _1470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1472 = _1470 != 0;
    float _1474 = trunc(_1446);
    int _1476 = int(_1474);
    bool _1478 = uint(_1414) >= uint(_1069);
    int _1480 = abs(_1450);
    bool _1482 = !_1468;
    int _1484 = _1482 ? 0 : 1;
    bool _1486 = !_1464;
    int _1488 = _1486 ? 0 : 1;
    float _1490 = -_1440;
    float _1492 = _1266 + _1490;
    int _1494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1496 = _1494 != 0;
    float _1498 = trunc(_1430);
    int _1500 = int(_1498);
    bool _1502 = uint(_1434) >= uint(_1097);
    bool _1504 = !_1472;
    int _1506 = _1504 ? 0 : 1;
    bool _1508 = !_1496;
    int _1510 = _1508 ? 0 : 1;
    int _1512 = _1476 * _1480;
    int _1514 = _1512 + _1123;
    bool _1516 = !_1502;
    int _1518 = _1516 ? 0 : (-1);
    float _1520 = trunc(_1460);
    int _1522 = int(_1520);
    int _1524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1526 = _1524 != 0;
    int _1528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1530 = _1528 != 0;
    int _1532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1534 = _1532 != 0;
    float _1536 = float(uint(_1454));
    bool _1538 = !_1478;
    int _1540 = _1538 ? 0 : (-1);
    bool _1542 = !_1530;
    int _1544 = _1542 ? 0 : 1;
    bool _1546 = _1402 != 0;
    float _1548 = as_type<float>(_1300) * _1536;
    int _1550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1552 = _1550 != 0;
    int _1554 = ~_1370;
    int _1556 = _1554 + _1540;
    int _1558 = _1556 + 1;
    bool _1560 = !_1552;
    int _1562 = _1560 ? 0 : 1;
    float _1564 = trunc(_1548);
    float _1566 = precise::max(_1564, 0.0);
    uint _1568 = uint(_1566);
    int _1570 = ~_1410;
    int _1572 = _1570 + _1518;
    int _1574 = _1572 + 1;
    int _1576 = _1069 * _1558;
    int _1578 = _1576 + _1123;
    int _1580 = abs(_1562);
    float _1582 = _173 * _133;
    bool _1584 = _1069 == 0;
    int _1586 = _1097 * _1574;
    int _1588 = _1586 + _1139;
    bool _1590 = !_1526;
    int _1592 = _1590 ? 0 : 1;
    float _1594 = _1290 * _1582;
    bool _1596 = _1097 == 0;
    int _1598 = _1522 * _1580;
    int _1600 = _1598 + _1139;
    int _1602 = ~_1408;
    int _1604 = _1602 + 1;
    int _1606 = _1604 + 1;
    float _1608 = _1362 * _1582;
    bool _1610 = !_1584;
    int _1612 = _1610 ? _1578 : (-1);
    float _1614 = trunc(_1594);
    int _1616 = int(_1614);
    int _1618 = ~_1500;
    int _1620 = _1618 + 1;
    int _1622 = _1620 + 1;
    bool _1624 = !_1596;
    int _1626 = _1624 ? _1588 : (-1);
    int _1628 = _1612 * _1606;
    int _1630 = int(_1368) + int(_1568);
    int _1632 = abs(_1484);
    int _1634 = _1626 * _1622;
    int _1636 = _1069 + (-1);
    float _1638 = trunc(_1608);
    int _1640 = int(_1638);
    int _1642 = _1097 + (-1);
    int _1644 = abs(_1544);
    int _1646 = _1408 * _1636;
    int _1648 = _1646 + _1628;
    int _1650 = abs(_1488);
    int _1652 = _1500 * _1642;
    int _1654 = _1652 + _1634;
    int _1656 = _1648 * _1632;
    int _1658 = abs(_1506);
    int _1660 = _1654 * _1644;
    int _1662 = abs(_1510);
    int _1664 = _1616 * _1650;
    int _1666 = _1664 + _1656;
    int _1668 = ~_1145;
    int _1670 = _1668 + 1;
    int _1672 = _1514 * _1658;
    int _1674 = _1672 + _1666;
    int _1676 = abs(_1592);
    int _1678 = _1670 * _1630;
    int _1680 = _1678 + _1282;
    float _1682 = -_223;
    int _1684 = _1314 ? as_type<int>(_1682) : as_type<int>(_223);
    int _1686 = _1476 * _1662;
    int _1688 = _1686 + _1674;
    float _1690 = -_239;
    float _1692 = _1324 ? _1690 : _239;
    bool _1694 = uint(_1680) >= uint(_1145);
    int _1696 = _1640 * _1676;
    int _1698 = _1696 + _1660;
    float _1700 = float(uint(_1688));
    int _1702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1704 = _1702 != 0;
    bool _1706 = !_1534;
    int _1708 = _1706 ? 0 : 1;
    float _1710 = as_type<float>(_1127) * _1700;
    bool _1712 = !_1704;
    int _1714 = _1712 ? 0 : 1;
    float _1716 = float(_1145);
    float _1718 = trunc(_1710);
    float _1720 = precise::max(_1718, 0.0);
    uint _1722 = uint(_1720);
    int _1724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1726 = _1724 != 0;
    float _1728 = float(_1282);
    float _1730 = _1716 * _1582;
    int _1732 = abs(_1708);
    int _1734 = abs(_1714);
    float _1736 = _1492 * _1716;
    bool _1738 = !_1694;
    int _1740 = _1738 ? 0 : (-1);
    float _1742 = trunc(_1730);
    int _1744 = int(_1742);
    bool _1746 = !_1726;
    int _1748 = _1746 ? 0 : 1;
    bool _1750 = !_1348;
    float _1752 = _1750 ? _223 : as_type<float>(_1684);
    bool _1754 = _1728 >= _1716;
    bool _1756 = isnan(_1728);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan(_1716);
    bool _1762 = _1758 || _1760;
    float _1764 = float(_1762);
    int _1766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1768 = _1766 != 0;
    int _1770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1772 = _1770 != 0;
    int _1774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1776 = _1774 != 0;
    int _1778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1780 = _1778 != 0;
    float _1782 = trunc(_1736);
    int _1784 = int(_1782);
    int _1786 = ~_1630;
    int _1788 = _1786 + _1740;
    int _1790 = _1788 + 1;
    int _1792 = _1600 * _1732;
    int _1794 = _1792 + _1698;
    int _1796 = ~_1069;
    int _1798 = _1796 + 1;
    int _1800 = _1145 * _1790;
    int _1802 = _1800 + _1282;
    bool _1804 = !_1772;
    int _1806 = _1804 ? 0 : 1;
    float _1808 = trunc(_1764);
    int _1810 = int(_1808);
    int _1812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1814 = _1812 != 0;
    int _1816 = _1522 * _1734;
    int _1818 = _1816 + _1794;
    bool _1820 = !_1768;
    int _1822 = _1820 ? 0 : 1;
    float _1824 = float(uint(_1818));
    int _1826 = _1798 * int(_1722);
    int _1828 = _1826 + _1688;
    bool _1830 = _1145 == 0;
    int _1832 = abs(_1806);
    float _1834 = as_type<float>(_1147) * _1824;
    float _1836 = float(uint(_1828));
    float _1838 = _1710;
    float _1840 = _1692;
    if (_1814)
    {
        float _1842 = in.m_68.w;
        _1838 = _1842;
    }
    float _1844 = _1838;
    bool _1846 = !_1830;
    int _1848 = _1846 ? _1802 : (-1);
    float _1850 = trunc(_1834);
    float _1852 = precise::max(_1850, 0.0);
    uint _1854 = uint(_1852);
    int _1856 = ~_1810;
    int _1858 = _1856 + 1;
    int _1860 = _1858 + 1;
    float _1862 = as_type<float>(_1127) * _1836;
    int _1864 = abs(_1748);
    int _1866 = abs(_1822);
    int _1868 = _1848 * _1860;
    int _1870 = _1145 + (-1);
    float _1872 = trunc(_1862);
    float _1874 = precise::max(_1872, 0.0);
    uint _1876 = uint(_1874);
    int _1878 = ~_1069;
    int _1880 = _1878 + 1;
    int _1882 = _1810 * _1870;
    int _1884 = _1882 + _1868;
    int _1886 = ~_1097;
    int _1888 = _1886 + 1;
    int _1890 = _1784 * _1864;
    int _1892 = _1890 + _1282;
    int _1894 = _1884 * _1832;
    bool _1896 = !_1776;
    int _1898 = _1896 ? 0 : 1;
    int _1900 = _1888 * int(_1854);
    int _1902 = _1900 + _1818;
    int _1904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1906 = _1904 != 0;
    int _1908 = _1744 * _1866;
    int _1910 = _1908 + _1894;
    bool _1912 = _1069 == 0;
    float _1914 = as_type<float>(_1864);
    float _1916 = as_type<float>(_1866);
    float _1918 = as_type<float>(_1854);
    if (_1814)
    {
        float _1920 = _1844 * 3.1415927410125732421875;
        _1914 = _1920;
    }
    float _1922 = _1914;
    float _1924 = float(uint(_1902));
    int _1926 = int(_1722) + int(_1876);
    if (_1814)
    {
        float _1928 = _1922 * 0.15915493667125701904296875;
        _1916 = _1928;
    }
    float _1930 = _1916;
    bool _1932 = !_1780;
    int _1934 = _1932 ? 0 : 1;
    float _1936 = as_type<float>(_1147) * _1924;
    int _1938 = abs(_1898);
    int _1940 = _1880 * _1926;
    int _1942 = _1940 + _1688;
    int _1944 = abs(_1934);
    float _1946 = as_type<float>(_1744);
    if (_1906)
    {
        float _1948 = in.m_68.x;
        _1946 = _1948;
    }
    float _1950 = _1946;
    float _1952 = trunc(_1936);
    float _1954 = precise::max(_1952, 0.0);
    uint _1956 = uint(_1954);
    int _1958 = _1892 * _1938;
    int _1960 = _1958 + _1910;
    bool _1962 = uint(_1942) >= uint(_1069);
    float _1964 = float(uint(_1514));
    float _1966 = as_type<float>(_1898);
    if (_1814)
    {
        float _1968 = _1930 * 6.283185482025146484375;
        float _1970 = sin(_1968);
        _1966 = _1970;
    }
    float _1972 = _1966;
    bool _1974 = !_1962;
    int _1976 = _1974 ? 0 : (-1);
    float _1978 = as_type<float>(_1127) * _1964;
    int _1980 = _1784 * _1944;
    int _1982 = _1980 + _1960;
    int _1984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1986 = _1984 != 0;
    int _1988 = ~_1926;
    int _1990 = _1988 + _1976;
    int _1992 = _1990 + 1;
    float _1994 = trunc(_1978);
    float _1996 = precise::max(_1994, 0.0);
    uint _1998 = uint(_1996);
    float _2000 = float(uint(_1982));
    int _2002 = _1069 * _1992;
    int _2004 = _2002 + _1688;
    int _2006 = int(_1854) + int(_1956);
    float _2008 = as_type<float>(_1300) * _2000;
    bool _2010 = !_1986;
    float _2012 = _2010 ? _239 : _1692;
    bool _2014 = _1986;
    if (_1906)
    {
        float _2016 = _1950 * 3.1415927410125732421875;
        _1840 = _2016;
    }
    float _2018 = _1840;
    float _2020 = _2018;
    if (_1814)
    {
        bool _2022 = _1972 > 0.5;
        _2014 = _2022;
    }
    bool _2024 = _2014;
    float _2026 = trunc(_2008);
    float _2028 = precise::max(_2026, 0.0);
    uint _2030 = uint(_2028);
    bool _2032 = !_1912;
    int _2034 = _2032 ? _2004 : (-1);
    if (_1906)
    {
        float _2036 = _2018 * 0.15915493667125701904296875;
        _2020 = _2036;
    }
    float _2038 = _2020;
    int _2040 = ~_1069;
    int _2042 = _2040 + 1;
    float _2044 = _2038;
    if (!_1814)
    {
        _1918 = _239;
    }
    float _2046 = _1918;
    float _2048 = _2046;
    if (_1814)
    {
        float _2050 = -_239;
        float _2052 = _2024 ? _2050 : _239;
        _2048 = _2052;
    }
    float _2054 = _2048;
    int _2056 = _2042 * int(_1998);
    int _2058 = _2056 + _1514;
    float _2060 = float(uint(_1600));
    int _2062 = as_type<int>(_2054);
    if (_1906)
    {
        float _2064 = _2038 * 6.283185482025146484375;
        float _2066 = sin(_2064);
        _2044 = _2066;
    }
    float _2068 = _2044;
    int _2070 = _2034 & 3;
    bool _2072 = _2070 != 0;
    float _2074 = _2054 + 0.5;
    int _2076 = _2034 & 3;
    bool _2078 = _2076 != 0;
    float _2080 = as_type<float>(_1147) * _2060;
    int _2082 = _2072 ? 0 : 1;
    int _2084 = ~_1145;
    int _2086 = _2084 + 1;
    bool _2088 = uint(_2076) > 1u;
    float _2090 = trunc(_2080);
    float _2092 = precise::max(_2090, 0.0);
    uint _2094 = uint(_2092);
    float _2096 = float(uint(_2058));
    int _2098 = ~_1097;
    int _2100 = _2098 + 1;
    float _2102 = as_type<float>(_1127) * _2096;
    int _2104 = ~_2082;
    int _2106 = _2104 + 1;
    int _2108 = _2106 + 1;
    int _2110 = _2086 * int(_2030);
    int _2112 = _2110 + _1982;
    float _2114 = -_223;
    int _2116 = _1546 ? as_type<int>(_2114) : as_type<int>(_223);
    int _2118 = _2100 * _2006;
    int _2120 = _2118 + _1818;
    bool _2122 = uint(_2076) >= 2u;
    float _2124 = trunc(_2102);
    float _2126 = precise::max(_2124, 0.0);
    uint _2128 = uint(_2126);
    int _2130 = _2108;
    if (!_2088)
    {
        int _2132 = ~_2082;
        int _2134 = _2132 + 1;
        _2130 = _2134;
    }
    int _2136 = _2130;
    float _2138 = float(uint(_2112));
    bool _2140 = uint(_2120) >= uint(_1097);
    int _2142 = ~_1097;
    int _2144 = _2142 + 1;
    float _2146 = as_type<float>(_1300) * _2138;
    int _2148 = _2122 ? 0 : 1;
    bool _2150 = _2076 != 3;
    int _2152 = _2144 * int(_2094);
    int _2154 = _2152 + _1600;
    bool _2156 = !_2140;
    int _2158 = _2156 ? 0 : (-1);
    float _2160 = trunc(_2146);
    float _2162 = precise::max(_2160, 0.0);
    uint _2164 = uint(_2162);
    int _2166 = ~_2148;
    int _2168 = _2166 + 1;
    int _2170 = _2168 + 1;
    int _2172 = ~_2006;
    int _2174 = _2172 + _2158;
    int _2176 = _2174 + 1;
    float _2178 = float(uint(_2154));
    int _2180 = _1097 * _2176;
    int _2182 = _2180 + _1818;
    float _2184 = 0.0;
    int _2186 = _2170;
    bool _2188 = _2150;
    if (!_1906)
    {
        _2184 = _223;
    }
    float _2190 = _2184;
    float _2192 = as_type<float>(_1147) * _2178;
    float _2194 = _2190;
    if (_2150)
    {
        int _2196 = ~_2148;
        int _2198 = _2196 + 1;
        _2186 = _2198;
    }
    int _2200 = _2186;
    if (_1906)
    {
        bool _2202 = _2068 > 0.5;
        _2188 = _2202;
    }
    bool _2204 = _2188;
    float _2206 = trunc(_2192);
    float _2208 = precise::max(_2206, 0.0);
    uint _2210 = uint(_2208);
    bool _2212 = !_1596;
    int _2214 = _2212 ? _2182 : (-1);
    int _2216 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2218 = _2216 != 0;
    if (_1906)
    {
        float _2220 = -_223;
        float _2222 = _2204 ? _2220 : _223;
        _2194 = _2222;
    }
    float _2224 = _2194;
    int _2226 = _2214 & 3;
    bool _2228 = _2226 != 0;
    bool _2230 = !_2218;
    float _2232 = _2230 ? _223 : as_type<float>(_2116);
    int _2234 = int(_2030) + int(_2164);
    int _2236 = ~_1145;
    int _2238 = _2236 + 1;
    int _2240 = _2214 & 3;
    bool _2242 = _2240 != 0;
    bool _2244 = uint(_2226) > 1u;
    int _2246 = _2238 * _2234;
    int _2248 = _2246 + _1982;
    int _2250 = int(_1998) + int(_2128);
    int _2252 = ~_1069;
    int _2254 = _2252 + 1;
    int _2256 = _2242 ? 0 : 1;
    int _2258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2260 = _2258 != 0;
    int _2262 = _2254 * _2250;
    int _2264 = _2262 + _1514;
    float _2266 = float(uint(_1892));
    bool _2268 = !_2260;
    int _2270 = _2268 ? 0 : 1;
    bool _2272 = uint(_2248) >= uint(_1145);
    float _2274 = as_type<float>(_1300) * _2266;
    int _2276 = ~_2256;
    int _2278 = _2276 + 1;
    int _2280 = _2278 + 1;
    int _2282 = _2280;
    if (!_2244)
    {
        int _2284 = ~_2256;
        int _2286 = _2284 + 1;
        _2282 = _2286;
    }
    int _2288 = _2282;
    float _2290 = trunc(_2274);
    float _2292 = precise::max(_2290, 0.0);
    uint _2294 = uint(_2292);
    bool _2296 = uint(_2264) >= uint(_1069);
    bool _2298 = !_2272;
    int _2300 = _2298 ? 0 : (-1);
    bool _2302 = _2226 != 3;
    bool _2304 = !_2296;
    int _2306 = _2304 ? 0 : (-1);
    bool _2308 = uint(_2226) >= 2u;
    int _2310 = ~_2234;
    int _2312 = _2310 + _2300;
    int _2314 = _2312 + 1;
    int _2316 = ~_1097;
    int _2318 = _2316 + 1;
    int _2320 = int(_2094) + int(_2210);
    int _2322 = _1145 * _2314;
    int _2324 = _2322 + _1982;
    int _2326 = _2308 ? 0 : 1;
    int _2328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2330 = _2328 != 0;
    int _2332 = _2318 * _2320;
    int _2334 = _2332 + _1600;
    int _2336 = ~_1145;
    int _2338 = _2336 + 1;
    int _2340 = ~_2326;
    int _2342 = _2340 + 1;
    int _2344 = _2342 + 1;
    int _2346 = _2344;
    if (_2302)
    {
        int _2348 = ~_2326;
        int _2350 = _2348 + 1;
        _2346 = _2350;
    }
    int _2352 = _2346;
    int _2354 = _2338 * int(_2294);
    int _2356 = _2354 + _1892;
    int _2358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2360 = _2358 != 0;
    bool _2362 = !_2330;
    int _2364 = _2362 ? 0 : 1;
    bool _2366 = uint(_2334) >= uint(_1097);
    bool _2368 = !_1830;
    int _2370 = _2368 ? _2324 : (-1);
    bool _2372 = !_2360;
    int _2374 = _2372 ? 0 : 1;
    bool _2376 = !_2366;
    int _2378 = _2376 ? 0 : (-1);
    int _2380 = _2370 & 3;
    bool _2382 = _2380 != 0;
    int _2384 = _2370 & 3;
    bool _2386 = _2384 != 0;
    float _2388 = float(uint(_2356));
    int _2390 = _2382 ? 0 : 1;
    bool _2392 = uint(_2384) > 1u;
    float _2394 = as_type<float>(_1300) * _2388;
    int _2396 = ~_2390;
    int _2398 = _2396 + 1;
    int _2400 = _2398 + 1;
    int _2402 = ~_1145;
    int _2404 = _2402 + 1;
    float _2406 = trunc(_2394);
    float _2408 = precise::max(_2406, 0.0);
    uint _2410 = uint(_2408);
    float _2412 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    int _2414 = _2400;
    float _2416 = as_type<float>(_2404);
    float _2418 = as_type<float>(_2294);
    if (!_2392)
    {
        int _2420 = ~_2390;
        int _2422 = _2420 + 1;
        _2414 = _2422;
    }
    int _2424 = _2414;
    float _2426 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _2428 = uint(_2384) >= 2u;
    float _2430 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2432 = _2428 ? 0 : 1;
    bool _2434 = _2384 != 3;
    float _2436 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2438 = int(_2294) + int(_2410);
    int _2440 = ~_2432;
    int _2442 = _2440 + 1;
    int _2444 = _2442 + 1;
    int _2446 = _2404 * _2438;
    int _2448 = _2446 + _1892;
    float _2450 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2452 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2454 = _2444;
    if (_2434)
    {
        int _2456 = ~_2432;
        int _2458 = _2456 + 1;
        _2454 = _2458;
    }
    int _2460 = _2454;
    float _2462 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2464 = _2462 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2466 = uint(_2448) >= uint(_1145);
    float _2468 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2470 = _2468 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2472 = !_2466;
    int _2474 = _2472 ? 0 : (-1);
    float _2476 = 1.0 / _2464;
    bool _2478 = _1236 > 0.5;
    float _2480 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2482 = _2480 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    int _2484 = ~_2320;
    int _2486 = _2484 + _2378;
    int _2488 = _2486 + 1;
    float _2490 = -_239;
    int _2492 = _2478 ? as_type<int>(_2490) : as_type<int>(_239);
    bool _2494 = _1240 != 1;
    float _2496 = 1.0 / _2470;
    float _2498 = in.m_48.x;
    float _2500 = in.m_48.y;
    float _2502 = in.m_48.z;
    int _2504 = _1097 * _2488;
    int _2506 = _2504 + _1600;
    bool _2508 = _1051 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2510 = isnan(_1051);
    bool _2512 = _2508 || _2510;
    bool _2514 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2516 = _2512 || _2514;
    float _2518 = float(_2516);
    bool _2520 = !_2078;
    int _2522 = _2520 ? 0 : 1;
    float _2524 = 1.0 / _2482;
    float _2526 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2528 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2526;
    float _2530 = -_2518;
    float _2532 = _2530 + 1.0;
    bool _2534 = _1051 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2536 = isnan(_1051);
    bool _2538 = _2534 || _2536;
    bool _2540 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2542 = _2538 || _2540;
    float _2544 = float(_2542);
    float _2546 = 0.0;
    if (!_2494)
    {
        _2546 = _1238;
    }
    float _2548 = _2546;
    float _2550 = 0.0;
    float _2552 = _2548;
    if (!_2494)
    {
        _2550 = _1238;
    }
    float _2554 = _2550;
    float _2556 = _2554;
    if (!_2494)
    {
        _2416 = _1252;
    }
    float _2558 = _2416;
    float _2560 = 0.0;
    float _2562 = _2558;
    if (!_2494)
    {
        _2560 = _1252;
    }
    float _2564 = _2560;
    float _2566 = _2564;
    if (_2494)
    {
        _2552 = _1236;
    }
    float _2568 = _2552;
    if (_2494)
    {
        _2556 = _1236;
    }
    float _2570 = _2556;
    if (_2494)
    {
        _2562 = _1238;
    }
    float _2572 = _2562;
    float _2574 = _201 * _2500;
    if (_2494)
    {
        _2566 = _1238;
    }
    float _2576 = _2566;
    float _2578 = _207 * _2500;
    bool _2580 = _1242 != 2;
    float _2582 = fma(_199, _2498, _2574);
    float _2584 = _1236 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2586 = fma(_205, _2498, _2578);
    float _2588 = fma(_203, _2502, _2582);
    float _2590 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2592 = fma(_209, _2502, _2586);
    float _2594 = _2568 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2596 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2598 = log2(_2596);
    float _2600 = -_2590;
    float _2602 = fma(_2584, 2.0, _2600);
    float _2604 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2606 = 0.0;
    if (_2580)
    {
        _2606 = _1236;
    }
    float _2608 = _2606;
    float _2610 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2612 = _2608;
    if (_2580)
    {
        _2418 = _1238;
    }
    float _2614 = _2418;
    float _2616 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2618 = _2614;
    if (!_2580)
    {
        _2612 = _1252;
    }
    float _2620 = _2612;
    float _2622 = fma(_2610, -2.0, _2426);
    if (!_2580)
    {
        _2618 = _1236;
    }
    float _2624 = _2618;
    float _2626 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2616);
    int _2628 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2630 = _2628 != 0;
    float _2632 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2634 = -_2430;
    float _2636 = fma(_2594, 2.0, _2634);
    float _2638 = -_2604;
    float _2640 = fma(_2632, 2.0, _2638);
    float _2642 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    bool _2644 = !_2630;
    float _2646 = _2644 ? _239 : as_type<float>(_2492);
    float _2648 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2650 = _2648 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2652 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2654 = isnan(0.0);
    bool _2656 = _2652 || _2654;
    bool _2658 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2660 = _2656 || _2658;
    float _2662 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2642);
    float _2664 = _1246 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2666 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2668 = _2624 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2670 = fma(_2664, -2.0, _2412);
    float _2672 = _2500 + _1276;
    float _2674 = fma(_2668, -2.0, _2452);
    float _2676 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2678 = -_133;
    float _2680 = fma(_2678, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2602);
    float _2682 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2684 = _1238 * 2.0;
    float _2686 = fma(_2570, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2676);
    float _2688 = fma(_2576, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2666);
    float _2690 = _2598 * _133;
    float _2692 = 1.0 / _2650;
    float _2694 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2682);
    float _2696 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2698 = _2696 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2700 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2626);
    float _2702 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2704 = _2702 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2706 = _2620 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2708 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2622);
    float _2710 = exp2(_2690);
    float _2712 = _2572 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2714 = -_2450;
    float _2716 = fma(_2706, 2.0, _2714);
    float _2718 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2720 = fma(_2712, -2.0, _2436);
    float _2722 = -_133;
    float _2724 = fma(_2722, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2640);
    float _2726 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2728 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2718);
    float _2730 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2694);
    float _2732 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2734 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2726);
    float _2736 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2728);
    float _2738 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2670);
    float _2740 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2732);
    float _2742 = -_2710;
    float _2744 = _2742 + 1.0;
    float _2746 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2662);
    float _2748 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2734);
    float _2750 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2740);
    float _2752 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2686);
    float _2754 = _2660 ? _2744 : 0.0;
    float _2756 = _1236 * 2.0;
    bool _2758 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2760 = isnan(1.0);
    bool _2762 = _2758 || _2760;
    bool _2764 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2766 = _2762 || _2764;
    float _2768 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2770 = 1.0 + _2768;
    float _2772 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2688);
    float _2774 = floor(_2756);
    float _2776 = -_133;
    float _2778 = fma(_2776, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2636);
    float _2780 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2720);
    float _2782 = -_133;
    float _2784 = fma(_2782, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2716);
    float _2786 = fma(_2074, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2724);
    float _2788 = -_2700;
    float _2790 = _2788 + 1.0;
    float _2792 = 1.0 / _2770;
    float _2794 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2674);
    float _2796 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2798 = _1051 + _2796;
    bool _2800 = _1051 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2802 = isnan(_1051);
    bool _2804 = _2800 || _2802;
    bool _2806 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2808 = _2804 || _2806;
    float _2810 = float(_2808);
    float _2812 = -_2790;
    float _2814 = fma(_2812, _2054, _2786);
    bool _2816 = _1051 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2818 = isnan(_1051);
    bool _2820 = _2816 || _2818;
    bool _2822 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2824 = _2820 || _2822;
    float _2826 = float(_2824);
    float _2828 = -_2746;
    float _2830 = _2828 + 1.0;
    float _2832 = 1.0 / _2698;
    float _2834 = _2646 + 0.5;
    int _2836 = abs(_2352);
    float _2838 = -_2772;
    float _2840 = _2838 + 1.0;
    float _2842 = -_2752;
    float _2844 = _2842 + 1.0;
    int _2846 = ~_2250;
    int _2848 = _2846 + _2306;
    int _2850 = _2848 + 1;
    float _2852 = -_2750;
    float _2854 = _2852 + 1.0;
    int _2856 = ~_2438;
    int _2858 = _2856 + _2474;
    int _2860 = _2858 + 1;
    if (_2766)
    {
        float _2862 = _2754 * _2792;
        _143 = _2862;
    }
    float _2864 = _143;
    bool _2866 = _2774 >= 0.0;
    bool _2868 = isnan(_2774);
    bool _2870 = _2866 || _2868;
    bool _2872 = isnan(0.0);
    bool _2874 = _2870 || _2872;
    float _2876 = floor(_2684);
    float _2878 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2880 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2878;
    int _2882 = _1069 * _2850;
    int _2884 = _2882 + _1514;
    int _2886 = _2874 ? 0 : 1;
    int _2888 = _1145 * _2860;
    int _2890 = _2888 + _1892;
    bool _2892 = _2774 > 0.0;
    float _2894 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2896 = _2894 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2898 = _2880 * _2832;
    float _2900 = 1.0 / _2704;
    int _2902 = ~_2886;
    int _2904 = _2902 + 1;
    int _2906 = _2904 + 1;
    float _2908 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2910 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2908;
    float _2912 = _2896 * _2692;
    int _2914 = abs(_2374);
    float _2916 = -_2748;
    float _2918 = _2916 + 1.0;
    float _2920 = -_2736;
    float _2922 = _2920 + 1.0;
    float _2924 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2926 = _2906;
    if (!_2892)
    {
        int _2928 = ~_2886;
        int _2930 = _2928 + 1;
        _2926 = _2930;
    }
    int _2932 = _2926;
    float _2934 = _1252 * 2.0;
    bool _2936 = _2876 >= 0.0;
    bool _2938 = isnan(_2876);
    bool _2940 = _2936 || _2938;
    bool _2942 = isnan(0.0);
    bool _2944 = _2940 || _2942;
    float _2946 = _2910 * _2900;
    float _2948 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2950 = _2948 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    int _2952 = _2944 ? 0 : 1;
    float _2954 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2956 = _2954 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    bool _2958 = _2876 > 0.0;
    float _2960 = 1.0 / _2950;
    bool _2962 = _1051 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2964 = isnan(_1051);
    bool _2966 = _2962 || _2964;
    bool _2968 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2970 = _2966 || _2968;
    float _2972 = float(_2970);
    float _2974 = _2956 * _2476;
    float _2976 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2978 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2976;
    float _2980 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2982 = _2980 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2984 = _2924 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2986 = -_2972;
    float _2988 = _2986 + 1.0;
    float _2990 = _2978 * _2524;
    float _2992 = _2982 * _2496;
    bool _2994 = _1051 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2996 = isnan(_1051);
    bool _2998 = _2994 || _2996;
    bool _3000 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3002 = _2998 || _3000;
    float _3004 = float(_3002);
    float _3006 = floor(_2934);
    int _3008 = ~_2952;
    int _3010 = _3008 + 1;
    int _3012 = _3010 + 1;
    float _3014 = fma(_2974, _2798, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    int _3016 = _3012;
    if (!_2958)
    {
        int _3018 = ~_2952;
        int _3020 = _3018 + 1;
        _3016 = _3020;
    }
    int _3022 = _3016;
    float _3024 = -_3004;
    float _3026 = _3024 + 1.0;
    bool _3028 = !_1596;
    int _3030 = _3028 ? _2506 : (-1);
    float _3032 = _2528 * _2960;
    int _3034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3036 = _3034 != 0;
    int _3038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3040 = _3038 != 0;
    int _3042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3044 = _3042 != 0;
    float _3046 = _2972 * _3026;
    bool _3048 = _1051 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3050 = isnan(_1051);
    bool _3052 = _3048 || _3050;
    bool _3054 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3056 = _3052 || _3054;
    float _3058 = float(_3056);
    float _3060 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3062 = _1051 + _3060;
    bool _3064 = !_3036;
    int _3066 = _3064 ? 0 : 1;
    float _3068 = -_3058;
    float _3070 = _3068 + 1.0;
    float _3072 = _3058 * _2988;
    bool _3074 = _3006 >= 0.0;
    bool _3076 = isnan(_3006);
    bool _3078 = _3074 || _3076;
    bool _3080 = isnan(0.0);
    bool _3082 = _3078 || _3080;
    float _3084 = fma(_2898, _3062, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3086 = _2518 * _3070;
    bool _3088 = _1051 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3090 = isnan(_1051);
    bool _3092 = _3088 || _3090;
    bool _3094 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3096 = _3092 || _3094;
    float _3098 = float(_3096);
    float _3100 = in.m_64.w;
    int _3102 = _3082 ? 0 : 1;
    bool _3104 = _3006 > 0.0;
    float _3106 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3108 = _1051 + _3106;
    float _3110 = _3098 * _2532;
    float _3112 = -_3098;
    float _3114 = _3112 + 1.0;
    float _3116 = in.m_66.w;
    float _3118 = fma(_2912, _3108, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3120 = -_2544;
    float _3122 = _3120 + 1.0;
    float _3124 = _2544 * _3114;
    float _3126 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3128 = _1051 + _3126;
    float _3130 = -_2810;
    float _3132 = _3130 + 1.0;
    float _3134 = _2810 * _3122;
    float _3136 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3138 = _1051 + _3136;
    float _3140 = fma(_2946, _3128, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3142 = _2826 * _3132;
    float _3144 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3146 = _1051 + _3144;
    float _3148 = -_2826;
    float _3150 = _3148 + 1.0;
    float _3152 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3154 = _1051 + _3152;
    float _3156 = _3084 * _3142;
    float _3158 = fma(_3032, _3146, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3160 = fma(_2990, _3138, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3162 = fma(_2992, _3154, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3164 = _2588 + _3100;
    int _3166 = _2214 >> 31;
    float _3168 = fma(_3150, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3156);
    bool _3170 = !_2228;
    int _3172 = _3170 ? 0 : 1;
    int _3174 = _3166 & 3;
    float _3176 = fma(_3118, _3134, _3168);
    float _3178 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3180 = _2672 + _3178;
    float _3182 = _2592 + _3116;
    int _3184 = _2214 + _3174;
    float _3186 = fma(_3140, _3124, _3176);
    float _3188 = _3180 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3190 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3192 = _3164 + _3190;
    int _3194 = _3184 >> 2;
    float _3196 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3198 = _3182 + _3196;
    float _3200 = _1238 + _1236;
    float _3202 = fma(_3192, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3188);
    int _3204 = _3194 << 4;
    int _3206 = _3204 + 656;
    float _3208 = _1236 + _1252;
    float _3210 = _1236 + (-0.5);
    float _3212 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3202);
    bool _3214 = _2226 != 3;
    uint _3216 = uint(int(uint(_3206) >> uint(2)));
    uint _3218 = uint(int(uint(int(_3216)) >> uint(2)));
    int _3220 = int(_3216) & 3;
    float _3222 = (*spvDescriptorSet0.vp_c9)._m0[int(_3218)][_3220];
    int _3224 = int(_3216) + 1;
    uint _3226 = uint(int(uint(_3224) >> uint(2)));
    int _3228 = _3224 & 3;
    float _3230 = (*spvDescriptorSet0.vp_c9)._m0[int(_3226)][_3228];
    int _3232 = ~_3102;
    int _3234 = _3232 + 1;
    int _3236 = _3234 + 1;
    float _3238 = _1238 + _1252;
    bool _3240 = !_3214;
    int _3242 = _3240 ? 0 : (-1);
    bool _3244 = _3212 >= 0.0;
    float _3246 = fma(_3014, _3110, _3186);
    float _3248 = _3200 + (-1.0);
    int _3250 = _3236;
    float _3252 = _3072;
    float _3254 = _3164;
    if (!_3104)
    {
        int _3256 = ~_3102;
        int _3258 = _3256 + 1;
        _3250 = _3258;
    }
    int _3260 = _3250;
    int _3262 = _3206 + 8;
    uint _3264 = uint(int(uint(_3262) >> uint(2)));
    uint _3266 = uint(int(uint(int(_3264)) >> uint(2)));
    int _3268 = int(_3264) & 3;
    float _3270 = (*spvDescriptorSet0.vp_c9)._m0[int(_3266)][_3268];
    int _3272 = int(_3264) + 1;
    uint _3274 = uint(int(uint(_3272) >> uint(2)));
    int _3276 = _3272 & 3;
    float _3278 = (*spvDescriptorSet0.vp_c9)._m0[int(_3274)][_3276];
    float _3280 = fma(_3160, _3086, _3246);
    float _3282 = _1238 + (-0.5);
    float _3284 = _2224 + (-0.5);
    float _3286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3288 = fma(_3162, _3072, _3280);
    int _3290 = abs(_3172);
    float _3292 = -_3284;
    float _3294 = -_2738;
    float _3296 = fma(_3292, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3294);
    int _3298 = abs(_3242);
    if (_3244)
    {
        _3252 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3300 = _3252;
    float _3302 = fma(_2830, _2224, _3296);
    float _3304 = fma(_2834, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2680);
    float _3306 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3308 = int(_3306);
    int _3310 = abs(_3066);
    if (_3244)
    {
        float _3312 = _3300 * 5.0;
        _2062 = as_type<int>(_3312);
    }
    int _3314 = _2062;
    float _3316 = _2232 + (-0.5);
    out.m_80.x = _2814;
    out.m_80.y = _3302;
    bool _3318 = _1069 == 0;
    float _3320 = -_3316;
    float _3322 = -_2708;
    float _3324 = fma(_3320, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3322);
    int _3326 = abs(_2288);
    float _3328 = fma(_3158, _3046, _3288);
    float _3330 = _3180 * _3180;
    if (_3244)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10278 = as_type<float>(_3314);
        out.gl_Position.z = _10278;
    }
    float _3332 = _3286 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3334 = _2012 + 0.5;
    float _3336 = fma(_3004, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3328);
    bool _3338 = !_3318;
    int _3340 = _3338 ? _2884 : (-1);
    if (_3244)
    {
        out.m_55.x = 0.0;
    }
    float _3342 = fma(_3332, _3334, _2778);
    int _3344 = ~_3308;
    int _3346 = _3344 + 1;
    int _3348 = ~_3308;
    int _3350 = _3348 + 1;
    out.m_82.x = _3336;
    float _3352 = fma(_3192, _3192, _3330);
    float _3354 = fma(_3198, _3198, _3352);
    int _3356 = ~_3326;
    int _3358 = _3356 + 1;
    int _3360 = _3358 + 1;
    float _3362 = fma(_3248, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _3364 = ~_3290;
    int _3366 = _3364 + 1;
    int _3368 = _3366 + 1;
    int _3370 = _3360 * as_type<int>(_3230);
    int _3372 = abs(_2364);
    float _3374 = rsqrt(_3354);
    int _3376 = ~_2836;
    int _3378 = _3376 + 1;
    int _3380 = _3378 + 1;
    int _3382 = _3368 * as_type<int>(_3222);
    int _3384 = _3382 + _3370;
    float _3386 = float(uint(_3308));
    float _3388 = _535 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _3390 = _3380 * as_type<int>(_3270);
    int _3392 = _3390 + _3384;
    int _3394 = abs(_3308);
    float _3396 = _3388 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3398 = ~_3298;
    int _3400 = _3398 + 1;
    int _3402 = _3400 + 1;
    float _3404 = 1.0 / _3386;
    int _3406 = ~_3372;
    int _3408 = _3406 + 1;
    int _3410 = _3408 + 1;
    float _3412 = _1752 + (-0.5);
    float _3414 = float(uint(_3394));
    int _3416 = _3402 * as_type<int>(_3278);
    int _3418 = _3416 + _3392;
    float _3420 = _3396 * _3374;
    float _3422 = -_2984;
    float _3424 = -_2780;
    float _3426 = fma(_3422, _3412, _3424);
    int _3428 = _3418 * _3410;
    float _3430 = 1.0 / _3414;
    int _3432 = _2370 >> 31;
    float _3434 = _3180 * _3420;
    int _3436 = _3030 * _3372;
    int _3438 = _3436 + _3428;
    int _3440 = _2034 >> 31;
    float _3442 = _3192 * _3420;
    float _3444 = -_3434;
    float _3446 = _3180 + _3444;
    int _3448 = as_type<int>(_3404) + (-2);
    float _3450 = fma(_1752, _2840, _3426);
    float _3452 = float(uint(_3438));
    float _3454 = _3446 * _3446;
    int _3456 = _3440 & 3;
    float _3458 = -_3442;
    float _3460 = _3192 + _3458;
    int _3462 = ~_3394;
    int _3464 = _3462 + 1;
    float _3466 = as_type<float>(_3448) * _3452;
    int _3468 = _3432 & 3;
    float _3470 = fma(_3460, _3460, _3454);
    int _3472 = _2034 + _3456;
    int _3474 = _2370 + _3468;
    float _3476 = trunc(_3466);
    float _3478 = precise::max(_3476, 0.0);
    uint _3480 = uint(_3478);
    float _3482 = float(_3260);
    float _3484 = in.m_84.x;
    float _3486 = in.m_84.y;
    float _3488 = in.m_84.z;
    int _3490 = abs(_3438);
    int _3492 = _3474 >> 2;
    int _3494 = _3472 >> 2;
    int _3496 = as_type<int>(_3430) + (-2);
    float _3498 = float(uint(_3490));
    float _3500 = float(_3310);
    int _3502 = _3346 * int(_3480);
    int _3504 = _3502 + _3438;
    int _3506 = _3494 << 4;
    int _3508 = _3506 + 368;
    float _3510 = as_type<float>(_3496) * _3498;
    int _3512 = _3492 << 4;
    int _3514 = _3512 + 800;
    float _3516 = float(uint(_3504));
    uint _3518 = uint(int(uint(_3508) >> uint(2)));
    uint _3520 = uint(int(uint(int(_3518)) >> uint(2)));
    int _3522 = int(_3518) & 3;
    float _3524 = (*spvDescriptorSet0.vp_c9)._m0[int(_3520)][_3522];
    int _3526 = int(_3518) + 1;
    uint _3528 = uint(int(uint(_3526) >> uint(2)));
    int _3530 = _3526 & 3;
    float _3532 = (*spvDescriptorSet0.vp_c9)._m0[int(_3528)][_3530];
    float _3534 = _3500 * _3482;
    float _3536 = -_2730;
    float _3538 = _3536 + 1.0;
    float _3540 = _3198 * _3420;
    float _3542 = trunc(_3510);
    float _3544 = precise::max(_3542, 0.0);
    uint _3546 = uint(_3544);
    float _3548 = as_type<float>(_3448) * _3516;
    float _3550 = fma(_2232, _3538, _3324);
    float _3552 = -_2844;
    float _3554 = fma(_2012, _3552, _3342);
    uint _3556 = uint(int(uint(_3514) >> uint(2)));
    uint _3558 = uint(int(uint(int(_3556)) >> uint(2)));
    int _3560 = int(_3556) & 3;
    float _3562 = (*spvDescriptorSet0.vp_c9)._m0[int(_3558)][_3560];
    int _3564 = int(_3556) + 1;
    uint _3566 = uint(int(uint(_3564) >> uint(2)));
    int _3568 = _3564 & 3;
    float _3570 = (*spvDescriptorSet0.vp_c9)._m0[int(_3566)][_3568];
    float _3572 = -_3540;
    float _3574 = _3198 + _3572;
    float _3576 = _3534 * (-2.0);
    float _3578 = -_2854;
    float _3580 = fma(_2646, _3578, _3304);
    float _3582 = trunc(_3548);
    float _3584 = precise::max(_3582, 0.0);
    uint _3586 = uint(_3584);
    float _3588 = fma(_3574, _3574, _3470);
    float _3590 = fma(_3576, _3484, _3484);
    float _3592 = fma(_3362, _3576, _3362);
    int _3594 = _3508 + 8;
    uint _3596 = uint(int(uint(_3594) >> uint(2)));
    uint _3598 = uint(int(uint(int(_3596)) >> uint(2)));
    int _3600 = int(_3596) & 3;
    float _3602 = (*spvDescriptorSet0.vp_c9)._m0[int(_3598)][_3600];
    int _3604 = int(_3596) + 1;
    uint _3606 = uint(int(uint(_3604) >> uint(2)));
    int _3608 = _3604 & 3;
    float _3610 = (*spvDescriptorSet0.vp_c9)._m0[int(_3606)][_3608];
    out.m_86.x = _3580;
    out.m_86.y = _3550;
    out.m_86.z = _3554;
    out.m_86.w = _3450;
    float _3612 = fma(_3210, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3590);
    int _3614 = abs(_2136);
    int _3616 = _3464 * int(_3546);
    int _3618 = _3616 + _3490;
    float _3620 = fma(_3592, _2864, _3612);
    int _3622 = ~_3614;
    int _3624 = _3622 + 1;
    int _3626 = _3624 + 1;
    float _3628 = float(uint(_3618));
    int _3630 = _3514 + 8;
    uint _3632 = uint(int(uint(_3630) >> uint(2)));
    uint _3634 = uint(int(uint(int(_3632)) >> uint(2)));
    int _3636 = int(_3632) & 3;
    float _3638 = (*spvDescriptorSet0.vp_c9)._m0[int(_3634)][_3636];
    int _3640 = int(_3632) + 1;
    uint _3642 = uint(int(uint(_3640) >> uint(2)));
    int _3644 = _3640 & 3;
    float _3646 = (*spvDescriptorSet0.vp_c9)._m0[int(_3642)][_3644];
    int _3648 = int(_3480) + int(_3586);
    float _3650 = as_type<float>(_3496) * _3628;
    int _3652 = abs(_2424);
    bool _3654 = !_2386;
    int _3656 = _3654 ? 0 : 1;
    int _3658 = _3350 * _3648;
    int _3660 = _3658 + _3438;
    int _3662 = ~_3652;
    int _3664 = _3662 + 1;
    int _3666 = _3664 + 1;
    float _3668 = trunc(_3650);
    float _3670 = precise::max(_3668, 0.0);
    uint _3672 = uint(_3670);
    bool _3674 = _2076 != 3;
    int _3676 = abs(_2522);
    int _3678 = abs(_3656);
    int _3680 = ~_3676;
    int _3682 = _3680 + 1;
    int _3684 = _3682 + 1;
    int _3686 = ~_3678;
    int _3688 = _3686 + 1;
    int _3690 = _3688 + 1;
    int _3692 = _3626 * as_type<int>(_3532);
    bool _3694 = !_3674;
    int _3696 = _3694 ? 0 : (-1);
    bool _3698 = uint(_3660) >= uint(_3308);
    int _3700 = _3684 * as_type<int>(_3524);
    int _3702 = _3700 + _3692;
    int _3704 = int(_3546) + int(_3672);
    float _3706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3708 = !_3698;
    int _3710 = _3708 ? 0 : (-1);
    int _3712 = _3666 * as_type<int>(_3570);
    int _3714 = ~_3394;
    int _3716 = _3714 + 1;
    bool _3718 = _2384 != 3;
    int _3720 = _3690 * as_type<int>(_3562);
    int _3722 = _3720 + _3712;
    int _3724 = ~_3648;
    int _3726 = _3724 + _3710;
    int _3728 = _3726 + 1;
    int _3730 = _3716 * _3704;
    int _3732 = _3730 + _3490;
    int _3734 = abs(_2200);
    float _3736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3738 = !_3718;
    int _3740 = _3738 ? 0 : (-1);
    int _3742 = _3308 * _3728;
    int _3744 = _3742 + _3438;
    bool _3746 = uint(_3732) >= uint(_3394);
    int _3748 = ~_3734;
    int _3750 = _3748 + 1;
    int _3752 = _3750 + 1;
    bool _3754 = !_3746;
    int _3756 = _3754 ? 0 : (-1);
    bool _3758 = _3308 == 0;
    int _3760 = _3752 * as_type<int>(_3602);
    int _3762 = _3760 + _3702;
    int _3764 = abs(_2460);
    bool _3766 = !_3758;
    int _3768 = _3766 ? _3744 : (-1);
    bool _3770 = _3308 == 0;
    int _3772 = _3438 ^ _3308;
    int _3774 = abs(_3696);
    uint _3776 = uint(int(uint(_3772) >> uint(31)));
    int _3778 = ~_3764;
    int _3780 = _3778 + 1;
    int _3782 = _3780 + 1;
    int _3784 = abs(_3740);
    int _3786 = ~_3756;
    int _3788 = _3704 + _3786;
    int _3790 = _3788 + 1;
    int _3792 = _3782 * as_type<int>(_3638);
    int _3794 = _3792 + _3722;
    int _3796 = ~_3774;
    int _3798 = _3796 + 1;
    int _3800 = _3798 + 1;
    int _3802 = ~int(_3776);
    int _3804 = _3802 + 1;
    int _3806 = ~_3784;
    int _3808 = _3806 + 1;
    int _3810 = _3808 + 1;
    int _3812 = _3800 * as_type<int>(_3610);
    int _3814 = _3812 + _3762;
    int _3816 = _3790 ^ _3804;
    int _3818 = abs(_2270);
    int _3820 = _3810 * as_type<int>(_3646);
    int _3822 = _3820 + _3794;
    int _3824 = ~_2914;
    int _3826 = _3824 + 1;
    int _3828 = _3826 + 1;
    int _3830 = ~_3804;
    int _3832 = _3830 + _3816;
    int _3834 = _3832 + 1;
    int _3836 = ~_3818;
    int _3838 = _3836 + 1;
    int _3840 = _3838 + 1;
    int _3842 = _3822 * _3828;
    bool _3844 = !_3770;
    int _3846 = _3844 ? _3834 : (-1);
    float _3848 = float(_3768);
    int _3850 = _3814 * _3840;
    float _3852 = float(_3846);
    float _3854 = _3736 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3856 = _3706 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3858 = _3340 * _3818;
    int _3860 = _3858 + _3850;
    bool _3862 = !_1830;
    int _3864 = _3862 ? _2890 : (-1);
    float _3866 = -_2794;
    float _3868 = fma(_3854, _3852, _3866);
    bool _3870 = !_3040;
    int _3872 = _3870 ? 0 : 1;
    float _3874 = fma(_3856, _3848, _2784);
    float _3876 = _1418 + 0.5;
    float _3878 = _1458 + (-0.5);
    int _3880 = abs(_3872);
    int _3882 = _3864 * _2914;
    int _3884 = _3882 + _3842;
    float _3886 = fma(_3856, _3876, _3874);
    float _3888 = -_3854;
    float _3890 = fma(_3888, _3878, _3868);
    float _3892 = -_2918;
    float _3894 = fma(_1418, _3892, _3886);
    float _3896 = float(_3860);
    float _3898 = fma(_1458, _2922, _3890);
    float _3900 = float(_3884);
    float _3902 = float(_2932);
    out.m_88.x = _3896;
    float _3904 = float(_3880);
    out.m_88.w = _3900;
    bool _3906 = !_3044;
    int _3908 = _3906 ? 0 : 1;
    float _3910 = _3904 * _3902;
    out.m_90.x = _3894;
    out.m_90.y = _3898;
    float _3912 = _3488;
    if (_3244)
    {
        return out;
    }
    float _3914 = -_3434;
    float _3916 = _2672 + _3914;
    float _3918 = -_3442;
    float _3920 = _3164 + _3918;
    float _3922 = -_3540;
    float _3924 = _3182 + _3922;
    float _3926 = float(_3022);
    float _3928 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3930 = _3916 + _3928;
    float _3932 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3934 = _3920 + _3932;
    float _3936 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3938 = _3924 + _3936;
    int _3940 = abs(_3908);
    float _3942 = _3930 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3944 = _3238 + (-1.0);
    float _3946 = _3910 * (-2.0);
    float _3948 = _3208 + (-1.0);
    float _3950 = fma(_3934, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3942);
    float _3952 = float(_3940);
    float _3954 = fma(_3944, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3956 = fma(_3946, _3486, _3486);
    float _3958 = fma(_3938, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3950);
    float _3960 = _3620 * 0.15915493667125701904296875;
    float _3962 = _3952 * _3926;
    float _3964 = fma(_3954, _3946, _3954);
    float _3966 = fma(_3282, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3956);
    bool _3968 = _3958 >= 0.0;
    float _3970 = _3962 * (-2.0);
    float _3972 = fma(_3964, _2864, _3966);
    float _3974 = sqrt(_3588);
    float _3976 = fma(_3970, _3488, _3488);
    float _3978 = _1252 + (-0.5);
    float _3980 = _3972 * 0.15915493667125701904296875;
    float _3982 = fma(_3948, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3984 = fma(_3978, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3976);
    float _3986 = _3960 * 6.283185482025146484375;
    float _3988 = sin(_3986);
    float _3990 = _3920;
    if (_3968)
    {
        _3912 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3992 = _3912;
    float _3994 = fma(_3982, _3970, _3982);
    int _3996 = as_type<int>(_3992);
    if (_3968)
    {
        out.m_55.x = 0.0;
    }
    if (_3968)
    {
        float _3998 = _3992 * 5.0;
        _3996 = as_type<int>(_3998);
    }
    int _4000 = _3996;
    float _4002 = fma(_3994, _2864, _3984);
    float _4004 = _3960 * 6.283185482025146484375;
    float _4006 = cos(_4004);
    if (_3968)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _11259 = as_type<float>(_4000);
        out.gl_Position.z = _11259;
    }
    float _4008 = _4002 * 0.15915493667125701904296875;
    float _4010 = _3980 * 6.283185482025146484375;
    float _4012 = sin(_4010);
    float _4014 = _3980 * 6.283185482025146484375;
    float _4016 = cos(_4014);
    if (_3968)
    {
        return out;
    }
    float _4018 = _4008 * 6.283185482025146484375;
    float _4020 = cos(_4018);
    float _4022 = _3374 * _3974;
    float _4024 = _515 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _4026 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _223);
    float _4028 = _4006 * _4016;
    float _4030 = _3388 * _4022;
    float _4032 = _4022 * _4024;
    float _4034 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _239);
    float _4036 = _4008 * 6.283185482025146484375;
    float _4038 = sin(_4036);
    float _4040 = _4006 * _4012;
    float _4042 = _4026 * _4032;
    float _4044 = _3988 * _4012;
    float _4046 = _3988 * _4016;
    float _4048 = _4034 * _4030;
    float _4050 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4052 = _4006 * _4020;
    float _4054 = _4016 * _4020;
    float _4056 = _3988 * _4020;
    float _4058 = _4012 * _4020;
    float _4060 = _4052 * _4042;
    float _4062 = _4022 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _4064 = _4062 * 0.5;
    float _4066 = fma(_4038, _4028, _4044);
    float _4068 = -_4042;
    float _4070 = _4038 * _4068;
    float _4072 = -_4046;
    float _4074 = fma(_4038, _4040, _4072);
    float _4076 = -_4040;
    float _4078 = fma(_4038, _4046, _4076);
    float _4080 = fma(_4066, _4048, _4060);
    float _4082 = _4056 * _4042;
    float _4084 = fma(_4054, _4048, _4070);
    float _4086 = fma(_4038, _4044, _4028);
    float _4088 = fma(_4074, _4064, _4080);
    float _4090 = fma(_4078, _4048, _4082);
    float _4092 = fma(_4058, _4064, _4084);
    float _4094 = _4088 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4096 = _4088 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4098 = fma(_4086, _4064, _4090);
    float _4100 = _4088 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4102 = fma(_4092, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4094);
    float _4104 = fma(_4092, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4096);
    float _4106 = fma(_4092, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4100);
    float _4108 = fma(_4098, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4102);
    float _4110 = fma(_4098, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4104);
    float _4112 = fma(_4098, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4106);
    float _4114 = _4108 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _4116 = _4110 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _4118 = _4066 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4120 = _4112 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _4122 = _3164 + _4114;
    float _4124 = _3182 + _4116;
    float _4126 = _4066 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4128 = _4066 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4130 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4132 = _4122 + _4130;
    float _4134 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4136 = _4124 + _4134;
    float _4138 = fma(_4054, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4126);
    float _4140 = fma(_4050, _4050, 1.0);
    float _4142 = _4132 * _4132;
    float _4144 = _4136 * _4136;
    float _4146 = fma(_4054, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4118);
    float _4148 = fma(_4054, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4128);
    float _4150 = rsqrt(_4140);
    float _4152 = _4142 + _4144;
    float _4154 = _4052 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4156 = _4052 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4158 = _4052 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4160 = _2672 + _4120;
    float _4162 = -_4038;
    float _4164 = fma(_4162, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4154);
    float _4166 = -_4038;
    float _4168 = fma(_4166, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4156);
    float _4170 = sqrt(_4152);
    float _4172 = _4074 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4174 = _4074 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4176 = _4074 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4178 = -_4038;
    float _4180 = fma(_4178, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4158);
    float _4182 = fma(_4058, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4172);
    float _4184 = fma(_4058, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4174);
    float _4186 = fma(_4058, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4176);
    bool _4188 = _4170 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4190 = _4174;
    float _4192 = _4172;
    float _4194 = _4158;
    float _4196 = _4058;
    float _4198 = _4176;
    if (!_4188)
    {
        _4190 = _4144;
    }
    float _4200 = _4190;
    float _4202 = _4200;
    if (!_4188)
    {
        _4192 = _4142;
    }
    float _4204 = _4192;
    float _4206 = _4204;
    if (!_4188)
    {
        _4194 = _4122;
    }
    float _4208 = _4194;
    float _4210 = _4208;
    if (!_4188)
    {
        _4196 = _4124;
    }
    float _4212 = _4196;
    float _4214 = _4212;
    if (!_4188)
    {
        _4198 = _4160;
    }
    float _4216 = _4198;
    bool _4218 = !_4188;
    float _4220 = _4216;
    if (!_4218)
    {
        float _4222 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4224 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4226 = _4170 + _4224;
        float _4228 = rsqrt(_4152);
        float _4230 = _4226 * _4222;
        float _4232 = _4160 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4234 = _4230 * 0.15915493667125701904296875;
        float _4236 = _4234 * 6.283185482025146484375;
        float _4238 = sin(_4236);
        float _4240 = _4234 * 6.283185482025146484375;
        float _4242 = cos(_4240);
        float _4244 = fma(_4238, _4232, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4246 = _4228 * _4244;
        float _4248 = _4242 + (-1.0);
        float _4250 = fma(_4132, _4246, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4252 = fma(_4136, _4246, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4254 = _4248 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4256 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4258 = _4250 + _4256;
        float _4260 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4262 = _4252 + _4260;
        float _4264 = fma(_4160, _4242, _4254);
        float _4266 = _4258 * _4258;
        float _4268 = _4262 * _4262;
        _4220 = _4264;
        _4206 = _4266;
        _4202 = _4268;
        _4210 = _4250;
        _4214 = _4252;
    }
    float _4270 = _4220;
    float _4272 = _4206;
    float _4274 = _4202;
    float _4276 = _4210;
    float _4278 = _4214;
    float _4280 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4282 = _4270 + _4280;
    float _4284 = fma(_4056, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4164);
    float _4286 = fma(_4056, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4168);
    float _4288 = fma(_4056, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4180);
    float _4290 = fma(_4282, _4282, _4272);
    float _4292 = fma(_4086, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4182);
    float _4294 = fma(_4086, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4184);
    float _4296 = fma(_4086, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4186);
    float _4298 = _4290 + _4274;
    float _4300 = _4050 * _4150;
    float _4302 = fma(_4078, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4138);
    float _4304 = _239 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4306 = _4050 * _4284;
    float _4308 = fma(_4078, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4146);
    float _4310 = _4050 * _4286;
    float _4312 = fma(_4078, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4148);
    float _4314 = _4050 * _4288;
    float _4316 = -_4292;
    float _4318 = _4300 * _4316;
    float _4320 = -_4294;
    float _4322 = _4300 * _4320;
    float _4324 = -_4296;
    float _4326 = _4300 * _4324;
    float _4328 = fma(_4304, _4302, _4306);
    float _4330 = sqrt(_4298);
    float _4332 = fma(_4304, _4308, _4310);
    float _4334 = fma(_4304, _4312, _4314);
    float _4336 = fma(_4150, _4284, _4318);
    float _4338 = fma(_4150, _4286, _4322);
    float _4340 = _4294 + _4332;
    float _4342 = fma(_4150, _4288, _4326);
    float _4344 = _4292 + _4328;
    float _4346 = _4296 + _4334;
    out.m_92.x = _4302;
    out.m_92.y = _4308;
    out.m_92.z = _4312;
    out.m_94.x = _4336;
    out.m_94.y = _4338;
    out.m_94.z = _4342;
    bool _4348 = _4330 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4350 = isnan(_4330);
    bool _4352 = _4348 || _4350;
    bool _4354 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4356 = _4352 || _4354;
    out.m_96.x = _4344;
    out.m_96.y = _4340;
    out.m_96.z = _4346;
    float _4358 = _4304;
    if (!_4356)
    {
        _4358 = 1.0;
    }
    float _4360 = _4358;
    bool _4362 = !_4356;
    float _4364 = _4360;
    if (!_4362)
    {
        bool _4366 = _4330 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4368 = isnan(_4330);
        bool _4370 = _4366 || _4368;
        bool _4372 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4374 = _4370 || _4372;
        if (!_4374)
        {
            float _4376 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4378 = _4330 + _4376;
            float _4380 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4382 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4380;
            float _4384 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4386 = _4384 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4388 = 1.0 / _4382;
            float _4390 = _4378 * _4388;
            float _4392 = fma(_4390, _4386, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4364 = _4392;
            _4394 = true;
        }
        else
        {
            bool _4396 = _4330 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4398 = isnan(_4330);
            bool _4400 = _4396 || _4398;
            bool _4402 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4404 = _4400 || _4402;
            if (!_4404)
            {
                float _4406 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4408 = _4330 + _4406;
                float _4410 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4412 = _4410 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4414 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4416 = _4414 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4418 = 1.0 / _4412;
                float _4420 = _4408 * _4418;
                float _4422 = fma(_4420, _4416, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4364 = _4422;
                _4394 = true;
            }
            else
            {
                _4364 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4394 = false;
    float _4424 = _4364;
    float _4426 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4428 = _4270 + _4426;
    float _4430 = _3916 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4432 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4434 = _4276 + _4432;
    float _4436 = fma(_4428, _4424, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4438 = fma(_3920, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4430);
    float _4440 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4442 = _4278 + _4440;
    float _4444 = fma(_4434, _4424, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4446 = -_2672;
    float _4448 = _4446 + _4436;
    float _4450 = fma(_3924, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4438);
    float _4452 = fma(_4442, _4424, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4454 = -_3164;
    float _4456 = _4454 + _4444;
    float _4458 = _4448 * _4448;
    float _4460 = _4450 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4462 = _3916 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4464 = -_3182;
    float _4466 = _4464 + _4452;
    float _4468 = fma(_4456, _4456, _4458);
    float _4470 = 1.0 / _4460;
    float _4472 = fma(_3920, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4462);
    float _4474 = fma(_4466, _4466, _4468);
    float _4476 = fma(_3924, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4472);
    float _4478 = sqrt(_4474);
    float _4480 = _4476 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4482 = _4480 + _4460;
    float _4484 = _4482 * _4470;
    float _4486 = _4484 * 0.5;
    bool _4488 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4490 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4492 = _4488 || _4490;
    bool _4494 = isnan(0.5);
    bool _4496 = _4492 || _4494;
    float _4498 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4500 = fma(_4486, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4498);
    bool _4502 = _4478 > 0.0;
    float _4504 = 1.0 / _4500;
    bool _4506 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4508 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4510 = _4506 || _4508;
    bool _4512 = isnan(0.5);
    bool _4514 = _4510 || _4512;
    float _4516 = _4450;
    float _4518 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _4520 = _4470;
    float _4522 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4524 = _4444;
    if (!_4502)
    {
        _4516 = _4444;
    }
    float _4526 = _4516;
    float _4528 = _4526;
    float _4530 = _4526;
    if (!_4502)
    {
        _4518 = _4436;
    }
    float _4532 = _4518;
    float _4534 = _4532;
    float _4536 = _4532;
    if (!_4502)
    {
        _4520 = _4452;
    }
    float _4538 = _4520;
    bool _4540 = !_4502;
    float _4542 = _4538;
    float _4544 = _4538;
    if (!_4540)
    {
        float _4546 = _235 * _235;
        float _4548 = fma(_243, _243, _4546);
        float _4550 = fma(_245, _245, _4548);
        float _4552 = rsqrt(_4474);
        float _4554 = sqrt(_4550);
        float _4556 = _4456 * _4552;
        float _4558 = _4448 * _4552;
        float _4560 = _4466 * _4552;
        bool _4562 = _4554 > 0.0;
        _4522 = _4552;
        if (!_4562)
        {
            _4528 = _4444;
        }
        float _4564 = _4528;
        _4530 = _4564;
        if (!_4562)
        {
            _4534 = _4436;
        }
        float _4566 = _4534;
        _4536 = _4566;
        if (!_4562)
        {
            _4542 = _4452;
        }
        float _4568 = _4542;
        bool _4570 = !_4562;
        _4544 = _4568;
        if (!_4570)
        {
            float _4572 = rsqrt(_4550);
            float _4574 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4576 = _235 * _4572;
            float _4578 = _243 * _4572;
            float _4580 = _4558 * _4576;
            float _4582 = _245 * _4572;
            float _4584 = fma(_4556, _4578, _4580);
            float _4586 = _4574 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4588 = fma(_4560, _4582, _4584);
            float _4590 = _4588 * _4586;
            float _4592 = fma(_243, _4590, _4444);
            float _4594 = fma(_235, _4590, _4436);
            float _4596 = fma(_245, _4590, _4452);
            _4530 = _4592;
            _4536 = _4594;
            _4544 = _4596;
            _4522 = _4578;
        }
    }
    float _4598 = _4530;
    float _4600 = _4536;
    float _4602 = _4544;
    float _4604 = _4522;
    float _4606 = -_3442;
    float _4608 = _4606 + _4598;
    float _4610 = -_3434;
    float _4612 = _4610 + _4600;
    float _4614 = -_3540;
    float _4616 = _4614 + _4602;
    float _4618 = _4604;
    float _4620 = _4612;
    float _4622 = _4608;
    float _4624 = _4616;
    if (_4496)
    {
        _4618 = 1.0;
    }
    float _4626 = _4618;
    float _4628 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4630 = _4504 * _4628;
    float _4632 = _4626;
    if (!_4514)
    {
        float _4634 = _3930 * _3930;
        float _4636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4638 = -_3182;
        float _4640 = _4638 + _4602;
        float _4642 = fma(_3934, _3934, _4634);
        float _4644 = fma(_3938, _3938, _4642);
        float _4646 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4648 = sqrt(_4644);
        float _4650 = 1.0 / _4022;
        float _4652 = _4646 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4654 = precise::min(_4648, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4656 = _4654 * _4636;
        float _4658 = _4656 * _4650;
        float _4660 = -_2672;
        float _4662 = _4660 + _4600;
        float _4664 = -_3164;
        float _4666 = _4664 + _4598;
        float _4668 = _4652 * _4658;
        float _4670 = _4640 * _4658;
        float _4672 = fma(_4662, _4668, _3916);
        float _4674 = fma(_4666, _4668, _3920);
        float _4676 = fma(_4652, _4670, _3924);
        _4620 = _4672;
        _4622 = _4674;
        _4624 = _4676;
        _249 = _4636;
    }
    float _4678 = _4620;
    float _4680 = _4622;
    float _4682 = _4624;
    float _4684 = _249;
    float _4686 = _4684;
    if (!_4496)
    {
        float _4688 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4690 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4692 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4690;
        float _4694 = _4688 * 0.15915493667125701904296875;
        float _4696 = _4694 * 6.283185482025146484375;
        float _4698 = cos(_4696);
        float _4700 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4702 = _4700 * 0.15915493667125701904296875;
        float _4704 = _4694 * 6.283185482025146484375;
        float _4706 = sin(_4704);
        float _4708 = 1.0 / _4698;
        float _4710 = _4702 * 6.283185482025146484375;
        float _4712 = cos(_4710);
        float _4714 = _4706 * _4708;
        float _4716 = _4702 * 6.283185482025146484375;
        float _4718 = sin(_4716);
        float _4720 = _4712 * _4714;
        float _4722 = 1.0 / _4692;
        float _4724 = 1.0 / _4720;
        float _4726 = _4718 * _4724;
        float _4728 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4730 = fma(_4630, _4726, _4728);
        float _4732 = _4730 * _4722;
        float _4734 = precise::clamp(_4732, 0.0, 1.0);
        _3254 = _4702;
        _4632 = _4734;
    }
    float _4736 = _3254;
    float _4738 = _4632;
    float _4740 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4742 = _4678 + _4740;
    float _4744 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4746 = _4680 + _4744;
    float _4748 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4750 = _4682 + _4748;
    float _4752 = _4742 * _4742;
    float _4754 = fma(_4746, _4746, _4752);
    float _4756 = fma(_3920, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4758 = fma(_4750, _4750, _4754);
    float _4760 = rsqrt(_4758);
    float _4762 = sqrt(_4758);
    float _4764 = _4760 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4766 = _4746 * _4764;
    float _4768 = _4750 * _4764;
    float _4770 = _4766 * _4766;
    float _4772 = _4768 * _4768;
    float _4774 = _4770 + _4772;
    float _4776 = sqrt(_4774);
    bool _4778 = _4776 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4780 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4782 = _4776 + _4780;
    float _4784 = _4750;
    float _4786 = _4774;
    float _4788 = _4782;
    float _4790 = _4742;
    if (_4778)
    {
        float _4792 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4784 = _4792;
    }
    float _4794 = _4784;
    if (_4778)
    {
        float _4796 = rsqrt(_4774);
        _4786 = _4796;
    }
    float _4798 = _4786;
    if (_4778)
    {
        float _4800 = _4782 * _4794;
        _4788 = _4800;
    }
    float _4802 = _4788;
    if (_4778)
    {
        float _4804 = _4802 * 0.15915493667125701904296875;
        _4686 = _4804;
    }
    float _4806 = _4686;
    float _4808 = _4736;
    if (_4778)
    {
        float _4810 = _4806 * 6.283185482025146484375;
        float _4812 = sin(_4810);
        _4808 = _4812;
    }
    float _4814 = _4808;
    float _4816 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4818 = precise::max(0.0, _4816);
    float _4820 = _4760;
    float _4822 = _4818;
    float _4824 = _4816;
    if (_4778)
    {
        float _4826 = _4806 * 6.283185482025146484375;
        float _4828 = cos(_4826);
        _4820 = _4828;
    }
    float _4830 = _4820;
    float _4832 = -_4764;
    float _4834 = -_4818;
    float _4836 = fma(_4742, _4832, _4834);
    if (!_4778)
    {
        _4790 = _4770;
    }
    float _4838 = _4790;
    float _4840 = _4838;
    if (_4778)
    {
        float _4842 = _4836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4822 = _4842;
    }
    float _4844 = _4822;
    float _4846 = _4844;
    if (!_4778)
    {
        _3990 = _4836;
    }
    float _4848 = _3990;
    float _4850 = _4814;
    float _4852 = _4848;
    if (_4778)
    {
        float _4854 = fma(_4814, _4844, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4850 = _4854;
    }
    float _4856 = _4850;
    float _4858 = _4856;
    if (!_4778)
    {
        _4846 = _4766;
    }
    float _4860 = _4846;
    float _4862 = _4860;
    float _4864 = _4830;
    if (_4778)
    {
        float _4866 = _4830 + (-1.0);
        _4824 = _4866;
    }
    float _4868 = _4824;
    float _4870 = _4868;
    if (_4778)
    {
        float _4872 = _4798 * _4856;
        _4524 = _4872;
    }
    float _4874 = _4524;
    float _4876 = _4678 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_4778)
    {
        float _4878 = _4868 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4858 = _4878;
    }
    float _4880 = _4858;
    if (_4778)
    {
        float _4882 = _4766 * _4874;
        _4862 = _4882;
    }
    float _4884 = _4862;
    if (!_4778)
    {
        _4870 = _4768;
    }
    float _4886 = _4870;
    float _4888 = _4886;
    if (_4778)
    {
        float _4890 = _4768 * _4874;
        _4888 = _4890;
    }
    float _4892 = _4888;
    if (_4778)
    {
        float _4894 = fma(_4836, _4830, _4880);
        _4852 = _4894;
    }
    float _4896 = _4852;
    if (_4778)
    {
        float _4898 = _4884 * _4884;
        _4840 = _4898;
    }
    float _4900 = _4840;
    if (!_4778)
    {
        _4864 = _4772;
    }
    float _4902 = _4864;
    float _4904 = _4902;
    if (_4778)
    {
        float _4906 = _4892 * _4892;
        _4904 = _4906;
    }
    float _4908 = _4904;
    float _4910 = fma(_4680, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4876);
    float _4912 = fma(_4896, _4896, _4900);
    float _4914 = floor(_4756);
    float _4916 = _4912 + _4908;
    float _4918 = fma(_4682, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4910);
    float _4920 = fma(_3924, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4922 = _4678 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4924 = _4918 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4926 = rsqrt(_4916);
    float _4928 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4930 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4932 = fma(_4762, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4930);
    float _4934 = precise::clamp(_4932, 0.0, 1.0);
    float _4936 = _4924 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4938 = fma(_4680, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4922);
    float _4940 = -_4934;
    float _4942 = _4940 + 1.0;
    float _4944 = -_4936;
    float _4946 = fma(_4944, _4928, 1.0);
    float _4948 = _4678 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4950 = _4678 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4952 = fma(_4682, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4938);
    float _4954 = floor(_4920);
    float _4956 = fma(_4680, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4948);
    float _4958 = fma(_4680, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4950);
    float _4960 = _4952 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4962 = fma(_4682, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4956);
    float _4964 = _4926 * _4884;
    float _4966 = _4926 * _4896;
    float _4968 = abs(_4942);
    float _4970 = log2(_4968);
    float _4972 = _4962 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4974 = _4926 * _4892;
    float _4976 = _4964 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4978 = fma(_4682, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4958);
    float _4980 = _4972 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4982 = -_4976;
    float _4984 = fma(_4966, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4982);
    float _4986 = _4978 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4988 = fma(_4960, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4980);
    float _4990 = log2(_4946);
    float _4992 = -_4974;
    float _4994 = fma(_4992, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4984);
    float _4996 = -_4914;
    float _4998 = _4756 + _4996;
    float _5000 = fma(_4924, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4988);
    float _5002 = _4972 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _5004 = fma(_4994, -0.5, 0.5);
    float _5006 = _4970 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5008 = fma(_4986, (*spvDescriptorSet0.vp_c8)._m0[7].w, _5000);
    float _5010 = _4972 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _5012 = fma(_4994, 0.5, 0.5);
    float _5014 = exp2(_5006);
    float _5016 = fma(_4960, (*spvDescriptorSet0.vp_c8)._m0[5].x, _5002);
    float _5018 = fma(_4960, (*spvDescriptorSet0.vp_c8)._m0[4].x, _5010);
    float _5020 = fma(_5012, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5022 = fma(_4924, (*spvDescriptorSet0.vp_c8)._m0[5].z, _5016);
    float _5024 = fma(_4924, (*spvDescriptorSet0.vp_c8)._m0[4].z, _5018);
    float _5026 = fma(_5012, _5020, -0.212114393711090087890625);
    float _5028 = 1.0 / _5008;
    float _5030 = fma(_4986, (*spvDescriptorSet0.vp_c8)._m0[5].w, _5022);
    float _5032 = fma(_4986, (*spvDescriptorSet0.vp_c8)._m0[4].w, _5024);
    float _5034 = -_4954;
    float _5036 = _4920 + _5034;
    float _5038 = _4966 + 1.0;
    float _5040 = fma(_5012, _5026, 1.570728778839111328125);
    float _5042 = _4990 * 0.693147182464599609375;
    float _5044 = sqrt(_5004);
    float _5046 = -_4966;
    float _5048 = fma(_5014, _5038, _5046);
    float _5050 = _5042 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _5052 = fma(_5048, 0.5, 0.5);
    float _5054 = _5032 * _5028;
    float _5056 = _5030 * _5028;
    float2 _13002 = float2(_4998, _5036);
    float _5058 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_13002, float2(0.0), isnan(_13002)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_13002, float2(0.0), isnan(_13002)), level(0.0)).x;
    float _5060 = fma(_5054, 0.5, 0.5);
    float _5062 = fma(_5056, -0.5, 0.5);
    float _5064 = _5044 * 0.636619746685028076171875;
    float3 _13020 = float3(_5060, _5062, _5050);
    float _5066 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_13020, float3(0.0), isnan(_13020)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_13020, float3(0.0), isnan(_13020)), level(0.0)).x;
    float3 _13031 = float3(_5060, _5062, _5050);
    float4 _5069 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_13031, float3(0.0), isnan(_13031)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_13031, float3(0.0), isnan(_13031)), level(0.0)).xyzw;
    float _5071 = _5069.x;
    float _5073 = _5069.y;
    float _5075 = _5069.z;
    float _5077 = _5069.w;
    float _5079 = -_5040;
    float _5081 = fma(_5064, _5079, 1.0);
    float2 _13052 = float2(_5081, _5052);
    float3 _5085 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_13052, float2(0.0), isnan(_13052)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_13052, float2(0.0), isnan(_13052)), level(0.0)).xyz;
    float _5087 = _5085.x;
    float _5089 = _5085.y;
    float _5091 = _5085.z;
    float _5093 = abs(_4630);
    float _5095 = log2(_5093);
    float _5097 = _4972 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5099 = _4970 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_98.x = _4680;
    out.m_98.y = _4678;
    out.m_98.z = _4682;
    float _5101 = fma(_4960, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5097);
    bool _5103 = _4762 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5105 = isnan(_4762);
    bool _5107 = _5103 || _5105;
    bool _5109 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5111 = _5107 || _5109;
    bool _5113 = _4630 <= 8000.0;
    bool _5115 = isnan(_4630);
    bool _5117 = _5113 || _5115;
    bool _5119 = isnan(8000.0);
    bool _5121 = _5117 || _5119;
    float _5123 = float(_5121);
    float _5125 = fma(_4924, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5101);
    float _5127 = exp2(_5099);
    float _5129 = _5032 + _5008;
    float _5131 = fma(_4986, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5125);
    float _5133 = _5095 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5135 = in.m_78.x;
    float _5137 = _5129 * 0.5;
    out.gl_Position.x = _5032;
    out.gl_Position.y = _5030;
    out.gl_Position.z = _5131;
    out.gl_Position.w = _5008;
    float _5139 = exp2(_5133);
    float _5141 = -_5127;
    float _5143 = _5141 + 1.0;
    float _5145 = _5143 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5147 = -_5145;
    float _5149 = _5147 + 1.0;
    float _5151 = fma(_5139, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5153 = precise::clamp(_5151, 0.0, 1.0);
    float _5155 = _5131 + _5008;
    float _5157 = _5131;
    float _5159 = _5008;
    float _5161 = _5030;
    float _5163 = _5149;
    if (!_5111)
    {
        _5157 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5165 = _5157;
    float _5167 = fma(_5153, -2.0, 3.0);
    float _5169 = _5153 * _5153;
    float _5171 = _5155 * 0.5;
    float _5173 = _5169 * _5167;
    float _5175 = -_5173;
    float _5177 = _5175 + 1.0;
    float _5179 = fma(_5177, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5173);
    float _5181 = _5008 * 0.5;
    float _5183 = _5123 * _5179;
    float _5185 = fma(_5030, -0.5, _5181);
    float _5187 = _5165;
    float _5189 = _5165;
    if (!_5111)
    {
        _5159 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5191 = _5159;
    float _5193 = _5183 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5195 = _5191;
    float _5197 = _5191;
    if (!_5111)
    {
        _5161 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5199 = _5161;
    out.m_100.x = _5137;
    out.m_100.y = _5185;
    out.m_100.z = _5171;
    out.m_100.w = _5008;
    float _5201 = -_5058;
    float _5203 = _5201 + 1.0;
    float _5205 = _5203 * _5193;
    float _5207 = precise::clamp(_5205, 0.0, 1.0);
    float _5209 = _5145 * _5066;
    float _5211 = -_5207;
    float _5213 = fma(_5211, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5215 = _5077 * _5209;
    float _5217 = _5213 * _5135;
    float _5219 = _5091 * _5209;
    float _5221 = fma(_5087, _5215, _5071);
    float _5223 = fma(_5089, _5215, _5073);
    float _5225 = _5217 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5227 = _5077 * _5149;
    float _5229 = fma(_5077, _5219, _5075);
    float _5231 = _4738 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5233 = _5217;
    float _5235 = _5215;
    float _5237 = _5199;
    float _5239 = _5199;
    if (!_5111)
    {
        _5233 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5241 = _5233;
    out.m_102.x = _5225;
    float _5243 = _5241;
    float _5245 = _5241;
    if (!_5111)
    {
        _5163 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5247 = _5163;
    float _5249 = _5247;
    float _5251 = _5247;
    if (!_5111)
    {
        _5235 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5253 = _5235;
    out.m_104.x = _5221;
    out.m_104.y = _5223;
    out.m_104.z = _5229;
    out.m_104.w = _5227;
    bool _5255 = !_5111;
    float _5257 = _5253;
    float _5259 = _5253;
    if (!_5255)
    {
        bool _5261 = _4762 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5263 = isnan(_4762);
        bool _5265 = _5261 || _5263;
        bool _5267 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5269 = _5265 || _5267;
        if (!_5269)
        {
            float _5271 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5273 = _4762 + _5271;
            float _5275 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5277 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5275;
            float _5279 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5281 = _5279 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5283 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5285 = _5283 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5287 = 1.0 / _5277;
            float _5289 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5291 = _5289 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5293 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5295 = _5293 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5297 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5299 = _5297 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5301 = _5273 * _5287;
            float _5303 = precise::clamp(_5301, 0.0, 1.0);
            float _5305 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5307 = _5305 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5309 = fma(_5303, _5281, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5311 = fma(_5303, _5285, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5313 = fma(_5303, _5307, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5315 = fma(_5303, _5291, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5317 = fma(_5303, _5295, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5319 = fma(_5303, _5299, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5251 = _5309;
            _5197 = _5317;
            _5239 = _5311;
            _5245 = _5315;
            _5259 = _5313;
            _5189 = _5319;
            _5321 = true;
        }
        else
        {
            bool _5323 = _4762 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5325 = isnan(_4762);
            bool _5327 = _5323 || _5325;
            bool _5329 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5331 = _5327 || _5329;
            if (!_5331)
            {
                _5243 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5333 = _5243;
            _5245 = _5333;
            if (!_5331)
            {
                _5195 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5335 = _5195;
            _5197 = _5335;
            if (!_5331)
            {
                _5187 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5337 = _5187;
            _5189 = _5337;
            if (!_5331)
            {
                _5237 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5339 = _5237;
            _5239 = _5339;
            if (!_5331)
            {
                _5249 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5341 = _5249;
            _5251 = _5341;
            if (!_5331)
            {
                _5257 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5343 = _5257;
            bool _5345 = !_5331;
            _5259 = _5343;
            if (!_5345)
            {
                bool _5347 = _4762 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5349 = isnan(_4762);
                bool _5351 = _5347 || _5349;
                bool _5353 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5355 = _5351 || _5353;
                if (!_5355)
                {
                    float _5357 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5359 = _4762 + _5357;
                    float _5361 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5363 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5361;
                    float _5365 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5367 = _5365 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5369 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5371 = _5369 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5373 = 1.0 / _5363;
                    float _5375 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5377 = _5375 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5379 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5381 = _5379 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5383 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5385 = _5383 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5387 = _5359 * _5373;
                    float _5389 = precise::clamp(_5387, 0.0, 1.0);
                    float _5391 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5393 = _5391 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5395 = fma(_5389, _5367, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5397 = fma(_5389, _5371, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5399 = fma(_5389, _5393, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5401 = fma(_5389, _5377, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5403 = fma(_5389, _5381, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5405 = fma(_5389, _5385, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5251 = _5395;
                    _5197 = _5403;
                    _5239 = _5397;
                    _5245 = _5401;
                    _5259 = _5399;
                    _5189 = _5405;
                    _5321 = true;
                }
                else
                {
                    _5251 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5197 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5239 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5245 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5259 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5189 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5321 = false;
    float _5407 = _5251;
    float _5409 = _5197;
    float _5411 = _5239;
    float _5413 = _5245;
    float _5415 = _5259;
    float _5417 = _5189;
    float _5419 = _5231 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5421 = fma(_4340, -0.5, 0.5);
    float _5423 = precise::clamp(_5421, 0.0, 1.0);
    float _5425 = -_5407;
    float _5427 = _5409 + _5425;
    float _5429 = -_5411;
    float _5431 = _5413 + _5429;
    out.m_55.x = _5419;
    float _5433 = -_5415;
    float _5435 = _5417 + _5433;
    float _5437 = fma(_5423, _5427, _5407);
    float _5439 = fma(_5423, _5431, _5411);
    bool _5441 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5443 = _5437 * 0.586610972881317138671875;
    float _5445 = fma(_5423, _5435, _5415);
    out.m_106.x = 0.0;
    bool _5447 = _4738 > 0.0;
    bool _5449 = isnan(_4738);
    bool _5451 = _5447 || _5449;
    bool _5453 = isnan(0.0);
    bool _5455 = _5451 || _5453;
    float _5457 = fma(_5439, 0.298911988735198974609375, _5443);
    float _5459 = fma(_5445, 0.114477999508380889892578125, _5457);
    float _5461 = -_5459;
    float _5463 = _5439 + _5461;
    float _5465 = -_5459;
    float _5467 = _5437 + _5465;
    float _5469 = -_5459;
    float _5471 = _5445 + _5469;
    float _5473 = fma(_5463, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5459);
    float _5475 = fma(_5467, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5459);
    float _5477 = fma(_5471, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5459);
    bool _5479 = !_5441;
    if (!_5479)
    {
        float _5481 = -_4678;
        float _5483 = _5481 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5485 = -_4680;
        float _5487 = _5485 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5489 = -_4682;
        float _5491 = _5489 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5493 = _5483 * _5483;
        float _5495 = fma(_5487, _5487, _5493);
        float _5497 = fma(_5491, _5491, _5495);
        float _5499 = sqrt(_5497);
        float _5501 = rsqrt(_5497);
        float _5503 = -_5499;
        float _5505 = _5503 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5507 = _5505 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5509 = precise::clamp(_5507, 0.0, 1.0);
        float _5511 = _5487 * _5501;
        float _5513 = _5483 * _5501;
        float _5515 = abs(_5509);
        float _5517 = log2(_5515);
        float _5519 = _5491 * _5501;
        float _5521 = _5511 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5523 = _4340 * _5513;
        float _5525 = -_5513;
        float _5527 = -_5521;
        float _5529 = fma(_5525, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5527);
        float _5531 = fma(_4344, _5511, _5523);
        float _5533 = -_5519;
        float _5535 = fma(_5533, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5529);
        float _5537 = fma(_4346, _5519, _5531);
        float _5539 = precise::clamp(_5537, 0.0, 1.0);
        float _5541 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5543 = _5535 + _5541;
        float _5545 = _5517 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5547 = _5543 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5549 = precise::clamp(_5547, 0.0, 1.0);
        float _5551 = exp2(_5545);
        float _5553 = _5551 * _5549;
        float _5555 = _5539 * _5553;
        float _5557 = _5555 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5559 = _5555 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5561 = _5555 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_106.x = _5557;
        out.m_106.y = _5559;
        out.m_106.z = _5561;
    }
    out.m_108.x = _5473;
    out.m_108.y = _5475;
    out.m_108.z = _5477;
    if (_5455)
    {
        return out;
    }
    out.m_55.x = 0.0;
    float _5563 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5563;
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
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5321 = false;
    bool _4394 = false;
    bool _737 = false;
    bool _563 = false;
    bool _457 = false;
    bool _269 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _122 = in.m_48.w;
    float _124 = in.m_50.w;
    float _126 = trunc(_122);
    int _129 = int(_126);
    float _131 = -_124;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _133;
    bool _137 = _129 >= 1;
    float _139 = 0.0;
    float _141 = _124;
    float _143 = _133;
    if (!_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _139;
    if (!_137)
    {
        out.m_55.x = 0.0;
    }
    int _147 = 0;
    if (!_137)
    {
        float _149 = _145 * 5.0;
        _147 = as_type<int>(_149);
    }
    int _151 = _147;
    int _153 = _151;
    if (!_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5631 = as_type<float>(_151);
        out.gl_Position.z = _5631;
    }
    if (!_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _155 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _157 = isnan(_124);
    bool _159 = _155 || _157;
    bool _161 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _163 = _159 || _161;
    float _165 = float(_129);
    bool _167 = _133 >= _165;
    bool _169 = !_163;
    bool _171 = _167 || _169;
    float _173 = 1.0 / _165;
    if (_171)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _141;
    if (_171)
    {
        out.m_55.x = 0.0;
    }
    float _177 = _133 * _173;
    float _179 = _177;
    if (_171)
    {
        float _181 = _175 * 5.0;
        _153 = as_type<int>(_181);
    }
    int _183 = _153;
    out.m_53.x = _177;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5694 = as_type<float>(_183);
        out.gl_Position.z = _5694;
    }
    if (_171)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _185 = as_type<float>(int(gl_VertexIndex));
    float _187 = in.m_60.x;
    float _189 = in.m_60.y;
    float _191 = in.m_60.z;
    float _193 = in.m_62.x;
    float _195 = in.m_62.y;
    float _197 = in.m_62.z;
    float _199 = in.m_64.x;
    float _201 = in.m_64.y;
    float _203 = in.m_64.z;
    float _205 = in.m_66.x;
    float _207 = in.m_66.y;
    float _209 = in.m_66.z;
    int _211 = as_type<int>(_185) & 1;
    bool _213 = _211 != 0;
    int _215 = as_type<int>(_185) & 2;
    bool _217 = _215 != 0;
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _221 = !_217;
    float _223 = _221 ? (-0.5) : 0.5;
    float _225 = _189 * _195;
    float _227 = _189 * _201;
    float _229 = fma(_187, _193, _225);
    float _231 = _189 * _207;
    float _233 = fma(_187, _199, _227);
    float _235 = fma(_191, _197, _229);
    bool _237 = !_213;
    float _239 = _237 ? (-0.5) : 0.5;
    float _241 = fma(_187, _205, _231);
    float _243 = fma(_191, _203, _233);
    float _245 = fma(_191, _209, _241);
    bool _247 = !_219;
    float _249 = _243;
    float _267;
    if (!_247)
    {
        float _251 = in.m_68.x;
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _255 = _251 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _259 = _257 * _253;
        float _261 = floor(_259);
        float _263 = -_261;
        float _265 = _259 + _263;
        _267 = _265;
        _269 = true;
    }
    else
    {
        _267 = _177;
    }
    _269 = false;
    float _271 = _267;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = _271 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = _271 + _277;
    bool _281 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _283 = isnan(_271);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _271 + _305;
    float _309 = 1.0 / _299;
    bool _311 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _313 = 1.0 / _295;
    float _315 = 1.0 / _303;
    float _317 = _307 * _309;
    bool _319 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _321 = isnan(_271);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = _275 * _313;
    bool _333 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _335 = isnan(_271);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -_291;
    float _347 = _345 + 1.0;
    float _349 = _343 * _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _355 = _279 * _315;
    bool _357 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _359 = isnan(_271);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -_343;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _385 = _367 * _371;
    float _387 = -_367;
    float _389 = _387 + 1.0;
    float _391 = fma(_375, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _393 = fma(_379, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _395 = fma(_353, _317, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _397 = _329 * _389;
    float _399 = fma(_383, _317, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _401 = -_329;
    float _403 = _401 + 1.0;
    float _405 = _391 * _397;
    float _407 = _393 * _397;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _413;
    float _417 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[143].x, _405);
    float _419 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[143].y, _407);
    float _421 = fma(_411, _355, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _423 = fma(_415, _355, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _425 = fma(_395, _385, _417);
    float _427 = fma(_399, _385, _419);
    float _429 = fma(_421, _349, _425);
    float _431 = fma(_423, _349, _427);
    float _433 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[146].x, _429);
    float _435 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[146].y, _431);
    bool _437 = !_311;
    float _455;
    if (!_437)
    {
        float _439 = in.m_68.x;
        float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _443 = _439 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _445 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _447 = _445 * _441;
        float _449 = floor(_447);
        float _451 = -_449;
        float _453 = _447 + _451;
        _455 = _453;
        _457 = true;
    }
    else
    {
        _455 = _177;
    }
    _457 = false;
    float _459 = _455;
    float _461 = in.m_70.x;
    float _463 = in.m_70.y;
    bool _465 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _467 = isnan(_459);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _481 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _483 = isnan(_459);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _499 = _459 + _497;
    float _501 = -_475;
    float _503 = _501 + 1.0;
    bool _505 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _507 = 1.0 / _479;
    float _509 = _491 * _503;
    float _511 = -_491;
    float _513 = _511 + 1.0;
    float _515 = _435 * _463;
    float _517 = _495 * _507;
    float _519 = fma(_517, _499, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _523 = _519 * _509;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _527 = _521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _529 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[115].x, _523);
    float _531 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _533 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[116].x, _529);
    float _535 = _433 * _461;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _539 = _533 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _541 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _531;
    out.m_72.y = _527;
    out.m_72.z = _541;
    out.m_72.w = _539;
    bool _543 = !_505;
    float _561;
    if (!_543)
    {
        float _545 = in.m_68.x;
        float _547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _549 = _545 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _551 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[11].w, _133);
        float _553 = _551 * _547;
        float _555 = floor(_553);
        float _557 = -_555;
        float _559 = _553 + _557;
        _561 = _559;
        _563 = true;
    }
    else
    {
        _561 = _177;
    }
    _563 = false;
    float _565 = _561;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _569 = _565 + _567;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _579 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _581 = isnan(_565);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _595 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _597 = isnan(_565);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = 1.0 / _573;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _609;
    float _613 = -_589;
    float _615 = _613 + 1.0;
    bool _617 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _619 = isnan(_565);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    bool _629 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _631 = 1.0 / _577;
    float _633 = 1.0 / _593;
    float _635 = _611 * _607;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _641 = _605 * _615;
    float _643 = -_605;
    float _645 = _643 + 1.0;
    float _647 = fma(_635, _569, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _649 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _651 = isnan(_565);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = _627 * _645;
    float _663 = _639 * _631;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _667 = _565 + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _669;
    float _673 = _647 * _661;
    float _675 = -_627;
    float _677 = _675 + 1.0;
    float _679 = fma(_663, _667, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _681 = -_659;
    float _683 = _681 + 1.0;
    float _685 = _671 * _633;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _689 = _565 + _687;
    float _691 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[131].x, _673);
    float _693 = _589 * _683;
    float _695 = fma(_685, _689, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _697 = fma(_679, _641, _691);
    float _699 = fma(_695, _693, _697);
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _707 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[134].x, _699);
    float _709 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _705 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = _707 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_74.x = _709;
    out.m_74.y = _713;
    out.m_74.z = _711;
    out.m_74.w = _715;
    bool _717 = !_629;
    float _735;
    if (!_717)
    {
        float _719 = in.m_68.x;
        float _721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _723 = _719 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _725 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[14].x, _133);
        float _727 = _725 * _721;
        float _729 = floor(_727);
        float _731 = -_729;
        float _733 = _727 + _731;
        _735 = _733;
        _737 = true;
    }
    else
    {
        _735 = _177;
    }
    _737 = false;
    float _739 = _735;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _743 = _739 + _741;
    bool _745 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _747 = isnan(_739);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    bool _757 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _759 = isnan(_739);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _771 = _769 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _773 = -_755;
    float _775 = _773 + 1.0;
    float _777 = -_767;
    float _779 = _777 + 1.0;
    bool _781 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _783 = isnan(_739);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _789 = _785 || _787;
    float _791 = float(_789);
    float _793 = 1.0 / _771;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _795;
    float _799 = _767 * _775;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _805 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _807 = isnan(_739);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _813 = _809 || _811;
    float _815 = float(_813);
    float _817 = _791 * _779;
    float _819 = -_791;
    float _821 = _819 + 1.0;
    bool _823 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _825 = isnan(_739);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = 1.0 / _803;
    float _837 = _815 * _821;
    float _839 = -_815;
    float _841 = _839 + 1.0;
    bool _843 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _845 = isnan(_739);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = -_833;
    float _857 = _855 + 1.0;
    float _859 = _833 * _841;
    float _861 = _797 * _793;
    bool _863 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _865 = isnan(_739);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = fma(_861, _743, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _879 = _877 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _883 = _881 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _885 = _853 * _857;
    float _887 = -_853;
    float _889 = _887 + 1.0;
    float _891 = 1.0 / _883;
    bool _893 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _895 = _873 * _889;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _901 = -_873;
    float _903 = _901 + 1.0;
    float _905 = _875 * _895;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _909 = _739 + _907;
    float _911 = 1.0 / _879;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _921 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[159].x, _905);
    float _923 = _915 * _835;
    float _925 = 1.0 / _899;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _927;
    float _931 = fma(_923, _909, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _939 = _937 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _941 = _929 * _891;
    float _943 = fma(_931, _885, _921);
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _947 = _739 + _945;
    float _949 = 1.0 / _919;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _953 = _739 + _951;
    float _955 = _939 * _911;
    float _957 = fma(_941, _953, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _959;
    float _963 = fma(_955, _947, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _965 = 1.0 / _935;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _969 = _967 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _971 = _961 * _925;
    float _973 = fma(_957, _859, _943);
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _977 = _739 + _975;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _981 = _739 + _979;
    float _983 = _969 * _949;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _985;
    bool _989 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _991 = isnan(_739);
    bool _993 = _989 || _991;
    bool _995 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _997 = _993 || _995;
    float _999 = float(_997);
    float _1001 = fma(_971, _977, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1003 = fma(_963, _837, _973);
    float _1005 = fma(_983, _981, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1009 = _739 + _1007;
    float _1011 = -_999;
    float _1013 = _1011 + 1.0;
    float _1015 = _987 * _965;
    float _1017 = fma(_1001, _817, _1003);
    float _1019 = _755 * _1013;
    float _1021 = fma(_1015, _1009, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1023 = fma(_1005, _799, _1017);
    float _1025 = fma(_1021, _1019, _1023);
    float _1027 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1025);
    out.m_76.x = _1027;
    bool _1029 = !_893;
    float _1031 = _925;
    float _1033 = _973;
    if (!_1029)
    {
        float _1035 = in.m_68.x;
        float _1037 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1039 = _1035 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1041 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[14].y, _133);
        float _1043 = _1041 * _1037;
        float _1045 = floor(_1043);
        float _1047 = -_1045;
        float _1049 = _1043 + _1047;
        _179 = _1049;
    }
    float _1051 = _179;
    float _1053 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1055 = int(_1053);
    int _1057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1059 = _1057 != 0;
    float _1061 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1063 = int(_1061);
    float _1065 = float(_1055);
    float _1067 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1069 = int(_1067);
    if (_1059)
    {
        _1031 = 1.0;
    }
    float _1071 = _1031;
    float _1073 = _1071;
    if (_1059)
    {
        _1033 = 1.0;
    }
    float _1075 = _1033;
    int _1077 = 0;
    float _1079 = _1075;
    if (_1059)
    {
        _1077 = 0;
    }
    int _1081 = _1077;
    float _1083 = float(_1063);
    float _1085 = 1.0 / _1065;
    float _1087 = 1.0 / _1083;
    float _1089 = float(uint(_1069));
    int _1091 = ~_1069;
    int _1093 = _1091 + 1;
    float _1095 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1097 = int(_1095);
    float _1099 = _1085 * _133;
    float _1101 = _1085;
    float _1103 = _1083;
    int _1105 = _1081;
    if (_1059)
    {
        float _1107 = in.m_68.x;
        float _1109 = in.m_68.y;
        _1101 = _1107;
        _1103 = _1109;
    }
    float _1111 = _1101;
    float _1113 = _1103;
    float _1115 = _1087 * _133;
    float _1117 = 1.0 / _1089;
    float _1119 = float(uint(_1097));
    float _1121 = trunc(_1099);
    int _1123 = int(_1121);
    float _1125 = 1.0 / _1119;
    int _1127 = as_type<int>(_1117) + (-2);
    float _1129 = 0.0;
    float _1131 = _1111;
    float _1133 = _1113;
    if (_1059)
    {
        _1129 = _1113;
    }
    float _1135 = _1129;
    float _1137 = trunc(_1115);
    int _1139 = int(_1137);
    float _1141 = float(uint(_1123));
    float _1143 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1145 = int(_1143);
    int _1147 = as_type<int>(_1125) + (-2);
    float _1149 = as_type<float>(_1127) * _1141;
    int _1151 = as_type<int>(_1141);
    float _1153 = _1135;
    if (_1059)
    {
        _1151 = 0;
    }
    int _1155 = _1151;
    float _1157 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1159 = int(_1157);
    float _1161 = float(uint(_1139));
    float _1163 = as_type<float>(_1147) * _1161;
    float _1165 = _1161;
    int _1167 = _1155;
    if (_1059)
    {
        _1165 = _1111;
    }
    float _1169 = _1165;
    float _1171 = trunc(_1149);
    float _1173 = precise::max(_1171, 0.0);
    uint _1176 = uint(_1173);
    float _1178 = float(uint(_1145));
    float _1180 = 0.0;
    float _1182 = _1169;
    if (_1059)
    {
        _1180 = _1169;
    }
    float _1184 = _1180;
    float _1186 = 1.0 / _1178;
    float _1188 = float(_1159);
    float _1190 = trunc(_1163);
    float _1192 = precise::max(_1190, 0.0);
    uint _1194 = uint(_1192);
    float _1196 = 1.0 / _1188;
    float _1198 = _1188;
    float _1200 = _1184;
    if (_1059)
    {
        _1198 = _1169;
    }
    float _1202 = _1198;
    float _1204 = _1202;
    if (!_1059)
    {
        float _1206 = in.m_68.x;
        float _1208 = in.m_68.y;
        float _1210 = in.m_68.z;
        float _1212 = _1206 * 3.1415927410125732421875;
        float _1214 = _1212 * 0.15915493667125701904296875;
        float _1216 = _1208 * 3.1415927410125732421875;
        float _1218 = _1216 * 0.15915493667125701904296875;
        float _1220 = _1214 * 6.283185482025146484375;
        float _1222 = sin(_1220);
        float _1224 = _1218 * 6.283185482025146484375;
        float _1226 = sin(_1224);
        _1079 = 5.839270114898681640625;
        _1204 = _1210;
        _1073 = 7.345489978790283203125;
        _1182 = _1208;
        _1131 = _1206;
        _1133 = _1208;
        _1167 = 1;
        _1105 = 2;
        _1200 = _1222;
        _1153 = _1226;
    }
    float _1228 = _1079;
    float _1230 = _1204;
    float _1232 = _1073;
    float _1234 = _1182;
    float _1236 = _1131;
    float _1238 = _1133;
    int _1240 = _1167;
    int _1242 = _1105;
    float _1244 = _1200;
    float _1246 = _1153;
    float _1248 = _1228 * _1230;
    float _1250 = _1196 * _133;
    float _1252 = in.m_68.z;
    float _1254 = in.m_68.w;
    int _1256 = ~_1097;
    int _1258 = _1256 + 1;
    float _1260 = floor(_1248);
    int _1262 = _1093 * int(_1176);
    int _1264 = _1262 + _1123;
    float _1266 = _1232 * _1234;
    float _1268 = _1232 * _1236;
    int _1270 = _1258 * int(_1194);
    int _1272 = _1270 + _1139;
    float _1274 = float(_1123);
    float _1276 = in.m_78.y;
    float _1278 = float(uint(_1264));
    float _1280 = trunc(_1250);
    int _1282 = int(_1280);
    float _1284 = float(uint(_1272));
    bool _1286 = _1238 > 0.5;
    float _1288 = as_type<float>(_1127) * _1278;
    float _1290 = float(_1069);
    float _1292 = -_1260;
    float _1294 = _1248 + _1292;
    float _1296 = as_type<float>(_1147) * _1284;
    float _1298 = floor(_1268);
    int _1300 = as_type<int>(_1186) + (-2);
    bool _1302 = _1274 >= _1290;
    bool _1304 = isnan(_1274);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan(_1290);
    bool _1310 = _1306 || _1308;
    float _1312 = float(_1310);
    bool _1314 = _1254 > 0.5;
    float _1316 = float(uint(_1282));
    float _1318 = trunc(_1288);
    float _1320 = precise::max(_1318, 0.0);
    uint _1322 = uint(_1320);
    bool _1324 = _1252 > 0.5;
    float _1326 = as_type<float>(_1300) * _1316;
    int _1328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1330 = _1328 != 0;
    int _1332 = ~_1097;
    int _1334 = _1332 + 1;
    float _1336 = trunc(_1296);
    float _1338 = precise::max(_1336, 0.0);
    uint _1340 = uint(_1338);
    float _1342 = -_1298;
    float _1344 = _1268 + _1342;
    int _1346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1348 = _1346 != 0;
    int _1350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1352 = _1350 != 0;
    int _1354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1356 = _1354 != 0;
    float _1358 = -_239;
    int _1360 = _1286 ? as_type<int>(_1358) : as_type<int>(_239);
    float _1362 = float(_1097);
    float _1364 = trunc(_1326);
    float _1366 = precise::max(_1364, 0.0);
    uint _1368 = uint(_1366);
    int _1370 = int(_1176) + int(_1322);
    int _1372 = ~_1069;
    int _1374 = _1372 + 1;
    int _1376 = int(_1314);
    int _1378 = _1324 ? 2 : 0;
    int _1380 = _1376 | _1378;
    int _1382 = _1330 ? 4 : 0;
    int _1384 = _1380 | _1382;
    int _1386 = _1348 ? 8 : 0;
    int _1388 = _1384 | _1386;
    int _1390 = _1352 ? 16 : 0;
    int _1392 = _1388 | _1390;
    int _1394 = _1356 ? 32 : 0;
    int _1396 = _1392 | _1394;
    int _1398 = _1286 ? 64 : 0;
    int _1400 = _1396 | _1398;
    int _1402 = _1400 & 64;
    float _1404 = float(_1139);
    float _1406 = trunc(_1312);
    int _1408 = int(_1406);
    int _1410 = int(_1194) + int(_1340);
    int _1412 = _1374 * _1370;
    int _1414 = _1412 + _1123;
    bool _1416 = !_1352;
    float _1418 = _1416 ? _239 : as_type<float>(_1360);
    bool _1420 = _1404 >= _1362;
    bool _1422 = isnan(_1404);
    bool _1424 = _1420 || _1422;
    bool _1426 = isnan(_1362);
    bool _1428 = _1424 || _1426;
    float _1430 = float(_1428);
    int _1432 = _1334 * _1410;
    int _1434 = _1432 + _1139;
    int _1436 = ~_1145;
    int _1438 = _1436 + 1;
    float _1440 = floor(_1266);
    float _1442 = -_223;
    int _1444 = _1324 ? as_type<int>(_1442) : as_type<int>(_223);
    float _1446 = _1344 * _1290;
    bool _1448 = !_1330;
    int _1450 = _1448 ? 0 : 1;
    int _1452 = _1438 * int(_1368);
    int _1454 = _1452 + _1282;
    bool _1456 = !_1356;
    float _1458 = _1456 ? _223 : as_type<float>(_1444);
    float _1460 = _1294 * _1362;
    int _1462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1464 = _1462 != 0;
    int _1466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1468 = _1466 != 0;
    int _1470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1472 = _1470 != 0;
    float _1474 = trunc(_1446);
    int _1476 = int(_1474);
    bool _1478 = uint(_1414) >= uint(_1069);
    int _1480 = abs(_1450);
    bool _1482 = !_1468;
    int _1484 = _1482 ? 0 : 1;
    bool _1486 = !_1464;
    int _1488 = _1486 ? 0 : 1;
    float _1490 = -_1440;
    float _1492 = _1266 + _1490;
    int _1494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1496 = _1494 != 0;
    float _1498 = trunc(_1430);
    int _1500 = int(_1498);
    bool _1502 = uint(_1434) >= uint(_1097);
    bool _1504 = !_1472;
    int _1506 = _1504 ? 0 : 1;
    bool _1508 = !_1496;
    int _1510 = _1508 ? 0 : 1;
    int _1512 = _1476 * _1480;
    int _1514 = _1512 + _1123;
    bool _1516 = !_1502;
    int _1518 = _1516 ? 0 : (-1);
    float _1520 = trunc(_1460);
    int _1522 = int(_1520);
    int _1524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1526 = _1524 != 0;
    int _1528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1530 = _1528 != 0;
    int _1532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1534 = _1532 != 0;
    float _1536 = float(uint(_1454));
    bool _1538 = !_1478;
    int _1540 = _1538 ? 0 : (-1);
    bool _1542 = !_1530;
    int _1544 = _1542 ? 0 : 1;
    bool _1546 = _1402 != 0;
    float _1548 = as_type<float>(_1300) * _1536;
    int _1550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1552 = _1550 != 0;
    int _1554 = ~_1370;
    int _1556 = _1554 + _1540;
    int _1558 = _1556 + 1;
    bool _1560 = !_1552;
    int _1562 = _1560 ? 0 : 1;
    float _1564 = trunc(_1548);
    float _1566 = precise::max(_1564, 0.0);
    uint _1568 = uint(_1566);
    int _1570 = ~_1410;
    int _1572 = _1570 + _1518;
    int _1574 = _1572 + 1;
    int _1576 = _1069 * _1558;
    int _1578 = _1576 + _1123;
    int _1580 = abs(_1562);
    float _1582 = _173 * _133;
    bool _1584 = _1069 == 0;
    int _1586 = _1097 * _1574;
    int _1588 = _1586 + _1139;
    bool _1590 = !_1526;
    int _1592 = _1590 ? 0 : 1;
    float _1594 = _1290 * _1582;
    bool _1596 = _1097 == 0;
    int _1598 = _1522 * _1580;
    int _1600 = _1598 + _1139;
    int _1602 = ~_1408;
    int _1604 = _1602 + 1;
    int _1606 = _1604 + 1;
    float _1608 = _1362 * _1582;
    bool _1610 = !_1584;
    int _1612 = _1610 ? _1578 : (-1);
    float _1614 = trunc(_1594);
    int _1616 = int(_1614);
    int _1618 = ~_1500;
    int _1620 = _1618 + 1;
    int _1622 = _1620 + 1;
    bool _1624 = !_1596;
    int _1626 = _1624 ? _1588 : (-1);
    int _1628 = _1612 * _1606;
    int _1630 = int(_1368) + int(_1568);
    int _1632 = abs(_1484);
    int _1634 = _1626 * _1622;
    int _1636 = _1069 + (-1);
    float _1638 = trunc(_1608);
    int _1640 = int(_1638);
    int _1642 = _1097 + (-1);
    int _1644 = abs(_1544);
    int _1646 = _1408 * _1636;
    int _1648 = _1646 + _1628;
    int _1650 = abs(_1488);
    int _1652 = _1500 * _1642;
    int _1654 = _1652 + _1634;
    int _1656 = _1648 * _1632;
    int _1658 = abs(_1506);
    int _1660 = _1654 * _1644;
    int _1662 = abs(_1510);
    int _1664 = _1616 * _1650;
    int _1666 = _1664 + _1656;
    int _1668 = ~_1145;
    int _1670 = _1668 + 1;
    int _1672 = _1514 * _1658;
    int _1674 = _1672 + _1666;
    int _1676 = abs(_1592);
    int _1678 = _1670 * _1630;
    int _1680 = _1678 + _1282;
    float _1682 = -_223;
    int _1684 = _1314 ? as_type<int>(_1682) : as_type<int>(_223);
    int _1686 = _1476 * _1662;
    int _1688 = _1686 + _1674;
    float _1690 = -_239;
    float _1692 = _1324 ? _1690 : _239;
    bool _1694 = uint(_1680) >= uint(_1145);
    int _1696 = _1640 * _1676;
    int _1698 = _1696 + _1660;
    float _1700 = float(uint(_1688));
    int _1702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1704 = _1702 != 0;
    bool _1706 = !_1534;
    int _1708 = _1706 ? 0 : 1;
    float _1710 = as_type<float>(_1127) * _1700;
    bool _1712 = !_1704;
    int _1714 = _1712 ? 0 : 1;
    float _1716 = float(_1145);
    float _1718 = trunc(_1710);
    float _1720 = precise::max(_1718, 0.0);
    uint _1722 = uint(_1720);
    int _1724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1726 = _1724 != 0;
    float _1728 = float(_1282);
    float _1730 = _1716 * _1582;
    int _1732 = abs(_1708);
    int _1734 = abs(_1714);
    float _1736 = _1492 * _1716;
    bool _1738 = !_1694;
    int _1740 = _1738 ? 0 : (-1);
    float _1742 = trunc(_1730);
    int _1744 = int(_1742);
    bool _1746 = !_1726;
    int _1748 = _1746 ? 0 : 1;
    bool _1750 = !_1348;
    float _1752 = _1750 ? _223 : as_type<float>(_1684);
    bool _1754 = _1728 >= _1716;
    bool _1756 = isnan(_1728);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan(_1716);
    bool _1762 = _1758 || _1760;
    float _1764 = float(_1762);
    int _1766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1768 = _1766 != 0;
    int _1770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1772 = _1770 != 0;
    int _1774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1776 = _1774 != 0;
    int _1778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1780 = _1778 != 0;
    float _1782 = trunc(_1736);
    int _1784 = int(_1782);
    int _1786 = ~_1630;
    int _1788 = _1786 + _1740;
    int _1790 = _1788 + 1;
    int _1792 = _1600 * _1732;
    int _1794 = _1792 + _1698;
    int _1796 = ~_1069;
    int _1798 = _1796 + 1;
    int _1800 = _1145 * _1790;
    int _1802 = _1800 + _1282;
    bool _1804 = !_1772;
    int _1806 = _1804 ? 0 : 1;
    float _1808 = trunc(_1764);
    int _1810 = int(_1808);
    int _1812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1814 = _1812 != 0;
    int _1816 = _1522 * _1734;
    int _1818 = _1816 + _1794;
    bool _1820 = !_1768;
    int _1822 = _1820 ? 0 : 1;
    float _1824 = float(uint(_1818));
    int _1826 = _1798 * int(_1722);
    int _1828 = _1826 + _1688;
    bool _1830 = _1145 == 0;
    int _1832 = abs(_1806);
    float _1834 = as_type<float>(_1147) * _1824;
    float _1836 = float(uint(_1828));
    float _1838 = _1710;
    float _1840 = _1692;
    if (_1814)
    {
        float _1842 = in.m_68.w;
        _1838 = _1842;
    }
    float _1844 = _1838;
    bool _1846 = !_1830;
    int _1848 = _1846 ? _1802 : (-1);
    float _1850 = trunc(_1834);
    float _1852 = precise::max(_1850, 0.0);
    uint _1854 = uint(_1852);
    int _1856 = ~_1810;
    int _1858 = _1856 + 1;
    int _1860 = _1858 + 1;
    float _1862 = as_type<float>(_1127) * _1836;
    int _1864 = abs(_1748);
    int _1866 = abs(_1822);
    int _1868 = _1848 * _1860;
    int _1870 = _1145 + (-1);
    float _1872 = trunc(_1862);
    float _1874 = precise::max(_1872, 0.0);
    uint _1876 = uint(_1874);
    int _1878 = ~_1069;
    int _1880 = _1878 + 1;
    int _1882 = _1810 * _1870;
    int _1884 = _1882 + _1868;
    int _1886 = ~_1097;
    int _1888 = _1886 + 1;
    int _1890 = _1784 * _1864;
    int _1892 = _1890 + _1282;
    int _1894 = _1884 * _1832;
    bool _1896 = !_1776;
    int _1898 = _1896 ? 0 : 1;
    int _1900 = _1888 * int(_1854);
    int _1902 = _1900 + _1818;
    int _1904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1906 = _1904 != 0;
    int _1908 = _1744 * _1866;
    int _1910 = _1908 + _1894;
    bool _1912 = _1069 == 0;
    float _1914 = as_type<float>(_1864);
    float _1916 = as_type<float>(_1866);
    float _1918 = as_type<float>(_1854);
    if (_1814)
    {
        float _1920 = _1844 * 3.1415927410125732421875;
        _1914 = _1920;
    }
    float _1922 = _1914;
    float _1924 = float(uint(_1902));
    int _1926 = int(_1722) + int(_1876);
    if (_1814)
    {
        float _1928 = _1922 * 0.15915493667125701904296875;
        _1916 = _1928;
    }
    float _1930 = _1916;
    bool _1932 = !_1780;
    int _1934 = _1932 ? 0 : 1;
    float _1936 = as_type<float>(_1147) * _1924;
    int _1938 = abs(_1898);
    int _1940 = _1880 * _1926;
    int _1942 = _1940 + _1688;
    int _1944 = abs(_1934);
    float _1946 = as_type<float>(_1744);
    if (_1906)
    {
        float _1948 = in.m_68.x;
        _1946 = _1948;
    }
    float _1950 = _1946;
    float _1952 = trunc(_1936);
    float _1954 = precise::max(_1952, 0.0);
    uint _1956 = uint(_1954);
    int _1958 = _1892 * _1938;
    int _1960 = _1958 + _1910;
    bool _1962 = uint(_1942) >= uint(_1069);
    float _1964 = float(uint(_1514));
    float _1966 = as_type<float>(_1898);
    if (_1814)
    {
        float _1968 = _1930 * 6.283185482025146484375;
        float _1970 = sin(_1968);
        _1966 = _1970;
    }
    float _1972 = _1966;
    bool _1974 = !_1962;
    int _1976 = _1974 ? 0 : (-1);
    float _1978 = as_type<float>(_1127) * _1964;
    int _1980 = _1784 * _1944;
    int _1982 = _1980 + _1960;
    int _1984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1986 = _1984 != 0;
    int _1988 = ~_1926;
    int _1990 = _1988 + _1976;
    int _1992 = _1990 + 1;
    float _1994 = trunc(_1978);
    float _1996 = precise::max(_1994, 0.0);
    uint _1998 = uint(_1996);
    float _2000 = float(uint(_1982));
    int _2002 = _1069 * _1992;
    int _2004 = _2002 + _1688;
    int _2006 = int(_1854) + int(_1956);
    float _2008 = as_type<float>(_1300) * _2000;
    bool _2010 = !_1986;
    float _2012 = _2010 ? _239 : _1692;
    bool _2014 = _1986;
    if (_1906)
    {
        float _2016 = _1950 * 3.1415927410125732421875;
        _1840 = _2016;
    }
    float _2018 = _1840;
    float _2020 = _2018;
    if (_1814)
    {
        bool _2022 = _1972 > 0.5;
        _2014 = _2022;
    }
    bool _2024 = _2014;
    float _2026 = trunc(_2008);
    float _2028 = precise::max(_2026, 0.0);
    uint _2030 = uint(_2028);
    bool _2032 = !_1912;
    int _2034 = _2032 ? _2004 : (-1);
    if (_1906)
    {
        float _2036 = _2018 * 0.15915493667125701904296875;
        _2020 = _2036;
    }
    float _2038 = _2020;
    int _2040 = ~_1069;
    int _2042 = _2040 + 1;
    float _2044 = _2038;
    if (!_1814)
    {
        _1918 = _239;
    }
    float _2046 = _1918;
    float _2048 = _2046;
    if (_1814)
    {
        float _2050 = -_239;
        float _2052 = _2024 ? _2050 : _239;
        _2048 = _2052;
    }
    float _2054 = _2048;
    int _2056 = _2042 * int(_1998);
    int _2058 = _2056 + _1514;
    float _2060 = float(uint(_1600));
    int _2062 = as_type<int>(_2054);
    if (_1906)
    {
        float _2064 = _2038 * 6.283185482025146484375;
        float _2066 = sin(_2064);
        _2044 = _2066;
    }
    float _2068 = _2044;
    int _2070 = _2034 & 3;
    bool _2072 = _2070 != 0;
    float _2074 = _2054 + 0.5;
    int _2076 = _2034 & 3;
    bool _2078 = _2076 != 0;
    float _2080 = as_type<float>(_1147) * _2060;
    int _2082 = _2072 ? 0 : 1;
    int _2084 = ~_1145;
    int _2086 = _2084 + 1;
    bool _2088 = uint(_2076) > 1u;
    float _2090 = trunc(_2080);
    float _2092 = precise::max(_2090, 0.0);
    uint _2094 = uint(_2092);
    float _2096 = float(uint(_2058));
    int _2098 = ~_1097;
    int _2100 = _2098 + 1;
    float _2102 = as_type<float>(_1127) * _2096;
    int _2104 = ~_2082;
    int _2106 = _2104 + 1;
    int _2108 = _2106 + 1;
    int _2110 = _2086 * int(_2030);
    int _2112 = _2110 + _1982;
    float _2114 = -_223;
    int _2116 = _1546 ? as_type<int>(_2114) : as_type<int>(_223);
    int _2118 = _2100 * _2006;
    int _2120 = _2118 + _1818;
    bool _2122 = uint(_2076) >= 2u;
    float _2124 = trunc(_2102);
    float _2126 = precise::max(_2124, 0.0);
    uint _2128 = uint(_2126);
    int _2130 = _2108;
    if (!_2088)
    {
        int _2132 = ~_2082;
        int _2134 = _2132 + 1;
        _2130 = _2134;
    }
    int _2136 = _2130;
    float _2138 = float(uint(_2112));
    bool _2140 = uint(_2120) >= uint(_1097);
    int _2142 = ~_1097;
    int _2144 = _2142 + 1;
    float _2146 = as_type<float>(_1300) * _2138;
    int _2148 = _2122 ? 0 : 1;
    bool _2150 = _2076 != 3;
    int _2152 = _2144 * int(_2094);
    int _2154 = _2152 + _1600;
    bool _2156 = !_2140;
    int _2158 = _2156 ? 0 : (-1);
    float _2160 = trunc(_2146);
    float _2162 = precise::max(_2160, 0.0);
    uint _2164 = uint(_2162);
    int _2166 = ~_2148;
    int _2168 = _2166 + 1;
    int _2170 = _2168 + 1;
    int _2172 = ~_2006;
    int _2174 = _2172 + _2158;
    int _2176 = _2174 + 1;
    float _2178 = float(uint(_2154));
    int _2180 = _1097 * _2176;
    int _2182 = _2180 + _1818;
    float _2184 = 0.0;
    int _2186 = _2170;
    bool _2188 = _2150;
    if (!_1906)
    {
        _2184 = _223;
    }
    float _2190 = _2184;
    float _2192 = as_type<float>(_1147) * _2178;
    float _2194 = _2190;
    if (_2150)
    {
        int _2196 = ~_2148;
        int _2198 = _2196 + 1;
        _2186 = _2198;
    }
    int _2200 = _2186;
    if (_1906)
    {
        bool _2202 = _2068 > 0.5;
        _2188 = _2202;
    }
    bool _2204 = _2188;
    float _2206 = trunc(_2192);
    float _2208 = precise::max(_2206, 0.0);
    uint _2210 = uint(_2208);
    bool _2212 = !_1596;
    int _2214 = _2212 ? _2182 : (-1);
    int _2216 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2218 = _2216 != 0;
    if (_1906)
    {
        float _2220 = -_223;
        float _2222 = _2204 ? _2220 : _223;
        _2194 = _2222;
    }
    float _2224 = _2194;
    int _2226 = _2214 & 3;
    bool _2228 = _2226 != 0;
    bool _2230 = !_2218;
    float _2232 = _2230 ? _223 : as_type<float>(_2116);
    int _2234 = int(_2030) + int(_2164);
    int _2236 = ~_1145;
    int _2238 = _2236 + 1;
    int _2240 = _2214 & 3;
    bool _2242 = _2240 != 0;
    bool _2244 = uint(_2226) > 1u;
    int _2246 = _2238 * _2234;
    int _2248 = _2246 + _1982;
    int _2250 = int(_1998) + int(_2128);
    int _2252 = ~_1069;
    int _2254 = _2252 + 1;
    int _2256 = _2242 ? 0 : 1;
    int _2258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2260 = _2258 != 0;
    int _2262 = _2254 * _2250;
    int _2264 = _2262 + _1514;
    float _2266 = float(uint(_1892));
    bool _2268 = !_2260;
    int _2270 = _2268 ? 0 : 1;
    bool _2272 = uint(_2248) >= uint(_1145);
    float _2274 = as_type<float>(_1300) * _2266;
    int _2276 = ~_2256;
    int _2278 = _2276 + 1;
    int _2280 = _2278 + 1;
    int _2282 = _2280;
    if (!_2244)
    {
        int _2284 = ~_2256;
        int _2286 = _2284 + 1;
        _2282 = _2286;
    }
    int _2288 = _2282;
    float _2290 = trunc(_2274);
    float _2292 = precise::max(_2290, 0.0);
    uint _2294 = uint(_2292);
    bool _2296 = uint(_2264) >= uint(_1069);
    bool _2298 = !_2272;
    int _2300 = _2298 ? 0 : (-1);
    bool _2302 = _2226 != 3;
    bool _2304 = !_2296;
    int _2306 = _2304 ? 0 : (-1);
    bool _2308 = uint(_2226) >= 2u;
    int _2310 = ~_2234;
    int _2312 = _2310 + _2300;
    int _2314 = _2312 + 1;
    int _2316 = ~_1097;
    int _2318 = _2316 + 1;
    int _2320 = int(_2094) + int(_2210);
    int _2322 = _1145 * _2314;
    int _2324 = _2322 + _1982;
    int _2326 = _2308 ? 0 : 1;
    int _2328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2330 = _2328 != 0;
    int _2332 = _2318 * _2320;
    int _2334 = _2332 + _1600;
    int _2336 = ~_1145;
    int _2338 = _2336 + 1;
    int _2340 = ~_2326;
    int _2342 = _2340 + 1;
    int _2344 = _2342 + 1;
    int _2346 = _2344;
    if (_2302)
    {
        int _2348 = ~_2326;
        int _2350 = _2348 + 1;
        _2346 = _2350;
    }
    int _2352 = _2346;
    int _2354 = _2338 * int(_2294);
    int _2356 = _2354 + _1892;
    int _2358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2360 = _2358 != 0;
    bool _2362 = !_2330;
    int _2364 = _2362 ? 0 : 1;
    bool _2366 = uint(_2334) >= uint(_1097);
    bool _2368 = !_1830;
    int _2370 = _2368 ? _2324 : (-1);
    bool _2372 = !_2360;
    int _2374 = _2372 ? 0 : 1;
    bool _2376 = !_2366;
    int _2378 = _2376 ? 0 : (-1);
    int _2380 = _2370 & 3;
    bool _2382 = _2380 != 0;
    int _2384 = _2370 & 3;
    bool _2386 = _2384 != 0;
    float _2388 = float(uint(_2356));
    int _2390 = _2382 ? 0 : 1;
    bool _2392 = uint(_2384) > 1u;
    float _2394 = as_type<float>(_1300) * _2388;
    int _2396 = ~_2390;
    int _2398 = _2396 + 1;
    int _2400 = _2398 + 1;
    int _2402 = ~_1145;
    int _2404 = _2402 + 1;
    float _2406 = trunc(_2394);
    float _2408 = precise::max(_2406, 0.0);
    uint _2410 = uint(_2408);
    float _2412 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    int _2414 = _2400;
    float _2416 = as_type<float>(_2404);
    float _2418 = as_type<float>(_2294);
    if (!_2392)
    {
        int _2420 = ~_2390;
        int _2422 = _2420 + 1;
        _2414 = _2422;
    }
    int _2424 = _2414;
    float _2426 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _2428 = uint(_2384) >= 2u;
    float _2430 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2432 = _2428 ? 0 : 1;
    bool _2434 = _2384 != 3;
    float _2436 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2438 = int(_2294) + int(_2410);
    int _2440 = ~_2432;
    int _2442 = _2440 + 1;
    int _2444 = _2442 + 1;
    int _2446 = _2404 * _2438;
    int _2448 = _2446 + _1892;
    float _2450 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2452 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2454 = _2444;
    if (_2434)
    {
        int _2456 = ~_2432;
        int _2458 = _2456 + 1;
        _2454 = _2458;
    }
    int _2460 = _2454;
    float _2462 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2464 = _2462 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2466 = uint(_2448) >= uint(_1145);
    float _2468 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2470 = _2468 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2472 = !_2466;
    int _2474 = _2472 ? 0 : (-1);
    float _2476 = 1.0 / _2464;
    bool _2478 = _1236 > 0.5;
    float _2480 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2482 = _2480 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    int _2484 = ~_2320;
    int _2486 = _2484 + _2378;
    int _2488 = _2486 + 1;
    float _2490 = -_239;
    int _2492 = _2478 ? as_type<int>(_2490) : as_type<int>(_239);
    bool _2494 = _1240 != 1;
    float _2496 = 1.0 / _2470;
    float _2498 = in.m_48.x;
    float _2500 = in.m_48.y;
    float _2502 = in.m_48.z;
    int _2504 = _1097 * _2488;
    int _2506 = _2504 + _1600;
    bool _2508 = _1051 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2510 = isnan(_1051);
    bool _2512 = _2508 || _2510;
    bool _2514 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2516 = _2512 || _2514;
    float _2518 = float(_2516);
    bool _2520 = !_2078;
    int _2522 = _2520 ? 0 : 1;
    float _2524 = 1.0 / _2482;
    float _2526 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2528 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2526;
    float _2530 = -_2518;
    float _2532 = _2530 + 1.0;
    bool _2534 = _1051 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2536 = isnan(_1051);
    bool _2538 = _2534 || _2536;
    bool _2540 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2542 = _2538 || _2540;
    float _2544 = float(_2542);
    float _2546 = 0.0;
    if (!_2494)
    {
        _2546 = _1238;
    }
    float _2548 = _2546;
    float _2550 = 0.0;
    float _2552 = _2548;
    if (!_2494)
    {
        _2550 = _1238;
    }
    float _2554 = _2550;
    float _2556 = _2554;
    if (!_2494)
    {
        _2416 = _1252;
    }
    float _2558 = _2416;
    float _2560 = 0.0;
    float _2562 = _2558;
    if (!_2494)
    {
        _2560 = _1252;
    }
    float _2564 = _2560;
    float _2566 = _2564;
    if (_2494)
    {
        _2552 = _1236;
    }
    float _2568 = _2552;
    if (_2494)
    {
        _2556 = _1236;
    }
    float _2570 = _2556;
    if (_2494)
    {
        _2562 = _1238;
    }
    float _2572 = _2562;
    float _2574 = _201 * _2500;
    if (_2494)
    {
        _2566 = _1238;
    }
    float _2576 = _2566;
    float _2578 = _207 * _2500;
    bool _2580 = _1242 != 2;
    float _2582 = fma(_199, _2498, _2574);
    float _2584 = _1236 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2586 = fma(_205, _2498, _2578);
    float _2588 = fma(_203, _2502, _2582);
    float _2590 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2592 = fma(_209, _2502, _2586);
    float _2594 = _2568 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2596 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2598 = log2(_2596);
    float _2600 = -_2590;
    float _2602 = fma(_2584, 2.0, _2600);
    float _2604 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2606 = 0.0;
    if (_2580)
    {
        _2606 = _1236;
    }
    float _2608 = _2606;
    float _2610 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2612 = _2608;
    if (_2580)
    {
        _2418 = _1238;
    }
    float _2614 = _2418;
    float _2616 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2618 = _2614;
    if (!_2580)
    {
        _2612 = _1252;
    }
    float _2620 = _2612;
    float _2622 = fma(_2610, -2.0, _2426);
    if (!_2580)
    {
        _2618 = _1236;
    }
    float _2624 = _2618;
    float _2626 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2616);
    int _2628 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2630 = _2628 != 0;
    float _2632 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2634 = -_2430;
    float _2636 = fma(_2594, 2.0, _2634);
    float _2638 = -_2604;
    float _2640 = fma(_2632, 2.0, _2638);
    float _2642 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    bool _2644 = !_2630;
    float _2646 = _2644 ? _239 : as_type<float>(_2492);
    float _2648 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2650 = _2648 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2652 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2654 = isnan(0.0);
    bool _2656 = _2652 || _2654;
    bool _2658 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2660 = _2656 || _2658;
    float _2662 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2642);
    float _2664 = _1246 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2666 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2668 = _2624 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2670 = fma(_2664, -2.0, _2412);
    float _2672 = _2500 + _1276;
    float _2674 = fma(_2668, -2.0, _2452);
    float _2676 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2678 = -_133;
    float _2680 = fma(_2678, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2602);
    float _2682 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2684 = _1238 * 2.0;
    float _2686 = fma(_2570, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2676);
    float _2688 = fma(_2576, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2666);
    float _2690 = _2598 * _133;
    float _2692 = 1.0 / _2650;
    float _2694 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2682);
    float _2696 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2698 = _2696 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2700 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2626);
    float _2702 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2704 = _2702 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2706 = _2620 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2708 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2622);
    float _2710 = exp2(_2690);
    float _2712 = _2572 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2714 = -_2450;
    float _2716 = fma(_2706, 2.0, _2714);
    float _2718 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2720 = fma(_2712, -2.0, _2436);
    float _2722 = -_133;
    float _2724 = fma(_2722, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2640);
    float _2726 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2728 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2718);
    float _2730 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2694);
    float _2732 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2734 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2726);
    float _2736 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2728);
    float _2738 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2670);
    float _2740 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2732);
    float _2742 = -_2710;
    float _2744 = _2742 + 1.0;
    float _2746 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2662);
    float _2748 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2734);
    float _2750 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2740);
    float _2752 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2686);
    float _2754 = _2660 ? _2744 : 0.0;
    float _2756 = _1236 * 2.0;
    bool _2758 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2760 = isnan(1.0);
    bool _2762 = _2758 || _2760;
    bool _2764 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2766 = _2762 || _2764;
    float _2768 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2770 = 1.0 + _2768;
    float _2772 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2688);
    float _2774 = floor(_2756);
    float _2776 = -_133;
    float _2778 = fma(_2776, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2636);
    float _2780 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2720);
    float _2782 = -_133;
    float _2784 = fma(_2782, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2716);
    float _2786 = fma(_2074, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2724);
    float _2788 = -_2700;
    float _2790 = _2788 + 1.0;
    float _2792 = 1.0 / _2770;
    float _2794 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2674);
    float _2796 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2798 = _1051 + _2796;
    bool _2800 = _1051 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2802 = isnan(_1051);
    bool _2804 = _2800 || _2802;
    bool _2806 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2808 = _2804 || _2806;
    float _2810 = float(_2808);
    float _2812 = -_2790;
    float _2814 = fma(_2812, _2054, _2786);
    bool _2816 = _1051 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2818 = isnan(_1051);
    bool _2820 = _2816 || _2818;
    bool _2822 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2824 = _2820 || _2822;
    float _2826 = float(_2824);
    float _2828 = -_2746;
    float _2830 = _2828 + 1.0;
    float _2832 = 1.0 / _2698;
    float _2834 = _2646 + 0.5;
    int _2836 = abs(_2352);
    float _2838 = -_2772;
    float _2840 = _2838 + 1.0;
    float _2842 = -_2752;
    float _2844 = _2842 + 1.0;
    int _2846 = ~_2250;
    int _2848 = _2846 + _2306;
    int _2850 = _2848 + 1;
    float _2852 = -_2750;
    float _2854 = _2852 + 1.0;
    int _2856 = ~_2438;
    int _2858 = _2856 + _2474;
    int _2860 = _2858 + 1;
    if (_2766)
    {
        float _2862 = _2754 * _2792;
        _143 = _2862;
    }
    float _2864 = _143;
    bool _2866 = _2774 >= 0.0;
    bool _2868 = isnan(_2774);
    bool _2870 = _2866 || _2868;
    bool _2872 = isnan(0.0);
    bool _2874 = _2870 || _2872;
    float _2876 = floor(_2684);
    float _2878 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2880 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2878;
    int _2882 = _1069 * _2850;
    int _2884 = _2882 + _1514;
    int _2886 = _2874 ? 0 : 1;
    int _2888 = _1145 * _2860;
    int _2890 = _2888 + _1892;
    bool _2892 = _2774 > 0.0;
    float _2894 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2896 = _2894 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2898 = _2880 * _2832;
    float _2900 = 1.0 / _2704;
    int _2902 = ~_2886;
    int _2904 = _2902 + 1;
    int _2906 = _2904 + 1;
    float _2908 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2910 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2908;
    float _2912 = _2896 * _2692;
    int _2914 = abs(_2374);
    float _2916 = -_2748;
    float _2918 = _2916 + 1.0;
    float _2920 = -_2736;
    float _2922 = _2920 + 1.0;
    float _2924 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2926 = _2906;
    if (!_2892)
    {
        int _2928 = ~_2886;
        int _2930 = _2928 + 1;
        _2926 = _2930;
    }
    int _2932 = _2926;
    float _2934 = _1252 * 2.0;
    bool _2936 = _2876 >= 0.0;
    bool _2938 = isnan(_2876);
    bool _2940 = _2936 || _2938;
    bool _2942 = isnan(0.0);
    bool _2944 = _2940 || _2942;
    float _2946 = _2910 * _2900;
    float _2948 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2950 = _2948 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    int _2952 = _2944 ? 0 : 1;
    float _2954 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2956 = _2954 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    bool _2958 = _2876 > 0.0;
    float _2960 = 1.0 / _2950;
    bool _2962 = _1051 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2964 = isnan(_1051);
    bool _2966 = _2962 || _2964;
    bool _2968 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2970 = _2966 || _2968;
    float _2972 = float(_2970);
    float _2974 = _2956 * _2476;
    float _2976 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2978 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2976;
    float _2980 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2982 = _2980 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2984 = _2924 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2986 = -_2972;
    float _2988 = _2986 + 1.0;
    float _2990 = _2978 * _2524;
    float _2992 = _2982 * _2496;
    bool _2994 = _1051 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2996 = isnan(_1051);
    bool _2998 = _2994 || _2996;
    bool _3000 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3002 = _2998 || _3000;
    float _3004 = float(_3002);
    float _3006 = floor(_2934);
    int _3008 = ~_2952;
    int _3010 = _3008 + 1;
    int _3012 = _3010 + 1;
    float _3014 = fma(_2974, _2798, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    int _3016 = _3012;
    if (!_2958)
    {
        int _3018 = ~_2952;
        int _3020 = _3018 + 1;
        _3016 = _3020;
    }
    int _3022 = _3016;
    float _3024 = -_3004;
    float _3026 = _3024 + 1.0;
    bool _3028 = !_1596;
    int _3030 = _3028 ? _2506 : (-1);
    float _3032 = _2528 * _2960;
    int _3034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3036 = _3034 != 0;
    int _3038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3040 = _3038 != 0;
    int _3042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3044 = _3042 != 0;
    float _3046 = _2972 * _3026;
    bool _3048 = _1051 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3050 = isnan(_1051);
    bool _3052 = _3048 || _3050;
    bool _3054 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3056 = _3052 || _3054;
    float _3058 = float(_3056);
    float _3060 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3062 = _1051 + _3060;
    bool _3064 = !_3036;
    int _3066 = _3064 ? 0 : 1;
    float _3068 = -_3058;
    float _3070 = _3068 + 1.0;
    float _3072 = _3058 * _2988;
    bool _3074 = _3006 >= 0.0;
    bool _3076 = isnan(_3006);
    bool _3078 = _3074 || _3076;
    bool _3080 = isnan(0.0);
    bool _3082 = _3078 || _3080;
    float _3084 = fma(_2898, _3062, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3086 = _2518 * _3070;
    bool _3088 = _1051 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3090 = isnan(_1051);
    bool _3092 = _3088 || _3090;
    bool _3094 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3096 = _3092 || _3094;
    float _3098 = float(_3096);
    float _3100 = in.m_64.w;
    int _3102 = _3082 ? 0 : 1;
    bool _3104 = _3006 > 0.0;
    float _3106 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3108 = _1051 + _3106;
    float _3110 = _3098 * _2532;
    float _3112 = -_3098;
    float _3114 = _3112 + 1.0;
    float _3116 = in.m_66.w;
    float _3118 = fma(_2912, _3108, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3120 = -_2544;
    float _3122 = _3120 + 1.0;
    float _3124 = _2544 * _3114;
    float _3126 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3128 = _1051 + _3126;
    float _3130 = -_2810;
    float _3132 = _3130 + 1.0;
    float _3134 = _2810 * _3122;
    float _3136 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3138 = _1051 + _3136;
    float _3140 = fma(_2946, _3128, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3142 = _2826 * _3132;
    float _3144 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3146 = _1051 + _3144;
    float _3148 = -_2826;
    float _3150 = _3148 + 1.0;
    float _3152 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3154 = _1051 + _3152;
    float _3156 = _3084 * _3142;
    float _3158 = fma(_3032, _3146, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3160 = fma(_2990, _3138, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3162 = fma(_2992, _3154, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3164 = _2588 + _3100;
    int _3166 = _2214 >> 31;
    float _3168 = fma(_3150, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3156);
    bool _3170 = !_2228;
    int _3172 = _3170 ? 0 : 1;
    int _3174 = _3166 & 3;
    float _3176 = fma(_3118, _3134, _3168);
    float _3178 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3180 = _2672 + _3178;
    float _3182 = _2592 + _3116;
    int _3184 = _2214 + _3174;
    float _3186 = fma(_3140, _3124, _3176);
    float _3188 = _3180 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3190 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3192 = _3164 + _3190;
    int _3194 = _3184 >> 2;
    float _3196 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3198 = _3182 + _3196;
    float _3200 = _1238 + _1236;
    float _3202 = fma(_3192, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3188);
    int _3204 = _3194 << 4;
    int _3206 = _3204 + 656;
    float _3208 = _1236 + _1252;
    float _3210 = _1236 + (-0.5);
    float _3212 = fma(_3198, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3202);
    bool _3214 = _2226 != 3;
    uint _3216 = uint(int(uint(_3206) >> uint(2)));
    uint _3218 = uint(int(uint(int(_3216)) >> uint(2)));
    int _3220 = int(_3216) & 3;
    float _3222 = (*spvDescriptorSet0.vp_c9)._m0[int(_3218)][_3220];
    int _3224 = int(_3216) + 1;
    uint _3226 = uint(int(uint(_3224) >> uint(2)));
    int _3228 = _3224 & 3;
    float _3230 = (*spvDescriptorSet0.vp_c9)._m0[int(_3226)][_3228];
    int _3232 = ~_3102;
    int _3234 = _3232 + 1;
    int _3236 = _3234 + 1;
    float _3238 = _1238 + _1252;
    bool _3240 = !_3214;
    int _3242 = _3240 ? 0 : (-1);
    bool _3244 = _3212 >= 0.0;
    float _3246 = fma(_3014, _3110, _3186);
    float _3248 = _3200 + (-1.0);
    int _3250 = _3236;
    float _3252 = _3072;
    float _3254 = _3164;
    if (!_3104)
    {
        int _3256 = ~_3102;
        int _3258 = _3256 + 1;
        _3250 = _3258;
    }
    int _3260 = _3250;
    int _3262 = _3206 + 8;
    uint _3264 = uint(int(uint(_3262) >> uint(2)));
    uint _3266 = uint(int(uint(int(_3264)) >> uint(2)));
    int _3268 = int(_3264) & 3;
    float _3270 = (*spvDescriptorSet0.vp_c9)._m0[int(_3266)][_3268];
    int _3272 = int(_3264) + 1;
    uint _3274 = uint(int(uint(_3272) >> uint(2)));
    int _3276 = _3272 & 3;
    float _3278 = (*spvDescriptorSet0.vp_c9)._m0[int(_3274)][_3276];
    float _3280 = fma(_3160, _3086, _3246);
    float _3282 = _1238 + (-0.5);
    float _3284 = _2224 + (-0.5);
    float _3286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3288 = fma(_3162, _3072, _3280);
    int _3290 = abs(_3172);
    float _3292 = -_3284;
    float _3294 = -_2738;
    float _3296 = fma(_3292, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3294);
    int _3298 = abs(_3242);
    if (_3244)
    {
        _3252 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3300 = _3252;
    float _3302 = fma(_2830, _2224, _3296);
    float _3304 = fma(_2834, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2680);
    float _3306 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3308 = int(_3306);
    int _3310 = abs(_3066);
    if (_3244)
    {
        float _3312 = _3300 * 5.0;
        _2062 = as_type<int>(_3312);
    }
    int _3314 = _2062;
    float _3316 = _2232 + (-0.5);
    out.m_80.x = _2814;
    out.m_80.y = _3302;
    bool _3318 = _1069 == 0;
    float _3320 = -_3316;
    float _3322 = -_2708;
    float _3324 = fma(_3320, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3322);
    int _3326 = abs(_2288);
    float _3328 = fma(_3158, _3046, _3288);
    float _3330 = _3180 * _3180;
    if (_3244)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10278 = as_type<float>(_3314);
        out.gl_Position.z = _10278;
    }
    float _3332 = _3286 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3334 = _2012 + 0.5;
    float _3336 = fma(_3004, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3328);
    bool _3338 = !_3318;
    int _3340 = _3338 ? _2884 : (-1);
    if (_3244)
    {
        out.m_55.x = 0.0;
    }
    float _3342 = fma(_3332, _3334, _2778);
    int _3344 = ~_3308;
    int _3346 = _3344 + 1;
    int _3348 = ~_3308;
    int _3350 = _3348 + 1;
    out.m_82.x = _3336;
    float _3352 = fma(_3192, _3192, _3330);
    float _3354 = fma(_3198, _3198, _3352);
    int _3356 = ~_3326;
    int _3358 = _3356 + 1;
    int _3360 = _3358 + 1;
    float _3362 = fma(_3248, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _3364 = ~_3290;
    int _3366 = _3364 + 1;
    int _3368 = _3366 + 1;
    int _3370 = _3360 * as_type<int>(_3230);
    int _3372 = abs(_2364);
    float _3374 = rsqrt(_3354);
    int _3376 = ~_2836;
    int _3378 = _3376 + 1;
    int _3380 = _3378 + 1;
    int _3382 = _3368 * as_type<int>(_3222);
    int _3384 = _3382 + _3370;
    float _3386 = float(uint(_3308));
    float _3388 = _535 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _3390 = _3380 * as_type<int>(_3270);
    int _3392 = _3390 + _3384;
    int _3394 = abs(_3308);
    float _3396 = _3388 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3398 = ~_3298;
    int _3400 = _3398 + 1;
    int _3402 = _3400 + 1;
    float _3404 = 1.0 / _3386;
    int _3406 = ~_3372;
    int _3408 = _3406 + 1;
    int _3410 = _3408 + 1;
    float _3412 = _1752 + (-0.5);
    float _3414 = float(uint(_3394));
    int _3416 = _3402 * as_type<int>(_3278);
    int _3418 = _3416 + _3392;
    float _3420 = _3396 * _3374;
    float _3422 = -_2984;
    float _3424 = -_2780;
    float _3426 = fma(_3422, _3412, _3424);
    int _3428 = _3418 * _3410;
    float _3430 = 1.0 / _3414;
    int _3432 = _2370 >> 31;
    float _3434 = _3180 * _3420;
    int _3436 = _3030 * _3372;
    int _3438 = _3436 + _3428;
    int _3440 = _2034 >> 31;
    float _3442 = _3192 * _3420;
    float _3444 = -_3434;
    float _3446 = _3180 + _3444;
    int _3448 = as_type<int>(_3404) + (-2);
    float _3450 = fma(_1752, _2840, _3426);
    float _3452 = float(uint(_3438));
    float _3454 = _3446 * _3446;
    int _3456 = _3440 & 3;
    float _3458 = -_3442;
    float _3460 = _3192 + _3458;
    int _3462 = ~_3394;
    int _3464 = _3462 + 1;
    float _3466 = as_type<float>(_3448) * _3452;
    int _3468 = _3432 & 3;
    float _3470 = fma(_3460, _3460, _3454);
    int _3472 = _2034 + _3456;
    int _3474 = _2370 + _3468;
    float _3476 = trunc(_3466);
    float _3478 = precise::max(_3476, 0.0);
    uint _3480 = uint(_3478);
    float _3482 = float(_3260);
    float _3484 = in.m_84.x;
    float _3486 = in.m_84.y;
    float _3488 = in.m_84.z;
    int _3490 = abs(_3438);
    int _3492 = _3474 >> 2;
    int _3494 = _3472 >> 2;
    int _3496 = as_type<int>(_3430) + (-2);
    float _3498 = float(uint(_3490));
    float _3500 = float(_3310);
    int _3502 = _3346 * int(_3480);
    int _3504 = _3502 + _3438;
    int _3506 = _3494 << 4;
    int _3508 = _3506 + 368;
    float _3510 = as_type<float>(_3496) * _3498;
    int _3512 = _3492 << 4;
    int _3514 = _3512 + 800;
    float _3516 = float(uint(_3504));
    uint _3518 = uint(int(uint(_3508) >> uint(2)));
    uint _3520 = uint(int(uint(int(_3518)) >> uint(2)));
    int _3522 = int(_3518) & 3;
    float _3524 = (*spvDescriptorSet0.vp_c9)._m0[int(_3520)][_3522];
    int _3526 = int(_3518) + 1;
    uint _3528 = uint(int(uint(_3526) >> uint(2)));
    int _3530 = _3526 & 3;
    float _3532 = (*spvDescriptorSet0.vp_c9)._m0[int(_3528)][_3530];
    float _3534 = _3500 * _3482;
    float _3536 = -_2730;
    float _3538 = _3536 + 1.0;
    float _3540 = _3198 * _3420;
    float _3542 = trunc(_3510);
    float _3544 = precise::max(_3542, 0.0);
    uint _3546 = uint(_3544);
    float _3548 = as_type<float>(_3448) * _3516;
    float _3550 = fma(_2232, _3538, _3324);
    float _3552 = -_2844;
    float _3554 = fma(_2012, _3552, _3342);
    uint _3556 = uint(int(uint(_3514) >> uint(2)));
    uint _3558 = uint(int(uint(int(_3556)) >> uint(2)));
    int _3560 = int(_3556) & 3;
    float _3562 = (*spvDescriptorSet0.vp_c9)._m0[int(_3558)][_3560];
    int _3564 = int(_3556) + 1;
    uint _3566 = uint(int(uint(_3564) >> uint(2)));
    int _3568 = _3564 & 3;
    float _3570 = (*spvDescriptorSet0.vp_c9)._m0[int(_3566)][_3568];
    float _3572 = -_3540;
    float _3574 = _3198 + _3572;
    float _3576 = _3534 * (-2.0);
    float _3578 = -_2854;
    float _3580 = fma(_2646, _3578, _3304);
    float _3582 = trunc(_3548);
    float _3584 = precise::max(_3582, 0.0);
    uint _3586 = uint(_3584);
    float _3588 = fma(_3574, _3574, _3470);
    float _3590 = fma(_3576, _3484, _3484);
    float _3592 = fma(_3362, _3576, _3362);
    int _3594 = _3508 + 8;
    uint _3596 = uint(int(uint(_3594) >> uint(2)));
    uint _3598 = uint(int(uint(int(_3596)) >> uint(2)));
    int _3600 = int(_3596) & 3;
    float _3602 = (*spvDescriptorSet0.vp_c9)._m0[int(_3598)][_3600];
    int _3604 = int(_3596) + 1;
    uint _3606 = uint(int(uint(_3604) >> uint(2)));
    int _3608 = _3604 & 3;
    float _3610 = (*spvDescriptorSet0.vp_c9)._m0[int(_3606)][_3608];
    out.m_86.x = _3580;
    out.m_86.y = _3550;
    out.m_86.z = _3554;
    out.m_86.w = _3450;
    float _3612 = fma(_3210, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3590);
    int _3614 = abs(_2136);
    int _3616 = _3464 * int(_3546);
    int _3618 = _3616 + _3490;
    float _3620 = fma(_3592, _2864, _3612);
    int _3622 = ~_3614;
    int _3624 = _3622 + 1;
    int _3626 = _3624 + 1;
    float _3628 = float(uint(_3618));
    int _3630 = _3514 + 8;
    uint _3632 = uint(int(uint(_3630) >> uint(2)));
    uint _3634 = uint(int(uint(int(_3632)) >> uint(2)));
    int _3636 = int(_3632) & 3;
    float _3638 = (*spvDescriptorSet0.vp_c9)._m0[int(_3634)][_3636];
    int _3640 = int(_3632) + 1;
    uint _3642 = uint(int(uint(_3640) >> uint(2)));
    int _3644 = _3640 & 3;
    float _3646 = (*spvDescriptorSet0.vp_c9)._m0[int(_3642)][_3644];
    int _3648 = int(_3480) + int(_3586);
    float _3650 = as_type<float>(_3496) * _3628;
    int _3652 = abs(_2424);
    bool _3654 = !_2386;
    int _3656 = _3654 ? 0 : 1;
    int _3658 = _3350 * _3648;
    int _3660 = _3658 + _3438;
    int _3662 = ~_3652;
    int _3664 = _3662 + 1;
    int _3666 = _3664 + 1;
    float _3668 = trunc(_3650);
    float _3670 = precise::max(_3668, 0.0);
    uint _3672 = uint(_3670);
    bool _3674 = _2076 != 3;
    int _3676 = abs(_2522);
    int _3678 = abs(_3656);
    int _3680 = ~_3676;
    int _3682 = _3680 + 1;
    int _3684 = _3682 + 1;
    int _3686 = ~_3678;
    int _3688 = _3686 + 1;
    int _3690 = _3688 + 1;
    int _3692 = _3626 * as_type<int>(_3532);
    bool _3694 = !_3674;
    int _3696 = _3694 ? 0 : (-1);
    bool _3698 = uint(_3660) >= uint(_3308);
    int _3700 = _3684 * as_type<int>(_3524);
    int _3702 = _3700 + _3692;
    int _3704 = int(_3546) + int(_3672);
    float _3706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3708 = !_3698;
    int _3710 = _3708 ? 0 : (-1);
    int _3712 = _3666 * as_type<int>(_3570);
    int _3714 = ~_3394;
    int _3716 = _3714 + 1;
    bool _3718 = _2384 != 3;
    int _3720 = _3690 * as_type<int>(_3562);
    int _3722 = _3720 + _3712;
    int _3724 = ~_3648;
    int _3726 = _3724 + _3710;
    int _3728 = _3726 + 1;
    int _3730 = _3716 * _3704;
    int _3732 = _3730 + _3490;
    int _3734 = abs(_2200);
    float _3736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3738 = !_3718;
    int _3740 = _3738 ? 0 : (-1);
    int _3742 = _3308 * _3728;
    int _3744 = _3742 + _3438;
    bool _3746 = uint(_3732) >= uint(_3394);
    int _3748 = ~_3734;
    int _3750 = _3748 + 1;
    int _3752 = _3750 + 1;
    bool _3754 = !_3746;
    int _3756 = _3754 ? 0 : (-1);
    bool _3758 = _3308 == 0;
    int _3760 = _3752 * as_type<int>(_3602);
    int _3762 = _3760 + _3702;
    int _3764 = abs(_2460);
    bool _3766 = !_3758;
    int _3768 = _3766 ? _3744 : (-1);
    bool _3770 = _3308 == 0;
    int _3772 = _3438 ^ _3308;
    int _3774 = abs(_3696);
    uint _3776 = uint(int(uint(_3772) >> uint(31)));
    int _3778 = ~_3764;
    int _3780 = _3778 + 1;
    int _3782 = _3780 + 1;
    int _3784 = abs(_3740);
    int _3786 = ~_3756;
    int _3788 = _3704 + _3786;
    int _3790 = _3788 + 1;
    int _3792 = _3782 * as_type<int>(_3638);
    int _3794 = _3792 + _3722;
    int _3796 = ~_3774;
    int _3798 = _3796 + 1;
    int _3800 = _3798 + 1;
    int _3802 = ~int(_3776);
    int _3804 = _3802 + 1;
    int _3806 = ~_3784;
    int _3808 = _3806 + 1;
    int _3810 = _3808 + 1;
    int _3812 = _3800 * as_type<int>(_3610);
    int _3814 = _3812 + _3762;
    int _3816 = _3790 ^ _3804;
    int _3818 = abs(_2270);
    int _3820 = _3810 * as_type<int>(_3646);
    int _3822 = _3820 + _3794;
    int _3824 = ~_2914;
    int _3826 = _3824 + 1;
    int _3828 = _3826 + 1;
    int _3830 = ~_3804;
    int _3832 = _3830 + _3816;
    int _3834 = _3832 + 1;
    int _3836 = ~_3818;
    int _3838 = _3836 + 1;
    int _3840 = _3838 + 1;
    int _3842 = _3822 * _3828;
    bool _3844 = !_3770;
    int _3846 = _3844 ? _3834 : (-1);
    float _3848 = float(_3768);
    int _3850 = _3814 * _3840;
    float _3852 = float(_3846);
    float _3854 = _3736 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3856 = _3706 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3858 = _3340 * _3818;
    int _3860 = _3858 + _3850;
    bool _3862 = !_1830;
    int _3864 = _3862 ? _2890 : (-1);
    float _3866 = -_2794;
    float _3868 = fma(_3854, _3852, _3866);
    bool _3870 = !_3040;
    int _3872 = _3870 ? 0 : 1;
    float _3874 = fma(_3856, _3848, _2784);
    float _3876 = _1418 + 0.5;
    float _3878 = _1458 + (-0.5);
    int _3880 = abs(_3872);
    int _3882 = _3864 * _2914;
    int _3884 = _3882 + _3842;
    float _3886 = fma(_3856, _3876, _3874);
    float _3888 = -_3854;
    float _3890 = fma(_3888, _3878, _3868);
    float _3892 = -_2918;
    float _3894 = fma(_1418, _3892, _3886);
    float _3896 = float(_3860);
    float _3898 = fma(_1458, _2922, _3890);
    float _3900 = float(_3884);
    float _3902 = float(_2932);
    out.m_88.x = _3896;
    float _3904 = float(_3880);
    out.m_88.w = _3900;
    bool _3906 = !_3044;
    int _3908 = _3906 ? 0 : 1;
    float _3910 = _3904 * _3902;
    out.m_90.x = _3894;
    out.m_90.y = _3898;
    float _3912 = _3488;
    if (_3244)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3914 = -_3434;
    float _3916 = _2672 + _3914;
    float _3918 = -_3442;
    float _3920 = _3164 + _3918;
    float _3922 = -_3540;
    float _3924 = _3182 + _3922;
    float _3926 = float(_3022);
    float _3928 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3930 = _3916 + _3928;
    float _3932 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3934 = _3920 + _3932;
    float _3936 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3938 = _3924 + _3936;
    int _3940 = abs(_3908);
    float _3942 = _3930 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3944 = _3238 + (-1.0);
    float _3946 = _3910 * (-2.0);
    float _3948 = _3208 + (-1.0);
    float _3950 = fma(_3934, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3942);
    float _3952 = float(_3940);
    float _3954 = fma(_3944, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3956 = fma(_3946, _3486, _3486);
    float _3958 = fma(_3938, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3950);
    float _3960 = _3620 * 0.15915493667125701904296875;
    float _3962 = _3952 * _3926;
    float _3964 = fma(_3954, _3946, _3954);
    float _3966 = fma(_3282, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3956);
    bool _3968 = _3958 >= 0.0;
    float _3970 = _3962 * (-2.0);
    float _3972 = fma(_3964, _2864, _3966);
    float _3974 = sqrt(_3588);
    float _3976 = fma(_3970, _3488, _3488);
    float _3978 = _1252 + (-0.5);
    float _3980 = _3972 * 0.15915493667125701904296875;
    float _3982 = fma(_3948, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3984 = fma(_3978, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3976);
    float _3986 = _3960 * 6.283185482025146484375;
    float _3988 = sin(_3986);
    float _3990 = _3920;
    if (_3968)
    {
        _3912 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3992 = _3912;
    float _3994 = fma(_3982, _3970, _3982);
    int _3996 = as_type<int>(_3992);
    if (_3968)
    {
        out.m_55.x = 0.0;
    }
    if (_3968)
    {
        float _3998 = _3992 * 5.0;
        _3996 = as_type<int>(_3998);
    }
    int _4000 = _3996;
    float _4002 = fma(_3994, _2864, _3984);
    float _4004 = _3960 * 6.283185482025146484375;
    float _4006 = cos(_4004);
    if (_3968)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _11259 = as_type<float>(_4000);
        out.gl_Position.z = _11259;
    }
    float _4008 = _4002 * 0.15915493667125701904296875;
    float _4010 = _3980 * 6.283185482025146484375;
    float _4012 = sin(_4010);
    float _4014 = _3980 * 6.283185482025146484375;
    float _4016 = cos(_4014);
    if (_3968)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4018 = _4008 * 6.283185482025146484375;
    float _4020 = cos(_4018);
    float _4022 = _3374 * _3974;
    float _4024 = _515 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _4026 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _223);
    float _4028 = _4006 * _4016;
    float _4030 = _3388 * _4022;
    float _4032 = _4022 * _4024;
    float _4034 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _239);
    float _4036 = _4008 * 6.283185482025146484375;
    float _4038 = sin(_4036);
    float _4040 = _4006 * _4012;
    float _4042 = _4026 * _4032;
    float _4044 = _3988 * _4012;
    float _4046 = _3988 * _4016;
    float _4048 = _4034 * _4030;
    float _4050 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4052 = _4006 * _4020;
    float _4054 = _4016 * _4020;
    float _4056 = _3988 * _4020;
    float _4058 = _4012 * _4020;
    float _4060 = _4052 * _4042;
    float _4062 = _4022 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _4064 = _4062 * 0.5;
    float _4066 = fma(_4038, _4028, _4044);
    float _4068 = -_4042;
    float _4070 = _4038 * _4068;
    float _4072 = -_4046;
    float _4074 = fma(_4038, _4040, _4072);
    float _4076 = -_4040;
    float _4078 = fma(_4038, _4046, _4076);
    float _4080 = fma(_4066, _4048, _4060);
    float _4082 = _4056 * _4042;
    float _4084 = fma(_4054, _4048, _4070);
    float _4086 = fma(_4038, _4044, _4028);
    float _4088 = fma(_4074, _4064, _4080);
    float _4090 = fma(_4078, _4048, _4082);
    float _4092 = fma(_4058, _4064, _4084);
    float _4094 = _4088 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4096 = _4088 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4098 = fma(_4086, _4064, _4090);
    float _4100 = _4088 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4102 = fma(_4092, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4094);
    float _4104 = fma(_4092, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4096);
    float _4106 = fma(_4092, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4100);
    float _4108 = fma(_4098, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4102);
    float _4110 = fma(_4098, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4104);
    float _4112 = fma(_4098, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4106);
    float _4114 = _4108 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _4116 = _4110 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _4118 = _4066 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4120 = _4112 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _4122 = _3164 + _4114;
    float _4124 = _3182 + _4116;
    float _4126 = _4066 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4128 = _4066 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4130 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4132 = _4122 + _4130;
    float _4134 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4136 = _4124 + _4134;
    float _4138 = fma(_4054, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4126);
    float _4140 = fma(_4050, _4050, 1.0);
    float _4142 = _4132 * _4132;
    float _4144 = _4136 * _4136;
    float _4146 = fma(_4054, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4118);
    float _4148 = fma(_4054, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4128);
    float _4150 = rsqrt(_4140);
    float _4152 = _4142 + _4144;
    float _4154 = _4052 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4156 = _4052 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4158 = _4052 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4160 = _2672 + _4120;
    float _4162 = -_4038;
    float _4164 = fma(_4162, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4154);
    float _4166 = -_4038;
    float _4168 = fma(_4166, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4156);
    float _4170 = sqrt(_4152);
    float _4172 = _4074 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4174 = _4074 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4176 = _4074 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4178 = -_4038;
    float _4180 = fma(_4178, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4158);
    float _4182 = fma(_4058, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4172);
    float _4184 = fma(_4058, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4174);
    float _4186 = fma(_4058, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4176);
    bool _4188 = _4170 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4190 = _4174;
    float _4192 = _4172;
    float _4194 = _4158;
    float _4196 = _4058;
    float _4198 = _4176;
    if (!_4188)
    {
        _4190 = _4144;
    }
    float _4200 = _4190;
    float _4202 = _4200;
    if (!_4188)
    {
        _4192 = _4142;
    }
    float _4204 = _4192;
    float _4206 = _4204;
    if (!_4188)
    {
        _4194 = _4122;
    }
    float _4208 = _4194;
    float _4210 = _4208;
    if (!_4188)
    {
        _4196 = _4124;
    }
    float _4212 = _4196;
    float _4214 = _4212;
    if (!_4188)
    {
        _4198 = _4160;
    }
    float _4216 = _4198;
    bool _4218 = !_4188;
    float _4220 = _4216;
    if (!_4218)
    {
        float _4222 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4224 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4226 = _4170 + _4224;
        float _4228 = rsqrt(_4152);
        float _4230 = _4226 * _4222;
        float _4232 = _4160 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4234 = _4230 * 0.15915493667125701904296875;
        float _4236 = _4234 * 6.283185482025146484375;
        float _4238 = sin(_4236);
        float _4240 = _4234 * 6.283185482025146484375;
        float _4242 = cos(_4240);
        float _4244 = fma(_4238, _4232, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4246 = _4228 * _4244;
        float _4248 = _4242 + (-1.0);
        float _4250 = fma(_4132, _4246, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4252 = fma(_4136, _4246, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4254 = _4248 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4256 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4258 = _4250 + _4256;
        float _4260 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4262 = _4252 + _4260;
        float _4264 = fma(_4160, _4242, _4254);
        float _4266 = _4258 * _4258;
        float _4268 = _4262 * _4262;
        _4220 = _4264;
        _4206 = _4266;
        _4202 = _4268;
        _4210 = _4250;
        _4214 = _4252;
    }
    float _4270 = _4220;
    float _4272 = _4206;
    float _4274 = _4202;
    float _4276 = _4210;
    float _4278 = _4214;
    float _4280 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4282 = _4270 + _4280;
    float _4284 = fma(_4056, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4164);
    float _4286 = fma(_4056, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4168);
    float _4288 = fma(_4056, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4180);
    float _4290 = fma(_4282, _4282, _4272);
    float _4292 = fma(_4086, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4182);
    float _4294 = fma(_4086, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4184);
    float _4296 = fma(_4086, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4186);
    float _4298 = _4290 + _4274;
    float _4300 = _4050 * _4150;
    float _4302 = fma(_4078, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4138);
    float _4304 = _239 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4306 = _4050 * _4284;
    float _4308 = fma(_4078, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4146);
    float _4310 = _4050 * _4286;
    float _4312 = fma(_4078, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4148);
    float _4314 = _4050 * _4288;
    float _4316 = -_4292;
    float _4318 = _4300 * _4316;
    float _4320 = -_4294;
    float _4322 = _4300 * _4320;
    float _4324 = -_4296;
    float _4326 = _4300 * _4324;
    float _4328 = fma(_4304, _4302, _4306);
    float _4330 = sqrt(_4298);
    float _4332 = fma(_4304, _4308, _4310);
    float _4334 = fma(_4304, _4312, _4314);
    float _4336 = fma(_4150, _4284, _4318);
    float _4338 = fma(_4150, _4286, _4322);
    float _4340 = _4294 + _4332;
    float _4342 = fma(_4150, _4288, _4326);
    float _4344 = _4292 + _4328;
    float _4346 = _4296 + _4334;
    out.m_92.x = _4302;
    out.m_92.y = _4308;
    out.m_92.z = _4312;
    out.m_94.x = _4336;
    out.m_94.y = _4338;
    out.m_94.z = _4342;
    bool _4348 = _4330 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4350 = isnan(_4330);
    bool _4352 = _4348 || _4350;
    bool _4354 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4356 = _4352 || _4354;
    out.m_96.x = _4344;
    out.m_96.y = _4340;
    out.m_96.z = _4346;
    float _4358 = _4304;
    if (!_4356)
    {
        _4358 = 1.0;
    }
    float _4360 = _4358;
    bool _4362 = !_4356;
    float _4364 = _4360;
    if (!_4362)
    {
        bool _4366 = _4330 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4368 = isnan(_4330);
        bool _4370 = _4366 || _4368;
        bool _4372 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4374 = _4370 || _4372;
        if (!_4374)
        {
            float _4376 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4378 = _4330 + _4376;
            float _4380 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4382 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4380;
            float _4384 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4386 = _4384 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4388 = 1.0 / _4382;
            float _4390 = _4378 * _4388;
            float _4392 = fma(_4390, _4386, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4364 = _4392;
            _4394 = true;
        }
        else
        {
            bool _4396 = _4330 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4398 = isnan(_4330);
            bool _4400 = _4396 || _4398;
            bool _4402 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4404 = _4400 || _4402;
            if (!_4404)
            {
                float _4406 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4408 = _4330 + _4406;
                float _4410 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4412 = _4410 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4414 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4416 = _4414 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4418 = 1.0 / _4412;
                float _4420 = _4408 * _4418;
                float _4422 = fma(_4420, _4416, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4364 = _4422;
                _4394 = true;
            }
            else
            {
                _4364 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4394 = false;
    float _4424 = _4364;
    float _4426 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4428 = _4270 + _4426;
    float _4430 = _3916 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4432 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4434 = _4276 + _4432;
    float _4436 = fma(_4428, _4424, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4438 = fma(_3920, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4430);
    float _4440 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4442 = _4278 + _4440;
    float _4444 = fma(_4434, _4424, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4446 = -_2672;
    float _4448 = _4446 + _4436;
    float _4450 = fma(_3924, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4438);
    float _4452 = fma(_4442, _4424, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4454 = -_3164;
    float _4456 = _4454 + _4444;
    float _4458 = _4448 * _4448;
    float _4460 = _4450 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4462 = _3916 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4464 = -_3182;
    float _4466 = _4464 + _4452;
    float _4468 = fma(_4456, _4456, _4458);
    float _4470 = 1.0 / _4460;
    float _4472 = fma(_3920, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4462);
    float _4474 = fma(_4466, _4466, _4468);
    float _4476 = fma(_3924, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4472);
    float _4478 = sqrt(_4474);
    float _4480 = _4476 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4482 = _4480 + _4460;
    float _4484 = _4482 * _4470;
    float _4486 = _4484 * 0.5;
    bool _4488 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4490 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4492 = _4488 || _4490;
    bool _4494 = isnan(0.5);
    bool _4496 = _4492 || _4494;
    float _4498 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4500 = fma(_4486, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4498);
    bool _4502 = _4478 > 0.0;
    float _4504 = 1.0 / _4500;
    bool _4506 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4508 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4510 = _4506 || _4508;
    bool _4512 = isnan(0.5);
    bool _4514 = _4510 || _4512;
    float _4516 = _4450;
    float _4518 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _4520 = _4470;
    float _4522 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4524 = _4444;
    if (!_4502)
    {
        _4516 = _4444;
    }
    float _4526 = _4516;
    float _4528 = _4526;
    float _4530 = _4526;
    if (!_4502)
    {
        _4518 = _4436;
    }
    float _4532 = _4518;
    float _4534 = _4532;
    float _4536 = _4532;
    if (!_4502)
    {
        _4520 = _4452;
    }
    float _4538 = _4520;
    bool _4540 = !_4502;
    float _4542 = _4538;
    float _4544 = _4538;
    if (!_4540)
    {
        float _4546 = _235 * _235;
        float _4548 = fma(_243, _243, _4546);
        float _4550 = fma(_245, _245, _4548);
        float _4552 = rsqrt(_4474);
        float _4554 = sqrt(_4550);
        float _4556 = _4456 * _4552;
        float _4558 = _4448 * _4552;
        float _4560 = _4466 * _4552;
        bool _4562 = _4554 > 0.0;
        _4522 = _4552;
        if (!_4562)
        {
            _4528 = _4444;
        }
        float _4564 = _4528;
        _4530 = _4564;
        if (!_4562)
        {
            _4534 = _4436;
        }
        float _4566 = _4534;
        _4536 = _4566;
        if (!_4562)
        {
            _4542 = _4452;
        }
        float _4568 = _4542;
        bool _4570 = !_4562;
        _4544 = _4568;
        if (!_4570)
        {
            float _4572 = rsqrt(_4550);
            float _4574 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4576 = _235 * _4572;
            float _4578 = _243 * _4572;
            float _4580 = _4558 * _4576;
            float _4582 = _245 * _4572;
            float _4584 = fma(_4556, _4578, _4580);
            float _4586 = _4574 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4588 = fma(_4560, _4582, _4584);
            float _4590 = _4588 * _4586;
            float _4592 = fma(_243, _4590, _4444);
            float _4594 = fma(_235, _4590, _4436);
            float _4596 = fma(_245, _4590, _4452);
            _4530 = _4592;
            _4536 = _4594;
            _4544 = _4596;
            _4522 = _4578;
        }
    }
    float _4598 = _4530;
    float _4600 = _4536;
    float _4602 = _4544;
    float _4604 = _4522;
    float _4606 = -_3442;
    float _4608 = _4606 + _4598;
    float _4610 = -_3434;
    float _4612 = _4610 + _4600;
    float _4614 = -_3540;
    float _4616 = _4614 + _4602;
    float _4618 = _4604;
    float _4620 = _4612;
    float _4622 = _4608;
    float _4624 = _4616;
    if (_4496)
    {
        _4618 = 1.0;
    }
    float _4626 = _4618;
    float _4628 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4630 = _4504 * _4628;
    float _4632 = _4626;
    if (!_4514)
    {
        float _4634 = _3930 * _3930;
        float _4636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4638 = -_3182;
        float _4640 = _4638 + _4602;
        float _4642 = fma(_3934, _3934, _4634);
        float _4644 = fma(_3938, _3938, _4642);
        float _4646 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4648 = sqrt(_4644);
        float _4650 = 1.0 / _4022;
        float _4652 = _4646 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4654 = precise::min(_4648, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4656 = _4654 * _4636;
        float _4658 = _4656 * _4650;
        float _4660 = -_2672;
        float _4662 = _4660 + _4600;
        float _4664 = -_3164;
        float _4666 = _4664 + _4598;
        float _4668 = _4652 * _4658;
        float _4670 = _4640 * _4658;
        float _4672 = fma(_4662, _4668, _3916);
        float _4674 = fma(_4666, _4668, _3920);
        float _4676 = fma(_4652, _4670, _3924);
        _4620 = _4672;
        _4622 = _4674;
        _4624 = _4676;
        _249 = _4636;
    }
    float _4678 = _4620;
    float _4680 = _4622;
    float _4682 = _4624;
    float _4684 = _249;
    float _4686 = _4684;
    if (!_4496)
    {
        float _4688 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4690 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4692 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4690;
        float _4694 = _4688 * 0.15915493667125701904296875;
        float _4696 = _4694 * 6.283185482025146484375;
        float _4698 = cos(_4696);
        float _4700 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4702 = _4700 * 0.15915493667125701904296875;
        float _4704 = _4694 * 6.283185482025146484375;
        float _4706 = sin(_4704);
        float _4708 = 1.0 / _4698;
        float _4710 = _4702 * 6.283185482025146484375;
        float _4712 = cos(_4710);
        float _4714 = _4706 * _4708;
        float _4716 = _4702 * 6.283185482025146484375;
        float _4718 = sin(_4716);
        float _4720 = _4712 * _4714;
        float _4722 = 1.0 / _4692;
        float _4724 = 1.0 / _4720;
        float _4726 = _4718 * _4724;
        float _4728 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4730 = fma(_4630, _4726, _4728);
        float _4732 = _4730 * _4722;
        float _4734 = precise::clamp(_4732, 0.0, 1.0);
        _3254 = _4702;
        _4632 = _4734;
    }
    float _4736 = _3254;
    float _4738 = _4632;
    float _4740 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4742 = _4678 + _4740;
    float _4744 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4746 = _4680 + _4744;
    float _4748 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4750 = _4682 + _4748;
    float _4752 = _4742 * _4742;
    float _4754 = fma(_4746, _4746, _4752);
    float _4756 = fma(_3920, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4758 = fma(_4750, _4750, _4754);
    float _4760 = rsqrt(_4758);
    float _4762 = sqrt(_4758);
    float _4764 = _4760 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4766 = _4746 * _4764;
    float _4768 = _4750 * _4764;
    float _4770 = _4766 * _4766;
    float _4772 = _4768 * _4768;
    float _4774 = _4770 + _4772;
    float _4776 = sqrt(_4774);
    bool _4778 = _4776 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4780 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4782 = _4776 + _4780;
    float _4784 = _4750;
    float _4786 = _4774;
    float _4788 = _4782;
    float _4790 = _4742;
    if (_4778)
    {
        float _4792 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4784 = _4792;
    }
    float _4794 = _4784;
    if (_4778)
    {
        float _4796 = rsqrt(_4774);
        _4786 = _4796;
    }
    float _4798 = _4786;
    if (_4778)
    {
        float _4800 = _4782 * _4794;
        _4788 = _4800;
    }
    float _4802 = _4788;
    if (_4778)
    {
        float _4804 = _4802 * 0.15915493667125701904296875;
        _4686 = _4804;
    }
    float _4806 = _4686;
    float _4808 = _4736;
    if (_4778)
    {
        float _4810 = _4806 * 6.283185482025146484375;
        float _4812 = sin(_4810);
        _4808 = _4812;
    }
    float _4814 = _4808;
    float _4816 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4818 = precise::max(0.0, _4816);
    float _4820 = _4760;
    float _4822 = _4818;
    float _4824 = _4816;
    if (_4778)
    {
        float _4826 = _4806 * 6.283185482025146484375;
        float _4828 = cos(_4826);
        _4820 = _4828;
    }
    float _4830 = _4820;
    float _4832 = -_4764;
    float _4834 = -_4818;
    float _4836 = fma(_4742, _4832, _4834);
    if (!_4778)
    {
        _4790 = _4770;
    }
    float _4838 = _4790;
    float _4840 = _4838;
    if (_4778)
    {
        float _4842 = _4836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4822 = _4842;
    }
    float _4844 = _4822;
    float _4846 = _4844;
    if (!_4778)
    {
        _3990 = _4836;
    }
    float _4848 = _3990;
    float _4850 = _4814;
    float _4852 = _4848;
    if (_4778)
    {
        float _4854 = fma(_4814, _4844, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4850 = _4854;
    }
    float _4856 = _4850;
    float _4858 = _4856;
    if (!_4778)
    {
        _4846 = _4766;
    }
    float _4860 = _4846;
    float _4862 = _4860;
    float _4864 = _4830;
    if (_4778)
    {
        float _4866 = _4830 + (-1.0);
        _4824 = _4866;
    }
    float _4868 = _4824;
    float _4870 = _4868;
    if (_4778)
    {
        float _4872 = _4798 * _4856;
        _4524 = _4872;
    }
    float _4874 = _4524;
    float _4876 = _4678 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_4778)
    {
        float _4878 = _4868 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4858 = _4878;
    }
    float _4880 = _4858;
    if (_4778)
    {
        float _4882 = _4766 * _4874;
        _4862 = _4882;
    }
    float _4884 = _4862;
    if (!_4778)
    {
        _4870 = _4768;
    }
    float _4886 = _4870;
    float _4888 = _4886;
    if (_4778)
    {
        float _4890 = _4768 * _4874;
        _4888 = _4890;
    }
    float _4892 = _4888;
    if (_4778)
    {
        float _4894 = fma(_4836, _4830, _4880);
        _4852 = _4894;
    }
    float _4896 = _4852;
    if (_4778)
    {
        float _4898 = _4884 * _4884;
        _4840 = _4898;
    }
    float _4900 = _4840;
    if (!_4778)
    {
        _4864 = _4772;
    }
    float _4902 = _4864;
    float _4904 = _4902;
    if (_4778)
    {
        float _4906 = _4892 * _4892;
        _4904 = _4906;
    }
    float _4908 = _4904;
    float _4910 = fma(_4680, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4876);
    float _4912 = fma(_4896, _4896, _4900);
    float _4914 = floor(_4756);
    float _4916 = _4912 + _4908;
    float _4918 = fma(_4682, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4910);
    float _4920 = fma(_3924, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4922 = _4678 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4924 = _4918 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4926 = rsqrt(_4916);
    float _4928 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4930 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4932 = fma(_4762, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4930);
    float _4934 = precise::clamp(_4932, 0.0, 1.0);
    float _4936 = _4924 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4938 = fma(_4680, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4922);
    float _4940 = -_4934;
    float _4942 = _4940 + 1.0;
    float _4944 = -_4936;
    float _4946 = fma(_4944, _4928, 1.0);
    float _4948 = _4678 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4950 = _4678 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4952 = fma(_4682, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4938);
    float _4954 = floor(_4920);
    float _4956 = fma(_4680, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4948);
    float _4958 = fma(_4680, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4950);
    float _4960 = _4952 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4962 = fma(_4682, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4956);
    float _4964 = _4926 * _4884;
    float _4966 = _4926 * _4896;
    float _4968 = abs(_4942);
    float _4970 = log2(_4968);
    float _4972 = _4962 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4974 = _4926 * _4892;
    float _4976 = _4964 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4978 = fma(_4682, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4958);
    float _4980 = _4972 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4982 = -_4976;
    float _4984 = fma(_4966, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4982);
    float _4986 = _4978 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4988 = fma(_4960, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4980);
    float _4990 = log2(_4946);
    float _4992 = -_4974;
    float _4994 = fma(_4992, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4984);
    float _4996 = -_4914;
    float _4998 = _4756 + _4996;
    float _5000 = fma(_4924, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4988);
    float _5002 = _4972 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _5004 = fma(_4994, -0.5, 0.5);
    float _5006 = _4970 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5008 = fma(_4986, (*spvDescriptorSet0.vp_c8)._m0[7].w, _5000);
    float _5010 = _4972 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _5012 = fma(_4994, 0.5, 0.5);
    float _5014 = exp2(_5006);
    float _5016 = fma(_4960, (*spvDescriptorSet0.vp_c8)._m0[5].x, _5002);
    float _5018 = fma(_4960, (*spvDescriptorSet0.vp_c8)._m0[4].x, _5010);
    float _5020 = fma(_5012, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5022 = fma(_4924, (*spvDescriptorSet0.vp_c8)._m0[5].z, _5016);
    float _5024 = fma(_4924, (*spvDescriptorSet0.vp_c8)._m0[4].z, _5018);
    float _5026 = fma(_5012, _5020, -0.212114393711090087890625);
    float _5028 = 1.0 / _5008;
    float _5030 = fma(_4986, (*spvDescriptorSet0.vp_c8)._m0[5].w, _5022);
    float _5032 = fma(_4986, (*spvDescriptorSet0.vp_c8)._m0[4].w, _5024);
    float _5034 = -_4954;
    float _5036 = _4920 + _5034;
    float _5038 = _4966 + 1.0;
    float _5040 = fma(_5012, _5026, 1.570728778839111328125);
    float _5042 = _4990 * 0.693147182464599609375;
    float _5044 = sqrt(_5004);
    float _5046 = -_4966;
    float _5048 = fma(_5014, _5038, _5046);
    float _5050 = _5042 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _5052 = fma(_5048, 0.5, 0.5);
    float _5054 = _5032 * _5028;
    float _5056 = _5030 * _5028;
    float2 _13002 = float2(_4998, _5036);
    float _5058 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_13002, float2(0.0), isnan(_13002)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_13002, float2(0.0), isnan(_13002)), level(0.0)).x;
    float _5060 = fma(_5054, 0.5, 0.5);
    float _5062 = fma(_5056, -0.5, 0.5);
    float _5064 = _5044 * 0.636619746685028076171875;
    float3 _13020 = float3(_5060, _5062, _5050);
    float _5066 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_13020, float3(0.0), isnan(_13020)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_13020, float3(0.0), isnan(_13020)), level(0.0)).x;
    float3 _13031 = float3(_5060, _5062, _5050);
    float4 _5069 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_13031, float3(0.0), isnan(_13031)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_13031, float3(0.0), isnan(_13031)), level(0.0)).xyzw;
    float _5071 = _5069.x;
    float _5073 = _5069.y;
    float _5075 = _5069.z;
    float _5077 = _5069.w;
    float _5079 = -_5040;
    float _5081 = fma(_5064, _5079, 1.0);
    float2 _13052 = float2(_5081, _5052);
    float3 _5085 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_13052, float2(0.0), isnan(_13052)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_13052, float2(0.0), isnan(_13052)), level(0.0)).xyz;
    float _5087 = _5085.x;
    float _5089 = _5085.y;
    float _5091 = _5085.z;
    float _5093 = abs(_4630);
    float _5095 = log2(_5093);
    float _5097 = _4972 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5099 = _4970 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_98.x = _4680;
    out.m_98.y = _4678;
    out.m_98.z = _4682;
    float _5101 = fma(_4960, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5097);
    bool _5103 = _4762 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5105 = isnan(_4762);
    bool _5107 = _5103 || _5105;
    bool _5109 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5111 = _5107 || _5109;
    bool _5113 = _4630 <= 8000.0;
    bool _5115 = isnan(_4630);
    bool _5117 = _5113 || _5115;
    bool _5119 = isnan(8000.0);
    bool _5121 = _5117 || _5119;
    float _5123 = float(_5121);
    float _5125 = fma(_4924, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5101);
    float _5127 = exp2(_5099);
    float _5129 = _5032 + _5008;
    float _5131 = fma(_4986, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5125);
    float _5133 = _5095 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5135 = in.m_78.x;
    float _5137 = _5129 * 0.5;
    out.gl_Position.x = _5032;
    out.gl_Position.y = _5030;
    out.gl_Position.z = _5131;
    out.gl_Position.w = _5008;
    float _5139 = exp2(_5133);
    float _5141 = -_5127;
    float _5143 = _5141 + 1.0;
    float _5145 = _5143 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5147 = -_5145;
    float _5149 = _5147 + 1.0;
    float _5151 = fma(_5139, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5153 = precise::clamp(_5151, 0.0, 1.0);
    float _5155 = _5131 + _5008;
    float _5157 = _5131;
    float _5159 = _5008;
    float _5161 = _5030;
    float _5163 = _5149;
    if (!_5111)
    {
        _5157 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5165 = _5157;
    float _5167 = fma(_5153, -2.0, 3.0);
    float _5169 = _5153 * _5153;
    float _5171 = _5155 * 0.5;
    float _5173 = _5169 * _5167;
    float _5175 = -_5173;
    float _5177 = _5175 + 1.0;
    float _5179 = fma(_5177, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5173);
    float _5181 = _5008 * 0.5;
    float _5183 = _5123 * _5179;
    float _5185 = fma(_5030, -0.5, _5181);
    float _5187 = _5165;
    float _5189 = _5165;
    if (!_5111)
    {
        _5159 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5191 = _5159;
    float _5193 = _5183 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5195 = _5191;
    float _5197 = _5191;
    if (!_5111)
    {
        _5161 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5199 = _5161;
    out.m_100.x = _5137;
    out.m_100.y = _5185;
    out.m_100.z = _5171;
    out.m_100.w = _5008;
    float _5201 = -_5058;
    float _5203 = _5201 + 1.0;
    float _5205 = _5203 * _5193;
    float _5207 = precise::clamp(_5205, 0.0, 1.0);
    float _5209 = _5145 * _5066;
    float _5211 = -_5207;
    float _5213 = fma(_5211, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5215 = _5077 * _5209;
    float _5217 = _5213 * _5135;
    float _5219 = _5091 * _5209;
    float _5221 = fma(_5087, _5215, _5071);
    float _5223 = fma(_5089, _5215, _5073);
    float _5225 = _5217 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5227 = _5077 * _5149;
    float _5229 = fma(_5077, _5219, _5075);
    float _5231 = _4738 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5233 = _5217;
    float _5235 = _5215;
    float _5237 = _5199;
    float _5239 = _5199;
    if (!_5111)
    {
        _5233 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5241 = _5233;
    out.m_102.x = _5225;
    float _5243 = _5241;
    float _5245 = _5241;
    if (!_5111)
    {
        _5163 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5247 = _5163;
    float _5249 = _5247;
    float _5251 = _5247;
    if (!_5111)
    {
        _5235 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5253 = _5235;
    out.m_104.x = _5221;
    out.m_104.y = _5223;
    out.m_104.z = _5229;
    out.m_104.w = _5227;
    bool _5255 = !_5111;
    float _5257 = _5253;
    float _5259 = _5253;
    if (!_5255)
    {
        bool _5261 = _4762 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5263 = isnan(_4762);
        bool _5265 = _5261 || _5263;
        bool _5267 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5269 = _5265 || _5267;
        if (!_5269)
        {
            float _5271 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5273 = _4762 + _5271;
            float _5275 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5277 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5275;
            float _5279 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5281 = _5279 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5283 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5285 = _5283 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5287 = 1.0 / _5277;
            float _5289 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5291 = _5289 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5293 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5295 = _5293 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5297 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5299 = _5297 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5301 = _5273 * _5287;
            float _5303 = precise::clamp(_5301, 0.0, 1.0);
            float _5305 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5307 = _5305 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5309 = fma(_5303, _5281, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5311 = fma(_5303, _5285, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5313 = fma(_5303, _5307, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5315 = fma(_5303, _5291, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5317 = fma(_5303, _5295, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5319 = fma(_5303, _5299, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5251 = _5309;
            _5197 = _5317;
            _5239 = _5311;
            _5245 = _5315;
            _5259 = _5313;
            _5189 = _5319;
            _5321 = true;
        }
        else
        {
            bool _5323 = _4762 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5325 = isnan(_4762);
            bool _5327 = _5323 || _5325;
            bool _5329 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5331 = _5327 || _5329;
            if (!_5331)
            {
                _5243 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5333 = _5243;
            _5245 = _5333;
            if (!_5331)
            {
                _5195 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5335 = _5195;
            _5197 = _5335;
            if (!_5331)
            {
                _5187 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5337 = _5187;
            _5189 = _5337;
            if (!_5331)
            {
                _5237 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5339 = _5237;
            _5239 = _5339;
            if (!_5331)
            {
                _5249 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5341 = _5249;
            _5251 = _5341;
            if (!_5331)
            {
                _5257 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5343 = _5257;
            bool _5345 = !_5331;
            _5259 = _5343;
            if (!_5345)
            {
                bool _5347 = _4762 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5349 = isnan(_4762);
                bool _5351 = _5347 || _5349;
                bool _5353 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5355 = _5351 || _5353;
                if (!_5355)
                {
                    float _5357 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5359 = _4762 + _5357;
                    float _5361 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5363 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5361;
                    float _5365 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5367 = _5365 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5369 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5371 = _5369 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5373 = 1.0 / _5363;
                    float _5375 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5377 = _5375 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5379 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5381 = _5379 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5383 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5385 = _5383 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5387 = _5359 * _5373;
                    float _5389 = precise::clamp(_5387, 0.0, 1.0);
                    float _5391 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5393 = _5391 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5395 = fma(_5389, _5367, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5397 = fma(_5389, _5371, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5399 = fma(_5389, _5393, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5401 = fma(_5389, _5377, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5403 = fma(_5389, _5381, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5405 = fma(_5389, _5385, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5251 = _5395;
                    _5197 = _5403;
                    _5239 = _5397;
                    _5245 = _5401;
                    _5259 = _5399;
                    _5189 = _5405;
                    _5321 = true;
                }
                else
                {
                    _5251 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5197 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5239 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5245 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5259 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5189 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5321 = false;
    float _5407 = _5251;
    float _5409 = _5197;
    float _5411 = _5239;
    float _5413 = _5245;
    float _5415 = _5259;
    float _5417 = _5189;
    float _5419 = _5231 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5421 = fma(_4340, -0.5, 0.5);
    float _5423 = precise::clamp(_5421, 0.0, 1.0);
    float _5425 = -_5407;
    float _5427 = _5409 + _5425;
    float _5429 = -_5411;
    float _5431 = _5413 + _5429;
    out.m_55.x = _5419;
    float _5433 = -_5415;
    float _5435 = _5417 + _5433;
    float _5437 = fma(_5423, _5427, _5407);
    float _5439 = fma(_5423, _5431, _5411);
    bool _5441 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5443 = _5437 * 0.586610972881317138671875;
    float _5445 = fma(_5423, _5435, _5415);
    out.m_106.x = 0.0;
    bool _5447 = _4738 > 0.0;
    bool _5449 = isnan(_4738);
    bool _5451 = _5447 || _5449;
    bool _5453 = isnan(0.0);
    bool _5455 = _5451 || _5453;
    float _5457 = fma(_5439, 0.298911988735198974609375, _5443);
    float _5459 = fma(_5445, 0.114477999508380889892578125, _5457);
    float _5461 = -_5459;
    float _5463 = _5439 + _5461;
    float _5465 = -_5459;
    float _5467 = _5437 + _5465;
    float _5469 = -_5459;
    float _5471 = _5445 + _5469;
    float _5473 = fma(_5463, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5459);
    float _5475 = fma(_5467, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5459);
    float _5477 = fma(_5471, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5459);
    bool _5479 = !_5441;
    if (!_5479)
    {
        float _5481 = -_4678;
        float _5483 = _5481 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5485 = -_4680;
        float _5487 = _5485 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5489 = -_4682;
        float _5491 = _5489 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5493 = _5483 * _5483;
        float _5495 = fma(_5487, _5487, _5493);
        float _5497 = fma(_5491, _5491, _5495);
        float _5499 = sqrt(_5497);
        float _5501 = rsqrt(_5497);
        float _5503 = -_5499;
        float _5505 = _5503 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5507 = _5505 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5509 = precise::clamp(_5507, 0.0, 1.0);
        float _5511 = _5487 * _5501;
        float _5513 = _5483 * _5501;
        float _5515 = abs(_5509);
        float _5517 = log2(_5515);
        float _5519 = _5491 * _5501;
        float _5521 = _5511 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5523 = _4340 * _5513;
        float _5525 = -_5513;
        float _5527 = -_5521;
        float _5529 = fma(_5525, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5527);
        float _5531 = fma(_4344, _5511, _5523);
        float _5533 = -_5519;
        float _5535 = fma(_5533, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5529);
        float _5537 = fma(_4346, _5519, _5531);
        float _5539 = precise::clamp(_5537, 0.0, 1.0);
        float _5541 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5543 = _5535 + _5541;
        float _5545 = _5517 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5547 = _5543 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5549 = precise::clamp(_5547, 0.0, 1.0);
        float _5551 = exp2(_5545);
        float _5553 = _5551 * _5549;
        float _5555 = _5539 * _5553;
        float _5557 = _5555 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5559 = _5555 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5561 = _5555 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_106.x = _5557;
        out.m_106.y = _5559;
        out.m_106.z = _5561;
    }
    out.m_108.x = _5473;
    out.m_108.y = _5475;
    out.m_108.z = _5477;
    if (_5455)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_55.x = 0.0;
    float _5563 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5563;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

