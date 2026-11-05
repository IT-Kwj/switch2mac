#pragma clang diagnostic ignored "-Wmissing-prototypes"

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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_C [[id(6)]];
    sampler vp_t_tcb_CSmplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_32Smplr_w [[id(14)]];
    sampler vp_t_tcb_30Smplr_w [[id(15)]];
    sampler vp_t_tcb_1CSmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_59 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_71 [[user(locn5)]];
    float4 m_47 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_65 [[user(locn8)]];
    float4 m_73 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_51 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
};

static inline __attribute__((always_inline))
int _88(thread const int& _5354, thread const int& _5355, constant _10& support_buffer)
{
    float _5358 = as_type<float>(support_buffer._m4);
    int _5360 = _5355 + as_type<int>(_5358);
    int _5362 = 1 + _5360;
    float _5364 = support_buffer._m5[_5362].x;
    float _5366 = abs(_5364);
    bool _5368 = _5366 == 1.0;
    if (_5368)
    {
        return _5354;
    }
    float _5370 = float(_5354);
    float _5372 = _5370 / _5366;
    int _5374 = int(_5372);
    return _5374;
}

static inline __attribute__((always_inline))
int _89(thread const int& _5404, thread const int& _5405, constant _10& support_buffer)
{
    float _5408 = as_type<float>(support_buffer._m4);
    int _5410 = _5405 + as_type<int>(_5408);
    int _5412 = 1 + _5410;
    float _5414 = support_buffer._m5[_5412].x;
    bool _5416 = _5414 == 1.0;
    if (_5416)
    {
        return _5404;
    }
    float _5418 = float(_5404);
    float _5420 = _5418 * _5414;
    int _5422 = int(_5420);
    return _5422;
}

