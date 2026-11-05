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
    float4 m_66 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_74 [[user(locn2)]];
    float4 m_86 [[user(locn3)]];
    float4 m_94 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_70 [[user(locn6)]];
    float4 m_78 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_76 [[user(locn9)]];
    float4 m_92 [[user(locn10)]];
    float4 m_82 [[user(locn11)]];
    float4 m_88 [[user(locn12)]];
    float4 m_90 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_84 [[attribute(0)]];
    float4 m_68 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_50 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_62 [[attribute(5)]];
    float4 m_64 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2454 = false;
    bool _1667 = false;
    bool _581 = false;
    bool _431 = false;
    bool _237 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_50.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_53.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2753 = as_type<float>(_129);
        out.gl_Position.z = _2753;
    }
    if (!_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = in.m_55.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_113);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _123;
    if (_161)
    {
        out.m_53.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2822 = as_type<float>(_167);
        out.gl_Position.z = _2822;
    }
    if (_161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = in.m_60.x;
    float _173 = in.m_60.y;
    float _175 = in.m_60.z;
    int _177 = as_type<int>(_169) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_169) & 2;
    bool _183 = _181 != 0;
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _187 = _173 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _189 = _173 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _191 = _173 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _193 = !_179;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].x, _187);
    float _199 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].x, _189);
    float _201 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].x, _191);
    bool _203 = !_183;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].z, _197);
    float _209 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].z, _199);
    float _211 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].z, _201);
    bool _213 = !_185;
    float _215 = _209;
    float _217 = _211;
    float _235;
    if (!_213)
    {
        float _219 = in.m_62.x;
        float _221 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _223 = _219 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _227 = _225 * _221;
        float _229 = floor(_227);
        float _231 = -_229;
        float _233 = _227 + _231;
        _235 = _233;
        _237 = true;
    }
    else
    {
        float _239 = float(_113);
        float _241 = 1.0 / _239;
        float _243 = _147 * _241;
        _235 = _243;
    }
    _237 = false;
    float _245 = _235;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = _245 + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = _245 + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _257 = _245 + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _265 = _263 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _267;
    float _271 = 1.0 / _261;
    bool _273 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _275 = 1.0 / _269;
    bool _277 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _279 = isnan(_245);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = 1.0 / _265;
    float _291 = _249 * _271;
    bool _293 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _295 = isnan(_245);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = _253 * _275;
    bool _307 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _309 = isnan(_245);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -_287;
    float _321 = _319 + 1.0;
    float _323 = _317 * _321;
    float _325 = -_317;
    float _327 = _325 + 1.0;
    float _329 = _257 * _289;
    float _331 = -_303;
    float _333 = _331 + 1.0;
    bool _335 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _337 = isnan(_245);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _355 = _287 * _333;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _365 = fma(_349, _291, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _367 = _345 * _327;
    float _369 = fma(_359, _291, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _371 = fma(_353, _329, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _373 = fma(_363, _329, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _375 = -_345;
    float _377 = _375 + 1.0;
    float _379 = _365 * _367;
    float _381 = _369 * _367;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _383;
    float _387 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].x, _379);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _389;
    float _393 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].y, _381);
    float _395 = fma(_385, _305, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _397 = fma(_371, _323, _387);
    float _399 = fma(_391, _305, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _401 = fma(_373, _323, _393);
    float _403 = fma(_395, _355, _397);
    float _405 = fma(_399, _355, _401);
    float _407 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[146].x, _403);
    float _409 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[146].y, _405);
    bool _411 = !_273;
    float _429;
    if (!_411)
    {
        float _413 = in.m_62.x;
        float _415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _417 = _413 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _419 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _421 = _419 * _415;
        float _423 = floor(_421);
        float _425 = -_423;
        float _427 = _421 + _425;
        _429 = _427;
        _431 = true;
    }
    else
    {
        float _433 = float(_113);
        float _435 = 1.0 / _433;
        float _437 = _147 * _435;
        _429 = _437;
    }
    _431 = false;
    float _439 = _429;
    float _441 = in.m_64.x;
    float _443 = in.m_64.y;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _449 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _451 = isnan(_439);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _465 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _467 = isnan(_439);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = 1.0 / _447;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _479;
    float _483 = -_459;
    float _485 = _483 + 1.0;
    bool _487 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _489 = isnan(_439);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    bool _499 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _501 = 1.0 / _463;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _507 = _481 * _477;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _511 = _439 + _509;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _515 = _439 + _513;
    float _517 = _407 * _441;
    float _519 = fma(_507, _511, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _521 = _475 * _485;
    float _523 = -_475;
    float _525 = _523 + 1.0;
    float _527 = _505 * _501;
    float _529 = -_497;
    float _531 = _529 + 1.0;
    float _533 = _519 * _521;
    float _535 = fma(_527, _515, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _537 = _459 * _531;
    float _539 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[115].x, _533);
    float _541 = _409 * _443;
    float _543 = fma(_535, _537, _539);
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _549 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[117].x, _543);
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _553 = _545 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _555 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _557 = _549 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _559 = _551 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _553;
    out.m_66.y = _555;
    out.m_66.z = _559;
    out.m_66.w = _557;
    bool _561 = !_499;
    float _579;
    if (!_561)
    {
        float _563 = in.m_62.x;
        float _565 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _567 = _563 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _569 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[11].w, _147);
        float _571 = _569 * _565;
        float _573 = floor(_571);
        float _575 = -_573;
        float _577 = _571 + _575;
        _579 = _577;
        _581 = true;
    }
    else
    {
        float _583 = float(_113);
        float _585 = 1.0 / _583;
        float _587 = _147 * _585;
        _579 = _587;
    }
    _581 = false;
    float _589 = _579;
    float _591 = in.m_62.x;
    float _593 = in.m_62.y;
    float _595 = in.m_62.z;
    float _597 = in.m_62.w;
    float _599 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _601 = log2(_599);
    float _603 = _517 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _607 = _605 != 0;
    float _609 = _541 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _615 = _601 * _147;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _621 = _595 * 2.0;
    float _623 = _591 * 2.0;
    float _625 = _591 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _627 = _593 * 2.0;
    float _629 = _593 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _633 = floor(_621);
    float _635 = -_611;
    float _637 = fma(_625, 2.0, _635);
    float _639 = fma(_629, -2.0, _613);
    float _641 = -_147;
    float _643 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[76].x, _637);
    float _645 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _639);
    float _647 = floor(_623);
    bool _649 = _633 > 0.0;
    float _651 = floor(_627);
    bool _653 = _633 >= 0.0;
    bool _655 = isnan(_633);
    bool _657 = _653 || _655;
    bool _659 = isnan(0.0);
    bool _661 = _657 || _659;
    float _663 = _593 + _591;
    float _665 = _661 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _667 = _663 + (-1.0);
    bool _669 = _647 > 0.0;
    bool _671 = _647 >= 0.0;
    bool _673 = isnan(_647);
    bool _675 = _671 || _673;
    bool _677 = isnan(0.0);
    bool _679 = _675 || _677;
    float _681 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _683 = _593 > 0.5;
    int _685 = ~as_type<int>(_665);
    int _687 = _685 + 1;
    int _689 = _687 + 1;
    int _691 = _689;
    float _693 = _647;
    float _695 = _665;
    if (!_649)
    {
        int _697 = ~as_type<int>(_665);
        int _699 = _697 + 1;
        _691 = _699;
    }
    int _701 = _691;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _705 = _703 != 0;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _709 = _707 != 0;
    bool _711 = _595 > 0.5;
    float _713 = -_195;
    float _715 = _683 ? _713 : _195;
    float _717 = -_205;
    int _719 = _711 ? as_type<int>(_717) : as_type<int>(_205);
    bool _721 = !_705;
    float _723 = _721 ? _195 : _715;
    float _725 = _715;
    if (!_607)
    {
        _693 = _593;
    }
    float _727 = _693;
    float _729 = _727;
    if (!_607)
    {
        _695 = _595;
    }
    float _731 = _695;
    float _733 = _731;
    if (!_607)
    {
        _725 = _595;
    }
    float _735 = _725;
    bool _737 = !_709;
    float _739 = _737 ? _205 : as_type<float>(_719);
    float _741 = _735;
    if (_607)
    {
        _729 = _591;
    }
    float _743 = _729;
    if (_607)
    {
        _733 = _593;
    }
    float _745 = _733;
    if (_607)
    {
        _741 = _593;
    }
    float _747 = _741;
    float _749 = _743 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _753 = _751 != 0;
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _757 = _755 != 0;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _761 = _759 != 0;
    float _763 = _745 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _765 = _679 ? 0 : 1;
    float _767 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[83].w, _619);
    bool _769 = _651 > 0.0;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _773 = !_753;
    int _775 = _773 ? 0 : 1;
    float _777 = -_631;
    float _779 = fma(_749, 2.0, _777);
    bool _781 = _651 >= 0.0;
    bool _783 = isnan(_651);
    bool _785 = _781 || _783;
    bool _787 = isnan(0.0);
    bool _789 = _785 || _787;
    float _791 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[83].z, _617);
    int _793 = abs(_775);
    float _795 = exp2(_615);
    float _797 = float(_701);
    float _799 = fma(_763, -2.0, _771);
    float _801 = float(_793);
    float _803 = -_147;
    float _805 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[81].x, _779);
    int _807 = _789 ? 0 : 1;
    float _809 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _791);
    int _811 = ~_765;
    int _813 = _811 + 1;
    int _815 = _813 + 1;
    float _817 = _801 * _797;
    int _819 = ~_807;
    int _821 = _819 + 1;
    int _823 = _821 + 1;
    float _825 = in.m_68.x;
    float _827 = in.m_68.y;
    float _829 = in.m_68.z;
    int _831 = _815;
    int _833 = _823;
    if (!_669)
    {
        int _835 = ~_765;
        int _837 = _835 + 1;
        _831 = _837;
    }
    int _839 = _831;
    float _841 = _591 + (-0.5);
    if (!_769)
    {
        int _843 = ~_807;
        int _845 = _843 + 1;
        _833 = _845;
    }
    int _847 = _833;
    float _849 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _799);
    bool _851 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _853 = isnan(1.0);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _859 = _855 || _857;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _865 = 1.0 + _863;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _869 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _871 = isnan(0.0);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _877 = _873 || _875;
    float _879 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[78].w, _861);
    float _881 = 1.0 / _865;
    float _883 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[78].z, _867);
    float _885 = -_795;
    float _887 = _885 + 1.0;
    float _889 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _879);
    bool _891 = !_757;
    int _893 = _891 ? 0 : 1;
    float _895 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _883);
    float _897 = float(_839);
    float _899 = _877 ? _887 : 0.0;
    float _901 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _767);
    float _903 = _817 * (-2.0);
    int _905 = abs(_893);
    bool _907 = !_761;
    int _909 = _907 ? 0 : 1;
    float _911 = fma(_903, _825, _825);
    float _913 = float(_905);
    if (_859)
    {
        float _915 = _899 * _881;
        _151 = _915;
    }
    float _917 = _151;
    float _919 = fma(_681, _903, _681);
    float _921 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[196].x, _911);
    int _923 = abs(_909);
    float _925 = _913 * _897;
    float _927 = _593 + _595;
    float _929 = fma(_919, _917, _921);
    float _931 = _593 + (-0.5);
    float _933 = float(_847);
    float _935 = _927 + (-1.0);
    float _937 = float(_923);
    float _939 = _925 * (-2.0);
    float _941 = _929 * 0.15915493667125701904296875;
    float _943 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _945 = _595 + _591;
    float _947 = fma(_939, _827, _827);
    float _949 = _937 * _933;
    float _951 = fma(_943, _939, _943);
    float _953 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[196].y, _947);
    float _955 = _945 + (-1.0);
    float _957 = _949 * (-2.0);
    float _959 = _595 + (-0.5);
    float _961 = fma(_951, _917, _953);
    float _963 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _965 = fma(_957, _829, _829);
    float _967 = _941 * 6.283185482025146484375;
    float _969 = cos(_967);
    float _971 = _961 * 0.15915493667125701904296875;
    float _973 = fma(_963, _957, _963);
    float _975 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[196].z, _965);
    float _977 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _979 = fma(_973, _917, _975);
    float _981 = _971 * 6.283185482025146484375;
    float _983 = sin(_981);
    float _985 = _603 * _977;
    float _987 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _989 = _979 * 0.15915493667125701904296875;
    float _991 = in.m_50.x;
    float _993 = in.m_50.y;
    float _995 = in.m_50.z;
    float _997 = _609 * _987;
    float _999 = _971 * 6.283185482025146484375;
    float _1001 = cos(_999);
    float _1003 = _941 * 6.283185482025146484375;
    float _1005 = sin(_1003);
    float _1007 = _969 * _983;
    float _1009 = _989 * 6.283185482025146484375;
    float _1011 = cos(_1009);
    float _1013 = _969 * _1001;
    float _1015 = _989 * 6.283185482025146484375;
    float _1017 = sin(_1015);
    float _1019 = _1005 * _983;
    float _1021 = _1005 * _1001;
    float _1023 = _969 * _1011;
    float _1025 = _1005 * _1011;
    float _1027 = _1001 * _1011;
    float _1029 = _983 * _1011;
    float _1031 = _1023 * _997;
    float _1033 = _1025 * _997;
    float _1035 = fma(_1017, _1013, _1019);
    float _1037 = -_1007;
    float _1039 = fma(_1017, _1021, _1037);
    float _1041 = fma(_1017, _1019, _1013);
    float _1043 = -_1021;
    float _1045 = fma(_1017, _1007, _1043);
    float _1047 = -_997;
    float _1049 = _1017 * _1047;
    float _1051 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1053 = fma(_1035, _985, _1031);
    float _1055 = fma(_1027, _985, _1049);
    float _1057 = fma(_1039, _985, _1033);
    float _1059 = fma(_1045, _1051, _1053);
    float _1061 = _993 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1063 = fma(_1029, _1051, _1055);
    float _1065 = fma(_1041, _1051, _1057);
    float _1067 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1069 = _993 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1071 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1073 = fma(_991, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1061);
    float _1075 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1067);
    float _1077 = fma(_991, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1069);
    float _1079 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1071);
    float _1081 = fma(_995, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1073);
    float _1083 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1075);
    float _1085 = fma(_995, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1077);
    float _1087 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1079);
    float _1089 = _1081 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1091 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1093 = _1085 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1095 = _1087 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1097 = _993 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1099 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1101 = _1093 + _1091;
    float _1103 = _1089 + _1095;
    float _1105 = fma(_991, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1097);
    float _1107 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1099);
    float _1109 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1111 = _1101 + _1109;
    float _1113 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1115 = _1103 + _1113;
    float _1117 = fma(_995, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1105);
    float _1119 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1107);
    float _1121 = _1111 * _1111;
    float _1123 = _1115 * _1115;
    float _1125 = _1117 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1127 = _1119 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1129 = _1121 + _1123;
    float _1131 = sqrt(_1129);
    float _1133 = fma(_1093, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    bool _1135 = _1131 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1137 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1139 = _1131 + _1137;
    float _1141 = 0.0;
    float _1143 = _1129;
    float _1145 = _1131;
    float _1147 = _1117;
    float _1149 = _1101;
    float _1151 = _1103;
    float _1153 = _1121;
    float _1155 = _1123;
    if (_1135)
    {
        float _1157 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1141 = _1157;
    }
    float _1159 = _1141;
    if (_1135)
    {
        float _1161 = rsqrt(_1129);
        _1143 = _1161;
    }
    float _1163 = _1143;
    if (_1135)
    {
        float _1165 = _1139 * _1159;
        _1145 = _1165;
    }
    float _1167 = _1145;
    float _1169 = _1125 + _1127;
    float _1171 = floor(_1133);
    float _1173 = _1167;
    float _1175 = _1169;
    if (_1135)
    {
        float _1177 = _1167 * 0.15915493667125701904296875;
        _1173 = _1177;
    }
    float _1179 = _1173;
    if (_1135)
    {
        float _1181 = _1169 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1147 = _1181;
    }
    float _1183 = _1147;
    float _1185 = fma(_1089, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1187 = _991;
    float _1189 = _1183;
    if (_1135)
    {
        float _1191 = _1179 * 6.283185482025146484375;
        float _1193 = sin(_1191);
        _1187 = _1193;
    }
    float _1195 = _1187;
    float _1197 = floor(_1185);
    if (_1135)
    {
        float _1199 = fma(_1195, _1183, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1189 = _1199;
    }
    float _1201 = _1189;
    float _1203 = _1201;
    if (_1135)
    {
        float _1205 = _1163 * _1201;
        _1203 = _1205;
    }
    float _1207 = _1203;
    if (_1135)
    {
        float _1209 = fma(_1111, _1207, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1149 = _1209;
    }
    float _1211 = _1149;
    if (_1135)
    {
        float _1213 = fma(_1115, _1207, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1151 = _1213;
    }
    float _1215 = _1151;
    float _1217 = -_1171;
    float _1219 = _1133 + _1217;
    float _1221 = -_1197;
    float _1223 = _1185 + _1221;
    float _1225 = fma(_1211, 6.2500002968590706586837768554688e-05, 0.5);
    float _1227 = fma(_1215, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4511 = float2(_1225, _1227);
    float3 _1231 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4511, float2(0.0), isnan(_4511)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4511, float2(0.0), isnan(_4511)), level(0.0)).xyz;
    float _1233 = _1231.x;
    float _1235 = _1231.y;
    float _1237 = _1231.z;
    float2 _4527 = float2(_1219, _1223);
    float _1239 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4527, float2(0.0), isnan(_4527)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4527, float2(0.0), isnan(_4527)), level(0.0)).x;
    float _1241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1243 = _723 + 0.5;
    bool _1245 = _591 > 0.5;
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1249 = _1247 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1253 = _1251 != 0;
    float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1257 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1255;
    float _1259 = -_195;
    int _1261 = _1245 ? as_type<int>(_1259) : as_type<int>(_195);
    float _1263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1265 = _597 > 0.5;
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1269 = _589 + _1267;
    int _1271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1273 = _1271 != 0;
    float _1275 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1279 = _1277 != 0;
    float _1281 = -_895;
    float _1283 = _1281 + 1.0;
    float _1285 = -_195;
    int _1287 = _711 ? as_type<int>(_1285) : as_type<int>(_195);
    float _1289 = 1.0 / _1249;
    float _1291 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1293 = -_889;
    float _1295 = _1293 + 1.0;
    float _1297 = -_809;
    float _1299 = _1297 + 1.0;
    float _1301 = -_901;
    float _1303 = _1301 + 1.0;
    float _1305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1307 = _1263 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1309 = _1257 * _1289;
    bool _1311 = !_1253;
    float _1313 = _1311 ? _195 : as_type<float>(_1261);
    float _1315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1319 = _1317 != 0;
    float _1321 = -_205;
    int _1323 = _683 ? as_type<int>(_1321) : as_type<int>(_205);
    float _1325 = fma(_1309, _1269, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1327 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1329 = isnan(_589);
    bool _1331 = _1327 || _1329;
    bool _1333 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1335 = _1331 || _1333;
    float _1337 = float(_1335);
    float _1339 = _1313 + 0.5;
    bool _1341 = !_1273;
    float _1343 = _1341 ? _205 : as_type<float>(_1323);
    float _1345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1347 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1349 = isnan(_589);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1355 = _1351 || _1353;
    float _1357 = float(_1355);
    float _1359 = -_1337;
    float _1361 = _1359 + 1.0;
    float _1363 = fma(_1291, _1339, _643);
    float _1365 = _1343 + (-0.5);
    float _1367 = _1357 * _1361;
    float _1369 = -_1357;
    float _1371 = _1369 + 1.0;
    float _1373 = -_1307;
    float _1375 = -_645;
    float _1377 = fma(_1373, _1365, _1375);
    float _1379 = -_205;
    int _1381 = _1265 ? as_type<int>(_1379) : as_type<int>(_205);
    float _1383 = _1325 * _1367;
    bool _1385 = !_1319;
    float _1387 = _1385 ? _195 : as_type<float>(_1287);
    float _1389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1391 = !_1279;
    float _1393 = _1391 ? _205 : as_type<float>(_1381);
    float _1395 = _1305 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1397 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1399 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1383);
    float _1401 = _1387 + 0.5;
    float _1403 = _1393 + (-0.5);
    float _1405 = fma(_1337, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1399);
    float _1407 = fma(_1395, _1401, _805);
    float _1409 = -_1397;
    float _1411 = -_849;
    float _1413 = fma(_1409, _1403, _1411);
    float _1415 = -_739;
    float _1417 = _1415 + 0.5;
    float _1419 = _1275 * _1345;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1423 = _1417 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1425 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1427 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1429 = _1421 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1431 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (_1135)
    {
        float _1433 = _1179 * 6.283185482025146484375;
        float _1435 = cos(_1433);
        _1431 = _1435;
    }
    float _1437 = _1431;
    float _1439 = _1423 * _1389;
    float _1441 = _1425 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1443 = _1427 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1445 = _1405 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1447 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_70.x = _1419;
    out.m_70.y = _1439;
    float _1449 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1451 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1453 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_72.x = _1441;
    out.m_72.y = _1443;
    out.m_72.z = _1429;
    out.m_72.w = _1445;
    float _1455 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1457 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1459 = -_1017;
    float _1461 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1453);
    float _1463 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1465 = -_1017;
    float _1467 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1455);
    float _1469 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1471 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1473 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1475 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1477 = -_1017;
    float _1479 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1457);
    float _1481 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1461);
    float _1483 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1467);
    float _1485 = -_1283;
    float _1487 = fma(_1313, _1485, _1363);
    float _1489 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1447);
    float _1491 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1449);
    float _1493 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1469);
    float _1495 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1471);
    float _1497 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1489);
    float _1499 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1491);
    float _1501 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1493);
    float _1503 = _1489;
    float _1505 = _1491;
    float _1507 = _1447;
    float _1509 = _1499;
    if (_1135)
    {
        float _1511 = _1437 + (-1.0);
        _1503 = _1511;
    }
    float _1513 = _1503;
    float _1515 = fma(_1451, _1451, 1.0);
    float _1517 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1473);
    float _1519 = _1513;
    if (_1135)
    {
        float _1521 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1523 = _1215 + _1521;
        _1505 = _1523;
    }
    float _1525 = _1505;
    if (_1135)
    {
        float _1527 = _1513 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1507 = _1527;
    }
    float _1529 = _1507;
    if (_1135)
    {
        float _1531 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1533 = _1211 + _1531;
        _1519 = _1533;
    }
    float _1535 = _1519;
    float _1537 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1475);
    float _1539 = rsqrt(_1515);
    if (_1135)
    {
        float _1541 = fma(_1169, _1437, _1529);
        _1175 = _1541;
    }
    float _1543 = _1175;
    float _1545 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1479);
    if (_1135)
    {
        float _1547 = _1535 * _1535;
        _1153 = _1547;
    }
    float _1549 = _1153;
    if (_1135)
    {
        float _1551 = _1525 * _1525;
        _1155 = _1551;
    }
    float _1553 = _1155;
    float _1555 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1557 = _1543 + _1555;
    float _1559 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1537);
    float _1561 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1495);
    float _1563 = _1451 * _1545;
    float _1565 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1517);
    float _1567 = fma(_1557, _1557, _1549);
    float _1569 = _1451 * _1481;
    float _1571 = fma(_1463, _1559, _1563);
    float _1573 = _1451 * _1483;
    float _1575 = _1567 + _1553;
    float _1577 = fma(_1463, _1561, _1569);
    float _1579 = _1451 * _1539;
    float _1581 = fma(_1463, _1565, _1573);
    float _1583 = fma(_1343, _1295, _1377);
    float _1585 = -_1299;
    float _1587 = fma(_1387, _1585, _1407);
    float _1589 = -_1497;
    float _1591 = _1579 * _1589;
    float _1593 = -_1499;
    float _1595 = _1579 * _1593;
    float _1597 = sqrt(_1575);
    float _1599 = -_1501;
    float _1601 = _1579 * _1599;
    float _1603 = fma(_1539, _1481, _1591);
    float _1605 = fma(_1539, _1483, _1595);
    float _1607 = fma(_1393, _1303, _1413);
    float _1609 = fma(_1539, _1545, _1601);
    float _1611 = _1497 + _1577;
    float _1613 = _1499 + _1581;
    float _1615 = _1501 + _1571;
    out.m_74.x = _1487;
    out.m_74.y = _1583;
    out.m_74.z = _1587;
    out.m_74.w = _1607;
    out.m_76.x = _1561;
    out.m_76.y = _1565;
    out.m_76.z = _1559;
    bool _1617 = _1597 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1619 = isnan(_1597);
    bool _1621 = _1617 || _1619;
    bool _1623 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1625 = _1621 || _1623;
    out.m_78.x = _1603;
    out.m_78.y = _1605;
    out.m_78.z = _1609;
    out.m_80.x = _1611;
    out.m_80.y = _1613;
    out.m_80.z = _1615;
    float _1627 = _1561;
    float _1629 = _1565;
    float _1631 = _1559;
    if (!_1625)
    {
        _1509 = 1.0;
    }
    float _1633 = _1509;
    out.m_82.x = _1233;
    out.m_82.y = _1235;
    out.m_82.z = _1237;
    bool _1635 = !_1625;
    float _1637 = _1633;
    if (!_1635)
    {
        bool _1639 = _1597 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1641 = isnan(_1597);
        bool _1643 = _1639 || _1641;
        bool _1645 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1647 = _1643 || _1645;
        if (!_1647)
        {
            float _1649 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1651 = _1597 + _1649;
            float _1653 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1655 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1653;
            float _1657 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1659 = _1657 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1661 = 1.0 / _1655;
            float _1663 = _1651 * _1661;
            float _1665 = fma(_1663, _1659, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1637 = _1665;
            _1667 = true;
        }
        else
        {
            bool _1669 = _1597 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1671 = isnan(_1597);
            bool _1673 = _1669 || _1671;
            bool _1675 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1677 = _1673 || _1675;
            if (!_1677)
            {
                float _1679 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1681 = _1597 + _1679;
                float _1683 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1685 = _1683 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1687 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1689 = _1687 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1691 = 1.0 / _1685;
                float _1693 = _1681 * _1691;
                float _1695 = fma(_1693, _1689, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1637 = _1695;
                _1667 = true;
            }
            else
            {
                _1637 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1667 = false;
    float _1697 = _1637;
    float _1699 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1701 = _1543 + _1699;
    float _1703 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1705 = _1211 + _1703;
    float _1707 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1709 = _1215 + _1707;
    float _1711 = fma(_1701, _1697, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1713 = fma(_1705, _1697, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1715 = fma(_1709, _1697, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1717 = -_1125;
    float _1719 = _1717 + _1711;
    float _1721 = -_1093;
    float _1723 = _1721 + _1713;
    float _1725 = -_1089;
    float _1727 = _1725 + _1715;
    float _1729 = _1719 * _1719;
    float _1731 = fma(_1723, _1723, _1729);
    float _1733 = fma(_1727, _1727, _1731);
    float _1735 = sqrt(_1733);
    bool _1737 = _1735 > 0.0;
    float _1739 = _1723;
    if (!_1737)
    {
        _1627 = _1713;
    }
    float _1741 = _1627;
    float _1743 = _1741;
    if (!_1737)
    {
        _1629 = _1711;
    }
    float _1745 = _1629;
    float _1747 = _1745;
    float _1749 = _1745;
    if (!_1737)
    {
        _1631 = _1715;
    }
    float _1751 = _1631;
    bool _1753 = !_1737;
    float _1755 = _1751;
    float _1757 = _1751;
    if (!_1753)
    {
        float _1759 = _209 * _209;
        float _1761 = fma(_207, _207, _1759);
        float _1763 = rsqrt(_1733);
        float _1765 = fma(_211, _211, _1761);
        float _1767 = sqrt(_1765);
        float _1769 = _1723 * _1763;
        float _1771 = _1719 * _1763;
        float _1773 = _1727 * _1763;
        bool _1775 = _1767 > 0.0;
        float _1777 = _1767;
        if (!_1775)
        {
            _1777 = _1713;
        }
        float _1779 = _1777;
        _1743 = _1779;
        if (!_1775)
        {
            _1747 = _1711;
        }
        float _1781 = _1747;
        _1749 = _1781;
        if (!_1775)
        {
            _1755 = _1715;
        }
        float _1783 = _1755;
        bool _1785 = !_1775;
        _1757 = _1783;
        if (!_1785)
        {
            float _1787 = rsqrt(_1765);
            float _1789 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1791 = _209 * _1787;
            float _1793 = _207 * _1787;
            float _1795 = _211 * _1787;
            float _1797 = _1771 * _1791;
            float _1799 = fma(_1769, _1793, _1797);
            float _1801 = _1789 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1803 = fma(_1773, _1795, _1799);
            float _1805 = _1803 * _1801;
            float _1807 = fma(_207, _1805, _1713);
            float _1809 = fma(_209, _1805, _1711);
            float _1811 = fma(_211, _1805, _1715);
            _1749 = _1809;
            _1743 = _1807;
            _1757 = _1811;
            _1739 = _1801;
        }
    }
    float _1813 = _1749;
    float _1815 = _1743;
    float _1817 = _1757;
    float _1819 = _1739;
    float _1821 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1823 = _1813 + _1821;
    float _1825 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1827 = _1815 + _1825;
    float _1829 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1831 = _1817 + _1829;
    float _1833 = _1823 * _1823;
    float _1835 = fma(_1827, _1827, _1833);
    float _1837 = fma(_1831, _1831, _1835);
    float _1839 = rsqrt(_1837);
    float _1841 = sqrt(_1837);
    float _1843 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1845 = _1827 * _1843;
    float _1847 = _1831 * _1843;
    float _1849 = _1845 * _1845;
    float _1851 = _1847 * _1847;
    float _1853 = _1849 + _1851;
    float _1855 = sqrt(_1853);
    bool _1857 = _1855 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1861 = _1855 + _1859;
    float _1863 = _1839;
    float _1865 = _1819;
    float _1867 = _1861;
    float _1869 = _1823;
    float _1871 = _1845;
    if (_1857)
    {
        float _1873 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1863 = _1873;
    }
    float _1875 = _1863;
    if (_1857)
    {
        float _1877 = rsqrt(_1853);
        _1865 = _1877;
    }
    float _1879 = _1865;
    float _1881 = _1879;
    if (_1857)
    {
        float _1883 = _1861 * _1875;
        _1867 = _1883;
    }
    float _1885 = _1867;
    if (_1857)
    {
        float _1887 = _1885 * 0.15915493667125701904296875;
        _215 = _1887;
    }
    float _1889 = _215;
    float _1891 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1893 = _1875;
    if (_1857)
    {
        float _1895 = _1889 * 6.283185482025146484375;
        float _1897 = sin(_1895);
        _1893 = _1897;
    }
    float _1899 = _1893;
    float _1901 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1903 = precise::max(0.0, _1901);
    float _1905 = _1831;
    float _1907 = _1903;
    if (_1857)
    {
        float _1909 = _1889 * 6.283185482025146484375;
        float _1911 = cos(_1909);
        _1905 = _1911;
    }
    float _1913 = _1905;
    float _1915 = -_1843;
    float _1917 = -_1903;
    float _1919 = fma(_1823, _1915, _1917);
    if (!_1857)
    {
        _1869 = _1847;
    }
    float _1921 = _1869;
    float _1923 = _1921;
    if (_1857)
    {
        float _1925 = _1919 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1907 = _1925;
    }
    float _1927 = _1907;
    float _1929 = _1899;
    float _1931 = _1927;
    if (_1857)
    {
        float _1933 = fma(_1899, _1927, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _217 = _1933;
    }
    float _1935 = _217;
    float _1937 = _1935;
    if (!_1857)
    {
        _1929 = _1919;
    }
    float _1939 = _1929;
    float _1941 = _1939;
    float _1943 = _1913;
    if (_1857)
    {
        float _1945 = _1913 + (-1.0);
        _1931 = _1945;
    }
    float _1947 = _1931;
    float _1949 = _1947;
    if (_1857)
    {
        float _1951 = _1879 * _1935;
        _1937 = _1951;
    }
    float _1953 = _1937;
    if (_1857)
    {
        float _1955 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1881 = _1955;
    }
    float _1957 = _1881;
    if (_1857)
    {
        float _1959 = _1845 * _1953;
        _1871 = _1959;
    }
    float _1961 = _1871;
    if (!_1857)
    {
        _1949 = _1849;
    }
    float _1963 = _1949;
    float _1965 = _1963;
    if (_1857)
    {
        float _1967 = _1847 * _1953;
        _1923 = _1967;
    }
    float _1969 = _1923;
    if (_1857)
    {
        float _1971 = fma(_1919, _1913, _1957);
        _1941 = _1971;
    }
    float _1973 = _1941;
    if (_1857)
    {
        float _1975 = _1961 * _1961;
        _1965 = _1975;
    }
    float _1977 = _1965;
    if (!_1857)
    {
        _1943 = _1851;
    }
    float _1979 = _1943;
    float _1981 = _1979;
    if (_1857)
    {
        float _1983 = _1969 * _1969;
        _1981 = _1983;
    }
    float _1985 = _1981;
    float _1987 = _1813 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1989 = fma(_1973, _1973, _1977);
    float _1991 = _1813 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1993 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1987);
    float _1995 = _1989 + _1985;
    float _1997 = _1813 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1999 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2001 = fma(_1841, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1999);
    float _2003 = precise::clamp(_2001, 0.0, 1.0);
    float _2005 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1993);
    float _2007 = rsqrt(_1995);
    float _2009 = _1813 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2011 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1997);
    float _2013 = -_2003;
    float _2015 = _2013 + 1.0;
    float _2017 = _2005 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2019 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2009);
    float _2021 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2011);
    float _2023 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1991);
    float _2025 = _2017 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2027 = abs(_2015);
    float _2029 = log2(_2027);
    float _2031 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2019);
    float _2033 = _2021 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2035 = -_2025;
    float _2037 = fma(_2035, _1891, 1.0);
    float _2039 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2023);
    float _2041 = _2031 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2043 = _2007 * _1961;
    float _2045 = _2033 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2047 = _2007 * _1973;
    float _2049 = _2007 * _1969;
    float _2051 = _2043 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2053 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2045);
    float _2055 = _2039 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2057 = log2(_2037);
    float _2059 = -_2051;
    float _2061 = fma(_2047, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2059);
    float _2063 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2053);
    float _2065 = _2029 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2067 = _2033 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2069 = -_2049;
    float _2071 = fma(_2069, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2061);
    float _2073 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2063);
    float _2075 = _2033 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2077 = exp2(_2065);
    float _2079 = fma(_2071, -0.5, 0.5);
    float _2081 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2067);
    float _2083 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2075);
    float _2085 = fma(_2071, 0.5, 0.5);
    float _2087 = _2047 + 1.0;
    float _2089 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2081);
    float _2091 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2083);
    float _2093 = 1.0 / _2073;
    float _2095 = fma(_2085, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2097 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2089);
    float _2099 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2091);
    float _2101 = _2057 * 0.693147182464599609375;
    float _2103 = fma(_2085, _2095, -0.212114393711090087890625);
    float _2105 = sqrt(_2079);
    float _2107 = -_2047;
    float _2109 = fma(_2077, _2087, _2107);
    float _2111 = fma(_2085, _2103, 1.570728778839111328125);
    float _2113 = _2101 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2115 = fma(_2109, 0.5, 0.5);
    float _2117 = _2099 * _2093;
    float _2119 = _2097 * _2093;
    float _2121 = fma(_2117, 0.5, 0.5);
    float _2123 = fma(_2119, -0.5, 0.5);
    float _2125 = _2105 * 0.636619746685028076171875;
    float3 _6061 = float3(_2121, _2123, _2113);
    float _2127 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6061, float3(0.0), isnan(_6061)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6061, float3(0.0), isnan(_6061)), level(0.0)).x;
    float3 _6072 = float3(_2121, _2123, _2113);
    float4 _2130 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6072, float3(0.0), isnan(_6072)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6072, float3(0.0), isnan(_6072)), level(0.0)).xyzw;
    float _2132 = _2130.x;
    float _2134 = _2130.y;
    float _2136 = _2130.z;
    float _2138 = _2130.w;
    float _2140 = -_2111;
    float _2142 = fma(_2125, _2140, 1.0);
    float2 _6093 = float2(_2142, _2115);
    float3 _2144 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6093, float2(0.0), isnan(_6093)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6093, float2(0.0), isnan(_6093)), level(0.0)).xyz;
    float _2146 = _2144.x;
    float _2148 = _2144.y;
    float _2150 = _2144.z;
    float _2152 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2154 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2156 = _2033 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2158 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2152);
    float _2160 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2154);
    float _2162 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2156);
    float _2164 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2158);
    float _2166 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2160);
    float _2168 = -_1239;
    float _2170 = _2168 + 1.0;
    float _2172 = _2164 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2174 = _2166 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2176 = 1.0 / _2172;
    float _2178 = _2174 + _2172;
    bool _2180 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2182 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2184 = _2180 || _2182;
    bool _2186 = isnan(0.5);
    bool _2188 = _2184 || _2186;
    float _2190 = in.m_84.x;
    float _2192 = _2178 * _2176;
    float _2194 = _2192 * 0.5;
    float _2196 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2198 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2196);
    float _2200 = 1.0 / _2198;
    float _2202 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2204 = _2200 * _2202;
    float _2206 = abs(_2204);
    float _2208 = log2(_2206);
    bool _2210 = _2204 <= 8000.0;
    bool _2212 = isnan(_2204);
    bool _2214 = _2210 || _2212;
    bool _2216 = isnan(8000.0);
    bool _2218 = _2214 || _2216;
    float _2220 = float(_2218);
    float _2222 = _2204;
    float _2224 = _2055;
    float _2226 = _2073;
    float _2228 = _2097;
    float _2230 = _2138;
    float _2232 = _2136;
    if (!_2188)
    {
        float _2234 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2236 = _2204 + _2234;
        _2222 = _2236;
    }
    float _2238 = _2222;
    float _2240 = _2208 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2242 = exp2(_2240);
    float _2244 = fma(_2242, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2246 = precise::clamp(_2244, 0.0, 1.0);
    float _2248 = _2242;
    if (!_2188)
    {
        _2248 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2250 = _2248;
    float _2252 = fma(_2246, -2.0, 3.0);
    float _2254 = _2246 * _2246;
    float _2256 = _2250;
    if (!_2188)
    {
        float _2258 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2260 = _2250 + _2258;
        _2256 = _2260;
    }
    float _2262 = _2256;
    float _2264 = _2254 * _2252;
    float _2266 = 2.0;
    if (!_2188)
    {
        float _2268 = 1.0 / _2262;
        _2266 = _2268;
    }
    float _2270 = _2266;
    float _2272 = -_2264;
    float _2274 = _2272 + 1.0;
    float _2276 = fma(_2274, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2264);
    float _2278 = _2029 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2280 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2162);
    float _2282 = _2220 * _2276;
    float _2284 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2280);
    float _2286 = exp2(_2278);
    float _2288 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2290 = _2284;
    float _2292 = _2099;
    if (_2188)
    {
        _2224 = 1.0;
    }
    float _2294 = _2224;
    float _2296 = _2294;
    if (!_2188)
    {
        float _2298 = _2238 * _2270;
        float _2300 = precise::clamp(_2298, 0.0, 1.0);
        _2296 = _2300;
    }
    float _2302 = _2296;
    bool _2304 = _1841 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2306 = isnan(_1841);
    bool _2308 = _2304 || _2306;
    bool _2310 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2312 = _2308 || _2310;
    float _2314 = _2170 * _2288;
    float _2316 = precise::clamp(_2314, 0.0, 1.0);
    out.gl_Position.x = _2099;
    out.gl_Position.y = _2097;
    out.gl_Position.z = _2284;
    out.gl_Position.w = _2073;
    float _2318 = -_2316;
    float _2320 = fma(_2318, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2322 = _2284 + _2073;
    float _2324 = _2320 * _2190;
    float _2326 = _2322 * 0.5;
    float _2328 = -_2286;
    float _2330 = _2328 + 1.0;
    float _2332 = _2324 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2334 = _2330 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_86.z = _2326;
    out.m_86.w = _2073;
    if (!_2312)
    {
        _2226 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2336 = _2226;
    float _2338 = _2336;
    float _2340 = _2336;
    if (!_2312)
    {
        _2290 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2342 = _2290;
    out.m_88.x = _2332;
    float _2344 = _2342;
    float _2346 = _2342;
    if (!_2312)
    {
        _2228 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2348 = _2228;
    float _2350 = _2348;
    float _2352 = _2348;
    if (!_2312)
    {
        _2292 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2354 = _2292;
    float _2356 = _2302 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2358 = _2334 * _2127;
    float _2360 = -_2334;
    float _2362 = _2360 + 1.0;
    float _2364 = _2138 * _2358;
    float _2366 = _2150 * _2358;
    float _2368 = fma(_2146, _2364, _2132);
    float _2370 = fma(_2148, _2364, _2134);
    float _2372 = _2138 * _2362;
    float _2374 = fma(_2138, _2366, _2136);
    float _2376 = _2354;
    float _2378 = _2354;
    if (!_2312)
    {
        _2230 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2380 = _2230;
    float _2382 = _2380;
    float _2384 = _2380;
    if (!_2312)
    {
        _2232 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2386 = _2232;
    out.m_90.x = _2368;
    out.m_90.y = _2370;
    out.m_90.z = _2374;
    out.m_90.w = _2372;
    bool _2388 = !_2312;
    float _2390 = _2386;
    float _2392 = _2386;
    if (!_2388)
    {
        bool _2394 = _1841 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2396 = isnan(_1841);
        bool _2398 = _2394 || _2396;
        bool _2400 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2402 = _2398 || _2400;
        if (!_2402)
        {
            float _2404 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2406 = _1841 + _2404;
            float _2408 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2410 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2408;
            float _2412 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2414 = _2412 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2416 = 1.0 / _2410;
            float _2418 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2420 = _2418 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2422 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2424 = _2422 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2428 = _2426 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2430 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2432 = _2430 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2434 = _2406 * _2416;
            float _2436 = precise::clamp(_2434, 0.0, 1.0);
            float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2440 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2442 = fma(_2436, _2414, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2444 = fma(_2436, _2440, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2446 = fma(_2436, _2420, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2448 = fma(_2436, _2424, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2450 = fma(_2436, _2428, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2452 = fma(_2436, _2432, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2392 = _2446;
            _2352 = _2450;
            _2384 = _2442;
            _2346 = _2448;
            _2340 = _2444;
            _2378 = _2452;
            _2454 = true;
        }
        else
        {
            bool _2456 = _1841 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2458 = isnan(_1841);
            bool _2460 = _2456 || _2458;
            bool _2462 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2464 = _2460 || _2462;
            if (!_2464)
            {
                _2382 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2466 = _2382;
            _2384 = _2466;
            if (!_2464)
            {
                _2390 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2468 = _2390;
            _2392 = _2468;
            if (!_2464)
            {
                _2338 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2470 = _2338;
            _2340 = _2470;
            if (!_2464)
            {
                _2344 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2472 = _2344;
            _2346 = _2472;
            if (!_2464)
            {
                _2350 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2474 = _2350;
            _2352 = _2474;
            if (!_2464)
            {
                _2376 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2476 = _2376;
            bool _2478 = !_2464;
            _2378 = _2476;
            if (!_2478)
            {
                bool _2480 = _1841 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2482 = isnan(_1841);
                bool _2484 = _2480 || _2482;
                bool _2486 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2488 = _2484 || _2486;
                if (!_2488)
                {
                    float _2490 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2492 = _1841 + _2490;
                    float _2494 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2496 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2494;
                    float _2498 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2500 = _2498 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2502 = 1.0 / _2496;
                    float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2506 = _2504 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2510 = _2508 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2512 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2514 = _2512 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2518 = _2516 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2520 = _2492 * _2502;
                    float _2522 = precise::clamp(_2520, 0.0, 1.0);
                    float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2528 = fma(_2522, _2500, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2530 = fma(_2522, _2526, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2532 = fma(_2522, _2506, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2534 = fma(_2522, _2510, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2536 = fma(_2522, _2514, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2538 = fma(_2522, _2518, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2392 = _2532;
                    _2352 = _2536;
                    _2384 = _2528;
                    _2346 = _2534;
                    _2340 = _2530;
                    _2378 = _2538;
                    _2454 = true;
                }
                else
                {
                    _2392 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2352 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2384 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2346 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2340 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2378 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2454 = false;
    float _2540 = _2392;
    float _2542 = _2352;
    float _2544 = _2384;
    float _2546 = _2346;
    float _2548 = _2340;
    float _2550 = _2378;
    float _2552 = _2356 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2554 = fma(_1613, -0.5, 0.5);
    float _2556 = precise::clamp(_2554, 0.0, 1.0);
    float _2558 = -_2540;
    float _2560 = _2558 + _2542;
    float _2562 = -_2544;
    float _2564 = _2562 + _2546;
    out.m_53.x = _2552;
    float _2566 = fma(_2556, _2560, _2540);
    float _2568 = -_2548;
    float _2570 = _2568 + _2550;
    float _2572 = fma(_2556, _2564, _2544);
    float _2574 = _2566 * 0.586610972881317138671875;
    bool _2576 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2578 = fma(_2556, _2570, _2548);
    out.m_92.x = 0.0;
    float _2580 = fma(_2572, 0.298911988735198974609375, _2574);
    bool _2582 = _2302 > 0.0;
    bool _2584 = isnan(_2302);
    bool _2586 = _2582 || _2584;
    bool _2588 = isnan(0.0);
    bool _2590 = _2586 || _2588;
    float _2592 = fma(_2578, 0.114477999508380889892578125, _2580);
    float _2594 = -_2592;
    float _2596 = _2572 + _2594;
    float _2598 = -_2592;
    float _2600 = _2566 + _2598;
    float _2602 = -_2592;
    float _2604 = _2578 + _2602;
    float _2606 = fma(_2596, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2592);
    float _2608 = fma(_2600, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2592);
    float _2610 = fma(_2604, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2592);
    bool _2612 = !_2576;
    if (!_2612)
    {
        float _2614 = -_1813;
        float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2618 = -_1815;
        float _2620 = _2618 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2622 = -_1817;
        float _2624 = _2622 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2626 = _2616 * _2616;
        float _2628 = fma(_2620, _2620, _2626);
        float _2630 = fma(_2624, _2624, _2628);
        float _2632 = sqrt(_2630);
        float _2634 = rsqrt(_2630);
        float _2636 = -_2632;
        float _2638 = _2636 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2640 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2642 = precise::clamp(_2640, 0.0, 1.0);
        float _2644 = _2620 * _2634;
        float _2646 = _2616 * _2634;
        float _2648 = abs(_2642);
        float _2650 = log2(_2648);
        float _2652 = _2624 * _2634;
        float _2654 = _2644 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2656 = _1613 * _2646;
        float _2658 = -_2646;
        float _2660 = -_2654;
        float _2662 = fma(_2658, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2660);
        float _2664 = fma(_1611, _2644, _2656);
        float _2666 = -_2652;
        float _2668 = fma(_2666, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2662);
        float _2670 = fma(_1615, _2652, _2664);
        float _2672 = precise::clamp(_2670, 0.0, 1.0);
        float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2676 = _2668 + _2674;
        float _2678 = _2650 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2680 = _2676 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2682 = precise::clamp(_2680, 0.0, 1.0);
        float _2684 = exp2(_2678);
        float _2686 = _2684 * _2682;
        float _2688 = _2672 * _2686;
        float _2690 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2692 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2694 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2690;
        out.m_92.y = _2692;
        out.m_92.z = _2694;
    }
    out.m_94.x = _2606;
    out.m_94.y = _2608;
    out.m_94.z = _2610;
    if (_2590)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2696 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2696;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2454 = false;
    bool _1667 = false;
    bool _581 = false;
    bool _431 = false;
    bool _237 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_50.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_53.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2753 = as_type<float>(_129);
        out.gl_Position.z = _2753;
    }
    if (!_117)
    {
        return out;
    }
    float _133 = in.m_55.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_113);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _123;
    if (_161)
    {
        out.m_53.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2822 = as_type<float>(_167);
        out.gl_Position.z = _2822;
    }
    if (_161)
    {
        return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = in.m_60.x;
    float _173 = in.m_60.y;
    float _175 = in.m_60.z;
    int _177 = as_type<int>(_169) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_169) & 2;
    bool _183 = _181 != 0;
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _187 = _173 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _189 = _173 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _191 = _173 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _193 = !_179;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].x, _187);
    float _199 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].x, _189);
    float _201 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].x, _191);
    bool _203 = !_183;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].z, _197);
    float _209 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].z, _199);
    float _211 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].z, _201);
    bool _213 = !_185;
    float _215 = _209;
    float _217 = _211;
    float _235;
    if (!_213)
    {
        float _219 = in.m_62.x;
        float _221 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _223 = _219 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _227 = _225 * _221;
        float _229 = floor(_227);
        float _231 = -_229;
        float _233 = _227 + _231;
        _235 = _233;
        _237 = true;
    }
    else
    {
        float _239 = float(_113);
        float _241 = 1.0 / _239;
        float _243 = _147 * _241;
        _235 = _243;
    }
    _237 = false;
    float _245 = _235;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = _245 + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = _245 + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _257 = _245 + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _265 = _263 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _267;
    float _271 = 1.0 / _261;
    bool _273 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _275 = 1.0 / _269;
    bool _277 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _279 = isnan(_245);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = 1.0 / _265;
    float _291 = _249 * _271;
    bool _293 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _295 = isnan(_245);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = _253 * _275;
    bool _307 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _309 = isnan(_245);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -_287;
    float _321 = _319 + 1.0;
    float _323 = _317 * _321;
    float _325 = -_317;
    float _327 = _325 + 1.0;
    float _329 = _257 * _289;
    float _331 = -_303;
    float _333 = _331 + 1.0;
    bool _335 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _337 = isnan(_245);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _355 = _287 * _333;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _365 = fma(_349, _291, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _367 = _345 * _327;
    float _369 = fma(_359, _291, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _371 = fma(_353, _329, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _373 = fma(_363, _329, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _375 = -_345;
    float _377 = _375 + 1.0;
    float _379 = _365 * _367;
    float _381 = _369 * _367;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _383;
    float _387 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].x, _379);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _389;
    float _393 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].y, _381);
    float _395 = fma(_385, _305, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _397 = fma(_371, _323, _387);
    float _399 = fma(_391, _305, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _401 = fma(_373, _323, _393);
    float _403 = fma(_395, _355, _397);
    float _405 = fma(_399, _355, _401);
    float _407 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[146].x, _403);
    float _409 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[146].y, _405);
    bool _411 = !_273;
    float _429;
    if (!_411)
    {
        float _413 = in.m_62.x;
        float _415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _417 = _413 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _419 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _421 = _419 * _415;
        float _423 = floor(_421);
        float _425 = -_423;
        float _427 = _421 + _425;
        _429 = _427;
        _431 = true;
    }
    else
    {
        float _433 = float(_113);
        float _435 = 1.0 / _433;
        float _437 = _147 * _435;
        _429 = _437;
    }
    _431 = false;
    float _439 = _429;
    float _441 = in.m_64.x;
    float _443 = in.m_64.y;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _449 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _451 = isnan(_439);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _465 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _467 = isnan(_439);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = 1.0 / _447;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _479;
    float _483 = -_459;
    float _485 = _483 + 1.0;
    bool _487 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _489 = isnan(_439);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    bool _499 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _501 = 1.0 / _463;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _507 = _481 * _477;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _511 = _439 + _509;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _515 = _439 + _513;
    float _517 = _407 * _441;
    float _519 = fma(_507, _511, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _521 = _475 * _485;
    float _523 = -_475;
    float _525 = _523 + 1.0;
    float _527 = _505 * _501;
    float _529 = -_497;
    float _531 = _529 + 1.0;
    float _533 = _519 * _521;
    float _535 = fma(_527, _515, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _537 = _459 * _531;
    float _539 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[115].x, _533);
    float _541 = _409 * _443;
    float _543 = fma(_535, _537, _539);
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _549 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[117].x, _543);
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _553 = _545 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _555 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _557 = _549 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _559 = _551 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _553;
    out.m_66.y = _555;
    out.m_66.z = _559;
    out.m_66.w = _557;
    bool _561 = !_499;
    float _579;
    if (!_561)
    {
        float _563 = in.m_62.x;
        float _565 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _567 = _563 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _569 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[11].w, _147);
        float _571 = _569 * _565;
        float _573 = floor(_571);
        float _575 = -_573;
        float _577 = _571 + _575;
        _579 = _577;
        _581 = true;
    }
    else
    {
        float _583 = float(_113);
        float _585 = 1.0 / _583;
        float _587 = _147 * _585;
        _579 = _587;
    }
    _581 = false;
    float _589 = _579;
    float _591 = in.m_62.x;
    float _593 = in.m_62.y;
    float _595 = in.m_62.z;
    float _597 = in.m_62.w;
    float _599 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _601 = log2(_599);
    float _603 = _517 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _607 = _605 != 0;
    float _609 = _541 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _615 = _601 * _147;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _621 = _595 * 2.0;
    float _623 = _591 * 2.0;
    float _625 = _591 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _627 = _593 * 2.0;
    float _629 = _593 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _633 = floor(_621);
    float _635 = -_611;
    float _637 = fma(_625, 2.0, _635);
    float _639 = fma(_629, -2.0, _613);
    float _641 = -_147;
    float _643 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[76].x, _637);
    float _645 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _639);
    float _647 = floor(_623);
    bool _649 = _633 > 0.0;
    float _651 = floor(_627);
    bool _653 = _633 >= 0.0;
    bool _655 = isnan(_633);
    bool _657 = _653 || _655;
    bool _659 = isnan(0.0);
    bool _661 = _657 || _659;
    float _663 = _593 + _591;
    float _665 = _661 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _667 = _663 + (-1.0);
    bool _669 = _647 > 0.0;
    bool _671 = _647 >= 0.0;
    bool _673 = isnan(_647);
    bool _675 = _671 || _673;
    bool _677 = isnan(0.0);
    bool _679 = _675 || _677;
    float _681 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _683 = _593 > 0.5;
    int _685 = ~as_type<int>(_665);
    int _687 = _685 + 1;
    int _689 = _687 + 1;
    int _691 = _689;
    float _693 = _647;
    float _695 = _665;
    if (!_649)
    {
        int _697 = ~as_type<int>(_665);
        int _699 = _697 + 1;
        _691 = _699;
    }
    int _701 = _691;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _705 = _703 != 0;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _709 = _707 != 0;
    bool _711 = _595 > 0.5;
    float _713 = -_195;
    float _715 = _683 ? _713 : _195;
    float _717 = -_205;
    int _719 = _711 ? as_type<int>(_717) : as_type<int>(_205);
    bool _721 = !_705;
    float _723 = _721 ? _195 : _715;
    float _725 = _715;
    if (!_607)
    {
        _693 = _593;
    }
    float _727 = _693;
    float _729 = _727;
    if (!_607)
    {
        _695 = _595;
    }
    float _731 = _695;
    float _733 = _731;
    if (!_607)
    {
        _725 = _595;
    }
    float _735 = _725;
    bool _737 = !_709;
    float _739 = _737 ? _205 : as_type<float>(_719);
    float _741 = _735;
    if (_607)
    {
        _729 = _591;
    }
    float _743 = _729;
    if (_607)
    {
        _733 = _593;
    }
    float _745 = _733;
    if (_607)
    {
        _741 = _593;
    }
    float _747 = _741;
    float _749 = _743 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _753 = _751 != 0;
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _757 = _755 != 0;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _761 = _759 != 0;
    float _763 = _745 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _765 = _679 ? 0 : 1;
    float _767 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[83].w, _619);
    bool _769 = _651 > 0.0;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _773 = !_753;
    int _775 = _773 ? 0 : 1;
    float _777 = -_631;
    float _779 = fma(_749, 2.0, _777);
    bool _781 = _651 >= 0.0;
    bool _783 = isnan(_651);
    bool _785 = _781 || _783;
    bool _787 = isnan(0.0);
    bool _789 = _785 || _787;
    float _791 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[83].z, _617);
    int _793 = abs(_775);
    float _795 = exp2(_615);
    float _797 = float(_701);
    float _799 = fma(_763, -2.0, _771);
    float _801 = float(_793);
    float _803 = -_147;
    float _805 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[81].x, _779);
    int _807 = _789 ? 0 : 1;
    float _809 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _791);
    int _811 = ~_765;
    int _813 = _811 + 1;
    int _815 = _813 + 1;
    float _817 = _801 * _797;
    int _819 = ~_807;
    int _821 = _819 + 1;
    int _823 = _821 + 1;
    float _825 = in.m_68.x;
    float _827 = in.m_68.y;
    float _829 = in.m_68.z;
    int _831 = _815;
    int _833 = _823;
    if (!_669)
    {
        int _835 = ~_765;
        int _837 = _835 + 1;
        _831 = _837;
    }
    int _839 = _831;
    float _841 = _591 + (-0.5);
    if (!_769)
    {
        int _843 = ~_807;
        int _845 = _843 + 1;
        _833 = _845;
    }
    int _847 = _833;
    float _849 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _799);
    bool _851 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _853 = isnan(1.0);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _859 = _855 || _857;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _865 = 1.0 + _863;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _869 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _871 = isnan(0.0);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _877 = _873 || _875;
    float _879 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[78].w, _861);
    float _881 = 1.0 / _865;
    float _883 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[78].z, _867);
    float _885 = -_795;
    float _887 = _885 + 1.0;
    float _889 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _879);
    bool _891 = !_757;
    int _893 = _891 ? 0 : 1;
    float _895 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _883);
    float _897 = float(_839);
    float _899 = _877 ? _887 : 0.0;
    float _901 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _767);
    float _903 = _817 * (-2.0);
    int _905 = abs(_893);
    bool _907 = !_761;
    int _909 = _907 ? 0 : 1;
    float _911 = fma(_903, _825, _825);
    float _913 = float(_905);
    if (_859)
    {
        float _915 = _899 * _881;
        _151 = _915;
    }
    float _917 = _151;
    float _919 = fma(_681, _903, _681);
    float _921 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[196].x, _911);
    int _923 = abs(_909);
    float _925 = _913 * _897;
    float _927 = _593 + _595;
    float _929 = fma(_919, _917, _921);
    float _931 = _593 + (-0.5);
    float _933 = float(_847);
    float _935 = _927 + (-1.0);
    float _937 = float(_923);
    float _939 = _925 * (-2.0);
    float _941 = _929 * 0.15915493667125701904296875;
    float _943 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _945 = _595 + _591;
    float _947 = fma(_939, _827, _827);
    float _949 = _937 * _933;
    float _951 = fma(_943, _939, _943);
    float _953 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[196].y, _947);
    float _955 = _945 + (-1.0);
    float _957 = _949 * (-2.0);
    float _959 = _595 + (-0.5);
    float _961 = fma(_951, _917, _953);
    float _963 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _965 = fma(_957, _829, _829);
    float _967 = _941 * 6.283185482025146484375;
    float _969 = cos(_967);
    float _971 = _961 * 0.15915493667125701904296875;
    float _973 = fma(_963, _957, _963);
    float _975 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[196].z, _965);
    float _977 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _979 = fma(_973, _917, _975);
    float _981 = _971 * 6.283185482025146484375;
    float _983 = sin(_981);
    float _985 = _603 * _977;
    float _987 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _989 = _979 * 0.15915493667125701904296875;
    float _991 = in.m_50.x;
    float _993 = in.m_50.y;
    float _995 = in.m_50.z;
    float _997 = _609 * _987;
    float _999 = _971 * 6.283185482025146484375;
    float _1001 = cos(_999);
    float _1003 = _941 * 6.283185482025146484375;
    float _1005 = sin(_1003);
    float _1007 = _969 * _983;
    float _1009 = _989 * 6.283185482025146484375;
    float _1011 = cos(_1009);
    float _1013 = _969 * _1001;
    float _1015 = _989 * 6.283185482025146484375;
    float _1017 = sin(_1015);
    float _1019 = _1005 * _983;
    float _1021 = _1005 * _1001;
    float _1023 = _969 * _1011;
    float _1025 = _1005 * _1011;
    float _1027 = _1001 * _1011;
    float _1029 = _983 * _1011;
    float _1031 = _1023 * _997;
    float _1033 = _1025 * _997;
    float _1035 = fma(_1017, _1013, _1019);
    float _1037 = -_1007;
    float _1039 = fma(_1017, _1021, _1037);
    float _1041 = fma(_1017, _1019, _1013);
    float _1043 = -_1021;
    float _1045 = fma(_1017, _1007, _1043);
    float _1047 = -_997;
    float _1049 = _1017 * _1047;
    float _1051 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1053 = fma(_1035, _985, _1031);
    float _1055 = fma(_1027, _985, _1049);
    float _1057 = fma(_1039, _985, _1033);
    float _1059 = fma(_1045, _1051, _1053);
    float _1061 = _993 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1063 = fma(_1029, _1051, _1055);
    float _1065 = fma(_1041, _1051, _1057);
    float _1067 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1069 = _993 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1071 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1073 = fma(_991, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1061);
    float _1075 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1067);
    float _1077 = fma(_991, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1069);
    float _1079 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1071);
    float _1081 = fma(_995, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1073);
    float _1083 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1075);
    float _1085 = fma(_995, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1077);
    float _1087 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1079);
    float _1089 = _1081 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1091 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1093 = _1085 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1095 = _1087 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1097 = _993 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1099 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1101 = _1093 + _1091;
    float _1103 = _1089 + _1095;
    float _1105 = fma(_991, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1097);
    float _1107 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1099);
    float _1109 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1111 = _1101 + _1109;
    float _1113 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1115 = _1103 + _1113;
    float _1117 = fma(_995, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1105);
    float _1119 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1107);
    float _1121 = _1111 * _1111;
    float _1123 = _1115 * _1115;
    float _1125 = _1117 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1127 = _1119 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1129 = _1121 + _1123;
    float _1131 = sqrt(_1129);
    float _1133 = fma(_1093, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    bool _1135 = _1131 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1137 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1139 = _1131 + _1137;
    float _1141 = 0.0;
    float _1143 = _1129;
    float _1145 = _1131;
    float _1147 = _1117;
    float _1149 = _1101;
    float _1151 = _1103;
    float _1153 = _1121;
    float _1155 = _1123;
    if (_1135)
    {
        float _1157 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1141 = _1157;
    }
    float _1159 = _1141;
    if (_1135)
    {
        float _1161 = rsqrt(_1129);
        _1143 = _1161;
    }
    float _1163 = _1143;
    if (_1135)
    {
        float _1165 = _1139 * _1159;
        _1145 = _1165;
    }
    float _1167 = _1145;
    float _1169 = _1125 + _1127;
    float _1171 = floor(_1133);
    float _1173 = _1167;
    float _1175 = _1169;
    if (_1135)
    {
        float _1177 = _1167 * 0.15915493667125701904296875;
        _1173 = _1177;
    }
    float _1179 = _1173;
    if (_1135)
    {
        float _1181 = _1169 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1147 = _1181;
    }
    float _1183 = _1147;
    float _1185 = fma(_1089, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1187 = _991;
    float _1189 = _1183;
    if (_1135)
    {
        float _1191 = _1179 * 6.283185482025146484375;
        float _1193 = sin(_1191);
        _1187 = _1193;
    }
    float _1195 = _1187;
    float _1197 = floor(_1185);
    if (_1135)
    {
        float _1199 = fma(_1195, _1183, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1189 = _1199;
    }
    float _1201 = _1189;
    float _1203 = _1201;
    if (_1135)
    {
        float _1205 = _1163 * _1201;
        _1203 = _1205;
    }
    float _1207 = _1203;
    if (_1135)
    {
        float _1209 = fma(_1111, _1207, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1149 = _1209;
    }
    float _1211 = _1149;
    if (_1135)
    {
        float _1213 = fma(_1115, _1207, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1151 = _1213;
    }
    float _1215 = _1151;
    float _1217 = -_1171;
    float _1219 = _1133 + _1217;
    float _1221 = -_1197;
    float _1223 = _1185 + _1221;
    float _1225 = fma(_1211, 6.2500002968590706586837768554688e-05, 0.5);
    float _1227 = fma(_1215, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4511 = float2(_1225, _1227);
    float3 _1231 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4511, float2(0.0), isnan(_4511)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4511, float2(0.0), isnan(_4511)), level(0.0)).xyz;
    float _1233 = _1231.x;
    float _1235 = _1231.y;
    float _1237 = _1231.z;
    float2 _4527 = float2(_1219, _1223);
    float _1239 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4527, float2(0.0), isnan(_4527)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4527, float2(0.0), isnan(_4527)), level(0.0)).x;
    float _1241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1243 = _723 + 0.5;
    bool _1245 = _591 > 0.5;
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1249 = _1247 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1253 = _1251 != 0;
    float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1257 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1255;
    float _1259 = -_195;
    int _1261 = _1245 ? as_type<int>(_1259) : as_type<int>(_195);
    float _1263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1265 = _597 > 0.5;
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1269 = _589 + _1267;
    int _1271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1273 = _1271 != 0;
    float _1275 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1279 = _1277 != 0;
    float _1281 = -_895;
    float _1283 = _1281 + 1.0;
    float _1285 = -_195;
    int _1287 = _711 ? as_type<int>(_1285) : as_type<int>(_195);
    float _1289 = 1.0 / _1249;
    float _1291 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1293 = -_889;
    float _1295 = _1293 + 1.0;
    float _1297 = -_809;
    float _1299 = _1297 + 1.0;
    float _1301 = -_901;
    float _1303 = _1301 + 1.0;
    float _1305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1307 = _1263 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1309 = _1257 * _1289;
    bool _1311 = !_1253;
    float _1313 = _1311 ? _195 : as_type<float>(_1261);
    float _1315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1319 = _1317 != 0;
    float _1321 = -_205;
    int _1323 = _683 ? as_type<int>(_1321) : as_type<int>(_205);
    float _1325 = fma(_1309, _1269, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1327 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1329 = isnan(_589);
    bool _1331 = _1327 || _1329;
    bool _1333 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1335 = _1331 || _1333;
    float _1337 = float(_1335);
    float _1339 = _1313 + 0.5;
    bool _1341 = !_1273;
    float _1343 = _1341 ? _205 : as_type<float>(_1323);
    float _1345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1347 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1349 = isnan(_589);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1355 = _1351 || _1353;
    float _1357 = float(_1355);
    float _1359 = -_1337;
    float _1361 = _1359 + 1.0;
    float _1363 = fma(_1291, _1339, _643);
    float _1365 = _1343 + (-0.5);
    float _1367 = _1357 * _1361;
    float _1369 = -_1357;
    float _1371 = _1369 + 1.0;
    float _1373 = -_1307;
    float _1375 = -_645;
    float _1377 = fma(_1373, _1365, _1375);
    float _1379 = -_205;
    int _1381 = _1265 ? as_type<int>(_1379) : as_type<int>(_205);
    float _1383 = _1325 * _1367;
    bool _1385 = !_1319;
    float _1387 = _1385 ? _195 : as_type<float>(_1287);
    float _1389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1391 = !_1279;
    float _1393 = _1391 ? _205 : as_type<float>(_1381);
    float _1395 = _1305 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1397 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1399 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1383);
    float _1401 = _1387 + 0.5;
    float _1403 = _1393 + (-0.5);
    float _1405 = fma(_1337, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1399);
    float _1407 = fma(_1395, _1401, _805);
    float _1409 = -_1397;
    float _1411 = -_849;
    float _1413 = fma(_1409, _1403, _1411);
    float _1415 = -_739;
    float _1417 = _1415 + 0.5;
    float _1419 = _1275 * _1345;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1423 = _1417 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1425 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1427 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1429 = _1421 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1431 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (_1135)
    {
        float _1433 = _1179 * 6.283185482025146484375;
        float _1435 = cos(_1433);
        _1431 = _1435;
    }
    float _1437 = _1431;
    float _1439 = _1423 * _1389;
    float _1441 = _1425 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1443 = _1427 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1445 = _1405 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1447 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_70.x = _1419;
    out.m_70.y = _1439;
    float _1449 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1451 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1453 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_72.x = _1441;
    out.m_72.y = _1443;
    out.m_72.z = _1429;
    out.m_72.w = _1445;
    float _1455 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1457 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1459 = -_1017;
    float _1461 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1453);
    float _1463 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1465 = -_1017;
    float _1467 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1455);
    float _1469 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1471 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1473 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1475 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1477 = -_1017;
    float _1479 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1457);
    float _1481 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1461);
    float _1483 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1467);
    float _1485 = -_1283;
    float _1487 = fma(_1313, _1485, _1363);
    float _1489 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1447);
    float _1491 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1449);
    float _1493 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1469);
    float _1495 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1471);
    float _1497 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1489);
    float _1499 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1491);
    float _1501 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1493);
    float _1503 = _1489;
    float _1505 = _1491;
    float _1507 = _1447;
    float _1509 = _1499;
    if (_1135)
    {
        float _1511 = _1437 + (-1.0);
        _1503 = _1511;
    }
    float _1513 = _1503;
    float _1515 = fma(_1451, _1451, 1.0);
    float _1517 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1473);
    float _1519 = _1513;
    if (_1135)
    {
        float _1521 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1523 = _1215 + _1521;
        _1505 = _1523;
    }
    float _1525 = _1505;
    if (_1135)
    {
        float _1527 = _1513 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1507 = _1527;
    }
    float _1529 = _1507;
    if (_1135)
    {
        float _1531 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1533 = _1211 + _1531;
        _1519 = _1533;
    }
    float _1535 = _1519;
    float _1537 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1475);
    float _1539 = rsqrt(_1515);
    if (_1135)
    {
        float _1541 = fma(_1169, _1437, _1529);
        _1175 = _1541;
    }
    float _1543 = _1175;
    float _1545 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1479);
    if (_1135)
    {
        float _1547 = _1535 * _1535;
        _1153 = _1547;
    }
    float _1549 = _1153;
    if (_1135)
    {
        float _1551 = _1525 * _1525;
        _1155 = _1551;
    }
    float _1553 = _1155;
    float _1555 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1557 = _1543 + _1555;
    float _1559 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1537);
    float _1561 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1495);
    float _1563 = _1451 * _1545;
    float _1565 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1517);
    float _1567 = fma(_1557, _1557, _1549);
    float _1569 = _1451 * _1481;
    float _1571 = fma(_1463, _1559, _1563);
    float _1573 = _1451 * _1483;
    float _1575 = _1567 + _1553;
    float _1577 = fma(_1463, _1561, _1569);
    float _1579 = _1451 * _1539;
    float _1581 = fma(_1463, _1565, _1573);
    float _1583 = fma(_1343, _1295, _1377);
    float _1585 = -_1299;
    float _1587 = fma(_1387, _1585, _1407);
    float _1589 = -_1497;
    float _1591 = _1579 * _1589;
    float _1593 = -_1499;
    float _1595 = _1579 * _1593;
    float _1597 = sqrt(_1575);
    float _1599 = -_1501;
    float _1601 = _1579 * _1599;
    float _1603 = fma(_1539, _1481, _1591);
    float _1605 = fma(_1539, _1483, _1595);
    float _1607 = fma(_1393, _1303, _1413);
    float _1609 = fma(_1539, _1545, _1601);
    float _1611 = _1497 + _1577;
    float _1613 = _1499 + _1581;
    float _1615 = _1501 + _1571;
    out.m_74.x = _1487;
    out.m_74.y = _1583;
    out.m_74.z = _1587;
    out.m_74.w = _1607;
    out.m_76.x = _1561;
    out.m_76.y = _1565;
    out.m_76.z = _1559;
    bool _1617 = _1597 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1619 = isnan(_1597);
    bool _1621 = _1617 || _1619;
    bool _1623 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1625 = _1621 || _1623;
    out.m_78.x = _1603;
    out.m_78.y = _1605;
    out.m_78.z = _1609;
    out.m_80.x = _1611;
    out.m_80.y = _1613;
    out.m_80.z = _1615;
    float _1627 = _1561;
    float _1629 = _1565;
    float _1631 = _1559;
    if (!_1625)
    {
        _1509 = 1.0;
    }
    float _1633 = _1509;
    out.m_82.x = _1233;
    out.m_82.y = _1235;
    out.m_82.z = _1237;
    bool _1635 = !_1625;
    float _1637 = _1633;
    if (!_1635)
    {
        bool _1639 = _1597 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1641 = isnan(_1597);
        bool _1643 = _1639 || _1641;
        bool _1645 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1647 = _1643 || _1645;
        if (!_1647)
        {
            float _1649 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1651 = _1597 + _1649;
            float _1653 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1655 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1653;
            float _1657 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1659 = _1657 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1661 = 1.0 / _1655;
            float _1663 = _1651 * _1661;
            float _1665 = fma(_1663, _1659, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1637 = _1665;
            _1667 = true;
        }
        else
        {
            bool _1669 = _1597 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1671 = isnan(_1597);
            bool _1673 = _1669 || _1671;
            bool _1675 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1677 = _1673 || _1675;
            if (!_1677)
            {
                float _1679 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1681 = _1597 + _1679;
                float _1683 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1685 = _1683 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1687 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1689 = _1687 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1691 = 1.0 / _1685;
                float _1693 = _1681 * _1691;
                float _1695 = fma(_1693, _1689, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1637 = _1695;
                _1667 = true;
            }
            else
            {
                _1637 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1667 = false;
    float _1697 = _1637;
    float _1699 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1701 = _1543 + _1699;
    float _1703 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1705 = _1211 + _1703;
    float _1707 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1709 = _1215 + _1707;
    float _1711 = fma(_1701, _1697, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1713 = fma(_1705, _1697, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1715 = fma(_1709, _1697, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1717 = -_1125;
    float _1719 = _1717 + _1711;
    float _1721 = -_1093;
    float _1723 = _1721 + _1713;
    float _1725 = -_1089;
    float _1727 = _1725 + _1715;
    float _1729 = _1719 * _1719;
    float _1731 = fma(_1723, _1723, _1729);
    float _1733 = fma(_1727, _1727, _1731);
    float _1735 = sqrt(_1733);
    bool _1737 = _1735 > 0.0;
    float _1739 = _1723;
    if (!_1737)
    {
        _1627 = _1713;
    }
    float _1741 = _1627;
    float _1743 = _1741;
    if (!_1737)
    {
        _1629 = _1711;
    }
    float _1745 = _1629;
    float _1747 = _1745;
    float _1749 = _1745;
    if (!_1737)
    {
        _1631 = _1715;
    }
    float _1751 = _1631;
    bool _1753 = !_1737;
    float _1755 = _1751;
    float _1757 = _1751;
    if (!_1753)
    {
        float _1759 = _209 * _209;
        float _1761 = fma(_207, _207, _1759);
        float _1763 = rsqrt(_1733);
        float _1765 = fma(_211, _211, _1761);
        float _1767 = sqrt(_1765);
        float _1769 = _1723 * _1763;
        float _1771 = _1719 * _1763;
        float _1773 = _1727 * _1763;
        bool _1775 = _1767 > 0.0;
        float _1777 = _1767;
        if (!_1775)
        {
            _1777 = _1713;
        }
        float _1779 = _1777;
        _1743 = _1779;
        if (!_1775)
        {
            _1747 = _1711;
        }
        float _1781 = _1747;
        _1749 = _1781;
        if (!_1775)
        {
            _1755 = _1715;
        }
        float _1783 = _1755;
        bool _1785 = !_1775;
        _1757 = _1783;
        if (!_1785)
        {
            float _1787 = rsqrt(_1765);
            float _1789 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1791 = _209 * _1787;
            float _1793 = _207 * _1787;
            float _1795 = _211 * _1787;
            float _1797 = _1771 * _1791;
            float _1799 = fma(_1769, _1793, _1797);
            float _1801 = _1789 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1803 = fma(_1773, _1795, _1799);
            float _1805 = _1803 * _1801;
            float _1807 = fma(_207, _1805, _1713);
            float _1809 = fma(_209, _1805, _1711);
            float _1811 = fma(_211, _1805, _1715);
            _1749 = _1809;
            _1743 = _1807;
            _1757 = _1811;
            _1739 = _1801;
        }
    }
    float _1813 = _1749;
    float _1815 = _1743;
    float _1817 = _1757;
    float _1819 = _1739;
    float _1821 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1823 = _1813 + _1821;
    float _1825 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1827 = _1815 + _1825;
    float _1829 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1831 = _1817 + _1829;
    float _1833 = _1823 * _1823;
    float _1835 = fma(_1827, _1827, _1833);
    float _1837 = fma(_1831, _1831, _1835);
    float _1839 = rsqrt(_1837);
    float _1841 = sqrt(_1837);
    float _1843 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1845 = _1827 * _1843;
    float _1847 = _1831 * _1843;
    float _1849 = _1845 * _1845;
    float _1851 = _1847 * _1847;
    float _1853 = _1849 + _1851;
    float _1855 = sqrt(_1853);
    bool _1857 = _1855 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1861 = _1855 + _1859;
    float _1863 = _1839;
    float _1865 = _1819;
    float _1867 = _1861;
    float _1869 = _1823;
    float _1871 = _1845;
    if (_1857)
    {
        float _1873 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1863 = _1873;
    }
    float _1875 = _1863;
    if (_1857)
    {
        float _1877 = rsqrt(_1853);
        _1865 = _1877;
    }
    float _1879 = _1865;
    float _1881 = _1879;
    if (_1857)
    {
        float _1883 = _1861 * _1875;
        _1867 = _1883;
    }
    float _1885 = _1867;
    if (_1857)
    {
        float _1887 = _1885 * 0.15915493667125701904296875;
        _215 = _1887;
    }
    float _1889 = _215;
    float _1891 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1893 = _1875;
    if (_1857)
    {
        float _1895 = _1889 * 6.283185482025146484375;
        float _1897 = sin(_1895);
        _1893 = _1897;
    }
    float _1899 = _1893;
    float _1901 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1903 = precise::max(0.0, _1901);
    float _1905 = _1831;
    float _1907 = _1903;
    if (_1857)
    {
        float _1909 = _1889 * 6.283185482025146484375;
        float _1911 = cos(_1909);
        _1905 = _1911;
    }
    float _1913 = _1905;
    float _1915 = -_1843;
    float _1917 = -_1903;
    float _1919 = fma(_1823, _1915, _1917);
    if (!_1857)
    {
        _1869 = _1847;
    }
    float _1921 = _1869;
    float _1923 = _1921;
    if (_1857)
    {
        float _1925 = _1919 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1907 = _1925;
    }
    float _1927 = _1907;
    float _1929 = _1899;
    float _1931 = _1927;
    if (_1857)
    {
        float _1933 = fma(_1899, _1927, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _217 = _1933;
    }
    float _1935 = _217;
    float _1937 = _1935;
    if (!_1857)
    {
        _1929 = _1919;
    }
    float _1939 = _1929;
    float _1941 = _1939;
    float _1943 = _1913;
    if (_1857)
    {
        float _1945 = _1913 + (-1.0);
        _1931 = _1945;
    }
    float _1947 = _1931;
    float _1949 = _1947;
    if (_1857)
    {
        float _1951 = _1879 * _1935;
        _1937 = _1951;
    }
    float _1953 = _1937;
    if (_1857)
    {
        float _1955 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1881 = _1955;
    }
    float _1957 = _1881;
    if (_1857)
    {
        float _1959 = _1845 * _1953;
        _1871 = _1959;
    }
    float _1961 = _1871;
    if (!_1857)
    {
        _1949 = _1849;
    }
    float _1963 = _1949;
    float _1965 = _1963;
    if (_1857)
    {
        float _1967 = _1847 * _1953;
        _1923 = _1967;
    }
    float _1969 = _1923;
    if (_1857)
    {
        float _1971 = fma(_1919, _1913, _1957);
        _1941 = _1971;
    }
    float _1973 = _1941;
    if (_1857)
    {
        float _1975 = _1961 * _1961;
        _1965 = _1975;
    }
    float _1977 = _1965;
    if (!_1857)
    {
        _1943 = _1851;
    }
    float _1979 = _1943;
    float _1981 = _1979;
    if (_1857)
    {
        float _1983 = _1969 * _1969;
        _1981 = _1983;
    }
    float _1985 = _1981;
    float _1987 = _1813 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1989 = fma(_1973, _1973, _1977);
    float _1991 = _1813 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1993 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1987);
    float _1995 = _1989 + _1985;
    float _1997 = _1813 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1999 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2001 = fma(_1841, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1999);
    float _2003 = precise::clamp(_2001, 0.0, 1.0);
    float _2005 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1993);
    float _2007 = rsqrt(_1995);
    float _2009 = _1813 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2011 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1997);
    float _2013 = -_2003;
    float _2015 = _2013 + 1.0;
    float _2017 = _2005 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2019 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2009);
    float _2021 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2011);
    float _2023 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1991);
    float _2025 = _2017 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2027 = abs(_2015);
    float _2029 = log2(_2027);
    float _2031 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2019);
    float _2033 = _2021 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2035 = -_2025;
    float _2037 = fma(_2035, _1891, 1.0);
    float _2039 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2023);
    float _2041 = _2031 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2043 = _2007 * _1961;
    float _2045 = _2033 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2047 = _2007 * _1973;
    float _2049 = _2007 * _1969;
    float _2051 = _2043 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2053 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2045);
    float _2055 = _2039 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2057 = log2(_2037);
    float _2059 = -_2051;
    float _2061 = fma(_2047, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2059);
    float _2063 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2053);
    float _2065 = _2029 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2067 = _2033 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2069 = -_2049;
    float _2071 = fma(_2069, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2061);
    float _2073 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2063);
    float _2075 = _2033 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2077 = exp2(_2065);
    float _2079 = fma(_2071, -0.5, 0.5);
    float _2081 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2067);
    float _2083 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2075);
    float _2085 = fma(_2071, 0.5, 0.5);
    float _2087 = _2047 + 1.0;
    float _2089 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2081);
    float _2091 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2083);
    float _2093 = 1.0 / _2073;
    float _2095 = fma(_2085, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2097 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2089);
    float _2099 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2091);
    float _2101 = _2057 * 0.693147182464599609375;
    float _2103 = fma(_2085, _2095, -0.212114393711090087890625);
    float _2105 = sqrt(_2079);
    float _2107 = -_2047;
    float _2109 = fma(_2077, _2087, _2107);
    float _2111 = fma(_2085, _2103, 1.570728778839111328125);
    float _2113 = _2101 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2115 = fma(_2109, 0.5, 0.5);
    float _2117 = _2099 * _2093;
    float _2119 = _2097 * _2093;
    float _2121 = fma(_2117, 0.5, 0.5);
    float _2123 = fma(_2119, -0.5, 0.5);
    float _2125 = _2105 * 0.636619746685028076171875;
    float3 _6061 = float3(_2121, _2123, _2113);
    float _2127 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6061, float3(0.0), isnan(_6061)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6061, float3(0.0), isnan(_6061)), level(0.0)).x;
    float3 _6072 = float3(_2121, _2123, _2113);
    float4 _2130 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6072, float3(0.0), isnan(_6072)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6072, float3(0.0), isnan(_6072)), level(0.0)).xyzw;
    float _2132 = _2130.x;
    float _2134 = _2130.y;
    float _2136 = _2130.z;
    float _2138 = _2130.w;
    float _2140 = -_2111;
    float _2142 = fma(_2125, _2140, 1.0);
    float2 _6093 = float2(_2142, _2115);
    float3 _2144 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6093, float2(0.0), isnan(_6093)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6093, float2(0.0), isnan(_6093)), level(0.0)).xyz;
    float _2146 = _2144.x;
    float _2148 = _2144.y;
    float _2150 = _2144.z;
    float _2152 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2154 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2156 = _2033 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2158 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2152);
    float _2160 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2154);
    float _2162 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2156);
    float _2164 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2158);
    float _2166 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2160);
    float _2168 = -_1239;
    float _2170 = _2168 + 1.0;
    float _2172 = _2164 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2174 = _2166 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2176 = 1.0 / _2172;
    float _2178 = _2174 + _2172;
    bool _2180 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2182 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2184 = _2180 || _2182;
    bool _2186 = isnan(0.5);
    bool _2188 = _2184 || _2186;
    float _2190 = in.m_84.x;
    float _2192 = _2178 * _2176;
    float _2194 = _2192 * 0.5;
    float _2196 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2198 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2196);
    float _2200 = 1.0 / _2198;
    float _2202 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2204 = _2200 * _2202;
    float _2206 = abs(_2204);
    float _2208 = log2(_2206);
    bool _2210 = _2204 <= 8000.0;
    bool _2212 = isnan(_2204);
    bool _2214 = _2210 || _2212;
    bool _2216 = isnan(8000.0);
    bool _2218 = _2214 || _2216;
    float _2220 = float(_2218);
    float _2222 = _2204;
    float _2224 = _2055;
    float _2226 = _2073;
    float _2228 = _2097;
    float _2230 = _2138;
    float _2232 = _2136;
    if (!_2188)
    {
        float _2234 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2236 = _2204 + _2234;
        _2222 = _2236;
    }
    float _2238 = _2222;
    float _2240 = _2208 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2242 = exp2(_2240);
    float _2244 = fma(_2242, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2246 = precise::clamp(_2244, 0.0, 1.0);
    float _2248 = _2242;
    if (!_2188)
    {
        _2248 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2250 = _2248;
    float _2252 = fma(_2246, -2.0, 3.0);
    float _2254 = _2246 * _2246;
    float _2256 = _2250;
    if (!_2188)
    {
        float _2258 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2260 = _2250 + _2258;
        _2256 = _2260;
    }
    float _2262 = _2256;
    float _2264 = _2254 * _2252;
    float _2266 = 2.0;
    if (!_2188)
    {
        float _2268 = 1.0 / _2262;
        _2266 = _2268;
    }
    float _2270 = _2266;
    float _2272 = -_2264;
    float _2274 = _2272 + 1.0;
    float _2276 = fma(_2274, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2264);
    float _2278 = _2029 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2280 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2162);
    float _2282 = _2220 * _2276;
    float _2284 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2280);
    float _2286 = exp2(_2278);
    float _2288 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2290 = _2284;
    float _2292 = _2099;
    if (_2188)
    {
        _2224 = 1.0;
    }
    float _2294 = _2224;
    float _2296 = _2294;
    if (!_2188)
    {
        float _2298 = _2238 * _2270;
        float _2300 = precise::clamp(_2298, 0.0, 1.0);
        _2296 = _2300;
    }
    float _2302 = _2296;
    bool _2304 = _1841 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2306 = isnan(_1841);
    bool _2308 = _2304 || _2306;
    bool _2310 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2312 = _2308 || _2310;
    float _2314 = _2170 * _2288;
    float _2316 = precise::clamp(_2314, 0.0, 1.0);
    out.gl_Position.x = _2099;
    out.gl_Position.y = _2097;
    out.gl_Position.z = _2284;
    out.gl_Position.w = _2073;
    float _2318 = -_2316;
    float _2320 = fma(_2318, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2322 = _2284 + _2073;
    float _2324 = _2320 * _2190;
    float _2326 = _2322 * 0.5;
    float _2328 = -_2286;
    float _2330 = _2328 + 1.0;
    float _2332 = _2324 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2334 = _2330 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_86.z = _2326;
    out.m_86.w = _2073;
    if (!_2312)
    {
        _2226 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2336 = _2226;
    float _2338 = _2336;
    float _2340 = _2336;
    if (!_2312)
    {
        _2290 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2342 = _2290;
    out.m_88.x = _2332;
    float _2344 = _2342;
    float _2346 = _2342;
    if (!_2312)
    {
        _2228 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2348 = _2228;
    float _2350 = _2348;
    float _2352 = _2348;
    if (!_2312)
    {
        _2292 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2354 = _2292;
    float _2356 = _2302 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2358 = _2334 * _2127;
    float _2360 = -_2334;
    float _2362 = _2360 + 1.0;
    float _2364 = _2138 * _2358;
    float _2366 = _2150 * _2358;
    float _2368 = fma(_2146, _2364, _2132);
    float _2370 = fma(_2148, _2364, _2134);
    float _2372 = _2138 * _2362;
    float _2374 = fma(_2138, _2366, _2136);
    float _2376 = _2354;
    float _2378 = _2354;
    if (!_2312)
    {
        _2230 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2380 = _2230;
    float _2382 = _2380;
    float _2384 = _2380;
    if (!_2312)
    {
        _2232 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2386 = _2232;
    out.m_90.x = _2368;
    out.m_90.y = _2370;
    out.m_90.z = _2374;
    out.m_90.w = _2372;
    bool _2388 = !_2312;
    float _2390 = _2386;
    float _2392 = _2386;
    if (!_2388)
    {
        bool _2394 = _1841 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2396 = isnan(_1841);
        bool _2398 = _2394 || _2396;
        bool _2400 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2402 = _2398 || _2400;
        if (!_2402)
        {
            float _2404 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2406 = _1841 + _2404;
            float _2408 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2410 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2408;
            float _2412 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2414 = _2412 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2416 = 1.0 / _2410;
            float _2418 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2420 = _2418 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2422 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2424 = _2422 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2428 = _2426 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2430 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2432 = _2430 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2434 = _2406 * _2416;
            float _2436 = precise::clamp(_2434, 0.0, 1.0);
            float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2440 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2442 = fma(_2436, _2414, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2444 = fma(_2436, _2440, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2446 = fma(_2436, _2420, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2448 = fma(_2436, _2424, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2450 = fma(_2436, _2428, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2452 = fma(_2436, _2432, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2392 = _2446;
            _2352 = _2450;
            _2384 = _2442;
            _2346 = _2448;
            _2340 = _2444;
            _2378 = _2452;
            _2454 = true;
        }
        else
        {
            bool _2456 = _1841 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2458 = isnan(_1841);
            bool _2460 = _2456 || _2458;
            bool _2462 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2464 = _2460 || _2462;
            if (!_2464)
            {
                _2382 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2466 = _2382;
            _2384 = _2466;
            if (!_2464)
            {
                _2390 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2468 = _2390;
            _2392 = _2468;
            if (!_2464)
            {
                _2338 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2470 = _2338;
            _2340 = _2470;
            if (!_2464)
            {
                _2344 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2472 = _2344;
            _2346 = _2472;
            if (!_2464)
            {
                _2350 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2474 = _2350;
            _2352 = _2474;
            if (!_2464)
            {
                _2376 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2476 = _2376;
            bool _2478 = !_2464;
            _2378 = _2476;
            if (!_2478)
            {
                bool _2480 = _1841 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2482 = isnan(_1841);
                bool _2484 = _2480 || _2482;
                bool _2486 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2488 = _2484 || _2486;
                if (!_2488)
                {
                    float _2490 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2492 = _1841 + _2490;
                    float _2494 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2496 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2494;
                    float _2498 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2500 = _2498 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2502 = 1.0 / _2496;
                    float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2506 = _2504 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2510 = _2508 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2512 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2514 = _2512 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2518 = _2516 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2520 = _2492 * _2502;
                    float _2522 = precise::clamp(_2520, 0.0, 1.0);
                    float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2528 = fma(_2522, _2500, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2530 = fma(_2522, _2526, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2532 = fma(_2522, _2506, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2534 = fma(_2522, _2510, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2536 = fma(_2522, _2514, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2538 = fma(_2522, _2518, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2392 = _2532;
                    _2352 = _2536;
                    _2384 = _2528;
                    _2346 = _2534;
                    _2340 = _2530;
                    _2378 = _2538;
                    _2454 = true;
                }
                else
                {
                    _2392 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2352 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2384 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2346 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2340 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2378 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2454 = false;
    float _2540 = _2392;
    float _2542 = _2352;
    float _2544 = _2384;
    float _2546 = _2346;
    float _2548 = _2340;
    float _2550 = _2378;
    float _2552 = _2356 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2554 = fma(_1613, -0.5, 0.5);
    float _2556 = precise::clamp(_2554, 0.0, 1.0);
    float _2558 = -_2540;
    float _2560 = _2558 + _2542;
    float _2562 = -_2544;
    float _2564 = _2562 + _2546;
    out.m_53.x = _2552;
    float _2566 = fma(_2556, _2560, _2540);
    float _2568 = -_2548;
    float _2570 = _2568 + _2550;
    float _2572 = fma(_2556, _2564, _2544);
    float _2574 = _2566 * 0.586610972881317138671875;
    bool _2576 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2578 = fma(_2556, _2570, _2548);
    out.m_92.x = 0.0;
    float _2580 = fma(_2572, 0.298911988735198974609375, _2574);
    bool _2582 = _2302 > 0.0;
    bool _2584 = isnan(_2302);
    bool _2586 = _2582 || _2584;
    bool _2588 = isnan(0.0);
    bool _2590 = _2586 || _2588;
    float _2592 = fma(_2578, 0.114477999508380889892578125, _2580);
    float _2594 = -_2592;
    float _2596 = _2572 + _2594;
    float _2598 = -_2592;
    float _2600 = _2566 + _2598;
    float _2602 = -_2592;
    float _2604 = _2578 + _2602;
    float _2606 = fma(_2596, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2592);
    float _2608 = fma(_2600, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2592);
    float _2610 = fma(_2604, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2592);
    bool _2612 = !_2576;
    if (!_2612)
    {
        float _2614 = -_1813;
        float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2618 = -_1815;
        float _2620 = _2618 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2622 = -_1817;
        float _2624 = _2622 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2626 = _2616 * _2616;
        float _2628 = fma(_2620, _2620, _2626);
        float _2630 = fma(_2624, _2624, _2628);
        float _2632 = sqrt(_2630);
        float _2634 = rsqrt(_2630);
        float _2636 = -_2632;
        float _2638 = _2636 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2640 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2642 = precise::clamp(_2640, 0.0, 1.0);
        float _2644 = _2620 * _2634;
        float _2646 = _2616 * _2634;
        float _2648 = abs(_2642);
        float _2650 = log2(_2648);
        float _2652 = _2624 * _2634;
        float _2654 = _2644 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2656 = _1613 * _2646;
        float _2658 = -_2646;
        float _2660 = -_2654;
        float _2662 = fma(_2658, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2660);
        float _2664 = fma(_1611, _2644, _2656);
        float _2666 = -_2652;
        float _2668 = fma(_2666, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2662);
        float _2670 = fma(_1615, _2652, _2664);
        float _2672 = precise::clamp(_2670, 0.0, 1.0);
        float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2676 = _2668 + _2674;
        float _2678 = _2650 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2680 = _2676 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2682 = precise::clamp(_2680, 0.0, 1.0);
        float _2684 = exp2(_2678);
        float _2686 = _2684 * _2682;
        float _2688 = _2672 * _2686;
        float _2690 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2692 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2694 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2690;
        out.m_92.y = _2692;
        out.m_92.z = _2694;
    }
    out.m_94.x = _2606;
    out.m_94.y = _2608;
    out.m_94.z = _2610;
    if (_2590)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2696 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2696;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2454 = false;
    bool _1667 = false;
    bool _581 = false;
    bool _431 = false;
    bool _237 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_50.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_53.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2753 = as_type<float>(_129);
        out.gl_Position.z = _2753;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_55.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_113);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _123;
    if (_161)
    {
        out.m_53.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2822 = as_type<float>(_167);
        out.gl_Position.z = _2822;
    }
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = in.m_60.x;
    float _173 = in.m_60.y;
    float _175 = in.m_60.z;
    int _177 = as_type<int>(_169) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_169) & 2;
    bool _183 = _181 != 0;
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _187 = _173 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _189 = _173 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _191 = _173 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _193 = !_179;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].x, _187);
    float _199 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].x, _189);
    float _201 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].x, _191);
    bool _203 = !_183;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].z, _197);
    float _209 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].z, _199);
    float _211 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].z, _201);
    bool _213 = !_185;
    float _215 = _209;
    float _217 = _211;
    float _235;
    if (!_213)
    {
        float _219 = in.m_62.x;
        float _221 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _223 = _219 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _227 = _225 * _221;
        float _229 = floor(_227);
        float _231 = -_229;
        float _233 = _227 + _231;
        _235 = _233;
        _237 = true;
    }
    else
    {
        float _239 = float(_113);
        float _241 = 1.0 / _239;
        float _243 = _147 * _241;
        _235 = _243;
    }
    _237 = false;
    float _245 = _235;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = _245 + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = _245 + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _257 = _245 + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _265 = _263 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _267;
    float _271 = 1.0 / _261;
    bool _273 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _275 = 1.0 / _269;
    bool _277 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _279 = isnan(_245);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = 1.0 / _265;
    float _291 = _249 * _271;
    bool _293 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _295 = isnan(_245);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = _253 * _275;
    bool _307 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _309 = isnan(_245);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -_287;
    float _321 = _319 + 1.0;
    float _323 = _317 * _321;
    float _325 = -_317;
    float _327 = _325 + 1.0;
    float _329 = _257 * _289;
    float _331 = -_303;
    float _333 = _331 + 1.0;
    bool _335 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _337 = isnan(_245);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _355 = _287 * _333;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _365 = fma(_349, _291, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _367 = _345 * _327;
    float _369 = fma(_359, _291, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _371 = fma(_353, _329, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _373 = fma(_363, _329, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _375 = -_345;
    float _377 = _375 + 1.0;
    float _379 = _365 * _367;
    float _381 = _369 * _367;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _383;
    float _387 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].x, _379);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _389;
    float _393 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[143].y, _381);
    float _395 = fma(_385, _305, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _397 = fma(_371, _323, _387);
    float _399 = fma(_391, _305, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _401 = fma(_373, _323, _393);
    float _403 = fma(_395, _355, _397);
    float _405 = fma(_399, _355, _401);
    float _407 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[146].x, _403);
    float _409 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[146].y, _405);
    bool _411 = !_273;
    float _429;
    if (!_411)
    {
        float _413 = in.m_62.x;
        float _415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _417 = _413 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _419 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _421 = _419 * _415;
        float _423 = floor(_421);
        float _425 = -_423;
        float _427 = _421 + _425;
        _429 = _427;
        _431 = true;
    }
    else
    {
        float _433 = float(_113);
        float _435 = 1.0 / _433;
        float _437 = _147 * _435;
        _429 = _437;
    }
    _431 = false;
    float _439 = _429;
    float _441 = in.m_64.x;
    float _443 = in.m_64.y;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _449 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _451 = isnan(_439);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _465 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _467 = isnan(_439);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = 1.0 / _447;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _479;
    float _483 = -_459;
    float _485 = _483 + 1.0;
    bool _487 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _489 = isnan(_439);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    bool _499 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _501 = 1.0 / _463;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _507 = _481 * _477;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _511 = _439 + _509;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _515 = _439 + _513;
    float _517 = _407 * _441;
    float _519 = fma(_507, _511, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _521 = _475 * _485;
    float _523 = -_475;
    float _525 = _523 + 1.0;
    float _527 = _505 * _501;
    float _529 = -_497;
    float _531 = _529 + 1.0;
    float _533 = _519 * _521;
    float _535 = fma(_527, _515, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _537 = _459 * _531;
    float _539 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[115].x, _533);
    float _541 = _409 * _443;
    float _543 = fma(_535, _537, _539);
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _549 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[117].x, _543);
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _553 = _545 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _555 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _557 = _549 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _559 = _551 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _553;
    out.m_66.y = _555;
    out.m_66.z = _559;
    out.m_66.w = _557;
    bool _561 = !_499;
    float _579;
    if (!_561)
    {
        float _563 = in.m_62.x;
        float _565 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _567 = _563 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _569 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[11].w, _147);
        float _571 = _569 * _565;
        float _573 = floor(_571);
        float _575 = -_573;
        float _577 = _571 + _575;
        _579 = _577;
        _581 = true;
    }
    else
    {
        float _583 = float(_113);
        float _585 = 1.0 / _583;
        float _587 = _147 * _585;
        _579 = _587;
    }
    _581 = false;
    float _589 = _579;
    float _591 = in.m_62.x;
    float _593 = in.m_62.y;
    float _595 = in.m_62.z;
    float _597 = in.m_62.w;
    float _599 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _601 = log2(_599);
    float _603 = _517 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _607 = _605 != 0;
    float _609 = _541 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _615 = _601 * _147;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _621 = _595 * 2.0;
    float _623 = _591 * 2.0;
    float _625 = _591 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _627 = _593 * 2.0;
    float _629 = _593 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _633 = floor(_621);
    float _635 = -_611;
    float _637 = fma(_625, 2.0, _635);
    float _639 = fma(_629, -2.0, _613);
    float _641 = -_147;
    float _643 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[76].x, _637);
    float _645 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _639);
    float _647 = floor(_623);
    bool _649 = _633 > 0.0;
    float _651 = floor(_627);
    bool _653 = _633 >= 0.0;
    bool _655 = isnan(_633);
    bool _657 = _653 || _655;
    bool _659 = isnan(0.0);
    bool _661 = _657 || _659;
    float _663 = _593 + _591;
    float _665 = _661 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _667 = _663 + (-1.0);
    bool _669 = _647 > 0.0;
    bool _671 = _647 >= 0.0;
    bool _673 = isnan(_647);
    bool _675 = _671 || _673;
    bool _677 = isnan(0.0);
    bool _679 = _675 || _677;
    float _681 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _683 = _593 > 0.5;
    int _685 = ~as_type<int>(_665);
    int _687 = _685 + 1;
    int _689 = _687 + 1;
    int _691 = _689;
    float _693 = _647;
    float _695 = _665;
    if (!_649)
    {
        int _697 = ~as_type<int>(_665);
        int _699 = _697 + 1;
        _691 = _699;
    }
    int _701 = _691;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _705 = _703 != 0;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _709 = _707 != 0;
    bool _711 = _595 > 0.5;
    float _713 = -_195;
    float _715 = _683 ? _713 : _195;
    float _717 = -_205;
    int _719 = _711 ? as_type<int>(_717) : as_type<int>(_205);
    bool _721 = !_705;
    float _723 = _721 ? _195 : _715;
    float _725 = _715;
    if (!_607)
    {
        _693 = _593;
    }
    float _727 = _693;
    float _729 = _727;
    if (!_607)
    {
        _695 = _595;
    }
    float _731 = _695;
    float _733 = _731;
    if (!_607)
    {
        _725 = _595;
    }
    float _735 = _725;
    bool _737 = !_709;
    float _739 = _737 ? _205 : as_type<float>(_719);
    float _741 = _735;
    if (_607)
    {
        _729 = _591;
    }
    float _743 = _729;
    if (_607)
    {
        _733 = _593;
    }
    float _745 = _733;
    if (_607)
    {
        _741 = _593;
    }
    float _747 = _741;
    float _749 = _743 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _753 = _751 != 0;
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _757 = _755 != 0;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _761 = _759 != 0;
    float _763 = _745 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _765 = _679 ? 0 : 1;
    float _767 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[83].w, _619);
    bool _769 = _651 > 0.0;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _773 = !_753;
    int _775 = _773 ? 0 : 1;
    float _777 = -_631;
    float _779 = fma(_749, 2.0, _777);
    bool _781 = _651 >= 0.0;
    bool _783 = isnan(_651);
    bool _785 = _781 || _783;
    bool _787 = isnan(0.0);
    bool _789 = _785 || _787;
    float _791 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[83].z, _617);
    int _793 = abs(_775);
    float _795 = exp2(_615);
    float _797 = float(_701);
    float _799 = fma(_763, -2.0, _771);
    float _801 = float(_793);
    float _803 = -_147;
    float _805 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[81].x, _779);
    int _807 = _789 ? 0 : 1;
    float _809 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _791);
    int _811 = ~_765;
    int _813 = _811 + 1;
    int _815 = _813 + 1;
    float _817 = _801 * _797;
    int _819 = ~_807;
    int _821 = _819 + 1;
    int _823 = _821 + 1;
    float _825 = in.m_68.x;
    float _827 = in.m_68.y;
    float _829 = in.m_68.z;
    int _831 = _815;
    int _833 = _823;
    if (!_669)
    {
        int _835 = ~_765;
        int _837 = _835 + 1;
        _831 = _837;
    }
    int _839 = _831;
    float _841 = _591 + (-0.5);
    if (!_769)
    {
        int _843 = ~_807;
        int _845 = _843 + 1;
        _833 = _845;
    }
    int _847 = _833;
    float _849 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _799);
    bool _851 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _853 = isnan(1.0);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _859 = _855 || _857;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _865 = 1.0 + _863;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _869 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _871 = isnan(0.0);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _877 = _873 || _875;
    float _879 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[78].w, _861);
    float _881 = 1.0 / _865;
    float _883 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[78].z, _867);
    float _885 = -_795;
    float _887 = _885 + 1.0;
    float _889 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _879);
    bool _891 = !_757;
    int _893 = _891 ? 0 : 1;
    float _895 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _883);
    float _897 = float(_839);
    float _899 = _877 ? _887 : 0.0;
    float _901 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _767);
    float _903 = _817 * (-2.0);
    int _905 = abs(_893);
    bool _907 = !_761;
    int _909 = _907 ? 0 : 1;
    float _911 = fma(_903, _825, _825);
    float _913 = float(_905);
    if (_859)
    {
        float _915 = _899 * _881;
        _151 = _915;
    }
    float _917 = _151;
    float _919 = fma(_681, _903, _681);
    float _921 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[196].x, _911);
    int _923 = abs(_909);
    float _925 = _913 * _897;
    float _927 = _593 + _595;
    float _929 = fma(_919, _917, _921);
    float _931 = _593 + (-0.5);
    float _933 = float(_847);
    float _935 = _927 + (-1.0);
    float _937 = float(_923);
    float _939 = _925 * (-2.0);
    float _941 = _929 * 0.15915493667125701904296875;
    float _943 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _945 = _595 + _591;
    float _947 = fma(_939, _827, _827);
    float _949 = _937 * _933;
    float _951 = fma(_943, _939, _943);
    float _953 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[196].y, _947);
    float _955 = _945 + (-1.0);
    float _957 = _949 * (-2.0);
    float _959 = _595 + (-0.5);
    float _961 = fma(_951, _917, _953);
    float _963 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _965 = fma(_957, _829, _829);
    float _967 = _941 * 6.283185482025146484375;
    float _969 = cos(_967);
    float _971 = _961 * 0.15915493667125701904296875;
    float _973 = fma(_963, _957, _963);
    float _975 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[196].z, _965);
    float _977 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _979 = fma(_973, _917, _975);
    float _981 = _971 * 6.283185482025146484375;
    float _983 = sin(_981);
    float _985 = _603 * _977;
    float _987 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _989 = _979 * 0.15915493667125701904296875;
    float _991 = in.m_50.x;
    float _993 = in.m_50.y;
    float _995 = in.m_50.z;
    float _997 = _609 * _987;
    float _999 = _971 * 6.283185482025146484375;
    float _1001 = cos(_999);
    float _1003 = _941 * 6.283185482025146484375;
    float _1005 = sin(_1003);
    float _1007 = _969 * _983;
    float _1009 = _989 * 6.283185482025146484375;
    float _1011 = cos(_1009);
    float _1013 = _969 * _1001;
    float _1015 = _989 * 6.283185482025146484375;
    float _1017 = sin(_1015);
    float _1019 = _1005 * _983;
    float _1021 = _1005 * _1001;
    float _1023 = _969 * _1011;
    float _1025 = _1005 * _1011;
    float _1027 = _1001 * _1011;
    float _1029 = _983 * _1011;
    float _1031 = _1023 * _997;
    float _1033 = _1025 * _997;
    float _1035 = fma(_1017, _1013, _1019);
    float _1037 = -_1007;
    float _1039 = fma(_1017, _1021, _1037);
    float _1041 = fma(_1017, _1019, _1013);
    float _1043 = -_1021;
    float _1045 = fma(_1017, _1007, _1043);
    float _1047 = -_997;
    float _1049 = _1017 * _1047;
    float _1051 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1053 = fma(_1035, _985, _1031);
    float _1055 = fma(_1027, _985, _1049);
    float _1057 = fma(_1039, _985, _1033);
    float _1059 = fma(_1045, _1051, _1053);
    float _1061 = _993 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1063 = fma(_1029, _1051, _1055);
    float _1065 = fma(_1041, _1051, _1057);
    float _1067 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1069 = _993 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1071 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1073 = fma(_991, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1061);
    float _1075 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1067);
    float _1077 = fma(_991, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1069);
    float _1079 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1071);
    float _1081 = fma(_995, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1073);
    float _1083 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1075);
    float _1085 = fma(_995, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1077);
    float _1087 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1079);
    float _1089 = _1081 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1091 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1093 = _1085 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1095 = _1087 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1097 = _993 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1099 = _1059 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1101 = _1093 + _1091;
    float _1103 = _1089 + _1095;
    float _1105 = fma(_991, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1097);
    float _1107 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1099);
    float _1109 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1111 = _1101 + _1109;
    float _1113 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1115 = _1103 + _1113;
    float _1117 = fma(_995, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1105);
    float _1119 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1107);
    float _1121 = _1111 * _1111;
    float _1123 = _1115 * _1115;
    float _1125 = _1117 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1127 = _1119 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1129 = _1121 + _1123;
    float _1131 = sqrt(_1129);
    float _1133 = fma(_1093, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    bool _1135 = _1131 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1137 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1139 = _1131 + _1137;
    float _1141 = 0.0;
    float _1143 = _1129;
    float _1145 = _1131;
    float _1147 = _1117;
    float _1149 = _1101;
    float _1151 = _1103;
    float _1153 = _1121;
    float _1155 = _1123;
    if (_1135)
    {
        float _1157 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1141 = _1157;
    }
    float _1159 = _1141;
    if (_1135)
    {
        float _1161 = rsqrt(_1129);
        _1143 = _1161;
    }
    float _1163 = _1143;
    if (_1135)
    {
        float _1165 = _1139 * _1159;
        _1145 = _1165;
    }
    float _1167 = _1145;
    float _1169 = _1125 + _1127;
    float _1171 = floor(_1133);
    float _1173 = _1167;
    float _1175 = _1169;
    if (_1135)
    {
        float _1177 = _1167 * 0.15915493667125701904296875;
        _1173 = _1177;
    }
    float _1179 = _1173;
    if (_1135)
    {
        float _1181 = _1169 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1147 = _1181;
    }
    float _1183 = _1147;
    float _1185 = fma(_1089, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1187 = _991;
    float _1189 = _1183;
    if (_1135)
    {
        float _1191 = _1179 * 6.283185482025146484375;
        float _1193 = sin(_1191);
        _1187 = _1193;
    }
    float _1195 = _1187;
    float _1197 = floor(_1185);
    if (_1135)
    {
        float _1199 = fma(_1195, _1183, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1189 = _1199;
    }
    float _1201 = _1189;
    float _1203 = _1201;
    if (_1135)
    {
        float _1205 = _1163 * _1201;
        _1203 = _1205;
    }
    float _1207 = _1203;
    if (_1135)
    {
        float _1209 = fma(_1111, _1207, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1149 = _1209;
    }
    float _1211 = _1149;
    if (_1135)
    {
        float _1213 = fma(_1115, _1207, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1151 = _1213;
    }
    float _1215 = _1151;
    float _1217 = -_1171;
    float _1219 = _1133 + _1217;
    float _1221 = -_1197;
    float _1223 = _1185 + _1221;
    float _1225 = fma(_1211, 6.2500002968590706586837768554688e-05, 0.5);
    float _1227 = fma(_1215, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4511 = float2(_1225, _1227);
    float3 _1231 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4511, float2(0.0), isnan(_4511)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4511, float2(0.0), isnan(_4511)), level(0.0)).xyz;
    float _1233 = _1231.x;
    float _1235 = _1231.y;
    float _1237 = _1231.z;
    float2 _4527 = float2(_1219, _1223);
    float _1239 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4527, float2(0.0), isnan(_4527)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4527, float2(0.0), isnan(_4527)), level(0.0)).x;
    float _1241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1243 = _723 + 0.5;
    bool _1245 = _591 > 0.5;
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1249 = _1247 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1253 = _1251 != 0;
    float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1257 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1255;
    float _1259 = -_195;
    int _1261 = _1245 ? as_type<int>(_1259) : as_type<int>(_195);
    float _1263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1265 = _597 > 0.5;
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1269 = _589 + _1267;
    int _1271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1273 = _1271 != 0;
    float _1275 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1279 = _1277 != 0;
    float _1281 = -_895;
    float _1283 = _1281 + 1.0;
    float _1285 = -_195;
    int _1287 = _711 ? as_type<int>(_1285) : as_type<int>(_195);
    float _1289 = 1.0 / _1249;
    float _1291 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1293 = -_889;
    float _1295 = _1293 + 1.0;
    float _1297 = -_809;
    float _1299 = _1297 + 1.0;
    float _1301 = -_901;
    float _1303 = _1301 + 1.0;
    float _1305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1307 = _1263 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1309 = _1257 * _1289;
    bool _1311 = !_1253;
    float _1313 = _1311 ? _195 : as_type<float>(_1261);
    float _1315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1319 = _1317 != 0;
    float _1321 = -_205;
    int _1323 = _683 ? as_type<int>(_1321) : as_type<int>(_205);
    float _1325 = fma(_1309, _1269, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1327 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1329 = isnan(_589);
    bool _1331 = _1327 || _1329;
    bool _1333 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1335 = _1331 || _1333;
    float _1337 = float(_1335);
    float _1339 = _1313 + 0.5;
    bool _1341 = !_1273;
    float _1343 = _1341 ? _205 : as_type<float>(_1323);
    float _1345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1347 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1349 = isnan(_589);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1355 = _1351 || _1353;
    float _1357 = float(_1355);
    float _1359 = -_1337;
    float _1361 = _1359 + 1.0;
    float _1363 = fma(_1291, _1339, _643);
    float _1365 = _1343 + (-0.5);
    float _1367 = _1357 * _1361;
    float _1369 = -_1357;
    float _1371 = _1369 + 1.0;
    float _1373 = -_1307;
    float _1375 = -_645;
    float _1377 = fma(_1373, _1365, _1375);
    float _1379 = -_205;
    int _1381 = _1265 ? as_type<int>(_1379) : as_type<int>(_205);
    float _1383 = _1325 * _1367;
    bool _1385 = !_1319;
    float _1387 = _1385 ? _195 : as_type<float>(_1287);
    float _1389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1391 = !_1279;
    float _1393 = _1391 ? _205 : as_type<float>(_1381);
    float _1395 = _1305 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1397 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1399 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1383);
    float _1401 = _1387 + 0.5;
    float _1403 = _1393 + (-0.5);
    float _1405 = fma(_1337, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1399);
    float _1407 = fma(_1395, _1401, _805);
    float _1409 = -_1397;
    float _1411 = -_849;
    float _1413 = fma(_1409, _1403, _1411);
    float _1415 = -_739;
    float _1417 = _1415 + 0.5;
    float _1419 = _1275 * _1345;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1423 = _1417 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1425 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1427 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1429 = _1421 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1431 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (_1135)
    {
        float _1433 = _1179 * 6.283185482025146484375;
        float _1435 = cos(_1433);
        _1431 = _1435;
    }
    float _1437 = _1431;
    float _1439 = _1423 * _1389;
    float _1441 = _1425 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1443 = _1427 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1445 = _1405 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1447 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_70.x = _1419;
    out.m_70.y = _1439;
    float _1449 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1451 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1453 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_72.x = _1441;
    out.m_72.y = _1443;
    out.m_72.z = _1429;
    out.m_72.w = _1445;
    float _1455 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1457 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1459 = -_1017;
    float _1461 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1453);
    float _1463 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1465 = -_1017;
    float _1467 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1455);
    float _1469 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1471 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1473 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1475 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1477 = -_1017;
    float _1479 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1457);
    float _1481 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1461);
    float _1483 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1467);
    float _1485 = -_1283;
    float _1487 = fma(_1313, _1485, _1363);
    float _1489 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1447);
    float _1491 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1449);
    float _1493 = fma(_1029, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1469);
    float _1495 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1471);
    float _1497 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1489);
    float _1499 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1491);
    float _1501 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1493);
    float _1503 = _1489;
    float _1505 = _1491;
    float _1507 = _1447;
    float _1509 = _1499;
    if (_1135)
    {
        float _1511 = _1437 + (-1.0);
        _1503 = _1511;
    }
    float _1513 = _1503;
    float _1515 = fma(_1451, _1451, 1.0);
    float _1517 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1473);
    float _1519 = _1513;
    if (_1135)
    {
        float _1521 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1523 = _1215 + _1521;
        _1505 = _1523;
    }
    float _1525 = _1505;
    if (_1135)
    {
        float _1527 = _1513 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1507 = _1527;
    }
    float _1529 = _1507;
    if (_1135)
    {
        float _1531 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1533 = _1211 + _1531;
        _1519 = _1533;
    }
    float _1535 = _1519;
    float _1537 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1475);
    float _1539 = rsqrt(_1515);
    if (_1135)
    {
        float _1541 = fma(_1169, _1437, _1529);
        _1175 = _1541;
    }
    float _1543 = _1175;
    float _1545 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1479);
    if (_1135)
    {
        float _1547 = _1535 * _1535;
        _1153 = _1547;
    }
    float _1549 = _1153;
    if (_1135)
    {
        float _1551 = _1525 * _1525;
        _1155 = _1551;
    }
    float _1553 = _1155;
    float _1555 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1557 = _1543 + _1555;
    float _1559 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1537);
    float _1561 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1495);
    float _1563 = _1451 * _1545;
    float _1565 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1517);
    float _1567 = fma(_1557, _1557, _1549);
    float _1569 = _1451 * _1481;
    float _1571 = fma(_1463, _1559, _1563);
    float _1573 = _1451 * _1483;
    float _1575 = _1567 + _1553;
    float _1577 = fma(_1463, _1561, _1569);
    float _1579 = _1451 * _1539;
    float _1581 = fma(_1463, _1565, _1573);
    float _1583 = fma(_1343, _1295, _1377);
    float _1585 = -_1299;
    float _1587 = fma(_1387, _1585, _1407);
    float _1589 = -_1497;
    float _1591 = _1579 * _1589;
    float _1593 = -_1499;
    float _1595 = _1579 * _1593;
    float _1597 = sqrt(_1575);
    float _1599 = -_1501;
    float _1601 = _1579 * _1599;
    float _1603 = fma(_1539, _1481, _1591);
    float _1605 = fma(_1539, _1483, _1595);
    float _1607 = fma(_1393, _1303, _1413);
    float _1609 = fma(_1539, _1545, _1601);
    float _1611 = _1497 + _1577;
    float _1613 = _1499 + _1581;
    float _1615 = _1501 + _1571;
    out.m_74.x = _1487;
    out.m_74.y = _1583;
    out.m_74.z = _1587;
    out.m_74.w = _1607;
    out.m_76.x = _1561;
    out.m_76.y = _1565;
    out.m_76.z = _1559;
    bool _1617 = _1597 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1619 = isnan(_1597);
    bool _1621 = _1617 || _1619;
    bool _1623 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1625 = _1621 || _1623;
    out.m_78.x = _1603;
    out.m_78.y = _1605;
    out.m_78.z = _1609;
    out.m_80.x = _1611;
    out.m_80.y = _1613;
    out.m_80.z = _1615;
    float _1627 = _1561;
    float _1629 = _1565;
    float _1631 = _1559;
    if (!_1625)
    {
        _1509 = 1.0;
    }
    float _1633 = _1509;
    out.m_82.x = _1233;
    out.m_82.y = _1235;
    out.m_82.z = _1237;
    bool _1635 = !_1625;
    float _1637 = _1633;
    if (!_1635)
    {
        bool _1639 = _1597 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1641 = isnan(_1597);
        bool _1643 = _1639 || _1641;
        bool _1645 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1647 = _1643 || _1645;
        if (!_1647)
        {
            float _1649 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1651 = _1597 + _1649;
            float _1653 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1655 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1653;
            float _1657 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1659 = _1657 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1661 = 1.0 / _1655;
            float _1663 = _1651 * _1661;
            float _1665 = fma(_1663, _1659, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1637 = _1665;
            _1667 = true;
        }
        else
        {
            bool _1669 = _1597 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1671 = isnan(_1597);
            bool _1673 = _1669 || _1671;
            bool _1675 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1677 = _1673 || _1675;
            if (!_1677)
            {
                float _1679 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1681 = _1597 + _1679;
                float _1683 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1685 = _1683 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1687 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1689 = _1687 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1691 = 1.0 / _1685;
                float _1693 = _1681 * _1691;
                float _1695 = fma(_1693, _1689, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1637 = _1695;
                _1667 = true;
            }
            else
            {
                _1637 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1667 = false;
    float _1697 = _1637;
    float _1699 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1701 = _1543 + _1699;
    float _1703 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1705 = _1211 + _1703;
    float _1707 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1709 = _1215 + _1707;
    float _1711 = fma(_1701, _1697, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1713 = fma(_1705, _1697, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1715 = fma(_1709, _1697, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1717 = -_1125;
    float _1719 = _1717 + _1711;
    float _1721 = -_1093;
    float _1723 = _1721 + _1713;
    float _1725 = -_1089;
    float _1727 = _1725 + _1715;
    float _1729 = _1719 * _1719;
    float _1731 = fma(_1723, _1723, _1729);
    float _1733 = fma(_1727, _1727, _1731);
    float _1735 = sqrt(_1733);
    bool _1737 = _1735 > 0.0;
    float _1739 = _1723;
    if (!_1737)
    {
        _1627 = _1713;
    }
    float _1741 = _1627;
    float _1743 = _1741;
    if (!_1737)
    {
        _1629 = _1711;
    }
    float _1745 = _1629;
    float _1747 = _1745;
    float _1749 = _1745;
    if (!_1737)
    {
        _1631 = _1715;
    }
    float _1751 = _1631;
    bool _1753 = !_1737;
    float _1755 = _1751;
    float _1757 = _1751;
    if (!_1753)
    {
        float _1759 = _209 * _209;
        float _1761 = fma(_207, _207, _1759);
        float _1763 = rsqrt(_1733);
        float _1765 = fma(_211, _211, _1761);
        float _1767 = sqrt(_1765);
        float _1769 = _1723 * _1763;
        float _1771 = _1719 * _1763;
        float _1773 = _1727 * _1763;
        bool _1775 = _1767 > 0.0;
        float _1777 = _1767;
        if (!_1775)
        {
            _1777 = _1713;
        }
        float _1779 = _1777;
        _1743 = _1779;
        if (!_1775)
        {
            _1747 = _1711;
        }
        float _1781 = _1747;
        _1749 = _1781;
        if (!_1775)
        {
            _1755 = _1715;
        }
        float _1783 = _1755;
        bool _1785 = !_1775;
        _1757 = _1783;
        if (!_1785)
        {
            float _1787 = rsqrt(_1765);
            float _1789 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1791 = _209 * _1787;
            float _1793 = _207 * _1787;
            float _1795 = _211 * _1787;
            float _1797 = _1771 * _1791;
            float _1799 = fma(_1769, _1793, _1797);
            float _1801 = _1789 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1803 = fma(_1773, _1795, _1799);
            float _1805 = _1803 * _1801;
            float _1807 = fma(_207, _1805, _1713);
            float _1809 = fma(_209, _1805, _1711);
            float _1811 = fma(_211, _1805, _1715);
            _1749 = _1809;
            _1743 = _1807;
            _1757 = _1811;
            _1739 = _1801;
        }
    }
    float _1813 = _1749;
    float _1815 = _1743;
    float _1817 = _1757;
    float _1819 = _1739;
    float _1821 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1823 = _1813 + _1821;
    float _1825 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1827 = _1815 + _1825;
    float _1829 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1831 = _1817 + _1829;
    float _1833 = _1823 * _1823;
    float _1835 = fma(_1827, _1827, _1833);
    float _1837 = fma(_1831, _1831, _1835);
    float _1839 = rsqrt(_1837);
    float _1841 = sqrt(_1837);
    float _1843 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1845 = _1827 * _1843;
    float _1847 = _1831 * _1843;
    float _1849 = _1845 * _1845;
    float _1851 = _1847 * _1847;
    float _1853 = _1849 + _1851;
    float _1855 = sqrt(_1853);
    bool _1857 = _1855 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1861 = _1855 + _1859;
    float _1863 = _1839;
    float _1865 = _1819;
    float _1867 = _1861;
    float _1869 = _1823;
    float _1871 = _1845;
    if (_1857)
    {
        float _1873 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1863 = _1873;
    }
    float _1875 = _1863;
    if (_1857)
    {
        float _1877 = rsqrt(_1853);
        _1865 = _1877;
    }
    float _1879 = _1865;
    float _1881 = _1879;
    if (_1857)
    {
        float _1883 = _1861 * _1875;
        _1867 = _1883;
    }
    float _1885 = _1867;
    if (_1857)
    {
        float _1887 = _1885 * 0.15915493667125701904296875;
        _215 = _1887;
    }
    float _1889 = _215;
    float _1891 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1893 = _1875;
    if (_1857)
    {
        float _1895 = _1889 * 6.283185482025146484375;
        float _1897 = sin(_1895);
        _1893 = _1897;
    }
    float _1899 = _1893;
    float _1901 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1903 = precise::max(0.0, _1901);
    float _1905 = _1831;
    float _1907 = _1903;
    if (_1857)
    {
        float _1909 = _1889 * 6.283185482025146484375;
        float _1911 = cos(_1909);
        _1905 = _1911;
    }
    float _1913 = _1905;
    float _1915 = -_1843;
    float _1917 = -_1903;
    float _1919 = fma(_1823, _1915, _1917);
    if (!_1857)
    {
        _1869 = _1847;
    }
    float _1921 = _1869;
    float _1923 = _1921;
    if (_1857)
    {
        float _1925 = _1919 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1907 = _1925;
    }
    float _1927 = _1907;
    float _1929 = _1899;
    float _1931 = _1927;
    if (_1857)
    {
        float _1933 = fma(_1899, _1927, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _217 = _1933;
    }
    float _1935 = _217;
    float _1937 = _1935;
    if (!_1857)
    {
        _1929 = _1919;
    }
    float _1939 = _1929;
    float _1941 = _1939;
    float _1943 = _1913;
    if (_1857)
    {
        float _1945 = _1913 + (-1.0);
        _1931 = _1945;
    }
    float _1947 = _1931;
    float _1949 = _1947;
    if (_1857)
    {
        float _1951 = _1879 * _1935;
        _1937 = _1951;
    }
    float _1953 = _1937;
    if (_1857)
    {
        float _1955 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1881 = _1955;
    }
    float _1957 = _1881;
    if (_1857)
    {
        float _1959 = _1845 * _1953;
        _1871 = _1959;
    }
    float _1961 = _1871;
    if (!_1857)
    {
        _1949 = _1849;
    }
    float _1963 = _1949;
    float _1965 = _1963;
    if (_1857)
    {
        float _1967 = _1847 * _1953;
        _1923 = _1967;
    }
    float _1969 = _1923;
    if (_1857)
    {
        float _1971 = fma(_1919, _1913, _1957);
        _1941 = _1971;
    }
    float _1973 = _1941;
    if (_1857)
    {
        float _1975 = _1961 * _1961;
        _1965 = _1975;
    }
    float _1977 = _1965;
    if (!_1857)
    {
        _1943 = _1851;
    }
    float _1979 = _1943;
    float _1981 = _1979;
    if (_1857)
    {
        float _1983 = _1969 * _1969;
        _1981 = _1983;
    }
    float _1985 = _1981;
    float _1987 = _1813 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1989 = fma(_1973, _1973, _1977);
    float _1991 = _1813 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1993 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1987);
    float _1995 = _1989 + _1985;
    float _1997 = _1813 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1999 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2001 = fma(_1841, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1999);
    float _2003 = precise::clamp(_2001, 0.0, 1.0);
    float _2005 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1993);
    float _2007 = rsqrt(_1995);
    float _2009 = _1813 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2011 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1997);
    float _2013 = -_2003;
    float _2015 = _2013 + 1.0;
    float _2017 = _2005 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2019 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2009);
    float _2021 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2011);
    float _2023 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1991);
    float _2025 = _2017 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2027 = abs(_2015);
    float _2029 = log2(_2027);
    float _2031 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2019);
    float _2033 = _2021 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2035 = -_2025;
    float _2037 = fma(_2035, _1891, 1.0);
    float _2039 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2023);
    float _2041 = _2031 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2043 = _2007 * _1961;
    float _2045 = _2033 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2047 = _2007 * _1973;
    float _2049 = _2007 * _1969;
    float _2051 = _2043 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2053 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2045);
    float _2055 = _2039 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2057 = log2(_2037);
    float _2059 = -_2051;
    float _2061 = fma(_2047, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2059);
    float _2063 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2053);
    float _2065 = _2029 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2067 = _2033 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2069 = -_2049;
    float _2071 = fma(_2069, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2061);
    float _2073 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2063);
    float _2075 = _2033 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2077 = exp2(_2065);
    float _2079 = fma(_2071, -0.5, 0.5);
    float _2081 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2067);
    float _2083 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2075);
    float _2085 = fma(_2071, 0.5, 0.5);
    float _2087 = _2047 + 1.0;
    float _2089 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2081);
    float _2091 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2083);
    float _2093 = 1.0 / _2073;
    float _2095 = fma(_2085, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2097 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2089);
    float _2099 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2091);
    float _2101 = _2057 * 0.693147182464599609375;
    float _2103 = fma(_2085, _2095, -0.212114393711090087890625);
    float _2105 = sqrt(_2079);
    float _2107 = -_2047;
    float _2109 = fma(_2077, _2087, _2107);
    float _2111 = fma(_2085, _2103, 1.570728778839111328125);
    float _2113 = _2101 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2115 = fma(_2109, 0.5, 0.5);
    float _2117 = _2099 * _2093;
    float _2119 = _2097 * _2093;
    float _2121 = fma(_2117, 0.5, 0.5);
    float _2123 = fma(_2119, -0.5, 0.5);
    float _2125 = _2105 * 0.636619746685028076171875;
    float3 _6061 = float3(_2121, _2123, _2113);
    float _2127 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6061, float3(0.0), isnan(_6061)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6061, float3(0.0), isnan(_6061)), level(0.0)).x;
    float3 _6072 = float3(_2121, _2123, _2113);
    float4 _2130 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6072, float3(0.0), isnan(_6072)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6072, float3(0.0), isnan(_6072)), level(0.0)).xyzw;
    float _2132 = _2130.x;
    float _2134 = _2130.y;
    float _2136 = _2130.z;
    float _2138 = _2130.w;
    float _2140 = -_2111;
    float _2142 = fma(_2125, _2140, 1.0);
    float2 _6093 = float2(_2142, _2115);
    float3 _2144 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6093, float2(0.0), isnan(_6093)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6093, float2(0.0), isnan(_6093)), level(0.0)).xyz;
    float _2146 = _2144.x;
    float _2148 = _2144.y;
    float _2150 = _2144.z;
    float _2152 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2154 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2156 = _2033 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2158 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2152);
    float _2160 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2154);
    float _2162 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2156);
    float _2164 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2158);
    float _2166 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2160);
    float _2168 = -_1239;
    float _2170 = _2168 + 1.0;
    float _2172 = _2164 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2174 = _2166 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2176 = 1.0 / _2172;
    float _2178 = _2174 + _2172;
    bool _2180 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2182 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2184 = _2180 || _2182;
    bool _2186 = isnan(0.5);
    bool _2188 = _2184 || _2186;
    float _2190 = in.m_84.x;
    float _2192 = _2178 * _2176;
    float _2194 = _2192 * 0.5;
    float _2196 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2198 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2196);
    float _2200 = 1.0 / _2198;
    float _2202 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2204 = _2200 * _2202;
    float _2206 = abs(_2204);
    float _2208 = log2(_2206);
    bool _2210 = _2204 <= 8000.0;
    bool _2212 = isnan(_2204);
    bool _2214 = _2210 || _2212;
    bool _2216 = isnan(8000.0);
    bool _2218 = _2214 || _2216;
    float _2220 = float(_2218);
    float _2222 = _2204;
    float _2224 = _2055;
    float _2226 = _2073;
    float _2228 = _2097;
    float _2230 = _2138;
    float _2232 = _2136;
    if (!_2188)
    {
        float _2234 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2236 = _2204 + _2234;
        _2222 = _2236;
    }
    float _2238 = _2222;
    float _2240 = _2208 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2242 = exp2(_2240);
    float _2244 = fma(_2242, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2246 = precise::clamp(_2244, 0.0, 1.0);
    float _2248 = _2242;
    if (!_2188)
    {
        _2248 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2250 = _2248;
    float _2252 = fma(_2246, -2.0, 3.0);
    float _2254 = _2246 * _2246;
    float _2256 = _2250;
    if (!_2188)
    {
        float _2258 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2260 = _2250 + _2258;
        _2256 = _2260;
    }
    float _2262 = _2256;
    float _2264 = _2254 * _2252;
    float _2266 = 2.0;
    if (!_2188)
    {
        float _2268 = 1.0 / _2262;
        _2266 = _2268;
    }
    float _2270 = _2266;
    float _2272 = -_2264;
    float _2274 = _2272 + 1.0;
    float _2276 = fma(_2274, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2264);
    float _2278 = _2029 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2280 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2162);
    float _2282 = _2220 * _2276;
    float _2284 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2280);
    float _2286 = exp2(_2278);
    float _2288 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2290 = _2284;
    float _2292 = _2099;
    if (_2188)
    {
        _2224 = 1.0;
    }
    float _2294 = _2224;
    float _2296 = _2294;
    if (!_2188)
    {
        float _2298 = _2238 * _2270;
        float _2300 = precise::clamp(_2298, 0.0, 1.0);
        _2296 = _2300;
    }
    float _2302 = _2296;
    bool _2304 = _1841 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2306 = isnan(_1841);
    bool _2308 = _2304 || _2306;
    bool _2310 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2312 = _2308 || _2310;
    float _2314 = _2170 * _2288;
    float _2316 = precise::clamp(_2314, 0.0, 1.0);
    out.gl_Position.x = _2099;
    out.gl_Position.y = _2097;
    out.gl_Position.z = _2284;
    out.gl_Position.w = _2073;
    float _2318 = -_2316;
    float _2320 = fma(_2318, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2322 = _2284 + _2073;
    float _2324 = _2320 * _2190;
    float _2326 = _2322 * 0.5;
    float _2328 = -_2286;
    float _2330 = _2328 + 1.0;
    float _2332 = _2324 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2334 = _2330 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_86.z = _2326;
    out.m_86.w = _2073;
    if (!_2312)
    {
        _2226 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2336 = _2226;
    float _2338 = _2336;
    float _2340 = _2336;
    if (!_2312)
    {
        _2290 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2342 = _2290;
    out.m_88.x = _2332;
    float _2344 = _2342;
    float _2346 = _2342;
    if (!_2312)
    {
        _2228 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2348 = _2228;
    float _2350 = _2348;
    float _2352 = _2348;
    if (!_2312)
    {
        _2292 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2354 = _2292;
    float _2356 = _2302 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2358 = _2334 * _2127;
    float _2360 = -_2334;
    float _2362 = _2360 + 1.0;
    float _2364 = _2138 * _2358;
    float _2366 = _2150 * _2358;
    float _2368 = fma(_2146, _2364, _2132);
    float _2370 = fma(_2148, _2364, _2134);
    float _2372 = _2138 * _2362;
    float _2374 = fma(_2138, _2366, _2136);
    float _2376 = _2354;
    float _2378 = _2354;
    if (!_2312)
    {
        _2230 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2380 = _2230;
    float _2382 = _2380;
    float _2384 = _2380;
    if (!_2312)
    {
        _2232 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2386 = _2232;
    out.m_90.x = _2368;
    out.m_90.y = _2370;
    out.m_90.z = _2374;
    out.m_90.w = _2372;
    bool _2388 = !_2312;
    float _2390 = _2386;
    float _2392 = _2386;
    if (!_2388)
    {
        bool _2394 = _1841 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2396 = isnan(_1841);
        bool _2398 = _2394 || _2396;
        bool _2400 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2402 = _2398 || _2400;
        if (!_2402)
        {
            float _2404 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2406 = _1841 + _2404;
            float _2408 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2410 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2408;
            float _2412 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2414 = _2412 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2416 = 1.0 / _2410;
            float _2418 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2420 = _2418 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2422 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2424 = _2422 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2428 = _2426 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2430 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2432 = _2430 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2434 = _2406 * _2416;
            float _2436 = precise::clamp(_2434, 0.0, 1.0);
            float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2440 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2442 = fma(_2436, _2414, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2444 = fma(_2436, _2440, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2446 = fma(_2436, _2420, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2448 = fma(_2436, _2424, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2450 = fma(_2436, _2428, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2452 = fma(_2436, _2432, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2392 = _2446;
            _2352 = _2450;
            _2384 = _2442;
            _2346 = _2448;
            _2340 = _2444;
            _2378 = _2452;
            _2454 = true;
        }
        else
        {
            bool _2456 = _1841 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2458 = isnan(_1841);
            bool _2460 = _2456 || _2458;
            bool _2462 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2464 = _2460 || _2462;
            if (!_2464)
            {
                _2382 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2466 = _2382;
            _2384 = _2466;
            if (!_2464)
            {
                _2390 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2468 = _2390;
            _2392 = _2468;
            if (!_2464)
            {
                _2338 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2470 = _2338;
            _2340 = _2470;
            if (!_2464)
            {
                _2344 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2472 = _2344;
            _2346 = _2472;
            if (!_2464)
            {
                _2350 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2474 = _2350;
            _2352 = _2474;
            if (!_2464)
            {
                _2376 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2476 = _2376;
            bool _2478 = !_2464;
            _2378 = _2476;
            if (!_2478)
            {
                bool _2480 = _1841 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2482 = isnan(_1841);
                bool _2484 = _2480 || _2482;
                bool _2486 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2488 = _2484 || _2486;
                if (!_2488)
                {
                    float _2490 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2492 = _1841 + _2490;
                    float _2494 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2496 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2494;
                    float _2498 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2500 = _2498 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2502 = 1.0 / _2496;
                    float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2506 = _2504 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2510 = _2508 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2512 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2514 = _2512 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2518 = _2516 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2520 = _2492 * _2502;
                    float _2522 = precise::clamp(_2520, 0.0, 1.0);
                    float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2528 = fma(_2522, _2500, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2530 = fma(_2522, _2526, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2532 = fma(_2522, _2506, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2534 = fma(_2522, _2510, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2536 = fma(_2522, _2514, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2538 = fma(_2522, _2518, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2392 = _2532;
                    _2352 = _2536;
                    _2384 = _2528;
                    _2346 = _2534;
                    _2340 = _2530;
                    _2378 = _2538;
                    _2454 = true;
                }
                else
                {
                    _2392 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2352 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2384 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2346 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2340 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2378 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2454 = false;
    float _2540 = _2392;
    float _2542 = _2352;
    float _2544 = _2384;
    float _2546 = _2346;
    float _2548 = _2340;
    float _2550 = _2378;
    float _2552 = _2356 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2554 = fma(_1613, -0.5, 0.5);
    float _2556 = precise::clamp(_2554, 0.0, 1.0);
    float _2558 = -_2540;
    float _2560 = _2558 + _2542;
    float _2562 = -_2544;
    float _2564 = _2562 + _2546;
    out.m_53.x = _2552;
    float _2566 = fma(_2556, _2560, _2540);
    float _2568 = -_2548;
    float _2570 = _2568 + _2550;
    float _2572 = fma(_2556, _2564, _2544);
    float _2574 = _2566 * 0.586610972881317138671875;
    bool _2576 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2578 = fma(_2556, _2570, _2548);
    out.m_92.x = 0.0;
    float _2580 = fma(_2572, 0.298911988735198974609375, _2574);
    bool _2582 = _2302 > 0.0;
    bool _2584 = isnan(_2302);
    bool _2586 = _2582 || _2584;
    bool _2588 = isnan(0.0);
    bool _2590 = _2586 || _2588;
    float _2592 = fma(_2578, 0.114477999508380889892578125, _2580);
    float _2594 = -_2592;
    float _2596 = _2572 + _2594;
    float _2598 = -_2592;
    float _2600 = _2566 + _2598;
    float _2602 = -_2592;
    float _2604 = _2578 + _2602;
    float _2606 = fma(_2596, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2592);
    float _2608 = fma(_2600, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2592);
    float _2610 = fma(_2604, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2592);
    bool _2612 = !_2576;
    if (!_2612)
    {
        float _2614 = -_1813;
        float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2618 = -_1815;
        float _2620 = _2618 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2622 = -_1817;
        float _2624 = _2622 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2626 = _2616 * _2616;
        float _2628 = fma(_2620, _2620, _2626);
        float _2630 = fma(_2624, _2624, _2628);
        float _2632 = sqrt(_2630);
        float _2634 = rsqrt(_2630);
        float _2636 = -_2632;
        float _2638 = _2636 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2640 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2642 = precise::clamp(_2640, 0.0, 1.0);
        float _2644 = _2620 * _2634;
        float _2646 = _2616 * _2634;
        float _2648 = abs(_2642);
        float _2650 = log2(_2648);
        float _2652 = _2624 * _2634;
        float _2654 = _2644 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2656 = _1613 * _2646;
        float _2658 = -_2646;
        float _2660 = -_2654;
        float _2662 = fma(_2658, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2660);
        float _2664 = fma(_1611, _2644, _2656);
        float _2666 = -_2652;
        float _2668 = fma(_2666, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2662);
        float _2670 = fma(_1615, _2652, _2664);
        float _2672 = precise::clamp(_2670, 0.0, 1.0);
        float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2676 = _2668 + _2674;
        float _2678 = _2650 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2680 = _2676 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2682 = precise::clamp(_2680, 0.0, 1.0);
        float _2684 = exp2(_2678);
        float _2686 = _2684 * _2682;
        float _2688 = _2672 * _2686;
        float _2690 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2692 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2694 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2690;
        out.m_92.y = _2692;
        out.m_92.z = _2694;
    }
    out.m_94.x = _2606;
    out.m_94.y = _2608;
    out.m_94.z = _2610;
    if (_2590)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2696 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2696;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

