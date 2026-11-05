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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_28 [[id(6)]];
    sampler vp_t_tcb_28Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    sampler vp_t_tcb_28Smplr_w [[id(16)]];
    sampler vp_t_tcb_24Smplr_w [[id(17)]];
    sampler vp_t_tcb_32Smplr_w [[id(18)]];
    sampler vp_t_tcb_30Smplr_w [[id(19)]];
    sampler vp_t_tcb_1CSmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_72 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_96 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_80 [[user(locn5)]];
    float4 m_86 [[user(locn6)]];
    float4 m_82 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 m_88 [[user(locn9)]];
    float4 m_94 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 m_92 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_76 [[attribute(0)]];
    float4 m_64 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_66 [[attribute(3)]];
    float4 m_84 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_68 [[attribute(8)]];
    float4 m_70 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2816 = false;
    bool _629 = false;
    bool _455 = false;
    bool _349 = false;
    bool _253 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_48.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    if (!_119)
    {
        out.m_51.x = 0.0;
    }
    int _125 = 0;
    if (!_119)
    {
        float _127 = _123 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3120 = as_type<float>(_129);
        out.gl_Position.z = _3120;
    }
    if (!_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = in.m_53.w;
    float _135 = float(_115);
    float _137 = 1.0 / _135;
    float _139 = -_133;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_133);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = _141 * _137;
    bool _155 = _141 >= _135;
    bool _157 = !_151;
    bool _159 = _155 || _157;
    out.m_55.x = _153;
    float _161 = _133;
    float _163 = _141;
    if (_159)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _161;
    if (_159)
    {
        out.m_51.x = 0.0;
    }
    if (_159)
    {
        float _167 = _165 * 5.0;
        _131 = as_type<int>(_167);
    }
    int _169 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3192 = as_type<float>(_169);
        out.gl_Position.z = _3192;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = in.m_60.x;
    float _175 = in.m_60.y;
    float _177 = in.m_60.z;
    float _179 = in.m_62.x;
    float _181 = in.m_62.y;
    float _183 = in.m_62.z;
    float _185 = in.m_64.x;
    float _187 = in.m_64.y;
    float _189 = in.m_64.z;
    float _191 = in.m_66.x;
    float _193 = in.m_66.y;
    float _195 = in.m_66.z;
    int _197 = as_type<int>(_171) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_171) & 2;
    bool _203 = _201 != 0;
    bool _205 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _207 = _175 * _181;
    float _209 = _175 * _187;
    float _211 = fma(_173, _179, _207);
    float _213 = _175 * _193;
    float _215 = fma(_173, _185, _209);
    float _217 = fma(_177, _183, _211);
    float _219 = fma(_173, _191, _213);
    float _221 = fma(_177, _189, _215);
    float _223 = fma(_177, _195, _219);
    bool _225 = !_199;
    float _227 = _225 ? (-0.5) : 0.5;
    bool _229 = !_203;
    float _231 = _229 ? (-0.5) : 0.5;
    bool _233 = !_205;
    float _251;
    if (!_233)
    {
        float _235 = in.m_68.x;
        float _237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _239 = _235 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _243 = _241 * _237;
        float _245 = floor(_243);
        float _247 = -_245;
        float _249 = _243 + _247;
        _251 = _249;
        _253 = true;
    }
    else
    {
        _251 = _153;
    }
    _253 = false;
    float _255 = _251;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = _255 + _257;
    bool _261 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _263 = isnan(_255);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _273;
    float _277 = -_271;
    float _279 = _277 + 1.0;
    bool _281 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _283 = isnan(_255);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _293;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _299 = 1.0 / _275;
    float _301 = _291 * _279;
    float _303 = -_291;
    float _305 = _303 + 1.0;
    float _307 = _259 * _299;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _309;
    float _313 = fma(_295, _307, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _315 = fma(_311, _307, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _317 = _313 * _301;
    float _319 = _315 * _301;
    float _321 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[143].x, _317);
    float _323 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[143].y, _319);
    float _325 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[144].x, _321);
    float _327 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[144].y, _323);
    bool _329 = !_297;
    float _347;
    if (!_329)
    {
        float _331 = in.m_68.x;
        float _333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _335 = _331 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _337 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _339 = _337 * _333;
        float _341 = floor(_339);
        float _343 = -_341;
        float _345 = _339 + _343;
        _347 = _345;
        _349 = true;
    }
    else
    {
        _347 = _153;
    }
    _349 = false;
    float _351 = _347;
    bool _353 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _355 = isnan(_351);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _369 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _371 = isnan(_351);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _387 = _351 + _385;
    float _389 = -_363;
    float _391 = _389 + 1.0;
    float _393 = 1.0 / _367;
    float _395 = _379 * _391;
    float _397 = -_379;
    float _399 = _397 + 1.0;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _405 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _409 = _401 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = _403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _413 = _407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _415 = _383 * _393;
    float _417 = fma(_415, _387, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _419 = in.m_70.x;
    float _421 = in.m_70.y;
    float _423 = _417 * _395;
    float _425 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[115].x, _423);
    float _427 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[116].x, _425);
    float _429 = _427 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _409;
    out.m_72.y = _411;
    out.m_72.z = _413;
    out.m_72.w = _429;
    float _431 = _327 * _421;
    float _433 = _325 * _419;
    bool _435 = !_405;
    float _453;
    if (!_435)
    {
        float _437 = in.m_68.x;
        float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _441 = _437 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _445 = _443 * _439;
        float _447 = floor(_445);
        float _449 = -_447;
        float _451 = _445 + _449;
        _453 = _451;
        _455 = true;
    }
    else
    {
        _453 = _153;
    }
    _455 = false;
    float _457 = _453;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _461 = _457 + _459;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _467 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _469 = isnan(_457);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _487 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _489 = isnan(_457);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = 1.0 / _465;
    float _501 = -_477;
    float _503 = _501 + 1.0;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _505;
    bool _509 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _511 = isnan(_457);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = _497 * _503;
    float _523 = -_497;
    float _525 = _523 + 1.0;
    bool _527 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _529 = 1.0 / _481;
    float _531 = 1.0 / _485;
    float _533 = _507 * _499;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _539 = fma(_533, _461, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _541;
    float _545 = _537 * _529;
    float _547 = _519 * _525;
    bool _549 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _551 = isnan(_457);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _563 = _457 + _561;
    float _565 = -_519;
    float _567 = _565 + 1.0;
    float _569 = _539 * _547;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _573 = _457 + _571;
    float _575 = fma(_545, _563, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _577 = _543 * _531;
    float _579 = -_559;
    float _581 = _579 + 1.0;
    float _583 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[131].x, _569);
    float _585 = fma(_577, _573, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _587 = _477 * _581;
    float _589 = fma(_575, _521, _583);
    float _591 = fma(_585, _587, _589);
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _597 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[134].x, _591);
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _601 = _593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _603 = _595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _605 = _597 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _607 = _599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_74.x = _601;
    out.m_74.y = _603;
    out.m_74.z = _607;
    out.m_74.w = _605;
    bool _609 = !_527;
    float _627;
    if (!_609)
    {
        float _611 = in.m_68.x;
        float _613 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _615 = _611 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _617 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[14].x, _141);
        float _619 = _617 * _613;
        float _621 = floor(_619);
        float _623 = -_621;
        float _625 = _619 + _623;
        _627 = _625;
        _629 = true;
    }
    else
    {
        _627 = _153;
    }
    _629 = false;
    float _631 = _627;
    float _633 = in.m_68.x;
    float _635 = in.m_68.y;
    float _637 = in.m_68.z;
    float _639 = in.m_68.w;
    float _641 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _643 = in.m_48.x;
    float _645 = in.m_48.y;
    float _647 = in.m_48.z;
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _651 = _649 != 0;
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _655 = _653 != 0;
    float _657 = in.m_76.y;
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _661 = _659 != 0;
    float _663 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _667 = _665 != 0;
    float _669 = in.m_66.w;
    float _671 = in.m_64.w;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _679 = _631 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _681 = isnan(_631);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _687 = _683 || _685;
    float _689 = float(_687);
    bool _691 = _639 > 0.5;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _697 = _187 * _645;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _701 = _699 != 0;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _705 = _703 != 0;
    float _707 = 1.0 / _695;
    float _709 = -_231;
    int _711 = _691 ? as_type<int>(_709) : as_type<int>(_231);
    float _713 = fma(_185, _643, _697);
    bool _715 = _633 > 0.5;
    float _717 = _633 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _723 = -_227;
    int _725 = _715 ? as_type<int>(_723) : as_type<int>(_227);
    float _727 = -_673;
    float _729 = fma(_717, 2.0, _727);
    int _731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _733 = _731 != 0;
    float _735 = _645 + _657;
    float _737 = 1.0 / _721;
    float _739 = fma(_189, _647, _713);
    float _741 = _193 * _645;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _745 = _743 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _751 = fma(_191, _643, _741);
    float _753 = 1.0 / _677;
    float _755 = _635 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _759 = fma(_195, _647, _751);
    float _761 = fma(_755, -2.0, _757);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _767 = 1.0 / _749;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _769;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _777;
    float _781 = _771 * _737;
    float _783 = _633 * 2.0;
    float _785 = 1.0 / _765;
    float _787 = _779 * _707;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _795 = _631 + _793;
    float _797 = -_689;
    float _799 = _797 + 1.0;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _803 = _663 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _805 = 1.0 / _745;
    float _807 = 0.0;
    float _809 = _801;
    if (!_733)
    {
        _807 = _635;
    }
    float _811 = _807;
    float _813 = _739 + _671;
    float _815 = _811;
    if (_733)
    {
        _815 = _633;
    }
    float _817 = _815;
    float _819 = 1.0 / _775;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _825 = _637 * 2.0;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _829 = _823 * _753;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _831;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _839 = floor(_783);
    float _841 = _635 + _633;
    float _843 = _833 * _767;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _845;
    float _849 = _837 * _785;
    float _851 = _635 + _637;
    bool _853 = !_651;
    float _855 = _853 ? _227 : as_type<float>(_725);
    float _857 = _791 * _805;
    float _859 = floor(_825);
    bool _861 = _635 > 0.5;
    float _863 = _851 + (-1.0);
    float _865 = _847 * _819;
    float _867 = -_231;
    int _869 = _861 ? as_type<int>(_867) : as_type<int>(_231);
    float _871 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _873 = _841 + (-1.0);
    float _875 = -_227;
    int _877 = _861 ? as_type<int>(_875) : as_type<int>(_227);
    bool _879 = !_655;
    float _881 = _879 ? _231 : as_type<float>(_869);
    float _883 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _885 = _637 > 0.5;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _889 = _631 + _887;
    bool _891 = !_661;
    float _893 = _891 ? _231 : as_type<float>(_711);
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _897 = _631 + _895;
    float _899 = -_227;
    int _901 = _885 ? as_type<int>(_899) : as_type<int>(_227);
    float _903 = fma(_857, _889, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _905 = _859 > 0.0;
    float _907 = fma(_829, _897, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _909 = _859 >= 0.0;
    bool _911 = isnan(_859);
    bool _913 = _909 || _911;
    bool _915 = isnan(0.0);
    bool _917 = _913 || _915;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _921 = _631 + _919;
    bool _923 = !_667;
    float _925 = _923 ? _227 : as_type<float>(_901);
    bool _927 = _839 > 0.0;
    float _929 = fma(_787, _921, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _933 = _631 + _931;
    bool _935 = _839 >= 0.0;
    bool _937 = isnan(_839);
    bool _939 = _935 || _937;
    bool _941 = isnan(0.0);
    bool _943 = _939 || _941;
    bool _945 = _631 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _947 = isnan(_631);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _953 = _949 || _951;
    float _955 = float(_953);
    float _957 = fma(_781, _933, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _959 = fma(_843, _795, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _963 = _631 + _961;
    bool _965 = _631 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _967 = isnan(_631);
    bool _969 = _965 || _967;
    bool _971 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _973 = _969 || _971;
    float _975 = float(_973);
    float _977 = -_955;
    float _979 = _977 + 1.0;
    bool _981 = _631 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _983 = isnan(_631);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    float _993 = fma(_865, _963, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _995 = _631 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _997 = isnan(_631);
    bool _999 = _995 || _997;
    bool _1001 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1003 = _999 || _1001;
    float _1005 = float(_1003);
    float _1007 = _975 * _979;
    float _1009 = -_975;
    float _1011 = _1009 + 1.0;
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1015 = _631 + _1013;
    bool _1017 = !_701;
    float _1019 = _1017 ? _227 : as_type<float>(_877);
    float _1021 = -_1005;
    float _1023 = _1021 + 1.0;
    float _1025 = _1005 * _1011;
    bool _1027 = _631 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1029 = isnan(_631);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1035 = _1031 || _1033;
    float _1037 = float(_1035);
    float _1039 = fma(_849, _1015, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1041 = _991 * _1023;
    float _1043 = -_991;
    float _1045 = _1043 + 1.0;
    float _1047 = _1015;
    if (!_733)
    {
        _1047 = _637;
    }
    float _1049 = _1047;
    float _1051 = -_1037;
    float _1053 = _1051 + 1.0;
    bool _1055 = _637 > 0.5;
    float _1057 = _1037 * _1045;
    bool _1059 = _631 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1061 = isnan(_631);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1067 = _1063 || _1065;
    float _1069 = float(_1067);
    float _1071 = _689 * _1053;
    float _1073 = _1049;
    if (_733)
    {
        _1073 = _635;
    }
    float _1075 = _1073;
    bool _1077 = _631 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1079 = isnan(_631);
    bool _1081 = _1077 || _1079;
    bool _1083 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1085 = _1081 || _1083;
    float _1087 = float(_1085);
    float _1089 = -_1069;
    float _1091 = _1089 + 1.0;
    float _1093 = -_231;
    int _1095 = _1055 ? as_type<int>(_1093) : as_type<int>(_231);
    float _1097 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[83].w, _801);
    float _1099 = _1069 * _799;
    float _1101 = _1087 * _1091;
    if (!_733)
    {
        _809 = _637;
    }
    float _1103 = _809;
    float _1105 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1097);
    bool _1107 = !_705;
    float _1109 = _1107 ? _231 : as_type<float>(_1095);
    float _1111 = -_141;
    float _1113 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[76].x, _729);
    float _1115 = _1103;
    if (_733)
    {
        _1115 = _635;
    }
    float _1117 = _1115;
    float _1119 = -_1087;
    float _1121 = _1119 + 1.0;
    int _1123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1125 = _1123 != 0;
    int _1127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1129 = _1127 != 0;
    int _1131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1133 = _1131 != 0;
    float _1135 = _929 * _1101;
    float _1137 = _641 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1139 = _855 + 0.5;
    float _1141 = _759 + _669;
    float _1143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1145 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1135);
    float _1147 = fma(_1137, _1139, _1113);
    float _1149 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _761);
    float _1151 = fma(_907, _1099, _1145);
    float _1153 = _817 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1159 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1163 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1155);
    float _1165 = _881 + (-0.5);
    float _1167 = fma(_1159, -2.0, _827);
    float _1169 = -_1161;
    float _1171 = fma(_1153, 2.0, _1169);
    float _1173 = -_1105;
    float _1175 = _1173 + 1.0;
    float _1177 = -_803;
    float _1179 = -_1149;
    float _1181 = fma(_1177, _1165, _1179);
    float _1183 = fma(_957, _1071, _1151);
    float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1187 = _735 + _1185;
    float _1189 = _1143 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1191 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1193 = _1141 + _1191;
    float _1195 = fma(_903, _1057, _1183);
    float _1197 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1199 = _1019 + 0.5;
    float _1201 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1203 = fma(_959, _1041, _1195);
    float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1207 = _813 + _1205;
    float _1209 = _893 + (-0.5);
    float _1211 = fma(_1039, _1025, _1203);
    float _1213 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1197);
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1217 = fma(_993, _1007, _1211);
    float _1219 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1213);
    float _1221 = _1187 * _1187;
    float _1223 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1225 = !_1125;
    int _1227 = _1225 ? 0 : 1;
    float _1229 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1167);
    bool _1231 = _1219 >= 0.0;
    float _1233 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1223);
    float _1235 = fma(_1207, _1207, _1221);
    float _1237 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1215);
    float _1239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1241 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1233);
    float _1243 = fma(_1193, _1193, _1235);
    float _1245 = -_1201;
    float _1247 = -_1229;
    float _1249 = fma(_1245, _1209, _1247);
    float _1251 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1237);
    float _1253 = -_1241;
    float _1255 = _1253 + 1.0;
    float _1257 = _635 * 2.0;
    float _1259 = _925 + 0.5;
    float _1261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1263 = -_1251;
    float _1265 = _1263 + 1.0;
    float _1267 = fma(_881, _1255, _1181);
    float _1269 = _1255;
    int _1271 = as_type<int>(_1175);
    float _1273 = _1203;
    if (_1231)
    {
        _1269 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1275 = _1269;
    float _1277 = -_141;
    float _1279 = fma(_1277, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1171);
    float _1281 = -_1265;
    float _1283 = fma(_855, _1281, _1147);
    float _1285 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1163);
    float _1287 = -_1109;
    float _1289 = _1287 + 0.5;
    float _1291 = rsqrt(_1243);
    float _1293 = fma(_893, _1175, _1249);
    if (_1231)
    {
        float _1295 = _1275 * 5.0;
        _1271 = as_type<int>(_1295);
    }
    int _1297 = _1271;
    float _1299 = fma(_1189, _1259, _1279);
    float _1301 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1303 = -_1285;
    float _1305 = _1303 + 1.0;
    float _1307 = _433 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1309 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1311 = floor(_1257);
    float _1313 = _1301 * _1239;
    float _1315 = -_1305;
    float _1317 = fma(_925, _1315, _1299);
    float _1319 = _1309 * _1261;
    float _1321 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1217);
    float _1323 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    if (_1231)
    {
        out.m_51.x = 0.0;
    }
    bool _1325 = !_1129;
    int _1327 = _1325 ? 0 : 1;
    float _1329 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1331 = log2(_1329);
    float _1333 = _1323 * _1291;
    out.m_78.x = _1313;
    out.m_78.y = _1319;
    bool _1335 = !_1133;
    int _1337 = _1335 ? 0 : 1;
    float _1339 = _1187 * _1333;
    out.m_80.x = _1283;
    out.m_80.y = _1267;
    out.m_80.z = _1317;
    out.m_80.w = _1293;
    bool _1341 = _1311 > 0.0;
    if (_1231)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5090 = as_type<float>(_1297);
        out.gl_Position.z = _5090;
    }
    float _1343 = _1207 * _1333;
    out.m_82.x = _1321;
    if (_1231)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1345 = -_1339;
    float _1347 = _735 + _1345;
    float _1349 = -_1343;
    float _1351 = _813 + _1349;
    int _1353 = _917 ? 0 : 1;
    float _1355 = _1331 * _141;
    float _1357 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1359 = _1347 + _1357;
    float _1361 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1363 = _1351 + _1361;
    int _1365 = ~_1353;
    int _1367 = _1365 + 1;
    int _1369 = _1367 + 1;
    float _1371 = _1193 * _1333;
    float _1373 = _1359 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1375 = _1369;
    float _1377 = _1371;
    if (!_905)
    {
        int _1379 = ~_1353;
        int _1381 = _1379 + 1;
        _1375 = _1381;
    }
    int _1383 = _1375;
    float _1385 = exp2(_1355);
    float _1387 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1373);
    int _1389 = abs(_1227);
    float _1391 = in.m_84.x;
    float _1393 = in.m_84.y;
    float _1395 = in.m_84.z;
    bool _1397 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1399 = isnan(1.0);
    bool _1401 = _1397 || _1399;
    bool _1403 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1405 = _1401 || _1403;
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1409 = 1.0 + _1407;
    float _1411 = float(_1383);
    float _1413 = -_1371;
    float _1415 = _1141 + _1413;
    float _1417 = float(_1389);
    float _1419 = 1.0 / _1409;
    bool _1421 = _1311 >= 0.0;
    bool _1423 = isnan(_1311);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan(0.0);
    bool _1429 = _1425 || _1427;
    float _1431 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1433 = _1415 + _1431;
    int _1435 = _943 ? 0 : 1;
    float _1437 = _1417 * _1411;
    bool _1439 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1441 = isnan(0.0);
    bool _1443 = _1439 || _1441;
    bool _1445 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1447 = _1443 || _1445;
    float _1449 = -_1385;
    float _1451 = _1449 + 1.0;
    float _1453 = -_1339;
    float _1455 = _1187 + _1453;
    float _1457 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1387);
    float _1459 = _1437 * (-2.0);
    float _1461 = -_1343;
    float _1463 = _1207 + _1461;
    float _1465 = _1447 ? _1451 : 0.0;
    float _1467 = _1455 * _1455;
    float _1469 = fma(_883, _1459, _883);
    bool _1471 = _1457 >= 0.0;
    float _1473 = -_1371;
    float _1475 = _1193 + _1473;
    int _1477 = ~_1435;
    int _1479 = _1477 + 1;
    int _1481 = _1479 + 1;
    float _1483 = fma(_1463, _1463, _1467);
    float _1485 = fma(_1459, _1391, _1391);
    float _1487 = _633 + (-0.5);
    int _1489 = _1481;
    float _1491 = _1463;
    if (!_927)
    {
        int _1493 = ~_1435;
        int _1495 = _1493 + 1;
        _1489 = _1495;
    }
    int _1497 = _1489;
    if (_1405)
    {
        float _1499 = _1465 * _1419;
        _163 = _1499;
    }
    float _1501 = _163;
    int _1503 = _1429 ? 0 : 1;
    float _1505 = fma(_1487, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1485);
    int _1507 = abs(_1327);
    float _1509 = fma(_1475, _1475, _1483);
    int _1511 = ~_1503;
    int _1513 = _1511 + 1;
    int _1515 = _1513 + 1;
    float _1517 = fma(_1469, _1501, _1505);
    int _1519 = _1515;
    if (!_1341)
    {
        int _1521 = ~_1503;
        int _1523 = _1521 + 1;
        _1519 = _1523;
    }
    int _1525 = _1519;
    int _1527 = abs(_1337);
    float _1529 = sqrt(_1509);
    float _1531 = _1517 * 0.15915493667125701904296875;
    float _1533 = float(_1525);
    if (_1471)
    {
        out.m_51.x = 0.0;
    }
    if (_1471)
    {
        _1491 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1535 = _1491;
    float _1537 = _1531 * 6.283185482025146484375;
    float _1539 = sin(_1537);
    int _1541 = as_type<int>(_1535);
    if (_1471)
    {
        float _1543 = _1535 * 5.0;
        _1541 = as_type<int>(_1543);
    }
    int _1545 = _1541;
    float _1547 = float(_1497);
    float _1549 = float(_1507);
    if (_1471)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5384 = as_type<float>(_1545);
        out.gl_Position.z = _5384;
    }
    float _1551 = _1549 * _1547;
    float _1553 = _635 + (-0.5);
    if (_1471)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1555 = -_735;
    float _1557 = _1555 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1559 = _1551 * (-2.0);
    float _1561 = -_813;
    float _1563 = _1561 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1565 = -_1141;
    float _1567 = _1565 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1569 = _1557 * _1557;
    float _1571 = fma(_1559, _1393, _1393);
    float _1573 = float(_1527);
    float _1575 = _637 + _633;
    float _1577 = fma(_1563, _1563, _1569);
    float _1579 = fma(_1553, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1571);
    float _1581 = fma(_871, _1559, _871);
    float _1583 = _1573 * _1533;
    float _1585 = fma(_1567, _1567, _1577);
    float _1587 = _1575 + (-1.0);
    float _1589 = _1583 * (-2.0);
    float _1591 = rsqrt(_1585);
    float _1593 = fma(_1581, _1501, _1579);
    float _1595 = _637 + (-0.5);
    float _1597 = fma(_1587, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1599 = fma(_1589, _1395, _1395);
    float _1601 = _1593 * 0.15915493667125701904296875;
    float _1603 = _431 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1605 = fma(_1597, _1589, _1597);
    float _1607 = fma(_1595, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1599);
    float _1609 = _1531 * 6.283185482025146484375;
    float _1611 = cos(_1609);
    float _1613 = fma(_1605, _1501, _1607);
    float _1615 = _1563 * _1591;
    float _1617 = _1601 * 6.283185482025146484375;
    float _1619 = sin(_1617);
    float _1621 = _1613 * 0.15915493667125701904296875;
    float _1623 = _1567 * _1591;
    float _1625 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1627 = _1615 * _1625;
    float _1629 = _1557 * _1591;
    float _1631 = _1291 * _1529;
    float _1633 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1635 = _1623 * _1633;
    float _1637 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1639 = -_1627;
    float _1641 = fma(_1623, _1637, _1639);
    float _1643 = _1601 * 6.283185482025146484375;
    float _1645 = cos(_1643);
    float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1649 = _1629 * _1647;
    float _1651 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1653 = -_1635;
    float _1655 = fma(_1629, _1651, _1653);
    float _1657 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _231);
    float _1659 = _1631 * _1603;
    float _1661 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1663 = -_1649;
    float _1665 = fma(_1615, _1661, _1663);
    float _1667 = _1307 * _1631;
    float _1669 = _1621 * 6.283185482025146484375;
    float _1671 = sin(_1669);
    float _1673 = _1641 * _1641;
    float _1675 = _1539 * _1619;
    float _1677 = _1611 * _1619;
    float _1679 = _1657 * _1659;
    float _1681 = fma(_1655, _1655, _1673);
    float _1683 = _1621 * 6.283185482025146484375;
    float _1685 = cos(_1683);
    float _1687 = _1611 * _1645;
    float _1689 = fma(_1665, _1665, _1681);
    float _1691 = _1539 * _1645;
    float _1693 = fma(_1671, _1687, _1675);
    float _1695 = fma(_1671, _1675, _1687);
    float _1697 = -_1677;
    float _1699 = fma(_1671, _1691, _1697);
    float _1701 = rsqrt(_1689);
    float _1703 = -_1679;
    float _1705 = _1671 * _1703;
    float _1707 = -_1691;
    float _1709 = fma(_1671, _1677, _1707);
    float _1711 = _1619 * _1685;
    float _1713 = _1611 * _1685;
    float _1715 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _227);
    float _1717 = _1645 * _1685;
    float _1719 = _1539 * _1685;
    float _1721 = _1713 * _1679;
    float _1723 = _1715 * _1667;
    float _1725 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1727 = _1725 * 0.5;
    float _1729 = _1719 * _1679;
    float _1731 = fma(_1717, _1723, _1705);
    float _1733 = _1655 * _1701;
    float _1735 = _1641 * _1701;
    float _1737 = _1665 * _1701;
    float _1739 = fma(_1693, _1723, _1721);
    float _1741 = _1629 * _1733;
    float _1743 = _1623 * _1735;
    float _1745 = fma(_1699, _1723, _1729);
    float _1747 = fma(_1709, _1727, _1739);
    float _1749 = -_1741;
    float _1751 = fma(_1615, _1735, _1749);
    float _1753 = fma(_1711, _1727, _1731);
    float _1755 = -_1743;
    float _1757 = fma(_1629, _1737, _1755);
    float _1759 = fma(_1695, _1727, _1745);
    float _1761 = _1751 * _1747;
    float _1763 = _1757 * _1747;
    float _1765 = fma(_1737, _1753, _1761);
    float _1767 = fma(_1733, _1753, _1763);
    float _1769 = fma(_1623, _1759, _1765);
    float _1771 = fma(_1615, _1759, _1767);
    float _1773 = _1615 * _1737;
    float _1775 = _1141 + _1769;
    float _1777 = _813 + _1771;
    float _1779 = -_1773;
    float _1781 = fma(_1623, _1733, _1779);
    float _1783 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1785 = _1775 + _1783;
    float _1787 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1789 = _1777 + _1787;
    float _1791 = _1785 * _1785;
    float _1793 = fma(_1789, _1789, _1791);
    float _1795 = _1781 * _1747;
    float _1797 = sqrt(_1793);
    float _1799 = fma(_1735, _1753, _1795);
    float _1801 = fma(_1629, _1759, _1799);
    float _1803 = _735 + _1801;
    bool _1805 = _1797 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1807 = _1801;
    float _1809 = _1799;
    float _1811 = _1759;
    if (!_1805)
    {
        _1807 = _1777;
    }
    float _1813 = _1807;
    float _1815 = _1813;
    if (!_1805)
    {
        _1809 = _1775;
    }
    float _1817 = _1809;
    float _1819 = _1817;
    if (!_1805)
    {
        _1811 = _1803;
    }
    float _1821 = _1811;
    bool _1823 = !_1805;
    float _1825 = _1821;
    if (!_1823)
    {
        float _1827 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1829 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1831 = _1797 + _1829;
        float _1833 = rsqrt(_1793);
        float _1835 = _1831 * _1827;
        float _1837 = _1803 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1839 = _1835 * 0.15915493667125701904296875;
        float _1841 = _1839 * 6.283185482025146484375;
        float _1843 = sin(_1841);
        float _1845 = _1839 * 6.283185482025146484375;
        float _1847 = cos(_1845);
        float _1849 = fma(_1843, _1837, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1851 = _1833 * _1849;
        float _1853 = _1847 + (-1.0);
        float _1855 = fma(_1789, _1851, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1857 = fma(_1785, _1851, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1859 = _1853 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1861 = fma(_1803, _1847, _1859);
        _1819 = _1857;
        _1815 = _1855;
        _1825 = _1861;
    }
    float _1863 = _1819;
    float _1865 = _1815;
    float _1867 = _1825;
    float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1871 = _1863 + _1869;
    float _1873 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1875 = _1865 + _1873;
    float _1877 = fma(_1871, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1879 = fma(_1875, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _5904 = float2(_1879, _1877);
    float _1881 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_5904, float2(0.0), isnan(_5904)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_5904, float2(0.0), isnan(_5904)), level(0.0)).x;
    float _1883 = -_735;
    float _1885 = _1883 + _1867;
    float _1887 = -_813;
    float _1889 = _1887 + _1865;
    float _1891 = -_1141;
    float _1893 = _1891 + _1863;
    float _1895 = _1885 * _1885;
    float _1897 = fma(_1889, _1889, _1895);
    float _1899 = fma(_1893, _1893, _1897);
    float _1901 = sqrt(_1899);
    bool _1903 = _1901 > 0.0;
    float _1905 = fma(_1881, 100.0, _1867);
    bool _1907 = !_1903;
    float _1909 = _1905;
    float _1911 = _1865;
    float _1913 = _1863;
    float _1915 = _1879;
    if (!_1907)
    {
        float _1917 = _217 * _217;
        float _1919 = fma(_221, _221, _1917);
        float _1921 = rsqrt(_1899);
        float _1923 = fma(_223, _223, _1919);
        float _1925 = sqrt(_1923);
        float _1927 = _1889 * _1921;
        float _1929 = _1893 * _1921;
        bool _1931 = _1925 > 0.0;
        float _1933 = _1885 * _1921;
        bool _1935 = !_1931;
        _1915 = _1933;
        if (!_1935)
        {
            float _1937 = rsqrt(_1923);
            float _1939 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1941 = _217 * _1937;
            float _1943 = _221 * _1937;
            float _1945 = _1933 * _1941;
            float _1947 = _223 * _1937;
            float _1949 = fma(_1927, _1943, _1945);
            float _1951 = _1939 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1953 = fma(_1929, _1947, _1949);
            float _1955 = _1953 * _1951;
            float _1957 = fma(_221, _1955, _1865);
            float _1959 = fma(_217, _1955, _1905);
            float _1961 = fma(_223, _1955, _1863);
            _1909 = _1959;
            _1911 = _1957;
            _1913 = _1961;
            _1915 = _1949;
        }
    }
    float _1963 = _1909;
    float _1965 = _1911;
    float _1967 = _1913;
    float _1969 = _1915;
    float _1971 = -_1339;
    float _1973 = _1971 + _1963;
    float _1975 = -_1343;
    float _1977 = _1975 + _1965;
    float _1979 = -_1371;
    float _1981 = _1979 + _1967;
    float _1983 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1985 = _1973 + _1983;
    float _1987 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1989 = _1977 + _1987;
    float _1991 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1993 = _1981 + _1991;
    float _1995 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1997 = _1985 * _1985;
    float _1999 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2001 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2003 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1995);
    float _2005 = fma(_1989, _1989, _1997);
    float _2007 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1999);
    float _2009 = fma(_1993, _1993, _2005);
    float _2011 = rsqrt(_2009);
    float _2013 = fma(_1351, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2015 = sqrt(_2009);
    float _2017 = _2011 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2019 = _1989 * _2017;
    float _2021 = _1993 * _2017;
    float _2023 = _2019 * _2019;
    float _2025 = _2021 * _2021;
    float _2027 = _2023 + _2025;
    float _2029 = sqrt(_2027);
    bool _2031 = _2029 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2033 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2035 = _2029 + _2033;
    float _2037 = _1993;
    float _2039 = _2035;
    float _2041 = _1969;
    float _2043 = _1985;
    if (_2031)
    {
        float _2045 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2037 = _2045;
    }
    float _2047 = _2037;
    if (_2031)
    {
        float _2049 = rsqrt(_2027);
        _1377 = _2049;
    }
    float _2051 = _1377;
    float _2053 = _2051;
    if (_2031)
    {
        float _2055 = _2035 * _2047;
        _2039 = _2055;
    }
    float _2057 = _2039;
    if (_2031)
    {
        float _2059 = _2057 * 0.15915493667125701904296875;
        _2041 = _2059;
    }
    float _2061 = _2041;
    float _2063 = _2011;
    float _2065 = _2061;
    if (_2031)
    {
        float _2067 = _2061 * 6.283185482025146484375;
        float _2069 = sin(_2067);
        _2063 = _2069;
    }
    float _2071 = _2063;
    float _2073 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2075 = precise::max(0.0, _2073);
    float _2077 = _223;
    float _2079 = _2073;
    float _2081 = _2075;
    if (_2031)
    {
        float _2083 = _2061 * 6.283185482025146484375;
        float _2085 = cos(_2083);
        _2077 = _2085;
    }
    float _2087 = _2077;
    float _2089 = -_2017;
    float _2091 = -_2075;
    float _2093 = fma(_1985, _2089, _2091);
    if (_2031)
    {
        float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2079 = _2095;
    }
    float _2097 = _2079;
    float _2099 = _2097;
    if (!_2031)
    {
        _2065 = _2093;
    }
    float _2101 = _2065;
    float _2103 = _2101;
    if (_2031)
    {
        float _2105 = fma(_2071, _2097, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2043 = _2105;
    }
    float _2107 = _2043;
    float _2109 = floor(_2013);
    float _2111 = _2107;
    if (_2031)
    {
        float _2113 = _2087 + (-1.0);
        _2099 = _2113;
    }
    float _2115 = _2099;
    float _2117 = _2115;
    if (_2031)
    {
        float _2119 = _2051 * _2107;
        _1273 = _2119;
    }
    float _2121 = _1273;
    if (!_2031)
    {
        _2053 = _2019;
    }
    float _2123 = _2053;
    float _2125 = _2123;
    if (_2031)
    {
        float _2127 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2081 = _2127;
    }
    float _2129 = _2081;
    float _2131 = _2129;
    if (_2031)
    {
        float _2133 = _2019 * _2121;
        _2125 = _2133;
    }
    float _2135 = _2125;
    if (!_2031)
    {
        _2111 = _2021;
    }
    float _2137 = _2111;
    float _2139 = _2137;
    if (_2031)
    {
        float _2141 = _2021 * _2121;
        _2139 = _2141;
    }
    float _2143 = _2139;
    if (!_2031)
    {
        _2117 = _2023;
    }
    float _2145 = _2117;
    float _2147 = _2145;
    if (_2031)
    {
        float _2149 = fma(_2093, _2087, _2129);
        _2103 = _2149;
    }
    float _2151 = _2103;
    if (_2031)
    {
        float _2153 = _2135 * _2135;
        _2147 = _2153;
    }
    float _2155 = _2147;
    float _2157 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_2031)
    {
        _2131 = _2025;
    }
    float _2159 = _2131;
    float _2161 = _2159;
    if (_2031)
    {
        float _2163 = _2143 * _2143;
        _2161 = _2163;
    }
    float _2165 = _2161;
    float _2167 = fma(_2151, _2151, _2155);
    float _2169 = fma(_1415, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2171 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2173 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2157);
    float _2175 = _2167 + _2165;
    float _2177 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2171);
    float _2179 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2173);
    float _2181 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2003);
    float _2183 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2007);
    float _2185 = rsqrt(_2175);
    float _2187 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2177);
    float _2189 = _2179 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2191 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2193 = fma(_2015, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2191);
    float _2195 = precise::clamp(_2193, 0.0, 1.0);
    float _2197 = _2181 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2199 = _2187 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2201 = _2189 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2203 = -_2195;
    float _2205 = _2203 + 1.0;
    float _2207 = _2183 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2209 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2211 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2201);
    float _2213 = floor(_2169);
    float _2215 = -_2109;
    float _2217 = _2013 + _2215;
    float _2219 = -_2209;
    float _2221 = fma(_2219, _2001, 1.0);
    float _2223 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2211);
    float _2225 = _2189 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2227 = _2185 * _2135;
    float _2229 = _2185 * _2151;
    float _2231 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2223);
    float _2233 = abs(_2205);
    float _2235 = log2(_2233);
    float _2237 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2239 = _2185 * _2143;
    float _2241 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2225);
    float _2243 = -_2237;
    float _2245 = fma(_2229, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2243);
    float _2247 = 1.0 / _2231;
    float _2249 = -_2239;
    float _2251 = fma(_2249, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2245);
    float _2253 = _2189 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2255 = -_2213;
    float _2257 = _2169 + _2255;
    float _2259 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2241);
    float _2261 = fma(_2251, -0.5, 0.5);
    float _2263 = fma(_2251, 0.5, 0.5);
    float _2265 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2253);
    float _2267 = _2235 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2269 = log2(_2221);
    float _2271 = fma(_2263, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2273 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2265);
    float _2275 = _2229 + 1.0;
    float _2277 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2259);
    float _2279 = fma(_2263, _2271, -0.212114393711090087890625);
    float _2281 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2273);
    float _2283 = exp2(_2267);
    float _2285 = fma(_2263, _2279, 1.570728778839111328125);
    float _2287 = sqrt(_2261);
    float _2289 = _2269 * 0.693147182464599609375;
    float2 _6579 = float2(_2217, _2257);
    float _2291 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6579, float2(0.0), isnan(_6579)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6579, float2(0.0), isnan(_6579)), level(0.0)).x;
    float _2293 = _2289 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2295 = -_2229;
    float _2297 = fma(_2283, _2275, _2295);
    float _2299 = _2277 * _2247;
    float _2301 = _2281 * _2247;
    float _2303 = fma(_2297, 0.5, 0.5);
    float _2305 = fma(_2299, 0.5, 0.5);
    float _2307 = fma(_2301, -0.5, 0.5);
    float _2309 = _2287 * 0.636619746685028076171875;
    float _2311 = -_2285;
    float _2313 = fma(_2309, _2311, 1.0);
    float3 _6618 = float3(_2305, _2307, _2293);
    float _2315 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6618, float3(0.0), isnan(_6618)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6618, float3(0.0), isnan(_6618)), level(0.0)).x;
    float3 _6629 = float3(_2305, _2307, _2293);
    float4 _2318 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6629, float3(0.0), isnan(_6629)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6629, float3(0.0), isnan(_6629)), level(0.0)).xyzw;
    float _2320 = _2318.x;
    float _2322 = _2318.y;
    float _2324 = _2318.z;
    float _2326 = _2318.w;
    float2 _6645 = float2(_2313, _2303);
    float3 _2330 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6645, float2(0.0), isnan(_6645)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6645, float2(0.0), isnan(_6645)), level(0.0)).xyz;
    float _2332 = _2330.x;
    float _2334 = _2330.y;
    float _2336 = _2330.z;
    float _2338 = _1713 * _1757;
    float _2340 = _1713 * _1781;
    float _2342 = _1713 * _1751;
    float _2344 = _1693 * _1781;
    float _2346 = _1693 * _1757;
    float _2348 = _1709 * _1781;
    float _2350 = _1693 * _1751;
    float _2352 = fma(_1881, 100.0, _735);
    float _2354 = _1709 * _1751;
    float _2356 = -_1671;
    float _2358 = fma(_2356, _1735, _2340);
    float _2360 = fma(_1717, _1735, _2344);
    float _2362 = fma(_1711, _1735, _2348);
    float _2364 = -_1339;
    float _2366 = _2364 + _2352;
    float _2368 = fma(_1717, _1733, _2346);
    float _2370 = fma(_1711, _1737, _2354);
    float _2372 = fma(_1717, _1737, _2350);
    float _2374 = fma(_1719, _1629, _2358);
    float _2376 = fma(_1699, _1629, _2360);
    float _2378 = fma(_1695, _1629, _2362);
    float _2380 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2382 = _1709 * _1757;
    float _2384 = -_1671;
    float _2386 = fma(_2384, _1733, _2338);
    float _2388 = -_1671;
    float _2390 = fma(_2388, _1737, _2342);
    float _2392 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2380);
    float _2394 = fma(_1711, _1733, _2382);
    float _2396 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2398 = fma(_1719, _1615, _2386);
    float _2400 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2392);
    float _2402 = fma(_1699, _1615, _2368);
    float _2404 = fma(_1695, _1615, _2394);
    float _2406 = fma(_1719, _1623, _2390);
    float _2408 = _2400 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2410 = fma(_1699, _1623, _2372);
    float _2412 = fma(_1695, _1623, _2370);
    float _2414 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2396);
    float _2416 = 1.0 / _2408;
    float _2418 = _231 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2420 = _227 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2422 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2414);
    float _2424 = _2418 * _2398;
    float _2426 = _2418 * _2374;
    float _2428 = _2422 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2430 = _2418 * _2406;
    float _2432 = fma(_2420, _2402, _2424);
    float _2434 = fma(_2420, _2376, _2426);
    float _2436 = _2428 + _2408;
    float _2438 = fma(_2420, _2410, _2430);
    float _2440 = _2404 + _2432;
    float _2442 = _2235 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2444 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2446 = isnan(0.5);
    bool _2448 = _2444 || _2446;
    bool _2450 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2452 = _2448 || _2450;
    float _2454 = _2436 * _2416;
    float _2456 = _2454 * 0.5;
    float _2458 = _2277 + _2231;
    float _2460 = _2378 + _2434;
    float _2462 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2464 = fma(_2456, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2462);
    float _2466 = exp2(_2442);
    float _2468 = _2412 + _2438;
    float _2470 = _2458 * 0.5;
    float _2472 = 1.0 / _2464;
    float _2474 = in.m_76.x;
    float _2476 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2478 = _2472 * _2476;
    float _2480 = abs(_2478);
    float _2482 = log2(_2480);
    bool _2484 = _2478 <= 8000.0;
    bool _2486 = isnan(_2478);
    bool _2488 = _2484 || _2486;
    bool _2490 = isnan(8000.0);
    bool _2492 = _2488 || _2490;
    float _2494 = float(_2492);
    float _2496 = _2482 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2498 = exp2(_2496);
    float _2500 = fma(_2498, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2502 = precise::clamp(_2500, 0.0, 1.0);
    float _2504 = _2189 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2506 = fma(_2502, -2.0, 3.0);
    float _2508 = _2502 * _2502;
    float _2510 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2504);
    float _2512 = _2508 * _2506;
    float _2514 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2510);
    float _2516 = _2510;
    if (_2452)
    {
        _2516 = 1.0;
    }
    float _2518 = _2516;
    float _2520 = -_2512;
    float _2522 = _2520 + 1.0;
    float _2524 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2514);
    float _2526 = fma(_2522, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2512);
    float _2528 = _2231 * 0.5;
    float _2530 = _2524 + _2231;
    float _2532 = fma(_2281, -0.5, _2528);
    float _2534 = _2530 * 0.5;
    float _2536 = _2528;
    float _2538 = _2518;
    if (_2452)
    {
        _2536 = 1.0;
    }
    float _2540 = _2536;
    float _2542 = _2540;
    float _2544 = _2326;
    float _2546 = _2324;
    float _2548 = _2474;
    float _2550 = _2322;
    float _2552 = _2320;
    if (!_2452)
    {
        float _2554 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2556 = _2554 * 0.15915493667125701904296875;
        float _2558 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2560 = _2556 * 6.283185482025146484375;
        float _2562 = cos(_2560);
        float _2564 = _2558 * 0.15915493667125701904296875;
        float _2566 = _2556 * 6.283185482025146484375;
        float _2568 = sin(_2566);
        float _2570 = 1.0 / _2562;
        float _2572 = _2564 * 6.283185482025146484375;
        float _2574 = cos(_2572);
        float _2576 = _2568 * _2570;
        float _2578 = _2564 * 6.283185482025146484375;
        float _2580 = sin(_2578);
        float _2582 = _2574 * _2576;
        float _2584 = 1.0 / _2582;
        float _2586 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2588 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2586;
        float _2590 = 1.0 / _2588;
        float _2592 = _2580 * _2584;
        float _2594 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2596 = fma(_2478, _2592, _2594);
        float _2598 = _2596 * _2590;
        float _2600 = precise::clamp(_2598, 0.0, 1.0);
        _2542 = _2600;
    }
    float _2602 = _2542;
    if (!_2452)
    {
        float _2604 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2606 = _2604 * 0.15915493667125701904296875;
        float _2608 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2610 = _2606 * 6.283185482025146484375;
        float _2612 = cos(_2610);
        float _2614 = _2608 * 0.15915493667125701904296875;
        float _2616 = _2606 * 6.283185482025146484375;
        float _2618 = sin(_2616);
        float _2620 = 1.0 / _2612;
        float _2622 = _2614 * 6.283185482025146484375;
        float _2624 = cos(_2622);
        float _2626 = _2618 * _2620;
        float _2628 = _2614 * 6.283185482025146484375;
        float _2630 = sin(_2628);
        float _2632 = _2624 * _2626;
        float _2634 = 1.0 / _2632;
        float _2636 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2638 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2636;
        float _2640 = 1.0 / _2638;
        float _2642 = _2630 * _2634;
        float _2644 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2646 = fma(_2478, _2642, _2644);
        float _2648 = _2646 * _2640;
        float _2650 = precise::clamp(_2648, 0.0, 1.0);
        float _2652 = -_2650;
        float _2654 = _2652 + 1.0;
        _2538 = _2654;
    }
    float _2656 = _2538;
    float _2658 = _2494 * _2526;
    float _2660 = -_2466;
    float _2662 = _2660 + 1.0;
    float _2664 = -_2291;
    float _2666 = _2664 + 1.0;
    float _2668 = _2658 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2670 = _2662 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2277;
    out.gl_Position.y = _2281;
    out.gl_Position.z = _2524;
    out.gl_Position.w = _2231;
    bool _2672 = _2015 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2674 = isnan(_2015);
    bool _2676 = _2672 || _2674;
    bool _2678 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2680 = _2676 || _2678;
    float _2682 = _2666 * _2668;
    float _2684 = precise::clamp(_2682, 0.0, 1.0);
    float _2686 = _2670 * _2315;
    float _2688 = -_2670;
    float _2690 = _2688 + 1.0;
    out.m_86.x = _2470;
    out.m_86.y = _2532;
    out.m_86.z = _2534;
    out.m_86.w = _2231;
    float _2692 = -_2684;
    float _2694 = fma(_2692, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2696 = _2326 * _2686;
    out.m_88.x = _2440;
    out.m_88.y = _2460;
    out.m_88.z = _2468;
    float _2698 = _2694 * _2474;
    float _2700 = _2336 * _2686;
    float _2702 = fma(_2334, _2696, _2322);
    float _2704 = fma(_2332, _2696, _2320);
    float _2706 = _2326 * _2690;
    float _2708 = _2698 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2710 = fma(_2326, _2700, _2324);
    float _2712 = _2602 * _2656;
    float _2714 = _2698;
    if (!_2680)
    {
        _2544 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2716 = _2544;
    out.m_90.x = _2708;
    float _2718 = _2716;
    float _2720 = _2716;
    if (!_2680)
    {
        _2546 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2722 = _2546;
    float _2724 = _2712 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2726 = _2722;
    float _2728 = _2722;
    if (!_2680)
    {
        _2548 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2730 = _2548;
    out.m_92.x = _2704;
    out.m_92.y = _2702;
    out.m_92.z = _2710;
    out.m_92.w = _2706;
    float _2732 = _2730;
    float _2734 = _2730;
    if (!_2680)
    {
        _2714 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2736 = _2714;
    float _2738 = _2736;
    float _2740 = _2736;
    if (!_2680)
    {
        _2550 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2742 = _2550;
    float _2744 = _2742;
    float _2746 = _2742;
    if (!_2680)
    {
        _2552 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2748 = _2552;
    bool _2750 = !_2680;
    float _2752 = _2748;
    float _2754 = _2748;
    if (!_2750)
    {
        bool _2756 = _2015 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2758 = isnan(_2015);
        bool _2760 = _2756 || _2758;
        bool _2762 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2764 = _2760 || _2762;
        if (!_2764)
        {
            float _2766 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2768 = _2015 + _2766;
            float _2770 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2772 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2770;
            float _2774 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2776 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2778 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2780 = _2778 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2782 = 1.0 / _2772;
            float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2786 = _2784 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2788 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2790 = _2788 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2792 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2794 = _2792 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2796 = _2768 * _2782;
            float _2798 = precise::clamp(_2796, 0.0, 1.0);
            float _2800 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2802 = _2800 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2804 = fma(_2798, _2776, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2806 = fma(_2798, _2780, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2808 = fma(_2798, _2786, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2810 = fma(_2798, _2802, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2812 = fma(_2798, _2790, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2814 = fma(_2798, _2794, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2728 = _2808;
            _2746 = _2804;
            _2720 = _2806;
            _2740 = _2812;
            _2734 = _2810;
            _2754 = _2814;
            _2816 = true;
        }
        else
        {
            bool _2818 = _2015 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2820 = isnan(_2015);
            bool _2822 = _2818 || _2820;
            bool _2824 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2826 = _2822 || _2824;
            if (!_2826)
            {
                _2718 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2828 = _2718;
            _2720 = _2828;
            if (!_2826)
            {
                _2726 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2830 = _2726;
            _2728 = _2830;
            if (!_2826)
            {
                _2732 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2832 = _2732;
            _2734 = _2832;
            if (!_2826)
            {
                _2738 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2834 = _2738;
            _2740 = _2834;
            if (!_2826)
            {
                _2744 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2836 = _2744;
            _2746 = _2836;
            if (!_2826)
            {
                _2752 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2838 = _2752;
            bool _2840 = !_2826;
            _2754 = _2838;
            if (!_2840)
            {
                bool _2842 = _2015 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2844 = isnan(_2015);
                bool _2846 = _2842 || _2844;
                bool _2848 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2850 = _2846 || _2848;
                if (!_2850)
                {
                    float _2852 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2854 = _2015 + _2852;
                    float _2856 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2858 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2856;
                    float _2860 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2862 = _2860 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2864 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2866 = _2864 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2868 = 1.0 / _2858;
                    float _2870 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2872 = _2870 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2874 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2876 = _2874 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2878 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2880 = _2878 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2882 = _2854 * _2868;
                    float _2884 = precise::clamp(_2882, 0.0, 1.0);
                    float _2886 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2888 = _2886 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2890 = fma(_2884, _2862, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2892 = fma(_2884, _2866, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2894 = fma(_2884, _2872, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2896 = fma(_2884, _2888, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2898 = fma(_2884, _2876, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2900 = fma(_2884, _2880, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2728 = _2894;
                    _2746 = _2890;
                    _2720 = _2892;
                    _2740 = _2898;
                    _2734 = _2896;
                    _2754 = _2900;
                    _2816 = true;
                }
                else
                {
                    _2728 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2746 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2720 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2740 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2734 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2754 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2816 = false;
    float _2902 = _2728;
    float _2904 = _2746;
    float _2906 = _2720;
    float _2908 = _2740;
    float _2910 = _2734;
    float _2912 = _2754;
    float _2914 = fma(_2460, -0.5, 0.5);
    float _2916 = precise::clamp(_2914, 0.0, 1.0);
    float _2918 = -_2902;
    float _2920 = _2918 + _2904;
    float _2922 = -_2906;
    float _2924 = _2922 + _2908;
    out.m_94.x = 0.0;
    float _2926 = -_2910;
    float _2928 = _2926 + _2912;
    float _2930 = fma(_2916, _2920, _2902);
    float _2932 = fma(_2916, _2924, _2906);
    bool _2934 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2936 = _2930 * 0.586610972881317138671875;
    float _2938 = fma(_2916, _2928, _2910);
    float _2940 = _2724 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2942 = fma(_2932, 0.298911988735198974609375, _2936);
    bool _2944 = _2602 > 0.0;
    bool _2946 = isnan(_2602);
    bool _2948 = _2944 || _2946;
    bool _2950 = isnan(0.0);
    bool _2952 = _2948 || _2950;
    float _2954 = fma(_2938, 0.114477999508380889892578125, _2942);
    out.m_51.x = _2940;
    bool _2956 = _2656 <= 0.0;
    bool _2958 = !_2952;
    bool _2960 = _2956 || _2958;
    float _2962 = -_2954;
    float _2964 = _2932 + _2962;
    float _2966 = -_2954;
    float _2968 = _2938 + _2966;
    float _2970 = fma(_2964, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2954);
    float _2972 = -_2954;
    float _2974 = _2930 + _2972;
    float _2976 = fma(_2974, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2954);
    float _2978 = fma(_2968, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2954);
    bool _2980 = !_2934;
    if (!_2980)
    {
        float _2982 = -_1973;
        float _2984 = _2982 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2986 = -_1977;
        float _2988 = _2986 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2990 = -_1981;
        float _2992 = _2990 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2994 = _2984 * _2984;
        float _2996 = fma(_2988, _2988, _2994);
        float _2998 = fma(_2992, _2992, _2996);
        float _3000 = sqrt(_2998);
        float _3002 = rsqrt(_2998);
        float _3004 = -_3000;
        float _3006 = _3004 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3008 = _3006 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3010 = precise::clamp(_3008, 0.0, 1.0);
        float _3012 = _2988 * _3002;
        float _3014 = _2984 * _3002;
        float _3016 = abs(_3010);
        float _3018 = log2(_3016);
        float _3020 = _2992 * _3002;
        float _3022 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3024 = _2460 * _3014;
        float _3026 = -_3014;
        float _3028 = -_3022;
        float _3030 = fma(_3026, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3028);
        float _3032 = fma(_2440, _3012, _3024);
        float _3034 = -_3020;
        float _3036 = fma(_3034, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3030);
        float _3038 = fma(_2468, _3020, _3032);
        float _3040 = precise::clamp(_3038, 0.0, 1.0);
        float _3042 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3044 = _3036 + _3042;
        float _3046 = _3018 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3048 = _3044 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3050 = precise::clamp(_3048, 0.0, 1.0);
        float _3052 = exp2(_3046);
        float _3054 = _3052 * _3050;
        float _3056 = _3040 * _3054;
        float _3058 = _3056 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3060 = _3056 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3062 = _3056 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _3058;
        out.m_94.y = _3060;
        out.m_94.z = _3062;
    }
    out.m_96.x = _2970;
    out.m_96.y = _2976;
    out.m_96.z = _2978;
    if (!_2960)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3064 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_51.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3064;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2816 = false;
    bool _629 = false;
    bool _455 = false;
    bool _349 = false;
    bool _253 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_48.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    if (!_119)
    {
        out.m_51.x = 0.0;
    }
    int _125 = 0;
    if (!_119)
    {
        float _127 = _123 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3120 = as_type<float>(_129);
        out.gl_Position.z = _3120;
    }
    if (!_119)
    {
        return out;
    }
    float _133 = in.m_53.w;
    float _135 = float(_115);
    float _137 = 1.0 / _135;
    float _139 = -_133;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_133);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = _141 * _137;
    bool _155 = _141 >= _135;
    bool _157 = !_151;
    bool _159 = _155 || _157;
    out.m_55.x = _153;
    float _161 = _133;
    float _163 = _141;
    if (_159)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _161;
    if (_159)
    {
        out.m_51.x = 0.0;
    }
    if (_159)
    {
        float _167 = _165 * 5.0;
        _131 = as_type<int>(_167);
    }
    int _169 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3192 = as_type<float>(_169);
        out.gl_Position.z = _3192;
    }
    if (_159)
    {
        return out;
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = in.m_60.x;
    float _175 = in.m_60.y;
    float _177 = in.m_60.z;
    float _179 = in.m_62.x;
    float _181 = in.m_62.y;
    float _183 = in.m_62.z;
    float _185 = in.m_64.x;
    float _187 = in.m_64.y;
    float _189 = in.m_64.z;
    float _191 = in.m_66.x;
    float _193 = in.m_66.y;
    float _195 = in.m_66.z;
    int _197 = as_type<int>(_171) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_171) & 2;
    bool _203 = _201 != 0;
    bool _205 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _207 = _175 * _181;
    float _209 = _175 * _187;
    float _211 = fma(_173, _179, _207);
    float _213 = _175 * _193;
    float _215 = fma(_173, _185, _209);
    float _217 = fma(_177, _183, _211);
    float _219 = fma(_173, _191, _213);
    float _221 = fma(_177, _189, _215);
    float _223 = fma(_177, _195, _219);
    bool _225 = !_199;
    float _227 = _225 ? (-0.5) : 0.5;
    bool _229 = !_203;
    float _231 = _229 ? (-0.5) : 0.5;
    bool _233 = !_205;
    float _251;
    if (!_233)
    {
        float _235 = in.m_68.x;
        float _237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _239 = _235 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _243 = _241 * _237;
        float _245 = floor(_243);
        float _247 = -_245;
        float _249 = _243 + _247;
        _251 = _249;
        _253 = true;
    }
    else
    {
        _251 = _153;
    }
    _253 = false;
    float _255 = _251;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = _255 + _257;
    bool _261 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _263 = isnan(_255);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _273;
    float _277 = -_271;
    float _279 = _277 + 1.0;
    bool _281 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _283 = isnan(_255);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _293;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _299 = 1.0 / _275;
    float _301 = _291 * _279;
    float _303 = -_291;
    float _305 = _303 + 1.0;
    float _307 = _259 * _299;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _309;
    float _313 = fma(_295, _307, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _315 = fma(_311, _307, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _317 = _313 * _301;
    float _319 = _315 * _301;
    float _321 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[143].x, _317);
    float _323 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[143].y, _319);
    float _325 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[144].x, _321);
    float _327 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[144].y, _323);
    bool _329 = !_297;
    float _347;
    if (!_329)
    {
        float _331 = in.m_68.x;
        float _333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _335 = _331 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _337 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _339 = _337 * _333;
        float _341 = floor(_339);
        float _343 = -_341;
        float _345 = _339 + _343;
        _347 = _345;
        _349 = true;
    }
    else
    {
        _347 = _153;
    }
    _349 = false;
    float _351 = _347;
    bool _353 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _355 = isnan(_351);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _369 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _371 = isnan(_351);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _387 = _351 + _385;
    float _389 = -_363;
    float _391 = _389 + 1.0;
    float _393 = 1.0 / _367;
    float _395 = _379 * _391;
    float _397 = -_379;
    float _399 = _397 + 1.0;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _405 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _409 = _401 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = _403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _413 = _407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _415 = _383 * _393;
    float _417 = fma(_415, _387, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _419 = in.m_70.x;
    float _421 = in.m_70.y;
    float _423 = _417 * _395;
    float _425 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[115].x, _423);
    float _427 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[116].x, _425);
    float _429 = _427 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _409;
    out.m_72.y = _411;
    out.m_72.z = _413;
    out.m_72.w = _429;
    float _431 = _327 * _421;
    float _433 = _325 * _419;
    bool _435 = !_405;
    float _453;
    if (!_435)
    {
        float _437 = in.m_68.x;
        float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _441 = _437 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _445 = _443 * _439;
        float _447 = floor(_445);
        float _449 = -_447;
        float _451 = _445 + _449;
        _453 = _451;
        _455 = true;
    }
    else
    {
        _453 = _153;
    }
    _455 = false;
    float _457 = _453;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _461 = _457 + _459;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _467 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _469 = isnan(_457);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _487 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _489 = isnan(_457);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = 1.0 / _465;
    float _501 = -_477;
    float _503 = _501 + 1.0;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _505;
    bool _509 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _511 = isnan(_457);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = _497 * _503;
    float _523 = -_497;
    float _525 = _523 + 1.0;
    bool _527 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _529 = 1.0 / _481;
    float _531 = 1.0 / _485;
    float _533 = _507 * _499;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _539 = fma(_533, _461, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _541;
    float _545 = _537 * _529;
    float _547 = _519 * _525;
    bool _549 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _551 = isnan(_457);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _563 = _457 + _561;
    float _565 = -_519;
    float _567 = _565 + 1.0;
    float _569 = _539 * _547;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _573 = _457 + _571;
    float _575 = fma(_545, _563, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _577 = _543 * _531;
    float _579 = -_559;
    float _581 = _579 + 1.0;
    float _583 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[131].x, _569);
    float _585 = fma(_577, _573, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _587 = _477 * _581;
    float _589 = fma(_575, _521, _583);
    float _591 = fma(_585, _587, _589);
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _597 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[134].x, _591);
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _601 = _593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _603 = _595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _605 = _597 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _607 = _599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_74.x = _601;
    out.m_74.y = _603;
    out.m_74.z = _607;
    out.m_74.w = _605;
    bool _609 = !_527;
    float _627;
    if (!_609)
    {
        float _611 = in.m_68.x;
        float _613 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _615 = _611 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _617 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[14].x, _141);
        float _619 = _617 * _613;
        float _621 = floor(_619);
        float _623 = -_621;
        float _625 = _619 + _623;
        _627 = _625;
        _629 = true;
    }
    else
    {
        _627 = _153;
    }
    _629 = false;
    float _631 = _627;
    float _633 = in.m_68.x;
    float _635 = in.m_68.y;
    float _637 = in.m_68.z;
    float _639 = in.m_68.w;
    float _641 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _643 = in.m_48.x;
    float _645 = in.m_48.y;
    float _647 = in.m_48.z;
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _651 = _649 != 0;
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _655 = _653 != 0;
    float _657 = in.m_76.y;
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _661 = _659 != 0;
    float _663 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _667 = _665 != 0;
    float _669 = in.m_66.w;
    float _671 = in.m_64.w;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _679 = _631 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _681 = isnan(_631);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _687 = _683 || _685;
    float _689 = float(_687);
    bool _691 = _639 > 0.5;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _697 = _187 * _645;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _701 = _699 != 0;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _705 = _703 != 0;
    float _707 = 1.0 / _695;
    float _709 = -_231;
    int _711 = _691 ? as_type<int>(_709) : as_type<int>(_231);
    float _713 = fma(_185, _643, _697);
    bool _715 = _633 > 0.5;
    float _717 = _633 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _723 = -_227;
    int _725 = _715 ? as_type<int>(_723) : as_type<int>(_227);
    float _727 = -_673;
    float _729 = fma(_717, 2.0, _727);
    int _731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _733 = _731 != 0;
    float _735 = _645 + _657;
    float _737 = 1.0 / _721;
    float _739 = fma(_189, _647, _713);
    float _741 = _193 * _645;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _745 = _743 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _751 = fma(_191, _643, _741);
    float _753 = 1.0 / _677;
    float _755 = _635 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _759 = fma(_195, _647, _751);
    float _761 = fma(_755, -2.0, _757);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _767 = 1.0 / _749;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _769;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _777;
    float _781 = _771 * _737;
    float _783 = _633 * 2.0;
    float _785 = 1.0 / _765;
    float _787 = _779 * _707;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _795 = _631 + _793;
    float _797 = -_689;
    float _799 = _797 + 1.0;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _803 = _663 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _805 = 1.0 / _745;
    float _807 = 0.0;
    float _809 = _801;
    if (!_733)
    {
        _807 = _635;
    }
    float _811 = _807;
    float _813 = _739 + _671;
    float _815 = _811;
    if (_733)
    {
        _815 = _633;
    }
    float _817 = _815;
    float _819 = 1.0 / _775;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _825 = _637 * 2.0;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _829 = _823 * _753;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _831;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _839 = floor(_783);
    float _841 = _635 + _633;
    float _843 = _833 * _767;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _845;
    float _849 = _837 * _785;
    float _851 = _635 + _637;
    bool _853 = !_651;
    float _855 = _853 ? _227 : as_type<float>(_725);
    float _857 = _791 * _805;
    float _859 = floor(_825);
    bool _861 = _635 > 0.5;
    float _863 = _851 + (-1.0);
    float _865 = _847 * _819;
    float _867 = -_231;
    int _869 = _861 ? as_type<int>(_867) : as_type<int>(_231);
    float _871 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _873 = _841 + (-1.0);
    float _875 = -_227;
    int _877 = _861 ? as_type<int>(_875) : as_type<int>(_227);
    bool _879 = !_655;
    float _881 = _879 ? _231 : as_type<float>(_869);
    float _883 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _885 = _637 > 0.5;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _889 = _631 + _887;
    bool _891 = !_661;
    float _893 = _891 ? _231 : as_type<float>(_711);
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _897 = _631 + _895;
    float _899 = -_227;
    int _901 = _885 ? as_type<int>(_899) : as_type<int>(_227);
    float _903 = fma(_857, _889, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _905 = _859 > 0.0;
    float _907 = fma(_829, _897, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _909 = _859 >= 0.0;
    bool _911 = isnan(_859);
    bool _913 = _909 || _911;
    bool _915 = isnan(0.0);
    bool _917 = _913 || _915;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _921 = _631 + _919;
    bool _923 = !_667;
    float _925 = _923 ? _227 : as_type<float>(_901);
    bool _927 = _839 > 0.0;
    float _929 = fma(_787, _921, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _933 = _631 + _931;
    bool _935 = _839 >= 0.0;
    bool _937 = isnan(_839);
    bool _939 = _935 || _937;
    bool _941 = isnan(0.0);
    bool _943 = _939 || _941;
    bool _945 = _631 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _947 = isnan(_631);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _953 = _949 || _951;
    float _955 = float(_953);
    float _957 = fma(_781, _933, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _959 = fma(_843, _795, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _963 = _631 + _961;
    bool _965 = _631 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _967 = isnan(_631);
    bool _969 = _965 || _967;
    bool _971 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _973 = _969 || _971;
    float _975 = float(_973);
    float _977 = -_955;
    float _979 = _977 + 1.0;
    bool _981 = _631 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _983 = isnan(_631);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    float _993 = fma(_865, _963, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _995 = _631 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _997 = isnan(_631);
    bool _999 = _995 || _997;
    bool _1001 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1003 = _999 || _1001;
    float _1005 = float(_1003);
    float _1007 = _975 * _979;
    float _1009 = -_975;
    float _1011 = _1009 + 1.0;
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1015 = _631 + _1013;
    bool _1017 = !_701;
    float _1019 = _1017 ? _227 : as_type<float>(_877);
    float _1021 = -_1005;
    float _1023 = _1021 + 1.0;
    float _1025 = _1005 * _1011;
    bool _1027 = _631 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1029 = isnan(_631);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1035 = _1031 || _1033;
    float _1037 = float(_1035);
    float _1039 = fma(_849, _1015, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1041 = _991 * _1023;
    float _1043 = -_991;
    float _1045 = _1043 + 1.0;
    float _1047 = _1015;
    if (!_733)
    {
        _1047 = _637;
    }
    float _1049 = _1047;
    float _1051 = -_1037;
    float _1053 = _1051 + 1.0;
    bool _1055 = _637 > 0.5;
    float _1057 = _1037 * _1045;
    bool _1059 = _631 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1061 = isnan(_631);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1067 = _1063 || _1065;
    float _1069 = float(_1067);
    float _1071 = _689 * _1053;
    float _1073 = _1049;
    if (_733)
    {
        _1073 = _635;
    }
    float _1075 = _1073;
    bool _1077 = _631 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1079 = isnan(_631);
    bool _1081 = _1077 || _1079;
    bool _1083 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1085 = _1081 || _1083;
    float _1087 = float(_1085);
    float _1089 = -_1069;
    float _1091 = _1089 + 1.0;
    float _1093 = -_231;
    int _1095 = _1055 ? as_type<int>(_1093) : as_type<int>(_231);
    float _1097 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[83].w, _801);
    float _1099 = _1069 * _799;
    float _1101 = _1087 * _1091;
    if (!_733)
    {
        _809 = _637;
    }
    float _1103 = _809;
    float _1105 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1097);
    bool _1107 = !_705;
    float _1109 = _1107 ? _231 : as_type<float>(_1095);
    float _1111 = -_141;
    float _1113 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[76].x, _729);
    float _1115 = _1103;
    if (_733)
    {
        _1115 = _635;
    }
    float _1117 = _1115;
    float _1119 = -_1087;
    float _1121 = _1119 + 1.0;
    int _1123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1125 = _1123 != 0;
    int _1127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1129 = _1127 != 0;
    int _1131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1133 = _1131 != 0;
    float _1135 = _929 * _1101;
    float _1137 = _641 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1139 = _855 + 0.5;
    float _1141 = _759 + _669;
    float _1143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1145 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1135);
    float _1147 = fma(_1137, _1139, _1113);
    float _1149 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _761);
    float _1151 = fma(_907, _1099, _1145);
    float _1153 = _817 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1159 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1163 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1155);
    float _1165 = _881 + (-0.5);
    float _1167 = fma(_1159, -2.0, _827);
    float _1169 = -_1161;
    float _1171 = fma(_1153, 2.0, _1169);
    float _1173 = -_1105;
    float _1175 = _1173 + 1.0;
    float _1177 = -_803;
    float _1179 = -_1149;
    float _1181 = fma(_1177, _1165, _1179);
    float _1183 = fma(_957, _1071, _1151);
    float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1187 = _735 + _1185;
    float _1189 = _1143 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1191 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1193 = _1141 + _1191;
    float _1195 = fma(_903, _1057, _1183);
    float _1197 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1199 = _1019 + 0.5;
    float _1201 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1203 = fma(_959, _1041, _1195);
    float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1207 = _813 + _1205;
    float _1209 = _893 + (-0.5);
    float _1211 = fma(_1039, _1025, _1203);
    float _1213 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1197);
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1217 = fma(_993, _1007, _1211);
    float _1219 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1213);
    float _1221 = _1187 * _1187;
    float _1223 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1225 = !_1125;
    int _1227 = _1225 ? 0 : 1;
    float _1229 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1167);
    bool _1231 = _1219 >= 0.0;
    float _1233 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1223);
    float _1235 = fma(_1207, _1207, _1221);
    float _1237 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1215);
    float _1239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1241 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1233);
    float _1243 = fma(_1193, _1193, _1235);
    float _1245 = -_1201;
    float _1247 = -_1229;
    float _1249 = fma(_1245, _1209, _1247);
    float _1251 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1237);
    float _1253 = -_1241;
    float _1255 = _1253 + 1.0;
    float _1257 = _635 * 2.0;
    float _1259 = _925 + 0.5;
    float _1261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1263 = -_1251;
    float _1265 = _1263 + 1.0;
    float _1267 = fma(_881, _1255, _1181);
    float _1269 = _1255;
    int _1271 = as_type<int>(_1175);
    float _1273 = _1203;
    if (_1231)
    {
        _1269 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1275 = _1269;
    float _1277 = -_141;
    float _1279 = fma(_1277, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1171);
    float _1281 = -_1265;
    float _1283 = fma(_855, _1281, _1147);
    float _1285 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1163);
    float _1287 = -_1109;
    float _1289 = _1287 + 0.5;
    float _1291 = rsqrt(_1243);
    float _1293 = fma(_893, _1175, _1249);
    if (_1231)
    {
        float _1295 = _1275 * 5.0;
        _1271 = as_type<int>(_1295);
    }
    int _1297 = _1271;
    float _1299 = fma(_1189, _1259, _1279);
    float _1301 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1303 = -_1285;
    float _1305 = _1303 + 1.0;
    float _1307 = _433 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1309 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1311 = floor(_1257);
    float _1313 = _1301 * _1239;
    float _1315 = -_1305;
    float _1317 = fma(_925, _1315, _1299);
    float _1319 = _1309 * _1261;
    float _1321 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1217);
    float _1323 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    if (_1231)
    {
        out.m_51.x = 0.0;
    }
    bool _1325 = !_1129;
    int _1327 = _1325 ? 0 : 1;
    float _1329 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1331 = log2(_1329);
    float _1333 = _1323 * _1291;
    out.m_78.x = _1313;
    out.m_78.y = _1319;
    bool _1335 = !_1133;
    int _1337 = _1335 ? 0 : 1;
    float _1339 = _1187 * _1333;
    out.m_80.x = _1283;
    out.m_80.y = _1267;
    out.m_80.z = _1317;
    out.m_80.w = _1293;
    bool _1341 = _1311 > 0.0;
    if (_1231)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5090 = as_type<float>(_1297);
        out.gl_Position.z = _5090;
    }
    float _1343 = _1207 * _1333;
    out.m_82.x = _1321;
    if (_1231)
    {
        return out;
    }
    float _1345 = -_1339;
    float _1347 = _735 + _1345;
    float _1349 = -_1343;
    float _1351 = _813 + _1349;
    int _1353 = _917 ? 0 : 1;
    float _1355 = _1331 * _141;
    float _1357 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1359 = _1347 + _1357;
    float _1361 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1363 = _1351 + _1361;
    int _1365 = ~_1353;
    int _1367 = _1365 + 1;
    int _1369 = _1367 + 1;
    float _1371 = _1193 * _1333;
    float _1373 = _1359 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1375 = _1369;
    float _1377 = _1371;
    if (!_905)
    {
        int _1379 = ~_1353;
        int _1381 = _1379 + 1;
        _1375 = _1381;
    }
    int _1383 = _1375;
    float _1385 = exp2(_1355);
    float _1387 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1373);
    int _1389 = abs(_1227);
    float _1391 = in.m_84.x;
    float _1393 = in.m_84.y;
    float _1395 = in.m_84.z;
    bool _1397 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1399 = isnan(1.0);
    bool _1401 = _1397 || _1399;
    bool _1403 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1405 = _1401 || _1403;
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1409 = 1.0 + _1407;
    float _1411 = float(_1383);
    float _1413 = -_1371;
    float _1415 = _1141 + _1413;
    float _1417 = float(_1389);
    float _1419 = 1.0 / _1409;
    bool _1421 = _1311 >= 0.0;
    bool _1423 = isnan(_1311);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan(0.0);
    bool _1429 = _1425 || _1427;
    float _1431 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1433 = _1415 + _1431;
    int _1435 = _943 ? 0 : 1;
    float _1437 = _1417 * _1411;
    bool _1439 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1441 = isnan(0.0);
    bool _1443 = _1439 || _1441;
    bool _1445 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1447 = _1443 || _1445;
    float _1449 = -_1385;
    float _1451 = _1449 + 1.0;
    float _1453 = -_1339;
    float _1455 = _1187 + _1453;
    float _1457 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1387);
    float _1459 = _1437 * (-2.0);
    float _1461 = -_1343;
    float _1463 = _1207 + _1461;
    float _1465 = _1447 ? _1451 : 0.0;
    float _1467 = _1455 * _1455;
    float _1469 = fma(_883, _1459, _883);
    bool _1471 = _1457 >= 0.0;
    float _1473 = -_1371;
    float _1475 = _1193 + _1473;
    int _1477 = ~_1435;
    int _1479 = _1477 + 1;
    int _1481 = _1479 + 1;
    float _1483 = fma(_1463, _1463, _1467);
    float _1485 = fma(_1459, _1391, _1391);
    float _1487 = _633 + (-0.5);
    int _1489 = _1481;
    float _1491 = _1463;
    if (!_927)
    {
        int _1493 = ~_1435;
        int _1495 = _1493 + 1;
        _1489 = _1495;
    }
    int _1497 = _1489;
    if (_1405)
    {
        float _1499 = _1465 * _1419;
        _163 = _1499;
    }
    float _1501 = _163;
    int _1503 = _1429 ? 0 : 1;
    float _1505 = fma(_1487, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1485);
    int _1507 = abs(_1327);
    float _1509 = fma(_1475, _1475, _1483);
    int _1511 = ~_1503;
    int _1513 = _1511 + 1;
    int _1515 = _1513 + 1;
    float _1517 = fma(_1469, _1501, _1505);
    int _1519 = _1515;
    if (!_1341)
    {
        int _1521 = ~_1503;
        int _1523 = _1521 + 1;
        _1519 = _1523;
    }
    int _1525 = _1519;
    int _1527 = abs(_1337);
    float _1529 = sqrt(_1509);
    float _1531 = _1517 * 0.15915493667125701904296875;
    float _1533 = float(_1525);
    if (_1471)
    {
        out.m_51.x = 0.0;
    }
    if (_1471)
    {
        _1491 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1535 = _1491;
    float _1537 = _1531 * 6.283185482025146484375;
    float _1539 = sin(_1537);
    int _1541 = as_type<int>(_1535);
    if (_1471)
    {
        float _1543 = _1535 * 5.0;
        _1541 = as_type<int>(_1543);
    }
    int _1545 = _1541;
    float _1547 = float(_1497);
    float _1549 = float(_1507);
    if (_1471)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5384 = as_type<float>(_1545);
        out.gl_Position.z = _5384;
    }
    float _1551 = _1549 * _1547;
    float _1553 = _635 + (-0.5);
    if (_1471)
    {
        return out;
    }
    float _1555 = -_735;
    float _1557 = _1555 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1559 = _1551 * (-2.0);
    float _1561 = -_813;
    float _1563 = _1561 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1565 = -_1141;
    float _1567 = _1565 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1569 = _1557 * _1557;
    float _1571 = fma(_1559, _1393, _1393);
    float _1573 = float(_1527);
    float _1575 = _637 + _633;
    float _1577 = fma(_1563, _1563, _1569);
    float _1579 = fma(_1553, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1571);
    float _1581 = fma(_871, _1559, _871);
    float _1583 = _1573 * _1533;
    float _1585 = fma(_1567, _1567, _1577);
    float _1587 = _1575 + (-1.0);
    float _1589 = _1583 * (-2.0);
    float _1591 = rsqrt(_1585);
    float _1593 = fma(_1581, _1501, _1579);
    float _1595 = _637 + (-0.5);
    float _1597 = fma(_1587, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1599 = fma(_1589, _1395, _1395);
    float _1601 = _1593 * 0.15915493667125701904296875;
    float _1603 = _431 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1605 = fma(_1597, _1589, _1597);
    float _1607 = fma(_1595, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1599);
    float _1609 = _1531 * 6.283185482025146484375;
    float _1611 = cos(_1609);
    float _1613 = fma(_1605, _1501, _1607);
    float _1615 = _1563 * _1591;
    float _1617 = _1601 * 6.283185482025146484375;
    float _1619 = sin(_1617);
    float _1621 = _1613 * 0.15915493667125701904296875;
    float _1623 = _1567 * _1591;
    float _1625 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1627 = _1615 * _1625;
    float _1629 = _1557 * _1591;
    float _1631 = _1291 * _1529;
    float _1633 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1635 = _1623 * _1633;
    float _1637 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1639 = -_1627;
    float _1641 = fma(_1623, _1637, _1639);
    float _1643 = _1601 * 6.283185482025146484375;
    float _1645 = cos(_1643);
    float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1649 = _1629 * _1647;
    float _1651 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1653 = -_1635;
    float _1655 = fma(_1629, _1651, _1653);
    float _1657 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _231);
    float _1659 = _1631 * _1603;
    float _1661 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1663 = -_1649;
    float _1665 = fma(_1615, _1661, _1663);
    float _1667 = _1307 * _1631;
    float _1669 = _1621 * 6.283185482025146484375;
    float _1671 = sin(_1669);
    float _1673 = _1641 * _1641;
    float _1675 = _1539 * _1619;
    float _1677 = _1611 * _1619;
    float _1679 = _1657 * _1659;
    float _1681 = fma(_1655, _1655, _1673);
    float _1683 = _1621 * 6.283185482025146484375;
    float _1685 = cos(_1683);
    float _1687 = _1611 * _1645;
    float _1689 = fma(_1665, _1665, _1681);
    float _1691 = _1539 * _1645;
    float _1693 = fma(_1671, _1687, _1675);
    float _1695 = fma(_1671, _1675, _1687);
    float _1697 = -_1677;
    float _1699 = fma(_1671, _1691, _1697);
    float _1701 = rsqrt(_1689);
    float _1703 = -_1679;
    float _1705 = _1671 * _1703;
    float _1707 = -_1691;
    float _1709 = fma(_1671, _1677, _1707);
    float _1711 = _1619 * _1685;
    float _1713 = _1611 * _1685;
    float _1715 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _227);
    float _1717 = _1645 * _1685;
    float _1719 = _1539 * _1685;
    float _1721 = _1713 * _1679;
    float _1723 = _1715 * _1667;
    float _1725 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1727 = _1725 * 0.5;
    float _1729 = _1719 * _1679;
    float _1731 = fma(_1717, _1723, _1705);
    float _1733 = _1655 * _1701;
    float _1735 = _1641 * _1701;
    float _1737 = _1665 * _1701;
    float _1739 = fma(_1693, _1723, _1721);
    float _1741 = _1629 * _1733;
    float _1743 = _1623 * _1735;
    float _1745 = fma(_1699, _1723, _1729);
    float _1747 = fma(_1709, _1727, _1739);
    float _1749 = -_1741;
    float _1751 = fma(_1615, _1735, _1749);
    float _1753 = fma(_1711, _1727, _1731);
    float _1755 = -_1743;
    float _1757 = fma(_1629, _1737, _1755);
    float _1759 = fma(_1695, _1727, _1745);
    float _1761 = _1751 * _1747;
    float _1763 = _1757 * _1747;
    float _1765 = fma(_1737, _1753, _1761);
    float _1767 = fma(_1733, _1753, _1763);
    float _1769 = fma(_1623, _1759, _1765);
    float _1771 = fma(_1615, _1759, _1767);
    float _1773 = _1615 * _1737;
    float _1775 = _1141 + _1769;
    float _1777 = _813 + _1771;
    float _1779 = -_1773;
    float _1781 = fma(_1623, _1733, _1779);
    float _1783 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1785 = _1775 + _1783;
    float _1787 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1789 = _1777 + _1787;
    float _1791 = _1785 * _1785;
    float _1793 = fma(_1789, _1789, _1791);
    float _1795 = _1781 * _1747;
    float _1797 = sqrt(_1793);
    float _1799 = fma(_1735, _1753, _1795);
    float _1801 = fma(_1629, _1759, _1799);
    float _1803 = _735 + _1801;
    bool _1805 = _1797 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1807 = _1801;
    float _1809 = _1799;
    float _1811 = _1759;
    if (!_1805)
    {
        _1807 = _1777;
    }
    float _1813 = _1807;
    float _1815 = _1813;
    if (!_1805)
    {
        _1809 = _1775;
    }
    float _1817 = _1809;
    float _1819 = _1817;
    if (!_1805)
    {
        _1811 = _1803;
    }
    float _1821 = _1811;
    bool _1823 = !_1805;
    float _1825 = _1821;
    if (!_1823)
    {
        float _1827 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1829 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1831 = _1797 + _1829;
        float _1833 = rsqrt(_1793);
        float _1835 = _1831 * _1827;
        float _1837 = _1803 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1839 = _1835 * 0.15915493667125701904296875;
        float _1841 = _1839 * 6.283185482025146484375;
        float _1843 = sin(_1841);
        float _1845 = _1839 * 6.283185482025146484375;
        float _1847 = cos(_1845);
        float _1849 = fma(_1843, _1837, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1851 = _1833 * _1849;
        float _1853 = _1847 + (-1.0);
        float _1855 = fma(_1789, _1851, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1857 = fma(_1785, _1851, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1859 = _1853 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1861 = fma(_1803, _1847, _1859);
        _1819 = _1857;
        _1815 = _1855;
        _1825 = _1861;
    }
    float _1863 = _1819;
    float _1865 = _1815;
    float _1867 = _1825;
    float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1871 = _1863 + _1869;
    float _1873 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1875 = _1865 + _1873;
    float _1877 = fma(_1871, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1879 = fma(_1875, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _5904 = float2(_1879, _1877);
    float _1881 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_5904, float2(0.0), isnan(_5904)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_5904, float2(0.0), isnan(_5904)), level(0.0)).x;
    float _1883 = -_735;
    float _1885 = _1883 + _1867;
    float _1887 = -_813;
    float _1889 = _1887 + _1865;
    float _1891 = -_1141;
    float _1893 = _1891 + _1863;
    float _1895 = _1885 * _1885;
    float _1897 = fma(_1889, _1889, _1895);
    float _1899 = fma(_1893, _1893, _1897);
    float _1901 = sqrt(_1899);
    bool _1903 = _1901 > 0.0;
    float _1905 = fma(_1881, 100.0, _1867);
    bool _1907 = !_1903;
    float _1909 = _1905;
    float _1911 = _1865;
    float _1913 = _1863;
    float _1915 = _1879;
    if (!_1907)
    {
        float _1917 = _217 * _217;
        float _1919 = fma(_221, _221, _1917);
        float _1921 = rsqrt(_1899);
        float _1923 = fma(_223, _223, _1919);
        float _1925 = sqrt(_1923);
        float _1927 = _1889 * _1921;
        float _1929 = _1893 * _1921;
        bool _1931 = _1925 > 0.0;
        float _1933 = _1885 * _1921;
        bool _1935 = !_1931;
        _1915 = _1933;
        if (!_1935)
        {
            float _1937 = rsqrt(_1923);
            float _1939 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1941 = _217 * _1937;
            float _1943 = _221 * _1937;
            float _1945 = _1933 * _1941;
            float _1947 = _223 * _1937;
            float _1949 = fma(_1927, _1943, _1945);
            float _1951 = _1939 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1953 = fma(_1929, _1947, _1949);
            float _1955 = _1953 * _1951;
            float _1957 = fma(_221, _1955, _1865);
            float _1959 = fma(_217, _1955, _1905);
            float _1961 = fma(_223, _1955, _1863);
            _1909 = _1959;
            _1911 = _1957;
            _1913 = _1961;
            _1915 = _1949;
        }
    }
    float _1963 = _1909;
    float _1965 = _1911;
    float _1967 = _1913;
    float _1969 = _1915;
    float _1971 = -_1339;
    float _1973 = _1971 + _1963;
    float _1975 = -_1343;
    float _1977 = _1975 + _1965;
    float _1979 = -_1371;
    float _1981 = _1979 + _1967;
    float _1983 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1985 = _1973 + _1983;
    float _1987 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1989 = _1977 + _1987;
    float _1991 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1993 = _1981 + _1991;
    float _1995 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1997 = _1985 * _1985;
    float _1999 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2001 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2003 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1995);
    float _2005 = fma(_1989, _1989, _1997);
    float _2007 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1999);
    float _2009 = fma(_1993, _1993, _2005);
    float _2011 = rsqrt(_2009);
    float _2013 = fma(_1351, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2015 = sqrt(_2009);
    float _2017 = _2011 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2019 = _1989 * _2017;
    float _2021 = _1993 * _2017;
    float _2023 = _2019 * _2019;
    float _2025 = _2021 * _2021;
    float _2027 = _2023 + _2025;
    float _2029 = sqrt(_2027);
    bool _2031 = _2029 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2033 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2035 = _2029 + _2033;
    float _2037 = _1993;
    float _2039 = _2035;
    float _2041 = _1969;
    float _2043 = _1985;
    if (_2031)
    {
        float _2045 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2037 = _2045;
    }
    float _2047 = _2037;
    if (_2031)
    {
        float _2049 = rsqrt(_2027);
        _1377 = _2049;
    }
    float _2051 = _1377;
    float _2053 = _2051;
    if (_2031)
    {
        float _2055 = _2035 * _2047;
        _2039 = _2055;
    }
    float _2057 = _2039;
    if (_2031)
    {
        float _2059 = _2057 * 0.15915493667125701904296875;
        _2041 = _2059;
    }
    float _2061 = _2041;
    float _2063 = _2011;
    float _2065 = _2061;
    if (_2031)
    {
        float _2067 = _2061 * 6.283185482025146484375;
        float _2069 = sin(_2067);
        _2063 = _2069;
    }
    float _2071 = _2063;
    float _2073 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2075 = precise::max(0.0, _2073);
    float _2077 = _223;
    float _2079 = _2073;
    float _2081 = _2075;
    if (_2031)
    {
        float _2083 = _2061 * 6.283185482025146484375;
        float _2085 = cos(_2083);
        _2077 = _2085;
    }
    float _2087 = _2077;
    float _2089 = -_2017;
    float _2091 = -_2075;
    float _2093 = fma(_1985, _2089, _2091);
    if (_2031)
    {
        float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2079 = _2095;
    }
    float _2097 = _2079;
    float _2099 = _2097;
    if (!_2031)
    {
        _2065 = _2093;
    }
    float _2101 = _2065;
    float _2103 = _2101;
    if (_2031)
    {
        float _2105 = fma(_2071, _2097, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2043 = _2105;
    }
    float _2107 = _2043;
    float _2109 = floor(_2013);
    float _2111 = _2107;
    if (_2031)
    {
        float _2113 = _2087 + (-1.0);
        _2099 = _2113;
    }
    float _2115 = _2099;
    float _2117 = _2115;
    if (_2031)
    {
        float _2119 = _2051 * _2107;
        _1273 = _2119;
    }
    float _2121 = _1273;
    if (!_2031)
    {
        _2053 = _2019;
    }
    float _2123 = _2053;
    float _2125 = _2123;
    if (_2031)
    {
        float _2127 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2081 = _2127;
    }
    float _2129 = _2081;
    float _2131 = _2129;
    if (_2031)
    {
        float _2133 = _2019 * _2121;
        _2125 = _2133;
    }
    float _2135 = _2125;
    if (!_2031)
    {
        _2111 = _2021;
    }
    float _2137 = _2111;
    float _2139 = _2137;
    if (_2031)
    {
        float _2141 = _2021 * _2121;
        _2139 = _2141;
    }
    float _2143 = _2139;
    if (!_2031)
    {
        _2117 = _2023;
    }
    float _2145 = _2117;
    float _2147 = _2145;
    if (_2031)
    {
        float _2149 = fma(_2093, _2087, _2129);
        _2103 = _2149;
    }
    float _2151 = _2103;
    if (_2031)
    {
        float _2153 = _2135 * _2135;
        _2147 = _2153;
    }
    float _2155 = _2147;
    float _2157 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_2031)
    {
        _2131 = _2025;
    }
    float _2159 = _2131;
    float _2161 = _2159;
    if (_2031)
    {
        float _2163 = _2143 * _2143;
        _2161 = _2163;
    }
    float _2165 = _2161;
    float _2167 = fma(_2151, _2151, _2155);
    float _2169 = fma(_1415, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2171 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2173 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2157);
    float _2175 = _2167 + _2165;
    float _2177 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2171);
    float _2179 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2173);
    float _2181 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2003);
    float _2183 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2007);
    float _2185 = rsqrt(_2175);
    float _2187 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2177);
    float _2189 = _2179 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2191 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2193 = fma(_2015, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2191);
    float _2195 = precise::clamp(_2193, 0.0, 1.0);
    float _2197 = _2181 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2199 = _2187 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2201 = _2189 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2203 = -_2195;
    float _2205 = _2203 + 1.0;
    float _2207 = _2183 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2209 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2211 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2201);
    float _2213 = floor(_2169);
    float _2215 = -_2109;
    float _2217 = _2013 + _2215;
    float _2219 = -_2209;
    float _2221 = fma(_2219, _2001, 1.0);
    float _2223 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2211);
    float _2225 = _2189 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2227 = _2185 * _2135;
    float _2229 = _2185 * _2151;
    float _2231 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2223);
    float _2233 = abs(_2205);
    float _2235 = log2(_2233);
    float _2237 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2239 = _2185 * _2143;
    float _2241 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2225);
    float _2243 = -_2237;
    float _2245 = fma(_2229, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2243);
    float _2247 = 1.0 / _2231;
    float _2249 = -_2239;
    float _2251 = fma(_2249, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2245);
    float _2253 = _2189 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2255 = -_2213;
    float _2257 = _2169 + _2255;
    float _2259 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2241);
    float _2261 = fma(_2251, -0.5, 0.5);
    float _2263 = fma(_2251, 0.5, 0.5);
    float _2265 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2253);
    float _2267 = _2235 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2269 = log2(_2221);
    float _2271 = fma(_2263, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2273 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2265);
    float _2275 = _2229 + 1.0;
    float _2277 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2259);
    float _2279 = fma(_2263, _2271, -0.212114393711090087890625);
    float _2281 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2273);
    float _2283 = exp2(_2267);
    float _2285 = fma(_2263, _2279, 1.570728778839111328125);
    float _2287 = sqrt(_2261);
    float _2289 = _2269 * 0.693147182464599609375;
    float2 _6579 = float2(_2217, _2257);
    float _2291 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6579, float2(0.0), isnan(_6579)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6579, float2(0.0), isnan(_6579)), level(0.0)).x;
    float _2293 = _2289 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2295 = -_2229;
    float _2297 = fma(_2283, _2275, _2295);
    float _2299 = _2277 * _2247;
    float _2301 = _2281 * _2247;
    float _2303 = fma(_2297, 0.5, 0.5);
    float _2305 = fma(_2299, 0.5, 0.5);
    float _2307 = fma(_2301, -0.5, 0.5);
    float _2309 = _2287 * 0.636619746685028076171875;
    float _2311 = -_2285;
    float _2313 = fma(_2309, _2311, 1.0);
    float3 _6618 = float3(_2305, _2307, _2293);
    float _2315 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6618, float3(0.0), isnan(_6618)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6618, float3(0.0), isnan(_6618)), level(0.0)).x;
    float3 _6629 = float3(_2305, _2307, _2293);
    float4 _2318 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6629, float3(0.0), isnan(_6629)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6629, float3(0.0), isnan(_6629)), level(0.0)).xyzw;
    float _2320 = _2318.x;
    float _2322 = _2318.y;
    float _2324 = _2318.z;
    float _2326 = _2318.w;
    float2 _6645 = float2(_2313, _2303);
    float3 _2330 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6645, float2(0.0), isnan(_6645)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6645, float2(0.0), isnan(_6645)), level(0.0)).xyz;
    float _2332 = _2330.x;
    float _2334 = _2330.y;
    float _2336 = _2330.z;
    float _2338 = _1713 * _1757;
    float _2340 = _1713 * _1781;
    float _2342 = _1713 * _1751;
    float _2344 = _1693 * _1781;
    float _2346 = _1693 * _1757;
    float _2348 = _1709 * _1781;
    float _2350 = _1693 * _1751;
    float _2352 = fma(_1881, 100.0, _735);
    float _2354 = _1709 * _1751;
    float _2356 = -_1671;
    float _2358 = fma(_2356, _1735, _2340);
    float _2360 = fma(_1717, _1735, _2344);
    float _2362 = fma(_1711, _1735, _2348);
    float _2364 = -_1339;
    float _2366 = _2364 + _2352;
    float _2368 = fma(_1717, _1733, _2346);
    float _2370 = fma(_1711, _1737, _2354);
    float _2372 = fma(_1717, _1737, _2350);
    float _2374 = fma(_1719, _1629, _2358);
    float _2376 = fma(_1699, _1629, _2360);
    float _2378 = fma(_1695, _1629, _2362);
    float _2380 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2382 = _1709 * _1757;
    float _2384 = -_1671;
    float _2386 = fma(_2384, _1733, _2338);
    float _2388 = -_1671;
    float _2390 = fma(_2388, _1737, _2342);
    float _2392 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2380);
    float _2394 = fma(_1711, _1733, _2382);
    float _2396 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2398 = fma(_1719, _1615, _2386);
    float _2400 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2392);
    float _2402 = fma(_1699, _1615, _2368);
    float _2404 = fma(_1695, _1615, _2394);
    float _2406 = fma(_1719, _1623, _2390);
    float _2408 = _2400 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2410 = fma(_1699, _1623, _2372);
    float _2412 = fma(_1695, _1623, _2370);
    float _2414 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2396);
    float _2416 = 1.0 / _2408;
    float _2418 = _231 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2420 = _227 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2422 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2414);
    float _2424 = _2418 * _2398;
    float _2426 = _2418 * _2374;
    float _2428 = _2422 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2430 = _2418 * _2406;
    float _2432 = fma(_2420, _2402, _2424);
    float _2434 = fma(_2420, _2376, _2426);
    float _2436 = _2428 + _2408;
    float _2438 = fma(_2420, _2410, _2430);
    float _2440 = _2404 + _2432;
    float _2442 = _2235 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2444 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2446 = isnan(0.5);
    bool _2448 = _2444 || _2446;
    bool _2450 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2452 = _2448 || _2450;
    float _2454 = _2436 * _2416;
    float _2456 = _2454 * 0.5;
    float _2458 = _2277 + _2231;
    float _2460 = _2378 + _2434;
    float _2462 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2464 = fma(_2456, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2462);
    float _2466 = exp2(_2442);
    float _2468 = _2412 + _2438;
    float _2470 = _2458 * 0.5;
    float _2472 = 1.0 / _2464;
    float _2474 = in.m_76.x;
    float _2476 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2478 = _2472 * _2476;
    float _2480 = abs(_2478);
    float _2482 = log2(_2480);
    bool _2484 = _2478 <= 8000.0;
    bool _2486 = isnan(_2478);
    bool _2488 = _2484 || _2486;
    bool _2490 = isnan(8000.0);
    bool _2492 = _2488 || _2490;
    float _2494 = float(_2492);
    float _2496 = _2482 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2498 = exp2(_2496);
    float _2500 = fma(_2498, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2502 = precise::clamp(_2500, 0.0, 1.0);
    float _2504 = _2189 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2506 = fma(_2502, -2.0, 3.0);
    float _2508 = _2502 * _2502;
    float _2510 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2504);
    float _2512 = _2508 * _2506;
    float _2514 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2510);
    float _2516 = _2510;
    if (_2452)
    {
        _2516 = 1.0;
    }
    float _2518 = _2516;
    float _2520 = -_2512;
    float _2522 = _2520 + 1.0;
    float _2524 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2514);
    float _2526 = fma(_2522, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2512);
    float _2528 = _2231 * 0.5;
    float _2530 = _2524 + _2231;
    float _2532 = fma(_2281, -0.5, _2528);
    float _2534 = _2530 * 0.5;
    float _2536 = _2528;
    float _2538 = _2518;
    if (_2452)
    {
        _2536 = 1.0;
    }
    float _2540 = _2536;
    float _2542 = _2540;
    float _2544 = _2326;
    float _2546 = _2324;
    float _2548 = _2474;
    float _2550 = _2322;
    float _2552 = _2320;
    if (!_2452)
    {
        float _2554 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2556 = _2554 * 0.15915493667125701904296875;
        float _2558 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2560 = _2556 * 6.283185482025146484375;
        float _2562 = cos(_2560);
        float _2564 = _2558 * 0.15915493667125701904296875;
        float _2566 = _2556 * 6.283185482025146484375;
        float _2568 = sin(_2566);
        float _2570 = 1.0 / _2562;
        float _2572 = _2564 * 6.283185482025146484375;
        float _2574 = cos(_2572);
        float _2576 = _2568 * _2570;
        float _2578 = _2564 * 6.283185482025146484375;
        float _2580 = sin(_2578);
        float _2582 = _2574 * _2576;
        float _2584 = 1.0 / _2582;
        float _2586 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2588 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2586;
        float _2590 = 1.0 / _2588;
        float _2592 = _2580 * _2584;
        float _2594 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2596 = fma(_2478, _2592, _2594);
        float _2598 = _2596 * _2590;
        float _2600 = precise::clamp(_2598, 0.0, 1.0);
        _2542 = _2600;
    }
    float _2602 = _2542;
    if (!_2452)
    {
        float _2604 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2606 = _2604 * 0.15915493667125701904296875;
        float _2608 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2610 = _2606 * 6.283185482025146484375;
        float _2612 = cos(_2610);
        float _2614 = _2608 * 0.15915493667125701904296875;
        float _2616 = _2606 * 6.283185482025146484375;
        float _2618 = sin(_2616);
        float _2620 = 1.0 / _2612;
        float _2622 = _2614 * 6.283185482025146484375;
        float _2624 = cos(_2622);
        float _2626 = _2618 * _2620;
        float _2628 = _2614 * 6.283185482025146484375;
        float _2630 = sin(_2628);
        float _2632 = _2624 * _2626;
        float _2634 = 1.0 / _2632;
        float _2636 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2638 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2636;
        float _2640 = 1.0 / _2638;
        float _2642 = _2630 * _2634;
        float _2644 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2646 = fma(_2478, _2642, _2644);
        float _2648 = _2646 * _2640;
        float _2650 = precise::clamp(_2648, 0.0, 1.0);
        float _2652 = -_2650;
        float _2654 = _2652 + 1.0;
        _2538 = _2654;
    }
    float _2656 = _2538;
    float _2658 = _2494 * _2526;
    float _2660 = -_2466;
    float _2662 = _2660 + 1.0;
    float _2664 = -_2291;
    float _2666 = _2664 + 1.0;
    float _2668 = _2658 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2670 = _2662 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2277;
    out.gl_Position.y = _2281;
    out.gl_Position.z = _2524;
    out.gl_Position.w = _2231;
    bool _2672 = _2015 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2674 = isnan(_2015);
    bool _2676 = _2672 || _2674;
    bool _2678 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2680 = _2676 || _2678;
    float _2682 = _2666 * _2668;
    float _2684 = precise::clamp(_2682, 0.0, 1.0);
    float _2686 = _2670 * _2315;
    float _2688 = -_2670;
    float _2690 = _2688 + 1.0;
    out.m_86.x = _2470;
    out.m_86.y = _2532;
    out.m_86.z = _2534;
    out.m_86.w = _2231;
    float _2692 = -_2684;
    float _2694 = fma(_2692, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2696 = _2326 * _2686;
    out.m_88.x = _2440;
    out.m_88.y = _2460;
    out.m_88.z = _2468;
    float _2698 = _2694 * _2474;
    float _2700 = _2336 * _2686;
    float _2702 = fma(_2334, _2696, _2322);
    float _2704 = fma(_2332, _2696, _2320);
    float _2706 = _2326 * _2690;
    float _2708 = _2698 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2710 = fma(_2326, _2700, _2324);
    float _2712 = _2602 * _2656;
    float _2714 = _2698;
    if (!_2680)
    {
        _2544 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2716 = _2544;
    out.m_90.x = _2708;
    float _2718 = _2716;
    float _2720 = _2716;
    if (!_2680)
    {
        _2546 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2722 = _2546;
    float _2724 = _2712 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2726 = _2722;
    float _2728 = _2722;
    if (!_2680)
    {
        _2548 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2730 = _2548;
    out.m_92.x = _2704;
    out.m_92.y = _2702;
    out.m_92.z = _2710;
    out.m_92.w = _2706;
    float _2732 = _2730;
    float _2734 = _2730;
    if (!_2680)
    {
        _2714 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2736 = _2714;
    float _2738 = _2736;
    float _2740 = _2736;
    if (!_2680)
    {
        _2550 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2742 = _2550;
    float _2744 = _2742;
    float _2746 = _2742;
    if (!_2680)
    {
        _2552 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2748 = _2552;
    bool _2750 = !_2680;
    float _2752 = _2748;
    float _2754 = _2748;
    if (!_2750)
    {
        bool _2756 = _2015 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2758 = isnan(_2015);
        bool _2760 = _2756 || _2758;
        bool _2762 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2764 = _2760 || _2762;
        if (!_2764)
        {
            float _2766 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2768 = _2015 + _2766;
            float _2770 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2772 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2770;
            float _2774 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2776 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2778 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2780 = _2778 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2782 = 1.0 / _2772;
            float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2786 = _2784 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2788 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2790 = _2788 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2792 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2794 = _2792 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2796 = _2768 * _2782;
            float _2798 = precise::clamp(_2796, 0.0, 1.0);
            float _2800 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2802 = _2800 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2804 = fma(_2798, _2776, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2806 = fma(_2798, _2780, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2808 = fma(_2798, _2786, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2810 = fma(_2798, _2802, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2812 = fma(_2798, _2790, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2814 = fma(_2798, _2794, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2728 = _2808;
            _2746 = _2804;
            _2720 = _2806;
            _2740 = _2812;
            _2734 = _2810;
            _2754 = _2814;
            _2816 = true;
        }
        else
        {
            bool _2818 = _2015 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2820 = isnan(_2015);
            bool _2822 = _2818 || _2820;
            bool _2824 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2826 = _2822 || _2824;
            if (!_2826)
            {
                _2718 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2828 = _2718;
            _2720 = _2828;
            if (!_2826)
            {
                _2726 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2830 = _2726;
            _2728 = _2830;
            if (!_2826)
            {
                _2732 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2832 = _2732;
            _2734 = _2832;
            if (!_2826)
            {
                _2738 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2834 = _2738;
            _2740 = _2834;
            if (!_2826)
            {
                _2744 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2836 = _2744;
            _2746 = _2836;
            if (!_2826)
            {
                _2752 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2838 = _2752;
            bool _2840 = !_2826;
            _2754 = _2838;
            if (!_2840)
            {
                bool _2842 = _2015 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2844 = isnan(_2015);
                bool _2846 = _2842 || _2844;
                bool _2848 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2850 = _2846 || _2848;
                if (!_2850)
                {
                    float _2852 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2854 = _2015 + _2852;
                    float _2856 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2858 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2856;
                    float _2860 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2862 = _2860 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2864 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2866 = _2864 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2868 = 1.0 / _2858;
                    float _2870 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2872 = _2870 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2874 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2876 = _2874 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2878 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2880 = _2878 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2882 = _2854 * _2868;
                    float _2884 = precise::clamp(_2882, 0.0, 1.0);
                    float _2886 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2888 = _2886 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2890 = fma(_2884, _2862, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2892 = fma(_2884, _2866, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2894 = fma(_2884, _2872, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2896 = fma(_2884, _2888, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2898 = fma(_2884, _2876, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2900 = fma(_2884, _2880, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2728 = _2894;
                    _2746 = _2890;
                    _2720 = _2892;
                    _2740 = _2898;
                    _2734 = _2896;
                    _2754 = _2900;
                    _2816 = true;
                }
                else
                {
                    _2728 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2746 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2720 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2740 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2734 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2754 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2816 = false;
    float _2902 = _2728;
    float _2904 = _2746;
    float _2906 = _2720;
    float _2908 = _2740;
    float _2910 = _2734;
    float _2912 = _2754;
    float _2914 = fma(_2460, -0.5, 0.5);
    float _2916 = precise::clamp(_2914, 0.0, 1.0);
    float _2918 = -_2902;
    float _2920 = _2918 + _2904;
    float _2922 = -_2906;
    float _2924 = _2922 + _2908;
    out.m_94.x = 0.0;
    float _2926 = -_2910;
    float _2928 = _2926 + _2912;
    float _2930 = fma(_2916, _2920, _2902);
    float _2932 = fma(_2916, _2924, _2906);
    bool _2934 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2936 = _2930 * 0.586610972881317138671875;
    float _2938 = fma(_2916, _2928, _2910);
    float _2940 = _2724 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2942 = fma(_2932, 0.298911988735198974609375, _2936);
    bool _2944 = _2602 > 0.0;
    bool _2946 = isnan(_2602);
    bool _2948 = _2944 || _2946;
    bool _2950 = isnan(0.0);
    bool _2952 = _2948 || _2950;
    float _2954 = fma(_2938, 0.114477999508380889892578125, _2942);
    out.m_51.x = _2940;
    bool _2956 = _2656 <= 0.0;
    bool _2958 = !_2952;
    bool _2960 = _2956 || _2958;
    float _2962 = -_2954;
    float _2964 = _2932 + _2962;
    float _2966 = -_2954;
    float _2968 = _2938 + _2966;
    float _2970 = fma(_2964, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2954);
    float _2972 = -_2954;
    float _2974 = _2930 + _2972;
    float _2976 = fma(_2974, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2954);
    float _2978 = fma(_2968, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2954);
    bool _2980 = !_2934;
    if (!_2980)
    {
        float _2982 = -_1973;
        float _2984 = _2982 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2986 = -_1977;
        float _2988 = _2986 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2990 = -_1981;
        float _2992 = _2990 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2994 = _2984 * _2984;
        float _2996 = fma(_2988, _2988, _2994);
        float _2998 = fma(_2992, _2992, _2996);
        float _3000 = sqrt(_2998);
        float _3002 = rsqrt(_2998);
        float _3004 = -_3000;
        float _3006 = _3004 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3008 = _3006 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3010 = precise::clamp(_3008, 0.0, 1.0);
        float _3012 = _2988 * _3002;
        float _3014 = _2984 * _3002;
        float _3016 = abs(_3010);
        float _3018 = log2(_3016);
        float _3020 = _2992 * _3002;
        float _3022 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3024 = _2460 * _3014;
        float _3026 = -_3014;
        float _3028 = -_3022;
        float _3030 = fma(_3026, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3028);
        float _3032 = fma(_2440, _3012, _3024);
        float _3034 = -_3020;
        float _3036 = fma(_3034, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3030);
        float _3038 = fma(_2468, _3020, _3032);
        float _3040 = precise::clamp(_3038, 0.0, 1.0);
        float _3042 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3044 = _3036 + _3042;
        float _3046 = _3018 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3048 = _3044 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3050 = precise::clamp(_3048, 0.0, 1.0);
        float _3052 = exp2(_3046);
        float _3054 = _3052 * _3050;
        float _3056 = _3040 * _3054;
        float _3058 = _3056 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3060 = _3056 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3062 = _3056 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _3058;
        out.m_94.y = _3060;
        out.m_94.z = _3062;
    }
    out.m_96.x = _2970;
    out.m_96.y = _2976;
    out.m_96.z = _2978;
    if (!_2960)
    {
        return out;
    }
    float _3064 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_51.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3064;
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
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2816 = false;
    bool _629 = false;
    bool _455 = false;
    bool _349 = false;
    bool _253 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_48.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    if (!_119)
    {
        out.m_51.x = 0.0;
    }
    int _125 = 0;
    if (!_119)
    {
        float _127 = _123 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3120 = as_type<float>(_129);
        out.gl_Position.z = _3120;
    }
    if (!_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_53.w;
    float _135 = float(_115);
    float _137 = 1.0 / _135;
    float _139 = -_133;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_133);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = _141 * _137;
    bool _155 = _141 >= _135;
    bool _157 = !_151;
    bool _159 = _155 || _157;
    out.m_55.x = _153;
    float _161 = _133;
    float _163 = _141;
    if (_159)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _161;
    if (_159)
    {
        out.m_51.x = 0.0;
    }
    if (_159)
    {
        float _167 = _165 * 5.0;
        _131 = as_type<int>(_167);
    }
    int _169 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3192 = as_type<float>(_169);
        out.gl_Position.z = _3192;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = in.m_60.x;
    float _175 = in.m_60.y;
    float _177 = in.m_60.z;
    float _179 = in.m_62.x;
    float _181 = in.m_62.y;
    float _183 = in.m_62.z;
    float _185 = in.m_64.x;
    float _187 = in.m_64.y;
    float _189 = in.m_64.z;
    float _191 = in.m_66.x;
    float _193 = in.m_66.y;
    float _195 = in.m_66.z;
    int _197 = as_type<int>(_171) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_171) & 2;
    bool _203 = _201 != 0;
    bool _205 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _207 = _175 * _181;
    float _209 = _175 * _187;
    float _211 = fma(_173, _179, _207);
    float _213 = _175 * _193;
    float _215 = fma(_173, _185, _209);
    float _217 = fma(_177, _183, _211);
    float _219 = fma(_173, _191, _213);
    float _221 = fma(_177, _189, _215);
    float _223 = fma(_177, _195, _219);
    bool _225 = !_199;
    float _227 = _225 ? (-0.5) : 0.5;
    bool _229 = !_203;
    float _231 = _229 ? (-0.5) : 0.5;
    bool _233 = !_205;
    float _251;
    if (!_233)
    {
        float _235 = in.m_68.x;
        float _237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _239 = _235 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _243 = _241 * _237;
        float _245 = floor(_243);
        float _247 = -_245;
        float _249 = _243 + _247;
        _251 = _249;
        _253 = true;
    }
    else
    {
        _251 = _153;
    }
    _253 = false;
    float _255 = _251;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = _255 + _257;
    bool _261 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _263 = isnan(_255);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _273;
    float _277 = -_271;
    float _279 = _277 + 1.0;
    bool _281 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _283 = isnan(_255);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _293;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _299 = 1.0 / _275;
    float _301 = _291 * _279;
    float _303 = -_291;
    float _305 = _303 + 1.0;
    float _307 = _259 * _299;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _309;
    float _313 = fma(_295, _307, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _315 = fma(_311, _307, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _317 = _313 * _301;
    float _319 = _315 * _301;
    float _321 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[143].x, _317);
    float _323 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[143].y, _319);
    float _325 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[144].x, _321);
    float _327 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[144].y, _323);
    bool _329 = !_297;
    float _347;
    if (!_329)
    {
        float _331 = in.m_68.x;
        float _333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _335 = _331 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _337 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _339 = _337 * _333;
        float _341 = floor(_339);
        float _343 = -_341;
        float _345 = _339 + _343;
        _347 = _345;
        _349 = true;
    }
    else
    {
        _347 = _153;
    }
    _349 = false;
    float _351 = _347;
    bool _353 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _355 = isnan(_351);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _369 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _371 = isnan(_351);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _387 = _351 + _385;
    float _389 = -_363;
    float _391 = _389 + 1.0;
    float _393 = 1.0 / _367;
    float _395 = _379 * _391;
    float _397 = -_379;
    float _399 = _397 + 1.0;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _405 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _409 = _401 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = _403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _413 = _407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _415 = _383 * _393;
    float _417 = fma(_415, _387, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _419 = in.m_70.x;
    float _421 = in.m_70.y;
    float _423 = _417 * _395;
    float _425 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[115].x, _423);
    float _427 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[116].x, _425);
    float _429 = _427 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _409;
    out.m_72.y = _411;
    out.m_72.z = _413;
    out.m_72.w = _429;
    float _431 = _327 * _421;
    float _433 = _325 * _419;
    bool _435 = !_405;
    float _453;
    if (!_435)
    {
        float _437 = in.m_68.x;
        float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _441 = _437 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _445 = _443 * _439;
        float _447 = floor(_445);
        float _449 = -_447;
        float _451 = _445 + _449;
        _453 = _451;
        _455 = true;
    }
    else
    {
        _453 = _153;
    }
    _455 = false;
    float _457 = _453;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _461 = _457 + _459;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _467 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _469 = isnan(_457);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _487 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _489 = isnan(_457);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = 1.0 / _465;
    float _501 = -_477;
    float _503 = _501 + 1.0;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _505;
    bool _509 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _511 = isnan(_457);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = _497 * _503;
    float _523 = -_497;
    float _525 = _523 + 1.0;
    bool _527 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _529 = 1.0 / _481;
    float _531 = 1.0 / _485;
    float _533 = _507 * _499;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _539 = fma(_533, _461, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _541;
    float _545 = _537 * _529;
    float _547 = _519 * _525;
    bool _549 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _551 = isnan(_457);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _563 = _457 + _561;
    float _565 = -_519;
    float _567 = _565 + 1.0;
    float _569 = _539 * _547;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _573 = _457 + _571;
    float _575 = fma(_545, _563, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _577 = _543 * _531;
    float _579 = -_559;
    float _581 = _579 + 1.0;
    float _583 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[131].x, _569);
    float _585 = fma(_577, _573, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _587 = _477 * _581;
    float _589 = fma(_575, _521, _583);
    float _591 = fma(_585, _587, _589);
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _597 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[134].x, _591);
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _601 = _593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _603 = _595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _605 = _597 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _607 = _599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_74.x = _601;
    out.m_74.y = _603;
    out.m_74.z = _607;
    out.m_74.w = _605;
    bool _609 = !_527;
    float _627;
    if (!_609)
    {
        float _611 = in.m_68.x;
        float _613 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _615 = _611 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _617 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[14].x, _141);
        float _619 = _617 * _613;
        float _621 = floor(_619);
        float _623 = -_621;
        float _625 = _619 + _623;
        _627 = _625;
        _629 = true;
    }
    else
    {
        _627 = _153;
    }
    _629 = false;
    float _631 = _627;
    float _633 = in.m_68.x;
    float _635 = in.m_68.y;
    float _637 = in.m_68.z;
    float _639 = in.m_68.w;
    float _641 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _643 = in.m_48.x;
    float _645 = in.m_48.y;
    float _647 = in.m_48.z;
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _651 = _649 != 0;
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _655 = _653 != 0;
    float _657 = in.m_76.y;
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _661 = _659 != 0;
    float _663 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _667 = _665 != 0;
    float _669 = in.m_66.w;
    float _671 = in.m_64.w;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _679 = _631 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _681 = isnan(_631);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _687 = _683 || _685;
    float _689 = float(_687);
    bool _691 = _639 > 0.5;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _697 = _187 * _645;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _701 = _699 != 0;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _705 = _703 != 0;
    float _707 = 1.0 / _695;
    float _709 = -_231;
    int _711 = _691 ? as_type<int>(_709) : as_type<int>(_231);
    float _713 = fma(_185, _643, _697);
    bool _715 = _633 > 0.5;
    float _717 = _633 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _723 = -_227;
    int _725 = _715 ? as_type<int>(_723) : as_type<int>(_227);
    float _727 = -_673;
    float _729 = fma(_717, 2.0, _727);
    int _731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _733 = _731 != 0;
    float _735 = _645 + _657;
    float _737 = 1.0 / _721;
    float _739 = fma(_189, _647, _713);
    float _741 = _193 * _645;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _745 = _743 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _751 = fma(_191, _643, _741);
    float _753 = 1.0 / _677;
    float _755 = _635 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _759 = fma(_195, _647, _751);
    float _761 = fma(_755, -2.0, _757);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _767 = 1.0 / _749;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _769;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _777;
    float _781 = _771 * _737;
    float _783 = _633 * 2.0;
    float _785 = 1.0 / _765;
    float _787 = _779 * _707;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _795 = _631 + _793;
    float _797 = -_689;
    float _799 = _797 + 1.0;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _803 = _663 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _805 = 1.0 / _745;
    float _807 = 0.0;
    float _809 = _801;
    if (!_733)
    {
        _807 = _635;
    }
    float _811 = _807;
    float _813 = _739 + _671;
    float _815 = _811;
    if (_733)
    {
        _815 = _633;
    }
    float _817 = _815;
    float _819 = 1.0 / _775;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _825 = _637 * 2.0;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _829 = _823 * _753;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _831;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _839 = floor(_783);
    float _841 = _635 + _633;
    float _843 = _833 * _767;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _845;
    float _849 = _837 * _785;
    float _851 = _635 + _637;
    bool _853 = !_651;
    float _855 = _853 ? _227 : as_type<float>(_725);
    float _857 = _791 * _805;
    float _859 = floor(_825);
    bool _861 = _635 > 0.5;
    float _863 = _851 + (-1.0);
    float _865 = _847 * _819;
    float _867 = -_231;
    int _869 = _861 ? as_type<int>(_867) : as_type<int>(_231);
    float _871 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _873 = _841 + (-1.0);
    float _875 = -_227;
    int _877 = _861 ? as_type<int>(_875) : as_type<int>(_227);
    bool _879 = !_655;
    float _881 = _879 ? _231 : as_type<float>(_869);
    float _883 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _885 = _637 > 0.5;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _889 = _631 + _887;
    bool _891 = !_661;
    float _893 = _891 ? _231 : as_type<float>(_711);
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _897 = _631 + _895;
    float _899 = -_227;
    int _901 = _885 ? as_type<int>(_899) : as_type<int>(_227);
    float _903 = fma(_857, _889, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _905 = _859 > 0.0;
    float _907 = fma(_829, _897, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _909 = _859 >= 0.0;
    bool _911 = isnan(_859);
    bool _913 = _909 || _911;
    bool _915 = isnan(0.0);
    bool _917 = _913 || _915;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _921 = _631 + _919;
    bool _923 = !_667;
    float _925 = _923 ? _227 : as_type<float>(_901);
    bool _927 = _839 > 0.0;
    float _929 = fma(_787, _921, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _933 = _631 + _931;
    bool _935 = _839 >= 0.0;
    bool _937 = isnan(_839);
    bool _939 = _935 || _937;
    bool _941 = isnan(0.0);
    bool _943 = _939 || _941;
    bool _945 = _631 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _947 = isnan(_631);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _953 = _949 || _951;
    float _955 = float(_953);
    float _957 = fma(_781, _933, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _959 = fma(_843, _795, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _963 = _631 + _961;
    bool _965 = _631 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _967 = isnan(_631);
    bool _969 = _965 || _967;
    bool _971 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _973 = _969 || _971;
    float _975 = float(_973);
    float _977 = -_955;
    float _979 = _977 + 1.0;
    bool _981 = _631 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _983 = isnan(_631);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    float _993 = fma(_865, _963, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _995 = _631 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _997 = isnan(_631);
    bool _999 = _995 || _997;
    bool _1001 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1003 = _999 || _1001;
    float _1005 = float(_1003);
    float _1007 = _975 * _979;
    float _1009 = -_975;
    float _1011 = _1009 + 1.0;
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1015 = _631 + _1013;
    bool _1017 = !_701;
    float _1019 = _1017 ? _227 : as_type<float>(_877);
    float _1021 = -_1005;
    float _1023 = _1021 + 1.0;
    float _1025 = _1005 * _1011;
    bool _1027 = _631 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1029 = isnan(_631);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1035 = _1031 || _1033;
    float _1037 = float(_1035);
    float _1039 = fma(_849, _1015, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1041 = _991 * _1023;
    float _1043 = -_991;
    float _1045 = _1043 + 1.0;
    float _1047 = _1015;
    if (!_733)
    {
        _1047 = _637;
    }
    float _1049 = _1047;
    float _1051 = -_1037;
    float _1053 = _1051 + 1.0;
    bool _1055 = _637 > 0.5;
    float _1057 = _1037 * _1045;
    bool _1059 = _631 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1061 = isnan(_631);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1067 = _1063 || _1065;
    float _1069 = float(_1067);
    float _1071 = _689 * _1053;
    float _1073 = _1049;
    if (_733)
    {
        _1073 = _635;
    }
    float _1075 = _1073;
    bool _1077 = _631 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1079 = isnan(_631);
    bool _1081 = _1077 || _1079;
    bool _1083 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1085 = _1081 || _1083;
    float _1087 = float(_1085);
    float _1089 = -_1069;
    float _1091 = _1089 + 1.0;
    float _1093 = -_231;
    int _1095 = _1055 ? as_type<int>(_1093) : as_type<int>(_231);
    float _1097 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[83].w, _801);
    float _1099 = _1069 * _799;
    float _1101 = _1087 * _1091;
    if (!_733)
    {
        _809 = _637;
    }
    float _1103 = _809;
    float _1105 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1097);
    bool _1107 = !_705;
    float _1109 = _1107 ? _231 : as_type<float>(_1095);
    float _1111 = -_141;
    float _1113 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[76].x, _729);
    float _1115 = _1103;
    if (_733)
    {
        _1115 = _635;
    }
    float _1117 = _1115;
    float _1119 = -_1087;
    float _1121 = _1119 + 1.0;
    int _1123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1125 = _1123 != 0;
    int _1127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1129 = _1127 != 0;
    int _1131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1133 = _1131 != 0;
    float _1135 = _929 * _1101;
    float _1137 = _641 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1139 = _855 + 0.5;
    float _1141 = _759 + _669;
    float _1143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1145 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1135);
    float _1147 = fma(_1137, _1139, _1113);
    float _1149 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _761);
    float _1151 = fma(_907, _1099, _1145);
    float _1153 = _817 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1159 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1163 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1155);
    float _1165 = _881 + (-0.5);
    float _1167 = fma(_1159, -2.0, _827);
    float _1169 = -_1161;
    float _1171 = fma(_1153, 2.0, _1169);
    float _1173 = -_1105;
    float _1175 = _1173 + 1.0;
    float _1177 = -_803;
    float _1179 = -_1149;
    float _1181 = fma(_1177, _1165, _1179);
    float _1183 = fma(_957, _1071, _1151);
    float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1187 = _735 + _1185;
    float _1189 = _1143 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1191 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1193 = _1141 + _1191;
    float _1195 = fma(_903, _1057, _1183);
    float _1197 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1199 = _1019 + 0.5;
    float _1201 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1203 = fma(_959, _1041, _1195);
    float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1207 = _813 + _1205;
    float _1209 = _893 + (-0.5);
    float _1211 = fma(_1039, _1025, _1203);
    float _1213 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1197);
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1217 = fma(_993, _1007, _1211);
    float _1219 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1213);
    float _1221 = _1187 * _1187;
    float _1223 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1225 = !_1125;
    int _1227 = _1225 ? 0 : 1;
    float _1229 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1167);
    bool _1231 = _1219 >= 0.0;
    float _1233 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1223);
    float _1235 = fma(_1207, _1207, _1221);
    float _1237 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1215);
    float _1239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1241 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1233);
    float _1243 = fma(_1193, _1193, _1235);
    float _1245 = -_1201;
    float _1247 = -_1229;
    float _1249 = fma(_1245, _1209, _1247);
    float _1251 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1237);
    float _1253 = -_1241;
    float _1255 = _1253 + 1.0;
    float _1257 = _635 * 2.0;
    float _1259 = _925 + 0.5;
    float _1261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1263 = -_1251;
    float _1265 = _1263 + 1.0;
    float _1267 = fma(_881, _1255, _1181);
    float _1269 = _1255;
    int _1271 = as_type<int>(_1175);
    float _1273 = _1203;
    if (_1231)
    {
        _1269 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1275 = _1269;
    float _1277 = -_141;
    float _1279 = fma(_1277, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1171);
    float _1281 = -_1265;
    float _1283 = fma(_855, _1281, _1147);
    float _1285 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1163);
    float _1287 = -_1109;
    float _1289 = _1287 + 0.5;
    float _1291 = rsqrt(_1243);
    float _1293 = fma(_893, _1175, _1249);
    if (_1231)
    {
        float _1295 = _1275 * 5.0;
        _1271 = as_type<int>(_1295);
    }
    int _1297 = _1271;
    float _1299 = fma(_1189, _1259, _1279);
    float _1301 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1303 = -_1285;
    float _1305 = _1303 + 1.0;
    float _1307 = _433 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1309 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1311 = floor(_1257);
    float _1313 = _1301 * _1239;
    float _1315 = -_1305;
    float _1317 = fma(_925, _1315, _1299);
    float _1319 = _1309 * _1261;
    float _1321 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1217);
    float _1323 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    if (_1231)
    {
        out.m_51.x = 0.0;
    }
    bool _1325 = !_1129;
    int _1327 = _1325 ? 0 : 1;
    float _1329 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1331 = log2(_1329);
    float _1333 = _1323 * _1291;
    out.m_78.x = _1313;
    out.m_78.y = _1319;
    bool _1335 = !_1133;
    int _1337 = _1335 ? 0 : 1;
    float _1339 = _1187 * _1333;
    out.m_80.x = _1283;
    out.m_80.y = _1267;
    out.m_80.z = _1317;
    out.m_80.w = _1293;
    bool _1341 = _1311 > 0.0;
    if (_1231)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5090 = as_type<float>(_1297);
        out.gl_Position.z = _5090;
    }
    float _1343 = _1207 * _1333;
    out.m_82.x = _1321;
    if (_1231)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1345 = -_1339;
    float _1347 = _735 + _1345;
    float _1349 = -_1343;
    float _1351 = _813 + _1349;
    int _1353 = _917 ? 0 : 1;
    float _1355 = _1331 * _141;
    float _1357 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1359 = _1347 + _1357;
    float _1361 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1363 = _1351 + _1361;
    int _1365 = ~_1353;
    int _1367 = _1365 + 1;
    int _1369 = _1367 + 1;
    float _1371 = _1193 * _1333;
    float _1373 = _1359 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1375 = _1369;
    float _1377 = _1371;
    if (!_905)
    {
        int _1379 = ~_1353;
        int _1381 = _1379 + 1;
        _1375 = _1381;
    }
    int _1383 = _1375;
    float _1385 = exp2(_1355);
    float _1387 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1373);
    int _1389 = abs(_1227);
    float _1391 = in.m_84.x;
    float _1393 = in.m_84.y;
    float _1395 = in.m_84.z;
    bool _1397 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1399 = isnan(1.0);
    bool _1401 = _1397 || _1399;
    bool _1403 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1405 = _1401 || _1403;
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1409 = 1.0 + _1407;
    float _1411 = float(_1383);
    float _1413 = -_1371;
    float _1415 = _1141 + _1413;
    float _1417 = float(_1389);
    float _1419 = 1.0 / _1409;
    bool _1421 = _1311 >= 0.0;
    bool _1423 = isnan(_1311);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan(0.0);
    bool _1429 = _1425 || _1427;
    float _1431 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1433 = _1415 + _1431;
    int _1435 = _943 ? 0 : 1;
    float _1437 = _1417 * _1411;
    bool _1439 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1441 = isnan(0.0);
    bool _1443 = _1439 || _1441;
    bool _1445 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1447 = _1443 || _1445;
    float _1449 = -_1385;
    float _1451 = _1449 + 1.0;
    float _1453 = -_1339;
    float _1455 = _1187 + _1453;
    float _1457 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1387);
    float _1459 = _1437 * (-2.0);
    float _1461 = -_1343;
    float _1463 = _1207 + _1461;
    float _1465 = _1447 ? _1451 : 0.0;
    float _1467 = _1455 * _1455;
    float _1469 = fma(_883, _1459, _883);
    bool _1471 = _1457 >= 0.0;
    float _1473 = -_1371;
    float _1475 = _1193 + _1473;
    int _1477 = ~_1435;
    int _1479 = _1477 + 1;
    int _1481 = _1479 + 1;
    float _1483 = fma(_1463, _1463, _1467);
    float _1485 = fma(_1459, _1391, _1391);
    float _1487 = _633 + (-0.5);
    int _1489 = _1481;
    float _1491 = _1463;
    if (!_927)
    {
        int _1493 = ~_1435;
        int _1495 = _1493 + 1;
        _1489 = _1495;
    }
    int _1497 = _1489;
    if (_1405)
    {
        float _1499 = _1465 * _1419;
        _163 = _1499;
    }
    float _1501 = _163;
    int _1503 = _1429 ? 0 : 1;
    float _1505 = fma(_1487, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1485);
    int _1507 = abs(_1327);
    float _1509 = fma(_1475, _1475, _1483);
    int _1511 = ~_1503;
    int _1513 = _1511 + 1;
    int _1515 = _1513 + 1;
    float _1517 = fma(_1469, _1501, _1505);
    int _1519 = _1515;
    if (!_1341)
    {
        int _1521 = ~_1503;
        int _1523 = _1521 + 1;
        _1519 = _1523;
    }
    int _1525 = _1519;
    int _1527 = abs(_1337);
    float _1529 = sqrt(_1509);
    float _1531 = _1517 * 0.15915493667125701904296875;
    float _1533 = float(_1525);
    if (_1471)
    {
        out.m_51.x = 0.0;
    }
    if (_1471)
    {
        _1491 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1535 = _1491;
    float _1537 = _1531 * 6.283185482025146484375;
    float _1539 = sin(_1537);
    int _1541 = as_type<int>(_1535);
    if (_1471)
    {
        float _1543 = _1535 * 5.0;
        _1541 = as_type<int>(_1543);
    }
    int _1545 = _1541;
    float _1547 = float(_1497);
    float _1549 = float(_1507);
    if (_1471)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5384 = as_type<float>(_1545);
        out.gl_Position.z = _5384;
    }
    float _1551 = _1549 * _1547;
    float _1553 = _635 + (-0.5);
    if (_1471)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1555 = -_735;
    float _1557 = _1555 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1559 = _1551 * (-2.0);
    float _1561 = -_813;
    float _1563 = _1561 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1565 = -_1141;
    float _1567 = _1565 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1569 = _1557 * _1557;
    float _1571 = fma(_1559, _1393, _1393);
    float _1573 = float(_1527);
    float _1575 = _637 + _633;
    float _1577 = fma(_1563, _1563, _1569);
    float _1579 = fma(_1553, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1571);
    float _1581 = fma(_871, _1559, _871);
    float _1583 = _1573 * _1533;
    float _1585 = fma(_1567, _1567, _1577);
    float _1587 = _1575 + (-1.0);
    float _1589 = _1583 * (-2.0);
    float _1591 = rsqrt(_1585);
    float _1593 = fma(_1581, _1501, _1579);
    float _1595 = _637 + (-0.5);
    float _1597 = fma(_1587, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1599 = fma(_1589, _1395, _1395);
    float _1601 = _1593 * 0.15915493667125701904296875;
    float _1603 = _431 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1605 = fma(_1597, _1589, _1597);
    float _1607 = fma(_1595, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1599);
    float _1609 = _1531 * 6.283185482025146484375;
    float _1611 = cos(_1609);
    float _1613 = fma(_1605, _1501, _1607);
    float _1615 = _1563 * _1591;
    float _1617 = _1601 * 6.283185482025146484375;
    float _1619 = sin(_1617);
    float _1621 = _1613 * 0.15915493667125701904296875;
    float _1623 = _1567 * _1591;
    float _1625 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1627 = _1615 * _1625;
    float _1629 = _1557 * _1591;
    float _1631 = _1291 * _1529;
    float _1633 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1635 = _1623 * _1633;
    float _1637 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1639 = -_1627;
    float _1641 = fma(_1623, _1637, _1639);
    float _1643 = _1601 * 6.283185482025146484375;
    float _1645 = cos(_1643);
    float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1649 = _1629 * _1647;
    float _1651 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1653 = -_1635;
    float _1655 = fma(_1629, _1651, _1653);
    float _1657 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _231);
    float _1659 = _1631 * _1603;
    float _1661 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1663 = -_1649;
    float _1665 = fma(_1615, _1661, _1663);
    float _1667 = _1307 * _1631;
    float _1669 = _1621 * 6.283185482025146484375;
    float _1671 = sin(_1669);
    float _1673 = _1641 * _1641;
    float _1675 = _1539 * _1619;
    float _1677 = _1611 * _1619;
    float _1679 = _1657 * _1659;
    float _1681 = fma(_1655, _1655, _1673);
    float _1683 = _1621 * 6.283185482025146484375;
    float _1685 = cos(_1683);
    float _1687 = _1611 * _1645;
    float _1689 = fma(_1665, _1665, _1681);
    float _1691 = _1539 * _1645;
    float _1693 = fma(_1671, _1687, _1675);
    float _1695 = fma(_1671, _1675, _1687);
    float _1697 = -_1677;
    float _1699 = fma(_1671, _1691, _1697);
    float _1701 = rsqrt(_1689);
    float _1703 = -_1679;
    float _1705 = _1671 * _1703;
    float _1707 = -_1691;
    float _1709 = fma(_1671, _1677, _1707);
    float _1711 = _1619 * _1685;
    float _1713 = _1611 * _1685;
    float _1715 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _227);
    float _1717 = _1645 * _1685;
    float _1719 = _1539 * _1685;
    float _1721 = _1713 * _1679;
    float _1723 = _1715 * _1667;
    float _1725 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1727 = _1725 * 0.5;
    float _1729 = _1719 * _1679;
    float _1731 = fma(_1717, _1723, _1705);
    float _1733 = _1655 * _1701;
    float _1735 = _1641 * _1701;
    float _1737 = _1665 * _1701;
    float _1739 = fma(_1693, _1723, _1721);
    float _1741 = _1629 * _1733;
    float _1743 = _1623 * _1735;
    float _1745 = fma(_1699, _1723, _1729);
    float _1747 = fma(_1709, _1727, _1739);
    float _1749 = -_1741;
    float _1751 = fma(_1615, _1735, _1749);
    float _1753 = fma(_1711, _1727, _1731);
    float _1755 = -_1743;
    float _1757 = fma(_1629, _1737, _1755);
    float _1759 = fma(_1695, _1727, _1745);
    float _1761 = _1751 * _1747;
    float _1763 = _1757 * _1747;
    float _1765 = fma(_1737, _1753, _1761);
    float _1767 = fma(_1733, _1753, _1763);
    float _1769 = fma(_1623, _1759, _1765);
    float _1771 = fma(_1615, _1759, _1767);
    float _1773 = _1615 * _1737;
    float _1775 = _1141 + _1769;
    float _1777 = _813 + _1771;
    float _1779 = -_1773;
    float _1781 = fma(_1623, _1733, _1779);
    float _1783 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1785 = _1775 + _1783;
    float _1787 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1789 = _1777 + _1787;
    float _1791 = _1785 * _1785;
    float _1793 = fma(_1789, _1789, _1791);
    float _1795 = _1781 * _1747;
    float _1797 = sqrt(_1793);
    float _1799 = fma(_1735, _1753, _1795);
    float _1801 = fma(_1629, _1759, _1799);
    float _1803 = _735 + _1801;
    bool _1805 = _1797 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1807 = _1801;
    float _1809 = _1799;
    float _1811 = _1759;
    if (!_1805)
    {
        _1807 = _1777;
    }
    float _1813 = _1807;
    float _1815 = _1813;
    if (!_1805)
    {
        _1809 = _1775;
    }
    float _1817 = _1809;
    float _1819 = _1817;
    if (!_1805)
    {
        _1811 = _1803;
    }
    float _1821 = _1811;
    bool _1823 = !_1805;
    float _1825 = _1821;
    if (!_1823)
    {
        float _1827 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1829 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1831 = _1797 + _1829;
        float _1833 = rsqrt(_1793);
        float _1835 = _1831 * _1827;
        float _1837 = _1803 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1839 = _1835 * 0.15915493667125701904296875;
        float _1841 = _1839 * 6.283185482025146484375;
        float _1843 = sin(_1841);
        float _1845 = _1839 * 6.283185482025146484375;
        float _1847 = cos(_1845);
        float _1849 = fma(_1843, _1837, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1851 = _1833 * _1849;
        float _1853 = _1847 + (-1.0);
        float _1855 = fma(_1789, _1851, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1857 = fma(_1785, _1851, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1859 = _1853 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1861 = fma(_1803, _1847, _1859);
        _1819 = _1857;
        _1815 = _1855;
        _1825 = _1861;
    }
    float _1863 = _1819;
    float _1865 = _1815;
    float _1867 = _1825;
    float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1871 = _1863 + _1869;
    float _1873 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1875 = _1865 + _1873;
    float _1877 = fma(_1871, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1879 = fma(_1875, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _5904 = float2(_1879, _1877);
    float _1881 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_5904, float2(0.0), isnan(_5904)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_5904, float2(0.0), isnan(_5904)), level(0.0)).x;
    float _1883 = -_735;
    float _1885 = _1883 + _1867;
    float _1887 = -_813;
    float _1889 = _1887 + _1865;
    float _1891 = -_1141;
    float _1893 = _1891 + _1863;
    float _1895 = _1885 * _1885;
    float _1897 = fma(_1889, _1889, _1895);
    float _1899 = fma(_1893, _1893, _1897);
    float _1901 = sqrt(_1899);
    bool _1903 = _1901 > 0.0;
    float _1905 = fma(_1881, 100.0, _1867);
    bool _1907 = !_1903;
    float _1909 = _1905;
    float _1911 = _1865;
    float _1913 = _1863;
    float _1915 = _1879;
    if (!_1907)
    {
        float _1917 = _217 * _217;
        float _1919 = fma(_221, _221, _1917);
        float _1921 = rsqrt(_1899);
        float _1923 = fma(_223, _223, _1919);
        float _1925 = sqrt(_1923);
        float _1927 = _1889 * _1921;
        float _1929 = _1893 * _1921;
        bool _1931 = _1925 > 0.0;
        float _1933 = _1885 * _1921;
        bool _1935 = !_1931;
        _1915 = _1933;
        if (!_1935)
        {
            float _1937 = rsqrt(_1923);
            float _1939 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1941 = _217 * _1937;
            float _1943 = _221 * _1937;
            float _1945 = _1933 * _1941;
            float _1947 = _223 * _1937;
            float _1949 = fma(_1927, _1943, _1945);
            float _1951 = _1939 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1953 = fma(_1929, _1947, _1949);
            float _1955 = _1953 * _1951;
            float _1957 = fma(_221, _1955, _1865);
            float _1959 = fma(_217, _1955, _1905);
            float _1961 = fma(_223, _1955, _1863);
            _1909 = _1959;
            _1911 = _1957;
            _1913 = _1961;
            _1915 = _1949;
        }
    }
    float _1963 = _1909;
    float _1965 = _1911;
    float _1967 = _1913;
    float _1969 = _1915;
    float _1971 = -_1339;
    float _1973 = _1971 + _1963;
    float _1975 = -_1343;
    float _1977 = _1975 + _1965;
    float _1979 = -_1371;
    float _1981 = _1979 + _1967;
    float _1983 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1985 = _1973 + _1983;
    float _1987 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1989 = _1977 + _1987;
    float _1991 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1993 = _1981 + _1991;
    float _1995 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1997 = _1985 * _1985;
    float _1999 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2001 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2003 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1995);
    float _2005 = fma(_1989, _1989, _1997);
    float _2007 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1999);
    float _2009 = fma(_1993, _1993, _2005);
    float _2011 = rsqrt(_2009);
    float _2013 = fma(_1351, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2015 = sqrt(_2009);
    float _2017 = _2011 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2019 = _1989 * _2017;
    float _2021 = _1993 * _2017;
    float _2023 = _2019 * _2019;
    float _2025 = _2021 * _2021;
    float _2027 = _2023 + _2025;
    float _2029 = sqrt(_2027);
    bool _2031 = _2029 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2033 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2035 = _2029 + _2033;
    float _2037 = _1993;
    float _2039 = _2035;
    float _2041 = _1969;
    float _2043 = _1985;
    if (_2031)
    {
        float _2045 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2037 = _2045;
    }
    float _2047 = _2037;
    if (_2031)
    {
        float _2049 = rsqrt(_2027);
        _1377 = _2049;
    }
    float _2051 = _1377;
    float _2053 = _2051;
    if (_2031)
    {
        float _2055 = _2035 * _2047;
        _2039 = _2055;
    }
    float _2057 = _2039;
    if (_2031)
    {
        float _2059 = _2057 * 0.15915493667125701904296875;
        _2041 = _2059;
    }
    float _2061 = _2041;
    float _2063 = _2011;
    float _2065 = _2061;
    if (_2031)
    {
        float _2067 = _2061 * 6.283185482025146484375;
        float _2069 = sin(_2067);
        _2063 = _2069;
    }
    float _2071 = _2063;
    float _2073 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2075 = precise::max(0.0, _2073);
    float _2077 = _223;
    float _2079 = _2073;
    float _2081 = _2075;
    if (_2031)
    {
        float _2083 = _2061 * 6.283185482025146484375;
        float _2085 = cos(_2083);
        _2077 = _2085;
    }
    float _2087 = _2077;
    float _2089 = -_2017;
    float _2091 = -_2075;
    float _2093 = fma(_1985, _2089, _2091);
    if (_2031)
    {
        float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2079 = _2095;
    }
    float _2097 = _2079;
    float _2099 = _2097;
    if (!_2031)
    {
        _2065 = _2093;
    }
    float _2101 = _2065;
    float _2103 = _2101;
    if (_2031)
    {
        float _2105 = fma(_2071, _2097, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2043 = _2105;
    }
    float _2107 = _2043;
    float _2109 = floor(_2013);
    float _2111 = _2107;
    if (_2031)
    {
        float _2113 = _2087 + (-1.0);
        _2099 = _2113;
    }
    float _2115 = _2099;
    float _2117 = _2115;
    if (_2031)
    {
        float _2119 = _2051 * _2107;
        _1273 = _2119;
    }
    float _2121 = _1273;
    if (!_2031)
    {
        _2053 = _2019;
    }
    float _2123 = _2053;
    float _2125 = _2123;
    if (_2031)
    {
        float _2127 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2081 = _2127;
    }
    float _2129 = _2081;
    float _2131 = _2129;
    if (_2031)
    {
        float _2133 = _2019 * _2121;
        _2125 = _2133;
    }
    float _2135 = _2125;
    if (!_2031)
    {
        _2111 = _2021;
    }
    float _2137 = _2111;
    float _2139 = _2137;
    if (_2031)
    {
        float _2141 = _2021 * _2121;
        _2139 = _2141;
    }
    float _2143 = _2139;
    if (!_2031)
    {
        _2117 = _2023;
    }
    float _2145 = _2117;
    float _2147 = _2145;
    if (_2031)
    {
        float _2149 = fma(_2093, _2087, _2129);
        _2103 = _2149;
    }
    float _2151 = _2103;
    if (_2031)
    {
        float _2153 = _2135 * _2135;
        _2147 = _2153;
    }
    float _2155 = _2147;
    float _2157 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_2031)
    {
        _2131 = _2025;
    }
    float _2159 = _2131;
    float _2161 = _2159;
    if (_2031)
    {
        float _2163 = _2143 * _2143;
        _2161 = _2163;
    }
    float _2165 = _2161;
    float _2167 = fma(_2151, _2151, _2155);
    float _2169 = fma(_1415, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2171 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2173 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2157);
    float _2175 = _2167 + _2165;
    float _2177 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2171);
    float _2179 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2173);
    float _2181 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2003);
    float _2183 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2007);
    float _2185 = rsqrt(_2175);
    float _2187 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2177);
    float _2189 = _2179 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2191 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2193 = fma(_2015, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2191);
    float _2195 = precise::clamp(_2193, 0.0, 1.0);
    float _2197 = _2181 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2199 = _2187 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2201 = _2189 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2203 = -_2195;
    float _2205 = _2203 + 1.0;
    float _2207 = _2183 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2209 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2211 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2201);
    float _2213 = floor(_2169);
    float _2215 = -_2109;
    float _2217 = _2013 + _2215;
    float _2219 = -_2209;
    float _2221 = fma(_2219, _2001, 1.0);
    float _2223 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2211);
    float _2225 = _2189 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2227 = _2185 * _2135;
    float _2229 = _2185 * _2151;
    float _2231 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2223);
    float _2233 = abs(_2205);
    float _2235 = log2(_2233);
    float _2237 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2239 = _2185 * _2143;
    float _2241 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2225);
    float _2243 = -_2237;
    float _2245 = fma(_2229, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2243);
    float _2247 = 1.0 / _2231;
    float _2249 = -_2239;
    float _2251 = fma(_2249, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2245);
    float _2253 = _2189 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2255 = -_2213;
    float _2257 = _2169 + _2255;
    float _2259 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2241);
    float _2261 = fma(_2251, -0.5, 0.5);
    float _2263 = fma(_2251, 0.5, 0.5);
    float _2265 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2253);
    float _2267 = _2235 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2269 = log2(_2221);
    float _2271 = fma(_2263, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2273 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2265);
    float _2275 = _2229 + 1.0;
    float _2277 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2259);
    float _2279 = fma(_2263, _2271, -0.212114393711090087890625);
    float _2281 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2273);
    float _2283 = exp2(_2267);
    float _2285 = fma(_2263, _2279, 1.570728778839111328125);
    float _2287 = sqrt(_2261);
    float _2289 = _2269 * 0.693147182464599609375;
    float2 _6579 = float2(_2217, _2257);
    float _2291 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6579, float2(0.0), isnan(_6579)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6579, float2(0.0), isnan(_6579)), level(0.0)).x;
    float _2293 = _2289 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2295 = -_2229;
    float _2297 = fma(_2283, _2275, _2295);
    float _2299 = _2277 * _2247;
    float _2301 = _2281 * _2247;
    float _2303 = fma(_2297, 0.5, 0.5);
    float _2305 = fma(_2299, 0.5, 0.5);
    float _2307 = fma(_2301, -0.5, 0.5);
    float _2309 = _2287 * 0.636619746685028076171875;
    float _2311 = -_2285;
    float _2313 = fma(_2309, _2311, 1.0);
    float3 _6618 = float3(_2305, _2307, _2293);
    float _2315 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6618, float3(0.0), isnan(_6618)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6618, float3(0.0), isnan(_6618)), level(0.0)).x;
    float3 _6629 = float3(_2305, _2307, _2293);
    float4 _2318 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6629, float3(0.0), isnan(_6629)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6629, float3(0.0), isnan(_6629)), level(0.0)).xyzw;
    float _2320 = _2318.x;
    float _2322 = _2318.y;
    float _2324 = _2318.z;
    float _2326 = _2318.w;
    float2 _6645 = float2(_2313, _2303);
    float3 _2330 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6645, float2(0.0), isnan(_6645)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6645, float2(0.0), isnan(_6645)), level(0.0)).xyz;
    float _2332 = _2330.x;
    float _2334 = _2330.y;
    float _2336 = _2330.z;
    float _2338 = _1713 * _1757;
    float _2340 = _1713 * _1781;
    float _2342 = _1713 * _1751;
    float _2344 = _1693 * _1781;
    float _2346 = _1693 * _1757;
    float _2348 = _1709 * _1781;
    float _2350 = _1693 * _1751;
    float _2352 = fma(_1881, 100.0, _735);
    float _2354 = _1709 * _1751;
    float _2356 = -_1671;
    float _2358 = fma(_2356, _1735, _2340);
    float _2360 = fma(_1717, _1735, _2344);
    float _2362 = fma(_1711, _1735, _2348);
    float _2364 = -_1339;
    float _2366 = _2364 + _2352;
    float _2368 = fma(_1717, _1733, _2346);
    float _2370 = fma(_1711, _1737, _2354);
    float _2372 = fma(_1717, _1737, _2350);
    float _2374 = fma(_1719, _1629, _2358);
    float _2376 = fma(_1699, _1629, _2360);
    float _2378 = fma(_1695, _1629, _2362);
    float _2380 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2382 = _1709 * _1757;
    float _2384 = -_1671;
    float _2386 = fma(_2384, _1733, _2338);
    float _2388 = -_1671;
    float _2390 = fma(_2388, _1737, _2342);
    float _2392 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2380);
    float _2394 = fma(_1711, _1733, _2382);
    float _2396 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2398 = fma(_1719, _1615, _2386);
    float _2400 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2392);
    float _2402 = fma(_1699, _1615, _2368);
    float _2404 = fma(_1695, _1615, _2394);
    float _2406 = fma(_1719, _1623, _2390);
    float _2408 = _2400 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2410 = fma(_1699, _1623, _2372);
    float _2412 = fma(_1695, _1623, _2370);
    float _2414 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2396);
    float _2416 = 1.0 / _2408;
    float _2418 = _231 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2420 = _227 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2422 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2414);
    float _2424 = _2418 * _2398;
    float _2426 = _2418 * _2374;
    float _2428 = _2422 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2430 = _2418 * _2406;
    float _2432 = fma(_2420, _2402, _2424);
    float _2434 = fma(_2420, _2376, _2426);
    float _2436 = _2428 + _2408;
    float _2438 = fma(_2420, _2410, _2430);
    float _2440 = _2404 + _2432;
    float _2442 = _2235 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2444 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2446 = isnan(0.5);
    bool _2448 = _2444 || _2446;
    bool _2450 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2452 = _2448 || _2450;
    float _2454 = _2436 * _2416;
    float _2456 = _2454 * 0.5;
    float _2458 = _2277 + _2231;
    float _2460 = _2378 + _2434;
    float _2462 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2464 = fma(_2456, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2462);
    float _2466 = exp2(_2442);
    float _2468 = _2412 + _2438;
    float _2470 = _2458 * 0.5;
    float _2472 = 1.0 / _2464;
    float _2474 = in.m_76.x;
    float _2476 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2478 = _2472 * _2476;
    float _2480 = abs(_2478);
    float _2482 = log2(_2480);
    bool _2484 = _2478 <= 8000.0;
    bool _2486 = isnan(_2478);
    bool _2488 = _2484 || _2486;
    bool _2490 = isnan(8000.0);
    bool _2492 = _2488 || _2490;
    float _2494 = float(_2492);
    float _2496 = _2482 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2498 = exp2(_2496);
    float _2500 = fma(_2498, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2502 = precise::clamp(_2500, 0.0, 1.0);
    float _2504 = _2189 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2506 = fma(_2502, -2.0, 3.0);
    float _2508 = _2502 * _2502;
    float _2510 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2504);
    float _2512 = _2508 * _2506;
    float _2514 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2510);
    float _2516 = _2510;
    if (_2452)
    {
        _2516 = 1.0;
    }
    float _2518 = _2516;
    float _2520 = -_2512;
    float _2522 = _2520 + 1.0;
    float _2524 = fma(_2207, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2514);
    float _2526 = fma(_2522, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2512);
    float _2528 = _2231 * 0.5;
    float _2530 = _2524 + _2231;
    float _2532 = fma(_2281, -0.5, _2528);
    float _2534 = _2530 * 0.5;
    float _2536 = _2528;
    float _2538 = _2518;
    if (_2452)
    {
        _2536 = 1.0;
    }
    float _2540 = _2536;
    float _2542 = _2540;
    float _2544 = _2326;
    float _2546 = _2324;
    float _2548 = _2474;
    float _2550 = _2322;
    float _2552 = _2320;
    if (!_2452)
    {
        float _2554 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2556 = _2554 * 0.15915493667125701904296875;
        float _2558 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2560 = _2556 * 6.283185482025146484375;
        float _2562 = cos(_2560);
        float _2564 = _2558 * 0.15915493667125701904296875;
        float _2566 = _2556 * 6.283185482025146484375;
        float _2568 = sin(_2566);
        float _2570 = 1.0 / _2562;
        float _2572 = _2564 * 6.283185482025146484375;
        float _2574 = cos(_2572);
        float _2576 = _2568 * _2570;
        float _2578 = _2564 * 6.283185482025146484375;
        float _2580 = sin(_2578);
        float _2582 = _2574 * _2576;
        float _2584 = 1.0 / _2582;
        float _2586 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2588 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2586;
        float _2590 = 1.0 / _2588;
        float _2592 = _2580 * _2584;
        float _2594 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2596 = fma(_2478, _2592, _2594);
        float _2598 = _2596 * _2590;
        float _2600 = precise::clamp(_2598, 0.0, 1.0);
        _2542 = _2600;
    }
    float _2602 = _2542;
    if (!_2452)
    {
        float _2604 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2606 = _2604 * 0.15915493667125701904296875;
        float _2608 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2610 = _2606 * 6.283185482025146484375;
        float _2612 = cos(_2610);
        float _2614 = _2608 * 0.15915493667125701904296875;
        float _2616 = _2606 * 6.283185482025146484375;
        float _2618 = sin(_2616);
        float _2620 = 1.0 / _2612;
        float _2622 = _2614 * 6.283185482025146484375;
        float _2624 = cos(_2622);
        float _2626 = _2618 * _2620;
        float _2628 = _2614 * 6.283185482025146484375;
        float _2630 = sin(_2628);
        float _2632 = _2624 * _2626;
        float _2634 = 1.0 / _2632;
        float _2636 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2638 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2636;
        float _2640 = 1.0 / _2638;
        float _2642 = _2630 * _2634;
        float _2644 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2646 = fma(_2478, _2642, _2644);
        float _2648 = _2646 * _2640;
        float _2650 = precise::clamp(_2648, 0.0, 1.0);
        float _2652 = -_2650;
        float _2654 = _2652 + 1.0;
        _2538 = _2654;
    }
    float _2656 = _2538;
    float _2658 = _2494 * _2526;
    float _2660 = -_2466;
    float _2662 = _2660 + 1.0;
    float _2664 = -_2291;
    float _2666 = _2664 + 1.0;
    float _2668 = _2658 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2670 = _2662 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2277;
    out.gl_Position.y = _2281;
    out.gl_Position.z = _2524;
    out.gl_Position.w = _2231;
    bool _2672 = _2015 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2674 = isnan(_2015);
    bool _2676 = _2672 || _2674;
    bool _2678 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2680 = _2676 || _2678;
    float _2682 = _2666 * _2668;
    float _2684 = precise::clamp(_2682, 0.0, 1.0);
    float _2686 = _2670 * _2315;
    float _2688 = -_2670;
    float _2690 = _2688 + 1.0;
    out.m_86.x = _2470;
    out.m_86.y = _2532;
    out.m_86.z = _2534;
    out.m_86.w = _2231;
    float _2692 = -_2684;
    float _2694 = fma(_2692, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2696 = _2326 * _2686;
    out.m_88.x = _2440;
    out.m_88.y = _2460;
    out.m_88.z = _2468;
    float _2698 = _2694 * _2474;
    float _2700 = _2336 * _2686;
    float _2702 = fma(_2334, _2696, _2322);
    float _2704 = fma(_2332, _2696, _2320);
    float _2706 = _2326 * _2690;
    float _2708 = _2698 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2710 = fma(_2326, _2700, _2324);
    float _2712 = _2602 * _2656;
    float _2714 = _2698;
    if (!_2680)
    {
        _2544 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2716 = _2544;
    out.m_90.x = _2708;
    float _2718 = _2716;
    float _2720 = _2716;
    if (!_2680)
    {
        _2546 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2722 = _2546;
    float _2724 = _2712 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2726 = _2722;
    float _2728 = _2722;
    if (!_2680)
    {
        _2548 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2730 = _2548;
    out.m_92.x = _2704;
    out.m_92.y = _2702;
    out.m_92.z = _2710;
    out.m_92.w = _2706;
    float _2732 = _2730;
    float _2734 = _2730;
    if (!_2680)
    {
        _2714 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2736 = _2714;
    float _2738 = _2736;
    float _2740 = _2736;
    if (!_2680)
    {
        _2550 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2742 = _2550;
    float _2744 = _2742;
    float _2746 = _2742;
    if (!_2680)
    {
        _2552 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2748 = _2552;
    bool _2750 = !_2680;
    float _2752 = _2748;
    float _2754 = _2748;
    if (!_2750)
    {
        bool _2756 = _2015 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2758 = isnan(_2015);
        bool _2760 = _2756 || _2758;
        bool _2762 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2764 = _2760 || _2762;
        if (!_2764)
        {
            float _2766 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2768 = _2015 + _2766;
            float _2770 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2772 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2770;
            float _2774 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2776 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2778 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2780 = _2778 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2782 = 1.0 / _2772;
            float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2786 = _2784 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2788 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2790 = _2788 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2792 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2794 = _2792 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2796 = _2768 * _2782;
            float _2798 = precise::clamp(_2796, 0.0, 1.0);
            float _2800 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2802 = _2800 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2804 = fma(_2798, _2776, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2806 = fma(_2798, _2780, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2808 = fma(_2798, _2786, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2810 = fma(_2798, _2802, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2812 = fma(_2798, _2790, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2814 = fma(_2798, _2794, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2728 = _2808;
            _2746 = _2804;
            _2720 = _2806;
            _2740 = _2812;
            _2734 = _2810;
            _2754 = _2814;
            _2816 = true;
        }
        else
        {
            bool _2818 = _2015 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2820 = isnan(_2015);
            bool _2822 = _2818 || _2820;
            bool _2824 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2826 = _2822 || _2824;
            if (!_2826)
            {
                _2718 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2828 = _2718;
            _2720 = _2828;
            if (!_2826)
            {
                _2726 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2830 = _2726;
            _2728 = _2830;
            if (!_2826)
            {
                _2732 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2832 = _2732;
            _2734 = _2832;
            if (!_2826)
            {
                _2738 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2834 = _2738;
            _2740 = _2834;
            if (!_2826)
            {
                _2744 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2836 = _2744;
            _2746 = _2836;
            if (!_2826)
            {
                _2752 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2838 = _2752;
            bool _2840 = !_2826;
            _2754 = _2838;
            if (!_2840)
            {
                bool _2842 = _2015 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2844 = isnan(_2015);
                bool _2846 = _2842 || _2844;
                bool _2848 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2850 = _2846 || _2848;
                if (!_2850)
                {
                    float _2852 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2854 = _2015 + _2852;
                    float _2856 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2858 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2856;
                    float _2860 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2862 = _2860 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2864 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2866 = _2864 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2868 = 1.0 / _2858;
                    float _2870 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2872 = _2870 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2874 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2876 = _2874 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2878 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2880 = _2878 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2882 = _2854 * _2868;
                    float _2884 = precise::clamp(_2882, 0.0, 1.0);
                    float _2886 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2888 = _2886 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2890 = fma(_2884, _2862, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2892 = fma(_2884, _2866, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2894 = fma(_2884, _2872, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2896 = fma(_2884, _2888, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2898 = fma(_2884, _2876, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2900 = fma(_2884, _2880, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2728 = _2894;
                    _2746 = _2890;
                    _2720 = _2892;
                    _2740 = _2898;
                    _2734 = _2896;
                    _2754 = _2900;
                    _2816 = true;
                }
                else
                {
                    _2728 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2746 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2720 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2740 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2734 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2754 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2816 = false;
    float _2902 = _2728;
    float _2904 = _2746;
    float _2906 = _2720;
    float _2908 = _2740;
    float _2910 = _2734;
    float _2912 = _2754;
    float _2914 = fma(_2460, -0.5, 0.5);
    float _2916 = precise::clamp(_2914, 0.0, 1.0);
    float _2918 = -_2902;
    float _2920 = _2918 + _2904;
    float _2922 = -_2906;
    float _2924 = _2922 + _2908;
    out.m_94.x = 0.0;
    float _2926 = -_2910;
    float _2928 = _2926 + _2912;
    float _2930 = fma(_2916, _2920, _2902);
    float _2932 = fma(_2916, _2924, _2906);
    bool _2934 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2936 = _2930 * 0.586610972881317138671875;
    float _2938 = fma(_2916, _2928, _2910);
    float _2940 = _2724 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2942 = fma(_2932, 0.298911988735198974609375, _2936);
    bool _2944 = _2602 > 0.0;
    bool _2946 = isnan(_2602);
    bool _2948 = _2944 || _2946;
    bool _2950 = isnan(0.0);
    bool _2952 = _2948 || _2950;
    float _2954 = fma(_2938, 0.114477999508380889892578125, _2942);
    out.m_51.x = _2940;
    bool _2956 = _2656 <= 0.0;
    bool _2958 = !_2952;
    bool _2960 = _2956 || _2958;
    float _2962 = -_2954;
    float _2964 = _2932 + _2962;
    float _2966 = -_2954;
    float _2968 = _2938 + _2966;
    float _2970 = fma(_2964, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2954);
    float _2972 = -_2954;
    float _2974 = _2930 + _2972;
    float _2976 = fma(_2974, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2954);
    float _2978 = fma(_2968, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2954);
    bool _2980 = !_2934;
    if (!_2980)
    {
        float _2982 = -_1973;
        float _2984 = _2982 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2986 = -_1977;
        float _2988 = _2986 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2990 = -_1981;
        float _2992 = _2990 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2994 = _2984 * _2984;
        float _2996 = fma(_2988, _2988, _2994);
        float _2998 = fma(_2992, _2992, _2996);
        float _3000 = sqrt(_2998);
        float _3002 = rsqrt(_2998);
        float _3004 = -_3000;
        float _3006 = _3004 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3008 = _3006 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3010 = precise::clamp(_3008, 0.0, 1.0);
        float _3012 = _2988 * _3002;
        float _3014 = _2984 * _3002;
        float _3016 = abs(_3010);
        float _3018 = log2(_3016);
        float _3020 = _2992 * _3002;
        float _3022 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3024 = _2460 * _3014;
        float _3026 = -_3014;
        float _3028 = -_3022;
        float _3030 = fma(_3026, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3028);
        float _3032 = fma(_2440, _3012, _3024);
        float _3034 = -_3020;
        float _3036 = fma(_3034, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3030);
        float _3038 = fma(_2468, _3020, _3032);
        float _3040 = precise::clamp(_3038, 0.0, 1.0);
        float _3042 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3044 = _3036 + _3042;
        float _3046 = _3018 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3048 = _3044 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3050 = precise::clamp(_3048, 0.0, 1.0);
        float _3052 = exp2(_3046);
        float _3054 = _3052 * _3050;
        float _3056 = _3040 * _3054;
        float _3058 = _3056 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3060 = _3056 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3062 = _3056 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_94.x = _3058;
        out.m_94.y = _3060;
        out.m_94.z = _3062;
    }
    out.m_96.x = _2970;
    out.m_96.y = _2976;
    out.m_96.z = _2978;
    if (!_2960)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3064 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_51.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3064;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