static inline __attribute__((always_inline))
void _86(thread int& _5351, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    _5351 = 0;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _747 = false;
    bool _587 = false;
    bool _453 = false;
    bool _293 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _97 = int(_95);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _103;
    if (!_101)
    {
        out.m_47.x = 0.0;
    }
    int _107 = 0;
    if (!_101)
    {
        float _109 = _105 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2143 = as_type<float>(_111);
        out.gl_Position.z = _2143;
    }
    if (!_101)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _115 = in.m_49.w;
    float _117 = float(_97);
    float _119 = in.m_51.x;
    float _121 = -_115;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_115);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    out.m_53.x = _119;
    bool _135 = _123 >= _117;
    bool _137 = !_133;
    bool _139 = _135 || _137;
    float _141 = 1.0 / _117;
    float _143 = _115;
    if (_139)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_139)
    {
        out.m_47.x = 0.0;
    }
    float _147 = _123 * _141;
    if (_139)
    {
        float _149 = _145 * 5.0;
        _113 = as_type<int>(_149);
    }
    int _151 = _113;
    out.m_55.x = _147;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2218 = as_type<float>(_151);
        out.gl_Position.z = _2218;
    }
    if (_139)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _153 = in.m_57.w;
    float _155 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = in.m_49.x;
    float _169 = in.m_49.y;
    float _171 = in.m_49.z;
    float _173 = in.m_44.x;
    float _175 = in.m_44.y;
    float _177 = in.m_44.z;
    float _179 = 0.0;
    float _181 = _155;
    if (!_165)
    {
        float _183 = _155 * _155;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    float _189 = _187;
    if (!_165)
    {
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _191;
    }
    float _193 = _189;
    bool _195 = !_165;
    float _197 = _193;
    if (!_195)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _155 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _155);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _227;
    }
    float _229 = _197;
    bool _231 = !_165;
    if (!_231)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = 1.0 / _239;
        float _243 = _155 * _235;
        float _245 = exp2(_243);
        float _247 = -_245;
        float _249 = _247 + 1.0;
        float _251 = _249 * _241;
        _181 = _251;
    }
    float _253 = _181;
    bool _255 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _257 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _259 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _261 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _263 = fma(_253, _167, _257);
    float _265 = fma(_253, _169, _259);
    float _267 = fma(_253, _171, _261);
    float _269 = fma(_263, _153, _173);
    float _271 = fma(_265, _153, _175);
    float _273 = fma(_267, _153, _177);
    bool _275 = !_255;
    float _291;
    if (!_275)
    {
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _279 = _119 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _283 = _281 * _277;
        float _285 = floor(_283);
        float _287 = -_285;
        float _289 = _283 + _287;
        _291 = _289;
        _293 = true;
    }
    else
    {
        _291 = _147;
    }
    _293 = false;
    float _295 = _291;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _299 = _295 + _297;
    bool _301 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _303 = isnan(_295);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _315 = _295 + _313;
    bool _317 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _319 = isnan(_295);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _337 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _339 = isnan(_295);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -_311;
    float _351 = _349 + 1.0;
    float _353 = 1.0 / _335;
    float _355 = _347 * _351;
    float _357 = -_347;
    float _359 = _357 + 1.0;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _361;
    bool _365 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _367 = 1.0 / _331;
    float _369 = _327 * _359;
    float _371 = -_327;
    float _373 = _371 + 1.0;
    float _375 = _315 * _353;
    float _377 = _299 * _367;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _383;
    float _387 = fma(_363, _377, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _389 = fma(_381, _377, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _391 = fma(_385, _377, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _393 = _387 * _369;
    float _395 = _389 * _369;
    float _397 = _391 * _369;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _411 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[107].x, _393);
    float _413 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[107].y, _395);
    float _415 = fma(_401, _375, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _417 = fma(_405, _375, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _419 = fma(_409, _375, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _421 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[107].z, _397);
    float _423 = fma(_415, _355, _411);
    float _425 = fma(_417, _355, _413);
    float _427 = fma(_419, _355, _421);
    float _429 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[109].x, _423);
    float _431 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[109].y, _425);
    float _433 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[109].z, _427);
    bool _435 = !_365;
    float _451;
    if (!_435)
    {
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _439 = _119 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _443 = _441 * _437;
        float _445 = floor(_443);
        float _447 = -_445;
        float _449 = _443 + _447;
        _451 = _449;
        _453 = true;
    }
    else
    {
        _451 = _147;
    }
    _453 = false;
    float _455 = _451;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _459 = _455 + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _465 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _467 = isnan(_455);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _481 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _483 = isnan(_455);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _493;
    bool _497 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _499 = isnan(_455);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = 1.0 / _463;
    float _511 = -_475;
    float _513 = _511 + 1.0;
    bool _515 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _517 = _491 * _513;
    float _519 = -_491;
    float _521 = _519 + 1.0;
    float _523 = 1.0 / _479;
    float _525 = _495 * _509;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _531 = fma(_525, _459, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _533 = _529 * _523;
    float _535 = _531 * _517;
    float _537 = -_507;
    float _539 = _537 + 1.0;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _543 = _455 + _541;
    float _545 = _429 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _547 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[115].x, _535);
    float _549 = _475 * _539;
    float _551 = fma(_533, _543, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _553 = _433 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _555 = _545 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _557 = fma(_551, _549, _547);
    float _559 = _431 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _561 = _553 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _563 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[117].x, _557);
    float _565 = _559 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _567 = _563 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _555;
    out.m_59.y = _565;
    out.m_59.z = _561;
    out.m_59.w = _567;
    bool _569 = !_515;
    float _585;
    if (!_569)
    {
        float _571 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _573 = _119 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _575 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _577 = _575 * _571;
        float _579 = floor(_577);
        float _581 = -_579;
        float _583 = _577 + _581;
        _585 = _583;
        _587 = true;
    }
    else
    {
        _585 = _147;
    }
    _587 = false;
    float _589 = _585;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _593 = _589 + _591;
    bool _595 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _597 = isnan(_589);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _609 = _589 + _607;
    bool _611 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _613 = isnan(_589);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _631 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _633 = isnan(_589);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = -_605;
    float _645 = _643 + 1.0;
    float _647 = 1.0 / _629;
    float _649 = _641 * _645;
    float _651 = -_641;
    float _653 = _651 + 1.0;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _655;
    bool _659 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _661 = 1.0 / _625;
    float _663 = _621 * _653;
    float _665 = -_621;
    float _667 = _665 + 1.0;
    float _669 = _609 * _647;
    float _671 = _593 * _661;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _677;
    float _681 = fma(_657, _671, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _683 = fma(_675, _671, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _685 = fma(_679, _671, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _687 = _681 * _663;
    float _689 = _683 * _663;
    float _691 = _685 * _663;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _705 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[123].x, _687);
    float _707 = fma(_695, _669, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _709 = fma(_699, _669, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _711 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[123].y, _689);
    float _713 = fma(_703, _669, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _715 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[123].z, _691);
    float _717 = fma(_707, _649, _705);
    float _719 = fma(_709, _649, _711);
    float _721 = fma(_713, _649, _715);
    float _723 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[125].x, _717);
    float _725 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[125].y, _719);
    float _727 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[125].z, _721);
    bool _729 = !_659;
    float _745;
    if (!_729)
    {
        float _731 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _733 = _119 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _735 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _737 = _735 * _731;
        float _739 = floor(_737);
        float _741 = -_739;
        float _743 = _737 + _741;
        _745 = _743;
        _747 = true;
    }
    else
    {
        _745 = _147;
    }
    _747 = false;
    float _749 = _745;
    int _751 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _753 = _751;
    int _755 = 0;
    int _757 = _88(_753, _755, (*spvDescriptorSet0.support_buffer));
    float _759 = in.m_61.z;
    float _761 = 0.0 + _147;
    float _763 = precise::clamp(_761, 0.0, 1.0);
    float _765 = trunc(_759);
    int _767 = int(_765);
    int _769 = _757 + (-1);
    float _771 = float(_769);
    float _773 = _763 * _771;
    float _775 = trunc(_773);
    int _777 = int(_775);
    int _779 = _777;
    int _781 = 0;
    int _783 = _89(_779, _781, (*spvDescriptorSet0.support_buffer));
    int _785 = _767;
    int _787 = 0;
    int _789 = _89(_785, _787, (*spvDescriptorSet0.support_buffer));
    float4 _792 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_783, _789)), 0).xyzw;
    float _794 = _792.x;
    float _796 = _792.y;
    float _798 = _792.z;
    float _800 = _792.w;
    float _802 = in.m_51.z;
    float _804 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _808 = _806 != 0;
    float _810 = in.m_61.x;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _816 = in.m_61.y;
    int _818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _820 = _818 != 0;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _824 = _822 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _826 = 1.0 / _814;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _830 = _828 != 0;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _834 = _832 != 0;
    float _836 = _119 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _838 = 0.0;
    float _840 = _810;
    if (_808)
    {
        float _842 = in.m_51.z;
        _838 = _842;
    }
    float _844 = _838;
    float _846 = 1.0 / _824;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _852 = _850 != 0;
    float _854 = -_848;
    float _856 = fma(_836, 2.0, _854);
    bool _858 = _802 > 0.5;
    bool _860 = _858 && _834;
    float _862 = in.m_51.y;
    bool _864 = _749 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _866 = isnan(_749);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _876;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _884 = _749 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _886 = isnan(_749);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _898 = _878 * _826;
    bool _900 = _749 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _902 = isnan(_749);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = _882 * _846;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _916 = _749 + _914;
    float _918 = -_910;
    float _920 = _918 + 1.0;
    float _922 = _816;
    float _924 = _874;
    bool _926 = _860;
    if (_860)
    {
        float _928 = -_816;
        float _930 = _928 + 1.0;
        _922 = _930;
    }
    float _932 = _922;
    bool _934 = false;
    if (_808)
    {
        bool _936 = _844 > 0.5;
        _934 = _936;
    }
    bool _938 = _934;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _942 = _749 + _940;
    float _944 = fma(_898, _916, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _946 = _874 * _920;
    float _948 = _804 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _950 = fma(_912, _942, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _952 = -_874;
    float _954 = _952 + 1.0;
    float _956 = _954;
    int _958 = as_type<int>(_944);
    if (!_820)
    {
        _924 = _810;
    }
    float _960 = _924;
    float _962 = fma(_948, _932, -0.5);
    float _964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _966 = _894 * _954;
    float _968 = _960;
    float _970 = _966;
    if (!_820)
    {
        _956 = _960;
    }
    float _972 = _956;
    float _974 = -_894;
    float _976 = _974 + 1.0;
    float _978 = _972;
    float _980 = _976;
    if (_820)
    {
        _968 = _810;
    }
    float _982 = _968;
    float _984 = _944 * _966;
    float _986 = _982;
    if (_820)
    {
        bool _988 = _119 > 0.5;
        _926 = _988;
    }
    bool _990 = _926;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _994 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _996 = _990;
    if (_820)
    {
        float _998 = -_982;
        float _1000 = _998 + 1.0;
        _958 = as_type<int>(_1000);
    }
    int _1002 = _958;
    int _1004 = 0;
    if (_808)
    {
        float _1006 = -_982;
        float _1008 = _1006 + 1.0;
        _1004 = as_type<int>(_1008);
    }
    int _1010 = _1004;
    int _1012 = 0;
    if (_830)
    {
        float _1014 = -_982;
        float _1016 = _1014 + 1.0;
        _1012 = as_type<int>(_1016);
    }
    int _1018 = _1012;
    float _1020 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[131].x, _984);
    bool _1022 = _862 > 0.5;
    float _1024 = _862;
    if (!_808)
    {
        _970 = _982;
    }
    float _1026 = _970;
    float _1028 = _1026;
    if (_820)
    {
        float _1030 = _990 ? as_type<float>(_1002) : _982;
        _978 = _1030;
    }
    float _1032 = _978;
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1036 = _1034;
    if (_808)
    {
        float _1038 = _938 ? as_type<float>(_1010) : _982;
        _1028 = _1038;
    }
    float _1040 = _1028;
    if (_830)
    {
        float _1042 = _1022 ? as_type<float>(_1018) : _982;
        _986 = _1042;
    }
    float _1044 = _986;
    float _1046 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1034);
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    if (_852)
    {
        _996 = false;
    }
    bool _1050 = _996;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _1054 = _1050;
    if (_852)
    {
        _840 = _119;
    }
    float _1056 = _840;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1060 = _1056;
    if (_852)
    {
        _1036 = _862;
    }
    float _1062 = _1036;
    float _1064 = _1062;
    if (!_852)
    {
        float _1066 = _119 * 3.1415927410125732421875;
        float _1068 = _1066 * 0.15915493667125701904296875;
        float _1070 = _862 * 3.1415927410125732421875;
        float _1072 = _1070 * 0.15915493667125701904296875;
        float _1074 = _1068 * 6.283185482025146484375;
        float _1076 = sin(_1074);
        float _1078 = _1072 * 6.283185482025146484375;
        float _1080 = sin(_1078);
        _1060 = _1076;
        _1054 = true;
        _1064 = _1080;
        _980 = _1072;
    }
    float _1082 = _1060;
    bool _1084 = _1054;
    float _1086 = _1064;
    float _1088 = _980;
    float _1090 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[93].z, _992);
    float _1092 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1094 = _1088;
    if (_1084)
    {
        _1094 = _862;
    }
    float _1096 = _1094;
    float _1098 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1058);
    float _1100 = _1096;
    if (!_1084)
    {
        _1100 = _119;
    }
    float _1102 = _1100;
    float _1104 = -_1048;
    float _1106 = fma(_1092, 2.0, _1104);
    if (!_1084)
    {
        _1024 = _119;
    }
    float _1108 = _1024;
    float _1110 = _994 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1112 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    uint _1115 = as_type<uint>(half2(float2(_800, 0.0)));
    float _1117 = fma(_950, _946, _1020);
    float _1119 = fma(_1110, _1040, -0.5);
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1123 = fma(_1112, -2.0, _1052);
    float _1125 = _896 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1127 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1121);
    uint _1129 = extract_bits(_1115, 0u, 8u);
    int _1131 = int(_1129) & 255;
    uint _1133 = extract_bits(_1115, 8u, 8u);
    int _1135 = int(_1133) & 255;
    int _1137 = _1135 << 8;
    int _1139 = _1131 | _1137;
    float _1141 = fma(_1125, _1044, -0.5);
    float _1143 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1098);
    float _1145 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1123);
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1149 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1151 = _1139 >= 32768;
    float _1153 = _964 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1155 = -_1145;
    float _1157 = fma(_1143, _962, _1155);
    float _1159 = -_1147;
    float _1161 = fma(_1149, 2.0, _1159);
    float _1163 = -_123;
    float _1165 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1106);
    float _1167 = fma(_1153, _1032, -0.5);
    float _1169 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1090);
    float _1171 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1046);
    float _1173 = -_123;
    float _1175 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[76].x, _856);
    float _1177 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1127);
    float _1179 = -_123;
    float _1181 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1161);
    float _1183 = _725 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1185 = fma(_1171, _1167, _1175);
    float _1187 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1117);
    float _1189 = fma(_1177, _1119, _1181);
    int _1191 = _1139 + (-1024);
    float _1193 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1195 = _1191;
    if (_1151)
    {
        int _1197 = ~_1139;
        int _1199 = _1197 + 33792;
        int _1201 = _1199 + 1;
        _1195 = _1201;
    }
    int _1203 = _1195;
    float _1205 = fma(_1169, _1141, _1165);
    float _1207 = _723 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1209 = _1203 + 30719;
    float _1211 = _727 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1213 = _1187 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1215 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1217 = float(_1209);
    float _1219 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1221 = _1205 + 0.5;
    float _1223 = _1157 + 0.5;
    int _1225 = _777 + 1;
    float _1227 = fma(_1217, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    out.m_63.x = _1215;
    out.m_63.y = _1193;
    out.m_63.z = _1219;
    out.m_63.w = _1213;
    int _1229 = min(_769, _1225);
    float _1231 = abs(_1227);
    float _1233 = -_1231;
    float _1235 = _1233 + 1.0;
    out.m_65.x = _1221;
    out.m_65.y = _1223;
    float _1237 = _1189 + 0.5;
    int _1239 = as_type<int>(_1235) + (-218103808);
    bool _1241 = uint(_1239) >= 1920991232u;
    float _1243 = _1185 + 0.5;
    bool _1245 = !_1241;
    float _1247 = _1237;
    if (!_1245)
    {
        int _1249;
        _86(_1249, out.gl_Position, out.gl_PointSize);
    }
    int _1251 = _1229;
    int _1253 = 0;
    int _1255 = _89(_1251, _1253, (*spvDescriptorSet0.support_buffer));
    int _1257 = _767;
    int _1259 = 0;
    int _1261 = _89(_1257, _1259, (*spvDescriptorSet0.support_buffer));
    float4 _1263 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1255, _1261)), 0).xyzw;
    float _1265 = _1263.x;
    float _1267 = _1263.y;
    float _1269 = _1263.z;
    float _1271 = _1263.w;
    float _1273 = floor(_773);
    float _1275 = -_1273;
    float _1277 = _773 + _1275;
    uint _1279 = as_type<uint>(half2(float2(_1271, 0.0)));
    float _1281 = -_794;
    float _1283 = _1281 + _1265;
    float _1285 = -_796;
    float _1287 = _1285 + _1267;
    uint _1289 = extract_bits(_1279, 0u, 8u);
    int _1291 = int(_1289) & 255;
    uint _1293 = extract_bits(_1279, 8u, 8u);
    int _1295 = int(_1293) & 255;
    int _1297 = _1295 << 8;
    int _1299 = _1291 | _1297;
    float _1301 = fma(_1277, _1283, _794);
    float _1303 = fma(_1277, _1287, _796);
    bool _1305 = _1299 >= 32768;
    int _1307 = _1299 + (-1024);
    int _1309 = _1307;
    if (_1305)
    {
        int _1311 = ~_1299;
        int _1313 = _1311 + 33792;
        int _1315 = _1313 + 1;
        _1309 = _1315;
    }
    int _1317 = _1309;
    int _1319 = _1317 + 30719;
    float _1321 = float(_1319);
    float _1323 = fma(_1321, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1325 = abs(_1323);
    float _1327 = -_1325;
    float _1329 = _1327 + 1.0;
    int _1331 = as_type<int>(_1329) + (-218103808);
    bool _1333 = uint(_1331) >= 1920991232u;
    float _1335 = -_798;
    float _1337 = _1335 + _1269;
    float _1339 = fma(_1277, _1337, _798);
    bool _1341 = !_1333;
    if (!_1341)
    {
        int _1343;
        _86(_1343, out.gl_Position, out.gl_PointSize);
    }
    float _1345 = _271 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1347 = _271 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1349 = _271 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1351 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1345);
    float _1353 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1347);
    float _1355 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1349);
    float _1357 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1351);
    float _1359 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1353);
    float _1361 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1355);
    float _1363 = _1357 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1365 = _1359 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1367 = _1361 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1371 = _1363 + _1369;
    float _1373 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1375 = _1365 + _1373;
    float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1379 = _1367 + _1377;
    float _1381 = _1371 * _1371;
    float _1383 = fma(_1375, _1375, _1381);
    float _1385 = fma(_1379, _1379, _1383);
    float _1387 = rsqrt(_1385);
    float _1389 = _1371 * _1387;
    float _1391 = _1375 * _1387;
    float _1393 = _1379 * _1387;
    float _1395 = -_1389;
    float _1397 = fma(_1395, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1371);
    float _1399 = -_1391;
    float _1401 = fma(_1399, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1375);
    float _1403 = -_1393;
    float _1405 = fma(_1403, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1379);
    float _1407 = _1397 * _1397;
    float _1409 = in.m_57.x;
    float _1411 = in.m_57.y;
    float _1413 = in.m_57.z;
    float _1415 = fma(_1401, _1401, _1407);
    float _1417 = fma(_1405, _1405, _1415);
    float _1419 = sqrt(_1417);
    float _1421 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1339);
    float _1423 = _1411 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1425 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1427 = _1387 * _1419;
    float _1429 = _1413 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1431 = _1423 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1433 = _1425 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1435 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1303);
    float _1437 = _1429 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1439 = _1431 * _1427;
    float _1441 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1301);
    float _1443 = _1433 * _1427;
    float _1445 = _1437 * _1427;
    float _1447 = _1439 * _1435;
    float _1449 = _1443 * _1441;
    float _1451 = _1445 * _1421;
    float _1453 = _1447 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1455 = _1447 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1457 = _1447 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1459 = fma(_1449, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1453);
    float _1461 = fma(_1449, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1455);
    float _1463 = fma(_1449, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1457);
    float _1465 = fma(_1451, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1459);
    float _1467 = fma(_1451, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1461);
    float _1469 = fma(_1451, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1463);
    float _1471 = _1367 + _1465;
    float _1473 = _1365 + _1467;
    float _1475 = _1363 + _1469;
    float _1477 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1479 = _1471 + _1477;
    float _1481 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1483 = _1473 + _1481;
    float _1485 = _1479 * _1479;
    float _1487 = fma(_1483, _1483, _1485);
    float _1489 = sqrt(_1487);
    bool _1491 = _1489 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1493 = _1469;
    float _1495 = _1449;
    float _1497 = _1451;
    float _1499 = _1471;
    float _1501 = _1475;
    float _1503 = _1479;
    if (!_1491)
    {
        _1493 = _1473;
    }
    float _1505 = _1493;
    float _1507 = _1505;
    if (!_1491)
    {
        _1495 = _1471;
    }
    float _1509 = _1495;
    float _1511 = _1509;
    if (!_1491)
    {
        _1497 = _1475;
    }
    float _1513 = _1497;
    bool _1515 = !_1491;
    float _1517 = _1513;
    if (!_1515)
    {
        float _1519 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1521 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1523 = _1489 + _1521;
        float _1525 = _1475 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1527 = rsqrt(_1487);
        float _1529 = _1523 * _1519;
        float _1531 = _1529 * 0.15915493667125701904296875;
        float _1533 = _1531 * 6.283185482025146484375;
        float _1535 = cos(_1533);
        float _1537 = _1531 * 6.283185482025146484375;
        float _1539 = sin(_1537);
        float _1541 = _1535 + (-1.0);
        float _1543 = _1541 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1545 = fma(_1539, _1525, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1547 = fma(_1475, _1535, _1543);
        float _1549 = _1527 * _1545;
        float _1551 = fma(_1483, _1549, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1553 = fma(_1479, _1549, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1517 = _1547;
        _1507 = _1551;
        _1511 = _1553;
        _1499 = _1531;
    }
    float _1555 = _1517;
    float _1557 = _1507;
    float _1559 = _1511;
    float _1561 = _1499;
    float _1563 = -_1389;
    float _1565 = fma(_1563, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1555);
    float _1567 = -_1391;
    float _1569 = fma(_1567, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1557);
    float _1571 = -_1393;
    float _1573 = fma(_1571, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1559);
    float _1575 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1577 = _1565 + _1575;
    float _1579 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1581 = _1569 + _1579;
    float _1583 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1585 = _1573 + _1583;
    float _1587 = _1577 * _1577;
    float _1589 = fma(_1581, _1581, _1587);
    float _1591 = fma(_1585, _1585, _1589);
    float _1593 = rsqrt(_1591);
    float _1595 = sqrt(_1591);
    float _1597 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1599 = _1581 * _1597;
    float _1601 = _1585 * _1597;
    float _1603 = _1599 * _1599;
    float _1605 = _1601 * _1601;
    float _1607 = _1603 + _1605;
    float _1609 = sqrt(_1607);
    bool _1611 = _1609 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1613 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1615 = _1609 + _1613;
    float _1617 = _1593;
    float _1619 = _1615;
    float _1621 = _1577;
    if (_1611)
    {
        float _1623 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1617 = _1623;
    }
    float _1625 = _1617;
    float _1627 = _1625;
    if (_1611)
    {
        float _1629 = _1615 * _1625;
        _1619 = _1629;
    }
    float _1631 = _1619;
    if (_1611)
    {
        float _1633 = rsqrt(_1607);
        _1627 = _1633;
    }
    float _1635 = _1627;
    float _1637 = _1635;
    if (_1611)
    {
        float _1639 = _1631 * 0.15915493667125701904296875;
        _1501 = _1639;
    }
    float _1641 = _1501;
    float _1643 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1645 = _1585;
    if (_1611)
    {
        float _1647 = _1641 * 6.283185482025146484375;
        float _1649 = sin(_1647);
        _1645 = _1649;
    }
    float _1651 = _1645;
    float _1653 = precise::max(0.0, _1643);
    float _1655 = _1561;
    float _1657 = _1653;
    if (_1611)
    {
        float _1659 = _1641 * 6.283185482025146484375;
        float _1661 = cos(_1659);
        _1655 = _1661;
    }
    float _1663 = _1655;
    float _1665 = -_1597;
    float _1667 = -_1653;
    float _1669 = fma(_1577, _1665, _1667);
    if (_1611)
    {
        float _1671 = _1669 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1621 = _1671;
    }
    float _1673 = _1621;
    float _1675 = _1651;
    float _1677 = _1673;
    if (_1611)
    {
        float _1679 = fma(_1651, _1673, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1503 = _1679;
    }
    float _1681 = _1503;
    float _1683 = _1681;
    if (!_1611)
    {
        _1675 = _1599;
    }
    float _1685 = _1675;
    float _1687 = _1565 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1689 = _1685;
    if (_1611)
    {
        float _1691 = _1635 * _1681;
        _1683 = _1691;
    }
    float _1693 = _1683;
    if (!_1611)
    {
        _1637 = _1669;
    }
    float _1695 = _1637;
    float _1697 = _1695;
    float _1699 = _1663;
    if (_1611)
    {
        float _1701 = _1663 + (-1.0);
        _1657 = _1701;
    }
    float _1703 = _1657;
    float _1705 = _1703;
    if (_1611)
    {
        float _1707 = _1599 * _1693;
        _1689 = _1707;
    }
    float _1709 = _1689;
    float _1711 = _1565 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1611)
    {
        float _1713 = _1703 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1677 = _1713;
    }
    float _1715 = _1677;
    float _1717 = _1715;
    if (!_1611)
    {
        _1705 = _1601;
    }
    float _1719 = _1705;
    float _1721 = _1719;
    if (_1611)
    {
        float _1723 = _1601 * _1693;
        _1721 = _1723;
    }
    float _1725 = _1721;
    float _1727 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1711);
    if (_1611)
    {
        float _1729 = fma(_1669, _1663, _1715);
        _1697 = _1729;
    }
    float _1731 = _1697;
    if (!_1611)
    {
        _1699 = _1603;
    }
    float _1733 = _1699;
    float _1735 = _1733;
    if (_1611)
    {
        float _1737 = _1709 * _1709;
        _1735 = _1737;
    }
    float _1739 = _1735;
    float _1741 = _1565 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1611)
    {
        _1717 = _1605;
    }
    float _1743 = _1717;
    float _1745 = _1743;
    if (_1611)
    {
        float _1747 = _1725 * _1725;
        _1745 = _1747;
    }
    float _1749 = _1745;
    float _1751 = fma(_1731, _1731, _1739);
    float _1753 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1741);
    float _1755 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1687);
    float _1757 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1727);
    float _1759 = _1751 + _1749;
    float _1761 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1763 = fma(_1595, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1761);
    float _1765 = precise::clamp(_1763, 0.0, 1.0);
    float _1767 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1755);
    float _1769 = _1757 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1771 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1773 = _1565 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1775 = rsqrt(_1759);
    float _1777 = -_1765;
    float _1779 = _1777 + 1.0;
    float _1781 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1753);
    float _1783 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1785 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1787 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1773);
    float _1789 = _1781 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1791 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1785);
    float _1793 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1787);
    float _1795 = abs(_1779);
    float _1797 = log2(_1795);
    float _1799 = _1789 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1801 = fma(_1789, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1791);
    float _1803 = _1793 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1805 = -_1799;
    float _1807 = fma(_1805, _1771, 1.0);
    float _1809 = _1775 * _1709;
    float _1811 = _1775 * _1731;
    float _1813 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1801);
    float _1815 = _1775 * _1725;
    float _1817 = _1809 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1819 = log2(_1807);
    float _1821 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1823 = _1811 + 1.0;
    float _1825 = -_1817;
    float _1827 = fma(_1811, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1825);
    float _1829 = _1797 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1831 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1821);
    float _1833 = -_1815;
    float _1835 = fma(_1833, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1827);
    float _1837 = 1.0 / _1813;
    float _1839 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1841 = fma(_1789, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1831);
    float _1843 = fma(_1835, -0.5, 0.5);
    float _1845 = fma(_1835, 0.5, 0.5);
    float _1847 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1839);
    float _1849 = exp2(_1829);
    float _1851 = fma(_1845, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1853 = fma(_1789, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1847);
    float _1855 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1841);
    float _1857 = _1819 * 0.693147182464599609375;
    float _1859 = fma(_1845, _1851, -0.212114393711090087890625);
    float _1861 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1853);
    float _1863 = sqrt(_1843);
    float _1865 = fma(_1845, _1859, 1.570728778839111328125);
    float _1867 = _1861 * _1837;
    float _1869 = _1855 * _1837;
    float _1871 = _1857 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1873 = fma(_1867, 0.5, 0.5);
    float _1875 = fma(_1869, -0.5, 0.5);
    float _1877 = -_1811;
    float _1879 = fma(_1849, _1823, _1877);
    float _1881 = fma(_1879, 0.5, 0.5);
    float _1883 = _1863 * 0.636619746685028076171875;
    float _1885 = -_1865;
    float _1887 = fma(_1883, _1885, 1.0);
    float3 _4999 = float3(_1873, _1875, _1871);
    float _1889 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4999, float3(0.0), isnan(_4999)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4999, float3(0.0), isnan(_4999)), level(0.0)).x;
    float3 _5010 = float3(_1873, _1875, _1871);
    float4 _1891 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5010, float3(0.0), isnan(_5010)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5010, float3(0.0), isnan(_5010)), level(0.0)).xyzw;
    float _1893 = _1891.x;
    float _1895 = _1891.y;
    float _1897 = _1891.z;
    float _1899 = _1891.w;
    float2 _5026 = float2(_1887, _1881);
    float3 _1903 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5026, float2(0.0), isnan(_5026)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5026, float2(0.0), isnan(_5026)), level(0.0)).xyz;
    float _1905 = _1903.x;
    float _1907 = _1903.y;
    float _1909 = _1903.z;
    float _1911 = -_1389;
    float _1913 = fma(_1911, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1363);
    float _1915 = -_1391;
    float _1917 = fma(_1915, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1365);
    float _1919 = -_1393;
    float _1921 = fma(_1919, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1367);
    out.m_67.x = _1243;
    float _1923 = _1913 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1925 = _1913 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1927 = _1797 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1929 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1931 = isnan(0.5);
    bool _1933 = _1929 || _1931;
    bool _1935 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1937 = _1933 || _1935;
    float _1939 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1923);
    float _1941 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1925);
    float _1943 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_67.z = _1237;
    float _1945 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1939);
    float _1947 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1941);
    float _1949 = exp2(_1927);
    float _1951 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1943);
    float _1953 = _1945 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1955 = _1947 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1957 = fma(_1789, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1951);
    if (_1937)
    {
        _1247 = 1.0;
    }
    float _1959 = _1247;
    float _1961 = _1955 + _1953;
    float _1963 = 1.0 / _1953;
    float _1965 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1957);
    float _1967 = _1961 * _1963;
    float _1969 = _1967 * 0.5;
    float _1971 = _1959;
    if (!_1937)
    {
        float _1973 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1975 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1977 = _1973 * 0.15915493667125701904296875;
        float _1979 = _1975 * 0.15915493667125701904296875;
        float _1981 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1983 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1981);
        float _1985 = _1977 * 6.283185482025146484375;
        float _1987 = cos(_1985);
        float _1989 = _1977 * 6.283185482025146484375;
        float _1991 = sin(_1989);
        float _1993 = 1.0 / _1987;
        float _1995 = _1979 * 6.283185482025146484375;
        float _1997 = cos(_1995);
        float _1999 = _1991 * _1993;
        float _2001 = _1979 * 6.283185482025146484375;
        float _2003 = sin(_2001);
        float _2005 = _1997 * _1999;
        float _2007 = 1.0 / _1983;
        float _2009 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2011 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2009;
        float _2013 = 1.0 / _2005;
        float _2015 = 1.0 / _2011;
        float _2017 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2019 = _2007 * _2017;
        float _2021 = _2003 * _2013;
        float _2023 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2025 = fma(_2021, _2019, _2023);
        float _2027 = _2025 * _2015;
        float _2029 = precise::clamp(_2027, 0.0, 1.0);
        float _2031 = -_2029;
        float _2033 = _2031 + 1.0;
        _1971 = _2033;
    }
    float _2035 = _1971;
    float _2037 = -_1949;
    float _2039 = _2037 + 1.0;
    float _2041 = _1813 * 0.5;
    float _2043 = _2035 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2045 = _2035 > 0.0;
    bool _2047 = isnan(_2035);
    bool _2049 = _2045 || _2047;
    bool _2051 = isnan(0.0);
    bool _2053 = _2049 || _2051;
    float _2055 = _2039 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2057 = _1965 + _1813;
    float _2059 = _1861 + _1813;
    float _2061 = fma(_1855, -0.5, _2041);
    float _2063 = _2055 * _1889;
    float _2065 = -_2055;
    float _2067 = _2065 + 1.0;
    float _2069 = _2043 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1861;
    out.gl_Position.y = _1855;
    out.gl_Position.z = _1965;
    out.gl_Position.w = _1813;
    float _2071 = _1899 * _2063;
    float _2073 = _1909 * _2063;
    float _2075 = _2057 * 0.5;
    float _2077 = fma(_1905, _2071, _1893);
    float _2079 = fma(_1907, _2071, _1895);
    float _2081 = _2059 * 0.5;
    float _2083 = _1899 * _2067;
    float _2085 = fma(_1899, _2073, _1897);
    out.m_69.x = _1301;
    out.m_71.x = _2081;
    out.m_71.y = _2061;
    out.m_71.z = _2075;
    out.m_71.w = _1813;
    out.m_47.x = _2069;
    out.m_73.x = _2077;
    out.m_73.y = _2079;
    out.m_73.z = _2085;
    out.m_73.w = _2083;
    if (_2053)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2087 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2087;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _747 = false;
    bool _587 = false;
    bool _453 = false;
    bool _293 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _97 = int(_95);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _103;
    if (!_101)
    {
        out.m_47.x = 0.0;
    }
    int _107 = 0;
    if (!_101)
    {
        float _109 = _105 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2143 = as_type<float>(_111);
        out.gl_Position.z = _2143;
    }
    if (!_101)
    {
        return out;
    }
    float _115 = in.m_49.w;
    float _117 = float(_97);
    float _119 = in.m_51.x;
    float _121 = -_115;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_115);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    out.m_53.x = _119;
    bool _135 = _123 >= _117;
    bool _137 = !_133;
    bool _139 = _135 || _137;
    float _141 = 1.0 / _117;
    float _143 = _115;
    if (_139)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_139)
    {
        out.m_47.x = 0.0;
    }
    float _147 = _123 * _141;
    if (_139)
    {
        float _149 = _145 * 5.0;
        _113 = as_type<int>(_149);
    }
    int _151 = _113;
    out.m_55.x = _147;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2218 = as_type<float>(_151);
        out.gl_Position.z = _2218;
    }
    if (_139)
    {
        return out;
    }
    float _153 = in.m_57.w;
    float _155 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = in.m_49.x;
    float _169 = in.m_49.y;
    float _171 = in.m_49.z;
    float _173 = in.m_44.x;
    float _175 = in.m_44.y;
    float _177 = in.m_44.z;
    float _179 = 0.0;
    float _181 = _155;
    if (!_165)
    {
        float _183 = _155 * _155;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    float _189 = _187;
    if (!_165)
    {
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _191;
    }
    float _193 = _189;
    bool _195 = !_165;
    float _197 = _193;
    if (!_195)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _155 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _155);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _227;
    }
    float _229 = _197;
    bool _231 = !_165;
    if (!_231)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = 1.0 / _239;
        float _243 = _155 * _235;
        float _245 = exp2(_243);
        float _247 = -_245;
        float _249 = _247 + 1.0;
        float _251 = _249 * _241;
        _181 = _251;
    }
    float _253 = _181;
    bool _255 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _257 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _259 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _261 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _263 = fma(_253, _167, _257);
    float _265 = fma(_253, _169, _259);
    float _267 = fma(_253, _171, _261);
    float _269 = fma(_263, _153, _173);
    float _271 = fma(_265, _153, _175);
    float _273 = fma(_267, _153, _177);
    bool _275 = !_255;
    float _291;
    if (!_275)
    {
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _279 = _119 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _283 = _281 * _277;
        float _285 = floor(_283);
        float _287 = -_285;
        float _289 = _283 + _287;
        _291 = _289;
        _293 = true;
    }
    else
    {
        _291 = _147;
    }
    _293 = false;
    float _295 = _291;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _299 = _295 + _297;
    bool _301 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _303 = isnan(_295);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _315 = _295 + _313;
    bool _317 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _319 = isnan(_295);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _337 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _339 = isnan(_295);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -_311;
    float _351 = _349 + 1.0;
    float _353 = 1.0 / _335;
    float _355 = _347 * _351;
    float _357 = -_347;
    float _359 = _357 + 1.0;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _361;
    bool _365 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _367 = 1.0 / _331;
    float _369 = _327 * _359;
    float _371 = -_327;
    float _373 = _371 + 1.0;
    float _375 = _315 * _353;
    float _377 = _299 * _367;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _383;
    float _387 = fma(_363, _377, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _389 = fma(_381, _377, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _391 = fma(_385, _377, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _393 = _387 * _369;
    float _395 = _389 * _369;
    float _397 = _391 * _369;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _411 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[107].x, _393);
    float _413 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[107].y, _395);
    float _415 = fma(_401, _375, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _417 = fma(_405, _375, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _419 = fma(_409, _375, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _421 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[107].z, _397);
    float _423 = fma(_415, _355, _411);
    float _425 = fma(_417, _355, _413);
    float _427 = fma(_419, _355, _421);
    float _429 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[109].x, _423);
    float _431 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[109].y, _425);
    float _433 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[109].z, _427);
    bool _435 = !_365;
    float _451;
    if (!_435)
    {
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _439 = _119 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _443 = _441 * _437;
        float _445 = floor(_443);
        float _447 = -_445;
        float _449 = _443 + _447;
        _451 = _449;
        _453 = true;
    }
    else
    {
        _451 = _147;
    }
    _453 = false;
    float _455 = _451;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _459 = _455 + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _465 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _467 = isnan(_455);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _481 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _483 = isnan(_455);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _493;
    bool _497 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _499 = isnan(_455);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = 1.0 / _463;
    float _511 = -_475;
    float _513 = _511 + 1.0;
    bool _515 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _517 = _491 * _513;
    float _519 = -_491;
    float _521 = _519 + 1.0;
    float _523 = 1.0 / _479;
    float _525 = _495 * _509;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _531 = fma(_525, _459, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _533 = _529 * _523;
    float _535 = _531 * _517;
    float _537 = -_507;
    float _539 = _537 + 1.0;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _543 = _455 + _541;
    float _545 = _429 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _547 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[115].x, _535);
    float _549 = _475 * _539;
    float _551 = fma(_533, _543, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _553 = _433 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _555 = _545 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _557 = fma(_551, _549, _547);
    float _559 = _431 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _561 = _553 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _563 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[117].x, _557);
    float _565 = _559 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _567 = _563 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _555;
    out.m_59.y = _565;
    out.m_59.z = _561;
    out.m_59.w = _567;
    bool _569 = !_515;
    float _585;
    if (!_569)
    {
        float _571 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _573 = _119 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _575 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _577 = _575 * _571;
        float _579 = floor(_577);
        float _581 = -_579;
        float _583 = _577 + _581;
        _585 = _583;
        _587 = true;
    }
    else
    {
        _585 = _147;
    }
    _587 = false;
    float _589 = _585;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _593 = _589 + _591;
    bool _595 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _597 = isnan(_589);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _609 = _589 + _607;
    bool _611 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _613 = isnan(_589);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _631 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _633 = isnan(_589);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = -_605;
    float _645 = _643 + 1.0;
    float _647 = 1.0 / _629;
    float _649 = _641 * _645;
    float _651 = -_641;
    float _653 = _651 + 1.0;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _655;
    bool _659 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _661 = 1.0 / _625;
    float _663 = _621 * _653;
    float _665 = -_621;
    float _667 = _665 + 1.0;
    float _669 = _609 * _647;
    float _671 = _593 * _661;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _677;
    float _681 = fma(_657, _671, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _683 = fma(_675, _671, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _685 = fma(_679, _671, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _687 = _681 * _663;
    float _689 = _683 * _663;
    float _691 = _685 * _663;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _705 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[123].x, _687);
    float _707 = fma(_695, _669, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _709 = fma(_699, _669, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _711 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[123].y, _689);
    float _713 = fma(_703, _669, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _715 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[123].z, _691);
    float _717 = fma(_707, _649, _705);
    float _719 = fma(_709, _649, _711);
    float _721 = fma(_713, _649, _715);
    float _723 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[125].x, _717);
    float _725 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[125].y, _719);
    float _727 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[125].z, _721);
    bool _729 = !_659;
    float _745;
    if (!_729)
    {
        float _731 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _733 = _119 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _735 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _737 = _735 * _731;
        float _739 = floor(_737);
        float _741 = -_739;
        float _743 = _737 + _741;
        _745 = _743;
        _747 = true;
    }
    else
    {
        _745 = _147;
    }
    _747 = false;
    float _749 = _745;
    int _751 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _753 = _751;
    int _755 = 0;
    int _757 = _88(_753, _755, (*spvDescriptorSet0.support_buffer));
    float _759 = in.m_61.z;
    float _761 = 0.0 + _147;
    float _763 = precise::clamp(_761, 0.0, 1.0);
    float _765 = trunc(_759);
    int _767 = int(_765);
    int _769 = _757 + (-1);
    float _771 = float(_769);
    float _773 = _763 * _771;
    float _775 = trunc(_773);
    int _777 = int(_775);
    int _779 = _777;
    int _781 = 0;
    int _783 = _89(_779, _781, (*spvDescriptorSet0.support_buffer));
    int _785 = _767;
    int _787 = 0;
    int _789 = _89(_785, _787, (*spvDescriptorSet0.support_buffer));
    float4 _792 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_783, _789)), 0).xyzw;
    float _794 = _792.x;
    float _796 = _792.y;
    float _798 = _792.z;
    float _800 = _792.w;
    float _802 = in.m_51.z;
    float _804 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _808 = _806 != 0;
    float _810 = in.m_61.x;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _816 = in.m_61.y;
    int _818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _820 = _818 != 0;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _824 = _822 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _826 = 1.0 / _814;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _830 = _828 != 0;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _834 = _832 != 0;
    float _836 = _119 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _838 = 0.0;
    float _840 = _810;
    if (_808)
    {
        float _842 = in.m_51.z;
        _838 = _842;
    }
    float _844 = _838;
    float _846 = 1.0 / _824;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _852 = _850 != 0;
    float _854 = -_848;
    float _856 = fma(_836, 2.0, _854);
    bool _858 = _802 > 0.5;
    bool _860 = _858 && _834;
    float _862 = in.m_51.y;
    bool _864 = _749 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _866 = isnan(_749);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _876;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _884 = _749 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _886 = isnan(_749);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _898 = _878 * _826;
    bool _900 = _749 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _902 = isnan(_749);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = _882 * _846;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _916 = _749 + _914;
    float _918 = -_910;
    float _920 = _918 + 1.0;
    float _922 = _816;
    float _924 = _874;
    bool _926 = _860;
    if (_860)
    {
        float _928 = -_816;
        float _930 = _928 + 1.0;
        _922 = _930;
    }
    float _932 = _922;
    bool _934 = false;
    if (_808)
    {
        bool _936 = _844 > 0.5;
        _934 = _936;
    }
    bool _938 = _934;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _942 = _749 + _940;
    float _944 = fma(_898, _916, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _946 = _874 * _920;
    float _948 = _804 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _950 = fma(_912, _942, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _952 = -_874;
    float _954 = _952 + 1.0;
    float _956 = _954;
    int _958 = as_type<int>(_944);
    if (!_820)
    {
        _924 = _810;
    }
    float _960 = _924;
    float _962 = fma(_948, _932, -0.5);
    float _964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _966 = _894 * _954;
    float _968 = _960;
    float _970 = _966;
    if (!_820)
    {
        _956 = _960;
    }
    float _972 = _956;
    float _974 = -_894;
    float _976 = _974 + 1.0;
    float _978 = _972;
    float _980 = _976;
    if (_820)
    {
        _968 = _810;
    }
    float _982 = _968;
    float _984 = _944 * _966;
    float _986 = _982;
    if (_820)
    {
        bool _988 = _119 > 0.5;
        _926 = _988;
    }
    bool _990 = _926;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _994 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _996 = _990;
    if (_820)
    {
        float _998 = -_982;
        float _1000 = _998 + 1.0;
        _958 = as_type<int>(_1000);
    }
    int _1002 = _958;
    int _1004 = 0;
    if (_808)
    {
        float _1006 = -_982;
        float _1008 = _1006 + 1.0;
        _1004 = as_type<int>(_1008);
    }
    int _1010 = _1004;
    int _1012 = 0;
    if (_830)
    {
        float _1014 = -_982;
        float _1016 = _1014 + 1.0;
        _1012 = as_type<int>(_1016);
    }
    int _1018 = _1012;
    float _1020 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[131].x, _984);
    bool _1022 = _862 > 0.5;
    float _1024 = _862;
    if (!_808)
    {
        _970 = _982;
    }
    float _1026 = _970;
    float _1028 = _1026;
    if (_820)
    {
        float _1030 = _990 ? as_type<float>(_1002) : _982;
        _978 = _1030;
    }
    float _1032 = _978;
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1036 = _1034;
    if (_808)
    {
        float _1038 = _938 ? as_type<float>(_1010) : _982;
        _1028 = _1038;
    }
    float _1040 = _1028;
    if (_830)
    {
        float _1042 = _1022 ? as_type<float>(_1018) : _982;
        _986 = _1042;
    }
    float _1044 = _986;
    float _1046 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1034);
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    if (_852)
    {
        _996 = false;
    }
    bool _1050 = _996;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _1054 = _1050;
    if (_852)
    {
        _840 = _119;
    }
    float _1056 = _840;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1060 = _1056;
    if (_852)
    {
        _1036 = _862;
    }
    float _1062 = _1036;
    float _1064 = _1062;
    if (!_852)
    {
        float _1066 = _119 * 3.1415927410125732421875;
        float _1068 = _1066 * 0.15915493667125701904296875;
        float _1070 = _862 * 3.1415927410125732421875;
        float _1072 = _1070 * 0.15915493667125701904296875;
        float _1074 = _1068 * 6.283185482025146484375;
        float _1076 = sin(_1074);
        float _1078 = _1072 * 6.283185482025146484375;
        float _1080 = sin(_1078);
        _1060 = _1076;
        _1054 = true;
        _1064 = _1080;
        _980 = _1072;
    }
    float _1082 = _1060;
    bool _1084 = _1054;
    float _1086 = _1064;
    float _1088 = _980;
    float _1090 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[93].z, _992);
    float _1092 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1094 = _1088;
    if (_1084)
    {
        _1094 = _862;
    }
    float _1096 = _1094;
    float _1098 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1058);
    float _1100 = _1096;
    if (!_1084)
    {
        _1100 = _119;
    }
    float _1102 = _1100;
    float _1104 = -_1048;
    float _1106 = fma(_1092, 2.0, _1104);
    if (!_1084)
    {
        _1024 = _119;
    }
    float _1108 = _1024;
    float _1110 = _994 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1112 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    uint _1115 = as_type<uint>(half2(float2(_800, 0.0)));
    float _1117 = fma(_950, _946, _1020);
    float _1119 = fma(_1110, _1040, -0.5);
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1123 = fma(_1112, -2.0, _1052);
    float _1125 = _896 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1127 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1121);
    uint _1129 = extract_bits(_1115, 0u, 8u);
    int _1131 = int(_1129) & 255;
    uint _1133 = extract_bits(_1115, 8u, 8u);
    int _1135 = int(_1133) & 255;
    int _1137 = _1135 << 8;
    int _1139 = _1131 | _1137;
    float _1141 = fma(_1125, _1044, -0.5);
    float _1143 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1098);
    float _1145 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1123);
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1149 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1151 = _1139 >= 32768;
    float _1153 = _964 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1155 = -_1145;
    float _1157 = fma(_1143, _962, _1155);
    float _1159 = -_1147;
    float _1161 = fma(_1149, 2.0, _1159);
    float _1163 = -_123;
    float _1165 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1106);
    float _1167 = fma(_1153, _1032, -0.5);
    float _1169 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1090);
    float _1171 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1046);
    float _1173 = -_123;
    float _1175 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[76].x, _856);
    float _1177 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1127);
    float _1179 = -_123;
    float _1181 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1161);
    float _1183 = _725 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1185 = fma(_1171, _1167, _1175);
    float _1187 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1117);
    float _1189 = fma(_1177, _1119, _1181);
    int _1191 = _1139 + (-1024);
    float _1193 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1195 = _1191;
    if (_1151)
    {
        int _1197 = ~_1139;
        int _1199 = _1197 + 33792;
        int _1201 = _1199 + 1;
        _1195 = _1201;
    }
    int _1203 = _1195;
    float _1205 = fma(_1169, _1141, _1165);
    float _1207 = _723 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1209 = _1203 + 30719;
    float _1211 = _727 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1213 = _1187 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1215 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1217 = float(_1209);
    float _1219 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1221 = _1205 + 0.5;
    float _1223 = _1157 + 0.5;
    int _1225 = _777 + 1;
    float _1227 = fma(_1217, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    out.m_63.x = _1215;
    out.m_63.y = _1193;
    out.m_63.z = _1219;
    out.m_63.w = _1213;
    int _1229 = min(_769, _1225);
    float _1231 = abs(_1227);
    float _1233 = -_1231;
    float _1235 = _1233 + 1.0;
    out.m_65.x = _1221;
    out.m_65.y = _1223;
    float _1237 = _1189 + 0.5;
    int _1239 = as_type<int>(_1235) + (-218103808);
    bool _1241 = uint(_1239) >= 1920991232u;
    float _1243 = _1185 + 0.5;
    bool _1245 = !_1241;
    float _1247 = _1237;
    if (!_1245)
    {
        int _1249;
        _86(_1249, out.gl_Position, out.gl_PointSize);
    }
    int _1251 = _1229;
    int _1253 = 0;
    int _1255 = _89(_1251, _1253, (*spvDescriptorSet0.support_buffer));
    int _1257 = _767;
    int _1259 = 0;
    int _1261 = _89(_1257, _1259, (*spvDescriptorSet0.support_buffer));
    float4 _1263 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1255, _1261)), 0).xyzw;
    float _1265 = _1263.x;
    float _1267 = _1263.y;
    float _1269 = _1263.z;
    float _1271 = _1263.w;
    float _1273 = floor(_773);
    float _1275 = -_1273;
    float _1277 = _773 + _1275;
    uint _1279 = as_type<uint>(half2(float2(_1271, 0.0)));
    float _1281 = -_794;
    float _1283 = _1281 + _1265;
    float _1285 = -_796;
    float _1287 = _1285 + _1267;
    uint _1289 = extract_bits(_1279, 0u, 8u);
    int _1291 = int(_1289) & 255;
    uint _1293 = extract_bits(_1279, 8u, 8u);
    int _1295 = int(_1293) & 255;
    int _1297 = _1295 << 8;
    int _1299 = _1291 | _1297;
    float _1301 = fma(_1277, _1283, _794);
    float _1303 = fma(_1277, _1287, _796);
    bool _1305 = _1299 >= 32768;
    int _1307 = _1299 + (-1024);
    int _1309 = _1307;
    if (_1305)
    {
        int _1311 = ~_1299;
        int _1313 = _1311 + 33792;
        int _1315 = _1313 + 1;
        _1309 = _1315;
    }
    int _1317 = _1309;
    int _1319 = _1317 + 30719;
    float _1321 = float(_1319);
    float _1323 = fma(_1321, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1325 = abs(_1323);
    float _1327 = -_1325;
    float _1329 = _1327 + 1.0;
    int _1331 = as_type<int>(_1329) + (-218103808);
    bool _1333 = uint(_1331) >= 1920991232u;
    float _1335 = -_798;
    float _1337 = _1335 + _1269;
    float _1339 = fma(_1277, _1337, _798);
    bool _1341 = !_1333;
    if (!_1341)
    {
        int _1343;
        _86(_1343, out.gl_Position, out.gl_PointSize);
    }
    float _1345 = _271 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1347 = _271 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1349 = _271 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1351 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1345);
    float _1353 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1347);
    float _1355 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1349);
    float _1357 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1351);
    float _1359 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1353);
    float _1361 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1355);
    float _1363 = _1357 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1365 = _1359 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1367 = _1361 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1371 = _1363 + _1369;
    float _1373 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1375 = _1365 + _1373;
    float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1379 = _1367 + _1377;
    float _1381 = _1371 * _1371;
    float _1383 = fma(_1375, _1375, _1381);
    float _1385 = fma(_1379, _1379, _1383);
    float _1387 = rsqrt(_1385);
    float _1389 = _1371 * _1387;
    float _1391 = _1375 * _1387;
    float _1393 = _1379 * _1387;
    float _1395 = -_1389;
    float _1397 = fma(_1395, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1371);
    float _1399 = -_1391;
    float _1401 = fma(_1399, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1375);
    float _1403 = -_1393;
    float _1405 = fma(_1403, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1379);
    float _1407 = _1397 * _1397;
    float _1409 = in.m_57.x;
    float _1411 = in.m_57.y;
    float _1413 = in.m_57.z;
    float _1415 = fma(_1401, _1401, _1407);
    float _1417 = fma(_1405, _1405, _1415);
    float _1419 = sqrt(_1417);
    float _1421 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1339);
    float _1423 = _1411 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1425 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1427 = _1387 * _1419;
    float _1429 = _1413 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1431 = _1423 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1433 = _1425 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1435 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1303);
    float _1437 = _1429 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1439 = _1431 * _1427;
    float _1441 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1301);
    float _1443 = _1433 * _1427;
    float _1445 = _1437 * _1427;
    float _1447 = _1439 * _1435;
    float _1449 = _1443 * _1441;
    float _1451 = _1445 * _1421;
    float _1453 = _1447 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1455 = _1447 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1457 = _1447 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1459 = fma(_1449, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1453);
    float _1461 = fma(_1449, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1455);
    float _1463 = fma(_1449, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1457);
    float _1465 = fma(_1451, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1459);
    float _1467 = fma(_1451, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1461);
    float _1469 = fma(_1451, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1463);
    float _1471 = _1367 + _1465;
    float _1473 = _1365 + _1467;
    float _1475 = _1363 + _1469;
    float _1477 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1479 = _1471 + _1477;
    float _1481 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1483 = _1473 + _1481;
    float _1485 = _1479 * _1479;
    float _1487 = fma(_1483, _1483, _1485);
    float _1489 = sqrt(_1487);
    bool _1491 = _1489 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1493 = _1469;
    float _1495 = _1449;
    float _1497 = _1451;
    float _1499 = _1471;
    float _1501 = _1475;
    float _1503 = _1479;
    if (!_1491)
    {
        _1493 = _1473;
    }
    float _1505 = _1493;
    float _1507 = _1505;
    if (!_1491)
    {
        _1495 = _1471;
    }
    float _1509 = _1495;
    float _1511 = _1509;
    if (!_1491)
    {
        _1497 = _1475;
    }
    float _1513 = _1497;
    bool _1515 = !_1491;
    float _1517 = _1513;
    if (!_1515)
    {
        float _1519 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1521 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1523 = _1489 + _1521;
        float _1525 = _1475 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1527 = rsqrt(_1487);
        float _1529 = _1523 * _1519;
        float _1531 = _1529 * 0.15915493667125701904296875;
        float _1533 = _1531 * 6.283185482025146484375;
        float _1535 = cos(_1533);
        float _1537 = _1531 * 6.283185482025146484375;
        float _1539 = sin(_1537);
        float _1541 = _1535 + (-1.0);
        float _1543 = _1541 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1545 = fma(_1539, _1525, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1547 = fma(_1475, _1535, _1543);
        float _1549 = _1527 * _1545;
        float _1551 = fma(_1483, _1549, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1553 = fma(_1479, _1549, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1517 = _1547;
        _1507 = _1551;
        _1511 = _1553;
        _1499 = _1531;
    }
    float _1555 = _1517;
    float _1557 = _1507;
    float _1559 = _1511;
    float _1561 = _1499;
    float _1563 = -_1389;
    float _1565 = fma(_1563, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1555);
    float _1567 = -_1391;
    float _1569 = fma(_1567, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1557);
    float _1571 = -_1393;
    float _1573 = fma(_1571, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1559);
    float _1575 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1577 = _1565 + _1575;
    float _1579 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1581 = _1569 + _1579;
    float _1583 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1585 = _1573 + _1583;
    float _1587 = _1577 * _1577;
    float _1589 = fma(_1581, _1581, _1587);
    float _1591 = fma(_1585, _1585, _1589);
    float _1593 = rsqrt(_1591);
    float _1595 = sqrt(_1591);
    float _1597 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1599 = _1581 * _1597;
    float _1601 = _1585 * _1597;
    float _1603 = _1599 * _1599;
    float _1605 = _1601 * _1601;
    float _1607 = _1603 + _1605;
    float _1609 = sqrt(_1607);
    bool _1611 = _1609 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1613 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1615 = _1609 + _1613;
    float _1617 = _1593;
    float _1619 = _1615;
    float _1621 = _1577;
    if (_1611)
    {
        float _1623 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1617 = _1623;
    }
    float _1625 = _1617;
    float _1627 = _1625;
    if (_1611)
    {
        float _1629 = _1615 * _1625;
        _1619 = _1629;
    }
    float _1631 = _1619;
    if (_1611)
    {
        float _1633 = rsqrt(_1607);
        _1627 = _1633;
    }
    float _1635 = _1627;
    float _1637 = _1635;
    if (_1611)
    {
        float _1639 = _1631 * 0.15915493667125701904296875;
        _1501 = _1639;
    }
    float _1641 = _1501;
    float _1643 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1645 = _1585;
    if (_1611)
    {
        float _1647 = _1641 * 6.283185482025146484375;
        float _1649 = sin(_1647);
        _1645 = _1649;
    }
    float _1651 = _1645;
    float _1653 = precise::max(0.0, _1643);
    float _1655 = _1561;
    float _1657 = _1653;
    if (_1611)
    {
        float _1659 = _1641 * 6.283185482025146484375;
        float _1661 = cos(_1659);
        _1655 = _1661;
    }
    float _1663 = _1655;
    float _1665 = -_1597;
    float _1667 = -_1653;
    float _1669 = fma(_1577, _1665, _1667);
    if (_1611)
    {
        float _1671 = _1669 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1621 = _1671;
    }
    float _1673 = _1621;
    float _1675 = _1651;
    float _1677 = _1673;
    if (_1611)
    {
        float _1679 = fma(_1651, _1673, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1503 = _1679;
    }
    float _1681 = _1503;
    float _1683 = _1681;
    if (!_1611)
    {
        _1675 = _1599;
    }
    float _1685 = _1675;
    float _1687 = _1565 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1689 = _1685;
    if (_1611)
    {
        float _1691 = _1635 * _1681;
        _1683 = _1691;
    }
    float _1693 = _1683;
    if (!_1611)
    {
        _1637 = _1669;
    }
    float _1695 = _1637;
    float _1697 = _1695;
    float _1699 = _1663;
    if (_1611)
    {
        float _1701 = _1663 + (-1.0);
        _1657 = _1701;
    }
    float _1703 = _1657;
    float _1705 = _1703;
    if (_1611)
    {
        float _1707 = _1599 * _1693;
        _1689 = _1707;
    }
    float _1709 = _1689;
    float _1711 = _1565 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1611)
    {
        float _1713 = _1703 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1677 = _1713;
    }
    float _1715 = _1677;
    float _1717 = _1715;
    if (!_1611)
    {
        _1705 = _1601;
    }
    float _1719 = _1705;
    float _1721 = _1719;
    if (_1611)
    {
        float _1723 = _1601 * _1693;
        _1721 = _1723;
    }
    float _1725 = _1721;
    float _1727 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1711);
    if (_1611)
    {
        float _1729 = fma(_1669, _1663, _1715);
        _1697 = _1729;
    }
    float _1731 = _1697;
    if (!_1611)
    {
        _1699 = _1603;
    }
    float _1733 = _1699;
    float _1735 = _1733;
    if (_1611)
    {
        float _1737 = _1709 * _1709;
        _1735 = _1737;
    }
    float _1739 = _1735;
    float _1741 = _1565 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1611)
    {
        _1717 = _1605;
    }
    float _1743 = _1717;
    float _1745 = _1743;
    if (_1611)
    {
        float _1747 = _1725 * _1725;
        _1745 = _1747;
    }
    float _1749 = _1745;
    float _1751 = fma(_1731, _1731, _1739);
    float _1753 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1741);
    float _1755 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1687);
    float _1757 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1727);
    float _1759 = _1751 + _1749;
    float _1761 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1763 = fma(_1595, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1761);
    float _1765 = precise::clamp(_1763, 0.0, 1.0);
    float _1767 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1755);
    float _1769 = _1757 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1771 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1773 = _1565 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1775 = rsqrt(_1759);
    float _1777 = -_1765;
    float _1779 = _1777 + 1.0;
    float _1781 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1753);
    float _1783 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1785 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1787 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1773);
    float _1789 = _1781 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1791 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1785);
    float _1793 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1787);
    float _1795 = abs(_1779);
    float _1797 = log2(_1795);
    float _1799 = _1789 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1801 = fma(_1789, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1791);
    float _1803 = _1793 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1805 = -_1799;
    float _1807 = fma(_1805, _1771, 1.0);
    float _1809 = _1775 * _1709;
    float _1811 = _1775 * _1731;
    float _1813 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1801);
    float _1815 = _1775 * _1725;
    float _1817 = _1809 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1819 = log2(_1807);
    float _1821 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1823 = _1811 + 1.0;
    float _1825 = -_1817;
    float _1827 = fma(_1811, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1825);
    float _1829 = _1797 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1831 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1821);
    float _1833 = -_1815;
    float _1835 = fma(_1833, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1827);
    float _1837 = 1.0 / _1813;
    float _1839 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1841 = fma(_1789, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1831);
    float _1843 = fma(_1835, -0.5, 0.5);
    float _1845 = fma(_1835, 0.5, 0.5);
    float _1847 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1839);
    float _1849 = exp2(_1829);
    float _1851 = fma(_1845, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1853 = fma(_1789, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1847);
    float _1855 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1841);
    float _1857 = _1819 * 0.693147182464599609375;
    float _1859 = fma(_1845, _1851, -0.212114393711090087890625);
    float _1861 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1853);
    float _1863 = sqrt(_1843);
    float _1865 = fma(_1845, _1859, 1.570728778839111328125);
    float _1867 = _1861 * _1837;
    float _1869 = _1855 * _1837;
    float _1871 = _1857 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1873 = fma(_1867, 0.5, 0.5);
    float _1875 = fma(_1869, -0.5, 0.5);
    float _1877 = -_1811;
    float _1879 = fma(_1849, _1823, _1877);
    float _1881 = fma(_1879, 0.5, 0.5);
    float _1883 = _1863 * 0.636619746685028076171875;
    float _1885 = -_1865;
    float _1887 = fma(_1883, _1885, 1.0);
    float3 _4999 = float3(_1873, _1875, _1871);
    float _1889 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4999, float3(0.0), isnan(_4999)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4999, float3(0.0), isnan(_4999)), level(0.0)).x;
    float3 _5010 = float3(_1873, _1875, _1871);
    float4 _1891 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5010, float3(0.0), isnan(_5010)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5010, float3(0.0), isnan(_5010)), level(0.0)).xyzw;
    float _1893 = _1891.x;
    float _1895 = _1891.y;
    float _1897 = _1891.z;
    float _1899 = _1891.w;
    float2 _5026 = float2(_1887, _1881);
    float3 _1903 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5026, float2(0.0), isnan(_5026)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5026, float2(0.0), isnan(_5026)), level(0.0)).xyz;
    float _1905 = _1903.x;
    float _1907 = _1903.y;
    float _1909 = _1903.z;
    float _1911 = -_1389;
    float _1913 = fma(_1911, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1363);
    float _1915 = -_1391;
    float _1917 = fma(_1915, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1365);
    float _1919 = -_1393;
    float _1921 = fma(_1919, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1367);
    out.m_67.x = _1243;
    float _1923 = _1913 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1925 = _1913 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1927 = _1797 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1929 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1931 = isnan(0.5);
    bool _1933 = _1929 || _1931;
    bool _1935 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1937 = _1933 || _1935;
    float _1939 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1923);
    float _1941 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1925);
    float _1943 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_67.z = _1237;
    float _1945 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1939);
    float _1947 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1941);
    float _1949 = exp2(_1927);
    float _1951 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1943);
    float _1953 = _1945 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1955 = _1947 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1957 = fma(_1789, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1951);
    if (_1937)
    {
        _1247 = 1.0;
    }
    float _1959 = _1247;
    float _1961 = _1955 + _1953;
    float _1963 = 1.0 / _1953;
    float _1965 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1957);
    float _1967 = _1961 * _1963;
    float _1969 = _1967 * 0.5;
    float _1971 = _1959;
    if (!_1937)
    {
        float _1973 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1975 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1977 = _1973 * 0.15915493667125701904296875;
        float _1979 = _1975 * 0.15915493667125701904296875;
        float _1981 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1983 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1981);
        float _1985 = _1977 * 6.283185482025146484375;
        float _1987 = cos(_1985);
        float _1989 = _1977 * 6.283185482025146484375;
        float _1991 = sin(_1989);
        float _1993 = 1.0 / _1987;
        float _1995 = _1979 * 6.283185482025146484375;
        float _1997 = cos(_1995);
        float _1999 = _1991 * _1993;
        float _2001 = _1979 * 6.283185482025146484375;
        float _2003 = sin(_2001);
        float _2005 = _1997 * _1999;
        float _2007 = 1.0 / _1983;
        float _2009 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2011 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2009;
        float _2013 = 1.0 / _2005;
        float _2015 = 1.0 / _2011;
        float _2017 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2019 = _2007 * _2017;
        float _2021 = _2003 * _2013;
        float _2023 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2025 = fma(_2021, _2019, _2023);
        float _2027 = _2025 * _2015;
        float _2029 = precise::clamp(_2027, 0.0, 1.0);
        float _2031 = -_2029;
        float _2033 = _2031 + 1.0;
        _1971 = _2033;
    }
    float _2035 = _1971;
    float _2037 = -_1949;
    float _2039 = _2037 + 1.0;
    float _2041 = _1813 * 0.5;
    float _2043 = _2035 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2045 = _2035 > 0.0;
    bool _2047 = isnan(_2035);
    bool _2049 = _2045 || _2047;
    bool _2051 = isnan(0.0);
    bool _2053 = _2049 || _2051;
    float _2055 = _2039 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2057 = _1965 + _1813;
    float _2059 = _1861 + _1813;
    float _2061 = fma(_1855, -0.5, _2041);
    float _2063 = _2055 * _1889;
    float _2065 = -_2055;
    float _2067 = _2065 + 1.0;
    float _2069 = _2043 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1861;
    out.gl_Position.y = _1855;
    out.gl_Position.z = _1965;
    out.gl_Position.w = _1813;
    float _2071 = _1899 * _2063;
    float _2073 = _1909 * _2063;
    float _2075 = _2057 * 0.5;
    float _2077 = fma(_1905, _2071, _1893);
    float _2079 = fma(_1907, _2071, _1895);
    float _2081 = _2059 * 0.5;
    float _2083 = _1899 * _2067;
    float _2085 = fma(_1899, _2073, _1897);
    out.m_69.x = _1301;
    out.m_71.x = _2081;
    out.m_71.y = _2061;
    out.m_71.z = _2075;
    out.m_71.w = _1813;
    out.m_47.x = _2069;
    out.m_73.x = _2077;
    out.m_73.y = _2079;
    out.m_73.z = _2085;
    out.m_73.w = _2083;
    if (_2053)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2087 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2087;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _747 = false;
    bool _587 = false;
    bool _453 = false;
    bool _293 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _97 = int(_95);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _103;
    if (!_101)
    {
        out.m_47.x = 0.0;
    }
    int _107 = 0;
    if (!_101)
    {
        float _109 = _105 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2143 = as_type<float>(_111);
        out.gl_Position.z = _2143;
    }
    if (!_101)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _115 = in.m_49.w;
    float _117 = float(_97);
    float _119 = in.m_51.x;
    float _121 = -_115;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_115);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    out.m_53.x = _119;
    bool _135 = _123 >= _117;
    bool _137 = !_133;
    bool _139 = _135 || _137;
    float _141 = 1.0 / _117;
    float _143 = _115;
    if (_139)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_139)
    {
        out.m_47.x = 0.0;
    }
    float _147 = _123 * _141;
    if (_139)
    {
        float _149 = _145 * 5.0;
        _113 = as_type<int>(_149);
    }
    int _151 = _113;
    out.m_55.x = _147;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2218 = as_type<float>(_151);
        out.gl_Position.z = _2218;
    }
    if (_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _153 = in.m_57.w;
    float _155 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = in.m_49.x;
    float _169 = in.m_49.y;
    float _171 = in.m_49.z;
    float _173 = in.m_44.x;
    float _175 = in.m_44.y;
    float _177 = in.m_44.z;
    float _179 = 0.0;
    float _181 = _155;
    if (!_165)
    {
        float _183 = _155 * _155;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    float _189 = _187;
    if (!_165)
    {
        float _191 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _191;
    }
    float _193 = _189;
    bool _195 = !_165;
    float _197 = _193;
    if (!_195)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _155 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _155);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _227;
    }
    float _229 = _197;
    bool _231 = !_165;
    if (!_231)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = 1.0 / _239;
        float _243 = _155 * _235;
        float _245 = exp2(_243);
        float _247 = -_245;
        float _249 = _247 + 1.0;
        float _251 = _249 * _241;
        _181 = _251;
    }
    float _253 = _181;
    bool _255 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _257 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _259 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _261 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _263 = fma(_253, _167, _257);
    float _265 = fma(_253, _169, _259);
    float _267 = fma(_253, _171, _261);
    float _269 = fma(_263, _153, _173);
    float _271 = fma(_265, _153, _175);
    float _273 = fma(_267, _153, _177);
    bool _275 = !_255;
    float _291;
    if (!_275)
    {
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _279 = _119 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _283 = _281 * _277;
        float _285 = floor(_283);
        float _287 = -_285;
        float _289 = _283 + _287;
        _291 = _289;
        _293 = true;
    }
    else
    {
        _291 = _147;
    }
    _293 = false;
    float _295 = _291;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _299 = _295 + _297;
    bool _301 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _303 = isnan(_295);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _315 = _295 + _313;
    bool _317 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _319 = isnan(_295);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _337 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _339 = isnan(_295);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -_311;
    float _351 = _349 + 1.0;
    float _353 = 1.0 / _335;
    float _355 = _347 * _351;
    float _357 = -_347;
    float _359 = _357 + 1.0;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _361;
    bool _365 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _367 = 1.0 / _331;
    float _369 = _327 * _359;
    float _371 = -_327;
    float _373 = _371 + 1.0;
    float _375 = _315 * _353;
    float _377 = _299 * _367;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _383;
    float _387 = fma(_363, _377, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _389 = fma(_381, _377, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _391 = fma(_385, _377, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _393 = _387 * _369;
    float _395 = _389 * _369;
    float _397 = _391 * _369;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _411 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[107].x, _393);
    float _413 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[107].y, _395);
    float _415 = fma(_401, _375, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _417 = fma(_405, _375, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _419 = fma(_409, _375, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _421 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[107].z, _397);
    float _423 = fma(_415, _355, _411);
    float _425 = fma(_417, _355, _413);
    float _427 = fma(_419, _355, _421);
    float _429 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[109].x, _423);
    float _431 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[109].y, _425);
    float _433 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[109].z, _427);
    bool _435 = !_365;
    float _451;
    if (!_435)
    {
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _439 = _119 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _443 = _441 * _437;
        float _445 = floor(_443);
        float _447 = -_445;
        float _449 = _443 + _447;
        _451 = _449;
        _453 = true;
    }
    else
    {
        _451 = _147;
    }
    _453 = false;
    float _455 = _451;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _459 = _455 + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _465 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _467 = isnan(_455);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _481 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _483 = isnan(_455);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _493;
    bool _497 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _499 = isnan(_455);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = 1.0 / _463;
    float _511 = -_475;
    float _513 = _511 + 1.0;
    bool _515 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _517 = _491 * _513;
    float _519 = -_491;
    float _521 = _519 + 1.0;
    float _523 = 1.0 / _479;
    float _525 = _495 * _509;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _531 = fma(_525, _459, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _533 = _529 * _523;
    float _535 = _531 * _517;
    float _537 = -_507;
    float _539 = _537 + 1.0;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _543 = _455 + _541;
    float _545 = _429 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _547 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[115].x, _535);
    float _549 = _475 * _539;
    float _551 = fma(_533, _543, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _553 = _433 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _555 = _545 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _557 = fma(_551, _549, _547);
    float _559 = _431 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _561 = _553 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _563 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[117].x, _557);
    float _565 = _559 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _567 = _563 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _555;
    out.m_59.y = _565;
    out.m_59.z = _561;
    out.m_59.w = _567;
    bool _569 = !_515;
    float _585;
    if (!_569)
    {
        float _571 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _573 = _119 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _575 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _577 = _575 * _571;
        float _579 = floor(_577);
        float _581 = -_579;
        float _583 = _577 + _581;
        _585 = _583;
        _587 = true;
    }
    else
    {
        _585 = _147;
    }
    _587 = false;
    float _589 = _585;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _593 = _589 + _591;
    bool _595 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _597 = isnan(_589);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _609 = _589 + _607;
    bool _611 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _613 = isnan(_589);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _631 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _633 = isnan(_589);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = -_605;
    float _645 = _643 + 1.0;
    float _647 = 1.0 / _629;
    float _649 = _641 * _645;
    float _651 = -_641;
    float _653 = _651 + 1.0;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _655;
    bool _659 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _661 = 1.0 / _625;
    float _663 = _621 * _653;
    float _665 = -_621;
    float _667 = _665 + 1.0;
    float _669 = _609 * _647;
    float _671 = _593 * _661;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _677;
    float _681 = fma(_657, _671, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _683 = fma(_675, _671, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _685 = fma(_679, _671, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _687 = _681 * _663;
    float _689 = _683 * _663;
    float _691 = _685 * _663;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _705 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[123].x, _687);
    float _707 = fma(_695, _669, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _709 = fma(_699, _669, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _711 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[123].y, _689);
    float _713 = fma(_703, _669, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _715 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[123].z, _691);
    float _717 = fma(_707, _649, _705);
    float _719 = fma(_709, _649, _711);
    float _721 = fma(_713, _649, _715);
    float _723 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[125].x, _717);
    float _725 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[125].y, _719);
    float _727 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[125].z, _721);
    bool _729 = !_659;
    float _745;
    if (!_729)
    {
        float _731 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _733 = _119 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _735 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _737 = _735 * _731;
        float _739 = floor(_737);
        float _741 = -_739;
        float _743 = _737 + _741;
        _745 = _743;
        _747 = true;
    }
    else
    {
        _745 = _147;
    }
    _747 = false;
    float _749 = _745;
    int _751 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _753 = _751;
    int _755 = 0;
    int _757 = _88(_753, _755, (*spvDescriptorSet0.support_buffer));
    float _759 = in.m_61.z;
    float _761 = 0.0 + _147;
    float _763 = precise::clamp(_761, 0.0, 1.0);
    float _765 = trunc(_759);
    int _767 = int(_765);
    int _769 = _757 + (-1);
    float _771 = float(_769);
    float _773 = _763 * _771;
    float _775 = trunc(_773);
    int _777 = int(_775);
    int _779 = _777;
    int _781 = 0;
    int _783 = _89(_779, _781, (*spvDescriptorSet0.support_buffer));
    int _785 = _767;
    int _787 = 0;
    int _789 = _89(_785, _787, (*spvDescriptorSet0.support_buffer));
    float4 _792 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_783, _789)), 0).xyzw;
    float _794 = _792.x;
    float _796 = _792.y;
    float _798 = _792.z;
    float _800 = _792.w;
    float _802 = in.m_51.z;
    float _804 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _808 = _806 != 0;
    float _810 = in.m_61.x;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _816 = in.m_61.y;
    int _818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _820 = _818 != 0;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _824 = _822 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _826 = 1.0 / _814;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _830 = _828 != 0;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _834 = _832 != 0;
    float _836 = _119 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _838 = 0.0;
    float _840 = _810;
    if (_808)
    {
        float _842 = in.m_51.z;
        _838 = _842;
    }
    float _844 = _838;
    float _846 = 1.0 / _824;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _852 = _850 != 0;
    float _854 = -_848;
    float _856 = fma(_836, 2.0, _854);
    bool _858 = _802 > 0.5;
    bool _860 = _858 && _834;
    float _862 = in.m_51.y;
    bool _864 = _749 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _866 = isnan(_749);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _876;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _884 = _749 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _886 = isnan(_749);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _898 = _878 * _826;
    bool _900 = _749 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _902 = isnan(_749);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = _882 * _846;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _916 = _749 + _914;
    float _918 = -_910;
    float _920 = _918 + 1.0;
    float _922 = _816;
    float _924 = _874;
    bool _926 = _860;
    if (_860)
    {
        float _928 = -_816;
        float _930 = _928 + 1.0;
        _922 = _930;
    }
    float _932 = _922;
    bool _934 = false;
    if (_808)
    {
        bool _936 = _844 > 0.5;
        _934 = _936;
    }
    bool _938 = _934;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _942 = _749 + _940;
    float _944 = fma(_898, _916, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _946 = _874 * _920;
    float _948 = _804 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _950 = fma(_912, _942, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _952 = -_874;
    float _954 = _952 + 1.0;
    float _956 = _954;
    int _958 = as_type<int>(_944);
    if (!_820)
    {
        _924 = _810;
    }
    float _960 = _924;
    float _962 = fma(_948, _932, -0.5);
    float _964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _966 = _894 * _954;
    float _968 = _960;
    float _970 = _966;
    if (!_820)
    {
        _956 = _960;
    }
    float _972 = _956;
    float _974 = -_894;
    float _976 = _974 + 1.0;
    float _978 = _972;
    float _980 = _976;
    if (_820)
    {
        _968 = _810;
    }
    float _982 = _968;
    float _984 = _944 * _966;
    float _986 = _982;
    if (_820)
    {
        bool _988 = _119 > 0.5;
        _926 = _988;
    }
    bool _990 = _926;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _994 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _996 = _990;
    if (_820)
    {
        float _998 = -_982;
        float _1000 = _998 + 1.0;
        _958 = as_type<int>(_1000);
    }
    int _1002 = _958;
    int _1004 = 0;
    if (_808)
    {
        float _1006 = -_982;
        float _1008 = _1006 + 1.0;
        _1004 = as_type<int>(_1008);
    }
    int _1010 = _1004;
    int _1012 = 0;
    if (_830)
    {
        float _1014 = -_982;
        float _1016 = _1014 + 1.0;
        _1012 = as_type<int>(_1016);
    }
    int _1018 = _1012;
    float _1020 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[131].x, _984);
    bool _1022 = _862 > 0.5;
    float _1024 = _862;
    if (!_808)
    {
        _970 = _982;
    }
    float _1026 = _970;
    float _1028 = _1026;
    if (_820)
    {
        float _1030 = _990 ? as_type<float>(_1002) : _982;
        _978 = _1030;
    }
    float _1032 = _978;
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1036 = _1034;
    if (_808)
    {
        float _1038 = _938 ? as_type<float>(_1010) : _982;
        _1028 = _1038;
    }
    float _1040 = _1028;
    if (_830)
    {
        float _1042 = _1022 ? as_type<float>(_1018) : _982;
        _986 = _1042;
    }
    float _1044 = _986;
    float _1046 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1034);
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    if (_852)
    {
        _996 = false;
    }
    bool _1050 = _996;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _1054 = _1050;
    if (_852)
    {
        _840 = _119;
    }
    float _1056 = _840;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1060 = _1056;
    if (_852)
    {
        _1036 = _862;
    }
    float _1062 = _1036;
    float _1064 = _1062;
    if (!_852)
    {
        float _1066 = _119 * 3.1415927410125732421875;
        float _1068 = _1066 * 0.15915493667125701904296875;
        float _1070 = _862 * 3.1415927410125732421875;
        float _1072 = _1070 * 0.15915493667125701904296875;
        float _1074 = _1068 * 6.283185482025146484375;
        float _1076 = sin(_1074);
        float _1078 = _1072 * 6.283185482025146484375;
        float _1080 = sin(_1078);
        _1060 = _1076;
        _1054 = true;
        _1064 = _1080;
        _980 = _1072;
    }
    float _1082 = _1060;
    bool _1084 = _1054;
    float _1086 = _1064;
    float _1088 = _980;
    float _1090 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[93].z, _992);
    float _1092 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1094 = _1088;
    if (_1084)
    {
        _1094 = _862;
    }
    float _1096 = _1094;
    float _1098 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1058);
    float _1100 = _1096;
    if (!_1084)
    {
        _1100 = _119;
    }
    float _1102 = _1100;
    float _1104 = -_1048;
    float _1106 = fma(_1092, 2.0, _1104);
    if (!_1084)
    {
        _1024 = _119;
    }
    float _1108 = _1024;
    float _1110 = _994 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1112 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    uint _1115 = as_type<uint>(half2(float2(_800, 0.0)));
    float _1117 = fma(_950, _946, _1020);
    float _1119 = fma(_1110, _1040, -0.5);
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1123 = fma(_1112, -2.0, _1052);
    float _1125 = _896 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1127 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1121);
    uint _1129 = extract_bits(_1115, 0u, 8u);
    int _1131 = int(_1129) & 255;
    uint _1133 = extract_bits(_1115, 8u, 8u);
    int _1135 = int(_1133) & 255;
    int _1137 = _1135 << 8;
    int _1139 = _1131 | _1137;
    float _1141 = fma(_1125, _1044, -0.5);
    float _1143 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1098);
    float _1145 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1123);
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1149 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1151 = _1139 >= 32768;
    float _1153 = _964 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1155 = -_1145;
    float _1157 = fma(_1143, _962, _1155);
    float _1159 = -_1147;
    float _1161 = fma(_1149, 2.0, _1159);
    float _1163 = -_123;
    float _1165 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1106);
    float _1167 = fma(_1153, _1032, -0.5);
    float _1169 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1090);
    float _1171 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1046);
    float _1173 = -_123;
    float _1175 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[76].x, _856);
    float _1177 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1127);
    float _1179 = -_123;
    float _1181 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1161);
    float _1183 = _725 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1185 = fma(_1171, _1167, _1175);
    float _1187 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1117);
    float _1189 = fma(_1177, _1119, _1181);
    int _1191 = _1139 + (-1024);
    float _1193 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1195 = _1191;
    if (_1151)
    {
        int _1197 = ~_1139;
        int _1199 = _1197 + 33792;
        int _1201 = _1199 + 1;
        _1195 = _1201;
    }
    int _1203 = _1195;
    float _1205 = fma(_1169, _1141, _1165);
    float _1207 = _723 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1209 = _1203 + 30719;
    float _1211 = _727 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1213 = _1187 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1215 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1217 = float(_1209);
    float _1219 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1221 = _1205 + 0.5;
    float _1223 = _1157 + 0.5;
    int _1225 = _777 + 1;
    float _1227 = fma(_1217, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    out.m_63.x = _1215;
    out.m_63.y = _1193;
    out.m_63.z = _1219;
    out.m_63.w = _1213;
    int _1229 = min(_769, _1225);
    float _1231 = abs(_1227);
    float _1233 = -_1231;
    float _1235 = _1233 + 1.0;
    out.m_65.x = _1221;
    out.m_65.y = _1223;
    float _1237 = _1189 + 0.5;
    int _1239 = as_type<int>(_1235) + (-218103808);
    bool _1241 = uint(_1239) >= 1920991232u;
    float _1243 = _1185 + 0.5;
    bool _1245 = !_1241;
    float _1247 = _1237;
    if (!_1245)
    {
        int _1249;
        _86(_1249, out.gl_Position, out.gl_PointSize);
    }
    int _1251 = _1229;
    int _1253 = 0;
    int _1255 = _89(_1251, _1253, (*spvDescriptorSet0.support_buffer));
    int _1257 = _767;
    int _1259 = 0;
    int _1261 = _89(_1257, _1259, (*spvDescriptorSet0.support_buffer));
    float4 _1263 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1255, _1261)), 0).xyzw;
    float _1265 = _1263.x;
    float _1267 = _1263.y;
    float _1269 = _1263.z;
    float _1271 = _1263.w;
    float _1273 = floor(_773);
    float _1275 = -_1273;
    float _1277 = _773 + _1275;
    uint _1279 = as_type<uint>(half2(float2(_1271, 0.0)));
    float _1281 = -_794;
    float _1283 = _1281 + _1265;
    float _1285 = -_796;
    float _1287 = _1285 + _1267;
    uint _1289 = extract_bits(_1279, 0u, 8u);
    int _1291 = int(_1289) & 255;
    uint _1293 = extract_bits(_1279, 8u, 8u);
    int _1295 = int(_1293) & 255;
    int _1297 = _1295 << 8;
    int _1299 = _1291 | _1297;
    float _1301 = fma(_1277, _1283, _794);
    float _1303 = fma(_1277, _1287, _796);
    bool _1305 = _1299 >= 32768;
    int _1307 = _1299 + (-1024);
    int _1309 = _1307;
    if (_1305)
    {
        int _1311 = ~_1299;
        int _1313 = _1311 + 33792;
        int _1315 = _1313 + 1;
        _1309 = _1315;
    }
    int _1317 = _1309;
    int _1319 = _1317 + 30719;
    float _1321 = float(_1319);
    float _1323 = fma(_1321, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1325 = abs(_1323);
    float _1327 = -_1325;
    float _1329 = _1327 + 1.0;
    int _1331 = as_type<int>(_1329) + (-218103808);
    bool _1333 = uint(_1331) >= 1920991232u;
    float _1335 = -_798;
    float _1337 = _1335 + _1269;
    float _1339 = fma(_1277, _1337, _798);
    bool _1341 = !_1333;
    if (!_1341)
    {
        int _1343;
        _86(_1343, out.gl_Position, out.gl_PointSize);
    }
    float _1345 = _271 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1347 = _271 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1349 = _271 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1351 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1345);
    float _1353 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1347);
    float _1355 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1349);
    float _1357 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1351);
    float _1359 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1353);
    float _1361 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1355);
    float _1363 = _1357 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1365 = _1359 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1367 = _1361 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1371 = _1363 + _1369;
    float _1373 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1375 = _1365 + _1373;
    float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1379 = _1367 + _1377;
    float _1381 = _1371 * _1371;
    float _1383 = fma(_1375, _1375, _1381);
    float _1385 = fma(_1379, _1379, _1383);
    float _1387 = rsqrt(_1385);
    float _1389 = _1371 * _1387;
    float _1391 = _1375 * _1387;
    float _1393 = _1379 * _1387;
    float _1395 = -_1389;
    float _1397 = fma(_1395, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1371);
    float _1399 = -_1391;
    float _1401 = fma(_1399, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1375);
    float _1403 = -_1393;
    float _1405 = fma(_1403, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1379);
    float _1407 = _1397 * _1397;
    float _1409 = in.m_57.x;
    float _1411 = in.m_57.y;
    float _1413 = in.m_57.z;
    float _1415 = fma(_1401, _1401, _1407);
    float _1417 = fma(_1405, _1405, _1415);
    float _1419 = sqrt(_1417);
    float _1421 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1339);
    float _1423 = _1411 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1425 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1427 = _1387 * _1419;
    float _1429 = _1413 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1431 = _1423 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1433 = _1425 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1435 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1303);
    float _1437 = _1429 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1439 = _1431 * _1427;
    float _1441 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1301);
    float _1443 = _1433 * _1427;
    float _1445 = _1437 * _1427;
    float _1447 = _1439 * _1435;
    float _1449 = _1443 * _1441;
    float _1451 = _1445 * _1421;
    float _1453 = _1447 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1455 = _1447 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1457 = _1447 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1459 = fma(_1449, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1453);
    float _1461 = fma(_1449, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1455);
    float _1463 = fma(_1449, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1457);
    float _1465 = fma(_1451, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1459);
    float _1467 = fma(_1451, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1461);
    float _1469 = fma(_1451, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1463);
    float _1471 = _1367 + _1465;
    float _1473 = _1365 + _1467;
    float _1475 = _1363 + _1469;
    float _1477 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1479 = _1471 + _1477;
    float _1481 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1483 = _1473 + _1481;
    float _1485 = _1479 * _1479;
    float _1487 = fma(_1483, _1483, _1485);
    float _1489 = sqrt(_1487);
    bool _1491 = _1489 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1493 = _1469;
    float _1495 = _1449;
    float _1497 = _1451;
    float _1499 = _1471;
    float _1501 = _1475;
    float _1503 = _1479;
    if (!_1491)
    {
        _1493 = _1473;
    }
    float _1505 = _1493;
    float _1507 = _1505;
    if (!_1491)
    {
        _1495 = _1471;
    }
    float _1509 = _1495;
    float _1511 = _1509;
    if (!_1491)
    {
        _1497 = _1475;
    }
    float _1513 = _1497;
    bool _1515 = !_1491;
    float _1517 = _1513;
    if (!_1515)
    {
        float _1519 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1521 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1523 = _1489 + _1521;
        float _1525 = _1475 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1527 = rsqrt(_1487);
        float _1529 = _1523 * _1519;
        float _1531 = _1529 * 0.15915493667125701904296875;
        float _1533 = _1531 * 6.283185482025146484375;
        float _1535 = cos(_1533);
        float _1537 = _1531 * 6.283185482025146484375;
        float _1539 = sin(_1537);
        float _1541 = _1535 + (-1.0);
        float _1543 = _1541 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1545 = fma(_1539, _1525, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1547 = fma(_1475, _1535, _1543);
        float _1549 = _1527 * _1545;
        float _1551 = fma(_1483, _1549, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1553 = fma(_1479, _1549, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1517 = _1547;
        _1507 = _1551;
        _1511 = _1553;
        _1499 = _1531;
    }
    float _1555 = _1517;
    float _1557 = _1507;
    float _1559 = _1511;
    float _1561 = _1499;
    float _1563 = -_1389;
    float _1565 = fma(_1563, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1555);
    float _1567 = -_1391;
    float _1569 = fma(_1567, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1557);
    float _1571 = -_1393;
    float _1573 = fma(_1571, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1559);
    float _1575 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1577 = _1565 + _1575;
    float _1579 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1581 = _1569 + _1579;
    float _1583 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1585 = _1573 + _1583;
    float _1587 = _1577 * _1577;
    float _1589 = fma(_1581, _1581, _1587);
    float _1591 = fma(_1585, _1585, _1589);
    float _1593 = rsqrt(_1591);
    float _1595 = sqrt(_1591);
    float _1597 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1599 = _1581 * _1597;
    float _1601 = _1585 * _1597;
    float _1603 = _1599 * _1599;
    float _1605 = _1601 * _1601;
    float _1607 = _1603 + _1605;
    float _1609 = sqrt(_1607);
    bool _1611 = _1609 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1613 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1615 = _1609 + _1613;
    float _1617 = _1593;
    float _1619 = _1615;
    float _1621 = _1577;
    if (_1611)
    {
        float _1623 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1617 = _1623;
    }
    float _1625 = _1617;
    float _1627 = _1625;
    if (_1611)
    {
        float _1629 = _1615 * _1625;
        _1619 = _1629;
    }
    float _1631 = _1619;
    if (_1611)
    {
        float _1633 = rsqrt(_1607);
        _1627 = _1633;
    }
    float _1635 = _1627;
    float _1637 = _1635;
    if (_1611)
    {
        float _1639 = _1631 * 0.15915493667125701904296875;
        _1501 = _1639;
    }
    float _1641 = _1501;
    float _1643 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1645 = _1585;
    if (_1611)
    {
        float _1647 = _1641 * 6.283185482025146484375;
        float _1649 = sin(_1647);
        _1645 = _1649;
    }
    float _1651 = _1645;
    float _1653 = precise::max(0.0, _1643);
    float _1655 = _1561;
    float _1657 = _1653;
    if (_1611)
    {
        float _1659 = _1641 * 6.283185482025146484375;
        float _1661 = cos(_1659);
        _1655 = _1661;
    }
    float _1663 = _1655;
    float _1665 = -_1597;
    float _1667 = -_1653;
    float _1669 = fma(_1577, _1665, _1667);
    if (_1611)
    {
        float _1671 = _1669 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1621 = _1671;
    }
    float _1673 = _1621;
    float _1675 = _1651;
    float _1677 = _1673;
    if (_1611)
    {
        float _1679 = fma(_1651, _1673, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1503 = _1679;
    }
    float _1681 = _1503;
    float _1683 = _1681;
    if (!_1611)
    {
        _1675 = _1599;
    }
    float _1685 = _1675;
    float _1687 = _1565 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1689 = _1685;
    if (_1611)
    {
        float _1691 = _1635 * _1681;
        _1683 = _1691;
    }
    float _1693 = _1683;
    if (!_1611)
    {
        _1637 = _1669;
    }
    float _1695 = _1637;
    float _1697 = _1695;
    float _1699 = _1663;
    if (_1611)
    {
        float _1701 = _1663 + (-1.0);
        _1657 = _1701;
    }
    float _1703 = _1657;
    float _1705 = _1703;
    if (_1611)
    {
        float _1707 = _1599 * _1693;
        _1689 = _1707;
    }
    float _1709 = _1689;
    float _1711 = _1565 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1611)
    {
        float _1713 = _1703 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1677 = _1713;
    }
    float _1715 = _1677;
    float _1717 = _1715;
    if (!_1611)
    {
        _1705 = _1601;
    }
    float _1719 = _1705;
    float _1721 = _1719;
    if (_1611)
    {
        float _1723 = _1601 * _1693;
        _1721 = _1723;
    }
    float _1725 = _1721;
    float _1727 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1711);
    if (_1611)
    {
        float _1729 = fma(_1669, _1663, _1715);
        _1697 = _1729;
    }
    float _1731 = _1697;
    if (!_1611)
    {
        _1699 = _1603;
    }
    float _1733 = _1699;
    float _1735 = _1733;
    if (_1611)
    {
        float _1737 = _1709 * _1709;
        _1735 = _1737;
    }
    float _1739 = _1735;
    float _1741 = _1565 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1611)
    {
        _1717 = _1605;
    }
    float _1743 = _1717;
    float _1745 = _1743;
    if (_1611)
    {
        float _1747 = _1725 * _1725;
        _1745 = _1747;
    }
    float _1749 = _1745;
    float _1751 = fma(_1731, _1731, _1739);
    float _1753 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1741);
    float _1755 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1687);
    float _1757 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1727);
    float _1759 = _1751 + _1749;
    float _1761 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1763 = fma(_1595, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1761);
    float _1765 = precise::clamp(_1763, 0.0, 1.0);
    float _1767 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1755);
    float _1769 = _1757 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1771 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1773 = _1565 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1775 = rsqrt(_1759);
    float _1777 = -_1765;
    float _1779 = _1777 + 1.0;
    float _1781 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1753);
    float _1783 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1785 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1787 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1773);
    float _1789 = _1781 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1791 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1785);
    float _1793 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1787);
    float _1795 = abs(_1779);
    float _1797 = log2(_1795);
    float _1799 = _1789 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1801 = fma(_1789, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1791);
    float _1803 = _1793 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1805 = -_1799;
    float _1807 = fma(_1805, _1771, 1.0);
    float _1809 = _1775 * _1709;
    float _1811 = _1775 * _1731;
    float _1813 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1801);
    float _1815 = _1775 * _1725;
    float _1817 = _1809 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1819 = log2(_1807);
    float _1821 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1823 = _1811 + 1.0;
    float _1825 = -_1817;
    float _1827 = fma(_1811, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1825);
    float _1829 = _1797 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1831 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1821);
    float _1833 = -_1815;
    float _1835 = fma(_1833, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1827);
    float _1837 = 1.0 / _1813;
    float _1839 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1841 = fma(_1789, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1831);
    float _1843 = fma(_1835, -0.5, 0.5);
    float _1845 = fma(_1835, 0.5, 0.5);
    float _1847 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1839);
    float _1849 = exp2(_1829);
    float _1851 = fma(_1845, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1853 = fma(_1789, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1847);
    float _1855 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1841);
    float _1857 = _1819 * 0.693147182464599609375;
    float _1859 = fma(_1845, _1851, -0.212114393711090087890625);
    float _1861 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1853);
    float _1863 = sqrt(_1843);
    float _1865 = fma(_1845, _1859, 1.570728778839111328125);
    float _1867 = _1861 * _1837;
    float _1869 = _1855 * _1837;
    float _1871 = _1857 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1873 = fma(_1867, 0.5, 0.5);
    float _1875 = fma(_1869, -0.5, 0.5);
    float _1877 = -_1811;
    float _1879 = fma(_1849, _1823, _1877);
    float _1881 = fma(_1879, 0.5, 0.5);
    float _1883 = _1863 * 0.636619746685028076171875;
    float _1885 = -_1865;
    float _1887 = fma(_1883, _1885, 1.0);
    float3 _4999 = float3(_1873, _1875, _1871);
    float _1889 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4999, float3(0.0), isnan(_4999)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4999, float3(0.0), isnan(_4999)), level(0.0)).x;
    float3 _5010 = float3(_1873, _1875, _1871);
    float4 _1891 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5010, float3(0.0), isnan(_5010)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5010, float3(0.0), isnan(_5010)), level(0.0)).xyzw;
    float _1893 = _1891.x;
    float _1895 = _1891.y;
    float _1897 = _1891.z;
    float _1899 = _1891.w;
    float2 _5026 = float2(_1887, _1881);
    float3 _1903 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5026, float2(0.0), isnan(_5026)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5026, float2(0.0), isnan(_5026)), level(0.0)).xyz;
    float _1905 = _1903.x;
    float _1907 = _1903.y;
    float _1909 = _1903.z;
    float _1911 = -_1389;
    float _1913 = fma(_1911, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1363);
    float _1915 = -_1391;
    float _1917 = fma(_1915, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1365);
    float _1919 = -_1393;
    float _1921 = fma(_1919, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1367);
    out.m_67.x = _1243;
    float _1923 = _1913 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1925 = _1913 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1927 = _1797 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1929 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1931 = isnan(0.5);
    bool _1933 = _1929 || _1931;
    bool _1935 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1937 = _1933 || _1935;
    float _1939 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1923);
    float _1941 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1925);
    float _1943 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_67.z = _1237;
    float _1945 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1939);
    float _1947 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1941);
    float _1949 = exp2(_1927);
    float _1951 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1943);
    float _1953 = _1945 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1955 = _1947 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1957 = fma(_1789, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1951);
    if (_1937)
    {
        _1247 = 1.0;
    }
    float _1959 = _1247;
    float _1961 = _1955 + _1953;
    float _1963 = 1.0 / _1953;
    float _1965 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1957);
    float _1967 = _1961 * _1963;
    float _1969 = _1967 * 0.5;
    float _1971 = _1959;
    if (!_1937)
    {
        float _1973 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1975 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1977 = _1973 * 0.15915493667125701904296875;
        float _1979 = _1975 * 0.15915493667125701904296875;
        float _1981 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1983 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1981);
        float _1985 = _1977 * 6.283185482025146484375;
        float _1987 = cos(_1985);
        float _1989 = _1977 * 6.283185482025146484375;
        float _1991 = sin(_1989);
        float _1993 = 1.0 / _1987;
        float _1995 = _1979 * 6.283185482025146484375;
        float _1997 = cos(_1995);
        float _1999 = _1991 * _1993;
        float _2001 = _1979 * 6.283185482025146484375;
        float _2003 = sin(_2001);
        float _2005 = _1997 * _1999;
        float _2007 = 1.0 / _1983;
        float _2009 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2011 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2009;
        float _2013 = 1.0 / _2005;
        float _2015 = 1.0 / _2011;
        float _2017 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2019 = _2007 * _2017;
        float _2021 = _2003 * _2013;
        float _2023 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2025 = fma(_2021, _2019, _2023);
        float _2027 = _2025 * _2015;
        float _2029 = precise::clamp(_2027, 0.0, 1.0);
        float _2031 = -_2029;
        float _2033 = _2031 + 1.0;
        _1971 = _2033;
    }
    float _2035 = _1971;
    float _2037 = -_1949;
    float _2039 = _2037 + 1.0;
    float _2041 = _1813 * 0.5;
    float _2043 = _2035 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2045 = _2035 > 0.0;
    bool _2047 = isnan(_2035);
    bool _2049 = _2045 || _2047;
    bool _2051 = isnan(0.0);
    bool _2053 = _2049 || _2051;
    float _2055 = _2039 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2057 = _1965 + _1813;
    float _2059 = _1861 + _1813;
    float _2061 = fma(_1855, -0.5, _2041);
    float _2063 = _2055 * _1889;
    float _2065 = -_2055;
    float _2067 = _2065 + 1.0;
    float _2069 = _2043 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1861;
    out.gl_Position.y = _1855;
    out.gl_Position.z = _1965;
    out.gl_Position.w = _1813;
    float _2071 = _1899 * _2063;
    float _2073 = _1909 * _2063;
    float _2075 = _2057 * 0.5;
    float _2077 = fma(_1905, _2071, _1893);
    float _2079 = fma(_1907, _2071, _1895);
    float _2081 = _2059 * 0.5;
    float _2083 = _1899 * _2067;
    float _2085 = fma(_1899, _2073, _1897);
    out.m_69.x = _1301;
    out.m_71.x = _2081;
    out.m_71.y = _2061;
    out.m_71.z = _2075;
    out.m_71.w = _1813;
    out.m_47.x = _2069;
    out.m_73.x = _2077;
    out.m_73.y = _2079;
    out.m_73.z = _2085;
    out.m_73.w = _2083;
    if (_2053)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2087 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2087;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

