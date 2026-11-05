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
    texture2d<float> vp_t_tcb_20 [[id(7)]];
    sampler vp_t_tcb_20Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_20Smplr_w [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_68 [[user(locn0)]];
    float4 m_70 [[user(locn1)]];
    float4 m_57 [[user(locn2)]];
    float4 m_102 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_78 [[user(locn5)]];
    float4 m_94 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_74 [[user(locn9)]];
    float4 m_80 [[user(locn10)]];
    float4 m_86 [[user(locn11)]];
    float4 m_88 [[user(locn12)]];
    float4 m_84 [[user(locn13)]];
    float4 m_100 [[user(locn14)]];
    float4 m_90 [[user(locn15)]];
    float4 m_96 [[user(locn16)]];
    float4 m_98 [[user(locn17)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_92 [[attribute(0)]];
    float4 m_76 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_50 [[attribute(3)]];
    float4 m_52 [[attribute(4)]];
    float4 m_64 [[attribute(5)]];
    float4 m_66 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5019 = false;
    bool _4096 = false;
    bool _579 = false;
    bool _435 = false;
    bool _247 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_50.w;
    float _118 = in.m_52.w;
    float _120 = trunc(_116);
    int _123 = int(_120);
    float _125 = -_118;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.y = _127;
    bool _131 = _123 >= 1;
    float _133 = 0.0;
    float _135 = _118;
    float _137 = _127;
    if (!_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _133;
    if (!_131)
    {
        out.m_57.x = 0.0;
    }
    int _141 = 0;
    if (!_131)
    {
        float _143 = _139 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    if (!_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5328 = as_type<float>(_145);
        out.gl_Position.z = _5328;
    }
    if (!_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _147 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_118);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = float(_123);
    bool _159 = _127 >= _157;
    bool _161 = !_155;
    bool _163 = _159 || _161;
    float _165 = 1.0 / _157;
    if (_163)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _135;
    if (_163)
    {
        out.m_57.x = 0.0;
    }
    float _169 = _127 * _165;
    int _171 = 0;
    float _173 = _169;
    if (_163)
    {
        float _175 = _167 * 5.0;
        _171 = as_type<int>(_175);
    }
    int _177 = _171;
    out.m_55.x = _169;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5391 = as_type<float>(_177);
        out.gl_Position.z = _5391;
    }
    if (_163)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = in.m_62.x;
    float _183 = in.m_62.y;
    float _185 = in.m_62.z;
    int _187 = as_type<int>(_179) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_179) & 2;
    bool _193 = _191 != 0;
    bool _195 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _197 = _183 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _199 = _183 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _201 = _183 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _203 = !_189;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].x, _197);
    float _209 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].x, _199);
    float _211 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].x, _201);
    bool _213 = !_193;
    float _215 = _213 ? (-0.5) : 0.5;
    float _217 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[4].z, _207);
    float _219 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[5].z, _209);
    float _221 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[6].z, _211);
    bool _223 = !_195;
    float _225 = _217;
    float _227 = _221;
    float _245;
    if (!_223)
    {
        float _229 = in.m_64.x;
        float _231 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _233 = _229 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _237 = _235 * _231;
        float _239 = floor(_237);
        float _241 = -_239;
        float _243 = _237 + _241;
        _245 = _243;
        _247 = true;
    }
    else
    {
        _245 = _169;
    }
    _247 = false;
    float _249 = _245;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _253 = _249 + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = _249 + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _261 = _249 + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _269 = _267 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _271;
    bool _275 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _277 = isnan(_249);
    bool _279 = _275 || _277;
    bool _281 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _283 = _279 || _281;
    float _285 = float(_283);
    float _287 = 1.0 / _265;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _291 = 1.0 / _273;
    float _293 = 1.0 / _269;
    float _295 = _253 * _287;
    bool _297 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _299 = isnan(_249);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -_285;
    float _311 = _309 + 1.0;
    float _313 = _307 * _311;
    float _315 = _257 * _291;
    bool _317 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _319 = isnan(_249);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = -_307;
    float _331 = _329 + 1.0;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _337 = _327 * _331;
    float _339 = -_327;
    float _341 = _339 + 1.0;
    float _343 = _261 * _293;
    bool _345 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _347 = isnan(_249);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _369 = fma(_359, _295, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _371 = _355 * _341;
    float _373 = fma(_363, _295, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _375 = -_355;
    float _377 = _375 + 1.0;
    float _379 = _369 * _371;
    float _381 = _373 * _371;
    float _383 = fma(_335, _343, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _385 = fma(_367, _343, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _387 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].x, _379);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _393;
    float _397 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].y, _381);
    float _399 = fma(_383, _337, _387);
    float _401 = fma(_391, _315, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _403 = fma(_395, _315, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _405 = fma(_385, _337, _397);
    float _407 = fma(_401, _313, _399);
    float _409 = fma(_403, _313, _405);
    float _411 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[146].x, _407);
    float _413 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[146].y, _409);
    bool _415 = !_289;
    float _433;
    if (!_415)
    {
        float _417 = in.m_64.x;
        float _419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _421 = _417 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _423 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _425 = _423 * _419;
        float _427 = floor(_425);
        float _429 = -_427;
        float _431 = _425 + _429;
        _433 = _431;
        _435 = true;
    }
    else
    {
        _433 = _169;
    }
    _435 = false;
    float _437 = _433;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _441 = _437 + _439;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _447 = _437 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _449 = isnan(_437);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _463 = _437 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _465 = isnan(_437);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _475;
    bool _479 = _437 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _481 = isnan(_437);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = 1.0 / _445;
    float _493 = -_457;
    float _495 = _493 + 1.0;
    bool _497 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _499 = 1.0 / _461;
    float _501 = _477 * _491;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _507 = -_489;
    float _509 = _507 + 1.0;
    float _511 = fma(_501, _441, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _513 = _473 * _495;
    float _515 = -_473;
    float _517 = _515 + 1.0;
    float _519 = _457 * _509;
    float _521 = _505 * _499;
    float _523 = _511 * _513;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _527 = _437 + _525;
    float _529 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[115].x, _523);
    float _531 = fma(_521, _527, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _535 = fma(_531, _519, _529);
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _539 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _541 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[117].x, _535);
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _545 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _547 = in.m_66.x;
    float _549 = in.m_66.y;
    float _551 = _541 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _553 = _543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_68.x = _539;
    out.m_68.y = _545;
    out.m_68.z = _553;
    out.m_68.w = _551;
    float _555 = _413 * _549;
    float _557 = _411 * _547;
    bool _559 = !_497;
    float _577;
    if (!_559)
    {
        float _561 = in.m_64.x;
        float _563 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _565 = _561 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _567 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[11].w, _127);
        float _569 = _567 * _563;
        float _571 = floor(_569);
        float _573 = -_571;
        float _575 = _569 + _573;
        _577 = _575;
        _579 = true;
    }
    else
    {
        _577 = _169;
    }
    _579 = false;
    float _581 = _577;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _585 = _581 + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _591 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _593 = isnan(_581);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _611 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _613 = isnan(_581);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = 1.0 / _589;
    float _625 = -_601;
    float _627 = _625 + 1.0;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _629;
    bool _633 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _635 = isnan(_581);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = _621 * _627;
    float _647 = -_621;
    float _649 = _647 + 1.0;
    bool _651 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _653 = 1.0 / _605;
    float _655 = _643 * _649;
    float _657 = -_643;
    float _659 = _657 + 1.0;
    float _661 = 1.0 / _609;
    float _663 = _631 * _623;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _669 = fma(_663, _585, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _671 = _667 * _653;
    bool _673 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _675 = isnan(_581);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _685;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _691 = _581 + _689;
    float _693 = _669 * _655;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _697 = _581 + _695;
    float _699 = -_683;
    float _701 = _699 + 1.0;
    float _703 = fma(_671, _691, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _705 = _687 * _661;
    float _707 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[131].x, _693);
    float _709 = _601 * _701;
    float _711 = fma(_705, _697, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _713 = fma(_703, _645, _707);
    float _715 = fma(_711, _709, _713);
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _723 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[134].x, _715);
    float _725 = _719 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _727 = _717 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _729 = _721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _731 = _723 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_70.x = _725;
    out.m_70.y = _727;
    out.m_70.z = _729;
    out.m_70.w = _731;
    bool _733 = !_651;
    int _735 = as_type<int>(_661);
    int _737 = as_type<int>(_729);
    if (!_733)
    {
        float _739 = in.m_64.x;
        float _741 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _743 = _739 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _745 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _747 = _745 * _741;
        float _749 = floor(_747);
        float _751 = -_749;
        float _753 = _747 + _751;
        _173 = _753;
    }
    float _755 = _173;
    float _757 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _759 = int(_757);
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _763 = _761 != 0;
    float _765 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _767 = int(_765);
    float _769 = float(_759);
    float _771 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _773 = int(_771);
    float _775 = 0.0;
    if (_763)
    {
        _775 = 1.0;
    }
    float _777 = _775;
    float _779 = 0.0;
    float _781 = _777;
    if (_763)
    {
        _779 = 1.0;
    }
    float _783 = _779;
    float _785 = _783;
    if (_763)
    {
        _735 = 0;
    }
    int _787 = _735;
    float _789 = float(_767);
    float _791 = 1.0 / _769;
    int _793 = _787;
    if (_763)
    {
        _737 = 0;
    }
    int _795 = _737;
    float _797 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _799 = int(_797);
    float _801 = float(uint(_773));
    float _803 = 1.0 / _789;
    float _805 = _791 * _127;
    float _807 = 1.0 / _801;
    float _809 = float(uint(_799));
    int _811 = ~_799;
    int _813 = _811 + 1;
    float _815 = trunc(_805);
    int _817 = int(_815);
    float _819 = _803 * _127;
    float _821 = _803;
    float _823 = _769;
    int _825 = _795;
    if (_763)
    {
        float _827 = in.m_64.x;
        float _829 = in.m_64.y;
        _821 = _827;
        _823 = _829;
    }
    float _831 = _821;
    float _833 = _823;
    float _835 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _837 = int(_835);
    int _839 = as_type<int>(_807) + (-2);
    float _841 = 1.0 / _809;
    float _843 = float(uint(_817));
    float _845 = as_type<float>(_839) * _843;
    float _847 = trunc(_819);
    int _849 = int(_847);
    float _851 = float(uint(_837));
    float _853 = 0.0;
    float _855 = _831;
    float _857 = _833;
    float _859 = as_type<float>(_839);
    if (_763)
    {
        _853 = _831;
    }
    float _861 = _853;
    float _863 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _865 = int(_863);
    int _867 = as_type<int>(_841) + (-2);
    float _869 = _841;
    float _871 = _861;
    if (_763)
    {
        _869 = _833;
    }
    float _873 = _869;
    float _875 = 1.0 / _851;
    float _877 = float(uint(_849));
    float _879 = as_type<float>(_867) * _877;
    float _881 = trunc(_845);
    float _883 = precise::max(_881, 0.0);
    uint _886 = uint(_883);
    float _888 = float(_865);
    float _890 = 1.0 / _888;
    float _892 = trunc(_879);
    float _894 = precise::max(_892, 0.0);
    uint _896 = uint(_894);
    float _898 = _888;
    float _900 = _879;
    float _902 = _873;
    if (_763)
    {
        _898 = _861;
    }
    float _904 = _898;
    float _906 = _904;
    if (_763)
    {
        _900 = _861;
    }
    float _908 = _900;
    float _910 = _908;
    if (!_763)
    {
        float _912 = in.m_64.x;
        float _914 = in.m_64.y;
        float _916 = in.m_64.z;
        float _918 = _912 * 3.1415927410125732421875;
        float _920 = _918 * 0.15915493667125701904296875;
        float _922 = _914 * 3.1415927410125732421875;
        float _924 = _922 * 0.15915493667125701904296875;
        float _926 = _920 * 6.283185482025146484375;
        float _928 = sin(_926);
        float _930 = _924 * 6.283185482025146484375;
        float _932 = sin(_930);
        _781 = 7.345489978790283203125;
        _855 = _912;
        _785 = 5.839270114898681640625;
        _906 = _916;
        _871 = _914;
        _857 = _914;
        _902 = _932;
        _793 = 1;
        _825 = 2;
        _910 = _928;
    }
    float _934 = _781;
    float _936 = _855;
    float _938 = _785;
    float _940 = _906;
    float _942 = _871;
    float _944 = _857;
    float _946 = _902;
    int _948 = _793;
    int _950 = _825;
    float _952 = _910;
    int _954 = _813 * int(_896);
    int _956 = _954 + _849;
    float _958 = _934 * _936;
    float _960 = _938 * _940;
    float _962 = in.m_64.z;
    float _964 = in.m_64.w;
    float _966 = _934 * _942;
    float _968 = float(uint(_956));
    float _970 = floor(_958);
    float _972 = _890 * _127;
    float _974 = _936 * 2.0;
    float _976 = as_type<float>(_867) * _968;
    int _978 = ~_773;
    int _980 = _978 + 1;
    float _982 = float(_849);
    float _984 = trunc(_976);
    float _986 = precise::max(_984, 0.0);
    uint _988 = uint(_986);
    float _990 = float(_799);
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _994 = _992 != 0;
    int _996 = _980 * int(_886);
    int _998 = _996 + _817;
    bool _1000 = _944 > 0.5;
    float _1002 = floor(_960);
    float _1004 = -_970;
    float _1006 = _958 + _1004;
    int _1008 = ~_773;
    int _1010 = _1008 + 1;
    float _1012 = float(uint(_998));
    bool _1014 = _964 > 0.5;
    float _1016 = trunc(_972);
    int _1018 = int(_1016);
    float _1020 = as_type<float>(_839) * _1012;
    int _1022 = int(_896) + int(_988);
    int _1024 = as_type<int>(_875) + (-2);
    bool _1026 = _962 > 0.5;
    float _1028 = trunc(_1020);
    float _1030 = precise::max(_1028, 0.0);
    uint _1032 = uint(_1030);
    float _1034 = -_1002;
    float _1036 = _960 + _1034;
    int _1038 = ~_799;
    int _1040 = _1038 + 1;
    bool _1042 = _982 >= _990;
    bool _1044 = isnan(_982);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan(_990);
    bool _1050 = _1046 || _1048;
    float _1052 = float(_1050);
    int _1054 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1056 = _1054 != 0;
    int _1058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1060 = _1058 != 0;
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1064 = _1062 != 0;
    int _1066 = _1040 * _1022;
    int _1068 = _1066 + _849;
    float _1070 = float(uint(_1018));
    float _1072 = floor(_966);
    float _1074 = -_205;
    int _1076 = _1000 ? as_type<int>(_1074) : as_type<int>(_205);
    float _1078 = as_type<float>(_1024) * _1070;
    float _1080 = -_215;
    int _1082 = _1026 ? as_type<int>(_1080) : as_type<int>(_215);
    int _1084 = int(_886) + int(_1032);
    float _1086 = trunc(_1078);
    float _1088 = precise::max(_1086, 0.0);
    uint _1090 = uint(_1088);
    float _1092 = _1006 * _990;
    int _1094 = int(_1014);
    int _1096 = _1026 ? 2 : 0;
    int _1098 = _1094 | _1096;
    int _1100 = _994 ? 4 : 0;
    int _1102 = _1098 | _1100;
    int _1104 = _1056 ? 8 : 0;
    int _1106 = _1102 | _1104;
    int _1108 = _1060 ? 16 : 0;
    int _1110 = _1106 | _1108;
    int _1112 = _1064 ? 32 : 0;
    int _1114 = _1110 | _1112;
    int _1116 = _1000 ? 64 : 0;
    int _1118 = _1114 | _1116;
    int _1120 = _1118 & 64;
    bool _1122 = !_1060;
    float _1124 = _1122 ? _205 : as_type<float>(_1076);
    float _1126 = float(_773);
    float _1128 = trunc(_1052);
    int _1130 = int(_1128);
    float _1132 = float(_817);
    float _1134 = _1036 * _1126;
    int _1136 = ~_837;
    int _1138 = _1136 + 1;
    int _1140 = _1010 * _1084;
    int _1142 = _1140 + _817;
    bool _1144 = !_994;
    int _1146 = _1144 ? 0 : 1;
    float _1148 = trunc(_1092);
    int _1150 = int(_1148);
    bool _1152 = !_1064;
    float _1154 = _1152 ? _215 : as_type<float>(_1082);
    int _1156 = _1138 * int(_1090);
    int _1158 = _1156 + _1018;
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1162 = _1160 != 0;
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1166 = _1164 != 0;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1170 = _1168 != 0;
    bool _1172 = uint(_1068) >= uint(_799);
    bool _1174 = _1132 >= _1126;
    bool _1176 = isnan(_1132);
    bool _1178 = _1174 || _1176;
    bool _1180 = isnan(_1126);
    bool _1182 = _1178 || _1180;
    float _1184 = float(_1182);
    float _1186 = trunc(_1134);
    int _1188 = int(_1186);
    bool _1190 = !_1166;
    int _1192 = _1190 ? 0 : 1;
    bool _1194 = !_1162;
    int _1196 = _1194 ? 0 : 1;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1200 = _1198 != 0;
    bool _1202 = uint(_1142) >= uint(_773);
    float _1204 = trunc(_1184);
    int _1206 = int(_1204);
    bool _1208 = !_1172;
    int _1210 = _1208 ? 0 : (-1);
    bool _1212 = !_1170;
    int _1214 = _1212 ? 0 : 1;
    bool _1216 = !_1200;
    int _1218 = _1216 ? 0 : 1;
    bool _1220 = !_1202;
    int _1222 = _1220 ? 0 : (-1);
    float _1224 = floor(_974);
    float _1226 = -_1072;
    float _1228 = _966 + _1226;
    float _1230 = float(uint(_1158));
    int _1232 = abs(_1146);
    int _1234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1236 = _1234 != 0;
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1240 = _1238 != 0;
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1244 = _1242 != 0;
    float _1246 = as_type<float>(_1024) * _1230;
    int _1248 = ~_1022;
    int _1250 = _1248 + _1210;
    int _1252 = _1250 + 1;
    int _1254 = _1150 * _1232;
    int _1256 = _1254 + _849;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1260 = _1258 != 0;
    int _1262 = ~_1084;
    int _1264 = _1262 + _1222;
    int _1266 = _1264 + 1;
    int _1268 = _799 * _1252;
    int _1270 = _1268 + _849;
    bool _1272 = !_1240;
    int _1274 = _1272 ? 0 : 1;
    float _1276 = trunc(_1246);
    float _1278 = precise::max(_1276, 0.0);
    uint _1280 = uint(_1278);
    bool _1282 = !_1260;
    int _1284 = _1282 ? 0 : 1;
    int _1286 = _773 * _1266;
    int _1288 = _1286 + _817;
    bool _1290 = _1120 != 0;
    float _1292 = _165 * _127;
    bool _1294 = _799 == 0;
    bool _1296 = !_1236;
    int _1298 = _1296 ? 0 : 1;
    float _1300 = _990 * _1292;
    bool _1302 = _773 == 0;
    float _1304 = _1126 * _1292;
    int _1306 = ~_1130;
    int _1308 = _1306 + 1;
    int _1310 = _1308 + 1;
    bool _1312 = !_1294;
    int _1314 = _1312 ? _1270 : (-1);
    float _1316 = trunc(_1300);
    int _1318 = int(_1316);
    int _1320 = ~_1206;
    int _1322 = _1320 + 1;
    int _1324 = _1322 + 1;
    bool _1326 = !_1302;
    int _1328 = _1326 ? _1288 : (-1);
    int _1330 = _1314 * _1310;
    int _1332 = _799 + (-1);
    int _1334 = abs(_1192);
    int _1336 = _1328 * _1324;
    int _1338 = _773 + (-1);
    int _1340 = _1130 * _1332;
    int _1342 = _1340 + _1330;
    int _1344 = abs(_1274);
    float _1346 = trunc(_1304);
    int _1348 = int(_1346);
    int _1350 = abs(_1284);
    int _1352 = _1206 * _1338;
    int _1354 = _1352 + _1336;
    int _1356 = _1342 * _1334;
    int _1358 = abs(_1196);
    int _1360 = _1188 * _1350;
    int _1362 = _1360 + _817;
    int _1364 = ~_837;
    int _1366 = _1364 + 1;
    int _1368 = _1354 * _1344;
    int _1370 = abs(_1214);
    int _1372 = _1318 * _1358;
    int _1374 = _1372 + _1356;
    int _1376 = abs(_1218);
    int _1378 = _1256 * _1370;
    int _1380 = _1378 + _1374;
    int _1382 = int(_1090) + int(_1280);
    int _1384 = abs(_1298);
    int _1386 = _1366 * _1382;
    int _1388 = _1386 + _1018;
    float _1390 = -_215;
    int _1392 = _1014 ? as_type<int>(_1390) : as_type<int>(_215);
    int _1394 = _1150 * _1376;
    int _1396 = _1394 + _1380;
    float _1398 = -_205;
    int _1400 = _1026 ? as_type<int>(_1398) : as_type<int>(_205);
    int _1402 = _1348 * _1384;
    int _1404 = _1402 + _1368;
    bool _1406 = uint(_1388) >= uint(_837);
    float _1408 = float(uint(_1396));
    float _1410 = float(_837);
    float _1412 = float(_1018);
    float _1414 = as_type<float>(_867) * _1408;
    int _1416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1418 = _1416 != 0;
    float _1420 = _1410 * _1292;
    bool _1422 = !_1244;
    int _1424 = _1422 ? 0 : 1;
    float _1426 = trunc(_1414);
    float _1428 = precise::max(_1426, 0.0);
    uint _1430 = uint(_1428);
    bool _1432 = _1412 >= _1410;
    bool _1434 = isnan(_1412);
    bool _1436 = _1432 || _1434;
    bool _1438 = isnan(_1410);
    bool _1440 = _1436 || _1438;
    float _1442 = float(_1440);
    float _1444 = _1228 * _1410;
    int _1446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1448 = _1446 != 0;
    float _1450 = _944 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1452 = !_1418;
    int _1454 = _1452 ? 0 : 1;
    int _1456 = abs(_1424);
    float _1458 = trunc(_1442);
    int _1460 = int(_1458);
    bool _1462 = !_1056;
    float _1464 = _1462 ? _215 : as_type<float>(_1392);
    bool _1466 = !_1448;
    int _1468 = _1466 ? 0 : 1;
    int _1470 = abs(_1454);
    float _1472 = trunc(_1420);
    int _1474 = int(_1472);
    bool _1476 = !_1406;
    int _1478 = _1476 ? 0 : (-1);
    int _1480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1482 = _1480 != 0;
    int _1484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1486 = _1484 != 0;
    int _1488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1490 = _1488 != 0;
    int _1492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1494 = _1492 != 0;
    int _1496 = _1362 * _1456;
    int _1498 = _1496 + _1404;
    int _1500 = ~_1382;
    int _1502 = _1500 + _1478;
    int _1504 = _1502 + 1;
    bool _1506 = !_1486;
    int _1508 = _1506 ? 0 : 1;
    int _1510 = _1188 * _1470;
    int _1512 = _1510 + _1498;
    int _1514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1516 = _1514 != 0;
    int _1518 = _837 * _1504;
    int _1520 = _1518 + _1018;
    int _1522 = ~_799;
    int _1524 = _1522 + 1;
    float _1526 = trunc(_1444);
    int _1528 = int(_1526);
    float _1530 = float(uint(_1512));
    bool _1532 = !_1482;
    int _1534 = _1532 ? 0 : 1;
    int _1536 = _1524 * int(_1430);
    int _1538 = _1536 + _1396;
    bool _1540 = _837 == 0;
    float _1542 = as_type<float>(_839) * _1530;
    int _1544 = ~_1460;
    int _1546 = _1544 + 1;
    int _1548 = _1546 + 1;
    float _1550 = float(uint(_1538));
    float _1552 = _1530;
    float _1554 = as_type<float>(_948);
    if (_1516)
    {
        float _1556 = in.m_64.w;
        _1552 = _1556;
    }
    float _1558 = _1552;
    bool _1560 = !_1540;
    int _1562 = _1560 ? _1520 : (-1);
    float _1564 = trunc(_1542);
    float _1566 = precise::max(_1564, 0.0);
    uint _1568 = uint(_1566);
    int _1570 = abs(_1508);
    float _1572 = as_type<float>(_867) * _1550;
    int _1574 = abs(_1468);
    int _1576 = _1562 * _1548;
    int _1578 = _837 + (-1);
    int _1580 = abs(_1534);
    float _1582 = trunc(_1572);
    float _1584 = precise::max(_1582, 0.0);
    uint _1586 = uint(_1584);
    int _1588 = _1460 * _1578;
    int _1590 = _1588 + _1576;
    int _1592 = _1590 * _1570;
    int _1594 = ~_773;
    int _1596 = _1594 + 1;
    int _1598 = _1528 * _1574;
    int _1600 = _1598 + _1018;
    bool _1602 = _799 == 0;
    int _1604 = _1474 * _1580;
    int _1606 = _1604 + _1592;
    bool _1608 = !_1490;
    int _1610 = _1608 ? 0 : 1;
    int _1612 = _1596 * int(_1568);
    int _1614 = _1612 + _1512;
    int _1616 = ~_799;
    int _1618 = _1616 + 1;
    float _1620 = as_type<float>(_1574);
    if (_1516)
    {
        float _1622 = _1558 * 3.1415927410125732421875;
        _1620 = _1622;
    }
    float _1624 = _1620;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1628 = _1626 != 0;
    int _1630 = int(_1430) + int(_1586);
    float _1632 = _1624;
    if (_1516)
    {
        float _1634 = _1624 * 0.15915493667125701904296875;
        _1632 = _1634;
    }
    float _1636 = _1632;
    int _1638 = abs(_1610);
    bool _1640 = !_1494;
    int _1642 = _1640 ? 0 : 1;
    int _1644 = _1618 * _1630;
    int _1646 = _1644 + _1396;
    float _1648 = float(uint(_1614));
    float _1650 = _1636;
    if (_1516)
    {
        float _1652 = _1636 * 6.283185482025146484375;
        float _1654 = sin(_1652);
        _1650 = _1654;
    }
    float _1656 = _1650;
    int _1658 = abs(_1642);
    int _1660 = _1600 * _1638;
    int _1662 = _1660 + _1606;
    bool _1664 = uint(_1646) >= uint(_799);
    float _1666 = as_type<float>(_839) * _1648;
    float _1668 = as_type<float>(_1570);
    if (_1628)
    {
        float _1670 = in.m_64.x;
        _1668 = _1670;
    }
    float _1672 = _1668;
    float _1674 = float(uint(_1256));
    bool _1676 = !_1664;
    int _1678 = _1676 ? 0 : (-1);
    float _1680 = trunc(_1666);
    float _1682 = precise::max(_1680, 0.0);
    uint _1684 = uint(_1682);
    int _1686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1688 = _1686 != 0;
    float _1690 = as_type<float>(_867) * _1674;
    int _1692 = ~_1630;
    int _1694 = _1692 + _1678;
    int _1696 = _1694 + 1;
    int _1698 = _1528 * _1658;
    int _1700 = _1698 + _1662;
    bool _1702 = !_1688;
    float _1704 = _1702 ? _205 : as_type<float>(_1400);
    bool _1706 = _1688;
    if (_1516)
    {
        bool _1708 = _1656 > 0.5;
        _1706 = _1708;
    }
    bool _1710 = _1706;
    int _1712 = _799 * _1696;
    int _1714 = _1712 + _1396;
    float _1716 = trunc(_1690);
    float _1718 = precise::max(_1716, 0.0);
    uint _1720 = uint(_1718);
    float _1722 = float(uint(_1700));
    float _1724 = 0.0;
    float _1726 = _1722;
    if (!_1516)
    {
        _1724 = _205;
    }
    float _1728 = _1724;
    bool _1730 = !_1602;
    int _1732 = _1730 ? _1714 : (-1);
    float _1734 = as_type<float>(_1024) * _1722;
    int _1736 = ~_799;
    int _1738 = _1736 + 1;
    float _1740 = _1728;
    if (_1516)
    {
        float _1742 = -_205;
        float _1744 = _1710 ? _1742 : _205;
        _1740 = _1744;
    }
    float _1746 = _1740;
    float _1748 = trunc(_1734);
    float _1750 = precise::max(_1748, 0.0);
    uint _1752 = uint(_1750);
    int _1754 = int(_1568) + int(_1684);
    if (_1628)
    {
        float _1756 = _1672 * 3.1415927410125732421875;
        _1726 = _1756;
    }
    float _1758 = _1726;
    int _1760 = _1732 & 3;
    bool _1762 = _1760 != 0;
    int _1764 = _1732 & 3;
    bool _1766 = _1764 != 0;
    float _1768 = _1758;
    if (_1628)
    {
        float _1770 = _1758 * 0.15915493667125701904296875;
        _1768 = _1770;
    }
    float _1772 = _1768;
    int _1774 = _1762 ? 0 : 1;
    bool _1776 = uint(_1764) > 1u;
    int _1778 = _1738 * int(_1720);
    int _1780 = _1778 + _1256;
    float _1782 = float(uint(_1362));
    float _1784 = _1772;
    if (_1628)
    {
        float _1786 = _1772 * 6.283185482025146484375;
        float _1788 = sin(_1786);
        _1784 = _1788;
    }
    float _1790 = _1784;
    int _1792 = ~_773;
    int _1794 = _1792 + 1;
    float _1796 = float(uint(_1780));
    float _1798 = as_type<float>(_839) * _1782;
    int _1800 = ~_837;
    int _1802 = _1800 + 1;
    float _1804 = trunc(_1798);
    float _1806 = precise::max(_1804, 0.0);
    uint _1808 = uint(_1806);
    int _1810 = ~_1774;
    int _1812 = _1810 + 1;
    int _1814 = _1812 + 1;
    float _1816 = as_type<float>(_867) * _1796;
    int _1818 = _1814;
    if (!_1776)
    {
        int _1820 = ~_1774;
        int _1822 = _1820 + 1;
        _1818 = _1822;
    }
    int _1824 = _1818;
    int _1826 = _1794 * _1754;
    int _1828 = _1826 + _1512;
    float _1830 = -_215;
    int _1832 = _1290 ? as_type<int>(_1830) : as_type<int>(_215);
    int _1834 = _1802 * int(_1752);
    int _1836 = _1834 + _1700;
    bool _1838 = uint(_1764) >= 2u;
    float _1840 = trunc(_1816);
    float _1842 = precise::max(_1840, 0.0);
    uint _1844 = uint(_1842);
    bool _1846 = uint(_1828) >= uint(_773);
    float _1848 = float(uint(_1836));
    int _1850 = _1838 ? 0 : 1;
    bool _1852 = _1764 != 3;
    float _1854 = as_type<float>(_1024) * _1848;
    int _1856 = ~_773;
    int _1858 = _1856 + 1;
    bool _1860 = !_1846;
    int _1862 = _1860 ? 0 : (-1);
    float _1864 = trunc(_1854);
    float _1866 = precise::max(_1864, 0.0);
    uint _1868 = uint(_1866);
    int _1870 = ~_1850;
    int _1872 = _1870 + 1;
    int _1874 = _1872 + 1;
    int _1876 = _1858 * int(_1808);
    int _1878 = _1876 + _1362;
    int _1880 = ~_1754;
    int _1882 = _1880 + _1862;
    int _1884 = _1882 + 1;
    float _1886 = float(uint(_1878));
    int _1888 = _773 * _1884;
    int _1890 = _1888 + _1512;
    int _1892 = _1874;
    bool _1894 = _1852;
    float _1896 = as_type<float>(_1808);
    if (_1852)
    {
        int _1898 = ~_1850;
        int _1900 = _1898 + 1;
        _1892 = _1900;
    }
    int _1902 = _1892;
    if (_1628)
    {
        bool _1904 = _1790 > 0.5;
        _1894 = _1904;
    }
    bool _1906 = _1894;
    float _1908 = as_type<float>(_839) * _1886;
    bool _1910 = !_1302;
    int _1912 = _1910 ? _1890 : (-1);
    if (!_1628)
    {
        _859 = _215;
    }
    float _1914 = _859;
    int _1916 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1918 = _1916 != 0;
    float _1920 = trunc(_1908);
    float _1922 = precise::max(_1920, 0.0);
    uint _1924 = uint(_1922);
    float _1926 = _1914;
    if (_1628)
    {
        float _1928 = -_215;
        float _1930 = _1906 ? _1928 : _215;
        _1926 = _1930;
    }
    float _1932 = _1926;
    int _1934 = _1912 & 3;
    bool _1936 = _1934 != 0;
    bool _1938 = !_1918;
    float _1940 = _1938 ? _215 : as_type<float>(_1832);
    int _1942 = int(_1720) + int(_1844);
    bool _1944 = uint(_1934) > 1u;
    int _1946 = int(_1752) + int(_1868);
    float _1948 = _936 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1950 = ~_837;
    int _1952 = _1950 + 1;
    int _1954 = _1912 & 3;
    bool _1956 = _1954 != 0;
    int _1958 = ~_799;
    int _1960 = _1958 + 1;
    int _1962 = _1952 * _1946;
    int _1964 = _1962 + _1700;
    int _1966 = _1956 ? 0 : 1;
    int _1968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1970 = _1968 != 0;
    int _1972 = _1960 * _1942;
    int _1974 = _1972 + _1256;
    float _1976 = float(uint(_1600));
    bool _1978 = !_1970;
    int _1980 = _1978 ? 0 : 1;
    bool _1982 = uint(_1964) >= uint(_837);
    float _1984 = as_type<float>(_1024) * _1976;
    int _1986 = ~_1966;
    int _1988 = _1986 + 1;
    int _1990 = _1988 + 1;
    int _1992 = _1990;
    if (!_1944)
    {
        int _1994 = ~_1966;
        int _1996 = _1994 + 1;
        _1992 = _1996;
    }
    int _1998 = _1992;
    float _2000 = trunc(_1984);
    float _2002 = precise::max(_2000, 0.0);
    uint _2004 = uint(_2002);
    bool _2006 = uint(_1974) >= uint(_799);
    bool _2008 = !_1982;
    int _2010 = _2008 ? 0 : (-1);
    bool _2012 = _1934 != 3;
    bool _2014 = !_2006;
    int _2016 = _2014 ? 0 : (-1);
    bool _2018 = uint(_1934) >= 2u;
    int _2020 = ~_1946;
    int _2022 = _2020 + _2010;
    int _2024 = _2022 + 1;
    int _2026 = ~_773;
    int _2028 = _2026 + 1;
    int _2030 = int(_1808) + int(_1924);
    int _2032 = _837 * _2024;
    int _2034 = _2032 + _1700;
    int _2036 = ~_837;
    int _2038 = _2036 + 1;
    int _2040 = _2018 ? 0 : 1;
    int _2042 = _2028 * _2030;
    int _2044 = _2042 + _1362;
    int _2046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2048 = _2046 != 0;
    int _2050 = ~_2040;
    int _2052 = _2050 + 1;
    int _2054 = _2052 + 1;
    int _2056 = _2054;
    float _2058 = as_type<float>(_2038);
    int _2060 = _1998;
    if (_2012)
    {
        int _2062 = ~_2040;
        int _2064 = _2062 + 1;
        _2056 = _2064;
    }
    int _2066 = _2056;
    int _2068 = _2038 * int(_2004);
    int _2070 = _2068 + _1600;
    int _2072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2074 = _2072 != 0;
    bool _2076 = !_2048;
    int _2078 = _2076 ? 0 : 1;
    bool _2080 = uint(_2044) >= uint(_773);
    bool _2082 = !_1540;
    int _2084 = _2082 ? _2034 : (-1);
    bool _2086 = !_2074;
    int _2088 = _2086 ? 0 : 1;
    bool _2090 = !_2080;
    int _2092 = _2090 ? 0 : (-1);
    int _2094 = _2084 & 3;
    bool _2096 = _2094 != 0;
    float _2098 = float(uint(_2070));
    int _2100 = _2084 & 3;
    bool _2102 = _2100 != 0;
    int _2104 = _2096 ? 0 : 1;
    float _2106 = as_type<float>(_1024) * _2098;
    bool _2108 = uint(_2100) > 1u;
    int _2110 = ~_2104;
    int _2112 = _2110 + 1;
    int _2114 = _2112 + 1;
    float _2116 = trunc(_2106);
    float _2118 = precise::max(_2116, 0.0);
    uint _2120 = uint(_2118);
    float _2122 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2126 = -_2122;
    float _2128 = fma(_1948, 2.0, _2126);
    int _2130 = _2114;
    float _2132 = as_type<float>(_2004);
    if (!_2108)
    {
        int _2134 = ~_2104;
        int _2136 = _2134 + 1;
        _2130 = _2136;
    }
    int _2138 = _2130;
    float _2140 = fma(_1450, -2.0, _2124);
    bool _2142 = uint(_2100) >= 2u;
    float _2144 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _2146 = ~_837;
    int _2148 = _2146 + 1;
    float _2150 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2152 = _2142 ? 0 : 1;
    float _2154 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _2156 = _2100 != 3;
    float _2158 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2150);
    int _2160 = int(_2004) + int(_2120);
    float _2162 = _946 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _2164 = ~_2152;
    int _2166 = _2164 + 1;
    int _2168 = _2166 + 1;
    float _2170 = -_127;
    float _2172 = fma(_2170, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2128);
    int _2174 = _2148 * _2160;
    int _2176 = _2174 + _1600;
    float _2178 = fma(_2162, -2.0, _2154);
    float _2180 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2182 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2158);
    int _2184 = _2168;
    float _2186 = as_type<float>(_2176);
    if (_2156)
    {
        int _2188 = ~_2152;
        int _2190 = _2188 + 1;
        _2184 = _2190;
    }
    int _2192 = _2184;
    float _2194 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2196 = uint(_2176) >= uint(_837);
    float _2198 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2200 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2140);
    bool _2202 = !_2196;
    int _2204 = _2202 ? 0 : (-1);
    float _2206 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2178);
    bool _2208 = _936 > 0.5;
    float _2210 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2212 = -_205;
    int _2214 = _2208 ? as_type<int>(_2212) : as_type<int>(_205);
    bool _2216 = _948 != 1;
    float _2218 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2220 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2222 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2224 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2226 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2228 = _2226 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    if (!_2216)
    {
        _2132 = _944;
    }
    float _2230 = _2132;
    float _2232 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2234 = _2232 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2236 = 0.0;
    float _2238 = _2230;
    if (!_2216)
    {
        _2236 = _944;
    }
    float _2240 = _2236;
    float _2242 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2222);
    float _2244 = _2240;
    if (!_2216)
    {
        _1554 = _962;
    }
    float _2246 = _1554;
    float _2248 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2224);
    float _2250 = _2246;
    if (!_2216)
    {
        _1896 = _962;
    }
    float _2252 = _1896;
    float _2254 = 1.0 / _2228;
    float _2256 = _2252;
    if (_2216)
    {
        _2238 = _936;
    }
    float _2258 = _2238;
    float _2260 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2262 = _2260 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    if (_2216)
    {
        _2244 = _936;
    }
    float _2264 = _2244;
    if (_2216)
    {
        _2250 = _944;
    }
    float _2266 = _2250;
    float _2268 = _2258 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2216)
    {
        _2256 = _944;
    }
    float _2270 = _2256;
    float _2272 = 1.0 / _2234;
    bool _2274 = _950 != 2;
    float _2276 = -_2194;
    float _2278 = fma(_2268, 2.0, _2276);
    float _2280 = _2266 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2282 = fma(_2270, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2218);
    float _2284 = -_127;
    float _2286 = fma(_2284, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2278);
    float _2288 = fma(_2280, -2.0, _2210);
    float _2290 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2292 = _2290 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2294 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2282);
    float _2296 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2288);
    float _2298 = 1.0 / _2262;
    if (_2274)
    {
        _2186 = _936;
    }
    float _2300 = _2186;
    float _2302 = -_2294;
    float _2304 = _2302 + 1.0;
    float _2306 = _2300;
    if (_2274)
    {
        _2058 = _944;
    }
    float _2308 = _2058;
    float _2310 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2312 = _2310 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2314 = _2308;
    if (!_2274)
    {
        _2306 = _962;
    }
    float _2316 = _2306;
    if (!_2274)
    {
        _2314 = _936;
    }
    float _2318 = _2314;
    float _2320 = 1.0 / _2292;
    int _2322 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2324 = _2322 != 0;
    float _2326 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2180);
    float _2328 = _952 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2330 = _2316 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2332 = !_2324;
    float _2334 = _2332 ? _205 : as_type<float>(_2214);
    float _2336 = _2318 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2338 = -_2144;
    float _2340 = fma(_2328, 2.0, _2338);
    float _2342 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2344 = log2(_2342);
    float _2346 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2348 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2350 = isnan(0.0);
    bool _2352 = _2348 || _2350;
    bool _2354 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2356 = _2352 || _2354;
    float _2358 = -_2198;
    float _2360 = fma(_2330, 2.0, _2358);
    float _2362 = fma(_2264, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2346);
    float _2364 = fma(_2336, -2.0, _2220);
    float _2366 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2368 = -_127;
    float _2370 = fma(_2368, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2340);
    float _2372 = _944 * 2.0;
    float _2374 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2242);
    float _2376 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2378 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2366);
    float _2380 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2326);
    float _2382 = _2344 * _127;
    float _2384 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2376);
    float _2386 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2378);
    float _2388 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2248);
    float _2390 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2362);
    float _2392 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2384);
    float _2394 = exp2(_2382);
    float _2396 = -_127;
    float _2398 = fma(_2396, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2360);
    float _2400 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2364);
    float _2402 = _944 + _936;
    float _2404 = -_2380;
    float _2406 = _2404 + 1.0;
    int _2408 = ~_2030;
    int _2410 = _2408 + _2092;
    int _2412 = _2410 + 1;
    float _2414 = floor(_2372);
    float _2416 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2418 = _2416 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2420 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2422 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2420;
    float _2424 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2426 = _2424 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2428 = _773 * _2412;
    int _2430 = _2428 + _1362;
    bool _2432 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2434 = isnan(_755);
    bool _2436 = _2432 || _2434;
    bool _2438 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2440 = _2436 || _2438;
    float _2442 = float(_2440);
    float _2444 = _2422 * _2272;
    float _2446 = _962 * 2.0;
    float _2448 = -_2394;
    float _2450 = _2448 + 1.0;
    float _2452 = 1.0 / _2312;
    float _2454 = in.m_50.x;
    float _2456 = in.m_50.y;
    float _2458 = in.m_50.z;
    float _2460 = _2402 + (-1.0);
    float _2462 = _2356 ? _2450 : 0.0;
    float _2464 = -_2386;
    float _2466 = _2464 + 1.0;
    bool _2468 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2470 = isnan(1.0);
    bool _2472 = _2468 || _2470;
    bool _2474 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2476 = _2472 || _2474;
    float _2478 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2480 = 1.0 + _2478;
    float _2482 = floor(_2446);
    float _2484 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2486 = _2484 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _2488 = _1912 >> 31;
    float _2490 = -_2392;
    float _2492 = _2490 + 1.0;
    int _2494 = ~_1942;
    int _2496 = _2494 + _2016;
    int _2498 = _2496 + 1;
    float _2500 = -_2388;
    float _2502 = _2500 + 1.0;
    int _2504 = _2488 & 3;
    float _2506 = 1.0 / _2480;
    float _2508 = _2426 * _2452;
    int _2510 = _799 * _2498;
    int _2512 = _2510 + _1256;
    int _2514 = _1912 + _2504;
    int _2516 = abs(_2192);
    float _2518 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2520 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2518;
    float _2522 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2524 = _755 + _2522;
    float _2526 = _2456 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2528 = 1.0 / _2486;
    int _2530 = _2514 >> 2;
    float _2532 = fma(_2454, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2526);
    bool _2534 = !_1936;
    int _2536 = _2534 ? 0 : 1;
    if (_2476)
    {
        float _2538 = _2462 * _2506;
        _137 = _2538;
    }
    float _2540 = _137;
    bool _2542 = _1224 >= 0.0;
    bool _2544 = isnan(_1224);
    bool _2546 = _2542 || _2544;
    bool _2548 = isnan(0.0);
    bool _2550 = _2546 || _2548;
    float _2552 = _2456 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2554 = _2456 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _2556 = _2550 ? 0 : 1;
    float _2558 = fma(_2454, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2552);
    bool _2560 = _1224 > 0.0;
    float _2562 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2564 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2562;
    float _2566 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2568 = _2566 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2570 = fma(_2454, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2554);
    float _2572 = fma(_2458, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2558);
    float _2574 = _2564 * _2254;
    float _2576 = _2568 * _2320;
    float _2578 = 1.0 / _2418;
    int _2580 = ~_2556;
    int _2582 = _2580 + 1;
    int _2584 = _2582 + 1;
    float _2586 = fma(_2574, _2524, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2588 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2590 = isnan(_755);
    bool _2592 = _2588 || _2590;
    bool _2594 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2596 = _2592 || _2594;
    float _2598 = float(_2596);
    float _2600 = _2572 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2602 = _2530 << 4;
    int _2604 = _2602 + 656;
    float _2606 = _2520 * _2528;
    int _2608 = _2584;
    if (!_2560)
    {
        int _2610 = ~_2556;
        int _2612 = _2610 + 1;
        _2608 = _2612;
    }
    int _2614 = _2608;
    float _2616 = -_2598;
    float _2618 = _2616 + 1.0;
    bool _2620 = _2414 >= 0.0;
    bool _2622 = isnan(_2414);
    bool _2624 = _2620 || _2622;
    bool _2626 = isnan(0.0);
    bool _2628 = _2624 || _2626;
    bool _2630 = !_1302;
    int _2632 = _2630 ? _2430 : (-1);
    int _2634 = _2628 ? 0 : 1;
    bool _2636 = _2414 > 0.0;
    float _2638 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2640 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2638;
    float _2642 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2644 = _2642 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _2646 = ~_2634;
    int _2648 = _2646 + 1;
    int _2650 = _2648 + 1;
    float _2652 = _2640 * _2298;
    bool _2654 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2656 = isnan(_755);
    bool _2658 = _2654 || _2656;
    bool _2660 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2662 = _2658 || _2660;
    float _2664 = float(_2662);
    float _2666 = _2644 * _2578;
    bool _2668 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2670 = isnan(_755);
    bool _2672 = _2668 || _2670;
    bool _2674 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2676 = _2672 || _2674;
    float _2678 = float(_2676);
    bool _2680 = !_1766;
    int _2682 = _2680 ? 0 : 1;
    float _2684 = -_2664;
    float _2686 = _2684 + 1.0;
    int _2688 = abs(_2536);
    float _2690 = -_2678;
    float _2692 = _2690 + 1.0;
    int _2694 = _2650;
    if (!_2636)
    {
        int _2696 = ~_2634;
        int _2698 = _2696 + 1;
        _2694 = _2698;
    }
    int _2700 = _2694;
    float _2702 = _2442 * _2686;
    int _2704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2706 = _2704 != 0;
    int _2708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2710 = _2708 != 0;
    int _2712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2714 = _2712 != 0;
    float _2716 = -_2442;
    float _2718 = _2716 + 1.0;
    bool _2720 = _2482 >= 0.0;
    bool _2722 = isnan(_2482);
    bool _2724 = _2720 || _2722;
    bool _2726 = isnan(0.0);
    bool _2728 = _2724 || _2726;
    float _2730 = _2664 * _2692;
    bool _2732 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2734 = isnan(_755);
    bool _2736 = _2732 || _2734;
    bool _2738 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2740 = _2736 || _2738;
    float _2742 = float(_2740);
    int _2744 = _2728 ? 0 : 1;
    bool _2746 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2748 = isnan(_755);
    bool _2750 = _2746 || _2748;
    bool _2752 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2754 = _2750 || _2752;
    float _2756 = float(_2754);
    float _2758 = -_2742;
    float _2760 = _2758 + 1.0;
    bool _2762 = _2482 > 0.0;
    float _2764 = _2742 * _2718;
    float _2766 = fma(_2458, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2532);
    float _2768 = fma(_2458, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2570);
    float _2770 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2772 = _755 + _2770;
    float _2774 = _2756 * _2760;
    float _2776 = -_2756;
    float _2778 = _2776 + 1.0;
    bool _2780 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2782 = isnan(_755);
    bool _2784 = _2780 || _2782;
    bool _2786 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2788 = _2784 || _2786;
    float _2790 = float(_2788);
    float _2792 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2794 = _755 + _2792;
    float _2796 = fma(_2576, _2772, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2798 = _2598 * _2778;
    bool _2800 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2802 = isnan(_755);
    bool _2804 = _2800 || _2802;
    bool _2806 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2808 = _2804 || _2806;
    float _2810 = float(_2808);
    float _2812 = fma(_2444, _2794, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2814 = -_2790;
    float _2816 = _2814 + 1.0;
    float _2818 = _2790 * _2618;
    float _2820 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2822 = _755 + _2820;
    float _2824 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2826 = _755 + _2824;
    float _2828 = _2810 * _2816;
    float _2830 = -_2810;
    float _2832 = _2830 + 1.0;
    float _2834 = fma(_2508, _2822, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2836 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2838 = _755 + _2836;
    float _2840 = _2586 * _2828;
    float _2842 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2844 = _755 + _2842;
    float _2846 = _2766 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2848 = fma(_2666, _2838, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2850 = fma(_2832, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2840);
    float _2852 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2854 = _2600 + _2852;
    uint _2856 = uint(int(uint(_2604) >> uint(2)));
    uint _2858 = uint(int(uint(int(_2856)) >> uint(2)));
    int _2860 = int(_2856) & 3;
    float _2862 = (*spvDescriptorSet0.vp_c9)._m0[int(_2858)][_2860];
    int _2864 = int(_2856) + 1;
    uint _2866 = uint(int(uint(_2864) >> uint(2)));
    int _2868 = _2864 & 3;
    float _2870 = (*spvDescriptorSet0.vp_c9)._m0[int(_2866)][_2868];
    float _2872 = fma(_2606, _2844, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2874 = fma(_2796, _2818, _2850);
    float _2876 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2878 = _2846 + _2876;
    float _2880 = _2854 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2882 = _2768 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _2884 = _1934 != 3;
    float _2886 = fma(_2812, _2798, _2874);
    float _2888 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2880);
    float _2890 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2892 = _2882 + _2890;
    int _2894 = ~_2744;
    int _2896 = _2894 + 1;
    int _2898 = _2896 + 1;
    float _2900 = _936 + _962;
    int _2902 = _2898;
    float _2904 = _2702;
    if (!_2762)
    {
        int _2906 = ~_2744;
        int _2908 = _2906 + 1;
        _2902 = _2908;
    }
    int _2910 = _2902;
    float _2912 = _936 + (-0.5);
    float _2914 = fma(_2892, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2888);
    float _2916 = fma(_2652, _2826, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2918 = _2604 + 8;
    uint _2920 = uint(int(uint(_2918) >> uint(2)));
    uint _2922 = uint(int(uint(int(_2920)) >> uint(2)));
    int _2924 = int(_2920) & 3;
    float _2926 = (*spvDescriptorSet0.vp_c9)._m0[int(_2922)][_2924];
    int _2928 = int(_2920) + 1;
    uint _2930 = uint(int(uint(_2928) >> uint(2)));
    int _2932 = _2928 & 3;
    float _2934 = (*spvDescriptorSet0.vp_c9)._m0[int(_2930)][_2932];
    bool _2936 = !_2884;
    int _2938 = _2936 ? 0 : (-1);
    float _2940 = fma(_2834, _2774, _2886);
    bool _2942 = _2914 >= 0.0;
    float _2944 = _944 + _962;
    float _2946 = _944 + (-0.5);
    float _2948 = fma(_2916, _2764, _2940);
    float _2950 = _1932 + (-0.5);
    float _2952 = _1746 + 0.5;
    float _2954 = fma(_2848, _2702, _2948);
    int _2956 = abs(_1998);
    float _2958 = -_2950;
    float _2960 = -_2206;
    float _2962 = fma(_2958, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2960);
    float _2964 = fma(_2460, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2966 = _2334 + 0.5;
    float _2968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_2942)
    {
        _2904 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2970 = _2904;
    float _2972 = _1940 + (-0.5);
    int _2974 = ~_2956;
    int _2976 = _2974 + 1;
    int _2978 = _2976 + 1;
    float _2980 = fma(_2966, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2172);
    float _2982 = fma(_2952, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2370);
    float _2984 = -_2972;
    float _2986 = -_2200;
    float _2988 = fma(_2984, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2986);
    if (_2942)
    {
        float _2990 = _2970 * 5.0;
        _2060 = as_type<int>(_2990);
    }
    int _2992 = _2060;
    float _2994 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2996 = int(_2994);
    float _2998 = fma(_2872, _2730, _2954);
    int _3000 = abs(_2066);
    float _3002 = -_2406;
    float _3004 = fma(_3002, _1746, _2982);
    if (_2942)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9532 = as_type<float>(_2992);
        out.gl_Position.z = _9532;
    }
    float _3006 = -_2182;
    float _3008 = _3006 + 1.0;
    float _3010 = fma(_2678, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2998);
    float _3012 = _2968 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3014 = _2978 * as_type<int>(_2870);
    float _3016 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3018 = fma(_3008, _1932, _2962);
    bool _3020 = !_2706;
    int _3022 = _3020 ? 0 : 1;
    out.m_72.x = _3010;
    int _3024 = ~_2688;
    int _3026 = _3024 + 1;
    int _3028 = _3026 + 1;
    float _3030 = _1704 + 0.5;
    float _3032 = _1464 + (-0.5);
    int _3034 = _3028 * as_type<int>(_2862);
    int _3036 = _3034 + _3014;
    int _3038 = ~_3000;
    int _3040 = _3038 + 1;
    int _3042 = _3040 + 1;
    float _3044 = fma(_3012, _3030, _2286);
    int _3046 = abs(_2938);
    float _3048 = _2854 * _2854;
    out.m_74.x = _3004;
    out.m_74.y = _3018;
    int _3050 = _3042 * as_type<int>(_2926);
    int _3052 = _3050 + _3036;
    float _3054 = float(uint(_2996));
    float _3056 = fma(_2878, _2878, _3048);
    int _3058 = abs(_2078);
    float _3060 = _3016 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3062 = ~_3046;
    int _3064 = _3062 + 1;
    int _3066 = _3064 + 1;
    if (_2942)
    {
        out.m_57.x = 0.0;
    }
    float _3068 = 1.0 / _3054;
    int _3070 = ~_3058;
    int _3072 = _3070 + 1;
    int _3074 = _3072 + 1;
    float _3076 = -_3060;
    float _3078 = -_2296;
    float _3080 = fma(_3076, _3032, _3078);
    int _3082 = _3066 * as_type<int>(_2934);
    int _3084 = _3082 + _3052;
    float _3086 = fma(_2892, _2892, _3056);
    int _3088 = abs(_2996);
    float _3090 = _557 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _3092 = _3084 * _3074;
    float _3094 = rsqrt(_3086);
    int _3096 = _1732 >> 31;
    int _3098 = _2632 * _3058;
    int _3100 = _3098 + _3092;
    float _3102 = float(uint(_3088));
    int _3104 = _3096 & 3;
    int _3106 = as_type<int>(_3068) + (-2);
    float _3108 = float(uint(_3100));
    float _3110 = 1.0 / _3102;
    int _3112 = _1732 + _3104;
    float _3114 = _3090 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3116 = _2084 >> 31;
    float _3118 = as_type<float>(_3106) * _3108;
    int _3120 = abs(_3022);
    float _3122 = _3114 * _3094;
    int _3124 = _3116 & 3;
    int _3126 = ~_2996;
    int _3128 = _3126 + 1;
    float _3130 = trunc(_3118);
    float _3132 = precise::max(_3130, 0.0);
    uint _3134 = uint(_3132);
    float _3136 = _2878 * _3122;
    int _3138 = _2084 + _3124;
    float _3140 = _2854 * _3122;
    float _3142 = float(_2910);
    float _3144 = -_3136;
    float _3146 = _2878 + _3144;
    int _3148 = _3112 >> 2;
    float _3150 = -_3140;
    float _3152 = _2854 + _3150;
    int _3154 = abs(_3100);
    float _3156 = in.m_76.x;
    float _3158 = in.m_76.y;
    float _3160 = in.m_76.z;
    int _3162 = _3148 << 4;
    int _3164 = _3162 + 368;
    float _3166 = _3152 * _3152;
    int _3168 = _3138 >> 2;
    float _3170 = fma(_3146, _3146, _3166);
    int _3172 = as_type<int>(_3110) + (-2);
    int _3174 = _3128 * int(_3134);
    int _3176 = _3174 + _3100;
    float _3178 = float(uint(_3154));
    uint _3180 = uint(int(uint(_3164) >> uint(2)));
    uint _3182 = uint(int(uint(int(_3180)) >> uint(2)));
    int _3184 = int(_3180) & 3;
    float _3186 = (*spvDescriptorSet0.vp_c9)._m0[int(_3182)][_3184];
    int _3188 = int(_3180) + 1;
    uint _3190 = uint(int(uint(_3188) >> uint(2)));
    int _3192 = _3188 & 3;
    float _3194 = (*spvDescriptorSet0.vp_c9)._m0[int(_3190)][_3192];
    float _3196 = float(_3120);
    int _3198 = _3168 << 4;
    int _3200 = _3198 + 800;
    float _3202 = as_type<float>(_3172) * _3178;
    float _3204 = float(uint(_3176));
    float _3206 = _3196 * _3142;
    float _3208 = -_2374;
    float _3210 = _3208 + 1.0;
    uint _3212 = uint(int(uint(_3200) >> uint(2)));
    uint _3214 = uint(int(uint(int(_3212)) >> uint(2)));
    int _3216 = int(_3212) & 3;
    float _3218 = (*spvDescriptorSet0.vp_c9)._m0[int(_3214)][_3216];
    int _3220 = int(_3212) + 1;
    uint _3222 = uint(int(uint(_3220) >> uint(2)));
    int _3224 = _3220 & 3;
    float _3226 = (*spvDescriptorSet0.vp_c9)._m0[int(_3222)][_3224];
    float _3228 = trunc(_3202);
    float _3230 = precise::max(_3228, 0.0);
    uint _3232 = uint(_3230);
    float _3234 = -_2390;
    float _3236 = _3234 + 1.0;
    float _3238 = fma(_1940, _3210, _2988);
    float _3240 = as_type<float>(_3106) * _3204;
    float _3242 = _2892 * _3122;
    float _3244 = -_2466;
    float _3246 = fma(_2334, _3244, _2980);
    float _3248 = -_3236;
    float _3250 = fma(_1704, _3248, _3044);
    float _3252 = fma(_1464, _2304, _3080);
    int _3254 = ~_3088;
    int _3256 = _3254 + 1;
    float _3258 = _3206 * (-2.0);
    float _3260 = trunc(_3240);
    float _3262 = precise::max(_3260, 0.0);
    uint _3264 = uint(_3262);
    int _3266 = abs(_2682);
    out.m_78.x = _3246;
    out.m_78.y = _3238;
    out.m_78.z = _3250;
    out.m_78.w = _3252;
    float _3268 = fma(_3258, _3156, _3156);
    int _3270 = ~_2160;
    int _3272 = _3270 + _2204;
    int _3274 = _3272 + 1;
    float _3276 = -_3242;
    float _3278 = _2892 + _3276;
    int _3280 = _3256 * int(_3232);
    int _3282 = _3280 + _3154;
    float _3284 = fma(_2912, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3268);
    int _3286 = abs(_1980);
    int _3288 = _3164 + 8;
    uint _3290 = uint(int(uint(_3288) >> uint(2)));
    uint _3292 = uint(int(uint(int(_3290)) >> uint(2)));
    int _3294 = int(_3290) & 3;
    float _3296 = (*spvDescriptorSet0.vp_c9)._m0[int(_3292)][_3294];
    int _3298 = int(_3290) + 1;
    uint _3300 = uint(int(uint(_3298) >> uint(2)));
    int _3302 = _3298 & 3;
    float _3304 = (*spvDescriptorSet0.vp_c9)._m0[int(_3300)][_3302];
    int _3306 = _837 * _3274;
    int _3308 = _3306 + _1600;
    int _3310 = abs(_2088);
    float _3312 = fma(_2964, _3258, _2964);
    float _3314 = fma(_3278, _3278, _3170);
    float _3316 = fma(_3312, _2540, _3284);
    int _3318 = _3200 + 8;
    uint _3320 = uint(int(uint(_3318) >> uint(2)));
    uint _3322 = uint(int(uint(int(_3320)) >> uint(2)));
    int _3324 = int(_3320) & 3;
    float _3326 = (*spvDescriptorSet0.vp_c9)._m0[int(_3322)][_3324];
    int _3328 = int(_3320) + 1;
    uint _3330 = uint(int(uint(_3328) >> uint(2)));
    int _3332 = _3328 & 3;
    float _3334 = (*spvDescriptorSet0.vp_c9)._m0[int(_3330)][_3332];
    float _3336 = float(uint(_3282));
    int _3338 = abs(_1824);
    int _3340 = int(_3134) + int(_3264);
    float _3342 = as_type<float>(_3172) * _3336;
    int _3344 = ~_2996;
    int _3346 = _3344 + 1;
    int _3348 = ~_3338;
    int _3350 = _3348 + 1;
    int _3352 = _3350 + 1;
    bool _3354 = !_2102;
    int _3356 = _3354 ? 0 : 1;
    float _3358 = trunc(_3342);
    float _3360 = precise::max(_3358, 0.0);
    uint _3362 = uint(_3360);
    int _3364 = abs(_2138);
    int _3366 = _3346 * _3340;
    int _3368 = _3366 + _3100;
    bool _3370 = _1764 != 3;
    int _3372 = _3352 * as_type<int>(_3194);
    int _3374 = ~_3364;
    int _3376 = _3374 + 1;
    int _3378 = _3376 + 1;
    bool _3380 = !_3370;
    int _3382 = _3380 ? 0 : (-1);
    bool _3384 = uint(_3368) >= uint(_2996);
    int _3386 = _3378 * as_type<int>(_3226);
    int _3388 = abs(_3356);
    int _3390 = ~_3266;
    int _3392 = _3390 + 1;
    int _3394 = _3392 + 1;
    int _3396 = ~_3088;
    int _3398 = _3396 + 1;
    int _3400 = int(_3232) + int(_3362);
    int _3402 = _3394 * as_type<int>(_3186);
    int _3404 = _3402 + _3372;
    bool _3406 = !_3384;
    int _3408 = _3406 ? 0 : (-1);
    bool _3410 = _2100 != 3;
    int _3412 = _3398 * _3400;
    int _3414 = _3412 + _3154;
    int _3416 = ~_3340;
    int _3418 = _3416 + _3408;
    int _3420 = _3418 + 1;
    int _3422 = abs(_1902);
    int _3424 = ~_3388;
    int _3426 = _3424 + 1;
    int _3428 = _3426 + 1;
    int _3430 = _2996 * _3420;
    int _3432 = _3430 + _3100;
    bool _3434 = !_3410;
    int _3436 = _3434 ? 0 : (-1);
    bool _3438 = uint(_3414) >= uint(_3088);
    int _3440 = _3428 * as_type<int>(_3218);
    int _3442 = _3440 + _3386;
    int _3444 = ~_3422;
    int _3446 = _3444 + 1;
    int _3448 = _3446 + 1;
    float _3450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3452 = ~_2516;
    int _3454 = _3452 + 1;
    int _3456 = _3454 + 1;
    int _3458 = _3100 ^ _2996;
    int _3460 = _3448 * as_type<int>(_3296);
    int _3462 = _3460 + _3404;
    bool _3464 = !_3438;
    int _3466 = _3464 ? 0 : (-1);
    int _3468 = _3456 * as_type<int>(_3326);
    int _3470 = _3468 + _3442;
    int _3472 = abs(_3382);
    float _3474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    uint _3476 = uint(int(uint(_3458) >> uint(31)));
    int _3478 = abs(_3436);
    int _3480 = ~_3466;
    int _3482 = _3400 + _3480;
    int _3484 = _3482 + 1;
    int _3486 = ~_3472;
    int _3488 = _3486 + 1;
    int _3490 = _3488 + 1;
    float _3492 = _3450 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3494 = ~int(_3476);
    int _3496 = _3494 + 1;
    int _3498 = ~_3478;
    int _3500 = _3498 + 1;
    int _3502 = _3500 + 1;
    int _3504 = _3490 * as_type<int>(_3304);
    int _3506 = _3504 + _3462;
    bool _3508 = _2996 == 0;
    int _3510 = _3484 ^ _3496;
    int _3512 = _3502 * as_type<int>(_3334);
    int _3514 = _3512 + _3470;
    int _3516 = ~_3310;
    int _3518 = _3516 + 1;
    int _3520 = _3518 + 1;
    bool _3522 = !_3508;
    int _3524 = _3522 ? _3432 : (-1);
    bool _3526 = _2996 == 0;
    int _3528 = _3514 * _3520;
    int _3530 = ~_3496;
    int _3532 = _3530 + _3510;
    int _3534 = _3532 + 1;
    int _3536 = ~_3286;
    int _3538 = _3536 + 1;
    int _3540 = _3538 + 1;
    bool _3542 = _799 == 0;
    bool _3544 = !_3526;
    int _3546 = _3544 ? _3534 : (-1);
    int _3548 = _3506 * _3540;
    bool _3550 = !_3542;
    int _3552 = _3550 ? _2512 : (-1);
    float _3554 = _1154 + (-0.5);
    float _3556 = float(_3524);
    float _3558 = float(_3546);
    float _3560 = _3474 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3562 = _3552 * _3286;
    int _3564 = _3562 + _3548;
    float _3566 = fma(_3492, _3556, _2398);
    bool _3568 = !_1540;
    int _3570 = _3568 ? _3308 : (-1);
    float _3572 = -_2400;
    float _3574 = fma(_3560, _3558, _3572);
    bool _3576 = !_2710;
    int _3578 = _3576 ? 0 : 1;
    float _3580 = _1124 + 0.5;
    int _3582 = _3570 * _3310;
    int _3584 = _3582 + _3528;
    int _3586 = abs(_3578);
    float _3588 = fma(_3492, _3580, _3566);
    float _3590 = -_3560;
    float _3592 = fma(_3590, _3554, _3574);
    float _3594 = float(_3564);
    float _3596 = -_2492;
    float _3598 = fma(_1124, _3596, _3588);
    float _3600 = float(_3584);
    float _3602 = fma(_1154, _2502, _3592);
    float _3604 = float(_2614);
    out.m_80.x = _3594;
    float _3606 = float(_3586);
    out.m_80.w = _3600;
    bool _3608 = !_2714;
    int _3610 = _3608 ? 0 : 1;
    float _3612 = _3606 * _3604;
    out.m_82.x = _3598;
    out.m_82.y = _3602;
    float _3614 = _3160;
    if (_2942)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3616 = -_3140;
    float _3618 = _2600 + _3616;
    float _3620 = -_3136;
    float _3622 = _2846 + _3620;
    float _3624 = -_3242;
    float _3626 = _2882 + _3624;
    int _3628 = abs(_3610);
    float _3630 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3632 = _3618 + _3630;
    float _3634 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3636 = _3622 + _3634;
    float _3638 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3640 = _3626 + _3638;
    float _3642 = _2944 + (-1.0);
    float _3644 = _3632 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3646 = _3612 * (-2.0);
    float _3648 = float(_2700);
    float _3650 = fma(_3642, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3652 = fma(_3636, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3644);
    float _3654 = float(_3628);
    float _3656 = fma(_3646, _3158, _3158);
    float _3658 = fma(_3650, _3646, _3650);
    float _3660 = fma(_3640, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3652);
    float _3662 = _2900 + (-1.0);
    float _3664 = fma(_2946, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3656);
    float _3666 = _3654 * _3648;
    float _3668 = _3316 * 0.15915493667125701904296875;
    bool _3670 = _3660 >= 0.0;
    float _3672 = fma(_3658, _2540, _3664);
    float _3674 = _3666 * (-2.0);
    float _3676 = fma(_3662, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3678 = sqrt(_3314);
    float _3680 = _3672 * 0.15915493667125701904296875;
    float _3682 = fma(_3674, _3160, _3160);
    float _3684 = _962 + (-0.5);
    float _3686 = fma(_3676, _3674, _3676);
    float _3688 = fma(_3684, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3682);
    float _3690 = _3668 * 6.283185482025146484375;
    float _3692 = sin(_3690);
    float _3694 = _3632;
    float _3696 = _3622;
    if (_3670)
    {
        _3614 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3698 = _3614;
    int _3700 = as_type<int>(_3698);
    if (_3670)
    {
        out.m_57.x = 0.0;
    }
    float _3702 = fma(_3686, _2540, _3688);
    if (_3670)
    {
        float _3704 = _3698 * 5.0;
        _3700 = as_type<int>(_3704);
    }
    int _3706 = _3700;
    float _3708 = _3702 * 0.15915493667125701904296875;
    float _3710 = _3668 * 6.283185482025146484375;
    float _3712 = cos(_3710);
    if (_3670)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10552 = as_type<float>(_3706);
        out.gl_Position.z = _10552;
    }
    float _3714 = _3680 * 6.283185482025146484375;
    float _3716 = sin(_3714);
    float _3718 = _3680 * 6.283185482025146484375;
    float _3720 = cos(_3718);
    if (_3670)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3722 = _3708 * 6.283185482025146484375;
    float _3724 = cos(_3722);
    float _3726 = _3094 * _3678;
    float _3728 = _555 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3730 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _215);
    float _3732 = _3692 * _3716;
    float _3734 = _3090 * _3726;
    float _3736 = _3726 * _3728;
    float _3738 = _3712 * _3716;
    float _3740 = _3708 * 6.283185482025146484375;
    float _3742 = sin(_3740);
    float _3744 = _3692 * _3720;
    float _3746 = _3730 * _3736;
    float _3748 = _3712 * _3720;
    float _3750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _205);
    float _3752 = _3712 * _3724;
    float _3754 = _3750 * _3734;
    float _3756 = _3692 * _3724;
    float _3758 = _3720 * _3724;
    float _3760 = _3752 * _3746;
    float _3762 = _3726 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3764 = _3762 * 0.5;
    float _3766 = _3716 * _3724;
    float _3768 = fma(_3742, _3748, _3732);
    float _3770 = -_3744;
    float _3772 = fma(_3742, _3738, _3770);
    float _3774 = -_3746;
    float _3776 = _3742 * _3774;
    float _3778 = -_3738;
    float _3780 = fma(_3742, _3744, _3778);
    float _3782 = fma(_3768, _3754, _3760);
    float _3784 = _3756 * _3746;
    float _3786 = fma(_3758, _3754, _3776);
    float _3788 = fma(_3742, _3732, _3748);
    float _3790 = fma(_3772, _3764, _3782);
    float _3792 = fma(_3780, _3754, _3784);
    float _3794 = fma(_3766, _3764, _3786);
    float _3796 = _3790 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3798 = _3790 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3800 = fma(_3788, _3764, _3792);
    float _3802 = _3790 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3804 = fma(_3794, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3796);
    float _3806 = fma(_3794, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3798);
    float _3808 = fma(_3794, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3802);
    float _3810 = fma(_3800, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3804);
    float _3812 = fma(_3800, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3806);
    float _3814 = fma(_3800, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3808);
    float _3816 = _3810 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3818 = _3812 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3820 = _2846 + _3816;
    float _3822 = _2882 + _3818;
    float _3824 = _3814 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3826 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3828 = _3820 + _3826;
    float _3830 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3832 = _3822 + _3830;
    float _3834 = _2600 + _3824;
    float _3836 = _3828 * _3828;
    float _3838 = _3832 * _3832;
    float _3840 = _3836 + _3838;
    float _3842 = sqrt(_3840);
    bool _3844 = _3842 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3846 = _3800;
    float _3848 = _3820;
    float _3850 = _3822;
    float _3852 = _3836;
    float _3854 = _3838;
    if (!_3844)
    {
        _3846 = _3834;
    }
    float _3856 = _3846;
    bool _3858 = !_3844;
    float _3860 = _3856;
    if (!_3858)
    {
        float _3862 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3864 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3866 = _3842 + _3864;
        float _3868 = rsqrt(_3840);
        float _3870 = _3866 * _3862;
        float _3872 = _3834 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3874 = _3870 * 0.15915493667125701904296875;
        float _3876 = _3874 * 6.283185482025146484375;
        float _3878 = sin(_3876);
        float _3880 = _3874 * 6.283185482025146484375;
        float _3882 = cos(_3880);
        float _3884 = fma(_3878, _3872, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3886 = _3868 * _3884;
        float _3888 = _3882 + (-1.0);
        float _3890 = fma(_3828, _3886, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3892 = fma(_3832, _3886, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3894 = _3888 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3896 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3898 = _3890 + _3896;
        float _3900 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3902 = _3892 + _3900;
        float _3904 = fma(_3834, _3882, _3894);
        float _3906 = _3898 * _3898;
        float _3908 = _3902 * _3902;
        _3848 = _3890;
        _3850 = _3892;
        _3860 = _3904;
        _3852 = _3906;
        _3854 = _3908;
    }
    float _3910 = _3848;
    float _3912 = _3850;
    float _3914 = _3860;
    float _3916 = _3852;
    float _3918 = _3854;
    float _3920 = fma(_3910, 6.2500002968590706586837768554688e-05, 0.5);
    float _3922 = fma(_3912, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _10889 = float2(_3920, _3922);
    float3 _3926 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_10889, float2(0.0), isnan(_10889)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_10889, float2(0.0), isnan(_10889)), level(0.0)).xyz;
    float _3928 = _3926.x;
    float _3930 = _3926.y;
    float _3932 = _3926.z;
    float _3934 = _3768 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3936 = _3768 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3938 = _3768 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3940 = _3752 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3942 = _3752 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3944 = _3752 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3946 = _215 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3948 = fma(_3758, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3934);
    float _3950 = fma(_3758, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3936);
    float _3952 = fma(_3758, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3938);
    float _3954 = -_3742;
    float _3956 = fma(_3954, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3940);
    float _3958 = -_3742;
    float _3960 = fma(_3958, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3942);
    float _3962 = -_3742;
    float _3964 = fma(_3962, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3944);
    float _3966 = fma(_3946, _3946, 1.0);
    float _3968 = _3772 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3970 = _3772 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3972 = _3772 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3974 = fma(_3756, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3956);
    float _3976 = fma(_3766, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3968);
    float _3978 = rsqrt(_3966);
    float _3980 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3982 = _3914 + _3980;
    float _3984 = fma(_3766, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3970);
    float _3986 = fma(_3766, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3972);
    float _3988 = fma(_3756, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3960);
    float _3990 = fma(_3982, _3982, _3916);
    float _3992 = fma(_3756, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3964);
    float _3994 = fma(_3788, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3976);
    float _3996 = fma(_3788, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3984);
    float _3998 = _3990 + _3918;
    float _4000 = fma(_3788, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3986);
    float _4002 = fma(_3780, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3948);
    float _4004 = fma(_3780, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3950);
    float _4006 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4008 = _3946 * _3974;
    float _4010 = _3946 * _3988;
    float _4012 = _3946 * _3978;
    float _4014 = fma(_3780, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3952);
    float _4016 = _3946 * _3992;
    float _4018 = sqrt(_3998);
    float _4020 = -_3994;
    float _4022 = _4012 * _4020;
    float _4024 = -_3996;
    float _4026 = _4012 * _4024;
    float _4028 = -_4000;
    float _4030 = _4012 * _4028;
    float _4032 = fma(_4006, _4002, _4008);
    float _4034 = fma(_4006, _4004, _4010);
    float _4036 = fma(_4006, _4014, _4016);
    float _4038 = fma(_3978, _3974, _4022);
    float _4040 = fma(_3978, _3988, _4026);
    float _4042 = fma(_3978, _3992, _4030);
    float _4044 = _3994 + _4032;
    float _4046 = _3996 + _4034;
    float _4048 = _4000 + _4036;
    out.m_84.x = _4002;
    out.m_84.y = _4004;
    out.m_84.z = _4014;
    bool _4050 = _4018 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4052 = isnan(_4018);
    bool _4054 = _4050 || _4052;
    bool _4056 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4058 = _4054 || _4056;
    out.m_86.x = _4038;
    out.m_86.y = _4040;
    out.m_86.z = _4042;
    out.m_88.x = _4044;
    out.m_88.y = _4046;
    out.m_88.z = _4048;
    float _4060 = _4032;
    if (!_4058)
    {
        _4060 = 1.0;
    }
    float _4062 = _4060;
    out.m_90.x = _3928;
    out.m_90.y = _3930;
    out.m_90.z = _3932;
    bool _4064 = !_4058;
    float _4066 = _4062;
    if (!_4064)
    {
        bool _4068 = _4018 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4070 = isnan(_4018);
        bool _4072 = _4068 || _4070;
        bool _4074 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4076 = _4072 || _4074;
        if (!_4076)
        {
            float _4078 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4080 = _4018 + _4078;
            float _4082 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4084 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4082;
            float _4086 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4088 = _4086 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4090 = 1.0 / _4084;
            float _4092 = _4080 * _4090;
            float _4094 = fma(_4092, _4088, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4066 = _4094;
            _4096 = true;
        }
        else
        {
            bool _4098 = _4018 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4100 = isnan(_4018);
            bool _4102 = _4098 || _4100;
            bool _4104 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4106 = _4102 || _4104;
            if (!_4106)
            {
                float _4108 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4110 = _4018 + _4108;
                float _4112 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4114 = _4112 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4116 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4118 = _4116 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4120 = 1.0 / _4114;
                float _4122 = _4110 * _4120;
                float _4124 = fma(_4122, _4118, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4066 = _4124;
                _4096 = true;
            }
            else
            {
                _4066 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4096 = false;
    float _4126 = _4066;
    float _4128 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4130 = _3914 + _4128;
    float _4132 = _3618 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4134 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4136 = _3910 + _4134;
    float _4138 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4140 = _3912 + _4138;
    float _4142 = fma(_4130, _4126, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4144 = fma(_3622, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4132);
    float _4146 = fma(_4136, _4126, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4148 = fma(_4140, _4126, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4150 = -_2600;
    float _4152 = _4150 + _4142;
    float _4154 = fma(_3626, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4144);
    float _4156 = -_2846;
    float _4158 = _4156 + _4146;
    float _4160 = _3618 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4162 = _4152 * _4152;
    float _4164 = _4154 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4166 = -_2882;
    float _4168 = _4166 + _4148;
    float _4170 = fma(_3622, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4160);
    float _4172 = fma(_4158, _4158, _4162);
    float _4174 = 1.0 / _4164;
    float _4176 = fma(_3626, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4170);
    float _4178 = fma(_4168, _4168, _4172);
    float _4180 = _4176 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4182 = sqrt(_4178);
    float _4184 = _4180 + _4164;
    float _4186 = _4184 * _4174;
    float _4188 = _4186 * 0.5;
    float _4190 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4192 = fma(_4188, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4190);
    bool _4194 = _4182 > 0.0;
    float _4196 = 1.0 / _4192;
    bool _4198 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4200 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4202 = _4198 || _4200;
    bool _4204 = isnan(0.5);
    bool _4206 = _4202 || _4204;
    bool _4208 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4210 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4212 = _4208 || _4210;
    bool _4214 = isnan(0.5);
    bool _4216 = _4212 || _4214;
    float _4218 = _4188;
    float _4220 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4222 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4224 = _4152;
    if (!_4194)
    {
        _4218 = _4146;
    }
    float _4226 = _4218;
    float _4228 = _4226;
    float _4230 = _4226;
    if (!_4194)
    {
        _4220 = _4142;
    }
    float _4232 = _4220;
    float _4234 = _4232;
    if (!_4194)
    {
        _4222 = _4148;
    }
    float _4236 = _4222;
    bool _4238 = !_4194;
    float _4240 = _4236;
    float _4242 = _4196;
    if (!_4238)
    {
        float _4244 = _219 * _219;
        float _4246 = fma(_217, _217, _4244);
        float _4248 = fma(_221, _221, _4246);
        float _4250 = rsqrt(_4178);
        float _4252 = sqrt(_4248);
        float _4254 = _4158 * _4250;
        float _4256 = _4152 * _4250;
        float _4258 = _4168 * _4250;
        bool _4260 = _4252 > 0.0;
        float _4262 = _4252;
        float _4264 = _4250;
        _4224 = _4256;
        if (!_4260)
        {
            _4228 = _4146;
        }
        float _4266 = _4228;
        _4230 = _4266;
        if (!_4260)
        {
            _4262 = _4142;
        }
        float _4268 = _4262;
        _4234 = _4268;
        if (!_4260)
        {
            _4264 = _4148;
        }
        float _4270 = _4264;
        bool _4272 = !_4260;
        _4240 = _4270;
        if (!_4272)
        {
            float _4274 = rsqrt(_4248);
            float _4276 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4278 = _219 * _4274;
            float _4280 = _217 * _4274;
            float _4282 = _221 * _4274;
            float _4284 = _4256 * _4278;
            float _4286 = fma(_4254, _4280, _4284);
            float _4288 = _4276 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4290 = fma(_4258, _4282, _4286);
            float _4292 = _4290 * _4288;
            float _4294 = fma(_217, _4292, _4146);
            float _4296 = fma(_219, _4292, _4142);
            float _4298 = fma(_221, _4292, _4148);
            _4230 = _4294;
            _4234 = _4296;
            _4240 = _4298;
        }
    }
    float _4300 = _4230;
    float _4302 = _4234;
    float _4304 = _4240;
    float _4306 = _4224;
    float _4308 = -_3136;
    float _4310 = _4308 + _4300;
    float _4312 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4314 = _4196 * _4312;
    float _4316 = -_3140;
    float _4318 = _4316 + _4302;
    float _4320 = -_3242;
    float _4322 = _4320 + _4304;
    float _4324 = _4318;
    float _4326 = _4322;
    float _4328 = _4306;
    if (_4206)
    {
        _225 = 1.0;
    }
    float _4330 = _225;
    float _4332 = _4330;
    if (_4216)
    {
        _4242 = _4310;
    }
    float _4334 = _4242;
    float _4336 = _4334;
    if (!_4216)
    {
        float _4338 = _3632 * _3632;
        float _4340 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4342 = -_2882;
        float _4344 = _4342 + _4304;
        float _4346 = -_2846;
        float _4348 = _4346 + _4300;
        float _4350 = fma(_3636, _3636, _4338);
        float _4352 = -_2600;
        float _4354 = _4352 + _4302;
        float _4356 = fma(_3640, _3640, _4350);
        float _4358 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4360 = sqrt(_4356);
        float _4362 = 1.0 / _3726;
        float _4364 = _4358 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4366 = precise::min(_4360, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4368 = _4366 * _4340;
        float _4370 = _4368 * _4362;
        float _4372 = _4364 * _4370;
        float _4374 = _4344 * _4370;
        float _4376 = fma(_4354, _4372, _3618);
        float _4378 = fma(_4348, _4372, _3622);
        float _4380 = fma(_4364, _4374, _3626);
        _4324 = _4376;
        _4336 = _4378;
        _4326 = _4380;
    }
    float _4382 = _4324;
    float _4384 = _4336;
    float _4386 = _4326;
    if (!_4206)
    {
        float _4388 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4390 = _4388 * 0.15915493667125701904296875;
        float _4392 = _4390 * 6.283185482025146484375;
        float _4394 = cos(_4392);
        float _4396 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4398 = _4396 * 0.15915493667125701904296875;
        float _4400 = _4390 * 6.283185482025146484375;
        float _4402 = sin(_4400);
        float _4404 = 1.0 / _4394;
        float _4406 = _4398 * 6.283185482025146484375;
        float _4408 = cos(_4406);
        float _4410 = _4402 * _4404;
        float _4412 = _4398 * 6.283185482025146484375;
        float _4414 = sin(_4412);
        float _4416 = _4408 * _4410;
        float _4418 = 1.0 / _4416;
        float _4420 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4422 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4420;
        float _4424 = 1.0 / _4422;
        float _4426 = _4414 * _4418;
        float _4428 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4430 = fma(_4314, _4426, _4428);
        float _4432 = _4430 * _4424;
        float _4434 = precise::clamp(_4432, 0.0, 1.0);
        _3694 = _4398;
        _4332 = _4434;
    }
    float _4436 = _3694;
    float _4438 = _4332;
    float _4440 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4442 = _4382 + _4440;
    float _4444 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4446 = _4384 + _4444;
    float _4448 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4450 = _4386 + _4448;
    float _4452 = _4442 * _4442;
    float _4454 = fma(_4446, _4446, _4452);
    float _4456 = fma(_3622, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4458 = fma(_4450, _4450, _4454);
    float _4460 = rsqrt(_4458);
    float _4462 = sqrt(_4458);
    float _4464 = _4460 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4466 = _4446 * _4464;
    float _4468 = _4450 * _4464;
    float _4470 = _4466 * _4466;
    float _4472 = _4468 * _4468;
    float _4474 = _4470 + _4472;
    float _4476 = sqrt(_4474);
    bool _4478 = _4476 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4480 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4482 = _4476 + _4480;
    float _4484 = _4460;
    float _4486 = _4482;
    float _4488 = _4442;
    if (_4478)
    {
        float _4490 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4484 = _4490;
    }
    float _4492 = _4484;
    float _4494 = _4492;
    if (_4478)
    {
        float _4496 = _4482 * _4492;
        _4486 = _4496;
    }
    float _4498 = _4486;
    if (_4478)
    {
        float _4500 = rsqrt(_4474);
        _4494 = _4500;
    }
    float _4502 = _4494;
    float _4504 = _4502;
    if (_4478)
    {
        float _4506 = _4498 * 0.15915493667125701904296875;
        _227 = _4506;
    }
    float _4508 = _227;
    float _4510 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4512 = _4450;
    if (_4478)
    {
        float _4514 = _4508 * 6.283185482025146484375;
        float _4516 = sin(_4514);
        _4512 = _4516;
    }
    float _4518 = _4512;
    float _4520 = precise::max(0.0, _4510);
    float _4522 = _4436;
    float _4524 = _4520;
    if (_4478)
    {
        float _4526 = _4508 * 6.283185482025146484375;
        float _4528 = cos(_4526);
        _4522 = _4528;
    }
    float _4530 = _4522;
    float _4532 = -_4464;
    float _4534 = -_4520;
    float _4536 = fma(_4442, _4532, _4534);
    if (_4478)
    {
        float _4538 = _4536 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4488 = _4538;
    }
    float _4540 = _4488;
    float _4542 = floor(_4456);
    float _4544 = _4518;
    float _4546 = _4540;
    if (_4478)
    {
        float _4548 = fma(_4518, _4540, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4544 = _4548;
    }
    float _4550 = _4544;
    float _4552 = _4550;
    if (!_4478)
    {
        _4546 = _4536;
    }
    float _4554 = _4546;
    float _4556 = _4554;
    if (_4478)
    {
        float _4558 = _4502 * _4550;
        _4328 = _4558;
    }
    float _4560 = _4328;
    if (!_4478)
    {
        _4504 = _4466;
    }
    float _4562 = _4504;
    float _4564 = _4562;
    if (_4478)
    {
        float _4566 = _4530 + (-1.0);
        _4524 = _4566;
    }
    float _4568 = _4524;
    float _4570 = _4568;
    if (_4478)
    {
        float _4572 = _4466 * _4560;
        _4564 = _4572;
    }
    float _4574 = _4564;
    if (!_4478)
    {
        _4552 = _4470;
    }
    float _4576 = _4552;
    float _4578 = _4576;
    if (_4478)
    {
        float _4580 = _4568 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3696 = _4580;
    }
    float _4582 = _3696;
    float _4584 = _4582;
    if (!_4478)
    {
        _4570 = _4468;
    }
    float _4586 = _4570;
    float _4588 = _4586;
    if (_4478)
    {
        float _4590 = _4468 * _4560;
        _4588 = _4590;
    }
    float _4592 = _4588;
    if (_4478)
    {
        float _4594 = _4574 * _4574;
        _4578 = _4594;
    }
    float _4596 = _4578;
    if (_4478)
    {
        float _4598 = fma(_4536, _4530, _4582);
        _4556 = _4598;
    }
    float _4600 = _4556;
    if (!_4478)
    {
        _4584 = _4472;
    }
    float _4602 = _4584;
    float _4604 = _4602;
    if (_4478)
    {
        float _4606 = _4592 * _4592;
        _4604 = _4606;
    }
    float _4608 = _4604;
    float _4610 = fma(_4600, _4600, _4596);
    float _4612 = _4382 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4614 = -_4542;
    float _4616 = _4456 + _4614;
    float _4618 = _4610 + _4608;
    float _4620 = fma(_4384, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4612);
    float _4622 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4624 = fma(_4462, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4622);
    float _4626 = precise::clamp(_4624, 0.0, 1.0);
    float _4628 = rsqrt(_4618);
    float _4630 = fma(_4386, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4620);
    float _4632 = -_4626;
    float _4634 = _4632 + 1.0;
    float _4636 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4638 = fma(_3626, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4640 = _4630 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4642 = _4382 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4644 = abs(_4634);
    float _4646 = log2(_4644);
    float _4648 = _4640 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4650 = _4382 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4652 = -_4648;
    float _4654 = fma(_4652, _4636, 1.0);
    float _4656 = _4382 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4658 = fma(_4384, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4650);
    float _4660 = _4628 * _4574;
    float _4662 = _4628 * _4600;
    float _4664 = fma(_4384, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4656);
    float _4666 = fma(_4386, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4658);
    float _4668 = _4660 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4670 = _4628 * _4592;
    float _4672 = fma(_4386, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4664);
    float _4674 = _4666 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4676 = -_4668;
    float _4678 = fma(_4662, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4676);
    float _4680 = fma(_4384, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4642);
    float _4682 = _4672 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4684 = _4674 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4686 = -_4670;
    float _4688 = fma(_4686, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4678);
    float _4690 = floor(_4638);
    float _4692 = fma(_4386, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4680);
    float _4694 = fma(_4682, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4684);
    float _4696 = fma(_4688, -0.5, 0.5);
    float _4698 = _4646 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4700 = _4692 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4702 = fma(_4640, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4694);
    float _4704 = fma(_4688, 0.5, 0.5);
    float _4706 = exp2(_4698);
    float _4708 = _4662 + 1.0;
    float _4710 = fma(_4700, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4702);
    float _4712 = _4674 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4714 = fma(_4704, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4716 = fma(_4682, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4712);
    float _4718 = sqrt(_4696);
    float _4720 = _4674 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4722 = -_4690;
    float _4724 = _4638 + _4722;
    float _4726 = fma(_4704, _4714, -0.212114393711090087890625);
    float _4728 = fma(_4640, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4716);
    float _4730 = fma(_4682, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4720);
    float _4732 = fma(_4704, _4726, 1.570728778839111328125);
    float _4734 = log2(_4654);
    float _4736 = fma(_4640, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4730);
    float _4738 = fma(_4700, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4728);
    float _4740 = -_4662;
    float _4742 = fma(_4706, _4708, _4740);
    float _4744 = fma(_4700, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4736);
    float _4746 = fma(_4742, 0.5, 0.5);
    float _4748 = 1.0 / _4710;
    float _4750 = _4718 * 0.636619746685028076171875;
    float _4752 = -_4732;
    float _4754 = fma(_4750, _4752, 1.0);
    float2 _12287 = float2(_4616, _4724);
    float _4756 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12287, float2(0.0), isnan(_12287)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12287, float2(0.0), isnan(_12287)), level(0.0)).x;
    float _4758 = _4734 * 0.693147182464599609375;
    float _4760 = _4738 * _4748;
    float _4762 = _4744 * _4748;
    float _4764 = _4758 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4766 = fma(_4760, 0.5, 0.5);
    float _4768 = fma(_4762, -0.5, 0.5);
    float3 _12313 = float3(_4766, _4768, _4764);
    float _4770 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12313, float3(0.0), isnan(_12313)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12313, float3(0.0), isnan(_12313)), level(0.0)).x;
    float3 _12324 = float3(_4766, _4768, _4764);
    float4 _4773 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12324, float3(0.0), isnan(_12324)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12324, float3(0.0), isnan(_12324)), level(0.0)).xyzw;
    float _4775 = _4773.x;
    float _4777 = _4773.y;
    float _4779 = _4773.z;
    float _4781 = _4773.w;
    float2 _12340 = float2(_4754, _4746);
    float3 _4783 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12340, float2(0.0), isnan(_12340)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12340, float2(0.0), isnan(_12340)), level(0.0)).xyz;
    float _4785 = _4783.x;
    float _4787 = _4783.y;
    float _4789 = _4783.z;
    float _4791 = abs(_4314);
    float _4793 = log2(_4791);
    float _4795 = _4674 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _4797 = _4462 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4799 = isnan(_4462);
    bool _4801 = _4797 || _4799;
    bool _4803 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4805 = _4801 || _4803;
    float _4807 = fma(_4682, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4795);
    float _4809 = fma(_4640, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4807);
    float _4811 = _4738 + _4710;
    float _4813 = fma(_4700, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4809);
    float _4815 = _4793 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4817 = in.m_92.x;
    float _4819 = _4811 * 0.5;
    out.gl_Position.x = _4738;
    out.gl_Position.y = _4744;
    out.gl_Position.z = _4813;
    out.gl_Position.w = _4710;
    float _4821 = exp2(_4815);
    float _4823 = _4738;
    float _4825 = _4813;
    float _4827 = _4710;
    float _4829 = _4744;
    if (!_4805)
    {
        _4823 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4831 = _4823;
    float _4833 = fma(_4821, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4835 = precise::clamp(_4833, 0.0, 1.0);
    float _4837 = _4813 + _4710;
    float _4839 = _4831;
    float _4841 = _4831;
    if (!_4805)
    {
        _4825 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4843 = _4825;
    float _4845 = fma(_4835, -2.0, 3.0);
    float _4847 = _4835 * _4835;
    float _4849 = _4837 * 0.5;
    float _4851 = _4847 * _4845;
    float _4853 = _4646 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _4855 = _4314 <= 8000.0;
    bool _4857 = isnan(_4314);
    bool _4859 = _4855 || _4857;
    bool _4861 = isnan(8000.0);
    bool _4863 = _4859 || _4861;
    float _4865 = float(_4863);
    float _4867 = _4710 * 0.5;
    float _4869 = -_4851;
    float _4871 = _4869 + 1.0;
    float _4873 = exp2(_4853);
    float _4875 = fma(_4871, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4851);
    float _4877 = fma(_4744, -0.5, _4867);
    float _4879 = _4865 * _4875;
    float _4881 = _4843;
    float _4883 = _4843;
    if (!_4805)
    {
        _4827 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4885 = _4827;
    out.m_94.x = _4819;
    out.m_94.y = _4877;
    out.m_94.z = _4849;
    out.m_94.w = _4710;
    float _4887 = _4879 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4889 = _4885;
    float _4891 = _4885;
    if (!_4805)
    {
        _4829 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4893 = _4829;
    float _4895 = -_4873;
    float _4897 = _4895 + 1.0;
    float _4899 = _4897 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4901 = -_4756;
    float _4903 = _4901 + 1.0;
    float _4905 = _4903 * _4887;
    float _4907 = precise::clamp(_4905, 0.0, 1.0);
    float _4909 = -_4907;
    float _4911 = fma(_4909, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4913 = _4911 * _4817;
    float _4915 = _4913 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4917 = _4899 * _4770;
    float _4919 = -_4899;
    float _4921 = _4919 + 1.0;
    out.m_96.x = _4915;
    float _4923 = _4781 * _4917;
    float _4925 = _4789 * _4917;
    float _4927 = _4781 * _4921;
    float _4929 = fma(_4785, _4923, _4775);
    float _4931 = fma(_4787, _4923, _4777);
    float _4933 = fma(_4781, _4925, _4779);
    float _4935 = _4438 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4937 = _4923;
    float _4939 = _4779;
    float _4941 = _4893;
    float _4943 = _4893;
    if (!_4805)
    {
        _4937 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4945 = _4937;
    float _4947 = _4945;
    float _4949 = _4945;
    if (!_4805)
    {
        _4939 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4951 = _4939;
    out.m_98.x = _4929;
    out.m_98.y = _4931;
    out.m_98.z = _4933;
    out.m_98.w = _4927;
    bool _4953 = !_4805;
    float _4955 = _4951;
    float _4957 = _4951;
    if (!_4953)
    {
        bool _4959 = _4462 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4961 = isnan(_4462);
        bool _4963 = _4959 || _4961;
        bool _4965 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4967 = _4963 || _4965;
        if (!_4967)
        {
            float _4969 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4971 = _4462 + _4969;
            float _4973 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4975 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4973;
            float _4977 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4979 = _4977 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4981 = 1.0 / _4975;
            float _4983 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4985 = _4983 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4987 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4989 = _4987 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4991 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4993 = _4991 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4995 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4997 = _4995 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4999 = _4971 * _4981;
            float _5001 = precise::clamp(_4999, 0.0, 1.0);
            float _5003 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5005 = _5003 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5007 = fma(_5001, _4979, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5009 = fma(_5001, _5005, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5011 = fma(_5001, _4985, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5013 = fma(_5001, _4989, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5015 = fma(_5001, _4993, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5017 = fma(_5001, _4997, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4957 = _5011;
            _4943 = _5015;
            _4949 = _5007;
            _4883 = _5013;
            _4891 = _5009;
            _4841 = _5017;
            _5019 = true;
        }
        else
        {
            bool _5021 = _4462 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5023 = isnan(_4462);
            bool _5025 = _5021 || _5023;
            bool _5027 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5029 = _5025 || _5027;
            if (!_5029)
            {
                _4947 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5031 = _4947;
            _4949 = _5031;
            if (!_5029)
            {
                _4955 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5033 = _4955;
            _4957 = _5033;
            if (!_5029)
            {
                _4889 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5035 = _4889;
            _4891 = _5035;
            if (!_5029)
            {
                _4881 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5037 = _4881;
            _4883 = _5037;
            if (!_5029)
            {
                _4941 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5039 = _4941;
            _4943 = _5039;
            if (!_5029)
            {
                _4839 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5041 = _4839;
            bool _5043 = !_5029;
            _4841 = _5041;
            if (!_5043)
            {
                bool _5045 = _4462 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5047 = isnan(_4462);
                bool _5049 = _5045 || _5047;
                bool _5051 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5053 = _5049 || _5051;
                if (!_5053)
                {
                    float _5055 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5057 = _4462 + _5055;
                    float _5059 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5061 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5059;
                    float _5063 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5065 = _5063 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5067 = 1.0 / _5061;
                    float _5069 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5071 = _5069 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5073 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5075 = _5073 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5077 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5079 = _5077 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5081 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5083 = _5081 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5085 = _5057 * _5067;
                    float _5087 = precise::clamp(_5085, 0.0, 1.0);
                    float _5089 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5091 = _5089 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5093 = fma(_5087, _5065, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5095 = fma(_5087, _5091, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5097 = fma(_5087, _5071, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5099 = fma(_5087, _5075, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5101 = fma(_5087, _5079, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5103 = fma(_5087, _5083, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4957 = _5097;
                    _4943 = _5101;
                    _4949 = _5093;
                    _4883 = _5099;
                    _4891 = _5095;
                    _4841 = _5103;
                    _5019 = true;
                }
                else
                {
                    _4957 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4943 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4949 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4883 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4891 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4841 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5019 = false;
    float _5105 = _4957;
    float _5107 = _4943;
    float _5109 = _4949;
    float _5111 = _4883;
    float _5113 = _4891;
    float _5115 = _4841;
    float _5117 = _4935 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5119 = fma(_4046, -0.5, 0.5);
    float _5121 = precise::clamp(_5119, 0.0, 1.0);
    float _5123 = -_5105;
    float _5125 = _5123 + _5107;
    float _5127 = -_5109;
    float _5129 = _5127 + _5111;
    out.m_57.x = _5117;
    float _5131 = fma(_5121, _5125, _5105);
    float _5133 = -_5113;
    float _5135 = _5133 + _5115;
    float _5137 = fma(_5121, _5129, _5109);
    float _5139 = _5131 * 0.586610972881317138671875;
    bool _5141 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5143 = fma(_5121, _5135, _5113);
    out.m_100.x = 0.0;
    float _5145 = fma(_5137, 0.298911988735198974609375, _5139);
    bool _5147 = _4438 > 0.0;
    bool _5149 = isnan(_4438);
    bool _5151 = _5147 || _5149;
    bool _5153 = isnan(0.0);
    bool _5155 = _5151 || _5153;
    float _5157 = fma(_5143, 0.114477999508380889892578125, _5145);
    float _5159 = -_5157;
    float _5161 = _5137 + _5159;
    float _5163 = -_5157;
    float _5165 = _5131 + _5163;
    float _5167 = -_5157;
    float _5169 = _5143 + _5167;
    float _5171 = fma(_5161, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5157);
    float _5173 = fma(_5165, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5157);
    float _5175 = fma(_5169, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5157);
    bool _5177 = !_5141;
    if (!_5177)
    {
        float _5179 = -_4382;
        float _5181 = _5179 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5183 = -_4384;
        float _5185 = _5183 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5187 = -_4386;
        float _5189 = _5187 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5191 = _5181 * _5181;
        float _5193 = fma(_5185, _5185, _5191);
        float _5195 = fma(_5189, _5189, _5193);
        float _5197 = sqrt(_5195);
        float _5199 = rsqrt(_5195);
        float _5201 = -_5197;
        float _5203 = _5201 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5205 = _5203 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5207 = precise::clamp(_5205, 0.0, 1.0);
        float _5209 = _5185 * _5199;
        float _5211 = _5181 * _5199;
        float _5213 = abs(_5207);
        float _5215 = log2(_5213);
        float _5217 = _5189 * _5199;
        float _5219 = _5209 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5221 = _4046 * _5211;
        float _5223 = -_5211;
        float _5225 = -_5219;
        float _5227 = fma(_5223, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5225);
        float _5229 = fma(_4044, _5209, _5221);
        float _5231 = -_5217;
        float _5233 = fma(_5231, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5227);
        float _5235 = fma(_4048, _5217, _5229);
        float _5237 = precise::clamp(_5235, 0.0, 1.0);
        float _5239 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5241 = _5233 + _5239;
        float _5243 = _5215 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5245 = _5241 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5247 = precise::clamp(_5245, 0.0, 1.0);
        float _5249 = exp2(_5243);
        float _5251 = _5249 * _5247;
        float _5253 = _5237 * _5251;
        float _5255 = _5253 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5257 = _5253 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5259 = _5253 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _5255;
        out.m_100.y = _5257;
        out.m_100.z = _5259;
    }
    out.m_102.x = _5171;
    out.m_102.y = _5173;
    out.m_102.z = _5175;
    if (_5155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_57.x = 0.0;
    float _5261 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5261;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5019 = false;
    bool _4096 = false;
    bool _579 = false;
    bool _435 = false;
    bool _247 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_50.w;
    float _118 = in.m_52.w;
    float _120 = trunc(_116);
    int _123 = int(_120);
    float _125 = -_118;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.y = _127;
    bool _131 = _123 >= 1;
    float _133 = 0.0;
    float _135 = _118;
    float _137 = _127;
    if (!_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _133;
    if (!_131)
    {
        out.m_57.x = 0.0;
    }
    int _141 = 0;
    if (!_131)
    {
        float _143 = _139 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    if (!_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5328 = as_type<float>(_145);
        out.gl_Position.z = _5328;
    }
    if (!_131)
    {
        return out;
    }
    bool _147 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_118);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = float(_123);
    bool _159 = _127 >= _157;
    bool _161 = !_155;
    bool _163 = _159 || _161;
    float _165 = 1.0 / _157;
    if (_163)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _135;
    if (_163)
    {
        out.m_57.x = 0.0;
    }
    float _169 = _127 * _165;
    int _171 = 0;
    float _173 = _169;
    if (_163)
    {
        float _175 = _167 * 5.0;
        _171 = as_type<int>(_175);
    }
    int _177 = _171;
    out.m_55.x = _169;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5391 = as_type<float>(_177);
        out.gl_Position.z = _5391;
    }
    if (_163)
    {
        return out;
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = in.m_62.x;
    float _183 = in.m_62.y;
    float _185 = in.m_62.z;
    int _187 = as_type<int>(_179) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_179) & 2;
    bool _193 = _191 != 0;
    bool _195 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _197 = _183 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _199 = _183 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _201 = _183 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _203 = !_189;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].x, _197);
    float _209 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].x, _199);
    float _211 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].x, _201);
    bool _213 = !_193;
    float _215 = _213 ? (-0.5) : 0.5;
    float _217 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[4].z, _207);
    float _219 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[5].z, _209);
    float _221 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[6].z, _211);
    bool _223 = !_195;
    float _225 = _217;
    float _227 = _221;
    float _245;
    if (!_223)
    {
        float _229 = in.m_64.x;
        float _231 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _233 = _229 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _237 = _235 * _231;
        float _239 = floor(_237);
        float _241 = -_239;
        float _243 = _237 + _241;
        _245 = _243;
        _247 = true;
    }
    else
    {
        _245 = _169;
    }
    _247 = false;
    float _249 = _245;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _253 = _249 + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = _249 + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _261 = _249 + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _269 = _267 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _271;
    bool _275 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _277 = isnan(_249);
    bool _279 = _275 || _277;
    bool _281 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _283 = _279 || _281;
    float _285 = float(_283);
    float _287 = 1.0 / _265;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _291 = 1.0 / _273;
    float _293 = 1.0 / _269;
    float _295 = _253 * _287;
    bool _297 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _299 = isnan(_249);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -_285;
    float _311 = _309 + 1.0;
    float _313 = _307 * _311;
    float _315 = _257 * _291;
    bool _317 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _319 = isnan(_249);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = -_307;
    float _331 = _329 + 1.0;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _337 = _327 * _331;
    float _339 = -_327;
    float _341 = _339 + 1.0;
    float _343 = _261 * _293;
    bool _345 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _347 = isnan(_249);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _369 = fma(_359, _295, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _371 = _355 * _341;
    float _373 = fma(_363, _295, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _375 = -_355;
    float _377 = _375 + 1.0;
    float _379 = _369 * _371;
    float _381 = _373 * _371;
    float _383 = fma(_335, _343, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _385 = fma(_367, _343, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _387 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].x, _379);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _393;
    float _397 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].y, _381);
    float _399 = fma(_383, _337, _387);
    float _401 = fma(_391, _315, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _403 = fma(_395, _315, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _405 = fma(_385, _337, _397);
    float _407 = fma(_401, _313, _399);
    float _409 = fma(_403, _313, _405);
    float _411 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[146].x, _407);
    float _413 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[146].y, _409);
    bool _415 = !_289;
    float _433;
    if (!_415)
    {
        float _417 = in.m_64.x;
        float _419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _421 = _417 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _423 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _425 = _423 * _419;
        float _427 = floor(_425);
        float _429 = -_427;
        float _431 = _425 + _429;
        _433 = _431;
        _435 = true;
    }
    else
    {
        _433 = _169;
    }
    _435 = false;
    float _437 = _433;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _441 = _437 + _439;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _447 = _437 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _449 = isnan(_437);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _463 = _437 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _465 = isnan(_437);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _475;
    bool _479 = _437 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _481 = isnan(_437);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = 1.0 / _445;
    float _493 = -_457;
    float _495 = _493 + 1.0;
    bool _497 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _499 = 1.0 / _461;
    float _501 = _477 * _491;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _507 = -_489;
    float _509 = _507 + 1.0;
    float _511 = fma(_501, _441, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _513 = _473 * _495;
    float _515 = -_473;
    float _517 = _515 + 1.0;
    float _519 = _457 * _509;
    float _521 = _505 * _499;
    float _523 = _511 * _513;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _527 = _437 + _525;
    float _529 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[115].x, _523);
    float _531 = fma(_521, _527, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _535 = fma(_531, _519, _529);
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _539 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _541 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[117].x, _535);
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _545 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _547 = in.m_66.x;
    float _549 = in.m_66.y;
    float _551 = _541 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _553 = _543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_68.x = _539;
    out.m_68.y = _545;
    out.m_68.z = _553;
    out.m_68.w = _551;
    float _555 = _413 * _549;
    float _557 = _411 * _547;
    bool _559 = !_497;
    float _577;
    if (!_559)
    {
        float _561 = in.m_64.x;
        float _563 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _565 = _561 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _567 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[11].w, _127);
        float _569 = _567 * _563;
        float _571 = floor(_569);
        float _573 = -_571;
        float _575 = _569 + _573;
        _577 = _575;
        _579 = true;
    }
    else
    {
        _577 = _169;
    }
    _579 = false;
    float _581 = _577;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _585 = _581 + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _591 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _593 = isnan(_581);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _611 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _613 = isnan(_581);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = 1.0 / _589;
    float _625 = -_601;
    float _627 = _625 + 1.0;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _629;
    bool _633 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _635 = isnan(_581);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = _621 * _627;
    float _647 = -_621;
    float _649 = _647 + 1.0;
    bool _651 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _653 = 1.0 / _605;
    float _655 = _643 * _649;
    float _657 = -_643;
    float _659 = _657 + 1.0;
    float _661 = 1.0 / _609;
    float _663 = _631 * _623;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _669 = fma(_663, _585, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _671 = _667 * _653;
    bool _673 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _675 = isnan(_581);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _685;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _691 = _581 + _689;
    float _693 = _669 * _655;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _697 = _581 + _695;
    float _699 = -_683;
    float _701 = _699 + 1.0;
    float _703 = fma(_671, _691, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _705 = _687 * _661;
    float _707 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[131].x, _693);
    float _709 = _601 * _701;
    float _711 = fma(_705, _697, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _713 = fma(_703, _645, _707);
    float _715 = fma(_711, _709, _713);
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _723 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[134].x, _715);
    float _725 = _719 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _727 = _717 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _729 = _721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _731 = _723 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_70.x = _725;
    out.m_70.y = _727;
    out.m_70.z = _729;
    out.m_70.w = _731;
    bool _733 = !_651;
    int _735 = as_type<int>(_661);
    int _737 = as_type<int>(_729);
    if (!_733)
    {
        float _739 = in.m_64.x;
        float _741 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _743 = _739 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _745 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _747 = _745 * _741;
        float _749 = floor(_747);
        float _751 = -_749;
        float _753 = _747 + _751;
        _173 = _753;
    }
    float _755 = _173;
    float _757 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _759 = int(_757);
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _763 = _761 != 0;
    float _765 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _767 = int(_765);
    float _769 = float(_759);
    float _771 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _773 = int(_771);
    float _775 = 0.0;
    if (_763)
    {
        _775 = 1.0;
    }
    float _777 = _775;
    float _779 = 0.0;
    float _781 = _777;
    if (_763)
    {
        _779 = 1.0;
    }
    float _783 = _779;
    float _785 = _783;
    if (_763)
    {
        _735 = 0;
    }
    int _787 = _735;
    float _789 = float(_767);
    float _791 = 1.0 / _769;
    int _793 = _787;
    if (_763)
    {
        _737 = 0;
    }
    int _795 = _737;
    float _797 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _799 = int(_797);
    float _801 = float(uint(_773));
    float _803 = 1.0 / _789;
    float _805 = _791 * _127;
    float _807 = 1.0 / _801;
    float _809 = float(uint(_799));
    int _811 = ~_799;
    int _813 = _811 + 1;
    float _815 = trunc(_805);
    int _817 = int(_815);
    float _819 = _803 * _127;
    float _821 = _803;
    float _823 = _769;
    int _825 = _795;
    if (_763)
    {
        float _827 = in.m_64.x;
        float _829 = in.m_64.y;
        _821 = _827;
        _823 = _829;
    }
    float _831 = _821;
    float _833 = _823;
    float _835 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _837 = int(_835);
    int _839 = as_type<int>(_807) + (-2);
    float _841 = 1.0 / _809;
    float _843 = float(uint(_817));
    float _845 = as_type<float>(_839) * _843;
    float _847 = trunc(_819);
    int _849 = int(_847);
    float _851 = float(uint(_837));
    float _853 = 0.0;
    float _855 = _831;
    float _857 = _833;
    float _859 = as_type<float>(_839);
    if (_763)
    {
        _853 = _831;
    }
    float _861 = _853;
    float _863 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _865 = int(_863);
    int _867 = as_type<int>(_841) + (-2);
    float _869 = _841;
    float _871 = _861;
    if (_763)
    {
        _869 = _833;
    }
    float _873 = _869;
    float _875 = 1.0 / _851;
    float _877 = float(uint(_849));
    float _879 = as_type<float>(_867) * _877;
    float _881 = trunc(_845);
    float _883 = precise::max(_881, 0.0);
    uint _886 = uint(_883);
    float _888 = float(_865);
    float _890 = 1.0 / _888;
    float _892 = trunc(_879);
    float _894 = precise::max(_892, 0.0);
    uint _896 = uint(_894);
    float _898 = _888;
    float _900 = _879;
    float _902 = _873;
    if (_763)
    {
        _898 = _861;
    }
    float _904 = _898;
    float _906 = _904;
    if (_763)
    {
        _900 = _861;
    }
    float _908 = _900;
    float _910 = _908;
    if (!_763)
    {
        float _912 = in.m_64.x;
        float _914 = in.m_64.y;
        float _916 = in.m_64.z;
        float _918 = _912 * 3.1415927410125732421875;
        float _920 = _918 * 0.15915493667125701904296875;
        float _922 = _914 * 3.1415927410125732421875;
        float _924 = _922 * 0.15915493667125701904296875;
        float _926 = _920 * 6.283185482025146484375;
        float _928 = sin(_926);
        float _930 = _924 * 6.283185482025146484375;
        float _932 = sin(_930);
        _781 = 7.345489978790283203125;
        _855 = _912;
        _785 = 5.839270114898681640625;
        _906 = _916;
        _871 = _914;
        _857 = _914;
        _902 = _932;
        _793 = 1;
        _825 = 2;
        _910 = _928;
    }
    float _934 = _781;
    float _936 = _855;
    float _938 = _785;
    float _940 = _906;
    float _942 = _871;
    float _944 = _857;
    float _946 = _902;
    int _948 = _793;
    int _950 = _825;
    float _952 = _910;
    int _954 = _813 * int(_896);
    int _956 = _954 + _849;
    float _958 = _934 * _936;
    float _960 = _938 * _940;
    float _962 = in.m_64.z;
    float _964 = in.m_64.w;
    float _966 = _934 * _942;
    float _968 = float(uint(_956));
    float _970 = floor(_958);
    float _972 = _890 * _127;
    float _974 = _936 * 2.0;
    float _976 = as_type<float>(_867) * _968;
    int _978 = ~_773;
    int _980 = _978 + 1;
    float _982 = float(_849);
    float _984 = trunc(_976);
    float _986 = precise::max(_984, 0.0);
    uint _988 = uint(_986);
    float _990 = float(_799);
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _994 = _992 != 0;
    int _996 = _980 * int(_886);
    int _998 = _996 + _817;
    bool _1000 = _944 > 0.5;
    float _1002 = floor(_960);
    float _1004 = -_970;
    float _1006 = _958 + _1004;
    int _1008 = ~_773;
    int _1010 = _1008 + 1;
    float _1012 = float(uint(_998));
    bool _1014 = _964 > 0.5;
    float _1016 = trunc(_972);
    int _1018 = int(_1016);
    float _1020 = as_type<float>(_839) * _1012;
    int _1022 = int(_896) + int(_988);
    int _1024 = as_type<int>(_875) + (-2);
    bool _1026 = _962 > 0.5;
    float _1028 = trunc(_1020);
    float _1030 = precise::max(_1028, 0.0);
    uint _1032 = uint(_1030);
    float _1034 = -_1002;
    float _1036 = _960 + _1034;
    int _1038 = ~_799;
    int _1040 = _1038 + 1;
    bool _1042 = _982 >= _990;
    bool _1044 = isnan(_982);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan(_990);
    bool _1050 = _1046 || _1048;
    float _1052 = float(_1050);
    int _1054 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1056 = _1054 != 0;
    int _1058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1060 = _1058 != 0;
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1064 = _1062 != 0;
    int _1066 = _1040 * _1022;
    int _1068 = _1066 + _849;
    float _1070 = float(uint(_1018));
    float _1072 = floor(_966);
    float _1074 = -_205;
    int _1076 = _1000 ? as_type<int>(_1074) : as_type<int>(_205);
    float _1078 = as_type<float>(_1024) * _1070;
    float _1080 = -_215;
    int _1082 = _1026 ? as_type<int>(_1080) : as_type<int>(_215);
    int _1084 = int(_886) + int(_1032);
    float _1086 = trunc(_1078);
    float _1088 = precise::max(_1086, 0.0);
    uint _1090 = uint(_1088);
    float _1092 = _1006 * _990;
    int _1094 = int(_1014);
    int _1096 = _1026 ? 2 : 0;
    int _1098 = _1094 | _1096;
    int _1100 = _994 ? 4 : 0;
    int _1102 = _1098 | _1100;
    int _1104 = _1056 ? 8 : 0;
    int _1106 = _1102 | _1104;
    int _1108 = _1060 ? 16 : 0;
    int _1110 = _1106 | _1108;
    int _1112 = _1064 ? 32 : 0;
    int _1114 = _1110 | _1112;
    int _1116 = _1000 ? 64 : 0;
    int _1118 = _1114 | _1116;
    int _1120 = _1118 & 64;
    bool _1122 = !_1060;
    float _1124 = _1122 ? _205 : as_type<float>(_1076);
    float _1126 = float(_773);
    float _1128 = trunc(_1052);
    int _1130 = int(_1128);
    float _1132 = float(_817);
    float _1134 = _1036 * _1126;
    int _1136 = ~_837;
    int _1138 = _1136 + 1;
    int _1140 = _1010 * _1084;
    int _1142 = _1140 + _817;
    bool _1144 = !_994;
    int _1146 = _1144 ? 0 : 1;
    float _1148 = trunc(_1092);
    int _1150 = int(_1148);
    bool _1152 = !_1064;
    float _1154 = _1152 ? _215 : as_type<float>(_1082);
    int _1156 = _1138 * int(_1090);
    int _1158 = _1156 + _1018;
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1162 = _1160 != 0;
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1166 = _1164 != 0;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1170 = _1168 != 0;
    bool _1172 = uint(_1068) >= uint(_799);
    bool _1174 = _1132 >= _1126;
    bool _1176 = isnan(_1132);
    bool _1178 = _1174 || _1176;
    bool _1180 = isnan(_1126);
    bool _1182 = _1178 || _1180;
    float _1184 = float(_1182);
    float _1186 = trunc(_1134);
    int _1188 = int(_1186);
    bool _1190 = !_1166;
    int _1192 = _1190 ? 0 : 1;
    bool _1194 = !_1162;
    int _1196 = _1194 ? 0 : 1;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1200 = _1198 != 0;
    bool _1202 = uint(_1142) >= uint(_773);
    float _1204 = trunc(_1184);
    int _1206 = int(_1204);
    bool _1208 = !_1172;
    int _1210 = _1208 ? 0 : (-1);
    bool _1212 = !_1170;
    int _1214 = _1212 ? 0 : 1;
    bool _1216 = !_1200;
    int _1218 = _1216 ? 0 : 1;
    bool _1220 = !_1202;
    int _1222 = _1220 ? 0 : (-1);
    float _1224 = floor(_974);
    float _1226 = -_1072;
    float _1228 = _966 + _1226;
    float _1230 = float(uint(_1158));
    int _1232 = abs(_1146);
    int _1234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1236 = _1234 != 0;
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1240 = _1238 != 0;
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1244 = _1242 != 0;
    float _1246 = as_type<float>(_1024) * _1230;
    int _1248 = ~_1022;
    int _1250 = _1248 + _1210;
    int _1252 = _1250 + 1;
    int _1254 = _1150 * _1232;
    int _1256 = _1254 + _849;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1260 = _1258 != 0;
    int _1262 = ~_1084;
    int _1264 = _1262 + _1222;
    int _1266 = _1264 + 1;
    int _1268 = _799 * _1252;
    int _1270 = _1268 + _849;
    bool _1272 = !_1240;
    int _1274 = _1272 ? 0 : 1;
    float _1276 = trunc(_1246);
    float _1278 = precise::max(_1276, 0.0);
    uint _1280 = uint(_1278);
    bool _1282 = !_1260;
    int _1284 = _1282 ? 0 : 1;
    int _1286 = _773 * _1266;
    int _1288 = _1286 + _817;
    bool _1290 = _1120 != 0;
    float _1292 = _165 * _127;
    bool _1294 = _799 == 0;
    bool _1296 = !_1236;
    int _1298 = _1296 ? 0 : 1;
    float _1300 = _990 * _1292;
    bool _1302 = _773 == 0;
    float _1304 = _1126 * _1292;
    int _1306 = ~_1130;
    int _1308 = _1306 + 1;
    int _1310 = _1308 + 1;
    bool _1312 = !_1294;
    int _1314 = _1312 ? _1270 : (-1);
    float _1316 = trunc(_1300);
    int _1318 = int(_1316);
    int _1320 = ~_1206;
    int _1322 = _1320 + 1;
    int _1324 = _1322 + 1;
    bool _1326 = !_1302;
    int _1328 = _1326 ? _1288 : (-1);
    int _1330 = _1314 * _1310;
    int _1332 = _799 + (-1);
    int _1334 = abs(_1192);
    int _1336 = _1328 * _1324;
    int _1338 = _773 + (-1);
    int _1340 = _1130 * _1332;
    int _1342 = _1340 + _1330;
    int _1344 = abs(_1274);
    float _1346 = trunc(_1304);
    int _1348 = int(_1346);
    int _1350 = abs(_1284);
    int _1352 = _1206 * _1338;
    int _1354 = _1352 + _1336;
    int _1356 = _1342 * _1334;
    int _1358 = abs(_1196);
    int _1360 = _1188 * _1350;
    int _1362 = _1360 + _817;
    int _1364 = ~_837;
    int _1366 = _1364 + 1;
    int _1368 = _1354 * _1344;
    int _1370 = abs(_1214);
    int _1372 = _1318 * _1358;
    int _1374 = _1372 + _1356;
    int _1376 = abs(_1218);
    int _1378 = _1256 * _1370;
    int _1380 = _1378 + _1374;
    int _1382 = int(_1090) + int(_1280);
    int _1384 = abs(_1298);
    int _1386 = _1366 * _1382;
    int _1388 = _1386 + _1018;
    float _1390 = -_215;
    int _1392 = _1014 ? as_type<int>(_1390) : as_type<int>(_215);
    int _1394 = _1150 * _1376;
    int _1396 = _1394 + _1380;
    float _1398 = -_205;
    int _1400 = _1026 ? as_type<int>(_1398) : as_type<int>(_205);
    int _1402 = _1348 * _1384;
    int _1404 = _1402 + _1368;
    bool _1406 = uint(_1388) >= uint(_837);
    float _1408 = float(uint(_1396));
    float _1410 = float(_837);
    float _1412 = float(_1018);
    float _1414 = as_type<float>(_867) * _1408;
    int _1416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1418 = _1416 != 0;
    float _1420 = _1410 * _1292;
    bool _1422 = !_1244;
    int _1424 = _1422 ? 0 : 1;
    float _1426 = trunc(_1414);
    float _1428 = precise::max(_1426, 0.0);
    uint _1430 = uint(_1428);
    bool _1432 = _1412 >= _1410;
    bool _1434 = isnan(_1412);
    bool _1436 = _1432 || _1434;
    bool _1438 = isnan(_1410);
    bool _1440 = _1436 || _1438;
    float _1442 = float(_1440);
    float _1444 = _1228 * _1410;
    int _1446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1448 = _1446 != 0;
    float _1450 = _944 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1452 = !_1418;
    int _1454 = _1452 ? 0 : 1;
    int _1456 = abs(_1424);
    float _1458 = trunc(_1442);
    int _1460 = int(_1458);
    bool _1462 = !_1056;
    float _1464 = _1462 ? _215 : as_type<float>(_1392);
    bool _1466 = !_1448;
    int _1468 = _1466 ? 0 : 1;
    int _1470 = abs(_1454);
    float _1472 = trunc(_1420);
    int _1474 = int(_1472);
    bool _1476 = !_1406;
    int _1478 = _1476 ? 0 : (-1);
    int _1480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1482 = _1480 != 0;
    int _1484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1486 = _1484 != 0;
    int _1488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1490 = _1488 != 0;
    int _1492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1494 = _1492 != 0;
    int _1496 = _1362 * _1456;
    int _1498 = _1496 + _1404;
    int _1500 = ~_1382;
    int _1502 = _1500 + _1478;
    int _1504 = _1502 + 1;
    bool _1506 = !_1486;
    int _1508 = _1506 ? 0 : 1;
    int _1510 = _1188 * _1470;
    int _1512 = _1510 + _1498;
    int _1514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1516 = _1514 != 0;
    int _1518 = _837 * _1504;
    int _1520 = _1518 + _1018;
    int _1522 = ~_799;
    int _1524 = _1522 + 1;
    float _1526 = trunc(_1444);
    int _1528 = int(_1526);
    float _1530 = float(uint(_1512));
    bool _1532 = !_1482;
    int _1534 = _1532 ? 0 : 1;
    int _1536 = _1524 * int(_1430);
    int _1538 = _1536 + _1396;
    bool _1540 = _837 == 0;
    float _1542 = as_type<float>(_839) * _1530;
    int _1544 = ~_1460;
    int _1546 = _1544 + 1;
    int _1548 = _1546 + 1;
    float _1550 = float(uint(_1538));
    float _1552 = _1530;
    float _1554 = as_type<float>(_948);
    if (_1516)
    {
        float _1556 = in.m_64.w;
        _1552 = _1556;
    }
    float _1558 = _1552;
    bool _1560 = !_1540;
    int _1562 = _1560 ? _1520 : (-1);
    float _1564 = trunc(_1542);
    float _1566 = precise::max(_1564, 0.0);
    uint _1568 = uint(_1566);
    int _1570 = abs(_1508);
    float _1572 = as_type<float>(_867) * _1550;
    int _1574 = abs(_1468);
    int _1576 = _1562 * _1548;
    int _1578 = _837 + (-1);
    int _1580 = abs(_1534);
    float _1582 = trunc(_1572);
    float _1584 = precise::max(_1582, 0.0);
    uint _1586 = uint(_1584);
    int _1588 = _1460 * _1578;
    int _1590 = _1588 + _1576;
    int _1592 = _1590 * _1570;
    int _1594 = ~_773;
    int _1596 = _1594 + 1;
    int _1598 = _1528 * _1574;
    int _1600 = _1598 + _1018;
    bool _1602 = _799 == 0;
    int _1604 = _1474 * _1580;
    int _1606 = _1604 + _1592;
    bool _1608 = !_1490;
    int _1610 = _1608 ? 0 : 1;
    int _1612 = _1596 * int(_1568);
    int _1614 = _1612 + _1512;
    int _1616 = ~_799;
    int _1618 = _1616 + 1;
    float _1620 = as_type<float>(_1574);
    if (_1516)
    {
        float _1622 = _1558 * 3.1415927410125732421875;
        _1620 = _1622;
    }
    float _1624 = _1620;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1628 = _1626 != 0;
    int _1630 = int(_1430) + int(_1586);
    float _1632 = _1624;
    if (_1516)
    {
        float _1634 = _1624 * 0.15915493667125701904296875;
        _1632 = _1634;
    }
    float _1636 = _1632;
    int _1638 = abs(_1610);
    bool _1640 = !_1494;
    int _1642 = _1640 ? 0 : 1;
    int _1644 = _1618 * _1630;
    int _1646 = _1644 + _1396;
    float _1648 = float(uint(_1614));
    float _1650 = _1636;
    if (_1516)
    {
        float _1652 = _1636 * 6.283185482025146484375;
        float _1654 = sin(_1652);
        _1650 = _1654;
    }
    float _1656 = _1650;
    int _1658 = abs(_1642);
    int _1660 = _1600 * _1638;
    int _1662 = _1660 + _1606;
    bool _1664 = uint(_1646) >= uint(_799);
    float _1666 = as_type<float>(_839) * _1648;
    float _1668 = as_type<float>(_1570);
    if (_1628)
    {
        float _1670 = in.m_64.x;
        _1668 = _1670;
    }
    float _1672 = _1668;
    float _1674 = float(uint(_1256));
    bool _1676 = !_1664;
    int _1678 = _1676 ? 0 : (-1);
    float _1680 = trunc(_1666);
    float _1682 = precise::max(_1680, 0.0);
    uint _1684 = uint(_1682);
    int _1686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1688 = _1686 != 0;
    float _1690 = as_type<float>(_867) * _1674;
    int _1692 = ~_1630;
    int _1694 = _1692 + _1678;
    int _1696 = _1694 + 1;
    int _1698 = _1528 * _1658;
    int _1700 = _1698 + _1662;
    bool _1702 = !_1688;
    float _1704 = _1702 ? _205 : as_type<float>(_1400);
    bool _1706 = _1688;
    if (_1516)
    {
        bool _1708 = _1656 > 0.5;
        _1706 = _1708;
    }
    bool _1710 = _1706;
    int _1712 = _799 * _1696;
    int _1714 = _1712 + _1396;
    float _1716 = trunc(_1690);
    float _1718 = precise::max(_1716, 0.0);
    uint _1720 = uint(_1718);
    float _1722 = float(uint(_1700));
    float _1724 = 0.0;
    float _1726 = _1722;
    if (!_1516)
    {
        _1724 = _205;
    }
    float _1728 = _1724;
    bool _1730 = !_1602;
    int _1732 = _1730 ? _1714 : (-1);
    float _1734 = as_type<float>(_1024) * _1722;
    int _1736 = ~_799;
    int _1738 = _1736 + 1;
    float _1740 = _1728;
    if (_1516)
    {
        float _1742 = -_205;
        float _1744 = _1710 ? _1742 : _205;
        _1740 = _1744;
    }
    float _1746 = _1740;
    float _1748 = trunc(_1734);
    float _1750 = precise::max(_1748, 0.0);
    uint _1752 = uint(_1750);
    int _1754 = int(_1568) + int(_1684);
    if (_1628)
    {
        float _1756 = _1672 * 3.1415927410125732421875;
        _1726 = _1756;
    }
    float _1758 = _1726;
    int _1760 = _1732 & 3;
    bool _1762 = _1760 != 0;
    int _1764 = _1732 & 3;
    bool _1766 = _1764 != 0;
    float _1768 = _1758;
    if (_1628)
    {
        float _1770 = _1758 * 0.15915493667125701904296875;
        _1768 = _1770;
    }
    float _1772 = _1768;
    int _1774 = _1762 ? 0 : 1;
    bool _1776 = uint(_1764) > 1u;
    int _1778 = _1738 * int(_1720);
    int _1780 = _1778 + _1256;
    float _1782 = float(uint(_1362));
    float _1784 = _1772;
    if (_1628)
    {
        float _1786 = _1772 * 6.283185482025146484375;
        float _1788 = sin(_1786);
        _1784 = _1788;
    }
    float _1790 = _1784;
    int _1792 = ~_773;
    int _1794 = _1792 + 1;
    float _1796 = float(uint(_1780));
    float _1798 = as_type<float>(_839) * _1782;
    int _1800 = ~_837;
    int _1802 = _1800 + 1;
    float _1804 = trunc(_1798);
    float _1806 = precise::max(_1804, 0.0);
    uint _1808 = uint(_1806);
    int _1810 = ~_1774;
    int _1812 = _1810 + 1;
    int _1814 = _1812 + 1;
    float _1816 = as_type<float>(_867) * _1796;
    int _1818 = _1814;
    if (!_1776)
    {
        int _1820 = ~_1774;
        int _1822 = _1820 + 1;
        _1818 = _1822;
    }
    int _1824 = _1818;
    int _1826 = _1794 * _1754;
    int _1828 = _1826 + _1512;
    float _1830 = -_215;
    int _1832 = _1290 ? as_type<int>(_1830) : as_type<int>(_215);
    int _1834 = _1802 * int(_1752);
    int _1836 = _1834 + _1700;
    bool _1838 = uint(_1764) >= 2u;
    float _1840 = trunc(_1816);
    float _1842 = precise::max(_1840, 0.0);
    uint _1844 = uint(_1842);
    bool _1846 = uint(_1828) >= uint(_773);
    float _1848 = float(uint(_1836));
    int _1850 = _1838 ? 0 : 1;
    bool _1852 = _1764 != 3;
    float _1854 = as_type<float>(_1024) * _1848;
    int _1856 = ~_773;
    int _1858 = _1856 + 1;
    bool _1860 = !_1846;
    int _1862 = _1860 ? 0 : (-1);
    float _1864 = trunc(_1854);
    float _1866 = precise::max(_1864, 0.0);
    uint _1868 = uint(_1866);
    int _1870 = ~_1850;
    int _1872 = _1870 + 1;
    int _1874 = _1872 + 1;
    int _1876 = _1858 * int(_1808);
    int _1878 = _1876 + _1362;
    int _1880 = ~_1754;
    int _1882 = _1880 + _1862;
    int _1884 = _1882 + 1;
    float _1886 = float(uint(_1878));
    int _1888 = _773 * _1884;
    int _1890 = _1888 + _1512;
    int _1892 = _1874;
    bool _1894 = _1852;
    float _1896 = as_type<float>(_1808);
    if (_1852)
    {
        int _1898 = ~_1850;
        int _1900 = _1898 + 1;
        _1892 = _1900;
    }
    int _1902 = _1892;
    if (_1628)
    {
        bool _1904 = _1790 > 0.5;
        _1894 = _1904;
    }
    bool _1906 = _1894;
    float _1908 = as_type<float>(_839) * _1886;
    bool _1910 = !_1302;
    int _1912 = _1910 ? _1890 : (-1);
    if (!_1628)
    {
        _859 = _215;
    }
    float _1914 = _859;
    int _1916 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1918 = _1916 != 0;
    float _1920 = trunc(_1908);
    float _1922 = precise::max(_1920, 0.0);
    uint _1924 = uint(_1922);
    float _1926 = _1914;
    if (_1628)
    {
        float _1928 = -_215;
        float _1930 = _1906 ? _1928 : _215;
        _1926 = _1930;
    }
    float _1932 = _1926;
    int _1934 = _1912 & 3;
    bool _1936 = _1934 != 0;
    bool _1938 = !_1918;
    float _1940 = _1938 ? _215 : as_type<float>(_1832);
    int _1942 = int(_1720) + int(_1844);
    bool _1944 = uint(_1934) > 1u;
    int _1946 = int(_1752) + int(_1868);
    float _1948 = _936 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1950 = ~_837;
    int _1952 = _1950 + 1;
    int _1954 = _1912 & 3;
    bool _1956 = _1954 != 0;
    int _1958 = ~_799;
    int _1960 = _1958 + 1;
    int _1962 = _1952 * _1946;
    int _1964 = _1962 + _1700;
    int _1966 = _1956 ? 0 : 1;
    int _1968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1970 = _1968 != 0;
    int _1972 = _1960 * _1942;
    int _1974 = _1972 + _1256;
    float _1976 = float(uint(_1600));
    bool _1978 = !_1970;
    int _1980 = _1978 ? 0 : 1;
    bool _1982 = uint(_1964) >= uint(_837);
    float _1984 = as_type<float>(_1024) * _1976;
    int _1986 = ~_1966;
    int _1988 = _1986 + 1;
    int _1990 = _1988 + 1;
    int _1992 = _1990;
    if (!_1944)
    {
        int _1994 = ~_1966;
        int _1996 = _1994 + 1;
        _1992 = _1996;
    }
    int _1998 = _1992;
    float _2000 = trunc(_1984);
    float _2002 = precise::max(_2000, 0.0);
    uint _2004 = uint(_2002);
    bool _2006 = uint(_1974) >= uint(_799);
    bool _2008 = !_1982;
    int _2010 = _2008 ? 0 : (-1);
    bool _2012 = _1934 != 3;
    bool _2014 = !_2006;
    int _2016 = _2014 ? 0 : (-1);
    bool _2018 = uint(_1934) >= 2u;
    int _2020 = ~_1946;
    int _2022 = _2020 + _2010;
    int _2024 = _2022 + 1;
    int _2026 = ~_773;
    int _2028 = _2026 + 1;
    int _2030 = int(_1808) + int(_1924);
    int _2032 = _837 * _2024;
    int _2034 = _2032 + _1700;
    int _2036 = ~_837;
    int _2038 = _2036 + 1;
    int _2040 = _2018 ? 0 : 1;
    int _2042 = _2028 * _2030;
    int _2044 = _2042 + _1362;
    int _2046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2048 = _2046 != 0;
    int _2050 = ~_2040;
    int _2052 = _2050 + 1;
    int _2054 = _2052 + 1;
    int _2056 = _2054;
    float _2058 = as_type<float>(_2038);
    int _2060 = _1998;
    if (_2012)
    {
        int _2062 = ~_2040;
        int _2064 = _2062 + 1;
        _2056 = _2064;
    }
    int _2066 = _2056;
    int _2068 = _2038 * int(_2004);
    int _2070 = _2068 + _1600;
    int _2072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2074 = _2072 != 0;
    bool _2076 = !_2048;
    int _2078 = _2076 ? 0 : 1;
    bool _2080 = uint(_2044) >= uint(_773);
    bool _2082 = !_1540;
    int _2084 = _2082 ? _2034 : (-1);
    bool _2086 = !_2074;
    int _2088 = _2086 ? 0 : 1;
    bool _2090 = !_2080;
    int _2092 = _2090 ? 0 : (-1);
    int _2094 = _2084 & 3;
    bool _2096 = _2094 != 0;
    float _2098 = float(uint(_2070));
    int _2100 = _2084 & 3;
    bool _2102 = _2100 != 0;
    int _2104 = _2096 ? 0 : 1;
    float _2106 = as_type<float>(_1024) * _2098;
    bool _2108 = uint(_2100) > 1u;
    int _2110 = ~_2104;
    int _2112 = _2110 + 1;
    int _2114 = _2112 + 1;
    float _2116 = trunc(_2106);
    float _2118 = precise::max(_2116, 0.0);
    uint _2120 = uint(_2118);
    float _2122 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2126 = -_2122;
    float _2128 = fma(_1948, 2.0, _2126);
    int _2130 = _2114;
    float _2132 = as_type<float>(_2004);
    if (!_2108)
    {
        int _2134 = ~_2104;
        int _2136 = _2134 + 1;
        _2130 = _2136;
    }
    int _2138 = _2130;
    float _2140 = fma(_1450, -2.0, _2124);
    bool _2142 = uint(_2100) >= 2u;
    float _2144 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _2146 = ~_837;
    int _2148 = _2146 + 1;
    float _2150 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2152 = _2142 ? 0 : 1;
    float _2154 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _2156 = _2100 != 3;
    float _2158 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2150);
    int _2160 = int(_2004) + int(_2120);
    float _2162 = _946 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _2164 = ~_2152;
    int _2166 = _2164 + 1;
    int _2168 = _2166 + 1;
    float _2170 = -_127;
    float _2172 = fma(_2170, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2128);
    int _2174 = _2148 * _2160;
    int _2176 = _2174 + _1600;
    float _2178 = fma(_2162, -2.0, _2154);
    float _2180 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2182 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2158);
    int _2184 = _2168;
    float _2186 = as_type<float>(_2176);
    if (_2156)
    {
        int _2188 = ~_2152;
        int _2190 = _2188 + 1;
        _2184 = _2190;
    }
    int _2192 = _2184;
    float _2194 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2196 = uint(_2176) >= uint(_837);
    float _2198 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2200 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2140);
    bool _2202 = !_2196;
    int _2204 = _2202 ? 0 : (-1);
    float _2206 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2178);
    bool _2208 = _936 > 0.5;
    float _2210 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2212 = -_205;
    int _2214 = _2208 ? as_type<int>(_2212) : as_type<int>(_205);
    bool _2216 = _948 != 1;
    float _2218 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2220 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2222 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2224 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2226 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2228 = _2226 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    if (!_2216)
    {
        _2132 = _944;
    }
    float _2230 = _2132;
    float _2232 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2234 = _2232 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2236 = 0.0;
    float _2238 = _2230;
    if (!_2216)
    {
        _2236 = _944;
    }
    float _2240 = _2236;
    float _2242 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2222);
    float _2244 = _2240;
    if (!_2216)
    {
        _1554 = _962;
    }
    float _2246 = _1554;
    float _2248 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2224);
    float _2250 = _2246;
    if (!_2216)
    {
        _1896 = _962;
    }
    float _2252 = _1896;
    float _2254 = 1.0 / _2228;
    float _2256 = _2252;
    if (_2216)
    {
        _2238 = _936;
    }
    float _2258 = _2238;
    float _2260 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2262 = _2260 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    if (_2216)
    {
        _2244 = _936;
    }
    float _2264 = _2244;
    if (_2216)
    {
        _2250 = _944;
    }
    float _2266 = _2250;
    float _2268 = _2258 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2216)
    {
        _2256 = _944;
    }
    float _2270 = _2256;
    float _2272 = 1.0 / _2234;
    bool _2274 = _950 != 2;
    float _2276 = -_2194;
    float _2278 = fma(_2268, 2.0, _2276);
    float _2280 = _2266 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2282 = fma(_2270, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2218);
    float _2284 = -_127;
    float _2286 = fma(_2284, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2278);
    float _2288 = fma(_2280, -2.0, _2210);
    float _2290 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2292 = _2290 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2294 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2282);
    float _2296 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2288);
    float _2298 = 1.0 / _2262;
    if (_2274)
    {
        _2186 = _936;
    }
    float _2300 = _2186;
    float _2302 = -_2294;
    float _2304 = _2302 + 1.0;
    float _2306 = _2300;
    if (_2274)
    {
        _2058 = _944;
    }
    float _2308 = _2058;
    float _2310 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2312 = _2310 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2314 = _2308;
    if (!_2274)
    {
        _2306 = _962;
    }
    float _2316 = _2306;
    if (!_2274)
    {
        _2314 = _936;
    }
    float _2318 = _2314;
    float _2320 = 1.0 / _2292;
    int _2322 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2324 = _2322 != 0;
    float _2326 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2180);
    float _2328 = _952 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2330 = _2316 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2332 = !_2324;
    float _2334 = _2332 ? _205 : as_type<float>(_2214);
    float _2336 = _2318 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2338 = -_2144;
    float _2340 = fma(_2328, 2.0, _2338);
    float _2342 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2344 = log2(_2342);
    float _2346 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2348 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2350 = isnan(0.0);
    bool _2352 = _2348 || _2350;
    bool _2354 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2356 = _2352 || _2354;
    float _2358 = -_2198;
    float _2360 = fma(_2330, 2.0, _2358);
    float _2362 = fma(_2264, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2346);
    float _2364 = fma(_2336, -2.0, _2220);
    float _2366 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2368 = -_127;
    float _2370 = fma(_2368, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2340);
    float _2372 = _944 * 2.0;
    float _2374 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2242);
    float _2376 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2378 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2366);
    float _2380 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2326);
    float _2382 = _2344 * _127;
    float _2384 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2376);
    float _2386 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2378);
    float _2388 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2248);
    float _2390 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2362);
    float _2392 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2384);
    float _2394 = exp2(_2382);
    float _2396 = -_127;
    float _2398 = fma(_2396, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2360);
    float _2400 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2364);
    float _2402 = _944 + _936;
    float _2404 = -_2380;
    float _2406 = _2404 + 1.0;
    int _2408 = ~_2030;
    int _2410 = _2408 + _2092;
    int _2412 = _2410 + 1;
    float _2414 = floor(_2372);
    float _2416 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2418 = _2416 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2420 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2422 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2420;
    float _2424 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2426 = _2424 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2428 = _773 * _2412;
    int _2430 = _2428 + _1362;
    bool _2432 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2434 = isnan(_755);
    bool _2436 = _2432 || _2434;
    bool _2438 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2440 = _2436 || _2438;
    float _2442 = float(_2440);
    float _2444 = _2422 * _2272;
    float _2446 = _962 * 2.0;
    float _2448 = -_2394;
    float _2450 = _2448 + 1.0;
    float _2452 = 1.0 / _2312;
    float _2454 = in.m_50.x;
    float _2456 = in.m_50.y;
    float _2458 = in.m_50.z;
    float _2460 = _2402 + (-1.0);
    float _2462 = _2356 ? _2450 : 0.0;
    float _2464 = -_2386;
    float _2466 = _2464 + 1.0;
    bool _2468 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2470 = isnan(1.0);
    bool _2472 = _2468 || _2470;
    bool _2474 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2476 = _2472 || _2474;
    float _2478 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2480 = 1.0 + _2478;
    float _2482 = floor(_2446);
    float _2484 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2486 = _2484 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _2488 = _1912 >> 31;
    float _2490 = -_2392;
    float _2492 = _2490 + 1.0;
    int _2494 = ~_1942;
    int _2496 = _2494 + _2016;
    int _2498 = _2496 + 1;
    float _2500 = -_2388;
    float _2502 = _2500 + 1.0;
    int _2504 = _2488 & 3;
    float _2506 = 1.0 / _2480;
    float _2508 = _2426 * _2452;
    int _2510 = _799 * _2498;
    int _2512 = _2510 + _1256;
    int _2514 = _1912 + _2504;
    int _2516 = abs(_2192);
    float _2518 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2520 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2518;
    float _2522 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2524 = _755 + _2522;
    float _2526 = _2456 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2528 = 1.0 / _2486;
    int _2530 = _2514 >> 2;
    float _2532 = fma(_2454, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2526);
    bool _2534 = !_1936;
    int _2536 = _2534 ? 0 : 1;
    if (_2476)
    {
        float _2538 = _2462 * _2506;
        _137 = _2538;
    }
    float _2540 = _137;
    bool _2542 = _1224 >= 0.0;
    bool _2544 = isnan(_1224);
    bool _2546 = _2542 || _2544;
    bool _2548 = isnan(0.0);
    bool _2550 = _2546 || _2548;
    float _2552 = _2456 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2554 = _2456 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _2556 = _2550 ? 0 : 1;
    float _2558 = fma(_2454, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2552);
    bool _2560 = _1224 > 0.0;
    float _2562 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2564 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2562;
    float _2566 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2568 = _2566 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2570 = fma(_2454, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2554);
    float _2572 = fma(_2458, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2558);
    float _2574 = _2564 * _2254;
    float _2576 = _2568 * _2320;
    float _2578 = 1.0 / _2418;
    int _2580 = ~_2556;
    int _2582 = _2580 + 1;
    int _2584 = _2582 + 1;
    float _2586 = fma(_2574, _2524, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2588 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2590 = isnan(_755);
    bool _2592 = _2588 || _2590;
    bool _2594 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2596 = _2592 || _2594;
    float _2598 = float(_2596);
    float _2600 = _2572 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2602 = _2530 << 4;
    int _2604 = _2602 + 656;
    float _2606 = _2520 * _2528;
    int _2608 = _2584;
    if (!_2560)
    {
        int _2610 = ~_2556;
        int _2612 = _2610 + 1;
        _2608 = _2612;
    }
    int _2614 = _2608;
    float _2616 = -_2598;
    float _2618 = _2616 + 1.0;
    bool _2620 = _2414 >= 0.0;
    bool _2622 = isnan(_2414);
    bool _2624 = _2620 || _2622;
    bool _2626 = isnan(0.0);
    bool _2628 = _2624 || _2626;
    bool _2630 = !_1302;
    int _2632 = _2630 ? _2430 : (-1);
    int _2634 = _2628 ? 0 : 1;
    bool _2636 = _2414 > 0.0;
    float _2638 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2640 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2638;
    float _2642 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2644 = _2642 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _2646 = ~_2634;
    int _2648 = _2646 + 1;
    int _2650 = _2648 + 1;
    float _2652 = _2640 * _2298;
    bool _2654 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2656 = isnan(_755);
    bool _2658 = _2654 || _2656;
    bool _2660 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2662 = _2658 || _2660;
    float _2664 = float(_2662);
    float _2666 = _2644 * _2578;
    bool _2668 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2670 = isnan(_755);
    bool _2672 = _2668 || _2670;
    bool _2674 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2676 = _2672 || _2674;
    float _2678 = float(_2676);
    bool _2680 = !_1766;
    int _2682 = _2680 ? 0 : 1;
    float _2684 = -_2664;
    float _2686 = _2684 + 1.0;
    int _2688 = abs(_2536);
    float _2690 = -_2678;
    float _2692 = _2690 + 1.0;
    int _2694 = _2650;
    if (!_2636)
    {
        int _2696 = ~_2634;
        int _2698 = _2696 + 1;
        _2694 = _2698;
    }
    int _2700 = _2694;
    float _2702 = _2442 * _2686;
    int _2704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2706 = _2704 != 0;
    int _2708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2710 = _2708 != 0;
    int _2712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2714 = _2712 != 0;
    float _2716 = -_2442;
    float _2718 = _2716 + 1.0;
    bool _2720 = _2482 >= 0.0;
    bool _2722 = isnan(_2482);
    bool _2724 = _2720 || _2722;
    bool _2726 = isnan(0.0);
    bool _2728 = _2724 || _2726;
    float _2730 = _2664 * _2692;
    bool _2732 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2734 = isnan(_755);
    bool _2736 = _2732 || _2734;
    bool _2738 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2740 = _2736 || _2738;
    float _2742 = float(_2740);
    int _2744 = _2728 ? 0 : 1;
    bool _2746 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2748 = isnan(_755);
    bool _2750 = _2746 || _2748;
    bool _2752 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2754 = _2750 || _2752;
    float _2756 = float(_2754);
    float _2758 = -_2742;
    float _2760 = _2758 + 1.0;
    bool _2762 = _2482 > 0.0;
    float _2764 = _2742 * _2718;
    float _2766 = fma(_2458, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2532);
    float _2768 = fma(_2458, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2570);
    float _2770 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2772 = _755 + _2770;
    float _2774 = _2756 * _2760;
    float _2776 = -_2756;
    float _2778 = _2776 + 1.0;
    bool _2780 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2782 = isnan(_755);
    bool _2784 = _2780 || _2782;
    bool _2786 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2788 = _2784 || _2786;
    float _2790 = float(_2788);
    float _2792 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2794 = _755 + _2792;
    float _2796 = fma(_2576, _2772, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2798 = _2598 * _2778;
    bool _2800 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2802 = isnan(_755);
    bool _2804 = _2800 || _2802;
    bool _2806 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2808 = _2804 || _2806;
    float _2810 = float(_2808);
    float _2812 = fma(_2444, _2794, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2814 = -_2790;
    float _2816 = _2814 + 1.0;
    float _2818 = _2790 * _2618;
    float _2820 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2822 = _755 + _2820;
    float _2824 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2826 = _755 + _2824;
    float _2828 = _2810 * _2816;
    float _2830 = -_2810;
    float _2832 = _2830 + 1.0;
    float _2834 = fma(_2508, _2822, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2836 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2838 = _755 + _2836;
    float _2840 = _2586 * _2828;
    float _2842 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2844 = _755 + _2842;
    float _2846 = _2766 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2848 = fma(_2666, _2838, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2850 = fma(_2832, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2840);
    float _2852 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2854 = _2600 + _2852;
    uint _2856 = uint(int(uint(_2604) >> uint(2)));
    uint _2858 = uint(int(uint(int(_2856)) >> uint(2)));
    int _2860 = int(_2856) & 3;
    float _2862 = (*spvDescriptorSet0.vp_c9)._m0[int(_2858)][_2860];
    int _2864 = int(_2856) + 1;
    uint _2866 = uint(int(uint(_2864) >> uint(2)));
    int _2868 = _2864 & 3;
    float _2870 = (*spvDescriptorSet0.vp_c9)._m0[int(_2866)][_2868];
    float _2872 = fma(_2606, _2844, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2874 = fma(_2796, _2818, _2850);
    float _2876 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2878 = _2846 + _2876;
    float _2880 = _2854 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2882 = _2768 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _2884 = _1934 != 3;
    float _2886 = fma(_2812, _2798, _2874);
    float _2888 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2880);
    float _2890 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2892 = _2882 + _2890;
    int _2894 = ~_2744;
    int _2896 = _2894 + 1;
    int _2898 = _2896 + 1;
    float _2900 = _936 + _962;
    int _2902 = _2898;
    float _2904 = _2702;
    if (!_2762)
    {
        int _2906 = ~_2744;
        int _2908 = _2906 + 1;
        _2902 = _2908;
    }
    int _2910 = _2902;
    float _2912 = _936 + (-0.5);
    float _2914 = fma(_2892, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2888);
    float _2916 = fma(_2652, _2826, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2918 = _2604 + 8;
    uint _2920 = uint(int(uint(_2918) >> uint(2)));
    uint _2922 = uint(int(uint(int(_2920)) >> uint(2)));
    int _2924 = int(_2920) & 3;
    float _2926 = (*spvDescriptorSet0.vp_c9)._m0[int(_2922)][_2924];
    int _2928 = int(_2920) + 1;
    uint _2930 = uint(int(uint(_2928) >> uint(2)));
    int _2932 = _2928 & 3;
    float _2934 = (*spvDescriptorSet0.vp_c9)._m0[int(_2930)][_2932];
    bool _2936 = !_2884;
    int _2938 = _2936 ? 0 : (-1);
    float _2940 = fma(_2834, _2774, _2886);
    bool _2942 = _2914 >= 0.0;
    float _2944 = _944 + _962;
    float _2946 = _944 + (-0.5);
    float _2948 = fma(_2916, _2764, _2940);
    float _2950 = _1932 + (-0.5);
    float _2952 = _1746 + 0.5;
    float _2954 = fma(_2848, _2702, _2948);
    int _2956 = abs(_1998);
    float _2958 = -_2950;
    float _2960 = -_2206;
    float _2962 = fma(_2958, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2960);
    float _2964 = fma(_2460, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2966 = _2334 + 0.5;
    float _2968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_2942)
    {
        _2904 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2970 = _2904;
    float _2972 = _1940 + (-0.5);
    int _2974 = ~_2956;
    int _2976 = _2974 + 1;
    int _2978 = _2976 + 1;
    float _2980 = fma(_2966, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2172);
    float _2982 = fma(_2952, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2370);
    float _2984 = -_2972;
    float _2986 = -_2200;
    float _2988 = fma(_2984, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2986);
    if (_2942)
    {
        float _2990 = _2970 * 5.0;
        _2060 = as_type<int>(_2990);
    }
    int _2992 = _2060;
    float _2994 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2996 = int(_2994);
    float _2998 = fma(_2872, _2730, _2954);
    int _3000 = abs(_2066);
    float _3002 = -_2406;
    float _3004 = fma(_3002, _1746, _2982);
    if (_2942)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9532 = as_type<float>(_2992);
        out.gl_Position.z = _9532;
    }
    float _3006 = -_2182;
    float _3008 = _3006 + 1.0;
    float _3010 = fma(_2678, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2998);
    float _3012 = _2968 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3014 = _2978 * as_type<int>(_2870);
    float _3016 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3018 = fma(_3008, _1932, _2962);
    bool _3020 = !_2706;
    int _3022 = _3020 ? 0 : 1;
    out.m_72.x = _3010;
    int _3024 = ~_2688;
    int _3026 = _3024 + 1;
    int _3028 = _3026 + 1;
    float _3030 = _1704 + 0.5;
    float _3032 = _1464 + (-0.5);
    int _3034 = _3028 * as_type<int>(_2862);
    int _3036 = _3034 + _3014;
    int _3038 = ~_3000;
    int _3040 = _3038 + 1;
    int _3042 = _3040 + 1;
    float _3044 = fma(_3012, _3030, _2286);
    int _3046 = abs(_2938);
    float _3048 = _2854 * _2854;
    out.m_74.x = _3004;
    out.m_74.y = _3018;
    int _3050 = _3042 * as_type<int>(_2926);
    int _3052 = _3050 + _3036;
    float _3054 = float(uint(_2996));
    float _3056 = fma(_2878, _2878, _3048);
    int _3058 = abs(_2078);
    float _3060 = _3016 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3062 = ~_3046;
    int _3064 = _3062 + 1;
    int _3066 = _3064 + 1;
    if (_2942)
    {
        out.m_57.x = 0.0;
    }
    float _3068 = 1.0 / _3054;
    int _3070 = ~_3058;
    int _3072 = _3070 + 1;
    int _3074 = _3072 + 1;
    float _3076 = -_3060;
    float _3078 = -_2296;
    float _3080 = fma(_3076, _3032, _3078);
    int _3082 = _3066 * as_type<int>(_2934);
    int _3084 = _3082 + _3052;
    float _3086 = fma(_2892, _2892, _3056);
    int _3088 = abs(_2996);
    float _3090 = _557 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _3092 = _3084 * _3074;
    float _3094 = rsqrt(_3086);
    int _3096 = _1732 >> 31;
    int _3098 = _2632 * _3058;
    int _3100 = _3098 + _3092;
    float _3102 = float(uint(_3088));
    int _3104 = _3096 & 3;
    int _3106 = as_type<int>(_3068) + (-2);
    float _3108 = float(uint(_3100));
    float _3110 = 1.0 / _3102;
    int _3112 = _1732 + _3104;
    float _3114 = _3090 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3116 = _2084 >> 31;
    float _3118 = as_type<float>(_3106) * _3108;
    int _3120 = abs(_3022);
    float _3122 = _3114 * _3094;
    int _3124 = _3116 & 3;
    int _3126 = ~_2996;
    int _3128 = _3126 + 1;
    float _3130 = trunc(_3118);
    float _3132 = precise::max(_3130, 0.0);
    uint _3134 = uint(_3132);
    float _3136 = _2878 * _3122;
    int _3138 = _2084 + _3124;
    float _3140 = _2854 * _3122;
    float _3142 = float(_2910);
    float _3144 = -_3136;
    float _3146 = _2878 + _3144;
    int _3148 = _3112 >> 2;
    float _3150 = -_3140;
    float _3152 = _2854 + _3150;
    int _3154 = abs(_3100);
    float _3156 = in.m_76.x;
    float _3158 = in.m_76.y;
    float _3160 = in.m_76.z;
    int _3162 = _3148 << 4;
    int _3164 = _3162 + 368;
    float _3166 = _3152 * _3152;
    int _3168 = _3138 >> 2;
    float _3170 = fma(_3146, _3146, _3166);
    int _3172 = as_type<int>(_3110) + (-2);
    int _3174 = _3128 * int(_3134);
    int _3176 = _3174 + _3100;
    float _3178 = float(uint(_3154));
    uint _3180 = uint(int(uint(_3164) >> uint(2)));
    uint _3182 = uint(int(uint(int(_3180)) >> uint(2)));
    int _3184 = int(_3180) & 3;
    float _3186 = (*spvDescriptorSet0.vp_c9)._m0[int(_3182)][_3184];
    int _3188 = int(_3180) + 1;
    uint _3190 = uint(int(uint(_3188) >> uint(2)));
    int _3192 = _3188 & 3;
    float _3194 = (*spvDescriptorSet0.vp_c9)._m0[int(_3190)][_3192];
    float _3196 = float(_3120);
    int _3198 = _3168 << 4;
    int _3200 = _3198 + 800;
    float _3202 = as_type<float>(_3172) * _3178;
    float _3204 = float(uint(_3176));
    float _3206 = _3196 * _3142;
    float _3208 = -_2374;
    float _3210 = _3208 + 1.0;
    uint _3212 = uint(int(uint(_3200) >> uint(2)));
    uint _3214 = uint(int(uint(int(_3212)) >> uint(2)));
    int _3216 = int(_3212) & 3;
    float _3218 = (*spvDescriptorSet0.vp_c9)._m0[int(_3214)][_3216];
    int _3220 = int(_3212) + 1;
    uint _3222 = uint(int(uint(_3220) >> uint(2)));
    int _3224 = _3220 & 3;
    float _3226 = (*spvDescriptorSet0.vp_c9)._m0[int(_3222)][_3224];
    float _3228 = trunc(_3202);
    float _3230 = precise::max(_3228, 0.0);
    uint _3232 = uint(_3230);
    float _3234 = -_2390;
    float _3236 = _3234 + 1.0;
    float _3238 = fma(_1940, _3210, _2988);
    float _3240 = as_type<float>(_3106) * _3204;
    float _3242 = _2892 * _3122;
    float _3244 = -_2466;
    float _3246 = fma(_2334, _3244, _2980);
    float _3248 = -_3236;
    float _3250 = fma(_1704, _3248, _3044);
    float _3252 = fma(_1464, _2304, _3080);
    int _3254 = ~_3088;
    int _3256 = _3254 + 1;
    float _3258 = _3206 * (-2.0);
    float _3260 = trunc(_3240);
    float _3262 = precise::max(_3260, 0.0);
    uint _3264 = uint(_3262);
    int _3266 = abs(_2682);
    out.m_78.x = _3246;
    out.m_78.y = _3238;
    out.m_78.z = _3250;
    out.m_78.w = _3252;
    float _3268 = fma(_3258, _3156, _3156);
    int _3270 = ~_2160;
    int _3272 = _3270 + _2204;
    int _3274 = _3272 + 1;
    float _3276 = -_3242;
    float _3278 = _2892 + _3276;
    int _3280 = _3256 * int(_3232);
    int _3282 = _3280 + _3154;
    float _3284 = fma(_2912, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3268);
    int _3286 = abs(_1980);
    int _3288 = _3164 + 8;
    uint _3290 = uint(int(uint(_3288) >> uint(2)));
    uint _3292 = uint(int(uint(int(_3290)) >> uint(2)));
    int _3294 = int(_3290) & 3;
    float _3296 = (*spvDescriptorSet0.vp_c9)._m0[int(_3292)][_3294];
    int _3298 = int(_3290) + 1;
    uint _3300 = uint(int(uint(_3298) >> uint(2)));
    int _3302 = _3298 & 3;
    float _3304 = (*spvDescriptorSet0.vp_c9)._m0[int(_3300)][_3302];
    int _3306 = _837 * _3274;
    int _3308 = _3306 + _1600;
    int _3310 = abs(_2088);
    float _3312 = fma(_2964, _3258, _2964);
    float _3314 = fma(_3278, _3278, _3170);
    float _3316 = fma(_3312, _2540, _3284);
    int _3318 = _3200 + 8;
    uint _3320 = uint(int(uint(_3318) >> uint(2)));
    uint _3322 = uint(int(uint(int(_3320)) >> uint(2)));
    int _3324 = int(_3320) & 3;
    float _3326 = (*spvDescriptorSet0.vp_c9)._m0[int(_3322)][_3324];
    int _3328 = int(_3320) + 1;
    uint _3330 = uint(int(uint(_3328) >> uint(2)));
    int _3332 = _3328 & 3;
    float _3334 = (*spvDescriptorSet0.vp_c9)._m0[int(_3330)][_3332];
    float _3336 = float(uint(_3282));
    int _3338 = abs(_1824);
    int _3340 = int(_3134) + int(_3264);
    float _3342 = as_type<float>(_3172) * _3336;
    int _3344 = ~_2996;
    int _3346 = _3344 + 1;
    int _3348 = ~_3338;
    int _3350 = _3348 + 1;
    int _3352 = _3350 + 1;
    bool _3354 = !_2102;
    int _3356 = _3354 ? 0 : 1;
    float _3358 = trunc(_3342);
    float _3360 = precise::max(_3358, 0.0);
    uint _3362 = uint(_3360);
    int _3364 = abs(_2138);
    int _3366 = _3346 * _3340;
    int _3368 = _3366 + _3100;
    bool _3370 = _1764 != 3;
    int _3372 = _3352 * as_type<int>(_3194);
    int _3374 = ~_3364;
    int _3376 = _3374 + 1;
    int _3378 = _3376 + 1;
    bool _3380 = !_3370;
    int _3382 = _3380 ? 0 : (-1);
    bool _3384 = uint(_3368) >= uint(_2996);
    int _3386 = _3378 * as_type<int>(_3226);
    int _3388 = abs(_3356);
    int _3390 = ~_3266;
    int _3392 = _3390 + 1;
    int _3394 = _3392 + 1;
    int _3396 = ~_3088;
    int _3398 = _3396 + 1;
    int _3400 = int(_3232) + int(_3362);
    int _3402 = _3394 * as_type<int>(_3186);
    int _3404 = _3402 + _3372;
    bool _3406 = !_3384;
    int _3408 = _3406 ? 0 : (-1);
    bool _3410 = _2100 != 3;
    int _3412 = _3398 * _3400;
    int _3414 = _3412 + _3154;
    int _3416 = ~_3340;
    int _3418 = _3416 + _3408;
    int _3420 = _3418 + 1;
    int _3422 = abs(_1902);
    int _3424 = ~_3388;
    int _3426 = _3424 + 1;
    int _3428 = _3426 + 1;
    int _3430 = _2996 * _3420;
    int _3432 = _3430 + _3100;
    bool _3434 = !_3410;
    int _3436 = _3434 ? 0 : (-1);
    bool _3438 = uint(_3414) >= uint(_3088);
    int _3440 = _3428 * as_type<int>(_3218);
    int _3442 = _3440 + _3386;
    int _3444 = ~_3422;
    int _3446 = _3444 + 1;
    int _3448 = _3446 + 1;
    float _3450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3452 = ~_2516;
    int _3454 = _3452 + 1;
    int _3456 = _3454 + 1;
    int _3458 = _3100 ^ _2996;
    int _3460 = _3448 * as_type<int>(_3296);
    int _3462 = _3460 + _3404;
    bool _3464 = !_3438;
    int _3466 = _3464 ? 0 : (-1);
    int _3468 = _3456 * as_type<int>(_3326);
    int _3470 = _3468 + _3442;
    int _3472 = abs(_3382);
    float _3474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    uint _3476 = uint(int(uint(_3458) >> uint(31)));
    int _3478 = abs(_3436);
    int _3480 = ~_3466;
    int _3482 = _3400 + _3480;
    int _3484 = _3482 + 1;
    int _3486 = ~_3472;
    int _3488 = _3486 + 1;
    int _3490 = _3488 + 1;
    float _3492 = _3450 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3494 = ~int(_3476);
    int _3496 = _3494 + 1;
    int _3498 = ~_3478;
    int _3500 = _3498 + 1;
    int _3502 = _3500 + 1;
    int _3504 = _3490 * as_type<int>(_3304);
    int _3506 = _3504 + _3462;
    bool _3508 = _2996 == 0;
    int _3510 = _3484 ^ _3496;
    int _3512 = _3502 * as_type<int>(_3334);
    int _3514 = _3512 + _3470;
    int _3516 = ~_3310;
    int _3518 = _3516 + 1;
    int _3520 = _3518 + 1;
    bool _3522 = !_3508;
    int _3524 = _3522 ? _3432 : (-1);
    bool _3526 = _2996 == 0;
    int _3528 = _3514 * _3520;
    int _3530 = ~_3496;
    int _3532 = _3530 + _3510;
    int _3534 = _3532 + 1;
    int _3536 = ~_3286;
    int _3538 = _3536 + 1;
    int _3540 = _3538 + 1;
    bool _3542 = _799 == 0;
    bool _3544 = !_3526;
    int _3546 = _3544 ? _3534 : (-1);
    int _3548 = _3506 * _3540;
    bool _3550 = !_3542;
    int _3552 = _3550 ? _2512 : (-1);
    float _3554 = _1154 + (-0.5);
    float _3556 = float(_3524);
    float _3558 = float(_3546);
    float _3560 = _3474 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3562 = _3552 * _3286;
    int _3564 = _3562 + _3548;
    float _3566 = fma(_3492, _3556, _2398);
    bool _3568 = !_1540;
    int _3570 = _3568 ? _3308 : (-1);
    float _3572 = -_2400;
    float _3574 = fma(_3560, _3558, _3572);
    bool _3576 = !_2710;
    int _3578 = _3576 ? 0 : 1;
    float _3580 = _1124 + 0.5;
    int _3582 = _3570 * _3310;
    int _3584 = _3582 + _3528;
    int _3586 = abs(_3578);
    float _3588 = fma(_3492, _3580, _3566);
    float _3590 = -_3560;
    float _3592 = fma(_3590, _3554, _3574);
    float _3594 = float(_3564);
    float _3596 = -_2492;
    float _3598 = fma(_1124, _3596, _3588);
    float _3600 = float(_3584);
    float _3602 = fma(_1154, _2502, _3592);
    float _3604 = float(_2614);
    out.m_80.x = _3594;
    float _3606 = float(_3586);
    out.m_80.w = _3600;
    bool _3608 = !_2714;
    int _3610 = _3608 ? 0 : 1;
    float _3612 = _3606 * _3604;
    out.m_82.x = _3598;
    out.m_82.y = _3602;
    float _3614 = _3160;
    if (_2942)
    {
        return out;
    }
    float _3616 = -_3140;
    float _3618 = _2600 + _3616;
    float _3620 = -_3136;
    float _3622 = _2846 + _3620;
    float _3624 = -_3242;
    float _3626 = _2882 + _3624;
    int _3628 = abs(_3610);
    float _3630 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3632 = _3618 + _3630;
    float _3634 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3636 = _3622 + _3634;
    float _3638 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3640 = _3626 + _3638;
    float _3642 = _2944 + (-1.0);
    float _3644 = _3632 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3646 = _3612 * (-2.0);
    float _3648 = float(_2700);
    float _3650 = fma(_3642, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3652 = fma(_3636, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3644);
    float _3654 = float(_3628);
    float _3656 = fma(_3646, _3158, _3158);
    float _3658 = fma(_3650, _3646, _3650);
    float _3660 = fma(_3640, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3652);
    float _3662 = _2900 + (-1.0);
    float _3664 = fma(_2946, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3656);
    float _3666 = _3654 * _3648;
    float _3668 = _3316 * 0.15915493667125701904296875;
    bool _3670 = _3660 >= 0.0;
    float _3672 = fma(_3658, _2540, _3664);
    float _3674 = _3666 * (-2.0);
    float _3676 = fma(_3662, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3678 = sqrt(_3314);
    float _3680 = _3672 * 0.15915493667125701904296875;
    float _3682 = fma(_3674, _3160, _3160);
    float _3684 = _962 + (-0.5);
    float _3686 = fma(_3676, _3674, _3676);
    float _3688 = fma(_3684, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3682);
    float _3690 = _3668 * 6.283185482025146484375;
    float _3692 = sin(_3690);
    float _3694 = _3632;
    float _3696 = _3622;
    if (_3670)
    {
        _3614 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3698 = _3614;
    int _3700 = as_type<int>(_3698);
    if (_3670)
    {
        out.m_57.x = 0.0;
    }
    float _3702 = fma(_3686, _2540, _3688);
    if (_3670)
    {
        float _3704 = _3698 * 5.0;
        _3700 = as_type<int>(_3704);
    }
    int _3706 = _3700;
    float _3708 = _3702 * 0.15915493667125701904296875;
    float _3710 = _3668 * 6.283185482025146484375;
    float _3712 = cos(_3710);
    if (_3670)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10552 = as_type<float>(_3706);
        out.gl_Position.z = _10552;
    }
    float _3714 = _3680 * 6.283185482025146484375;
    float _3716 = sin(_3714);
    float _3718 = _3680 * 6.283185482025146484375;
    float _3720 = cos(_3718);
    if (_3670)
    {
        return out;
    }
    float _3722 = _3708 * 6.283185482025146484375;
    float _3724 = cos(_3722);
    float _3726 = _3094 * _3678;
    float _3728 = _555 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3730 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _215);
    float _3732 = _3692 * _3716;
    float _3734 = _3090 * _3726;
    float _3736 = _3726 * _3728;
    float _3738 = _3712 * _3716;
    float _3740 = _3708 * 6.283185482025146484375;
    float _3742 = sin(_3740);
    float _3744 = _3692 * _3720;
    float _3746 = _3730 * _3736;
    float _3748 = _3712 * _3720;
    float _3750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _205);
    float _3752 = _3712 * _3724;
    float _3754 = _3750 * _3734;
    float _3756 = _3692 * _3724;
    float _3758 = _3720 * _3724;
    float _3760 = _3752 * _3746;
    float _3762 = _3726 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3764 = _3762 * 0.5;
    float _3766 = _3716 * _3724;
    float _3768 = fma(_3742, _3748, _3732);
    float _3770 = -_3744;
    float _3772 = fma(_3742, _3738, _3770);
    float _3774 = -_3746;
    float _3776 = _3742 * _3774;
    float _3778 = -_3738;
    float _3780 = fma(_3742, _3744, _3778);
    float _3782 = fma(_3768, _3754, _3760);
    float _3784 = _3756 * _3746;
    float _3786 = fma(_3758, _3754, _3776);
    float _3788 = fma(_3742, _3732, _3748);
    float _3790 = fma(_3772, _3764, _3782);
    float _3792 = fma(_3780, _3754, _3784);
    float _3794 = fma(_3766, _3764, _3786);
    float _3796 = _3790 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3798 = _3790 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3800 = fma(_3788, _3764, _3792);
    float _3802 = _3790 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3804 = fma(_3794, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3796);
    float _3806 = fma(_3794, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3798);
    float _3808 = fma(_3794, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3802);
    float _3810 = fma(_3800, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3804);
    float _3812 = fma(_3800, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3806);
    float _3814 = fma(_3800, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3808);
    float _3816 = _3810 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3818 = _3812 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3820 = _2846 + _3816;
    float _3822 = _2882 + _3818;
    float _3824 = _3814 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3826 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3828 = _3820 + _3826;
    float _3830 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3832 = _3822 + _3830;
    float _3834 = _2600 + _3824;
    float _3836 = _3828 * _3828;
    float _3838 = _3832 * _3832;
    float _3840 = _3836 + _3838;
    float _3842 = sqrt(_3840);
    bool _3844 = _3842 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3846 = _3800;
    float _3848 = _3820;
    float _3850 = _3822;
    float _3852 = _3836;
    float _3854 = _3838;
    if (!_3844)
    {
        _3846 = _3834;
    }
    float _3856 = _3846;
    bool _3858 = !_3844;
    float _3860 = _3856;
    if (!_3858)
    {
        float _3862 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3864 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3866 = _3842 + _3864;
        float _3868 = rsqrt(_3840);
        float _3870 = _3866 * _3862;
        float _3872 = _3834 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3874 = _3870 * 0.15915493667125701904296875;
        float _3876 = _3874 * 6.283185482025146484375;
        float _3878 = sin(_3876);
        float _3880 = _3874 * 6.283185482025146484375;
        float _3882 = cos(_3880);
        float _3884 = fma(_3878, _3872, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3886 = _3868 * _3884;
        float _3888 = _3882 + (-1.0);
        float _3890 = fma(_3828, _3886, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3892 = fma(_3832, _3886, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3894 = _3888 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3896 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3898 = _3890 + _3896;
        float _3900 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3902 = _3892 + _3900;
        float _3904 = fma(_3834, _3882, _3894);
        float _3906 = _3898 * _3898;
        float _3908 = _3902 * _3902;
        _3848 = _3890;
        _3850 = _3892;
        _3860 = _3904;
        _3852 = _3906;
        _3854 = _3908;
    }
    float _3910 = _3848;
    float _3912 = _3850;
    float _3914 = _3860;
    float _3916 = _3852;
    float _3918 = _3854;
    float _3920 = fma(_3910, 6.2500002968590706586837768554688e-05, 0.5);
    float _3922 = fma(_3912, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _10889 = float2(_3920, _3922);
    float3 _3926 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_10889, float2(0.0), isnan(_10889)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_10889, float2(0.0), isnan(_10889)), level(0.0)).xyz;
    float _3928 = _3926.x;
    float _3930 = _3926.y;
    float _3932 = _3926.z;
    float _3934 = _3768 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3936 = _3768 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3938 = _3768 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3940 = _3752 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3942 = _3752 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3944 = _3752 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3946 = _215 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3948 = fma(_3758, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3934);
    float _3950 = fma(_3758, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3936);
    float _3952 = fma(_3758, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3938);
    float _3954 = -_3742;
    float _3956 = fma(_3954, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3940);
    float _3958 = -_3742;
    float _3960 = fma(_3958, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3942);
    float _3962 = -_3742;
    float _3964 = fma(_3962, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3944);
    float _3966 = fma(_3946, _3946, 1.0);
    float _3968 = _3772 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3970 = _3772 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3972 = _3772 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3974 = fma(_3756, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3956);
    float _3976 = fma(_3766, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3968);
    float _3978 = rsqrt(_3966);
    float _3980 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3982 = _3914 + _3980;
    float _3984 = fma(_3766, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3970);
    float _3986 = fma(_3766, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3972);
    float _3988 = fma(_3756, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3960);
    float _3990 = fma(_3982, _3982, _3916);
    float _3992 = fma(_3756, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3964);
    float _3994 = fma(_3788, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3976);
    float _3996 = fma(_3788, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3984);
    float _3998 = _3990 + _3918;
    float _4000 = fma(_3788, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3986);
    float _4002 = fma(_3780, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3948);
    float _4004 = fma(_3780, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3950);
    float _4006 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4008 = _3946 * _3974;
    float _4010 = _3946 * _3988;
    float _4012 = _3946 * _3978;
    float _4014 = fma(_3780, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3952);
    float _4016 = _3946 * _3992;
    float _4018 = sqrt(_3998);
    float _4020 = -_3994;
    float _4022 = _4012 * _4020;
    float _4024 = -_3996;
    float _4026 = _4012 * _4024;
    float _4028 = -_4000;
    float _4030 = _4012 * _4028;
    float _4032 = fma(_4006, _4002, _4008);
    float _4034 = fma(_4006, _4004, _4010);
    float _4036 = fma(_4006, _4014, _4016);
    float _4038 = fma(_3978, _3974, _4022);
    float _4040 = fma(_3978, _3988, _4026);
    float _4042 = fma(_3978, _3992, _4030);
    float _4044 = _3994 + _4032;
    float _4046 = _3996 + _4034;
    float _4048 = _4000 + _4036;
    out.m_84.x = _4002;
    out.m_84.y = _4004;
    out.m_84.z = _4014;
    bool _4050 = _4018 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4052 = isnan(_4018);
    bool _4054 = _4050 || _4052;
    bool _4056 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4058 = _4054 || _4056;
    out.m_86.x = _4038;
    out.m_86.y = _4040;
    out.m_86.z = _4042;
    out.m_88.x = _4044;
    out.m_88.y = _4046;
    out.m_88.z = _4048;
    float _4060 = _4032;
    if (!_4058)
    {
        _4060 = 1.0;
    }
    float _4062 = _4060;
    out.m_90.x = _3928;
    out.m_90.y = _3930;
    out.m_90.z = _3932;
    bool _4064 = !_4058;
    float _4066 = _4062;
    if (!_4064)
    {
        bool _4068 = _4018 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4070 = isnan(_4018);
        bool _4072 = _4068 || _4070;
        bool _4074 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4076 = _4072 || _4074;
        if (!_4076)
        {
            float _4078 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4080 = _4018 + _4078;
            float _4082 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4084 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4082;
            float _4086 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4088 = _4086 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4090 = 1.0 / _4084;
            float _4092 = _4080 * _4090;
            float _4094 = fma(_4092, _4088, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4066 = _4094;
            _4096 = true;
        }
        else
        {
            bool _4098 = _4018 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4100 = isnan(_4018);
            bool _4102 = _4098 || _4100;
            bool _4104 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4106 = _4102 || _4104;
            if (!_4106)
            {
                float _4108 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4110 = _4018 + _4108;
                float _4112 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4114 = _4112 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4116 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4118 = _4116 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4120 = 1.0 / _4114;
                float _4122 = _4110 * _4120;
                float _4124 = fma(_4122, _4118, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4066 = _4124;
                _4096 = true;
            }
            else
            {
                _4066 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4096 = false;
    float _4126 = _4066;
    float _4128 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4130 = _3914 + _4128;
    float _4132 = _3618 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4134 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4136 = _3910 + _4134;
    float _4138 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4140 = _3912 + _4138;
    float _4142 = fma(_4130, _4126, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4144 = fma(_3622, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4132);
    float _4146 = fma(_4136, _4126, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4148 = fma(_4140, _4126, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4150 = -_2600;
    float _4152 = _4150 + _4142;
    float _4154 = fma(_3626, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4144);
    float _4156 = -_2846;
    float _4158 = _4156 + _4146;
    float _4160 = _3618 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4162 = _4152 * _4152;
    float _4164 = _4154 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4166 = -_2882;
    float _4168 = _4166 + _4148;
    float _4170 = fma(_3622, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4160);
    float _4172 = fma(_4158, _4158, _4162);
    float _4174 = 1.0 / _4164;
    float _4176 = fma(_3626, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4170);
    float _4178 = fma(_4168, _4168, _4172);
    float _4180 = _4176 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4182 = sqrt(_4178);
    float _4184 = _4180 + _4164;
    float _4186 = _4184 * _4174;
    float _4188 = _4186 * 0.5;
    float _4190 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4192 = fma(_4188, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4190);
    bool _4194 = _4182 > 0.0;
    float _4196 = 1.0 / _4192;
    bool _4198 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4200 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4202 = _4198 || _4200;
    bool _4204 = isnan(0.5);
    bool _4206 = _4202 || _4204;
    bool _4208 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4210 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4212 = _4208 || _4210;
    bool _4214 = isnan(0.5);
    bool _4216 = _4212 || _4214;
    float _4218 = _4188;
    float _4220 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4222 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4224 = _4152;
    if (!_4194)
    {
        _4218 = _4146;
    }
    float _4226 = _4218;
    float _4228 = _4226;
    float _4230 = _4226;
    if (!_4194)
    {
        _4220 = _4142;
    }
    float _4232 = _4220;
    float _4234 = _4232;
    if (!_4194)
    {
        _4222 = _4148;
    }
    float _4236 = _4222;
    bool _4238 = !_4194;
    float _4240 = _4236;
    float _4242 = _4196;
    if (!_4238)
    {
        float _4244 = _219 * _219;
        float _4246 = fma(_217, _217, _4244);
        float _4248 = fma(_221, _221, _4246);
        float _4250 = rsqrt(_4178);
        float _4252 = sqrt(_4248);
        float _4254 = _4158 * _4250;
        float _4256 = _4152 * _4250;
        float _4258 = _4168 * _4250;
        bool _4260 = _4252 > 0.0;
        float _4262 = _4252;
        float _4264 = _4250;
        _4224 = _4256;
        if (!_4260)
        {
            _4228 = _4146;
        }
        float _4266 = _4228;
        _4230 = _4266;
        if (!_4260)
        {
            _4262 = _4142;
        }
        float _4268 = _4262;
        _4234 = _4268;
        if (!_4260)
        {
            _4264 = _4148;
        }
        float _4270 = _4264;
        bool _4272 = !_4260;
        _4240 = _4270;
        if (!_4272)
        {
            float _4274 = rsqrt(_4248);
            float _4276 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4278 = _219 * _4274;
            float _4280 = _217 * _4274;
            float _4282 = _221 * _4274;
            float _4284 = _4256 * _4278;
            float _4286 = fma(_4254, _4280, _4284);
            float _4288 = _4276 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4290 = fma(_4258, _4282, _4286);
            float _4292 = _4290 * _4288;
            float _4294 = fma(_217, _4292, _4146);
            float _4296 = fma(_219, _4292, _4142);
            float _4298 = fma(_221, _4292, _4148);
            _4230 = _4294;
            _4234 = _4296;
            _4240 = _4298;
        }
    }
    float _4300 = _4230;
    float _4302 = _4234;
    float _4304 = _4240;
    float _4306 = _4224;
    float _4308 = -_3136;
    float _4310 = _4308 + _4300;
    float _4312 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4314 = _4196 * _4312;
    float _4316 = -_3140;
    float _4318 = _4316 + _4302;
    float _4320 = -_3242;
    float _4322 = _4320 + _4304;
    float _4324 = _4318;
    float _4326 = _4322;
    float _4328 = _4306;
    if (_4206)
    {
        _225 = 1.0;
    }
    float _4330 = _225;
    float _4332 = _4330;
    if (_4216)
    {
        _4242 = _4310;
    }
    float _4334 = _4242;
    float _4336 = _4334;
    if (!_4216)
    {
        float _4338 = _3632 * _3632;
        float _4340 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4342 = -_2882;
        float _4344 = _4342 + _4304;
        float _4346 = -_2846;
        float _4348 = _4346 + _4300;
        float _4350 = fma(_3636, _3636, _4338);
        float _4352 = -_2600;
        float _4354 = _4352 + _4302;
        float _4356 = fma(_3640, _3640, _4350);
        float _4358 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4360 = sqrt(_4356);
        float _4362 = 1.0 / _3726;
        float _4364 = _4358 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4366 = precise::min(_4360, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4368 = _4366 * _4340;
        float _4370 = _4368 * _4362;
        float _4372 = _4364 * _4370;
        float _4374 = _4344 * _4370;
        float _4376 = fma(_4354, _4372, _3618);
        float _4378 = fma(_4348, _4372, _3622);
        float _4380 = fma(_4364, _4374, _3626);
        _4324 = _4376;
        _4336 = _4378;
        _4326 = _4380;
    }
    float _4382 = _4324;
    float _4384 = _4336;
    float _4386 = _4326;
    if (!_4206)
    {
        float _4388 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4390 = _4388 * 0.15915493667125701904296875;
        float _4392 = _4390 * 6.283185482025146484375;
        float _4394 = cos(_4392);
        float _4396 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4398 = _4396 * 0.15915493667125701904296875;
        float _4400 = _4390 * 6.283185482025146484375;
        float _4402 = sin(_4400);
        float _4404 = 1.0 / _4394;
        float _4406 = _4398 * 6.283185482025146484375;
        float _4408 = cos(_4406);
        float _4410 = _4402 * _4404;
        float _4412 = _4398 * 6.283185482025146484375;
        float _4414 = sin(_4412);
        float _4416 = _4408 * _4410;
        float _4418 = 1.0 / _4416;
        float _4420 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4422 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4420;
        float _4424 = 1.0 / _4422;
        float _4426 = _4414 * _4418;
        float _4428 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4430 = fma(_4314, _4426, _4428);
        float _4432 = _4430 * _4424;
        float _4434 = precise::clamp(_4432, 0.0, 1.0);
        _3694 = _4398;
        _4332 = _4434;
    }
    float _4436 = _3694;
    float _4438 = _4332;
    float _4440 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4442 = _4382 + _4440;
    float _4444 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4446 = _4384 + _4444;
    float _4448 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4450 = _4386 + _4448;
    float _4452 = _4442 * _4442;
    float _4454 = fma(_4446, _4446, _4452);
    float _4456 = fma(_3622, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4458 = fma(_4450, _4450, _4454);
    float _4460 = rsqrt(_4458);
    float _4462 = sqrt(_4458);
    float _4464 = _4460 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4466 = _4446 * _4464;
    float _4468 = _4450 * _4464;
    float _4470 = _4466 * _4466;
    float _4472 = _4468 * _4468;
    float _4474 = _4470 + _4472;
    float _4476 = sqrt(_4474);
    bool _4478 = _4476 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4480 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4482 = _4476 + _4480;
    float _4484 = _4460;
    float _4486 = _4482;
    float _4488 = _4442;
    if (_4478)
    {
        float _4490 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4484 = _4490;
    }
    float _4492 = _4484;
    float _4494 = _4492;
    if (_4478)
    {
        float _4496 = _4482 * _4492;
        _4486 = _4496;
    }
    float _4498 = _4486;
    if (_4478)
    {
        float _4500 = rsqrt(_4474);
        _4494 = _4500;
    }
    float _4502 = _4494;
    float _4504 = _4502;
    if (_4478)
    {
        float _4506 = _4498 * 0.15915493667125701904296875;
        _227 = _4506;
    }
    float _4508 = _227;
    float _4510 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4512 = _4450;
    if (_4478)
    {
        float _4514 = _4508 * 6.283185482025146484375;
        float _4516 = sin(_4514);
        _4512 = _4516;
    }
    float _4518 = _4512;
    float _4520 = precise::max(0.0, _4510);
    float _4522 = _4436;
    float _4524 = _4520;
    if (_4478)
    {
        float _4526 = _4508 * 6.283185482025146484375;
        float _4528 = cos(_4526);
        _4522 = _4528;
    }
    float _4530 = _4522;
    float _4532 = -_4464;
    float _4534 = -_4520;
    float _4536 = fma(_4442, _4532, _4534);
    if (_4478)
    {
        float _4538 = _4536 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4488 = _4538;
    }
    float _4540 = _4488;
    float _4542 = floor(_4456);
    float _4544 = _4518;
    float _4546 = _4540;
    if (_4478)
    {
        float _4548 = fma(_4518, _4540, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4544 = _4548;
    }
    float _4550 = _4544;
    float _4552 = _4550;
    if (!_4478)
    {
        _4546 = _4536;
    }
    float _4554 = _4546;
    float _4556 = _4554;
    if (_4478)
    {
        float _4558 = _4502 * _4550;
        _4328 = _4558;
    }
    float _4560 = _4328;
    if (!_4478)
    {
        _4504 = _4466;
    }
    float _4562 = _4504;
    float _4564 = _4562;
    if (_4478)
    {
        float _4566 = _4530 + (-1.0);
        _4524 = _4566;
    }
    float _4568 = _4524;
    float _4570 = _4568;
    if (_4478)
    {
        float _4572 = _4466 * _4560;
        _4564 = _4572;
    }
    float _4574 = _4564;
    if (!_4478)
    {
        _4552 = _4470;
    }
    float _4576 = _4552;
    float _4578 = _4576;
    if (_4478)
    {
        float _4580 = _4568 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3696 = _4580;
    }
    float _4582 = _3696;
    float _4584 = _4582;
    if (!_4478)
    {
        _4570 = _4468;
    }
    float _4586 = _4570;
    float _4588 = _4586;
    if (_4478)
    {
        float _4590 = _4468 * _4560;
        _4588 = _4590;
    }
    float _4592 = _4588;
    if (_4478)
    {
        float _4594 = _4574 * _4574;
        _4578 = _4594;
    }
    float _4596 = _4578;
    if (_4478)
    {
        float _4598 = fma(_4536, _4530, _4582);
        _4556 = _4598;
    }
    float _4600 = _4556;
    if (!_4478)
    {
        _4584 = _4472;
    }
    float _4602 = _4584;
    float _4604 = _4602;
    if (_4478)
    {
        float _4606 = _4592 * _4592;
        _4604 = _4606;
    }
    float _4608 = _4604;
    float _4610 = fma(_4600, _4600, _4596);
    float _4612 = _4382 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4614 = -_4542;
    float _4616 = _4456 + _4614;
    float _4618 = _4610 + _4608;
    float _4620 = fma(_4384, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4612);
    float _4622 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4624 = fma(_4462, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4622);
    float _4626 = precise::clamp(_4624, 0.0, 1.0);
    float _4628 = rsqrt(_4618);
    float _4630 = fma(_4386, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4620);
    float _4632 = -_4626;
    float _4634 = _4632 + 1.0;
    float _4636 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4638 = fma(_3626, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4640 = _4630 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4642 = _4382 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4644 = abs(_4634);
    float _4646 = log2(_4644);
    float _4648 = _4640 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4650 = _4382 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4652 = -_4648;
    float _4654 = fma(_4652, _4636, 1.0);
    float _4656 = _4382 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4658 = fma(_4384, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4650);
    float _4660 = _4628 * _4574;
    float _4662 = _4628 * _4600;
    float _4664 = fma(_4384, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4656);
    float _4666 = fma(_4386, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4658);
    float _4668 = _4660 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4670 = _4628 * _4592;
    float _4672 = fma(_4386, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4664);
    float _4674 = _4666 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4676 = -_4668;
    float _4678 = fma(_4662, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4676);
    float _4680 = fma(_4384, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4642);
    float _4682 = _4672 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4684 = _4674 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4686 = -_4670;
    float _4688 = fma(_4686, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4678);
    float _4690 = floor(_4638);
    float _4692 = fma(_4386, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4680);
    float _4694 = fma(_4682, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4684);
    float _4696 = fma(_4688, -0.5, 0.5);
    float _4698 = _4646 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4700 = _4692 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4702 = fma(_4640, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4694);
    float _4704 = fma(_4688, 0.5, 0.5);
    float _4706 = exp2(_4698);
    float _4708 = _4662 + 1.0;
    float _4710 = fma(_4700, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4702);
    float _4712 = _4674 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4714 = fma(_4704, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4716 = fma(_4682, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4712);
    float _4718 = sqrt(_4696);
    float _4720 = _4674 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4722 = -_4690;
    float _4724 = _4638 + _4722;
    float _4726 = fma(_4704, _4714, -0.212114393711090087890625);
    float _4728 = fma(_4640, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4716);
    float _4730 = fma(_4682, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4720);
    float _4732 = fma(_4704, _4726, 1.570728778839111328125);
    float _4734 = log2(_4654);
    float _4736 = fma(_4640, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4730);
    float _4738 = fma(_4700, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4728);
    float _4740 = -_4662;
    float _4742 = fma(_4706, _4708, _4740);
    float _4744 = fma(_4700, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4736);
    float _4746 = fma(_4742, 0.5, 0.5);
    float _4748 = 1.0 / _4710;
    float _4750 = _4718 * 0.636619746685028076171875;
    float _4752 = -_4732;
    float _4754 = fma(_4750, _4752, 1.0);
    float2 _12287 = float2(_4616, _4724);
    float _4756 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12287, float2(0.0), isnan(_12287)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12287, float2(0.0), isnan(_12287)), level(0.0)).x;
    float _4758 = _4734 * 0.693147182464599609375;
    float _4760 = _4738 * _4748;
    float _4762 = _4744 * _4748;
    float _4764 = _4758 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4766 = fma(_4760, 0.5, 0.5);
    float _4768 = fma(_4762, -0.5, 0.5);
    float3 _12313 = float3(_4766, _4768, _4764);
    float _4770 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12313, float3(0.0), isnan(_12313)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12313, float3(0.0), isnan(_12313)), level(0.0)).x;
    float3 _12324 = float3(_4766, _4768, _4764);
    float4 _4773 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12324, float3(0.0), isnan(_12324)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12324, float3(0.0), isnan(_12324)), level(0.0)).xyzw;
    float _4775 = _4773.x;
    float _4777 = _4773.y;
    float _4779 = _4773.z;
    float _4781 = _4773.w;
    float2 _12340 = float2(_4754, _4746);
    float3 _4783 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12340, float2(0.0), isnan(_12340)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12340, float2(0.0), isnan(_12340)), level(0.0)).xyz;
    float _4785 = _4783.x;
    float _4787 = _4783.y;
    float _4789 = _4783.z;
    float _4791 = abs(_4314);
    float _4793 = log2(_4791);
    float _4795 = _4674 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _4797 = _4462 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4799 = isnan(_4462);
    bool _4801 = _4797 || _4799;
    bool _4803 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4805 = _4801 || _4803;
    float _4807 = fma(_4682, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4795);
    float _4809 = fma(_4640, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4807);
    float _4811 = _4738 + _4710;
    float _4813 = fma(_4700, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4809);
    float _4815 = _4793 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4817 = in.m_92.x;
    float _4819 = _4811 * 0.5;
    out.gl_Position.x = _4738;
    out.gl_Position.y = _4744;
    out.gl_Position.z = _4813;
    out.gl_Position.w = _4710;
    float _4821 = exp2(_4815);
    float _4823 = _4738;
    float _4825 = _4813;
    float _4827 = _4710;
    float _4829 = _4744;
    if (!_4805)
    {
        _4823 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4831 = _4823;
    float _4833 = fma(_4821, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4835 = precise::clamp(_4833, 0.0, 1.0);
    float _4837 = _4813 + _4710;
    float _4839 = _4831;
    float _4841 = _4831;
    if (!_4805)
    {
        _4825 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4843 = _4825;
    float _4845 = fma(_4835, -2.0, 3.0);
    float _4847 = _4835 * _4835;
    float _4849 = _4837 * 0.5;
    float _4851 = _4847 * _4845;
    float _4853 = _4646 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _4855 = _4314 <= 8000.0;
    bool _4857 = isnan(_4314);
    bool _4859 = _4855 || _4857;
    bool _4861 = isnan(8000.0);
    bool _4863 = _4859 || _4861;
    float _4865 = float(_4863);
    float _4867 = _4710 * 0.5;
    float _4869 = -_4851;
    float _4871 = _4869 + 1.0;
    float _4873 = exp2(_4853);
    float _4875 = fma(_4871, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4851);
    float _4877 = fma(_4744, -0.5, _4867);
    float _4879 = _4865 * _4875;
    float _4881 = _4843;
    float _4883 = _4843;
    if (!_4805)
    {
        _4827 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4885 = _4827;
    out.m_94.x = _4819;
    out.m_94.y = _4877;
    out.m_94.z = _4849;
    out.m_94.w = _4710;
    float _4887 = _4879 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4889 = _4885;
    float _4891 = _4885;
    if (!_4805)
    {
        _4829 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4893 = _4829;
    float _4895 = -_4873;
    float _4897 = _4895 + 1.0;
    float _4899 = _4897 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4901 = -_4756;
    float _4903 = _4901 + 1.0;
    float _4905 = _4903 * _4887;
    float _4907 = precise::clamp(_4905, 0.0, 1.0);
    float _4909 = -_4907;
    float _4911 = fma(_4909, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4913 = _4911 * _4817;
    float _4915 = _4913 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4917 = _4899 * _4770;
    float _4919 = -_4899;
    float _4921 = _4919 + 1.0;
    out.m_96.x = _4915;
    float _4923 = _4781 * _4917;
    float _4925 = _4789 * _4917;
    float _4927 = _4781 * _4921;
    float _4929 = fma(_4785, _4923, _4775);
    float _4931 = fma(_4787, _4923, _4777);
    float _4933 = fma(_4781, _4925, _4779);
    float _4935 = _4438 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4937 = _4923;
    float _4939 = _4779;
    float _4941 = _4893;
    float _4943 = _4893;
    if (!_4805)
    {
        _4937 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4945 = _4937;
    float _4947 = _4945;
    float _4949 = _4945;
    if (!_4805)
    {
        _4939 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4951 = _4939;
    out.m_98.x = _4929;
    out.m_98.y = _4931;
    out.m_98.z = _4933;
    out.m_98.w = _4927;
    bool _4953 = !_4805;
    float _4955 = _4951;
    float _4957 = _4951;
    if (!_4953)
    {
        bool _4959 = _4462 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4961 = isnan(_4462);
        bool _4963 = _4959 || _4961;
        bool _4965 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4967 = _4963 || _4965;
        if (!_4967)
        {
            float _4969 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4971 = _4462 + _4969;
            float _4973 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4975 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4973;
            float _4977 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4979 = _4977 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4981 = 1.0 / _4975;
            float _4983 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4985 = _4983 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4987 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4989 = _4987 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4991 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4993 = _4991 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4995 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4997 = _4995 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4999 = _4971 * _4981;
            float _5001 = precise::clamp(_4999, 0.0, 1.0);
            float _5003 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5005 = _5003 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5007 = fma(_5001, _4979, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5009 = fma(_5001, _5005, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5011 = fma(_5001, _4985, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5013 = fma(_5001, _4989, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5015 = fma(_5001, _4993, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5017 = fma(_5001, _4997, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4957 = _5011;
            _4943 = _5015;
            _4949 = _5007;
            _4883 = _5013;
            _4891 = _5009;
            _4841 = _5017;
            _5019 = true;
        }
        else
        {
            bool _5021 = _4462 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5023 = isnan(_4462);
            bool _5025 = _5021 || _5023;
            bool _5027 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5029 = _5025 || _5027;
            if (!_5029)
            {
                _4947 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5031 = _4947;
            _4949 = _5031;
            if (!_5029)
            {
                _4955 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5033 = _4955;
            _4957 = _5033;
            if (!_5029)
            {
                _4889 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5035 = _4889;
            _4891 = _5035;
            if (!_5029)
            {
                _4881 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5037 = _4881;
            _4883 = _5037;
            if (!_5029)
            {
                _4941 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5039 = _4941;
            _4943 = _5039;
            if (!_5029)
            {
                _4839 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5041 = _4839;
            bool _5043 = !_5029;
            _4841 = _5041;
            if (!_5043)
            {
                bool _5045 = _4462 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5047 = isnan(_4462);
                bool _5049 = _5045 || _5047;
                bool _5051 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5053 = _5049 || _5051;
                if (!_5053)
                {
                    float _5055 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5057 = _4462 + _5055;
                    float _5059 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5061 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5059;
                    float _5063 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5065 = _5063 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5067 = 1.0 / _5061;
                    float _5069 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5071 = _5069 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5073 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5075 = _5073 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5077 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5079 = _5077 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5081 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5083 = _5081 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5085 = _5057 * _5067;
                    float _5087 = precise::clamp(_5085, 0.0, 1.0);
                    float _5089 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5091 = _5089 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5093 = fma(_5087, _5065, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5095 = fma(_5087, _5091, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5097 = fma(_5087, _5071, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5099 = fma(_5087, _5075, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5101 = fma(_5087, _5079, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5103 = fma(_5087, _5083, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4957 = _5097;
                    _4943 = _5101;
                    _4949 = _5093;
                    _4883 = _5099;
                    _4891 = _5095;
                    _4841 = _5103;
                    _5019 = true;
                }
                else
                {
                    _4957 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4943 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4949 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4883 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4891 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4841 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5019 = false;
    float _5105 = _4957;
    float _5107 = _4943;
    float _5109 = _4949;
    float _5111 = _4883;
    float _5113 = _4891;
    float _5115 = _4841;
    float _5117 = _4935 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5119 = fma(_4046, -0.5, 0.5);
    float _5121 = precise::clamp(_5119, 0.0, 1.0);
    float _5123 = -_5105;
    float _5125 = _5123 + _5107;
    float _5127 = -_5109;
    float _5129 = _5127 + _5111;
    out.m_57.x = _5117;
    float _5131 = fma(_5121, _5125, _5105);
    float _5133 = -_5113;
    float _5135 = _5133 + _5115;
    float _5137 = fma(_5121, _5129, _5109);
    float _5139 = _5131 * 0.586610972881317138671875;
    bool _5141 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5143 = fma(_5121, _5135, _5113);
    out.m_100.x = 0.0;
    float _5145 = fma(_5137, 0.298911988735198974609375, _5139);
    bool _5147 = _4438 > 0.0;
    bool _5149 = isnan(_4438);
    bool _5151 = _5147 || _5149;
    bool _5153 = isnan(0.0);
    bool _5155 = _5151 || _5153;
    float _5157 = fma(_5143, 0.114477999508380889892578125, _5145);
    float _5159 = -_5157;
    float _5161 = _5137 + _5159;
    float _5163 = -_5157;
    float _5165 = _5131 + _5163;
    float _5167 = -_5157;
    float _5169 = _5143 + _5167;
    float _5171 = fma(_5161, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5157);
    float _5173 = fma(_5165, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5157);
    float _5175 = fma(_5169, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5157);
    bool _5177 = !_5141;
    if (!_5177)
    {
        float _5179 = -_4382;
        float _5181 = _5179 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5183 = -_4384;
        float _5185 = _5183 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5187 = -_4386;
        float _5189 = _5187 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5191 = _5181 * _5181;
        float _5193 = fma(_5185, _5185, _5191);
        float _5195 = fma(_5189, _5189, _5193);
        float _5197 = sqrt(_5195);
        float _5199 = rsqrt(_5195);
        float _5201 = -_5197;
        float _5203 = _5201 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5205 = _5203 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5207 = precise::clamp(_5205, 0.0, 1.0);
        float _5209 = _5185 * _5199;
        float _5211 = _5181 * _5199;
        float _5213 = abs(_5207);
        float _5215 = log2(_5213);
        float _5217 = _5189 * _5199;
        float _5219 = _5209 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5221 = _4046 * _5211;
        float _5223 = -_5211;
        float _5225 = -_5219;
        float _5227 = fma(_5223, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5225);
        float _5229 = fma(_4044, _5209, _5221);
        float _5231 = -_5217;
        float _5233 = fma(_5231, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5227);
        float _5235 = fma(_4048, _5217, _5229);
        float _5237 = precise::clamp(_5235, 0.0, 1.0);
        float _5239 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5241 = _5233 + _5239;
        float _5243 = _5215 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5245 = _5241 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5247 = precise::clamp(_5245, 0.0, 1.0);
        float _5249 = exp2(_5243);
        float _5251 = _5249 * _5247;
        float _5253 = _5237 * _5251;
        float _5255 = _5253 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5257 = _5253 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5259 = _5253 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _5255;
        out.m_100.y = _5257;
        out.m_100.z = _5259;
    }
    out.m_102.x = _5171;
    out.m_102.y = _5173;
    out.m_102.z = _5175;
    if (_5155)
    {
        return out;
    }
    out.m_57.x = 0.0;
    float _5261 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5261;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5019 = false;
    bool _4096 = false;
    bool _579 = false;
    bool _435 = false;
    bool _247 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_50.w;
    float _118 = in.m_52.w;
    float _120 = trunc(_116);
    int _123 = int(_120);
    float _125 = -_118;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.y = _127;
    bool _131 = _123 >= 1;
    float _133 = 0.0;
    float _135 = _118;
    float _137 = _127;
    if (!_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _133;
    if (!_131)
    {
        out.m_57.x = 0.0;
    }
    int _141 = 0;
    if (!_131)
    {
        float _143 = _139 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    if (!_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5328 = as_type<float>(_145);
        out.gl_Position.z = _5328;
    }
    if (!_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _147 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_118);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = float(_123);
    bool _159 = _127 >= _157;
    bool _161 = !_155;
    bool _163 = _159 || _161;
    float _165 = 1.0 / _157;
    if (_163)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _135;
    if (_163)
    {
        out.m_57.x = 0.0;
    }
    float _169 = _127 * _165;
    int _171 = 0;
    float _173 = _169;
    if (_163)
    {
        float _175 = _167 * 5.0;
        _171 = as_type<int>(_175);
    }
    int _177 = _171;
    out.m_55.x = _169;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5391 = as_type<float>(_177);
        out.gl_Position.z = _5391;
    }
    if (_163)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = in.m_62.x;
    float _183 = in.m_62.y;
    float _185 = in.m_62.z;
    int _187 = as_type<int>(_179) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_179) & 2;
    bool _193 = _191 != 0;
    bool _195 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _197 = _183 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _199 = _183 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _201 = _183 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _203 = !_189;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].x, _197);
    float _209 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].x, _199);
    float _211 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].x, _201);
    bool _213 = !_193;
    float _215 = _213 ? (-0.5) : 0.5;
    float _217 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[4].z, _207);
    float _219 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[5].z, _209);
    float _221 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[6].z, _211);
    bool _223 = !_195;
    float _225 = _217;
    float _227 = _221;
    float _245;
    if (!_223)
    {
        float _229 = in.m_64.x;
        float _231 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _233 = _229 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _237 = _235 * _231;
        float _239 = floor(_237);
        float _241 = -_239;
        float _243 = _237 + _241;
        _245 = _243;
        _247 = true;
    }
    else
    {
        _245 = _169;
    }
    _247 = false;
    float _249 = _245;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _253 = _249 + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = _249 + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _261 = _249 + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _269 = _267 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _271;
    bool _275 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _277 = isnan(_249);
    bool _279 = _275 || _277;
    bool _281 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _283 = _279 || _281;
    float _285 = float(_283);
    float _287 = 1.0 / _265;
    bool _289 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _291 = 1.0 / _273;
    float _293 = 1.0 / _269;
    float _295 = _253 * _287;
    bool _297 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _299 = isnan(_249);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = -_285;
    float _311 = _309 + 1.0;
    float _313 = _307 * _311;
    float _315 = _257 * _291;
    bool _317 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _319 = isnan(_249);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = -_307;
    float _331 = _329 + 1.0;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _337 = _327 * _331;
    float _339 = -_327;
    float _341 = _339 + 1.0;
    float _343 = _261 * _293;
    bool _345 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _347 = isnan(_249);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _369 = fma(_359, _295, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _371 = _355 * _341;
    float _373 = fma(_363, _295, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _375 = -_355;
    float _377 = _375 + 1.0;
    float _379 = _369 * _371;
    float _381 = _373 * _371;
    float _383 = fma(_335, _343, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _385 = fma(_367, _343, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _387 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].x, _379);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _393;
    float _397 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].y, _381);
    float _399 = fma(_383, _337, _387);
    float _401 = fma(_391, _315, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _403 = fma(_395, _315, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _405 = fma(_385, _337, _397);
    float _407 = fma(_401, _313, _399);
    float _409 = fma(_403, _313, _405);
    float _411 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[146].x, _407);
    float _413 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[146].y, _409);
    bool _415 = !_289;
    float _433;
    if (!_415)
    {
        float _417 = in.m_64.x;
        float _419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _421 = _417 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _423 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _425 = _423 * _419;
        float _427 = floor(_425);
        float _429 = -_427;
        float _431 = _425 + _429;
        _433 = _431;
        _435 = true;
    }
    else
    {
        _433 = _169;
    }
    _435 = false;
    float _437 = _433;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _441 = _437 + _439;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _447 = _437 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _449 = isnan(_437);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _463 = _437 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _465 = isnan(_437);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _475;
    bool _479 = _437 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _481 = isnan(_437);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = 1.0 / _445;
    float _493 = -_457;
    float _495 = _493 + 1.0;
    bool _497 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _499 = 1.0 / _461;
    float _501 = _477 * _491;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _507 = -_489;
    float _509 = _507 + 1.0;
    float _511 = fma(_501, _441, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _513 = _473 * _495;
    float _515 = -_473;
    float _517 = _515 + 1.0;
    float _519 = _457 * _509;
    float _521 = _505 * _499;
    float _523 = _511 * _513;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _527 = _437 + _525;
    float _529 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[115].x, _523);
    float _531 = fma(_521, _527, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _535 = fma(_531, _519, _529);
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _539 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _541 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[117].x, _535);
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _545 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _547 = in.m_66.x;
    float _549 = in.m_66.y;
    float _551 = _541 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _553 = _543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_68.x = _539;
    out.m_68.y = _545;
    out.m_68.z = _553;
    out.m_68.w = _551;
    float _555 = _413 * _549;
    float _557 = _411 * _547;
    bool _559 = !_497;
    float _577;
    if (!_559)
    {
        float _561 = in.m_64.x;
        float _563 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _565 = _561 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _567 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[11].w, _127);
        float _569 = _567 * _563;
        float _571 = floor(_569);
        float _573 = -_571;
        float _575 = _569 + _573;
        _577 = _575;
        _579 = true;
    }
    else
    {
        _577 = _169;
    }
    _579 = false;
    float _581 = _577;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _585 = _581 + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _591 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _593 = isnan(_581);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _611 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _613 = isnan(_581);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = 1.0 / _589;
    float _625 = -_601;
    float _627 = _625 + 1.0;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _629;
    bool _633 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _635 = isnan(_581);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = _621 * _627;
    float _647 = -_621;
    float _649 = _647 + 1.0;
    bool _651 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _653 = 1.0 / _605;
    float _655 = _643 * _649;
    float _657 = -_643;
    float _659 = _657 + 1.0;
    float _661 = 1.0 / _609;
    float _663 = _631 * _623;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _669 = fma(_663, _585, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _671 = _667 * _653;
    bool _673 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _675 = isnan(_581);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _685;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _691 = _581 + _689;
    float _693 = _669 * _655;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _697 = _581 + _695;
    float _699 = -_683;
    float _701 = _699 + 1.0;
    float _703 = fma(_671, _691, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _705 = _687 * _661;
    float _707 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[131].x, _693);
    float _709 = _601 * _701;
    float _711 = fma(_705, _697, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _713 = fma(_703, _645, _707);
    float _715 = fma(_711, _709, _713);
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _723 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[134].x, _715);
    float _725 = _719 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _727 = _717 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _729 = _721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _731 = _723 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_70.x = _725;
    out.m_70.y = _727;
    out.m_70.z = _729;
    out.m_70.w = _731;
    bool _733 = !_651;
    int _735 = as_type<int>(_661);
    int _737 = as_type<int>(_729);
    if (!_733)
    {
        float _739 = in.m_64.x;
        float _741 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _743 = _739 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _745 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _747 = _745 * _741;
        float _749 = floor(_747);
        float _751 = -_749;
        float _753 = _747 + _751;
        _173 = _753;
    }
    float _755 = _173;
    float _757 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _759 = int(_757);
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _763 = _761 != 0;
    float _765 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _767 = int(_765);
    float _769 = float(_759);
    float _771 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _773 = int(_771);
    float _775 = 0.0;
    if (_763)
    {
        _775 = 1.0;
    }
    float _777 = _775;
    float _779 = 0.0;
    float _781 = _777;
    if (_763)
    {
        _779 = 1.0;
    }
    float _783 = _779;
    float _785 = _783;
    if (_763)
    {
        _735 = 0;
    }
    int _787 = _735;
    float _789 = float(_767);
    float _791 = 1.0 / _769;
    int _793 = _787;
    if (_763)
    {
        _737 = 0;
    }
    int _795 = _737;
    float _797 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _799 = int(_797);
    float _801 = float(uint(_773));
    float _803 = 1.0 / _789;
    float _805 = _791 * _127;
    float _807 = 1.0 / _801;
    float _809 = float(uint(_799));
    int _811 = ~_799;
    int _813 = _811 + 1;
    float _815 = trunc(_805);
    int _817 = int(_815);
    float _819 = _803 * _127;
    float _821 = _803;
    float _823 = _769;
    int _825 = _795;
    if (_763)
    {
        float _827 = in.m_64.x;
        float _829 = in.m_64.y;
        _821 = _827;
        _823 = _829;
    }
    float _831 = _821;
    float _833 = _823;
    float _835 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _837 = int(_835);
    int _839 = as_type<int>(_807) + (-2);
    float _841 = 1.0 / _809;
    float _843 = float(uint(_817));
    float _845 = as_type<float>(_839) * _843;
    float _847 = trunc(_819);
    int _849 = int(_847);
    float _851 = float(uint(_837));
    float _853 = 0.0;
    float _855 = _831;
    float _857 = _833;
    float _859 = as_type<float>(_839);
    if (_763)
    {
        _853 = _831;
    }
    float _861 = _853;
    float _863 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _865 = int(_863);
    int _867 = as_type<int>(_841) + (-2);
    float _869 = _841;
    float _871 = _861;
    if (_763)
    {
        _869 = _833;
    }
    float _873 = _869;
    float _875 = 1.0 / _851;
    float _877 = float(uint(_849));
    float _879 = as_type<float>(_867) * _877;
    float _881 = trunc(_845);
    float _883 = precise::max(_881, 0.0);
    uint _886 = uint(_883);
    float _888 = float(_865);
    float _890 = 1.0 / _888;
    float _892 = trunc(_879);
    float _894 = precise::max(_892, 0.0);
    uint _896 = uint(_894);
    float _898 = _888;
    float _900 = _879;
    float _902 = _873;
    if (_763)
    {
        _898 = _861;
    }
    float _904 = _898;
    float _906 = _904;
    if (_763)
    {
        _900 = _861;
    }
    float _908 = _900;
    float _910 = _908;
    if (!_763)
    {
        float _912 = in.m_64.x;
        float _914 = in.m_64.y;
        float _916 = in.m_64.z;
        float _918 = _912 * 3.1415927410125732421875;
        float _920 = _918 * 0.15915493667125701904296875;
        float _922 = _914 * 3.1415927410125732421875;
        float _924 = _922 * 0.15915493667125701904296875;
        float _926 = _920 * 6.283185482025146484375;
        float _928 = sin(_926);
        float _930 = _924 * 6.283185482025146484375;
        float _932 = sin(_930);
        _781 = 7.345489978790283203125;
        _855 = _912;
        _785 = 5.839270114898681640625;
        _906 = _916;
        _871 = _914;
        _857 = _914;
        _902 = _932;
        _793 = 1;
        _825 = 2;
        _910 = _928;
    }
    float _934 = _781;
    float _936 = _855;
    float _938 = _785;
    float _940 = _906;
    float _942 = _871;
    float _944 = _857;
    float _946 = _902;
    int _948 = _793;
    int _950 = _825;
    float _952 = _910;
    int _954 = _813 * int(_896);
    int _956 = _954 + _849;
    float _958 = _934 * _936;
    float _960 = _938 * _940;
    float _962 = in.m_64.z;
    float _964 = in.m_64.w;
    float _966 = _934 * _942;
    float _968 = float(uint(_956));
    float _970 = floor(_958);
    float _972 = _890 * _127;
    float _974 = _936 * 2.0;
    float _976 = as_type<float>(_867) * _968;
    int _978 = ~_773;
    int _980 = _978 + 1;
    float _982 = float(_849);
    float _984 = trunc(_976);
    float _986 = precise::max(_984, 0.0);
    uint _988 = uint(_986);
    float _990 = float(_799);
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _994 = _992 != 0;
    int _996 = _980 * int(_886);
    int _998 = _996 + _817;
    bool _1000 = _944 > 0.5;
    float _1002 = floor(_960);
    float _1004 = -_970;
    float _1006 = _958 + _1004;
    int _1008 = ~_773;
    int _1010 = _1008 + 1;
    float _1012 = float(uint(_998));
    bool _1014 = _964 > 0.5;
    float _1016 = trunc(_972);
    int _1018 = int(_1016);
    float _1020 = as_type<float>(_839) * _1012;
    int _1022 = int(_896) + int(_988);
    int _1024 = as_type<int>(_875) + (-2);
    bool _1026 = _962 > 0.5;
    float _1028 = trunc(_1020);
    float _1030 = precise::max(_1028, 0.0);
    uint _1032 = uint(_1030);
    float _1034 = -_1002;
    float _1036 = _960 + _1034;
    int _1038 = ~_799;
    int _1040 = _1038 + 1;
    bool _1042 = _982 >= _990;
    bool _1044 = isnan(_982);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan(_990);
    bool _1050 = _1046 || _1048;
    float _1052 = float(_1050);
    int _1054 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1056 = _1054 != 0;
    int _1058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1060 = _1058 != 0;
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1064 = _1062 != 0;
    int _1066 = _1040 * _1022;
    int _1068 = _1066 + _849;
    float _1070 = float(uint(_1018));
    float _1072 = floor(_966);
    float _1074 = -_205;
    int _1076 = _1000 ? as_type<int>(_1074) : as_type<int>(_205);
    float _1078 = as_type<float>(_1024) * _1070;
    float _1080 = -_215;
    int _1082 = _1026 ? as_type<int>(_1080) : as_type<int>(_215);
    int _1084 = int(_886) + int(_1032);
    float _1086 = trunc(_1078);
    float _1088 = precise::max(_1086, 0.0);
    uint _1090 = uint(_1088);
    float _1092 = _1006 * _990;
    int _1094 = int(_1014);
    int _1096 = _1026 ? 2 : 0;
    int _1098 = _1094 | _1096;
    int _1100 = _994 ? 4 : 0;
    int _1102 = _1098 | _1100;
    int _1104 = _1056 ? 8 : 0;
    int _1106 = _1102 | _1104;
    int _1108 = _1060 ? 16 : 0;
    int _1110 = _1106 | _1108;
    int _1112 = _1064 ? 32 : 0;
    int _1114 = _1110 | _1112;
    int _1116 = _1000 ? 64 : 0;
    int _1118 = _1114 | _1116;
    int _1120 = _1118 & 64;
    bool _1122 = !_1060;
    float _1124 = _1122 ? _205 : as_type<float>(_1076);
    float _1126 = float(_773);
    float _1128 = trunc(_1052);
    int _1130 = int(_1128);
    float _1132 = float(_817);
    float _1134 = _1036 * _1126;
    int _1136 = ~_837;
    int _1138 = _1136 + 1;
    int _1140 = _1010 * _1084;
    int _1142 = _1140 + _817;
    bool _1144 = !_994;
    int _1146 = _1144 ? 0 : 1;
    float _1148 = trunc(_1092);
    int _1150 = int(_1148);
    bool _1152 = !_1064;
    float _1154 = _1152 ? _215 : as_type<float>(_1082);
    int _1156 = _1138 * int(_1090);
    int _1158 = _1156 + _1018;
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1162 = _1160 != 0;
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1166 = _1164 != 0;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1170 = _1168 != 0;
    bool _1172 = uint(_1068) >= uint(_799);
    bool _1174 = _1132 >= _1126;
    bool _1176 = isnan(_1132);
    bool _1178 = _1174 || _1176;
    bool _1180 = isnan(_1126);
    bool _1182 = _1178 || _1180;
    float _1184 = float(_1182);
    float _1186 = trunc(_1134);
    int _1188 = int(_1186);
    bool _1190 = !_1166;
    int _1192 = _1190 ? 0 : 1;
    bool _1194 = !_1162;
    int _1196 = _1194 ? 0 : 1;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1200 = _1198 != 0;
    bool _1202 = uint(_1142) >= uint(_773);
    float _1204 = trunc(_1184);
    int _1206 = int(_1204);
    bool _1208 = !_1172;
    int _1210 = _1208 ? 0 : (-1);
    bool _1212 = !_1170;
    int _1214 = _1212 ? 0 : 1;
    bool _1216 = !_1200;
    int _1218 = _1216 ? 0 : 1;
    bool _1220 = !_1202;
    int _1222 = _1220 ? 0 : (-1);
    float _1224 = floor(_974);
    float _1226 = -_1072;
    float _1228 = _966 + _1226;
    float _1230 = float(uint(_1158));
    int _1232 = abs(_1146);
    int _1234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1236 = _1234 != 0;
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1240 = _1238 != 0;
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1244 = _1242 != 0;
    float _1246 = as_type<float>(_1024) * _1230;
    int _1248 = ~_1022;
    int _1250 = _1248 + _1210;
    int _1252 = _1250 + 1;
    int _1254 = _1150 * _1232;
    int _1256 = _1254 + _849;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1260 = _1258 != 0;
    int _1262 = ~_1084;
    int _1264 = _1262 + _1222;
    int _1266 = _1264 + 1;
    int _1268 = _799 * _1252;
    int _1270 = _1268 + _849;
    bool _1272 = !_1240;
    int _1274 = _1272 ? 0 : 1;
    float _1276 = trunc(_1246);
    float _1278 = precise::max(_1276, 0.0);
    uint _1280 = uint(_1278);
    bool _1282 = !_1260;
    int _1284 = _1282 ? 0 : 1;
    int _1286 = _773 * _1266;
    int _1288 = _1286 + _817;
    bool _1290 = _1120 != 0;
    float _1292 = _165 * _127;
    bool _1294 = _799 == 0;
    bool _1296 = !_1236;
    int _1298 = _1296 ? 0 : 1;
    float _1300 = _990 * _1292;
    bool _1302 = _773 == 0;
    float _1304 = _1126 * _1292;
    int _1306 = ~_1130;
    int _1308 = _1306 + 1;
    int _1310 = _1308 + 1;
    bool _1312 = !_1294;
    int _1314 = _1312 ? _1270 : (-1);
    float _1316 = trunc(_1300);
    int _1318 = int(_1316);
    int _1320 = ~_1206;
    int _1322 = _1320 + 1;
    int _1324 = _1322 + 1;
    bool _1326 = !_1302;
    int _1328 = _1326 ? _1288 : (-1);
    int _1330 = _1314 * _1310;
    int _1332 = _799 + (-1);
    int _1334 = abs(_1192);
    int _1336 = _1328 * _1324;
    int _1338 = _773 + (-1);
    int _1340 = _1130 * _1332;
    int _1342 = _1340 + _1330;
    int _1344 = abs(_1274);
    float _1346 = trunc(_1304);
    int _1348 = int(_1346);
    int _1350 = abs(_1284);
    int _1352 = _1206 * _1338;
    int _1354 = _1352 + _1336;
    int _1356 = _1342 * _1334;
    int _1358 = abs(_1196);
    int _1360 = _1188 * _1350;
    int _1362 = _1360 + _817;
    int _1364 = ~_837;
    int _1366 = _1364 + 1;
    int _1368 = _1354 * _1344;
    int _1370 = abs(_1214);
    int _1372 = _1318 * _1358;
    int _1374 = _1372 + _1356;
    int _1376 = abs(_1218);
    int _1378 = _1256 * _1370;
    int _1380 = _1378 + _1374;
    int _1382 = int(_1090) + int(_1280);
    int _1384 = abs(_1298);
    int _1386 = _1366 * _1382;
    int _1388 = _1386 + _1018;
    float _1390 = -_215;
    int _1392 = _1014 ? as_type<int>(_1390) : as_type<int>(_215);
    int _1394 = _1150 * _1376;
    int _1396 = _1394 + _1380;
    float _1398 = -_205;
    int _1400 = _1026 ? as_type<int>(_1398) : as_type<int>(_205);
    int _1402 = _1348 * _1384;
    int _1404 = _1402 + _1368;
    bool _1406 = uint(_1388) >= uint(_837);
    float _1408 = float(uint(_1396));
    float _1410 = float(_837);
    float _1412 = float(_1018);
    float _1414 = as_type<float>(_867) * _1408;
    int _1416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1418 = _1416 != 0;
    float _1420 = _1410 * _1292;
    bool _1422 = !_1244;
    int _1424 = _1422 ? 0 : 1;
    float _1426 = trunc(_1414);
    float _1428 = precise::max(_1426, 0.0);
    uint _1430 = uint(_1428);
    bool _1432 = _1412 >= _1410;
    bool _1434 = isnan(_1412);
    bool _1436 = _1432 || _1434;
    bool _1438 = isnan(_1410);
    bool _1440 = _1436 || _1438;
    float _1442 = float(_1440);
    float _1444 = _1228 * _1410;
    int _1446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1448 = _1446 != 0;
    float _1450 = _944 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1452 = !_1418;
    int _1454 = _1452 ? 0 : 1;
    int _1456 = abs(_1424);
    float _1458 = trunc(_1442);
    int _1460 = int(_1458);
    bool _1462 = !_1056;
    float _1464 = _1462 ? _215 : as_type<float>(_1392);
    bool _1466 = !_1448;
    int _1468 = _1466 ? 0 : 1;
    int _1470 = abs(_1454);
    float _1472 = trunc(_1420);
    int _1474 = int(_1472);
    bool _1476 = !_1406;
    int _1478 = _1476 ? 0 : (-1);
    int _1480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1482 = _1480 != 0;
    int _1484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1486 = _1484 != 0;
    int _1488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1490 = _1488 != 0;
    int _1492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1494 = _1492 != 0;
    int _1496 = _1362 * _1456;
    int _1498 = _1496 + _1404;
    int _1500 = ~_1382;
    int _1502 = _1500 + _1478;
    int _1504 = _1502 + 1;
    bool _1506 = !_1486;
    int _1508 = _1506 ? 0 : 1;
    int _1510 = _1188 * _1470;
    int _1512 = _1510 + _1498;
    int _1514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1516 = _1514 != 0;
    int _1518 = _837 * _1504;
    int _1520 = _1518 + _1018;
    int _1522 = ~_799;
    int _1524 = _1522 + 1;
    float _1526 = trunc(_1444);
    int _1528 = int(_1526);
    float _1530 = float(uint(_1512));
    bool _1532 = !_1482;
    int _1534 = _1532 ? 0 : 1;
    int _1536 = _1524 * int(_1430);
    int _1538 = _1536 + _1396;
    bool _1540 = _837 == 0;
    float _1542 = as_type<float>(_839) * _1530;
    int _1544 = ~_1460;
    int _1546 = _1544 + 1;
    int _1548 = _1546 + 1;
    float _1550 = float(uint(_1538));
    float _1552 = _1530;
    float _1554 = as_type<float>(_948);
    if (_1516)
    {
        float _1556 = in.m_64.w;
        _1552 = _1556;
    }
    float _1558 = _1552;
    bool _1560 = !_1540;
    int _1562 = _1560 ? _1520 : (-1);
    float _1564 = trunc(_1542);
    float _1566 = precise::max(_1564, 0.0);
    uint _1568 = uint(_1566);
    int _1570 = abs(_1508);
    float _1572 = as_type<float>(_867) * _1550;
    int _1574 = abs(_1468);
    int _1576 = _1562 * _1548;
    int _1578 = _837 + (-1);
    int _1580 = abs(_1534);
    float _1582 = trunc(_1572);
    float _1584 = precise::max(_1582, 0.0);
    uint _1586 = uint(_1584);
    int _1588 = _1460 * _1578;
    int _1590 = _1588 + _1576;
    int _1592 = _1590 * _1570;
    int _1594 = ~_773;
    int _1596 = _1594 + 1;
    int _1598 = _1528 * _1574;
    int _1600 = _1598 + _1018;
    bool _1602 = _799 == 0;
    int _1604 = _1474 * _1580;
    int _1606 = _1604 + _1592;
    bool _1608 = !_1490;
    int _1610 = _1608 ? 0 : 1;
    int _1612 = _1596 * int(_1568);
    int _1614 = _1612 + _1512;
    int _1616 = ~_799;
    int _1618 = _1616 + 1;
    float _1620 = as_type<float>(_1574);
    if (_1516)
    {
        float _1622 = _1558 * 3.1415927410125732421875;
        _1620 = _1622;
    }
    float _1624 = _1620;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1628 = _1626 != 0;
    int _1630 = int(_1430) + int(_1586);
    float _1632 = _1624;
    if (_1516)
    {
        float _1634 = _1624 * 0.15915493667125701904296875;
        _1632 = _1634;
    }
    float _1636 = _1632;
    int _1638 = abs(_1610);
    bool _1640 = !_1494;
    int _1642 = _1640 ? 0 : 1;
    int _1644 = _1618 * _1630;
    int _1646 = _1644 + _1396;
    float _1648 = float(uint(_1614));
    float _1650 = _1636;
    if (_1516)
    {
        float _1652 = _1636 * 6.283185482025146484375;
        float _1654 = sin(_1652);
        _1650 = _1654;
    }
    float _1656 = _1650;
    int _1658 = abs(_1642);
    int _1660 = _1600 * _1638;
    int _1662 = _1660 + _1606;
    bool _1664 = uint(_1646) >= uint(_799);
    float _1666 = as_type<float>(_839) * _1648;
    float _1668 = as_type<float>(_1570);
    if (_1628)
    {
        float _1670 = in.m_64.x;
        _1668 = _1670;
    }
    float _1672 = _1668;
    float _1674 = float(uint(_1256));
    bool _1676 = !_1664;
    int _1678 = _1676 ? 0 : (-1);
    float _1680 = trunc(_1666);
    float _1682 = precise::max(_1680, 0.0);
    uint _1684 = uint(_1682);
    int _1686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1688 = _1686 != 0;
    float _1690 = as_type<float>(_867) * _1674;
    int _1692 = ~_1630;
    int _1694 = _1692 + _1678;
    int _1696 = _1694 + 1;
    int _1698 = _1528 * _1658;
    int _1700 = _1698 + _1662;
    bool _1702 = !_1688;
    float _1704 = _1702 ? _205 : as_type<float>(_1400);
    bool _1706 = _1688;
    if (_1516)
    {
        bool _1708 = _1656 > 0.5;
        _1706 = _1708;
    }
    bool _1710 = _1706;
    int _1712 = _799 * _1696;
    int _1714 = _1712 + _1396;
    float _1716 = trunc(_1690);
    float _1718 = precise::max(_1716, 0.0);
    uint _1720 = uint(_1718);
    float _1722 = float(uint(_1700));
    float _1724 = 0.0;
    float _1726 = _1722;
    if (!_1516)
    {
        _1724 = _205;
    }
    float _1728 = _1724;
    bool _1730 = !_1602;
    int _1732 = _1730 ? _1714 : (-1);
    float _1734 = as_type<float>(_1024) * _1722;
    int _1736 = ~_799;
    int _1738 = _1736 + 1;
    float _1740 = _1728;
    if (_1516)
    {
        float _1742 = -_205;
        float _1744 = _1710 ? _1742 : _205;
        _1740 = _1744;
    }
    float _1746 = _1740;
    float _1748 = trunc(_1734);
    float _1750 = precise::max(_1748, 0.0);
    uint _1752 = uint(_1750);
    int _1754 = int(_1568) + int(_1684);
    if (_1628)
    {
        float _1756 = _1672 * 3.1415927410125732421875;
        _1726 = _1756;
    }
    float _1758 = _1726;
    int _1760 = _1732 & 3;
    bool _1762 = _1760 != 0;
    int _1764 = _1732 & 3;
    bool _1766 = _1764 != 0;
    float _1768 = _1758;
    if (_1628)
    {
        float _1770 = _1758 * 0.15915493667125701904296875;
        _1768 = _1770;
    }
    float _1772 = _1768;
    int _1774 = _1762 ? 0 : 1;
    bool _1776 = uint(_1764) > 1u;
    int _1778 = _1738 * int(_1720);
    int _1780 = _1778 + _1256;
    float _1782 = float(uint(_1362));
    float _1784 = _1772;
    if (_1628)
    {
        float _1786 = _1772 * 6.283185482025146484375;
        float _1788 = sin(_1786);
        _1784 = _1788;
    }
    float _1790 = _1784;
    int _1792 = ~_773;
    int _1794 = _1792 + 1;
    float _1796 = float(uint(_1780));
    float _1798 = as_type<float>(_839) * _1782;
    int _1800 = ~_837;
    int _1802 = _1800 + 1;
    float _1804 = trunc(_1798);
    float _1806 = precise::max(_1804, 0.0);
    uint _1808 = uint(_1806);
    int _1810 = ~_1774;
    int _1812 = _1810 + 1;
    int _1814 = _1812 + 1;
    float _1816 = as_type<float>(_867) * _1796;
    int _1818 = _1814;
    if (!_1776)
    {
        int _1820 = ~_1774;
        int _1822 = _1820 + 1;
        _1818 = _1822;
    }
    int _1824 = _1818;
    int _1826 = _1794 * _1754;
    int _1828 = _1826 + _1512;
    float _1830 = -_215;
    int _1832 = _1290 ? as_type<int>(_1830) : as_type<int>(_215);
    int _1834 = _1802 * int(_1752);
    int _1836 = _1834 + _1700;
    bool _1838 = uint(_1764) >= 2u;
    float _1840 = trunc(_1816);
    float _1842 = precise::max(_1840, 0.0);
    uint _1844 = uint(_1842);
    bool _1846 = uint(_1828) >= uint(_773);
    float _1848 = float(uint(_1836));
    int _1850 = _1838 ? 0 : 1;
    bool _1852 = _1764 != 3;
    float _1854 = as_type<float>(_1024) * _1848;
    int _1856 = ~_773;
    int _1858 = _1856 + 1;
    bool _1860 = !_1846;
    int _1862 = _1860 ? 0 : (-1);
    float _1864 = trunc(_1854);
    float _1866 = precise::max(_1864, 0.0);
    uint _1868 = uint(_1866);
    int _1870 = ~_1850;
    int _1872 = _1870 + 1;
    int _1874 = _1872 + 1;
    int _1876 = _1858 * int(_1808);
    int _1878 = _1876 + _1362;
    int _1880 = ~_1754;
    int _1882 = _1880 + _1862;
    int _1884 = _1882 + 1;
    float _1886 = float(uint(_1878));
    int _1888 = _773 * _1884;
    int _1890 = _1888 + _1512;
    int _1892 = _1874;
    bool _1894 = _1852;
    float _1896 = as_type<float>(_1808);
    if (_1852)
    {
        int _1898 = ~_1850;
        int _1900 = _1898 + 1;
        _1892 = _1900;
    }
    int _1902 = _1892;
    if (_1628)
    {
        bool _1904 = _1790 > 0.5;
        _1894 = _1904;
    }
    bool _1906 = _1894;
    float _1908 = as_type<float>(_839) * _1886;
    bool _1910 = !_1302;
    int _1912 = _1910 ? _1890 : (-1);
    if (!_1628)
    {
        _859 = _215;
    }
    float _1914 = _859;
    int _1916 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1918 = _1916 != 0;
    float _1920 = trunc(_1908);
    float _1922 = precise::max(_1920, 0.0);
    uint _1924 = uint(_1922);
    float _1926 = _1914;
    if (_1628)
    {
        float _1928 = -_215;
        float _1930 = _1906 ? _1928 : _215;
        _1926 = _1930;
    }
    float _1932 = _1926;
    int _1934 = _1912 & 3;
    bool _1936 = _1934 != 0;
    bool _1938 = !_1918;
    float _1940 = _1938 ? _215 : as_type<float>(_1832);
    int _1942 = int(_1720) + int(_1844);
    bool _1944 = uint(_1934) > 1u;
    int _1946 = int(_1752) + int(_1868);
    float _1948 = _936 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1950 = ~_837;
    int _1952 = _1950 + 1;
    int _1954 = _1912 & 3;
    bool _1956 = _1954 != 0;
    int _1958 = ~_799;
    int _1960 = _1958 + 1;
    int _1962 = _1952 * _1946;
    int _1964 = _1962 + _1700;
    int _1966 = _1956 ? 0 : 1;
    int _1968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1970 = _1968 != 0;
    int _1972 = _1960 * _1942;
    int _1974 = _1972 + _1256;
    float _1976 = float(uint(_1600));
    bool _1978 = !_1970;
    int _1980 = _1978 ? 0 : 1;
    bool _1982 = uint(_1964) >= uint(_837);
    float _1984 = as_type<float>(_1024) * _1976;
    int _1986 = ~_1966;
    int _1988 = _1986 + 1;
    int _1990 = _1988 + 1;
    int _1992 = _1990;
    if (!_1944)
    {
        int _1994 = ~_1966;
        int _1996 = _1994 + 1;
        _1992 = _1996;
    }
    int _1998 = _1992;
    float _2000 = trunc(_1984);
    float _2002 = precise::max(_2000, 0.0);
    uint _2004 = uint(_2002);
    bool _2006 = uint(_1974) >= uint(_799);
    bool _2008 = !_1982;
    int _2010 = _2008 ? 0 : (-1);
    bool _2012 = _1934 != 3;
    bool _2014 = !_2006;
    int _2016 = _2014 ? 0 : (-1);
    bool _2018 = uint(_1934) >= 2u;
    int _2020 = ~_1946;
    int _2022 = _2020 + _2010;
    int _2024 = _2022 + 1;
    int _2026 = ~_773;
    int _2028 = _2026 + 1;
    int _2030 = int(_1808) + int(_1924);
    int _2032 = _837 * _2024;
    int _2034 = _2032 + _1700;
    int _2036 = ~_837;
    int _2038 = _2036 + 1;
    int _2040 = _2018 ? 0 : 1;
    int _2042 = _2028 * _2030;
    int _2044 = _2042 + _1362;
    int _2046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2048 = _2046 != 0;
    int _2050 = ~_2040;
    int _2052 = _2050 + 1;
    int _2054 = _2052 + 1;
    int _2056 = _2054;
    float _2058 = as_type<float>(_2038);
    int _2060 = _1998;
    if (_2012)
    {
        int _2062 = ~_2040;
        int _2064 = _2062 + 1;
        _2056 = _2064;
    }
    int _2066 = _2056;
    int _2068 = _2038 * int(_2004);
    int _2070 = _2068 + _1600;
    int _2072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2074 = _2072 != 0;
    bool _2076 = !_2048;
    int _2078 = _2076 ? 0 : 1;
    bool _2080 = uint(_2044) >= uint(_773);
    bool _2082 = !_1540;
    int _2084 = _2082 ? _2034 : (-1);
    bool _2086 = !_2074;
    int _2088 = _2086 ? 0 : 1;
    bool _2090 = !_2080;
    int _2092 = _2090 ? 0 : (-1);
    int _2094 = _2084 & 3;
    bool _2096 = _2094 != 0;
    float _2098 = float(uint(_2070));
    int _2100 = _2084 & 3;
    bool _2102 = _2100 != 0;
    int _2104 = _2096 ? 0 : 1;
    float _2106 = as_type<float>(_1024) * _2098;
    bool _2108 = uint(_2100) > 1u;
    int _2110 = ~_2104;
    int _2112 = _2110 + 1;
    int _2114 = _2112 + 1;
    float _2116 = trunc(_2106);
    float _2118 = precise::max(_2116, 0.0);
    uint _2120 = uint(_2118);
    float _2122 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2126 = -_2122;
    float _2128 = fma(_1948, 2.0, _2126);
    int _2130 = _2114;
    float _2132 = as_type<float>(_2004);
    if (!_2108)
    {
        int _2134 = ~_2104;
        int _2136 = _2134 + 1;
        _2130 = _2136;
    }
    int _2138 = _2130;
    float _2140 = fma(_1450, -2.0, _2124);
    bool _2142 = uint(_2100) >= 2u;
    float _2144 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _2146 = ~_837;
    int _2148 = _2146 + 1;
    float _2150 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2152 = _2142 ? 0 : 1;
    float _2154 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _2156 = _2100 != 3;
    float _2158 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2150);
    int _2160 = int(_2004) + int(_2120);
    float _2162 = _946 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _2164 = ~_2152;
    int _2166 = _2164 + 1;
    int _2168 = _2166 + 1;
    float _2170 = -_127;
    float _2172 = fma(_2170, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2128);
    int _2174 = _2148 * _2160;
    int _2176 = _2174 + _1600;
    float _2178 = fma(_2162, -2.0, _2154);
    float _2180 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2182 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2158);
    int _2184 = _2168;
    float _2186 = as_type<float>(_2176);
    if (_2156)
    {
        int _2188 = ~_2152;
        int _2190 = _2188 + 1;
        _2184 = _2190;
    }
    int _2192 = _2184;
    float _2194 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2196 = uint(_2176) >= uint(_837);
    float _2198 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2200 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2140);
    bool _2202 = !_2196;
    int _2204 = _2202 ? 0 : (-1);
    float _2206 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2178);
    bool _2208 = _936 > 0.5;
    float _2210 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2212 = -_205;
    int _2214 = _2208 ? as_type<int>(_2212) : as_type<int>(_205);
    bool _2216 = _948 != 1;
    float _2218 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2220 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2222 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2224 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2226 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2228 = _2226 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    if (!_2216)
    {
        _2132 = _944;
    }
    float _2230 = _2132;
    float _2232 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2234 = _2232 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2236 = 0.0;
    float _2238 = _2230;
    if (!_2216)
    {
        _2236 = _944;
    }
    float _2240 = _2236;
    float _2242 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2222);
    float _2244 = _2240;
    if (!_2216)
    {
        _1554 = _962;
    }
    float _2246 = _1554;
    float _2248 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2224);
    float _2250 = _2246;
    if (!_2216)
    {
        _1896 = _962;
    }
    float _2252 = _1896;
    float _2254 = 1.0 / _2228;
    float _2256 = _2252;
    if (_2216)
    {
        _2238 = _936;
    }
    float _2258 = _2238;
    float _2260 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2262 = _2260 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    if (_2216)
    {
        _2244 = _936;
    }
    float _2264 = _2244;
    if (_2216)
    {
        _2250 = _944;
    }
    float _2266 = _2250;
    float _2268 = _2258 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2216)
    {
        _2256 = _944;
    }
    float _2270 = _2256;
    float _2272 = 1.0 / _2234;
    bool _2274 = _950 != 2;
    float _2276 = -_2194;
    float _2278 = fma(_2268, 2.0, _2276);
    float _2280 = _2266 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2282 = fma(_2270, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2218);
    float _2284 = -_127;
    float _2286 = fma(_2284, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2278);
    float _2288 = fma(_2280, -2.0, _2210);
    float _2290 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2292 = _2290 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2294 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2282);
    float _2296 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2288);
    float _2298 = 1.0 / _2262;
    if (_2274)
    {
        _2186 = _936;
    }
    float _2300 = _2186;
    float _2302 = -_2294;
    float _2304 = _2302 + 1.0;
    float _2306 = _2300;
    if (_2274)
    {
        _2058 = _944;
    }
    float _2308 = _2058;
    float _2310 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2312 = _2310 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2314 = _2308;
    if (!_2274)
    {
        _2306 = _962;
    }
    float _2316 = _2306;
    if (!_2274)
    {
        _2314 = _936;
    }
    float _2318 = _2314;
    float _2320 = 1.0 / _2292;
    int _2322 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2324 = _2322 != 0;
    float _2326 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2180);
    float _2328 = _952 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2330 = _2316 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2332 = !_2324;
    float _2334 = _2332 ? _205 : as_type<float>(_2214);
    float _2336 = _2318 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2338 = -_2144;
    float _2340 = fma(_2328, 2.0, _2338);
    float _2342 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2344 = log2(_2342);
    float _2346 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2348 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2350 = isnan(0.0);
    bool _2352 = _2348 || _2350;
    bool _2354 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2356 = _2352 || _2354;
    float _2358 = -_2198;
    float _2360 = fma(_2330, 2.0, _2358);
    float _2362 = fma(_2264, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2346);
    float _2364 = fma(_2336, -2.0, _2220);
    float _2366 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2368 = -_127;
    float _2370 = fma(_2368, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2340);
    float _2372 = _944 * 2.0;
    float _2374 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2242);
    float _2376 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2378 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2366);
    float _2380 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2326);
    float _2382 = _2344 * _127;
    float _2384 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2376);
    float _2386 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2378);
    float _2388 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2248);
    float _2390 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2362);
    float _2392 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2384);
    float _2394 = exp2(_2382);
    float _2396 = -_127;
    float _2398 = fma(_2396, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2360);
    float _2400 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2364);
    float _2402 = _944 + _936;
    float _2404 = -_2380;
    float _2406 = _2404 + 1.0;
    int _2408 = ~_2030;
    int _2410 = _2408 + _2092;
    int _2412 = _2410 + 1;
    float _2414 = floor(_2372);
    float _2416 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2418 = _2416 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2420 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2422 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2420;
    float _2424 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2426 = _2424 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2428 = _773 * _2412;
    int _2430 = _2428 + _1362;
    bool _2432 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2434 = isnan(_755);
    bool _2436 = _2432 || _2434;
    bool _2438 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2440 = _2436 || _2438;
    float _2442 = float(_2440);
    float _2444 = _2422 * _2272;
    float _2446 = _962 * 2.0;
    float _2448 = -_2394;
    float _2450 = _2448 + 1.0;
    float _2452 = 1.0 / _2312;
    float _2454 = in.m_50.x;
    float _2456 = in.m_50.y;
    float _2458 = in.m_50.z;
    float _2460 = _2402 + (-1.0);
    float _2462 = _2356 ? _2450 : 0.0;
    float _2464 = -_2386;
    float _2466 = _2464 + 1.0;
    bool _2468 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2470 = isnan(1.0);
    bool _2472 = _2468 || _2470;
    bool _2474 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2476 = _2472 || _2474;
    float _2478 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2480 = 1.0 + _2478;
    float _2482 = floor(_2446);
    float _2484 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2486 = _2484 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _2488 = _1912 >> 31;
    float _2490 = -_2392;
    float _2492 = _2490 + 1.0;
    int _2494 = ~_1942;
    int _2496 = _2494 + _2016;
    int _2498 = _2496 + 1;
    float _2500 = -_2388;
    float _2502 = _2500 + 1.0;
    int _2504 = _2488 & 3;
    float _2506 = 1.0 / _2480;
    float _2508 = _2426 * _2452;
    int _2510 = _799 * _2498;
    int _2512 = _2510 + _1256;
    int _2514 = _1912 + _2504;
    int _2516 = abs(_2192);
    float _2518 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2520 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2518;
    float _2522 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2524 = _755 + _2522;
    float _2526 = _2456 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2528 = 1.0 / _2486;
    int _2530 = _2514 >> 2;
    float _2532 = fma(_2454, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2526);
    bool _2534 = !_1936;
    int _2536 = _2534 ? 0 : 1;
    if (_2476)
    {
        float _2538 = _2462 * _2506;
        _137 = _2538;
    }
    float _2540 = _137;
    bool _2542 = _1224 >= 0.0;
    bool _2544 = isnan(_1224);
    bool _2546 = _2542 || _2544;
    bool _2548 = isnan(0.0);
    bool _2550 = _2546 || _2548;
    float _2552 = _2456 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2554 = _2456 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _2556 = _2550 ? 0 : 1;
    float _2558 = fma(_2454, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2552);
    bool _2560 = _1224 > 0.0;
    float _2562 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2564 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2562;
    float _2566 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2568 = _2566 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2570 = fma(_2454, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2554);
    float _2572 = fma(_2458, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2558);
    float _2574 = _2564 * _2254;
    float _2576 = _2568 * _2320;
    float _2578 = 1.0 / _2418;
    int _2580 = ~_2556;
    int _2582 = _2580 + 1;
    int _2584 = _2582 + 1;
    float _2586 = fma(_2574, _2524, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2588 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2590 = isnan(_755);
    bool _2592 = _2588 || _2590;
    bool _2594 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2596 = _2592 || _2594;
    float _2598 = float(_2596);
    float _2600 = _2572 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2602 = _2530 << 4;
    int _2604 = _2602 + 656;
    float _2606 = _2520 * _2528;
    int _2608 = _2584;
    if (!_2560)
    {
        int _2610 = ~_2556;
        int _2612 = _2610 + 1;
        _2608 = _2612;
    }
    int _2614 = _2608;
    float _2616 = -_2598;
    float _2618 = _2616 + 1.0;
    bool _2620 = _2414 >= 0.0;
    bool _2622 = isnan(_2414);
    bool _2624 = _2620 || _2622;
    bool _2626 = isnan(0.0);
    bool _2628 = _2624 || _2626;
    bool _2630 = !_1302;
    int _2632 = _2630 ? _2430 : (-1);
    int _2634 = _2628 ? 0 : 1;
    bool _2636 = _2414 > 0.0;
    float _2638 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2640 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2638;
    float _2642 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2644 = _2642 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _2646 = ~_2634;
    int _2648 = _2646 + 1;
    int _2650 = _2648 + 1;
    float _2652 = _2640 * _2298;
    bool _2654 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2656 = isnan(_755);
    bool _2658 = _2654 || _2656;
    bool _2660 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2662 = _2658 || _2660;
    float _2664 = float(_2662);
    float _2666 = _2644 * _2578;
    bool _2668 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2670 = isnan(_755);
    bool _2672 = _2668 || _2670;
    bool _2674 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2676 = _2672 || _2674;
    float _2678 = float(_2676);
    bool _2680 = !_1766;
    int _2682 = _2680 ? 0 : 1;
    float _2684 = -_2664;
    float _2686 = _2684 + 1.0;
    int _2688 = abs(_2536);
    float _2690 = -_2678;
    float _2692 = _2690 + 1.0;
    int _2694 = _2650;
    if (!_2636)
    {
        int _2696 = ~_2634;
        int _2698 = _2696 + 1;
        _2694 = _2698;
    }
    int _2700 = _2694;
    float _2702 = _2442 * _2686;
    int _2704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2706 = _2704 != 0;
    int _2708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2710 = _2708 != 0;
    int _2712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2714 = _2712 != 0;
    float _2716 = -_2442;
    float _2718 = _2716 + 1.0;
    bool _2720 = _2482 >= 0.0;
    bool _2722 = isnan(_2482);
    bool _2724 = _2720 || _2722;
    bool _2726 = isnan(0.0);
    bool _2728 = _2724 || _2726;
    float _2730 = _2664 * _2692;
    bool _2732 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2734 = isnan(_755);
    bool _2736 = _2732 || _2734;
    bool _2738 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2740 = _2736 || _2738;
    float _2742 = float(_2740);
    int _2744 = _2728 ? 0 : 1;
    bool _2746 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2748 = isnan(_755);
    bool _2750 = _2746 || _2748;
    bool _2752 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2754 = _2750 || _2752;
    float _2756 = float(_2754);
    float _2758 = -_2742;
    float _2760 = _2758 + 1.0;
    bool _2762 = _2482 > 0.0;
    float _2764 = _2742 * _2718;
    float _2766 = fma(_2458, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2532);
    float _2768 = fma(_2458, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2570);
    float _2770 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2772 = _755 + _2770;
    float _2774 = _2756 * _2760;
    float _2776 = -_2756;
    float _2778 = _2776 + 1.0;
    bool _2780 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2782 = isnan(_755);
    bool _2784 = _2780 || _2782;
    bool _2786 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2788 = _2784 || _2786;
    float _2790 = float(_2788);
    float _2792 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2794 = _755 + _2792;
    float _2796 = fma(_2576, _2772, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2798 = _2598 * _2778;
    bool _2800 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2802 = isnan(_755);
    bool _2804 = _2800 || _2802;
    bool _2806 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2808 = _2804 || _2806;
    float _2810 = float(_2808);
    float _2812 = fma(_2444, _2794, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2814 = -_2790;
    float _2816 = _2814 + 1.0;
    float _2818 = _2790 * _2618;
    float _2820 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2822 = _755 + _2820;
    float _2824 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2826 = _755 + _2824;
    float _2828 = _2810 * _2816;
    float _2830 = -_2810;
    float _2832 = _2830 + 1.0;
    float _2834 = fma(_2508, _2822, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2836 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2838 = _755 + _2836;
    float _2840 = _2586 * _2828;
    float _2842 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2844 = _755 + _2842;
    float _2846 = _2766 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2848 = fma(_2666, _2838, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2850 = fma(_2832, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2840);
    float _2852 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2854 = _2600 + _2852;
    uint _2856 = uint(int(uint(_2604) >> uint(2)));
    uint _2858 = uint(int(uint(int(_2856)) >> uint(2)));
    int _2860 = int(_2856) & 3;
    float _2862 = (*spvDescriptorSet0.vp_c9)._m0[int(_2858)][_2860];
    int _2864 = int(_2856) + 1;
    uint _2866 = uint(int(uint(_2864) >> uint(2)));
    int _2868 = _2864 & 3;
    float _2870 = (*spvDescriptorSet0.vp_c9)._m0[int(_2866)][_2868];
    float _2872 = fma(_2606, _2844, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2874 = fma(_2796, _2818, _2850);
    float _2876 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2878 = _2846 + _2876;
    float _2880 = _2854 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2882 = _2768 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _2884 = _1934 != 3;
    float _2886 = fma(_2812, _2798, _2874);
    float _2888 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2880);
    float _2890 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2892 = _2882 + _2890;
    int _2894 = ~_2744;
    int _2896 = _2894 + 1;
    int _2898 = _2896 + 1;
    float _2900 = _936 + _962;
    int _2902 = _2898;
    float _2904 = _2702;
    if (!_2762)
    {
        int _2906 = ~_2744;
        int _2908 = _2906 + 1;
        _2902 = _2908;
    }
    int _2910 = _2902;
    float _2912 = _936 + (-0.5);
    float _2914 = fma(_2892, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2888);
    float _2916 = fma(_2652, _2826, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2918 = _2604 + 8;
    uint _2920 = uint(int(uint(_2918) >> uint(2)));
    uint _2922 = uint(int(uint(int(_2920)) >> uint(2)));
    int _2924 = int(_2920) & 3;
    float _2926 = (*spvDescriptorSet0.vp_c9)._m0[int(_2922)][_2924];
    int _2928 = int(_2920) + 1;
    uint _2930 = uint(int(uint(_2928) >> uint(2)));
    int _2932 = _2928 & 3;
    float _2934 = (*spvDescriptorSet0.vp_c9)._m0[int(_2930)][_2932];
    bool _2936 = !_2884;
    int _2938 = _2936 ? 0 : (-1);
    float _2940 = fma(_2834, _2774, _2886);
    bool _2942 = _2914 >= 0.0;
    float _2944 = _944 + _962;
    float _2946 = _944 + (-0.5);
    float _2948 = fma(_2916, _2764, _2940);
    float _2950 = _1932 + (-0.5);
    float _2952 = _1746 + 0.5;
    float _2954 = fma(_2848, _2702, _2948);
    int _2956 = abs(_1998);
    float _2958 = -_2950;
    float _2960 = -_2206;
    float _2962 = fma(_2958, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2960);
    float _2964 = fma(_2460, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2966 = _2334 + 0.5;
    float _2968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_2942)
    {
        _2904 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2970 = _2904;
    float _2972 = _1940 + (-0.5);
    int _2974 = ~_2956;
    int _2976 = _2974 + 1;
    int _2978 = _2976 + 1;
    float _2980 = fma(_2966, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2172);
    float _2982 = fma(_2952, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2370);
    float _2984 = -_2972;
    float _2986 = -_2200;
    float _2988 = fma(_2984, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2986);
    if (_2942)
    {
        float _2990 = _2970 * 5.0;
        _2060 = as_type<int>(_2990);
    }
    int _2992 = _2060;
    float _2994 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2996 = int(_2994);
    float _2998 = fma(_2872, _2730, _2954);
    int _3000 = abs(_2066);
    float _3002 = -_2406;
    float _3004 = fma(_3002, _1746, _2982);
    if (_2942)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9532 = as_type<float>(_2992);
        out.gl_Position.z = _9532;
    }
    float _3006 = -_2182;
    float _3008 = _3006 + 1.0;
    float _3010 = fma(_2678, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2998);
    float _3012 = _2968 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3014 = _2978 * as_type<int>(_2870);
    float _3016 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3018 = fma(_3008, _1932, _2962);
    bool _3020 = !_2706;
    int _3022 = _3020 ? 0 : 1;
    out.m_72.x = _3010;
    int _3024 = ~_2688;
    int _3026 = _3024 + 1;
    int _3028 = _3026 + 1;
    float _3030 = _1704 + 0.5;
    float _3032 = _1464 + (-0.5);
    int _3034 = _3028 * as_type<int>(_2862);
    int _3036 = _3034 + _3014;
    int _3038 = ~_3000;
    int _3040 = _3038 + 1;
    int _3042 = _3040 + 1;
    float _3044 = fma(_3012, _3030, _2286);
    int _3046 = abs(_2938);
    float _3048 = _2854 * _2854;
    out.m_74.x = _3004;
    out.m_74.y = _3018;
    int _3050 = _3042 * as_type<int>(_2926);
    int _3052 = _3050 + _3036;
    float _3054 = float(uint(_2996));
    float _3056 = fma(_2878, _2878, _3048);
    int _3058 = abs(_2078);
    float _3060 = _3016 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3062 = ~_3046;
    int _3064 = _3062 + 1;
    int _3066 = _3064 + 1;
    if (_2942)
    {
        out.m_57.x = 0.0;
    }
    float _3068 = 1.0 / _3054;
    int _3070 = ~_3058;
    int _3072 = _3070 + 1;
    int _3074 = _3072 + 1;
    float _3076 = -_3060;
    float _3078 = -_2296;
    float _3080 = fma(_3076, _3032, _3078);
    int _3082 = _3066 * as_type<int>(_2934);
    int _3084 = _3082 + _3052;
    float _3086 = fma(_2892, _2892, _3056);
    int _3088 = abs(_2996);
    float _3090 = _557 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _3092 = _3084 * _3074;
    float _3094 = rsqrt(_3086);
    int _3096 = _1732 >> 31;
    int _3098 = _2632 * _3058;
    int _3100 = _3098 + _3092;
    float _3102 = float(uint(_3088));
    int _3104 = _3096 & 3;
    int _3106 = as_type<int>(_3068) + (-2);
    float _3108 = float(uint(_3100));
    float _3110 = 1.0 / _3102;
    int _3112 = _1732 + _3104;
    float _3114 = _3090 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3116 = _2084 >> 31;
    float _3118 = as_type<float>(_3106) * _3108;
    int _3120 = abs(_3022);
    float _3122 = _3114 * _3094;
    int _3124 = _3116 & 3;
    int _3126 = ~_2996;
    int _3128 = _3126 + 1;
    float _3130 = trunc(_3118);
    float _3132 = precise::max(_3130, 0.0);
    uint _3134 = uint(_3132);
    float _3136 = _2878 * _3122;
    int _3138 = _2084 + _3124;
    float _3140 = _2854 * _3122;
    float _3142 = float(_2910);
    float _3144 = -_3136;
    float _3146 = _2878 + _3144;
    int _3148 = _3112 >> 2;
    float _3150 = -_3140;
    float _3152 = _2854 + _3150;
    int _3154 = abs(_3100);
    float _3156 = in.m_76.x;
    float _3158 = in.m_76.y;
    float _3160 = in.m_76.z;
    int _3162 = _3148 << 4;
    int _3164 = _3162 + 368;
    float _3166 = _3152 * _3152;
    int _3168 = _3138 >> 2;
    float _3170 = fma(_3146, _3146, _3166);
    int _3172 = as_type<int>(_3110) + (-2);
    int _3174 = _3128 * int(_3134);
    int _3176 = _3174 + _3100;
    float _3178 = float(uint(_3154));
    uint _3180 = uint(int(uint(_3164) >> uint(2)));
    uint _3182 = uint(int(uint(int(_3180)) >> uint(2)));
    int _3184 = int(_3180) & 3;
    float _3186 = (*spvDescriptorSet0.vp_c9)._m0[int(_3182)][_3184];
    int _3188 = int(_3180) + 1;
    uint _3190 = uint(int(uint(_3188) >> uint(2)));
    int _3192 = _3188 & 3;
    float _3194 = (*spvDescriptorSet0.vp_c9)._m0[int(_3190)][_3192];
    float _3196 = float(_3120);
    int _3198 = _3168 << 4;
    int _3200 = _3198 + 800;
    float _3202 = as_type<float>(_3172) * _3178;
    float _3204 = float(uint(_3176));
    float _3206 = _3196 * _3142;
    float _3208 = -_2374;
    float _3210 = _3208 + 1.0;
    uint _3212 = uint(int(uint(_3200) >> uint(2)));
    uint _3214 = uint(int(uint(int(_3212)) >> uint(2)));
    int _3216 = int(_3212) & 3;
    float _3218 = (*spvDescriptorSet0.vp_c9)._m0[int(_3214)][_3216];
    int _3220 = int(_3212) + 1;
    uint _3222 = uint(int(uint(_3220) >> uint(2)));
    int _3224 = _3220 & 3;
    float _3226 = (*spvDescriptorSet0.vp_c9)._m0[int(_3222)][_3224];
    float _3228 = trunc(_3202);
    float _3230 = precise::max(_3228, 0.0);
    uint _3232 = uint(_3230);
    float _3234 = -_2390;
    float _3236 = _3234 + 1.0;
    float _3238 = fma(_1940, _3210, _2988);
    float _3240 = as_type<float>(_3106) * _3204;
    float _3242 = _2892 * _3122;
    float _3244 = -_2466;
    float _3246 = fma(_2334, _3244, _2980);
    float _3248 = -_3236;
    float _3250 = fma(_1704, _3248, _3044);
    float _3252 = fma(_1464, _2304, _3080);
    int _3254 = ~_3088;
    int _3256 = _3254 + 1;
    float _3258 = _3206 * (-2.0);
    float _3260 = trunc(_3240);
    float _3262 = precise::max(_3260, 0.0);
    uint _3264 = uint(_3262);
    int _3266 = abs(_2682);
    out.m_78.x = _3246;
    out.m_78.y = _3238;
    out.m_78.z = _3250;
    out.m_78.w = _3252;
    float _3268 = fma(_3258, _3156, _3156);
    int _3270 = ~_2160;
    int _3272 = _3270 + _2204;
    int _3274 = _3272 + 1;
    float _3276 = -_3242;
    float _3278 = _2892 + _3276;
    int _3280 = _3256 * int(_3232);
    int _3282 = _3280 + _3154;
    float _3284 = fma(_2912, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3268);
    int _3286 = abs(_1980);
    int _3288 = _3164 + 8;
    uint _3290 = uint(int(uint(_3288) >> uint(2)));
    uint _3292 = uint(int(uint(int(_3290)) >> uint(2)));
    int _3294 = int(_3290) & 3;
    float _3296 = (*spvDescriptorSet0.vp_c9)._m0[int(_3292)][_3294];
    int _3298 = int(_3290) + 1;
    uint _3300 = uint(int(uint(_3298) >> uint(2)));
    int _3302 = _3298 & 3;
    float _3304 = (*spvDescriptorSet0.vp_c9)._m0[int(_3300)][_3302];
    int _3306 = _837 * _3274;
    int _3308 = _3306 + _1600;
    int _3310 = abs(_2088);
    float _3312 = fma(_2964, _3258, _2964);
    float _3314 = fma(_3278, _3278, _3170);
    float _3316 = fma(_3312, _2540, _3284);
    int _3318 = _3200 + 8;
    uint _3320 = uint(int(uint(_3318) >> uint(2)));
    uint _3322 = uint(int(uint(int(_3320)) >> uint(2)));
    int _3324 = int(_3320) & 3;
    float _3326 = (*spvDescriptorSet0.vp_c9)._m0[int(_3322)][_3324];
    int _3328 = int(_3320) + 1;
    uint _3330 = uint(int(uint(_3328) >> uint(2)));
    int _3332 = _3328 & 3;
    float _3334 = (*spvDescriptorSet0.vp_c9)._m0[int(_3330)][_3332];
    float _3336 = float(uint(_3282));
    int _3338 = abs(_1824);
    int _3340 = int(_3134) + int(_3264);
    float _3342 = as_type<float>(_3172) * _3336;
    int _3344 = ~_2996;
    int _3346 = _3344 + 1;
    int _3348 = ~_3338;
    int _3350 = _3348 + 1;
    int _3352 = _3350 + 1;
    bool _3354 = !_2102;
    int _3356 = _3354 ? 0 : 1;
    float _3358 = trunc(_3342);
    float _3360 = precise::max(_3358, 0.0);
    uint _3362 = uint(_3360);
    int _3364 = abs(_2138);
    int _3366 = _3346 * _3340;
    int _3368 = _3366 + _3100;
    bool _3370 = _1764 != 3;
    int _3372 = _3352 * as_type<int>(_3194);
    int _3374 = ~_3364;
    int _3376 = _3374 + 1;
    int _3378 = _3376 + 1;
    bool _3380 = !_3370;
    int _3382 = _3380 ? 0 : (-1);
    bool _3384 = uint(_3368) >= uint(_2996);
    int _3386 = _3378 * as_type<int>(_3226);
    int _3388 = abs(_3356);
    int _3390 = ~_3266;
    int _3392 = _3390 + 1;
    int _3394 = _3392 + 1;
    int _3396 = ~_3088;
    int _3398 = _3396 + 1;
    int _3400 = int(_3232) + int(_3362);
    int _3402 = _3394 * as_type<int>(_3186);
    int _3404 = _3402 + _3372;
    bool _3406 = !_3384;
    int _3408 = _3406 ? 0 : (-1);
    bool _3410 = _2100 != 3;
    int _3412 = _3398 * _3400;
    int _3414 = _3412 + _3154;
    int _3416 = ~_3340;
    int _3418 = _3416 + _3408;
    int _3420 = _3418 + 1;
    int _3422 = abs(_1902);
    int _3424 = ~_3388;
    int _3426 = _3424 + 1;
    int _3428 = _3426 + 1;
    int _3430 = _2996 * _3420;
    int _3432 = _3430 + _3100;
    bool _3434 = !_3410;
    int _3436 = _3434 ? 0 : (-1);
    bool _3438 = uint(_3414) >= uint(_3088);
    int _3440 = _3428 * as_type<int>(_3218);
    int _3442 = _3440 + _3386;
    int _3444 = ~_3422;
    int _3446 = _3444 + 1;
    int _3448 = _3446 + 1;
    float _3450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3452 = ~_2516;
    int _3454 = _3452 + 1;
    int _3456 = _3454 + 1;
    int _3458 = _3100 ^ _2996;
    int _3460 = _3448 * as_type<int>(_3296);
    int _3462 = _3460 + _3404;
    bool _3464 = !_3438;
    int _3466 = _3464 ? 0 : (-1);
    int _3468 = _3456 * as_type<int>(_3326);
    int _3470 = _3468 + _3442;
    int _3472 = abs(_3382);
    float _3474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    uint _3476 = uint(int(uint(_3458) >> uint(31)));
    int _3478 = abs(_3436);
    int _3480 = ~_3466;
    int _3482 = _3400 + _3480;
    int _3484 = _3482 + 1;
    int _3486 = ~_3472;
    int _3488 = _3486 + 1;
    int _3490 = _3488 + 1;
    float _3492 = _3450 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3494 = ~int(_3476);
    int _3496 = _3494 + 1;
    int _3498 = ~_3478;
    int _3500 = _3498 + 1;
    int _3502 = _3500 + 1;
    int _3504 = _3490 * as_type<int>(_3304);
    int _3506 = _3504 + _3462;
    bool _3508 = _2996 == 0;
    int _3510 = _3484 ^ _3496;
    int _3512 = _3502 * as_type<int>(_3334);
    int _3514 = _3512 + _3470;
    int _3516 = ~_3310;
    int _3518 = _3516 + 1;
    int _3520 = _3518 + 1;
    bool _3522 = !_3508;
    int _3524 = _3522 ? _3432 : (-1);
    bool _3526 = _2996 == 0;
    int _3528 = _3514 * _3520;
    int _3530 = ~_3496;
    int _3532 = _3530 + _3510;
    int _3534 = _3532 + 1;
    int _3536 = ~_3286;
    int _3538 = _3536 + 1;
    int _3540 = _3538 + 1;
    bool _3542 = _799 == 0;
    bool _3544 = !_3526;
    int _3546 = _3544 ? _3534 : (-1);
    int _3548 = _3506 * _3540;
    bool _3550 = !_3542;
    int _3552 = _3550 ? _2512 : (-1);
    float _3554 = _1154 + (-0.5);
    float _3556 = float(_3524);
    float _3558 = float(_3546);
    float _3560 = _3474 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3562 = _3552 * _3286;
    int _3564 = _3562 + _3548;
    float _3566 = fma(_3492, _3556, _2398);
    bool _3568 = !_1540;
    int _3570 = _3568 ? _3308 : (-1);
    float _3572 = -_2400;
    float _3574 = fma(_3560, _3558, _3572);
    bool _3576 = !_2710;
    int _3578 = _3576 ? 0 : 1;
    float _3580 = _1124 + 0.5;
    int _3582 = _3570 * _3310;
    int _3584 = _3582 + _3528;
    int _3586 = abs(_3578);
    float _3588 = fma(_3492, _3580, _3566);
    float _3590 = -_3560;
    float _3592 = fma(_3590, _3554, _3574);
    float _3594 = float(_3564);
    float _3596 = -_2492;
    float _3598 = fma(_1124, _3596, _3588);
    float _3600 = float(_3584);
    float _3602 = fma(_1154, _2502, _3592);
    float _3604 = float(_2614);
    out.m_80.x = _3594;
    float _3606 = float(_3586);
    out.m_80.w = _3600;
    bool _3608 = !_2714;
    int _3610 = _3608 ? 0 : 1;
    float _3612 = _3606 * _3604;
    out.m_82.x = _3598;
    out.m_82.y = _3602;
    float _3614 = _3160;
    if (_2942)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3616 = -_3140;
    float _3618 = _2600 + _3616;
    float _3620 = -_3136;
    float _3622 = _2846 + _3620;
    float _3624 = -_3242;
    float _3626 = _2882 + _3624;
    int _3628 = abs(_3610);
    float _3630 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3632 = _3618 + _3630;
    float _3634 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3636 = _3622 + _3634;
    float _3638 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3640 = _3626 + _3638;
    float _3642 = _2944 + (-1.0);
    float _3644 = _3632 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3646 = _3612 * (-2.0);
    float _3648 = float(_2700);
    float _3650 = fma(_3642, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3652 = fma(_3636, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3644);
    float _3654 = float(_3628);
    float _3656 = fma(_3646, _3158, _3158);
    float _3658 = fma(_3650, _3646, _3650);
    float _3660 = fma(_3640, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3652);
    float _3662 = _2900 + (-1.0);
    float _3664 = fma(_2946, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3656);
    float _3666 = _3654 * _3648;
    float _3668 = _3316 * 0.15915493667125701904296875;
    bool _3670 = _3660 >= 0.0;
    float _3672 = fma(_3658, _2540, _3664);
    float _3674 = _3666 * (-2.0);
    float _3676 = fma(_3662, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3678 = sqrt(_3314);
    float _3680 = _3672 * 0.15915493667125701904296875;
    float _3682 = fma(_3674, _3160, _3160);
    float _3684 = _962 + (-0.5);
    float _3686 = fma(_3676, _3674, _3676);
    float _3688 = fma(_3684, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3682);
    float _3690 = _3668 * 6.283185482025146484375;
    float _3692 = sin(_3690);
    float _3694 = _3632;
    float _3696 = _3622;
    if (_3670)
    {
        _3614 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3698 = _3614;
    int _3700 = as_type<int>(_3698);
    if (_3670)
    {
        out.m_57.x = 0.0;
    }
    float _3702 = fma(_3686, _2540, _3688);
    if (_3670)
    {
        float _3704 = _3698 * 5.0;
        _3700 = as_type<int>(_3704);
    }
    int _3706 = _3700;
    float _3708 = _3702 * 0.15915493667125701904296875;
    float _3710 = _3668 * 6.283185482025146484375;
    float _3712 = cos(_3710);
    if (_3670)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10552 = as_type<float>(_3706);
        out.gl_Position.z = _10552;
    }
    float _3714 = _3680 * 6.283185482025146484375;
    float _3716 = sin(_3714);
    float _3718 = _3680 * 6.283185482025146484375;
    float _3720 = cos(_3718);
    if (_3670)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3722 = _3708 * 6.283185482025146484375;
    float _3724 = cos(_3722);
    float _3726 = _3094 * _3678;
    float _3728 = _555 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3730 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _215);
    float _3732 = _3692 * _3716;
    float _3734 = _3090 * _3726;
    float _3736 = _3726 * _3728;
    float _3738 = _3712 * _3716;
    float _3740 = _3708 * 6.283185482025146484375;
    float _3742 = sin(_3740);
    float _3744 = _3692 * _3720;
    float _3746 = _3730 * _3736;
    float _3748 = _3712 * _3720;
    float _3750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _205);
    float _3752 = _3712 * _3724;
    float _3754 = _3750 * _3734;
    float _3756 = _3692 * _3724;
    float _3758 = _3720 * _3724;
    float _3760 = _3752 * _3746;
    float _3762 = _3726 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3764 = _3762 * 0.5;
    float _3766 = _3716 * _3724;
    float _3768 = fma(_3742, _3748, _3732);
    float _3770 = -_3744;
    float _3772 = fma(_3742, _3738, _3770);
    float _3774 = -_3746;
    float _3776 = _3742 * _3774;
    float _3778 = -_3738;
    float _3780 = fma(_3742, _3744, _3778);
    float _3782 = fma(_3768, _3754, _3760);
    float _3784 = _3756 * _3746;
    float _3786 = fma(_3758, _3754, _3776);
    float _3788 = fma(_3742, _3732, _3748);
    float _3790 = fma(_3772, _3764, _3782);
    float _3792 = fma(_3780, _3754, _3784);
    float _3794 = fma(_3766, _3764, _3786);
    float _3796 = _3790 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3798 = _3790 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3800 = fma(_3788, _3764, _3792);
    float _3802 = _3790 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3804 = fma(_3794, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3796);
    float _3806 = fma(_3794, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3798);
    float _3808 = fma(_3794, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3802);
    float _3810 = fma(_3800, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3804);
    float _3812 = fma(_3800, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3806);
    float _3814 = fma(_3800, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3808);
    float _3816 = _3810 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3818 = _3812 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3820 = _2846 + _3816;
    float _3822 = _2882 + _3818;
    float _3824 = _3814 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3826 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3828 = _3820 + _3826;
    float _3830 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3832 = _3822 + _3830;
    float _3834 = _2600 + _3824;
    float _3836 = _3828 * _3828;
    float _3838 = _3832 * _3832;
    float _3840 = _3836 + _3838;
    float _3842 = sqrt(_3840);
    bool _3844 = _3842 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3846 = _3800;
    float _3848 = _3820;
    float _3850 = _3822;
    float _3852 = _3836;
    float _3854 = _3838;
    if (!_3844)
    {
        _3846 = _3834;
    }
    float _3856 = _3846;
    bool _3858 = !_3844;
    float _3860 = _3856;
    if (!_3858)
    {
        float _3862 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3864 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3866 = _3842 + _3864;
        float _3868 = rsqrt(_3840);
        float _3870 = _3866 * _3862;
        float _3872 = _3834 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3874 = _3870 * 0.15915493667125701904296875;
        float _3876 = _3874 * 6.283185482025146484375;
        float _3878 = sin(_3876);
        float _3880 = _3874 * 6.283185482025146484375;
        float _3882 = cos(_3880);
        float _3884 = fma(_3878, _3872, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3886 = _3868 * _3884;
        float _3888 = _3882 + (-1.0);
        float _3890 = fma(_3828, _3886, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3892 = fma(_3832, _3886, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3894 = _3888 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3896 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3898 = _3890 + _3896;
        float _3900 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3902 = _3892 + _3900;
        float _3904 = fma(_3834, _3882, _3894);
        float _3906 = _3898 * _3898;
        float _3908 = _3902 * _3902;
        _3848 = _3890;
        _3850 = _3892;
        _3860 = _3904;
        _3852 = _3906;
        _3854 = _3908;
    }
    float _3910 = _3848;
    float _3912 = _3850;
    float _3914 = _3860;
    float _3916 = _3852;
    float _3918 = _3854;
    float _3920 = fma(_3910, 6.2500002968590706586837768554688e-05, 0.5);
    float _3922 = fma(_3912, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _10889 = float2(_3920, _3922);
    float3 _3926 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_10889, float2(0.0), isnan(_10889)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_10889, float2(0.0), isnan(_10889)), level(0.0)).xyz;
    float _3928 = _3926.x;
    float _3930 = _3926.y;
    float _3932 = _3926.z;
    float _3934 = _3768 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3936 = _3768 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3938 = _3768 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3940 = _3752 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3942 = _3752 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3944 = _3752 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3946 = _215 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3948 = fma(_3758, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3934);
    float _3950 = fma(_3758, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3936);
    float _3952 = fma(_3758, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3938);
    float _3954 = -_3742;
    float _3956 = fma(_3954, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3940);
    float _3958 = -_3742;
    float _3960 = fma(_3958, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3942);
    float _3962 = -_3742;
    float _3964 = fma(_3962, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3944);
    float _3966 = fma(_3946, _3946, 1.0);
    float _3968 = _3772 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3970 = _3772 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3972 = _3772 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3974 = fma(_3756, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3956);
    float _3976 = fma(_3766, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3968);
    float _3978 = rsqrt(_3966);
    float _3980 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3982 = _3914 + _3980;
    float _3984 = fma(_3766, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3970);
    float _3986 = fma(_3766, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3972);
    float _3988 = fma(_3756, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3960);
    float _3990 = fma(_3982, _3982, _3916);
    float _3992 = fma(_3756, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3964);
    float _3994 = fma(_3788, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3976);
    float _3996 = fma(_3788, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3984);
    float _3998 = _3990 + _3918;
    float _4000 = fma(_3788, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3986);
    float _4002 = fma(_3780, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3948);
    float _4004 = fma(_3780, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3950);
    float _4006 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4008 = _3946 * _3974;
    float _4010 = _3946 * _3988;
    float _4012 = _3946 * _3978;
    float _4014 = fma(_3780, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3952);
    float _4016 = _3946 * _3992;
    float _4018 = sqrt(_3998);
    float _4020 = -_3994;
    float _4022 = _4012 * _4020;
    float _4024 = -_3996;
    float _4026 = _4012 * _4024;
    float _4028 = -_4000;
    float _4030 = _4012 * _4028;
    float _4032 = fma(_4006, _4002, _4008);
    float _4034 = fma(_4006, _4004, _4010);
    float _4036 = fma(_4006, _4014, _4016);
    float _4038 = fma(_3978, _3974, _4022);
    float _4040 = fma(_3978, _3988, _4026);
    float _4042 = fma(_3978, _3992, _4030);
    float _4044 = _3994 + _4032;
    float _4046 = _3996 + _4034;
    float _4048 = _4000 + _4036;
    out.m_84.x = _4002;
    out.m_84.y = _4004;
    out.m_84.z = _4014;
    bool _4050 = _4018 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4052 = isnan(_4018);
    bool _4054 = _4050 || _4052;
    bool _4056 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4058 = _4054 || _4056;
    out.m_86.x = _4038;
    out.m_86.y = _4040;
    out.m_86.z = _4042;
    out.m_88.x = _4044;
    out.m_88.y = _4046;
    out.m_88.z = _4048;
    float _4060 = _4032;
    if (!_4058)
    {
        _4060 = 1.0;
    }
    float _4062 = _4060;
    out.m_90.x = _3928;
    out.m_90.y = _3930;
    out.m_90.z = _3932;
    bool _4064 = !_4058;
    float _4066 = _4062;
    if (!_4064)
    {
        bool _4068 = _4018 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4070 = isnan(_4018);
        bool _4072 = _4068 || _4070;
        bool _4074 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4076 = _4072 || _4074;
        if (!_4076)
        {
            float _4078 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4080 = _4018 + _4078;
            float _4082 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4084 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4082;
            float _4086 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4088 = _4086 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4090 = 1.0 / _4084;
            float _4092 = _4080 * _4090;
            float _4094 = fma(_4092, _4088, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4066 = _4094;
            _4096 = true;
        }
        else
        {
            bool _4098 = _4018 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4100 = isnan(_4018);
            bool _4102 = _4098 || _4100;
            bool _4104 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4106 = _4102 || _4104;
            if (!_4106)
            {
                float _4108 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4110 = _4018 + _4108;
                float _4112 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4114 = _4112 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4116 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4118 = _4116 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4120 = 1.0 / _4114;
                float _4122 = _4110 * _4120;
                float _4124 = fma(_4122, _4118, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4066 = _4124;
                _4096 = true;
            }
            else
            {
                _4066 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4096 = false;
    float _4126 = _4066;
    float _4128 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4130 = _3914 + _4128;
    float _4132 = _3618 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4134 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4136 = _3910 + _4134;
    float _4138 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4140 = _3912 + _4138;
    float _4142 = fma(_4130, _4126, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4144 = fma(_3622, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4132);
    float _4146 = fma(_4136, _4126, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4148 = fma(_4140, _4126, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4150 = -_2600;
    float _4152 = _4150 + _4142;
    float _4154 = fma(_3626, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4144);
    float _4156 = -_2846;
    float _4158 = _4156 + _4146;
    float _4160 = _3618 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4162 = _4152 * _4152;
    float _4164 = _4154 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4166 = -_2882;
    float _4168 = _4166 + _4148;
    float _4170 = fma(_3622, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4160);
    float _4172 = fma(_4158, _4158, _4162);
    float _4174 = 1.0 / _4164;
    float _4176 = fma(_3626, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4170);
    float _4178 = fma(_4168, _4168, _4172);
    float _4180 = _4176 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4182 = sqrt(_4178);
    float _4184 = _4180 + _4164;
    float _4186 = _4184 * _4174;
    float _4188 = _4186 * 0.5;
    float _4190 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4192 = fma(_4188, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4190);
    bool _4194 = _4182 > 0.0;
    float _4196 = 1.0 / _4192;
    bool _4198 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4200 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4202 = _4198 || _4200;
    bool _4204 = isnan(0.5);
    bool _4206 = _4202 || _4204;
    bool _4208 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4210 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4212 = _4208 || _4210;
    bool _4214 = isnan(0.5);
    bool _4216 = _4212 || _4214;
    float _4218 = _4188;
    float _4220 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4222 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4224 = _4152;
    if (!_4194)
    {
        _4218 = _4146;
    }
    float _4226 = _4218;
    float _4228 = _4226;
    float _4230 = _4226;
    if (!_4194)
    {
        _4220 = _4142;
    }
    float _4232 = _4220;
    float _4234 = _4232;
    if (!_4194)
    {
        _4222 = _4148;
    }
    float _4236 = _4222;
    bool _4238 = !_4194;
    float _4240 = _4236;
    float _4242 = _4196;
    if (!_4238)
    {
        float _4244 = _219 * _219;
        float _4246 = fma(_217, _217, _4244);
        float _4248 = fma(_221, _221, _4246);
        float _4250 = rsqrt(_4178);
        float _4252 = sqrt(_4248);
        float _4254 = _4158 * _4250;
        float _4256 = _4152 * _4250;
        float _4258 = _4168 * _4250;
        bool _4260 = _4252 > 0.0;
        float _4262 = _4252;
        float _4264 = _4250;
        _4224 = _4256;
        if (!_4260)
        {
            _4228 = _4146;
        }
        float _4266 = _4228;
        _4230 = _4266;
        if (!_4260)
        {
            _4262 = _4142;
        }
        float _4268 = _4262;
        _4234 = _4268;
        if (!_4260)
        {
            _4264 = _4148;
        }
        float _4270 = _4264;
        bool _4272 = !_4260;
        _4240 = _4270;
        if (!_4272)
        {
            float _4274 = rsqrt(_4248);
            float _4276 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4278 = _219 * _4274;
            float _4280 = _217 * _4274;
            float _4282 = _221 * _4274;
            float _4284 = _4256 * _4278;
            float _4286 = fma(_4254, _4280, _4284);
            float _4288 = _4276 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4290 = fma(_4258, _4282, _4286);
            float _4292 = _4290 * _4288;
            float _4294 = fma(_217, _4292, _4146);
            float _4296 = fma(_219, _4292, _4142);
            float _4298 = fma(_221, _4292, _4148);
            _4230 = _4294;
            _4234 = _4296;
            _4240 = _4298;
        }
    }
    float _4300 = _4230;
    float _4302 = _4234;
    float _4304 = _4240;
    float _4306 = _4224;
    float _4308 = -_3136;
    float _4310 = _4308 + _4300;
    float _4312 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4314 = _4196 * _4312;
    float _4316 = -_3140;
    float _4318 = _4316 + _4302;
    float _4320 = -_3242;
    float _4322 = _4320 + _4304;
    float _4324 = _4318;
    float _4326 = _4322;
    float _4328 = _4306;
    if (_4206)
    {
        _225 = 1.0;
    }
    float _4330 = _225;
    float _4332 = _4330;
    if (_4216)
    {
        _4242 = _4310;
    }
    float _4334 = _4242;
    float _4336 = _4334;
    if (!_4216)
    {
        float _4338 = _3632 * _3632;
        float _4340 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4342 = -_2882;
        float _4344 = _4342 + _4304;
        float _4346 = -_2846;
        float _4348 = _4346 + _4300;
        float _4350 = fma(_3636, _3636, _4338);
        float _4352 = -_2600;
        float _4354 = _4352 + _4302;
        float _4356 = fma(_3640, _3640, _4350);
        float _4358 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4360 = sqrt(_4356);
        float _4362 = 1.0 / _3726;
        float _4364 = _4358 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4366 = precise::min(_4360, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4368 = _4366 * _4340;
        float _4370 = _4368 * _4362;
        float _4372 = _4364 * _4370;
        float _4374 = _4344 * _4370;
        float _4376 = fma(_4354, _4372, _3618);
        float _4378 = fma(_4348, _4372, _3622);
        float _4380 = fma(_4364, _4374, _3626);
        _4324 = _4376;
        _4336 = _4378;
        _4326 = _4380;
    }
    float _4382 = _4324;
    float _4384 = _4336;
    float _4386 = _4326;
    if (!_4206)
    {
        float _4388 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4390 = _4388 * 0.15915493667125701904296875;
        float _4392 = _4390 * 6.283185482025146484375;
        float _4394 = cos(_4392);
        float _4396 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4398 = _4396 * 0.15915493667125701904296875;
        float _4400 = _4390 * 6.283185482025146484375;
        float _4402 = sin(_4400);
        float _4404 = 1.0 / _4394;
        float _4406 = _4398 * 6.283185482025146484375;
        float _4408 = cos(_4406);
        float _4410 = _4402 * _4404;
        float _4412 = _4398 * 6.283185482025146484375;
        float _4414 = sin(_4412);
        float _4416 = _4408 * _4410;
        float _4418 = 1.0 / _4416;
        float _4420 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4422 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4420;
        float _4424 = 1.0 / _4422;
        float _4426 = _4414 * _4418;
        float _4428 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4430 = fma(_4314, _4426, _4428);
        float _4432 = _4430 * _4424;
        float _4434 = precise::clamp(_4432, 0.0, 1.0);
        _3694 = _4398;
        _4332 = _4434;
    }
    float _4436 = _3694;
    float _4438 = _4332;
    float _4440 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4442 = _4382 + _4440;
    float _4444 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4446 = _4384 + _4444;
    float _4448 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4450 = _4386 + _4448;
    float _4452 = _4442 * _4442;
    float _4454 = fma(_4446, _4446, _4452);
    float _4456 = fma(_3622, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4458 = fma(_4450, _4450, _4454);
    float _4460 = rsqrt(_4458);
    float _4462 = sqrt(_4458);
    float _4464 = _4460 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4466 = _4446 * _4464;
    float _4468 = _4450 * _4464;
    float _4470 = _4466 * _4466;
    float _4472 = _4468 * _4468;
    float _4474 = _4470 + _4472;
    float _4476 = sqrt(_4474);
    bool _4478 = _4476 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4480 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4482 = _4476 + _4480;
    float _4484 = _4460;
    float _4486 = _4482;
    float _4488 = _4442;
    if (_4478)
    {
        float _4490 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4484 = _4490;
    }
    float _4492 = _4484;
    float _4494 = _4492;
    if (_4478)
    {
        float _4496 = _4482 * _4492;
        _4486 = _4496;
    }
    float _4498 = _4486;
    if (_4478)
    {
        float _4500 = rsqrt(_4474);
        _4494 = _4500;
    }
    float _4502 = _4494;
    float _4504 = _4502;
    if (_4478)
    {
        float _4506 = _4498 * 0.15915493667125701904296875;
        _227 = _4506;
    }
    float _4508 = _227;
    float _4510 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4512 = _4450;
    if (_4478)
    {
        float _4514 = _4508 * 6.283185482025146484375;
        float _4516 = sin(_4514);
        _4512 = _4516;
    }
    float _4518 = _4512;
    float _4520 = precise::max(0.0, _4510);
    float _4522 = _4436;
    float _4524 = _4520;
    if (_4478)
    {
        float _4526 = _4508 * 6.283185482025146484375;
        float _4528 = cos(_4526);
        _4522 = _4528;
    }
    float _4530 = _4522;
    float _4532 = -_4464;
    float _4534 = -_4520;
    float _4536 = fma(_4442, _4532, _4534);
    if (_4478)
    {
        float _4538 = _4536 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4488 = _4538;
    }
    float _4540 = _4488;
    float _4542 = floor(_4456);
    float _4544 = _4518;
    float _4546 = _4540;
    if (_4478)
    {
        float _4548 = fma(_4518, _4540, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4544 = _4548;
    }
    float _4550 = _4544;
    float _4552 = _4550;
    if (!_4478)
    {
        _4546 = _4536;
    }
    float _4554 = _4546;
    float _4556 = _4554;
    if (_4478)
    {
        float _4558 = _4502 * _4550;
        _4328 = _4558;
    }
    float _4560 = _4328;
    if (!_4478)
    {
        _4504 = _4466;
    }
    float _4562 = _4504;
    float _4564 = _4562;
    if (_4478)
    {
        float _4566 = _4530 + (-1.0);
        _4524 = _4566;
    }
    float _4568 = _4524;
    float _4570 = _4568;
    if (_4478)
    {
        float _4572 = _4466 * _4560;
        _4564 = _4572;
    }
    float _4574 = _4564;
    if (!_4478)
    {
        _4552 = _4470;
    }
    float _4576 = _4552;
    float _4578 = _4576;
    if (_4478)
    {
        float _4580 = _4568 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3696 = _4580;
    }
    float _4582 = _3696;
    float _4584 = _4582;
    if (!_4478)
    {
        _4570 = _4468;
    }
    float _4586 = _4570;
    float _4588 = _4586;
    if (_4478)
    {
        float _4590 = _4468 * _4560;
        _4588 = _4590;
    }
    float _4592 = _4588;
    if (_4478)
    {
        float _4594 = _4574 * _4574;
        _4578 = _4594;
    }
    float _4596 = _4578;
    if (_4478)
    {
        float _4598 = fma(_4536, _4530, _4582);
        _4556 = _4598;
    }
    float _4600 = _4556;
    if (!_4478)
    {
        _4584 = _4472;
    }
    float _4602 = _4584;
    float _4604 = _4602;
    if (_4478)
    {
        float _4606 = _4592 * _4592;
        _4604 = _4606;
    }
    float _4608 = _4604;
    float _4610 = fma(_4600, _4600, _4596);
    float _4612 = _4382 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4614 = -_4542;
    float _4616 = _4456 + _4614;
    float _4618 = _4610 + _4608;
    float _4620 = fma(_4384, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4612);
    float _4622 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4624 = fma(_4462, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4622);
    float _4626 = precise::clamp(_4624, 0.0, 1.0);
    float _4628 = rsqrt(_4618);
    float _4630 = fma(_4386, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4620);
    float _4632 = -_4626;
    float _4634 = _4632 + 1.0;
    float _4636 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4638 = fma(_3626, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4640 = _4630 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4642 = _4382 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4644 = abs(_4634);
    float _4646 = log2(_4644);
    float _4648 = _4640 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4650 = _4382 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4652 = -_4648;
    float _4654 = fma(_4652, _4636, 1.0);
    float _4656 = _4382 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4658 = fma(_4384, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4650);
    float _4660 = _4628 * _4574;
    float _4662 = _4628 * _4600;
    float _4664 = fma(_4384, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4656);
    float _4666 = fma(_4386, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4658);
    float _4668 = _4660 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4670 = _4628 * _4592;
    float _4672 = fma(_4386, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4664);
    float _4674 = _4666 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4676 = -_4668;
    float _4678 = fma(_4662, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4676);
    float _4680 = fma(_4384, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4642);
    float _4682 = _4672 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4684 = _4674 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4686 = -_4670;
    float _4688 = fma(_4686, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4678);
    float _4690 = floor(_4638);
    float _4692 = fma(_4386, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4680);
    float _4694 = fma(_4682, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4684);
    float _4696 = fma(_4688, -0.5, 0.5);
    float _4698 = _4646 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4700 = _4692 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4702 = fma(_4640, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4694);
    float _4704 = fma(_4688, 0.5, 0.5);
    float _4706 = exp2(_4698);
    float _4708 = _4662 + 1.0;
    float _4710 = fma(_4700, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4702);
    float _4712 = _4674 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4714 = fma(_4704, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4716 = fma(_4682, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4712);
    float _4718 = sqrt(_4696);
    float _4720 = _4674 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4722 = -_4690;
    float _4724 = _4638 + _4722;
    float _4726 = fma(_4704, _4714, -0.212114393711090087890625);
    float _4728 = fma(_4640, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4716);
    float _4730 = fma(_4682, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4720);
    float _4732 = fma(_4704, _4726, 1.570728778839111328125);
    float _4734 = log2(_4654);
    float _4736 = fma(_4640, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4730);
    float _4738 = fma(_4700, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4728);
    float _4740 = -_4662;
    float _4742 = fma(_4706, _4708, _4740);
    float _4744 = fma(_4700, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4736);
    float _4746 = fma(_4742, 0.5, 0.5);
    float _4748 = 1.0 / _4710;
    float _4750 = _4718 * 0.636619746685028076171875;
    float _4752 = -_4732;
    float _4754 = fma(_4750, _4752, 1.0);
    float2 _12287 = float2(_4616, _4724);
    float _4756 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12287, float2(0.0), isnan(_12287)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12287, float2(0.0), isnan(_12287)), level(0.0)).x;
    float _4758 = _4734 * 0.693147182464599609375;
    float _4760 = _4738 * _4748;
    float _4762 = _4744 * _4748;
    float _4764 = _4758 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4766 = fma(_4760, 0.5, 0.5);
    float _4768 = fma(_4762, -0.5, 0.5);
    float3 _12313 = float3(_4766, _4768, _4764);
    float _4770 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12313, float3(0.0), isnan(_12313)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12313, float3(0.0), isnan(_12313)), level(0.0)).x;
    float3 _12324 = float3(_4766, _4768, _4764);
    float4 _4773 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12324, float3(0.0), isnan(_12324)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12324, float3(0.0), isnan(_12324)), level(0.0)).xyzw;
    float _4775 = _4773.x;
    float _4777 = _4773.y;
    float _4779 = _4773.z;
    float _4781 = _4773.w;
    float2 _12340 = float2(_4754, _4746);
    float3 _4783 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12340, float2(0.0), isnan(_12340)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12340, float2(0.0), isnan(_12340)), level(0.0)).xyz;
    float _4785 = _4783.x;
    float _4787 = _4783.y;
    float _4789 = _4783.z;
    float _4791 = abs(_4314);
    float _4793 = log2(_4791);
    float _4795 = _4674 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _4797 = _4462 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4799 = isnan(_4462);
    bool _4801 = _4797 || _4799;
    bool _4803 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4805 = _4801 || _4803;
    float _4807 = fma(_4682, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4795);
    float _4809 = fma(_4640, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4807);
    float _4811 = _4738 + _4710;
    float _4813 = fma(_4700, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4809);
    float _4815 = _4793 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4817 = in.m_92.x;
    float _4819 = _4811 * 0.5;
    out.gl_Position.x = _4738;
    out.gl_Position.y = _4744;
    out.gl_Position.z = _4813;
    out.gl_Position.w = _4710;
    float _4821 = exp2(_4815);
    float _4823 = _4738;
    float _4825 = _4813;
    float _4827 = _4710;
    float _4829 = _4744;
    if (!_4805)
    {
        _4823 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4831 = _4823;
    float _4833 = fma(_4821, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4835 = precise::clamp(_4833, 0.0, 1.0);
    float _4837 = _4813 + _4710;
    float _4839 = _4831;
    float _4841 = _4831;
    if (!_4805)
    {
        _4825 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4843 = _4825;
    float _4845 = fma(_4835, -2.0, 3.0);
    float _4847 = _4835 * _4835;
    float _4849 = _4837 * 0.5;
    float _4851 = _4847 * _4845;
    float _4853 = _4646 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _4855 = _4314 <= 8000.0;
    bool _4857 = isnan(_4314);
    bool _4859 = _4855 || _4857;
    bool _4861 = isnan(8000.0);
    bool _4863 = _4859 || _4861;
    float _4865 = float(_4863);
    float _4867 = _4710 * 0.5;
    float _4869 = -_4851;
    float _4871 = _4869 + 1.0;
    float _4873 = exp2(_4853);
    float _4875 = fma(_4871, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4851);
    float _4877 = fma(_4744, -0.5, _4867);
    float _4879 = _4865 * _4875;
    float _4881 = _4843;
    float _4883 = _4843;
    if (!_4805)
    {
        _4827 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4885 = _4827;
    out.m_94.x = _4819;
    out.m_94.y = _4877;
    out.m_94.z = _4849;
    out.m_94.w = _4710;
    float _4887 = _4879 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4889 = _4885;
    float _4891 = _4885;
    if (!_4805)
    {
        _4829 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4893 = _4829;
    float _4895 = -_4873;
    float _4897 = _4895 + 1.0;
    float _4899 = _4897 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4901 = -_4756;
    float _4903 = _4901 + 1.0;
    float _4905 = _4903 * _4887;
    float _4907 = precise::clamp(_4905, 0.0, 1.0);
    float _4909 = -_4907;
    float _4911 = fma(_4909, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4913 = _4911 * _4817;
    float _4915 = _4913 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4917 = _4899 * _4770;
    float _4919 = -_4899;
    float _4921 = _4919 + 1.0;
    out.m_96.x = _4915;
    float _4923 = _4781 * _4917;
    float _4925 = _4789 * _4917;
    float _4927 = _4781 * _4921;
    float _4929 = fma(_4785, _4923, _4775);
    float _4931 = fma(_4787, _4923, _4777);
    float _4933 = fma(_4781, _4925, _4779);
    float _4935 = _4438 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4937 = _4923;
    float _4939 = _4779;
    float _4941 = _4893;
    float _4943 = _4893;
    if (!_4805)
    {
        _4937 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4945 = _4937;
    float _4947 = _4945;
    float _4949 = _4945;
    if (!_4805)
    {
        _4939 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4951 = _4939;
    out.m_98.x = _4929;
    out.m_98.y = _4931;
    out.m_98.z = _4933;
    out.m_98.w = _4927;
    bool _4953 = !_4805;
    float _4955 = _4951;
    float _4957 = _4951;
    if (!_4953)
    {
        bool _4959 = _4462 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4961 = isnan(_4462);
        bool _4963 = _4959 || _4961;
        bool _4965 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4967 = _4963 || _4965;
        if (!_4967)
        {
            float _4969 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4971 = _4462 + _4969;
            float _4973 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4975 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4973;
            float _4977 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4979 = _4977 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4981 = 1.0 / _4975;
            float _4983 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4985 = _4983 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4987 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4989 = _4987 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4991 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4993 = _4991 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4995 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4997 = _4995 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4999 = _4971 * _4981;
            float _5001 = precise::clamp(_4999, 0.0, 1.0);
            float _5003 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5005 = _5003 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5007 = fma(_5001, _4979, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5009 = fma(_5001, _5005, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5011 = fma(_5001, _4985, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5013 = fma(_5001, _4989, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5015 = fma(_5001, _4993, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5017 = fma(_5001, _4997, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4957 = _5011;
            _4943 = _5015;
            _4949 = _5007;
            _4883 = _5013;
            _4891 = _5009;
            _4841 = _5017;
            _5019 = true;
        }
        else
        {
            bool _5021 = _4462 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5023 = isnan(_4462);
            bool _5025 = _5021 || _5023;
            bool _5027 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5029 = _5025 || _5027;
            if (!_5029)
            {
                _4947 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5031 = _4947;
            _4949 = _5031;
            if (!_5029)
            {
                _4955 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5033 = _4955;
            _4957 = _5033;
            if (!_5029)
            {
                _4889 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5035 = _4889;
            _4891 = _5035;
            if (!_5029)
            {
                _4881 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5037 = _4881;
            _4883 = _5037;
            if (!_5029)
            {
                _4941 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5039 = _4941;
            _4943 = _5039;
            if (!_5029)
            {
                _4839 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5041 = _4839;
            bool _5043 = !_5029;
            _4841 = _5041;
            if (!_5043)
            {
                bool _5045 = _4462 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5047 = isnan(_4462);
                bool _5049 = _5045 || _5047;
                bool _5051 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5053 = _5049 || _5051;
                if (!_5053)
                {
                    float _5055 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5057 = _4462 + _5055;
                    float _5059 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5061 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5059;
                    float _5063 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5065 = _5063 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5067 = 1.0 / _5061;
                    float _5069 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5071 = _5069 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5073 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5075 = _5073 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5077 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5079 = _5077 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5081 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5083 = _5081 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5085 = _5057 * _5067;
                    float _5087 = precise::clamp(_5085, 0.0, 1.0);
                    float _5089 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5091 = _5089 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5093 = fma(_5087, _5065, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5095 = fma(_5087, _5091, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5097 = fma(_5087, _5071, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5099 = fma(_5087, _5075, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5101 = fma(_5087, _5079, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5103 = fma(_5087, _5083, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4957 = _5097;
                    _4943 = _5101;
                    _4949 = _5093;
                    _4883 = _5099;
                    _4891 = _5095;
                    _4841 = _5103;
                    _5019 = true;
                }
                else
                {
                    _4957 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4943 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4949 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4883 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4891 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4841 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5019 = false;
    float _5105 = _4957;
    float _5107 = _4943;
    float _5109 = _4949;
    float _5111 = _4883;
    float _5113 = _4891;
    float _5115 = _4841;
    float _5117 = _4935 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5119 = fma(_4046, -0.5, 0.5);
    float _5121 = precise::clamp(_5119, 0.0, 1.0);
    float _5123 = -_5105;
    float _5125 = _5123 + _5107;
    float _5127 = -_5109;
    float _5129 = _5127 + _5111;
    out.m_57.x = _5117;
    float _5131 = fma(_5121, _5125, _5105);
    float _5133 = -_5113;
    float _5135 = _5133 + _5115;
    float _5137 = fma(_5121, _5129, _5109);
    float _5139 = _5131 * 0.586610972881317138671875;
    bool _5141 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5143 = fma(_5121, _5135, _5113);
    out.m_100.x = 0.0;
    float _5145 = fma(_5137, 0.298911988735198974609375, _5139);
    bool _5147 = _4438 > 0.0;
    bool _5149 = isnan(_4438);
    bool _5151 = _5147 || _5149;
    bool _5153 = isnan(0.0);
    bool _5155 = _5151 || _5153;
    float _5157 = fma(_5143, 0.114477999508380889892578125, _5145);
    float _5159 = -_5157;
    float _5161 = _5137 + _5159;
    float _5163 = -_5157;
    float _5165 = _5131 + _5163;
    float _5167 = -_5157;
    float _5169 = _5143 + _5167;
    float _5171 = fma(_5161, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5157);
    float _5173 = fma(_5165, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5157);
    float _5175 = fma(_5169, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5157);
    bool _5177 = !_5141;
    if (!_5177)
    {
        float _5179 = -_4382;
        float _5181 = _5179 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5183 = -_4384;
        float _5185 = _5183 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5187 = -_4386;
        float _5189 = _5187 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5191 = _5181 * _5181;
        float _5193 = fma(_5185, _5185, _5191);
        float _5195 = fma(_5189, _5189, _5193);
        float _5197 = sqrt(_5195);
        float _5199 = rsqrt(_5195);
        float _5201 = -_5197;
        float _5203 = _5201 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5205 = _5203 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5207 = precise::clamp(_5205, 0.0, 1.0);
        float _5209 = _5185 * _5199;
        float _5211 = _5181 * _5199;
        float _5213 = abs(_5207);
        float _5215 = log2(_5213);
        float _5217 = _5189 * _5199;
        float _5219 = _5209 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5221 = _4046 * _5211;
        float _5223 = -_5211;
        float _5225 = -_5219;
        float _5227 = fma(_5223, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5225);
        float _5229 = fma(_4044, _5209, _5221);
        float _5231 = -_5217;
        float _5233 = fma(_5231, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5227);
        float _5235 = fma(_4048, _5217, _5229);
        float _5237 = precise::clamp(_5235, 0.0, 1.0);
        float _5239 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5241 = _5233 + _5239;
        float _5243 = _5215 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5245 = _5241 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5247 = precise::clamp(_5245, 0.0, 1.0);
        float _5249 = exp2(_5243);
        float _5251 = _5249 * _5247;
        float _5253 = _5237 * _5251;
        float _5255 = _5253 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5257 = _5253 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5259 = _5253 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _5255;
        out.m_100.y = _5257;
        out.m_100.z = _5259;
    }
    out.m_102.x = _5171;
    out.m_102.y = _5173;
    out.m_102.z = _5175;
    if (_5155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_57.x = 0.0;
    float _5261 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5261;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

