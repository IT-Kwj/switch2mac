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
    bool _5057 = false;
    bool _4134 = false;
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
        float _5366 = as_type<float>(_145);
        out.gl_Position.z = _5366;
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
        float _5429 = as_type<float>(_177);
        out.gl_Position.z = _5429;
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
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _591;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _599 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _601 = isnan(_581);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = 1.0 / _589;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _617 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _619 = isnan(_581);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    bool _629 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _631 = 1.0 / _597;
    float _633 = _593 * _611;
    bool _635 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _637 = isnan(_581);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = 1.0 / _615;
    float _649 = -_609;
    float _651 = _649 + 1.0;
    float _653 = fma(_633, _585, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _659 = -_645;
    float _661 = _659 + 1.0;
    bool _663 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _665 = isnan(_581);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = _645 * _651;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _679 = _677 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _681 = 1.0 / _657;
    float _683 = _627 * _661;
    float _685 = -_673;
    float _687 = _685 + 1.0;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _689;
    float _693 = _679 * _631;
    float _695 = _653 * _683;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _699 = _581 + _697;
    float _701 = -_627;
    float _703 = _701 + 1.0;
    float _705 = _609 * _687;
    float _707 = _691 * _647;
    bool _709 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _711 = isnan(_581);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _723 = _721 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _727 = _581 + _725;
    float _729 = fma(_693, _699, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _731 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[131].x, _695);
    float _733 = -_719;
    float _735 = _733 + 1.0;
    float _737 = _723 * _681;
    float _739 = fma(_707, _727, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _743 = _581 + _741;
    float _745 = fma(_729, _675, _731);
    float _747 = _673 * _735;
    float _749 = fma(_737, _743, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _751 = fma(_739, _705, _745);
    float _753 = fma(_749, _747, _751);
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _761 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[135].x, _753);
    float _763 = _755 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _765 = _757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _767 = _759 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _769 = _761 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_70.x = _763;
    out.m_70.y = _765;
    out.m_70.z = _767;
    out.m_70.w = _769;
    bool _771 = !_629;
    float _773 = _631;
    int _775 = as_type<int>(_705);
    int _777 = as_type<int>(_767);
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[134].x;
    if (!_771)
    {
        float _781 = in.m_64.x;
        float _783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _785 = _781 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _787 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _789 = _787 * _783;
        float _791 = floor(_789);
        float _793 = -_791;
        float _795 = _789 + _793;
        _173 = _795;
    }
    float _797 = _173;
    float _799 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _801 = int(_799);
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _805 = _803 != 0;
    float _807 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _809 = int(_807);
    float _811 = float(_801);
    float _813 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _815 = int(_813);
    float _817 = 0.0;
    if (_805)
    {
        _817 = 1.0;
    }
    float _819 = _817;
    float _821 = _819;
    if (_805)
    {
        _773 = 1.0;
    }
    float _823 = _773;
    float _825 = _823;
    if (_805)
    {
        _775 = 0;
    }
    int _827 = _775;
    float _829 = float(_809);
    float _831 = 1.0 / _811;
    int _833 = _827;
    if (_805)
    {
        _777 = 0;
    }
    int _835 = _777;
    float _837 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _839 = int(_837);
    float _841 = float(uint(_815));
    float _843 = 1.0 / _829;
    float _845 = _831 * _127;
    float _847 = 1.0 / _841;
    float _849 = float(uint(_839));
    int _851 = ~_839;
    int _853 = _851 + 1;
    float _855 = trunc(_845);
    int _857 = int(_855);
    float _859 = _843 * _127;
    float _861 = _843;
    float _863 = _811;
    int _865 = _835;
    if (_805)
    {
        float _867 = in.m_64.x;
        float _869 = in.m_64.y;
        _861 = _867;
        _863 = _869;
    }
    float _871 = _861;
    float _873 = _863;
    float _875 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _877 = int(_875);
    int _879 = as_type<int>(_847) + (-2);
    float _881 = 1.0 / _849;
    float _883 = float(uint(_857));
    float _885 = as_type<float>(_879) * _883;
    float _887 = trunc(_859);
    int _889 = int(_887);
    float _891 = float(uint(_877));
    float _893 = _871;
    float _895 = _873;
    float _897 = as_type<float>(_879);
    if (_805)
    {
        _779 = _871;
    }
    float _899 = _779;
    float _901 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _903 = int(_901);
    int _905 = as_type<int>(_881) + (-2);
    float _907 = _881;
    float _909 = _899;
    if (_805)
    {
        _907 = _873;
    }
    float _911 = _907;
    float _913 = 1.0 / _891;
    float _915 = float(uint(_889));
    float _917 = as_type<float>(_905) * _915;
    float _919 = trunc(_885);
    float _921 = precise::max(_919, 0.0);
    uint _924 = uint(_921);
    float _926 = float(_903);
    float _928 = 1.0 / _926;
    float _930 = trunc(_917);
    float _932 = precise::max(_930, 0.0);
    uint _934 = uint(_932);
    float _936 = _926;
    float _938 = _917;
    float _940 = _911;
    if (_805)
    {
        _936 = _899;
    }
    float _942 = _936;
    float _944 = _942;
    if (_805)
    {
        _938 = _899;
    }
    float _946 = _938;
    float _948 = _946;
    if (!_805)
    {
        float _950 = in.m_64.x;
        float _952 = in.m_64.y;
        float _954 = in.m_64.z;
        float _956 = _950 * 3.1415927410125732421875;
        float _958 = _956 * 0.15915493667125701904296875;
        float _960 = _952 * 3.1415927410125732421875;
        float _962 = _960 * 0.15915493667125701904296875;
        float _964 = _958 * 6.283185482025146484375;
        float _966 = sin(_964);
        float _968 = _962 * 6.283185482025146484375;
        float _970 = sin(_968);
        _821 = 7.345489978790283203125;
        _893 = _950;
        _825 = 5.839270114898681640625;
        _944 = _954;
        _909 = _952;
        _895 = _952;
        _940 = _970;
        _833 = 1;
        _865 = 2;
        _948 = _966;
    }
    float _972 = _821;
    float _974 = _893;
    float _976 = _825;
    float _978 = _944;
    float _980 = _909;
    float _982 = _895;
    float _984 = _940;
    int _986 = _833;
    int _988 = _865;
    float _990 = _948;
    int _992 = _853 * int(_934);
    int _994 = _992 + _889;
    float _996 = _972 * _974;
    float _998 = _976 * _978;
    float _1000 = in.m_64.z;
    float _1002 = in.m_64.w;
    float _1004 = _972 * _980;
    float _1006 = float(uint(_994));
    float _1008 = floor(_996);
    float _1010 = _928 * _127;
    float _1012 = _974 * 2.0;
    float _1014 = as_type<float>(_905) * _1006;
    int _1016 = ~_815;
    int _1018 = _1016 + 1;
    float _1020 = float(_889);
    float _1022 = trunc(_1014);
    float _1024 = precise::max(_1022, 0.0);
    uint _1026 = uint(_1024);
    float _1028 = float(_839);
    int _1030 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1032 = _1030 != 0;
    int _1034 = _1018 * int(_924);
    int _1036 = _1034 + _857;
    bool _1038 = _982 > 0.5;
    float _1040 = floor(_998);
    float _1042 = -_1008;
    float _1044 = _996 + _1042;
    int _1046 = ~_815;
    int _1048 = _1046 + 1;
    float _1050 = float(uint(_1036));
    bool _1052 = _1002 > 0.5;
    float _1054 = trunc(_1010);
    int _1056 = int(_1054);
    float _1058 = as_type<float>(_879) * _1050;
    int _1060 = int(_934) + int(_1026);
    int _1062 = as_type<int>(_913) + (-2);
    bool _1064 = _1000 > 0.5;
    float _1066 = trunc(_1058);
    float _1068 = precise::max(_1066, 0.0);
    uint _1070 = uint(_1068);
    float _1072 = -_1040;
    float _1074 = _998 + _1072;
    int _1076 = ~_839;
    int _1078 = _1076 + 1;
    bool _1080 = _1020 >= _1028;
    bool _1082 = isnan(_1020);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan(_1028);
    bool _1088 = _1084 || _1086;
    float _1090 = float(_1088);
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1094 = _1092 != 0;
    int _1096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1098 = _1096 != 0;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1102 = _1100 != 0;
    int _1104 = _1078 * _1060;
    int _1106 = _1104 + _889;
    float _1108 = float(uint(_1056));
    float _1110 = floor(_1004);
    float _1112 = -_205;
    int _1114 = _1038 ? as_type<int>(_1112) : as_type<int>(_205);
    float _1116 = as_type<float>(_1062) * _1108;
    float _1118 = -_215;
    int _1120 = _1064 ? as_type<int>(_1118) : as_type<int>(_215);
    int _1122 = int(_924) + int(_1070);
    float _1124 = trunc(_1116);
    float _1126 = precise::max(_1124, 0.0);
    uint _1128 = uint(_1126);
    float _1130 = _1044 * _1028;
    int _1132 = int(_1052);
    int _1134 = _1064 ? 2 : 0;
    int _1136 = _1132 | _1134;
    int _1138 = _1032 ? 4 : 0;
    int _1140 = _1136 | _1138;
    int _1142 = _1094 ? 8 : 0;
    int _1144 = _1140 | _1142;
    int _1146 = _1098 ? 16 : 0;
    int _1148 = _1144 | _1146;
    int _1150 = _1102 ? 32 : 0;
    int _1152 = _1148 | _1150;
    int _1154 = _1038 ? 64 : 0;
    int _1156 = _1152 | _1154;
    int _1158 = _1156 & 64;
    bool _1160 = !_1098;
    float _1162 = _1160 ? _205 : as_type<float>(_1114);
    float _1164 = float(_815);
    float _1166 = trunc(_1090);
    int _1168 = int(_1166);
    float _1170 = float(_857);
    float _1172 = _1074 * _1164;
    int _1174 = ~_877;
    int _1176 = _1174 + 1;
    int _1178 = _1048 * _1122;
    int _1180 = _1178 + _857;
    bool _1182 = !_1032;
    int _1184 = _1182 ? 0 : 1;
    float _1186 = trunc(_1130);
    int _1188 = int(_1186);
    bool _1190 = !_1102;
    float _1192 = _1190 ? _215 : as_type<float>(_1120);
    int _1194 = _1176 * int(_1128);
    int _1196 = _1194 + _1056;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1200 = _1198 != 0;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1204 = _1202 != 0;
    int _1206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1208 = _1206 != 0;
    bool _1210 = uint(_1106) >= uint(_839);
    bool _1212 = _1170 >= _1164;
    bool _1214 = isnan(_1170);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan(_1164);
    bool _1220 = _1216 || _1218;
    float _1222 = float(_1220);
    float _1224 = trunc(_1172);
    int _1226 = int(_1224);
    bool _1228 = !_1204;
    int _1230 = _1228 ? 0 : 1;
    bool _1232 = !_1200;
    int _1234 = _1232 ? 0 : 1;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1238 = _1236 != 0;
    bool _1240 = uint(_1180) >= uint(_815);
    float _1242 = trunc(_1222);
    int _1244 = int(_1242);
    bool _1246 = !_1210;
    int _1248 = _1246 ? 0 : (-1);
    bool _1250 = !_1208;
    int _1252 = _1250 ? 0 : 1;
    bool _1254 = !_1238;
    int _1256 = _1254 ? 0 : 1;
    bool _1258 = !_1240;
    int _1260 = _1258 ? 0 : (-1);
    float _1262 = floor(_1012);
    float _1264 = -_1110;
    float _1266 = _1004 + _1264;
    float _1268 = float(uint(_1196));
    int _1270 = abs(_1184);
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1274 = _1272 != 0;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1278 = _1276 != 0;
    int _1280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1282 = _1280 != 0;
    float _1284 = as_type<float>(_1062) * _1268;
    int _1286 = ~_1060;
    int _1288 = _1286 + _1248;
    int _1290 = _1288 + 1;
    int _1292 = _1188 * _1270;
    int _1294 = _1292 + _889;
    int _1296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1298 = _1296 != 0;
    int _1300 = ~_1122;
    int _1302 = _1300 + _1260;
    int _1304 = _1302 + 1;
    int _1306 = _839 * _1290;
    int _1308 = _1306 + _889;
    bool _1310 = !_1278;
    int _1312 = _1310 ? 0 : 1;
    float _1314 = trunc(_1284);
    float _1316 = precise::max(_1314, 0.0);
    uint _1318 = uint(_1316);
    bool _1320 = !_1298;
    int _1322 = _1320 ? 0 : 1;
    int _1324 = _815 * _1304;
    int _1326 = _1324 + _857;
    bool _1328 = _1158 != 0;
    float _1330 = _165 * _127;
    bool _1332 = _839 == 0;
    bool _1334 = !_1274;
    int _1336 = _1334 ? 0 : 1;
    float _1338 = _1028 * _1330;
    bool _1340 = _815 == 0;
    float _1342 = _1164 * _1330;
    int _1344 = ~_1168;
    int _1346 = _1344 + 1;
    int _1348 = _1346 + 1;
    bool _1350 = !_1332;
    int _1352 = _1350 ? _1308 : (-1);
    float _1354 = trunc(_1338);
    int _1356 = int(_1354);
    int _1358 = ~_1244;
    int _1360 = _1358 + 1;
    int _1362 = _1360 + 1;
    bool _1364 = !_1340;
    int _1366 = _1364 ? _1326 : (-1);
    int _1368 = _1352 * _1348;
    int _1370 = _839 + (-1);
    int _1372 = abs(_1230);
    int _1374 = _1366 * _1362;
    int _1376 = _815 + (-1);
    int _1378 = _1168 * _1370;
    int _1380 = _1378 + _1368;
    int _1382 = abs(_1312);
    float _1384 = trunc(_1342);
    int _1386 = int(_1384);
    int _1388 = abs(_1322);
    int _1390 = _1244 * _1376;
    int _1392 = _1390 + _1374;
    int _1394 = _1380 * _1372;
    int _1396 = abs(_1234);
    int _1398 = _1226 * _1388;
    int _1400 = _1398 + _857;
    int _1402 = ~_877;
    int _1404 = _1402 + 1;
    int _1406 = _1392 * _1382;
    int _1408 = abs(_1252);
    int _1410 = _1356 * _1396;
    int _1412 = _1410 + _1394;
    int _1414 = abs(_1256);
    int _1416 = _1294 * _1408;
    int _1418 = _1416 + _1412;
    int _1420 = int(_1128) + int(_1318);
    int _1422 = abs(_1336);
    int _1424 = _1404 * _1420;
    int _1426 = _1424 + _1056;
    float _1428 = -_215;
    int _1430 = _1052 ? as_type<int>(_1428) : as_type<int>(_215);
    int _1432 = _1188 * _1414;
    int _1434 = _1432 + _1418;
    float _1436 = -_205;
    int _1438 = _1064 ? as_type<int>(_1436) : as_type<int>(_205);
    int _1440 = _1386 * _1422;
    int _1442 = _1440 + _1406;
    bool _1444 = uint(_1426) >= uint(_877);
    float _1446 = float(uint(_1434));
    float _1448 = float(_877);
    float _1450 = float(_1056);
    float _1452 = as_type<float>(_905) * _1446;
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1456 = _1454 != 0;
    float _1458 = _1448 * _1330;
    bool _1460 = !_1282;
    int _1462 = _1460 ? 0 : 1;
    float _1464 = trunc(_1452);
    float _1466 = precise::max(_1464, 0.0);
    uint _1468 = uint(_1466);
    bool _1470 = _1450 >= _1448;
    bool _1472 = isnan(_1450);
    bool _1474 = _1470 || _1472;
    bool _1476 = isnan(_1448);
    bool _1478 = _1474 || _1476;
    float _1480 = float(_1478);
    float _1482 = _1266 * _1448;
    int _1484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1486 = _1484 != 0;
    float _1488 = _982 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1490 = !_1456;
    int _1492 = _1490 ? 0 : 1;
    int _1494 = abs(_1462);
    float _1496 = trunc(_1480);
    int _1498 = int(_1496);
    bool _1500 = !_1094;
    float _1502 = _1500 ? _215 : as_type<float>(_1430);
    bool _1504 = !_1486;
    int _1506 = _1504 ? 0 : 1;
    int _1508 = abs(_1492);
    float _1510 = trunc(_1458);
    int _1512 = int(_1510);
    bool _1514 = !_1444;
    int _1516 = _1514 ? 0 : (-1);
    int _1518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1520 = _1518 != 0;
    int _1522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1524 = _1522 != 0;
    int _1526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1528 = _1526 != 0;
    int _1530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1532 = _1530 != 0;
    int _1534 = _1400 * _1494;
    int _1536 = _1534 + _1442;
    int _1538 = ~_1420;
    int _1540 = _1538 + _1516;
    int _1542 = _1540 + 1;
    bool _1544 = !_1524;
    int _1546 = _1544 ? 0 : 1;
    int _1548 = _1226 * _1508;
    int _1550 = _1548 + _1536;
    int _1552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1554 = _1552 != 0;
    int _1556 = _877 * _1542;
    int _1558 = _1556 + _1056;
    int _1560 = ~_839;
    int _1562 = _1560 + 1;
    float _1564 = trunc(_1482);
    int _1566 = int(_1564);
    float _1568 = float(uint(_1550));
    bool _1570 = !_1520;
    int _1572 = _1570 ? 0 : 1;
    int _1574 = _1562 * int(_1468);
    int _1576 = _1574 + _1434;
    bool _1578 = _877 == 0;
    float _1580 = as_type<float>(_879) * _1568;
    int _1582 = ~_1498;
    int _1584 = _1582 + 1;
    int _1586 = _1584 + 1;
    float _1588 = float(uint(_1576));
    float _1590 = _1568;
    float _1592 = as_type<float>(_986);
    if (_1554)
    {
        float _1594 = in.m_64.w;
        _1590 = _1594;
    }
    float _1596 = _1590;
    bool _1598 = !_1578;
    int _1600 = _1598 ? _1558 : (-1);
    float _1602 = trunc(_1580);
    float _1604 = precise::max(_1602, 0.0);
    uint _1606 = uint(_1604);
    int _1608 = abs(_1546);
    float _1610 = as_type<float>(_905) * _1588;
    int _1612 = abs(_1506);
    int _1614 = _1600 * _1586;
    int _1616 = _877 + (-1);
    int _1618 = abs(_1572);
    float _1620 = trunc(_1610);
    float _1622 = precise::max(_1620, 0.0);
    uint _1624 = uint(_1622);
    int _1626 = _1498 * _1616;
    int _1628 = _1626 + _1614;
    int _1630 = _1628 * _1608;
    int _1632 = ~_815;
    int _1634 = _1632 + 1;
    int _1636 = _1566 * _1612;
    int _1638 = _1636 + _1056;
    bool _1640 = _839 == 0;
    int _1642 = _1512 * _1618;
    int _1644 = _1642 + _1630;
    bool _1646 = !_1528;
    int _1648 = _1646 ? 0 : 1;
    int _1650 = _1634 * int(_1606);
    int _1652 = _1650 + _1550;
    int _1654 = ~_839;
    int _1656 = _1654 + 1;
    float _1658 = as_type<float>(_1612);
    if (_1554)
    {
        float _1660 = _1596 * 3.1415927410125732421875;
        _1658 = _1660;
    }
    float _1662 = _1658;
    int _1664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1666 = _1664 != 0;
    int _1668 = int(_1468) + int(_1624);
    float _1670 = _1662;
    if (_1554)
    {
        float _1672 = _1662 * 0.15915493667125701904296875;
        _1670 = _1672;
    }
    float _1674 = _1670;
    int _1676 = abs(_1648);
    bool _1678 = !_1532;
    int _1680 = _1678 ? 0 : 1;
    int _1682 = _1656 * _1668;
    int _1684 = _1682 + _1434;
    float _1686 = float(uint(_1652));
    float _1688 = _1674;
    if (_1554)
    {
        float _1690 = _1674 * 6.283185482025146484375;
        float _1692 = sin(_1690);
        _1688 = _1692;
    }
    float _1694 = _1688;
    int _1696 = abs(_1680);
    int _1698 = _1638 * _1676;
    int _1700 = _1698 + _1644;
    bool _1702 = uint(_1684) >= uint(_839);
    float _1704 = as_type<float>(_879) * _1686;
    float _1706 = as_type<float>(_1608);
    if (_1666)
    {
        float _1708 = in.m_64.x;
        _1706 = _1708;
    }
    float _1710 = _1706;
    float _1712 = float(uint(_1294));
    bool _1714 = !_1702;
    int _1716 = _1714 ? 0 : (-1);
    float _1718 = trunc(_1704);
    float _1720 = precise::max(_1718, 0.0);
    uint _1722 = uint(_1720);
    int _1724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1726 = _1724 != 0;
    float _1728 = as_type<float>(_905) * _1712;
    int _1730 = ~_1668;
    int _1732 = _1730 + _1716;
    int _1734 = _1732 + 1;
    int _1736 = _1566 * _1696;
    int _1738 = _1736 + _1700;
    bool _1740 = !_1726;
    float _1742 = _1740 ? _205 : as_type<float>(_1438);
    bool _1744 = _1726;
    if (_1554)
    {
        bool _1746 = _1694 > 0.5;
        _1744 = _1746;
    }
    bool _1748 = _1744;
    int _1750 = _839 * _1734;
    int _1752 = _1750 + _1434;
    float _1754 = trunc(_1728);
    float _1756 = precise::max(_1754, 0.0);
    uint _1758 = uint(_1756);
    float _1760 = float(uint(_1738));
    float _1762 = 0.0;
    float _1764 = _1760;
    if (!_1554)
    {
        _1762 = _205;
    }
    float _1766 = _1762;
    bool _1768 = !_1640;
    int _1770 = _1768 ? _1752 : (-1);
    float _1772 = as_type<float>(_1062) * _1760;
    int _1774 = ~_839;
    int _1776 = _1774 + 1;
    float _1778 = _1766;
    if (_1554)
    {
        float _1780 = -_205;
        float _1782 = _1748 ? _1780 : _205;
        _1778 = _1782;
    }
    float _1784 = _1778;
    float _1786 = trunc(_1772);
    float _1788 = precise::max(_1786, 0.0);
    uint _1790 = uint(_1788);
    int _1792 = int(_1606) + int(_1722);
    if (_1666)
    {
        float _1794 = _1710 * 3.1415927410125732421875;
        _1764 = _1794;
    }
    float _1796 = _1764;
    int _1798 = _1770 & 3;
    bool _1800 = _1798 != 0;
    int _1802 = _1770 & 3;
    bool _1804 = _1802 != 0;
    float _1806 = _1796;
    if (_1666)
    {
        float _1808 = _1796 * 0.15915493667125701904296875;
        _1806 = _1808;
    }
    float _1810 = _1806;
    int _1812 = _1800 ? 0 : 1;
    bool _1814 = uint(_1802) > 1u;
    int _1816 = _1776 * int(_1758);
    int _1818 = _1816 + _1294;
    float _1820 = float(uint(_1400));
    float _1822 = _1810;
    if (_1666)
    {
        float _1824 = _1810 * 6.283185482025146484375;
        float _1826 = sin(_1824);
        _1822 = _1826;
    }
    float _1828 = _1822;
    int _1830 = ~_815;
    int _1832 = _1830 + 1;
    float _1834 = float(uint(_1818));
    float _1836 = as_type<float>(_879) * _1820;
    int _1838 = ~_877;
    int _1840 = _1838 + 1;
    float _1842 = trunc(_1836);
    float _1844 = precise::max(_1842, 0.0);
    uint _1846 = uint(_1844);
    int _1848 = ~_1812;
    int _1850 = _1848 + 1;
    int _1852 = _1850 + 1;
    float _1854 = as_type<float>(_905) * _1834;
    int _1856 = _1852;
    if (!_1814)
    {
        int _1858 = ~_1812;
        int _1860 = _1858 + 1;
        _1856 = _1860;
    }
    int _1862 = _1856;
    int _1864 = _1832 * _1792;
    int _1866 = _1864 + _1550;
    float _1868 = -_215;
    int _1870 = _1328 ? as_type<int>(_1868) : as_type<int>(_215);
    int _1872 = _1840 * int(_1790);
    int _1874 = _1872 + _1738;
    bool _1876 = uint(_1802) >= 2u;
    float _1878 = trunc(_1854);
    float _1880 = precise::max(_1878, 0.0);
    uint _1882 = uint(_1880);
    bool _1884 = uint(_1866) >= uint(_815);
    float _1886 = float(uint(_1874));
    int _1888 = _1876 ? 0 : 1;
    bool _1890 = _1802 != 3;
    float _1892 = as_type<float>(_1062) * _1886;
    int _1894 = ~_815;
    int _1896 = _1894 + 1;
    bool _1898 = !_1884;
    int _1900 = _1898 ? 0 : (-1);
    float _1902 = trunc(_1892);
    float _1904 = precise::max(_1902, 0.0);
    uint _1906 = uint(_1904);
    int _1908 = ~_1888;
    int _1910 = _1908 + 1;
    int _1912 = _1910 + 1;
    int _1914 = _1896 * int(_1846);
    int _1916 = _1914 + _1400;
    int _1918 = ~_1792;
    int _1920 = _1918 + _1900;
    int _1922 = _1920 + 1;
    float _1924 = float(uint(_1916));
    int _1926 = _815 * _1922;
    int _1928 = _1926 + _1550;
    int _1930 = _1912;
    bool _1932 = _1890;
    float _1934 = as_type<float>(_1846);
    if (_1890)
    {
        int _1936 = ~_1888;
        int _1938 = _1936 + 1;
        _1930 = _1938;
    }
    int _1940 = _1930;
    if (_1666)
    {
        bool _1942 = _1828 > 0.5;
        _1932 = _1942;
    }
    bool _1944 = _1932;
    float _1946 = as_type<float>(_879) * _1924;
    bool _1948 = !_1340;
    int _1950 = _1948 ? _1928 : (-1);
    if (!_1666)
    {
        _897 = _215;
    }
    float _1952 = _897;
    int _1954 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1956 = _1954 != 0;
    float _1958 = trunc(_1946);
    float _1960 = precise::max(_1958, 0.0);
    uint _1962 = uint(_1960);
    float _1964 = _1952;
    if (_1666)
    {
        float _1966 = -_215;
        float _1968 = _1944 ? _1966 : _215;
        _1964 = _1968;
    }
    float _1970 = _1964;
    int _1972 = _1950 & 3;
    bool _1974 = _1972 != 0;
    bool _1976 = !_1956;
    float _1978 = _1976 ? _215 : as_type<float>(_1870);
    int _1980 = int(_1758) + int(_1882);
    bool _1982 = uint(_1972) > 1u;
    int _1984 = int(_1790) + int(_1906);
    float _1986 = _974 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1988 = ~_877;
    int _1990 = _1988 + 1;
    int _1992 = _1950 & 3;
    bool _1994 = _1992 != 0;
    int _1996 = ~_839;
    int _1998 = _1996 + 1;
    int _2000 = _1990 * _1984;
    int _2002 = _2000 + _1738;
    int _2004 = _1994 ? 0 : 1;
    int _2006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2008 = _2006 != 0;
    int _2010 = _1998 * _1980;
    int _2012 = _2010 + _1294;
    float _2014 = float(uint(_1638));
    bool _2016 = !_2008;
    int _2018 = _2016 ? 0 : 1;
    bool _2020 = uint(_2002) >= uint(_877);
    float _2022 = as_type<float>(_1062) * _2014;
    int _2024 = ~_2004;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    int _2030 = _2028;
    if (!_1982)
    {
        int _2032 = ~_2004;
        int _2034 = _2032 + 1;
        _2030 = _2034;
    }
    int _2036 = _2030;
    float _2038 = trunc(_2022);
    float _2040 = precise::max(_2038, 0.0);
    uint _2042 = uint(_2040);
    bool _2044 = uint(_2012) >= uint(_839);
    bool _2046 = !_2020;
    int _2048 = _2046 ? 0 : (-1);
    bool _2050 = _1972 != 3;
    bool _2052 = !_2044;
    int _2054 = _2052 ? 0 : (-1);
    bool _2056 = uint(_1972) >= 2u;
    int _2058 = ~_1984;
    int _2060 = _2058 + _2048;
    int _2062 = _2060 + 1;
    int _2064 = ~_815;
    int _2066 = _2064 + 1;
    int _2068 = int(_1846) + int(_1962);
    int _2070 = _877 * _2062;
    int _2072 = _2070 + _1738;
    int _2074 = ~_877;
    int _2076 = _2074 + 1;
    int _2078 = _2056 ? 0 : 1;
    int _2080 = _2066 * _2068;
    int _2082 = _2080 + _1400;
    int _2084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2086 = _2084 != 0;
    int _2088 = ~_2078;
    int _2090 = _2088 + 1;
    int _2092 = _2090 + 1;
    int _2094 = _2092;
    float _2096 = as_type<float>(_2076);
    int _2098 = _2036;
    if (_2050)
    {
        int _2100 = ~_2078;
        int _2102 = _2100 + 1;
        _2094 = _2102;
    }
    int _2104 = _2094;
    int _2106 = _2076 * int(_2042);
    int _2108 = _2106 + _1638;
    int _2110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2112 = _2110 != 0;
    bool _2114 = !_2086;
    int _2116 = _2114 ? 0 : 1;
    bool _2118 = uint(_2082) >= uint(_815);
    bool _2120 = !_1578;
    int _2122 = _2120 ? _2072 : (-1);
    bool _2124 = !_2112;
    int _2126 = _2124 ? 0 : 1;
    bool _2128 = !_2118;
    int _2130 = _2128 ? 0 : (-1);
    int _2132 = _2122 & 3;
    bool _2134 = _2132 != 0;
    float _2136 = float(uint(_2108));
    int _2138 = _2122 & 3;
    bool _2140 = _2138 != 0;
    int _2142 = _2134 ? 0 : 1;
    float _2144 = as_type<float>(_1062) * _2136;
    bool _2146 = uint(_2138) > 1u;
    int _2148 = ~_2142;
    int _2150 = _2148 + 1;
    int _2152 = _2150 + 1;
    float _2154 = trunc(_2144);
    float _2156 = precise::max(_2154, 0.0);
    uint _2158 = uint(_2156);
    float _2160 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2162 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2164 = -_2160;
    float _2166 = fma(_1986, 2.0, _2164);
    int _2168 = _2152;
    float _2170 = as_type<float>(_2042);
    if (!_2146)
    {
        int _2172 = ~_2142;
        int _2174 = _2172 + 1;
        _2168 = _2174;
    }
    int _2176 = _2168;
    float _2178 = fma(_1488, -2.0, _2162);
    bool _2180 = uint(_2138) >= 2u;
    float _2182 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _2184 = ~_877;
    int _2186 = _2184 + 1;
    float _2188 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2190 = _2180 ? 0 : 1;
    float _2192 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _2194 = _2138 != 3;
    float _2196 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2188);
    int _2198 = int(_2042) + int(_2158);
    float _2200 = _984 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _2202 = ~_2190;
    int _2204 = _2202 + 1;
    int _2206 = _2204 + 1;
    float _2208 = -_127;
    float _2210 = fma(_2208, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2166);
    int _2212 = _2186 * _2198;
    int _2214 = _2212 + _1638;
    float _2216 = fma(_2200, -2.0, _2192);
    float _2218 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2220 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2196);
    int _2222 = _2206;
    float _2224 = as_type<float>(_2214);
    if (_2194)
    {
        int _2226 = ~_2190;
        int _2228 = _2226 + 1;
        _2222 = _2228;
    }
    int _2230 = _2222;
    float _2232 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2234 = uint(_2214) >= uint(_877);
    float _2236 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2238 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2178);
    bool _2240 = !_2234;
    int _2242 = _2240 ? 0 : (-1);
    float _2244 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2216);
    bool _2246 = _974 > 0.5;
    float _2248 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2250 = -_205;
    int _2252 = _2246 ? as_type<int>(_2250) : as_type<int>(_205);
    bool _2254 = _986 != 1;
    float _2256 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2258 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2260 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2262 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2264 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2266 = _2264 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    if (!_2254)
    {
        _2170 = _982;
    }
    float _2268 = _2170;
    float _2270 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2272 = _2270 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2274 = 0.0;
    float _2276 = _2268;
    if (!_2254)
    {
        _2274 = _982;
    }
    float _2278 = _2274;
    float _2280 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2260);
    float _2282 = _2278;
    if (!_2254)
    {
        _1592 = _1000;
    }
    float _2284 = _1592;
    float _2286 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2262);
    float _2288 = _2284;
    if (!_2254)
    {
        _1934 = _1000;
    }
    float _2290 = _1934;
    float _2292 = 1.0 / _2266;
    float _2294 = _2290;
    if (_2254)
    {
        _2276 = _974;
    }
    float _2296 = _2276;
    float _2298 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2300 = _2298 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    if (_2254)
    {
        _2282 = _974;
    }
    float _2302 = _2282;
    if (_2254)
    {
        _2288 = _982;
    }
    float _2304 = _2288;
    float _2306 = _2296 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2254)
    {
        _2294 = _982;
    }
    float _2308 = _2294;
    float _2310 = 1.0 / _2272;
    bool _2312 = _988 != 2;
    float _2314 = -_2232;
    float _2316 = fma(_2306, 2.0, _2314);
    float _2318 = _2304 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2320 = fma(_2308, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2256);
    float _2322 = -_127;
    float _2324 = fma(_2322, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2316);
    float _2326 = fma(_2318, -2.0, _2248);
    float _2328 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2330 = _2328 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2332 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2320);
    float _2334 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2326);
    float _2336 = 1.0 / _2300;
    if (_2312)
    {
        _2224 = _974;
    }
    float _2338 = _2224;
    float _2340 = -_2332;
    float _2342 = _2340 + 1.0;
    float _2344 = _2338;
    if (_2312)
    {
        _2096 = _982;
    }
    float _2346 = _2096;
    float _2348 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2350 = _2348 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2352 = _2346;
    if (!_2312)
    {
        _2344 = _1000;
    }
    float _2354 = _2344;
    if (!_2312)
    {
        _2352 = _974;
    }
    float _2356 = _2352;
    float _2358 = 1.0 / _2330;
    int _2360 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2362 = _2360 != 0;
    float _2364 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2218);
    float _2366 = _990 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2368 = _2354 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2370 = !_2362;
    float _2372 = _2370 ? _205 : as_type<float>(_2252);
    float _2374 = _2356 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2376 = -_2182;
    float _2378 = fma(_2366, 2.0, _2376);
    float _2380 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2382 = log2(_2380);
    float _2384 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2386 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2388 = isnan(0.0);
    bool _2390 = _2386 || _2388;
    bool _2392 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2394 = _2390 || _2392;
    float _2396 = -_2236;
    float _2398 = fma(_2368, 2.0, _2396);
    float _2400 = fma(_2302, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2384);
    float _2402 = fma(_2374, -2.0, _2258);
    float _2404 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2406 = -_127;
    float _2408 = fma(_2406, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2378);
    float _2410 = _982 * 2.0;
    float _2412 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2280);
    float _2414 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2416 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2404);
    float _2418 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2364);
    float _2420 = _2382 * _127;
    float _2422 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2414);
    float _2424 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2416);
    float _2426 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2286);
    float _2428 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2400);
    float _2430 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2422);
    float _2432 = exp2(_2420);
    float _2434 = -_127;
    float _2436 = fma(_2434, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2398);
    float _2438 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2402);
    float _2440 = _982 + _974;
    float _2442 = -_2418;
    float _2444 = _2442 + 1.0;
    int _2446 = ~_2068;
    int _2448 = _2446 + _2130;
    int _2450 = _2448 + 1;
    float _2452 = floor(_2410);
    float _2454 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2456 = _2454 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2458 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2460 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2458;
    float _2462 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2464 = _2462 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2466 = _815 * _2450;
    int _2468 = _2466 + _1400;
    bool _2470 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2472 = isnan(_797);
    bool _2474 = _2470 || _2472;
    bool _2476 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2478 = _2474 || _2476;
    float _2480 = float(_2478);
    float _2482 = _2460 * _2310;
    float _2484 = _1000 * 2.0;
    float _2486 = -_2432;
    float _2488 = _2486 + 1.0;
    float _2490 = 1.0 / _2350;
    float _2492 = in.m_50.x;
    float _2494 = in.m_50.y;
    float _2496 = in.m_50.z;
    float _2498 = _2440 + (-1.0);
    float _2500 = _2394 ? _2488 : 0.0;
    float _2502 = -_2424;
    float _2504 = _2502 + 1.0;
    bool _2506 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2508 = isnan(1.0);
    bool _2510 = _2506 || _2508;
    bool _2512 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2514 = _2510 || _2512;
    float _2516 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2518 = 1.0 + _2516;
    float _2520 = floor(_2484);
    float _2522 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2524 = _2522 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _2526 = _1950 >> 31;
    float _2528 = -_2430;
    float _2530 = _2528 + 1.0;
    int _2532 = ~_1980;
    int _2534 = _2532 + _2054;
    int _2536 = _2534 + 1;
    float _2538 = -_2426;
    float _2540 = _2538 + 1.0;
    int _2542 = _2526 & 3;
    float _2544 = 1.0 / _2518;
    float _2546 = _2464 * _2490;
    int _2548 = _839 * _2536;
    int _2550 = _2548 + _1294;
    int _2552 = _1950 + _2542;
    int _2554 = abs(_2230);
    float _2556 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2558 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2556;
    float _2560 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2562 = _797 + _2560;
    float _2564 = _2494 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2566 = 1.0 / _2524;
    int _2568 = _2552 >> 2;
    float _2570 = fma(_2492, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2564);
    bool _2572 = !_1974;
    int _2574 = _2572 ? 0 : 1;
    if (_2514)
    {
        float _2576 = _2500 * _2544;
        _137 = _2576;
    }
    float _2578 = _137;
    bool _2580 = _1262 >= 0.0;
    bool _2582 = isnan(_1262);
    bool _2584 = _2580 || _2582;
    bool _2586 = isnan(0.0);
    bool _2588 = _2584 || _2586;
    float _2590 = _2494 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2592 = _2494 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _2594 = _2588 ? 0 : 1;
    float _2596 = fma(_2492, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2590);
    bool _2598 = _1262 > 0.0;
    float _2600 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2602 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2600;
    float _2604 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2606 = _2604 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2608 = fma(_2492, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2592);
    float _2610 = fma(_2496, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2596);
    float _2612 = _2602 * _2292;
    float _2614 = _2606 * _2358;
    float _2616 = 1.0 / _2456;
    int _2618 = ~_2594;
    int _2620 = _2618 + 1;
    int _2622 = _2620 + 1;
    float _2624 = fma(_2612, _2562, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2626 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2628 = isnan(_797);
    bool _2630 = _2626 || _2628;
    bool _2632 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2634 = _2630 || _2632;
    float _2636 = float(_2634);
    float _2638 = _2610 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2640 = _2568 << 4;
    int _2642 = _2640 + 656;
    float _2644 = _2558 * _2566;
    int _2646 = _2622;
    if (!_2598)
    {
        int _2648 = ~_2594;
        int _2650 = _2648 + 1;
        _2646 = _2650;
    }
    int _2652 = _2646;
    float _2654 = -_2636;
    float _2656 = _2654 + 1.0;
    bool _2658 = _2452 >= 0.0;
    bool _2660 = isnan(_2452);
    bool _2662 = _2658 || _2660;
    bool _2664 = isnan(0.0);
    bool _2666 = _2662 || _2664;
    bool _2668 = !_1340;
    int _2670 = _2668 ? _2468 : (-1);
    int _2672 = _2666 ? 0 : 1;
    bool _2674 = _2452 > 0.0;
    float _2676 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2678 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2676;
    float _2680 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2682 = _2680 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _2684 = ~_2672;
    int _2686 = _2684 + 1;
    int _2688 = _2686 + 1;
    float _2690 = _2678 * _2336;
    bool _2692 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2694 = isnan(_797);
    bool _2696 = _2692 || _2694;
    bool _2698 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2700 = _2696 || _2698;
    float _2702 = float(_2700);
    float _2704 = _2682 * _2616;
    bool _2706 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2708 = isnan(_797);
    bool _2710 = _2706 || _2708;
    bool _2712 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2714 = _2710 || _2712;
    float _2716 = float(_2714);
    bool _2718 = !_1804;
    int _2720 = _2718 ? 0 : 1;
    float _2722 = -_2702;
    float _2724 = _2722 + 1.0;
    int _2726 = abs(_2574);
    float _2728 = -_2716;
    float _2730 = _2728 + 1.0;
    int _2732 = _2688;
    if (!_2674)
    {
        int _2734 = ~_2672;
        int _2736 = _2734 + 1;
        _2732 = _2736;
    }
    int _2738 = _2732;
    float _2740 = _2480 * _2724;
    int _2742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2744 = _2742 != 0;
    int _2746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2748 = _2746 != 0;
    int _2750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2752 = _2750 != 0;
    float _2754 = -_2480;
    float _2756 = _2754 + 1.0;
    bool _2758 = _2520 >= 0.0;
    bool _2760 = isnan(_2520);
    bool _2762 = _2758 || _2760;
    bool _2764 = isnan(0.0);
    bool _2766 = _2762 || _2764;
    float _2768 = _2702 * _2730;
    bool _2770 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2772 = isnan(_797);
    bool _2774 = _2770 || _2772;
    bool _2776 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2778 = _2774 || _2776;
    float _2780 = float(_2778);
    int _2782 = _2766 ? 0 : 1;
    bool _2784 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2786 = isnan(_797);
    bool _2788 = _2784 || _2786;
    bool _2790 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2792 = _2788 || _2790;
    float _2794 = float(_2792);
    float _2796 = -_2780;
    float _2798 = _2796 + 1.0;
    bool _2800 = _2520 > 0.0;
    float _2802 = _2780 * _2756;
    float _2804 = fma(_2496, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2570);
    float _2806 = fma(_2496, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2608);
    float _2808 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2810 = _797 + _2808;
    float _2812 = _2794 * _2798;
    float _2814 = -_2794;
    float _2816 = _2814 + 1.0;
    bool _2818 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2820 = isnan(_797);
    bool _2822 = _2818 || _2820;
    bool _2824 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2826 = _2822 || _2824;
    float _2828 = float(_2826);
    float _2830 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2832 = _797 + _2830;
    float _2834 = fma(_2614, _2810, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2836 = _2636 * _2816;
    bool _2838 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2840 = isnan(_797);
    bool _2842 = _2838 || _2840;
    bool _2844 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2846 = _2842 || _2844;
    float _2848 = float(_2846);
    float _2850 = fma(_2482, _2832, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2852 = -_2828;
    float _2854 = _2852 + 1.0;
    float _2856 = _2828 * _2656;
    float _2858 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2860 = _797 + _2858;
    float _2862 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2864 = _797 + _2862;
    float _2866 = _2848 * _2854;
    float _2868 = -_2848;
    float _2870 = _2868 + 1.0;
    float _2872 = fma(_2546, _2860, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2874 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2876 = _797 + _2874;
    float _2878 = _2624 * _2866;
    float _2880 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2882 = _797 + _2880;
    float _2884 = _2804 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2886 = fma(_2704, _2876, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2888 = fma(_2870, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2878);
    float _2890 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2892 = _2638 + _2890;
    uint _2894 = uint(int(uint(_2642) >> uint(2)));
    uint _2896 = uint(int(uint(int(_2894)) >> uint(2)));
    int _2898 = int(_2894) & 3;
    float _2900 = (*spvDescriptorSet0.vp_c9)._m0[int(_2896)][_2898];
    int _2902 = int(_2894) + 1;
    uint _2904 = uint(int(uint(_2902) >> uint(2)));
    int _2906 = _2902 & 3;
    float _2908 = (*spvDescriptorSet0.vp_c9)._m0[int(_2904)][_2906];
    float _2910 = fma(_2644, _2882, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2912 = fma(_2834, _2856, _2888);
    float _2914 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2916 = _2884 + _2914;
    float _2918 = _2892 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2920 = _2806 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _2922 = _1972 != 3;
    float _2924 = fma(_2850, _2836, _2912);
    float _2926 = fma(_2916, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2918);
    float _2928 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2930 = _2920 + _2928;
    int _2932 = ~_2782;
    int _2934 = _2932 + 1;
    int _2936 = _2934 + 1;
    float _2938 = _974 + _1000;
    int _2940 = _2936;
    float _2942 = _2740;
    if (!_2800)
    {
        int _2944 = ~_2782;
        int _2946 = _2944 + 1;
        _2940 = _2946;
    }
    int _2948 = _2940;
    float _2950 = _974 + (-0.5);
    float _2952 = fma(_2930, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2926);
    float _2954 = fma(_2690, _2864, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2956 = _2642 + 8;
    uint _2958 = uint(int(uint(_2956) >> uint(2)));
    uint _2960 = uint(int(uint(int(_2958)) >> uint(2)));
    int _2962 = int(_2958) & 3;
    float _2964 = (*spvDescriptorSet0.vp_c9)._m0[int(_2960)][_2962];
    int _2966 = int(_2958) + 1;
    uint _2968 = uint(int(uint(_2966) >> uint(2)));
    int _2970 = _2966 & 3;
    float _2972 = (*spvDescriptorSet0.vp_c9)._m0[int(_2968)][_2970];
    bool _2974 = !_2922;
    int _2976 = _2974 ? 0 : (-1);
    float _2978 = fma(_2872, _2812, _2924);
    bool _2980 = _2952 >= 0.0;
    float _2982 = _982 + _1000;
    float _2984 = _982 + (-0.5);
    float _2986 = fma(_2954, _2802, _2978);
    float _2988 = _1970 + (-0.5);
    float _2990 = _1784 + 0.5;
    float _2992 = fma(_2886, _2740, _2986);
    int _2994 = abs(_2036);
    float _2996 = -_2988;
    float _2998 = -_2244;
    float _3000 = fma(_2996, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2998);
    float _3002 = fma(_2498, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3004 = _2372 + 0.5;
    float _3006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_2980)
    {
        _2942 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3008 = _2942;
    float _3010 = _1978 + (-0.5);
    int _3012 = ~_2994;
    int _3014 = _3012 + 1;
    int _3016 = _3014 + 1;
    float _3018 = fma(_3004, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2210);
    float _3020 = fma(_2990, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2408);
    float _3022 = -_3010;
    float _3024 = -_2238;
    float _3026 = fma(_3022, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3024);
    if (_2980)
    {
        float _3028 = _3008 * 5.0;
        _2098 = as_type<int>(_3028);
    }
    int _3030 = _2098;
    float _3032 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3034 = int(_3032);
    float _3036 = fma(_2910, _2768, _2992);
    int _3038 = abs(_2104);
    float _3040 = -_2444;
    float _3042 = fma(_3040, _1784, _3020);
    if (_2980)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9632 = as_type<float>(_3030);
        out.gl_Position.z = _9632;
    }
    float _3044 = -_2220;
    float _3046 = _3044 + 1.0;
    float _3048 = fma(_2716, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3036);
    float _3050 = _3006 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3052 = _3016 * as_type<int>(_2908);
    float _3054 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3056 = fma(_3046, _1970, _3000);
    bool _3058 = !_2744;
    int _3060 = _3058 ? 0 : 1;
    out.m_72.x = _3048;
    int _3062 = ~_2726;
    int _3064 = _3062 + 1;
    int _3066 = _3064 + 1;
    float _3068 = _1742 + 0.5;
    float _3070 = _1502 + (-0.5);
    int _3072 = _3066 * as_type<int>(_2900);
    int _3074 = _3072 + _3052;
    int _3076 = ~_3038;
    int _3078 = _3076 + 1;
    int _3080 = _3078 + 1;
    float _3082 = fma(_3050, _3068, _2324);
    int _3084 = abs(_2976);
    float _3086 = _2892 * _2892;
    out.m_74.x = _3042;
    out.m_74.y = _3056;
    int _3088 = _3080 * as_type<int>(_2964);
    int _3090 = _3088 + _3074;
    float _3092 = float(uint(_3034));
    float _3094 = fma(_2916, _2916, _3086);
    int _3096 = abs(_2116);
    float _3098 = _3054 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3100 = ~_3084;
    int _3102 = _3100 + 1;
    int _3104 = _3102 + 1;
    if (_2980)
    {
        out.m_57.x = 0.0;
    }
    float _3106 = 1.0 / _3092;
    int _3108 = ~_3096;
    int _3110 = _3108 + 1;
    int _3112 = _3110 + 1;
    float _3114 = -_3098;
    float _3116 = -_2334;
    float _3118 = fma(_3114, _3070, _3116);
    int _3120 = _3104 * as_type<int>(_2972);
    int _3122 = _3120 + _3090;
    float _3124 = fma(_2930, _2930, _3094);
    int _3126 = abs(_3034);
    float _3128 = _557 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _3130 = _3122 * _3112;
    float _3132 = rsqrt(_3124);
    int _3134 = _1770 >> 31;
    int _3136 = _2670 * _3096;
    int _3138 = _3136 + _3130;
    float _3140 = float(uint(_3126));
    int _3142 = _3134 & 3;
    int _3144 = as_type<int>(_3106) + (-2);
    float _3146 = float(uint(_3138));
    float _3148 = 1.0 / _3140;
    int _3150 = _1770 + _3142;
    float _3152 = _3128 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3154 = _2122 >> 31;
    float _3156 = as_type<float>(_3144) * _3146;
    int _3158 = abs(_3060);
    float _3160 = _3152 * _3132;
    int _3162 = _3154 & 3;
    int _3164 = ~_3034;
    int _3166 = _3164 + 1;
    float _3168 = trunc(_3156);
    float _3170 = precise::max(_3168, 0.0);
    uint _3172 = uint(_3170);
    float _3174 = _2916 * _3160;
    int _3176 = _2122 + _3162;
    float _3178 = _2892 * _3160;
    float _3180 = float(_2948);
    float _3182 = -_3174;
    float _3184 = _2916 + _3182;
    int _3186 = _3150 >> 2;
    float _3188 = -_3178;
    float _3190 = _2892 + _3188;
    int _3192 = abs(_3138);
    float _3194 = in.m_76.x;
    float _3196 = in.m_76.y;
    float _3198 = in.m_76.z;
    int _3200 = _3186 << 4;
    int _3202 = _3200 + 368;
    float _3204 = _3190 * _3190;
    int _3206 = _3176 >> 2;
    float _3208 = fma(_3184, _3184, _3204);
    int _3210 = as_type<int>(_3148) + (-2);
    int _3212 = _3166 * int(_3172);
    int _3214 = _3212 + _3138;
    float _3216 = float(uint(_3192));
    uint _3218 = uint(int(uint(_3202) >> uint(2)));
    uint _3220 = uint(int(uint(int(_3218)) >> uint(2)));
    int _3222 = int(_3218) & 3;
    float _3224 = (*spvDescriptorSet0.vp_c9)._m0[int(_3220)][_3222];
    int _3226 = int(_3218) + 1;
    uint _3228 = uint(int(uint(_3226) >> uint(2)));
    int _3230 = _3226 & 3;
    float _3232 = (*spvDescriptorSet0.vp_c9)._m0[int(_3228)][_3230];
    float _3234 = float(_3158);
    int _3236 = _3206 << 4;
    int _3238 = _3236 + 800;
    float _3240 = as_type<float>(_3210) * _3216;
    float _3242 = float(uint(_3214));
    float _3244 = _3234 * _3180;
    float _3246 = -_2412;
    float _3248 = _3246 + 1.0;
    uint _3250 = uint(int(uint(_3238) >> uint(2)));
    uint _3252 = uint(int(uint(int(_3250)) >> uint(2)));
    int _3254 = int(_3250) & 3;
    float _3256 = (*spvDescriptorSet0.vp_c9)._m0[int(_3252)][_3254];
    int _3258 = int(_3250) + 1;
    uint _3260 = uint(int(uint(_3258) >> uint(2)));
    int _3262 = _3258 & 3;
    float _3264 = (*spvDescriptorSet0.vp_c9)._m0[int(_3260)][_3262];
    float _3266 = trunc(_3240);
    float _3268 = precise::max(_3266, 0.0);
    uint _3270 = uint(_3268);
    float _3272 = -_2428;
    float _3274 = _3272 + 1.0;
    float _3276 = fma(_1978, _3248, _3026);
    float _3278 = as_type<float>(_3144) * _3242;
    float _3280 = _2930 * _3160;
    float _3282 = -_2504;
    float _3284 = fma(_2372, _3282, _3018);
    float _3286 = -_3274;
    float _3288 = fma(_1742, _3286, _3082);
    float _3290 = fma(_1502, _2342, _3118);
    int _3292 = ~_3126;
    int _3294 = _3292 + 1;
    float _3296 = _3244 * (-2.0);
    float _3298 = trunc(_3278);
    float _3300 = precise::max(_3298, 0.0);
    uint _3302 = uint(_3300);
    int _3304 = abs(_2720);
    out.m_78.x = _3284;
    out.m_78.y = _3276;
    out.m_78.z = _3288;
    out.m_78.w = _3290;
    float _3306 = fma(_3296, _3194, _3194);
    int _3308 = ~_2198;
    int _3310 = _3308 + _2242;
    int _3312 = _3310 + 1;
    float _3314 = -_3280;
    float _3316 = _2930 + _3314;
    int _3318 = _3294 * int(_3270);
    int _3320 = _3318 + _3192;
    float _3322 = fma(_2950, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3306);
    int _3324 = abs(_2018);
    int _3326 = _3202 + 8;
    uint _3328 = uint(int(uint(_3326) >> uint(2)));
    uint _3330 = uint(int(uint(int(_3328)) >> uint(2)));
    int _3332 = int(_3328) & 3;
    float _3334 = (*spvDescriptorSet0.vp_c9)._m0[int(_3330)][_3332];
    int _3336 = int(_3328) + 1;
    uint _3338 = uint(int(uint(_3336) >> uint(2)));
    int _3340 = _3336 & 3;
    float _3342 = (*spvDescriptorSet0.vp_c9)._m0[int(_3338)][_3340];
    int _3344 = _877 * _3312;
    int _3346 = _3344 + _1638;
    int _3348 = abs(_2126);
    float _3350 = fma(_3002, _3296, _3002);
    float _3352 = fma(_3316, _3316, _3208);
    float _3354 = fma(_3350, _2578, _3322);
    int _3356 = _3238 + 8;
    uint _3358 = uint(int(uint(_3356) >> uint(2)));
    uint _3360 = uint(int(uint(int(_3358)) >> uint(2)));
    int _3362 = int(_3358) & 3;
    float _3364 = (*spvDescriptorSet0.vp_c9)._m0[int(_3360)][_3362];
    int _3366 = int(_3358) + 1;
    uint _3368 = uint(int(uint(_3366) >> uint(2)));
    int _3370 = _3366 & 3;
    float _3372 = (*spvDescriptorSet0.vp_c9)._m0[int(_3368)][_3370];
    float _3374 = float(uint(_3320));
    int _3376 = abs(_1862);
    int _3378 = int(_3172) + int(_3302);
    float _3380 = as_type<float>(_3210) * _3374;
    int _3382 = ~_3034;
    int _3384 = _3382 + 1;
    int _3386 = ~_3376;
    int _3388 = _3386 + 1;
    int _3390 = _3388 + 1;
    bool _3392 = !_2140;
    int _3394 = _3392 ? 0 : 1;
    float _3396 = trunc(_3380);
    float _3398 = precise::max(_3396, 0.0);
    uint _3400 = uint(_3398);
    int _3402 = abs(_2176);
    int _3404 = _3384 * _3378;
    int _3406 = _3404 + _3138;
    bool _3408 = _1802 != 3;
    int _3410 = _3390 * as_type<int>(_3232);
    int _3412 = ~_3402;
    int _3414 = _3412 + 1;
    int _3416 = _3414 + 1;
    bool _3418 = !_3408;
    int _3420 = _3418 ? 0 : (-1);
    bool _3422 = uint(_3406) >= uint(_3034);
    int _3424 = _3416 * as_type<int>(_3264);
    int _3426 = abs(_3394);
    int _3428 = ~_3304;
    int _3430 = _3428 + 1;
    int _3432 = _3430 + 1;
    int _3434 = ~_3126;
    int _3436 = _3434 + 1;
    int _3438 = int(_3270) + int(_3400);
    int _3440 = _3432 * as_type<int>(_3224);
    int _3442 = _3440 + _3410;
    bool _3444 = !_3422;
    int _3446 = _3444 ? 0 : (-1);
    bool _3448 = _2138 != 3;
    int _3450 = _3436 * _3438;
    int _3452 = _3450 + _3192;
    int _3454 = ~_3378;
    int _3456 = _3454 + _3446;
    int _3458 = _3456 + 1;
    int _3460 = abs(_1940);
    int _3462 = ~_3426;
    int _3464 = _3462 + 1;
    int _3466 = _3464 + 1;
    int _3468 = _3034 * _3458;
    int _3470 = _3468 + _3138;
    bool _3472 = !_3448;
    int _3474 = _3472 ? 0 : (-1);
    bool _3476 = uint(_3452) >= uint(_3126);
    int _3478 = _3466 * as_type<int>(_3256);
    int _3480 = _3478 + _3424;
    int _3482 = ~_3460;
    int _3484 = _3482 + 1;
    int _3486 = _3484 + 1;
    float _3488 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3490 = ~_2554;
    int _3492 = _3490 + 1;
    int _3494 = _3492 + 1;
    int _3496 = _3138 ^ _3034;
    int _3498 = _3486 * as_type<int>(_3334);
    int _3500 = _3498 + _3442;
    bool _3502 = !_3476;
    int _3504 = _3502 ? 0 : (-1);
    int _3506 = _3494 * as_type<int>(_3364);
    int _3508 = _3506 + _3480;
    int _3510 = abs(_3420);
    float _3512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    uint _3514 = uint(int(uint(_3496) >> uint(31)));
    int _3516 = abs(_3474);
    int _3518 = ~_3504;
    int _3520 = _3438 + _3518;
    int _3522 = _3520 + 1;
    int _3524 = ~_3510;
    int _3526 = _3524 + 1;
    int _3528 = _3526 + 1;
    float _3530 = _3488 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3532 = ~int(_3514);
    int _3534 = _3532 + 1;
    int _3536 = ~_3516;
    int _3538 = _3536 + 1;
    int _3540 = _3538 + 1;
    int _3542 = _3528 * as_type<int>(_3342);
    int _3544 = _3542 + _3500;
    bool _3546 = _3034 == 0;
    int _3548 = _3522 ^ _3534;
    int _3550 = _3540 * as_type<int>(_3372);
    int _3552 = _3550 + _3508;
    int _3554 = ~_3348;
    int _3556 = _3554 + 1;
    int _3558 = _3556 + 1;
    bool _3560 = !_3546;
    int _3562 = _3560 ? _3470 : (-1);
    bool _3564 = _3034 == 0;
    int _3566 = _3552 * _3558;
    int _3568 = ~_3534;
    int _3570 = _3568 + _3548;
    int _3572 = _3570 + 1;
    int _3574 = ~_3324;
    int _3576 = _3574 + 1;
    int _3578 = _3576 + 1;
    bool _3580 = _839 == 0;
    bool _3582 = !_3564;
    int _3584 = _3582 ? _3572 : (-1);
    int _3586 = _3544 * _3578;
    bool _3588 = !_3580;
    int _3590 = _3588 ? _2550 : (-1);
    float _3592 = _1192 + (-0.5);
    float _3594 = float(_3562);
    float _3596 = float(_3584);
    float _3598 = _3512 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3600 = _3590 * _3324;
    int _3602 = _3600 + _3586;
    float _3604 = fma(_3530, _3594, _2436);
    bool _3606 = !_1578;
    int _3608 = _3606 ? _3346 : (-1);
    float _3610 = -_2438;
    float _3612 = fma(_3598, _3596, _3610);
    bool _3614 = !_2748;
    int _3616 = _3614 ? 0 : 1;
    float _3618 = _1162 + 0.5;
    int _3620 = _3608 * _3348;
    int _3622 = _3620 + _3566;
    int _3624 = abs(_3616);
    float _3626 = fma(_3530, _3618, _3604);
    float _3628 = -_3598;
    float _3630 = fma(_3628, _3592, _3612);
    float _3632 = float(_3602);
    float _3634 = -_2530;
    float _3636 = fma(_1162, _3634, _3626);
    float _3638 = float(_3622);
    float _3640 = fma(_1192, _2540, _3630);
    float _3642 = float(_2652);
    out.m_80.x = _3632;
    float _3644 = float(_3624);
    out.m_80.w = _3638;
    bool _3646 = !_2752;
    int _3648 = _3646 ? 0 : 1;
    float _3650 = _3644 * _3642;
    out.m_82.x = _3636;
    out.m_82.y = _3640;
    float _3652 = _3198;
    if (_2980)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3654 = -_3178;
    float _3656 = _2638 + _3654;
    float _3658 = -_3174;
    float _3660 = _2884 + _3658;
    float _3662 = -_3280;
    float _3664 = _2920 + _3662;
    int _3666 = abs(_3648);
    float _3668 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3670 = _3656 + _3668;
    float _3672 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3674 = _3660 + _3672;
    float _3676 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3678 = _3664 + _3676;
    float _3680 = _2982 + (-1.0);
    float _3682 = _3670 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3684 = _3650 * (-2.0);
    float _3686 = float(_2738);
    float _3688 = fma(_3680, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3690 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3682);
    float _3692 = float(_3666);
    float _3694 = fma(_3684, _3196, _3196);
    float _3696 = fma(_3688, _3684, _3688);
    float _3698 = fma(_3678, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3690);
    float _3700 = _2938 + (-1.0);
    float _3702 = fma(_2984, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3694);
    float _3704 = _3692 * _3686;
    float _3706 = _3354 * 0.15915493667125701904296875;
    bool _3708 = _3698 >= 0.0;
    float _3710 = fma(_3696, _2578, _3702);
    float _3712 = _3704 * (-2.0);
    float _3714 = fma(_3700, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3716 = sqrt(_3352);
    float _3718 = _3710 * 0.15915493667125701904296875;
    float _3720 = fma(_3712, _3198, _3198);
    float _3722 = _1000 + (-0.5);
    float _3724 = fma(_3714, _3712, _3714);
    float _3726 = fma(_3722, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3720);
    float _3728 = _3706 * 6.283185482025146484375;
    float _3730 = sin(_3728);
    float _3732 = _3670;
    float _3734 = _3660;
    if (_3708)
    {
        _3652 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3736 = _3652;
    int _3738 = as_type<int>(_3736);
    if (_3708)
    {
        out.m_57.x = 0.0;
    }
    float _3740 = fma(_3724, _2578, _3726);
    if (_3708)
    {
        float _3742 = _3736 * 5.0;
        _3738 = as_type<int>(_3742);
    }
    int _3744 = _3738;
    float _3746 = _3740 * 0.15915493667125701904296875;
    float _3748 = _3706 * 6.283185482025146484375;
    float _3750 = cos(_3748);
    if (_3708)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10652 = as_type<float>(_3744);
        out.gl_Position.z = _10652;
    }
    float _3752 = _3718 * 6.283185482025146484375;
    float _3754 = sin(_3752);
    float _3756 = _3718 * 6.283185482025146484375;
    float _3758 = cos(_3756);
    if (_3708)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3760 = _3746 * 6.283185482025146484375;
    float _3762 = cos(_3760);
    float _3764 = _3132 * _3716;
    float _3766 = _555 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3768 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _215);
    float _3770 = _3730 * _3754;
    float _3772 = _3128 * _3764;
    float _3774 = _3764 * _3766;
    float _3776 = _3750 * _3754;
    float _3778 = _3746 * 6.283185482025146484375;
    float _3780 = sin(_3778);
    float _3782 = _3730 * _3758;
    float _3784 = _3768 * _3774;
    float _3786 = _3750 * _3758;
    float _3788 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _205);
    float _3790 = _3750 * _3762;
    float _3792 = _3788 * _3772;
    float _3794 = _3730 * _3762;
    float _3796 = _3758 * _3762;
    float _3798 = _3790 * _3784;
    float _3800 = _3764 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3802 = _3800 * 0.5;
    float _3804 = _3754 * _3762;
    float _3806 = fma(_3780, _3786, _3770);
    float _3808 = -_3782;
    float _3810 = fma(_3780, _3776, _3808);
    float _3812 = -_3784;
    float _3814 = _3780 * _3812;
    float _3816 = -_3776;
    float _3818 = fma(_3780, _3782, _3816);
    float _3820 = fma(_3806, _3792, _3798);
    float _3822 = _3794 * _3784;
    float _3824 = fma(_3796, _3792, _3814);
    float _3826 = fma(_3780, _3770, _3786);
    float _3828 = fma(_3810, _3802, _3820);
    float _3830 = fma(_3818, _3792, _3822);
    float _3832 = fma(_3804, _3802, _3824);
    float _3834 = _3828 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3836 = _3828 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3838 = fma(_3826, _3802, _3830);
    float _3840 = _3828 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3842 = fma(_3832, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3834);
    float _3844 = fma(_3832, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3836);
    float _3846 = fma(_3832, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3840);
    float _3848 = fma(_3838, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3842);
    float _3850 = fma(_3838, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3844);
    float _3852 = fma(_3838, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3846);
    float _3854 = _3848 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3856 = _3850 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3858 = _2884 + _3854;
    float _3860 = _2920 + _3856;
    float _3862 = _3852 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3864 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3866 = _3858 + _3864;
    float _3868 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3870 = _3860 + _3868;
    float _3872 = _2638 + _3862;
    float _3874 = _3866 * _3866;
    float _3876 = _3870 * _3870;
    float _3878 = _3874 + _3876;
    float _3880 = sqrt(_3878);
    bool _3882 = _3880 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3884 = _3838;
    float _3886 = _3858;
    float _3888 = _3860;
    float _3890 = _3874;
    float _3892 = _3876;
    if (!_3882)
    {
        _3884 = _3872;
    }
    float _3894 = _3884;
    bool _3896 = !_3882;
    float _3898 = _3894;
    if (!_3896)
    {
        float _3900 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3902 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3904 = _3880 + _3902;
        float _3906 = rsqrt(_3878);
        float _3908 = _3904 * _3900;
        float _3910 = _3872 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3912 = _3908 * 0.15915493667125701904296875;
        float _3914 = _3912 * 6.283185482025146484375;
        float _3916 = sin(_3914);
        float _3918 = _3912 * 6.283185482025146484375;
        float _3920 = cos(_3918);
        float _3922 = fma(_3916, _3910, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3924 = _3906 * _3922;
        float _3926 = _3920 + (-1.0);
        float _3928 = fma(_3866, _3924, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3930 = fma(_3870, _3924, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3932 = _3926 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3934 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3936 = _3928 + _3934;
        float _3938 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3940 = _3930 + _3938;
        float _3942 = fma(_3872, _3920, _3932);
        float _3944 = _3936 * _3936;
        float _3946 = _3940 * _3940;
        _3886 = _3928;
        _3888 = _3930;
        _3898 = _3942;
        _3890 = _3944;
        _3892 = _3946;
    }
    float _3948 = _3886;
    float _3950 = _3888;
    float _3952 = _3898;
    float _3954 = _3890;
    float _3956 = _3892;
    float _3958 = fma(_3948, 6.2500002968590706586837768554688e-05, 0.5);
    float _3960 = fma(_3950, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _10989 = float2(_3958, _3960);
    float3 _3964 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_10989, float2(0.0), isnan(_10989)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_10989, float2(0.0), isnan(_10989)), level(0.0)).xyz;
    float _3966 = _3964.x;
    float _3968 = _3964.y;
    float _3970 = _3964.z;
    float _3972 = _3806 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3974 = _3806 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3976 = _3806 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3978 = _3790 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3980 = _3790 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3982 = _3790 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3984 = _215 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3986 = fma(_3796, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3972);
    float _3988 = fma(_3796, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3974);
    float _3990 = fma(_3796, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3976);
    float _3992 = -_3780;
    float _3994 = fma(_3992, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3978);
    float _3996 = -_3780;
    float _3998 = fma(_3996, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3980);
    float _4000 = -_3780;
    float _4002 = fma(_4000, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3982);
    float _4004 = fma(_3984, _3984, 1.0);
    float _4006 = _3810 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4008 = _3810 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4010 = _3810 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4012 = fma(_3794, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3994);
    float _4014 = fma(_3804, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4006);
    float _4016 = rsqrt(_4004);
    float _4018 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4020 = _3952 + _4018;
    float _4022 = fma(_3804, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4008);
    float _4024 = fma(_3804, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4010);
    float _4026 = fma(_3794, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3998);
    float _4028 = fma(_4020, _4020, _3954);
    float _4030 = fma(_3794, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4002);
    float _4032 = fma(_3826, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4014);
    float _4034 = fma(_3826, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4022);
    float _4036 = _4028 + _3956;
    float _4038 = fma(_3826, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4024);
    float _4040 = fma(_3818, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3986);
    float _4042 = fma(_3818, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3988);
    float _4044 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4046 = _3984 * _4012;
    float _4048 = _3984 * _4026;
    float _4050 = _3984 * _4016;
    float _4052 = fma(_3818, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3990);
    float _4054 = _3984 * _4030;
    float _4056 = sqrt(_4036);
    float _4058 = -_4032;
    float _4060 = _4050 * _4058;
    float _4062 = -_4034;
    float _4064 = _4050 * _4062;
    float _4066 = -_4038;
    float _4068 = _4050 * _4066;
    float _4070 = fma(_4044, _4040, _4046);
    float _4072 = fma(_4044, _4042, _4048);
    float _4074 = fma(_4044, _4052, _4054);
    float _4076 = fma(_4016, _4012, _4060);
    float _4078 = fma(_4016, _4026, _4064);
    float _4080 = fma(_4016, _4030, _4068);
    float _4082 = _4032 + _4070;
    float _4084 = _4034 + _4072;
    float _4086 = _4038 + _4074;
    out.m_84.x = _4040;
    out.m_84.y = _4042;
    out.m_84.z = _4052;
    bool _4088 = _4056 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4090 = isnan(_4056);
    bool _4092 = _4088 || _4090;
    bool _4094 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4096 = _4092 || _4094;
    out.m_86.x = _4076;
    out.m_86.y = _4078;
    out.m_86.z = _4080;
    out.m_88.x = _4082;
    out.m_88.y = _4084;
    out.m_88.z = _4086;
    float _4098 = _4070;
    if (!_4096)
    {
        _4098 = 1.0;
    }
    float _4100 = _4098;
    out.m_90.x = _3966;
    out.m_90.y = _3968;
    out.m_90.z = _3970;
    bool _4102 = !_4096;
    float _4104 = _4100;
    if (!_4102)
    {
        bool _4106 = _4056 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4108 = isnan(_4056);
        bool _4110 = _4106 || _4108;
        bool _4112 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4114 = _4110 || _4112;
        if (!_4114)
        {
            float _4116 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4118 = _4056 + _4116;
            float _4120 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4122 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4120;
            float _4124 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4126 = _4124 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4128 = 1.0 / _4122;
            float _4130 = _4118 * _4128;
            float _4132 = fma(_4130, _4126, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4104 = _4132;
            _4134 = true;
        }
        else
        {
            bool _4136 = _4056 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4138 = isnan(_4056);
            bool _4140 = _4136 || _4138;
            bool _4142 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4144 = _4140 || _4142;
            if (!_4144)
            {
                float _4146 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4148 = _4056 + _4146;
                float _4150 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4152 = _4150 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4154 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4156 = _4154 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4158 = 1.0 / _4152;
                float _4160 = _4148 * _4158;
                float _4162 = fma(_4160, _4156, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4104 = _4162;
                _4134 = true;
            }
            else
            {
                _4104 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4134 = false;
    float _4164 = _4104;
    float _4166 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4168 = _3952 + _4166;
    float _4170 = _3656 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4172 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4174 = _3948 + _4172;
    float _4176 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4178 = _3950 + _4176;
    float _4180 = fma(_4168, _4164, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4182 = fma(_3660, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4170);
    float _4184 = fma(_4174, _4164, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4186 = fma(_4178, _4164, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4188 = -_2638;
    float _4190 = _4188 + _4180;
    float _4192 = fma(_3664, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4182);
    float _4194 = -_2884;
    float _4196 = _4194 + _4184;
    float _4198 = _3656 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4200 = _4190 * _4190;
    float _4202 = _4192 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4204 = -_2920;
    float _4206 = _4204 + _4186;
    float _4208 = fma(_3660, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4198);
    float _4210 = fma(_4196, _4196, _4200);
    float _4212 = 1.0 / _4202;
    float _4214 = fma(_3664, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4208);
    float _4216 = fma(_4206, _4206, _4210);
    float _4218 = _4214 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4220 = sqrt(_4216);
    float _4222 = _4218 + _4202;
    float _4224 = _4222 * _4212;
    float _4226 = _4224 * 0.5;
    float _4228 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4230 = fma(_4226, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4228);
    bool _4232 = _4220 > 0.0;
    float _4234 = 1.0 / _4230;
    bool _4236 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4238 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4240 = _4236 || _4238;
    bool _4242 = isnan(0.5);
    bool _4244 = _4240 || _4242;
    bool _4246 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4248 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4250 = _4246 || _4248;
    bool _4252 = isnan(0.5);
    bool _4254 = _4250 || _4252;
    float _4256 = _4226;
    float _4258 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4260 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4262 = _4190;
    if (!_4232)
    {
        _4256 = _4184;
    }
    float _4264 = _4256;
    float _4266 = _4264;
    float _4268 = _4264;
    if (!_4232)
    {
        _4258 = _4180;
    }
    float _4270 = _4258;
    float _4272 = _4270;
    if (!_4232)
    {
        _4260 = _4186;
    }
    float _4274 = _4260;
    bool _4276 = !_4232;
    float _4278 = _4274;
    float _4280 = _4234;
    if (!_4276)
    {
        float _4282 = _219 * _219;
        float _4284 = fma(_217, _217, _4282);
        float _4286 = fma(_221, _221, _4284);
        float _4288 = rsqrt(_4216);
        float _4290 = sqrt(_4286);
        float _4292 = _4196 * _4288;
        float _4294 = _4190 * _4288;
        float _4296 = _4206 * _4288;
        bool _4298 = _4290 > 0.0;
        float _4300 = _4290;
        float _4302 = _4288;
        _4262 = _4294;
        if (!_4298)
        {
            _4266 = _4184;
        }
        float _4304 = _4266;
        _4268 = _4304;
        if (!_4298)
        {
            _4300 = _4180;
        }
        float _4306 = _4300;
        _4272 = _4306;
        if (!_4298)
        {
            _4302 = _4186;
        }
        float _4308 = _4302;
        bool _4310 = !_4298;
        _4278 = _4308;
        if (!_4310)
        {
            float _4312 = rsqrt(_4286);
            float _4314 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4316 = _219 * _4312;
            float _4318 = _217 * _4312;
            float _4320 = _221 * _4312;
            float _4322 = _4294 * _4316;
            float _4324 = fma(_4292, _4318, _4322);
            float _4326 = _4314 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4328 = fma(_4296, _4320, _4324);
            float _4330 = _4328 * _4326;
            float _4332 = fma(_217, _4330, _4184);
            float _4334 = fma(_219, _4330, _4180);
            float _4336 = fma(_221, _4330, _4186);
            _4268 = _4332;
            _4272 = _4334;
            _4278 = _4336;
        }
    }
    float _4338 = _4268;
    float _4340 = _4272;
    float _4342 = _4278;
    float _4344 = _4262;
    float _4346 = -_3174;
    float _4348 = _4346 + _4338;
    float _4350 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4352 = _4234 * _4350;
    float _4354 = -_3178;
    float _4356 = _4354 + _4340;
    float _4358 = -_3280;
    float _4360 = _4358 + _4342;
    float _4362 = _4356;
    float _4364 = _4360;
    float _4366 = _4344;
    if (_4244)
    {
        _225 = 1.0;
    }
    float _4368 = _225;
    float _4370 = _4368;
    if (_4254)
    {
        _4280 = _4348;
    }
    float _4372 = _4280;
    float _4374 = _4372;
    if (!_4254)
    {
        float _4376 = _3670 * _3670;
        float _4378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4380 = -_2920;
        float _4382 = _4380 + _4342;
        float _4384 = -_2884;
        float _4386 = _4384 + _4338;
        float _4388 = fma(_3674, _3674, _4376);
        float _4390 = -_2638;
        float _4392 = _4390 + _4340;
        float _4394 = fma(_3678, _3678, _4388);
        float _4396 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4398 = sqrt(_4394);
        float _4400 = 1.0 / _3764;
        float _4402 = _4396 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4404 = precise::min(_4398, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4406 = _4404 * _4378;
        float _4408 = _4406 * _4400;
        float _4410 = _4402 * _4408;
        float _4412 = _4382 * _4408;
        float _4414 = fma(_4392, _4410, _3656);
        float _4416 = fma(_4386, _4410, _3660);
        float _4418 = fma(_4402, _4412, _3664);
        _4362 = _4414;
        _4374 = _4416;
        _4364 = _4418;
    }
    float _4420 = _4362;
    float _4422 = _4374;
    float _4424 = _4364;
    if (!_4244)
    {
        float _4426 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4428 = _4426 * 0.15915493667125701904296875;
        float _4430 = _4428 * 6.283185482025146484375;
        float _4432 = cos(_4430);
        float _4434 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4436 = _4434 * 0.15915493667125701904296875;
        float _4438 = _4428 * 6.283185482025146484375;
        float _4440 = sin(_4438);
        float _4442 = 1.0 / _4432;
        float _4444 = _4436 * 6.283185482025146484375;
        float _4446 = cos(_4444);
        float _4448 = _4440 * _4442;
        float _4450 = _4436 * 6.283185482025146484375;
        float _4452 = sin(_4450);
        float _4454 = _4446 * _4448;
        float _4456 = 1.0 / _4454;
        float _4458 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4460 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4458;
        float _4462 = 1.0 / _4460;
        float _4464 = _4452 * _4456;
        float _4466 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4468 = fma(_4352, _4464, _4466);
        float _4470 = _4468 * _4462;
        float _4472 = precise::clamp(_4470, 0.0, 1.0);
        _3732 = _4436;
        _4370 = _4472;
    }
    float _4474 = _3732;
    float _4476 = _4370;
    float _4478 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4480 = _4420 + _4478;
    float _4482 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4484 = _4422 + _4482;
    float _4486 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4488 = _4424 + _4486;
    float _4490 = _4480 * _4480;
    float _4492 = fma(_4484, _4484, _4490);
    float _4494 = fma(_3660, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4496 = fma(_4488, _4488, _4492);
    float _4498 = rsqrt(_4496);
    float _4500 = sqrt(_4496);
    float _4502 = _4498 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4504 = _4484 * _4502;
    float _4506 = _4488 * _4502;
    float _4508 = _4504 * _4504;
    float _4510 = _4506 * _4506;
    float _4512 = _4508 + _4510;
    float _4514 = sqrt(_4512);
    bool _4516 = _4514 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4518 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4520 = _4514 + _4518;
    float _4522 = _4498;
    float _4524 = _4520;
    float _4526 = _4480;
    if (_4516)
    {
        float _4528 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4522 = _4528;
    }
    float _4530 = _4522;
    float _4532 = _4530;
    if (_4516)
    {
        float _4534 = _4520 * _4530;
        _4524 = _4534;
    }
    float _4536 = _4524;
    if (_4516)
    {
        float _4538 = rsqrt(_4512);
        _4532 = _4538;
    }
    float _4540 = _4532;
    float _4542 = _4540;
    if (_4516)
    {
        float _4544 = _4536 * 0.15915493667125701904296875;
        _227 = _4544;
    }
    float _4546 = _227;
    float _4548 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4550 = _4488;
    if (_4516)
    {
        float _4552 = _4546 * 6.283185482025146484375;
        float _4554 = sin(_4552);
        _4550 = _4554;
    }
    float _4556 = _4550;
    float _4558 = precise::max(0.0, _4548);
    float _4560 = _4474;
    float _4562 = _4558;
    if (_4516)
    {
        float _4564 = _4546 * 6.283185482025146484375;
        float _4566 = cos(_4564);
        _4560 = _4566;
    }
    float _4568 = _4560;
    float _4570 = -_4502;
    float _4572 = -_4558;
    float _4574 = fma(_4480, _4570, _4572);
    if (_4516)
    {
        float _4576 = _4574 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4526 = _4576;
    }
    float _4578 = _4526;
    float _4580 = floor(_4494);
    float _4582 = _4556;
    float _4584 = _4578;
    if (_4516)
    {
        float _4586 = fma(_4556, _4578, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4582 = _4586;
    }
    float _4588 = _4582;
    float _4590 = _4588;
    if (!_4516)
    {
        _4584 = _4574;
    }
    float _4592 = _4584;
    float _4594 = _4592;
    if (_4516)
    {
        float _4596 = _4540 * _4588;
        _4366 = _4596;
    }
    float _4598 = _4366;
    if (!_4516)
    {
        _4542 = _4504;
    }
    float _4600 = _4542;
    float _4602 = _4600;
    if (_4516)
    {
        float _4604 = _4568 + (-1.0);
        _4562 = _4604;
    }
    float _4606 = _4562;
    float _4608 = _4606;
    if (_4516)
    {
        float _4610 = _4504 * _4598;
        _4602 = _4610;
    }
    float _4612 = _4602;
    if (!_4516)
    {
        _4590 = _4508;
    }
    float _4614 = _4590;
    float _4616 = _4614;
    if (_4516)
    {
        float _4618 = _4606 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3734 = _4618;
    }
    float _4620 = _3734;
    float _4622 = _4620;
    if (!_4516)
    {
        _4608 = _4506;
    }
    float _4624 = _4608;
    float _4626 = _4624;
    if (_4516)
    {
        float _4628 = _4506 * _4598;
        _4626 = _4628;
    }
    float _4630 = _4626;
    if (_4516)
    {
        float _4632 = _4612 * _4612;
        _4616 = _4632;
    }
    float _4634 = _4616;
    if (_4516)
    {
        float _4636 = fma(_4574, _4568, _4620);
        _4594 = _4636;
    }
    float _4638 = _4594;
    if (!_4516)
    {
        _4622 = _4510;
    }
    float _4640 = _4622;
    float _4642 = _4640;
    if (_4516)
    {
        float _4644 = _4630 * _4630;
        _4642 = _4644;
    }
    float _4646 = _4642;
    float _4648 = fma(_4638, _4638, _4634);
    float _4650 = _4420 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4652 = -_4580;
    float _4654 = _4494 + _4652;
    float _4656 = _4648 + _4646;
    float _4658 = fma(_4422, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4650);
    float _4660 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4662 = fma(_4500, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4660);
    float _4664 = precise::clamp(_4662, 0.0, 1.0);
    float _4666 = rsqrt(_4656);
    float _4668 = fma(_4424, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4658);
    float _4670 = -_4664;
    float _4672 = _4670 + 1.0;
    float _4674 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4676 = fma(_3664, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4678 = _4668 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4680 = _4420 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4682 = abs(_4672);
    float _4684 = log2(_4682);
    float _4686 = _4678 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4688 = _4420 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4690 = -_4686;
    float _4692 = fma(_4690, _4674, 1.0);
    float _4694 = _4420 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4696 = fma(_4422, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4688);
    float _4698 = _4666 * _4612;
    float _4700 = _4666 * _4638;
    float _4702 = fma(_4422, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4694);
    float _4704 = fma(_4424, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4696);
    float _4706 = _4698 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4708 = _4666 * _4630;
    float _4710 = fma(_4424, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4702);
    float _4712 = _4704 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4714 = -_4706;
    float _4716 = fma(_4700, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4714);
    float _4718 = fma(_4422, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4680);
    float _4720 = _4710 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4722 = _4712 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4724 = -_4708;
    float _4726 = fma(_4724, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4716);
    float _4728 = floor(_4676);
    float _4730 = fma(_4424, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4718);
    float _4732 = fma(_4720, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4722);
    float _4734 = fma(_4726, -0.5, 0.5);
    float _4736 = _4684 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4738 = _4730 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4740 = fma(_4678, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4732);
    float _4742 = fma(_4726, 0.5, 0.5);
    float _4744 = exp2(_4736);
    float _4746 = _4700 + 1.0;
    float _4748 = fma(_4738, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4740);
    float _4750 = _4712 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4752 = fma(_4742, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4754 = fma(_4720, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4750);
    float _4756 = sqrt(_4734);
    float _4758 = _4712 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4760 = -_4728;
    float _4762 = _4676 + _4760;
    float _4764 = fma(_4742, _4752, -0.212114393711090087890625);
    float _4766 = fma(_4678, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4754);
    float _4768 = fma(_4720, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4758);
    float _4770 = fma(_4742, _4764, 1.570728778839111328125);
    float _4772 = log2(_4692);
    float _4774 = fma(_4678, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4768);
    float _4776 = fma(_4738, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4766);
    float _4778 = -_4700;
    float _4780 = fma(_4744, _4746, _4778);
    float _4782 = fma(_4738, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4774);
    float _4784 = fma(_4780, 0.5, 0.5);
    float _4786 = 1.0 / _4748;
    float _4788 = _4756 * 0.636619746685028076171875;
    float _4790 = -_4770;
    float _4792 = fma(_4788, _4790, 1.0);
    float2 _12387 = float2(_4654, _4762);
    float _4794 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12387, float2(0.0), isnan(_12387)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12387, float2(0.0), isnan(_12387)), level(0.0)).x;
    float _4796 = _4772 * 0.693147182464599609375;
    float _4798 = _4776 * _4786;
    float _4800 = _4782 * _4786;
    float _4802 = _4796 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4804 = fma(_4798, 0.5, 0.5);
    float _4806 = fma(_4800, -0.5, 0.5);
    float3 _12413 = float3(_4804, _4806, _4802);
    float _4808 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12413, float3(0.0), isnan(_12413)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12413, float3(0.0), isnan(_12413)), level(0.0)).x;
    float3 _12424 = float3(_4804, _4806, _4802);
    float4 _4811 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12424, float3(0.0), isnan(_12424)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12424, float3(0.0), isnan(_12424)), level(0.0)).xyzw;
    float _4813 = _4811.x;
    float _4815 = _4811.y;
    float _4817 = _4811.z;
    float _4819 = _4811.w;
    float2 _12440 = float2(_4792, _4784);
    float3 _4821 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12440, float2(0.0), isnan(_12440)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12440, float2(0.0), isnan(_12440)), level(0.0)).xyz;
    float _4823 = _4821.x;
    float _4825 = _4821.y;
    float _4827 = _4821.z;
    float _4829 = abs(_4352);
    float _4831 = log2(_4829);
    float _4833 = _4712 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _4835 = _4500 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4837 = isnan(_4500);
    bool _4839 = _4835 || _4837;
    bool _4841 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4843 = _4839 || _4841;
    float _4845 = fma(_4720, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4833);
    float _4847 = fma(_4678, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4845);
    float _4849 = _4776 + _4748;
    float _4851 = fma(_4738, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4847);
    float _4853 = _4831 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4855 = in.m_92.x;
    float _4857 = _4849 * 0.5;
    out.gl_Position.x = _4776;
    out.gl_Position.y = _4782;
    out.gl_Position.z = _4851;
    out.gl_Position.w = _4748;
    float _4859 = exp2(_4853);
    float _4861 = _4776;
    float _4863 = _4851;
    float _4865 = _4748;
    float _4867 = _4782;
    if (!_4843)
    {
        _4861 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4869 = _4861;
    float _4871 = fma(_4859, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4873 = precise::clamp(_4871, 0.0, 1.0);
    float _4875 = _4851 + _4748;
    float _4877 = _4869;
    float _4879 = _4869;
    if (!_4843)
    {
        _4863 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4881 = _4863;
    float _4883 = fma(_4873, -2.0, 3.0);
    float _4885 = _4873 * _4873;
    float _4887 = _4875 * 0.5;
    float _4889 = _4885 * _4883;
    float _4891 = _4684 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _4893 = _4352 <= 8000.0;
    bool _4895 = isnan(_4352);
    bool _4897 = _4893 || _4895;
    bool _4899 = isnan(8000.0);
    bool _4901 = _4897 || _4899;
    float _4903 = float(_4901);
    float _4905 = _4748 * 0.5;
    float _4907 = -_4889;
    float _4909 = _4907 + 1.0;
    float _4911 = exp2(_4891);
    float _4913 = fma(_4909, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4889);
    float _4915 = fma(_4782, -0.5, _4905);
    float _4917 = _4903 * _4913;
    float _4919 = _4881;
    float _4921 = _4881;
    if (!_4843)
    {
        _4865 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4923 = _4865;
    out.m_94.x = _4857;
    out.m_94.y = _4915;
    out.m_94.z = _4887;
    out.m_94.w = _4748;
    float _4925 = _4917 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4927 = _4923;
    float _4929 = _4923;
    if (!_4843)
    {
        _4867 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4931 = _4867;
    float _4933 = -_4911;
    float _4935 = _4933 + 1.0;
    float _4937 = _4935 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4939 = -_4794;
    float _4941 = _4939 + 1.0;
    float _4943 = _4941 * _4925;
    float _4945 = precise::clamp(_4943, 0.0, 1.0);
    float _4947 = -_4945;
    float _4949 = fma(_4947, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4951 = _4949 * _4855;
    float _4953 = _4951 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4955 = _4937 * _4808;
    float _4957 = -_4937;
    float _4959 = _4957 + 1.0;
    out.m_96.x = _4953;
    float _4961 = _4819 * _4955;
    float _4963 = _4827 * _4955;
    float _4965 = _4819 * _4959;
    float _4967 = fma(_4823, _4961, _4813);
    float _4969 = fma(_4825, _4961, _4815);
    float _4971 = fma(_4819, _4963, _4817);
    float _4973 = _4476 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4975 = _4961;
    float _4977 = _4817;
    float _4979 = _4931;
    float _4981 = _4931;
    if (!_4843)
    {
        _4975 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4983 = _4975;
    float _4985 = _4983;
    float _4987 = _4983;
    if (!_4843)
    {
        _4977 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4989 = _4977;
    out.m_98.x = _4967;
    out.m_98.y = _4969;
    out.m_98.z = _4971;
    out.m_98.w = _4965;
    bool _4991 = !_4843;
    float _4993 = _4989;
    float _4995 = _4989;
    if (!_4991)
    {
        bool _4997 = _4500 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4999 = isnan(_4500);
        bool _5001 = _4997 || _4999;
        bool _5003 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5005 = _5001 || _5003;
        if (!_5005)
        {
            float _5007 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5009 = _4500 + _5007;
            float _5011 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5013 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5011;
            float _5015 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5017 = _5015 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5019 = 1.0 / _5013;
            float _5021 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5023 = _5021 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5025 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5027 = _5025 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5029 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5031 = _5029 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5033 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5035 = _5033 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5037 = _5009 * _5019;
            float _5039 = precise::clamp(_5037, 0.0, 1.0);
            float _5041 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5043 = _5041 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5045 = fma(_5039, _5017, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5047 = fma(_5039, _5043, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5049 = fma(_5039, _5023, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5051 = fma(_5039, _5027, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5053 = fma(_5039, _5031, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5055 = fma(_5039, _5035, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4995 = _5049;
            _4981 = _5053;
            _4987 = _5045;
            _4921 = _5051;
            _4929 = _5047;
            _4879 = _5055;
            _5057 = true;
        }
        else
        {
            bool _5059 = _4500 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5061 = isnan(_4500);
            bool _5063 = _5059 || _5061;
            bool _5065 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5067 = _5063 || _5065;
            if (!_5067)
            {
                _4985 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5069 = _4985;
            _4987 = _5069;
            if (!_5067)
            {
                _4993 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5071 = _4993;
            _4995 = _5071;
            if (!_5067)
            {
                _4927 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5073 = _4927;
            _4929 = _5073;
            if (!_5067)
            {
                _4919 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5075 = _4919;
            _4921 = _5075;
            if (!_5067)
            {
                _4979 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5077 = _4979;
            _4981 = _5077;
            if (!_5067)
            {
                _4877 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5079 = _4877;
            bool _5081 = !_5067;
            _4879 = _5079;
            if (!_5081)
            {
                bool _5083 = _4500 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5085 = isnan(_4500);
                bool _5087 = _5083 || _5085;
                bool _5089 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5091 = _5087 || _5089;
                if (!_5091)
                {
                    float _5093 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5095 = _4500 + _5093;
                    float _5097 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5099 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5097;
                    float _5101 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5103 = _5101 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5105 = 1.0 / _5099;
                    float _5107 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5109 = _5107 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5111 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5113 = _5111 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5115 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5117 = _5115 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5119 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5121 = _5119 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5123 = _5095 * _5105;
                    float _5125 = precise::clamp(_5123, 0.0, 1.0);
                    float _5127 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5129 = _5127 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5131 = fma(_5125, _5103, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5133 = fma(_5125, _5129, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5135 = fma(_5125, _5109, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5137 = fma(_5125, _5113, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5139 = fma(_5125, _5117, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5141 = fma(_5125, _5121, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4995 = _5135;
                    _4981 = _5139;
                    _4987 = _5131;
                    _4921 = _5137;
                    _4929 = _5133;
                    _4879 = _5141;
                    _5057 = true;
                }
                else
                {
                    _4995 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4981 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4987 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4921 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4929 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4879 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5057 = false;
    float _5143 = _4995;
    float _5145 = _4981;
    float _5147 = _4987;
    float _5149 = _4921;
    float _5151 = _4929;
    float _5153 = _4879;
    float _5155 = _4973 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5157 = fma(_4084, -0.5, 0.5);
    float _5159 = precise::clamp(_5157, 0.0, 1.0);
    float _5161 = -_5143;
    float _5163 = _5161 + _5145;
    float _5165 = -_5147;
    float _5167 = _5165 + _5149;
    out.m_57.x = _5155;
    float _5169 = fma(_5159, _5163, _5143);
    float _5171 = -_5151;
    float _5173 = _5171 + _5153;
    float _5175 = fma(_5159, _5167, _5147);
    float _5177 = _5169 * 0.586610972881317138671875;
    bool _5179 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5181 = fma(_5159, _5173, _5151);
    out.m_100.x = 0.0;
    float _5183 = fma(_5175, 0.298911988735198974609375, _5177);
    bool _5185 = _4476 > 0.0;
    bool _5187 = isnan(_4476);
    bool _5189 = _5185 || _5187;
    bool _5191 = isnan(0.0);
    bool _5193 = _5189 || _5191;
    float _5195 = fma(_5181, 0.114477999508380889892578125, _5183);
    float _5197 = -_5195;
    float _5199 = _5175 + _5197;
    float _5201 = -_5195;
    float _5203 = _5169 + _5201;
    float _5205 = -_5195;
    float _5207 = _5181 + _5205;
    float _5209 = fma(_5199, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5195);
    float _5211 = fma(_5203, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5195);
    float _5213 = fma(_5207, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5195);
    bool _5215 = !_5179;
    if (!_5215)
    {
        float _5217 = -_4420;
        float _5219 = _5217 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5221 = -_4422;
        float _5223 = _5221 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5225 = -_4424;
        float _5227 = _5225 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5229 = _5219 * _5219;
        float _5231 = fma(_5223, _5223, _5229);
        float _5233 = fma(_5227, _5227, _5231);
        float _5235 = sqrt(_5233);
        float _5237 = rsqrt(_5233);
        float _5239 = -_5235;
        float _5241 = _5239 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5243 = _5241 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5245 = precise::clamp(_5243, 0.0, 1.0);
        float _5247 = _5223 * _5237;
        float _5249 = _5219 * _5237;
        float _5251 = abs(_5245);
        float _5253 = log2(_5251);
        float _5255 = _5227 * _5237;
        float _5257 = _5247 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5259 = _4084 * _5249;
        float _5261 = -_5249;
        float _5263 = -_5257;
        float _5265 = fma(_5261, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5263);
        float _5267 = fma(_4082, _5247, _5259);
        float _5269 = -_5255;
        float _5271 = fma(_5269, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5265);
        float _5273 = fma(_4086, _5255, _5267);
        float _5275 = precise::clamp(_5273, 0.0, 1.0);
        float _5277 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5279 = _5271 + _5277;
        float _5281 = _5253 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5283 = _5279 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5285 = precise::clamp(_5283, 0.0, 1.0);
        float _5287 = exp2(_5281);
        float _5289 = _5287 * _5285;
        float _5291 = _5275 * _5289;
        float _5293 = _5291 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5295 = _5291 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5297 = _5291 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _5293;
        out.m_100.y = _5295;
        out.m_100.z = _5297;
    }
    out.m_102.x = _5209;
    out.m_102.y = _5211;
    out.m_102.z = _5213;
    if (_5193)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_57.x = 0.0;
    float _5299 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5299;
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
    bool _5057 = false;
    bool _4134 = false;
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
        float _5366 = as_type<float>(_145);
        out.gl_Position.z = _5366;
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
        float _5429 = as_type<float>(_177);
        out.gl_Position.z = _5429;
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
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _591;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _599 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _601 = isnan(_581);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = 1.0 / _589;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _617 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _619 = isnan(_581);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    bool _629 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _631 = 1.0 / _597;
    float _633 = _593 * _611;
    bool _635 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _637 = isnan(_581);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = 1.0 / _615;
    float _649 = -_609;
    float _651 = _649 + 1.0;
    float _653 = fma(_633, _585, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _659 = -_645;
    float _661 = _659 + 1.0;
    bool _663 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _665 = isnan(_581);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = _645 * _651;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _679 = _677 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _681 = 1.0 / _657;
    float _683 = _627 * _661;
    float _685 = -_673;
    float _687 = _685 + 1.0;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _689;
    float _693 = _679 * _631;
    float _695 = _653 * _683;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _699 = _581 + _697;
    float _701 = -_627;
    float _703 = _701 + 1.0;
    float _705 = _609 * _687;
    float _707 = _691 * _647;
    bool _709 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _711 = isnan(_581);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _723 = _721 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _727 = _581 + _725;
    float _729 = fma(_693, _699, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _731 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[131].x, _695);
    float _733 = -_719;
    float _735 = _733 + 1.0;
    float _737 = _723 * _681;
    float _739 = fma(_707, _727, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _743 = _581 + _741;
    float _745 = fma(_729, _675, _731);
    float _747 = _673 * _735;
    float _749 = fma(_737, _743, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _751 = fma(_739, _705, _745);
    float _753 = fma(_749, _747, _751);
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _761 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[135].x, _753);
    float _763 = _755 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _765 = _757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _767 = _759 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _769 = _761 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_70.x = _763;
    out.m_70.y = _765;
    out.m_70.z = _767;
    out.m_70.w = _769;
    bool _771 = !_629;
    float _773 = _631;
    int _775 = as_type<int>(_705);
    int _777 = as_type<int>(_767);
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[134].x;
    if (!_771)
    {
        float _781 = in.m_64.x;
        float _783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _785 = _781 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _787 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _789 = _787 * _783;
        float _791 = floor(_789);
        float _793 = -_791;
        float _795 = _789 + _793;
        _173 = _795;
    }
    float _797 = _173;
    float _799 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _801 = int(_799);
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _805 = _803 != 0;
    float _807 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _809 = int(_807);
    float _811 = float(_801);
    float _813 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _815 = int(_813);
    float _817 = 0.0;
    if (_805)
    {
        _817 = 1.0;
    }
    float _819 = _817;
    float _821 = _819;
    if (_805)
    {
        _773 = 1.0;
    }
    float _823 = _773;
    float _825 = _823;
    if (_805)
    {
        _775 = 0;
    }
    int _827 = _775;
    float _829 = float(_809);
    float _831 = 1.0 / _811;
    int _833 = _827;
    if (_805)
    {
        _777 = 0;
    }
    int _835 = _777;
    float _837 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _839 = int(_837);
    float _841 = float(uint(_815));
    float _843 = 1.0 / _829;
    float _845 = _831 * _127;
    float _847 = 1.0 / _841;
    float _849 = float(uint(_839));
    int _851 = ~_839;
    int _853 = _851 + 1;
    float _855 = trunc(_845);
    int _857 = int(_855);
    float _859 = _843 * _127;
    float _861 = _843;
    float _863 = _811;
    int _865 = _835;
    if (_805)
    {
        float _867 = in.m_64.x;
        float _869 = in.m_64.y;
        _861 = _867;
        _863 = _869;
    }
    float _871 = _861;
    float _873 = _863;
    float _875 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _877 = int(_875);
    int _879 = as_type<int>(_847) + (-2);
    float _881 = 1.0 / _849;
    float _883 = float(uint(_857));
    float _885 = as_type<float>(_879) * _883;
    float _887 = trunc(_859);
    int _889 = int(_887);
    float _891 = float(uint(_877));
    float _893 = _871;
    float _895 = _873;
    float _897 = as_type<float>(_879);
    if (_805)
    {
        _779 = _871;
    }
    float _899 = _779;
    float _901 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _903 = int(_901);
    int _905 = as_type<int>(_881) + (-2);
    float _907 = _881;
    float _909 = _899;
    if (_805)
    {
        _907 = _873;
    }
    float _911 = _907;
    float _913 = 1.0 / _891;
    float _915 = float(uint(_889));
    float _917 = as_type<float>(_905) * _915;
    float _919 = trunc(_885);
    float _921 = precise::max(_919, 0.0);
    uint _924 = uint(_921);
    float _926 = float(_903);
    float _928 = 1.0 / _926;
    float _930 = trunc(_917);
    float _932 = precise::max(_930, 0.0);
    uint _934 = uint(_932);
    float _936 = _926;
    float _938 = _917;
    float _940 = _911;
    if (_805)
    {
        _936 = _899;
    }
    float _942 = _936;
    float _944 = _942;
    if (_805)
    {
        _938 = _899;
    }
    float _946 = _938;
    float _948 = _946;
    if (!_805)
    {
        float _950 = in.m_64.x;
        float _952 = in.m_64.y;
        float _954 = in.m_64.z;
        float _956 = _950 * 3.1415927410125732421875;
        float _958 = _956 * 0.15915493667125701904296875;
        float _960 = _952 * 3.1415927410125732421875;
        float _962 = _960 * 0.15915493667125701904296875;
        float _964 = _958 * 6.283185482025146484375;
        float _966 = sin(_964);
        float _968 = _962 * 6.283185482025146484375;
        float _970 = sin(_968);
        _821 = 7.345489978790283203125;
        _893 = _950;
        _825 = 5.839270114898681640625;
        _944 = _954;
        _909 = _952;
        _895 = _952;
        _940 = _970;
        _833 = 1;
        _865 = 2;
        _948 = _966;
    }
    float _972 = _821;
    float _974 = _893;
    float _976 = _825;
    float _978 = _944;
    float _980 = _909;
    float _982 = _895;
    float _984 = _940;
    int _986 = _833;
    int _988 = _865;
    float _990 = _948;
    int _992 = _853 * int(_934);
    int _994 = _992 + _889;
    float _996 = _972 * _974;
    float _998 = _976 * _978;
    float _1000 = in.m_64.z;
    float _1002 = in.m_64.w;
    float _1004 = _972 * _980;
    float _1006 = float(uint(_994));
    float _1008 = floor(_996);
    float _1010 = _928 * _127;
    float _1012 = _974 * 2.0;
    float _1014 = as_type<float>(_905) * _1006;
    int _1016 = ~_815;
    int _1018 = _1016 + 1;
    float _1020 = float(_889);
    float _1022 = trunc(_1014);
    float _1024 = precise::max(_1022, 0.0);
    uint _1026 = uint(_1024);
    float _1028 = float(_839);
    int _1030 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1032 = _1030 != 0;
    int _1034 = _1018 * int(_924);
    int _1036 = _1034 + _857;
    bool _1038 = _982 > 0.5;
    float _1040 = floor(_998);
    float _1042 = -_1008;
    float _1044 = _996 + _1042;
    int _1046 = ~_815;
    int _1048 = _1046 + 1;
    float _1050 = float(uint(_1036));
    bool _1052 = _1002 > 0.5;
    float _1054 = trunc(_1010);
    int _1056 = int(_1054);
    float _1058 = as_type<float>(_879) * _1050;
    int _1060 = int(_934) + int(_1026);
    int _1062 = as_type<int>(_913) + (-2);
    bool _1064 = _1000 > 0.5;
    float _1066 = trunc(_1058);
    float _1068 = precise::max(_1066, 0.0);
    uint _1070 = uint(_1068);
    float _1072 = -_1040;
    float _1074 = _998 + _1072;
    int _1076 = ~_839;
    int _1078 = _1076 + 1;
    bool _1080 = _1020 >= _1028;
    bool _1082 = isnan(_1020);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan(_1028);
    bool _1088 = _1084 || _1086;
    float _1090 = float(_1088);
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1094 = _1092 != 0;
    int _1096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1098 = _1096 != 0;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1102 = _1100 != 0;
    int _1104 = _1078 * _1060;
    int _1106 = _1104 + _889;
    float _1108 = float(uint(_1056));
    float _1110 = floor(_1004);
    float _1112 = -_205;
    int _1114 = _1038 ? as_type<int>(_1112) : as_type<int>(_205);
    float _1116 = as_type<float>(_1062) * _1108;
    float _1118 = -_215;
    int _1120 = _1064 ? as_type<int>(_1118) : as_type<int>(_215);
    int _1122 = int(_924) + int(_1070);
    float _1124 = trunc(_1116);
    float _1126 = precise::max(_1124, 0.0);
    uint _1128 = uint(_1126);
    float _1130 = _1044 * _1028;
    int _1132 = int(_1052);
    int _1134 = _1064 ? 2 : 0;
    int _1136 = _1132 | _1134;
    int _1138 = _1032 ? 4 : 0;
    int _1140 = _1136 | _1138;
    int _1142 = _1094 ? 8 : 0;
    int _1144 = _1140 | _1142;
    int _1146 = _1098 ? 16 : 0;
    int _1148 = _1144 | _1146;
    int _1150 = _1102 ? 32 : 0;
    int _1152 = _1148 | _1150;
    int _1154 = _1038 ? 64 : 0;
    int _1156 = _1152 | _1154;
    int _1158 = _1156 & 64;
    bool _1160 = !_1098;
    float _1162 = _1160 ? _205 : as_type<float>(_1114);
    float _1164 = float(_815);
    float _1166 = trunc(_1090);
    int _1168 = int(_1166);
    float _1170 = float(_857);
    float _1172 = _1074 * _1164;
    int _1174 = ~_877;
    int _1176 = _1174 + 1;
    int _1178 = _1048 * _1122;
    int _1180 = _1178 + _857;
    bool _1182 = !_1032;
    int _1184 = _1182 ? 0 : 1;
    float _1186 = trunc(_1130);
    int _1188 = int(_1186);
    bool _1190 = !_1102;
    float _1192 = _1190 ? _215 : as_type<float>(_1120);
    int _1194 = _1176 * int(_1128);
    int _1196 = _1194 + _1056;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1200 = _1198 != 0;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1204 = _1202 != 0;
    int _1206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1208 = _1206 != 0;
    bool _1210 = uint(_1106) >= uint(_839);
    bool _1212 = _1170 >= _1164;
    bool _1214 = isnan(_1170);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan(_1164);
    bool _1220 = _1216 || _1218;
    float _1222 = float(_1220);
    float _1224 = trunc(_1172);
    int _1226 = int(_1224);
    bool _1228 = !_1204;
    int _1230 = _1228 ? 0 : 1;
    bool _1232 = !_1200;
    int _1234 = _1232 ? 0 : 1;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1238 = _1236 != 0;
    bool _1240 = uint(_1180) >= uint(_815);
    float _1242 = trunc(_1222);
    int _1244 = int(_1242);
    bool _1246 = !_1210;
    int _1248 = _1246 ? 0 : (-1);
    bool _1250 = !_1208;
    int _1252 = _1250 ? 0 : 1;
    bool _1254 = !_1238;
    int _1256 = _1254 ? 0 : 1;
    bool _1258 = !_1240;
    int _1260 = _1258 ? 0 : (-1);
    float _1262 = floor(_1012);
    float _1264 = -_1110;
    float _1266 = _1004 + _1264;
    float _1268 = float(uint(_1196));
    int _1270 = abs(_1184);
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1274 = _1272 != 0;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1278 = _1276 != 0;
    int _1280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1282 = _1280 != 0;
    float _1284 = as_type<float>(_1062) * _1268;
    int _1286 = ~_1060;
    int _1288 = _1286 + _1248;
    int _1290 = _1288 + 1;
    int _1292 = _1188 * _1270;
    int _1294 = _1292 + _889;
    int _1296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1298 = _1296 != 0;
    int _1300 = ~_1122;
    int _1302 = _1300 + _1260;
    int _1304 = _1302 + 1;
    int _1306 = _839 * _1290;
    int _1308 = _1306 + _889;
    bool _1310 = !_1278;
    int _1312 = _1310 ? 0 : 1;
    float _1314 = trunc(_1284);
    float _1316 = precise::max(_1314, 0.0);
    uint _1318 = uint(_1316);
    bool _1320 = !_1298;
    int _1322 = _1320 ? 0 : 1;
    int _1324 = _815 * _1304;
    int _1326 = _1324 + _857;
    bool _1328 = _1158 != 0;
    float _1330 = _165 * _127;
    bool _1332 = _839 == 0;
    bool _1334 = !_1274;
    int _1336 = _1334 ? 0 : 1;
    float _1338 = _1028 * _1330;
    bool _1340 = _815 == 0;
    float _1342 = _1164 * _1330;
    int _1344 = ~_1168;
    int _1346 = _1344 + 1;
    int _1348 = _1346 + 1;
    bool _1350 = !_1332;
    int _1352 = _1350 ? _1308 : (-1);
    float _1354 = trunc(_1338);
    int _1356 = int(_1354);
    int _1358 = ~_1244;
    int _1360 = _1358 + 1;
    int _1362 = _1360 + 1;
    bool _1364 = !_1340;
    int _1366 = _1364 ? _1326 : (-1);
    int _1368 = _1352 * _1348;
    int _1370 = _839 + (-1);
    int _1372 = abs(_1230);
    int _1374 = _1366 * _1362;
    int _1376 = _815 + (-1);
    int _1378 = _1168 * _1370;
    int _1380 = _1378 + _1368;
    int _1382 = abs(_1312);
    float _1384 = trunc(_1342);
    int _1386 = int(_1384);
    int _1388 = abs(_1322);
    int _1390 = _1244 * _1376;
    int _1392 = _1390 + _1374;
    int _1394 = _1380 * _1372;
    int _1396 = abs(_1234);
    int _1398 = _1226 * _1388;
    int _1400 = _1398 + _857;
    int _1402 = ~_877;
    int _1404 = _1402 + 1;
    int _1406 = _1392 * _1382;
    int _1408 = abs(_1252);
    int _1410 = _1356 * _1396;
    int _1412 = _1410 + _1394;
    int _1414 = abs(_1256);
    int _1416 = _1294 * _1408;
    int _1418 = _1416 + _1412;
    int _1420 = int(_1128) + int(_1318);
    int _1422 = abs(_1336);
    int _1424 = _1404 * _1420;
    int _1426 = _1424 + _1056;
    float _1428 = -_215;
    int _1430 = _1052 ? as_type<int>(_1428) : as_type<int>(_215);
    int _1432 = _1188 * _1414;
    int _1434 = _1432 + _1418;
    float _1436 = -_205;
    int _1438 = _1064 ? as_type<int>(_1436) : as_type<int>(_205);
    int _1440 = _1386 * _1422;
    int _1442 = _1440 + _1406;
    bool _1444 = uint(_1426) >= uint(_877);
    float _1446 = float(uint(_1434));
    float _1448 = float(_877);
    float _1450 = float(_1056);
    float _1452 = as_type<float>(_905) * _1446;
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1456 = _1454 != 0;
    float _1458 = _1448 * _1330;
    bool _1460 = !_1282;
    int _1462 = _1460 ? 0 : 1;
    float _1464 = trunc(_1452);
    float _1466 = precise::max(_1464, 0.0);
    uint _1468 = uint(_1466);
    bool _1470 = _1450 >= _1448;
    bool _1472 = isnan(_1450);
    bool _1474 = _1470 || _1472;
    bool _1476 = isnan(_1448);
    bool _1478 = _1474 || _1476;
    float _1480 = float(_1478);
    float _1482 = _1266 * _1448;
    int _1484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1486 = _1484 != 0;
    float _1488 = _982 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1490 = !_1456;
    int _1492 = _1490 ? 0 : 1;
    int _1494 = abs(_1462);
    float _1496 = trunc(_1480);
    int _1498 = int(_1496);
    bool _1500 = !_1094;
    float _1502 = _1500 ? _215 : as_type<float>(_1430);
    bool _1504 = !_1486;
    int _1506 = _1504 ? 0 : 1;
    int _1508 = abs(_1492);
    float _1510 = trunc(_1458);
    int _1512 = int(_1510);
    bool _1514 = !_1444;
    int _1516 = _1514 ? 0 : (-1);
    int _1518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1520 = _1518 != 0;
    int _1522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1524 = _1522 != 0;
    int _1526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1528 = _1526 != 0;
    int _1530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1532 = _1530 != 0;
    int _1534 = _1400 * _1494;
    int _1536 = _1534 + _1442;
    int _1538 = ~_1420;
    int _1540 = _1538 + _1516;
    int _1542 = _1540 + 1;
    bool _1544 = !_1524;
    int _1546 = _1544 ? 0 : 1;
    int _1548 = _1226 * _1508;
    int _1550 = _1548 + _1536;
    int _1552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1554 = _1552 != 0;
    int _1556 = _877 * _1542;
    int _1558 = _1556 + _1056;
    int _1560 = ~_839;
    int _1562 = _1560 + 1;
    float _1564 = trunc(_1482);
    int _1566 = int(_1564);
    float _1568 = float(uint(_1550));
    bool _1570 = !_1520;
    int _1572 = _1570 ? 0 : 1;
    int _1574 = _1562 * int(_1468);
    int _1576 = _1574 + _1434;
    bool _1578 = _877 == 0;
    float _1580 = as_type<float>(_879) * _1568;
    int _1582 = ~_1498;
    int _1584 = _1582 + 1;
    int _1586 = _1584 + 1;
    float _1588 = float(uint(_1576));
    float _1590 = _1568;
    float _1592 = as_type<float>(_986);
    if (_1554)
    {
        float _1594 = in.m_64.w;
        _1590 = _1594;
    }
    float _1596 = _1590;
    bool _1598 = !_1578;
    int _1600 = _1598 ? _1558 : (-1);
    float _1602 = trunc(_1580);
    float _1604 = precise::max(_1602, 0.0);
    uint _1606 = uint(_1604);
    int _1608 = abs(_1546);
    float _1610 = as_type<float>(_905) * _1588;
    int _1612 = abs(_1506);
    int _1614 = _1600 * _1586;
    int _1616 = _877 + (-1);
    int _1618 = abs(_1572);
    float _1620 = trunc(_1610);
    float _1622 = precise::max(_1620, 0.0);
    uint _1624 = uint(_1622);
    int _1626 = _1498 * _1616;
    int _1628 = _1626 + _1614;
    int _1630 = _1628 * _1608;
    int _1632 = ~_815;
    int _1634 = _1632 + 1;
    int _1636 = _1566 * _1612;
    int _1638 = _1636 + _1056;
    bool _1640 = _839 == 0;
    int _1642 = _1512 * _1618;
    int _1644 = _1642 + _1630;
    bool _1646 = !_1528;
    int _1648 = _1646 ? 0 : 1;
    int _1650 = _1634 * int(_1606);
    int _1652 = _1650 + _1550;
    int _1654 = ~_839;
    int _1656 = _1654 + 1;
    float _1658 = as_type<float>(_1612);
    if (_1554)
    {
        float _1660 = _1596 * 3.1415927410125732421875;
        _1658 = _1660;
    }
    float _1662 = _1658;
    int _1664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1666 = _1664 != 0;
    int _1668 = int(_1468) + int(_1624);
    float _1670 = _1662;
    if (_1554)
    {
        float _1672 = _1662 * 0.15915493667125701904296875;
        _1670 = _1672;
    }
    float _1674 = _1670;
    int _1676 = abs(_1648);
    bool _1678 = !_1532;
    int _1680 = _1678 ? 0 : 1;
    int _1682 = _1656 * _1668;
    int _1684 = _1682 + _1434;
    float _1686 = float(uint(_1652));
    float _1688 = _1674;
    if (_1554)
    {
        float _1690 = _1674 * 6.283185482025146484375;
        float _1692 = sin(_1690);
        _1688 = _1692;
    }
    float _1694 = _1688;
    int _1696 = abs(_1680);
    int _1698 = _1638 * _1676;
    int _1700 = _1698 + _1644;
    bool _1702 = uint(_1684) >= uint(_839);
    float _1704 = as_type<float>(_879) * _1686;
    float _1706 = as_type<float>(_1608);
    if (_1666)
    {
        float _1708 = in.m_64.x;
        _1706 = _1708;
    }
    float _1710 = _1706;
    float _1712 = float(uint(_1294));
    bool _1714 = !_1702;
    int _1716 = _1714 ? 0 : (-1);
    float _1718 = trunc(_1704);
    float _1720 = precise::max(_1718, 0.0);
    uint _1722 = uint(_1720);
    int _1724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1726 = _1724 != 0;
    float _1728 = as_type<float>(_905) * _1712;
    int _1730 = ~_1668;
    int _1732 = _1730 + _1716;
    int _1734 = _1732 + 1;
    int _1736 = _1566 * _1696;
    int _1738 = _1736 + _1700;
    bool _1740 = !_1726;
    float _1742 = _1740 ? _205 : as_type<float>(_1438);
    bool _1744 = _1726;
    if (_1554)
    {
        bool _1746 = _1694 > 0.5;
        _1744 = _1746;
    }
    bool _1748 = _1744;
    int _1750 = _839 * _1734;
    int _1752 = _1750 + _1434;
    float _1754 = trunc(_1728);
    float _1756 = precise::max(_1754, 0.0);
    uint _1758 = uint(_1756);
    float _1760 = float(uint(_1738));
    float _1762 = 0.0;
    float _1764 = _1760;
    if (!_1554)
    {
        _1762 = _205;
    }
    float _1766 = _1762;
    bool _1768 = !_1640;
    int _1770 = _1768 ? _1752 : (-1);
    float _1772 = as_type<float>(_1062) * _1760;
    int _1774 = ~_839;
    int _1776 = _1774 + 1;
    float _1778 = _1766;
    if (_1554)
    {
        float _1780 = -_205;
        float _1782 = _1748 ? _1780 : _205;
        _1778 = _1782;
    }
    float _1784 = _1778;
    float _1786 = trunc(_1772);
    float _1788 = precise::max(_1786, 0.0);
    uint _1790 = uint(_1788);
    int _1792 = int(_1606) + int(_1722);
    if (_1666)
    {
        float _1794 = _1710 * 3.1415927410125732421875;
        _1764 = _1794;
    }
    float _1796 = _1764;
    int _1798 = _1770 & 3;
    bool _1800 = _1798 != 0;
    int _1802 = _1770 & 3;
    bool _1804 = _1802 != 0;
    float _1806 = _1796;
    if (_1666)
    {
        float _1808 = _1796 * 0.15915493667125701904296875;
        _1806 = _1808;
    }
    float _1810 = _1806;
    int _1812 = _1800 ? 0 : 1;
    bool _1814 = uint(_1802) > 1u;
    int _1816 = _1776 * int(_1758);
    int _1818 = _1816 + _1294;
    float _1820 = float(uint(_1400));
    float _1822 = _1810;
    if (_1666)
    {
        float _1824 = _1810 * 6.283185482025146484375;
        float _1826 = sin(_1824);
        _1822 = _1826;
    }
    float _1828 = _1822;
    int _1830 = ~_815;
    int _1832 = _1830 + 1;
    float _1834 = float(uint(_1818));
    float _1836 = as_type<float>(_879) * _1820;
    int _1838 = ~_877;
    int _1840 = _1838 + 1;
    float _1842 = trunc(_1836);
    float _1844 = precise::max(_1842, 0.0);
    uint _1846 = uint(_1844);
    int _1848 = ~_1812;
    int _1850 = _1848 + 1;
    int _1852 = _1850 + 1;
    float _1854 = as_type<float>(_905) * _1834;
    int _1856 = _1852;
    if (!_1814)
    {
        int _1858 = ~_1812;
        int _1860 = _1858 + 1;
        _1856 = _1860;
    }
    int _1862 = _1856;
    int _1864 = _1832 * _1792;
    int _1866 = _1864 + _1550;
    float _1868 = -_215;
    int _1870 = _1328 ? as_type<int>(_1868) : as_type<int>(_215);
    int _1872 = _1840 * int(_1790);
    int _1874 = _1872 + _1738;
    bool _1876 = uint(_1802) >= 2u;
    float _1878 = trunc(_1854);
    float _1880 = precise::max(_1878, 0.0);
    uint _1882 = uint(_1880);
    bool _1884 = uint(_1866) >= uint(_815);
    float _1886 = float(uint(_1874));
    int _1888 = _1876 ? 0 : 1;
    bool _1890 = _1802 != 3;
    float _1892 = as_type<float>(_1062) * _1886;
    int _1894 = ~_815;
    int _1896 = _1894 + 1;
    bool _1898 = !_1884;
    int _1900 = _1898 ? 0 : (-1);
    float _1902 = trunc(_1892);
    float _1904 = precise::max(_1902, 0.0);
    uint _1906 = uint(_1904);
    int _1908 = ~_1888;
    int _1910 = _1908 + 1;
    int _1912 = _1910 + 1;
    int _1914 = _1896 * int(_1846);
    int _1916 = _1914 + _1400;
    int _1918 = ~_1792;
    int _1920 = _1918 + _1900;
    int _1922 = _1920 + 1;
    float _1924 = float(uint(_1916));
    int _1926 = _815 * _1922;
    int _1928 = _1926 + _1550;
    int _1930 = _1912;
    bool _1932 = _1890;
    float _1934 = as_type<float>(_1846);
    if (_1890)
    {
        int _1936 = ~_1888;
        int _1938 = _1936 + 1;
        _1930 = _1938;
    }
    int _1940 = _1930;
    if (_1666)
    {
        bool _1942 = _1828 > 0.5;
        _1932 = _1942;
    }
    bool _1944 = _1932;
    float _1946 = as_type<float>(_879) * _1924;
    bool _1948 = !_1340;
    int _1950 = _1948 ? _1928 : (-1);
    if (!_1666)
    {
        _897 = _215;
    }
    float _1952 = _897;
    int _1954 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1956 = _1954 != 0;
    float _1958 = trunc(_1946);
    float _1960 = precise::max(_1958, 0.0);
    uint _1962 = uint(_1960);
    float _1964 = _1952;
    if (_1666)
    {
        float _1966 = -_215;
        float _1968 = _1944 ? _1966 : _215;
        _1964 = _1968;
    }
    float _1970 = _1964;
    int _1972 = _1950 & 3;
    bool _1974 = _1972 != 0;
    bool _1976 = !_1956;
    float _1978 = _1976 ? _215 : as_type<float>(_1870);
    int _1980 = int(_1758) + int(_1882);
    bool _1982 = uint(_1972) > 1u;
    int _1984 = int(_1790) + int(_1906);
    float _1986 = _974 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1988 = ~_877;
    int _1990 = _1988 + 1;
    int _1992 = _1950 & 3;
    bool _1994 = _1992 != 0;
    int _1996 = ~_839;
    int _1998 = _1996 + 1;
    int _2000 = _1990 * _1984;
    int _2002 = _2000 + _1738;
    int _2004 = _1994 ? 0 : 1;
    int _2006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2008 = _2006 != 0;
    int _2010 = _1998 * _1980;
    int _2012 = _2010 + _1294;
    float _2014 = float(uint(_1638));
    bool _2016 = !_2008;
    int _2018 = _2016 ? 0 : 1;
    bool _2020 = uint(_2002) >= uint(_877);
    float _2022 = as_type<float>(_1062) * _2014;
    int _2024 = ~_2004;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    int _2030 = _2028;
    if (!_1982)
    {
        int _2032 = ~_2004;
        int _2034 = _2032 + 1;
        _2030 = _2034;
    }
    int _2036 = _2030;
    float _2038 = trunc(_2022);
    float _2040 = precise::max(_2038, 0.0);
    uint _2042 = uint(_2040);
    bool _2044 = uint(_2012) >= uint(_839);
    bool _2046 = !_2020;
    int _2048 = _2046 ? 0 : (-1);
    bool _2050 = _1972 != 3;
    bool _2052 = !_2044;
    int _2054 = _2052 ? 0 : (-1);
    bool _2056 = uint(_1972) >= 2u;
    int _2058 = ~_1984;
    int _2060 = _2058 + _2048;
    int _2062 = _2060 + 1;
    int _2064 = ~_815;
    int _2066 = _2064 + 1;
    int _2068 = int(_1846) + int(_1962);
    int _2070 = _877 * _2062;
    int _2072 = _2070 + _1738;
    int _2074 = ~_877;
    int _2076 = _2074 + 1;
    int _2078 = _2056 ? 0 : 1;
    int _2080 = _2066 * _2068;
    int _2082 = _2080 + _1400;
    int _2084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2086 = _2084 != 0;
    int _2088 = ~_2078;
    int _2090 = _2088 + 1;
    int _2092 = _2090 + 1;
    int _2094 = _2092;
    float _2096 = as_type<float>(_2076);
    int _2098 = _2036;
    if (_2050)
    {
        int _2100 = ~_2078;
        int _2102 = _2100 + 1;
        _2094 = _2102;
    }
    int _2104 = _2094;
    int _2106 = _2076 * int(_2042);
    int _2108 = _2106 + _1638;
    int _2110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2112 = _2110 != 0;
    bool _2114 = !_2086;
    int _2116 = _2114 ? 0 : 1;
    bool _2118 = uint(_2082) >= uint(_815);
    bool _2120 = !_1578;
    int _2122 = _2120 ? _2072 : (-1);
    bool _2124 = !_2112;
    int _2126 = _2124 ? 0 : 1;
    bool _2128 = !_2118;
    int _2130 = _2128 ? 0 : (-1);
    int _2132 = _2122 & 3;
    bool _2134 = _2132 != 0;
    float _2136 = float(uint(_2108));
    int _2138 = _2122 & 3;
    bool _2140 = _2138 != 0;
    int _2142 = _2134 ? 0 : 1;
    float _2144 = as_type<float>(_1062) * _2136;
    bool _2146 = uint(_2138) > 1u;
    int _2148 = ~_2142;
    int _2150 = _2148 + 1;
    int _2152 = _2150 + 1;
    float _2154 = trunc(_2144);
    float _2156 = precise::max(_2154, 0.0);
    uint _2158 = uint(_2156);
    float _2160 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2162 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2164 = -_2160;
    float _2166 = fma(_1986, 2.0, _2164);
    int _2168 = _2152;
    float _2170 = as_type<float>(_2042);
    if (!_2146)
    {
        int _2172 = ~_2142;
        int _2174 = _2172 + 1;
        _2168 = _2174;
    }
    int _2176 = _2168;
    float _2178 = fma(_1488, -2.0, _2162);
    bool _2180 = uint(_2138) >= 2u;
    float _2182 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _2184 = ~_877;
    int _2186 = _2184 + 1;
    float _2188 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2190 = _2180 ? 0 : 1;
    float _2192 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _2194 = _2138 != 3;
    float _2196 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2188);
    int _2198 = int(_2042) + int(_2158);
    float _2200 = _984 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _2202 = ~_2190;
    int _2204 = _2202 + 1;
    int _2206 = _2204 + 1;
    float _2208 = -_127;
    float _2210 = fma(_2208, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2166);
    int _2212 = _2186 * _2198;
    int _2214 = _2212 + _1638;
    float _2216 = fma(_2200, -2.0, _2192);
    float _2218 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2220 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2196);
    int _2222 = _2206;
    float _2224 = as_type<float>(_2214);
    if (_2194)
    {
        int _2226 = ~_2190;
        int _2228 = _2226 + 1;
        _2222 = _2228;
    }
    int _2230 = _2222;
    float _2232 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2234 = uint(_2214) >= uint(_877);
    float _2236 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2238 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2178);
    bool _2240 = !_2234;
    int _2242 = _2240 ? 0 : (-1);
    float _2244 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2216);
    bool _2246 = _974 > 0.5;
    float _2248 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2250 = -_205;
    int _2252 = _2246 ? as_type<int>(_2250) : as_type<int>(_205);
    bool _2254 = _986 != 1;
    float _2256 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2258 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2260 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2262 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2264 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2266 = _2264 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    if (!_2254)
    {
        _2170 = _982;
    }
    float _2268 = _2170;
    float _2270 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2272 = _2270 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2274 = 0.0;
    float _2276 = _2268;
    if (!_2254)
    {
        _2274 = _982;
    }
    float _2278 = _2274;
    float _2280 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2260);
    float _2282 = _2278;
    if (!_2254)
    {
        _1592 = _1000;
    }
    float _2284 = _1592;
    float _2286 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2262);
    float _2288 = _2284;
    if (!_2254)
    {
        _1934 = _1000;
    }
    float _2290 = _1934;
    float _2292 = 1.0 / _2266;
    float _2294 = _2290;
    if (_2254)
    {
        _2276 = _974;
    }
    float _2296 = _2276;
    float _2298 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2300 = _2298 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    if (_2254)
    {
        _2282 = _974;
    }
    float _2302 = _2282;
    if (_2254)
    {
        _2288 = _982;
    }
    float _2304 = _2288;
    float _2306 = _2296 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2254)
    {
        _2294 = _982;
    }
    float _2308 = _2294;
    float _2310 = 1.0 / _2272;
    bool _2312 = _988 != 2;
    float _2314 = -_2232;
    float _2316 = fma(_2306, 2.0, _2314);
    float _2318 = _2304 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2320 = fma(_2308, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2256);
    float _2322 = -_127;
    float _2324 = fma(_2322, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2316);
    float _2326 = fma(_2318, -2.0, _2248);
    float _2328 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2330 = _2328 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2332 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2320);
    float _2334 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2326);
    float _2336 = 1.0 / _2300;
    if (_2312)
    {
        _2224 = _974;
    }
    float _2338 = _2224;
    float _2340 = -_2332;
    float _2342 = _2340 + 1.0;
    float _2344 = _2338;
    if (_2312)
    {
        _2096 = _982;
    }
    float _2346 = _2096;
    float _2348 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2350 = _2348 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2352 = _2346;
    if (!_2312)
    {
        _2344 = _1000;
    }
    float _2354 = _2344;
    if (!_2312)
    {
        _2352 = _974;
    }
    float _2356 = _2352;
    float _2358 = 1.0 / _2330;
    int _2360 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2362 = _2360 != 0;
    float _2364 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2218);
    float _2366 = _990 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2368 = _2354 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2370 = !_2362;
    float _2372 = _2370 ? _205 : as_type<float>(_2252);
    float _2374 = _2356 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2376 = -_2182;
    float _2378 = fma(_2366, 2.0, _2376);
    float _2380 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2382 = log2(_2380);
    float _2384 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2386 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2388 = isnan(0.0);
    bool _2390 = _2386 || _2388;
    bool _2392 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2394 = _2390 || _2392;
    float _2396 = -_2236;
    float _2398 = fma(_2368, 2.0, _2396);
    float _2400 = fma(_2302, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2384);
    float _2402 = fma(_2374, -2.0, _2258);
    float _2404 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2406 = -_127;
    float _2408 = fma(_2406, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2378);
    float _2410 = _982 * 2.0;
    float _2412 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2280);
    float _2414 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2416 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2404);
    float _2418 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2364);
    float _2420 = _2382 * _127;
    float _2422 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2414);
    float _2424 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2416);
    float _2426 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2286);
    float _2428 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2400);
    float _2430 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2422);
    float _2432 = exp2(_2420);
    float _2434 = -_127;
    float _2436 = fma(_2434, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2398);
    float _2438 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2402);
    float _2440 = _982 + _974;
    float _2442 = -_2418;
    float _2444 = _2442 + 1.0;
    int _2446 = ~_2068;
    int _2448 = _2446 + _2130;
    int _2450 = _2448 + 1;
    float _2452 = floor(_2410);
    float _2454 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2456 = _2454 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2458 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2460 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2458;
    float _2462 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2464 = _2462 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2466 = _815 * _2450;
    int _2468 = _2466 + _1400;
    bool _2470 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2472 = isnan(_797);
    bool _2474 = _2470 || _2472;
    bool _2476 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2478 = _2474 || _2476;
    float _2480 = float(_2478);
    float _2482 = _2460 * _2310;
    float _2484 = _1000 * 2.0;
    float _2486 = -_2432;
    float _2488 = _2486 + 1.0;
    float _2490 = 1.0 / _2350;
    float _2492 = in.m_50.x;
    float _2494 = in.m_50.y;
    float _2496 = in.m_50.z;
    float _2498 = _2440 + (-1.0);
    float _2500 = _2394 ? _2488 : 0.0;
    float _2502 = -_2424;
    float _2504 = _2502 + 1.0;
    bool _2506 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2508 = isnan(1.0);
    bool _2510 = _2506 || _2508;
    bool _2512 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2514 = _2510 || _2512;
    float _2516 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2518 = 1.0 + _2516;
    float _2520 = floor(_2484);
    float _2522 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2524 = _2522 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _2526 = _1950 >> 31;
    float _2528 = -_2430;
    float _2530 = _2528 + 1.0;
    int _2532 = ~_1980;
    int _2534 = _2532 + _2054;
    int _2536 = _2534 + 1;
    float _2538 = -_2426;
    float _2540 = _2538 + 1.0;
    int _2542 = _2526 & 3;
    float _2544 = 1.0 / _2518;
    float _2546 = _2464 * _2490;
    int _2548 = _839 * _2536;
    int _2550 = _2548 + _1294;
    int _2552 = _1950 + _2542;
    int _2554 = abs(_2230);
    float _2556 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2558 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2556;
    float _2560 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2562 = _797 + _2560;
    float _2564 = _2494 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2566 = 1.0 / _2524;
    int _2568 = _2552 >> 2;
    float _2570 = fma(_2492, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2564);
    bool _2572 = !_1974;
    int _2574 = _2572 ? 0 : 1;
    if (_2514)
    {
        float _2576 = _2500 * _2544;
        _137 = _2576;
    }
    float _2578 = _137;
    bool _2580 = _1262 >= 0.0;
    bool _2582 = isnan(_1262);
    bool _2584 = _2580 || _2582;
    bool _2586 = isnan(0.0);
    bool _2588 = _2584 || _2586;
    float _2590 = _2494 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2592 = _2494 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _2594 = _2588 ? 0 : 1;
    float _2596 = fma(_2492, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2590);
    bool _2598 = _1262 > 0.0;
    float _2600 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2602 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2600;
    float _2604 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2606 = _2604 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2608 = fma(_2492, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2592);
    float _2610 = fma(_2496, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2596);
    float _2612 = _2602 * _2292;
    float _2614 = _2606 * _2358;
    float _2616 = 1.0 / _2456;
    int _2618 = ~_2594;
    int _2620 = _2618 + 1;
    int _2622 = _2620 + 1;
    float _2624 = fma(_2612, _2562, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2626 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2628 = isnan(_797);
    bool _2630 = _2626 || _2628;
    bool _2632 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2634 = _2630 || _2632;
    float _2636 = float(_2634);
    float _2638 = _2610 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2640 = _2568 << 4;
    int _2642 = _2640 + 656;
    float _2644 = _2558 * _2566;
    int _2646 = _2622;
    if (!_2598)
    {
        int _2648 = ~_2594;
        int _2650 = _2648 + 1;
        _2646 = _2650;
    }
    int _2652 = _2646;
    float _2654 = -_2636;
    float _2656 = _2654 + 1.0;
    bool _2658 = _2452 >= 0.0;
    bool _2660 = isnan(_2452);
    bool _2662 = _2658 || _2660;
    bool _2664 = isnan(0.0);
    bool _2666 = _2662 || _2664;
    bool _2668 = !_1340;
    int _2670 = _2668 ? _2468 : (-1);
    int _2672 = _2666 ? 0 : 1;
    bool _2674 = _2452 > 0.0;
    float _2676 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2678 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2676;
    float _2680 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2682 = _2680 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _2684 = ~_2672;
    int _2686 = _2684 + 1;
    int _2688 = _2686 + 1;
    float _2690 = _2678 * _2336;
    bool _2692 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2694 = isnan(_797);
    bool _2696 = _2692 || _2694;
    bool _2698 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2700 = _2696 || _2698;
    float _2702 = float(_2700);
    float _2704 = _2682 * _2616;
    bool _2706 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2708 = isnan(_797);
    bool _2710 = _2706 || _2708;
    bool _2712 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2714 = _2710 || _2712;
    float _2716 = float(_2714);
    bool _2718 = !_1804;
    int _2720 = _2718 ? 0 : 1;
    float _2722 = -_2702;
    float _2724 = _2722 + 1.0;
    int _2726 = abs(_2574);
    float _2728 = -_2716;
    float _2730 = _2728 + 1.0;
    int _2732 = _2688;
    if (!_2674)
    {
        int _2734 = ~_2672;
        int _2736 = _2734 + 1;
        _2732 = _2736;
    }
    int _2738 = _2732;
    float _2740 = _2480 * _2724;
    int _2742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2744 = _2742 != 0;
    int _2746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2748 = _2746 != 0;
    int _2750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2752 = _2750 != 0;
    float _2754 = -_2480;
    float _2756 = _2754 + 1.0;
    bool _2758 = _2520 >= 0.0;
    bool _2760 = isnan(_2520);
    bool _2762 = _2758 || _2760;
    bool _2764 = isnan(0.0);
    bool _2766 = _2762 || _2764;
    float _2768 = _2702 * _2730;
    bool _2770 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2772 = isnan(_797);
    bool _2774 = _2770 || _2772;
    bool _2776 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2778 = _2774 || _2776;
    float _2780 = float(_2778);
    int _2782 = _2766 ? 0 : 1;
    bool _2784 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2786 = isnan(_797);
    bool _2788 = _2784 || _2786;
    bool _2790 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2792 = _2788 || _2790;
    float _2794 = float(_2792);
    float _2796 = -_2780;
    float _2798 = _2796 + 1.0;
    bool _2800 = _2520 > 0.0;
    float _2802 = _2780 * _2756;
    float _2804 = fma(_2496, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2570);
    float _2806 = fma(_2496, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2608);
    float _2808 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2810 = _797 + _2808;
    float _2812 = _2794 * _2798;
    float _2814 = -_2794;
    float _2816 = _2814 + 1.0;
    bool _2818 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2820 = isnan(_797);
    bool _2822 = _2818 || _2820;
    bool _2824 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2826 = _2822 || _2824;
    float _2828 = float(_2826);
    float _2830 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2832 = _797 + _2830;
    float _2834 = fma(_2614, _2810, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2836 = _2636 * _2816;
    bool _2838 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2840 = isnan(_797);
    bool _2842 = _2838 || _2840;
    bool _2844 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2846 = _2842 || _2844;
    float _2848 = float(_2846);
    float _2850 = fma(_2482, _2832, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2852 = -_2828;
    float _2854 = _2852 + 1.0;
    float _2856 = _2828 * _2656;
    float _2858 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2860 = _797 + _2858;
    float _2862 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2864 = _797 + _2862;
    float _2866 = _2848 * _2854;
    float _2868 = -_2848;
    float _2870 = _2868 + 1.0;
    float _2872 = fma(_2546, _2860, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2874 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2876 = _797 + _2874;
    float _2878 = _2624 * _2866;
    float _2880 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2882 = _797 + _2880;
    float _2884 = _2804 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2886 = fma(_2704, _2876, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2888 = fma(_2870, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2878);
    float _2890 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2892 = _2638 + _2890;
    uint _2894 = uint(int(uint(_2642) >> uint(2)));
    uint _2896 = uint(int(uint(int(_2894)) >> uint(2)));
    int _2898 = int(_2894) & 3;
    float _2900 = (*spvDescriptorSet0.vp_c9)._m0[int(_2896)][_2898];
    int _2902 = int(_2894) + 1;
    uint _2904 = uint(int(uint(_2902) >> uint(2)));
    int _2906 = _2902 & 3;
    float _2908 = (*spvDescriptorSet0.vp_c9)._m0[int(_2904)][_2906];
    float _2910 = fma(_2644, _2882, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2912 = fma(_2834, _2856, _2888);
    float _2914 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2916 = _2884 + _2914;
    float _2918 = _2892 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2920 = _2806 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _2922 = _1972 != 3;
    float _2924 = fma(_2850, _2836, _2912);
    float _2926 = fma(_2916, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2918);
    float _2928 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2930 = _2920 + _2928;
    int _2932 = ~_2782;
    int _2934 = _2932 + 1;
    int _2936 = _2934 + 1;
    float _2938 = _974 + _1000;
    int _2940 = _2936;
    float _2942 = _2740;
    if (!_2800)
    {
        int _2944 = ~_2782;
        int _2946 = _2944 + 1;
        _2940 = _2946;
    }
    int _2948 = _2940;
    float _2950 = _974 + (-0.5);
    float _2952 = fma(_2930, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2926);
    float _2954 = fma(_2690, _2864, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2956 = _2642 + 8;
    uint _2958 = uint(int(uint(_2956) >> uint(2)));
    uint _2960 = uint(int(uint(int(_2958)) >> uint(2)));
    int _2962 = int(_2958) & 3;
    float _2964 = (*spvDescriptorSet0.vp_c9)._m0[int(_2960)][_2962];
    int _2966 = int(_2958) + 1;
    uint _2968 = uint(int(uint(_2966) >> uint(2)));
    int _2970 = _2966 & 3;
    float _2972 = (*spvDescriptorSet0.vp_c9)._m0[int(_2968)][_2970];
    bool _2974 = !_2922;
    int _2976 = _2974 ? 0 : (-1);
    float _2978 = fma(_2872, _2812, _2924);
    bool _2980 = _2952 >= 0.0;
    float _2982 = _982 + _1000;
    float _2984 = _982 + (-0.5);
    float _2986 = fma(_2954, _2802, _2978);
    float _2988 = _1970 + (-0.5);
    float _2990 = _1784 + 0.5;
    float _2992 = fma(_2886, _2740, _2986);
    int _2994 = abs(_2036);
    float _2996 = -_2988;
    float _2998 = -_2244;
    float _3000 = fma(_2996, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2998);
    float _3002 = fma(_2498, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3004 = _2372 + 0.5;
    float _3006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_2980)
    {
        _2942 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3008 = _2942;
    float _3010 = _1978 + (-0.5);
    int _3012 = ~_2994;
    int _3014 = _3012 + 1;
    int _3016 = _3014 + 1;
    float _3018 = fma(_3004, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2210);
    float _3020 = fma(_2990, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2408);
    float _3022 = -_3010;
    float _3024 = -_2238;
    float _3026 = fma(_3022, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3024);
    if (_2980)
    {
        float _3028 = _3008 * 5.0;
        _2098 = as_type<int>(_3028);
    }
    int _3030 = _2098;
    float _3032 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3034 = int(_3032);
    float _3036 = fma(_2910, _2768, _2992);
    int _3038 = abs(_2104);
    float _3040 = -_2444;
    float _3042 = fma(_3040, _1784, _3020);
    if (_2980)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9632 = as_type<float>(_3030);
        out.gl_Position.z = _9632;
    }
    float _3044 = -_2220;
    float _3046 = _3044 + 1.0;
    float _3048 = fma(_2716, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3036);
    float _3050 = _3006 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3052 = _3016 * as_type<int>(_2908);
    float _3054 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3056 = fma(_3046, _1970, _3000);
    bool _3058 = !_2744;
    int _3060 = _3058 ? 0 : 1;
    out.m_72.x = _3048;
    int _3062 = ~_2726;
    int _3064 = _3062 + 1;
    int _3066 = _3064 + 1;
    float _3068 = _1742 + 0.5;
    float _3070 = _1502 + (-0.5);
    int _3072 = _3066 * as_type<int>(_2900);
    int _3074 = _3072 + _3052;
    int _3076 = ~_3038;
    int _3078 = _3076 + 1;
    int _3080 = _3078 + 1;
    float _3082 = fma(_3050, _3068, _2324);
    int _3084 = abs(_2976);
    float _3086 = _2892 * _2892;
    out.m_74.x = _3042;
    out.m_74.y = _3056;
    int _3088 = _3080 * as_type<int>(_2964);
    int _3090 = _3088 + _3074;
    float _3092 = float(uint(_3034));
    float _3094 = fma(_2916, _2916, _3086);
    int _3096 = abs(_2116);
    float _3098 = _3054 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3100 = ~_3084;
    int _3102 = _3100 + 1;
    int _3104 = _3102 + 1;
    if (_2980)
    {
        out.m_57.x = 0.0;
    }
    float _3106 = 1.0 / _3092;
    int _3108 = ~_3096;
    int _3110 = _3108 + 1;
    int _3112 = _3110 + 1;
    float _3114 = -_3098;
    float _3116 = -_2334;
    float _3118 = fma(_3114, _3070, _3116);
    int _3120 = _3104 * as_type<int>(_2972);
    int _3122 = _3120 + _3090;
    float _3124 = fma(_2930, _2930, _3094);
    int _3126 = abs(_3034);
    float _3128 = _557 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _3130 = _3122 * _3112;
    float _3132 = rsqrt(_3124);
    int _3134 = _1770 >> 31;
    int _3136 = _2670 * _3096;
    int _3138 = _3136 + _3130;
    float _3140 = float(uint(_3126));
    int _3142 = _3134 & 3;
    int _3144 = as_type<int>(_3106) + (-2);
    float _3146 = float(uint(_3138));
    float _3148 = 1.0 / _3140;
    int _3150 = _1770 + _3142;
    float _3152 = _3128 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3154 = _2122 >> 31;
    float _3156 = as_type<float>(_3144) * _3146;
    int _3158 = abs(_3060);
    float _3160 = _3152 * _3132;
    int _3162 = _3154 & 3;
    int _3164 = ~_3034;
    int _3166 = _3164 + 1;
    float _3168 = trunc(_3156);
    float _3170 = precise::max(_3168, 0.0);
    uint _3172 = uint(_3170);
    float _3174 = _2916 * _3160;
    int _3176 = _2122 + _3162;
    float _3178 = _2892 * _3160;
    float _3180 = float(_2948);
    float _3182 = -_3174;
    float _3184 = _2916 + _3182;
    int _3186 = _3150 >> 2;
    float _3188 = -_3178;
    float _3190 = _2892 + _3188;
    int _3192 = abs(_3138);
    float _3194 = in.m_76.x;
    float _3196 = in.m_76.y;
    float _3198 = in.m_76.z;
    int _3200 = _3186 << 4;
    int _3202 = _3200 + 368;
    float _3204 = _3190 * _3190;
    int _3206 = _3176 >> 2;
    float _3208 = fma(_3184, _3184, _3204);
    int _3210 = as_type<int>(_3148) + (-2);
    int _3212 = _3166 * int(_3172);
    int _3214 = _3212 + _3138;
    float _3216 = float(uint(_3192));
    uint _3218 = uint(int(uint(_3202) >> uint(2)));
    uint _3220 = uint(int(uint(int(_3218)) >> uint(2)));
    int _3222 = int(_3218) & 3;
    float _3224 = (*spvDescriptorSet0.vp_c9)._m0[int(_3220)][_3222];
    int _3226 = int(_3218) + 1;
    uint _3228 = uint(int(uint(_3226) >> uint(2)));
    int _3230 = _3226 & 3;
    float _3232 = (*spvDescriptorSet0.vp_c9)._m0[int(_3228)][_3230];
    float _3234 = float(_3158);
    int _3236 = _3206 << 4;
    int _3238 = _3236 + 800;
    float _3240 = as_type<float>(_3210) * _3216;
    float _3242 = float(uint(_3214));
    float _3244 = _3234 * _3180;
    float _3246 = -_2412;
    float _3248 = _3246 + 1.0;
    uint _3250 = uint(int(uint(_3238) >> uint(2)));
    uint _3252 = uint(int(uint(int(_3250)) >> uint(2)));
    int _3254 = int(_3250) & 3;
    float _3256 = (*spvDescriptorSet0.vp_c9)._m0[int(_3252)][_3254];
    int _3258 = int(_3250) + 1;
    uint _3260 = uint(int(uint(_3258) >> uint(2)));
    int _3262 = _3258 & 3;
    float _3264 = (*spvDescriptorSet0.vp_c9)._m0[int(_3260)][_3262];
    float _3266 = trunc(_3240);
    float _3268 = precise::max(_3266, 0.0);
    uint _3270 = uint(_3268);
    float _3272 = -_2428;
    float _3274 = _3272 + 1.0;
    float _3276 = fma(_1978, _3248, _3026);
    float _3278 = as_type<float>(_3144) * _3242;
    float _3280 = _2930 * _3160;
    float _3282 = -_2504;
    float _3284 = fma(_2372, _3282, _3018);
    float _3286 = -_3274;
    float _3288 = fma(_1742, _3286, _3082);
    float _3290 = fma(_1502, _2342, _3118);
    int _3292 = ~_3126;
    int _3294 = _3292 + 1;
    float _3296 = _3244 * (-2.0);
    float _3298 = trunc(_3278);
    float _3300 = precise::max(_3298, 0.0);
    uint _3302 = uint(_3300);
    int _3304 = abs(_2720);
    out.m_78.x = _3284;
    out.m_78.y = _3276;
    out.m_78.z = _3288;
    out.m_78.w = _3290;
    float _3306 = fma(_3296, _3194, _3194);
    int _3308 = ~_2198;
    int _3310 = _3308 + _2242;
    int _3312 = _3310 + 1;
    float _3314 = -_3280;
    float _3316 = _2930 + _3314;
    int _3318 = _3294 * int(_3270);
    int _3320 = _3318 + _3192;
    float _3322 = fma(_2950, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3306);
    int _3324 = abs(_2018);
    int _3326 = _3202 + 8;
    uint _3328 = uint(int(uint(_3326) >> uint(2)));
    uint _3330 = uint(int(uint(int(_3328)) >> uint(2)));
    int _3332 = int(_3328) & 3;
    float _3334 = (*spvDescriptorSet0.vp_c9)._m0[int(_3330)][_3332];
    int _3336 = int(_3328) + 1;
    uint _3338 = uint(int(uint(_3336) >> uint(2)));
    int _3340 = _3336 & 3;
    float _3342 = (*spvDescriptorSet0.vp_c9)._m0[int(_3338)][_3340];
    int _3344 = _877 * _3312;
    int _3346 = _3344 + _1638;
    int _3348 = abs(_2126);
    float _3350 = fma(_3002, _3296, _3002);
    float _3352 = fma(_3316, _3316, _3208);
    float _3354 = fma(_3350, _2578, _3322);
    int _3356 = _3238 + 8;
    uint _3358 = uint(int(uint(_3356) >> uint(2)));
    uint _3360 = uint(int(uint(int(_3358)) >> uint(2)));
    int _3362 = int(_3358) & 3;
    float _3364 = (*spvDescriptorSet0.vp_c9)._m0[int(_3360)][_3362];
    int _3366 = int(_3358) + 1;
    uint _3368 = uint(int(uint(_3366) >> uint(2)));
    int _3370 = _3366 & 3;
    float _3372 = (*spvDescriptorSet0.vp_c9)._m0[int(_3368)][_3370];
    float _3374 = float(uint(_3320));
    int _3376 = abs(_1862);
    int _3378 = int(_3172) + int(_3302);
    float _3380 = as_type<float>(_3210) * _3374;
    int _3382 = ~_3034;
    int _3384 = _3382 + 1;
    int _3386 = ~_3376;
    int _3388 = _3386 + 1;
    int _3390 = _3388 + 1;
    bool _3392 = !_2140;
    int _3394 = _3392 ? 0 : 1;
    float _3396 = trunc(_3380);
    float _3398 = precise::max(_3396, 0.0);
    uint _3400 = uint(_3398);
    int _3402 = abs(_2176);
    int _3404 = _3384 * _3378;
    int _3406 = _3404 + _3138;
    bool _3408 = _1802 != 3;
    int _3410 = _3390 * as_type<int>(_3232);
    int _3412 = ~_3402;
    int _3414 = _3412 + 1;
    int _3416 = _3414 + 1;
    bool _3418 = !_3408;
    int _3420 = _3418 ? 0 : (-1);
    bool _3422 = uint(_3406) >= uint(_3034);
    int _3424 = _3416 * as_type<int>(_3264);
    int _3426 = abs(_3394);
    int _3428 = ~_3304;
    int _3430 = _3428 + 1;
    int _3432 = _3430 + 1;
    int _3434 = ~_3126;
    int _3436 = _3434 + 1;
    int _3438 = int(_3270) + int(_3400);
    int _3440 = _3432 * as_type<int>(_3224);
    int _3442 = _3440 + _3410;
    bool _3444 = !_3422;
    int _3446 = _3444 ? 0 : (-1);
    bool _3448 = _2138 != 3;
    int _3450 = _3436 * _3438;
    int _3452 = _3450 + _3192;
    int _3454 = ~_3378;
    int _3456 = _3454 + _3446;
    int _3458 = _3456 + 1;
    int _3460 = abs(_1940);
    int _3462 = ~_3426;
    int _3464 = _3462 + 1;
    int _3466 = _3464 + 1;
    int _3468 = _3034 * _3458;
    int _3470 = _3468 + _3138;
    bool _3472 = !_3448;
    int _3474 = _3472 ? 0 : (-1);
    bool _3476 = uint(_3452) >= uint(_3126);
    int _3478 = _3466 * as_type<int>(_3256);
    int _3480 = _3478 + _3424;
    int _3482 = ~_3460;
    int _3484 = _3482 + 1;
    int _3486 = _3484 + 1;
    float _3488 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3490 = ~_2554;
    int _3492 = _3490 + 1;
    int _3494 = _3492 + 1;
    int _3496 = _3138 ^ _3034;
    int _3498 = _3486 * as_type<int>(_3334);
    int _3500 = _3498 + _3442;
    bool _3502 = !_3476;
    int _3504 = _3502 ? 0 : (-1);
    int _3506 = _3494 * as_type<int>(_3364);
    int _3508 = _3506 + _3480;
    int _3510 = abs(_3420);
    float _3512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    uint _3514 = uint(int(uint(_3496) >> uint(31)));
    int _3516 = abs(_3474);
    int _3518 = ~_3504;
    int _3520 = _3438 + _3518;
    int _3522 = _3520 + 1;
    int _3524 = ~_3510;
    int _3526 = _3524 + 1;
    int _3528 = _3526 + 1;
    float _3530 = _3488 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3532 = ~int(_3514);
    int _3534 = _3532 + 1;
    int _3536 = ~_3516;
    int _3538 = _3536 + 1;
    int _3540 = _3538 + 1;
    int _3542 = _3528 * as_type<int>(_3342);
    int _3544 = _3542 + _3500;
    bool _3546 = _3034 == 0;
    int _3548 = _3522 ^ _3534;
    int _3550 = _3540 * as_type<int>(_3372);
    int _3552 = _3550 + _3508;
    int _3554 = ~_3348;
    int _3556 = _3554 + 1;
    int _3558 = _3556 + 1;
    bool _3560 = !_3546;
    int _3562 = _3560 ? _3470 : (-1);
    bool _3564 = _3034 == 0;
    int _3566 = _3552 * _3558;
    int _3568 = ~_3534;
    int _3570 = _3568 + _3548;
    int _3572 = _3570 + 1;
    int _3574 = ~_3324;
    int _3576 = _3574 + 1;
    int _3578 = _3576 + 1;
    bool _3580 = _839 == 0;
    bool _3582 = !_3564;
    int _3584 = _3582 ? _3572 : (-1);
    int _3586 = _3544 * _3578;
    bool _3588 = !_3580;
    int _3590 = _3588 ? _2550 : (-1);
    float _3592 = _1192 + (-0.5);
    float _3594 = float(_3562);
    float _3596 = float(_3584);
    float _3598 = _3512 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3600 = _3590 * _3324;
    int _3602 = _3600 + _3586;
    float _3604 = fma(_3530, _3594, _2436);
    bool _3606 = !_1578;
    int _3608 = _3606 ? _3346 : (-1);
    float _3610 = -_2438;
    float _3612 = fma(_3598, _3596, _3610);
    bool _3614 = !_2748;
    int _3616 = _3614 ? 0 : 1;
    float _3618 = _1162 + 0.5;
    int _3620 = _3608 * _3348;
    int _3622 = _3620 + _3566;
    int _3624 = abs(_3616);
    float _3626 = fma(_3530, _3618, _3604);
    float _3628 = -_3598;
    float _3630 = fma(_3628, _3592, _3612);
    float _3632 = float(_3602);
    float _3634 = -_2530;
    float _3636 = fma(_1162, _3634, _3626);
    float _3638 = float(_3622);
    float _3640 = fma(_1192, _2540, _3630);
    float _3642 = float(_2652);
    out.m_80.x = _3632;
    float _3644 = float(_3624);
    out.m_80.w = _3638;
    bool _3646 = !_2752;
    int _3648 = _3646 ? 0 : 1;
    float _3650 = _3644 * _3642;
    out.m_82.x = _3636;
    out.m_82.y = _3640;
    float _3652 = _3198;
    if (_2980)
    {
        return out;
    }
    float _3654 = -_3178;
    float _3656 = _2638 + _3654;
    float _3658 = -_3174;
    float _3660 = _2884 + _3658;
    float _3662 = -_3280;
    float _3664 = _2920 + _3662;
    int _3666 = abs(_3648);
    float _3668 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3670 = _3656 + _3668;
    float _3672 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3674 = _3660 + _3672;
    float _3676 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3678 = _3664 + _3676;
    float _3680 = _2982 + (-1.0);
    float _3682 = _3670 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3684 = _3650 * (-2.0);
    float _3686 = float(_2738);
    float _3688 = fma(_3680, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3690 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3682);
    float _3692 = float(_3666);
    float _3694 = fma(_3684, _3196, _3196);
    float _3696 = fma(_3688, _3684, _3688);
    float _3698 = fma(_3678, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3690);
    float _3700 = _2938 + (-1.0);
    float _3702 = fma(_2984, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3694);
    float _3704 = _3692 * _3686;
    float _3706 = _3354 * 0.15915493667125701904296875;
    bool _3708 = _3698 >= 0.0;
    float _3710 = fma(_3696, _2578, _3702);
    float _3712 = _3704 * (-2.0);
    float _3714 = fma(_3700, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3716 = sqrt(_3352);
    float _3718 = _3710 * 0.15915493667125701904296875;
    float _3720 = fma(_3712, _3198, _3198);
    float _3722 = _1000 + (-0.5);
    float _3724 = fma(_3714, _3712, _3714);
    float _3726 = fma(_3722, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3720);
    float _3728 = _3706 * 6.283185482025146484375;
    float _3730 = sin(_3728);
    float _3732 = _3670;
    float _3734 = _3660;
    if (_3708)
    {
        _3652 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3736 = _3652;
    int _3738 = as_type<int>(_3736);
    if (_3708)
    {
        out.m_57.x = 0.0;
    }
    float _3740 = fma(_3724, _2578, _3726);
    if (_3708)
    {
        float _3742 = _3736 * 5.0;
        _3738 = as_type<int>(_3742);
    }
    int _3744 = _3738;
    float _3746 = _3740 * 0.15915493667125701904296875;
    float _3748 = _3706 * 6.283185482025146484375;
    float _3750 = cos(_3748);
    if (_3708)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10652 = as_type<float>(_3744);
        out.gl_Position.z = _10652;
    }
    float _3752 = _3718 * 6.283185482025146484375;
    float _3754 = sin(_3752);
    float _3756 = _3718 * 6.283185482025146484375;
    float _3758 = cos(_3756);
    if (_3708)
    {
        return out;
    }
    float _3760 = _3746 * 6.283185482025146484375;
    float _3762 = cos(_3760);
    float _3764 = _3132 * _3716;
    float _3766 = _555 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3768 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _215);
    float _3770 = _3730 * _3754;
    float _3772 = _3128 * _3764;
    float _3774 = _3764 * _3766;
    float _3776 = _3750 * _3754;
    float _3778 = _3746 * 6.283185482025146484375;
    float _3780 = sin(_3778);
    float _3782 = _3730 * _3758;
    float _3784 = _3768 * _3774;
    float _3786 = _3750 * _3758;
    float _3788 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _205);
    float _3790 = _3750 * _3762;
    float _3792 = _3788 * _3772;
    float _3794 = _3730 * _3762;
    float _3796 = _3758 * _3762;
    float _3798 = _3790 * _3784;
    float _3800 = _3764 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3802 = _3800 * 0.5;
    float _3804 = _3754 * _3762;
    float _3806 = fma(_3780, _3786, _3770);
    float _3808 = -_3782;
    float _3810 = fma(_3780, _3776, _3808);
    float _3812 = -_3784;
    float _3814 = _3780 * _3812;
    float _3816 = -_3776;
    float _3818 = fma(_3780, _3782, _3816);
    float _3820 = fma(_3806, _3792, _3798);
    float _3822 = _3794 * _3784;
    float _3824 = fma(_3796, _3792, _3814);
    float _3826 = fma(_3780, _3770, _3786);
    float _3828 = fma(_3810, _3802, _3820);
    float _3830 = fma(_3818, _3792, _3822);
    float _3832 = fma(_3804, _3802, _3824);
    float _3834 = _3828 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3836 = _3828 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3838 = fma(_3826, _3802, _3830);
    float _3840 = _3828 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3842 = fma(_3832, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3834);
    float _3844 = fma(_3832, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3836);
    float _3846 = fma(_3832, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3840);
    float _3848 = fma(_3838, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3842);
    float _3850 = fma(_3838, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3844);
    float _3852 = fma(_3838, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3846);
    float _3854 = _3848 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3856 = _3850 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3858 = _2884 + _3854;
    float _3860 = _2920 + _3856;
    float _3862 = _3852 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3864 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3866 = _3858 + _3864;
    float _3868 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3870 = _3860 + _3868;
    float _3872 = _2638 + _3862;
    float _3874 = _3866 * _3866;
    float _3876 = _3870 * _3870;
    float _3878 = _3874 + _3876;
    float _3880 = sqrt(_3878);
    bool _3882 = _3880 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3884 = _3838;
    float _3886 = _3858;
    float _3888 = _3860;
    float _3890 = _3874;
    float _3892 = _3876;
    if (!_3882)
    {
        _3884 = _3872;
    }
    float _3894 = _3884;
    bool _3896 = !_3882;
    float _3898 = _3894;
    if (!_3896)
    {
        float _3900 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3902 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3904 = _3880 + _3902;
        float _3906 = rsqrt(_3878);
        float _3908 = _3904 * _3900;
        float _3910 = _3872 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3912 = _3908 * 0.15915493667125701904296875;
        float _3914 = _3912 * 6.283185482025146484375;
        float _3916 = sin(_3914);
        float _3918 = _3912 * 6.283185482025146484375;
        float _3920 = cos(_3918);
        float _3922 = fma(_3916, _3910, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3924 = _3906 * _3922;
        float _3926 = _3920 + (-1.0);
        float _3928 = fma(_3866, _3924, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3930 = fma(_3870, _3924, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3932 = _3926 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3934 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3936 = _3928 + _3934;
        float _3938 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3940 = _3930 + _3938;
        float _3942 = fma(_3872, _3920, _3932);
        float _3944 = _3936 * _3936;
        float _3946 = _3940 * _3940;
        _3886 = _3928;
        _3888 = _3930;
        _3898 = _3942;
        _3890 = _3944;
        _3892 = _3946;
    }
    float _3948 = _3886;
    float _3950 = _3888;
    float _3952 = _3898;
    float _3954 = _3890;
    float _3956 = _3892;
    float _3958 = fma(_3948, 6.2500002968590706586837768554688e-05, 0.5);
    float _3960 = fma(_3950, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _10989 = float2(_3958, _3960);
    float3 _3964 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_10989, float2(0.0), isnan(_10989)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_10989, float2(0.0), isnan(_10989)), level(0.0)).xyz;
    float _3966 = _3964.x;
    float _3968 = _3964.y;
    float _3970 = _3964.z;
    float _3972 = _3806 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3974 = _3806 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3976 = _3806 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3978 = _3790 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3980 = _3790 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3982 = _3790 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3984 = _215 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3986 = fma(_3796, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3972);
    float _3988 = fma(_3796, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3974);
    float _3990 = fma(_3796, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3976);
    float _3992 = -_3780;
    float _3994 = fma(_3992, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3978);
    float _3996 = -_3780;
    float _3998 = fma(_3996, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3980);
    float _4000 = -_3780;
    float _4002 = fma(_4000, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3982);
    float _4004 = fma(_3984, _3984, 1.0);
    float _4006 = _3810 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4008 = _3810 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4010 = _3810 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4012 = fma(_3794, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3994);
    float _4014 = fma(_3804, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4006);
    float _4016 = rsqrt(_4004);
    float _4018 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4020 = _3952 + _4018;
    float _4022 = fma(_3804, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4008);
    float _4024 = fma(_3804, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4010);
    float _4026 = fma(_3794, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3998);
    float _4028 = fma(_4020, _4020, _3954);
    float _4030 = fma(_3794, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4002);
    float _4032 = fma(_3826, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4014);
    float _4034 = fma(_3826, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4022);
    float _4036 = _4028 + _3956;
    float _4038 = fma(_3826, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4024);
    float _4040 = fma(_3818, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3986);
    float _4042 = fma(_3818, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3988);
    float _4044 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4046 = _3984 * _4012;
    float _4048 = _3984 * _4026;
    float _4050 = _3984 * _4016;
    float _4052 = fma(_3818, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3990);
    float _4054 = _3984 * _4030;
    float _4056 = sqrt(_4036);
    float _4058 = -_4032;
    float _4060 = _4050 * _4058;
    float _4062 = -_4034;
    float _4064 = _4050 * _4062;
    float _4066 = -_4038;
    float _4068 = _4050 * _4066;
    float _4070 = fma(_4044, _4040, _4046);
    float _4072 = fma(_4044, _4042, _4048);
    float _4074 = fma(_4044, _4052, _4054);
    float _4076 = fma(_4016, _4012, _4060);
    float _4078 = fma(_4016, _4026, _4064);
    float _4080 = fma(_4016, _4030, _4068);
    float _4082 = _4032 + _4070;
    float _4084 = _4034 + _4072;
    float _4086 = _4038 + _4074;
    out.m_84.x = _4040;
    out.m_84.y = _4042;
    out.m_84.z = _4052;
    bool _4088 = _4056 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4090 = isnan(_4056);
    bool _4092 = _4088 || _4090;
    bool _4094 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4096 = _4092 || _4094;
    out.m_86.x = _4076;
    out.m_86.y = _4078;
    out.m_86.z = _4080;
    out.m_88.x = _4082;
    out.m_88.y = _4084;
    out.m_88.z = _4086;
    float _4098 = _4070;
    if (!_4096)
    {
        _4098 = 1.0;
    }
    float _4100 = _4098;
    out.m_90.x = _3966;
    out.m_90.y = _3968;
    out.m_90.z = _3970;
    bool _4102 = !_4096;
    float _4104 = _4100;
    if (!_4102)
    {
        bool _4106 = _4056 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4108 = isnan(_4056);
        bool _4110 = _4106 || _4108;
        bool _4112 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4114 = _4110 || _4112;
        if (!_4114)
        {
            float _4116 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4118 = _4056 + _4116;
            float _4120 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4122 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4120;
            float _4124 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4126 = _4124 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4128 = 1.0 / _4122;
            float _4130 = _4118 * _4128;
            float _4132 = fma(_4130, _4126, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4104 = _4132;
            _4134 = true;
        }
        else
        {
            bool _4136 = _4056 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4138 = isnan(_4056);
            bool _4140 = _4136 || _4138;
            bool _4142 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4144 = _4140 || _4142;
            if (!_4144)
            {
                float _4146 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4148 = _4056 + _4146;
                float _4150 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4152 = _4150 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4154 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4156 = _4154 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4158 = 1.0 / _4152;
                float _4160 = _4148 * _4158;
                float _4162 = fma(_4160, _4156, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4104 = _4162;
                _4134 = true;
            }
            else
            {
                _4104 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4134 = false;
    float _4164 = _4104;
    float _4166 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4168 = _3952 + _4166;
    float _4170 = _3656 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4172 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4174 = _3948 + _4172;
    float _4176 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4178 = _3950 + _4176;
    float _4180 = fma(_4168, _4164, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4182 = fma(_3660, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4170);
    float _4184 = fma(_4174, _4164, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4186 = fma(_4178, _4164, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4188 = -_2638;
    float _4190 = _4188 + _4180;
    float _4192 = fma(_3664, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4182);
    float _4194 = -_2884;
    float _4196 = _4194 + _4184;
    float _4198 = _3656 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4200 = _4190 * _4190;
    float _4202 = _4192 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4204 = -_2920;
    float _4206 = _4204 + _4186;
    float _4208 = fma(_3660, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4198);
    float _4210 = fma(_4196, _4196, _4200);
    float _4212 = 1.0 / _4202;
    float _4214 = fma(_3664, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4208);
    float _4216 = fma(_4206, _4206, _4210);
    float _4218 = _4214 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4220 = sqrt(_4216);
    float _4222 = _4218 + _4202;
    float _4224 = _4222 * _4212;
    float _4226 = _4224 * 0.5;
    float _4228 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4230 = fma(_4226, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4228);
    bool _4232 = _4220 > 0.0;
    float _4234 = 1.0 / _4230;
    bool _4236 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4238 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4240 = _4236 || _4238;
    bool _4242 = isnan(0.5);
    bool _4244 = _4240 || _4242;
    bool _4246 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4248 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4250 = _4246 || _4248;
    bool _4252 = isnan(0.5);
    bool _4254 = _4250 || _4252;
    float _4256 = _4226;
    float _4258 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4260 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4262 = _4190;
    if (!_4232)
    {
        _4256 = _4184;
    }
    float _4264 = _4256;
    float _4266 = _4264;
    float _4268 = _4264;
    if (!_4232)
    {
        _4258 = _4180;
    }
    float _4270 = _4258;
    float _4272 = _4270;
    if (!_4232)
    {
        _4260 = _4186;
    }
    float _4274 = _4260;
    bool _4276 = !_4232;
    float _4278 = _4274;
    float _4280 = _4234;
    if (!_4276)
    {
        float _4282 = _219 * _219;
        float _4284 = fma(_217, _217, _4282);
        float _4286 = fma(_221, _221, _4284);
        float _4288 = rsqrt(_4216);
        float _4290 = sqrt(_4286);
        float _4292 = _4196 * _4288;
        float _4294 = _4190 * _4288;
        float _4296 = _4206 * _4288;
        bool _4298 = _4290 > 0.0;
        float _4300 = _4290;
        float _4302 = _4288;
        _4262 = _4294;
        if (!_4298)
        {
            _4266 = _4184;
        }
        float _4304 = _4266;
        _4268 = _4304;
        if (!_4298)
        {
            _4300 = _4180;
        }
        float _4306 = _4300;
        _4272 = _4306;
        if (!_4298)
        {
            _4302 = _4186;
        }
        float _4308 = _4302;
        bool _4310 = !_4298;
        _4278 = _4308;
        if (!_4310)
        {
            float _4312 = rsqrt(_4286);
            float _4314 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4316 = _219 * _4312;
            float _4318 = _217 * _4312;
            float _4320 = _221 * _4312;
            float _4322 = _4294 * _4316;
            float _4324 = fma(_4292, _4318, _4322);
            float _4326 = _4314 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4328 = fma(_4296, _4320, _4324);
            float _4330 = _4328 * _4326;
            float _4332 = fma(_217, _4330, _4184);
            float _4334 = fma(_219, _4330, _4180);
            float _4336 = fma(_221, _4330, _4186);
            _4268 = _4332;
            _4272 = _4334;
            _4278 = _4336;
        }
    }
    float _4338 = _4268;
    float _4340 = _4272;
    float _4342 = _4278;
    float _4344 = _4262;
    float _4346 = -_3174;
    float _4348 = _4346 + _4338;
    float _4350 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4352 = _4234 * _4350;
    float _4354 = -_3178;
    float _4356 = _4354 + _4340;
    float _4358 = -_3280;
    float _4360 = _4358 + _4342;
    float _4362 = _4356;
    float _4364 = _4360;
    float _4366 = _4344;
    if (_4244)
    {
        _225 = 1.0;
    }
    float _4368 = _225;
    float _4370 = _4368;
    if (_4254)
    {
        _4280 = _4348;
    }
    float _4372 = _4280;
    float _4374 = _4372;
    if (!_4254)
    {
        float _4376 = _3670 * _3670;
        float _4378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4380 = -_2920;
        float _4382 = _4380 + _4342;
        float _4384 = -_2884;
        float _4386 = _4384 + _4338;
        float _4388 = fma(_3674, _3674, _4376);
        float _4390 = -_2638;
        float _4392 = _4390 + _4340;
        float _4394 = fma(_3678, _3678, _4388);
        float _4396 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4398 = sqrt(_4394);
        float _4400 = 1.0 / _3764;
        float _4402 = _4396 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4404 = precise::min(_4398, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4406 = _4404 * _4378;
        float _4408 = _4406 * _4400;
        float _4410 = _4402 * _4408;
        float _4412 = _4382 * _4408;
        float _4414 = fma(_4392, _4410, _3656);
        float _4416 = fma(_4386, _4410, _3660);
        float _4418 = fma(_4402, _4412, _3664);
        _4362 = _4414;
        _4374 = _4416;
        _4364 = _4418;
    }
    float _4420 = _4362;
    float _4422 = _4374;
    float _4424 = _4364;
    if (!_4244)
    {
        float _4426 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4428 = _4426 * 0.15915493667125701904296875;
        float _4430 = _4428 * 6.283185482025146484375;
        float _4432 = cos(_4430);
        float _4434 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4436 = _4434 * 0.15915493667125701904296875;
        float _4438 = _4428 * 6.283185482025146484375;
        float _4440 = sin(_4438);
        float _4442 = 1.0 / _4432;
        float _4444 = _4436 * 6.283185482025146484375;
        float _4446 = cos(_4444);
        float _4448 = _4440 * _4442;
        float _4450 = _4436 * 6.283185482025146484375;
        float _4452 = sin(_4450);
        float _4454 = _4446 * _4448;
        float _4456 = 1.0 / _4454;
        float _4458 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4460 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4458;
        float _4462 = 1.0 / _4460;
        float _4464 = _4452 * _4456;
        float _4466 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4468 = fma(_4352, _4464, _4466);
        float _4470 = _4468 * _4462;
        float _4472 = precise::clamp(_4470, 0.0, 1.0);
        _3732 = _4436;
        _4370 = _4472;
    }
    float _4474 = _3732;
    float _4476 = _4370;
    float _4478 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4480 = _4420 + _4478;
    float _4482 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4484 = _4422 + _4482;
    float _4486 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4488 = _4424 + _4486;
    float _4490 = _4480 * _4480;
    float _4492 = fma(_4484, _4484, _4490);
    float _4494 = fma(_3660, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4496 = fma(_4488, _4488, _4492);
    float _4498 = rsqrt(_4496);
    float _4500 = sqrt(_4496);
    float _4502 = _4498 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4504 = _4484 * _4502;
    float _4506 = _4488 * _4502;
    float _4508 = _4504 * _4504;
    float _4510 = _4506 * _4506;
    float _4512 = _4508 + _4510;
    float _4514 = sqrt(_4512);
    bool _4516 = _4514 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4518 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4520 = _4514 + _4518;
    float _4522 = _4498;
    float _4524 = _4520;
    float _4526 = _4480;
    if (_4516)
    {
        float _4528 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4522 = _4528;
    }
    float _4530 = _4522;
    float _4532 = _4530;
    if (_4516)
    {
        float _4534 = _4520 * _4530;
        _4524 = _4534;
    }
    float _4536 = _4524;
    if (_4516)
    {
        float _4538 = rsqrt(_4512);
        _4532 = _4538;
    }
    float _4540 = _4532;
    float _4542 = _4540;
    if (_4516)
    {
        float _4544 = _4536 * 0.15915493667125701904296875;
        _227 = _4544;
    }
    float _4546 = _227;
    float _4548 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4550 = _4488;
    if (_4516)
    {
        float _4552 = _4546 * 6.283185482025146484375;
        float _4554 = sin(_4552);
        _4550 = _4554;
    }
    float _4556 = _4550;
    float _4558 = precise::max(0.0, _4548);
    float _4560 = _4474;
    float _4562 = _4558;
    if (_4516)
    {
        float _4564 = _4546 * 6.283185482025146484375;
        float _4566 = cos(_4564);
        _4560 = _4566;
    }
    float _4568 = _4560;
    float _4570 = -_4502;
    float _4572 = -_4558;
    float _4574 = fma(_4480, _4570, _4572);
    if (_4516)
    {
        float _4576 = _4574 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4526 = _4576;
    }
    float _4578 = _4526;
    float _4580 = floor(_4494);
    float _4582 = _4556;
    float _4584 = _4578;
    if (_4516)
    {
        float _4586 = fma(_4556, _4578, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4582 = _4586;
    }
    float _4588 = _4582;
    float _4590 = _4588;
    if (!_4516)
    {
        _4584 = _4574;
    }
    float _4592 = _4584;
    float _4594 = _4592;
    if (_4516)
    {
        float _4596 = _4540 * _4588;
        _4366 = _4596;
    }
    float _4598 = _4366;
    if (!_4516)
    {
        _4542 = _4504;
    }
    float _4600 = _4542;
    float _4602 = _4600;
    if (_4516)
    {
        float _4604 = _4568 + (-1.0);
        _4562 = _4604;
    }
    float _4606 = _4562;
    float _4608 = _4606;
    if (_4516)
    {
        float _4610 = _4504 * _4598;
        _4602 = _4610;
    }
    float _4612 = _4602;
    if (!_4516)
    {
        _4590 = _4508;
    }
    float _4614 = _4590;
    float _4616 = _4614;
    if (_4516)
    {
        float _4618 = _4606 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3734 = _4618;
    }
    float _4620 = _3734;
    float _4622 = _4620;
    if (!_4516)
    {
        _4608 = _4506;
    }
    float _4624 = _4608;
    float _4626 = _4624;
    if (_4516)
    {
        float _4628 = _4506 * _4598;
        _4626 = _4628;
    }
    float _4630 = _4626;
    if (_4516)
    {
        float _4632 = _4612 * _4612;
        _4616 = _4632;
    }
    float _4634 = _4616;
    if (_4516)
    {
        float _4636 = fma(_4574, _4568, _4620);
        _4594 = _4636;
    }
    float _4638 = _4594;
    if (!_4516)
    {
        _4622 = _4510;
    }
    float _4640 = _4622;
    float _4642 = _4640;
    if (_4516)
    {
        float _4644 = _4630 * _4630;
        _4642 = _4644;
    }
    float _4646 = _4642;
    float _4648 = fma(_4638, _4638, _4634);
    float _4650 = _4420 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4652 = -_4580;
    float _4654 = _4494 + _4652;
    float _4656 = _4648 + _4646;
    float _4658 = fma(_4422, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4650);
    float _4660 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4662 = fma(_4500, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4660);
    float _4664 = precise::clamp(_4662, 0.0, 1.0);
    float _4666 = rsqrt(_4656);
    float _4668 = fma(_4424, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4658);
    float _4670 = -_4664;
    float _4672 = _4670 + 1.0;
    float _4674 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4676 = fma(_3664, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4678 = _4668 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4680 = _4420 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4682 = abs(_4672);
    float _4684 = log2(_4682);
    float _4686 = _4678 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4688 = _4420 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4690 = -_4686;
    float _4692 = fma(_4690, _4674, 1.0);
    float _4694 = _4420 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4696 = fma(_4422, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4688);
    float _4698 = _4666 * _4612;
    float _4700 = _4666 * _4638;
    float _4702 = fma(_4422, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4694);
    float _4704 = fma(_4424, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4696);
    float _4706 = _4698 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4708 = _4666 * _4630;
    float _4710 = fma(_4424, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4702);
    float _4712 = _4704 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4714 = -_4706;
    float _4716 = fma(_4700, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4714);
    float _4718 = fma(_4422, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4680);
    float _4720 = _4710 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4722 = _4712 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4724 = -_4708;
    float _4726 = fma(_4724, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4716);
    float _4728 = floor(_4676);
    float _4730 = fma(_4424, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4718);
    float _4732 = fma(_4720, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4722);
    float _4734 = fma(_4726, -0.5, 0.5);
    float _4736 = _4684 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4738 = _4730 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4740 = fma(_4678, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4732);
    float _4742 = fma(_4726, 0.5, 0.5);
    float _4744 = exp2(_4736);
    float _4746 = _4700 + 1.0;
    float _4748 = fma(_4738, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4740);
    float _4750 = _4712 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4752 = fma(_4742, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4754 = fma(_4720, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4750);
    float _4756 = sqrt(_4734);
    float _4758 = _4712 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4760 = -_4728;
    float _4762 = _4676 + _4760;
    float _4764 = fma(_4742, _4752, -0.212114393711090087890625);
    float _4766 = fma(_4678, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4754);
    float _4768 = fma(_4720, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4758);
    float _4770 = fma(_4742, _4764, 1.570728778839111328125);
    float _4772 = log2(_4692);
    float _4774 = fma(_4678, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4768);
    float _4776 = fma(_4738, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4766);
    float _4778 = -_4700;
    float _4780 = fma(_4744, _4746, _4778);
    float _4782 = fma(_4738, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4774);
    float _4784 = fma(_4780, 0.5, 0.5);
    float _4786 = 1.0 / _4748;
    float _4788 = _4756 * 0.636619746685028076171875;
    float _4790 = -_4770;
    float _4792 = fma(_4788, _4790, 1.0);
    float2 _12387 = float2(_4654, _4762);
    float _4794 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12387, float2(0.0), isnan(_12387)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12387, float2(0.0), isnan(_12387)), level(0.0)).x;
    float _4796 = _4772 * 0.693147182464599609375;
    float _4798 = _4776 * _4786;
    float _4800 = _4782 * _4786;
    float _4802 = _4796 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4804 = fma(_4798, 0.5, 0.5);
    float _4806 = fma(_4800, -0.5, 0.5);
    float3 _12413 = float3(_4804, _4806, _4802);
    float _4808 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12413, float3(0.0), isnan(_12413)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12413, float3(0.0), isnan(_12413)), level(0.0)).x;
    float3 _12424 = float3(_4804, _4806, _4802);
    float4 _4811 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12424, float3(0.0), isnan(_12424)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12424, float3(0.0), isnan(_12424)), level(0.0)).xyzw;
    float _4813 = _4811.x;
    float _4815 = _4811.y;
    float _4817 = _4811.z;
    float _4819 = _4811.w;
    float2 _12440 = float2(_4792, _4784);
    float3 _4821 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12440, float2(0.0), isnan(_12440)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12440, float2(0.0), isnan(_12440)), level(0.0)).xyz;
    float _4823 = _4821.x;
    float _4825 = _4821.y;
    float _4827 = _4821.z;
    float _4829 = abs(_4352);
    float _4831 = log2(_4829);
    float _4833 = _4712 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _4835 = _4500 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4837 = isnan(_4500);
    bool _4839 = _4835 || _4837;
    bool _4841 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4843 = _4839 || _4841;
    float _4845 = fma(_4720, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4833);
    float _4847 = fma(_4678, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4845);
    float _4849 = _4776 + _4748;
    float _4851 = fma(_4738, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4847);
    float _4853 = _4831 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4855 = in.m_92.x;
    float _4857 = _4849 * 0.5;
    out.gl_Position.x = _4776;
    out.gl_Position.y = _4782;
    out.gl_Position.z = _4851;
    out.gl_Position.w = _4748;
    float _4859 = exp2(_4853);
    float _4861 = _4776;
    float _4863 = _4851;
    float _4865 = _4748;
    float _4867 = _4782;
    if (!_4843)
    {
        _4861 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4869 = _4861;
    float _4871 = fma(_4859, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4873 = precise::clamp(_4871, 0.0, 1.0);
    float _4875 = _4851 + _4748;
    float _4877 = _4869;
    float _4879 = _4869;
    if (!_4843)
    {
        _4863 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4881 = _4863;
    float _4883 = fma(_4873, -2.0, 3.0);
    float _4885 = _4873 * _4873;
    float _4887 = _4875 * 0.5;
    float _4889 = _4885 * _4883;
    float _4891 = _4684 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _4893 = _4352 <= 8000.0;
    bool _4895 = isnan(_4352);
    bool _4897 = _4893 || _4895;
    bool _4899 = isnan(8000.0);
    bool _4901 = _4897 || _4899;
    float _4903 = float(_4901);
    float _4905 = _4748 * 0.5;
    float _4907 = -_4889;
    float _4909 = _4907 + 1.0;
    float _4911 = exp2(_4891);
    float _4913 = fma(_4909, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4889);
    float _4915 = fma(_4782, -0.5, _4905);
    float _4917 = _4903 * _4913;
    float _4919 = _4881;
    float _4921 = _4881;
    if (!_4843)
    {
        _4865 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4923 = _4865;
    out.m_94.x = _4857;
    out.m_94.y = _4915;
    out.m_94.z = _4887;
    out.m_94.w = _4748;
    float _4925 = _4917 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4927 = _4923;
    float _4929 = _4923;
    if (!_4843)
    {
        _4867 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4931 = _4867;
    float _4933 = -_4911;
    float _4935 = _4933 + 1.0;
    float _4937 = _4935 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4939 = -_4794;
    float _4941 = _4939 + 1.0;
    float _4943 = _4941 * _4925;
    float _4945 = precise::clamp(_4943, 0.0, 1.0);
    float _4947 = -_4945;
    float _4949 = fma(_4947, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4951 = _4949 * _4855;
    float _4953 = _4951 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4955 = _4937 * _4808;
    float _4957 = -_4937;
    float _4959 = _4957 + 1.0;
    out.m_96.x = _4953;
    float _4961 = _4819 * _4955;
    float _4963 = _4827 * _4955;
    float _4965 = _4819 * _4959;
    float _4967 = fma(_4823, _4961, _4813);
    float _4969 = fma(_4825, _4961, _4815);
    float _4971 = fma(_4819, _4963, _4817);
    float _4973 = _4476 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4975 = _4961;
    float _4977 = _4817;
    float _4979 = _4931;
    float _4981 = _4931;
    if (!_4843)
    {
        _4975 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4983 = _4975;
    float _4985 = _4983;
    float _4987 = _4983;
    if (!_4843)
    {
        _4977 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4989 = _4977;
    out.m_98.x = _4967;
    out.m_98.y = _4969;
    out.m_98.z = _4971;
    out.m_98.w = _4965;
    bool _4991 = !_4843;
    float _4993 = _4989;
    float _4995 = _4989;
    if (!_4991)
    {
        bool _4997 = _4500 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4999 = isnan(_4500);
        bool _5001 = _4997 || _4999;
        bool _5003 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5005 = _5001 || _5003;
        if (!_5005)
        {
            float _5007 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5009 = _4500 + _5007;
            float _5011 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5013 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5011;
            float _5015 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5017 = _5015 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5019 = 1.0 / _5013;
            float _5021 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5023 = _5021 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5025 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5027 = _5025 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5029 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5031 = _5029 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5033 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5035 = _5033 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5037 = _5009 * _5019;
            float _5039 = precise::clamp(_5037, 0.0, 1.0);
            float _5041 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5043 = _5041 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5045 = fma(_5039, _5017, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5047 = fma(_5039, _5043, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5049 = fma(_5039, _5023, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5051 = fma(_5039, _5027, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5053 = fma(_5039, _5031, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5055 = fma(_5039, _5035, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4995 = _5049;
            _4981 = _5053;
            _4987 = _5045;
            _4921 = _5051;
            _4929 = _5047;
            _4879 = _5055;
            _5057 = true;
        }
        else
        {
            bool _5059 = _4500 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5061 = isnan(_4500);
            bool _5063 = _5059 || _5061;
            bool _5065 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5067 = _5063 || _5065;
            if (!_5067)
            {
                _4985 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5069 = _4985;
            _4987 = _5069;
            if (!_5067)
            {
                _4993 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5071 = _4993;
            _4995 = _5071;
            if (!_5067)
            {
                _4927 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5073 = _4927;
            _4929 = _5073;
            if (!_5067)
            {
                _4919 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5075 = _4919;
            _4921 = _5075;
            if (!_5067)
            {
                _4979 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5077 = _4979;
            _4981 = _5077;
            if (!_5067)
            {
                _4877 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5079 = _4877;
            bool _5081 = !_5067;
            _4879 = _5079;
            if (!_5081)
            {
                bool _5083 = _4500 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5085 = isnan(_4500);
                bool _5087 = _5083 || _5085;
                bool _5089 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5091 = _5087 || _5089;
                if (!_5091)
                {
                    float _5093 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5095 = _4500 + _5093;
                    float _5097 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5099 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5097;
                    float _5101 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5103 = _5101 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5105 = 1.0 / _5099;
                    float _5107 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5109 = _5107 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5111 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5113 = _5111 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5115 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5117 = _5115 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5119 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5121 = _5119 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5123 = _5095 * _5105;
                    float _5125 = precise::clamp(_5123, 0.0, 1.0);
                    float _5127 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5129 = _5127 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5131 = fma(_5125, _5103, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5133 = fma(_5125, _5129, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5135 = fma(_5125, _5109, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5137 = fma(_5125, _5113, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5139 = fma(_5125, _5117, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5141 = fma(_5125, _5121, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4995 = _5135;
                    _4981 = _5139;
                    _4987 = _5131;
                    _4921 = _5137;
                    _4929 = _5133;
                    _4879 = _5141;
                    _5057 = true;
                }
                else
                {
                    _4995 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4981 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4987 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4921 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4929 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4879 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5057 = false;
    float _5143 = _4995;
    float _5145 = _4981;
    float _5147 = _4987;
    float _5149 = _4921;
    float _5151 = _4929;
    float _5153 = _4879;
    float _5155 = _4973 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5157 = fma(_4084, -0.5, 0.5);
    float _5159 = precise::clamp(_5157, 0.0, 1.0);
    float _5161 = -_5143;
    float _5163 = _5161 + _5145;
    float _5165 = -_5147;
    float _5167 = _5165 + _5149;
    out.m_57.x = _5155;
    float _5169 = fma(_5159, _5163, _5143);
    float _5171 = -_5151;
    float _5173 = _5171 + _5153;
    float _5175 = fma(_5159, _5167, _5147);
    float _5177 = _5169 * 0.586610972881317138671875;
    bool _5179 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5181 = fma(_5159, _5173, _5151);
    out.m_100.x = 0.0;
    float _5183 = fma(_5175, 0.298911988735198974609375, _5177);
    bool _5185 = _4476 > 0.0;
    bool _5187 = isnan(_4476);
    bool _5189 = _5185 || _5187;
    bool _5191 = isnan(0.0);
    bool _5193 = _5189 || _5191;
    float _5195 = fma(_5181, 0.114477999508380889892578125, _5183);
    float _5197 = -_5195;
    float _5199 = _5175 + _5197;
    float _5201 = -_5195;
    float _5203 = _5169 + _5201;
    float _5205 = -_5195;
    float _5207 = _5181 + _5205;
    float _5209 = fma(_5199, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5195);
    float _5211 = fma(_5203, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5195);
    float _5213 = fma(_5207, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5195);
    bool _5215 = !_5179;
    if (!_5215)
    {
        float _5217 = -_4420;
        float _5219 = _5217 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5221 = -_4422;
        float _5223 = _5221 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5225 = -_4424;
        float _5227 = _5225 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5229 = _5219 * _5219;
        float _5231 = fma(_5223, _5223, _5229);
        float _5233 = fma(_5227, _5227, _5231);
        float _5235 = sqrt(_5233);
        float _5237 = rsqrt(_5233);
        float _5239 = -_5235;
        float _5241 = _5239 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5243 = _5241 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5245 = precise::clamp(_5243, 0.0, 1.0);
        float _5247 = _5223 * _5237;
        float _5249 = _5219 * _5237;
        float _5251 = abs(_5245);
        float _5253 = log2(_5251);
        float _5255 = _5227 * _5237;
        float _5257 = _5247 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5259 = _4084 * _5249;
        float _5261 = -_5249;
        float _5263 = -_5257;
        float _5265 = fma(_5261, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5263);
        float _5267 = fma(_4082, _5247, _5259);
        float _5269 = -_5255;
        float _5271 = fma(_5269, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5265);
        float _5273 = fma(_4086, _5255, _5267);
        float _5275 = precise::clamp(_5273, 0.0, 1.0);
        float _5277 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5279 = _5271 + _5277;
        float _5281 = _5253 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5283 = _5279 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5285 = precise::clamp(_5283, 0.0, 1.0);
        float _5287 = exp2(_5281);
        float _5289 = _5287 * _5285;
        float _5291 = _5275 * _5289;
        float _5293 = _5291 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5295 = _5291 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5297 = _5291 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _5293;
        out.m_100.y = _5295;
        out.m_100.z = _5297;
    }
    out.m_102.x = _5209;
    out.m_102.y = _5211;
    out.m_102.z = _5213;
    if (_5193)
    {
        return out;
    }
    out.m_57.x = 0.0;
    float _5299 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5299;
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
    bool _5057 = false;
    bool _4134 = false;
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
        float _5366 = as_type<float>(_145);
        out.gl_Position.z = _5366;
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
        float _5429 = as_type<float>(_177);
        out.gl_Position.z = _5429;
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
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _591;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _599 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _601 = isnan(_581);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = 1.0 / _589;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _617 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _619 = isnan(_581);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    bool _629 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _631 = 1.0 / _597;
    float _633 = _593 * _611;
    bool _635 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _637 = isnan(_581);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = 1.0 / _615;
    float _649 = -_609;
    float _651 = _649 + 1.0;
    float _653 = fma(_633, _585, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _659 = -_645;
    float _661 = _659 + 1.0;
    bool _663 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _665 = isnan(_581);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = _645 * _651;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _679 = _677 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _681 = 1.0 / _657;
    float _683 = _627 * _661;
    float _685 = -_673;
    float _687 = _685 + 1.0;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _689;
    float _693 = _679 * _631;
    float _695 = _653 * _683;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _699 = _581 + _697;
    float _701 = -_627;
    float _703 = _701 + 1.0;
    float _705 = _609 * _687;
    float _707 = _691 * _647;
    bool _709 = _581 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _711 = isnan(_581);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _723 = _721 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _727 = _581 + _725;
    float _729 = fma(_693, _699, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _731 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[131].x, _695);
    float _733 = -_719;
    float _735 = _733 + 1.0;
    float _737 = _723 * _681;
    float _739 = fma(_707, _727, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _743 = _581 + _741;
    float _745 = fma(_729, _675, _731);
    float _747 = _673 * _735;
    float _749 = fma(_737, _743, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _751 = fma(_739, _705, _745);
    float _753 = fma(_749, _747, _751);
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _761 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[135].x, _753);
    float _763 = _755 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _765 = _757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _767 = _759 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _769 = _761 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_70.x = _763;
    out.m_70.y = _765;
    out.m_70.z = _767;
    out.m_70.w = _769;
    bool _771 = !_629;
    float _773 = _631;
    int _775 = as_type<int>(_705);
    int _777 = as_type<int>(_767);
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[134].x;
    if (!_771)
    {
        float _781 = in.m_64.x;
        float _783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _785 = _781 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _787 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _789 = _787 * _783;
        float _791 = floor(_789);
        float _793 = -_791;
        float _795 = _789 + _793;
        _173 = _795;
    }
    float _797 = _173;
    float _799 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _801 = int(_799);
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _805 = _803 != 0;
    float _807 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _809 = int(_807);
    float _811 = float(_801);
    float _813 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _815 = int(_813);
    float _817 = 0.0;
    if (_805)
    {
        _817 = 1.0;
    }
    float _819 = _817;
    float _821 = _819;
    if (_805)
    {
        _773 = 1.0;
    }
    float _823 = _773;
    float _825 = _823;
    if (_805)
    {
        _775 = 0;
    }
    int _827 = _775;
    float _829 = float(_809);
    float _831 = 1.0 / _811;
    int _833 = _827;
    if (_805)
    {
        _777 = 0;
    }
    int _835 = _777;
    float _837 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _839 = int(_837);
    float _841 = float(uint(_815));
    float _843 = 1.0 / _829;
    float _845 = _831 * _127;
    float _847 = 1.0 / _841;
    float _849 = float(uint(_839));
    int _851 = ~_839;
    int _853 = _851 + 1;
    float _855 = trunc(_845);
    int _857 = int(_855);
    float _859 = _843 * _127;
    float _861 = _843;
    float _863 = _811;
    int _865 = _835;
    if (_805)
    {
        float _867 = in.m_64.x;
        float _869 = in.m_64.y;
        _861 = _867;
        _863 = _869;
    }
    float _871 = _861;
    float _873 = _863;
    float _875 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _877 = int(_875);
    int _879 = as_type<int>(_847) + (-2);
    float _881 = 1.0 / _849;
    float _883 = float(uint(_857));
    float _885 = as_type<float>(_879) * _883;
    float _887 = trunc(_859);
    int _889 = int(_887);
    float _891 = float(uint(_877));
    float _893 = _871;
    float _895 = _873;
    float _897 = as_type<float>(_879);
    if (_805)
    {
        _779 = _871;
    }
    float _899 = _779;
    float _901 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _903 = int(_901);
    int _905 = as_type<int>(_881) + (-2);
    float _907 = _881;
    float _909 = _899;
    if (_805)
    {
        _907 = _873;
    }
    float _911 = _907;
    float _913 = 1.0 / _891;
    float _915 = float(uint(_889));
    float _917 = as_type<float>(_905) * _915;
    float _919 = trunc(_885);
    float _921 = precise::max(_919, 0.0);
    uint _924 = uint(_921);
    float _926 = float(_903);
    float _928 = 1.0 / _926;
    float _930 = trunc(_917);
    float _932 = precise::max(_930, 0.0);
    uint _934 = uint(_932);
    float _936 = _926;
    float _938 = _917;
    float _940 = _911;
    if (_805)
    {
        _936 = _899;
    }
    float _942 = _936;
    float _944 = _942;
    if (_805)
    {
        _938 = _899;
    }
    float _946 = _938;
    float _948 = _946;
    if (!_805)
    {
        float _950 = in.m_64.x;
        float _952 = in.m_64.y;
        float _954 = in.m_64.z;
        float _956 = _950 * 3.1415927410125732421875;
        float _958 = _956 * 0.15915493667125701904296875;
        float _960 = _952 * 3.1415927410125732421875;
        float _962 = _960 * 0.15915493667125701904296875;
        float _964 = _958 * 6.283185482025146484375;
        float _966 = sin(_964);
        float _968 = _962 * 6.283185482025146484375;
        float _970 = sin(_968);
        _821 = 7.345489978790283203125;
        _893 = _950;
        _825 = 5.839270114898681640625;
        _944 = _954;
        _909 = _952;
        _895 = _952;
        _940 = _970;
        _833 = 1;
        _865 = 2;
        _948 = _966;
    }
    float _972 = _821;
    float _974 = _893;
    float _976 = _825;
    float _978 = _944;
    float _980 = _909;
    float _982 = _895;
    float _984 = _940;
    int _986 = _833;
    int _988 = _865;
    float _990 = _948;
    int _992 = _853 * int(_934);
    int _994 = _992 + _889;
    float _996 = _972 * _974;
    float _998 = _976 * _978;
    float _1000 = in.m_64.z;
    float _1002 = in.m_64.w;
    float _1004 = _972 * _980;
    float _1006 = float(uint(_994));
    float _1008 = floor(_996);
    float _1010 = _928 * _127;
    float _1012 = _974 * 2.0;
    float _1014 = as_type<float>(_905) * _1006;
    int _1016 = ~_815;
    int _1018 = _1016 + 1;
    float _1020 = float(_889);
    float _1022 = trunc(_1014);
    float _1024 = precise::max(_1022, 0.0);
    uint _1026 = uint(_1024);
    float _1028 = float(_839);
    int _1030 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1032 = _1030 != 0;
    int _1034 = _1018 * int(_924);
    int _1036 = _1034 + _857;
    bool _1038 = _982 > 0.5;
    float _1040 = floor(_998);
    float _1042 = -_1008;
    float _1044 = _996 + _1042;
    int _1046 = ~_815;
    int _1048 = _1046 + 1;
    float _1050 = float(uint(_1036));
    bool _1052 = _1002 > 0.5;
    float _1054 = trunc(_1010);
    int _1056 = int(_1054);
    float _1058 = as_type<float>(_879) * _1050;
    int _1060 = int(_934) + int(_1026);
    int _1062 = as_type<int>(_913) + (-2);
    bool _1064 = _1000 > 0.5;
    float _1066 = trunc(_1058);
    float _1068 = precise::max(_1066, 0.0);
    uint _1070 = uint(_1068);
    float _1072 = -_1040;
    float _1074 = _998 + _1072;
    int _1076 = ~_839;
    int _1078 = _1076 + 1;
    bool _1080 = _1020 >= _1028;
    bool _1082 = isnan(_1020);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan(_1028);
    bool _1088 = _1084 || _1086;
    float _1090 = float(_1088);
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1094 = _1092 != 0;
    int _1096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1098 = _1096 != 0;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1102 = _1100 != 0;
    int _1104 = _1078 * _1060;
    int _1106 = _1104 + _889;
    float _1108 = float(uint(_1056));
    float _1110 = floor(_1004);
    float _1112 = -_205;
    int _1114 = _1038 ? as_type<int>(_1112) : as_type<int>(_205);
    float _1116 = as_type<float>(_1062) * _1108;
    float _1118 = -_215;
    int _1120 = _1064 ? as_type<int>(_1118) : as_type<int>(_215);
    int _1122 = int(_924) + int(_1070);
    float _1124 = trunc(_1116);
    float _1126 = precise::max(_1124, 0.0);
    uint _1128 = uint(_1126);
    float _1130 = _1044 * _1028;
    int _1132 = int(_1052);
    int _1134 = _1064 ? 2 : 0;
    int _1136 = _1132 | _1134;
    int _1138 = _1032 ? 4 : 0;
    int _1140 = _1136 | _1138;
    int _1142 = _1094 ? 8 : 0;
    int _1144 = _1140 | _1142;
    int _1146 = _1098 ? 16 : 0;
    int _1148 = _1144 | _1146;
    int _1150 = _1102 ? 32 : 0;
    int _1152 = _1148 | _1150;
    int _1154 = _1038 ? 64 : 0;
    int _1156 = _1152 | _1154;
    int _1158 = _1156 & 64;
    bool _1160 = !_1098;
    float _1162 = _1160 ? _205 : as_type<float>(_1114);
    float _1164 = float(_815);
    float _1166 = trunc(_1090);
    int _1168 = int(_1166);
    float _1170 = float(_857);
    float _1172 = _1074 * _1164;
    int _1174 = ~_877;
    int _1176 = _1174 + 1;
    int _1178 = _1048 * _1122;
    int _1180 = _1178 + _857;
    bool _1182 = !_1032;
    int _1184 = _1182 ? 0 : 1;
    float _1186 = trunc(_1130);
    int _1188 = int(_1186);
    bool _1190 = !_1102;
    float _1192 = _1190 ? _215 : as_type<float>(_1120);
    int _1194 = _1176 * int(_1128);
    int _1196 = _1194 + _1056;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1200 = _1198 != 0;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1204 = _1202 != 0;
    int _1206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1208 = _1206 != 0;
    bool _1210 = uint(_1106) >= uint(_839);
    bool _1212 = _1170 >= _1164;
    bool _1214 = isnan(_1170);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan(_1164);
    bool _1220 = _1216 || _1218;
    float _1222 = float(_1220);
    float _1224 = trunc(_1172);
    int _1226 = int(_1224);
    bool _1228 = !_1204;
    int _1230 = _1228 ? 0 : 1;
    bool _1232 = !_1200;
    int _1234 = _1232 ? 0 : 1;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1238 = _1236 != 0;
    bool _1240 = uint(_1180) >= uint(_815);
    float _1242 = trunc(_1222);
    int _1244 = int(_1242);
    bool _1246 = !_1210;
    int _1248 = _1246 ? 0 : (-1);
    bool _1250 = !_1208;
    int _1252 = _1250 ? 0 : 1;
    bool _1254 = !_1238;
    int _1256 = _1254 ? 0 : 1;
    bool _1258 = !_1240;
    int _1260 = _1258 ? 0 : (-1);
    float _1262 = floor(_1012);
    float _1264 = -_1110;
    float _1266 = _1004 + _1264;
    float _1268 = float(uint(_1196));
    int _1270 = abs(_1184);
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1274 = _1272 != 0;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1278 = _1276 != 0;
    int _1280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1282 = _1280 != 0;
    float _1284 = as_type<float>(_1062) * _1268;
    int _1286 = ~_1060;
    int _1288 = _1286 + _1248;
    int _1290 = _1288 + 1;
    int _1292 = _1188 * _1270;
    int _1294 = _1292 + _889;
    int _1296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1298 = _1296 != 0;
    int _1300 = ~_1122;
    int _1302 = _1300 + _1260;
    int _1304 = _1302 + 1;
    int _1306 = _839 * _1290;
    int _1308 = _1306 + _889;
    bool _1310 = !_1278;
    int _1312 = _1310 ? 0 : 1;
    float _1314 = trunc(_1284);
    float _1316 = precise::max(_1314, 0.0);
    uint _1318 = uint(_1316);
    bool _1320 = !_1298;
    int _1322 = _1320 ? 0 : 1;
    int _1324 = _815 * _1304;
    int _1326 = _1324 + _857;
    bool _1328 = _1158 != 0;
    float _1330 = _165 * _127;
    bool _1332 = _839 == 0;
    bool _1334 = !_1274;
    int _1336 = _1334 ? 0 : 1;
    float _1338 = _1028 * _1330;
    bool _1340 = _815 == 0;
    float _1342 = _1164 * _1330;
    int _1344 = ~_1168;
    int _1346 = _1344 + 1;
    int _1348 = _1346 + 1;
    bool _1350 = !_1332;
    int _1352 = _1350 ? _1308 : (-1);
    float _1354 = trunc(_1338);
    int _1356 = int(_1354);
    int _1358 = ~_1244;
    int _1360 = _1358 + 1;
    int _1362 = _1360 + 1;
    bool _1364 = !_1340;
    int _1366 = _1364 ? _1326 : (-1);
    int _1368 = _1352 * _1348;
    int _1370 = _839 + (-1);
    int _1372 = abs(_1230);
    int _1374 = _1366 * _1362;
    int _1376 = _815 + (-1);
    int _1378 = _1168 * _1370;
    int _1380 = _1378 + _1368;
    int _1382 = abs(_1312);
    float _1384 = trunc(_1342);
    int _1386 = int(_1384);
    int _1388 = abs(_1322);
    int _1390 = _1244 * _1376;
    int _1392 = _1390 + _1374;
    int _1394 = _1380 * _1372;
    int _1396 = abs(_1234);
    int _1398 = _1226 * _1388;
    int _1400 = _1398 + _857;
    int _1402 = ~_877;
    int _1404 = _1402 + 1;
    int _1406 = _1392 * _1382;
    int _1408 = abs(_1252);
    int _1410 = _1356 * _1396;
    int _1412 = _1410 + _1394;
    int _1414 = abs(_1256);
    int _1416 = _1294 * _1408;
    int _1418 = _1416 + _1412;
    int _1420 = int(_1128) + int(_1318);
    int _1422 = abs(_1336);
    int _1424 = _1404 * _1420;
    int _1426 = _1424 + _1056;
    float _1428 = -_215;
    int _1430 = _1052 ? as_type<int>(_1428) : as_type<int>(_215);
    int _1432 = _1188 * _1414;
    int _1434 = _1432 + _1418;
    float _1436 = -_205;
    int _1438 = _1064 ? as_type<int>(_1436) : as_type<int>(_205);
    int _1440 = _1386 * _1422;
    int _1442 = _1440 + _1406;
    bool _1444 = uint(_1426) >= uint(_877);
    float _1446 = float(uint(_1434));
    float _1448 = float(_877);
    float _1450 = float(_1056);
    float _1452 = as_type<float>(_905) * _1446;
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1456 = _1454 != 0;
    float _1458 = _1448 * _1330;
    bool _1460 = !_1282;
    int _1462 = _1460 ? 0 : 1;
    float _1464 = trunc(_1452);
    float _1466 = precise::max(_1464, 0.0);
    uint _1468 = uint(_1466);
    bool _1470 = _1450 >= _1448;
    bool _1472 = isnan(_1450);
    bool _1474 = _1470 || _1472;
    bool _1476 = isnan(_1448);
    bool _1478 = _1474 || _1476;
    float _1480 = float(_1478);
    float _1482 = _1266 * _1448;
    int _1484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1486 = _1484 != 0;
    float _1488 = _982 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1490 = !_1456;
    int _1492 = _1490 ? 0 : 1;
    int _1494 = abs(_1462);
    float _1496 = trunc(_1480);
    int _1498 = int(_1496);
    bool _1500 = !_1094;
    float _1502 = _1500 ? _215 : as_type<float>(_1430);
    bool _1504 = !_1486;
    int _1506 = _1504 ? 0 : 1;
    int _1508 = abs(_1492);
    float _1510 = trunc(_1458);
    int _1512 = int(_1510);
    bool _1514 = !_1444;
    int _1516 = _1514 ? 0 : (-1);
    int _1518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1520 = _1518 != 0;
    int _1522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1524 = _1522 != 0;
    int _1526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1528 = _1526 != 0;
    int _1530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1532 = _1530 != 0;
    int _1534 = _1400 * _1494;
    int _1536 = _1534 + _1442;
    int _1538 = ~_1420;
    int _1540 = _1538 + _1516;
    int _1542 = _1540 + 1;
    bool _1544 = !_1524;
    int _1546 = _1544 ? 0 : 1;
    int _1548 = _1226 * _1508;
    int _1550 = _1548 + _1536;
    int _1552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1554 = _1552 != 0;
    int _1556 = _877 * _1542;
    int _1558 = _1556 + _1056;
    int _1560 = ~_839;
    int _1562 = _1560 + 1;
    float _1564 = trunc(_1482);
    int _1566 = int(_1564);
    float _1568 = float(uint(_1550));
    bool _1570 = !_1520;
    int _1572 = _1570 ? 0 : 1;
    int _1574 = _1562 * int(_1468);
    int _1576 = _1574 + _1434;
    bool _1578 = _877 == 0;
    float _1580 = as_type<float>(_879) * _1568;
    int _1582 = ~_1498;
    int _1584 = _1582 + 1;
    int _1586 = _1584 + 1;
    float _1588 = float(uint(_1576));
    float _1590 = _1568;
    float _1592 = as_type<float>(_986);
    if (_1554)
    {
        float _1594 = in.m_64.w;
        _1590 = _1594;
    }
    float _1596 = _1590;
    bool _1598 = !_1578;
    int _1600 = _1598 ? _1558 : (-1);
    float _1602 = trunc(_1580);
    float _1604 = precise::max(_1602, 0.0);
    uint _1606 = uint(_1604);
    int _1608 = abs(_1546);
    float _1610 = as_type<float>(_905) * _1588;
    int _1612 = abs(_1506);
    int _1614 = _1600 * _1586;
    int _1616 = _877 + (-1);
    int _1618 = abs(_1572);
    float _1620 = trunc(_1610);
    float _1622 = precise::max(_1620, 0.0);
    uint _1624 = uint(_1622);
    int _1626 = _1498 * _1616;
    int _1628 = _1626 + _1614;
    int _1630 = _1628 * _1608;
    int _1632 = ~_815;
    int _1634 = _1632 + 1;
    int _1636 = _1566 * _1612;
    int _1638 = _1636 + _1056;
    bool _1640 = _839 == 0;
    int _1642 = _1512 * _1618;
    int _1644 = _1642 + _1630;
    bool _1646 = !_1528;
    int _1648 = _1646 ? 0 : 1;
    int _1650 = _1634 * int(_1606);
    int _1652 = _1650 + _1550;
    int _1654 = ~_839;
    int _1656 = _1654 + 1;
    float _1658 = as_type<float>(_1612);
    if (_1554)
    {
        float _1660 = _1596 * 3.1415927410125732421875;
        _1658 = _1660;
    }
    float _1662 = _1658;
    int _1664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1666 = _1664 != 0;
    int _1668 = int(_1468) + int(_1624);
    float _1670 = _1662;
    if (_1554)
    {
        float _1672 = _1662 * 0.15915493667125701904296875;
        _1670 = _1672;
    }
    float _1674 = _1670;
    int _1676 = abs(_1648);
    bool _1678 = !_1532;
    int _1680 = _1678 ? 0 : 1;
    int _1682 = _1656 * _1668;
    int _1684 = _1682 + _1434;
    float _1686 = float(uint(_1652));
    float _1688 = _1674;
    if (_1554)
    {
        float _1690 = _1674 * 6.283185482025146484375;
        float _1692 = sin(_1690);
        _1688 = _1692;
    }
    float _1694 = _1688;
    int _1696 = abs(_1680);
    int _1698 = _1638 * _1676;
    int _1700 = _1698 + _1644;
    bool _1702 = uint(_1684) >= uint(_839);
    float _1704 = as_type<float>(_879) * _1686;
    float _1706 = as_type<float>(_1608);
    if (_1666)
    {
        float _1708 = in.m_64.x;
        _1706 = _1708;
    }
    float _1710 = _1706;
    float _1712 = float(uint(_1294));
    bool _1714 = !_1702;
    int _1716 = _1714 ? 0 : (-1);
    float _1718 = trunc(_1704);
    float _1720 = precise::max(_1718, 0.0);
    uint _1722 = uint(_1720);
    int _1724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1726 = _1724 != 0;
    float _1728 = as_type<float>(_905) * _1712;
    int _1730 = ~_1668;
    int _1732 = _1730 + _1716;
    int _1734 = _1732 + 1;
    int _1736 = _1566 * _1696;
    int _1738 = _1736 + _1700;
    bool _1740 = !_1726;
    float _1742 = _1740 ? _205 : as_type<float>(_1438);
    bool _1744 = _1726;
    if (_1554)
    {
        bool _1746 = _1694 > 0.5;
        _1744 = _1746;
    }
    bool _1748 = _1744;
    int _1750 = _839 * _1734;
    int _1752 = _1750 + _1434;
    float _1754 = trunc(_1728);
    float _1756 = precise::max(_1754, 0.0);
    uint _1758 = uint(_1756);
    float _1760 = float(uint(_1738));
    float _1762 = 0.0;
    float _1764 = _1760;
    if (!_1554)
    {
        _1762 = _205;
    }
    float _1766 = _1762;
    bool _1768 = !_1640;
    int _1770 = _1768 ? _1752 : (-1);
    float _1772 = as_type<float>(_1062) * _1760;
    int _1774 = ~_839;
    int _1776 = _1774 + 1;
    float _1778 = _1766;
    if (_1554)
    {
        float _1780 = -_205;
        float _1782 = _1748 ? _1780 : _205;
        _1778 = _1782;
    }
    float _1784 = _1778;
    float _1786 = trunc(_1772);
    float _1788 = precise::max(_1786, 0.0);
    uint _1790 = uint(_1788);
    int _1792 = int(_1606) + int(_1722);
    if (_1666)
    {
        float _1794 = _1710 * 3.1415927410125732421875;
        _1764 = _1794;
    }
    float _1796 = _1764;
    int _1798 = _1770 & 3;
    bool _1800 = _1798 != 0;
    int _1802 = _1770 & 3;
    bool _1804 = _1802 != 0;
    float _1806 = _1796;
    if (_1666)
    {
        float _1808 = _1796 * 0.15915493667125701904296875;
        _1806 = _1808;
    }
    float _1810 = _1806;
    int _1812 = _1800 ? 0 : 1;
    bool _1814 = uint(_1802) > 1u;
    int _1816 = _1776 * int(_1758);
    int _1818 = _1816 + _1294;
    float _1820 = float(uint(_1400));
    float _1822 = _1810;
    if (_1666)
    {
        float _1824 = _1810 * 6.283185482025146484375;
        float _1826 = sin(_1824);
        _1822 = _1826;
    }
    float _1828 = _1822;
    int _1830 = ~_815;
    int _1832 = _1830 + 1;
    float _1834 = float(uint(_1818));
    float _1836 = as_type<float>(_879) * _1820;
    int _1838 = ~_877;
    int _1840 = _1838 + 1;
    float _1842 = trunc(_1836);
    float _1844 = precise::max(_1842, 0.0);
    uint _1846 = uint(_1844);
    int _1848 = ~_1812;
    int _1850 = _1848 + 1;
    int _1852 = _1850 + 1;
    float _1854 = as_type<float>(_905) * _1834;
    int _1856 = _1852;
    if (!_1814)
    {
        int _1858 = ~_1812;
        int _1860 = _1858 + 1;
        _1856 = _1860;
    }
    int _1862 = _1856;
    int _1864 = _1832 * _1792;
    int _1866 = _1864 + _1550;
    float _1868 = -_215;
    int _1870 = _1328 ? as_type<int>(_1868) : as_type<int>(_215);
    int _1872 = _1840 * int(_1790);
    int _1874 = _1872 + _1738;
    bool _1876 = uint(_1802) >= 2u;
    float _1878 = trunc(_1854);
    float _1880 = precise::max(_1878, 0.0);
    uint _1882 = uint(_1880);
    bool _1884 = uint(_1866) >= uint(_815);
    float _1886 = float(uint(_1874));
    int _1888 = _1876 ? 0 : 1;
    bool _1890 = _1802 != 3;
    float _1892 = as_type<float>(_1062) * _1886;
    int _1894 = ~_815;
    int _1896 = _1894 + 1;
    bool _1898 = !_1884;
    int _1900 = _1898 ? 0 : (-1);
    float _1902 = trunc(_1892);
    float _1904 = precise::max(_1902, 0.0);
    uint _1906 = uint(_1904);
    int _1908 = ~_1888;
    int _1910 = _1908 + 1;
    int _1912 = _1910 + 1;
    int _1914 = _1896 * int(_1846);
    int _1916 = _1914 + _1400;
    int _1918 = ~_1792;
    int _1920 = _1918 + _1900;
    int _1922 = _1920 + 1;
    float _1924 = float(uint(_1916));
    int _1926 = _815 * _1922;
    int _1928 = _1926 + _1550;
    int _1930 = _1912;
    bool _1932 = _1890;
    float _1934 = as_type<float>(_1846);
    if (_1890)
    {
        int _1936 = ~_1888;
        int _1938 = _1936 + 1;
        _1930 = _1938;
    }
    int _1940 = _1930;
    if (_1666)
    {
        bool _1942 = _1828 > 0.5;
        _1932 = _1942;
    }
    bool _1944 = _1932;
    float _1946 = as_type<float>(_879) * _1924;
    bool _1948 = !_1340;
    int _1950 = _1948 ? _1928 : (-1);
    if (!_1666)
    {
        _897 = _215;
    }
    float _1952 = _897;
    int _1954 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1956 = _1954 != 0;
    float _1958 = trunc(_1946);
    float _1960 = precise::max(_1958, 0.0);
    uint _1962 = uint(_1960);
    float _1964 = _1952;
    if (_1666)
    {
        float _1966 = -_215;
        float _1968 = _1944 ? _1966 : _215;
        _1964 = _1968;
    }
    float _1970 = _1964;
    int _1972 = _1950 & 3;
    bool _1974 = _1972 != 0;
    bool _1976 = !_1956;
    float _1978 = _1976 ? _215 : as_type<float>(_1870);
    int _1980 = int(_1758) + int(_1882);
    bool _1982 = uint(_1972) > 1u;
    int _1984 = int(_1790) + int(_1906);
    float _1986 = _974 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1988 = ~_877;
    int _1990 = _1988 + 1;
    int _1992 = _1950 & 3;
    bool _1994 = _1992 != 0;
    int _1996 = ~_839;
    int _1998 = _1996 + 1;
    int _2000 = _1990 * _1984;
    int _2002 = _2000 + _1738;
    int _2004 = _1994 ? 0 : 1;
    int _2006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2008 = _2006 != 0;
    int _2010 = _1998 * _1980;
    int _2012 = _2010 + _1294;
    float _2014 = float(uint(_1638));
    bool _2016 = !_2008;
    int _2018 = _2016 ? 0 : 1;
    bool _2020 = uint(_2002) >= uint(_877);
    float _2022 = as_type<float>(_1062) * _2014;
    int _2024 = ~_2004;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    int _2030 = _2028;
    if (!_1982)
    {
        int _2032 = ~_2004;
        int _2034 = _2032 + 1;
        _2030 = _2034;
    }
    int _2036 = _2030;
    float _2038 = trunc(_2022);
    float _2040 = precise::max(_2038, 0.0);
    uint _2042 = uint(_2040);
    bool _2044 = uint(_2012) >= uint(_839);
    bool _2046 = !_2020;
    int _2048 = _2046 ? 0 : (-1);
    bool _2050 = _1972 != 3;
    bool _2052 = !_2044;
    int _2054 = _2052 ? 0 : (-1);
    bool _2056 = uint(_1972) >= 2u;
    int _2058 = ~_1984;
    int _2060 = _2058 + _2048;
    int _2062 = _2060 + 1;
    int _2064 = ~_815;
    int _2066 = _2064 + 1;
    int _2068 = int(_1846) + int(_1962);
    int _2070 = _877 * _2062;
    int _2072 = _2070 + _1738;
    int _2074 = ~_877;
    int _2076 = _2074 + 1;
    int _2078 = _2056 ? 0 : 1;
    int _2080 = _2066 * _2068;
    int _2082 = _2080 + _1400;
    int _2084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2086 = _2084 != 0;
    int _2088 = ~_2078;
    int _2090 = _2088 + 1;
    int _2092 = _2090 + 1;
    int _2094 = _2092;
    float _2096 = as_type<float>(_2076);
    int _2098 = _2036;
    if (_2050)
    {
        int _2100 = ~_2078;
        int _2102 = _2100 + 1;
        _2094 = _2102;
    }
    int _2104 = _2094;
    int _2106 = _2076 * int(_2042);
    int _2108 = _2106 + _1638;
    int _2110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2112 = _2110 != 0;
    bool _2114 = !_2086;
    int _2116 = _2114 ? 0 : 1;
    bool _2118 = uint(_2082) >= uint(_815);
    bool _2120 = !_1578;
    int _2122 = _2120 ? _2072 : (-1);
    bool _2124 = !_2112;
    int _2126 = _2124 ? 0 : 1;
    bool _2128 = !_2118;
    int _2130 = _2128 ? 0 : (-1);
    int _2132 = _2122 & 3;
    bool _2134 = _2132 != 0;
    float _2136 = float(uint(_2108));
    int _2138 = _2122 & 3;
    bool _2140 = _2138 != 0;
    int _2142 = _2134 ? 0 : 1;
    float _2144 = as_type<float>(_1062) * _2136;
    bool _2146 = uint(_2138) > 1u;
    int _2148 = ~_2142;
    int _2150 = _2148 + 1;
    int _2152 = _2150 + 1;
    float _2154 = trunc(_2144);
    float _2156 = precise::max(_2154, 0.0);
    uint _2158 = uint(_2156);
    float _2160 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2162 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2164 = -_2160;
    float _2166 = fma(_1986, 2.0, _2164);
    int _2168 = _2152;
    float _2170 = as_type<float>(_2042);
    if (!_2146)
    {
        int _2172 = ~_2142;
        int _2174 = _2172 + 1;
        _2168 = _2174;
    }
    int _2176 = _2168;
    float _2178 = fma(_1488, -2.0, _2162);
    bool _2180 = uint(_2138) >= 2u;
    float _2182 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _2184 = ~_877;
    int _2186 = _2184 + 1;
    float _2188 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2190 = _2180 ? 0 : 1;
    float _2192 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _2194 = _2138 != 3;
    float _2196 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2188);
    int _2198 = int(_2042) + int(_2158);
    float _2200 = _984 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _2202 = ~_2190;
    int _2204 = _2202 + 1;
    int _2206 = _2204 + 1;
    float _2208 = -_127;
    float _2210 = fma(_2208, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2166);
    int _2212 = _2186 * _2198;
    int _2214 = _2212 + _1638;
    float _2216 = fma(_2200, -2.0, _2192);
    float _2218 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2220 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2196);
    int _2222 = _2206;
    float _2224 = as_type<float>(_2214);
    if (_2194)
    {
        int _2226 = ~_2190;
        int _2228 = _2226 + 1;
        _2222 = _2228;
    }
    int _2230 = _2222;
    float _2232 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2234 = uint(_2214) >= uint(_877);
    float _2236 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2238 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2178);
    bool _2240 = !_2234;
    int _2242 = _2240 ? 0 : (-1);
    float _2244 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2216);
    bool _2246 = _974 > 0.5;
    float _2248 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2250 = -_205;
    int _2252 = _2246 ? as_type<int>(_2250) : as_type<int>(_205);
    bool _2254 = _986 != 1;
    float _2256 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2258 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2260 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2262 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2264 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2266 = _2264 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    if (!_2254)
    {
        _2170 = _982;
    }
    float _2268 = _2170;
    float _2270 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2272 = _2270 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2274 = 0.0;
    float _2276 = _2268;
    if (!_2254)
    {
        _2274 = _982;
    }
    float _2278 = _2274;
    float _2280 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2260);
    float _2282 = _2278;
    if (!_2254)
    {
        _1592 = _1000;
    }
    float _2284 = _1592;
    float _2286 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2262);
    float _2288 = _2284;
    if (!_2254)
    {
        _1934 = _1000;
    }
    float _2290 = _1934;
    float _2292 = 1.0 / _2266;
    float _2294 = _2290;
    if (_2254)
    {
        _2276 = _974;
    }
    float _2296 = _2276;
    float _2298 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2300 = _2298 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    if (_2254)
    {
        _2282 = _974;
    }
    float _2302 = _2282;
    if (_2254)
    {
        _2288 = _982;
    }
    float _2304 = _2288;
    float _2306 = _2296 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2254)
    {
        _2294 = _982;
    }
    float _2308 = _2294;
    float _2310 = 1.0 / _2272;
    bool _2312 = _988 != 2;
    float _2314 = -_2232;
    float _2316 = fma(_2306, 2.0, _2314);
    float _2318 = _2304 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2320 = fma(_2308, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2256);
    float _2322 = -_127;
    float _2324 = fma(_2322, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2316);
    float _2326 = fma(_2318, -2.0, _2248);
    float _2328 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2330 = _2328 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2332 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2320);
    float _2334 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2326);
    float _2336 = 1.0 / _2300;
    if (_2312)
    {
        _2224 = _974;
    }
    float _2338 = _2224;
    float _2340 = -_2332;
    float _2342 = _2340 + 1.0;
    float _2344 = _2338;
    if (_2312)
    {
        _2096 = _982;
    }
    float _2346 = _2096;
    float _2348 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2350 = _2348 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2352 = _2346;
    if (!_2312)
    {
        _2344 = _1000;
    }
    float _2354 = _2344;
    if (!_2312)
    {
        _2352 = _974;
    }
    float _2356 = _2352;
    float _2358 = 1.0 / _2330;
    int _2360 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2362 = _2360 != 0;
    float _2364 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2218);
    float _2366 = _990 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2368 = _2354 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2370 = !_2362;
    float _2372 = _2370 ? _205 : as_type<float>(_2252);
    float _2374 = _2356 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2376 = -_2182;
    float _2378 = fma(_2366, 2.0, _2376);
    float _2380 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2382 = log2(_2380);
    float _2384 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2386 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2388 = isnan(0.0);
    bool _2390 = _2386 || _2388;
    bool _2392 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2394 = _2390 || _2392;
    float _2396 = -_2236;
    float _2398 = fma(_2368, 2.0, _2396);
    float _2400 = fma(_2302, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2384);
    float _2402 = fma(_2374, -2.0, _2258);
    float _2404 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2406 = -_127;
    float _2408 = fma(_2406, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2378);
    float _2410 = _982 * 2.0;
    float _2412 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2280);
    float _2414 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2416 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2404);
    float _2418 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2364);
    float _2420 = _2382 * _127;
    float _2422 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2414);
    float _2424 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2416);
    float _2426 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2286);
    float _2428 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2400);
    float _2430 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2422);
    float _2432 = exp2(_2420);
    float _2434 = -_127;
    float _2436 = fma(_2434, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2398);
    float _2438 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2402);
    float _2440 = _982 + _974;
    float _2442 = -_2418;
    float _2444 = _2442 + 1.0;
    int _2446 = ~_2068;
    int _2448 = _2446 + _2130;
    int _2450 = _2448 + 1;
    float _2452 = floor(_2410);
    float _2454 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2456 = _2454 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2458 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2460 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2458;
    float _2462 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2464 = _2462 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2466 = _815 * _2450;
    int _2468 = _2466 + _1400;
    bool _2470 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2472 = isnan(_797);
    bool _2474 = _2470 || _2472;
    bool _2476 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2478 = _2474 || _2476;
    float _2480 = float(_2478);
    float _2482 = _2460 * _2310;
    float _2484 = _1000 * 2.0;
    float _2486 = -_2432;
    float _2488 = _2486 + 1.0;
    float _2490 = 1.0 / _2350;
    float _2492 = in.m_50.x;
    float _2494 = in.m_50.y;
    float _2496 = in.m_50.z;
    float _2498 = _2440 + (-1.0);
    float _2500 = _2394 ? _2488 : 0.0;
    float _2502 = -_2424;
    float _2504 = _2502 + 1.0;
    bool _2506 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2508 = isnan(1.0);
    bool _2510 = _2506 || _2508;
    bool _2512 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2514 = _2510 || _2512;
    float _2516 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2518 = 1.0 + _2516;
    float _2520 = floor(_2484);
    float _2522 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2524 = _2522 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _2526 = _1950 >> 31;
    float _2528 = -_2430;
    float _2530 = _2528 + 1.0;
    int _2532 = ~_1980;
    int _2534 = _2532 + _2054;
    int _2536 = _2534 + 1;
    float _2538 = -_2426;
    float _2540 = _2538 + 1.0;
    int _2542 = _2526 & 3;
    float _2544 = 1.0 / _2518;
    float _2546 = _2464 * _2490;
    int _2548 = _839 * _2536;
    int _2550 = _2548 + _1294;
    int _2552 = _1950 + _2542;
    int _2554 = abs(_2230);
    float _2556 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2558 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2556;
    float _2560 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2562 = _797 + _2560;
    float _2564 = _2494 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2566 = 1.0 / _2524;
    int _2568 = _2552 >> 2;
    float _2570 = fma(_2492, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2564);
    bool _2572 = !_1974;
    int _2574 = _2572 ? 0 : 1;
    if (_2514)
    {
        float _2576 = _2500 * _2544;
        _137 = _2576;
    }
    float _2578 = _137;
    bool _2580 = _1262 >= 0.0;
    bool _2582 = isnan(_1262);
    bool _2584 = _2580 || _2582;
    bool _2586 = isnan(0.0);
    bool _2588 = _2584 || _2586;
    float _2590 = _2494 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2592 = _2494 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _2594 = _2588 ? 0 : 1;
    float _2596 = fma(_2492, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2590);
    bool _2598 = _1262 > 0.0;
    float _2600 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2602 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2600;
    float _2604 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2606 = _2604 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2608 = fma(_2492, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2592);
    float _2610 = fma(_2496, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2596);
    float _2612 = _2602 * _2292;
    float _2614 = _2606 * _2358;
    float _2616 = 1.0 / _2456;
    int _2618 = ~_2594;
    int _2620 = _2618 + 1;
    int _2622 = _2620 + 1;
    float _2624 = fma(_2612, _2562, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2626 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2628 = isnan(_797);
    bool _2630 = _2626 || _2628;
    bool _2632 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2634 = _2630 || _2632;
    float _2636 = float(_2634);
    float _2638 = _2610 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2640 = _2568 << 4;
    int _2642 = _2640 + 656;
    float _2644 = _2558 * _2566;
    int _2646 = _2622;
    if (!_2598)
    {
        int _2648 = ~_2594;
        int _2650 = _2648 + 1;
        _2646 = _2650;
    }
    int _2652 = _2646;
    float _2654 = -_2636;
    float _2656 = _2654 + 1.0;
    bool _2658 = _2452 >= 0.0;
    bool _2660 = isnan(_2452);
    bool _2662 = _2658 || _2660;
    bool _2664 = isnan(0.0);
    bool _2666 = _2662 || _2664;
    bool _2668 = !_1340;
    int _2670 = _2668 ? _2468 : (-1);
    int _2672 = _2666 ? 0 : 1;
    bool _2674 = _2452 > 0.0;
    float _2676 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2678 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2676;
    float _2680 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2682 = _2680 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _2684 = ~_2672;
    int _2686 = _2684 + 1;
    int _2688 = _2686 + 1;
    float _2690 = _2678 * _2336;
    bool _2692 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2694 = isnan(_797);
    bool _2696 = _2692 || _2694;
    bool _2698 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2700 = _2696 || _2698;
    float _2702 = float(_2700);
    float _2704 = _2682 * _2616;
    bool _2706 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2708 = isnan(_797);
    bool _2710 = _2706 || _2708;
    bool _2712 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2714 = _2710 || _2712;
    float _2716 = float(_2714);
    bool _2718 = !_1804;
    int _2720 = _2718 ? 0 : 1;
    float _2722 = -_2702;
    float _2724 = _2722 + 1.0;
    int _2726 = abs(_2574);
    float _2728 = -_2716;
    float _2730 = _2728 + 1.0;
    int _2732 = _2688;
    if (!_2674)
    {
        int _2734 = ~_2672;
        int _2736 = _2734 + 1;
        _2732 = _2736;
    }
    int _2738 = _2732;
    float _2740 = _2480 * _2724;
    int _2742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2744 = _2742 != 0;
    int _2746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2748 = _2746 != 0;
    int _2750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2752 = _2750 != 0;
    float _2754 = -_2480;
    float _2756 = _2754 + 1.0;
    bool _2758 = _2520 >= 0.0;
    bool _2760 = isnan(_2520);
    bool _2762 = _2758 || _2760;
    bool _2764 = isnan(0.0);
    bool _2766 = _2762 || _2764;
    float _2768 = _2702 * _2730;
    bool _2770 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2772 = isnan(_797);
    bool _2774 = _2770 || _2772;
    bool _2776 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2778 = _2774 || _2776;
    float _2780 = float(_2778);
    int _2782 = _2766 ? 0 : 1;
    bool _2784 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2786 = isnan(_797);
    bool _2788 = _2784 || _2786;
    bool _2790 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2792 = _2788 || _2790;
    float _2794 = float(_2792);
    float _2796 = -_2780;
    float _2798 = _2796 + 1.0;
    bool _2800 = _2520 > 0.0;
    float _2802 = _2780 * _2756;
    float _2804 = fma(_2496, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2570);
    float _2806 = fma(_2496, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2608);
    float _2808 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2810 = _797 + _2808;
    float _2812 = _2794 * _2798;
    float _2814 = -_2794;
    float _2816 = _2814 + 1.0;
    bool _2818 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2820 = isnan(_797);
    bool _2822 = _2818 || _2820;
    bool _2824 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2826 = _2822 || _2824;
    float _2828 = float(_2826);
    float _2830 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2832 = _797 + _2830;
    float _2834 = fma(_2614, _2810, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2836 = _2636 * _2816;
    bool _2838 = _797 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2840 = isnan(_797);
    bool _2842 = _2838 || _2840;
    bool _2844 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2846 = _2842 || _2844;
    float _2848 = float(_2846);
    float _2850 = fma(_2482, _2832, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2852 = -_2828;
    float _2854 = _2852 + 1.0;
    float _2856 = _2828 * _2656;
    float _2858 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2860 = _797 + _2858;
    float _2862 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2864 = _797 + _2862;
    float _2866 = _2848 * _2854;
    float _2868 = -_2848;
    float _2870 = _2868 + 1.0;
    float _2872 = fma(_2546, _2860, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2874 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2876 = _797 + _2874;
    float _2878 = _2624 * _2866;
    float _2880 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2882 = _797 + _2880;
    float _2884 = _2804 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2886 = fma(_2704, _2876, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2888 = fma(_2870, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2878);
    float _2890 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2892 = _2638 + _2890;
    uint _2894 = uint(int(uint(_2642) >> uint(2)));
    uint _2896 = uint(int(uint(int(_2894)) >> uint(2)));
    int _2898 = int(_2894) & 3;
    float _2900 = (*spvDescriptorSet0.vp_c9)._m0[int(_2896)][_2898];
    int _2902 = int(_2894) + 1;
    uint _2904 = uint(int(uint(_2902) >> uint(2)));
    int _2906 = _2902 & 3;
    float _2908 = (*spvDescriptorSet0.vp_c9)._m0[int(_2904)][_2906];
    float _2910 = fma(_2644, _2882, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2912 = fma(_2834, _2856, _2888);
    float _2914 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2916 = _2884 + _2914;
    float _2918 = _2892 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2920 = _2806 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _2922 = _1972 != 3;
    float _2924 = fma(_2850, _2836, _2912);
    float _2926 = fma(_2916, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2918);
    float _2928 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2930 = _2920 + _2928;
    int _2932 = ~_2782;
    int _2934 = _2932 + 1;
    int _2936 = _2934 + 1;
    float _2938 = _974 + _1000;
    int _2940 = _2936;
    float _2942 = _2740;
    if (!_2800)
    {
        int _2944 = ~_2782;
        int _2946 = _2944 + 1;
        _2940 = _2946;
    }
    int _2948 = _2940;
    float _2950 = _974 + (-0.5);
    float _2952 = fma(_2930, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2926);
    float _2954 = fma(_2690, _2864, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2956 = _2642 + 8;
    uint _2958 = uint(int(uint(_2956) >> uint(2)));
    uint _2960 = uint(int(uint(int(_2958)) >> uint(2)));
    int _2962 = int(_2958) & 3;
    float _2964 = (*spvDescriptorSet0.vp_c9)._m0[int(_2960)][_2962];
    int _2966 = int(_2958) + 1;
    uint _2968 = uint(int(uint(_2966) >> uint(2)));
    int _2970 = _2966 & 3;
    float _2972 = (*spvDescriptorSet0.vp_c9)._m0[int(_2968)][_2970];
    bool _2974 = !_2922;
    int _2976 = _2974 ? 0 : (-1);
    float _2978 = fma(_2872, _2812, _2924);
    bool _2980 = _2952 >= 0.0;
    float _2982 = _982 + _1000;
    float _2984 = _982 + (-0.5);
    float _2986 = fma(_2954, _2802, _2978);
    float _2988 = _1970 + (-0.5);
    float _2990 = _1784 + 0.5;
    float _2992 = fma(_2886, _2740, _2986);
    int _2994 = abs(_2036);
    float _2996 = -_2988;
    float _2998 = -_2244;
    float _3000 = fma(_2996, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2998);
    float _3002 = fma(_2498, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3004 = _2372 + 0.5;
    float _3006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_2980)
    {
        _2942 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3008 = _2942;
    float _3010 = _1978 + (-0.5);
    int _3012 = ~_2994;
    int _3014 = _3012 + 1;
    int _3016 = _3014 + 1;
    float _3018 = fma(_3004, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2210);
    float _3020 = fma(_2990, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2408);
    float _3022 = -_3010;
    float _3024 = -_2238;
    float _3026 = fma(_3022, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3024);
    if (_2980)
    {
        float _3028 = _3008 * 5.0;
        _2098 = as_type<int>(_3028);
    }
    int _3030 = _2098;
    float _3032 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3034 = int(_3032);
    float _3036 = fma(_2910, _2768, _2992);
    int _3038 = abs(_2104);
    float _3040 = -_2444;
    float _3042 = fma(_3040, _1784, _3020);
    if (_2980)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9632 = as_type<float>(_3030);
        out.gl_Position.z = _9632;
    }
    float _3044 = -_2220;
    float _3046 = _3044 + 1.0;
    float _3048 = fma(_2716, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3036);
    float _3050 = _3006 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3052 = _3016 * as_type<int>(_2908);
    float _3054 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3056 = fma(_3046, _1970, _3000);
    bool _3058 = !_2744;
    int _3060 = _3058 ? 0 : 1;
    out.m_72.x = _3048;
    int _3062 = ~_2726;
    int _3064 = _3062 + 1;
    int _3066 = _3064 + 1;
    float _3068 = _1742 + 0.5;
    float _3070 = _1502 + (-0.5);
    int _3072 = _3066 * as_type<int>(_2900);
    int _3074 = _3072 + _3052;
    int _3076 = ~_3038;
    int _3078 = _3076 + 1;
    int _3080 = _3078 + 1;
    float _3082 = fma(_3050, _3068, _2324);
    int _3084 = abs(_2976);
    float _3086 = _2892 * _2892;
    out.m_74.x = _3042;
    out.m_74.y = _3056;
    int _3088 = _3080 * as_type<int>(_2964);
    int _3090 = _3088 + _3074;
    float _3092 = float(uint(_3034));
    float _3094 = fma(_2916, _2916, _3086);
    int _3096 = abs(_2116);
    float _3098 = _3054 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3100 = ~_3084;
    int _3102 = _3100 + 1;
    int _3104 = _3102 + 1;
    if (_2980)
    {
        out.m_57.x = 0.0;
    }
    float _3106 = 1.0 / _3092;
    int _3108 = ~_3096;
    int _3110 = _3108 + 1;
    int _3112 = _3110 + 1;
    float _3114 = -_3098;
    float _3116 = -_2334;
    float _3118 = fma(_3114, _3070, _3116);
    int _3120 = _3104 * as_type<int>(_2972);
    int _3122 = _3120 + _3090;
    float _3124 = fma(_2930, _2930, _3094);
    int _3126 = abs(_3034);
    float _3128 = _557 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _3130 = _3122 * _3112;
    float _3132 = rsqrt(_3124);
    int _3134 = _1770 >> 31;
    int _3136 = _2670 * _3096;
    int _3138 = _3136 + _3130;
    float _3140 = float(uint(_3126));
    int _3142 = _3134 & 3;
    int _3144 = as_type<int>(_3106) + (-2);
    float _3146 = float(uint(_3138));
    float _3148 = 1.0 / _3140;
    int _3150 = _1770 + _3142;
    float _3152 = _3128 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3154 = _2122 >> 31;
    float _3156 = as_type<float>(_3144) * _3146;
    int _3158 = abs(_3060);
    float _3160 = _3152 * _3132;
    int _3162 = _3154 & 3;
    int _3164 = ~_3034;
    int _3166 = _3164 + 1;
    float _3168 = trunc(_3156);
    float _3170 = precise::max(_3168, 0.0);
    uint _3172 = uint(_3170);
    float _3174 = _2916 * _3160;
    int _3176 = _2122 + _3162;
    float _3178 = _2892 * _3160;
    float _3180 = float(_2948);
    float _3182 = -_3174;
    float _3184 = _2916 + _3182;
    int _3186 = _3150 >> 2;
    float _3188 = -_3178;
    float _3190 = _2892 + _3188;
    int _3192 = abs(_3138);
    float _3194 = in.m_76.x;
    float _3196 = in.m_76.y;
    float _3198 = in.m_76.z;
    int _3200 = _3186 << 4;
    int _3202 = _3200 + 368;
    float _3204 = _3190 * _3190;
    int _3206 = _3176 >> 2;
    float _3208 = fma(_3184, _3184, _3204);
    int _3210 = as_type<int>(_3148) + (-2);
    int _3212 = _3166 * int(_3172);
    int _3214 = _3212 + _3138;
    float _3216 = float(uint(_3192));
    uint _3218 = uint(int(uint(_3202) >> uint(2)));
    uint _3220 = uint(int(uint(int(_3218)) >> uint(2)));
    int _3222 = int(_3218) & 3;
    float _3224 = (*spvDescriptorSet0.vp_c9)._m0[int(_3220)][_3222];
    int _3226 = int(_3218) + 1;
    uint _3228 = uint(int(uint(_3226) >> uint(2)));
    int _3230 = _3226 & 3;
    float _3232 = (*spvDescriptorSet0.vp_c9)._m0[int(_3228)][_3230];
    float _3234 = float(_3158);
    int _3236 = _3206 << 4;
    int _3238 = _3236 + 800;
    float _3240 = as_type<float>(_3210) * _3216;
    float _3242 = float(uint(_3214));
    float _3244 = _3234 * _3180;
    float _3246 = -_2412;
    float _3248 = _3246 + 1.0;
    uint _3250 = uint(int(uint(_3238) >> uint(2)));
    uint _3252 = uint(int(uint(int(_3250)) >> uint(2)));
    int _3254 = int(_3250) & 3;
    float _3256 = (*spvDescriptorSet0.vp_c9)._m0[int(_3252)][_3254];
    int _3258 = int(_3250) + 1;
    uint _3260 = uint(int(uint(_3258) >> uint(2)));
    int _3262 = _3258 & 3;
    float _3264 = (*spvDescriptorSet0.vp_c9)._m0[int(_3260)][_3262];
    float _3266 = trunc(_3240);
    float _3268 = precise::max(_3266, 0.0);
    uint _3270 = uint(_3268);
    float _3272 = -_2428;
    float _3274 = _3272 + 1.0;
    float _3276 = fma(_1978, _3248, _3026);
    float _3278 = as_type<float>(_3144) * _3242;
    float _3280 = _2930 * _3160;
    float _3282 = -_2504;
    float _3284 = fma(_2372, _3282, _3018);
    float _3286 = -_3274;
    float _3288 = fma(_1742, _3286, _3082);
    float _3290 = fma(_1502, _2342, _3118);
    int _3292 = ~_3126;
    int _3294 = _3292 + 1;
    float _3296 = _3244 * (-2.0);
    float _3298 = trunc(_3278);
    float _3300 = precise::max(_3298, 0.0);
    uint _3302 = uint(_3300);
    int _3304 = abs(_2720);
    out.m_78.x = _3284;
    out.m_78.y = _3276;
    out.m_78.z = _3288;
    out.m_78.w = _3290;
    float _3306 = fma(_3296, _3194, _3194);
    int _3308 = ~_2198;
    int _3310 = _3308 + _2242;
    int _3312 = _3310 + 1;
    float _3314 = -_3280;
    float _3316 = _2930 + _3314;
    int _3318 = _3294 * int(_3270);
    int _3320 = _3318 + _3192;
    float _3322 = fma(_2950, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3306);
    int _3324 = abs(_2018);
    int _3326 = _3202 + 8;
    uint _3328 = uint(int(uint(_3326) >> uint(2)));
    uint _3330 = uint(int(uint(int(_3328)) >> uint(2)));
    int _3332 = int(_3328) & 3;
    float _3334 = (*spvDescriptorSet0.vp_c9)._m0[int(_3330)][_3332];
    int _3336 = int(_3328) + 1;
    uint _3338 = uint(int(uint(_3336) >> uint(2)));
    int _3340 = _3336 & 3;
    float _3342 = (*spvDescriptorSet0.vp_c9)._m0[int(_3338)][_3340];
    int _3344 = _877 * _3312;
    int _3346 = _3344 + _1638;
    int _3348 = abs(_2126);
    float _3350 = fma(_3002, _3296, _3002);
    float _3352 = fma(_3316, _3316, _3208);
    float _3354 = fma(_3350, _2578, _3322);
    int _3356 = _3238 + 8;
    uint _3358 = uint(int(uint(_3356) >> uint(2)));
    uint _3360 = uint(int(uint(int(_3358)) >> uint(2)));
    int _3362 = int(_3358) & 3;
    float _3364 = (*spvDescriptorSet0.vp_c9)._m0[int(_3360)][_3362];
    int _3366 = int(_3358) + 1;
    uint _3368 = uint(int(uint(_3366) >> uint(2)));
    int _3370 = _3366 & 3;
    float _3372 = (*spvDescriptorSet0.vp_c9)._m0[int(_3368)][_3370];
    float _3374 = float(uint(_3320));
    int _3376 = abs(_1862);
    int _3378 = int(_3172) + int(_3302);
    float _3380 = as_type<float>(_3210) * _3374;
    int _3382 = ~_3034;
    int _3384 = _3382 + 1;
    int _3386 = ~_3376;
    int _3388 = _3386 + 1;
    int _3390 = _3388 + 1;
    bool _3392 = !_2140;
    int _3394 = _3392 ? 0 : 1;
    float _3396 = trunc(_3380);
    float _3398 = precise::max(_3396, 0.0);
    uint _3400 = uint(_3398);
    int _3402 = abs(_2176);
    int _3404 = _3384 * _3378;
    int _3406 = _3404 + _3138;
    bool _3408 = _1802 != 3;
    int _3410 = _3390 * as_type<int>(_3232);
    int _3412 = ~_3402;
    int _3414 = _3412 + 1;
    int _3416 = _3414 + 1;
    bool _3418 = !_3408;
    int _3420 = _3418 ? 0 : (-1);
    bool _3422 = uint(_3406) >= uint(_3034);
    int _3424 = _3416 * as_type<int>(_3264);
    int _3426 = abs(_3394);
    int _3428 = ~_3304;
    int _3430 = _3428 + 1;
    int _3432 = _3430 + 1;
    int _3434 = ~_3126;
    int _3436 = _3434 + 1;
    int _3438 = int(_3270) + int(_3400);
    int _3440 = _3432 * as_type<int>(_3224);
    int _3442 = _3440 + _3410;
    bool _3444 = !_3422;
    int _3446 = _3444 ? 0 : (-1);
    bool _3448 = _2138 != 3;
    int _3450 = _3436 * _3438;
    int _3452 = _3450 + _3192;
    int _3454 = ~_3378;
    int _3456 = _3454 + _3446;
    int _3458 = _3456 + 1;
    int _3460 = abs(_1940);
    int _3462 = ~_3426;
    int _3464 = _3462 + 1;
    int _3466 = _3464 + 1;
    int _3468 = _3034 * _3458;
    int _3470 = _3468 + _3138;
    bool _3472 = !_3448;
    int _3474 = _3472 ? 0 : (-1);
    bool _3476 = uint(_3452) >= uint(_3126);
    int _3478 = _3466 * as_type<int>(_3256);
    int _3480 = _3478 + _3424;
    int _3482 = ~_3460;
    int _3484 = _3482 + 1;
    int _3486 = _3484 + 1;
    float _3488 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3490 = ~_2554;
    int _3492 = _3490 + 1;
    int _3494 = _3492 + 1;
    int _3496 = _3138 ^ _3034;
    int _3498 = _3486 * as_type<int>(_3334);
    int _3500 = _3498 + _3442;
    bool _3502 = !_3476;
    int _3504 = _3502 ? 0 : (-1);
    int _3506 = _3494 * as_type<int>(_3364);
    int _3508 = _3506 + _3480;
    int _3510 = abs(_3420);
    float _3512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    uint _3514 = uint(int(uint(_3496) >> uint(31)));
    int _3516 = abs(_3474);
    int _3518 = ~_3504;
    int _3520 = _3438 + _3518;
    int _3522 = _3520 + 1;
    int _3524 = ~_3510;
    int _3526 = _3524 + 1;
    int _3528 = _3526 + 1;
    float _3530 = _3488 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3532 = ~int(_3514);
    int _3534 = _3532 + 1;
    int _3536 = ~_3516;
    int _3538 = _3536 + 1;
    int _3540 = _3538 + 1;
    int _3542 = _3528 * as_type<int>(_3342);
    int _3544 = _3542 + _3500;
    bool _3546 = _3034 == 0;
    int _3548 = _3522 ^ _3534;
    int _3550 = _3540 * as_type<int>(_3372);
    int _3552 = _3550 + _3508;
    int _3554 = ~_3348;
    int _3556 = _3554 + 1;
    int _3558 = _3556 + 1;
    bool _3560 = !_3546;
    int _3562 = _3560 ? _3470 : (-1);
    bool _3564 = _3034 == 0;
    int _3566 = _3552 * _3558;
    int _3568 = ~_3534;
    int _3570 = _3568 + _3548;
    int _3572 = _3570 + 1;
    int _3574 = ~_3324;
    int _3576 = _3574 + 1;
    int _3578 = _3576 + 1;
    bool _3580 = _839 == 0;
    bool _3582 = !_3564;
    int _3584 = _3582 ? _3572 : (-1);
    int _3586 = _3544 * _3578;
    bool _3588 = !_3580;
    int _3590 = _3588 ? _2550 : (-1);
    float _3592 = _1192 + (-0.5);
    float _3594 = float(_3562);
    float _3596 = float(_3584);
    float _3598 = _3512 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3600 = _3590 * _3324;
    int _3602 = _3600 + _3586;
    float _3604 = fma(_3530, _3594, _2436);
    bool _3606 = !_1578;
    int _3608 = _3606 ? _3346 : (-1);
    float _3610 = -_2438;
    float _3612 = fma(_3598, _3596, _3610);
    bool _3614 = !_2748;
    int _3616 = _3614 ? 0 : 1;
    float _3618 = _1162 + 0.5;
    int _3620 = _3608 * _3348;
    int _3622 = _3620 + _3566;
    int _3624 = abs(_3616);
    float _3626 = fma(_3530, _3618, _3604);
    float _3628 = -_3598;
    float _3630 = fma(_3628, _3592, _3612);
    float _3632 = float(_3602);
    float _3634 = -_2530;
    float _3636 = fma(_1162, _3634, _3626);
    float _3638 = float(_3622);
    float _3640 = fma(_1192, _2540, _3630);
    float _3642 = float(_2652);
    out.m_80.x = _3632;
    float _3644 = float(_3624);
    out.m_80.w = _3638;
    bool _3646 = !_2752;
    int _3648 = _3646 ? 0 : 1;
    float _3650 = _3644 * _3642;
    out.m_82.x = _3636;
    out.m_82.y = _3640;
    float _3652 = _3198;
    if (_2980)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3654 = -_3178;
    float _3656 = _2638 + _3654;
    float _3658 = -_3174;
    float _3660 = _2884 + _3658;
    float _3662 = -_3280;
    float _3664 = _2920 + _3662;
    int _3666 = abs(_3648);
    float _3668 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3670 = _3656 + _3668;
    float _3672 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3674 = _3660 + _3672;
    float _3676 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3678 = _3664 + _3676;
    float _3680 = _2982 + (-1.0);
    float _3682 = _3670 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3684 = _3650 * (-2.0);
    float _3686 = float(_2738);
    float _3688 = fma(_3680, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3690 = fma(_3674, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3682);
    float _3692 = float(_3666);
    float _3694 = fma(_3684, _3196, _3196);
    float _3696 = fma(_3688, _3684, _3688);
    float _3698 = fma(_3678, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3690);
    float _3700 = _2938 + (-1.0);
    float _3702 = fma(_2984, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3694);
    float _3704 = _3692 * _3686;
    float _3706 = _3354 * 0.15915493667125701904296875;
    bool _3708 = _3698 >= 0.0;
    float _3710 = fma(_3696, _2578, _3702);
    float _3712 = _3704 * (-2.0);
    float _3714 = fma(_3700, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3716 = sqrt(_3352);
    float _3718 = _3710 * 0.15915493667125701904296875;
    float _3720 = fma(_3712, _3198, _3198);
    float _3722 = _1000 + (-0.5);
    float _3724 = fma(_3714, _3712, _3714);
    float _3726 = fma(_3722, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3720);
    float _3728 = _3706 * 6.283185482025146484375;
    float _3730 = sin(_3728);
    float _3732 = _3670;
    float _3734 = _3660;
    if (_3708)
    {
        _3652 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3736 = _3652;
    int _3738 = as_type<int>(_3736);
    if (_3708)
    {
        out.m_57.x = 0.0;
    }
    float _3740 = fma(_3724, _2578, _3726);
    if (_3708)
    {
        float _3742 = _3736 * 5.0;
        _3738 = as_type<int>(_3742);
    }
    int _3744 = _3738;
    float _3746 = _3740 * 0.15915493667125701904296875;
    float _3748 = _3706 * 6.283185482025146484375;
    float _3750 = cos(_3748);
    if (_3708)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10652 = as_type<float>(_3744);
        out.gl_Position.z = _10652;
    }
    float _3752 = _3718 * 6.283185482025146484375;
    float _3754 = sin(_3752);
    float _3756 = _3718 * 6.283185482025146484375;
    float _3758 = cos(_3756);
    if (_3708)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3760 = _3746 * 6.283185482025146484375;
    float _3762 = cos(_3760);
    float _3764 = _3132 * _3716;
    float _3766 = _555 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3768 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _215);
    float _3770 = _3730 * _3754;
    float _3772 = _3128 * _3764;
    float _3774 = _3764 * _3766;
    float _3776 = _3750 * _3754;
    float _3778 = _3746 * 6.283185482025146484375;
    float _3780 = sin(_3778);
    float _3782 = _3730 * _3758;
    float _3784 = _3768 * _3774;
    float _3786 = _3750 * _3758;
    float _3788 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _205);
    float _3790 = _3750 * _3762;
    float _3792 = _3788 * _3772;
    float _3794 = _3730 * _3762;
    float _3796 = _3758 * _3762;
    float _3798 = _3790 * _3784;
    float _3800 = _3764 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3802 = _3800 * 0.5;
    float _3804 = _3754 * _3762;
    float _3806 = fma(_3780, _3786, _3770);
    float _3808 = -_3782;
    float _3810 = fma(_3780, _3776, _3808);
    float _3812 = -_3784;
    float _3814 = _3780 * _3812;
    float _3816 = -_3776;
    float _3818 = fma(_3780, _3782, _3816);
    float _3820 = fma(_3806, _3792, _3798);
    float _3822 = _3794 * _3784;
    float _3824 = fma(_3796, _3792, _3814);
    float _3826 = fma(_3780, _3770, _3786);
    float _3828 = fma(_3810, _3802, _3820);
    float _3830 = fma(_3818, _3792, _3822);
    float _3832 = fma(_3804, _3802, _3824);
    float _3834 = _3828 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3836 = _3828 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3838 = fma(_3826, _3802, _3830);
    float _3840 = _3828 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3842 = fma(_3832, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3834);
    float _3844 = fma(_3832, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3836);
    float _3846 = fma(_3832, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3840);
    float _3848 = fma(_3838, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3842);
    float _3850 = fma(_3838, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3844);
    float _3852 = fma(_3838, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3846);
    float _3854 = _3848 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3856 = _3850 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3858 = _2884 + _3854;
    float _3860 = _2920 + _3856;
    float _3862 = _3852 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3864 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3866 = _3858 + _3864;
    float _3868 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3870 = _3860 + _3868;
    float _3872 = _2638 + _3862;
    float _3874 = _3866 * _3866;
    float _3876 = _3870 * _3870;
    float _3878 = _3874 + _3876;
    float _3880 = sqrt(_3878);
    bool _3882 = _3880 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3884 = _3838;
    float _3886 = _3858;
    float _3888 = _3860;
    float _3890 = _3874;
    float _3892 = _3876;
    if (!_3882)
    {
        _3884 = _3872;
    }
    float _3894 = _3884;
    bool _3896 = !_3882;
    float _3898 = _3894;
    if (!_3896)
    {
        float _3900 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3902 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3904 = _3880 + _3902;
        float _3906 = rsqrt(_3878);
        float _3908 = _3904 * _3900;
        float _3910 = _3872 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3912 = _3908 * 0.15915493667125701904296875;
        float _3914 = _3912 * 6.283185482025146484375;
        float _3916 = sin(_3914);
        float _3918 = _3912 * 6.283185482025146484375;
        float _3920 = cos(_3918);
        float _3922 = fma(_3916, _3910, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3924 = _3906 * _3922;
        float _3926 = _3920 + (-1.0);
        float _3928 = fma(_3866, _3924, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3930 = fma(_3870, _3924, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3932 = _3926 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3934 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3936 = _3928 + _3934;
        float _3938 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3940 = _3930 + _3938;
        float _3942 = fma(_3872, _3920, _3932);
        float _3944 = _3936 * _3936;
        float _3946 = _3940 * _3940;
        _3886 = _3928;
        _3888 = _3930;
        _3898 = _3942;
        _3890 = _3944;
        _3892 = _3946;
    }
    float _3948 = _3886;
    float _3950 = _3888;
    float _3952 = _3898;
    float _3954 = _3890;
    float _3956 = _3892;
    float _3958 = fma(_3948, 6.2500002968590706586837768554688e-05, 0.5);
    float _3960 = fma(_3950, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _10989 = float2(_3958, _3960);
    float3 _3964 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_10989, float2(0.0), isnan(_10989)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_10989, float2(0.0), isnan(_10989)), level(0.0)).xyz;
    float _3966 = _3964.x;
    float _3968 = _3964.y;
    float _3970 = _3964.z;
    float _3972 = _3806 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3974 = _3806 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3976 = _3806 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3978 = _3790 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3980 = _3790 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3982 = _3790 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3984 = _215 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3986 = fma(_3796, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3972);
    float _3988 = fma(_3796, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3974);
    float _3990 = fma(_3796, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3976);
    float _3992 = -_3780;
    float _3994 = fma(_3992, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3978);
    float _3996 = -_3780;
    float _3998 = fma(_3996, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3980);
    float _4000 = -_3780;
    float _4002 = fma(_4000, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3982);
    float _4004 = fma(_3984, _3984, 1.0);
    float _4006 = _3810 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _4008 = _3810 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _4010 = _3810 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _4012 = fma(_3794, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3994);
    float _4014 = fma(_3804, (*spvDescriptorSet0.vp_c8)._m0[24].x, _4006);
    float _4016 = rsqrt(_4004);
    float _4018 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4020 = _3952 + _4018;
    float _4022 = fma(_3804, (*spvDescriptorSet0.vp_c8)._m0[25].x, _4008);
    float _4024 = fma(_3804, (*spvDescriptorSet0.vp_c8)._m0[26].x, _4010);
    float _4026 = fma(_3794, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3998);
    float _4028 = fma(_4020, _4020, _3954);
    float _4030 = fma(_3794, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4002);
    float _4032 = fma(_3826, (*spvDescriptorSet0.vp_c8)._m0[24].z, _4014);
    float _4034 = fma(_3826, (*spvDescriptorSet0.vp_c8)._m0[25].z, _4022);
    float _4036 = _4028 + _3956;
    float _4038 = fma(_3826, (*spvDescriptorSet0.vp_c8)._m0[26].z, _4024);
    float _4040 = fma(_3818, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3986);
    float _4042 = fma(_3818, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3988);
    float _4044 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4046 = _3984 * _4012;
    float _4048 = _3984 * _4026;
    float _4050 = _3984 * _4016;
    float _4052 = fma(_3818, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3990);
    float _4054 = _3984 * _4030;
    float _4056 = sqrt(_4036);
    float _4058 = -_4032;
    float _4060 = _4050 * _4058;
    float _4062 = -_4034;
    float _4064 = _4050 * _4062;
    float _4066 = -_4038;
    float _4068 = _4050 * _4066;
    float _4070 = fma(_4044, _4040, _4046);
    float _4072 = fma(_4044, _4042, _4048);
    float _4074 = fma(_4044, _4052, _4054);
    float _4076 = fma(_4016, _4012, _4060);
    float _4078 = fma(_4016, _4026, _4064);
    float _4080 = fma(_4016, _4030, _4068);
    float _4082 = _4032 + _4070;
    float _4084 = _4034 + _4072;
    float _4086 = _4038 + _4074;
    out.m_84.x = _4040;
    out.m_84.y = _4042;
    out.m_84.z = _4052;
    bool _4088 = _4056 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4090 = isnan(_4056);
    bool _4092 = _4088 || _4090;
    bool _4094 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4096 = _4092 || _4094;
    out.m_86.x = _4076;
    out.m_86.y = _4078;
    out.m_86.z = _4080;
    out.m_88.x = _4082;
    out.m_88.y = _4084;
    out.m_88.z = _4086;
    float _4098 = _4070;
    if (!_4096)
    {
        _4098 = 1.0;
    }
    float _4100 = _4098;
    out.m_90.x = _3966;
    out.m_90.y = _3968;
    out.m_90.z = _3970;
    bool _4102 = !_4096;
    float _4104 = _4100;
    if (!_4102)
    {
        bool _4106 = _4056 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4108 = isnan(_4056);
        bool _4110 = _4106 || _4108;
        bool _4112 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4114 = _4110 || _4112;
        if (!_4114)
        {
            float _4116 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4118 = _4056 + _4116;
            float _4120 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4122 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4120;
            float _4124 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4126 = _4124 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4128 = 1.0 / _4122;
            float _4130 = _4118 * _4128;
            float _4132 = fma(_4130, _4126, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4104 = _4132;
            _4134 = true;
        }
        else
        {
            bool _4136 = _4056 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4138 = isnan(_4056);
            bool _4140 = _4136 || _4138;
            bool _4142 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4144 = _4140 || _4142;
            if (!_4144)
            {
                float _4146 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4148 = _4056 + _4146;
                float _4150 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4152 = _4150 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4154 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4156 = _4154 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4158 = 1.0 / _4152;
                float _4160 = _4148 * _4158;
                float _4162 = fma(_4160, _4156, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4104 = _4162;
                _4134 = true;
            }
            else
            {
                _4104 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4134 = false;
    float _4164 = _4104;
    float _4166 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4168 = _3952 + _4166;
    float _4170 = _3656 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4172 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4174 = _3948 + _4172;
    float _4176 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4178 = _3950 + _4176;
    float _4180 = fma(_4168, _4164, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4182 = fma(_3660, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4170);
    float _4184 = fma(_4174, _4164, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4186 = fma(_4178, _4164, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4188 = -_2638;
    float _4190 = _4188 + _4180;
    float _4192 = fma(_3664, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4182);
    float _4194 = -_2884;
    float _4196 = _4194 + _4184;
    float _4198 = _3656 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4200 = _4190 * _4190;
    float _4202 = _4192 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4204 = -_2920;
    float _4206 = _4204 + _4186;
    float _4208 = fma(_3660, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4198);
    float _4210 = fma(_4196, _4196, _4200);
    float _4212 = 1.0 / _4202;
    float _4214 = fma(_3664, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4208);
    float _4216 = fma(_4206, _4206, _4210);
    float _4218 = _4214 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4220 = sqrt(_4216);
    float _4222 = _4218 + _4202;
    float _4224 = _4222 * _4212;
    float _4226 = _4224 * 0.5;
    float _4228 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4230 = fma(_4226, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4228);
    bool _4232 = _4220 > 0.0;
    float _4234 = 1.0 / _4230;
    bool _4236 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4238 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4240 = _4236 || _4238;
    bool _4242 = isnan(0.5);
    bool _4244 = _4240 || _4242;
    bool _4246 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4248 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4250 = _4246 || _4248;
    bool _4252 = isnan(0.5);
    bool _4254 = _4250 || _4252;
    float _4256 = _4226;
    float _4258 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4260 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4262 = _4190;
    if (!_4232)
    {
        _4256 = _4184;
    }
    float _4264 = _4256;
    float _4266 = _4264;
    float _4268 = _4264;
    if (!_4232)
    {
        _4258 = _4180;
    }
    float _4270 = _4258;
    float _4272 = _4270;
    if (!_4232)
    {
        _4260 = _4186;
    }
    float _4274 = _4260;
    bool _4276 = !_4232;
    float _4278 = _4274;
    float _4280 = _4234;
    if (!_4276)
    {
        float _4282 = _219 * _219;
        float _4284 = fma(_217, _217, _4282);
        float _4286 = fma(_221, _221, _4284);
        float _4288 = rsqrt(_4216);
        float _4290 = sqrt(_4286);
        float _4292 = _4196 * _4288;
        float _4294 = _4190 * _4288;
        float _4296 = _4206 * _4288;
        bool _4298 = _4290 > 0.0;
        float _4300 = _4290;
        float _4302 = _4288;
        _4262 = _4294;
        if (!_4298)
        {
            _4266 = _4184;
        }
        float _4304 = _4266;
        _4268 = _4304;
        if (!_4298)
        {
            _4300 = _4180;
        }
        float _4306 = _4300;
        _4272 = _4306;
        if (!_4298)
        {
            _4302 = _4186;
        }
        float _4308 = _4302;
        bool _4310 = !_4298;
        _4278 = _4308;
        if (!_4310)
        {
            float _4312 = rsqrt(_4286);
            float _4314 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4316 = _219 * _4312;
            float _4318 = _217 * _4312;
            float _4320 = _221 * _4312;
            float _4322 = _4294 * _4316;
            float _4324 = fma(_4292, _4318, _4322);
            float _4326 = _4314 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4328 = fma(_4296, _4320, _4324);
            float _4330 = _4328 * _4326;
            float _4332 = fma(_217, _4330, _4184);
            float _4334 = fma(_219, _4330, _4180);
            float _4336 = fma(_221, _4330, _4186);
            _4268 = _4332;
            _4272 = _4334;
            _4278 = _4336;
        }
    }
    float _4338 = _4268;
    float _4340 = _4272;
    float _4342 = _4278;
    float _4344 = _4262;
    float _4346 = -_3174;
    float _4348 = _4346 + _4338;
    float _4350 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4352 = _4234 * _4350;
    float _4354 = -_3178;
    float _4356 = _4354 + _4340;
    float _4358 = -_3280;
    float _4360 = _4358 + _4342;
    float _4362 = _4356;
    float _4364 = _4360;
    float _4366 = _4344;
    if (_4244)
    {
        _225 = 1.0;
    }
    float _4368 = _225;
    float _4370 = _4368;
    if (_4254)
    {
        _4280 = _4348;
    }
    float _4372 = _4280;
    float _4374 = _4372;
    if (!_4254)
    {
        float _4376 = _3670 * _3670;
        float _4378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4380 = -_2920;
        float _4382 = _4380 + _4342;
        float _4384 = -_2884;
        float _4386 = _4384 + _4338;
        float _4388 = fma(_3674, _3674, _4376);
        float _4390 = -_2638;
        float _4392 = _4390 + _4340;
        float _4394 = fma(_3678, _3678, _4388);
        float _4396 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4398 = sqrt(_4394);
        float _4400 = 1.0 / _3764;
        float _4402 = _4396 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4404 = precise::min(_4398, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4406 = _4404 * _4378;
        float _4408 = _4406 * _4400;
        float _4410 = _4402 * _4408;
        float _4412 = _4382 * _4408;
        float _4414 = fma(_4392, _4410, _3656);
        float _4416 = fma(_4386, _4410, _3660);
        float _4418 = fma(_4402, _4412, _3664);
        _4362 = _4414;
        _4374 = _4416;
        _4364 = _4418;
    }
    float _4420 = _4362;
    float _4422 = _4374;
    float _4424 = _4364;
    if (!_4244)
    {
        float _4426 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4428 = _4426 * 0.15915493667125701904296875;
        float _4430 = _4428 * 6.283185482025146484375;
        float _4432 = cos(_4430);
        float _4434 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4436 = _4434 * 0.15915493667125701904296875;
        float _4438 = _4428 * 6.283185482025146484375;
        float _4440 = sin(_4438);
        float _4442 = 1.0 / _4432;
        float _4444 = _4436 * 6.283185482025146484375;
        float _4446 = cos(_4444);
        float _4448 = _4440 * _4442;
        float _4450 = _4436 * 6.283185482025146484375;
        float _4452 = sin(_4450);
        float _4454 = _4446 * _4448;
        float _4456 = 1.0 / _4454;
        float _4458 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4460 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4458;
        float _4462 = 1.0 / _4460;
        float _4464 = _4452 * _4456;
        float _4466 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4468 = fma(_4352, _4464, _4466);
        float _4470 = _4468 * _4462;
        float _4472 = precise::clamp(_4470, 0.0, 1.0);
        _3732 = _4436;
        _4370 = _4472;
    }
    float _4474 = _3732;
    float _4476 = _4370;
    float _4478 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4480 = _4420 + _4478;
    float _4482 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4484 = _4422 + _4482;
    float _4486 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4488 = _4424 + _4486;
    float _4490 = _4480 * _4480;
    float _4492 = fma(_4484, _4484, _4490);
    float _4494 = fma(_3660, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4496 = fma(_4488, _4488, _4492);
    float _4498 = rsqrt(_4496);
    float _4500 = sqrt(_4496);
    float _4502 = _4498 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4504 = _4484 * _4502;
    float _4506 = _4488 * _4502;
    float _4508 = _4504 * _4504;
    float _4510 = _4506 * _4506;
    float _4512 = _4508 + _4510;
    float _4514 = sqrt(_4512);
    bool _4516 = _4514 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4518 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4520 = _4514 + _4518;
    float _4522 = _4498;
    float _4524 = _4520;
    float _4526 = _4480;
    if (_4516)
    {
        float _4528 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4522 = _4528;
    }
    float _4530 = _4522;
    float _4532 = _4530;
    if (_4516)
    {
        float _4534 = _4520 * _4530;
        _4524 = _4534;
    }
    float _4536 = _4524;
    if (_4516)
    {
        float _4538 = rsqrt(_4512);
        _4532 = _4538;
    }
    float _4540 = _4532;
    float _4542 = _4540;
    if (_4516)
    {
        float _4544 = _4536 * 0.15915493667125701904296875;
        _227 = _4544;
    }
    float _4546 = _227;
    float _4548 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4550 = _4488;
    if (_4516)
    {
        float _4552 = _4546 * 6.283185482025146484375;
        float _4554 = sin(_4552);
        _4550 = _4554;
    }
    float _4556 = _4550;
    float _4558 = precise::max(0.0, _4548);
    float _4560 = _4474;
    float _4562 = _4558;
    if (_4516)
    {
        float _4564 = _4546 * 6.283185482025146484375;
        float _4566 = cos(_4564);
        _4560 = _4566;
    }
    float _4568 = _4560;
    float _4570 = -_4502;
    float _4572 = -_4558;
    float _4574 = fma(_4480, _4570, _4572);
    if (_4516)
    {
        float _4576 = _4574 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4526 = _4576;
    }
    float _4578 = _4526;
    float _4580 = floor(_4494);
    float _4582 = _4556;
    float _4584 = _4578;
    if (_4516)
    {
        float _4586 = fma(_4556, _4578, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4582 = _4586;
    }
    float _4588 = _4582;
    float _4590 = _4588;
    if (!_4516)
    {
        _4584 = _4574;
    }
    float _4592 = _4584;
    float _4594 = _4592;
    if (_4516)
    {
        float _4596 = _4540 * _4588;
        _4366 = _4596;
    }
    float _4598 = _4366;
    if (!_4516)
    {
        _4542 = _4504;
    }
    float _4600 = _4542;
    float _4602 = _4600;
    if (_4516)
    {
        float _4604 = _4568 + (-1.0);
        _4562 = _4604;
    }
    float _4606 = _4562;
    float _4608 = _4606;
    if (_4516)
    {
        float _4610 = _4504 * _4598;
        _4602 = _4610;
    }
    float _4612 = _4602;
    if (!_4516)
    {
        _4590 = _4508;
    }
    float _4614 = _4590;
    float _4616 = _4614;
    if (_4516)
    {
        float _4618 = _4606 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3734 = _4618;
    }
    float _4620 = _3734;
    float _4622 = _4620;
    if (!_4516)
    {
        _4608 = _4506;
    }
    float _4624 = _4608;
    float _4626 = _4624;
    if (_4516)
    {
        float _4628 = _4506 * _4598;
        _4626 = _4628;
    }
    float _4630 = _4626;
    if (_4516)
    {
        float _4632 = _4612 * _4612;
        _4616 = _4632;
    }
    float _4634 = _4616;
    if (_4516)
    {
        float _4636 = fma(_4574, _4568, _4620);
        _4594 = _4636;
    }
    float _4638 = _4594;
    if (!_4516)
    {
        _4622 = _4510;
    }
    float _4640 = _4622;
    float _4642 = _4640;
    if (_4516)
    {
        float _4644 = _4630 * _4630;
        _4642 = _4644;
    }
    float _4646 = _4642;
    float _4648 = fma(_4638, _4638, _4634);
    float _4650 = _4420 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4652 = -_4580;
    float _4654 = _4494 + _4652;
    float _4656 = _4648 + _4646;
    float _4658 = fma(_4422, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4650);
    float _4660 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4662 = fma(_4500, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4660);
    float _4664 = precise::clamp(_4662, 0.0, 1.0);
    float _4666 = rsqrt(_4656);
    float _4668 = fma(_4424, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4658);
    float _4670 = -_4664;
    float _4672 = _4670 + 1.0;
    float _4674 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4676 = fma(_3664, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4678 = _4668 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4680 = _4420 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4682 = abs(_4672);
    float _4684 = log2(_4682);
    float _4686 = _4678 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4688 = _4420 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4690 = -_4686;
    float _4692 = fma(_4690, _4674, 1.0);
    float _4694 = _4420 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4696 = fma(_4422, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4688);
    float _4698 = _4666 * _4612;
    float _4700 = _4666 * _4638;
    float _4702 = fma(_4422, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4694);
    float _4704 = fma(_4424, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4696);
    float _4706 = _4698 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4708 = _4666 * _4630;
    float _4710 = fma(_4424, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4702);
    float _4712 = _4704 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4714 = -_4706;
    float _4716 = fma(_4700, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4714);
    float _4718 = fma(_4422, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4680);
    float _4720 = _4710 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4722 = _4712 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4724 = -_4708;
    float _4726 = fma(_4724, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4716);
    float _4728 = floor(_4676);
    float _4730 = fma(_4424, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4718);
    float _4732 = fma(_4720, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4722);
    float _4734 = fma(_4726, -0.5, 0.5);
    float _4736 = _4684 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4738 = _4730 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4740 = fma(_4678, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4732);
    float _4742 = fma(_4726, 0.5, 0.5);
    float _4744 = exp2(_4736);
    float _4746 = _4700 + 1.0;
    float _4748 = fma(_4738, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4740);
    float _4750 = _4712 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4752 = fma(_4742, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4754 = fma(_4720, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4750);
    float _4756 = sqrt(_4734);
    float _4758 = _4712 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4760 = -_4728;
    float _4762 = _4676 + _4760;
    float _4764 = fma(_4742, _4752, -0.212114393711090087890625);
    float _4766 = fma(_4678, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4754);
    float _4768 = fma(_4720, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4758);
    float _4770 = fma(_4742, _4764, 1.570728778839111328125);
    float _4772 = log2(_4692);
    float _4774 = fma(_4678, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4768);
    float _4776 = fma(_4738, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4766);
    float _4778 = -_4700;
    float _4780 = fma(_4744, _4746, _4778);
    float _4782 = fma(_4738, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4774);
    float _4784 = fma(_4780, 0.5, 0.5);
    float _4786 = 1.0 / _4748;
    float _4788 = _4756 * 0.636619746685028076171875;
    float _4790 = -_4770;
    float _4792 = fma(_4788, _4790, 1.0);
    float2 _12387 = float2(_4654, _4762);
    float _4794 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12387, float2(0.0), isnan(_12387)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12387, float2(0.0), isnan(_12387)), level(0.0)).x;
    float _4796 = _4772 * 0.693147182464599609375;
    float _4798 = _4776 * _4786;
    float _4800 = _4782 * _4786;
    float _4802 = _4796 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4804 = fma(_4798, 0.5, 0.5);
    float _4806 = fma(_4800, -0.5, 0.5);
    float3 _12413 = float3(_4804, _4806, _4802);
    float _4808 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12413, float3(0.0), isnan(_12413)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12413, float3(0.0), isnan(_12413)), level(0.0)).x;
    float3 _12424 = float3(_4804, _4806, _4802);
    float4 _4811 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12424, float3(0.0), isnan(_12424)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12424, float3(0.0), isnan(_12424)), level(0.0)).xyzw;
    float _4813 = _4811.x;
    float _4815 = _4811.y;
    float _4817 = _4811.z;
    float _4819 = _4811.w;
    float2 _12440 = float2(_4792, _4784);
    float3 _4821 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12440, float2(0.0), isnan(_12440)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12440, float2(0.0), isnan(_12440)), level(0.0)).xyz;
    float _4823 = _4821.x;
    float _4825 = _4821.y;
    float _4827 = _4821.z;
    float _4829 = abs(_4352);
    float _4831 = log2(_4829);
    float _4833 = _4712 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _4835 = _4500 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4837 = isnan(_4500);
    bool _4839 = _4835 || _4837;
    bool _4841 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4843 = _4839 || _4841;
    float _4845 = fma(_4720, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4833);
    float _4847 = fma(_4678, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4845);
    float _4849 = _4776 + _4748;
    float _4851 = fma(_4738, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4847);
    float _4853 = _4831 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4855 = in.m_92.x;
    float _4857 = _4849 * 0.5;
    out.gl_Position.x = _4776;
    out.gl_Position.y = _4782;
    out.gl_Position.z = _4851;
    out.gl_Position.w = _4748;
    float _4859 = exp2(_4853);
    float _4861 = _4776;
    float _4863 = _4851;
    float _4865 = _4748;
    float _4867 = _4782;
    if (!_4843)
    {
        _4861 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4869 = _4861;
    float _4871 = fma(_4859, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4873 = precise::clamp(_4871, 0.0, 1.0);
    float _4875 = _4851 + _4748;
    float _4877 = _4869;
    float _4879 = _4869;
    if (!_4843)
    {
        _4863 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4881 = _4863;
    float _4883 = fma(_4873, -2.0, 3.0);
    float _4885 = _4873 * _4873;
    float _4887 = _4875 * 0.5;
    float _4889 = _4885 * _4883;
    float _4891 = _4684 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _4893 = _4352 <= 8000.0;
    bool _4895 = isnan(_4352);
    bool _4897 = _4893 || _4895;
    bool _4899 = isnan(8000.0);
    bool _4901 = _4897 || _4899;
    float _4903 = float(_4901);
    float _4905 = _4748 * 0.5;
    float _4907 = -_4889;
    float _4909 = _4907 + 1.0;
    float _4911 = exp2(_4891);
    float _4913 = fma(_4909, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4889);
    float _4915 = fma(_4782, -0.5, _4905);
    float _4917 = _4903 * _4913;
    float _4919 = _4881;
    float _4921 = _4881;
    if (!_4843)
    {
        _4865 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4923 = _4865;
    out.m_94.x = _4857;
    out.m_94.y = _4915;
    out.m_94.z = _4887;
    out.m_94.w = _4748;
    float _4925 = _4917 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4927 = _4923;
    float _4929 = _4923;
    if (!_4843)
    {
        _4867 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4931 = _4867;
    float _4933 = -_4911;
    float _4935 = _4933 + 1.0;
    float _4937 = _4935 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4939 = -_4794;
    float _4941 = _4939 + 1.0;
    float _4943 = _4941 * _4925;
    float _4945 = precise::clamp(_4943, 0.0, 1.0);
    float _4947 = -_4945;
    float _4949 = fma(_4947, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4951 = _4949 * _4855;
    float _4953 = _4951 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4955 = _4937 * _4808;
    float _4957 = -_4937;
    float _4959 = _4957 + 1.0;
    out.m_96.x = _4953;
    float _4961 = _4819 * _4955;
    float _4963 = _4827 * _4955;
    float _4965 = _4819 * _4959;
    float _4967 = fma(_4823, _4961, _4813);
    float _4969 = fma(_4825, _4961, _4815);
    float _4971 = fma(_4819, _4963, _4817);
    float _4973 = _4476 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4975 = _4961;
    float _4977 = _4817;
    float _4979 = _4931;
    float _4981 = _4931;
    if (!_4843)
    {
        _4975 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4983 = _4975;
    float _4985 = _4983;
    float _4987 = _4983;
    if (!_4843)
    {
        _4977 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4989 = _4977;
    out.m_98.x = _4967;
    out.m_98.y = _4969;
    out.m_98.z = _4971;
    out.m_98.w = _4965;
    bool _4991 = !_4843;
    float _4993 = _4989;
    float _4995 = _4989;
    if (!_4991)
    {
        bool _4997 = _4500 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4999 = isnan(_4500);
        bool _5001 = _4997 || _4999;
        bool _5003 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5005 = _5001 || _5003;
        if (!_5005)
        {
            float _5007 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5009 = _4500 + _5007;
            float _5011 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5013 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5011;
            float _5015 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5017 = _5015 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5019 = 1.0 / _5013;
            float _5021 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5023 = _5021 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5025 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5027 = _5025 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5029 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5031 = _5029 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5033 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5035 = _5033 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5037 = _5009 * _5019;
            float _5039 = precise::clamp(_5037, 0.0, 1.0);
            float _5041 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5043 = _5041 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5045 = fma(_5039, _5017, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5047 = fma(_5039, _5043, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5049 = fma(_5039, _5023, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5051 = fma(_5039, _5027, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5053 = fma(_5039, _5031, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5055 = fma(_5039, _5035, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4995 = _5049;
            _4981 = _5053;
            _4987 = _5045;
            _4921 = _5051;
            _4929 = _5047;
            _4879 = _5055;
            _5057 = true;
        }
        else
        {
            bool _5059 = _4500 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5061 = isnan(_4500);
            bool _5063 = _5059 || _5061;
            bool _5065 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5067 = _5063 || _5065;
            if (!_5067)
            {
                _4985 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5069 = _4985;
            _4987 = _5069;
            if (!_5067)
            {
                _4993 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5071 = _4993;
            _4995 = _5071;
            if (!_5067)
            {
                _4927 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5073 = _4927;
            _4929 = _5073;
            if (!_5067)
            {
                _4919 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5075 = _4919;
            _4921 = _5075;
            if (!_5067)
            {
                _4979 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5077 = _4979;
            _4981 = _5077;
            if (!_5067)
            {
                _4877 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5079 = _4877;
            bool _5081 = !_5067;
            _4879 = _5079;
            if (!_5081)
            {
                bool _5083 = _4500 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5085 = isnan(_4500);
                bool _5087 = _5083 || _5085;
                bool _5089 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5091 = _5087 || _5089;
                if (!_5091)
                {
                    float _5093 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5095 = _4500 + _5093;
                    float _5097 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5099 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5097;
                    float _5101 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5103 = _5101 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5105 = 1.0 / _5099;
                    float _5107 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5109 = _5107 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5111 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5113 = _5111 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5115 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5117 = _5115 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5119 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5121 = _5119 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5123 = _5095 * _5105;
                    float _5125 = precise::clamp(_5123, 0.0, 1.0);
                    float _5127 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5129 = _5127 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5131 = fma(_5125, _5103, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5133 = fma(_5125, _5129, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5135 = fma(_5125, _5109, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5137 = fma(_5125, _5113, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5139 = fma(_5125, _5117, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5141 = fma(_5125, _5121, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4995 = _5135;
                    _4981 = _5139;
                    _4987 = _5131;
                    _4921 = _5137;
                    _4929 = _5133;
                    _4879 = _5141;
                    _5057 = true;
                }
                else
                {
                    _4995 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4981 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4987 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4921 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4929 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4879 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5057 = false;
    float _5143 = _4995;
    float _5145 = _4981;
    float _5147 = _4987;
    float _5149 = _4921;
    float _5151 = _4929;
    float _5153 = _4879;
    float _5155 = _4973 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5157 = fma(_4084, -0.5, 0.5);
    float _5159 = precise::clamp(_5157, 0.0, 1.0);
    float _5161 = -_5143;
    float _5163 = _5161 + _5145;
    float _5165 = -_5147;
    float _5167 = _5165 + _5149;
    out.m_57.x = _5155;
    float _5169 = fma(_5159, _5163, _5143);
    float _5171 = -_5151;
    float _5173 = _5171 + _5153;
    float _5175 = fma(_5159, _5167, _5147);
    float _5177 = _5169 * 0.586610972881317138671875;
    bool _5179 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5181 = fma(_5159, _5173, _5151);
    out.m_100.x = 0.0;
    float _5183 = fma(_5175, 0.298911988735198974609375, _5177);
    bool _5185 = _4476 > 0.0;
    bool _5187 = isnan(_4476);
    bool _5189 = _5185 || _5187;
    bool _5191 = isnan(0.0);
    bool _5193 = _5189 || _5191;
    float _5195 = fma(_5181, 0.114477999508380889892578125, _5183);
    float _5197 = -_5195;
    float _5199 = _5175 + _5197;
    float _5201 = -_5195;
    float _5203 = _5169 + _5201;
    float _5205 = -_5195;
    float _5207 = _5181 + _5205;
    float _5209 = fma(_5199, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5195);
    float _5211 = fma(_5203, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5195);
    float _5213 = fma(_5207, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5195);
    bool _5215 = !_5179;
    if (!_5215)
    {
        float _5217 = -_4420;
        float _5219 = _5217 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5221 = -_4422;
        float _5223 = _5221 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5225 = -_4424;
        float _5227 = _5225 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5229 = _5219 * _5219;
        float _5231 = fma(_5223, _5223, _5229);
        float _5233 = fma(_5227, _5227, _5231);
        float _5235 = sqrt(_5233);
        float _5237 = rsqrt(_5233);
        float _5239 = -_5235;
        float _5241 = _5239 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5243 = _5241 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5245 = precise::clamp(_5243, 0.0, 1.0);
        float _5247 = _5223 * _5237;
        float _5249 = _5219 * _5237;
        float _5251 = abs(_5245);
        float _5253 = log2(_5251);
        float _5255 = _5227 * _5237;
        float _5257 = _5247 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5259 = _4084 * _5249;
        float _5261 = -_5249;
        float _5263 = -_5257;
        float _5265 = fma(_5261, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5263);
        float _5267 = fma(_4082, _5247, _5259);
        float _5269 = -_5255;
        float _5271 = fma(_5269, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5265);
        float _5273 = fma(_4086, _5255, _5267);
        float _5275 = precise::clamp(_5273, 0.0, 1.0);
        float _5277 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5279 = _5271 + _5277;
        float _5281 = _5253 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5283 = _5279 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5285 = precise::clamp(_5283, 0.0, 1.0);
        float _5287 = exp2(_5281);
        float _5289 = _5287 * _5285;
        float _5291 = _5275 * _5289;
        float _5293 = _5291 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5295 = _5291 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5297 = _5291 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _5293;
        out.m_100.y = _5295;
        out.m_100.z = _5297;
    }
    out.m_102.x = _5209;
    out.m_102.y = _5211;
    out.m_102.z = _5213;
    if (_5193)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_57.x = 0.0;
    float _5299 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5299;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

